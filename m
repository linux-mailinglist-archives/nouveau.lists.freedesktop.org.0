Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2C847A53E6
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C82C10E316;
	Mon, 18 Sep 2023 20:22:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC21110E314
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:24 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-68fac16ee5fso4202377b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068544; x=1695673344; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=41p7AiY8sDAYMdhbk+Q7F+AmWUb2gaCvDR0Yp/Z+RhA=;
 b=QQlZEFV4Ij43IP1R0heHrQvyZQHvDyeko8xU6tP8Rx9EJGudE9xgYD8nxg4iQgr8iQ
 G8snVHTYPG/FA6lHaL8K1AHGuM9KCQI1DVGtgykQ+GXUQ0V6pUwJhG5RqYOE26ECu6ss
 bjl+AMbJeUqvRrNdP724ix/k0jHHy7Wjy4T694j9/s5D1+iFz7iWCtb/sFIwlW/v4IpZ
 WFvYp+jvJ02LoZ/ZzKN8uPTWN/eHDIxoywJJ50O2IUV6IYqFcOQrsHH1vewM7mUsvZAr
 O3GedobpKMxTQ4kj67ts8FIymxxOinuk+tdqcPTYfMmIDFCAuq1lwQ+PEN4P9r9vBGuV
 irxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068544; x=1695673344;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=41p7AiY8sDAYMdhbk+Q7F+AmWUb2gaCvDR0Yp/Z+RhA=;
 b=q4aP3/bvq50Bq2SUtB7snTpb3s9W1jswoumIp+lFmyL0EuuzWiTMLBUskLHZolFrKe
 INNunGS+pETZfwNt3wA1KN5FUuYuA6Qx5uIJ3gQBoqkSiDCNxQiRm1Pyaq2lXfDMopgJ
 O+raFdUAr5W2y4HkugiGUvvL56mi4Ak7NHwyM6zujXI/45KvdY3yY/HHlN8XtbrzhMbQ
 3sKHfJxrRTnZg3XpQ5f1MFxljOLmGKSbWgclDaMGVrZBMx04HatdOwC2JuUCV146aRPt
 h5vNXeF9iHdNAAv8SYMm+OSnbcktekX4p284uORb8tONlK+romBYLZhmQK8ONEjpZIvb
 BVXg==
X-Gm-Message-State: AOJu0Yz9NLC6P91/vIQaXERolsLYgXpCd3VnIRbUybmpZSkIyJwvKStk
 FPP8/8gVHfdZzqKGUbGKcixkT37Uo/I=
X-Google-Smtp-Source: AGHT+IF0+Gzhy2K8M+JDa6kgpXXBYRFy+BtutZfFGXRlgCwlwCETeH0mv20YKVcD0g7L/VB4TE8Leg==
X-Received: by 2002:a05:6a00:80d:b0:68e:2478:d6c7 with SMTP id
 m13-20020a056a00080d00b0068e2478d6c7mr8736309pfk.32.1695068543735; 
 Mon, 18 Sep 2023 13:22:23 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:23 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:14 +1000
Message-ID: <20230918202149.4343-10-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 09/44] drm/nouveau/fault/tu102-: prepare for GSP-RM
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

- disable FAULT completely when GSP-RM detected
- SVM support will be disabled when running on RM because of this

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c
index 967efaddae28..5390417a58b5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/fault/tu102.c
@@ -22,6 +22,7 @@
 #include "priv.h"
 
 #include <core/memory.h>
+#include <subdev/gsp.h>
 #include <subdev/mc.h>
 #include <subdev/mmu.h>
 #include <subdev/vfn.h>
@@ -175,7 +176,12 @@ int
 tu102_fault_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_fault **pfault)
 {
-	int ret = nvkm_fault_new_(&tu102_fault, device, type, inst, pfault);
+	int ret;
+
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
+	ret = nvkm_fault_new_(&tu102_fault, device, type, inst, pfault);
 	if (ret)
 		return ret;
 
-- 
2.41.0

