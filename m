Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A5217B25CD
	for <lists+nouveau@lfdr.de>; Thu, 28 Sep 2023 21:16:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3F1A10E07D;
	Thu, 28 Sep 2023 19:16:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DE1D10E098
 for <nouveau@lists.freedesktop.org>; Thu, 28 Sep 2023 19:16:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695928598;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJphU8IGhvgwUi2yl/XNO6bryXEecRsbCtSU17bPD/8=;
 b=LHymGGMkbEFf6Ut7cDHVVB33+PYsHgBjcJtFFyKDftZsaSe+2xUjiqNj1Nlln7yRxEZOz2
 uCpGcmbLndRhAs66UNQJkzlprIWRYr6hzrAR5H0++7kCReLNgvevQty3I5ia9XXNJ/kk4z
 ofy/Id4CqtzrClmYiQA7zNTcHWp/Ws8=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-487-4n77PoQPMgerODKvfJDc8g-1; Thu, 28 Sep 2023 15:16:37 -0400
X-MC-Unique: 4n77PoQPMgerODKvfJDc8g-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-5219ceead33so10805525a12.2
 for <nouveau@lists.freedesktop.org>; Thu, 28 Sep 2023 12:16:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695928596; x=1696533396;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJphU8IGhvgwUi2yl/XNO6bryXEecRsbCtSU17bPD/8=;
 b=kxH6oMKzLnAvpePk70LenrbqlkhzlHXnGhf8Ido+/3QsYFvSe+Tw+rY0RuCNxNWq6R
 hCVtbhu7U0nP5bEy38pwYY9hjgRnjxdSNePWF7xM4DHkMxV4Zh12Smm/ylf6jqCbslMC
 ZNPBC1wXYgMuswTd4kGOcL5B+pzdKxi5Buc9XbBxl5E7Oful3oETt1x/qpl1FVHnZQdN
 k4fmgZ5J7yN1T78tMUOIbWMdZHxjJYrqjbc764yUrgpMQ9pDDl9alW39N425WTLJv04B
 fsK/nalFfuE86TywU0V8NuDcRjzw1v0mZ0gIijjzqp+QA6UzgLRFLUfgH7kexhSfBaUF
 57hg==
X-Gm-Message-State: AOJu0YyRYc+g83NETXpoG5woLsjAy0nVaPC38SiF1gHDObjEkQuR0wxg
 6zjkmxz4TxmxCt8W7scyUSUIE30C+o12tuWv4LMO2xWOE2qzll2UYzxnNghYbtuTBC/l61cdkqF
 f/AGQsq68/Nx10aRJ3BSI8gOomg==
X-Received: by 2002:aa7:c6cd:0:b0:533:310b:a8aa with SMTP id
 b13-20020aa7c6cd000000b00533310ba8aamr2057035eds.13.1695928595972; 
 Thu, 28 Sep 2023 12:16:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH08h6TIbMzADHS7ErW8zMwj+N6/RN5qpwmxEtXg6DkwgG4bbcTXnWHxwX4EBkuuqc6BeaVfQ==
X-Received: by 2002:aa7:c6cd:0:b0:533:310b:a8aa with SMTP id
 b13-20020aa7c6cd000000b00533310ba8aamr2057014eds.13.1695928595618; 
 Thu, 28 Sep 2023 12:16:35 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v10-20020aa7cd4a000000b0052ff9bae873sm10068453edw.5.2023.09.28.12.16.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 12:16:35 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Thu, 28 Sep 2023 21:16:16 +0200
Message-ID: <20230928191624.13703-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230928191624.13703-1-dakr@redhat.com>
References: <20230928191624.13703-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v5 2/6] drm/gpuvm: add
 drm_gpuvm_flags to drm_gpuvm
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

Introduce flags for struct drm_gpuvm, this required by subsequent
commits.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            |  4 +++-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 17 ++++++++++++++++-
 3 files changed, 20 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index ebda9d594165..6368dfdbe9dd 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -703,6 +703,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_root_object_alloc);
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @r_obj: the root &drm_gem_object providing the GPUVM's common &dma_resv
  * @name: the name of the GPU VA space
+ * @flags: the &drm_gpuvm_flags for this GPUVM
  * @start_offset: the start offset of the GPU VA space
  * @range: the size of the GPU VA space
  * @reserve_offset: the start of the kernel reserved GPU VA area
@@ -716,7 +717,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_root_object_alloc);
  */
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object *r_obj,
-	       const char *name,
+	       const char *name, enum drm_gpuvm_flags flags,
 	       u64 start_offset, u64 range,
 	       u64 reserve_offset, u64 reserve_range,
 	       const struct drm_gpuvm_ops *ops)
@@ -729,6 +730,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object *r_obj,
 	gpuvm->mm_range = range;
 
 	gpuvm->name = name ? name : "unknown";
+	gpuvm->flags = flags;
 	gpuvm->ops = ops;
 	gpuvm->r_obj = r_obj;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 4dea847ef989..93ad2ba7ec8b 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1843,7 +1843,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, r_obj, cli->name,
+	drm_gpuvm_init(&uvmm->base, r_obj, cli->name, 0,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 0aec14d8b259..13539f32c2e2 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -183,6 +183,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
+/**
+ * enum drm_gpuvm_flags - flags for struct drm_gpuvm
+ */
+enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_USERBITS: user defined bits
+	 */
+	DRM_GPUVM_USERBITS = (1 << 0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -201,6 +211,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @flags: the &drm_gpuvm_flags of this GPUVM
+	 */
+	enum drm_gpuvm_flags flags;
+
 	/**
 	 * @mm_start: start of the VA space
 	 */
@@ -246,7 +261,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, struct drm_gem_object *r_obj,
-		    const char *name,
+		    const char *name, enum drm_gpuvm_flags flags,
 		    u64 start_offset, u64 range,
 		    u64 reserve_offset, u64 reserve_range,
 		    const struct drm_gpuvm_ops *ops);
-- 
2.41.0

