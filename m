Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4AD7F6D55F6
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0EE310E2AE;
	Tue,  4 Apr 2023 01:28:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 638E010E29F
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571715;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1l/vBoUEhgxsmLv104lwmJ8KryX+Oa0PJH6QLfzc/6M=;
 b=iXdeGOddwFY2BiFG8v0ESDttP3fAi/cxqhsXIQFzHnUqjE9aPTpkj1OFhS9CMjcrWa7WEM
 YDoevaVSys6Amr88i6Ay6cANBJ/8cdN1ay23fPf21OWCYpNigOoydWvvz/8ocLPaVN3CJt
 K7ugk7E27HteN3ewLFDk+3e0B+SEIKQ=
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com
 [209.85.208.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-465-5uY7b8wdPzu2pDkpaVRWzw-1; Mon, 03 Apr 2023 21:28:30 -0400
X-MC-Unique: 5uY7b8wdPzu2pDkpaVRWzw-1
Received: by mail-ed1-f71.google.com with SMTP id
 m18-20020a50d7d2000000b00501dfd867a4so44002535edj.20
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1l/vBoUEhgxsmLv104lwmJ8KryX+Oa0PJH6QLfzc/6M=;
 b=AjIYfPgKhUbj1pPa+JLAl/IvvZbYx6oEtbcBNptQrXOkFn3c4LeVEy6HrsjOTORBX0
 Kl5N7ilYKxgVGPJVqM+WwA4+SFrI4GfhvxRQwOFY+BVWaG62uLWczFanUpOXQ/fgOq51
 m7sz2IUHhmSUmZhynCaWwrMAgXNIxSmaL0RGdMYqn3znbokrkhCbuDD0DWrKDG7uXwfX
 A9v57+FwKLdXDYAoJGGlDrtSNB2Nq3vPdcFJDFQZBnu/EZhFhP+DCOdkPVfOg5/M7sGQ
 +vf4MdVerIDkVcQhcRYeypTxLa/Bi8/ngXdeBjfll1vTox3mlGP5bisJ+ergORCb10/X
 c8NQ==
X-Gm-Message-State: AAQBX9fqkHpcto32dSpsGe6LUS/SySf587daatWgUrYrxyfMg6c9+L+g
 IczM5X3YI4WeH2r2ZQBqpQwBU3eM05kbqZYoTUE19qrQ/eZ31SGMX5jHag90BSsyZ9rxjOlLA3z
 gWuCRPuGGu+gSi8gZl1zNk9MLyw==
X-Received: by 2002:a17:906:1dd4:b0:92a:8067:7637 with SMTP id
 v20-20020a1709061dd400b0092a80677637mr476861ejh.61.1680571708918; 
 Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZpQfzYsSTyZHq2rBGoLqdwt6NU1J/h3ko86D9IEobUotm8XZXJaMVYF9BCnMtF6nYkOmpx4A==
X-Received: by 2002:a17:906:1dd4:b0:92a:8067:7637 with SMTP id
 v20-20020a1709061dd400b0092a80677637mr476837ejh.61.1680571708714; 
 Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 ty25-20020a170907c71900b00948ca65d61fsm1287053ejc.140.2023.04.03.18.28.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:28 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:37 +0200
Message-Id: <20230404012741.116502-12-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 11/15] drm/nouveau: fence: fail to
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
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
2.39.2

