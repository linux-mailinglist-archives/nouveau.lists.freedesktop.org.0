Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1673348F008
	for <lists+nouveau@lfdr.de>; Fri, 14 Jan 2022 19:43:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F1410E1AF;
	Fri, 14 Jan 2022 18:43:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 351AE10E3D8
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jan 2022 10:18:25 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id m13so12965441pji.3
 for <nouveau@lists.freedesktop.org>; Fri, 14 Jan 2022 02:18:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7DU13bl/Kr7bejWSCxzgyPXSQzgiVvowF1ijJEKZSA=;
 b=cAwQUnNCDelxjGSSeJwpRmip0dJtKp8udIfbxmfTkCMejPUrysWAU9r/AzLK1YEVDe
 1+xzfJqHpb6xp1mVbFPXI/DH1M7NudgxdzY6fXR0+tjChK4K/wS//Iwu1NHMVNAeY+eg
 ssDgLaxA5+G2IpMONfusc2/FG65zBGfLbLpNiYJH0XCbG76qkpVsggUm9BjdzKfzprFS
 UYOc67/AM06YoLO6MTc4VIm5mK8qU8J0Ad0rBk2SXixJp0zcFwuW+v01hLYobojca+NT
 nK440XBHjIhqU3MUJ7p1kHcP05xgDq2/W8QuqvXMrz1QJrmUUBynUBZ8BtTJJsSF4l0s
 PMiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7DU13bl/Kr7bejWSCxzgyPXSQzgiVvowF1ijJEKZSA=;
 b=G3ItedASK30QJBp7/As1r+DF/0GdF2Q9TOcpvXQqXktZm8lJzJgNucIRwBLHHQb7bx
 yDcm6JllEG3awlNP3OXfwgMWTv7BMmFC6BvnWjIdJY3m7Vdcp2VGk2mKrUvZKiuRBL2+
 bN+fsjNtY6CuVfBYM7arOAjxwsX5odkALnp6jdB89TMaXAII57e48i6jeektFz4WVR1P
 ZzkvBWQuz5wtbZzeUgOx5TIU07fyRMxNjHBKmcSCqNFDyCtMsMZOneRT2evd/wLYliwi
 7cF5xy2X12a96R+bXBUY/ZExHEBLXGNYXgidxOzWUEmTx1rZIVa0cFdUxs4PhdPn2rii
 Z/rQ==
X-Gm-Message-State: AOAM532Dlp30mjYVO4zN7Vr4Td7jNE8zQHr2HjL/D15wvG1OoXrOjD61
 Ulync4kaRgXDNt1GaQDec3fAcQ==
X-Google-Smtp-Source: ABdhPJzS8wjD3XHWY3mgaylIQXfEpPeL2apV2hB38YBPJKQQNVuflbQO9VGaryB3jdxmbmi3XoWoNQ==
X-Received: by 2002:a17:903:2292:b0:14a:8068:a75 with SMTP id
 b18-20020a170903229200b0014a80680a75mr5915261plh.105.1642155504809; 
 Fri, 14 Jan 2022 02:18:24 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id 13sm5555970pfm.161.2022.01.14.02.18.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 14 Jan 2022 02:18:24 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Fri, 14 Jan 2022 19:17:52 +0900
Message-Id: <20220114101753.24996-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220114101753.24996-1-etom@igel.co.jp>
References: <20220114101753.24996-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 14 Jan 2022 18:43:39 +0000
Subject: [Nouveau] [RFC PATCH v3 2/3] drm: add support modifiers for drivers
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
 drivers/gpu/drm/drm_plane.c | 15 ++++++++++++---
 include/drm/drm_plane.h     |  3 +++
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index deeec60a3315..5aa7e241971e 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -237,6 +237,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	const uint64_t default_modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID
+	};
 	unsigned int format_modifier_count = 0;
 	int ret;
 
@@ -277,6 +281,11 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 
 		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
 			format_modifier_count++;
+	} else {
+		if (!dev->mode_config.fb_modifiers_not_supported) {
+			format_modifiers = default_modifiers;
+			format_modifier_count = 1;
+		}
 	}
 
 	/* autoset the cap and check for consistency across all planes */
@@ -341,7 +350,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
 	}
 
-	if (config->allow_fb_modifiers)
+	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
 
 	return 0;
@@ -368,8 +377,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
  * drm_universal_plane_init() to let the DRM managed resource infrastructure
  * take care of cleanup and deallocation.
  *
- * Drivers supporting modifiers must set @format_modifiers on all their planes,
- * even those that only support DRM_FORMAT_MOD_LINEAR.
+ * For drivers supporting modifiers, all planes will advertise
+ * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
  *
  * Returns:
  * Zero on success, error code on failure.
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 0c1102dc4d88..cad641b1f797 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -803,6 +803,9 @@ void *__drmm_universal_plane_alloc(struct drm_device *dev,
  *
  * The @drm_plane_funcs.destroy hook must be NULL.
  *
+ * For drivers supporting modifiers, all planes will advertise
+ * DRM_FORMAT_MOD_LINEAR support, if @format_modifiers is not set.
+ *
  * Returns:
  * Pointer to new plane, or ERR_PTR on failure.
  */
-- 
2.25.1

