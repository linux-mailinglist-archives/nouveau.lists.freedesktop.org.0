Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 62F8C12B2F4
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30CD86E3B7;
	Fri, 27 Dec 2019 08:14:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 958 seconds by postgrey-1.36 at gabe;
 Fri, 20 Dec 2019 14:21:56 UTC
Received: from huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F6FD6EC34;
 Fri, 20 Dec 2019 14:21:56 +0000 (UTC)
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 1E4A9BC1327BD4EB006A;
 Fri, 20 Dec 2019 22:05:54 +0800 (CST)
Received: from huawei.com (10.175.127.16) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.439.0; Fri, 20 Dec 2019
 22:05:46 +0800
From: wuxu.wu <wuxu.wu@huawei.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>, <dri-devel@lists.freedesktop.org>, 
 <bskeggs@redhat.com>
Date: Fri, 20 Dec 2019 22:05:26 +0800
Message-ID: <1576850726-5684-1-git-send-email-wuxu.wu@huawei.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.16]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/bios: fix incorrect kfree in
 platform_init
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
Cc: hushiyuan@huawei.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, wuxu.wu@huawei.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

priv porinter could be free only when priv != null and priv->rom is null.
---
 drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
index 9b91da0..d776e01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/shadowpci.c
@@ -70,8 +70,9 @@ pcirom_init(struct nvkm_bios *bios, const char *name)
 			    (priv->rom = pci_map_rom(pdev, &priv->size))) {
 				priv->pdev = pdev;
 				return priv;
+			} else {
+			    kfree(priv);
 			}
-			kfree(priv);
 		}
 		pci_disable_rom(pdev);
 	}
-- 
2.7.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
