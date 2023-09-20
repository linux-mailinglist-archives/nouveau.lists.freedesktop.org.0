Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1B27A875F
	for <lists+nouveau@lfdr.de>; Wed, 20 Sep 2023 16:44:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6536410E500;
	Wed, 20 Sep 2023 14:44:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D68B10E4FA
 for <nouveau@lists.freedesktop.org>; Wed, 20 Sep 2023 14:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695221039;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=teKSA/CYnBKR/nhHsoNvbfNEz6ctyEw/xwjCLcFoikc=;
 b=Lm+bisNvslbCwcn8Graz9dNFoF6Y7TDsiC/1fWZdfU2JwnsPBPKAv2Eav8FC7E+0IBSkor
 BoSovd7kQ8FUS3HadKWf5MeZrJYXFCItI0ihKEFSnezxs8pRRfBNw4Ccr43FzkxD4mI8mB
 GHCyutwWYv5rXv+EPjPoux2IIRQKd3k=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-306-6I52K7jKMciRs_5uUv7JJA-1; Wed, 20 Sep 2023 10:43:57 -0400
X-MC-Unique: 6I52K7jKMciRs_5uUv7JJA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9a9f282713fso503070766b.3
 for <nouveau@lists.freedesktop.org>; Wed, 20 Sep 2023 07:43:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695221037; x=1695825837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=teKSA/CYnBKR/nhHsoNvbfNEz6ctyEw/xwjCLcFoikc=;
 b=SpU2i6F/pA7YyGPcu7IYU/0p0k3LtwQqzU8KPWut3PFvdRavXJSvDEVPvK0ovUNmI5
 e/HJJq3JmNl+srtJ7zsSvTKBWOrXdtMgRMxI+Ok9lsIWFbBB5jlNFKpzTJsUWgvbeuc0
 BTKTdQS0cnB/cMbPYFQnOSarUHc/YhUxCQo4Gz+z57BfIR0WZ0cNXhquzQeCClEMqXvB
 G27nmyWBFJ3lT843gZpYc+3uQIhhJnvT12qciOYc16MB+CFDlo7C8YdhVZvGj3vfuTVO
 B/2bzrHZKTUtHG+PSCg1xT3/slfg0vcVWOa7SjpiVFB/ySTjoM9IQ2KG5DCig7YiXGeF
 A4Qg==
X-Gm-Message-State: AOJu0Yz0gYY7K73jMvnWib4wNg8kkV9PyVmY+QUPtaQLYJAysJHl6l8U
 JVIgXCxwLoUmB2cdrB4UFeIUj+6XsbVdKJbWRGRonL5+S5EhgQ9fjCPOCzWSiwmian+zvMUdDx0
 zOaB9a+ahx7jq4u5czqDS1qye+g==
X-Received: by 2002:a17:907:75f8:b0:9ae:381a:6c55 with SMTP id
 jz24-20020a17090775f800b009ae381a6c55mr2155907ejc.15.1695221036915; 
 Wed, 20 Sep 2023 07:43:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGnaHW60Dc5balSdXu08W+wuqyr34BCUy5AOQEdXimdxPZX7mS86BNMJpr+l5YTNyRpQOSFCw==
X-Received: by 2002:a17:907:75f8:b0:9ae:381a:6c55 with SMTP id
 jz24-20020a17090775f800b009ae381a6c55mr2155893ejc.15.1695221036661; 
 Wed, 20 Sep 2023 07:43:56 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e10-20020a170906248a00b00993928e4d1bsm9337658ejb.24.2023.09.20.07.43.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 07:43:56 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith.ekstrand@collabora.com
Date: Wed, 20 Sep 2023 16:42:35 +0200
Message-ID: <20230920144343.64830-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230920144343.64830-1-dakr@redhat.com>
References: <20230920144343.64830-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v4 2/8] drm/gpuvm: allow building as
 module
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

Currently, the DRM GPUVM does not have any core dependencies preventing
a module build.

Also, new features from subsequent patches require helpers (namely
drm_exec) which can be built as module.

Reviewed-by: Christian König <christian.koenig@amd.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/Kconfig         | 7 +++++++
 drivers/gpu/drm/Makefile        | 2 +-
 drivers/gpu/drm/drm_gpuvm.c     | 3 +++
 drivers/gpu/drm/nouveau/Kconfig | 1 +
 4 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index ab9ef1c20349..0f78a03e4e84 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -216,6 +216,13 @@ config DRM_EXEC
 	help
 	  Execution context for command submissions
 
+config DRM_GPUVM
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
index 7a84b3cddeab..8e1bde059170 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -45,7 +45,6 @@ drm-y := \
 	drm_vblank.o \
 	drm_vblank_work.o \
 	drm_vma_manager.o \
-	drm_gpuvm.o \
 	drm_writeback.o
 drm-$(CONFIG_DRM_LEGACY) += \
 	drm_agpsupport.o \
@@ -81,6 +80,7 @@ obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 #
 #
 obj-$(CONFIG_DRM_EXEC) += drm_exec.o
+obj-$(CONFIG_DRM_GPUVM) += drm_gpuvm.o
 
 obj-$(CONFIG_DRM_BUDDY) += drm_buddy.o
 
diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 7074bcad5b28..bfea4a8a19ec 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1723,3 +1723,6 @@ drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 	kfree(ops);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_ops_free);
+
+MODULE_DESCRIPTION("DRM GPUVM");
+MODULE_LICENSE("GPL");
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index c52e8096cca4..1e6aaf95ff7c 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -11,6 +11,7 @@ config DRM_NOUVEAU
 	select DRM_TTM
 	select DRM_TTM_HELPER
 	select DRM_EXEC
+	select DRM_GPUVM
 	select DRM_SCHED
 	select I2C
 	select I2C_ALGOBIT
-- 
2.41.0

