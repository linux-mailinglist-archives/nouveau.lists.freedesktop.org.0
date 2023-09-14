Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D88079FEC0
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D90DB10E523;
	Thu, 14 Sep 2023 08:47:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42b.google.com (mail-pf1-x42b.google.com
 [IPv6:2607:f8b0:4864:20::42b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E603D10E524
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:05 +0000 (UTC)
Received: by mail-pf1-x42b.google.com with SMTP id
 d2e1a72fcca58-68a3ced3ec6so604493b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681225; x=1695286025; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=cFWvj4pBHNP9nk4OBta4x5+lGK5WjOM09XVAWsJC5Gw=;
 b=OYJEaJ2qnBs69nKbq015NOMwVVhut8ZSkrnsq6sA5vTSxIJWy6P9wK1K9nTONe14Id
 WoPIyl9sLl26+goBCeGgsHjty7eCMId2CF65PUrj579iT+SwTwKHIN9oZezO2su90w1W
 NJ3pLHI4MXPtUKzolqQxrNLwjlleJOVyhgqvgiDHQgjKZc5TfX0DLimXEbuuJ91NR/y7
 aP31g5/cm84wjBFwZWl+tCCuqVFhmdPN61PKn82BLASp6FopK/t2vP5T3JPu9d8TiqPv
 iA7Z6Ycc91sOYHFkDVAHhNvJz7myJAIMqxxspzCjgQ5/Owe1y9dVYU7vVmzy0xFyAkwm
 n7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681225; x=1695286025;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=cFWvj4pBHNP9nk4OBta4x5+lGK5WjOM09XVAWsJC5Gw=;
 b=HhqX20ZdtxUySo3ll9ovfsNwk4GI1yQ/zKNf6atywCt8Q9wnzOOGN0PTjkobWb9ba7
 PLcxcVX2fSWGQBiIu749e3y2o1j6eIPUc9YmeBtGs+959y24j0znmBDQTZ6JZPMhtQVu
 7Q4Jbod7O5Bu4z05zxV3wrRpc/kM3ZyfER7XOsdVjelrPWa7Thu6uTOzbT/PsFPOC/6q
 jQigtSsesAaZYqNV1AK5wZjfbQd94HfvtD7IxEv3HKQ45VvkkQCIv22UKMAYij2GFpeG
 PBy4mP+/MdqoE31UaQnILypTdhMIQbM0OIdNZQGwjcbJZdskB0uWx9xUYqdbNCwXXE95
 S+7g==
X-Gm-Message-State: AOJu0YyWLgBdoTCkYJc8MNF9Uis/JQIkiBbF20EgL6dXYHfnN6MUGnKP
 IZ0EwZrx1JJfK+jjQphZgUe5e6BTyRg=
X-Google-Smtp-Source: AGHT+IH3QstTSAn93+1P3rzTUn1TNUMIvBQNQTDJS8hWJCHKCMLgP3EUJ3UWAtWnLYn4b6bgNqoaYg==
X-Received: by 2002:aa7:9611:0:b0:690:2ecd:a59e with SMTP id
 q17-20020aa79611000000b006902ecda59emr889127pfg.31.1694681225035; 
 Thu, 14 Sep 2023 01:47:05 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:04 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:44 +1000
Message-ID: <20230914084624.2299765-5-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 03/44] drm/nouveau/gr/gf100-: lose contents of
 global ctxbufs across suspend
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

Some of these buffers are quite large, and there's no need to preserve
them across suspend.

Mark the contents as lost to speedup suspend/resume.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 3648868bb9fc..c494a1ff2d57 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -2032,18 +2032,18 @@ gf100_gr_oneinit(struct nvkm_gr *base)
 	}
 
 	/* Allocate global context buffers. */
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->pagepool_size,
-			      0x100, false, &gr->pagepool);
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST,
+			      gr->func->grctx->pagepool_size, 0x100, false, &gr->pagepool);
 	if (ret)
 		return ret;
 
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->bundle_size,
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST, gr->func->grctx->bundle_size,
 			      0x100, false, &gr->bundle_cb);
 	if (ret)
 		return ret;
 
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->attrib_cb_size(gr),
-			      0x1000, false, &gr->attrib_cb);
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST,
+			      gr->func->grctx->attrib_cb_size(gr), 0x1000, false, &gr->attrib_cb);
 	if (ret)
 		return ret;
 
-- 
2.41.0

