Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F91772AF3
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 18:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 500E110E2C2;
	Mon,  7 Aug 2023 16:33:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E61310E2C6
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 16:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425985;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+2S62aAs2pHMB7uH7IHyHCrQs/gKhwqzaa+nqwK3QP4=;
 b=LzwaNVl0C24eIYDAEJ41C1W67CUiBNtEjCfFjycNylGIO4F/NF/xsBZtru9vC314yFtBb+
 aVITiY70U911lpdxwSQSnJSKIdTVZwd1wdV86eI8WE2RBdFnnMSUORsXrz4jlvSJeZ8v0b
 /FOh8Af3gMkuOyOmztKbCFftPN/yHIc=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-cGWWYSS3OnC0RYDyKSbI-w-1; Mon, 07 Aug 2023 12:33:04 -0400
X-MC-Unique: cGWWYSS3OnC0RYDyKSbI-w-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-993d7ca4607so325918266b.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 09:33:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425983; x=1692030783;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+2S62aAs2pHMB7uH7IHyHCrQs/gKhwqzaa+nqwK3QP4=;
 b=SxO+6WidTkq8JFEUcJMyfWc6mxGhkYnpzxObHrn4Oayt0N1IR6M4C1E50dkaIpNhEK
 GVptdInSdJ2Q2PpNMZAf8QZAw72Esls5b9vjXapryED8ElqCSmnJr/mswu7ngvbz1qt3
 KkF6xHjf+6ypeiq8uhPRAMAtH+RsHA3C/g9j9DL75RI1t/9wcov4WjY5BHlkV1WqGiDv
 gAt1SWLhQC0w2JZ6D925tmTy46ThDYB603G81yHs/rGyUdWGLy58w5Whs78q1+Zbd5l7
 etvAz9zeSB7GlFHTgpLGF2Af+dwc9zSOOMMTqMRfPflNBKk6r3ct7wN2YX+uHAToTdVC
 zjlA==
X-Gm-Message-State: AOJu0Yz1pa5qKwjS4rg0ZiHXLVaQnjw5xOqS5s7jMxBLjpR17MnHz/5V
 zaErig+7tfiFihsW5lc76EshdhywFvgw7TmtjduPDEgonAvFKvMv+zV/aWVb9xCn6E50vRnnjPF
 NnM3KWKKmQ5L74Cgt6FfZBtnJUA==
X-Received: by 2002:a17:907:2c42:b0:99b:ef86:60d8 with SMTP id
 hf2-20020a1709072c4200b0099bef8660d8mr7492488ejc.5.1691425982807; 
 Mon, 07 Aug 2023 09:33:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHDd4lJA/lPWWyUyn4AV5CwgF5Dpm9yGhjxgNLtBZXvmCaU/mnXlPtmXy0UEJZds96u9UqFlQ==
X-Received: by 2002:a17:907:2c42:b0:99b:ef86:60d8 with SMTP id
 hf2-20020a1709072c4200b0099bef8660d8mr7492472ejc.5.1691425982642; 
 Mon, 07 Aug 2023 09:33:02 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bx22-20020a170906a1d600b00993860a6d37sm5409393ejb.40.2023.08.07.09.33.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:33:02 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Date: Mon,  7 Aug 2023 18:32:26 +0200
Message-ID: <20230807163238.2091-6-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 5/5] drm/nouveau: uvmm: remove
 dedicated VM pointer from VMAs
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

VMAs can find their corresponding VM through their embedded struct
drm_gpuva which already carries a pointer to a struct drm_gpuva_manager
which the VM is based on. Hence, remove the struct nouveau_uvmm pointer
from struct nouveau_uvma to save a couple of bytes per mapping.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c |  9 ++++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h | 10 +++++-----
 2 files changed, 9 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 91b964ef98b1..3a1e8538f205 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -181,7 +181,7 @@ nouveau_uvma_vmm_put(struct nouveau_uvma *uvma)
 	u64 addr = uvma->va.va.addr;
 	u64 range = uvma->va.va.range;
 
-	return nouveau_uvmm_vmm_put(uvma->uvmm, addr, range);
+	return nouveau_uvmm_vmm_put(to_uvmm(uvma), addr, range);
 }
 
 static int
@@ -192,7 +192,7 @@ nouveau_uvma_map(struct nouveau_uvma *uvma,
 	u64 offset = uvma->va.gem.offset;
 	u64 range = uvma->va.va.range;
 
-	return nouveau_uvmm_vmm_map(uvma->uvmm, addr, range,
+	return nouveau_uvmm_vmm_map(to_uvmm(uvma), addr, range,
 				    offset, uvma->kind, mem);
 }
 
@@ -206,7 +206,7 @@ nouveau_uvma_unmap(struct nouveau_uvma *uvma)
 	if (drm_gpuva_invalidated(&uvma->va))
 		return 0;
 
-	return nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
+	return nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, sparse);
 }
 
 static int
@@ -586,7 +586,6 @@ op_map_prepare(struct nouveau_uvmm *uvmm,
 	if (ret)
 		return ret;
 
-	uvma->uvmm = uvmm;
 	uvma->region = args->region;
 	uvma->kind = args->kind;
 
@@ -794,7 +793,7 @@ op_unmap_range(struct drm_gpuva_op_unmap *u,
 	bool sparse = !!uvma->region;
 
 	if (!drm_gpuva_invalidated(u->va))
-		nouveau_uvmm_vmm_unmap(uvma->uvmm, addr, range, sparse);
+		nouveau_uvmm_vmm_unmap(to_uvmm(uvma), addr, range, sparse);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index 534baadc3bf7..fc7f6fd2a4e1 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -37,12 +37,15 @@ struct nouveau_uvma_region {
 struct nouveau_uvma {
 	struct drm_gpuva va;
 
-	struct nouveau_uvmm *uvmm;
 	struct nouveau_uvma_region *region;
-
 	u8 kind;
 };
 
+#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
+#define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
+
+#define to_uvmm(x) uvmm_from_mgr((x)->va.mgr)
+
 struct nouveau_uvmm_bind_job {
 	struct nouveau_job base;
 
@@ -79,9 +82,6 @@ struct nouveau_uvmm_bind_job_args {
 
 #define to_uvmm_bind_job(job) container_of((job), struct nouveau_uvmm_bind_job, base)
 
-#define uvmm_from_mgr(x) container_of((x), struct nouveau_uvmm, umgr)
-#define uvma_from_va(x) container_of((x), struct nouveau_uvma, va)
-
 int nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		      u64 kernel_managed_addr, u64 kernel_managed_size);
 void nouveau_uvmm_fini(struct nouveau_uvmm *uvmm);
-- 
2.41.0

