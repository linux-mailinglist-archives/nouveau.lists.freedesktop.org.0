Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8673979FEDD
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:48:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C674510E53E;
	Thu, 14 Sep 2023 08:48:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com
 [IPv6:2607:f8b0:4864:20::d2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 853CC10E53B
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:48:05 +0000 (UTC)
Received: by mail-io1-xd2b.google.com with SMTP id
 ca18e2360f4ac-79536bc669dso23366839f.3
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:48:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681284; x=1695286084; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=nSCQq2iJqWH+okaGJaQRobKHFK5fbRHT5P1Vv047Tvs=;
 b=e1wWZzFFj8/8koU6edMHZRKcZGw3lXrtwkaDA2bx4b6W8OL59UBBNZfojxvlwfe+is
 nJ4ohLgB8LtbYVLU/0m4R5ZZdhAharqw9PT92N2RtLdAjdo5BPwb3U2UW/S1vgMlwloY
 YDRbQEE5wPGRyRtILlYq9EkEMGLbMRtcq3Dvm0d3JIP24+VV8Ig1UyJBhkeTUa0MlSIT
 Me8rll2MzUbj/m1rVWRGE+efPVYcSv3qvekM0kNmd0InKareORqBEsON0O0lmZzPVQgY
 GP74l6rNnBt1RA9QiHtYmfKtg8mt/YhXcQgySLAcwwOiruUn+3d12d1/3cUE9aH/ySeE
 Uzdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681284; x=1695286084;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nSCQq2iJqWH+okaGJaQRobKHFK5fbRHT5P1Vv047Tvs=;
 b=RryOYDCIT5gqW8X3h7POjxgAGEgX5EVgSx0jLNErgV6My0EDRV5g6gekgjfuIeS9Au
 AFhjkbGzksyIT3NHwsVr5NY5/qn+7LDIddjJSNERREyjbIFAe4e3y26abhZLBcao0CKO
 CVeqdlt6/0NvmsjoldLB47YuVmxF+pYuPhbm7b5XVG5CmBjmfqAE0VY7RIRWwS3Rjn2R
 P8Taa1DJOjVOtaf8jIZPJhfIA+A414GrV5ynJi6fDNxmKBeoVxV6l/d1tJ57itcIlqC4
 Kr3AvR9E7/4N1HqqBrOy+tXVLEMflNx7WVSH+RKC+6Ls3ONnJAiSi4GyM511xiQMx+CZ
 YoOA==
X-Gm-Message-State: AOJu0Yxn+wyKQCdRGdbUVvgKig0+o2b+cPWf8FRVoHdNQ/42ojrf+BJ4
 KfMc2nQaTSZkCltfpfxjjTehQ8KeNPg=
X-Google-Smtp-Source: AGHT+IEgrOaCIh0n4Xy+2OBB5vCvNzlmvQZLUagv+Qa6+R7FHspy5t606mhXQB9VUeBqZC070ovY1w==
X-Received: by 2002:a05:6e02:12ca:b0:34f:1ee7:2ad4 with SMTP id
 i10-20020a056e0212ca00b0034f1ee72ad4mr6228220ilm.15.1694681284387; 
 Thu, 14 Sep 2023 01:48:04 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.48.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:48:03 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:46:11 +1000
Message-ID: <20230914084624.2299765-32-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 30/44] drm/nouveau/kms/nv50-: flush mst disables
 together
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

