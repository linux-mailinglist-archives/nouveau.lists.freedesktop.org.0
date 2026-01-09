Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19EF8D0BA62
	for <lists+nouveau@lfdr.de>; Fri, 09 Jan 2026 18:30:34 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 3B2CF10E923;
	Fri,  9 Jan 2026 17:30:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="GvooJNu3";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id F2E2344C82;
	Fri,  9 Jan 2026 17:22:06 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767979326;
 b=S8Wo4bbe3vRW5yrz7fRkIOVRkJBJmJjfgYH4R8CLKSnrrWVHZcUCNEPZ9GAlNA2J1Gh/6
 1rHRwlUi/URaxhn/Jku/suuO+GbaAL12y/xNfLper6Ft9OpPkPhNAuFKBEgwYtzE8fIiws0
 Mw04ht0qXcZegFSGKFpjPPEiR0heiJXXrvcbFBrW0eUE7XvHKcGkU1XbrAMRzcUyL3+pglV
 V0Z6q2eFkWGoOCaXbKibP2g0Vi866H9uy0GLVdGfuOGV3mSBbsi2q1jRNKhFJ83vn5jKASe
 XziEMKcabcea0rxcAdCHlNHfU1OKwnl1FEM+kK8IP0JXdT62oVpVJ06Q16dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767979326; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=c4pndAZp3XUCZdYMEMFqYX+gyvVUXnO23TwwbWPj1IU=;
 b=fPl+o6wP+HjCOUOGzQ5sKh8v/6mD82pKNBaKna2s2nrHBGRZqutCPwRL4TTV9QUwSdY0R
 jq9ur+7WrQ+a5TSNGG7rqD2fim+ZZ1q1A2wfAxp8waXMYdsHwS3tcsUr56c17W2O1yIXo5k
 J6HbFdxRwELpi9Cew2rP4RgVtxTlBSPKWNp0wNcUqkxW2absI+vn6Sd4E/spq41ecsjq6LH
 16ifvTe3RYhHqaMM37QJNAkWAnLckeW34KRpfyZxuhgmokLBtTBUwRmkkvdrZfAeODg1i5P
 Gpz0PPW1CqxCn7SMWWrwG7U153W4cfpJRypV6r8NFqH8KDaoQEfd5MLVHGhA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=mary.zone;
  arc=none (Message is not ARC signed);
  dmarc=none
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=mary.zone;
 arc=none (Message is not ARC signed); dmarc=none
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9B97344C4B
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:22:02 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
	by gabe.freedesktop.org (Postfix) with ESMTPS id B3F4A10E797
	for <nouveau@lists.freedesktop.org>; Fri,  9 Jan 2026 17:30:22 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-b79e7112398so734570266b.3
        for <nouveau@lists.freedesktop.org>;
 Fri, 09 Jan 2026 09:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mary.zone; s=google; t=1767979821; x=1768584621;
 darn=lists.freedesktop.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c4pndAZp3XUCZdYMEMFqYX+gyvVUXnO23TwwbWPj1IU=;
        b=GvooJNu3WFE2ZzCvkyuF7sgoDJ2E6C4LHE0b7puIvMgp95+YIxBZ5JFVb1MBxEAHg5
         a4vb1N9V5caP1+dfpD7PsgmDvOyS+hGS63/hedCrUx1o15+pC3aQsafXp/PRuJqDC4/W
         sLnyKHFPBUdVgXTgH6DkKTohSRm4whdG4ehrponP3JKJVLhS07ZnsK/9sB6aRqo6cYjZ
         oXjtaDcD3UDm1ntYsfMtJQbHsEgCAXfuBCm3SIDrmEpFx5VgTbKwQgW4DuEltb6qdvGn
         tjbkug/IWyI7o29DusBK9t7aFWDhKojLTgLhfd5IT5OH4FXvkBeb5+3RNVmgtNmfg7p3
         fLjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767979821; x=1768584621;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=c4pndAZp3XUCZdYMEMFqYX+gyvVUXnO23TwwbWPj1IU=;
        b=L5RCMverX8l69211X6Ze7N5VXBDSoEVmlypDB3t0ek1kDLW4mGPSbV/+pdS2UBg36r
         CCnCFshsOMdaPUaaQIgziNLZiqwF1ygGzWB0XdkTLCt2pBTR7yIfAwc99ZcIiGMrsDL6
         vs0HeE/25bpzTOcTbSZZFKFONAh1cB/p2GdlPQxZcPHYPj56CmLxLLsCcNAwdXKJQUJj
         xG705rPPDaH95xArTTDA5JdVrVhsVWblgsA63ocISH914jH08p6PblVR7M0nPzMW3xEG
         QTciAeQECZ3P07j93WUpYCRrtBQhfmK0pLXHqQtZCwSElMZmDhb33+7LOJJuzieM+jMf
         4CnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlzSPTgoicHXoiPRhKGGk1ezu+Kgl6P3QmtKkvDxAzIsom8lQWcUBCfzKWJLsnYoNdBC/wH7bg@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOUIggYdCAu7pRGRvORNaqA8wpiB03DLbrlmPE/bLpM50XfLB2
	TaBV8LbkbYvXqdGDoOlbZR2PzDxojaWbUFC4bNOUIAxhGA6rrjwvW01BKP4FW/YIPoQ=
