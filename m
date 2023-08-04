Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 20F317707D7
	for <lists+nouveau@lfdr.de>; Fri,  4 Aug 2023 20:25:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7973310E759;
	Fri,  4 Aug 2023 18:25:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCB0110E74C
 for <nouveau@lists.freedesktop.org>; Fri,  4 Aug 2023 18:24:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691173493;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=GC244PIhZZVEaEMVp/i0uN0Dlx9b0oRSDCpI7qyebQM=;
 b=bHorJ0A2hTRv5Mm8KcPaWmZQB2l2ayoGcQgrBMls0z+K3hyhq0gAcxmjj2a/CyNq66JRiw
 qOwsP8mmAREdLMUU0q3qxst7SlyV6bxx3cd5dibvisN+Z6H0H5chyoJGqW+TGc1SJTC8gF
 NLCziNs0tMsRPT3vU65oyCLD2T3QKco=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-600-kYDkdt-tNOSACYzFz22BvQ-1; Fri, 04 Aug 2023 14:24:49 -0400
X-MC-Unique: kYDkdt-tNOSACYzFz22BvQ-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-94a356c74e0so150976066b.2
 for <nouveau@lists.freedesktop.org>; Fri, 04 Aug 2023 11:24:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691173488; x=1691778288;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GC244PIhZZVEaEMVp/i0uN0Dlx9b0oRSDCpI7qyebQM=;
 b=jwABhwc2boDjab7xGJmQX27wsNq/q+bd6porCi6hsdqii1KDVpndN19bscYOKHmJAg
 LPb1Da8ABsNbj09smVRHnOoGGjrFIVRnpJOKzsODVZfqsAWi+NvvALxxLEUk1M+nGyLU
 IpvX1PaWovoWOOoG7iGXAw+Dy+XRAOv9zL8LHMoq4GyC0L9JeyEU65FJY+4yDK1cw4LR
 VZ+NTeQyarMFX2BeTCrp6ZBKhX69N87qtscSZNFco8V0TM2m4nbi0zGfF44q4bxz6J9L
 gHRYCDzCEaJUxvtD9jzm1BhQTTFQx1SxifYcIsPV2N+EV7+PGdAkKoMQsqV65tnP5x3g
 r8gw==
X-Gm-Message-State: AOJu0YxnLHTMv1Ml+CQWDzIsyA4NeiqbstJeJV1FazsTh6XRX/RPjLMz
 f2BsIHuzC0LqXsTeAuG1kbQ9TyYw2EXgut9Qx4edrCE7DiaYjZwgoY0xrNCcG/gvu1qC56inrZ5
 dXSoUSboZJ40Pum1uiGtaqUwj0g==
X-Received: by 2002:a17:906:31cd:b0:994:2fa9:7446 with SMTP id
 f13-20020a17090631cd00b009942fa97446mr1890103ejf.46.1691173488304; 
 Fri, 04 Aug 2023 11:24:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFNm88b5/GKa7FD6Aqs6b0cTELulEnpK8lpJSfesvb7pgDI0RFk7OgObhebiBKeVpSn286rFg==
X-Received: by 2002:a17:906:31cd:b0:994:2fa9:7446 with SMTP id
 f13-20020a17090631cd00b009942fa97446mr1890079ejf.46.1691173487983; 
 Fri, 04 Aug 2023 11:24:47 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bw4-20020a170906c1c400b009829d2e892csm1674052ejb.15.2023.08.04.11.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Aug 2023 11:24:47 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Fri,  4 Aug 2023 20:23:48 +0200
Message-ID: <20230804182406.5222-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230804182406.5222-1-dakr@redhat.com>
References: <20230804182406.5222-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v10 08/12] drm/nouveau: fence: fail
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>
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

Reviewed-by: Dave Airlie <airlied@redhat.com>
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

