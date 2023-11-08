Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2737E4DD6
	for <lists+nouveau@lfdr.de>; Wed,  8 Nov 2023 01:13:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67F1510E6E6;
	Wed,  8 Nov 2023 00:13:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA0410E6D4
 for <nouveau@lists.freedesktop.org>; Wed,  8 Nov 2023 00:13:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699402414;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/rUnejLivcp+1pgsAJMK6hCdtub7G+FOLPdRk/JythY=;
 b=XdmI4FeBHaNuud6U3oY1ZHv7HVwq/IDqTLCbOvLhLVsbdeojiZ8Jgws5bcbZyJCX1Citv2
 ORYLQKWvY/RX3QGKy3txbLT+sfauVXH0mw63x/+1fzVqpLrrFjcE93nDM0LeSM0iH1fx8o
 B5eJ+l6+/00cU7kRNOrDViaDAKMrRQ8=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-371-jUNL7yUvNbqjhFT3oVnYAw-1; Tue, 07 Nov 2023 19:13:33 -0500
X-MC-Unique: jUNL7yUvNbqjhFT3oVnYAw-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5079fe7cc7cso7308234e87.2
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 16:13:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699402412; x=1700007212;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/rUnejLivcp+1pgsAJMK6hCdtub7G+FOLPdRk/JythY=;
 b=BH4s0TEA+cr/U2O3TRaNZ/mj9Sr6hUZ/pIoeg6Kno+GBC+Mi+fmYyezLXQPshQi+Mm
 zudr+6GwN/Frt7sTThd4uD1xggK4beukTWDDhZZmZ27gpdrA2LRG1IPwT0rft9Fs8flg
 iA5+YQGoR9IhU6zkBkeJMLef+HQF8txejKfEUsDjIDdVR3zZ3KgPuXVJc356LB0VUU9D
 ZNaw7iXAsJiEsH3jMitm3NpBxOSyDxDA5BP/lDWK/tw3a5YQysoyfjj7bqV53gqd1RKV
 5JRK0LYtBW6+oqJvL+tZb/QkcuQ2mlaPeVJuhg5s0u7xNl1JhlzbolYULeTI/+5a8Fy0
 v23w==
X-Gm-Message-State: AOJu0Yx2fW86zi+c64bz8xwV6HXmGNRwpAvW8Trlxq8l50AyS0ZgPfHM
 q73zP2JsvognDIPuuONTaUW29+bkUKeUyngLHN7WY2oaDdE9e5solFjnNSBbs774V2BGTQgm7CA
 Zb+gRHOrp+Cdc04j1dVubMKDRtQ==
X-Received: by 2002:a05:6512:2214:b0:507:a0d6:f178 with SMTP id
 h20-20020a056512221400b00507a0d6f178mr101849lfu.35.1699402412100; 
 Tue, 07 Nov 2023 16:13:32 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEqd3iecwEQ83+LkgL/Gz7YDyOoiLYWSDs+taZUp6p/v0wWOmuE0D28NCKhsaj7mP0WtG5u8g==
X-Received: by 2002:a05:6512:2214:b0:507:a0d6:f178 with SMTP id
 h20-20020a056512221400b00507a0d6f178mr101837lfu.35.1699402411811; 
 Tue, 07 Nov 2023 16:13:31 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v23-20020a50d597000000b0053dd8898f75sm6119229edi.81.2023.11.07.16.13.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 16:13:31 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Wed,  8 Nov 2023 01:12:38 +0100
Message-ID: <20231108001259.15123-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231108001259.15123-1-dakr@redhat.com>
References: <20231108001259.15123-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v9 08/12] drm/nouveau: separately
 allocate struct nouveau_uvmm
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
 dri-devel@lists.freedesktop.org, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Allocate struct nouveau_uvmm separately in preparation for subsequent
commits introducing reference counting for struct drm_gpuvm.

