Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 514537A53A5
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8FC610E2EF;
	Mon, 18 Sep 2023 20:15:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 919A410E2F8
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:25 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-1c572c9c852so9770265ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068124; x=1695672924; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wbqALAYIHLEYWUD0mlXWDIGvy5nipK6XoGJsYIEoAIY=;
 b=VQbj+CqtSskOZ4J/jmGLxJn8Rbne1Ch32tAZgmmo0n9ilbjQlR3TpLHOWrGhZgzgYB
 ykBsJ6AfAkotuukFSbuJHSxiQSiUM/9SsWDpPSxK37cOhDDKbMXLQU1jB87cbZANfsc0
 f4MBRYRTy5tPHJLPbzycmNa64gbftJU9QWb2kH9dTW1HMLwW1e4i0qpxovy9/TMY3D1m
 nUFuFyCGukXSON+I2hFFWu23SUeeoBcnMsD6YMFt88QVMPV3vhwee/ohSHvffebqpY+Z
 ijQWR5cRFoYOhkQUmRiczRrBQ1WHkQYYFRgFLvwmYasXi+yieNXdJ4sCNBfwSDkaMWzB
 QXZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068124; x=1695672924;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wbqALAYIHLEYWUD0mlXWDIGvy5nipK6XoGJsYIEoAIY=;
 b=xJkCSsw1OhYZDz1sRJvFZMlsQMkAYO1gKhNaNswgh6mxyjvtDoIbRDUVMyHwt0xbxs
 zSPvJabEf8BwWNbfMwhEarvzYfAvR8Z0Zp5KsSY4zkjEvhr8k3ZQwRL4ouwWAJMkwGgH
 5HfTZC//FFt05XK6W5aiI9Mu+Ai25klZi3NuNepOiYypqAvTpxcKHsVZyBESuCMauoUS
 htoXDcjtzl0pmZyUQ5V3iqktm7X5PBdiWg4p3dl1W6MsQowMOAt3O9j4FSm8LlmgVifY
 YmOrA1jVLEPkqJf4y7xjGT8sbWujfUu6MF05e2tzYWoC9UcQ6uvu50i1FaEQ0t2ThYXc
 Gqgw==
X-Gm-Message-State: AOJu0Yy5baxR1+7PT4GlesCLzDhuFT5lNjaStaxDthFSEUTgPnnb27BA
 ZLerQLybnuBanrwhXfufeep6C4jbwXI=
X-Google-Smtp-Source: AGHT+IEr+Xo5aAH1Bk+8Fp3vdieSUPMZ/xlQ2y7rU+5pciagxKtKXuJzaGQZYMGNyIM56Cli2iUBQw==
X-Received: by 2002:a17:902:c3c3:b0:1c5:8401:356c with SMTP id
 j3-20020a170902c3c300b001c58401356cmr1807253plj.62.1695068124497; 
 Mon, 18 Sep 2023 13:15:24 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:24 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:46 +1000
Message-ID: <20230918201404.3765-27-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 26/44] drm/nouveau/disp: move dp aux pwr method
 to HAL
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

