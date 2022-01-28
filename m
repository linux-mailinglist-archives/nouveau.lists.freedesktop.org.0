Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96CC04A01A8
	for <lists+nouveau@lfdr.de>; Fri, 28 Jan 2022 21:10:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3372510E4C5;
	Fri, 28 Jan 2022 20:10:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com
 [IPv6:2607:f8b0:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 477B810F4D6
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jan 2022 06:09:18 +0000 (UTC)
Received: by mail-pg1-x535.google.com with SMTP id p125so4361702pga.2
 for <nouveau@lists.freedesktop.org>; Thu, 27 Jan 2022 22:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=igel-co-jp.20210112.gappssmtp.com; s=20210112;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=xmJUYGxVIOq2ikN9W5Sr7Lz0nyJ9BNBmKrBR0wxwPTE=;
 b=n52ktlUg3l4qy9m/0Ni0lzQNBoCvDxm+h9y9p5dLfgPUj79JmomeClnGajJBRNzxmI
 RmTKQGeWberRRjud4XfI5FwJ3M1dW6UAT93DdcwU8iUFTJe8cxoE/1go74mWnbYA2rpN
 ObgaBv5dxtL/9CfjgaLbkoUzx2YeVR33SLUsBgiGdJY8219auHHuheS18uX7ZVc5tBRI
 bpCSqfPY4bFEciUcFhrRSRUX2LSAQoAJQgDeyd8SUQkxbTue8yeDx4555WEmKd3iTQ6Z
 JZdNEHmylYt+bZujgRFF1PZ2l7EVhnbCQDbsk2dLaq4Nwn9fseH3PMqlbu9taC0UJtSe
 fD7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=xmJUYGxVIOq2ikN9W5Sr7Lz0nyJ9BNBmKrBR0wxwPTE=;
 b=XEP17OeKg4XUvdxgMY4sOQDXVd1+1O8hiAL4T4hwb5oDcYWTv4recUmTOPvxYXEOYF
 kMRJ5fmN/G9Bu4HHwl37WBEGd3Mm5N/eh6DZ5qc30Zy3Z8NNdhe6WfGewXZv6w8zq4iF
 E6ydCgJ+U6QOCROatj5NcgovUAHDX1WL3teGceguKKXa4c3oqJfQXGvim9edh/CE0Xau
 SPTt645HdOy4gxsnvWdpu/P3zw1wIr/5tkBq3lNuhxuFLJUWWLBRVxijl4NnvC4h/lm9
 MJgLJGqc8cxkCI94NYEzw2rOtUE+f8OYQsCJm+pexvhGvxFpLu8MI4hS8HzdU1CEU584
 rMaA==
X-Gm-Message-State: AOAM531luTGEufbz6OULO8/9V3CEzbUoII+cvM3ReLy6xPx7BzPesJHT
 NiDT4n4Zu7TcjRa3jZvaFffCew==
X-Google-Smtp-Source: ABdhPJxOswA3kNxXL45GkqcHS4JhxF0KFKbQ4Yl6by2ISkes4m7lp62H+duPcH9WQSM66RTMhk6uqA==
X-Received: by 2002:a63:6342:: with SMTP id x63mr5500830pgb.148.1643350157903; 
 Thu, 27 Jan 2022 22:09:17 -0800 (PST)
Received: from aqua.hq.igel.co.jp (napt.igel.co.jp. [219.106.231.132])
 by smtp.gmail.com with ESMTPSA id h5sm7743182pfi.111.2022.01.27.22.09.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jan 2022 22:09:17 -0800 (PST)
From: Tomohito Esaki <etom@igel.co.jp>
To: dri-devel@lists.freedesktop.org
Date: Fri, 28 Jan 2022 15:08:36 +0900
Message-Id: <20220128060836.11216-4-etom@igel.co.jp>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220128060836.11216-1-etom@igel.co.jp>
References: <20220128060836.11216-1-etom@igel.co.jp>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 28 Jan 2022 20:10:03 +0000
Subject: [Nouveau] [RFC PATCH v6 3/3] drm: remove allow_fb_modifiers
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

v3:
 - change the order as follows:
   1. add fb_modifiers_not_supported flag
   2. add default modifiers
   3. remove allow_fb_modifiers flag

v5:
 - keep a sanity check in plane init func

Signed-off-by: Tomohito Esaki <etom@igel.co.jp>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
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

