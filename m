Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 169806D55F7
	for <lists+nouveau@lfdr.de>; Tue,  4 Apr 2023 03:28:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C76510E29F;
	Tue,  4 Apr 2023 01:28:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 84D9C10E29F
 for <nouveau@lists.freedesktop.org>; Tue,  4 Apr 2023 01:28:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680571716;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=rFDnwLdkC+a84lmheZyyv02Y7sEGNyBLjO5UYHqgwOc=;
 b=LlnKWRnFCc5EkehYYVlZliL+rGxFzAvyd3VHmMQi8aInFu2tGmH1CtskNiceI5XR2xd+Vx
 PMh/ww6HgCfqchjwows+g9LQSu1YOAUaIysJ48LHmReNx00zCxXgNYE0tLtgSflTG04lly
 15HGIoUgoeC6vTrZm0cEpSoj9VprxSk=
Received: from mail-ed1-f70.google.com (mail-ed1-f70.google.com
 [209.85.208.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-460-Ak0ZyIBUOvegFNE5nzcmdw-1; Mon, 03 Apr 2023 21:28:33 -0400
X-MC-Unique: Ak0ZyIBUOvegFNE5nzcmdw-1
Received: by mail-ed1-f70.google.com with SMTP id
 u30-20020a50c05e000000b0050299de3f82so7825238edd.10
 for <nouveau@lists.freedesktop.org>; Mon, 03 Apr 2023 18:28:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680571712;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rFDnwLdkC+a84lmheZyyv02Y7sEGNyBLjO5UYHqgwOc=;
 b=A95GaH4bPC+ahCOtjXk7cB3CUg8B9EHecTOBH7vgSik6uT1y54Nt0lxClNwsc8oXwx
 1AlkYDKVyXw3ZanRtvKhrYjNAtLP2gnAp8zPlLKAADoqOeqPbDPhVpiv/cM/jkJNU5A6
 cPPTauAwN73CnHwxlE59v81OSzRw69IPP+AJWISwtUSvzTM0ZbYCmtzWPskqNk8wJV85
 fcguqu/1pG31+vup9ZWgwjMRFPFfJC9yOC6LYVFz/QbB1ORJwFieDEdFgAJaTMajQkn1
 0x9aOKQIS/ys0VQdwnqIPYx12bxv5IunyFK7f2kfqKYnOuU48ZWiCS7Zva9FBU7WQA5A
 BZzA==
X-Gm-Message-State: AAQBX9e3XEuHhoIUYgcLwmAqVfulzIbKzMkw+J9s+FfHs86FGzwc65QZ
 azR8Tv5OxCtsa7m/1q9Naw/5oOwaFuO1L40TtYWQCQcBnb/8tHT9mJtC+R9qUvOyptbPpQsPR7B
 uuFFFxOnjtXbIq4gWfXzSfkDACQ==
X-Received: by 2002:a17:907:3f22:b0:931:86cf:9556 with SMTP id
 hq34-20020a1709073f2200b0093186cf9556mr754091ejc.23.1680571712722; 
 Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
X-Google-Smtp-Source: AKy350bTvpbIk/GmxFlxt18RFwL9YdKIZ4Q77ktCoQzFycA8gGsVYWiQjvWZuLDin9qz3iy+Fs1c5A==
X-Received: by 2002:a17:907:3f22:b0:931:86cf:9556 with SMTP id
 hq34-20020a1709073f2200b0093186cf9556mr754076ejc.23.1680571712535; 
 Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 n6-20020a5099c6000000b004aee4e2a56esm5318778edb.0.2023.04.03.18.28.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Apr 2023 18:28:32 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Tue,  4 Apr 2023 03:27:38 +0200
Message-Id: <20230404012741.116502-13-dakr@redhat.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230404012741.116502-1-dakr@redhat.com>
References: <20230404012741.116502-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v3 12/15] drm/nouveau: chan: provide
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
2.39.2

