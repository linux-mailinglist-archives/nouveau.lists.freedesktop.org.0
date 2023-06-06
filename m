Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96BC9724FBA
	for <lists+nouveau@lfdr.de>; Wed,  7 Jun 2023 00:32:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 052BF10E3FF;
	Tue,  6 Jun 2023 22:32:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B972310E3F9
 for <nouveau@lists.freedesktop.org>; Tue,  6 Jun 2023 22:32:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686090749;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
 b=Nko23oYzEPY6mnlFp/YYzcFsqfw9nS3olFVkwdR1i2cpr+3QaDnl3Oqs2K41B+vNMQp8NF
 Xsh/KIg2N2mJVd7avvh56vXnPhqEN1YXgG0CmKrEh6xQ/ukSzZB1hTeUPW2X8HTBcX+ItF
 cVRWnoSiFfpD6Sq3xzzDsYitrneLcdQ=
Received: from mail-ej1-f72.google.com (mail-ej1-f72.google.com
 [209.85.218.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-297-xfz5lUTEOcm81ZIfJHLk1Q-1; Tue, 06 Jun 2023 18:32:26 -0400
X-MC-Unique: xfz5lUTEOcm81ZIfJHLk1Q-1
Received: by mail-ej1-f72.google.com with SMTP id
 a640c23a62f3a-975942c2a29so359808566b.0
 for <nouveau@lists.freedesktop.org>; Tue, 06 Jun 2023 15:32:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686090745; x=1688682745;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+GODPjGDP/v7EDtsYhu3OhDhbf8tl4sgje/Azf5bvXY=;
 b=ia97A0l/0FPGuYoJplM2xxT01nCfNSsiAaP8Mgd6QWsdY7IPT8X2gR4wneuiiup8or
 c4IFpHMDq5erX3UBJi78qIsfqU4Qy86w2vwxCT2PAlLozEkr3svq0VGWS6eiOOKkORqX
 aBdaCHinnyJu3p5TM7a2tBNXC1iJ1YJeiswTiq9hiomZSF4ciVUAq+tVGYBidJHaVTkE
 5IY8uuIUsxCnPUfATpkwe9lMocNTlbC7af9a4OmnduK2hKsvVvnmZNwD8nepWtXMQJ/4
 n7nQSrtb/xhGLCmeLPV4h5Vlfvl0z7Nm+6rJPcimEcpr5hzuOA8jM1BMZpMzVvVXpZQa
 TSZg==
X-Gm-Message-State: AC+VfDxYDMp2i+UfbmPFgszlx0AXSjs1J7g17wGmcqYbngC32s8d07TM
 +7F/L15MXYZJ8FE04f9tPtXGUfRSrksDg1pav7P2PqbD55XvVJzvuQhVXc7H1xURKw7611G+EYP
 dTCyYdv9/QwUr4aC+SwIMUFsdhA==
X-Received: by 2002:a17:907:6d8c:b0:977:1dae:2500 with SMTP id
 sb12-20020a1709076d8c00b009771dae2500mr3524994ejc.1.1686090745178; 
 Tue, 06 Jun 2023 15:32:25 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5pXjStykgCRHkdCNjmAkm6vVNZZG6Y41YgQd0R/5sajw/EqO04vf8XvQY4ctgh++fIqqeaSg==
X-Received: by 2002:a17:907:6d8c:b0:977:1dae:2500 with SMTP id
 sb12-20020a1709076d8c00b009771dae2500mr3524986ejc.1.1686090745037; 
 Tue, 06 Jun 2023 15:32:25 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 m26-20020a17090607da00b00977d6723bd6sm3457973ejc.195.2023.06.06.15.32.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Jun 2023 15:32:24 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: airlied@gmail.com, daniel@ffwll.ch, tzimmermann@suse.de,
 mripard@kernel.org, corbet@lwn.net, christian.koenig@amd.com,
 bskeggs@redhat.com, Liam.Howlett@oracle.com, matthew.brost@intel.com,
 boris.brezillon@collabora.com, alexdeucher@gmail.com, ogabbay@kernel.org,
 bagasdotme@gmail.com, willy@infradead.org, jason@jlekstrand.net
Date: Wed,  7 Jun 2023 00:31:27 +0200
Message-Id: <20230606223130.6132-12-dakr@redhat.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230606223130.6132-1-dakr@redhat.com>
References: <20230606223130.6132-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH drm-next v4 11/14] drm/nouveau: chan: provide
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

