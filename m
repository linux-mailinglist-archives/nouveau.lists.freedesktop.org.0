Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 89EFB7BD135
	for <lists+nouveau@lfdr.de>; Mon,  9 Oct 2023 01:32:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 811B710E1A9;
	Sun,  8 Oct 2023 23:32:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A79B410E19A
 for <nouveau@lists.freedesktop.org>; Sun,  8 Oct 2023 23:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696807960;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=AhD6ZC3iGBzPWvT8PElG1SxOfr5EHAC4vZ+6Lwjv84w=;
 b=dSlogQniXW0oMhyeqTFSNgierKm5gen48KfNXMaZxYrOFjmVnnLnjOMBFV7FRl0hevNacW
 8GPQziQldBEbuYMpDXHAhVdnD+Pg5XrNEBit6oPl/D5rfh16FZo9fRsgiAWFd/Y/J2sTJi
 yTd8EBSBGtXzH3zIemymbxGqj1ad8lQ=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-588-lmtJAfrXPc2to1pDI3024A-1; Sun, 08 Oct 2023 19:32:39 -0400
X-MC-Unique: lmtJAfrXPc2to1pDI3024A-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-9b822f5c156so325411966b.3
 for <nouveau@lists.freedesktop.org>; Sun, 08 Oct 2023 16:32:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696807958; x=1697412758;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AhD6ZC3iGBzPWvT8PElG1SxOfr5EHAC4vZ+6Lwjv84w=;
 b=w0I7TvZG1ljb4tHxI83U1/p0MpzNC/+onL5KbNxRdQoZXqJrwkwCTpnX0BLcRiztxK
 NYYzKsADLQ01EYhDYyeyXnGnjxwihO1qeqPCwhK9e+fnJDuXz3lKa+4BNzqedBzhVDb9
 lXymB5LBwZKaTic4/psSUClJZjPodBicKxOte5iuIW/0+f423lrxuJvpbyBRsq1krEzb
 w+rsVrRYN7a9NWazWfu2ZKSHD47Pxdro85xkWDmakkwAcbfdY334hPO1z++pEEPVNs3i
 X08eZukq/vJl1x8tvJ3NKtj9xmv1OvQrD46uuCSkLlV8NhWXF7DYSZJAroHdI1NheRIu
 FqtA==
X-Gm-Message-State: AOJu0YwredtRbEfmt1FSconpEoYNhoFXbKZ/IJCMusALRaUhoY9IHwt4
 qaQBja3lvTAYLmgVogoJ3/835M7CLY6JV70AFZimwx8tPFQPk63eMsMw7W5ItxfMCiiXQASIdWa
 sOCnfi2vS+ONGRlEvW32kmEjH/Q==
X-Received: by 2002:a17:906:3156:b0:9b2:b71f:83be with SMTP id
 e22-20020a170906315600b009b2b71f83bemr12122080eje.1.1696807958058; 
 Sun, 08 Oct 2023 16:32:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWUfvC3fL0X75r2MYsMfgxAnjN7YwEtChtLsKpVpzfPnKaj7CEno2LVg0jOaSF8wZRn8IYyw==
X-Received: by 2002:a17:906:3156:b0:9b2:b71f:83be with SMTP id
 e22-20020a170906315600b009b2b71f83bemr12122066eje.1.1696807957814; 
 Sun, 08 Oct 2023 16:32:37 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 oy3-20020a170907104300b009ae482d70besm5950668ejb.134.2023.10.08.16.32.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Oct 2023 16:32:37 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Mon,  9 Oct 2023 01:32:05 +0200
Message-ID: <20231008233212.13815-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231008233212.13815-1-dakr@redhat.com>
References: <20231008233212.13815-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v6 5/6] drm/nouveau: make use of the
 GPUVM's shared dma-resv
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

DRM GEM objects private to a single GPUVM can use a shared dma-resv.
Make use of the shared dma-resv of GPUVM rather than a driver specific
one.

The shared dma-resv originates from a "root" GEM object serving as
container for the dma-resv to make it compatible with drm_exec.

