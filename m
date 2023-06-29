Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 55C96743076
	for <lists+nouveau@lfdr.de>; Fri, 30 Jun 2023 00:27:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A763010E40E;
	Thu, 29 Jun 2023 22:27:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9682F10E407
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 22:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1688077661;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
 b=CJUJ5rn/C2kN1gfm0r0DAjLj8EvXGXtXhPSPl6TpD4h1Dsu+E48vCHTKN+j0U67vW9a9cL
 1YwbdVssb8dKrlN0WHZcDOEeNdDqelGsm7nVkx19skCWNxV8DRGEPVEYmuB04otqzuzpC1
 bSZsOyYR/5uXowzyzWo41pNq+Cw7+/k=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-646-GLLW0o3yPtW9ispDu3wWEA-1; Thu, 29 Jun 2023 18:27:40 -0400
X-MC-Unique: GLLW0o3yPtW9ispDu3wWEA-1
Received: by mail-wr1-f70.google.com with SMTP id
 ffacd0b85a97d-30793c16c78so1510185f8f.3
 for <nouveau@lists.freedesktop.org>; Thu, 29 Jun 2023 15:27:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688077659; x=1690669659;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OhcRjSdJAD7B8JiFY4weu/O+VY7c03xht8db5Jb3htY=;
 b=ghm6ElZekGv4DCN5ud4CugNMcbbjjrJp19neg8ET1VDDOPXcFoNEkEJMv1VnlPNoyY
 LoM1YBCCSIYtMoFx2FGKBfhbTjDR6Ful0arjwyiVHpbN0lD887AYHJKOlul+tJ9uAW+t
 cnL/ih7/Wn3+p4fLcWx5sGnUOuclBVo4lLuybbD2YfZsKop5GggSFFyvj6UuexMJezNh
 QyGTtDsp9vF4UVuD0ZI+nYnR+L/qlThHzYUYZ/qPgNgFzR7aMgLfx6+UlPITLioyep/q
 enUqfSD4sDWMCkYzURy1mJCjpUNOQgEImu2ADut086tjoCwUbo3rmXHLn9/R6bybnP3p
 i3pQ==
X-Gm-Message-State: ABy/qLZXinWV58CVjb8RwkFsAIJu40gkAGHZ3oCo9GO/IhcgtAGPeJvO
 ASlPAlib/ueZJde71vA7PMAKOTw6rauy1wX17N/jB2cFLiCRGFs6f9rC9sr4TpOO1794cP+oGK6
 tGAMx895p81kT9wbZgUnO95Ggvg==
X-Received: by 2002:adf:f28a:0:b0:311:1568:1a27 with SMTP id
 k10-20020adff28a000000b0031115681a27mr722434wro.58.1688077659429; 
 Thu, 29 Jun 2023 15:27:39 -0700 (PDT)
X-Google-Smtp-Source: APBJJlGYb5Wgg/1T3gtMJf3AhAuqKo+DOyNfQQJbukx21HHyRFpotXA0HiBkab6nrmXgZEaQvmsoDw==
X-Received: by 2002:adf:f28a:0:b0:311:1568:1a27 with SMTP id
 k10-20020adff28a000000b0031115681a27mr722418wro.58.1688077659167; 
 Thu, 29 Jun 2023 15:27:39 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 v10-20020a5d590a000000b002fda1b12a0bsm16983121wrd.2.2023.06.29.15.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Jun 2023 15:27:38 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Fri, 30 Jun 2023 00:25:26 +0200
Message-ID: <20230629222651.3196-11-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230629222651.3196-1-dakr@redhat.com>
References: <20230629222651.3196-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v6 10/13] drm/nouveau: chan: provide
 nouveau_channel_kill()
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
will allow asynchronous jobs processing push buffers and emitting fences.

If a job times out, we need a way to recover from this situation. For
now, simply kill the channel to unblock all hung up jobs and signal
userspace that the device is dead on the next EXEC or VM_BIND ioctl.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_chan.c | 14 +++++++++++---
 drivers/gpu/drm/nouveau/nouveau_chan.h |  1 +
 2 files changed, 12 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index f47c0363683c..a975f8b0e0e5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -40,6 +40,14 @@ MODULE_PARM_DESC(vram_pushbuf, "Create DMA push buffers in VRAM");
 int nouveau_vram_pushbuf;
 module_param_named(vram_pushbuf, nouveau_vram_pushbuf, int, 0400);
 
+void
+nouveau_channel_kill(struct nouveau_channel *chan)
+{
+	atomic_set(&chan->killed, 1);
+	if (chan->fence)
+		nouveau_fence_context_kill(chan->fence, -ENODEV);
+}
+
 static int
 nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 {
@@ -47,9 +55,9 @@ nouveau_channel_killed(struct nvif_event *event, void *repv, u32 repc)
 	struct nouveau_cli *cli = (void *)chan->user.client;
 
 	NV_PRINTK(warn, cli, "channel %d killed!\n", chan->chid);
-	atomic_set(&chan->killed, 1);
-	if (chan->fence)
-		nouveau_fence_context_kill(chan->fence, -ENODEV);
+
+	if (unlikely(!atomic_read(&chan->killed)))
+		nouveau_channel_kill(chan);
 
 	return NVIF_EVENT_DROP;
 }
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index e06a8ffed31a..e483f4a254da 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -65,6 +65,7 @@ int  nouveau_channel_new(struct nouveau_drm *, struct nvif_device *, bool priv,
 			 u32 vram, u32 gart, struct nouveau_channel **);
 void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
+void nouveau_channel_kill(struct nouveau_channel *);
 
 extern int nouveau_vram_pushbuf;
 
-- 
2.41.0

