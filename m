Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E655D7A53A4
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6AD2910E2F9;
	Mon, 18 Sep 2023 20:15:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1925710E2EF
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:23 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-1c44c7dbaf9so24389925ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068122; x=1695672922; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JB3kxhvlV8ab/02AmdU6eg0jygAeVWnUrNhAixmj1h4=;
 b=R0Dm4IZHLpMJndAwiuRsDAnOypNYCDmuCOOVcMfqAj6++8cr83U96ZA7mcY+relczt
 +72RXwYhRfr3k0s8IXBFfLFjDKqygWJoHWGeGCVLpwqi/DCxQtGom3rBfplPssKBPRee
 E5dhYPDKxn8uhe+adOwi2OIXmTpI71GEqPQsDsY7C3MbH2sThBXK5kx6hfF4g9RS36F8
 xayLopQLLBaKaBu0q8fUc2Frw7hOZvOQQzObAt+3j+bMx1jBxXGMucNL5+Ov1wkYlwje
 YEwSPkqg3WPkHdNS7RgMjQk3prX+tA+eTTOb25H66fzapQ2NFOvMNEwXlr7hzYnsGQuo
 bhLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068122; x=1695672922;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JB3kxhvlV8ab/02AmdU6eg0jygAeVWnUrNhAixmj1h4=;
 b=jM7qu9ELv5Dy/cU4/nYumdq3e0b9PIrY0FVSCgETNoRP8wjkX8MxHoghtRAxJfVwq0
 ZxMuyG4xKJ7fqMIJxm3x191ZHlAeQlDgDbiKP6iH3qS4PzQ/ZU8/4esjC8KlSd1k1MWg
 Z8aFXp1e4/bJHxNei+HL6r+AJVnFA4bDgISd6lwwALa4y5WCmL+OC4l+WnVL+ZEmIGTF
 8np2r842YuUJq2WeXVzXXENaMu0BcNHDqGgp5Lmgy5ZWyTIRXBENIrydg9I9GAKWYHJL
 yqQeiusSgqRbgxFhtSXXyo480pCHNNSmnIy9O6MOd8wahMKSaHFxDGj5nSOe134EETSw
 R12Q==
X-Gm-Message-State: AOJu0YyNDvjyvdxnTE+i+ClzNkGGfsHcfyfT5uzQMR3YRZusAo+QoDtv
 MCWgwF2RksKzBVBDjo2GR+nElNsXYEA=
X-Google-Smtp-Source: AGHT+IEmEAxkGKpMawnqywc4vYjaNgILi45fn7Ucnbbu6CCuKALw7syiXTKIFaz64GGhf+2pczk9vg==
X-Received: by 2002:a17:902:d502:b0:1b8:9461:6729 with SMTP id
 b2-20020a170902d50200b001b894616729mr12467082plg.2.1695068122112; 
 Mon, 18 Sep 2023 13:15:22 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:21 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:45 +1000
Message-ID: <20230918201404.3765-26-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 25/44] drm/nouveau/disp: add hdmi audio hal
 function
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

This just adds a hook for RM to use, HW paths remain untouched, but
should probably be cleaned up to use this too at some point.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h   |  1 +
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 10 +++++++++-
 2 files changed, 10 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
index 6e750890bcc9..8686e5c044a5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/ior.h
@@ -74,6 +74,7 @@ struct nvkm_ior_func {
 			     bool scrambling_low_rates);
 		void (*infoframe_avi)(struct nvkm_ior *, int head, void *data, u32 size);
 		void (*infoframe_vsi)(struct nvkm_ior *, int head, void *data, u32 size);
+		void (*audio)(struct nvkm_ior *, int head, bool enable);
 	} *hdmi;
 
 	const struct nvkm_ior_func_dp {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index ad75dc5c50cf..7574f2200644 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -99,12 +99,20 @@ nvkm_uoutp_mthd_hda_eld(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (argc && args->v0.data[0]) {
 		if (outp->info.type == DCB_OUTPUT_DP)
 			ior->func->dp->audio(ior, args->v0.head, true);
+		else
+		if (ior->func->hdmi->audio)
+			ior->func->hdmi->audio(ior, args->v0.head, true);
+
 		ior->func->hda->hpd(ior, args->v0.head, true);
 		ior->func->hda->eld(ior, args->v0.head, args->v0.data, argc);
 	} else {
+		ior->func->hda->hpd(ior, args->v0.head, false);
+
 		if (outp->info.type == DCB_OUTPUT_DP)
 			ior->func->dp->audio(ior, args->v0.head, false);
-		ior->func->hda->hpd(ior, args->v0.head, false);
+		else
+		if (ior->func->hdmi->audio)
+			ior->func->hdmi->audio(ior, args->v0.head, false);
 	}
 
 	return 0;
-- 
2.41.0

