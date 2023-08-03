Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05F0076F004
	for <lists+nouveau@lfdr.de>; Thu,  3 Aug 2023 18:53:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF17410E63E;
	Thu,  3 Aug 2023 16:53:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 00E5E10E63F
 for <nouveau@lists.freedesktop.org>; Thu,  3 Aug 2023 16:53:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691081602;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=ia6bvfHvkGRbpi4StLJwYzttQY9+rchp9pn1007oCN5/+UdINHrSg4PEma8C00qHd5xkY3
 FrT9n+0xA8J8UyfyBuPVgkNMZOh7IevdZoZCOFXWPmLNvtN0/Dw+D+AB1NE02H5ov/e2gA
 obQ5+GGsjg/WbcLXF0xUWO9hPeryLSk=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-80sHwpJ9MOKmabmnfopb7A-1; Thu, 03 Aug 2023 12:53:20 -0400
X-MC-Unique: 80sHwpJ9MOKmabmnfopb7A-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a34a0b75eso77325166b.1
 for <nouveau@lists.freedesktop.org>; Thu, 03 Aug 2023 09:53:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691081600; x=1691686400;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=dT7PGuCLzchgAvhPQjWE7sYagbwm7gYCaUvOqyDwTaCtnTmKV34QZj2jTu1qpewPyt
 un7Zkhq+7hkH2qeDigzMqFt3lyH/jesnF6dS+QDHcdxSqAw9S/IeZIeufsCRLGkOFsez
 At/cSB4IlQGHrvKRR3Em/Nu2Mwx1brGFdirH/CFT1axAU+hM1y+EHEvFSqVBcvUFTQC0
 9JEtbtCx6O22G153w7QmS0kda5bp7tySqeljDGOQD0csGpYGkpptnwaeq+JhlKz4ox+O
 oxGO7Vcb2azXeOM9Gi9W9sZIKRpi3Ne53rjMHPTsnUfzG3nzfNMwHAUYWMksI6nrBjOw
 PAAw==
X-Gm-Message-State: AOJu0YxLI2djwHVdVH36kuffK3gMwTCcVs0c07+ILDJwwWXOlfUoaHwu
 yif9his0cqhhXPh4sQRO2X/PWWIPjQCvXoihriBaAZBBKo0YyHw6DRsBcvQQ0cjWylKYp29Iz/i
 eVs+5V0fKNUukuaSZIwe2Wi6nrg==
X-Received: by 2002:a17:907:75f2:b0:99c:6651:2ab7 with SMTP id
 jz18-20020a17090775f200b0099c66512ab7mr2209725ejc.57.1691081599867; 
 Thu, 03 Aug 2023 09:53:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG7/zdTyo1H/lNhcIQxy0MATbWku+5A0hcNban9RJXMRCMfMwfuX2CSslnW7lp+CzT2kJFMxg==
X-Received: by 2002:a17:907:75f2:b0:99c:6651:2ab7 with SMTP id
 jz18-20020a17090775f200b0099c66512ab7mr2209711ejc.57.1691081599679; 
 Thu, 03 Aug 2023 09:53:19 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 t23-20020a17090605d700b00993cc1242d4sm62233ejt.151.2023.08.03.09.53.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Aug 2023 09:53:19 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu,  3 Aug 2023 18:52:26 +0200
Message-ID: <20230803165238.8798-8-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230803165238.8798-1-dakr@redhat.com>
References: <20230803165238.8798-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v9 07/11] drm/nouveau: fence: fail
 to emit when fence context is killed
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

