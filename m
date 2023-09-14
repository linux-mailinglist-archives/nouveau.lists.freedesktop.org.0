Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5488879FED9
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C38AF10E543;
	Thu, 14 Sep 2023 08:47:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFEB410E546
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:56 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 46e09a7af769-6c0bbbbad81so381747a34.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681275; x=1695286075; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HfO8GbhnKzxxYnxov9VJaEGiiypW2Aarib9HGw7neM0=;
 b=obSaQTkRVW5BQSVg6owTii79Oiz+4JFvPfuDOUzZMtf9OhrXTjwHUnbgGXZLTY+G0I
 abfvQWdj2CbLYbOwPzqDPx3L7Vr+vYW9EVNhNFIZrnwEKY4ZuxbGHcVN7F1PhKCCnkvN
 2KyCVZZ8y+bJY+98IFfkttcFW4lS7RcYWwVXPrtRH5soFVT09yWwi8soZqC3li9a527i
 QVg4mu/p0v3rm69vBdJP0nucSOg/9B7MCmtk6KCbQfGHiYY28/j78StuYKt3fn790dlh
 88VET7quuo6OYGsLGcNiHK4DaRy106AQnZ5aht0LfL9fV96S6R94l1SosnvIM5JknacX
 /oQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681275; x=1695286075;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HfO8GbhnKzxxYnxov9VJaEGiiypW2Aarib9HGw7neM0=;
 b=U/WVshPAiEPvdvwPtTo+VU339uMrCB7RUEEDsv5SfGw9pXvzy5bCWuv1/i+UMuntW2
 DUO0zid4lukQaX3KglklaxEadJCvdN93AzrQxb8mLmWNYLS/Q0XNfLIHEvA4oRV8c5Uc
 Rq1waWrxEbtPrNLa0xx/Ifx08hGu7sAvOdLVapVWRVJeeDT1l3b03ETUeH8doZMRMWBQ
 00aUDRz7sLG4y5NI3Oj6SXB/GFbJ/oOuuFpyBUXU1zhA/35iwgqGwqN94hC9WaG2TZON
 IAx3aNp/P3W99ojE8/FdeDKUqAuOPWt7ECbN7FI16o45WUfPuqKvbQ+R78v+xv3QFjfS
 znlQ==
X-Gm-Message-State: AOJu0YyfHyzag9rBsdqelKo2TMI9bYsTv0JEwV87Z5anlGzKBvsKSNwW
 8dpPNkuVxs/zCtxTB4bFn273nhwq+6s=
X-Google-Smtp-Source: AGHT+IGwRuOE1w3s5aLRx4WBQg3Pwl8CV3FFGDeBmir0O4cVQdvlo6mlY/rs6imPVsHnJR76kku20w==
X-Received: by 2002:a05:6830:1517:b0:6b9:b1a7:1f92 with SMTP id
 k23-20020a056830151700b006b9b1a71f92mr5463858otp.8.1694681275606; 
 Thu, 14 Sep 2023 01:47:55 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:55 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:07 +1000
Message-ID: <20230914084624.2299765-28-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 26/44] drm/nouveau/disp: move dp aux pwr method to
 HAL
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

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c    | 9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 6 +++---
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
index 0e6e38800376..99fe7ef07a44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
@@ -41,6 +41,14 @@
  */
 #define AMPERE_IED_HACK(disp) ((disp)->engine.subdev.device->card_type >= GA100)
 
+static int
+nvkm_dp_aux_pwr(struct nvkm_outp *outp, bool pu)
+{
+	outp->dp.enabled = pu;
+	nvkm_dp_enable(outp, outp->dp.enabled);
+	return 0;
+}
+
 struct lt_state {
 	struct nvkm_outp *outp;
 
@@ -814,6 +822,7 @@ nvkm_dp_func = {
 	.disable = nvkm_dp_disable,
 	.bl.get = nvkm_outp_bl_get,
 	.bl.set = nvkm_outp_bl_set,
+	.dp.aux_pwr = nvkm_dp_aux_pwr,
 };
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 38b6b43a9f20..513794a278a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -104,6 +104,10 @@ struct nvkm_outp_func {
 		int (*get)(struct nvkm_outp *);
 		int (*set)(struct nvkm_outp *, int level);
 	} bl;
+
+	struct {
+		int (*aux_pwr)(struct nvkm_outp *, bool pu);
+	} dp;
 };
 
 #define OUTP_MSG(o,l,f,a...) do {                                              \
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 7574f2200644..6ca364e953bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -75,10 +75,10 @@ nvkm_uoutp_mthd_dp_aux_pwr(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
+	if (!outp->func->dp.aux_pwr)
+		return -EINVAL;
 
-	outp->dp.enabled = !!args->v0.state;
-	nvkm_dp_enable(outp, outp->dp.enabled);
-	return 0;
+	return outp->func->dp.aux_pwr(outp, !!args->v0.state);
 }
 
 static int
-- 
2.41.0

