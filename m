Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBD3E4A01AB
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 21:10:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25EAB10E577;
	Fri, 28 Jan 2022 20:10:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBEFD10F4BA
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 06:09:10 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 d15-20020a17090a110f00b001b4e7d27474so5505989pja.2
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 22:09:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9EzdZpZS4Z4IcY2FEqLzAsgmSU4/ecufEMUgyzjH9DI=;
 b=f1KfTjyjde3MGlrud7czWaI2aS8ME1vzCb9QYQASOs88grRoMJPZr8I6OowNxoI3Q0
 N0YHyEDdHTP4AhLbcN9Uz1/qx3nr0/Ho4uzOYIUORaOR2GinK04vXj6uFPzibJYTXvzK
 KjJrr07KiH2Ir+a5x6ERoNy472hxzqef3fnImX3KStMfJQNnnSo5YzQLoNB3S3RTD275
 WqFALl/KbnfIO9C2f9Q47r94tp1zlcFLzbUkW8dfH/My9yxzDRIOd2P7q/voBqtXRKL2
 VQJ+tm8zYZNljyZFwlpFFl7CPHkxp3BAac7n7TE7dVLlCmwIB+ojG/haE9wV1aqUo8VR
 A+1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9EzdZpZS4Z4IcY2FEqLzAsgmSU4/ecufEMUgyzjH9DI=;
 b=zag0TNVbYLyD0voqolKdM+hQt6vymFce3JOIRMzNDCqErELlDUuWMK8fSgiEZ2tufE
 OD4+B4byfogX9YnzvAWojQQG/ao+NqRDHO8WMb3AiYKZkYEXHHXJAOW29M1sRlGc8K7S
 Q6yMTc9Tees4C8nYyraDui8NAfE9Uk7+a1vKdQvZkEj69hoA1HYZBk3HXTg+HgcMp803
 apl337YZqgw5xkE9AM8SuAwP/UXC5uZ3X+V4+KICkgPscI7zR/y+EbTOuT3M+eZhrFXf
 d3ahwwd5wkhhO5l3wQeweeRpTRbv+9+GZdzhtvTlXtsg4U+u1ek4RdUyp9zoiCcDPDN+
 joRg==
X-Gm-Message-State: AOAM532qRoY1zE1MLMQNJl9MHowm0KtNlfVTrcDXUucrpbWY8mmPN5AA
 uzKNUBCmCXcODUjCN9rzNteTqQ==
X-Google-Smtp-Source: ABdhPJyS1HodQLAIUM/g+1ptfx8lQsTzLsZqTkcYsPcR4gUnEuwEd+yVeBMsvgFauG6tR4asals6vw==
X-Received: by 2002:a17:903:2446:: with SMTP id
 l6mr7240246pls.48.1643350150500; 
 Thu, 27 Jan 2022 22:09:10 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id h5sm7743182pfi.111.2022.01.27.22.09.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 22:09:10 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 15:08:35 +0900
Message-Id: <20220128060836.11216-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128060836.11216-1-etom@igel.co.jp>
References: <20220128060836.11216-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 20:10:03 +0000
Subject: [Nouveau] [RFC PATCH v6 2/3] drm: add support modifiers for drivers
 whose planes only support linear layout
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <mdaenzer@redhat.com>,
 Daniel Stone <daniel@fooishbar.org>, Lee Jones <lee.jones@linaro.org>,
 Tomohito Esaki <etom@igel.co.jp>, Rob Clark <robdclark@chromium.org>,
 Evan Quan <evan.quan@amd.com>, amd-gfx@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, Petr Mladek <pmladek@suse.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Bas Nieuwenhuizen <bas@basnieuwenhuizen.nl>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Takanari Hayama <taki@igel.co.jp>, Sean Paul <seanpaul@chromium.org>,
 Maxime Ripard <mripard@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 Mark Yacoub <markyacoub@chromium.org>, Qingqing Zhuo <qingqing.zhuo@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 Simon Ser <contact@emersion.fr>, Alex Deucher <alexander.deucher@amd.com>,
 Damian Hobson-Garcia <dhobsong@igel.co.jp>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The LINEAR modifier is advertised as default if a driver doesn't specify
modifiers.

v2:
 - rebase to the latest master branch (5.16.0+)
    + "drm/plane: Make format_mod_supported truly optional" patch [1]
   [1] https://patchwork.freedesktop.org/patch/467940/?series=98255&rev=3

v3:
 - change the order as follows:
   1. add fb_modifiers_not_supported flag
   2. add default modifiers
   3. remove allow_fb_modifiers flag

v5:
 - change default_modifiers array from non-static to static
 - remove terminator in default_modifiers array
 - use ARRAY_SIZE to get the format_modifier_count
 - update sanity check in plane init func to use the
   fb_modifiers_not_supported
 - modify kernel docs

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
---
 drivers/gpu/drm/drm_plane.c | 23 +++++++++++++----------
 include/drm/drm_plane.h     |  3 +++
 2 files changed, 16 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index deeec60a3315..bf0daa8d9bbd 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -237,6 +237,9 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	static const uint64_t default_modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+	};
 	unsigned int format_modifier_count = 0;
 	int ret;
 
@@ -277,16 +280,16 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 
 		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
 			format_modifier_count++;
+	} else {
+		if (!dev->mode_config.fb_modifiers_not_supported) {
+			format_modifiers = default_modifiers;
+			format_modifier_count = ARRAY_SIZE(default_modifiers);
+		}
 	}
 
 	/* autoset the cap and check for consistency across all planes */
-	if (format_modifier_count) {
-		drm_WARN_ON(dev, !config->allow_fb_modifiers &&
-			    !list_empty(&config->plane_list));
-		config->allow_fb_modifiers = true;
-	} else {
-		drm_WARN_ON(dev, config->allow_fb_modifiers);
-	}
+	drm_WARN_ON(dev, config->fb_modifiers_not_supported &&
+				format_modifier_count);
 
 	plane->modifier_count = format_modifier_count;
 	plane->modifiers = kmalloc_array(format_modifier_count,
@@ -341,7 +344,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
 	}
 
-	if (config->allow_fb_modifiers)
+	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
 
 	return 0;
@@ -368,8 +371,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
  * drm_universal_plane_init() to let the DRM managed resource infrastructure
  * take care of cleanup and deallocation.
  *
- * Drivers supporting modifiers must set @format_modifiers on all their planes,
- * even those that only support DRM_FORMAT_MOD_LINEAR.
+ * Drivers that only support the DRM_FORMAT_MOD_LINEAR modifier support may set
+ * @format_modifiers to NULL. The plane will advertise the linear modifier.
  *
  * Returns:
  * Zero on success, error code on failure.
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 0c1102dc4d88..a0390b6ad3b4 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -803,6 +803,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
  *
  * The @drm_plane_funcs.destroy hook must be NULL.
  *
+ * Drivers that only support the DRM_FORMAT_MOD_LINEAR modifier support may set
+ * @format_modifiers to NULL. The plane will advertise the linear modifier.
+ *
  * Returns:
  * Pointer to new plane, or ERR_PTR on failure.
  */
-- 
2.25.1

