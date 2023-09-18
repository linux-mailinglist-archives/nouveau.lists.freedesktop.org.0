Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 812B87A53F1
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9853410E320;
	Mon, 18 Sep 2023 20:22:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com
 [IPv6:2607:f8b0:4864:20::432])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 872EF10E322
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:48 +0000 (UTC)
Received: by mail-pf1-x432.google.com with SMTP id
 d2e1a72fcca58-690bfd4f3ebso202705b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068567; x=1695673367; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8dfi9jtzOVaCKhv7/zz+odoKSb40yDaEhwxLy9M41g=;
 b=Ufzg/+KiUjTV6s+HKp/zVEaZgAA7lXlKtkhzFmzzOAkvUzfKBo271Wt9UpOf+Z63V3
 Iz6MnnY+ck2PPLfFsttTznL3MEVwfAo4D4ipeluC44lEXRL+QWwN7yZEgoIp1WJDDy18
 kBClHiIj8oxwVUe8CH6BVg2YZQKBvAkGJgaQoyuz1OpvBdui+0oAjXDlhUeiKDINos9x
 zGspUFOabON0NYZ5UmDG2b5ycGyp5whvak21mj8uusFGKtd3HJlpx35rKBU5aYlWpqK5
 Cc1DJfK+pt/Lj4N8HsMcPHeAb5Ud5S4hZqzjC3iqWJnOYh3wsIjo6wVgP21Y+zaVMahd
 3DFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068567; x=1695673367;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c8dfi9jtzOVaCKhv7/zz+odoKSb40yDaEhwxLy9M41g=;
 b=DbcxlKSQUUwbPaOodfty5EwBbGXDDxPGGgNzJ3U+G/nX8KoS1hYKivYbPaUxkeLgmm
 M0dF63HHJeMDti/3FmzAEoqh267SzzlF5N8hRNnh7keZtfm6g3Zgv2wb02eiHwmqYPiF
 S+VgnUzL06vu2rEq8eB+m4piPCcB6zUbb3tfN/26+VuBvpWDxHAdymCDy2p4G805k0qV
 nJmyGJ8j5k2G3UdJ2mLvRIUanzKj39PpKEbAKpO16UxzuLj1YZDO49Z8lryHIQhkMbVP
 D+/utgDUV359Q8qAvAWedIMZW81SGyskrFWbSYTJnXpgX7YQksGbkRBS397bp2l+NUVa
 4Eow==
X-Gm-Message-State: AOJu0YwBqYGscuekqqk+ea9QF5zGBylxZ5KGLk7LvSr/YhYfglf8gQyF
 oVVgOzSSkAYNpGNIKpbGqORGY/7fkRM=
X-Google-Smtp-Source: AGHT+IEPmjQEc9r3LfzqP8kg+mEYO4uIseWLDDZDQNkI62ZoMSR9PjnEFgosr2wvrxbg8L2xWecniQ==
X-Received: by 2002:a05:6a21:18e:b0:13a:12c2:359e with SMTP id
 le14-20020a056a21018e00b0013a12c2359emr11624655pzb.2.1695068567640; 
 Mon, 18 Sep 2023 13:22:47 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:47 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:25 +1000
Message-ID: <20230918202149.4343-21-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 20/44] drm/nouveau/therm/tu102-: prepare for GSP-RM
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

- disable THERM completely when GSP-RM detected

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
index 44f021392b95..5392833d3614 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/therm/gp100.c
@@ -23,6 +23,8 @@
  */
 #include "priv.h"
 
+#include <subdev/gsp.h>
+
 static int
 gp100_temp_get(struct nvkm_therm *therm)
 {
@@ -52,5 +54,8 @@ int
 gp100_therm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
 		struct nvkm_therm **ptherm)
 {
+	if (nvkm_gsp_rm(device->gsp))
+		return -ENODEV;
+
 	return nvkm_therm_new_(&gp100_therm, device, type, inst, ptherm);
 }
-- 
2.41.0

