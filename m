Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F7587A53A0
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D41610E2EC;
	Mon, 18 Sep 2023 20:15:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1167210E2F1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:13 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-1c47309a8ccso11611755ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068112; x=1695672912; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FwDHzACXAKX/MHCr+58iU9FWVDUjqHmxcmBJYfVhVog=;
 b=kGML30KziZ5LEBPYl6YhXAUzszuzRI+W2wy+4+NHPCXpIdj4Bz647MeRcFgKk9+kMC
 qZah8SMPsNWdDCWlu18kD56vtiiah+fFtk2h7hDtcOgg86WXB+xw/eXCunvh+7rl9g6o
 /vds8wKabKGKEE+mnQTtn6PKt28axMCcncN9QRVZ4LBxuSgfCmR8o1OCF3+K70dzWHWr
 Yj5Q/PW6neOvw8YUp6l5bfIgS3+lf4axq4v49HEiZkfbpC0PBjOTbU3iqzsPn7WJs9y+
 FQ6ltmqEgMCmMthi0deUporLXQwQRmKZv/mXfAPP9YliBrSHjRzhdYOG6pQTgZ3d0sk6
 RQWw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068112; x=1695672912;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FwDHzACXAKX/MHCr+58iU9FWVDUjqHmxcmBJYfVhVog=;
 b=m/zuF7la4h8nYU2BIDgC/rT/xSSEPSPV2X7PLnTMX2/0N/IsRwg4XJTDHAJzSZEWcM
 aHQij5YiHQG6y12AqgS8MlmwCYPG1xK67KsZQCcCxo7W56u/GDPBc2uNiW6w8X0f8De4
 KUBy9Kfb22lcsnHeCByFCCosID7qzvGP75qJP/UPgSJgNqFoXw09UF8KvNKW7LooQNXY
 uGXYqPIVl97DVD/XoaxELPw7snj9RDK5RbbGSB544+U+MRbtcImb/tzqx1ClG+Rcm1DH
 /2e+n+vZr3/igBGm+Gr+7aNVSN4OBCV++Tvpg7C+GB1KmFt3wOxHLd02TuBkRhb61DML
 FQyg==
X-Gm-Message-State: AOJu0YyD2+4WOJxoN5eE90lHlIy/BXm7QXKblmbpztv7OiDLvv0HJBPv
 uxgvmMBzl9rbfFveH69M3aDkcTQ62l8=
X-Google-Smtp-Source: AGHT+IENiba72Mi721UfTw3iOkLlw5Wk13AR9O9rBM76A/tY4/VxKHFJZIGZsR5fDVXt0fffDFXmsA==
X-Received: by 2002:a17:902:c109:b0:1c3:e4b8:701f with SMTP id
 9-20020a170902c10900b001c3e4b8701fmr691050pli.19.1695068112180; 
 Mon, 18 Sep 2023 13:15:12 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:11 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:41 +1000
Message-ID: <20230918201404.3765-22-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 21/44] drm/nouveau/disp: release outputs
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
Reviewed-by: Lyude Paul <lyude@redhat.com>
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

