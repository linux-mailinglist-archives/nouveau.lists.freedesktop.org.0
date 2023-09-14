Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CB0CA79FEC2
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC02610E528;
	Thu, 14 Sep 2023 08:47:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com
 [IPv6:2607:f8b0:4864:20::112d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DA9610E524
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:10 +0000 (UTC)
Received: by mail-yw1-x112d.google.com with SMTP id
 00721157ae682-59bbdb435bfso7928587b3.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681229; x=1695286029; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=RwlwcpLG5PUQyivoTrttU9WZ7a+bMTsTmlV31CtHP50=;
 b=ZVPHBpiBEiFIEPfJMq0zz5kwDdBELjNn2ix6hKXs9i0jxBO1n6Gg6qWUbX+vWCh69s
 IKKmq6oUa+A7Sbv0TKG8+IvcPbv6Sv1ctnnL388sTrECJbzHc4EqzE179QQ2o3FftOU6
 HxM3oA/K/yiXEP70KOLhs1DIP8UleGgFIpi7groOPtVe0nDO/nkMDG/XVD5Dniqxmk6Y
 ELBuXUtizDfKJa6YI8Yg1fGW+Srah5rxuPyWVwfAcEkwc1Gz3HR1f+n++zMx6B5F/nih
 hofeWJNJJhwYA/fiZMY3hRJgn7wGCHixwCY3iClxfK3fSTG2LLTnzfEpu7U1A68OKrmq
 gW2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681229; x=1695286029;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RwlwcpLG5PUQyivoTrttU9WZ7a+bMTsTmlV31CtHP50=;
 b=tZDfMOSdWJaNXUKyYex2aQvT8hQMcr0wPEKTFJuG74hgwy1rjaqMGMrZYPPL3m8ekT
 gW8tw5nToYzLcd1/A486aRYAPj2MxzJNiHDHohnIVn4OCMm+eR2IYN+pm+eIipOn+ORd
 XL10n6Xz7aaN7pO57aRwO4Q6lT4eJE4k4ZAkS/1dT3CSopuyU2SbRhZxLvCOfS3gGKT4
 UHdzJJR4SjkqAwhB+rhZk26u/VuLBmf0lWb9JqKWwvISD9LqdmRcDlYOjI5U6Q0J1Fmo
 ZZUwkvfVgohpxyCgPjSIGEqVwqAmiyHRmwHvl31sFNwus6/ddAcnIdk72PIZ0oBq1CWD
 6QCQ==
X-Gm-Message-State: AOJu0Yw0ajBnlMkg28yxsGM3UYDljU/MPKuQiJh/7cIWfnEMBc1ZoIAZ
 xs+oson3MXj6GqYSEckZcit1nEFpoAI=
X-Google-Smtp-Source: AGHT+IFJBsMFOJ+2NJUeno/olP4UmLMHR3UBV6HqzlhDKH/4H60LyDk7RiHREvwmOFgUwlITt5sd1g==
X-Received: by 2002:a81:49ca:0:b0:59b:e622:f820 with SMTP id
 w193-20020a8149ca000000b0059be622f820mr2475956ywa.13.1694681229331; 
 Thu, 14 Sep 2023 01:47:09 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:08 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:46 +1000
Message-ID: <20230914084624.2299765-7-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 05/44] drm/nouveau/kms/nv50-: fix mst payload
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

