Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90F5C7101FF
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0850F10E69F;
	Thu, 25 May 2023 00:31:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com
 [IPv6:2607:f8b0:4864:20::102d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF39610E621
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:27 +0000 (UTC)
Received: by mail-pj1-x102d.google.com with SMTP id
 98e67ed59e1d1-25533eb3e5dso680515a91.0
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974687; x=1687566687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=yx0viVPd2FIr2gJzRjYBfOewgwbtHiXW6Vrp5t+NBdw=;
 b=pKicvnBn3sj1pe4Xyk04bHAsPYU+Du+1VBWRzDEIDjk7zBikIUGOCGndCo9dhtaOBz
 lBPfQ3k1nKhj7rq/h5VWcl0WYvVrWNF66J6IiVn0PgdsyFWEHcCDw8USHcX0boUGeVIZ
 cPO5KH92jnWMYXlXi//69jGj7e8Ds19zTpcC5uHo/3KdRY3ZqNFVb3NOuypctnktN977
 IsimWI7fBr55+oRgU1tRVM90tclcyl4aJRPk8J8HAPsSylbipPvoy01vU7AOjCW3bNF7
 x8XSgWPz1x7NEplibDVE/k+chINFNVdEAthRaKhSVgRszWi1rqGqA7VJuLzB1Qjgbcdd
 SqKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974687; x=1687566687;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yx0viVPd2FIr2gJzRjYBfOewgwbtHiXW6Vrp5t+NBdw=;
 b=eFVqdUPLGL5HpZIbDIdfa8ZS+oVozOk0iAvb+v56i8TPC28UHB29772kM5FsDhIaxS
 uGPsUOGdAy4eE2dtLEm6866SZz6HGFOb94H59jim3kdH2GCIuS5ysaJ/kGuzUC3ckIZt
 LnFj3022XX0GBUSr+GfH6NqFzJwy4+R/3yk4v4ykShNt4F60UYUbCSbhpqEUOIhMxezd
 JfLSqCXQ8xmXjFqAHjiGEG+ctVlycRO26qvvnOUrjpJ15Ri1efkg5vvNK9eb5j5uIID+
 wsexftm9psOhnwo7XtvT5GzHNbthj/Brq9Q4u0VK3mEY1EQwc8l9No23P7qGMm5vmaQA
 q+BQ==
X-Gm-Message-State: AC+VfDwHjv3COcxtyBREu4oBya9CVyqktv4rPpJkODngjWoukY8lVVb0
 dnjUaqy7YRSiT5rX0IzyzuDXr6GJEc8=
X-Google-Smtp-Source: ACHHUZ5IFEVVzUQnEyJQ7B03Xq5jSpaOBBnwO0pfcqo4HuGqPqOdIISWweMJE7VAHI6hzgGb4epQOw==
X-Received: by 2002:a17:90a:e150:b0:253:8260:f9aa with SMTP id
 ez16-20020a17090ae15000b002538260f9aamr16278424pjb.6.1684974686871; 
 Wed, 24 May 2023 17:31:26 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:26 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:01 +1000
Message-Id: <20230525003106.3853741-5-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 05/10] drm/nouveau/fifo: remove left-over
 references to nvkm_fifo_chan
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Ben Skeggs <bskeggs@redhat.com>

This was renamed to nvkm_chan in the host rework.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/engine.h   | 5 ++---
 drivers/gpu/drm/nouveau/include/nvkm/core/os.h       | 5 -----
 drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c        | 3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c       | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h        | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h        | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c      | 3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h      | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c      | 5 ++---
 drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h      | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c        | 3 +--
 drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h        | 4 ++--
 drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c       | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c        | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h        | 2 +-
 32 files changed, 37 insertions(+), 47 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
index b67b9c1a6b4e..8041fe03237e 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/engine.h
@@ -3,7 +3,7 @@
 #define __NVKM_ENGINE_H__
 #define nvkm_engine(p) container_of((p), struct nvkm_engine, subdev)
 #include <core/subdev.h>
-struct nvkm_fifo_chan;
+struct nvkm_chan;
 struct nvkm_fb_tile;
 
 extern const struct nvkm_subdev_func nvkm_engine;
