Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D80F7A538C
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC79310E0F9;
	Mon, 18 Sep 2023 20:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com
 [IPv6:2607:f8b0:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABF1010E0F4
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:33 +0000 (UTC)
Received: by mail-pl1-x636.google.com with SMTP id
 d9443c01a7336-1c4586b12feso13845065ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068073; x=1695672873; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=/l5ZADlwlqkXnW/KttQhzb/5yKDt3G0GkhXdgMfgDVQ=;
 b=gljait0b9lm3p+D1nIwe/sLqrEYp4OCJGqwOg66ubolwoSJB2qfMooScAE+NzWgL3N
 vg4JMKcrAOdXXOdoMOue0LJcLx8FL8Z8RbNlem3WxsswhENewdPLlG/6P6oa+jDoNU/S
 BZ2F6VytJZQkc/YJ3i2p0k1ccnN+2u3jZ+cd4zx9IWCCQ7QXoeUebvB23/UJalmC16AH
 4uS/aG4na5J+P8RjaJbVbYiGEaF9loMqOPxYm8N/pXxQM8YqH5vqtiliMVLN2xhYJq+D
 7Ww74Xeoz1EVbJYWgW76NJgAX9/E54tQ9yev/G/oZU+HoPYpVvwmV1pMd4rOKWf6n4Wu
 aH1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068073; x=1695672873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=/l5ZADlwlqkXnW/KttQhzb/5yKDt3G0GkhXdgMfgDVQ=;
 b=Yzzbh90OOLkY3J0iOJTHpHx/6ccYUbnB8PXJPdMnaiEsPm8kj9kXcPiWAvfmZ+0Np/
 STe4D40wCWBFhMOBZCsiww+Qa9dB3qh24+RlJG6yPVDNo/LRTLwC/LSFMURhHd5Szqe+
 VZwYOpos7ko+Djn3Qwr/Fq6e1XE2XpnpegncsLg6tj5BSeWlzQ4oRW/+2D/yUVys5DOc
 ffvXXgbobgQYcHXfbuXQvYxVqeLomo61bd3XPa53YgioW8TMKF9qefXCsJjq314n1RgC
 uXyjI8PDpm/pcx9kL+qKcep4H0tN+Pf8mPYb9fvTWCSCffBMf2EK3pz01IhZo3pSaP1i
 +1tQ==
X-Gm-Message-State: AOJu0Yx9n0j7nRzhT2l7PyJCwuN+y+EVZvaNb0pJPeBDiNfoMf7l6zOl
 nxCsdnymf7YDKHm1xXra5I+fKW6tYWE=
X-Google-Smtp-Source: AGHT+IHGPs0/gzEG90LRk9K6xRn5CUNKJb2rVgyq+eyTouD9pfXUDBVs76z4ClCFnlHTiGMeWGKyqg==
X-Received: by 2002:a17:902:ea8c:b0:1c4:5e39:93bd with SMTP id
 x12-20020a170902ea8c00b001c45e3993bdmr5010227plb.32.1695068072759; 
 Mon, 18 Sep 2023 13:14:32 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:32 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:25 +1000
Message-ID: <20230918201404.3765-6-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 05/44] drm/nouveau/kms/nv50-: fix mst payload
 alloc fail crashing evo
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

Programming -1 (vc_start_slot, if alloc fails) into HW probably isn't
the best idea.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
 1 file changed, 7 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 4e7c9c353c51..2911167bf22a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -912,6 +912,7 @@ nv50_msto_prepare(struct drm_atomic_state *state,
 	struct nv50_mstm *mstm = mstc->mstm;
 	struct drm_dp_mst_topology_state *old_mst_state;
 	struct drm_dp_mst_atomic_payload *payload, *old_payload;
+	int ret = 0;
 
 	NV_ATOMIC(drm, "%s: msto prepare\n", msto->encoder.name);
 
@@ -920,18 +921,20 @@ nv50_msto_prepare(struct drm_atomic_state *state,
 	payload = drm_atomic_get_mst_payload_state(mst_state, mstc->port);
 	old_payload = drm_atomic_get_mst_payload_state(old_mst_state, mstc->port);
 
-	// TODO: Figure out if we want to do a better job of handling VCPI allocation failures here?
 	if (msto->disabled) {
 		drm_dp_remove_payload(mgr, mst_state, old_payload, payload);
-
-		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
+		ret = 1;
 	} else {
 		if (msto->enabled)
-			drm_dp_add_payload_part1(mgr, mst_state, payload);
+			ret = drm_dp_add_payload_part1(mgr, mst_state, payload);
+	}
 
+	if (ret == 0) {
 		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index,
 				      payload->vc_start_slot, payload->time_slots,
 				      payload->pbn, payload->time_slots * mst_state->pbn_div);
+	} else {
+		nvif_outp_dp_mst_vcpi(&mstm->outp->outp, msto->head->base.index, 0, 0, 0, 0);
 	}
 }
 
-- 
2.41.0

