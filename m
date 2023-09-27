Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B74837AF7AA
	for <lists+nouveau@lfdr.de>; Wed, 27 Sep 2023 03:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D4A9510E45A;
	Wed, 27 Sep 2023 01:23:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66B3710E45A
 for <nouveau@lists.freedesktop.org>; Wed, 27 Sep 2023 01:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1695777800;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZETDgcYvXOS2PC7AkZaizV/fB2zEHp6MDIY6hZZOccc=;
 b=BctqXifBKMBdi2z+jCxP7i97A1qDkU6i6OrH0X3PDJOQh+Qwu5Fz5JUlx4MB7rUbFhdjbs
 3uTckcy5EafhMf3FVVwCP0oBzdUDDoJfiX86p0L1xR/2lBE5bAbEs/Ju2SEHYIsmh40mos
 Yl++M6+oNC4A1tRzE4YKAzzoN+gILVM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-12-eZz_kq9KMEKGkkFhlIKaDQ-1; Tue, 26 Sep 2023 21:23:16 -0400
X-MC-Unique: eZz_kq9KMEKGkkFhlIKaDQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 5b1f17b1804b1-4053d832d51so80785985e9.0
 for <nouveau@lists.freedesktop.org>; Tue, 26 Sep 2023 18:23:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695777795; x=1696382595;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZETDgcYvXOS2PC7AkZaizV/fB2zEHp6MDIY6hZZOccc=;
 b=TczaC0iz4cuhSMxLCbELFSIh/MJklNjSBWoBeL7RWU+bT1Yf9SseFAKpQsNfdv0F+1
 koTiu+hX5dWA32axJJFeHL4suBbKQpSCh6L4KcNztWJugabsv+JVhXhU1Winl6DtV3id
 ODutF5NcncNa6+MzRwIBJnD9qb4J8EoBAhqxO8NZqNEuu4P028r8GxOaz0Vuqi8oqACI
 frbO1po5AOiqkHlEhYREcaqeUiv/5eLYKDvIBTozo1IIaS/KmRrSH4oFliavN5TmUEU5
 +RBfYSwm/p12Bx2tCbQQRaQUTBWWef8xSt3e7A7PDtWUO6dBV5QzbpdrRtwqmpIYmv8g
 0RZQ==
X-Gm-Message-State: AOJu0YxCn/2Zc8xXbw04Fh+Y7O0+xMNbmC2nYIAWhxwvjksWDiGZEa83
 GSWUjHe78BMBNMcg+hff5HVCgAJ7Rwhs8987c29G9Z36M0wRxZW2xIUeb6p6gUyWGoGHL+B0PPB
 ep51P0Dya+kUP9PWxIEGYrXTYQwEOoRtjBMyejOuXqKF17bGOzr8J+OAxuOQ517YifaZh1DI0j2
 Ob/xqK
X-Received: by 2002:adf:ea8f:0:b0:31f:e980:df87 with SMTP id
 s15-20020adfea8f000000b0031fe980df87mr290043wrm.38.1695777795018; 
 Tue, 26 Sep 2023 18:23:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGVLakBRZsPHTBTealZhSS4Mg1lASQDH5Mr2lGrw3qzjNzqiI1eKkrPUfmWnfAJkwfzn3DeGQ==
X-Received: by 2002:adf:ea8f:0:b0:31f:e980:df87 with SMTP id
 s15-20020adfea8f000000b0031fe980df87mr290024wrm.38.1695777794592; 
 Tue, 26 Sep 2023 18:23:14 -0700 (PDT)
Received: from cassiopeiae.. ([2a02:810d:4b3f:de9c:642:1aff:fe31:a19f])
 by smtp.gmail.com with ESMTPSA id
 bg1-20020a170906a04100b009adce1c97ccsm8495842ejb.53.2023.09.26.18.23.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 18:23:14 -0700 (PDT)
From: Danilo Krummrich <dakr@redhat.com>
To: nouveau@lists.freedesktop.org,
	faith.ekstrand@collabora.com
Date: Wed, 27 Sep 2023 03:22:53 +0200
Message-ID: <20230927012303.23525-3-dakr@redhat.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230927012303.23525-1-dakr@redhat.com>
References: <20230927012303.23525-1-dakr@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset="US-ASCII"; x-default=true
Subject: [Nouveau] [PATCH 3/3] drm/nouveau: exec: report max pushs through
 getparam
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Report the maximum number of IBs that can be pushed with a single
DRM_IOCTL_NOUVEAU_EXEC through DRM_IOCTL_NOUVEAU_GETPARAM.

While the maximum number of IBs per ring might vary between chipsets,
the kernel will make sure that userspace can only push a fraction of the
maximum number of IBs per ring per job, such that we avoid a situation
where there's only a single job occupying the ring, which could
potentially lead to the ring run dry.

Using DRM_IOCTL_NOUVEAU_GETPARAM to report the maximum number of IBs
that can be pushed with a single DRM_IOCTL_NOUVEAU_EXEC implies that
all channels of a given device have the same ring size.

Signed-off-by: Danilo Krummrich <dakr@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 19 +++++++++++++++++++
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  2 +-
 drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 +++
 drivers/gpu/drm/nouveau/nouveau_exec.c  |  7 ++++---
 drivers/gpu/drm/nouveau/nouveau_exec.h  |  5 +++++
 include/uapi/drm/nouveau_drm.h          | 10 ++++++++++
 6 files changed, 42 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index 30afbec9e3b1..1a198689b391 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -31,6 +31,7 @@
 
 #include "nouveau_drv.h"
 #include "nouveau_dma.h"
