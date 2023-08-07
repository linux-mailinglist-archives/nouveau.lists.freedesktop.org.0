Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16DBC772AEC
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 18:33:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A064110E2C1;
	Mon,  7 Aug 2023 16:33:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3865110E2C2
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425975;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=FSJyklWcOYLh1Y7SYk3LyH530BHSBws8fX+6+9YjAp4=;
 b=MtEJbI4EjWpaLn7MKtyAxNnVJ4s4FBr1xF62qmo84txGfsogi/aM7QRRqbxM7LECQ99AN1
 RknfW8IOAVPtP9ocXlSCY41Rh8aw7Kmga/2EA1M4/cZmmZUSo/VHdobGrDUpPbiCMgK1db
 LGviCdCqkOfFbisujuobVJ5hWZrds6Q=
Received: from mail-lf1-f69.google.com (mail-lf1-f69.google.com
 [209.85.167.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-685-ef_jPjxsMvazBR8rk744jQ-1; Mon, 07 Aug 2023 12:32:52 -0400
X-MC-Unique: ef_jPjxsMvazBR8rk744jQ-1
Received: by mail-lf1-f69.google.com with SMTP id
 2adb3069b0e04-4fe2631f5a6so4479061e87.0
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425971; x=1692030771;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FSJyklWcOYLh1Y7SYk3LyH530BHSBws8fX+6+9YjAp4=;
 b=VyeAMh+DFYFoiLxymAidpzMKxi6Wry1yJuDDQwrdh+f6J39j8ePR5BjCM0mckBm+GB
 TIOoJzxDoyW1sycB0wTeK+mPDGdbBcXiylJoVUKBf+DdD6heaU9VROTkN2QJvHP5as1f
 Bp0pftU6IsPtwIyzAPeCdjfXwxcLaWpsmc1GGmX9FqDzuKzmiGC6m737NNQe+sODuTUH
 yibllhtb5sxALug2oOQurqLVK9aWdyL2H398/TwnvNSvMdSd6u+x+gu57m2f/aO7VYHQ
 FMw5N8shIp5gVfwUsckahTr/54AmK0VOPsyTBtQMxeiYf46WWJ4sj9ftFTY4+6g11Lf6
 tuew==
X-Gm-Message-State: AOJu0YzWmswEn1qHVJxvcfAob0nGThVfo3q9QPRr9/NFNad5xYSMmX7x
 rzt0KJPnecvkZNVLI6VE5wPzEETrG7Ha2+iwqacg05KNQt0DTm4BmQu3TNQTCul6aIUE8LcaD/C
 V6R1EMUfTb5zWWx2iFkWAXFGS8w==
X-Received: by 2002:a05:6512:280c:b0:4fb:744e:17db with SMTP id
 cf12-20020a056512280c00b004fb744e17dbmr7711100lfb.1.1691425971022; 
 Mon, 07 Aug 2023 09:32:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGFTmw8BlSLd66bLQQphUvYc14k91eYxq6U+Y6ebxxfanOvKoolnZuNuEXZTLdCuMfe0V95eA==
X-Received: by 2002:a05:6512:280c:b0:4fb:744e:17db with SMTP id
 cf12-20020a056512280c00b004fb744e17dbmr7711084lfb.1.1691425970741; 
 Mon, 07 Aug 2023 09:32:50 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 e26-20020a50ec9a000000b0051873c201a0sm5377862edr.26.2023.08.07.09.32.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:50 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Date: Mon,  7 Aug 2023 18:32:23 +0200
Message-ID: <20230807163238.2091-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 2/5] drm/nouveau: nvkm: vmm: silence
 warning from cast
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
 dri-devel@lists.freedesktop.org, kernel test robot <lkp@intel.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Cast the integer to a pointer-sized type first to keep the compiler
happy.

Fixes: 6b252cf42281 ("drm/nouveau: nvkm/vmm: implement raw ops to manage uvmm")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 38b7ced934b1..46cbd4cedb78 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -399,6 +399,8 @@ nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
 		.no_comp = true,
 	};
 	struct nvkm_memory *memory;
+	void *argv = (void *)(uintptr_t)args->argv;
+	int argc = args->argc;
 	u64 handle = args->memory;
 	u8 refd;
 	int ret;
@@ -418,8 +420,7 @@ nvkm_uvmm_mthd_raw_map(struct nvkm_uvmm *uvmm, struct nvif_vmm_raw_v0 *args)
 		return PTR_ERR(memory);
 	}
 
-	ret = nvkm_memory_map(memory, args->offset, vmm, &vma,
-			      (void *)args->argv, args->argc);
+	ret = nvkm_memory_map(memory, args->offset, vmm, &vma, argv, argc);
 
 	nvkm_memory_unref(&vma.memory);
 	nvkm_memory_unref(&memory);
-- 
2.41.0