X-Gm-Gg: AY/fxX5gG4Vdy0bdjcLfu1H0PRPoENdAJ1lNm/HduU5FTQ3VwZ8jDIKowD3R67MnGGH
	kyOIyFxGyFuJ8CSnc9oQ16ArXTJTBTIYLC9K89mzCv2e3RwNQ771upQv+YCaxqNslhONL4kHJVk
	0KnVqWgWl5VNnmJRX1ehdu3xkLHZZ+PkVTAudo/6/WoMXi4CCMhFyJv3JJas7kDjfqTgnfEY59t
	WGZMOq4f6MombdPjjdvMNuNzWAHtLOdLvfGG087dqmlD3HfW1e8spW71ZSB1ayHlQN4gAVWKtFK
	IKT8FBVreuTDF8oGTFwg/YAdDE5IKEYStEWVfT4A1cKriu8XJGG0dy3SmVZlTQDK2W9GqUU6lxh
	rCBVg3GtcmfpP5il00RSrWRhocklTIwmDVEZKrt98U9YQl7lnnwTevIqsPy0y1tAWJ5afPhnXkZ
	GnKBnlHuR102HNvibJDQD2QkMpAggxxrj3L0arqwBEffNAh3pBbrd2YPT5E4LWszCvH8YXElU=
X-Google-Smtp-Source: 
 AGHT+IHlRIJqTv050/JxoEGVWa701IUHS6s1jR7sh7piM48WsLHe74BonLRvxKWmwsHoeIZUx3Ag/A==
X-Received: by 2002:a17:907:7b91:b0:b7c:f5b6:bb52 with SMTP id
 a640c23a62f3a-b84453a0305mr1020235866b.43.1767979821138;
        Fri, 09 Jan 2026 09:30:21 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
        by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b842a230db0sm1195426266b.2.2026.01.09.09.30.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 09:30:20 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Date: Fri, 09 Jan 2026 18:30:11 +0100
Subject: [PATCH 2/3] drm/nouveau: Unify GPFIFO ring buffer max count query
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260109-nouveau-gpfifo-increase-v1-2-ed0be9822878@mary.zone>
References: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
In-Reply-To: <20260109-nouveau-gpfifo-increase-v1-0-ed0be9822878@mary.zone>
To: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
X-Mailer: b4 0.14.3
Message-ID-Hash: LPQJKA5BNKUGWI7UJL3SKZUSMCSYHGZD
X-Message-ID-Hash: LPQJKA5BNKUGWI7UJL3SKZUSMCSYHGZD
X-MailFrom: mary@mary.zone
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/LPQJKA5BNKUGWI7UJL3SKZUSMCSYHGZD/>
Archived-At: 
 <https://lore.freedesktop.org/20260109-nouveau-gpfifo-increase-v1-2-ed0be9822878@mary.zone/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Previously, the max count for the GPFIFO ring buffer was hardcoded in two
