Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 32BBC7A53A9
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:15:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A513110E2F5;
	Mon, 18 Sep 2023 20:15:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 301D910E2FB
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:15:35 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-690bc3f82a7so492319b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:15:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068134; x=1695672934; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=I20RIMlk+DPGsI5koPEOIJx4uRH132Q2Fz1uLcsrAtw=;
 b=I1QoJjq2IRmzrD1Np3SUnpK0nM3Fy7/35RNl6ouZ9IH9uV0Mfw+EHX8Q46IUcHPEbS
 p/pZ6sVa/pMeK+PHtCZdA5PbRkYbgAki8esW/AHsO5w/DQLkEiVvXsjfoAIcOFtMXyUL
 rKQTGe1yWb8MoJ3K+ZK9RZ3zQb5r45q/2oubWfQAH3gPtf5Dv3D+9VBZV2HJhAKAKkF8
 eHii+ReLWPbtaQXnqfTTIN8CqINB7yczW+N5Z88q1il7RgQXBgP2c0d7hIwRW6PqE3Ev
 BKiC4LwicDNyfe47e7NCNiYCVWbiYCXohwvW3ctd38CXQF0jKuGzXAoWYhEVZe96zgho
 MkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068134; x=1695672934;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I20RIMlk+DPGsI5koPEOIJx4uRH132Q2Fz1uLcsrAtw=;
 b=e3N/f7svXUcnb3wnPf4oKE4UAUN77WCGH5YzJpWZPbmAidBY6myOVpzxgsKm514q95
 DYcEs/Q17DtpzJl6NjA83eQk3IQ4GeOJY3k073pWLlbELCcRdByHl527PZeCj7o3jxwh
 bxGtXGU2RWhyvvKBDLySdM8T/bPfwfXNOz4X6pM8VN/zlTp9l0RWjNdh7sKVdnrccvRK
 P/nbPCrPMIGWeDHjDLMEOmV8MTpFQ7HSK9x8mlGElMgtMFSvnzOsDc5LN4pKmfDizJ8g
 3xsJL40O3rBEl5rTXZiNlERL/H52+tTvWiIoGOnT3cnTZer4N07rLhxXHoZZ3eITHzEr
 PGGw==
X-Gm-Message-State: AOJu0YwHFHPycf+O3aJlTi7K6Bybp4STcoaMsoX2I41P7eGdytkvmMJr
 8V34I46vnn3DZjriHnu+MN5dHWTEFdg=
X-Google-Smtp-Source: AGHT+IFjkgGEnSVIEjMh4pqUWWDfUG67ZFUKO6MPPeayCzqf18EDQDFMDMQlm7bXyl94me2pt7hXiw==
X-Received: by 2002:a17:903:32ce:b0:1c5:82bb:223b with SMTP id
 i14-20020a17090332ce00b001c582bb223bmr2410791plr.60.1695068134193; 
 Mon, 18 Sep 2023 13:15:34 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.15.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:15:33 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:50 +1000
Message-ID: <20230918201404.3765-31-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 30/44] drm/nouveau/kms/nv50-: flush mst
 disables together
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

- fixes some issues tearing down modes on tiled displays

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +----------
 drivers/gpu/drm/nouveau/dispnv50/disp.h |  1 -
 2 files changed, 1 insertion(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b7e9f951eee3..d52320965b50 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -2086,13 +2086,6 @@ nv50_disp_atomic_commit_tail(struct drm_atomic_state *state)
 			help->atomic_disable(encoder, state);
 			outp->disabled = true;
 			interlock[NV50_DISP_INTERLOCK_CORE] |= 1;
-			if (outp->flush_disable) {
-				nv50_disp_atomic_commit_wndw(state, interlock);
-				nv50_disp_atomic_commit_core(state, interlock);
-				memset(interlock, 0x00, sizeof(interlock));
-
-				flushed = true;
-			}
 		}
 	}
 
@@ -2378,10 +2371,8 @@ nv50_disp_outp_atomic_check_clr(struct nv50_atom *atom,
 			return PTR_ERR(outp);
 
 		if (outp->encoder->encoder_type == DRM_MODE_ENCODER_DPMST ||
-		    nouveau_encoder(outp->encoder)->dcb->type == DCB_OUTPUT_DP) {
-			outp->flush_disable = true;
+		    nouveau_encoder(outp->encoder)->dcb->type == DCB_OUTPUT_DP)
 			atom->flush_disable = true;
-		}
 		outp->clr.ctrl = true;
 		atom->lock_core = true;
 	}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 42209f5b06f9..1e5601223c75 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -83,7 +83,6 @@ struct nv50_outp_atom {
 	struct list_head head;
 
 	struct drm_encoder *encoder;
-	bool flush_disable;
 
 	bool disabled;
 	bool enabled;
-- 
2.41.0

