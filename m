Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26C0A492EFB
	for <lists+nouveau@lfdr.de>; Tue, 18 Jan 2022 21:08:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4951A10E553;
	Tue, 18 Jan 2022 20:08:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 941BF1122B3
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jan 2022 08:37:24 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id r5so5332682pfl.2
 for <nouveau@lists.freedesktop.org>; Tue, 18 Jan 2022 00:37:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Z7DU13bl/Kr7bejWSCxzgyPXSQzgiVvowF1ijJEKZSA=;
 b=YLSxu/tIwj92oYZwW7XT/H9srKLMjIQQT+1nn/oOFcZLB4PgCo3+UDGGZcffN6xDLN
 fiY8zn+trt9sov1CskL0+pT6MAvoPHgB7Z/nRy20Y57dKLRXOoZplUdqd/cUnbQaoO+P
 ur+SOLXf5+Tr+gfMMMvxQcG8FdHMzW+kJrXJdaA+Tb94t4eapVv5nADD2uJIavifzmvC
 aq4MMGAdZg5Q2IgIfOFOuvCy29XWqKuBktEFwlABvPZa+bDCLWUJDX+ueDSzGYUGzHE1
 Ay2XO98YiVEGcPqsk0Z/ElsxPO4L+GAPzZQ/yrDFRsxojzPV1q5C9HVd+KyQpo3TQ5Vl
 4F/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Z7DU13bl/Kr7bejWSCxzgyPXSQzgiVvowF1ijJEKZSA=;
 b=kev6AsV8Vk3D50Uysm1QR1qYulAGipgtqqNsP3GyzGIPg1/jS3dOQ4b7WNt/ITXyf1
 tavxpHnPyx5eAwF1Qc370vzSDvPpL67UikHW+D3WnvmOcEqeB5YdKwecwkGF9/5WIGjV
 6vUfwH3DDx9j2J8Twy1OTmZ25T4D8hqU/qQfADfOWautKc3KiPruPyfImHih2IkheaUC
 2k5tOYjXmvB0NiqtXGrZDcUZskl1imvg2cfLoc6YVjzQFEjKefWZYAp4ji+cF3Kwvmcy
 YeOamkNk001BMaFhCyCb3MshFU38GqOSGQ8OMdR/Pm5uQrelndJX5wxnTYpbqggAMEM2
 Tblw==
X-Gm-Message-State: AOAM530MK6ad6qO1uwuCWvYSxQCGbXnHkr5sbEVi5pclheeWT3CK++tx
 s+SZCpDOIr2GRCN7AZuUzHPuaQ==
X-Google-Smtp-Source: ABdhPJxUXPnlq3fnqBxNwq+VU2c6cdmBk++xs+hnu+nnviQYYFI6uuFUKT5La/Jt+m2gv1zoVNQ6+w==
X-Received: by 2002:a05:6a00:1a55:b0:4c4:394:8a22 with SMTP id
 h21-20020a056a001a5500b004c403948a22mr10068904pfv.63.1642495044202; 
 Tue, 18 Jan 2022 00:37:24 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id c6sm1775615pjo.39.2022.01.18.00.37.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Jan 2022 00:37:23 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Tue, 18 Jan 2022 17:36:51 +0900
Message-Id: <20220118083652.16335-3-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220118083652.16335-1-etom@igel.co.jp>
References: <20220118083652.16335-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 18 Jan 2022 20:08:37 +0000
Subject: [Nouveau] [RFC PATCH v4 2/3] drm: add support modifiers for drivers
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

