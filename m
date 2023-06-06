Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BAC6724FB6
	for <lists+nouveau@lfdr.de>; Wed,  7 Jun 2023 00:32:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 756A410E3FC;
	Tue,  6 Jun 2023 22:32:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28BDC10E3EE
 for <nouveau@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090743;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
 b=aVDGyiM67lZnhp0jpVgPK2BB1JRG9cYFIEXqpDIY0HFKXeu0GqbdaBp/TY95wLKMbd7ncE
 GS4yhCw2S0sN5vzXSazDSbFVqS8UD8RaDzhB/Sedr2ar5z3yzca0Ry76PomLghsvhlknZY
 7kXKZsE10iSw+DClw6xNlZ+fY9w+qFw=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-rBRY1gDeNXmWIcDMK-FRsA-1; Tue, 06 Jun 2023 18:32:22 -0400
X-MC-Unique: rBRY1gDeNXmWIcDMK-FRsA-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-977e50b0120so215607866b.0
 for <nouveau@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090740; x=1688682740;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c36xFgwQHAoO1A1GCpabxO1lgFTUT+xWChVASPsKB44=;
 b=UjjwHgk37vEDIujy5lv2uddkK7zs+56gv+H71ZxGEGo0E+1nB9qHld1clfFDYx2XTp
 4gpWRD+h8jdDTZ+ikHcaufZKZlQMSwLxiO5c+4F8L42I4oue8dXJ+N7g2AjVRgFIb6ch
 Th3oBP44fEHuKNQLElx98XPBat0Jy030Ges04OQeyXDtnPSVKL8JaLPIUCWdT75oxEsF
 ouL8DjNdCKyAHXJ7z7wkxKPcmAmP4YMxDLquhJob7yxJy+pYx5TeE8vyOYy8T4JHRl66
 FKLI7Rw5aLN0P5nUIRFR0SIEhnrV2sfMpgWT7GZA1t6EzheB2y5oJebiTzWqBHkURuVR
 E8fg==
X-Gm-Message-State: AC+VfDyVd3+pSdNXRDMb/kCSzsbne5Rpx5FwywgkGsuG/lZwXCPw4OF5
 hYKia1ank+XKbEqSEmvV07Yv6iXM3LY+Tq2DQKv84aoZVnPe32y7LrtrlDzQRECpCMpjWYuWfyh
 JA0EzBdYdE1By/BEAGkLzCDBysw==
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id
 gn26-20020a1709070d1a00b00974419d7847mr3616077ejc.71.1686090740768; 
 Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4c77MVfNEYeE8GhdIDJycSs/OSi0sKY1h3c6R7iuE+ANA00tKPgkq6qTOt3RlMI31QUCDJhQ==
X-Received: by 2002:a17:907:d1a:b0:974:419d:7847 with SMTP id
 gn26-20020a1709070d1a00b00974419d7847mr3616072ejc.71.1686090740566; 
 Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bg11-20020a170906a04b00b0094f282fc29asm6060829ejb.207.2023.06.06.15.32.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:20 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Wed,  7 Jun 2023 00:31:26 +0200
Message-Id: <20230606223130.6132-11-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v4 10/14] drm/nouveau: fence: fail to
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
2.40.1

