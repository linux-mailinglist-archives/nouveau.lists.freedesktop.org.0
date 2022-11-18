Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 610B36F6B5A
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:32:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F75110E3DE;
	Thu,  4 May 2023 12:31:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6687A10E1F7
 for <nouveau@lists.freedesktop.org>; Fri, 18 Nov 2022 09:17:50 +0000 (UTC)
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.54])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4NDB1m50QRzJnpq;
 Fri, 18 Nov 2022 17:14:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 18 Nov 2022 17:17:47 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 18 Nov
 2022 17:17:46 +0800
From: Yang Yingliang <yangyingliang@huawei.com>
To: <bskeggs@redhat.com>, <kherbst@redhat.com>, <lyude@redhat.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <tzimmermann@suse.de>
Date: Fri, 18 Nov 2022 17:16:11 +0800
Message-ID: <20221118091611.18706-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:38 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/kms/nv04: fix pci device refcount leak
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: nouveau@lists.freedesktop.org, yangyingliang@huawei.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

As comment of pci_get_domain_bus_and_slot() says, it returns
a pci device with refcount increment, when finish using it,
the caller must decrement the reference count by calling
pci_dev_put().

In nv04_update_arb() and nouveau_hw_get_clock(), after using
pci_dev_put() is called to avoid refcount leak.

Fixes: 6ee738610f41 ("drm/nouveau: Add DRM driver for NVIDIA GPUs")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/gpu/drm/nouveau/dispnv04/arb.c |  6 ++++--
 drivers/gpu/drm/nouveau/dispnv04/hw.c  | 13 +++++++++----
 2 files changed, 13 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv04/arb.c b/drivers/gpu/drm/nouveau/dispnv04/arb.c
index 1d3542d6006b..697e67fb21d3 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/arb.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/arb.c
@@ -209,11 +209,13 @@ nv04_update_arb(struct drm_device *dev, int VClk, int bpp,
 	sim_data.two_heads = nv_two_heads(dev);
 	if ((pdev->device & 0xffff) == 0x01a0 /*CHIPSET_NFORCE*/ ||
 	    (pdev->device & 0xffff) == 0x01f0 /*CHIPSET_NFORCE2*/) {
+		struct pci_dev *pdev;
 		uint32_t type;
 		int domain = pci_domain_nr(pdev->bus);
 
-		pci_read_config_dword(pci_get_domain_bus_and_slot(domain, 0, 1),
-				      0x7c, &type);
+		pdev = pci_get_domain_bus_and_slot(domain, 0, 1);
+		pci_read_config_dword(pdev, 0x7c, &type);
+		pci_dev_put(pdev);
 
 		sim_data.memory_type = (type >> 12) & 1;
 		sim_data.memory_width = 64;
diff --git a/drivers/gpu/drm/nouveau/dispnv04/hw.c b/drivers/gpu/drm/nouveau/dispnv04/hw.c
index f7d35657aa64..52e3999225d5 100644
--- a/drivers/gpu/drm/nouveau/dispnv04/hw.c
+++ b/drivers/gpu/drm/nouveau/dispnv04/hw.c
@@ -216,6 +216,7 @@ nouveau_hw_get_clock(struct drm_device *dev, enum nvbios_pll_type plltype)
 {
 	struct pci_dev *pdev = to_pci_dev(dev->dev);
 	struct nvkm_pll_vals pllvals;
+	struct pci_dev *tmp_pdev;
 	int ret;
 	int domain;
 
@@ -224,8 +225,10 @@ nouveau_hw_get_clock(struct drm_device *dev, enum nvbios_pll_type plltype)
 	if (plltype == PLL_MEMORY &&
 	    (pdev->device & 0x0ff0) == CHIPSET_NFORCE) {
 		uint32_t mpllP;
-		pci_read_config_dword(pci_get_domain_bus_and_slot(domain, 0, 3),
-				      0x6c, &mpllP);
+
+		tmp_pdev = pci_get_domain_bus_and_slot(domain, 0, 3);
+		pci_read_config_dword(tmp_pdev, 0x6c, &mpllP);
+		pci_dev_put(tmp_pdev);
 		mpllP = (mpllP >> 8) & 0xf;
 		if (!mpllP)
 			mpllP = 4;
@@ -236,8 +239,10 @@ nouveau_hw_get_clock(struct drm_device *dev, enum nvbios_pll_type plltype)
 	    (pdev->device & 0xff0) == CHIPSET_NFORCE2) {
 		uint32_t clock;
 
-		pci_read_config_dword(pci_get_domain_bus_and_slot(domain, 0, 5),
-				      0x4c, &clock);
+		tmp_pdev = pci_get_domain_bus_and_slot(domain, 0, 5);
+		pci_read_config_dword(tmp_pdev, 0x4c, &clock);
+		pci_dev_put(tmp_pdev);
+
 		return clock / 1000;
 	}
 
-- 
2.25.1