In order to make sure the object proving the shared dma-resv can't be
freed up before the objects making use of it, let every such GEM object
take a reference on it.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   | 11 +++++++++--
 drivers/gpu/drm/nouveau/nouveau_bo.h   |  5 +++++
 drivers/gpu/drm/nouveau/nouveau_gem.c  | 10 ++++++++--
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  7 ++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  1 -
 5 files changed, 24 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 19cab37ac69c..dbb3facfd23d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -148,10 +148,17 @@ nouveau_bo_del_ttm(struct ttm_buffer_object *bo)
 	 * If nouveau_bo_new() allocated this buffer, the GEM object was never
 	 * initialized, so don't attempt to release it.
 	 */
-	if (bo->base.dev)
+	if (bo->base.dev) {
+		/* Gem objects not being shared with other VMs get their
+		 * dma_resv from a root GEM object.
+		 */
+		if (nvbo->no_share)
+			drm_gem_object_put(nvbo->r_obj);
+
 		drm_gem_object_release(&bo->base);
-	else
+	} else {
 		dma_resv_fini(&bo->base._resv);
+	}
 
 	kfree(nvbo);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index 07f671cf895e..70c551921a9e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -26,6 +26,11 @@ struct nouveau_bo {
 	struct list_head entry;
 	int pbbo_index;
 	bool validate_mapped;
+
+	/* Root GEM object we derive the dma_resv of in case this BO is not
+	 * shared between VMs.
+	 */
+	struct drm_gem_object *r_obj;
 	bool no_share;
 
 	/* GPU address space is independent of CPU word size */
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index c0b10d8d3d03..7715baf85c7e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -111,7 +111,8 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	if (vmm->vmm.object.oclass < NVIF_CLASS_VMM_NV50)
 		return 0;
 
-	if (nvbo->no_share && uvmm && &uvmm->resv != nvbo->bo.base.resv)
+	if (nvbo->no_share && uvmm &&
+	    drm_gpuvm_resv(&uvmm->base) != nvbo->bo.base.resv)
 		return -EPERM;
 
 	ret = ttm_bo_reserve(&nvbo->bo, false, false, NULL);
@@ -245,7 +246,7 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 		if (unlikely(!uvmm))
 			return -EINVAL;
 
-		resv = &uvmm->resv;
+		resv = drm_gpuvm_resv(&uvmm->base);
 	}
 
 	if (!(domain & (NOUVEAU_GEM_DOMAIN_VRAM | NOUVEAU_GEM_DOMAIN_GART)))
@@ -288,6 +289,11 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int align, uint32_t domain,
 	if (drm->client.device.info.family >= NV_DEVICE_INFO_V0_TESLA)
 		nvbo->valid_domains &= domain;
 
+	if (nvbo->no_share) {
+		nvbo->r_obj = drm_gpuvm_resv_obj(&uvmm->base);
+		drm_gem_object_get(nvbo->r_obj);
+	}
+
 	*pnvbo = nvbo;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 4e46f850e65f..436b0ac74ffe 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -1841,7 +1841,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 	int ret;
 
 	mutex_init(&uvmm->mutex);
-	dma_resv_init(&uvmm->resv);
 	mt_init_flags(&uvmm->region_mt, MT_FLAGS_LOCK_EXTERN);
 	mt_set_external_lock(&uvmm->region_mt, &uvmm->mutex);
 
@@ -1884,14 +1883,14 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 			    kernel_managed_addr, kernel_managed_size,
 			    NULL, 0, &cli->uvmm.vmm.vmm);
 	if (ret)
-		goto out_free_gpuva_mgr;
+		goto out_gpuvm_fini;
 
 	cli->uvmm.vmm.cli = cli;
 	mutex_unlock(&cli->mutex);
 
 	return 0;
 
-out_free_gpuva_mgr:
+out_gpuvm_fini:
 	drm_gpuvm_destroy(&uvmm->base);
 out_unlock:
 	mutex_unlock(&cli->mutex);
@@ -1949,6 +1948,4 @@ nouveau_uvmm_fini(struct nouveau_uvmm *uvmm)
 	nouveau_vmm_fini(&uvmm->vmm);
 	drm_gpuvm_destroy(&uvmm->base);
 	mutex_unlock(&cli->mutex);
-
-	dma_resv_fini(&uvmm->resv);
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index a308c59760a5..878cc7958483 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -12,7 +12,6 @@ struct nouveau_uvmm {
 	struct nouveau_vmm vmm;
 	struct maple_tree region_mt;
 	struct mutex mutex;
-	struct dma_resv resv;
 
 	u64 kernel_managed_addr;
 	u64 kernel_managed_size;
-- 
2.41.0

