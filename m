Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16990141E26
	for <lists+nouveau@lfdr.de>; Sun, 19 Jan 2020 14:24:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4C4F6E39E;
	Sun, 19 Jan 2020 13:24:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 74A996E39E;
 Sun, 19 Jan 2020 13:24:21 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 99D58B2497FB201F79CB;
 Sun, 19 Jan 2020 21:24:19 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.439.0; Sun, 19 Jan 2020 21:24:08 +0800
From: Chen Zhou <chenzhou10@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Sun, 19 Jan 2020 21:19:19 +0800
Message-ID: <20200119131919.36490-1-chenzhou10@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
Subject: [Nouveau] [PATCH -next] drm/ttm: remove unnecessary conversion to
 bool
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
Cc: chenzhou10@huawei.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The conversion to bool is not needed, remove it.

Signed-off-by: Chen Zhou <chenzhou10@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_ttm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_ttm.c b/drivers/gpu/drm/nouveau/nouveau_ttm.c
index 7ca0a24..0cbcbe1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_ttm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_ttm.c
@@ -233,7 +233,7 @@ nouveau_ttm_init(struct nouveau_drm *drm)
 				  &nouveau_bo_driver,
 				  dev->anon_inode->i_mapping,
 				  dev->vma_offset_manager,
-				  drm->client.mmu.dmabits <= 32 ? true : false);
+				  drm->client.mmu.dmabits <= 32);
 	if (ret) {
 		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
 		return ret;
-- 
2.7.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
