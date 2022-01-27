Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4790549E65E
	for <lists+nouveau@lfdr.de>; Thu, 27 Jan 2022 16:42:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90C1C10E2D3;
	Thu, 27 Jan 2022 15:42:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7A710EE08
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 03:26:16 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id s16so1009285pgs.13
 for <nouveau@lists.freedesktop.org>; Wed, 26 Jan 2022 19:26:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=UXgGm9s9WWnJocR1csEpEoFP0RYkPEhnyAgndhDwtjc=;
 b=O4KjoPSuQDZNGBWdQmitA/kZxO0YlbnND4cNyWdlyu4NQbK+BjberWp7inGyjYEFJK
 V6JfMoxtuIZkIBnyKTfo0YDRqThLerNVvqa+K1pSkgZZvEcRMTgu3/Fla5GeW5IktNNn
 Bijtm9oz/pYUb5wZ8jBAPSSs4k9N9koKFTfDDcGFPBvT1f6aT69SbDPqjCIOCXPuxmTu
 3zWG6DCftxpuLhT0mrnB7Ni8jRvM2RLA+4slw5oHeDn0lLA7Qm21MGiq0iFX+UpbBapn
 fzZcajgCC/wg3/Mw4zbuNAa0nNAWO80t/e4VHG2oUY2aJnDbWbkuoV/5ZDfxq5gVqZdt
 hdmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=UXgGm9s9WWnJocR1csEpEoFP0RYkPEhnyAgndhDwtjc=;
 b=HZx6ZM6tICe2nGljDA+ylnkbLCHNlf2qHYVuUJ+rU98JVMbt7T1ZsVeOGLEqCFSqOL
 OdrJOsvO3b/VJPurKsQJr+DwU3Zhw6k7UaGd0JZnclzqdI1hWRWv7tCm844JXge495/9
 CpIjLtSQ0PFq8zu5O7oCu5yQqmmQ3YCly2mji0bUm13mOXWY/DjyrRDSygSLNgKqI8sI
 esCuHxDR7WT/Y1NdNdaqeHdrX8B7kHTgC6huE1a2Qk4QLZwmT5zir3i2RlvBmHmWS0tU
 wUU5VKMc0+z6TSVognd07qhKFXq7KHEfHXYF2KuEdNLgHFnm0xzYFob21S1zWvl+P8JE
 qkdQ==
X-Gm-Message-State: AOAM530IE2IZX/WiFtP05bdoaE21Y6OT4KuVrN/HMxvfWIo1eQY239HD
 Uea8rZoMLR7f9lkHvTP4YA3bfw==
X-Google-Smtp-Source: ABdhPJysmgOujAl45WjONf68QQ5jRzvfCobqxGtGJ8Z511kMtGA4DmksGOLMeNbJRLJFDxAUzyr1Nw==
X-Received: by 2002:a63:2c07:: with SMTP id s7mr1356397pgs.181.1643253975979; 
 Wed, 26 Jan 2022 19:26:15 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id t15sm4203111pjy.17.2022.01.26.19.26.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 26 Jan 2022 19:26:15 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Thu, 27 Jan 2022 12:25:39 +0900
Message-Id: <20220127032539.9929-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220127032539.9929-1-etom@igel.co.jp>
References: <20220127032539.9929-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 27 Jan 2022 15:42:16 +0000
Subject: [Nouveau] [RFC PATCH v5 3/3] drm: remove allow_fb_modifiers
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

The allow_fb_modifiers flag is unnecessary since it has been replaced
with fb_modifiers_not_supported flag.

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
---
 drivers/gpu/drm/selftests/test-drm_framebuffer.c |  1 -
 include/drm/drm_mode_config.h                    | 16 ----------------
 2 files changed, 17 deletions(-)

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
index 4a93dac91cf9..6b5e01295348 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -917,22 +917,6 @@ struct drm_mode_config {
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

