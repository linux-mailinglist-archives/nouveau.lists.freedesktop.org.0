Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E04771B835D
	for <lists+nouveau@lfdr.de>; Sat, 25 Apr 2020 04:52:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CCFF6EB9D;
	Sat, 25 Apr 2020 02:52:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 950 seconds by postgrey-1.36 at gabe;
 Tue, 21 Apr 2020 12:47:14 UTC
Received: from huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2846E3EF;
 Tue, 21 Apr 2020 12:47:14 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BE4F6D2A0D9CBF5A7CAF;
 Tue, 21 Apr 2020 20:31:20 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Tue, 21 Apr 2020 20:31:14 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Date: Tue, 21 Apr 2020 20:37:31 +0800
Message-ID: <1587472651-105308-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 25 Apr 2020 02:51:58 +0000
Subject: [Nouveau] [PATCH -next] drm/nouveau/acr: Use kmemdup instead of
 kmalloc and memcpy
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
Cc: Zou Wei <zou_wei@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fixes coccicheck warning:

drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:103:23-30: WARNING opportunity for kmemdup
drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c:113:22-29: WARNING opportunity for kmemdup

Fixes: 22dcda45a3d1 ("drm/nouveau/acr: implement new subdev to replace "secure boot"")
Reported-by: Hulk Robot <hulkci@huawei.com>
Signed-off-by: Zou Wei <zou_wei@huawei.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c | 12 ++++--------
 1 file changed, 4 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
index aecce2d..667fa01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/hsfw.c
@@ -100,25 +100,21 @@ nvkm_acr_hsfw_load_image(struct nvkm_acr *acr, const char *name, int ver,
 	hsfw->data_size = lhdr->data_size;
 
 	hsfw->sig.prod.size = fwhdr->sig_prod_size;
-	hsfw->sig.prod.data = kmalloc(hsfw->sig.prod.size, GFP_KERNEL);
+	hsfw->sig.prod.data = kmemdup(fw->data + fwhdr->sig_prod_offset + sig,
+				      hsfw->sig.prod.size, GFP_KERNEL);
 	if (!hsfw->sig.prod.data) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	memcpy(hsfw->sig.prod.data, fw->data + fwhdr->sig_prod_offset + sig,
-	       hsfw->sig.prod.size);
-
 	hsfw->sig.dbg.size = fwhdr->sig_dbg_size;
-	hsfw->sig.dbg.data = kmalloc(hsfw->sig.dbg.size, GFP_KERNEL);
+	hsfw->sig.dbg.data = kmemdup(fw->data + fwhdr->sig_dbg_offset + sig,
+				     hsfw->sig.dbg.size, GFP_KERNEL);
 	if (!hsfw->sig.dbg.data) {
 		ret = -ENOMEM;
 		goto done;
 	}
 
-	memcpy(hsfw->sig.dbg.data, fw->data + fwhdr->sig_dbg_offset + sig,
-	       hsfw->sig.dbg.size);
-
 	hsfw->sig.patch_loc = loc;
 done:
 	nvkm_firmware_put(fw);
-- 
2.6.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
