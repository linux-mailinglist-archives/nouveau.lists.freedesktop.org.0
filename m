Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 855E57DE8F7
	for <lists+nouveau@lfdr.de>; Thu,  2 Nov 2023 00:32:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7815E10E7F2;
	Wed,  1 Nov 2023 23:32:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0474E10E7F3
 for <nouveau@lists.freedesktop.org>; Wed,  1 Nov 2023 23:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881520;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=VB94IULVj9Ldl9RgtLoNPuLTMGrJq4IiOi+AOe597Ps=;
 b=f5rGrC6VjQbKZwK67nz8XpH9NFh+L9Rrv4xN7Dc5RGBIrgak0drCmPwV37WKLrPeCSf1C1
 nU5KH8KcYOg3erpQ2qRnQtJE9Uq7EytDhhmfq2jvHA2daNfUiW8ahcZfOsteeOKQgZzXTd
 fF2yvbJNCIP/h6SBwnUIhxLdGM/CC/I=
Received: from mail-ed1-f69.google.com (mail-ed1-f69.google.com
 [209.85.208.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-642-uYZmyHieOhyWCN1gyBiNDA-1; Wed, 01 Nov 2023 19:31:58 -0400
X-MC-Unique: uYZmyHieOhyWCN1gyBiNDA-1
Received: by mail-ed1-f69.google.com with SMTP id
 4fb4d7f45d1cf-543d2bc7d9dso190887a12.1
 for <nouveau@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881517; x=1699486317;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VB94IULVj9Ldl9RgtLoNPuLTMGrJq4IiOi+AOe597Ps=;
 b=oIVN5iVldnqL5S5l9IWK3adoJxsPaRVn0Lx2PV9brEdrXYXMdaAGCVg9nCnwdnBVtS
 vGf9Rj/guS7+kKLhTjlf5+JY2U2hE3YUtk/QgWogpBft2C+AoLo6R4sjFcdTf8tdhvmI
 xPqf2vCVVRbepzc0YhxZUaFqY88TOjXyfiLFmO4gGDe7yK2zfy/ULAYry4M27rPEocjF
 ty+GBzr/uShE9EL9s693aOIdwcAeXFnu9rsBw1l4Mw4vWBl2urBJp0T39z8tlMNPRofC
 tSlPJx3/2dPKjyckQQp+cru09BKm5BG70JHixaLSHG3tksSb3RafprHyvn8V+cQf5b7U
 E5bA==
X-Gm-Message-State: AOJu0Yxi/9ZrjGQUU5hFG24Jvzmwmr8ICAU0jVBPysCETJoOc3HkGbOO
 kyjrQm2A+R6f6Q9lqp5ba+pCAJtpENGaTR4Vv4/5wqhrOahb5QpFA0Cy+VsYuJB9JHyCmlDxzos
 QKRC+t8A5wDfP2c+dCqTsTe3jLQ==
X-Received: by 2002:aa7:d50b:0:b0:53e:7d60:58bb with SMTP id
 y11-20020aa7d50b000000b0053e7d6058bbmr14128652edq.27.1698881517154; 
 Wed, 01 Nov 2023 16:31:57 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFHhwmrkZXOZq0XuLO/zq7Al8UEPtTNDKop3QFiollzU1vTvFb6z4/OxyYD/0g8gfZRZc5TsA==
X-Received: by 2002:aa7:d50b:0:b0:53e:7d60:58bb with SMTP id
 y11-20020aa7d50b000000b0053e7d6058bbmr14128633edq.27.1698881516751; 
 Wed, 01 Nov 2023 16:31:56 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 q32-20020a05640224a000b0054130b1bc77sm1604342eda.51.2023.11.01.16.31.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:56 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Thu,  2 Nov 2023 00:31:02 +0100
Message-ID: <20231101233113.8059-11-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH drm-misc-next v8 10/12] drm/gpuvm: add an
 abstraction for a VM / BO combination
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

Add an abstraction layer between the drm_gpuva mappings of a particular
drm_gem_object and this GEM object itself. The abstraction represents a
combination of a drm_gem_object and drm_gpuvm. The drm_gem_object holds
a list of drm_gpuvm_bo structures (the structure representing this
abstraction), while each drm_gpuvm_bo contains list of mappings of this
GEM object.

This has multiple advantages:

1) We can use the drm_gpuvm_bo structure to attach it to various lists
   of the drm_gpuvm. This is useful for tracking external and evicted
   objects per VM, which is introduced in subsequent patches.

2) Finding mappings of a certain drm_gem_object mapped in a certain
   drm_gpuvm becomes much cheaper.

3) Drivers can derive and extend the structure to easily represent
   driver specific states of a BO for a certain GPUVM.

The idea of this abstraction was taken from amdgpu, hence the credit for
this idea goes to the developers of amdgpu.

Cc: Christian König <christian.koenig@amd.com>
Reviewed-by: Boris Brezillon <boris.brezillon@collabora.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/drm_gpuvm.c            | 336 +++++++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  63 +++--
 include/drm/drm_gem.h                  |  32 +--
 include/drm/drm_gpuvm.h                | 185 +++++++++++++-
 4 files changed, 530 insertions(+), 86 deletions(-)

diff --git a/drivers/gpu/drm/drm_gpuvm.c b/drivers/gpu/drm/drm_gpuvm.c
index 6a88eafc5229..2c8fdefb19f0 100644
--- a/drivers/gpu/drm/drm_gpuvm.c
+++ b/drivers/gpu/drm/drm_gpuvm.c
@@ -70,6 +70,18 @@
  * &drm_gem_object, such as the &drm_gem_object containing the root page table,
  * but it can also be a 'dummy' object, which can be allocated with
  * drm_gpuvm_resv_object_alloc().
