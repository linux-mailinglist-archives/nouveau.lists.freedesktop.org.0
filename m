Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CD5A75A332
	for <lists+nouveau@lfdr.de>; Thu, 20 Jul 2023 02:15:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7436C10E543;
	Thu, 20 Jul 2023 00:15:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF2A110E542
 for <nouveau@lists.freedesktop.org>; Thu, 20 Jul 2023 00:15:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689812134;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=dQyl0iCz5+Zc7onz5FYPYE5n4y1K23xI/lp0WsT0dxQveDZZXFniHIpAP4iszXDmzA3cZp
 Gs9ozRTbilqdz3Oq2BWTk/Pt/FCrpRxDg6yWZlcgRA7+QoXdEQQ97kTQbYYc+DJjI+G5ec
 sMvJX0P27tLstMs18GWwz/8efBVF7Q4=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-662-oIBaQJj7MHaES9JlfCKr6w-1; Wed, 19 Jul 2023 20:15:31 -0400
X-MC-Unique: oIBaQJj7MHaES9JlfCKr6w-1
Received: by mail-ed1-f70.google.com with SMTP id
 4fb4d7f45d1cf-51da39aa6dcso84974a12.2
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 17:15:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689812131; x=1692404131;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/pp7pCNssCFdX07s9SqyoLBjaIvnkOQtt7NO/vv36Sc=;
 b=l8+0HrXnjqJ/8nKhH0lVPIzpaiBNl8EWtqjR4Q5ZfAAMFKuFJgUuqAgcEfpYHiZMx4
 bpux2oViAIkboE/O09kD3s6c5iT+NCgSxGXzdleqGbKUPpHTe0wA9RjNmIZnCfiYZ2S6
 4390OvzlQxDO1CtB7GKMrKsLK4NrJs8V6i5TIh7us5yDwydAh1Hl51cHpCJclNzyMXc/
 NWhJ0ppAnvBn4KFUE6hvM8EsLgXfRHstPo0tYZAQSQQnRyMbDHv5cjB6xG2rwI10BLrj
 hR2VYzWL6VpV9rnRsVsJ+50U8UMEE4zHRtHJEdBz30v0R/G7EDS2v33L2ygOE4WnX4Xn
 A3zw==
X-Gm-Message-State: ABy/qLaGFsklmtZv0G1fg5R8q1Fyfn5wWS2ozX9hdemdsxqQAN4Uarfi
 Vrtk6rz9TZS4ut12XJZuSc7V5w0X4c5iq4hgaH8736bMJ7m3TGLr2RYb3htzjMtQQB/nCFgf6b6
 pBQJmTbyxrpA/x+p011vO7sdQOQ==
X-Received: by 2002:aa7:df82:0:b0:51e:5686:d0f8 with SMTP id
 b2-20020aa7df82000000b0051e5686d0f8mr3267132edy.10.1689812130902; 
 Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEY0jNJR563RWawHMsZiYL8i7vVzYGf6EAZKyG8JAuq4b4CkUSHn2cXQQXFqqniM+7z3huhmQ==
X-Received: by 2002:aa7:df82:0:b0:51e:5686:d0f8 with SMTP id
 b2-20020aa7df82000000b0051e5686d0f8mr3267108edy.10.1689812130666; 
 Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f24-20020a056402005800b0051dd4daf13fsm3401489edu.30.2023.07.19.17.15.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jul 2023 17:15:30 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net,
 donald.robson@imgtec.com
Date: Thu, 20 Jul 2023 02:14:29 +0200
Message-ID: <20230720001443.2380-9-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230720001443.2380-1-dakr@redhat.com>
References: <20230720001443.2380-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-misc-next v8 08/12] drm/nouveau: fence: fail
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

