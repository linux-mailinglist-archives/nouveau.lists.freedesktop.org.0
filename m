Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2D0A4AC51B
	for <lists+nouveau@lfdr.de>; Mon,  7 Feb 2022 17:14:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96AED10F878;
	Mon,  7 Feb 2022 16:14:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D36F10F829
 for <nouveau@lists.freedesktop.org>; Mon,  7 Feb 2022 16:14:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1644250488;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=IFrUiE399AWkgKFh5f0w6DFQ5l0IKVbpkKeYpipiJKA=;
 b=DeCwOcj2O4hEM4CFCgcuxAbhM1NAAhEvQ4s9LWgIm/FiAfwE0UUsV4tmig4zhUNOI/7lMZ
 rl5qir32wq3k611vTLMbJJR2Vb20HZ79ing8Cds8itSKn4z6ge9IOhkxSMVWIlUHp9UkDN
 icvr3nY/LZCZVzyI23TQamDwi56ve7g=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-365-JPD89_SqN4yGLiqtqQgSbQ-1; Mon, 07 Feb 2022 11:14:46 -0500
X-MC-Unique: JPD89_SqN4yGLiqtqQgSbQ-1
Received: by mail-wm1-f69.google.com with SMTP id
 u14-20020a05600c210e00b0037bddd0562eso24799wml.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Feb 2022 08:14:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=IFrUiE399AWkgKFh5f0w6DFQ5l0IKVbpkKeYpipiJKA=;
 b=D25qyPRaGD1l6S3Zyc9JXRa8udLVCpO4sIrDUu36LDos9r1ZYlr66DIGGsmeY/lugI
 zkjZUW2MxDg9n/iN2wGFdbIN1lYU5QUFCqxTngyj6PCB/sSgenB6F6/J7Bbihpz9udSU
 ObmgWe2Qnc06XODyH3TdZ8Kal4LDRWzP78cHzXC6EOKo49kn53czweaY8dezDJe5xaVl
 rHZoIwttmd2KraFGtCS+ja0c0Z4H5iFylslNdg4y8eCeOaEsp4VJFJBa5gjrrF+KFyRN
 FCKLoJZKEHTBgbC2iOyjODHcfztcOB0+zHYgmCsSWRdNqI4LMjQxstb6y623hOMzJaRg
 WfRg==
X-Gm-Message-State: AOAM530rUZ24xBarpnWrlvjfIuQAm2b1gGllqpWCtUpPz6b9mPB07bJM
 9v9EKAYVQmhLwRD0w8D0R9RlglWIkGoBNybuSnZuL87ySXcYwGNLptGWeMI1+wgq2dHLfCfpGfW
 5JCNLYh3VwIJwifLRd0WcMIf3/w==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr178620wrq.6.1644250484834;
 Mon, 07 Feb 2022 08:14:44 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxag/VMAQvDNvrhkp9126/FEr3+jzTAsqTwom1rxeqdyBy5yKiDpvjeiVrKAD+kaImszZyfLA==
X-Received: by 2002:a5d:40ca:: with SMTP id b10mr178611wrq.6.1644250484657;
 Mon, 07 Feb 2022 08:14:44 -0800 (PST)
Received: from kherbst.pingu.com (ip1f10bb48.dynamic.kabel-deutschland.de.
 [31.16.187.72])
 by smtp.gmail.com with ESMTPSA id f8sm12358148wry.12.2022.02.07.08.14.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Feb 2022 08:14:44 -0800 (PST)
From: Karol Herbst <kherbst@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Mon,  7 Feb 2022 17:14:42 +0100
Message-Id: <20220207161443.1843660-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"
Subject: [Nouveau] [PATCH] drm/nouveau/mmu: fix reuse of nvkm_umem
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
Cc: David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, stable@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

I am not entirely sure if this fixes anything, but the code standed out
while investigated problematic calls to vunmap.

nvkm_umem.io is only ever set for the NVKM_OBJECT_MAP_IO case in
nvkm_umem_map, but never for the NVKM_OBJECT_MAP_VA one, which could lead
to taking the wrong patch inside nvkm_umem_unmap.

I just don't know if this is a real issue or not, but the code doesn't
look correct this way.

Fixes: c83c4097eba8 ("drm/nouveau/mmu: define user interfaces to mmu memory allocation")
Cc: <stable@vger.kernel.org> # v4.15+
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
index e530bb8b3b17..2608e0796066 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/umem.c
@@ -102,6 +102,7 @@ nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
 		*handle = (unsigned long)(void *)umem->map;
 		*length = nvkm_memory_size(umem->memory);
 		*type = NVKM_OBJECT_MAP_VA;
+		umem->io = false;
 		return 0;
 	} else
 	if ((umem->type & NVKM_MEM_VRAM) ||
@@ -112,12 +113,11 @@ nvkm_umem_map(struct nvkm_object *object, void *argv, u32 argc,
 			return ret;
 
 		*type = NVKM_OBJECT_MAP_IO;
-	} else {
-		return -EINVAL;
+		umem->io = true;
+		return 0;
 	}
 
-	umem->io = (*type == NVKM_OBJECT_MAP_IO);
-	return 0;
+	return -EINVAL;
 }
 
 static void *
-- 
2.34.1

