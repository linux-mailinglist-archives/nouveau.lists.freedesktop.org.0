Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 255227BD130
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 01:32:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF80410E0AE;
	Sun,  8 Oct 2023 23:32:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6576710E0AE
 for <nouveau@lists.freedesktop.org>; Sun,  8 Oct 2023 23:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696807948;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=RJphU8IGhvgwUi2yl/XNO6bryXEecRsbCtSU17bPD/8=;
 b=eba4vdJ3EPrVw04jrv/kWqFlAgh9QC4n5if+Hkngf6xvpjGsPhxMWuCSy/yYgoHNSh8c+k
 dergRzVRB/igCyCbKJppHwbAq8TPOMSi7E1rPPqUAHR6q//ljrmCsihibnoxQTxZENCUb4
 kPdPxf6gRjOd39gXapMtOzJg8jfVClg=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-142-Vki-BVkWPsG9HNd8PUHsJw-1; Sun, 08 Oct 2023 19:32:27 -0400
X-MC-Unique: Vki-BVkWPsG9HNd8PUHsJw-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9ae42088b4bso298589866b.3
 for <nouveau@lists.freedesktop.org>; Sun, 08 Oct 2023 16:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696807946; x=1697412746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RJphU8IGhvgwUi2yl/XNO6bryXEecRsbCtSU17bPD/8=;
 b=Iu77802RPhdjlGa6cvVnGxvSq4kocULcvk0Oy7cJIwE+xD4e8UilVuNMaLUC9RutPR
 /FXV2mL4bq8Dw51cZ2LrOB/qe78mav6bvcf94L9TQ7rDhPXfc6sIePY6EvPvzIRgZqwa
 snnsSjSK73f4A+DviYGz1doE1yuqDFeMfdJOb2IoeBoc+1+mZGCvoATFLgikrxFdGZ6t
 r7u4BiLQXll+vTcwPO/SmVc6k6TaiJZ45BIWU+AFWkWiZWbeFSfmhpyw+fMbOItZrTd1
 K6oX/7U1RI9jnu8lT8sdaP9kI9AbxsA89IZ3DiBUEZ46wpDrbdDGATn9yapz5bsao0Zj
 zEug==
X-Gm-Message-State: AOJu0YwPAo1PpH5UWCiUYm5exUBrDz02vk3kK5R9beRL3b/COHx2364c
 f2nKf4F4dGjjULW8RZfwhqxWH5N+Abvhh+KR7mHDk+rypYDK/rx38Old5tbR1JLTXfc8g80HaqT
 1LpTDBAKVxhQ51H+UXdJaYfdlGg==
X-Received: by 2002:a17:906:310b:b0:9b5:f25d:9261 with SMTP id
 11-20020a170906310b00b009b5f25d9261mr12282159ejx.22.1696807946139; 
 Sun, 08 Oct 2023 16:32:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH0NbsDQri663/zEaJyzXrug24KBVwnj7eg91dNf4JIQkc6Xi3YvatVdULmvC7QMID0VPYl1w==
X-Received: by 2002:a17:906:310b:b0:9b5:f25d:9261 with SMTP id
 11-20020a170906310b00b009b5f25d9261mr12282141ejx.22.1696807945891; 
 Sun, 08 Oct 2023 16:32:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 l12-20020a170906230c00b009920e9a3a73sm6008080eja.115.2023.10.08.16.32.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 16:32:25 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Mon,  9 Oct 2023 01:32:02 +0200
Message-ID: <20231008233212.13815-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231008233212.13815-1-dakr@redhat.com>
References: <20231008233212.13815-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v6 2/6] drm/gpuvm: add
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

