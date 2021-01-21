Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 16F862FE95A
	for <lists+nouveau@lfdr.de>; Thu, 21 Jan 2021 12:54:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C9846E550;
	Thu, 21 Jan 2021 11:54:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com
 [209.85.218.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED366E52D
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 11:11:45 +0000 (UTC)
Received: by mail-ej1-f47.google.com with SMTP id l9so2050585ejx.3
 for <nouveau@lists.freedesktop.org>; Thu, 21 Jan 2021 03:11:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=t7gb+m8uVHwrR390jKq7A8qTS7ZtAGZbqCp+EnpDXLw=;
 b=glrKWuui8cV02CrvYfE9UiWAtOCL8cU+JfQXO00DI5wH8V2+g9XkGboXqwuT2tXQzU
 eknyLVN03mBruuHhleJtc0u37ztdWZxxjgp5isIz6LPMFPQop0gLsi1yUHBkqnSypB9S
 i+XXTthcoJO/RmeEB+nYs3LPb3rjKjSmp0+kMpjyfqZBYjXJM0QiTUyX7GC7DnbpGvIF
 l06f9OE0GECkApV0kuf8vegdlARKI0EZKQkN30A4SIlzBxtatRiVMRmw+s03M3jMDwBR
 YS4fspfNjn1VlnUwLALhCRL9pS+f5yVWzKFd6fpeLHa2YfMX+Q32dOWllJpdVsaj2eJI
 TUTQ==
X-Gm-Message-State: AOAM531F3ankCI7N6/FMOh/yPbdxETyt91gfJ9pfscLiWckgZ7loOQ5c
 fbn43E/gjHE1FNvB/6mEKqdfH1GFWBQ=
X-Google-Smtp-Source: ABdhPJxs86j3BZWR8wqxb4JAIMi6V/Kl90c7MrTc3zfjk1/BKNI6qLkTyEq/O65BTvFCqa21JxJExg==
X-Received: by 2002:a17:906:40d2:: with SMTP id
 a18mr8938526ejk.315.1611227504051; 
 Thu, 21 Jan 2021 03:11:44 -0800 (PST)
Received: from bastian-desktop.fritz.box (b2b-130-180-23-226.unitymedia.biz.
 [130.180.23.226])
 by smtp.gmail.com with ESMTPSA id lv13sm2082363ejb.55.2021.01.21.03.11.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 21 Jan 2021 03:11:43 -0800 (PST)
From: Bastian Beranek <bastian.beischer@rwth-aachen.de>
To: nouveau@lists.freedesktop.org
Date: Thu, 21 Jan 2021 12:11:18 +0100
Message-Id: <20210121111118.34587-1-bastian.beischer@rwth-aachen.de>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20210118124048.8772-1-bastian.beischer@rwth-aachen.de>
References: <20210118124048.8772-1-bastian.beischer@rwth-aachen.de>
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 21 Jan 2021 11:54:02 +0000
Subject: [Nouveau] [PATCH v2] drm/gpu/nouveau/dispnv50: Restore pushing of
 all data.
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
Cc: Bastian Beranek <bastian.beischer@rwth-aachen.de>, bskeggs@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Commit f844eb485eb056ad3b67e49f95cbc6c685a73db4 introduced a regression for
NV50, which lead to visual artifacts, tearing and eventual crashes.

In the changes of f844eb485eb056ad3b67e49f95cbc6c685a73db4 only the first line
was correctly translated to the new NVIDIA header macros:

-		PUSH_NVSQ(push, NV827C, 0x0110, 0,
-					0x0114, 0);
+		PUSH_MTHD(push, NV827C, SET_PROCESSING,
+			  NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));

The lower part ("0x0114, 0") was probably omitted by accident.

This patch restores the push of the missing data and fixes the regression.

Signed-off-by: Bastian Beranek <bastian.beischer@rwth-aachen.de>
Fixes: f844eb485eb056ad3b67e49f95cbc6c685a73db4
Link: https://gitlab.freedesktop.org/drm/nouveau/-/issues/14
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c | 6 +++++-
 drivers/gpu/drm/nouveau/dispnv50/base827c.c | 6 +++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index 302d4e6fc52f..2d1825a5d751 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -88,7 +88,11 @@ base507c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 			  NVVAL(NV507C, SET_CONVERSION, OFS, 0x64));
 	} else {
 		PUSH_MTHD(push, NV507C, SET_PROCESSING,
-			  NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
+			  NVDEF(NV507C, SET_PROCESSING, USE_GAIN_OFS, DISABLE)),
+
+					SET_CONVERSION,
+			  NVVAL(NV507C, SET_CONVERSION, GAIN, 0) |
+			  NVVAL(NV507C, SET_CONVERSION, OFS, 0));
 	}
 
 	PUSH_MTHD(push, NV507C, SURFACE_SET_OFFSET(0, 0), asyw->image.offset[0] >> 8);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base827c.c b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
index 18d34096f125..093d4ba6910e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base827c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
@@ -49,7 +49,11 @@ base827c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 			  NVVAL(NV827C, SET_CONVERSION, OFS, 0x64));
 	} else {
 		PUSH_MTHD(push, NV827C, SET_PROCESSING,
-			  NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE));
+			  NVDEF(NV827C, SET_PROCESSING, USE_GAIN_OFS, DISABLE),
+
+					SET_CONVERSION,
+			  NVVAL(NV827C, SET_CONVERSION, GAIN, 0) |
+			  NVVAL(NV827C, SET_CONVERSION, OFS, 0));
 	}
 
 	PUSH_MTHD(push, NV827C, SURFACE_SET_OFFSET(0, 0), asyw->image.offset[0] >> 8,
-- 
2.30.0

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
