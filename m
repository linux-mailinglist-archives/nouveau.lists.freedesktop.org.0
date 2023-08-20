Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2624978203F
	for <lists+nouveau@lfdr.de>; Sun, 20 Aug 2023 23:54:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 01D0110E162;
	Sun, 20 Aug 2023 21:54:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08CF510E160
 for <nouveau@lists.freedesktop.org>; Sun, 20 Aug 2023 21:54:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692568455;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+R/sWlMT7wVG64uORegqci3bW98/zYiz5u+hdhEocSI=;
 b=Cw5naoAjkTrBKX3h/n5b8K2WjxKFL47Lj5mjNHJS8ql881CeO2925DJVw61FwxHLmSX75A
 yRalZ0YOMat20D40twjjykVGxvoJbAUSgz0JuqBaNdYZupjtXas+GXHGkF8DsTco2g5C2X
 uqifp2U6zTBKanwf4dG6VAodnKZQX1s=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-573-8kAjCqqMNa-TsS_3M4TVng-1; Sun, 20 Aug 2023 17:54:13 -0400
X-MC-Unique: 8kAjCqqMNa-TsS_3M4TVng-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2bba5d0c68bso25664591fa.3
 for <nouveau@lists.freedesktop.org>; Sun, 20 Aug 2023 14:54:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692568452; x=1693173252;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+R/sWlMT7wVG64uORegqci3bW98/zYiz5u+hdhEocSI=;
 b=GtpR0VJvHCqm3o1MLkAvPdoBLLDhkezuNUV+X0pG+BW7Y13YSrV7KNQqBjW0KxPghN
 IuO0NsL14ypytcciDDilC/GGE7cbXhYIhQD1nsuYyu9tscAGHQQKXNiYR+gFogdf0777
 GeRxJNHRSwEV3nIBcjr+BMRWSJ7IeyTw0GeU6w/m5R08UePHaPLcT53/xzXF2qFdYiqk
 u8lRms2HKMMWcZaPwBu7ghbOqTbfwt1fsaZaQrdBlGayBcK/bE7ByO5NmSR5Xr4OH25n
 N5/MRvCxp+D1yqwBic7vMUmg1N/roPCgkfsrecEYx+cwZoVSbkwbbNbfWJL0kaUIEJtH
 Npgw==
X-Gm-Message-State: AOJu0YzItY12zY2FuFvFkYWeJ6ykP1gSrMxDZu8Hs7npPm3gbqq3+glD
 c7u1RawyYLwA7KXxNH/siJR8Ink/A4EYqnIJv00BkbSIvX2COGwLcMDFA5cHm0hlJQwd/FGeZ2d
 51Q2Sdk2AbccHXLo/sb54SszQ+51KD5buCA==
X-Received: by 2002:a05:6512:2396:b0:4fd:fafd:1ed4 with SMTP id
 c22-20020a056512239600b004fdfafd1ed4mr4221919lfv.2.1692568451863; 
 Sun, 20 Aug 2023 14:54:11 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEQOe6EUHANI7lcqkPBWc4kZcyrIJjTjqCjCwwhLtlytYfuYgg2prfqx79jcLJiK4a6N2mu/w==
X-Received: by 2002:a05:6512:2396:b0:4fd:fafd:1ed4 with SMTP id
 c22-20020a056512239600b004fdfafd1ed4mr4221907lfv.2.1692568451672; 
 Sun, 20 Aug 2023 14:54:11 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f11-20020aa7d84b000000b005257f2c057fsm4897287eds.33.2023.08.20.14.54.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Aug 2023 14:54:11 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com, bskeggs@redhat.com,
 Liam.Howlett@oracle.com
Date: Sun, 20 Aug 2023 23:53:08 +0200
Message-ID: <20230820215320.4187-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230820215320.4187-1-dakr@redhat.com>
References: <20230820215320.4187-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 1/3] drm: drm_exec: build always
 builtin
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

drm_exec must always be builtin for the DRM GPUVA manager to depend on
it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig         | 6 ------
 drivers/gpu/drm/Makefile        | 3 +--
 drivers/gpu/drm/nouveau/Kconfig | 1 -
 3 files changed, 1 insertion(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..85122d4bb1e7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -210,12 +210,6 @@ config DRM_TTM_KUNIT_TEST
 
           If in doubt, say "N".
 
-config DRM_EXEC
-	tristate
-	depends on DRM
-	help
-	  Execution context for command submissions
-
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..388e0964a875 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -23,6 +23,7 @@ drm-y := \
 	drm_dumb_buffers.o \
 	drm_edid.o \
 	drm_encoder.o \
+	drm_exec.o \
 	drm_file.o \
 	drm_fourcc.o \
 	drm_framebuffer.o \
@@ -80,8 +81,6 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 # Memory-management helpers
 #
 #
-obj-$(CONFIG_DRM_EXEC) += drm_exec.o
-
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
 drm_dma_helper-y := drm_gem_dma_helper.o
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index c52e8096cca4..2dddedac125b 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -10,7 +10,6 @@ config DRM_NOUVEAU
 	select DRM_KMS_HELPER
 	select DRM_TTM
 	select DRM_TTM_HELPER
-	select DRM_EXEC
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-- 
2.41.0

