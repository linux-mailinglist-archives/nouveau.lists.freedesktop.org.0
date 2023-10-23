Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 689347D40B9
	for <lists+nouveau@lfdr.de>; Mon, 23 Oct 2023 22:17:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9571110E246;
	Mon, 23 Oct 2023 20:17:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B179C10E242
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 20:17:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698092247;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Y4IDjkZdqgdBcw5A4oSL2XiqaLDDM8Cwc0CxsGkOjRs=;
 b=SWH95LtiXmjfbB0g0PtImaad0PmTYCFiS39zAw2MSAdqp3ZI5U5S3YgGTM+Fr92b17pWN0
 ztIDZupZAtSsNSbNX6ZuN2MfVtCI5+XGvWKCmGBUTdn/6NZzZUiTqQWdxVk+JLdBcjEWxp
 BeZAlD1EMC5T1v5xPMdzBxZpC811Yn8=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-498-Be88tG5_M9ykKMDXYyvZOQ-1; Mon, 23 Oct 2023 16:17:16 -0400
X-MC-Unique: Be88tG5_M9ykKMDXYyvZOQ-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9b97f1b493dso224435866b.3
 for <nouveau@lists.freedesktop.org>; Mon, 23 Oct 2023 13:17:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698092235; x=1698697035;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Y4IDjkZdqgdBcw5A4oSL2XiqaLDDM8Cwc0CxsGkOjRs=;
 b=pAyQ/Klo5Emgcjc3jPi3KtukwhtNDdEn728JkkMO7d0WDu7YooXVH7uWQg/42k/uKn
 mFta3RPk2acZai7WAvqizlLJC6cRePrG3Om1ZDo1qD91QbNEGQDY5p4IoGWQRAfyM/Tw
 hrMxpj6tbXLH8oHhhrxeTctaOETUYWwEOBwaguDfTHJR+M0n6YGe1XnKiERmUfbV9rym
 Mx4FSk0jn6t0fsqS+8RjL8LmCxvDt7/l4FhlIthrcvOvdxz0CF+WwAGOI/JgQ5J6lOWb
 qPjF34voWI0jAIge5DYXVT+veenajjW1KIeRF7pgAqFCL8dUPSP95sKlT6cjGYou/R8e
 IMog==
X-Gm-Message-State: AOJu0YyiIwUYEgVkgTzzE1Te318mC+Ej1CUt9xjoexRIag3xsCxFcnwd
 W4TGL7pXmKPBxRf1xkBSorzFgNOSajfvoobpVDecI9Rn5pyeA6Eb84WTJk7xD8jVT/+xe8PGs9n
 yMIQwnHfSRTTNJ6Zak8hQEAoDig==
X-Received: by 2002:a17:907:9618:b0:9a2:139:f45d with SMTP id
 gb24-20020a170907961800b009a20139f45dmr7227292ejc.43.1698092235511; 
 Mon, 23 Oct 2023 13:17:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHtSvuCe4XOGYLDJD5Wfw2tpwsIKpycAkrdssDdNWJTKf+fwQNF45z7lO9U7pq3j6EnZkQssQ==
X-Received: by 2002:a17:907:9618:b0:9a2:139:f45d with SMTP id
 gb24-20020a170907961800b009a20139f45dmr7227282ejc.43.1698092235278; 
 Mon, 23 Oct 2023 13:17:15 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 16-20020a170906225000b0098921e1b064sm7138162ejr.181.2023.10.23.13.17.14
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 13:17:14 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Mon, 23 Oct 2023 22:16:49 +0200
Message-ID: <20231023201659.25332-4-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231023201659.25332-1-dakr@redhat.com>
References: <20231023201659.25332-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v7 3/7] drm/gpuvm: add
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

Reviewed-by: Thomas Hellström <thomas.hellstrom@linux.intel.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            |  3 +++
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 include/drm/drm_gpuvm.h                | 16 ++++++++++++++++
 3 files changed, 20 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index b9742742a0e8..c03332883432 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -702,6 +702,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  * drm_gpuvm_init() - initialize a &drm_gpuvm
  * @gpuvm: pointer to the &drm_gpuvm to initialize
  * @name: the name of the GPU VA space
+ * @flags: the &drm_gpuvm_flags for this GPUVM
  * @drm: the &drm_device this VM resides in
  * @r_obj: the resv &drm_gem_object providing the GPUVM's common &dma_resv
  * @start_offset: the start offset of the GPU VA space
@@ -717,6 +718,7 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_resv_object_alloc);
  */
 void
 drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+	       enum drm_gpuvm_flags flags,
 	       struct drm_device *drm,
 	       struct drm_gem_object *r_obj,
 	       u64 start_offset, u64 range,
@@ -727,6 +729,7 @@ drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
 	INIT_LIST_HEAD(&gpuvm->rb.list);
 
 	gpuvm->name = name ? name : "unknown";
+	gpuvm->flags = flags;
 	gpuvm->ops = ops;
 	gpuvm->drm = drm;
 	gpuvm->r_obj = r_obj;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index b4e7d662961a..ed439bf4032f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1844,7 +1844,7 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	uvmm->kernel_managed_addr = kernel_managed_addr;
 	uvmm->kernel_managed_size = kernel_managed_size;
 
-	drm_gpuvm_init(&uvmm->base, cli->name, drm, r_obj,
+	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
 		       kernel_managed_addr, kernel_managed_size,
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 5f43a224d0f4..47cbacb244b9 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -184,6 +184,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
 	return va->flags & DRM_GPUVA_INVALIDATED;
 }
 
+/**
+ * enum drm_gpuvm_flags - flags for struct drm_gpuvm
+ */
+enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_USERBITS: user defined bits
+	 */
+	DRM_GPUVM_USERBITS = BIT(0),
+};
+
 /**
  * struct drm_gpuvm - DRM GPU VA Manager
  *
@@ -202,6 +212,11 @@ struct drm_gpuvm {
 	 */
 	const char *name;
 
+	/**
+	 * @flags: the &drm_gpuvm_flags of this GPUVM
+	 */
+	enum drm_gpuvm_flags flags;
+
 	/**
 	 * @drm: the &drm_device this VM lives in
 	 */
@@ -252,6 +267,7 @@ struct drm_gpuvm {
 };
 
 void drm_gpuvm_init(struct drm_gpuvm *gpuvm, const char *name,
+		    enum drm_gpuvm_flags flags,
 		    struct drm_device *drm,
 		    struct drm_gem_object *r_obj,
 		    u64 start_offset, u64 range,
-- 
2.41.0

