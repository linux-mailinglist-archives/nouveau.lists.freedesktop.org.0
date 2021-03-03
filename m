Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75A4632B80F
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 14:35:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6B066E05A;
	Wed,  3 Mar 2021 13:35:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F5C56E364;
 Wed,  3 Mar 2021 02:49:42 +0000 (UTC)
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Dqz260sCyz7s1R;
 Wed,  3 Mar 2021 10:47:58 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Wed, 3 Mar 2021 10:49:35 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Wed, 3 Mar 2021 10:50:24 +0800
Message-ID: <1614739824-54066-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 03 Mar 2021 13:35:17 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/pmu: Use %p4cc printk modifier to
 print FourCC codes
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Now that we can print FourCC codes directly using printk, make use of the
feature in nouveau.

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c
index 88b9099..711a8fe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gt215.c
@@ -127,11 +127,8 @@ gt215_pmu_recv(struct nvkm_pmu *pmu)
 	/* right now there's no other expected responses from the engine,
 	 * so assume that any unexpected message is an error.
 	 */
-	nvkm_warn(subdev, "%c%c%c%c %08x %08x %08x %08x\n",
-		  (char)((process & 0x000000ff) >>  0),
-		  (char)((process & 0x0000ff00) >>  8),
-		  (char)((process & 0x00ff0000) >> 16),
-		  (char)((process & 0xff000000) >> 24),
+	nvkm_warn(subdev, "%p4cc %08x %08x %08x %08x\n",
+		  &process,
 		  process, message, data0, data1);
 }
 
-- 
2.7.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
