Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EAFEB7A539B
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F074010E2E9;
	Mon, 18 Sep 2023 20:15:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com
 [IPv6:2607:f8b0:4864:20::635])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60C4110E2E9
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:03 +0000 (UTC)
Received: by mail-pl1-x635.google.com with SMTP id
 d9443c01a7336-1c43fe0c0bfso20633785ad.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068102; x=1695672902; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=V30HlKC9H6rviVJ0kMhGfMPhAULyVPgNj1GQXJfileY=;
 b=A4ogBkyJcaxzte77eiWbPut5jrHia+GiewCXowoHorNFJZd7gE9YQsb9sBK8wEIL55
 Yvzxzz9L8d6glflySuEThEO7kEEI5HpRZR8yU50TErgJBGUUWZmuBwrA/H9FlVkUEqy/
 ceT6/J6Sx80WXHmF5qE24dpCpgEuFLdH5jKc17iukcpoWLDS41oyWmsu3o3h/TdOvBRa
 RTD4jFpL0lOGEVZBiNw4n3QVCOxbjkkqgyIfsuz1SQ5ZYpTY0aM3ugkKY8LwS4lvcZ3L
 nSJu11YglOCS1UfWBpfD/hZ5GiD9CBLc59ec/a3CtQ+rnr5Jv6Dp/+6cVpkH4ijaqTU3
 qj2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068102; x=1695672902;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V30HlKC9H6rviVJ0kMhGfMPhAULyVPgNj1GQXJfileY=;
 b=X0KqPd+eNaWXpA7kTPJEFT7fFNH3WWdBxhpROh+I150OF1jF4tcn6tIbQqJe5uIYJA
 AUtiLvYN/iMUlgkW4CrnHJ1V3P4gHxHXbDp8D/tB1dZIt7LbPPQgtEmEGStRMJpQW/Xq
 3iFJmoMlw0k7JvpsZUyHmBzAMBzoxNPOrLWTUSHdjPOI+Bl+Na/MuivEPbDFwfQJAoON
 V1CsIJgetSYAHlSqSn6uNP/NUFR/lYOMW0VVVmA2s+0nBWe/Gd9Uueo7UbQ9142Jahwb
 yX7NJE2OfBpL9VPwdAyoc8kioCWHKASiu0a35Mq53R9Ktgj2z5BN9+9lraycGsu4kntY
 HgNg==
X-Gm-Message-State: AOJu0YxAgWMhF+lR3wGqfN2PDtSDTHaa3SMzh52JY1rm9MaY8Tjyc8Fw
 EC7BtB51EOiEwdtl3Achg3KEvxia/xs=
X-Google-Smtp-Source: AGHT+IGLhilBpYG0C1tR7F89kklzjEODBZtm1PfHfP9yvZLe2CFrqHTEu3arKqtbhZY7QTw2SQ/CXQ==
X-Received: by 2002:a17:902:bcc8:b0:1bd:b8c8:98f8 with SMTP id
 o8-20020a170902bcc800b001bdb8c898f8mr7976311pls.4.1695068102322; 
 Mon, 18 Sep 2023 13:15:02 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:01 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:37 +1000
Message-ID: <20230918201404.3765-18-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 17/44] drm/nouveau/kms/nv50-: keep output state
 around until modeset complete
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

- we'll want this info post-UPDATE for later patches

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 165bc6a0d563..11790ced2b7d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2082,7 +2082,7 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	nv50_crc_atomic_init_notifier_contexts(state);
 
 	/* Update output path(s). */
-	list_for_each_entry_safe(outp, outt, &atom->outp, head) {
+	list_for_each_entry(outp, &atom->outp, head) {
 		const struct drm_encoder_helper_funcs *help;
 		struct drm_encoder *encoder;
 
@@ -2096,9 +2096,6 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			help->atomic_enable(encoder, state);
 			interlock[NV50_DISP_INTERLOCK_CORE] = 1;
 		}
-
-		list_del(&outp->head);
-		kfree(outp);
 	}
 
 	/* Update head(s). */
@@ -2196,6 +2193,11 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 	if (atom->lock_core)
 		mutex_unlock(&disp->mutex);
 
+	list_for_each_entry_safe(outp, outt, &atom->outp, head) {
+		list_del(&outp->head);
+		kfree(outp);
+	}
+
 	/* Wait for HW to signal completion. */
 	for_each_new_plane_in_state(state, plane, new_plane_state, i) {
 		struct nv50_wndw_atom *asyw = nv50_wndw_atom(new_plane_state);
-- 
2.41.0

