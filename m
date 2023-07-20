Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44DDF75A32A
	for <lists+nouveau@lfdr.de>; Thu, 20 Jul 2023 02:15:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF85410E534;
	Thu, 20 Jul 2023 00:15:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0FF8B10E537
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=DNvPFmPephzOlef4HOM2AR90BUKB3CUNAq245FGhm7Y=;
 b=OYfJ3xU1q3aYAcK9nXohvO0ZXo2sjaZ68zB9cSk9drdVzSHC9PN5bj6Zk1O5VtnmiICWl0
 /cpcPG96AQfOZ33sHoiVE+9MxNPEED+Eba4a2jQ1djXk5s/1ThYVEG5nLeK65gSQOHKcFj
 ZftcqiCoPkFh1KAmG/31bNHhwBOccN0=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-505-l81HXr3OPAmp7bDTI4dE4A-1; Wed, 19 Jul 2023 20:15:15 -0400
X-MC-Unique: l81HXr3OPAmp7bDTI4dE4A-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-97542592eb9so13824266b.2
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812114; x=1692404114;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DNvPFmPephzOlef4HOM2AR90BUKB3CUNAq245FGhm7Y=;
 b=PDB5VcdNotSCgvRPQ3c9Tt2aYNHr/X2Y7kxeM9N9rFDn9kXALWpRxihg58ElejvP1X
 zTrSydDHJWeAQubrxgCR/87VXX9R+5bleLUQyUCB1LZjT4eLDYDyEbleODOqR7QzGLUj
 G1vWl4inGqTqmRzRfYD8IUzX78gWpT4RL6UEI2JR5aI1Ig3LjapiO9SSUNT1dZgSP9cP
 1kUsmSHe8wX7Ib3b9uV2DA4vltyjeLKSRe+DpmJa/sYjXrdeoK/kmNucXE+GkAKuoeGg
 1SHSIwEV9RgP9Z+OI2SqIDdUmHnGf7hATjqpNAOa/ciqHrT1lQxkWSffJ68eftrLpvYp
 IRow==
X-Gm-Message-State: ABy/qLYr5shvWg9Ud5rTaFODN91VXsngWSi/m7x+4Y9F+rx5b/q7e8JB
 uW45D3QCeBmvooipq00Otv/BbfpdWWDTHkS8KW5FDLV+447L1vSHnDE9qJGoPTirbhk6G42nc8J
 MluX5QDk04ZVjclDmNFW4cWfCpg==
X-Received: by 2002:a17:907:3e18:b0:982:caf9:126 with SMTP id
 hp24-20020a1709073e1800b00982caf90126mr4684527ejc.42.1689812113884; 
 Wed, 19 Jul 2023 17:15:13 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF1daekZZFBLbfCaLfLyJMueWXBADd4k886Efz58JfzCtV37i77go/TCfVUi/G0/Sk8GqFq8Q==
X-Received: by 2002:a17:907:3e18:b0:982:caf9:126 with SMTP id
 hp24-20020a1709073e1800b00982caf90126mr4684505ejc.42.1689812113522; 
 Wed, 19 Jul 2023 17:15:13 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 pj20-20020a170906d79400b00993664a9987sm2975604ejb.103.2023.07.19.17.15.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:13 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu, 20 Jul 2023 02:14:25 +0200
Message-ID: <20230720001443.2380-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v8 04/12] drm/nouveau: get vmm via
 nouveau_cli_vmm()
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
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Provide a getter function for the client's current vmm context. Since
we'll add a new (u)vmm context for UMD bindings in subsequent commits,
this will keep the code clean.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bo.c   | 2 +-
 drivers/gpu/drm/nouveau/nouveau_chan.c | 2 +-
 drivers/gpu/drm/nouveau/nouveau_drv.h  | 9 +++++++++
 drivers/gpu/drm/nouveau/nouveau_gem.c  | 6 +++---
 4 files changed, 14 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index c2ec91cc845d..7724fe63067d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -204,7 +204,7 @@ nouveau_bo_alloc(struct nouveau_cli *cli, u64 *size, int *align, u32 domain,
 	struct nouveau_drm *drm = cli->drm;
 	struct nouveau_bo *nvbo;
 	struct nvif_mmu *mmu = &cli->mmu;
-	struct nvif_vmm *vmm = cli->svm.cli ? &cli->svm.vmm : &cli->vmm.vmm;
+	struct nvif_vmm *vmm = &nouveau_cli_vmm(cli)->vmm;
 	int i, pi = -1;
 
 	if (!*size) {
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index e648ecd0c1a0..1068abe41024 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -148,7 +148,7 @@ nouveau_channel_prep(struct nouveau_drm *drm, struct nvif_device *device,
 
 	chan->device = device;
 	chan->drm = drm;
-	chan->vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
+	chan->vmm = nouveau_cli_vmm(cli);
 	atomic_set(&chan->killed, 0);
 
 	/* allocate memory for dma push buffer */
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index b5de312a523f..81350e685b50 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -112,6 +112,15 @@ struct nouveau_cli_work {
 	struct dma_fence_cb cb;
 };
 
+static inline struct nouveau_vmm *
+nouveau_cli_vmm(struct nouveau_cli *cli)
+{
+	if (cli->svm.cli)
+		return &cli->svm;
+
+	return &cli->vmm;
+}
+
 void nouveau_cli_work_queue(struct nouveau_cli *, struct dma_fence *,
 			    struct nouveau_cli_work *);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index ab9062e50977..45ca4eb98f54 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -103,7 +103,7 @@ nouveau_gem_object_open(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct device *dev = drm->dev->dev;
-	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
 
@@ -180,7 +180,7 @@ nouveau_gem_object_close(struct drm_gem_object *gem, struct drm_file *file_priv)
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
 	struct nouveau_drm *drm = nouveau_bdev(nvbo->bo.bdev);
 	struct device *dev = drm->dev->dev;
-	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : & cli->vmm;
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 	int ret;
 
@@ -269,7 +269,7 @@ nouveau_gem_info(struct drm_file *file_priv, struct drm_gem_object *gem,
 {
 	struct nouveau_cli *cli = nouveau_cli(file_priv);
 	struct nouveau_bo *nvbo = nouveau_gem_object(gem);
-	struct nouveau_vmm *vmm = cli->svm.cli ? &cli->svm : &cli->vmm;
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
 	struct nouveau_vma *vma;
 
 	if (is_power_of_2(nvbo->valid_domains))
-- 
2.41.0

