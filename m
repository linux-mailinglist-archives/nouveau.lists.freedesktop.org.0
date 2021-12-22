Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E769E482915
	for <lists+nouveau@lfdr.de>; Sun,  2 Jan 2022 05:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E667A89F6F;
	Sun,  2 Jan 2022 04:17:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x52e.google.com (mail-pg1-x52e.google.com
 [IPv6:2607:f8b0:4864:20::52e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D6E810E710
 for <nouveau@lists.freedesktop.org>; Wed, 22 Dec 2021 05:27:44 +0000 (UTC)
Received: by mail-pg1-x52e.google.com with SMTP id v25so1106614pge.2
 for <nouveau@lists.freedesktop.org>; Tue, 21 Dec 2021 21:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZzVJoWnVKuHRY07c9p2jG3ENIE447Yyj+QR55sYQSR4=;
 b=JcErYDjqib81W1HW9K085wJWYMfUhlEBkTpfUD2xAEU+DLtNh8wAEnFheksoI5nUj9
 HzmkhIlEbXi2Jzm6AZBtJEb6SCnvcY/ydyO0O4UO4PfC5vvDn7lyVHACvYj/uVzt2s2A
 HZcUOmLKVMnjjuMYRP66UQvL/R6X+USXWDnPr5zEP8XFxJHZPn8MDmnE0cDjO5BmgSGY
 657rMrylhXevVBxMaZOUyYsR+fKND0Ds+R/SNRzjtBuLPPG6BEj1lSGW8HsJ+0tS5kAH
 7MfK1EBay3QvSaoJW+Omkjh6esTFIpGw50PcQC1E/l7TAAtV8t524hvSefBZmy3RH/ax
 lPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZzVJoWnVKuHRY07c9p2jG3ENIE447Yyj+QR55sYQSR4=;
 b=YDmBaubmAhMkk8f1/j54DC9sFJMid7xLdKoRuwSu9n5xZDezSjbamYqKh/pOHAtmLY
 AEubVdeH21WdjsfHBtuQKf0CRcTFMX1wZmk68dbwHMqJm7cBOMPokOPiRxZtFokPjDgE
 5uJupiMQ6i7Tou2QnoAho34kb2I4XCBd/DOM49JvomUzTTV3sNufyTQF9FI7y3bv7g3F
 2ldDzTc1I9zNbEG7eePPNL9vjmC7ZqThFs+l1n1i1Enqaws8uuZjOC49so/k4ubSRsI2
 jxouK9t2kVEhO5gIP9c1ft14mAOgDoJRAjdMOWLy11Mf+uT9amnyTSh8gooNzjg/AqON
 JyBg==
X-Gm-Message-State: AOAM530y/7aNtj/dBkd+A3rK4rpxqNmj+3Hy4h/28N97o0vcGerGFQF+
 4tskMOKadyH+r9MpV76a4DS/mg==
X-Google-Smtp-Source: ABdhPJzj+GPlxurLuqLoBKu153aUUw6RYvLCrjySDnYLaoT0pAwGhgH6LAFcJEvbS0vx6Dad8rbDMQ==
X-Received: by 2002:a05:6a00:1249:b0:4bb:4a31:1e0a with SMTP id
 u9-20020a056a00124900b004bb4a311e0amr1374574pfi.81.1640150864046; 
 Tue, 21 Dec 2021 21:27:44 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id v63sm737465pgv.71.2021.12.21.21.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 21 Dec 2021 21:27:43 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Wed, 22 Dec 2021 14:27:25 +0900
Message-Id: <20211222052727.19725-2-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20211222052727.19725-1-etom@igel.co.jp>
References: <20211222052727.19725-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Sun, 02 Jan 2022 04:17:56 +0000
Subject: [Nouveau] [RFC PATH 1/3] drm: add support modifiers for drivers
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
 Lee Jones <lee.jones@linaro.org>, Tomohito Esaki <etom@igel.co.jp>,
 Rob Clark <robdclark@chromium.org>, Evan Quan <evan.quan@amd.com>,
 amd-gfx@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Petr Mladek <pmladek@suse.com>, Sakari Ailus <sakari.ailus@linux.intel.com>,
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
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The LINEAR modifier is advertised as default if a driver doesn't specify
modifiers. However, there are legacy drivers such as radeon that do not
support modifiers but infer the actual layout of the underlying buffer.
Therefore, a new flag not_support_fb_modifires is introduced for these
legacy drivers. Allow_fb_modifiers will be replaced with this new flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/drm_plane.c   | 34 ++++++++++++++++++++++++++--------
 include/drm/drm_mode_config.h | 10 ++++++++++
 include/drm/drm_plane.h       |  3 +++
 3 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/drm_plane.c b/drivers/gpu/drm/drm_plane.c
index 82afb854141b..75308ee240c0 100644
--- a/drivers/gpu/drm/drm_plane.c
+++ b/drivers/gpu/drm/drm_plane.c
@@ -161,6 +161,16 @@ modifiers_ptr(struct drm_format_modifier_blob *blob)
 	return (struct drm_format_modifier *)(((char *)blob) + blob->modifiers_offset);
 }
 
+static bool check_format_modifier(struct drm_plane *plane, uint32_t format,
+				  uint64_t modifier)
+{
+	if (plane->funcs->format_mod_supported)
+		return plane->funcs->format_mod_supported(plane, format,
+							  modifier);
+
+	return modifier == DRM_FORMAT_MOD_LINEAR;
+}
+
 static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane)
 {
 	const struct drm_mode_config *config = &dev->mode_config;
@@ -203,16 +213,15 @@ static int create_in_format_blob(struct drm_device *dev, struct drm_plane *plane
 	memcpy(formats_ptr(blob_data), plane->format_types, formats_size);
 
 	/* If we can't determine support, just bail */
-	if (!plane->funcs->format_mod_supported)
+	if (config->fb_modifiers_not_supported)
 		goto done;
 
 	mod = modifiers_ptr(blob_data);
 	for (i = 0; i < plane->modifier_count; i++) {
 		for (j = 0; j < plane->format_count; j++) {
-			if (plane->funcs->format_mod_supported(plane,
-							       plane->format_types[j],
-							       plane->modifiers[i])) {
-
+			if (check_format_modifier(plane,
+						  plane->format_types[j],
+						  plane->modifiers[i])) {
 				mod->formats |= 1ULL << j;
 			}
 		}
@@ -242,6 +251,10 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 				      const char *name, va_list ap)
 {
 	struct drm_mode_config *config = &dev->mode_config;
+	const uint64_t default_modifiers[] = {
+		DRM_FORMAT_MOD_LINEAR,
+		DRM_FORMAT_MOD_INVALID
+	};
 	unsigned int format_modifier_count = 0;
 	int ret;
 
@@ -282,6 +295,11 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 
 		while (*temp_modifiers++ != DRM_FORMAT_MOD_INVALID)
 			format_modifier_count++;
+	} else {
+		if (!dev->mode_config.fb_modifiers_not_supported) {
+			format_modifiers = default_modifiers;
+			format_modifier_count = 1;
+		}
 	}
 
 	/* autoset the cap and check for consistency across all planes */
@@ -346,7 +364,7 @@ static int __drm_universal_plane_init(struct drm_device *dev,
 		drm_object_attach_property(&plane->base, config->prop_src_h, 0);
 	}
 
-	if (config->allow_fb_modifiers)
+	if (format_modifier_count)
 		create_in_format_blob(dev, plane);
 
 	return 0;
@@ -373,8 +391,8 @@ static int __drm_universal_plane_init(struct drm_device *dev,
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
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 48b7de80daf5..c56f298c55bd 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -920,6 +920,16 @@ struct drm_mode_config {
 	 */
 	bool allow_fb_modifiers;
 
+	/**
+	 * @fb_modifiers_not_supported:
+	 *
+	 * This flag is for legacy drivers such as radeon that do not support
+	 * modifiers but infer the actual layout of the underlying buffer.
+	 * Generally, each drivers must support modifiers, this flag should not
+	 * be set.
+	 */
+	bool fb_modifiers_not_supported;
+
 	/**
 	 * @normalize_zpos:
 	 *
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
2.17.1

