Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 775D47A53EE
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F138A10E31D;
	Mon, 18 Sep 2023 20:22:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 227A910E31C
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:42 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-68fb85afef4so4543612b3a.1
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068561; x=1695673361; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=B/8yCjQj1UcFnUzqT+l4uZKfvizMjFZv2mvs827hfDM=;
 b=Vnz9bwRYRyf5faKJ3LeVMMyAl7I9gRPcCveVkaAI7DeKtIn89bWBlRS4WIfC+yYZKG
 SYQaDAoMFq4P9mBDGS0Cwb/5SEmmdyVB+hfvNp3KcLlPw2GfsjujeIgQLCb/G7lrrk7W
 RuUbNwTZLXfPI/BBJtN1pe+Z8AKGVqPwEkVkKIbXgT5H7X1Yq3JaXleNWU/RoJo10IEM
 hn3TjptPZaP35h6Y1TBCO4TN2V1SUX577K/6rBEJJB0FtiZwgWCj9yAt5DbuMNbODLxG
 SARwAy1zERXAG8PamBwfCq6slu3Z1nQJ/xDEh6FyIjBH673rYrvmQp3ujqQP6CNyWhfh
 yeOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068561; x=1695673361;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=B/8yCjQj1UcFnUzqT+l4uZKfvizMjFZv2mvs827hfDM=;
 b=ZGgZo7Igu8+eZQgxE8b9Vg6G9P9CIT1OaqUDyOnihgbQysrjgE3JJfpD9DK6Q5Lxni
 pN7qFHttx1vZ6vZ4YElDaVdYwIMz+GIWkGuWoTzEg2T0VDSI73/Bocl9z+t61d3hirtQ
 aifRFK5gRxjJXctbeb2m47L4kIV4QDbhiVH4cT+V4A+ZrW2tMl1i5/HkhsiZuGQ5yPeH
 0ow7qAhImoIr1hj5+HeI5pLwMOlXBEx+X8s6FdPvsMZu0I8wjmnBcIhtZpvdTVPjnouy
 eGUUxW7Lj4XDqVjPtUtnVT7OwOQ2Dtgp1uzJHeyV/wDrmZfKnzoies7mzWUTUe6Zxk4v
 ZrIQ==
X-Gm-Message-State: AOJu0YwOJtGkg8BzpiNKS/qL741C+zLXHvvpG7vMSmYniBm09r6Nkm0v
 oG5DG1AQSTQCnDIQ7Hw8qTJcD3qf7xE=
X-Google-Smtp-Source: AGHT+IGQ3QU3mAQId0dzhSRM7Hy+pXpRtxjCCZ0DS7S6n2RGQLHQtqDU7PsuKRJNCkXRm6SMPjMO1w==
X-Received: by 2002:a05:6a21:6d88:b0:125:517c:4f18 with SMTP id
 wl8-20020a056a216d8800b00125517c4f18mr10429710pzb.8.1695068561139; 
 Mon, 18 Sep 2023 13:22:41 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:40 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:22 +1000
Message-ID: <20230918202149.4343-18-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 17/44] drm/nouveau/mmu/tu102-: prepare for GSP-RM
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

- (temporarily) disable if GSP-RM detected, will be added later

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
index 8d060ce47f86..87979952df4b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/tu102.c
@@ -24,6 +24,7 @@
 #include "vmm.h"
 
 #include <core/option.h>
+#include <subdev/gsp.h>
 
 #include <nvif/class.h>
 
@@ -54,5 +55,8 @@ int
 tu102_mmu_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_mmu **pmmu)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_mmu_new_(&tu102_mmu, device, type, inst, pmmu);
 }
-- 
2.41.0

