Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9B0F752961
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 19:05:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 322C210E730;
	Thu, 13 Jul 2023 17:05:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2AD510E73D
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 17:05:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689267917;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=cMkhhxjBpLxxr51g7qXrljmiJYYNhIeIKzrvmUGc7Zvl9N7k0KtKVrkX3+Ou4wdQFgUPrI
 CqwbRKmXSgB9j/5D6j6g8uKZc2poiKC/PXNPiQjmJZ547ejCXQNSZmXhmRVLSEsS6wuSBY
 OUtYaTjytJqPtucUNy9rD6kn5gVmtE0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-601-uSgXkkbiNZqs_FOAjWUnWg-1; Thu, 13 Jul 2023 13:05:13 -0400
X-MC-Unique: uSgXkkbiNZqs_FOAjWUnWg-1
Received: by mail-ej1-f70.google.com with SMTP id
 a640c23a62f3a-94a35b0d4ceso58510766b.3
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 10:05:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689267912; x=1691859912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=DTrotPRiIPODQV0zd4mTcHASZQf70QITow4/oS7pLhFJSmLmvbqwZX86ZIOobL8Y7b
 wNA4a7SX6pO5136hlRE91JZqT1uWlVgfgPA6sIUmIc1V0QATyzmHOxiVorb9X0ZQIJqV
 +1bxkmmOEhaZlWN5RaTFpbUVlrKXkjQvKd9L+dOVrYYQP0dObAFpBGimIUVgTOeX8XMj
 oPhmbsnq0s/HNVovzfnnpD0tdi1522jpAj2ar1CmuB7D3ay89tzBfBLt0ZQCTu4X6Hk0
 1b+STg68MsTWA086e7GHPHNWgMqvYYxspCt1HsKq0h6U6PL79tJw3gDSnVLw7iVWi6L6
 vLbg==
X-Gm-Message-State: ABy/qLbpweoWxFju/hDEmuwisM9axPDzvXA9u0OFof2zB0u+gX07UMJc
 h4vs653WM5i5+A2zBJLeB/wF6EreBseYE8pPj+FIAe/wPjs7zc2BrTjIRh15IBHpWlfTjcS9VHF
 YyW0jDkvVDPvuq2V8RQqiyIwgNA==
X-Received: by 2002:a17:906:739e:b0:993:e752:1a71 with SMTP id
 f30-20020a170906739e00b00993e7521a71mr2073328ejl.9.1689267912643; 
 Thu, 13 Jul 2023 10:05:12 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFHckHbTyjMCGJSB33a1xuyToxA5Lv9jbmRxtayiMatm6oRwXfd/mPMU4d/wU1zEIEwWQbE5w==
X-Received: by 2002:a17:906:739e:b0:993:e752:1a71 with SMTP id
 f30-20020a170906739e00b00993e7521a71mr2073306ejl.9.1689267912463; 
 Thu, 13 Jul 2023 10:05:12 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t14-20020a17090616ce00b0094e7d196aa4sm4179835ejd.160.2023.07.13.10.05.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Jul 2023 10:05:12 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu, 13 Jul 2023 19:04:04 +0200
Message-ID: <20230713170429.2964-10-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230713170429.2964-1-dakr@redhat.com>
References: <20230713170429.2964-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v7 09/13] drm/nouveau: fence: fail to
 emit when fence context is killed
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

The new VM_BIND UAPI implementation introduced in subsequent commits
will allow asynchronous jobs processing push buffers and emitting
fences.

If a fence context is killed, e.g. due to a channel fault, jobs which
are already queued for execution might still emit new fences. In such a
case a job would hang forever.

To fix that, fail to emit a new fence on a killed fence context with
-ENODEV to unblock the job.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_fence.c | 7 +++++++
 drivers/gpu/drm/nouveau/nouveau_fence.h | 2 +-
 2 files changed, 8 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.c b/drivers/gpu/drm/nouveau/nouveau_fence.c
index e946408f945b..77c739a55b19 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -229,6 +230,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
 		dma_fence_get(&fence->base);
 		spin_lock_irq(&fctx->lock);
 
+		if (unlikely(fctx->killed)) {
+			spin_unlock_irq(&fctx->lock);
+			dma_fence_put(&fence->base);
+			return -ENODEV;
+		}
+
 		if (nouveau_fence_update(chan, fctx))
 			nvif_event_block(&fctx->event);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_fence.h b/drivers/gpu/drm/nouveau/nouveau_fence.h
index 7c73c7c9834a..2c72d96ef17d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -44,7 +44,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.41.0

