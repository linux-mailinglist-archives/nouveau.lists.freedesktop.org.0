Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CD9679FEC6
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 345ED10E52E;
	Thu, 14 Sep 2023 08:47:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E933710E52B
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:18 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68fb98745c1so525785b3a.1
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681238; x=1695286038; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DwhP/fMN6cyalpEGaUtZ+7Iwo3Tw2ZqKnWxMdCG3rzA=;
 b=FUataBXIazm/BPwa8EIBzKwDSLX1ZezDLPxB5nr7xUljKyGb7ppZ1RYlRHpQlz21jv
 YvkHlaClY32JBlk2CzDZMErTuW/Nw4G4HZPmH/ZUY2p7yCnBep/norrtVrifx6JwQ8U1
 dRmkkLZjV9jZ4F2MJ4i8zqjBZhTqXw45s8YRvzE35CGEu/hn6cS58hEBwtMThFYI2uLM
 lUcuG+inU5yHp6Vggv5CJ7/KWFbNxPkXccwnpqjR6l6Njp2zS3l7cE8YtUdtUY5EHe7X
 gknDvMWY4rAM9J0M1G0g1nySNFX2xgYOU4oS86Hdi8AuY5DVTvWIcB8im9l11xvetDno
 v9qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681238; x=1695286038;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DwhP/fMN6cyalpEGaUtZ+7Iwo3Tw2ZqKnWxMdCG3rzA=;
 b=ux9Fq+CHNJ942+YqmpZH7+VdAdIYrmmoCyi/MWtk/5I1BQzxZ539y2By1hMCdyRqv+
 yeavliUHa3IEF2RbLuPUg/H/7WLZMbbDj/AdVByJ5qJb+KcascmxyyQUXyM/PiYx0ERU
 6HzeikEbk7fobIpc4su6TPku6sYkQzXHEkIRCjQcD5F17NEHupGBWA0TT+IFvT3DOvu7
 wkXE5B/80GgbsUp0UKYTkodYjB4jUw/U7MIYWG0GHXNZtduWwrvHtGjSqWhQFC4aNUCi
 GIwGuXQjZ9/z+aZIjx0ulREA2JAgBfvzM5QN7/8WEehOJm/or1MI0LbnfBy0HnbjIUpQ
 7Aog==
X-Gm-Message-State: AOJu0YwQclDrydwk2semlc5ARzmmf64ya4IL8hO8v31Kyg+jjIF4dHFl
 xewa91UrFBUB62gJHxxiHF+JsmDOXPA=
X-Google-Smtp-Source: AGHT+IFmY2jxtpRJALH1qLAVrXj7FVvFnmTVN5Q5H8dqZWKw6TtXa2EMHH2RWCXacynaGEfy0haV7A==
X-Received: by 2002:a05:6a00:cc4:b0:68e:43ed:d30b with SMTP id
 b4-20020a056a000cc400b0068e43edd30bmr5011392pfv.21.1694681237971; 
 Thu, 14 Sep 2023 01:47:17 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:17 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:50 +1000
Message-ID: <20230914084624.2299765-11-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 09/44] drm/nouveau/disp: rename internal output
 acquire/release functions
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

These will be made static later in the patch series, after the code that
uses them has been cleaned up in preparation for GSP-RM support.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c  | 10 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h  |  5 +++--
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 16 ++++++++--------
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index fb061144438d..3ed93df475fc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -89,7 +89,7 @@ nvkm_outp_xlat(struct nvkm_outp *outp, enum nvkm_ior_type *type)
 }
 
 void
