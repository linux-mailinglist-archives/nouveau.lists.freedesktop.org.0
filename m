Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 301EC7E4DCE
	for <lists+nouveau@lfdr.de>; Wed,  8 Nov 2023 01:13:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B913E10E6DC;
	Wed,  8 Nov 2023 00:13:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A929910E6D9
 for <nouveau@lists.freedesktop.org>; Wed,  8 Nov 2023 00:13:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699402402;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=s6qqEPqKINJozX4kiVm6oeIhikVcMg+GmtiPQ0sRpWA=;
 b=SqBMCZa/dkJaCKEJpaSliGlVEMqLFctQDV2TYIZngjRxudURPdkupGERZrZn2W61JGmNZs
 26qe9KlOF5W9eRNeIsAA2FHUiSYu7+sG8lnZZsFrdRmTZpnZEW06MUkOLgsQOyeKrHLtDH
 RJerpROdLahZ1AZ20zD3hRsMGLsZfp0=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-104-KUqb71lkOne4m-MWppo78w-1; Tue, 07 Nov 2023 19:13:19 -0500
X-MC-Unique: KUqb71lkOne4m-MWppo78w-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-5079fd9754cso6021935e87.0
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 16:13:19 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699402398; x=1700007198;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s6qqEPqKINJozX4kiVm6oeIhikVcMg+GmtiPQ0sRpWA=;
 b=dQ91mCDvMsBVu+xWYnygkNzlLzbg1mqw2CYHLv61+fPz6675anDM94rzGvc9TLnJlL
 Q8v8kSqmHSepI6irIATh3LXbF4PK+Cw9/a0KHFFGpsUvcOJteYknHrtKNgLQPWctqie2
 W1nbk0uyw7x7YNortAYIf6v1JXg8Aeb3e9PW+a3pGfxbcuZdJDXMNrPNEcMB0ASc3yCo
 HIThDBQlAdeBW48TTv/F0mslREy7ucGmPE2h1tArAPEdw8/qmm47Xe626/vdmPvvGp+u
 Wv7SLU9PsiCB3I6sEn9LmXnumZAL150ha8gPi/89PqNFG4Qei69wl+RtRBh/h33lsa0k
 b0cw==
X-Gm-Message-State: AOJu0YyvIR5cml9Vf8r4j9sVsD3sMpRI+oGWAN2tXM2JXsKCt+b7uTdS
 T0Gi96Za73rJW7BEOUvY3x9wBmApO9zXdOy0z1c6pOarCNDPJhdUoobly9uUeJajWi+AfDmDse3
 FMLxi4Kuf/QLJ02rCE+dyLYJtCA==
X-Received: by 2002:ac2:5104:0:b0:507:a58f:79ad with SMTP id
 q4-20020ac25104000000b00507a58f79admr97828lfb.61.1699402398206; 
 Tue, 07 Nov 2023 16:13:18 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHD+Xkq0u6oAI8m3oyiBP2SEe6J/IOUMaiSjmHPhK06TZq3qINW3kr5HPMHObx1V1vCSwDkRQ==
X-Received: by 2002:ac2:5104:0:b0:507:a58f:79ad with SMTP id
 q4-20020ac25104000000b00507a58f79admr97816lfb.61.1699402397864; 
 Tue, 07 Nov 2023 16:13:17 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m9-20020a1709060d8900b0099cd1c0cb21sm168299eji.129.2023.11.07.16.13.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 16:13:17 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Wed,  8 Nov 2023 01:12:34 +0100
Message-ID: <20231108001259.15123-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231108001259.15123-1-dakr@redhat.com>
References: <20231108001259.15123-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v9 04/12] drm/nouveau: make use of
 drm_gpuvm_range_valid()
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

Use drm_gpuvm_range_valid() in order to validate userspace requests.

Reviewed-by: Dave Airlie <airlied@redhat.com>
Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c | 17 +----------------
 drivers/gpu/drm/nouveau/nouveau_uvmm.h |  3 ---
 2 files changed, 1 insertion(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index aaf5d28bd587..641a911528db 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -929,25 +929,13 @@ nouveau_uvmm_sm_unmap_cleanup(struct nouveau_uvmm *uvmm,
 static int
 nouveau_uvmm_validate_range(struct nouveau_uvmm *uvmm, u64 addr, u64 range)
 {
-	u64 end = addr + range;
-	u64 kernel_managed_end = uvmm->kernel_managed_addr +
-				 uvmm->kernel_managed_size;
-
 	if (addr & ~PAGE_MASK)
 		return -EINVAL;
 
 	if (range & ~PAGE_MASK)
 		return -EINVAL;
 
-	if (end <= addr)
-		return -EINVAL;
-
-	if (addr < NOUVEAU_VA_SPACE_START ||
-	    end > NOUVEAU_VA_SPACE_END)
-		return -EINVAL;
-
-	if (addr < kernel_managed_end &&
-	    end > uvmm->kernel_managed_addr)
+	if (!drm_gpuvm_range_valid(&uvmm->base, addr, range))
 		return -EINVAL;
 
 	return 0;
@@ -1834,9 +1822,6 @@ nouveau_uvmm_init(struct nouveau_uvmm *uvmm, struct nouveau_cli *cli,
 		goto out_unlock;
 	}
 
-	uvmm->kernel_managed_addr = kernel_managed_addr;
-	uvmm->kernel_managed_size = kernel_managed_size;
-
 	drm_gpuvm_init(&uvmm->base, cli->name, drm,
 		       NOUVEAU_VA_SPACE_START,
 		       NOUVEAU_VA_SPACE_END,
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.h b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
index a308c59760a5..06a0c36de392 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.h
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.h
@@ -14,9 +14,6 @@ struct nouveau_uvmm {
 	struct mutex mutex;
 	struct dma_resv resv;
 
-	u64 kernel_managed_addr;
-	u64 kernel_managed_size;
-
 	bool disabled;
 };
 
-- 
2.41.0