@@ -32,8 +32,7 @@ struct nvkm_engine_func {
 	} base;
 
 	struct {
-		int (*cclass)(struct nvkm_fifo_chan *,
-			      const struct nvkm_oclass *,
+		int (*cclass)(struct nvkm_chan *, const struct nvkm_oclass *,
 			      struct nvkm_object **);
 		int (*sclass)(struct nvkm_oclass *, int index);
 	} fifo;
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
index 4486d9862849..3fd5c007a663 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
@@ -49,9 +49,4 @@ nvkm_blob_dtor(struct nvkm_blob *blob)
 	(p = container_of((h), typeof(*p), m), nvkm_list_find_next(p, (h), m, (c)))
 #define nvkm_list_foreach(p,h,m,c)                                                           \
 	for (p = nvkm_list_find(p, (h), m, (c)); p; p = nvkm_list_find_next(p, (h), m, (c)))
-
-/*FIXME: remove after */
-#define nvkm_fifo_chan nvkm_chan
-#define nvkm_fifo_chan_func nvkm_chan_func
-#define nvkm_fifo_cgrp nvkm_cgrp
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
index cd86d9198e4a..b7bb8a29a729 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/falcon.h
@@ -3,7 +3,7 @@
 #define __NVKM_FLCNEN_H__
 #define nvkm_falcon(p) container_of((p), struct nvkm_falcon, engine)
 #include <core/engine.h>
-struct nvkm_fifo_chan;
+struct nvkm_chan;
 
 enum nvkm_falcon_dmaidx {
 	FALCON_DMAIDX_UCODE		= 0,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
index c4c046916fa6..53ba2abe0bf5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/priv.h
@@ -3,7 +3,7 @@
 #define __NVKM_CE_PRIV_H__
 #include <engine/ce.h>
 
-void gt215_ce_intr(struct nvkm_falcon *, struct nvkm_fifo_chan *);
+void gt215_ce_intr(struct nvkm_falcon *, struct nvkm_chan *);
 void gk104_ce_intr(struct nvkm_engine *);
 void gp100_ce_intr(struct nvkm_engine *);
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
index 71b824e6da9d..5653fbf785e1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/base.c
@@ -109,8 +109,7 @@ nvkm_gr_oclass_get(struct nvkm_oclass *oclass, int index)
 }
 
 static int
-nvkm_gr_cclass_new(struct nvkm_fifo_chan *chan,
-		   const struct nvkm_oclass *oclass,
+nvkm_gr_cclass_new(struct nvkm_chan *chan, const struct nvkm_oclass *oclass,
 		   struct nvkm_object **pobject)
 {
 	struct nvkm_gr *gr = nvkm_gr(oclass->engine);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 5f20079c3660..29afec9a55bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -374,7 +374,7 @@ gf100_gr_chan = {
 };
 
 static int
-gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+gf100_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		  const struct nvkm_oclass *oclass,
 		  struct nvkm_object **pobject)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
index 81bd682c2102..ca822f07b63e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv04.c
@@ -1181,7 +1181,7 @@ nv04_gr_chan = {
 };
 
 static int
-nv04_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv04_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv04_gr *gr = nv04_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
index 7fe6e58f6bab..92ef7c9b2910 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.c
@@ -999,7 +999,7 @@ nv10_gr_chan = {
 	} while (0)
 
 int
-nv10_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv10_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv10_gr *gr = nv10_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h
index 5cfe927c9123..b86090c08060 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv10.h
@@ -9,6 +9,6 @@ int nv10_gr_init(struct nvkm_gr *);
 void nv10_gr_intr(struct nvkm_gr *);
 void nv10_gr_tile(struct nvkm_gr *, int, struct nvkm_fb_tile *);
 
-int nv10_gr_chan_new(struct nvkm_gr *, struct nvkm_fifo_chan *,
+int nv10_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *,
 		     const struct nvkm_oclass *, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
index 75434f5de7ad..02a8c62a0a32 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv20.c
@@ -72,7 +72,7 @@ nv20_gr_chan = {
 };
 
 static int
-nv20_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv20_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv20_gr *gr = nv20_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c
index 94685e4d4f87..d6bc6904dcc8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv25.c
@@ -18,7 +18,7 @@ nv25_gr_chan = {
 };
 
 static int
-nv25_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv25_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv20_gr *gr = nv20_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c
index 2d6273675291..e5a351b51eb9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv2a.c
@@ -18,7 +18,7 @@ nv2a_gr_chan = {
 };
 
 static int
-nv2a_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv2a_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv20_gr *gr = nv20_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c
index 647bd6fede04..80370323755e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv30.c
@@ -19,7 +19,7 @@ nv30_gr_chan = {
 };
 
 static int
-nv30_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv30_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv20_gr *gr = nv20_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c
index 2eae3fe4ef4e..cdf043bbdd59 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv34.c
@@ -18,7 +18,7 @@ nv34_gr_chan = {
 };
 
 static int
-nv34_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv34_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv20_gr *gr = nv20_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c
index 657d7cdba369..fa5a6ccb871d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv35.c
@@ -18,7 +18,7 @@ nv35_gr_chan = {
 };
 
 static int
-nv35_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv35_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv20_gr *gr = nv20_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
index d2df097a6cf6..a5e1f02791b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.c
@@ -145,7 +145,7 @@ nv40_gr_chan = {
 };
 
 int
-nv40_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv40_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv40_gr *gr = nv40_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h
index f3d3d3a5ae5b..84fbc99139e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv40.h
@@ -22,12 +22,12 @@ u64 nv40_gr_units(struct nvkm_gr *);
 struct nv40_gr_chan {
 	struct nvkm_object object;
 	struct nv40_gr *gr;
-	struct nvkm_fifo_chan *fifo;
+	struct nvkm_chan *fifo;
 	u32 inst;
 	struct list_head head;
 };
 
-int nv40_gr_chan_new(struct nvkm_gr *, struct nvkm_fifo_chan *,
+int nv40_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *,
 		     const struct nvkm_oclass *, struct nvkm_object **);
 
 extern const struct nvkm_object_func nv40_gr_object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c
index 1ba18a8e380f..c8a0288c092d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.c
@@ -86,7 +86,7 @@ nv50_gr_chan = {
 };
 
 int
-nv50_gr_chan_new(struct nvkm_gr *base, struct nvkm_fifo_chan *fifoch,
+nv50_gr_chan_new(struct nvkm_gr *base, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv50_gr *gr = nv50_gr(base);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h
index 84388c42e5c6..97ead0042357 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/nv50.h
@@ -27,7 +27,7 @@ struct nv50_gr_chan {
 	struct nv50_gr *gr;
 };
 
-int nv50_gr_chan_new(struct nvkm_gr *, struct nvkm_fifo_chan *,
+int nv50_gr_chan_new(struct nvkm_gr *, struct nvkm_chan *,
 		     const struct nvkm_oclass *, struct nvkm_object **);
 
 extern const struct nvkm_object_func nv50_gr_object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
index 08d5c96e6458..6ec8b94854c0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/priv.h
@@ -5,7 +5,7 @@
 #include <engine/gr.h>
 #include <core/enum.h>
 struct nvkm_fb_tile;
-struct nvkm_fifo_chan;
+struct nvkm_chan;
 
 int nvkm_gr_ctor(const struct nvkm_gr_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
 		 bool enable, struct nvkm_gr *);
@@ -21,7 +21,7 @@ struct nvkm_gr_func {
 	void (*intr)(struct nvkm_gr *);
 	void (*tile)(struct nvkm_gr *, int region, struct nvkm_fb_tile *);
 	int (*tlb_flush)(struct nvkm_gr *);
-	int (*chan_new)(struct nvkm_gr *, struct nvkm_fifo_chan *,
+	int (*chan_new)(struct nvkm_gr *, struct nvkm_chan *,
 			const struct nvkm_oclass *, struct nvkm_object **);
 	int (*object_get)(struct nvkm_gr *, int, struct nvkm_sclass *);
 	/* Returns chipset-specific counts of units packed into an u64.
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c
index cb0c3991b2ad..db9fc1ecae0d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.c
@@ -81,8 +81,7 @@ nv31_mpeg_chan = {
 };
 
 int
-nv31_mpeg_chan_new(struct nvkm_fifo_chan *fifoch,
-		   const struct nvkm_oclass *oclass,
+nv31_mpeg_chan_new(struct nvkm_chan *fifoch, const struct nvkm_oclass *oclass,
 		   struct nvkm_object **pobject)
 {
 	struct nv31_mpeg *mpeg = nv31_mpeg(oclass->engine);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h
index 9f30aaaf809e..251d659565de 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv31.h
@@ -24,9 +24,9 @@ struct nv31_mpeg_func {
 struct nv31_mpeg_chan {
 	struct nvkm_object object;
 	struct nv31_mpeg *mpeg;
-	struct nvkm_fifo_chan *fifo;
+	struct nvkm_chan *fifo;
 };
 
-int nv31_mpeg_chan_new(struct nvkm_fifo_chan *, const struct nvkm_oclass *,
+int nv31_mpeg_chan_new(struct nvkm_chan *, const struct nvkm_oclass *,
 		       struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
index 0890a279458e..4b1374adbda3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/nv44.c
@@ -43,7 +43,7 @@ struct nv44_mpeg {
 struct nv44_mpeg_chan {
 	struct nvkm_object object;
 	struct nv44_mpeg *mpeg;
-	struct nvkm_fifo_chan *fifo;
+	struct nvkm_chan *fifo;
 	struct list_head head;
 	u32 inst;
 };
@@ -100,8 +100,7 @@ nv44_mpeg_chan = {
 };
 
 static int
-nv44_mpeg_chan_new(struct nvkm_fifo_chan *fifoch,
-		   const struct nvkm_oclass *oclass,
+nv44_mpeg_chan_new(struct nvkm_chan *fifoch, const struct nvkm_oclass *oclass,
 		   struct nvkm_object **pobject)
 {
 	struct nv44_mpeg *mpeg = nv44_mpeg(oclass->engine);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h
index 667a2d05dd89..044ff4133874 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/mpeg/priv.h
@@ -2,7 +2,7 @@
 #ifndef __NVKM_MPEG_PRIV_H__
 #define __NVKM_MPEG_PRIV_H__
 #include <engine/mpeg.h>
-struct nvkm_fifo_chan;
+struct nvkm_chan;
 
 int nv31_mpeg_init(struct nvkm_engine *);
 void nv31_mpeg_tile(struct nvkm_engine *, int, struct nvkm_fb_tile *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c
index a9d464db6974..20220d6d4a13 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/base.c
@@ -74,8 +74,7 @@ nvkm_sw_oclass_get(struct nvkm_oclass *oclass, int index)
 }
 
 static int
-nvkm_sw_cclass_get(struct nvkm_fifo_chan *fifoch,
-		   const struct nvkm_oclass *oclass,
+nvkm_sw_cclass_get(struct nvkm_chan *fifoch, const struct nvkm_oclass *oclass,
 		   struct nvkm_object **pobject)
 {
 	struct nvkm_sw *sw = nvkm_sw(oclass->engine);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c
index 834b8cbed51d..2bf45141de60 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.c
@@ -74,7 +74,7 @@ nvkm_sw_chan = {
 
 int
 nvkm_sw_chan_ctor(const struct nvkm_sw_chan_func *func, struct nvkm_sw *sw,
-		  struct nvkm_fifo_chan *fifo, const struct nvkm_oclass *oclass,
+		  struct nvkm_chan *fifo, const struct nvkm_oclass *oclass,
 		  struct nvkm_sw_chan *chan)
 {
 	unsigned long flags;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h
index 67b2e5ea93d9..c313aea16a17 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/chan.h
@@ -11,7 +11,7 @@ struct nvkm_sw_chan {
 	const struct nvkm_sw_chan_func *func;
 	struct nvkm_object object;
 	struct nvkm_sw *sw;
-	struct nvkm_fifo_chan *fifo;
+	struct nvkm_chan *fifo;
 	struct list_head head;
 
 #define NVKM_SW_CHAN_EVENT_PAGE_FLIP BIT(0)
@@ -24,7 +24,7 @@ struct nvkm_sw_chan_func {
 };
 
 int nvkm_sw_chan_ctor(const struct nvkm_sw_chan_func *, struct nvkm_sw *,
-		      struct nvkm_fifo_chan *, const struct nvkm_oclass *,
+		      struct nvkm_chan *, const struct nvkm_oclass *,
 		      struct nvkm_sw_chan *);
 bool nvkm_sw_chan_mthd(struct nvkm_sw_chan *, int subc, u32 mthd, u32 data);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
index c3cf6f2ff86c..a0273baf4c67 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/gf100.c
@@ -102,7 +102,7 @@ gf100_sw_chan = {
 };
 
 static int
-gf100_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifoch,
+gf100_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifoch,
 		  const struct nvkm_oclass *oclass,
 		  struct nvkm_object **pobject)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c
index 4aa57573869c..8a1d112da894 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv04.c
@@ -106,7 +106,7 @@ nv04_sw_chan = {
 };
 
 static int
-nv04_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifo,
+nv04_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifo,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nv04_sw_chan *chan;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c
index e79e640ae535..742c75859569 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv10.c
@@ -36,7 +36,7 @@ nv10_sw_chan = {
 };
 
 static int
-nv10_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifo,
+nv10_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifo,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nvkm_sw_chan *chan;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
index 9d7a9b7d5be3..99476d32c5af 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/nv50.c
@@ -99,7 +99,7 @@ nv50_sw_chan = {
 };
 
 static int
-nv50_sw_chan_new(struct nvkm_sw *sw, struct nvkm_fifo_chan *fifoch,
+nv50_sw_chan_new(struct nvkm_sw *sw, struct nvkm_chan *fifoch,
 		 const struct nvkm_oclass *oclass, struct nvkm_object **pobject)
 {
 	struct nvkm_disp *disp = sw->engine.subdev.device->disp;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h
index d9d83b1b8849..8015afaba947 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/sw/priv.h
@@ -15,7 +15,7 @@ struct nvkm_sw_chan_sclass {
 };
 
 struct nvkm_sw_func {
-	int (*chan_new)(struct nvkm_sw *, struct nvkm_fifo_chan *,
+	int (*chan_new)(struct nvkm_sw *, struct nvkm_chan *,
 			const struct nvkm_oclass *, struct nvkm_object **);
 	const struct nvkm_sw_chan_sclass sclass[];
 };
-- 
2.40.1