+ *
+ * In order to connect a struct drm_gpuva its backing &drm_gem_object each
+ * &drm_gem_object maintains a list of &drm_gpuvm_bo structures, and each
+ * &drm_gpuvm_bo contains a list of &drm_gpuva structures.
+ *
+ * A &drm_gpuvm_bo is an abstraction that represents a combination of a
+ * &drm_gpuvm and a &drm_gem_object. Every such combination should be unique.
+ * This is ensured by the API through drm_gpuvm_bo_obtain() and
+ * drm_gpuvm_bo_obtain_prealloc() which first look into the corresponding
+ * &drm_gem_object list of &drm_gpuvm_bos for an existing instance of this
+ * particular combination. If not existent a new instance is created and linked
+ * to the &drm_gem_object.
  */
 
 /**
@@ -395,21 +407,28 @@
 /**
  * DOC: Locking
  *
- * Generally, the GPU VA manager does not take care of locking itself, it is
- * the drivers responsibility to take care about locking. Drivers might want to
- * protect the following operations: inserting, removing and iterating
- * &drm_gpuva objects as well as generating all kinds of operations, such as
- * split / merge or prefetch.
- *
- * The GPU VA manager also does not take care of the locking of the backing
- * &drm_gem_object buffers GPU VA lists by itself; drivers are responsible to
- * enforce mutual exclusion using either the GEMs dma_resv lock or alternatively
- * a driver specific external lock. For the latter see also
- * drm_gem_gpuva_set_lock().
- *
- * However, the GPU VA manager contains lockdep checks to ensure callers of its
- * API hold the corresponding lock whenever the &drm_gem_objects GPU VA list is
- * accessed by functions such as drm_gpuva_link() or drm_gpuva_unlink().
+ * In terms of managing &drm_gpuva entries DRM GPUVM does not take care of
+ * locking itself, it is the drivers responsibility to take care about locking.
+ * Drivers might want to protect the following operations: inserting, removing
+ * and iterating &drm_gpuva objects as well as generating all kinds of
+ * operations, such as split / merge or prefetch.
+ *
+ * DRM GPUVM also does not take care of the locking of the backing
+ * &drm_gem_object buffers GPU VA lists and &drm_gpuvm_bo abstractions by
+ * itself; drivers are responsible to enforce mutual exclusion using either the
+ * GEMs dma_resv lock or alternatively a driver specific external lock. For the
+ * latter see also drm_gem_gpuva_set_lock().
+ *
+ * However, DRM GPUVM contains lockdep checks to ensure callers of its API hold
+ * the corresponding lock whenever the &drm_gem_objects GPU VA list is accessed
+ * by functions such as drm_gpuva_link() or drm_gpuva_unlink(), but also
+ * drm_gpuvm_bo_obtain() and drm_gpuvm_bo_put().
+ *
+ * The latter is required since on creation and destruction of a &drm_gpuvm_bo
+ * the &drm_gpuvm_bo is attached / removed from the &drm_gem_objects gpuva list.
+ * Subsequent calls to drm_gpuvm_bo_obtain() for the same &drm_gpuvm and
+ * &drm_gem_object must be able to observe previous creations and destructions
+ * of &drm_gpuvm_bos in order to keep instances unique.
  */
 
 /**
@@ -439,6 +458,7 @@
  *	{
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op
+ *		struct drm_gpuvm_bo *vm_bo;
  *
  *		driver_lock_va_space();
  *		ops = drm_gpuvm_sm_map_ops_create(gpuvm, addr, range,
@@ -446,6 +466,10 @@
  *		if (IS_ERR(ops))
  *			return PTR_ERR(ops);
  *
+ *		vm_bo = drm_gpuvm_bo_obtain(gpuvm, obj);
+ *		if (IS_ERR(vm_bo))
+ *			return PTR_ERR(vm_bo);
+ *
  *		drm_gpuva_for_each_op(op, ops) {
  *			struct drm_gpuva *va;
  *
@@ -458,7 +482,7 @@
  *
  *				driver_vm_map();
  *				drm_gpuva_map(gpuvm, va, &op->map);
- *				drm_gpuva_link(va);
+ *				drm_gpuva_link(va, vm_bo);
  *
  *				break;
  *			case DRM_GPUVA_OP_REMAP: {
@@ -485,11 +509,11 @@
  *				driver_vm_remap();
  *				drm_gpuva_remap(prev, next, &op->remap);
  *
- *				drm_gpuva_unlink(va);
  *				if (prev)
- *					drm_gpuva_link(prev);
+ *					drm_gpuva_link(prev, va->vm_bo);
  *				if (next)
- *					drm_gpuva_link(next);
+ *					drm_gpuva_link(next, va->vm_bo);
+ *				drm_gpuva_unlink(va);
  *
  *				break;
  *			}
@@ -505,6 +529,7 @@
  *				break;
  *			}
  *		}
+ *		drm_gpuvm_bo_put(vm_bo);
  *		driver_unlock_va_space();
  *
  *		return 0;
@@ -514,6 +539,7 @@
  *
  *	struct driver_context {
  *		struct drm_gpuvm *gpuvm;
+ *		struct drm_gpuvm_bo *vm_bo;
  *		struct drm_gpuva *new_va;
  *		struct drm_gpuva *prev_va;
  *		struct drm_gpuva *next_va;
@@ -534,6 +560,7 @@
  *				  struct drm_gem_object *obj, u64 offset)
  *	{
  *		struct driver_context ctx;
+ *		struct drm_gpuvm_bo *vm_bo;
  *		struct drm_gpuva_ops *ops;
  *		struct drm_gpuva_op *op;
  *		int ret = 0;
@@ -543,16 +570,23 @@
  *		ctx.new_va = kzalloc(sizeof(*ctx.new_va), GFP_KERNEL);
  *		ctx.prev_va = kzalloc(sizeof(*ctx.prev_va), GFP_KERNEL);
  *		ctx.next_va = kzalloc(sizeof(*ctx.next_va), GFP_KERNEL);
- *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va) {
+ *		ctx.vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
+ *		if (!ctx.new_va || !ctx.prev_va || !ctx.next_va || !vm_bo) {
  *			ret = -ENOMEM;
  *			goto out;
  *		}
  *
+ *		// Typically protected with a driver specific GEM gpuva lock
+ *		// used in the fence signaling path for drm_gpuva_link() and
+ *		// drm_gpuva_unlink(), hence pre-allocate.
+ *		ctx.vm_bo = drm_gpuvm_bo_obtain_prealloc(ctx.vm_bo);
+ *
  *		driver_lock_va_space();
  *		ret = drm_gpuvm_sm_map(gpuvm, &ctx, addr, range, obj, offset);
  *		driver_unlock_va_space();
  *
  *	out:
+ *		drm_gpuvm_bo_put(ctx.vm_bo);
  *		kfree(ctx.new_va);
  *		kfree(ctx.prev_va);
  *		kfree(ctx.next_va);
@@ -565,7 +599,7 @@
  *
  *		drm_gpuva_map(ctx->vm, ctx->new_va, &op->map);
  *
- *		drm_gpuva_link(ctx->new_va);
+ *		drm_gpuva_link(ctx->new_va, ctx->vm_bo);
  *
  *		// prevent the new GPUVA from being freed in
  *		// driver_mapping_create()
@@ -577,22 +611,23 @@
  *	int driver_gpuva_remap(struct drm_gpuva_op *op, void *__ctx)
  *	{
  *		struct driver_context *ctx = __ctx;
+ *		struct drm_gpuva *va = op->remap.unmap->va;
  *
  *		drm_gpuva_remap(ctx->prev_va, ctx->next_va, &op->remap);
  *
- *		drm_gpuva_unlink(op->remap.unmap->va);
- *		kfree(op->remap.unmap->va);
- *
  *		if (op->remap.prev) {
- *			drm_gpuva_link(ctx->prev_va);
+ *			drm_gpuva_link(ctx->prev_va, va->vm_bo);
  *			ctx->prev_va = NULL;
  *		}
  *
  *		if (op->remap.next) {
- *			drm_gpuva_link(ctx->next_va);
+ *			drm_gpuva_link(ctx->next_va, va->vm_bo);
  *			ctx->next_va = NULL;
  *		}
  *
+ *		drm_gpuva_unlink(va);
+ *		kfree(va);
+ *
  *		return 0;
  *	}
  *
@@ -813,6 +848,195 @@ drm_gpuvm_put(struct drm_gpuvm *gpuvm)
 }
 EXPORT_SYMBOL_GPL(drm_gpuvm_put);
 
+/**
+ * drm_gpuvm_bo_create() - create a new instance of struct drm_gpuvm_bo
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * If provided by the driver, this function uses the &drm_gpuvm_ops
+ * vm_bo_alloc() callback to allocate.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gpuvm_bo *vm_bo;
+
+	if (ops && ops->vm_bo_alloc)
+		vm_bo = ops->vm_bo_alloc();
+	else
+		vm_bo = kzalloc(sizeof(*vm_bo), GFP_KERNEL);
+
+	if (unlikely(!vm_bo))
+		return NULL;
+
+	vm_bo->vm = drm_gpuvm_get(gpuvm);
+	vm_bo->obj = obj;
+	drm_gem_object_get(obj);
+
+	kref_init(&vm_bo->kref);
+	INIT_LIST_HEAD(&vm_bo->list.gpuva);
+	INIT_LIST_HEAD(&vm_bo->list.entry.gem);
+
+	return vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_create);
+
+static void
+drm_gpuvm_bo_destroy(struct kref *kref)
+{
+	struct drm_gpuvm_bo *vm_bo = container_of(kref, struct drm_gpuvm_bo,
+						  kref);
+	struct drm_gpuvm *gpuvm = vm_bo->vm;
+	const struct drm_gpuvm_ops *ops = gpuvm->ops;
+	struct drm_gem_object *obj = vm_bo->obj;
+	bool lock = !drm_gpuvm_resv_protected(gpuvm);
+
+	if (!lock)
+		drm_gpuvm_resv_assert_held(gpuvm);
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_del(&vm_bo->list.entry.gem);
+
+	if (ops && ops->vm_bo_free)
+		ops->vm_bo_free(vm_bo);
+	else
+		kfree(vm_bo);
+
+	drm_gpuvm_put(gpuvm);
+	drm_gem_object_put(obj);
+}
+
+/**
+ * drm_gpuvm_bo_put() - drop a struct drm_gpuvm_bo reference
+ * @vm_bo: the &drm_gpuvm_bo to release the reference of
+ *
+ * This releases a reference to @vm_bo.
+ *
+ * If the reference count drops to zero, the &gpuvm_bo is destroyed, which
+ * includes removing it from the GEMs gpuva list. Hence, if a call to this
+ * function can potentially let the reference count to zero the caller must
+ * hold the dma-resv or driver specific GEM gpuva lock.
+ */
+void
+drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo)
+{
+	if (vm_bo)
+		kref_put(&vm_bo->kref, drm_gpuvm_bo_destroy);
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_put);
+
+static struct drm_gpuvm_bo *
+__drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj)
+		if (vm_bo->vm == gpuvm)
+			return vm_bo;
+
+	return NULL;
+}
+
+/**
+ * drm_gpuvm_bo_find() - find the &drm_gpuvm_bo for the given
+ * &drm_gpuvm and &drm_gem_object
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the &drm_gpuvm_bo accordingly.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, NULL on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo = __drm_gpuvm_bo_find(gpuvm, obj);
+
+	return vm_bo ? drm_gpuvm_bo_get(vm_bo) : NULL;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_find);
+
+/**
+ * drm_gpuvm_bo_obtain() - obtains and instance of the &drm_gpuvm_bo for the
+ * given &drm_gpuvm and &drm_gem_object
+ * @gpuvm: The &drm_gpuvm the @obj is mapped in.
+ * @obj: The &drm_gem_object being mapped in the @gpuvm.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the &drm_gpuvm_bo accordingly. If not found, allocates a new
+ * &drm_gpuvm_bo.
+ *
+ * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
+ *
+ * Returns: a pointer to the &drm_gpuvm_bo on success, an ERR_PTR on failure
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj)
+{
+	struct drm_gpuvm_bo *vm_bo;
+
+	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
+	if (vm_bo)
+		return vm_bo;
+
+	vm_bo = drm_gpuvm_bo_create(gpuvm, obj);
+	if (!vm_bo)
+		return ERR_PTR(-ENOMEM);
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_add_tail(&vm_bo->list.entry.gem, &obj->gpuva.list);
+
+	return vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain);
+
+/**
+ * drm_gpuvm_bo_obtain_prealloc() - obtains and instance of the &drm_gpuvm_bo
+ * for the given &drm_gpuvm and &drm_gem_object
+ * @__vm_bo: A pre-allocated struct drm_gpuvm_bo.
+ *
+ * Find the &drm_gpuvm_bo representing the combination of the given
+ * &drm_gpuvm and &drm_gem_object. If found, increases the reference
+ * count of the found &drm_gpuvm_bo accordingly, while the @__vm_bo reference
+ * count is decreased. If not found @__vm_bo is returned without further
+ * increase of the reference count.
+ *
+ * A new &drm_gpuvm_bo is added to the GEMs gpuva list.
+ *
+ * Returns: a pointer to the found &drm_gpuvm_bo or @__vm_bo if no existing
+ * &drm_gpuvm_bo was found
+ */
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *__vm_bo)
+{
+	struct drm_gpuvm *gpuvm = __vm_bo->vm;
+	struct drm_gem_object *obj = __vm_bo->obj;
+	struct drm_gpuvm_bo *vm_bo;
+
+	vm_bo = drm_gpuvm_bo_find(gpuvm, obj);
+	if (vm_bo) {
+		drm_gpuvm_bo_put(__vm_bo);
+		return vm_bo;
+	}
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_add_tail(&__vm_bo->list.entry.gem, &obj->gpuva.list);
+
+	return __vm_bo;
+}
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_obtain_prealloc);
+
 static int
 __drm_gpuva_insert(struct drm_gpuvm *gpuvm,
 		   struct drm_gpuva *va)