-nvkm_outp_release(struct nvkm_outp *outp, u8 user)
+nvkm_outp_release_or(struct nvkm_outp *outp, u8 user)
 {
 	struct nvkm_ior *ior = outp->ior;
 	OUTP_TRACE(outp, "release %02x &= %02x %p", outp->acquired, ~user, ior);
@@ -142,7 +142,7 @@ nvkm_outp_acquire_hda(struct nvkm_outp *outp, enum nvkm_ior_type type,
 }
 
 int
-nvkm_outp_acquire(struct nvkm_outp *outp, u8 user, bool hda)
+nvkm_outp_acquire_or(struct nvkm_outp *outp, u8 user, bool hda)
 {
 	struct nvkm_ior *ior = outp->ior;
 	enum nvkm_ior_proto proto;
@@ -234,6 +234,12 @@ nvkm_outp_detect(struct nvkm_outp *outp)
 	return ret;
 }
 
+void
+nvkm_outp_release(struct nvkm_outp *outp)
+{
+	nvkm_outp_release_or(outp, NVKM_OUTP_USER);
+}
+
 void
 nvkm_outp_fini(struct nvkm_outp *outp)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index 1cd70868f225..76d83fb9c6e5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -77,8 +77,9 @@ void nvkm_outp_fini(struct nvkm_outp *);
 
 int nvkm_outp_detect(struct nvkm_outp *);
 
-int nvkm_outp_acquire(struct nvkm_outp *, u8 user, bool hda);
-void nvkm_outp_release(struct nvkm_outp *, u8 user);
+int nvkm_outp_acquire_or(struct nvkm_outp *, u8 user, bool hda);
+void nvkm_outp_release(struct nvkm_outp *);
+void nvkm_outp_release_or(struct nvkm_outp *, u8 user);
 void nvkm_outp_route(struct nvkm_disp *);
 
 struct nvkm_outp_func {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 0c4ffa3ffb28..828db77af242 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -141,7 +141,7 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 		ior->func->hdmi->ctrl(ior, head->id, false, 0, 0);
 	}
 
-	nvkm_outp_release(outp, NVKM_OUTP_USER);
+	nvkm_outp_release(outp);
 	return 0;
 }
 
@@ -151,7 +151,7 @@ nvkm_uoutp_mthd_acquire_dp(struct nvkm_outp *outp, u8 dpcd[DP_RECEIVER_CAP_SIZE]
 {
 	int ret;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, hda);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hda);
 	if (ret)
 		return ret;
 
@@ -172,7 +172,7 @@ nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_m
 	if (!(outp->asy.head = nvkm_head_find(outp->disp, head)))
 		return -EINVAL;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, hdmi && hdmi_hda);
 	if (ret)
 		return ret;
 
@@ -182,7 +182,7 @@ nvkm_uoutp_mthd_acquire_tmds(struct nvkm_outp *outp, u8 head, u8 hdmi, u8 hdmi_m
 		if (!ior->func->hdmi ||
 		    hdmi_max_ac_packet > 0x1f || hdmi_rekey > 0x7f ||
 		    (hdmi_scdc && !ior->func->hdmi->scdc)) {
-			nvkm_outp_release(outp, NVKM_OUTP_USER);
+			nvkm_outp_release_or(outp, NVKM_OUTP_USER);
 			return -EINVAL;
 		}
 
@@ -203,7 +203,7 @@ nvkm_uoutp_mthd_acquire_lvds(struct nvkm_outp *outp, bool dual, bool bpc8)
 	outp->lvds.dual = dual;
 	outp->lvds.bpc8 = bpc8;
 
-	return nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
+	return nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 }
 
 static int
@@ -219,7 +219,7 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	switch (args->v0.proto) {
 	case NVIF_OUTP_ACQUIRE_V0_RGB_CRT:
-		ret = nvkm_outp_acquire(outp, NVKM_OUTP_USER, false);
+		ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_USER, false);
 		break;
 	case NVIF_OUTP_ACQUIRE_V0_TMDS:
 		ret = nvkm_uoutp_mthd_acquire_tmds(outp, args->v0.tmds.head,
@@ -261,7 +261,7 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
 
-	ret = nvkm_outp_acquire(outp, NVKM_OUTP_PRIV, false);
+	ret = nvkm_outp_acquire_or(outp, NVKM_OUTP_PRIV, false);
 	if (ret == 0) {
 		if (outp->ior->func->sense) {
 			ret = outp->ior->func->sense(outp->ior, args->v0.data);
@@ -269,7 +269,7 @@ nvkm_uoutp_mthd_load_detect(struct nvkm_outp *outp, void *argv, u32 argc)
 		} else {
 			ret = -EINVAL;
 		}
-		nvkm_outp_release(outp, NVKM_OUTP_PRIV);
+		nvkm_outp_release_or(outp, NVKM_OUTP_PRIV);
 	}
 
 	return ret;
-- 
2.41.0