+#include "nouveau_exec.h"
 #include "nouveau_gem.h"
 #include "nouveau_chan.h"
 #include "nouveau_abi16.h"
@@ -183,6 +184,20 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 	cli->abi16 = NULL;
 }
 
+static inline unsigned int
+getparam_dma_ib_max(struct nvif_device *device)
+{
+	const struct nvif_mclass dmas[] = {
+		{ NV03_CHANNEL_DMA, 0 },
+		{ NV10_CHANNEL_DMA, 0 },
+		{ NV17_CHANNEL_DMA, 0 },
+		{ NV40_CHANNEL_DMA, 0 },
+		{}
+	};
+
+	return nvif_mclass(&device->object, dmas) < 0 ? NV50_DMA_IB_MAX : 0;
+}
+
 int
 nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 {
@@ -247,6 +262,10 @@ nouveau_abi16_ioctl_getparam(ABI16_IOCTL_ARGS)
 	case NOUVEAU_GETPARAM_GRAPH_UNITS:
 		getparam->value = nvkm_gr_units(gr);
 		break;
+	case NOUVEAU_GETPARAM_EXEC_PUSH_MAX:
+		getparam->value = getparam_dma_ib_max(device) /
+				  NOUVEAU_EXEC_PUSH_MAX_DIV;
+		break;
 	default:
 		NV_PRINTK(dbg, cli, "unknown parameter %lld\n", getparam->param);
 		return -EINVAL;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index ac56f4689ee3..c3c2ab887978 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -456,7 +456,7 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		chan->user_get = 0x44;
 		chan->user_get_hi = 0x60;
 		chan->dma.ib_base =  0x10000 / 4;
-		chan->dma.ib_max  = (0x02000 / 8) - 1;
+		chan->dma.ib_max  = NV50_DMA_IB_MAX;
 		chan->dma.ib_put  = 0;
 		chan->dma.ib_free = chan->dma.ib_max - chan->dma.ib_put;
 		chan->dma.max = chan->dma.ib_base;
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index 1744d95b233e..c52cda82353e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -49,6 +49,9 @@ void nv50_dma_push(struct nouveau_channel *, u64 addr, u32 length,
 /* Maximum push buffer size. */
 #define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
 
+/* Maximum IBs per ring. */
+#define NV50_DMA_IB_MAX ((0x02000 / 8) - 1)
+
 /* Object handles - for stuff that's doesn't use handle == oclass. */
 enum {
 	NvDmaFB		= 0x80000002,
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index ba6913a3efb6..5b5c4a77b8e6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -346,7 +346,7 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	struct nouveau_channel *chan = NULL;
 	struct nouveau_exec_job_args args = {};
 	struct drm_nouveau_exec *req = data;
-	int ret = 0;
+	int push_max, ret = 0;
 
 	if (unlikely(!abi16))
 		return -ENOMEM;
@@ -371,9 +371,10 @@ nouveau_exec_ioctl_exec(struct drm_device *dev,
 	if (!chan->dma.ib_max)
 		return nouveau_abi16_put(abi16, -ENOSYS);
 
-	if (unlikely(req->push_count > NOUVEAU_GEM_MAX_PUSH)) {
+	push_max = chan->dma.ib_max / NOUVEAU_EXEC_PUSH_MAX_DIV;
+	if (unlikely(req->push_count > push_max)) {
 		NV_PRINTK(err, cli, "pushbuf push count exceeds limit: %d max %d\n",
-			 req->push_count, NOUVEAU_GEM_MAX_PUSH);
+			  req->push_count, push_max);
 		return nouveau_abi16_put(abi16, -EINVAL);
 	}
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.h b/drivers/gpu/drm/nouveau/nouveau_exec.h
index b815de2428f3..c6270452e4b5 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.h
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.h
@@ -6,6 +6,11 @@
 #include "nouveau_drv.h"
 #include "nouveau_sched.h"
 
+/* Divider to limit the number of IBs per job to half the size of the ring in
+ * order to avoid the ring running dry between submissions.
+ */
+#define NOUVEAU_EXEC_PUSH_MAX_DIV 2
+
 struct nouveau_exec_job_args {
 	struct drm_file *file_priv;
 	struct nouveau_sched_entity *sched_entity;
diff --git a/include/uapi/drm/nouveau_drm.h b/include/uapi/drm/nouveau_drm.h
index 8d7402c13e56..eaf9f248619f 100644
--- a/include/uapi/drm/nouveau_drm.h
+++ b/include/uapi/drm/nouveau_drm.h
@@ -44,6 +44,16 @@ extern "C" {
 #define NOUVEAU_GETPARAM_PTIMER_TIME     14
 #define NOUVEAU_GETPARAM_HAS_BO_USAGE    15
 #define NOUVEAU_GETPARAM_HAS_PAGEFLIP    16
+
+/**
+ * @NOUVEAU_GETPARAM_EXEC_PUSH_MAX
+ *
+ * Query the maximum amount of IBs that can be pushed through a single
+ * &drm_nouveau_exec structure and hence a single &DRM_IOCTL_NOUVEAU_EXEC
+ * ioctl().
+ */
+#define NOUVEAU_GETPARAM_EXEC_PUSH_MAX   17
+
 struct drm_nouveau_getparam {
 	__u64 param;
 	__u64 value;
-- 
2.41.0