@@ -904,24 +1128,33 @@ EXPORT_SYMBOL_GPL(drm_gpuva_remove);
 /**
  * drm_gpuva_link() - link a &drm_gpuva
  * @va: the &drm_gpuva to link
+ * @vm_bo: the &drm_gpuvm_bo to add the &drm_gpuva to
  *
- * This adds the given &va to the GPU VA list of the &drm_gem_object it is
- * associated with.
+ * This adds the given &va to the GPU VA list of the &drm_gpuvm_bo and the
+ * &drm_gpuvm_bo to the &drm_gem_object it is associated with.
+ *
+ * For every &drm_gpuva entry added to the &drm_gpuvm_bo an additional
+ * reference of the latter is taken.
  *
  * This function expects the caller to protect the GEM's GPUVA list against
- * concurrent access using the GEMs dma_resv lock.
+ * concurrent access using either the GEMs dma_resv lock or a driver specific
+ * lock set through drm_gem_gpuva_set_lock().
  */
 void
-drm_gpuva_link(struct drm_gpuva *va)
+drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gem_object *obj = va->gem.obj;
+	struct drm_gpuvm *gpuvm = va->vm;
 
 	if (unlikely(!obj))
 		return;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	drm_WARN_ON(gpuvm->drm, obj != vm_bo->obj);
 
