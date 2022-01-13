Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C47D48F00D
	for <lists+nouveau@lfdr.de>; Fri, 14 Jan 2022 19:43:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 632E410E214;
	Fri, 14 Jan 2022 18:43:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com
 [IPv6:2607:f8b0:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A407112344
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jan 2022 09:44:57 +0000 (UTC)
Received: by mail-pl1-x62a.google.com with SMTP id c3so8847710pls.5
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jan 2022 01:44:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jofGU3F6JV6Xnd3MLtpHFZbNGTfUfABRqEKk6sSzclU=;
 b=ayuztF6+ZI2tex2HA6h1irVuMnU3YvjcdJbXChZ+6SHIHBFrITWegz49Czmex6qcAI
 qPi4PguPIym1kW8d8s4BtpaZfIAt2XfC8+TNmMOqADEwfy4NBENQz4I829NaPkZvEuiJ
 gphggvtATw/E8zLWSNg5KHnbpL/TcpZTLfWrrKjATC7nJxhQ0WvbS/yrojfdN5Nwov7D
 WzDpNZNo3TFRX4sUMxybdPI/zwwHu0kKyTh+9YCIjBIW5T5bSIt4YdsblERtmp82UvFa
 x3SlV59CFcwOAtW7TiLdMdVNkEJQ+WfqGIxxuqqLyZoTpMTloGY4uUMenRKkBrtSMsyR
 o1VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jofGU3F6JV6Xnd3MLtpHFZbNGTfUfABRqEKk6sSzclU=;
 b=UYsfIXbbaIfAyP002fIUSXbqdiVzQQJ+V9HhG7bB30CT3nsa7NyTPI77O1n4w44JlO
 PeT+TJ5IDR25b6ACQIhlGkFiJQbIl+0NcQgYQjjPjPA4iy17C87YLZjhxWJYg/mZSw83
 xuxRgQ7+ZBJJGFh5nJaYXkSvNGaYAIKIofAhCVtMFL1fv/NcWhe9rQ2ZKmIjxhmiS4WO
 /YiyTDSkhx6TtgGpjFrmn7jCE86U0xJkcM9CiX7Ue9EYEIO0BrBSS9xfc5Zr+v7sTp3j
 TJtEE9U7voT4467fPLJss1AkBV0RInQkWbXYcxvoBbK76dc0xclvNwoJb1/LW3bpK6PR
 1ocw==
X-Gm-Message-State: AOAM533Znsb+d/9/FTv6OmeS7kwYUveMcSZs4dTLuLzJSf8jhP1QRjTP
 30JkppDY6w4QP7Q2J3SO+xzKmA==
X-Google-Smtp-Source: ABdhPJxN/HQwJfR2UqPUqvGYqhn+J1xaONJrFkxrOuGxrEaG0+WsaSNKUxks7IjbH6WNV6IK4Jvu3A==
X-Received: by 2002:a17:902:c402:b0:14a:8735:1a5c with SMTP id
 k2-20020a170902c40200b0014a87351a5cmr38057plk.154.1642067097227; 
 Thu, 13 Jan 2022 01:44:57 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id rm4sm2207154pjb.4.2022.01.13.01.44.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jan 2022 01:44:56 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Thu, 13 Jan 2022 18:44:19 +0900
Message-Id: <20220113094419.12433-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220113094419.12433-1-etom@igel.co.jp>
References: <20220113094419.12433-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jan 2022 18:43:39 +0000
Subject: [Nouveau] [RFC PATCH v2 3/3] drm: replace allow_fb_modifiers with
 fb_modifiers_not_supported
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

Since almost drivers support fb modifiers, allow_fb_modifiers is
replaced with fb_modifiers_not_supported and removed.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/drm_framebuffer.c                |  6 +++---
 drivers/gpu/drm/drm_ioctl.c                      |  2 +-
 drivers/gpu/drm/drm_plane.c                      |  9 ---------
 drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 -
 include/drm/drm_mode_config.h                    | 16 ----------------
 5 files changed, 4 insertions(+), 30 deletions(-)

diff --git a/drivers/gpu/drm/drm_framebuffer.c b/drivers/gpu/drm/drm_framebuffer.c
index 07f5abc875e9..4562a8b86579 100644
--- a/drivers/gpu/drm/drm_framebuffer.c
+++ b/drivers/gpu/drm/drm_framebuffer.c
@@ -309,7 +309,7 @@ drm_internal_framebuffer_create(struct drm_device *dev,
 	}
 
 	if (r->flags & DRM_MODE_FB_MODIFIERS &&
-	    !dev->mode_config.allow_fb_modifiers) {
+	    dev->mode_config.fb_modifiers_not_supported) {
 		DRM_DEBUG_KMS("driver does not support fb modifiers\n");
 		return ERR_PTR(-EINVAL);
 	}
@@ -594,7 +594,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 	r->pixel_format = fb->format->format;
 
 	r->flags = 0;
-	if (dev->mode_config.allow_fb_modifiers)
+	if (!dev->mode_config.fb_modifiers_not_supported)
 		r->flags |= DRM_MODE_FB_MODIFIERS;
 
 	for (i = 0; i < ARRAY_SIZE(r->handles); i++) {
@@ -607,7 +607,7 @@ int drm_mode_getfb2_ioctl(struct drm_device *dev,
 	for (i = 0; i < fb->format->num_planes; i++) {
 		r->pitches[i] = fb->pitches[i];
 		r->offsets[i] = fb->offsets[i];
-		if (dev->mode_config.allow_fb_modifiers)
+		if (!dev->mode_config.fb_modifiers_not_supported)
 			r->modifier[i] = fb->modifier;
 	}
 
diff --git a/drivers/gpu/drm/drm_ioctl.c b/drivers/gpu/drm/drm_ioctl.c
index 8b8744dcf691..51fcf1298023 100644
--- a/drivers/gpu/drm/drm_ioctl.c
+++ b/drivers/gpu/drm/drm_ioctl.c
@@ -297,7 +297,7 @@ static int drm_getcap(struct drm_device *dev, void *data, struct drm_file *file_
 			req->value = 64;
 		break;
 	case DRM_CAP_ADDFB2_MODIFIERS:
-		req->value = dev->mode_config.allow_fb_modifiers;
+		req->value = !dev->mode_config.fb_modifiers_not_supported;
 		break;
 	case DRM_CAP_CRTC_IN_VBLANK_EVENT:
 		req->value = 1;
diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 5aa7e241971e..89a3d044ab59 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -288,15 +288,6 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		}
 	}
 
-	/* autoset the cap and check for consistency across all planes */
-	if (format_modifier_count) {
-		drm_WARN_ON(dev, !config->allow_fb_modifiers &&
-			    !list_empty(&config->plane_list));
-		config->allow_fb_modifiers = true;
-	} else {
-		drm_WARN_ON(dev, config->allow_fb_modifiers);
-	}
-
 	plane->modifier_count = format_modifier_count;
 	plane->modifiers = kmalloc_array(format_modifier_count,
 					 sizeof(format_modifiers[0]),
diff --git a/drivers/gpu/drm/selftests/test-drm_framebuffer.c b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
index 61b44d3a6a61..f6d66285c5fc 100644
--- a/drivers/gpu/drm/selftests/test-drm_framebuffer.c
+++ b/drivers/gpu/drm/selftests/test-drm_framebuffer.c
@@ -323,7 +323,6 @@ static struct drm_device mock_drm_device = {
 		.max_width = MAX_WIDTH,
 		.min_height = MIN_HEIGHT,
 		.max_height = MAX_HEIGHT,
-		.allow_fb_modifiers = true,
 		.funcs = &mock_config_funcs,
 	},
 };
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index c56f298c55bd..6fd13d6510f1 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -904,22 +904,6 @@ struct drm_mode_config {
 	 */
 	bool async_page_flip;
 
-	/**
-	 * @allow_fb_modifiers:
-	 *
-	 * Whether the driver supports fb modifiers in the ADDFB2.1 ioctl call.
-	 * Note that drivers should not set this directly, it is automatically
-	 * set in drm_universal_plane_init().
-	 *
-	 * IMPORTANT:
-	 *
-	 * If this is set the driver must fill out the full implicit modifier
-	 * information in their &drm_mode_config_funcs.fb_create hook for legacy
-	 * userspace which does not set modifiers. Otherwise the GETFB2 ioctl is
-	 * broken for modifier aware userspace.
-	 */
-	bool allow_fb_modifiers;
-
 	/**
 	 * @fb_modifiers_not_supported:
 	 *
-- 
2.25.1

