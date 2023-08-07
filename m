Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01FD5772AE8
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 18:32:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF0FB10E2BF;
	Mon,  7 Aug 2023 16:32:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BBA3910E2C0
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 16:32:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691425969;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=IfDXzRQJmq7hjHOSakYboiQj+aP0Hf7JLmie7OP7ZJg=;
 b=N0osMx9ikyfZApFfWzSlj4j5shhjINUgcAufA4J2jFR8gRM3ONk99yi762jKOZRDF7GKJ4
 nR5f6wx1lOh47ErIEJCEFFkBvPPoHDFe6/t8mIutrckr/FWko2PL6cbceNW+xkBsNUkCpX
 F19hdIeQqW344rrum+zY/adSLtd5fL4=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-611-TfPmPsKWMtugx5iJOMo-XA-1; Mon, 07 Aug 2023 12:32:47 -0400
X-MC-Unique: TfPmPsKWMtugx5iJOMo-XA-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-99cc32f2ec5so135795566b.1
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 09:32:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691425966; x=1692030766;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IfDXzRQJmq7hjHOSakYboiQj+aP0Hf7JLmie7OP7ZJg=;
 b=FZdVRhg3GJx4BxBj7mrIGEN+IjlVpidj0t7fhWaIYWl++rT3KipUO19TrOHRNqKPF5
 XWk3qcuLkHLk/zynbFlp4+1n3E2GSsMovfgIIzYCYgroySGXtecSXd0nK77UCvpIh1Q+
 cN/PkHKX++StWV5gZVHMN36priiGnRLx/yccpxck/QIGGCsxZRwPo/7XUriYTglGNax6
 FMJEOffYuOIhqZnnl4vOwAh7yjztRpoI4S4F5Yik0r5iLYkOR8EeDQ2xZSTghvVXl0g1
 5DV/gsOJFZL/YTTRL15mdUA0Qe2UfQiQwfrVyanNiY+FbtWVk8jq26tmWUr+jEjjlm23
 tErg==
X-Gm-Message-State: AOJu0Yxz+8aRprODSHtYOS2VP8LVbNXAttQEDF0ZQG0Oj6I0KibPfa60
 Ej3oSdKRZefKnM005XrLTULK9Cn7F79/KVUDZfYdB6+rR3XvWqKUhK+++BtQiwLQ9+AY2r9NWz3
 G4cwALDrhY63AhbcWHPfVCPiDgw==
X-Received: by 2002:a17:906:31c1:b0:99b:c0f0:77fe with SMTP id
 f1-20020a17090631c100b0099bc0f077femr8075286ejf.69.1691425966378; 
 Mon, 07 Aug 2023 09:32:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHdZuNVePss2xGOu78Sr/qq+zLojadIk9YBj7opOTUz4DKdRdl9uzjpJuWytvQBggwWEfgpTg==
X-Received: by 2002:a17:906:31c1:b0:99b:c0f0:77fe with SMTP id
 f1-20020a17090631c100b0099bc0f077femr8075269ejf.69.1691425966094; 
 Mon, 07 Aug 2023 09:32:46 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 o17-20020a17090608d100b00988dbbd1f7esm5397484eje.213.2023.08.07.09.32.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 09:32:45 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, bskeggs@redhat.com, kherbst@redhat.com,
 lyude@redhat.com, sfr@canb.auug.org.au
Date: Mon,  7 Aug 2023 18:32:22 +0200
Message-ID: <20230807163238.2091-2-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230807163238.2091-1-dakr@redhat.com>
References: <20230807163238.2091-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next 1/5] nouveau/dmem: fix copy-paste
 error in nouveau_dmem_migrate_chunk()
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

Fix call to nouveau_fence_emit() with wrong channel parameter.

Fixes: 7f2a0b50b2b2 ("drm/nouveau: fence: separate fence alloc and emit")
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Reviewed-by: Karol Herbst <kherbst@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index 4ad40e42cae1..61e84562094a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -678,7 +678,7 @@ static void nouveau_dmem_migrate_chunk(struct nouveau_drm *drm,
 	}
 
 	if (!nouveau_fence_new(&fence))
-		nouveau_fence_emit(fence, chunk->drm->dmem->migrate.chan);
+		nouveau_fence_emit(fence, drm->dmem->migrate.chan);
 	migrate_vma_pages(args);
 	nouveau_dmem_fence_done(&fence);
 	nouveau_pfns_map(svmm, args->vma->vm_mm, args->start, pfns, i);
-- 
2.41.0

