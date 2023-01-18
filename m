Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B63B56713A5
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:14:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23E4910E68F;
	Wed, 18 Jan 2023 06:14:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 82A1310E69A
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022443;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=n9EJ+tT+/p3duz0VW0fK+iHRhTM0v9eouQOWnSy8nPY=;
 b=cS+7oM/w/tESMKrwOHQvhuvd69tPYqjN4Zltv0Q5atxxLU51L+F4rS+65QTqA0Y23lBXsA
 rUrTg4zCR6WYHME+RmhOG2KKCkE6WtQzXgxvAt1qp0kasZ/omBvopFSfp/xgv/fAp+B9a9
 ZoC5ZMJAPEUQcmTWr2dCr1Y/VdUhA88=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-396-jdaKeYJHOp6Pj5iQoJOMVA-1; Wed, 18 Jan 2023 01:14:02 -0500
X-MC-Unique: jdaKeYJHOp6Pj5iQoJOMVA-1
Received: by mail-ed1-f72.google.com with SMTP id
 w18-20020a05640234d200b0048cc3aa4993so22763342edc.7
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:02 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=n9EJ+tT+/p3duz0VW0fK+iHRhTM0v9eouQOWnSy8nPY=;
 b=0kY/YXajo6DHYd1zPEfHpLB2LycxNs6Tc9M7sEq48N+3HhFaOBO5GSp7yScuu8Jv1/
 Vk7/aykdKgDNA1MJLQ4ARFlLKKdlqgpit+B3fkSJN/U4ejZzfZwihNHhljdDcBTvpGf8
 Q9lAA42iCtjEgQ9obJF+uNEqvmlif7BkoZJSKGtgahZCcSsrIs47s6liM6osekmFfxdI
 05TRP9svVJnIEAvJG19sUaoIduWGfjlRq0yB0u7wDF1KaMZKJm2LLMkUZ/0l8XW6kfei
 46vyubYrA8CJHcBtWJS+EfDSDaiqmPTJbVwVfcx8URPpvruEcPTegOtSOFJjF9RhuyFl
 DTXQ==
X-Gm-Message-State: AFqh2kouTKnNeqXRka/2t1A2ftyKGgkelZ2yd3RKJra1C+6D+uW+B8c2
 pZSBBI/7kRbnUSvKzsd4H23G0p586EPIuDE8AYzfx48L3lOe3K2WZfyYD/5t8vcNR4pla9DpO3C
 OdLTeqDE8ASAzsYkIrUxRn5peQw==
X-Received: by 2002:a17:907:d047:b0:86d:6e9f:7e36 with SMTP id
 vb7-20020a170907d04700b0086d6e9f7e36mr2097348ejc.5.1674022441528; 
 Tue, 17 Jan 2023 22:14:01 -0800 (PST)
X-Google-Smtp-Source: AMrXdXt17hYRso2wFEWcK0mlpboIS6E+BA5nIJ4n2A32fGemNRlxrozdcKGS6R6bhkgQQv7FVOxZqA==
X-Received: by 2002:a17:907:d047:b0:86d:6e9f:7e36 with SMTP id
 vb7-20020a170907d04700b0086d6e9f7e36mr2097334ejc.5.1674022441366; 
 Tue, 17 Jan 2023 22:14:01 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 sb25-20020a1709076d9900b0084c6581c16fsm14093965ejc.64.2023.01.17.22.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:00 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:51 +0100
Message-Id: <20230118061256.2689-10-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next 09/14] drm/nouveau: fence: fail to emit
 when fence context is killed
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
index ee5e9d40c166..62c70d9a32e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.c
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.c
@@ -96,6 +96,7 @@ nouveau_fence_context_kill(struct nouveau_fence_chan *fctx, int error)
 		if (nouveau_fence_signal(fence))
 			nvif_event_block(&fctx->event);
 	}
+	fctx->killed = 1;
 	spin_unlock_irqrestore(&fctx->lock, flags);
 }
 
@@ -226,6 +227,12 @@ nouveau_fence_emit(struct nouveau_fence *fence, struct nouveau_channel *chan)
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
index 0ca2bc85adf6..00a08699bb58 100644
--- a/drivers/gpu/drm/nouveau/nouveau_fence.h
+++ b/drivers/gpu/drm/nouveau/nouveau_fence.h
@@ -45,7 +45,7 @@ struct nouveau_fence_chan {
 	char name[32];
 
 	struct nvif_event event;
-	int notify_ref, dead;
+	int notify_ref, dead, killed;
 };
 
 struct nouveau_fence_priv {
-- 
2.39.0

