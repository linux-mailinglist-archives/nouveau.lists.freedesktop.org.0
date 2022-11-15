Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 907926F6BA5
	for <lists+nouveau@lfdr.de>; Thu,  4 May 2023 14:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7A6810E473;
	Thu,  4 May 2023 12:32:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com
 [IPv6:2a00:1450:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8631710E3D3;
 Tue, 15 Nov 2022 13:16:21 +0000 (UTC)
Received: by mail-wm1-x332.google.com with SMTP id
 v124-20020a1cac82000000b003cf7a4ea2caso13087115wme.5; 
 Tue, 15 Nov 2022 05:16:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=pyuO5Hk4hHm9DC9pX7v9hEWX1AWbI34zrlY39Dkt8LA=;
 b=k5xZD9EYCCiLHjTqbOSGy5SJ44glhLSSng/C7rhLuAFsoPgUk2KdN4XflzRa8X/Smm
 Uh18mtBZHpQFN1/9KxIR2sDEh/l6ZbutwJZPMqNmVp98PTWGjiRKSOBr4w7euIUCWZR9
 BErFAfNpFiFRPaHVH0EklNZQNNCH2B+Oq2gFhCSN7DA5DRKxATA1PtMlGQB6gzBZUKBy
 r6tghkDmtHrPGeAfM9wMTn4+7MHG7Ukt5Giu37HzM1P64tQvq1fejmx32t+799SggifC
 BEZLWR6erc7cAq8dPBPRw1rg7Y2tWbgFD5l3M7vR4Ai+z1jwJi+35I2YOCd5vBvpBBq+
 2sfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pyuO5Hk4hHm9DC9pX7v9hEWX1AWbI34zrlY39Dkt8LA=;
 b=zkRlfKiOhHgPCdVghaZOElBXhUYLhksdERB3QhD/yvk9101ECqz7fEMlIqwgzn9zW5
 UDkIVJJh8jri04aWD+7ZqeQsN+Ko/YKzicve3mnglKMmO5gI3R82ckpbvomtqSBFm1GI
 QEHArt19fBl+ZFN4c1n/XykSdbgXOdfp4rt7LfCUAaURZ7BLa6M2irqQs/z76MBnkiJG
 zCT8B3CK65jnXq4+EvaY+eyYelyzDwZ8JeDzt4lbwhHXJ7Ll2kxFtTlhGWoeGDiTyYp6
 sy2BIrNLACuJ6NonTbs8meKoboJxLtIXpFgp8reaDQsTeYBcny3ctSDKAPBLBDjqqOlV
 mZLQ==
X-Gm-Message-State: ANoB5pnFpFPjY7FHUJc1bUcQKkABrK8PUVq0KWDiZsMNZS9/PrWlu/3d
 UMD9dK1WRqeQYzhBNZ2x3+M=
X-Google-Smtp-Source: AA0mqf4HjMwos42pICW3yeahWx8vGQWgHT9rZm93eePobYAPWie2WJTR8Scy0xUWSP0haRFqMm+6XA==
X-Received: by 2002:a05:600c:706:b0:3cf:9a6a:c72a with SMTP id
 i6-20020a05600c070600b003cf9a6ac72amr309994wmn.168.1668518179738; 
 Tue, 15 Nov 2022 05:16:19 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 f20-20020a05600c155400b003c6f3e5ba42sm25738865wmg.46.2022.11.15.05.16.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Nov 2022 05:16:19 -0800 (PST)
Date: Tue, 15 Nov 2022 16:16:15 +0300
From: Dan Carpenter <error27@gmail.com>
To: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <Y3Jdx+pFyv0CWLZm@kili>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
X-Mailman-Approved-At: Thu, 04 May 2023 12:31:32 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/fifo: small cleanup in
 nvkm_chan_cctx_get()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

The "&chan->cgrp->mutex" and "&cgrp->mutex" variables refer to the same
thing.  Use "&cgrp->mutex" consistently.

Signed-off-by: Dan Carpenter <error27@gmail.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index b7c9d6115bce..790b73ee5272 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -105,7 +105,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx = cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
 
-- 
2.35.1

