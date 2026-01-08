Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 347FDD042D0
	for <lists+nouveau@lfdr.de>; Thu, 08 Jan 2026 17:07:55 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id AFA0010E7A9;
	Thu,  8 Jan 2026 16:07:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=google.com header.i=@google.com header.b="wmNqJ90z";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id C599F44C7B;
	Thu,  8 Jan 2026 15:59:32 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767887972;
 b=CmuHMzmAKvZM5cyJ7VP7AOPa3464BfkomoP2wF144HfnwDdBfMBIn/qOyNWFlmX5659bZ
 1IxRIcPlvnvHZmJJhwX0KxI53gOhb3YTxrt5HCg70lX9OGWqxrDZJ5OFEPLnJk7Xrf+gaI7
 5cgwaN3M+vwdy43cNeFqLI/e0+p7kL3yhmw3FvV2nlKi1WkgjuB0DrO2TfLU7btWhVWRSRN
 9jiDEkljDuxekYs/vT5ALxclgu2BiTyfhTwKwON1UBedifkdsEr1C3Y0xgVLJmW/4Cd5Sl2
 ptkADjSaIlZt+LRRttDjOG2F5wu/DgKv79HK+qadKSuBRWA4R4OprrPewsrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767887972; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=t5f5dl5do6LbBTrB6/kS4ElTAjp4/y/e46MsHfzdtHU=;
 b=kRAXG00j6H7MJucrJ+RBW1l5qBSe8TzmbtIyi3QKq2NVEiHGqqW/ndCw6Rdnr32bYIGif
 nvVwg9EtHvUbmYyQboyPv5ziMfGbusK7dfdLcYOyoCaXcx3FmzelcolJ406hGliDVxAQqV/
 p1eiPfKWtwC0YEBwfi0I9P6h7gjPwKvoVapIXG6WIIb+Np7XJJL1fyv4go4H2EAzK15WlaG
 44nbJjMW4V8nN8lzR3t+avGgj/0npcNtor1Db7xfUzfHAu4uux4yuEKQY5RUjmglDqhxCo9
 s0c0gA+xIFdpg1jVFdVq+4ctCWYC+0w4bvzbrIhempr1fPabB/L91G/hsw/Q==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=google.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=google.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=google.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 3508444C69
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 15:59:30 +0000 (UTC)
Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com
 [209.85.221.74])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 195C610E794
	for <nouveau@lists.freedesktop.org>; Thu,  8 Jan 2026 16:07:47 +0000 (UTC)
Received: by mail-wr1-f74.google.com with SMTP id
 ffacd0b85a97d-430fd96b440so1714164f8f.1
        for <nouveau@lists.freedesktop.org>;
 Thu, 08 Jan 2026 08:07:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767888466; x=1768493266;
 darn=lists.freedesktop.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=t5f5dl5do6LbBTrB6/kS4ElTAjp4/y/e46MsHfzdtHU=;
        b=wmNqJ90zQ5Y27ki77o33EjazcisXQq2Qxl5+1WSFrZ8SDZho0q2c+1aA32pP7kgJo5
         QiJk4gXP0376fLTBkuyTvVsbAJa9Fb/XDTir15zr83WZ7EjYXNuY82un5aeefNN6pLD2
         WlDebHhWjkEt80eXeYaCDozj5OZNG4UnBoZdHGw/vm1gFAqBvXUg0uy4kYkAOyTcb8hU
         2/0IW8A/9NwDGAwGOzgm27pdo56p5HRNTinX7YPdRd1KgK+WnfjM8ACf7Hv58V6BYRrn
         qEtMDxK0CDEvqCVrCO9IRVygi8Cd5hDOeCnvmkYoFbCdLqOkD2lDlgYsvQpHSUa0d15v
         FQug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767888466; x=1768493266;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t5f5dl5do6LbBTrB6/kS4ElTAjp4/y/e46MsHfzdtHU=;
        b=ZJFhWTggnX0JlyNWDgCbCLv4az76XWK/9yWRmpmD7gjweG22AkTbb+tqzuLKcXPdnN
         L15KJkRoRFDJWw+C1QuHW6Dp/lmjzImVaBSodgibub6iidR7BCYfO0V8er2I4yfkxCSf
         qgKT+WMY8n1LTCoJOgbEEAZFU1BfDihjhwvCoczd4jNiWRCnOUcoC6ja6BJNQs+6tlzH
         bSrg/sPcUaedSZg77JCpzRvVpwfMq3UvV3G6NdhLnVoRl1sKpUkCLdh+xom6YlJO2gcu
         RgOS+olysYqzjTcJqtObrFm0iaakKEiTE9CKL9TBgPEju8BVAivKK9E85zGWDg/qzTse
         I+Gw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+W2XdBtOX4tdR5mkv/nykyKVxSw2tgoQ8kO9YRQKEEjAOiNtXFTtoAJY01CUtSZIKdgQq/mXb@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyxmQQQA6DeOV/jeWRjpWjSzyDPsNZjciSdacsjtwfsP2tAUgwZ
	mU8FaUlTgjon5+7tGTovoQ/xmPYDsB8C63++BH+VadT735DGEk+yD8/HQyzs7D2Zgf0YDVRaKjM
	rW3IK1Fcy6xVUzNII2Q==
