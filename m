Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0FB5794550
	for <lists+nouveau@lfdr.de>; Wed,  6 Sep 2023 23:47:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDA7C10E203;
	Wed,  6 Sep 2023 21:47:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1ABCE10E1C4
 for <nouveau@lists.freedesktop.org>; Wed,  6 Sep 2023 21:47:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1694036854;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Bmrcb2oq50rZlpGWQfTXaOIClgXSoOriMS7Nyz+ms1c=;
 b=H23oz4Cay9b7VVL4aoQztK2q5FKWmkCX4F8bWNAdzYezcLt2gNTGzxjlboTDd4wLiZwlbL
 n0GoVhliM+ZJFPrlmCFWUEFB7RHA9ULpMpzNHay53D8jRwu0sriqVgAVnsmc06YdbYoEcJ
 p+tcujW9FRmp/8pWOfhmVp6rnbmEggw=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-516-oTYE7g2GNg-F_5GWUUbWxw-1; Wed, 06 Sep 2023 17:47:32 -0400
X-MC-Unique: oTYE7g2GNg-F_5GWUUbWxw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-500b0aa547eso226107e87.2
 for <nouveau@lists.freedesktop.org>; Wed, 06 Sep 2023 14:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1694036851; x=1694641651;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Bmrcb2oq50rZlpGWQfTXaOIClgXSoOriMS7Nyz+ms1c=;
 b=WHgjPhu8EISxIWpBmM0l6x1gLVHp3CPR9yviaCp1WACYtNkjLqlBVZXdCv/9ym07OG
 I85SR6LkAL5041dPWrQ9KAnhwQlzDm+pQKXk0w8kIZYDkkdOoKLVnpbXrC245U0fOGoY
 jZMsY7SbOvav4n1UTGlJtq/DRefxZcP+cXJ7Xhijdw2ApVynqj8mw5GcfwOMggiKR8h2
 lWt8eBrPvn1854YSCVWXtw7+kPaqTa2jT9AZaCiYIWoQGAdbyKqDfvP3+k+K1xsfbOoP
 uatTBdtcGMm8Aye3+0if9frte1qHsnLcqlAvamIim+ORjMvB01G8TXSwZEqjHSKUCS1D
 mE5A==
X-Gm-Message-State: AOJu0Yyc+yDOc6UaZfPiUgL7K/Kdm4QwqD0PTnICn1DzjvEpXMgapqin
 3lv3KAJKnjsbBQ8XILzgElyiCEf7F3Kxl1fiq1yiKOASMsLDlvV5KpB/NRAw0aTUu7vnm01tQLc
 FoTQMYY2068VkN3CjSHg+ntszWhOnPAd/Og==
X-Received: by 2002:a05:6512:47c:b0:4fd:bdf8:930d with SMTP id
 x28-20020a056512047c00b004fdbdf8930dmr3397721lfd.22.1694036851084; 
 Wed, 06 Sep 2023 14:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGZOvUjQotqVmw5dq+H1cGrTwf3v11lzqe++IgrCUjU4OD92LBUiS/v0WDNutLYEF1h43q/IQ==
X-Received: by 2002:a05:6512:47c:b0:4fd:bdf8:930d with SMTP id
 x28-20020a056512047c00b004fdbdf8930dmr3397700lfd.22.1694036850791; 
 Wed, 06 Sep 2023 14:47:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q10-20020aa7cc0a000000b005232c051605sm8829288edt.19.2023.09.06.14.47.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Sep 2023 14:47:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Date: Wed,  6 Sep 2023 23:47:09 +0200
Message-ID: <20230906214723.4393-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230906214723.4393-1-dakr@redhat.com>
References: <20230906214723.4393-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v2 1/7] drm: gpuva_mgr: allow
 building as module
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

Currently, the DRM GPUVA manager does not have any core dependencies
preventing a module build.

Also, new features from subsequent patches require helpers (namely
drm_exec) which can be built as module.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig         | 7 +++++++
 drivers/gpu/drm/Makefile        | 2 +-
 drivers/gpu/drm/drm_gpuva_mgr.c | 3 +++
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..3f2577e10c07 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -216,6 +216,13 @@ config DRM_EXEC
 	help
 	  Execution context for command submissions
 
+config DRM_GPUVA_MGR
+	tristate
+	depends on DRM && DRM_EXEC
+	help
+	  GPU-VM representation providing helpers to manage a GPUs virtual
+	  address space
+
 config DRM_BUDDY
 	tristate
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 215e78e79125..5c10243d77fe 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,7 +45,6 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
-	drm_gpuva_mgr.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
@@ -81,6 +80,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 #
 obj-$(CONFIG_DRM_EXEC) += drm_exec.o
+obj-$(CONFIG_DRM_GPUVA_MGR) += drm_gpuva_mgr.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_gpuva_mgr.c b/drivers/gpu/drm/drm_gpuva_mgr.c
index f86bfad74ff8..6b5e12e142df 100644
--- a/drivers/gpu/drm/drm_gpuva_mgr.c
+++ b/drivers/gpu/drm/drm_gpuva_mgr.c
@@ -1723,3 +1723,6 @@ drm_gpuva_ops_free(struct drm_gpuva_manager *mgr,
 	kfree(ops);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
+
+MODULE_DESCRIPTION("DRM GPUVA Manager");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index c52e8096cca4..bf73f6b1ccad 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -11,6 +11,7 @@ config DRM_NOUVEAU
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
+	select DRM_GPUVA_MGR
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-- 
2.41.0

