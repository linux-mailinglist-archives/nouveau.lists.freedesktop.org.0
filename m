Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8822AA44CF
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 10:06:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB5B010E72F;
	Wed, 30 Apr 2025 08:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qSJCd580";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B21F110E71C
 for <nouveau@lists.freedesktop.org>; Wed, 30 Apr 2025 08:06:39 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-43cf0d787eeso77236185e9.3
 for <nouveau@lists.freedesktop.org>; Wed, 30 Apr 2025 01:06:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1746000398; x=1746605198; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
 b=qSJCd580RyHq3jZ0CLfw1ew+a+6xKrDGVEbcV/x0hzZl9gRb0AeZtJoONsB7wsBmdV
 5Q1e9uQh031BOcWAE6K32A3N4lcJ4Zb24Rhvl3yzvKMptu5Cwo6wcr4EQdePk5WEpujk
 iSBTOQd8rKaHZj2t3KxBI+MQk0g0JS1oWslW4uyCoisCxdh/uc9OxbtM0EJke4LeHRKG
 YtB/Hp4YI9xsPpF/8hqQrhgIHkYGidLmajPU4UtVFWh3xYNCBece1YLMV6KDSn++ORux
 Dz7XbL5b/Km2Xvrr+0ulQVRGNbxz9OiQA8sT+fptxCMBUKqtpyLbsvYiQu7bbnjQSdWX
 eluQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746000398; x=1746605198;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=JaBtCb/6XVAvBecubHAVnnEpXRtXlY0yxjWDApUS/CE=;
 b=qb63RsXX1O6WUTVTw5Y8EZvNCx6FejI8MpIcyME+g0P4IYbqcxojLnSsnUpyG61zhC
 Hg2rR/v+1B2UfEoqGKSW+t3wrE35B6JmDNIgV9PlHuP9wSn1Xt4ESpMsy6uewlGkqwMg
 /y2tMf5gqZyUWLARohqrlWJoRQoIA4c4h8P1Be1tp2j6GFZH8+8yKGhKBQnLy2Q/un19
 Kw6Ft+Plt/CjZH2G50tjD9MhDR1gMSKvW9KrnemgdwV/XpVeJZF/+zLJ1otBaFGp7A81
 GBGgI8l5/Bhctl6c0m8xinXLZWLtOZvv0P38pBdGYU0rBFomeewKggo4SGW1QpeHz3qH
 ++6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJvAiDoZwgUoSHmugRCq7C+VC7oji9zSEuSuQXIyCF40ER3Ds+MVZ0qrPfBLfqczU3EzmGFzlR@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy21KTE7/ijgt4yMxemoBioeHccrJqwxkghqWPif6WQj+Q8snvs
 GcUEInrRpHChQY0mAoE2IoxH/KVrWBKpG/Ni9kQAN5l6cO0tFwTw2vhRw/XKYsA=
X-Gm-Gg: ASbGncsjHZpZcAE2WBvneXSXJWLbFfzbc7aP37cNcuuG/iTHFfLVRilG/WEX4OUEXe7
 xI+oBZ8WSFS4Q1ysFwKPpSOk76FUWsk/PJUhObdYg0aeQmTmO162+b4RDzxG+Lh7fZrIfph+5K4
 5VaVaqwiQDYbgPl/Kdp9h8kg+42Oiyo3MAeGnWZRAUZH4Yq2rBvn82O0TPf8V6TqSWGhzVo17iT
 5AfHuwZNTBiYcSvjacfUC7BInDpgfbVK2g1Br9fLBUSYPtNQzPjXdKIjp+eUR3p8xi+kKMH6Ozu
 XRatLHu8phXWGX6/hBz/nrkzccyxfqCw6bg2DXHLLxf1jA==
X-Google-Smtp-Source: AGHT+IHP+atkeWPXnPct3xYEf+jUQ0S7DQqC5h4qJD0wJmpfwo3S07LKuBCrJm3Z9SrRTQ8TUMm+ag==
X-Received: by 2002:a05:600c:502b:b0:440:6a1a:d89f with SMTP id
 5b1f17b1804b1-441b1f30736mr19057575e9.4.1746000398163; 
 Wed, 30 Apr 2025 01:06:38 -0700 (PDT)
Received: from localhost ([196.207.164.177])
 by smtp.gmail.com with UTF8SMTPSA id
 5b1f17b1804b1-441b2bbbedfsm15173965e9.26.2025.04.30.01.06.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 30 Apr 2025 01:06:37 -0700 (PDT)
Date: Wed, 30 Apr 2025 11:06:32 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Lyude Paul <lyude@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/fifo: small cleanup in nvkm_chan_cctx_get()
Message-ID: <aBHaCM66pXaP84ei@stanley.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

"&chan->cgrp->mutex" and "&cgrp->mutex" are the same thing.  Use
"&cgrp->mutex" consistently.  It looks nicer and it silences a
Smatch static checker warning.

Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..f5cd7f7c48b4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -104,7 +104,7 @@ nvkm_chan_cctx_get(struct nvkm_chan *chan, struct nvkm_engn *engn, struct nvkm_c
 	if (cctx) {
 		refcount_inc(&cctx->refs);
 		*pcctx = cctx;
-		mutex_unlock(&chan->cgrp->mutex);
+		mutex_unlock(&cgrp->mutex);
 		return 0;
 	}
 
-- 
2.47.2

