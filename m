Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F23F37A98F
	for <lists+nouveau@lfdr.de>; Tue, 11 May 2021 16:38:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50A396EA54;
	Tue, 11 May 2021 14:38:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BDD86E9F2;
 Tue, 11 May 2021 08:29:06 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfWHK1jwPzlbM5;
 Tue, 11 May 2021 16:26:53 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 16:28:56 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Pierre Moreau <pierre.morrow@free.fr>, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
Date: Tue, 11 May 2021 16:28:41 +0800
Message-ID: <20210511082841.4181-3-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210511082841.4181-1-thunder.leizhen@huawei.com>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 11 May 2021 14:38:26 +0000
Subject: [Nouveau] [PATCH v2 2/2] drm/nouveau: Fix error return code in
 nouveau_backlight_init()
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
Cc: Zhen Lei <thunder.leizhen@huawei.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fix to return a negative error code from the error handling case instead
of 0, as done elsewhere in this function.

Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
Suggested-by: Pierre Moreau <pierre.morrow@free.fr>
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index d1c998e645fb4b6..f0856adbe775624 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -47,20 +47,20 @@ struct nouveau_backlight {
 	int id;
 };
 
-static bool
+static int
 nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
 {
 	int nb = ida_simple_get(&bl_ida, 0, 100, GFP_KERNEL);
 
 	if (nb < 0)
-		return false;
+		return nb;
 	if (nb > 0)
 		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
 	else
 		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight");
 	bl->id = nb;
-	return true;
+	return 0;
 }
 
 static int
@@ -273,7 +273,8 @@ nouveau_backlight_init(struct drm_connector *connector)
 	if (!bl)
 		return -ENOMEM;
 
-	if (!nouveau_get_backlight_name(backlight_name, bl)) {
+	ret = nouveau_get_backlight_name(backlight_name, bl);
+	if (ret) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
 		goto fail_alloc;
 	}
-- 
2.26.0.106.g9fadedd


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
