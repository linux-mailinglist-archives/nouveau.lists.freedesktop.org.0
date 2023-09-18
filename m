Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E0577A538A
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A13C910E2F4;
	Mon, 18 Sep 2023 20:14:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25F010E309
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:28 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c43166b7e5so32102725ad.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068068; x=1695672868; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=iABsq5MfWx1Q1BNLn4w/AsCnOkW8RoZWxF8snRYa7Y4=;
 b=XvBwehtnIs60dYNzmHox0D67H+IAtRB5YPknuHwL4NodAzYHnJS836bMNFDVAY6+7w
 MbXqjLJx10iCr1xOxqawDA746MwHfoQErSVV/EgHs5whhbvX7QNxwzko2PAK73dilZ82
 ooALAPtMsL18k52EFf1wJ49nhY9jEtOf+3epWJJBWNbEClFij5mXu7QclzS9ilW7kj6v
 hK41XYgStkahlmEFKBpQZ67tzf1/i3kiyl3f4nuJuSWZY+viHe12a6CngmvVfHCTRhMt
 Nvx+XcS6JoJ+T4+0GQEg55GitYuEaC56oAqR+dXXvmTVrbKOs6uKJDfOIGn0be0bUj4/
 /7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068068; x=1695672868;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=iABsq5MfWx1Q1BNLn4w/AsCnOkW8RoZWxF8snRYa7Y4=;
 b=U1JpRUqTblIYXb2iUNSMs3xWBFcJpvmxzMFLg22Gkixr94dtHZ1z0laGmcXo1ZkbbI
 rzpPSA99umDwzYR56iyg8ibtHKRS1g+sFzix84IzlopNoifMKfqQrghtygCWTnTSaS8O
 0F5x3ZAw4shHAwBw19XaLg4Y+mWWzQRomfzkG8U6agxW42EEe8bOQl6q+Wl/wSGYuwOi
 Iib96oQU8ID7YcJRztRX/+KoQk24OlzZbj3zzgN10uDEADjPnUxtLgHvwUFygPQeoAip
 65qDsxqfpXRdKgQfl7+KeTeYD5fgM/0c2W0k+mmjr9z/yW7omfUmaDyLWn0vPA/J3tso
 J0vQ==
X-Gm-Message-State: AOJu0YxYbBxN1GlWRJ5ePDOwNOGpiHk0VhIY6mCaOoT0P3D0B33G4JlG
 lj1R0XUEXY0lKbCMPC+pVi3H7dp2WxY=
X-Google-Smtp-Source: AGHT+IG7icYRUC3eTnsxOjXzy3IJhO+cU+3whhs4jFjyoWQl0oAx51uyWUWgzCGIazk9wZu8dmrrXQ==
X-Received: by 2002:a17:902:7796:b0:1bd:da96:dc70 with SMTP id
 o22-20020a170902779600b001bdda96dc70mr9860604pll.49.1695068067975; 
 Mon, 18 Sep 2023 13:14:27 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:27 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:23 +1000
Message-ID: <20230918201404.3765-4-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 03/44] drm/nouveau/gr/gf100-: lose contents of
 global ctxbufs across suspend
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

Some of these buffers are quite large, and there's no need to preserve
them across suspend.

Mark the contents as lost to speedup suspend/resume.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
index 3648868bb9fc..c494a1ff2d57 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/gf100.c
@@ -2032,18 +2032,18 @@ gf100_gr_oneinit(struct nvkm_gr *base)
 	}
 
 	/* Allocate global context buffers. */
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->pagepool_size,
-			      0x100, false, &gr->pagepool);
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST,
+			      gr->func->grctx->pagepool_size, 0x100, false, &gr->pagepool);
 	if (ret)
 		return ret;
 
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->bundle_size,
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST, gr->func->grctx->bundle_size,
 			      0x100, false, &gr->bundle_cb);
 	if (ret)
 		return ret;
 
-	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST, gr->func->grctx->attrib_cb_size(gr),
-			      0x1000, false, &gr->attrib_cb);
+	ret = nvkm_memory_new(device, NVKM_MEM_TARGET_INST_SR_LOST,
+			      gr->func->grctx->attrib_cb_size(gr), 0x1000, false, &gr->attrib_cb);
 	if (ret)
 		return ret;
 
-- 
2.41.0

