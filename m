Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBF087A53EF
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43B4410E31C;
	Mon, 18 Sep 2023 20:22:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x431.google.com (mail-pf1-x431.google.com
 [IPv6:2607:f8b0:4864:20::431])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30B1810E320
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:44 +0000 (UTC)
Received: by mail-pf1-x431.google.com with SMTP id
 d2e1a72fcca58-690b8859c46so598615b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068563; x=1695673363; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ln4xW3pQdOx4r1voRljrm2TZDPeHJklEt15Eni+65Sg=;
 b=NK1df0iJPf7XCazJNGVK/H7U3cxFfFf4tc0wxkP08cOzu+uBj8APVRqw/KIrvDgjZb
 tz991oZQWCk4J2MiLknyVmXWLWgMQWkUt1wX1NdVu6UDrCICpHDdVDQHuTuRncG/PLrx
 vvzMih5foOjR+kirdq2GR+PsKEnwNIMe3FQK6BIOc9JJWOU+8cL71EaznFwlij2ryS+e
 qYnr8OHGIDDPK70V39viztX529bAkTC4kc2VSSPJhMlZ6LB2OCFGISqGVku9Ktiv9/pZ
 jp/gVMANb19RgjRdQwP1ZFvoMNsfP8GZnL4tk5V9mQ7bDAZy1IXXH5iTMfydZ6R+OZqF
 MT8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068563; x=1695673363;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ln4xW3pQdOx4r1voRljrm2TZDPeHJklEt15Eni+65Sg=;
 b=S36Nx7IQUDctTsKi+xysWrV9RKuuWP7v+sI5qBw8XQxaZ4vaEavS2zqhr4cJkqwCyo
 oy3ueytBEbCSM9WA3ShiSdoBF19z+oSElDVTBEVA/PaXtBSEeJ7dnf+KmHSTH6ro5aWG
 FYHgur/75qgBBwGdh8/1edo+cF4oae4o4iwITdzGLiqS6328+qgijEGHSiAFd/tq+xPi
 VZvQzks+v+BP98qJmHu5lTw4sJ6r+X6g994V1R8E+6QWQ3mMjNCiSeWFZMibbjSrApNK
 gekPEL33oDw/v3Hwr06epq5H4a4FCJJpeU8vovGn2iO5/tJ/Ex79iQOIW7qDG0uVYcmZ
 iELg==
X-Gm-Message-State: AOJu0YxUmTa7qKWsd2SJYdWUi7VGaVhpSEyH83Lgf8yc3Vu8zRs/4FiF
 +00crHLMUCpNWYgn/pP7BfANBvVQlmE=
X-Google-Smtp-Source: AGHT+IHBnlf0fLEytsYdyFZCs/Yvm4/AY0kfsYrMZTty2bmWpr2rVgUKH/wYyq+S7FSsfpUkQzS4mA==
X-Received: by 2002:a05:6a00:1805:b0:690:3956:6ec6 with SMTP id
 y5-20020a056a00180500b0069039566ec6mr9563780pfa.9.1695068563335; 
 Mon, 18 Sep 2023 13:22:43 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:42 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:23 +1000
Message-ID: <20230918202149.4343-19-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 18/44] drm/nouveau/pmu/tu102-: prepare for GSP-RM
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

- disable PMU completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
index cd3148360996..da5b2b2190d3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/pmu/gp102.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static const struct nvkm_falcon_func
 gp102_pmu_flcn = {
 	.disable = gm200_flcn_disable,
@@ -54,5 +56,8 @@ int
 gp102_pmu_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_pmu **ppmu)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_pmu_new_(gp102_pmu_fwif, device, type, inst, ppmu);
 }
-- 
2.41.0

