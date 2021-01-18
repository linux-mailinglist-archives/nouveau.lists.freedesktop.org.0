Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 781B12FA77D
	for <lists+nouveau@lfdr.de>; Mon, 18 Jan 2021 18:28:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 436C16E497;
	Mon, 18 Jan 2021 17:28:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com
 [209.85.218.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51B4D6E200
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 12:41:13 +0000 (UTC)
Received: by mail-ej1-f43.google.com with SMTP id b5so7043044ejv.4
 for <nouveau@lists.freedesktop.org>; Mon, 18 Jan 2021 04:41:13 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=p8QxakBM3iL3jzv1XYNvHv9o/QLoUGqDsP8V7yEcCCA=;
 b=VsItc0osKhunO2SmxIOQX+jGc0uyH1DGERn0qoXLNuq0yY6rYLR4RMHCfCVgkRReUV
 wkyHi6JPZE1fPXqRMgYbX/k2Je8tOP/KcHcDGvdOmAnin5ypxC7GKTv3IioSAViZfsRH
 Z2VMd6zVrFq5wGQuTUn5Gzynh0yVbFll24vAZW0eriQft2/ocmI6GygPpBaEGEanflvO
 TT9oI6HDPEKGCGJwy2567wZwnl9/KBKFQvOP3oQgCxUAqTEgrB6KVnjLN+CyDY93FeqG
 HdV92QIJxoUjWQRlz2TPAAyjmglhzcXUS0Dp5OJrd1a+jwuBU5i/Pnip9yyaJpv3eGh6
 hp3w==
X-Gm-Message-State: AOAM531PDI7LbSLCNPIS4ZBXDk9tDXzy3SiW0UIXeJkYgdNQ5vjoJhmJ
 OijahJe9XPkEs2WaZfXH0m8PWzdoihU=
X-Google-Smtp-Source: ABdhPJzSV6rJqzyZ5XesdUdZ2rsaij9CwC1uq9FM47J8q82QNAd6Rmwjr6ywS1u5NbA1qtBR/hf13Q==
X-Received: by 2002:a17:906:ae4a:: with SMTP id
 lf10mr6424217ejb.480.1610973671676; 
 Mon, 18 Jan 2021 04:41:11 -0800 (PST)
Received: from bastian-desktop.fritz.box (b2b-130-180-23-226.unitymedia.biz.
 [130.180.23.226])
 by smtp.gmail.com with ESMTPSA id y8sm8724793edd.97.2021.01.18.04.41.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Jan 2021 04:41:11 -0800 (PST)
From: Bastian Beranek <bastian.beischer@rwth-aachen.de>
To: nouveau@lists.freedesktop.org
Date: Mon, 18 Jan 2021 13:40:48 +0100
Message-Id: <20210118124048.8772-1-bastian.beischer@rwth-aachen.de>
X-Mailer: git-send-email 2.30.0
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 18 Jan 2021 17:28:14 +0000
Subject: [Nouveau] [PATCH] drm/gpu/nouveau/dispnv50: Restore pushing of all
 data.
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
 drivers/gpu/drm/nouveau/dispnv50/base827c.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

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