different places.

This patch adds a new function nouveau_channel_get_gpfifo_entries_count
to share the logic between the two side of the codebase allowing us to
later on increase the limit.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
 drivers/gpu/drm/nouveau/nouveau_abi16.c | 15 +++++++++++++--
 drivers/gpu/drm/nouveau/nouveau_chan.c  |  3 ++-
 drivers/gpu/drm/nouveau/nouveau_chan.h  | 12 ++++++++++++
 drivers/gpu/drm/nouveau/nouveau_dma.h   |  3 ---
 4 files changed, 27 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_abi16.c b/drivers/gpu/drm/nouveau/nouveau_abi16.c
index a3ba07fc48a0..a5445e97179f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_abi16.c
+++ b/drivers/gpu/drm/nouveau/nouveau_abi16.c
@@ -232,15 +232,26 @@ nouveau_abi16_fini(struct nouveau_abi16 *abi16)
 static inline int
 getparam_dma_ib_max(struct nvif_device *device)
 {
-	const struct nvif_mclass dmas[] = {
+	const struct nvif_mclass hosts[] = {
 		{ NV03_CHANNEL_DMA, 0 },
 		{ NV10_CHANNEL_DMA, 0 },
 		{ NV17_CHANNEL_DMA, 0 },
 		{ NV40_CHANNEL_DMA, 0 },
 		{}
 	};
+	int cid;
+	u32 res;
 
-	return nvif_mclass(&device->object, dmas) < 0 ? NV50_DMA_IB_MAX : 0;
+	cid = nvif_mclass(&device->object, hosts);
+	if (cid < 0)
+		res = NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
+	else
+		res = nouveau_channel_get_gpfifo_entries_count(hosts[cid].oclass);
+
+	if (res == 0)
+		return 0;
+
+	return res - 1;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index b646212a34b3..8695b5d6aefc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -274,7 +274,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	struct nouveau_channel *chan;
 	const u64 plength = 0x10000;
 	const u64 ioffset = plength;
-	const u64 ilength = 0x02000;
+	u64 ilength;
 	int cid, ret;
 	u64 size;
 
@@ -282,6 +282,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	if (cid < 0)
 		return cid;
 
+	ilength = nouveau_channel_get_gpfifo_entries_count(hosts[cid].oclass) * 8;
 	if (hosts[cid].oclass < NV50_CHANNEL_GPFIFO)
 		size = plength;
 	else
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index 9839de8da985..294d061497c0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -4,6 +4,7 @@
 #include <nvif/object.h>
 #include <nvif/event.h>
 #include <nvif/chan.h>
+#include <nvif/class.h>
 struct nvif_device;
 
 struct nouveau_channel {
@@ -65,6 +66,17 @@ void nouveau_channel_del(struct nouveau_channel **);
 int  nouveau_channel_idle(struct nouveau_channel *);
 void nouveau_channel_kill(struct nouveau_channel *);
 
+/* Maximum GPFIFO entries per channel. */
+#define NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT (0x02000 / 8)
+
+static inline u32 nouveau_channel_get_gpfifo_entries_count(u32 oclass)
+{
+	if (oclass < NV50_CHANNEL_GPFIFO)
+		return 0;
+
+	return NV50_CHANNEL_GPFIFO_ENTRIES_MAX_COUNT;
+}
+
 extern int nouveau_vram_pushbuf;
 
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_dma.h b/drivers/gpu/drm/nouveau/nouveau_dma.h
index c25ef9a54b9f..7f8445014e4d 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dma.h
+++ b/drivers/gpu/drm/nouveau/nouveau_dma.h
@@ -47,9 +47,6 @@ int nouveau_dma_wait(struct nouveau_channel *, int size);
 /* Maximum push buffer size. */
 #define NV50_DMA_PUSH_MAX_LENGTH 0x7fffff
 
-/* Maximum IBs per ring. */
-#define NV50_DMA_IB_MAX ((0x02000 / 8) - 1)
-
 /* Object handles - for stuff that's doesn't use handle == oclass. */
 enum {
 	NvDmaFB		= 0x80000002,

-- 
2.52.0

