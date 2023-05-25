Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4F98710201
	for <lists+nouveau@lfdr.de>; Thu, 25 May 2023 02:31:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D2110E6A2;
	Thu, 25 May 2023 00:31:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pj1-x1036.google.com (mail-pj1-x1036.google.com
 [IPv6:2607:f8b0:4864:20::1036])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B0FB10E6A1
 for <nouveau@lists.freedesktop.org>; Thu, 25 May 2023 00:31:31 +0000 (UTC)
Received: by mail-pj1-x1036.google.com with SMTP id
 98e67ed59e1d1-25374c9be49so792300a91.3
 for <nouveau@lists.freedesktop.org>; Wed, 24 May 2023 17:31:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1684974691; x=1687566691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/oh6OM8WtFUMOgSOvj3dTAsEYsy6oqK4stfE/yR/rgg=;
 b=V7xsK2MIcOVcgbHVUi74t8z5GICAhj4mtBUkvY0/Or/++mBecQihKTgnX0Qde65L3y
 nRGyJjk7Evj5FbIrFjD3gr4QZFTOYHejQ5q95od+1qHvFtwTO4imgn4UrdNOJrVzHwL1
 sJW4sUJ4cRu3t6CQzOxtsLU/ufWomENGJQjTBHuiG9XJGm65VJspXo2tvjF8r4LokYnZ
 pLVteNt/PWFRMHhuNp2C67xYQwMpCi4ppboyQy0FTDAPWme6DeTHn/eNlLDVcXlkvW/w
 Nz7AKSOr0zZHl0X8Sauv5tYq3c348aIyBBF11Rc5Gem4BsTY8zy16nzWA5vBW7qvnul2
 8oWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684974691; x=1687566691;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/oh6OM8WtFUMOgSOvj3dTAsEYsy6oqK4stfE/yR/rgg=;
 b=iaqtXf1IYxiEkg4i/Pn6CeGs1eOIHiy1p6Anf2tgrlfUy0vjA7QAtdKGbTCXPWwAYD
 5Nqg2PDpLRBAoFhbWTCoKgbVdv/KPMmP5dnrIu9aWcy8xwWB/UuCSc2turThzfL50uHI
 NtXlIzbSbuITDItDt7iatynY3RaiHPF1rHChlpTUVaHI6rcD43HliSYKA6/WmkamELSq
 /fw7yv8W7VrP0TDv2wxIg9Lfi5/rjrlcv3iWhr5DfAkkeEUQUeL3FVSzxAW2YnvN/iPD
 KV3dnd3GlMSFaP5Daq0FBKc+3la/GbdPAbE1GKwZOZy8+AfrQFORZC+/j02Z5ZJUjycQ
 6Crg==
X-Gm-Message-State: AC+VfDys5WqrVT+gQB9AKp+bMj5IoJQfpmXAnQ59IPzbU7a+2lAwtdYU
 bSrFkbtR72N0D3nDSJyDB/LmBBIcy/c=
X-Google-Smtp-Source: ACHHUZ7S1IQrlpyGlijIBFBjQ8WQEVgOk1EgfxVNr2N2nPxmBTWxjE4kB/fkE7cMfZ/A/uh3icpddg==
X-Received: by 2002:a17:90a:6e0d:b0:255:d86c:baec with SMTP id
 b13-20020a17090a6e0d00b00255d86cbaecmr3966199pjk.46.1684974690693; 
 Wed, 24 May 2023 17:31:30 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 ev18-20020a17090aead200b0025271247ab8sm98016pjb.11.2023.05.24.17.31.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 May 2023 17:31:30 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 25 May 2023 10:31:03 +1000
Message-Id: <20230525003106.3853741-7-skeggsb@gmail.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230525003106.3853741-1-skeggsb@gmail.com>
References: <20230525003106.3853741-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 07/10] drm/nouveau/fifo/ga100-: remove individual
 runlists rather than failing oneinit
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

We're adding better support for the non-stall interrupt, which will need
to fetch the interrupt vector from the runlist's primary engine.

