Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F26257A5388
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:14:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4E54910E2EB;
	Mon, 18 Sep 2023 20:14:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com
 [IPv6:2607:f8b0:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1928D10E0F4
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:14:24 +0000 (UTC)
Received: by mail-pl1-x630.google.com with SMTP id
 d9443c01a7336-1c0ecb9a075so38471035ad.2
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:14:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068063; x=1695672863; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=S0nD7acLzowdMYYNUZiwmiFF5m3uR8sg82d4o3lnQPs=;
 b=WfHgVeAtAgC694giGGA1k7X+XrSLx97y3YGmEZvAJ7fQzs6+ifML8+Mn2jLJaSvh+a
 DojuraU+AsSjQm16B9zDZwO1PFdRB3UqZR2CQpD2kA2AaN0xRiCpmmQ5n3w7vQnF7jox
 jSivit0U/tB8n3FRDlLFo95dPWY1EF/kySH6DBC5c5ghSmLKC6MOdeSRProyOnTfrz9G
 tRORMjjuz5dAmS+be4hvx+QCv69NoZkFJ/cq3dpjwzthgLktGFvt/dGLWaWnxtvYyA0h
 GlVQ3WfrXjDifkST0SLwtZ15r8UJU+z3sLKr6ft0dBGz4Mg6co6MXRsi9PPh63MHoqTJ
 dX4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068063; x=1695672863;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=S0nD7acLzowdMYYNUZiwmiFF5m3uR8sg82d4o3lnQPs=;
 b=ozxiJxgmPb5ARCjbr8SgVzorD4DmW4AOkreKx5JJ1MChthDKupzZxW3V2IQZjHGwiw
 uyM9ciX0/y3zbJ7lSrpHyW7Eb+uFT9L3LspEAZ2HEwQBTIFUhIaMwtDvgTQjVRYZ3HKK
 rIrdUP9oxZaqZ1wXpScNdPt8v/ItZV9nr6mSnGFufWNAJwGpBOprQSUvV94YMuiH78rY
 QIbhFnm4b+OiDPjTEOCaIS01zROmPEhQ95vyy4H3TBtFy1aG4YBM8PhiIxmrYHLFcfoH
 t+yG5RTCrW78NcaRB3mKX3d997lQVHqVv6vmN2P+Nr5DHBPvcVpu8PdfwdhiZa5tTz2s
 P5pw==
X-Gm-Message-State: AOJu0YwoGuPTz/HdiXgr76Zb+C8tTEAKR/0ha1Wov8hU2MAwq9hmC9T4
 8wUmYjKrzd3u1SXbEzSiPQ9f1KNEsTE=
X-Google-Smtp-Source: AGHT+IHX8lFX07QV4/t1Qw45JF8CYqx+DpK44ZMVTyqbKRr6/eHpozJqAcOEgkitoQA/NkiU10tkiQ==
X-Received: by 2002:a17:902:ce8b:b0:1bf:3378:6808 with SMTP id
 f11-20020a170902ce8b00b001bf33786808mr10306580plg.56.1695068063142; 
 Mon, 18 Sep 2023 13:14:23 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020a170902ead500b001b8c6890623sm8706858pld.7.2023.09.18.13.14.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:14:22 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:13:21 +1000
Message-ID: <20230918201404.3765-2-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918201404.3765-1-skeggsb@gmail.com>
References: <20230918201404.3765-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH v2 01/44] drm/nouveau/devinit/tu102-: remove
 attempt at loading PreOS
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

From Turing, HW will already have handled this and locked-down the
falcon before we get control.  So this *should* be a no-op.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
Reviewed-by: Lyude Paul <lyude@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c | 12 ++----------
 1 file changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
index 81a1ad2c88a7..40997ad1d101 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/devinit/tu102.c
@@ -83,17 +83,9 @@ tu102_devinit_wait(struct nvkm_device *device)
 }
 
 int
-tu102_devinit_post(struct nvkm_devinit *base, bool post)
+tu102_devinit_post(struct nvkm_devinit *init, bool post)
 {
-	struct nv50_devinit *init = nv50_devinit(base);
-	int ret;
-
-	ret = tu102_devinit_wait(init->base.subdev.device);
-	if (ret)
-		return ret;
-
-	gm200_devinit_preos(init, post);
-	return 0;
+	return tu102_devinit_wait(init->subdev.device);
 }
 
 static const struct nvkm_devinit_func
-- 
2.41.0

