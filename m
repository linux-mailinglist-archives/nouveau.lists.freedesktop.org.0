Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89DAF79FECF
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 116CA10E537;
	Thu, 14 Sep 2023 08:47:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-xa30.google.com (mail-vk1-xa30.google.com
 [IPv6:2607:f8b0:4864:20::a30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31D7C10E535
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:39 +0000 (UTC)
Received: by mail-vk1-xa30.google.com with SMTP id
 71dfb90a1353d-495c9eb8911so329883e0c.2
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681258; x=1695286058; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=q5/u7zRIl9o4VAzUDkpNZn3tE7zbGaDEs1pCQcgiGNk=;
 b=lBds/ROkf2MWrbcQ4hV/7tiBOnBf9awIQa78SURVViH5iW2X/nZtjBA4zs6csCjmqQ
 hUesOQRNeyYGSeJ/zrXbAhfMUtosCvL6quPoA5U8exPLnkapiADLI0rMisZTVm6us+SK
 m77sCkQz45l9RY6EuqCdX79Wu9RDW1PLucFroJ5XzrTiRlwg047hfRHUCNybIQOgjvMH
 W51KSaLW5axo4xQVWdYKWRZkZy9qG+k6hl20IQI3v5wzIDVWPKLu1AgAdmRuYvpDYTw6
 K0qkMyP9xe6sumdXBCXvRu1Mb+UJ6m8octBRcHY2ArN6vquLvLanOgxJsh8BZ0IbifFD
 bD5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681258; x=1695286058;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=q5/u7zRIl9o4VAzUDkpNZn3tE7zbGaDEs1pCQcgiGNk=;
 b=Vp//3EKtsDyBwBDkMkh+v9bZnOSWquGqoWwEDjfA2vU3w4eTri7e4Nha32CgOX+oTr
 l/WJwHN7DiMHqG9mU4+8fMkHin2sPrXr7HzQFrZclnKisiWDkNPvt7INLOevQK0sCMtk
 1SytjMipkTSLaAueF4rAwURA302Jjxc/S51wTCvBQFs/wvxq65dw3dNGQGvXBbmx0aBW
 /NOSuJeG0q+DUqk7+B/5pAGzvJPJaMPc2P1vn47aNdEuHPrxoA3lC30+7t/cSQCeMCTX
 p0g2Zpx7GX+wtHUvp4KPbF8FxZG/338q6HH9DneurTLVErxorI/eE4nfg2ScQZcKKaH0
 Akfw==
X-Gm-Message-State: AOJu0YyvdiqteitcZLEcT4aZa0zKatS8psyjS7i4gVBi57SW333N0OW+
 7txJXVJOmgm2VddNFesW5xYNnJRJBXI=
X-Google-Smtp-Source: AGHT+IF7DFqRasQEsvp8jrY+YT0EMtVKYG86u3kfqLK+9/Hx4ncOy3IkxfEkRCQIq1mF20bZvdFJMA==
X-Received: by 2002:a1f:e6c3:0:b0:490:ca13:8856 with SMTP id
 d186-20020a1fe6c3000000b00490ca138856mr5411515vkh.13.1694681257710; 
 Thu, 14 Sep 2023 01:47:37 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:37 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:59 +1000
Message-ID: <20230914084624.2299765-20-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 18/44] drm/nouveau/kms/nv50-: move audio enable
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

