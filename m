Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 261FD79FECB
	for <lists+nouveau@lfdr.de>; Thu, 14 Sep 2023 10:47:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 659FE10E534;
	Thu, 14 Sep 2023 08:47:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07C5110E530
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 08:47:30 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fc292de9dso560325b3a.0
 for <nouveau@lists.freedesktop.org>; Thu, 14 Sep 2023 01:47:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1694681249; x=1695286049; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=9Rs2NEXlOFq5TpL9pIPbBxKfalI+woQEKANdj+A+FJA=;
 b=d7mI901W0RXyj9Eh9LweJWQMqVbgtSg4jzUEld6tisMpupdlb/eztztikgL0hP3Z1A
 d2+7UCQ02DUi0VGPXhtF97Cd/SRORJw0bR/AOsFqLgAIP8JLEj6zovdlQF8w8JsZhPeE
 5RkYJDScKt9AzZfe7byGHkQuSc4yIxWow0gT8y3XwXkLU2/MXIFnnqmCSUqVr7/Z+1O1
 4vX56yzKjdrtxPCA3N6Ogrk3HXDNlQXdGpbtfuzzsD1P8HXTAaGRx2U8Zs1QYGqLn4Yc
 ZLNzzuPmeZOlxI+Mq/GRJ7T2SMgdb3Ucsy1mmJYwVvtB362C9/sCKgld50+CrYLPJ9DM
 Di4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694681249; x=1695286049;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9Rs2NEXlOFq5TpL9pIPbBxKfalI+woQEKANdj+A+FJA=;
 b=Ifzu9/mdSfkhkM9Ke1mUczGgMwZAlvqe6YKoeSzFudXOLomaGRwhTZd/Zo26++Otxk
 hM4U+BIJ4s/5UZQwUjGe7b5VCCCVn4q3hIftBaB4BMFlf4Qy1XVrQaU2uH1jGdoNHELd
 ItBrddytKLngW1zJwwr5PgmV+PpfGBoaOwUsNSWyLg/NEbCvv8LohUmmSSsyVuYbcUtv
 Y5sZkERJ7lzOqDu26pjBF6O/GHmtFg7m/JTcamvOdUluAsegV+dP6hAnl/YDyD4PdAKy
 kA1vgUln/0OlEg8Au8BuDzD/z/tAtZyTl6aPi3MGXBKTEtkjhkkOcksNyRj07aUoFY2d
 pBGw==
X-Gm-Message-State: AOJu0Ywgmb9+WXc9la+zTd/1QoXLyuGJKN9zxeDYqReQxoUsA8COkkyk
 33H2Gw8AiJ7xTvDjmXkm5NTvIYQldlI=
X-Google-Smtp-Source: AGHT+IHKM6eGqXk2t3JnvsH+cs3k8j+oOw9uFvRJuF4E+4x8rG6nLHoO7w59+dcHwxN7UDgcgK6SJQ==
X-Received: by 2002:a05:6a00:c96:b0:68f:ce6a:8685 with SMTP id
 a22-20020a056a000c9600b0068fce6a8685mr1932432pfv.14.1694681249127; 
 Thu, 14 Sep 2023 01:47:29 -0700 (PDT)
Received: from localhost.localdomain ([87.121.74.45])
 by smtp.gmail.com with ESMTPSA id
 e23-20020a62ee17000000b006889081281bsm839205pfi.138.2023.09.14.01.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Sep 2023 01:47:28 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Thu, 14 Sep 2023 18:45:55 +1000
Message-ID: <20230914084624.2299765-16-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230914084624.2299765-2-skeggsb@gmail.com>
References: <20230914084624.2299765-2-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 14/44] drm/nouveau/disp: update SOR routing
 immediately on acquire()
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

- was previously delayed until second supervisor interrupt

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c  | 2 +-
 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c | 2 ++
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 5b55598e09c8..b288ea6658da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -48,8 +48,8 @@ nvkm_outp_route(struct nvkm_disp *disp)
 
 	list_for_each_entry(ior, &disp->iors, head) {
 		if ((outp = ior->asy.outp)) {
-			OUTP_DBG(outp, "acquire %s", ior->name);
 			if (ior->asy.outp != ior->arm.outp) {
+				OUTP_DBG(outp, "acquire %s", ior->name);
 				if (ior->func->route.set)
 					ior->func->route.set(outp, ior);
 				ior->arm.outp = ior->asy.outp;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index d71bc188047e..042a43c22061 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -235,6 +235,8 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 	if (ret)
 		return ret;
 
+	nvkm_outp_route(outp->disp);
+
 	args->v0.or = outp->ior->id;
 	args->v0.link = outp->ior->asy.link;
 	return 0;
-- 
2.41.0

