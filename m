Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A1E8437A992
	for <lists+nouveau@lfdr.de>; Tue, 11 May 2021 16:38:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0957E6EA5A;
	Tue, 11 May 2021 14:38:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A4756E51B;
 Tue, 11 May 2021 08:29:06 +0000 (UTC)
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FfWHK1DLbzlZFK;
 Tue, 11 May 2021 16:26:53 +0800 (CST)
Received: from thunder-town.china.huawei.com (10.174.177.72) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Tue, 11 May 2021 16:28:56 +0800
From: Zhen Lei <thunder.leizhen@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>, Pierre Moreau <pierre.morrow@free.fr>, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>
Date: Tue, 11 May 2021 16:28:40 +0800
Message-ID: <20210511082841.4181-2-thunder.leizhen@huawei.com>
X-Mailer: git-send-email 2.26.0.windows.1
In-Reply-To: <20210511082841.4181-1-thunder.leizhen@huawei.com>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 11 May 2021 14:38:26 +0000
Subject: [Nouveau] [PATCH v2 1/2] drm/nouveau: Fix ida leak
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

When the 'nb' value allocated from 'bl_ida' is greater than or equal to
100, it will not be released. In fact, we can simplify operations by
limiting the range of idas that can be applied for.

By the way, delete the const modifier of the local variable 'nb'.

Fixes: db1a0ae21461 ("drm/nouveau/bl: Assign different names to interfaces")
Signed-off-by: Zhen Lei <thunder.leizhen@huawei.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index 72f35a2babcb20e..d1c998e645fb4b6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -51,8 +51,9 @@ static bool
 nouveau_get_backlight_name(char backlight_name[BL_NAME_SIZE],
 			   struct nouveau_backlight *bl)
 {
-	const int nb = ida_simple_get(&bl_ida, 0, 0, GFP_KERNEL);
-	if (nb < 0 || nb >= 100)
+	int nb = ida_simple_get(&bl_ida, 0, 100, GFP_KERNEL);
+
+	if (nb < 0)
 		return false;
 	if (nb > 0)
 		snprintf(backlight_name, BL_NAME_SIZE, "nv_backlight%d", nb);
-- 
2.26.0.106.g9fadedd


_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
