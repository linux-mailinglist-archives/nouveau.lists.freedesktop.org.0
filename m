Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8BB479FED2
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B1410E540;
	Thu, 14 Sep 2023 08:47:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x112f.google.com (mail-yw1-x112f.google.com
 [IPv6:2607:f8b0:4864:20::112f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C797010E533
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:45 +0000 (UTC)
Received: by mail-yw1-x112f.google.com with SMTP id
 00721157ae682-59bdb3d03b1so7912017b3.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681264; x=1695286064; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+jskVrshYkuBgIIkzhVz2d+l1i0LaXyOUvgkGuclR5I=;
 b=DAHGpkTxN7ulpW9Om6+J4wgosgwC+Fpvcr0RD0IGWNcdKNx5RrJt/xaBA4kuboKxDH
 hp7K8QT9xiu9ZdR4sOEdBtOs75bF6L1K9Kl8KHfBfv+6dZclp+N0YflFu2MFfw84ujxn
 9kD1Jj1jP3ksxh3adQWWlqrDrb2sDKgJt81fvNBvLvdQGckv0uqauBwrtG3Pa6I9UGHr
 HTz+7xzBhfGFh8bcxeNhn76oaM2v0zeD3mGuAqIM9/fZO7euA+7bxbVcRruy0OoNG+Gy
 3ULMMMPCGlBLjKQgRCPbwcFmMOv2qqC8MGXXEo9lQWqJAoDEpHkDJ8rvySK7FAeHKJUD
 x5Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681264; x=1695286064;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+jskVrshYkuBgIIkzhVz2d+l1i0LaXyOUvgkGuclR5I=;
 b=Omxq6/3dgN7jM8/288mHFLJJveJJ2fs4CqLtS+wWFZME+40Iwcl/TXZ+pdt+4D4qbt
 zsrgtBN3TeK2twPWSuN06+HMdcM4CvOFQHjxeBC7uR++IMAwK9/WAzjmZp3KSjpdalRM
 jz0g/sEnPwxKX3Y97d+IspobF1zqN1gT9TjwRkQAE5DpLp58voIZBOksE/UzPx1mCCzn
 oms+Un8AhZ+huupWvLcrXDr41TgKOXr3UO2lNb4h3QKLwe8cxD95F3C0eNuMS+5lqoD6
 GrSW2/tBNTKFj6ws86dbiE2zzV7ghL5Sz9AJv2C46I1baKd5rXSkZv/cat0x5LoQVr+K
 cYaw==
X-Gm-Message-State: AOJu0YwLNbMbnNVjHJtOAKTSlvfPLDODtEnfgdVeQqiuazPECMs6jtZk
 H1b+ZLNNVKR982kHX/HkUmtLYLXYtR0=
X-Google-Smtp-Source: AGHT+IEznfhxZot12pLsVF4a0bjUL6m03ktAIBEjuzlnQ8LoHkV2uFNF3ZyPwAPAW6JcAFhjDwwAMg==
X-Received: by 2002:a81:5304:0:b0:57a:8456:3401 with SMTP id
 h4-20020a815304000000b0057a84563401mr5018016ywb.29.1694681264476; 
 Thu, 14 Sep 2023 01:47:44 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:44 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:02 +1000
Message-ID: <20230914084624.2299765-23-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 21/44] drm/nouveau/disp: release outputs
 post-modeset
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

Prior to this commit, KMS would call release() prior to modeset, and the
second supervisor interrupt would update SOR routing if needed.

Now, KMS will call release() post-modeset and update routing immediately.

- preparation for GSP-RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c        | 18 ++++++++----------
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c    |  1 +
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c   |  2 ++
 3 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 15ddb92c31fb..7b238f6599e2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -477,7 +477,6 @@ nv50_dac_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 
 	core->func->dac->ctrl(core, nv_encoder->outp.or.id, ctrl, NULL);
 	nv_encoder->crtc = NULL;
-	nvif_outp_release(&nv_encoder->outp);
 }
 
 static void
@@ -1298,6 +1297,11 @@ nv50_mstm_cleanup(struct drm_atomic_state *state,
 		}
 	}
 
+	if (mstm->disabled) {
+		nvif_outp_release(&mstm->outp->outp);
+		mstm->disabled = false;
+	}
+
 	mstm->modified = false;
 }
 
@@ -1332,12 +1336,6 @@ nv50_mstm_prepare(struct drm_atomic_state *state,
 				nv50_msto_prepare(state, mst_state, &mstm->mgr, msto);
 		}
 	}
-
-	if (mstm->disabled) {
-		if (!mstm->links)
-			nvif_outp_release(&mstm->outp->outp);
-		mstm->disabled = false;
-	}
 }
 
 static struct drm_connector *
@@ -1580,7 +1578,6 @@ nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *st
 
 	nv_encoder->update(nv_encoder, nv_crtc->index, NULL, 0, 0);
 	nv50_audio_disable(encoder, nv_crtc);
-	nvif_outp_release(&nv_encoder->outp);
 	nv_encoder->crtc = NULL;
 }
 
@@ -1825,7 +1822,6 @@ nv50_pior_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *s
 
 	core->func->pior->ctrl(core, nv_encoder->outp.or.id, ctrl, NULL);
 	nv_encoder->crtc = NULL;
-	nvif_outp_release(&nv_encoder->outp);
 }
 
 static void
@@ -1992,8 +1988,10 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 						  nv_encoder->conn, NULL, NULL);
 				outp->enabled = outp->disabled = false;
 			} else {
-				if (outp->disabled)
+				if (outp->disabled) {
+					nvif_outp_release(&nv_encoder->outp);
 					outp->disabled = false;
+				}
 			}
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index b288ea6658da..20a013f1bbba 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -238,6 +238,7 @@ void
 nvkm_outp_release(struct nvkm_outp *outp)
 {
 	nvkm_outp_release_or(outp, NVKM_OUTP_USER);
+	nvkm_outp_route(outp->disp);
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index ffd174091454..40cbb4ddc037 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -188,6 +188,8 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 
 	if (argc != sizeof(args->vn))
 		return -ENOSYS;
+	if (!outp->ior)
+		return -EINVAL;
 
 	nvkm_outp_release(outp);
 	return 0;
-- 
2.41.0

