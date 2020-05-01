Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C951C1CC5
	for <lists+nouveau@lfdr.de>; Fri,  1 May 2020 20:20:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D93286ED28;
	Fri,  1 May 2020 18:20:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-x842.google.com (mail-qt1-x842.google.com
 [IPv6:2607:f8b0:4864:20::842])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E04D56ED25
 for <nouveau@lists.freedesktop.org>; Fri,  1 May 2020 18:20:50 +0000 (UTC)
Received: by mail-qt1-x842.google.com with SMTP id s30so8619917qth.2
 for <nouveau@lists.freedesktop.org>; Fri, 01 May 2020 11:20:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ziepe.ca; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/v1SRW7RLO2DyhUWTLyIJTwDXoWoQz0FjZx07fCIeIw=;
 b=F4zt2FGzsxpHPLdvktVhW3BfaN6xiFRDbuZkmSco75064Myp5HCFf0VMtoTpyF+HiZ
 gRl5jFZA8gibhRyeT6gHVetVqNOQYZUID/RV5pJBKFoOYZa/OvYCZnOIqlLaMbKFSpll
 EAszPsPRiX5trtB1G4f3CckG+aiuyg2V/qlwfz9x20qzG5Mvo6FMMrPDEHY4s7Gr6gh9
 WFyg9Gen7dOr5u6UFXc4Vh8MfWWjJlXbMAECTzKUl1RU3ZMLRbM+iO6qYAj6lWWH3TIF
 tN+zdQYygGrKyLOsgvh/lQT43tb+NndC7zvYZoUsjb0indx6hqFAlW7CKJkjXoZ/HE/q
 mwig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/v1SRW7RLO2DyhUWTLyIJTwDXoWoQz0FjZx07fCIeIw=;
 b=O4ZiV04pEMjwSoj3Dt1C1tjs882yatyo66zFCMz/DV1VmID3WEUV42P1lZBlAfIV22
 9NNEjraSnZAYEnI/fyVnNWzbPwAMEI6qZSMMC3wfiFb2CfEBUjkIDnaF8hdE+H3c61i0
 RNbxv2YcssnXZfHlKeBrZUwEeEB6B33oC0bBo9FHByu9YqUX5pPOe0QXJ2iv/yvTJF50
 41K+sNkEGWgYlXMAPTWkwghgP5i4i/pfNV5AO5cejQ+Q5bpbaMNpXm+UmsN4sbDSmcq7
 0jwaQ0gPJlwaatZ5VyRnZyPu1dCn99hwoZS5+ZHKH/H75WMJEC29K6KsXMd59MRcMzxr
 CA2Q==
X-Gm-Message-State: AGi0PuYrOORURdkSCHWm6L52zmG9G6Atg4WL+0uDntAnLMOsWPmpvbfA
 JJXoN/646yWU0Rl1EmIsVPQgrQ==
X-Google-Smtp-Source: APiQypKho3FfU0G2u2X5Z/Op83RdkxxNU65dMGVqf/F76QTq7UpcGGr2GdyYCLdwVfV5qiEQbT1o3A==
X-Received: by 2002:ac8:40c8:: with SMTP id f8mr5141557qtm.280.1588357249992; 
 Fri, 01 May 2020 11:20:49 -0700 (PDT)
Received: from ziepe.ca
 (hlfxns017vw-142-68-57-212.dhcp-dynamic.fibreop.ns.bellaliant.net.
 [142.68.57.212])
 by smtp.gmail.com with ESMTPSA id n10sm3107746qkk.105.2020.05.01.11.20.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 01 May 2020 11:20:49 -0700 (PDT)
Received: from jgg by mlx.ziepe.ca with local (Exim 4.90_1)
 (envelope-from <jgg@ziepe.ca>)
 id 1jUaHI-0006oO-GN; Fri, 01 May 2020 15:20:48 -0300
From: Jason Gunthorpe <jgg@ziepe.ca>
To: linux-mm@kvack.org,
	Ralph Campbell <rcampbell@nvidia.com>
Date: Fri,  1 May 2020 15:20:44 -0300
Message-Id: <1-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
In-Reply-To: <0-v2-b4e84f444c7d+24f57-hmm_no_flags_jgg@mellanox.com>
References: 
MIME-Version: 1.0
Subject: [Nouveau] [PATCH hmm v2 1/5] mm/hmm: make CONFIG_DEVICE_PRIVATE
 into a select
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 amd-gfx@lists.freedesktop.org, "Yang, Philip" <Philip.Yang@amd.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Jason Gunthorpe <jgg@mellanox.com>

There is no reason for a user to select this or not directly - it should
be selected by drivers that are going to use the feature, similar to how
CONFIG_HMM_MIRROR works.

Currently all drivers provide a feature kconfig that will disable use of
DEVICE_PRIVATE in that driver, allowing users to avoid enabling this if
they don't want the overhead.

Acked-by: Felix Kuehling <Felix.Kuehling@amd.com>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Signed-off-by: Jason Gunthorpe <jgg@mellanox.com>
---
 arch/powerpc/Kconfig            | 2 +-
 drivers/gpu/drm/nouveau/Kconfig | 2 +-
 mm/Kconfig                      | 7 +------
 3 files changed, 3 insertions(+), 8 deletions(-)

diff --git a/arch/powerpc/Kconfig b/arch/powerpc/Kconfig
index 924c541a926008..8de52aefdc74cc 100644
--- a/arch/powerpc/Kconfig
+++ b/arch/powerpc/Kconfig
@@ -455,7 +455,7 @@ config PPC_TRANSACTIONAL_MEM
 config PPC_UV
 	bool "Ultravisor support"
 	depends on KVM_BOOK3S_HV_POSSIBLE
-	depends on DEVICE_PRIVATE
+	select DEVICE_PRIVATE
 	default n
 	help
 	  This option paravirtualizes the kernel to run in POWER platforms that
diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index d6e4ae1ef7053a..af5793f3e7c2cf 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -86,10 +86,10 @@ config DRM_NOUVEAU_BACKLIGHT
 
 config DRM_NOUVEAU_SVM
 	bool "(EXPERIMENTAL) Enable SVM (Shared Virtual Memory) support"
-	depends on DEVICE_PRIVATE
 	depends on DRM_NOUVEAU
 	depends on MMU
 	depends on STAGING
+	select DEVICE_PRIVATE
 	select HMM_MIRROR
 	select MMU_NOTIFIER
 	default n
diff --git a/mm/Kconfig b/mm/Kconfig
index c1acc34c1c358c..7ca36bf5f5058e 100644
--- a/mm/Kconfig
+++ b/mm/Kconfig
@@ -805,15 +805,10 @@ config HMM_MIRROR
 	depends on MMU
 
 config DEVICE_PRIVATE
-	bool "Unaddressable device memory (GPU memory, ...)"
+	bool
 	depends on ZONE_DEVICE
 	select DEV_PAGEMAP_OPS
 
-	help
-	  Allows creation of struct pages to represent unaddressable device
-	  memory; i.e., memory that is only accessible from the device (or
-	  group of devices). You likely also want to select HMM_MIRROR.
-
 config FRAME_VECTOR
 	bool
 
-- 
2.26.2

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
