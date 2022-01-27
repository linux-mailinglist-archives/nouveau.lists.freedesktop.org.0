Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF23F49E661
	for <lists+nouveau@lfdr.de>; Thu, 27 Jan 2022 16:42:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0257610E2E7;
	Thu, 27 Jan 2022 15:42:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5957810EE01
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 03:26:08 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 d12-20020a17090a628c00b001b4f47e2f51so6212123pjj.3
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jan 2022 19:26:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=emJGgAZKsXHfbFDFmzqJm+vf0jLHKtmm1jh15gidIuc=;
 b=INAvcROfrUBBxfcEHa4GOL58R5CqSKk73+AcncbMRxk6vIdER/muBwmOVz7Alh2zrF
 ksmuPXiHJrfYC9BysjY+IkOsMUcYkIm8gieWJdNzilKRXVhqt3QTVdS0R53qNkI5X8n/
 BbKUCzXl8L0SzZFt1BPtyCApK2ce2YuK7Rm7BGMlo1+x/+HEdMr8kE4rPkZaRG7kvuqN
 VlP6h6/XKx/4vqmDRLjexXzIJpSvaHahMizDzj0kfS5PLkLYWQOtZeFpry+NXcgOO4BC
 fcyFxirEDPEI1r5wqb93sm6NP/6Fs72qaeSBdNTP06tykOEkj1mCLrnfjkT/qAW9nOOo
 mDZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=emJGgAZKsXHfbFDFmzqJm+vf0jLHKtmm1jh15gidIuc=;
 b=NZR8PJ9ki8RpzksPEQ7J2WeJooFTq07TLF6pFB9cGXmm1vAp1pveWVefmO6yXRIfTJ
 fLxU9Sh9A4QF+KB7i+bR+xfdy8Yr0rfkEIqE4k2vdyaeSjmo73gIH0ZoP8cDUdw1I98p
 Kkox3XuxzTBkJmktk7ZoBIYw0arrjjM1t+HgetWdj16NyjqMzf7ygsT3oCwEcpHUFFSs
 AkfBg6juTmybmqYOHXLKGdXZocRVA7VRcRKTqEGyHDEWKlV+Zk3078UT60dIMO2IbOoH
 JE20sE9nGTcoYukhVV8l/xI2HiDz+LVP5jjYQm3JiYTCnZO7v9Vi1ES4FkYSbe+3eccO
 64RA==
X-Gm-Message-State: AOAM5327EMYRQsstd3NlOeDyJ0tffgo9g0iyqVVA9A+ndC0tGftKk1cj
 whh6i8tNRDDdDzCAXsR01ZSiQQ==
X-Google-Smtp-Source: ABdhPJw8vOgqPrHYaIFjHOHDtzomHyPlMOKBVVvXUrYiedbQLuzFiihIHlxPcejPdgoW7kbcn7Huvg==
X-Received: by 2002:a17:90b:354f:: with SMTP id
 lt15mr11999702pjb.83.1643253967894; 
 Wed, 26 Jan 2022 19:26:07 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id t15sm4203111pjy.17.2022.01.26.19.26.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 19:26:07 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Thu, 27 Jan 2022 12:25:38 +0900
Message-Id: <20220127032539.9929-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127032539.9929-1-etom@igel.co.jp>
References: <20220127032539.9929-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jan 2022 15:42:16 +0000
Subject: [Nouveau] [RFC PATCH v5 2/3] drm: add support modifiers for drivers
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

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
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