-	list_add_tail(&va->gem.entry, &obj->gpuva.list);
+	va->vm_bo = drm_gpuvm_bo_get(vm_bo);
+
+	drm_gem_gpuva_assert_lock_held(obj);
+	list_add_tail(&va->gem.entry, &vm_bo->list.gpuva);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_link);
 
@@ -932,20 +1165,31 @@ EXPORT_SYMBOL_GPL(drm_gpuva_link);
  * This removes the given &va from the GPU VA list of the &drm_gem_object it is
  * associated with.
  *
+ * This removes the given &va from the GPU VA list of the &drm_gpuvm_bo and
+ * the &drm_gpuvm_bo from the &drm_gem_object it is associated with in case
+ * this call unlinks the last &drm_gpuva from the &drm_gpuvm_bo.
+ *
+ * For every &drm_gpuva entry removed from the &drm_gpuvm_bo a reference of
+ * the latter is dropped.
+ *
  * This function expects the caller to protect the GEM's GPUVA list against
- * concurrent access using the GEMs dma_resv lock.
+ * concurrent access using either the GEMs dma_resv lock or a driver specific
+ * lock set through drm_gem_gpuva_set_lock().
  */
 void
 drm_gpuva_unlink(struct drm_gpuva *va)
 {
 	struct drm_gem_object *obj = va->gem.obj;
+	struct drm_gpuvm_bo *vm_bo = va->vm_bo;
 
 	if (unlikely(!obj))
 		return;
 
 	drm_gem_gpuva_assert_lock_held(obj);
-
 	list_del_init(&va->gem.entry);
+
+	va->vm_bo = NULL;
+	drm_gpuvm_bo_put(vm_bo);
 }
 EXPORT_SYMBOL_GPL(drm_gpuva_unlink);
 