NVKM doesn't support all target engines (ie. NVDEC etc), and it wouldn't
be ideal to completely fail initialisation in this case.

Instead.  Remove runlists where we can't determine all the needed info.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/ga100.c  | 46 ++++++++++++++-----
 1 file changed, 35 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
index 12a5d99d5e77..a729f8b7f0da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ga100.c
@@ -429,7 +429,9 @@ static int
 ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 addr, struct nvkm_runl **prunl)
 {
 	struct nvkm_device *device = fifo->engine.subdev.device;
+	struct nvkm_top_device *tdev;
 	struct nvkm_runl *runl;
+	struct nvkm_engn *engn;
 	u32 chcfg  = nvkm_rd32(device, addr + 0x004);
 	u32 chnum  = 1 << (chcfg & 0x0000000f);
 	u32 chaddr = (chcfg & 0xfffffff0);
@@ -437,26 +439,50 @@ ga100_runl_new(struct nvkm_fifo *fifo, int id, u32 addr, struct nvkm_runl **prun
 	u32 vector = nvkm_rd32(device, addr + 0x160);
 	int i, ret;
 
-	runl = *prunl = nvkm_runl_new(fifo, id, addr, chnum);
+	runl = nvkm_runl_new(fifo, id, addr, chnum);
 	if (IS_ERR(runl))
 		return PTR_ERR(runl);
 
+	*prunl = runl;
+
 	for (i = 0; i < 2; i++) {
 		u32 pbcfg = nvkm_rd32(device, addr + 0x010 + (i * 0x04));
 		if (pbcfg & 0x80000000) {
 			runl->runq[runl->runq_nr] =
 				nvkm_runq_new(fifo, ((pbcfg & 0x03fffc00) - 0x040000) / 0x800);
-			if (!runl->runq[runl->runq_nr])
+			if (!runl->runq[runl->runq_nr]) {
+				RUNL_ERROR(runl, "runq %d", runl->runq_nr);
 				return -ENOMEM;
+			}
 
 			runl->runq_nr++;
 		}
 	}
 
+	nvkm_list_foreach(tdev, &device->top->device, head, tdev->runlist == runl->addr) {
+		if (tdev->engine < 0) {
+			RUNL_DEBUG(runl, "engn !top");
+			return -EINVAL;
+		}
+
+		engn = nvkm_runl_add(runl, tdev->engine, (tdev->type == NVKM_ENGINE_CE) ?
+				     fifo->func->engn_ce : fifo->func->engn,
+				     tdev->type, tdev->inst);
+		if (!engn)
+			return -EINVAL;
+	}
+
+	if (list_empty(&runl->engns)) {
+		RUNL_DEBUG(runl, "!engns");
+		return -EINVAL;
+	}
+
 	ret = nvkm_inth_add(&device->vfn->intr, vector & 0x00000fff, NVKM_INTR_PRIO_NORMAL,
 			    &fifo->engine.subdev, ga100_runl_intr, &runl->inth);
-	if (ret)
+	if (ret) {
+		RUNL_ERROR(runl, "inth %d", ret);
 		return ret;
+	}
 
 	runl->chan = chaddr;
 	runl->doorbell = dbcfg >> 16;
@@ -514,15 +540,13 @@ ga100_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		runl = nvkm_runl_get(fifo, -1, tdev->runlist);
 		if (!runl) {
 			ret = ga100_runl_new(fifo, id++, tdev->runlist, &runl);
-			if (ret)
-				return ret;
-		}
-
-		if (tdev->engine < 0)
-			continue;
+			if (ret) {
+				if (runl)
+					nvkm_runl_del(runl);
 
-		nvkm_runl_add(runl, tdev->engine, (tdev->type == NVKM_ENGINE_CE) ?
-			      fifo->func->engn_ce : fifo->func->engn, tdev->type, tdev->inst);
+				continue;
+			}
+		}
 	}
 
 	return 0;
-- 
2.40.1

