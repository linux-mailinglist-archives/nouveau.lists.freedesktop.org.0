Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFAC1853986
	for <lists+nouveau@lfdr.de>; Tue, 13 Feb 2024 19:10:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8933210E8F4;
	Tue, 13 Feb 2024 18:10:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qCD4CH3e";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com
 [209.85.208.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE48910E8CC
 for <nouveau@lists.freedesktop.org>; Tue, 13 Feb 2024 18:10:09 +0000 (UTC)
Received: by mail-ed1-f49.google.com with SMTP id
 4fb4d7f45d1cf-561f4bc306fso1163242a12.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Feb 2024 10:10:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707847808; x=1708452608; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ziAomXuWT8MH5zr/8s5imuynSnI7dntU0jZc1Z9tS6w=;
 b=qCD4CH3eWEsn4qzwS4VCSlZIfdpyrNYmnkRPiyr8FHaRC2sXrIPoXjRboUA0fZPZZ8
 65AnXg98H0dTg2+hhxjw8Y3s8TNQVSeXaFzrH0VOYUQ4F6pjN9espHecdUR/V7Q90GnD
 FFJg0E7uMCaWVVBPh3S0XX2sukShH35s9rpd5Qm5kM81KM/KKSbAjyxuTYfsidjNzZU0
 Jgo4FWWZx1/nHm4ADWOVX8Ogicjj79cgA+fyWRqmwF169I5RUK2+oxnSKwKIb00wGGxH
 mYFvVNStqVp6hUf0XBsiWuoWRKQa+JRZDBuN0l/ZKDgqQpfStGRgcFK3tCRb+d7jNsdI
 BtYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707847808; x=1708452608;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ziAomXuWT8MH5zr/8s5imuynSnI7dntU0jZc1Z9tS6w=;
 b=KIOcFIfdE9B8DIfbLNahC5QpWsMIXzoZReTCBOfDVJ9lLPikYeX1nFja63jXngIatX
 58b7kesU2+tEauQkQltZoEyfqcrXXUhaJs4ZxGuRhzJLT13G2qVwd5dtLqp6iPxMFe2k
 DL7xKq9YDspd7ceUcrG8dX9um/yM6GYuI0hBaLLscSHcznDHjT8KuSOIWLSYt6Lr01w5
 ttvsfvKTuBFOgDR4EZVjo1g7MNDStrpbcDrOmGwoRi8aQAYfKHWgNBsxtgfkRSoLPYYb
 A0PDH3YJ1zdS/pUEbBUaZBxU1qmOsr8+Z5rHfqxpEq+gXwLM6NNXWA1zUz64wAP+0js2
 xn+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXe39CfYQShx1rueck6a77UPbM3pbTY9laS8TS2bqLhdFc9fopKsmiqyRFHZEOKrwkQzZGbdKKOQQe5QdwoUrvwt2qYKIsHd7qFnHeAJA==
X-Gm-Message-State: AOJu0YwC7b8T+XJPEw0ii/siNxULEJ1H7PP9ruNAdUCNTqLMSezquVOe
 IorFhsEiTljLpWupMKMi7GeajTnwuFPNbJcMxbG4BFaAMYpQ4nGoh0nuGuBQIZA=
X-Google-Smtp-Source: AGHT+IEEYP79160/4gREQSMT99NQJR66fKb5tUCe7r25eVUrmQpy2NIZzr9MrcCjSU/z8yF+NtlVDg==
X-Received: by 2002:a05:6402:2c9:b0:561:a444:8e49 with SMTP id
 b9-20020a05640202c900b00561a4448e49mr321854edx.0.1707847807927; 
 Tue, 13 Feb 2024 10:10:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWKqe9LXaXCTJL+0+XDewhVE3YzUr7ESGe3puDPcSskby8iGkPYz0oTenO+aCQtAlemdNeKRkzKYJlPZOsdV/bkrYnGTABsLqMej8xFl5Venr0cVbu+kUwioToW0tuN37GrnXm1zl8RNNt+PmS9NRMOlig5wSYbq4nHSKJpn1Gxs+/FrLQnUB+R+1pZL8dayot7Z/MxtO8CbqlbZbNekuTO8DqhNqGbw5LLLxeAvovKEdJcQctLm/+1+ctUpF5TT2LAMp/333ubfflOQkXZxMefbY8cKqI/KPZcGSN/N9/5Knu6C059CGx3T0q9AbJAMzqc4sRCchCipGb6gWHlYZ6n/fkcMtUhnfoy5BIRRfR6rQ==
Received: from localhost ([102.222.70.76]) by smtp.gmail.com with ESMTPSA id
 y24-20020a056402135800b005606b3d835fsm3935468edw.50.2024.02.13.10.10.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Feb 2024 10:10:07 -0800 (PST)
Date: Tue, 13 Feb 2024 21:09:57 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Karol Herbst <kherbst@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@redhat.com>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Dan Carpenter <dan.carpenter@linaro.org>,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] drm/nouveau/mmu/r535: uninitialized variable in
 r535_bar_new_()
Message-ID: <dab21df7-4d90-4479-97d8-97e5d228c714@moroto.mountain>
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

If gf100_bar_new_() fails then "bar" is not initialized.

Fixes: 5bf0257136a2 ("drm/nouveau/mmu/r535: initial support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
It looks like this was intended to handle a failure from the "rm" func
but "rm" can't actually fail so it's easier to write the error handling
for the code as-is.

 drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
index 4135690326f4..3a30bea30e36 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bar/r535.c
@@ -168,12 +168,11 @@ r535_bar_new_(const struct nvkm_bar_func *hw, struct nvkm_device *device,
 	rm->flush = r535_bar_flush;
 
 	ret = gf100_bar_new_(rm, device, type, inst, &bar);
-	*pbar = bar;
 	if (ret) {
-		if (!bar)
-			kfree(rm);
+		kfree(rm);
 		return ret;
 	}
+	*pbar = bar;
 
 	bar->flushBAR2PhysMode = ioremap(device->func->resource_addr(device, 3), PAGE_SIZE);
 	if (!bar->flushBAR2PhysMode)
-- 
2.43.0