@@ -1090,10 +1334,10 @@ drm_gpuva_remap(struct drm_gpuva *prev,
 		struct drm_gpuva *next,
 		struct drm_gpuva_op_remap *op)
 {
-	struct drm_gpuva *curr = op->unmap->va;
-	struct drm_gpuvm *gpuvm = curr->vm;
+	struct drm_gpuva *va = op->unmap->va;
+	struct drm_gpuvm *gpuvm = va->vm;
 
-	drm_gpuva_remove(curr);
+	drm_gpuva_remove(va);
 
 	if (op->prev) {
 		drm_gpuva_init_from_op(prev, op->prev);
@@ -1735,9 +1979,8 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
 
 /**
- * drm_gpuvm_gem_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
- * @gpuvm: the &drm_gpuvm representing the GPU VA space
- * @obj: the &drm_gem_object to unmap
+ * drm_gpuvm_bo_unmap_ops_create() - creates the &drm_gpuva_ops to unmap a GEM
+ * @vm_bo: the &drm_gpuvm_bo abstraction
  *
  * This function creates a list of operations to perform unmapping for every
  * GPUVA attached to a GEM.
@@ -1754,15 +1997,14 @@ EXPORT_SYMBOL_GPL(drm_gpuvm_prefetch_ops_create);
  * Returns: a pointer to the &drm_gpuva_ops on success, an ERR_PTR on failure
  */
 struct drm_gpuva_ops *
-drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
-			       struct drm_gem_object *obj)
+drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo)
 {
 	struct drm_gpuva_ops *ops;
 	struct drm_gpuva_op *op;
 	struct drm_gpuva *va;
 	int ret;
 
-	drm_gem_gpuva_assert_lock_held(obj);
+	drm_gem_gpuva_assert_lock_held(vm_bo->obj);
 
 	ops = kzalloc(sizeof(*ops), GFP_KERNEL);
 	if (!ops)
@@ -1770,8 +2012,8 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 
 	INIT_LIST_HEAD(&ops->list);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		op = gpuva_op_alloc(gpuvm);
+	drm_gpuvm_bo_for_each_va(va, vm_bo) {
+		op = gpuva_op_alloc(vm_bo->vm);
 		if (!op) {
 			ret = -ENOMEM;
 			goto err_free_ops;
@@ -1785,10 +2027,10 @@ drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
 	return ops;
 
 err_free_ops:
-	drm_gpuva_ops_free(gpuvm, ops);
+	drm_gpuva_ops_free(vm_bo->vm, ops);
 	return ERR_PTR(ret);
 }
-EXPORT_SYMBOL_GPL(drm_gpuvm_gem_unmap_ops_create);
+EXPORT_SYMBOL_GPL(drm_gpuvm_bo_unmap_ops_create);
 
 /**
  * drm_gpuva_ops_free() - free the given &drm_gpuva_ops
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index cb2f06565c46..eda7bb8624f1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -62,6 +62,8 @@ struct bind_job_op {
 	enum vm_bind_op op;
 	u32 flags;
 
+	struct drm_gpuvm_bo *vm_bo;
+
 	struct {
 		u64 addr;
 		u64 range;
@@ -1101,22 +1103,28 @@ bind_validate_region(struct nouveau_job *job)
 }
 
 static void
-bind_link_gpuvas(struct drm_gpuva_ops *ops, struct nouveau_uvma_prealloc *new)
+bind_link_gpuvas(struct bind_job_op *bop)
 {
+	struct nouveau_uvma_prealloc *new = &bop->new;
+	struct drm_gpuvm_bo *vm_bo = bop->vm_bo;
+	struct drm_gpuva_ops *ops = bop->ops;
 	struct drm_gpuva_op *op;
 
 	drm_gpuva_for_each_op(op, ops) {
 		switch (op->op) {
 		case DRM_GPUVA_OP_MAP:
-			drm_gpuva_link(&new->map->va);
+			drm_gpuva_link(&new->map->va, vm_bo);
 			break;
-		case DRM_GPUVA_OP_REMAP:
+		case DRM_GPUVA_OP_REMAP: {
+			struct drm_gpuva *va = op->remap.unmap->va;
+
 			if (op->remap.prev)
-				drm_gpuva_link(&new->prev->va);
+				drm_gpuva_link(&new->prev->va, va->vm_bo);
 			if (op->remap.next)
-				drm_gpuva_link(&new->next->va);
-			drm_gpuva_unlink(op->remap.unmap->va);
+				drm_gpuva_link(&new->next->va, va->vm_bo);
+			drm_gpuva_unlink(va);
 			break;
+		}
 		case DRM_GPUVA_OP_UNMAP:
 			drm_gpuva_unlink(op->unmap.va);
 			break;
@@ -1138,10 +1146,17 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 
 	list_for_each_op(op, &bind_job->ops) {
 		if (op->op == OP_MAP) {
-			op->gem.obj = drm_gem_object_lookup(job->file_priv,
-							    op->gem.handle);
-			if (!op->gem.obj)
+			struct drm_gem_object *obj = op->gem.obj =
+				drm_gem_object_lookup(job->file_priv,
+						      op->gem.handle);
+			if (!obj)
 				return -ENOENT;
+
+			dma_resv_lock(obj->resv, NULL);
+			op->vm_bo = drm_gpuvm_bo_obtain(&uvmm->base, obj);
+			dma_resv_unlock(obj->resv);
+			if (IS_ERR(op->vm_bo))
+				return PTR_ERR(op->vm_bo);
 		}
 
 		ret = bind_validate_op(job, op);
@@ -1352,7 +1367,7 @@ nouveau_uvmm_bind_job_submit(struct nouveau_job *job)
 		case OP_UNMAP_SPARSE:
 		case OP_MAP:
 		case OP_UNMAP:
-			bind_link_gpuvas(op->ops, &op->new);
+			bind_link_gpuvas(op);
 			break;
 		default:
 			break;
@@ -1499,6 +1514,12 @@ nouveau_uvmm_bind_job_free_work_fn(struct work_struct *work)
 		if (!IS_ERR_OR_NULL(op->ops))
 			drm_gpuva_ops_free(&uvmm->base, op->ops);
 
+		if (!IS_ERR_OR_NULL(op->vm_bo)) {
+			dma_resv_lock(obj->resv, NULL);
+			drm_gpuvm_bo_put(op->vm_bo);
+			dma_resv_unlock(obj->resv);
+		}
+
 		if (obj)
 			drm_gem_object_put(obj);
 	}
@@ -1752,15 +1773,18 @@ void
 nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbo, struct nouveau_mem *mem)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuvm_bo *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_map(uvma, mem);
-		drm_gpuva_invalidate(va, false);
+			nouveau_uvma_map(uvma, mem);
+			drm_gpuva_invalidate(va, false);
+		}
 	}
 }
 
@@ -1768,15 +1792,18 @@ void
 nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 {
 	struct drm_gem_object *obj = &nvbo->bo.base;
+	struct drm_gpuvm_bo *vm_bo;
 	struct drm_gpuva *va;
 
 	dma_resv_assert_held(obj->resv);
 
-	drm_gem_for_each_gpuva(va, obj) {
-		struct nouveau_uvma *uvma = uvma_from_va(va);
+	drm_gem_for_each_gpuvm_bo(vm_bo, obj) {
+		drm_gpuvm_bo_for_each_va(va, vm_bo) {
+			struct nouveau_uvma *uvma = uvma_from_va(va);
 
-		nouveau_uvma_unmap(uvma);
-		drm_gpuva_invalidate(va, true);
+			nouveau_uvma_unmap(uvma);
+			drm_gpuva_invalidate(va, true);
+		}
 	}
 }
 
diff --git a/include/drm/drm_gem.h b/include/drm/drm_gem.h
index 16364487fde9..369505447acd 100644
--- a/include/drm/drm_gem.h
+++ b/include/drm/drm_gem.h
@@ -580,7 +580,7 @@ int drm_gem_evict(struct drm_gem_object *obj);
  * drm_gem_gpuva_init() - initialize the gpuva list of a GEM object
  * @obj: the &drm_gem_object
  *
- * This initializes the &drm_gem_object's &drm_gpuva list.
+ * This initializes the &drm_gem_object's &drm_gpuvm_bo list.
  *
  * Calling this function is only necessary for drivers intending to support the
  * &drm_driver_feature DRIVER_GEM_GPUVA.
@@ -593,28 +593,28 @@ static inline void drm_gem_gpuva_init(struct drm_gem_object *obj)
 }
 
 /**
- * drm_gem_for_each_gpuva() - iternator to walk over a list of gpuvas
- * @entry__: &drm_gpuva structure to assign to in each iteration step
- * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ * drm_gem_for_each_gpuvm_bo() - iterator to walk over a list of &drm_gpuvm_bo
+ * @entry__: &drm_gpuvm_bo structure to assign to in each iteration step
+ * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are associated with
  *
- * This iterator walks over all &drm_gpuva structures associated with the
- * &drm_gpuva_manager.
+ * This iterator walks over all &drm_gpuvm_bo structures associated with the
+ * &drm_gem_object.
  */
-#define drm_gem_for_each_gpuva(entry__, obj__) \
-	list_for_each_entry(entry__, &(obj__)->gpuva.list, gem.entry)
+#define drm_gem_for_each_gpuvm_bo(entry__, obj__) \
+	list_for_each_entry(entry__, &(obj__)->gpuva.list, list.entry.gem)
 
 /**
- * drm_gem_for_each_gpuva_safe() - iternator to safely walk over a list of
- * gpuvas
- * @entry__: &drm_gpuva structure to assign to in each iteration step
- * @next__: &next &drm_gpuva to store the next step
- * @obj__: the &drm_gem_object the &drm_gpuvas to walk are associated with
+ * drm_gem_for_each_gpuvm_bo_safe() - iterator to safely walk over a list of
+ * &drm_gpuvm_bo
+ * @entry__: &drm_gpuvm_bostructure to assign to in each iteration step
+ * @next__: &next &drm_gpuvm_bo to store the next step
+ * @obj__: the &drm_gem_object the &drm_gpuvm_bo to walk are associated with
  *
- * This iterator walks over all &drm_gpuva structures associated with the
+ * This iterator walks over all &drm_gpuvm_bo structures associated with the
  * &drm_gem_object. It is implemented with list_for_each_entry_safe(), hence
  * it is save against removal of elements.
  */
-#define drm_gem_for_each_gpuva_safe(entry__, next__, obj__) \
-	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, gem.entry)
+#define drm_gem_for_each_gpuvm_bo_safe(entry__, next__, obj__) \
+	list_for_each_entry_safe(entry__, next__, &(obj__)->gpuva.list, list.entry.gem)
 
 #endif /* __DRM_GEM_H__ */
diff --git a/include/drm/drm_gpuvm.h b/include/drm/drm_gpuvm.h
index 4e6e1fd3485a..b12fb22b0e22 100644
--- a/include/drm/drm_gpuvm.h
+++ b/include/drm/drm_gpuvm.h
@@ -25,6 +25,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 
+#include <linux/dma-resv.h>
 #include <linux/list.h>
 #include <linux/rbtree.h>
 #include <linux/types.h>
@@ -33,6 +34,7 @@
 #include <drm/drm_gem.h>
 
 struct drm_gpuvm;
+struct drm_gpuvm_bo;
 struct drm_gpuvm_ops;
 
 /**
@@ -73,6 +75,12 @@ struct drm_gpuva {
 	 */
 	struct drm_gpuvm *vm;
 
+	/**
+	 * @vm_bo: the &drm_gpuvm_bo abstraction for the mapped
+	 * &drm_gem_object
+	 */
+	struct drm_gpuvm_bo *vm_bo;
+
 	/**
 	 * @flags: the &drm_gpuva_flags for this mapping
 	 */
@@ -108,7 +116,7 @@ struct drm_gpuva {
 		struct drm_gem_object *obj;
 
 		/**
-		 * @entry: the &list_head to attach this object to a &drm_gem_object
+		 * @entry: the &list_head to attach this object to a &drm_gpuvm_bo
 		 */
 		struct list_head entry;
 	} gem;
@@ -141,7 +149,7 @@ struct drm_gpuva {
 int drm_gpuva_insert(struct drm_gpuvm *gpuvm, struct drm_gpuva *va);
 void drm_gpuva_remove(struct drm_gpuva *va);
 
-void drm_gpuva_link(struct drm_gpuva *va);
+void drm_gpuva_link(struct drm_gpuva *va, struct drm_gpuvm_bo *vm_bo);
 void drm_gpuva_unlink(struct drm_gpuva *va);
 
 struct drm_gpuva *drm_gpuva_find(struct drm_gpuvm *gpuvm,
@@ -188,10 +196,16 @@ static inline bool drm_gpuva_invalidated(struct drm_gpuva *va)
  * enum drm_gpuvm_flags - flags for struct drm_gpuvm
  */
 enum drm_gpuvm_flags {
+	/**
+	 * @DRM_GPUVM_RESV_PROTECTED: GPUVM is protected externally by the
+	 * GPUVM's &dma_resv lock
+	 */
+	DRM_GPUVM_RESV_PROTECTED = BIT(0),
+
 	/**
 	 * @DRM_GPUVM_USERBITS: user defined bits
 	 */
-	DRM_GPUVM_USERBITS = BIT(0),
+	DRM_GPUVM_USERBITS = BIT(1),
 };
 
 /**
@@ -302,6 +316,19 @@ bool drm_gpuvm_interval_empty(struct drm_gpuvm *gpuvm, u64 addr, u64 range);
 struct drm_gem_object *
 drm_gpuvm_resv_object_alloc(struct drm_device *drm);
 
+/**
+ * drm_gpuvm_resv_protected() - indicates whether &DRM_GPUVM_RESV_PROTECTED is
+ * set
+ * @gpuvm: the &drm_gpuvm
+ *
+ * Returns: true if &DRM_GPUVM_RESV_PROTECTED is set, false otherwise.
+ */
+static inline bool
+drm_gpuvm_resv_protected(struct drm_gpuvm *gpuvm)
+{
+	return gpuvm->flags & DRM_GPUVM_RESV_PROTECTED;
+}
+
 /**
  * drm_gpuvm_resv() - returns the &drm_gpuvm's &dma_resv
  * @gpuvm__: the &drm_gpuvm
@@ -320,6 +347,12 @@ drm_gpuvm_resv_object_alloc(struct drm_device *drm);
  */
 #define drm_gpuvm_resv_obj(gpuvm__) ((gpuvm__)->r_obj)
 
+#define drm_gpuvm_resv_held(gpuvm__) \
+	dma_resv_held(drm_gpuvm_resv(gpuvm__))
+
+#define drm_gpuvm_resv_assert_held(gpuvm__) \
+	dma_resv_assert_held(drm_gpuvm_resv(gpuvm__))
+
 #define drm_gpuvm_resv_held(gpuvm__) \
 	dma_resv_held(drm_gpuvm_resv(gpuvm__))
 
@@ -404,6 +437,125 @@ __drm_gpuva_next(struct drm_gpuva *va)
 #define drm_gpuvm_for_each_va_safe(va__, next__, gpuvm__) \
 	list_for_each_entry_safe(va__, next__, &(gpuvm__)->rb.list, rb.entry)
 
+/**
+ * struct drm_gpuvm_bo - structure representing a &drm_gpuvm and
+ * &drm_gem_object combination
+ *
+ * This structure is an abstraction representing a &drm_gpuvm and
+ * &drm_gem_object combination. It serves as an indirection to accelerate
+ * iterating all &drm_gpuvas within a &drm_gpuvm backed by the same
+ * &drm_gem_object.
+ *
+ * Furthermore it is used cache evicted GEM objects for a certain GPU-VM to
+ * accelerate validation.
+ *
+ * Typically, drivers want to create an instance of a struct drm_gpuvm_bo once
+ * a GEM object is mapped first in a GPU-VM and release the instance once the
+ * last mapping of the GEM object in this GPU-VM is unmapped.
+ */
+struct drm_gpuvm_bo {
+	/**
+	 * @vm: The &drm_gpuvm the @obj is mapped in. This is a reference
+	 * counted pointer.
+	 */
+	struct drm_gpuvm *vm;
+
+	/**
+	 * @obj: The &drm_gem_object being mapped in @vm. This is a reference
+	 * counted pointer.
+	 */
+	struct drm_gem_object *obj;
+
+	/**
+	 * @kref: The reference count for this &drm_gpuvm_bo.
+	 */
+	struct kref kref;
+
+	/**
+	 * @list: Structure containing all &list_heads.
+	 */
+	struct {
+		/**
+		 * @gpuva: The list of linked &drm_gpuvas.
+		 *
+		 * It is safe to access entries from this list as long as the
+		 * GEM's gpuva lock is held. See also struct drm_gem_object.
+		 */
+		struct list_head gpuva;
+
+		/**
+		 * @entry: Structure containing all &list_heads serving as
+		 * entry.
+		 */
+		struct {
+			/**
+			 * @gem: List entry to attach to the &drm_gem_objects
+			 * gpuva list.
+			 */
+			struct list_head gem;
+		} entry;
+	} list;
+};
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_create(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj);
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain(struct drm_gpuvm *gpuvm,
+		    struct drm_gem_object *obj);
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_obtain_prealloc(struct drm_gpuvm_bo *vm_bo);
+
+/**
+ * drm_gpuvm_bo_get() - acquire a struct drm_gpuvm_bo reference
+ * @vm_bo: the &drm_gpuvm_bo to acquire the reference of
+ *
+ * This function acquires an additional reference to @vm_bo. It is illegal to
+ * call this without already holding a reference. No locks required.
+ */
+static inline struct drm_gpuvm_bo *
+drm_gpuvm_bo_get(struct drm_gpuvm_bo *vm_bo)
+{
+	kref_get(&vm_bo->kref);
+	return vm_bo;
+}
+
+void drm_gpuvm_bo_put(struct drm_gpuvm_bo *vm_bo);
+
+struct drm_gpuvm_bo *
+drm_gpuvm_bo_find(struct drm_gpuvm *gpuvm,
+		  struct drm_gem_object *obj);
+
+/**
+ * drm_gpuvm_bo_for_each_va() - iterator to walk over a list of &drm_gpuva
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @vm_bo__: the &drm_gpuvm_bo the &drm_gpuva to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuvm_bo.
+ *
+ * The caller must hold the GEM's gpuva lock.
+ */
+#define drm_gpuvm_bo_for_each_va(va__, vm_bo__) \
+	list_for_each_entry(va__, &(vm_bo)->list.gpuva, gem.entry)
+
+/**
+ * drm_gpuvm_bo_for_each_va_safe() - iterator to safely walk over a list of
+ * &drm_gpuva
+ * @va__: &drm_gpuva structure to assign to in each iteration step
+ * @next__: &next &drm_gpuva to store the next step
+ * @vm_bo__: the &drm_gpuvm_bo the &drm_gpuva to walk are associated with
+ *
+ * This iterator walks over all &drm_gpuva structures associated with the
+ * &drm_gpuvm_bo. It is implemented with list_for_each_entry_safe(), hence
+ * it is save against removal of elements.
+ *
+ * The caller must hold the GEM's gpuva lock.
+ */
+#define drm_gpuvm_bo_for_each_va_safe(va__, next__, vm_bo__) \
+	list_for_each_entry_safe(va__, next__, &(vm_bo)->list.gpuva, gem.entry)
+
 /**
  * enum drm_gpuva_op_type - GPU VA operation type
  *
@@ -673,8 +825,7 @@ drm_gpuvm_prefetch_ops_create(struct drm_gpuvm *gpuvm,
 				 u64 addr, u64 range);
 
 struct drm_gpuva_ops *
-drm_gpuvm_gem_unmap_ops_create(struct drm_gpuvm *gpuvm,
-			       struct drm_gem_object *obj);
+drm_gpuvm_bo_unmap_ops_create(struct drm_gpuvm_bo *vm_bo);
 
 void drm_gpuva_ops_free(struct drm_gpuvm *gpuvm,
 			struct drm_gpuva_ops *ops);
@@ -726,6 +877,30 @@ struct drm_gpuvm_ops {
 	 */
 	void (*op_free)(struct drm_gpuva_op *op);
 
+	/**
+	 * @vm_bo_alloc: called when the &drm_gpuvm allocates
+	 * a struct drm_gpuvm_bo
+	 *
+	 * Some drivers may want to embed struct drm_gpuvm_bo into driver
+	 * specific structures. By implementing this callback drivers can
+	 * allocate memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	struct drm_gpuvm_bo *(*vm_bo_alloc)(void);
+
+	/**
+	 * @vm_bo_free: called when the &drm_gpuvm frees a
+	 * struct drm_gpuvm_bo
+	 *
+	 * Some drivers may want to embed struct drm_gpuvm_bo into driver
+	 * specific structures. By implementing this callback drivers can
+	 * free the previously allocated memory accordingly.
+	 *
+	 * This callback is optional.
+	 */
+	void (*vm_bo_free)(struct drm_gpuvm_bo *vm_bo);
+
 	/**
 	 * @sm_step_map: called from &drm_gpuvm_sm_map to finally insert the
 	 * mapping once all previous steps were completed
-- 
2.41.0

