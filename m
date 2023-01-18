Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EF68E6713A8
	for <lists+nouveau@lfdr.de>; Wed, 18 Jan 2023 07:14:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A8A010E69A;
	Wed, 18 Jan 2023 06:14:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BD8110E697
 for <nouveau@lists.freedesktop.org>; Wed, 18 Jan 2023 06:14:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1674022447;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=arClRUS1jAAdkcFM0OKNg8mvWVVAlTJxmoO3YVnMeNE=;
 b=D1HGGlW2SM2XACUjsrlM8Gqxxl+oAZWif7ipovjxyvcWDzpQ/I8iKmwkbPgwD/XhOEaeg/
 Vi0NPuTZxCYD8D6vhvSA491x8CctFWixB74oNn6y/Qrs87gVDSb1caGEPAakrhnR2IBYB2
 gAjzxjsR/YAPFvulFFZXMFzxMOUM1og=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-626-y09v7t0xMeebXtCuOcLbGA-1; Wed, 18 Jan 2023 01:14:06 -0500
X-MC-Unique: y09v7t0xMeebXtCuOcLbGA-1
Received: by mail-ej1-f70.google.com with SMTP id
 sc9-20020a1709078a0900b0086910fdf624so10744847ejc.13
 for <nouveau@lists.freedesktop.org>; Tue, 17 Jan 2023 22:14:06 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=arClRUS1jAAdkcFM0OKNg8mvWVVAlTJxmoO3YVnMeNE=;
 b=op2xwo6huUAEA8hprL82J0kSrtV0X9YY3AyXooDfEM47w0zthbhhWet7Qw6MuA5S83
 +yJo4fXGzRMjLZJuJji6R60eAbolij261CTuR1QghXNGzFlmM1MSrxg7i5QoYZ0duzft
 qirCWi+e4XC8NwUCu3ej4Eg0vujRbT26Kgd77eY0JngLNqYvPMCGFxZulRzJRMjd5fhD
 UtdaYG6m5OAF/XV884MCE62/H54tDOX9yCmOQV7CzIuZrupnNKMjprAAoIYNbrDo10hQ
 VHInxZaBOjY92pQUbrkfsgmaV4A3oq/1tS7kyg/k/4Y2ma8poFuycYxObCuWQ1EUnWyV
 QORw==
X-Gm-Message-State: AFqh2kpXmS2RHPGTZFO4V+ocOhxsSm6iQaBODd8gyzDeLK45GDxWMISb
 3uihfnlSfGAWOO2wTvAm4Sk1lmpfa/8TDXiGgDswq+ET/K2bppJ1/VDn2Ii9J6q2JPkAjvsXtrP
 5YuA3dNA8uVuc8YmcRAvjmI6QiQ==
X-Received: by 2002:a17:906:d971:b0:870:7e7d:97a7 with SMTP id
 rp17-20020a170906d97100b008707e7d97a7mr5281479ejb.72.1674022445708; 
 Tue, 17 Jan 2023 22:14:05 -0800 (PST)
X-Google-Smtp-Source: AMrXdXvpsASk83uq4IIpUYeM6NlUZGHTvMFacGsEyh3xonT5oiC/C+OajcLwYQPPr8OmFy9NfpFhjQ==
X-Received: by 2002:a17:906:d971:b0:870:7e7d:97a7 with SMTP id
 rp17-20020a170906d97100b008707e7d97a7mr5281469ejb.72.1674022445535; 
 Tue, 17 Jan 2023 22:14:05 -0800 (PST)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de78:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 f22-20020a17090631d600b00779cde476e4sm14066480ejf.62.2023.01.17.22.14.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 17 Jan 2023 22:14:05 -0800 (PST)
From: Danilo Krummrich <dakr@redhat.com>
To: daniel@ffwll.ch, airlied@redhat.com, christian.koenig@amd.com,
 bskeggs@redhat.com, jason@jlekstrand.net, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net
Date: Wed, 18 Jan 2023 07:12:52 +0100
Message-Id: <20230118061256.2689-11-dakr@redhat.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230118061256.2689-1-dakr@redhat.com>
References: <20230118061256.2689-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next 10/14] drm/nouveau: chan: provide
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
index 1068abe41024..6f47e997d9cf 100644
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
2.39.0