X-Google-Smtp-Source: 
 AGHT+IGrRvlMAYGpdYKPwIt18IZ/QB5z+1D75flywOH0oYNCOMGvV6DAXfU/soiruiJho4QBBeaWGd5VhlYhyx8=
X-Received: from wmot13.prod.google.com
 ([2002:a05:600c:450d:b0:477:aa1e:920c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b33:b0:47a:81b7:9a20 with SMTP id
 5b1f17b1804b1-47d84b19f5emr73879175e9.9.1767888465737;
 Thu, 08 Jan 2026 08:07:45 -0800 (PST)
Date: Thu, 08 Jan 2026 16:07:32 +0000
In-Reply-To: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
Mime-Version: 1.0
References: <20260108-gpuvm-rust-v2-0-dbd014005a0b@google.com>
X-Developer-Key: i=aliceryhl@google.com; a=openpgp;
 fpr=49F6C1FAA74960F43A5B86A1EE7A392FDE96209F
X-Developer-Signature: v=1; a=openpgp-sha256; l=6841; i=aliceryhl@google.com;
 h=from:subject:message-id; bh=kOPMqTsyPdJtTu+kHbIrT/g3rtE4MKWOeM6qXQOCcWs=;
 b=owEBbQKS/ZANAwAKAQRYvu5YxjlGAcsmYgBpX9ZNgKuHvWAexmI6VcN4uOdOglWHTyyqLkRBu
 rK7gV4sCTmJAjMEAAEKAB0WIQSDkqKUTWQHCvFIvbIEWL7uWMY5RgUCaV/WTQAKCRAEWL7uWMY5
 RljpD/0Q7viWv+HOdpsS1rQCOpVXCNgk+CErBBoM4a20FdyQX/tj6ShFWLubq5GUkRStohlkSHO
 6sYtsHJWiYFn/yyNmKnpcwlFa+ehPABimqJGV02QX+LUWK926CqNj1e0SCq8EkYsXKjXlL+nsGk
 QstHmYU9FfBD6O3ZG53Uzd2wtdIQaynYKu6wEGdPE0sUa2jtmy532PvikZNzbkxkIwzY/aXtXfG
 XMIiFTpY7TvxZRO5gJ3QKus13gd/lX2Tl8/A3eSQXhcR0OAb8RKFuvXzGRqsVSCtYqgoab/XOka
 fogQimTvWEj36FSRl1JeulnFFI+wsvJYqLD2S/MMdBZbLni2Kop9PnJp4BslFysu2QlKvJmwofd
 qU2e6Gp7qCNQ8iQiFZYN97ngOCT7isHM5gjtv1ghR3LRChdaiA/UgVhsxTQcslkqwPhZ1CNHRVZ
 7R8OzVBlmjFlgVmop6f6FyWnuTEsMZALnEin55e7afAInuEMafRR/q7m7HuX648l+o6gzr57BWX
 htQHjXURPQSiaVkELHvYS6nrAWA+jVJBDK2Pt8lBf3gK39QvV0wsQLZBVJw30T4dnQo5OKxmOuV
 iiLa+yQTk/78FK+6D+lSLjAHT+43FkYq02RxgWdfhuPToxso2/Od/hdcyDn0PfedzhN3n2my27b
 l7ELT57ErOP9Ovw==
X-Mailer: b4 0.14.2
Message-ID: <20260108-gpuvm-rust-v2-2-dbd014005a0b@google.com>
Subject: [PATCH v2 2/3] drm/gpuvm: drm_gpuvm_bo_obtain() requires lock and
 staged mode
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>,
 Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="utf-8"
Message-ID-Hash: GIVA7GS76U2RKVBYDLUR4KLU6HHWB2D7
X-Message-ID-Hash: GIVA7GS76U2RKVBYDLUR4KLU6HHWB2D7
X-MailFrom: 
 3UdZfaQkKB84u52wyBI1508805y.w8678EFyuE52CDC.zByyxyC4D89.8B0@flex--aliceryhl.bounces.google.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Matthew Brost <matthew.brost@intel.com>,
 =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Boris Brezillon <boris.brezillon@collabora.com>,
 Steven Price <steven.price@arm.com>, Liviu Dudau <liviu.dudau@arm.com>,
 Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>,
 Gary Guo <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Trevor Gross <tmgross@umich.edu>, Frank Binns <frank.binns@imgtec.com>,
 Matt Coster <matt.coster@imgtec.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, linux-media@vger.kernel.org,
 Alice Ryhl <aliceryhl@google.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/GIVA7GS76U2RKVBYDLUR4KLU6HHWB2D7/>
Archived-At: 
 <https://lore.freedesktop.org/20260108-gpuvm-rust-v2-2-dbd014005a0b@google.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

In the previous commit we updated drm_gpuvm_bo_obtain_prealloc() to take
locks internally, which means that it's only usable in immediate mode.
In this commit, we notice that drm_gpuvm_bo_obtain() requires you to use
staged mode. This means that we now have one variant of obtain for each
mode you might use gpuvm in.

To reflect this information, we add a warning about using it in
immediate mode, and to make the distinction clearer we rename the method
with a _locked() suffix so that it's clear that it requires the caller
to take the locks.

Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Alice Ryhl <aliceryhl@google.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 16 +++++++++++++---
 drivers/gpu/drm/imagination/pvr_vm.c   |  2 +-
 drivers/gpu/drm/msm/msm_gem.h          |  2 +-
 drivers/gpu/drm/msm/msm_gem_vma.c      |  2 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  2 +-
 drivers/gpu/drm/xe/xe_vm.c             |  4 ++--
 include/drm/drm_gpuvm.h                |  4 ++--
 7 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 0de47e83d84df11a53e40fe82d069882e46149b6..37f0d97f653466285f036a5bf0246a5fea0234cd 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -1844,16 +1844,26 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
  * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
  * &drm_gpuvm_bo.
  *
+ * Requires the lock for the GEMs gpuva list.
+ *
  * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
  *
  * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
  */
 struct drm_gpuvm_bo *
-drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
-		    struct drm_gem_object *obj)
+drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
+			   struct drm_gem_object *obj)
 {
 	struct drm_gpuvm_bo *vm_bo;
 
+	/*
+	 * In immediate mode this would require the caller to hold the GEMs
+	 * gpuva mutex, but it's not okay to allocate while holding that lock,
+	 * and this method allocates. Immediate mode drivers should use
+	 * drm_gpuvm_bo_obtain_prealloc() instead.
+	 */
+	drm_WARN_ON(gpuvm->drm, drm_gpuvm_immediate_mode(gpuvm));
+
 	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
 	if (vm_bo)
 		return vm_bo;
@@ -1867,7 +1877,7 @@ drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
 
 	return vm_bo;
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_locked);
 
 /**
  * drm_gpuvm_bo_obtain_prealloc() - obtains an instance of the &drm_gpuvm_bo
diff --git a/drivers/gpu/drm/imagination/pvr_vm.c b/drivers/gpu/drm/imagination/pvr_vm.c
index 48e52c5561beb4ca3070ef3f2f4337225fafc124..9a9ad4e82305d23ce4741b59f09951265365c1de 100644
--- a/drivers/gpu/drm/imagination/pvr_vm.c
+++ b/drivers/gpu/drm/imagination/pvr_vm.c
@@ -256,7 +256,7 @@ pvr_vm_bind_op_map_init(struct pvr_vm_bind_op *bind_op,
 	bind_op->type = PVR_VM_BIND_TYPE_MAP;
 
 	dma_resv_lock(obj->resv, NULL);
-	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain(&vm_ctx->gpuvm_mgr, obj);
+	bind_op->gpuvm_bo = drm_gpuvm_bo_obtain_locked(&vm_ctx->gpuvm_mgr, obj);
 	dma_resv_unlock(obj->resv);
 	if (IS_ERR(bind_op->gpuvm_bo))
 		return PTR_ERR(bind_op->gpuvm_bo);
diff --git a/drivers/gpu/drm/msm/msm_gem.h b/drivers/gpu/drm/msm/msm_gem.h
index a4cf31853c5008e171c3ad72cde1004c60fe5212..26dfe3d22e3e847f7e63174481d03f72878a8ced 100644
--- a/drivers/gpu/drm/msm/msm_gem.h
+++ b/drivers/gpu/drm/msm/msm_gem.h
@@ -60,7 +60,7 @@ struct msm_gem_vm_log_entry {
  * embedded in any larger driver structure.  The GEM object holds a list of
  * drm_gpuvm_bo, which in turn holds a list of msm_gem_vma.  A linked vma
  * holds a reference to the vm_bo, and drops it when the vma is unlinked.
- * So we just need to call drm_gpuvm_bo_obtain() to return a ref to an
+ * So we just need to call drm_gpuvm_bo_obtain_locked() to return a ref to an
  * existing vm_bo, or create a new one.  Once the vma is linked, the ref
  * to the vm_bo can be dropped (since the vma is holding one).
  */
