Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70E1C7360BA
	for <lists+nouveau@lfdr.de>; Tue, 20 Jun 2023 02:43:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D488410E24C;
	Tue, 20 Jun 2023 00:43:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BADB810E24A
 for <nouveau@lists.freedesktop.org>; Tue, 20 Jun 2023 00:43:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687221803;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
 b=X/s2BCR36cQtIAVJ4eMOlUuPCeRh9TZUNrlXZing+eIHB2/UlQNBlcs36+/nNCs6Qq/EqX
 hEXEXtyJseCff4PbU7EKtXNrIrMuv3T3Wek1vMUdx9dY37e/sTBfaMbI2RVdnwpccZgo+N
 TFr99O5DEn9XalwjyGLY0OjNNb/maVE=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-630-vMCMmlFnNDeqXi0R8VIklQ-1; Mon, 19 Jun 2023 20:43:20 -0400
X-MC-Unique: vMCMmlFnNDeqXi0R8VIklQ-1
Received: by mail-ej1-f71.google.com with SMTP id
 a640c23a62f3a-978a991c3f5so321593066b.0
 for <nouveau@lists.freedesktop.org>; Mon, 19 Jun 2023 17:43:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687221799; x=1689813799;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
 b=N8jnvjpN+V3HIPkwt1isVFcPcYQsvrfMy/oBTGhZj5uB7Ac9TAldmchx6z/Wj4Pq37
 sL42i4MihoKFW81Wern77mN11AYDEcrlsJBy+z8W+kYoCx5BKnROp/DjltI/iR8YDIzD
 vGrwbK9JpDvxnprH4fCqe97TwyqdGTj3jABlI0+iamdsMyIuG+NjXy2GLvzFKkr/dSi2
 9/VyJD+K0tujz8qrlcLYE8xTqH/6SkMJoWwr50/0NkrbQjTE0NjUlCBiJbwZtRFNK/On
 aYUxOcXNfSbcSJNZKF0J//CIPBJZOxHx8oZEvJ9iMBAAyaEBbXqBnPj+lid1op7/HCXb
 Xxhg==
X-Gm-Message-State: AC+VfDzO8wm6y95/S2KCqMKdS/I1PenChDY0NYbbfe0lJ4FuSBy1znWr
 5IHEfb8SCbHV7P0NhZjqFcLPMR7V94h46qxbGuFw7bIpbUIdD6R2Z8dcUyfcoVcSolobr2HiwvP
 MbrhQUNyw+cExOyoocILEbA6JZA==
X-Received: by 2002:a17:907:9495:b0:982:a065:331d with SMTP id
 dm21-20020a170907949500b00982a065331dmr9791774ejc.60.1687221799663; 
 Mon, 19 Jun 2023 17:43:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ65fHuJnAW0DqDalRe8IFameBpvYe1u3W5keeHpov/NpqxjPQb0EmGROEVydntX30L57FauPQ==
X-Received: by 2002:a17:907:9495:b0:982:a065:331d with SMTP id
 dm21-20020a170907949500b00982a065331dmr9791756ejc.60.1687221799456; 
 Mon, 19 Jun 2023 17:43:19 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 rh8-20020a17090720e800b0098282bb8effsm375959ejb.196.2023.06.19.17.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 17:43:18 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue, 20 Jun 2023 02:42:14 +0200
Message-Id: <20230620004217.4700-12-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230620004217.4700-1-dakr@redhat.com>
References: <20230620004217.4700-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v5 11/14] drm/nouveau: chan: provide
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
Cc: linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org
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
2.40.1

