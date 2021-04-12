Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BA9B35CAF0
	for <lists+nouveau@lfdr.de>; Mon, 12 Apr 2021 18:20:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 17FE089CE1;
	Mon, 12 Apr 2021 16:20:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B12D789E11;
 Mon, 12 Apr 2021 03:29:28 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FJZ0B1VQgzPqGp;
 Mon, 12 Apr 2021 11:26:34 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS412-HUB.china.huawei.com (10.3.19.212) with Microsoft SMTP Server id
 14.3.498.0; Mon, 12 Apr 2021 11:29:16 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Mon, 12 Apr 2021 11:29:39 +0800
Message-ID: <1618198179-47779-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Mon, 12 Apr 2021 16:20:47 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/hwmon: Convert sysfs sprintf/snprintf
 family to sysfs_emit
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org, Tian
 Tao <tiantao6@hisilicon.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Fix the following coccicheck warning:
drivers/gpu/drm/nouveau/nouveau_hwmon.c:44:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/nouveau/nouveau_hwmon.c:57:8-16: WARNING:
use scnprintf or sprintf
drivers/gpu/drm/nouveau/nouveau_hwmon.c:90:8-16: WARNING:
use scnprintf or sprintf

Signed-off-by: Tian Tao <tiantao6@hisilicon.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 1c3104d..c6e5ee9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_hwmon.c
+++ b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
@@ -41,7 +41,7 @@ static ssize_t
 nouveau_hwmon_show_temp1_auto_point1_pwm(struct device *d,
 					 struct device_attribute *a, char *buf)
 {
-	return snprintf(buf, PAGE_SIZE, "%d\n", 100);
+	return sysfs_emit(buf, "%d\n", 100);
 }
 static SENSOR_DEVICE_ATTR(temp1_auto_point1_pwm, 0444,
 			  nouveau_hwmon_show_temp1_auto_point1_pwm, NULL, 0);
@@ -54,7 +54,7 @@ nouveau_hwmon_temp1_auto_point1_temp(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 	      therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST) * 1000);
 }
 static ssize_t
@@ -87,7 +87,7 @@ nouveau_hwmon_temp1_auto_point1_temp_hyst(struct device *d,
 	struct nouveau_drm *drm = nouveau_drm(dev);
 	struct nvkm_therm *therm = nvxx_therm(&drm->client.device);
 
-	return snprintf(buf, PAGE_SIZE, "%d\n",
+	return sysfs_emit(buf, "%d\n",
 	 therm->attr_get(therm, NVKM_THERM_ATTR_THRS_FAN_BOOST_HYST) * 1000);
 }
 static ssize_t
-- 
2.7.4

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
