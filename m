Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C498979FECE
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4844A10E526;
	Thu, 14 Sep 2023 08:47:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com
 [IPv6:2607:f8b0:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F1F510E537
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:36 +0000 (UTC)
Received: by mail-pf1-x42c.google.com with SMTP id
 d2e1a72fcca58-68fb79ef55eso614420b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681255; x=1695286055; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=JhgD1fOD6Obb3RosXZXw8GhLPdsAVU9DxwS9J31Mrl4=;
 b=AS217SEQ2RxOhegUm0yjUPvHK/9bB4PxoL4gpbvHSly/mKfU2qdLoJKKeAQFCmz9U+
 nK5tjX6CRGfD6bbteFhN/8KszVGqSvYk47BOSb+su622acOHqtTdOB3bulKEqaqI53xB
 Q8fJ0tTRUkIF3UPudRZUqaTom5VReehls43NlJ0u6IuK5poDhx3nmNpOyoc611KOqQsE
 d+IDONl+jyN2UxtxIHdKRwWfmF+kGaBVzQQjCZchf+jG9SURYeLlGs3kj2NS9HyNzfZI
 /UeDlATkWJ/5YXq5QMFp6diSPB8ri/BB6nuBO3wpR2Enj+kRXZqXiPlQ8hzjuVHeKSFQ
 4TnA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681255; x=1695286055;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JhgD1fOD6Obb3RosXZXw8GhLPdsAVU9DxwS9J31Mrl4=;
 b=wvRvSOdhHcCBEe1/PwMTt29MzJXl8gBKq+qz7xzEnQE6eRuxUV9XqOIwxWYDBJkGoa
 bZnqx8YNP6UrS+E8RnTvAV/o5BUzetDqLIbmpev0hThmMncwBAh3x80v1n6tSBRxN2eV
 rbRP1KyT9Xc+/bfaq9fO4iL1RPk2f4yWIEfd8AJluHw5Tn9nQ4nIiVIBn3b6ytAq3s7S
 qQHE0sqghzgNkidm40brT4sCmmvMWCszPPnST4vSw8Di60/FbTCbo7oOfYjWHDO0twX+
 xdro5CWVWLik7mbWgm5Shwa5AnFQGtP3ACSAIUej31Q0KlJMXRl4w+FM5QsczpMORPQu
 QqQg==
X-Gm-Message-State: AOJu0YzXoI3JiuIvHsC7jHLpDqpOd85rVjM5aZcIs8dwNmfxJ7lXjbSk
 IX83cttDWMLizRXkFe83tR2wTHI6F4g=
X-Google-Smtp-Source: AGHT+IETssoE6Yy+7PhnfTkbdi8vDgNQpojGHHn5d1S5Zg0BzSmB3ckdKRvTuIUGlNr6fy6Tur9USg==
X-Received: by 2002:aa7:88c8:0:b0:68e:3f55:73d with SMTP id
 k8-20020aa788c8000000b0068e3f55073dmr6413780pff.10.1694681255575; 
 Thu, 14 Sep 2023 01:47:35 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:35 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:58 +1000
Message-ID: <20230914084624.2299765-19-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 17/44] drm/nouveau/kms/nv50-: keep output state
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

