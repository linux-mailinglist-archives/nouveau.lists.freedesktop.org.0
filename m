Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF674710200
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 777D010E6A1;
	Thu, 25 May 2023 00:31:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com
 [IPv6:2607:f8b0:4864:20::102c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0E9710E627
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:29 +0000 (UTC)
Received: by mail-pj1-x102c.google.com with SMTP id
 98e67ed59e1d1-2533d3acd5fso787460a91.2
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974689; x=1687566689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=u/a5ZISfiVtJ5cii/Of3OOxpxwBLiXJyA0suUPIHuyM=;
 b=PCfIh2K3ttP5FkuRnopp/I5z033pTQWs/lpXFGbKJv2OvL/M4v7PbFofC0zi7IkHZ6
 Rs+Z+V/Vl14xsIO4mNBSqAmNof+ZlixITuIme1aNQ5ud2mQnEBYqFzaPU/pe2V/9UR0P
 5CcOXbR0sDPOUzmn1M6Q4SBcAw/X+wQ8s/Ju+LwyYODnR+piWAX9jpbmP6fiHw7BSz/I
 mnGbABEbv9hbUsUAgFqVzykwnHWjQH2l8PzgXhsnhzpBacHQDF4vaGCrlNu4e8mLZPes
 vgezxQNTjI+vD2ekvwypfaRpu4SSOVKTZmgKMWawYlV1fXGv5+S1zuxyFQpirDD/uOq0
 mXDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974689; x=1687566689;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=u/a5ZISfiVtJ5cii/Of3OOxpxwBLiXJyA0suUPIHuyM=;
 b=WtBMI31jIuRy2vnQfbgC94gejFVRFV0upDRcw/kpYiV+uPec+w+HY04lYBnbmer0qB
 vLS2+nluUZloI5gUJGhlTOKsTdcjbUi2qOWqIZYE1Ys9n0EVxd19xvJD2Kti7N7xjvb0
 c16OPSjkFOR87wdenrT72j0E4xP+6ee/kqJ+dEY53l3ys1aNe8bW5osaooeTewUKmCP/
 QhZ4I24wvuFgWP4C6W3tlJ6TVPUbPL+LoSBEV8G9Q7+yH3SLAK1WhGDvdGs7XnJbfi1+
 SLbwCPEx6MMLQh1xZZmcIAb7jy8c1Gxia7L1J+z7QHAXOk6p3TbhETJ/fazeJ6UqUk+T
 GZHw==
X-Gm-Message-State: AC+VfDz8I+bMeEL04wti8iJo6bue3ykjG5YqjIZxOVFeBKQyugqF5HiY
 KpJIhqYFBDtxjZM2ZpSHeI2JKhuS7Rw=
X-Google-Smtp-Source: ACHHUZ5zfvN8jm7ZEgpViM1j+SOge1ZhxqUQZfg7OKc8ofFXuXbPA2ly5ak4SQVtI3rcq0EGlICZcg==
X-Received: by 2002:a17:90b:1003:b0:253:34da:487 with SMTP id
 gm3-20020a17090b100300b0025334da0487mr15708627pjb.35.1684974688807; 
 Wed, 24 May 2023 17:31:28 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:28 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:02 +1000
Message-Id: <20230525003106.3853741-6-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 06/10] drm/nouveau/fifo: return ERR_PTR from
 nvkm_runl_new()
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

Callers expect this - not NULL.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
index 93d628d7d508..454a481a0aef 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/runl.c
@@ -399,7 +399,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 addr, int id_nr)
 	int ret;
 
 	if (!(runl = kzalloc(sizeof(*runl), GFP_KERNEL)))
-		return NULL;
+		return ERR_PTR(-ENOMEM);
 
 	runl->func = fifo->func->runl;
 	runl->fifo = fifo;
@@ -419,7 +419,7 @@ nvkm_runl_new(struct nvkm_fifo *fifo, int runi, u32 addr, int id_nr)
 		    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, id_nr, 0, id_nr, &runl->chid))) {
 			RUNL_ERROR(runl, "cgid/chid: %d", ret);
 			nvkm_runl_del(runl);
-			return NULL;
+			return ERR_PTR(ret);
 		}
 	} else {
 		runl->cgid = nvkm_chid_ref(fifo->cgid);
-- 
2.40.1

