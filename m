Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2420F7A53EA
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 757F310E319;
	Mon, 18 Sep 2023 20:22:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com
 [IPv6:2607:f8b0:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7751510E319
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:33 +0000 (UTC)
Received: by mail-pf1-x433.google.com with SMTP id
 d2e1a72fcca58-690bccb0d8aso342009b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068552; x=1695673352; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qAfMAvellRYmKz7csFaoVLaXUAI1jYfkepHgABQFfFw=;
 b=DyvqmcNuAuCtJthBLipTF93rQKPTY+OmiSGE/nn/NSDED8aw5gDDGzrN5YIMx43ujU
 FDyucXnuE1z8KaC8WjCQVlg/X1xfjVhJgYjhg9HIwESEoEY/LbZpDz9xKIhB3OykH34E
 C9r5LHzeoqrGGO9vvLyMtSxm7TFwPY951BRp5JuLTlN7k3SYdMsgM9MmoONC6+kbWZM5
 hcfuOoWhi92BUSv0Eaa3jvbfFkEteDBwfl6TSADcCH926yey6iD1+3AU1X7doEqHi83e
 jZXsuYFfFk9NQ5gRQVEDUjNdQoGxf15JJoKw7RL4TIIwdmaTnZXNQ0+Vjeh06E5c1vrN
 kH/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068552; x=1695673352;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qAfMAvellRYmKz7csFaoVLaXUAI1jYfkepHgABQFfFw=;
 b=lQS2MZKOJQljt945E3RB67MMKeN/qBrKsBAlhB2KnDuAZeTnXN7cHpRhytSn/dPYux
 xR7zI+P//xwojh8w+cXkl8BYifrdQpjesH/7Vx7yOCsWbvVKpcaHl5BQ64XWgqdbn/US
 amh7im0Xudv8TCXSBxFs4G8RP+uxC8fbUW2ITuftIFAW6vnP1kvUdoQ2ggcljL5o/Unz
 YG6icZ1yDLqG65hCHO4g3AvSRab+Z9FRgKhBj6R3blW26OKUwizb+NOROFqAAw5XvGyu
 D5d+y878mqVn0tkDrr5UMw0X53P2rk/+2P9C3PQElZh7f9IhveUmHLp/ozqhjImUhEYV
 DdIQ==
X-Gm-Message-State: AOJu0Yz1whNv+CrOwshZ8SuUtbd3asj03spmeFWCjuaTbgUf0cJhNVHS
 jxYJDg2OLRV4WDPYgSK9tbsRzaXTmm0=
X-Google-Smtp-Source: AGHT+IH1lIkENbJAm11yBX5HBJIlU52Wt5a3FBZ+/71FaLIMX85EqU8fT97dgyKFEyS8eutONmnRWg==
X-Received: by 2002:a05:6a20:1007:b0:154:9196:16c0 with SMTP id
 gs7-20020a056a20100700b00154919616c0mr8143408pzc.61.1695068552557; 
 Mon, 18 Sep 2023 13:22:32 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:32 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:18 +1000
Message-ID: <20230918202149.4343-14-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 13/44] drm/nouveau/i2c/tu102-: prepare for GSP-RM
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

- disable I2C completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
index 46917eb600f9..049477511312 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/gm200.c
@@ -24,6 +24,8 @@
 #include "priv.h"
 #include "pad.h"
 
+#include <subdev/gsp.h>
+
 static void
 gm200_aux_autodpcd(struct nvkm_i2c *i2c, int aux, bool enable)
 {
@@ -44,5 +46,8 @@ int
 gm200_i2c_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 	      struct nvkm_i2c **pi2c)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_i2c_new_(&gm200_i2c, device, type, inst, pi2c);
 }
-- 
2.41.0

