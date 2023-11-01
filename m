Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D67DE8EB
	for <lists+nouveau@lfdr.de>; Thu,  2 Nov 2023 00:31:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 48E8810E7E6;
	Wed,  1 Nov 2023 23:31:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A47010E7E4
 for <nouveau@lists.freedesktop.org>; Wed,  1 Nov 2023 23:31:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1698881496;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ToQKAQ1y1PRH/3OVIpCvIaQCyxCqcVrO+cdPlLKjGls=;
 b=gbYWOWKb68qI0A4HNr0EY/5/03Wz9jOUCGI3JUvm3Z4ZeD+rmDakZV3BQWkgY6AFYt0Aw5
 5319P6isVB7q3CSqX51xBsmGzC+2c74cA2Azy85SRCqD0EPQG7ZJy3BzK/f5SkE2SNnyJg
 vfP/eMIIQu3kMrFHNpUQFr67MwUPBFM=
Received: from mail-ej1-f69.google.com (mail-ej1-f69.google.com
 [209.85.218.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-648-U4XIP0yKNfOgAq5gCBBo7g-1; Wed, 01 Nov 2023 19:31:34 -0400
X-MC-Unique: U4XIP0yKNfOgAq5gCBBo7g-1
Received: by mail-ej1-f69.google.com with SMTP id
 a640c23a62f3a-9d28dd67464so21712366b.0
 for <nouveau@lists.freedesktop.org>; Wed, 01 Nov 2023 16:31:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698881493; x=1699486293;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ToQKAQ1y1PRH/3OVIpCvIaQCyxCqcVrO+cdPlLKjGls=;
 b=Kl9Bis/l8XOozsTaOUHbgWy3kiQX+OSsAm8BE5ucFF3fLmbtv2ot1hwZUdcVCfU9wt
 sJu5/iYcn0vDPG74c2fxbHIf9eI2U3RDWoJA6jNFmNhL4HZwdc8GdoseKhS9gemDV7B0
 QLnjZ+4L3blXkWrhcI3dgpDBY2TisYAmXTOLd8Mi+1ULzngh0h9S0oBwOLBhWZt0W4/z
 Hugu1NihkonsHW83t353mNMR/VDvq/Zh+AwkrqCnt8g6wXb8vcd3WNSiFs1aoTf4uyZN
 XjEkT8yxWpe0LxktZybhfk+Ci9K0Bzz3wFJA2a06Q3kFaDZ37s2jKUaur/i/G7VNtTel
 Kizw==
X-Gm-Message-State: AOJu0Yzmsi7ZsxKPC/77S1+7PNwjUQbNSAaXn/tB+zIVXoxeI2BpQrj3
 252fAzkSI8y26reQeTa6DUKtk2ayAe2cglT5WCe/uhX9Lw5X9zaDSLepuHDyaEtfr+hbt2YbmDw
 hHI7VgjwKzR+6uGUCGf67zOR2mA==
X-Received: by 2002:a17:907:2d88:b0:9bf:60f9:9b7f with SMTP id
 gt8-20020a1709072d8800b009bf60f99b7fmr3588033ejc.4.1698881493765; 
 Wed, 01 Nov 2023 16:31:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE8VXTjVmx2ScEY9zyfvtwm9s6xZPaZj87Oi885o90gLsjCTQH8aVAE6ZRQgz+nv+ASvdFvfQ==
X-Received: by 2002:a17:907:2d88:b0:9bf:60f9:9b7f with SMTP id
 gt8-20020a1709072d8800b009bf60f99b7fmr3588018ejc.4.1698881493503; 
 Wed, 01 Nov 2023 16:31:33 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a1709063a0a00b009ad778a68c5sm465904eje.60.2023.11.01.16.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Nov 2023 16:31:33 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, matthew.brost@intel.com,
 thomas.hellstrom@linux.intel.com, sarah.walker@imgtec.com,
 donald.robson@imgtec.com, boris.brezillon@collabora.com,
 christian.koenig@amd.com, faith@gfxstrand.net
Date: Thu,  2 Nov 2023 00:30:56 +0100
Message-ID: <20231101233113.8059-5-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20231101233113.8059-1-dakr@redhat.com>
References: <20231101233113.8059-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v8 04/12] drm/nouveau: make use of
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Use drm_gpuvm_range_valid() in order to validate userspace requests.

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

