Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2377A539C
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0892F10E2EE;
	Mon, 18 Sep 2023 20:15:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com
 [IPv6:2607:f8b0:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BF30310E2E5
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:05 +0000 (UTC)
Received: by mail-pf1-x42f.google.com with SMTP id
 d2e1a72fcca58-690bccb0d8aso337059b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068105; x=1695672905; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iSUWRQkd7dZ2xP4ImGoIp2TGpkKOi0Ayg4NoXdT9m1U=;
 b=Mv3rn7WUjq0eae8XBNkTZwAeLNPk9uNG2qSd5y79qbcq1jh4z5zGmeHI1daacVpBkh
 2AyHKl1Qge8c9shDPSNXyrHtFmm6QIhr5HenJtcCYI6OcowLikZoAZKzEQxGtkj+eXXg
 qazQBcgAoVk/YAFC+Ru8k0vEMU3ArGdcY8px+8z9DrWY9Qwf7HPFKOLNGFI/nrBzKPOD
 mBZPQOya3TAg0KPOvWJf3pSVtXhVg2gEBuTF/UP10j1iLj6DFNlaURwP3zEiLAIWYkE7
 a4ZUH5bt/pNhsTEcFeYRVxWoDo9g0vBKHcBURfSOI7WWyXWCLRzZZzORjYdkdEj7CVfh
 cJ/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068105; x=1695672905;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iSUWRQkd7dZ2xP4ImGoIp2TGpkKOi0Ayg4NoXdT9m1U=;
 b=T8Qf2lydjX/SyIIpN/2pz6aIeZuJjKmX1z/11NaHknuSubY1xWvWMROTunFqamaFhg
 618BDSP/cW0qEW5ZvtwhHpIQ+Qqx0ZeBhaXt91zWwlzL3OEpdjm8nYvp2auO5uirtOUZ
 dgUNjYAO5VrNrSIfirSF+omBucV0CjWadTHQHNxl2L9Q4V0vugjZbV/dQA6q49hY7HB8
 OyVnvyW7pcHNgrJwL83ifiBV8pcpeDw+kFtoUU5r3Gikv6+rtle+6Vaui2+U8A6KpMra
 pTpkrUEnnmgLjCEEFkUFujFCBNeDWAbDf/MU5x9LOY8uaRpTl077FOKzyW9YJ6ocqng3
 Ykgw==
X-Gm-Message-State: AOJu0Yxw6pn/69XAWglhnbzBPRSP6B/3YlbPC4v9mL1urCdciWN0xx2b
 L40EdH4yQTIWcktqujvBBdCrlshN2Ew=
X-Google-Smtp-Source: AGHT+IFvoFtZ49asSHuz6oz2RBlIbCqetyQNt19q/MAfArG33j7sWGnmvzmnDGp/fJnUjodGY1G2Eg==
X-Received: by 2002:a05:6a21:3e0b:b0:153:8983:d8bf with SMTP id
 bk11-20020a056a213e0b00b001538983d8bfmr7427823pzc.16.1695068104814; 
 Mon, 18 Sep 2023 13:15:04 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:04 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:38 +1000
Message-ID: <20230918201404.3765-19-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 18/44] drm/nouveau/kms/nv50-: move audio enable
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

- adds tracking for post-UPDATE modeset operations, similar to mst[mo]'s
- audio won't work on RM without this
- we should probably have been doing this anyway

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 35 ++++++++++++++++++++++---
 drivers/gpu/drm/nouveau/dispnv50/disp.h |  3 +++
 2 files changed, 34 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 11790ced2b7d..ec63a2413455 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -707,6 +707,18 @@ nv50_audio_supported(struct drm_encoder *encoder)
 	    disp->disp->object.oclass == GT206_DISP)
 		return false;
 
+	if (encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
+		struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
+
+		switch (nv_encoder->dcb->type) {
+		case DCB_OUTPUT_TMDS:
+		case DCB_OUTPUT_DP:
+			break;
+		default:
+			return false;
+		}
+	}
+
 	return true;
 }
 
@@ -829,8 +841,6 @@ nv50_hdmi_enable(struct drm_encoder *encoder, struct nouveau_crtc *nv_crtc,
 		size = 0;
 
 	nvif_outp_infoframe(&nv_encoder->outp, NVIF_OUTP_INFOFRAME_V0_VSI, &args.infoframe, size);
-
-	nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
 }
 
 /******************************************************************************
@@ -1658,8 +1668,6 @@ nv50_sor_atomic_enable(struct drm_encoder *encoder, struct drm_atomic_state *sta
 		else
 			proto = NV887D_SOR_SET_CONTROL_PROTOCOL_DP_B;
 
-		nv50_audio_enable(encoder, nv_crtc, nv_connector, state, mode);
-
 #ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
 		backlight = nv_connector->backlight;
 		if (backlight && backlight->uses_dpcd)
@@ -1941,7 +1949,9 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 	struct drm_dp_mst_topology_state *mst_state;
 	struct nouveau_drm *drm = nouveau_drm(state->dev);
 	struct nv50_disp *disp = nv50_disp(drm->dev);
+	struct nv50_atom *atom = nv50_atom(state);
 	struct nv50_core *core = disp->core;
+	struct nv50_outp_atom *outp;
 	struct nv50_mstm *mstm;
 	int i;
 
@@ -1964,6 +1974,21 @@ nv50_disp_atomic_commit_core(struct drm_atomic_state *state, u32 *interlock)
 		if (mstm->modified)
 			nv50_mstm_cleanup(state, mst_state, mstm);
 	}
+
+	list_for_each_entry(outp, &atom->outp, head) {
+		if (outp->encoder->encoder_type != DRM_MODE_ENCODER_DPMST) {
+			struct nouveau_encoder *nv_encoder = nouveau_encoder(outp->encoder);
+
+			if (outp->enabled) {
+				nv50_audio_enable(outp->encoder, nouveau_crtc(nv_encoder->crtc),
+						  nv_encoder->conn, NULL, NULL);
+				outp->enabled = outp->disabled = false;
+			} else {
+				if (outp->disabled)
+					outp->disabled = false;
+			}
+		}
+	}
 }
 
 static void
@@ -2055,6 +2080,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 		if (outp->clr.mask) {
 			help->atomic_disable(encoder, state);
+			outp->disabled = true;
 			interlock[NV50_DISP_INTERLOCK_CORE] |= 1;
 			if (outp->flush_disable) {
 				nv50_disp_atomic_commit_wndw(state, interlock);
@@ -2094,6 +2120,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 
 		if (outp->set.mask) {
 			help->atomic_enable(encoder, state);
+			outp->enabled = true;
 			interlock[NV50_DISP_INTERLOCK_CORE] = 1;
 		}
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 9d66c9c726c3..42209f5b06f9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -85,6 +85,9 @@ struct nv50_outp_atom {
 	struct drm_encoder *encoder;
 	bool flush_disable;
 
+	bool disabled;
+	bool enabled;
+
 	union nv50_outp_atom_mask {
 		struct {
 			bool ctrl:1;
-- 
2.41.0

