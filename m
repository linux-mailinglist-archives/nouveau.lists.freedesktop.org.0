Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C71F17A53E2
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 45FBD10E11B;
	Mon, 18 Sep 2023 20:22:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D928B10E11B
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:15 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-68fac346f6aso4483778b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068535; x=1695673335; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=k1dKbOS9PBLlmfY9xy8iTqY0K1Woa8yTizBoK5qGR0Q=;
 b=b3Ng1RcmRWr5HxD/xl9UP9WYsrvNKn+oWwTdOSmqN9HhygddKTHn00zw+yokY033ZR
 yqaNUOegOeKrFNJ2sOHYvsilNCziz/zBWRETYXCURtqfGC8zECDx2vo1bATDusvpQvUP
 Zw1mshF6mt9L7x7AQLnNUseQZTlQlGEIEmIy/n/HyTT+wsYOBvi1Mwh8qliWtVtaZAhm
 TfnZHd6c4YjARSkPtMqX+3jKeWVKwWk5G8yasWt7PnByHA5qtR+vGNufD685SN/1t/33
 8jCy8txNoXreBvmdJiz6/GhrdbOsual9A0k6kJpO/b0uk/ENTUE2Aabf3OqVilwgbcvY
 pNgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068535; x=1695673335;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k1dKbOS9PBLlmfY9xy8iTqY0K1Woa8yTizBoK5qGR0Q=;
 b=RNShjnPD45SP/nlG5GmURhz1P3Na3RidaVVULtS48pYDI93JzhD/lAp/Wfd6n78MgA
 BrAZk5Oe5dH4StixAJC4vM12Rs9bS6Ad+M70amn5Bkk7vZBkDxAWbzxbez2O8IiL/Ase
 6L66yyh0aEGoUjUI1Tt78FRyq33varSt7XTqYuoSizPQq0SCMckTyJTqBAiTYhsXd/oR
 c4gcqRsfENGL6TJ6Vy8c01sE+NtkwFqxctJW5GR5oKqVshOmioSzfH4rkJEffqpJN5aO
 rHSZtP3Y1j8xzxK96Xa5LPSSvVKBUTnu2kBUr+TwtiWX5UleD4+qU8czUJw3gX0x4SRs
 2qPg==
X-Gm-Message-State: AOJu0YyA3Aps21wniVpj/Lc/EJFtnt6x0gQkw40gGP6DjJUtIk172zie
 URs/Qv1PFrtudqBLHadGHT67MdcJhGU=
X-Google-Smtp-Source: AGHT+IGd6w8vLf4nUDkrxTihWeIAuayvG+/JVHHv6itb86cFLz1ORWdftn702JAg3S2HroBmKHQakA==
X-Received: by 2002:a05:6a00:1914:b0:68a:59c6:c0a6 with SMTP id
 y20-20020a056a00191400b0068a59c6c0a6mr11695611pfi.24.1695068534913; 
 Mon, 18 Sep 2023 13:22:14 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:14 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:10 +1000
Message-ID: <20230918202149.4343-6-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 05/44] drm/nouveau/acr/tu102-: prepare for GSP-RM
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

- disable ACR completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c | 4 ++++
 drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c | 3 +++
 2 files changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
index 45dcf493e972..c7d38609bb7e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/ga102.c
@@ -20,6 +20,7 @@
  * OTHER DEALINGS IN THE SOFTWARE.
  */
 #include "priv.h"
+#include <subdev/gsp.h>
 
 #include <nvfw/acr.h>
 
@@ -322,5 +323,8 @@ int
 ga102_acr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_acr **pacr)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_acr_new_(ga102_acr_fwif, device, type, inst, pacr);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c
index c22d551c0078..565e9a070b23 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/acr/tu102.c
@@ -201,5 +201,8 @@ int
 tu102_acr_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_acr **pacr)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_acr_new_(tu102_acr_fwif, device, type, inst, pacr);
 }
-- 
2.41.0

