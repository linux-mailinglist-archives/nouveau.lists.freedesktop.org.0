Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E57437A53B6
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8418410E300;
	Mon, 18 Sep 2023 20:15:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pg1-x530.google.com (mail-pg1-x530.google.com
 [IPv6:2607:f8b0:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 529B310E300
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:54 +0000 (UTC)
Received: by mail-pg1-x530.google.com with SMTP id
 41be03b00d2f7-578b407045bso13322a12.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068153; x=1695672953; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4NfwLekfoV37Nx+VRW6kksmvfa383noyLWpiV9IZyXk=;
 b=Cw5yVwfqakSoYUeHcYhH99XUPceV5ep66EaQJ7oAE7E1iS3F8kIXztsfnog7ZWFfT5
 x/vGmfqvo6Us46cVg2zztoKtx9dPHVvl8T4vErE6gO6z7LjBycRopfRpb/72eJ7spLVu
 ZTGgAqYDF23PhkNM2sTYm1KCCR9/BTW+lXusWTza4awsx8cR8pWt+2/mHKxDC/pNAeh8
 hd7rFM9WS9HrEcubkLysXOnWxdbn34OJ94F1sJqcKN7HUTXgXgv6ocDsYeqy/ElSvzsc
 BoPlv8/TLfmFe4uSPY4BVyyIW/oYToAQyhVvwwT8e3bBv7MpFDPZJa2/HiUSHcC4gU0t
 Mfog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068153; x=1695672953;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4NfwLekfoV37Nx+VRW6kksmvfa383noyLWpiV9IZyXk=;
 b=aE9WhEJ8OFHshtpzMFuE5dXizuqBkHyE0R/S5FVBotYAf71DX+Cj/xm6SCWj7pDtHk
 MsBDL/6RqJovZaj19dqookaaiZmIQu9ZZM8cW8PmiCkPlum7gQ/Z06p8TPjjcLP7sovm
 g8wiZQ1NcBOEdb0tg1GwLEsQSAvq3cCudU1D6CkN5Px+kkYBS7uLK83FcbIQl1r+iKvk
 aeJFo6yEAMi+dDT8QloR+w0mEWdlpZd70jDbFSp78CzC3AdmckFcZ7Pi6quWc88cyfYW
 gAQLJIXLipagS+n0PC8CL9GkdOluQvlFz0tphsU1pZY2tZ5EaaSUDP4h6e2+6GxElWSD
 tZSA==
X-Gm-Message-State: AOJu0YyjQ/te8yiIOOsJxlu9MqR5IJU+/b+38odEG9HU25yiSBks3jgV
 o9BvlZe7SZzHOdfMzI4/CuqmB8oozUg=
X-Google-Smtp-Source: AGHT+IGWZCLehNG5Shj8p02ZGvLiMZQ6JuQi56RhiZje4aTvu+YhJ2CARXAgzSmfHq7OrtheXdidGg==
X-Received: by 2002:a17:902:cec2:b0:1bc:7001:6e5e with SMTP id
 d2-20020a170902cec200b001bc70016e5emr12486413plg.32.1695068153390; 
 Mon, 18 Sep 2023 13:15:53 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:53 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:58 +1000
Message-ID: <20230918201404.3765-39-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 38/44] drm/nouveau/disp/nv50-: skip
 DCB_OUTPUT_TV
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

We've never supported it.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
index 4be09ec4fd5c..2d05e2f7e46b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/nv50.c
@@ -1656,7 +1656,6 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 
 		switch (dcbE.type) {
 		case DCB_OUTPUT_ANALOG:
-		case DCB_OUTPUT_TV:
 		case DCB_OUTPUT_TMDS:
 		case DCB_OUTPUT_LVDS:
 			ret = nvkm_outp_new(disp, i, &dcbE, &outp);
@@ -1664,6 +1663,7 @@ nv50_disp_oneinit(struct nvkm_disp *disp)
 		case DCB_OUTPUT_DP:
 			ret = nvkm_dp_new(disp, i, &dcbE, &outp);
 			break;
+		case DCB_OUTPUT_TV:
 		case DCB_OUTPUT_WFD:
 			/* No support for WFD yet. */
 			ret = -ENODEV;
-- 
2.41.0