While at it, get rid of nouveau_uvmm_init() as indirection of
nouveau_uvmm_ioctl_vm_init() and perform some minor cleanups.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c  |  5 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  | 10 ++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 63 +++++++++++++-------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  4 --
 4 files changed, 40 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 50589f982d1a..f603eaef1560 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -190,6 +190,8 @@ nouveau_cli_work_queue(struct nouveau_cli *cli, struct dma_fence *fence,
 static void
 nouveau_cli_fini(struct nouveau_cli *cli)
 {
+	struct nouveau_uvmm *uvmm = nouveau_cli_uvmm_locked(cli);
+
 	/* All our channels are dead now, which means all the fences they
 	 * own are signalled, and all callback functions have been called.
 	 *
@@ -199,7 +201,8 @@ nouveau_cli_fini(struct nouveau_cli *cli)
 	WARN_ON(!list_empty(&cli->worker));
 
 	usif_client_fini(cli);
-	nouveau_uvmm_fini(&cli->uvmm);
+	if (uvmm)
+		nouveau_uvmm_fini(uvmm);
 	nouveau_sched_entity_fini(&cli->sched_entity);
 	nouveau_vmm_fini(&cli->svm);
 	nouveau_vmm_fini(&cli->vmm);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 3666a7403e47..e514110bf391 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -93,7 +93,10 @@ struct nouveau_cli {
 	struct nvif_mmu mmu;
 	struct nouveau_vmm vmm;
 	struct nouveau_vmm svm;
-	struct nouveau_uvmm uvmm;
+	struct {
+		struct nouveau_uvmm *ptr;
+		bool disabled;
+	} uvmm;
 
 	struct nouveau_sched_entity sched_entity;
 
@@ -121,10 +124,7 @@ struct nouveau_cli_work {
 static inline struct nouveau_uvmm *
 nouveau_cli_uvmm(struct nouveau_cli *cli)
 {
-	if (!cli || !cli->uvmm.vmm.cli)
-		return NULL;
-
-	return &cli->uvmm;
+	return cli ? cli->uvmm.ptr : NULL;
 }
 
 static inline struct nouveau_uvmm *
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index f765e3835306..54be12c1272f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1636,18 +1636,6 @@ nouveau_uvmm_bind_job_init(struct nouveau_uvmm_bind_job **pjob,
 	return ret;
 }
 
-int
-nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
-			   void *data,
-			   struct drm_file *file_priv)
-{
-	struct nouveau_cli *cli = nouveau_cli(file_priv);
-	struct drm_nouveau_vm_init *init = data;
-
-	return nouveau_uvmm_init(&cli->uvmm, cli, init->kernel_managed_addr,
-				 init->kernel_managed_size);
-}
-
 static int
 nouveau_uvmm_vm_bind(struct nouveau_uvmm_bind_job_args *args)
 {
@@ -1793,17 +1781,25 @@ nouveau_uvmm_bo_unmap_all(struct nouveau_bo *nvbo)
 }
 
 int
-nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
-		  u64 kernel_managed_addr, u64 kernel_managed_size)
+nouveau_uvmm_ioctl_vm_init(struct drm_device *dev,
+			   void *data,
+			   struct drm_file *file_priv)
 {
+	struct nouveau_uvmm *uvmm;
+	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct drm_device *drm = cli->drm->dev;
 	struct drm_gem_object *r_obj;
-	u64 kernel_managed_end = kernel_managed_addr + kernel_managed_size;
+	struct drm_nouveau_vm_init *init = data;
+	u64 kernel_managed_end;
 	int ret;
 
-	mutex_init(&uvmm->mutex);
-	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
-	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+	if (check_add_overflow(init->kernel_managed_addr,
+			       init->kernel_managed_size,
+			       &kernel_managed_end))
+		return -EINVAL;
+
+	if (kernel_managed_end > NOUVEAU_VA_SPACE_END)
+		return -EINVAL;
 
 	mutex_lock(&cli->mutex);
 
@@ -1812,44 +1808,49 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	if (kernel_managed_end <= kernel_managed_addr) {
-		ret = -EINVAL;
-		goto out_unlock;
-	}
-
-	if (kernel_managed_end > NOUVEAU_VA_SPACE_END) {
-		ret = -EINVAL;
+	uvmm = kzalloc(sizeof(*uvmm), GFP_KERNEL);
+	if (!uvmm) {
+		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
 	r_obj = drm_gpuvm_resv_object_alloc(drm);
 	if (!r_obj) {
+		kfree(uvmm);
 		ret = -ENOMEM;
 		goto out_unlock;
 	}
 
+	mutex_init(&uvmm->mutex);
+	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
+	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
+
 	drm_gpuvm_init(&uvmm->base, cli->name, 0, drm, r_obj,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
-		       kernel_managed_addr, kernel_managed_size,
+		       init->kernel_managed_addr,
+		       init->kernel_managed_size,
 		       NULL);
 	/* GPUVM takes care from here on. */
 	drm_gem_object_put(r_obj);
 
 	ret = nvif_vmm_ctor(&cli->mmu, "uvmm",
 			    cli->vmm.vmm.object.oclass, RAW,
-			    kernel_managed_addr, kernel_managed_size,
-			    NULL, 0, &cli->uvmm.vmm.vmm);
+			    init->kernel_managed_addr,
+			    init->kernel_managed_size,
+			    NULL, 0, &uvmm->vmm.vmm);
 	if (ret)
 		goto out_gpuvm_fini;
 
-	cli->uvmm.vmm.cli = cli;
+	uvmm->vmm.cli = cli;
+	cli->uvmm.ptr = uvmm;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
 out_gpuvm_fini:
 	drm_gpuvm_destroy(&uvmm->base);
+	kfree(uvmm);
 out_unlock:
 	mutex_unlock(&cli->mutex);
 	return ret;
@@ -1864,9 +1865,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	struct nouveau_sched_entity *entity = &cli->sched_entity;
 	struct drm_gpuva *va, *next;
 
-	if (!cli)
-		return;
-
 	rmb(); /* for list_empty to work without lock */
 	wait_event(entity->job.wq, list_empty(&entity->job.list.head));
 
@@ -1905,5 +1903,6 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	mutex_lock(&cli->mutex);
 	nouveau_vmm_fini(&uvmm->vmm);
 	drm_gpuvm_destroy(&uvmm->base);
+	kfree(uvmm);
 	mutex_unlock(&cli->mutex);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 22607270fae0..f0a6d98ace4f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -12,8 +12,6 @@ struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
 	struct maple_tree region_mt;
 	struct mutex mutex;
-
-	bool disabled;
 };
 
 struct nouveau_uvma_region {
@@ -78,8 +76,6 @@ struct nouveau_uvmm_bind_job_args {
 
 #define to_uvmm_bind_job(job) container_of((job), struct nouveau_uvmm_bind_job, base)
 
-int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
-		      u64 kernel_managed_addr, u64 kernel_managed_size);
 void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
 
 void nouveau_uvmm_bo_map_all(struct nouveau_bo *nvbov, struct nouveau_mem *mem);
-- 
2.41.0