diff --git a/drivers/gpu/drm/msm/msm_gem_vma.c b/drivers/gpu/drm/msm/msm_gem_vma.c
index 71d5238437eb89b23c067cca3c01cb86c94b934b..71943104ce9fd01d89e781d41bf067a98a574c5f 100644
--- a/drivers/gpu/drm/msm/msm_gem_vma.c
+++ b/drivers/gpu/drm/msm/msm_gem_vma.c
@@ -413,7 +413,7 @@ msm_gem_vma_new(struct drm_gpuvm *gpuvm, struct drm_gem_object *obj,
 	if (!obj)
 		return &vma->base;
 
-	vm_bo = drm_gpuvm_bo_obtain(&vm->base, obj);
+	vm_bo = drm_gpuvm_bo_obtain_locked(&vm->base, obj);
 	if (IS_ERR(vm_bo)) {
 		ret = PTR_ERR(vm_bo);
 		goto err_va_remove;
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f10809115c563a12c6f6e798bf9fe77a0a3a993c..0d693760d2223be9a141ee4b8d820269ae4868b6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1275,7 +1275,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job,
 				return -ENOENT;
 
 			dma_resv_lock(obj->resv, NULL);
-			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
+			op->vm_bo = drm_gpuvm_bo_obtain_locked(&uvmm->base, obj);
 			dma_resv_unlock(obj->resv);
 			if (IS_ERR(op->vm_bo))
 				return PTR_ERR(op->vm_bo);
diff --git a/drivers/gpu/drm/xe/xe_vm.c b/drivers/gpu/drm/xe/xe_vm.c
index 7cac646bdf1c03689bca9511f5e1f40270811622..0e7f82eb38fc90e1b42ffc1cdf49a6b202fbb3e5 100644
--- a/drivers/gpu/drm/xe/xe_vm.c
+++ b/drivers/gpu/drm/xe/xe_vm.c
@@ -1022,7 +1022,7 @@ static struct xe_vma *xe_vma_create(struct xe_vm *vm,
 
 		xe_bo_assert_held(bo);
 
-		vm_bo = drm_gpuvm_bo_obtain(vma->gpuva.vm, &bo->ttm.base);
+		vm_bo = drm_gpuvm_bo_obtain_locked(vma->gpuva.vm, &bo->ttm.base);
 		if (IS_ERR(vm_bo)) {
 			xe_vma_free(vma);
 			return ERR_CAST(vm_bo);
@@ -2269,7 +2269,7 @@ vm_bind_ioctl_ops_create(struct xe_vm *vm, struct xe_vma_ops *vops,
 		if (err)
 			return ERR_PTR(err);
 
-		vm_bo = drm_gpuvm_bo_obtain(&vm->gpuvm, obj);
+		vm_bo = drm_gpuvm_bo_obtain_locked(&vm->gpuvm, obj);
 		if (IS_ERR(vm_bo)) {
 			xe_bo_unlock(bo);
 			return ERR_CAST(vm_bo);
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index fdfc575b260360611ff8ce16c327acede787929f..0d3fc1f6cac9966a42f3bc82b0b491bfefaf5b96 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -736,8 +736,8 @@ drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
 		    struct drm_gem_object *obj);
 
 struct drm_gpuvm_bo *
-drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
-		    struct drm_gem_object *obj);
+drm_gpuvm_bo_obtain_locked(struct drm_gpuvm *gpuvm,
+			   struct drm_gem_object *obj);
 struct drm_gpuvm_bo *
 drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
 

-- 
2.52.0.351.gbe84eed79e-goog

