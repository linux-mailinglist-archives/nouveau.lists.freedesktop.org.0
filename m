Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DF2479FED7
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF4E010E539;
	Thu, 14 Sep 2023 08:47:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com
 [IPv6:2607:f8b0:4864:20::436])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58C9B10E538
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:54 +0000 (UTC)
Received: by mail-pf1-x436.google.com with SMTP id
 d2e1a72fcca58-68fb7fb537dso640088b3a.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681273; x=1695286073; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c0TMj0FLY5EKY04FGVswBvqaefcU6da0XZEsTc2/O5U=;
 b=eN3sfzIyj+VboP4U539GHlhdcLsn4/JemBDjnibtMebIPktJujCCd329uToK5K1Bx7
 1kXyf8ujbR8fKdm/Cws1AH69W6BGnVsXBMrhZ3GZ7eLIhfti1thvjSnKm4TosqD52NRx
 lIYsVfghu2V2gVCBe8MoD3iFTLMWmnyHFOyEeYrq4Y056xY0wZULn054trNnm1iSfs7r
 f6/6KVuV2ZHy+pnVxOKdLfD+fdwzK7GgCTK8h2ANfX6KmQjrAfCatFO6+vW3Cwa/aNLF
 e0NpzcfhnKrchWgGiTPFgQV+89Sy1tVum7Z8cym2DgFhO2ezR38HCzRozJDaDs5W8KtQ
 co3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681273; x=1695286073;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0TMj0FLY5EKY04FGVswBvqaefcU6da0XZEsTc2/O5U=;
 b=gu85xOLPeY7D18hX+ZSFv7zNILn54LkRFQxDwKjqf/8KiBgslnjcLwLXCYtOrnUyHW
 AFZQbrg0MiHq/NInuaf5GTW/xV8C0oa22h3+jqPtGcDtCa9RMXqWuXg120RWpAil6PEy
 4q9eLh/4WBPV9dyvmznbitRsz3ByJwJu4r++Tfx8LH7pCTwaDDSXMM28ik8rfljPzi5y
 7Bt+9+Ct80+JbsgKZsWX2a26Ev3CpKbvaid4TF/Y2Te10DHQwUlvH2GKr7z9C48ggCu5
 ib0VAnE/8lDRRbYGqjmsu0OreAjR6VeRZs/DukltoY7mVb9uwbSCD10MKj0iE5RmEsU4
 Lu1g==
X-Gm-Message-State: AOJu0YwkCxmH1aSR0CN3aVPrpcA7u6H2otyYN7prP1/tCZGYUgz+/qPx
 EL/nVUXYYWT1C1e1VrjMf0Dt+pILG44=
X-Google-Smtp-Source: AGHT+IFt/Xeb5e5PwZjlV0SGUC7K+OAzHrlehCWToTYFieVHmQB5m5YuNntR3w/KUVg4p4o+icyuZw==
X-Received: by 2002:a05:6a00:24d1:b0:68e:2c3a:8774 with SMTP id
 d17-20020a056a0024d100b0068e2c3a8774mr6176367pfv.31.1694681273433; 
 Thu, 14 Sep 2023 01:47:53 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:53 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:06 +1000
Message-ID: <20230914084624.2299765-27-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 25/44] drm/nouveau/disp: add hdmi audio hal
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

