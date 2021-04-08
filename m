Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4809B359F43
	for <lists+nouveau@lfdr.de>; Fri,  9 Apr 2021 14:51:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC2EC6E49D;
	Fri,  9 Apr 2021 12:51:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 936 seconds by postgrey-1.36 at gabe;
 Thu, 08 Apr 2021 11:29:11 UTC
Received: from m12-11.163.com (m12-11.163.com [220.181.12.11])
 by gabe.freedesktop.org (Postfix) with SMTP id 30EAB6EA9A
 for <nouveau@lists.freedesktop.org>; Thu,  8 Apr 2021 11:29:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
 s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=nH5Ox
 NX9QI3+WOQ+MgGkJpJsPf6+I533Yqbkktrymh8=; b=aAwlmqBHAh88elaBJTWlG
 8R9pmJsqO/wYuLb4aaysIBVsrS/Pk2TALBUKg1qAA46qLLBHvFlQf8mkTJbEYuCo
 qAgyCvz5f2VlhdR5bz31Rrg3jlkESRN+VUwcpH7WNCJFChiq3bQU2GteL+9KH7yk
 vKptBj8KQFaxuUj8ds+04o=
Received: from localhost.localdomain (unknown [119.137.53.45])
 by smtp7 (Coremail) with SMTP id C8CowADHtY3q5G5ggMrUWA--.3666S2;
 Thu, 08 Apr 2021 19:11:39 +0800 (CST)
From: Carlis <llyz108@163.com>
To: bskeggs@redhat.com,
	airlied@linux.ie,
	daniel@ffwll.ch
Date: Thu,  8 Apr 2021 11:11:36 +0000
Message-Id: <20210408111136.27691-1-llyz108@163.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-CM-TRANSID: C8CowADHtY3q5G5ggMrUWA--.3666S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7WF13JFy8Kw1kWF1Dtr4UXFb_yoW8CFWkpF
 4xCFW7Zr4jkw47XF1xtF1jva4avanrGFy7GF92k3s09Fs7trWDXF15ArW5tryrJr43C3yY
 yr1Dta4Y9a1av3DanT9S1TB71UUUUUUqnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
 9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jsTmfUUUUU=
X-Originating-IP: [119.137.53.45]
X-CM-SenderInfo: xoo16iiqy6il2tof0z/xtbBQgtuhV++LTpN3AAAsF
X-Mailman-Approved-At: Fri, 09 Apr 2021 12:51:30 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/hwmon: convert sysfs snprintf to
 sysfs_emit
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
Cc: nouveau@lists.freedesktop.org, Xuezhi Zhang <zhangxuezhi1@yulong.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Xuezhi Zhang <zhangxuezhi1@yulong.com>

Fix the following coccicheck warning:
drivers/gpu/drm//nouveau/nouveau_hwmon.c:44:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm//nouveau/nouveau_hwmon.c:57:8-16: 
WARNING: use scnprintf or sprintf
drivers/gpu/drm//nouveau/nouveau_hwmon.c:90:8-16: 
WARNING: use scnprintf or sprintf

Signed-off-by: Xuezhi Zhang <zhangxuezhi1@yulong.com>
---
 drivers/gpu/drm/nouveau/nouveau_hwmon.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_hwmon.c b/drivers/gpu/drm/nouveau/nouveau_hwmon.c
index 1c3104d20571..c6e5ee9ece6d 100644
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
2.25.1

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
