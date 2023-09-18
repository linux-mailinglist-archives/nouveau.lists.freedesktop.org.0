Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DF617A53FB
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:23:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9AA6C10E32A;
	Mon, 18 Sep 2023 20:23:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com
 [IPv6:2607:f8b0:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA3E10E329
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:23:10 +0000 (UTC)
Received: by mail-pf1-x435.google.com with SMTP id
 d2e1a72fcca58-690bc3f8326so459683b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:23:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068589; x=1695673389; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jir6dLzCt+24mWC0TQKPcfjipIWQ9QkjgkfAFfzkuBI=;
 b=UQHDteodEeSb8VVQ4Ikk5lnJHUABOnUCAlJZ8pR0CJUPwpD+1I+oxhAI9LDw/Vby77
 iKkb+0DHqUvhS1cp1wfCd7nb99MC+ofoYXhFUHfPz19yD11qGsb9iJ6vzZTLT49LCNpp
 xcMYrQnmr70mUMvucZ8Hs7m783fPUr70Rf/be0khCd6FknRWvmDQLc6U64LF6v0jzyt6
 utkepeDOW3KKkZ4t8S1Ym/Snd/7HI8Ua0zXvAUlHpKFzvtFqOT+XLhlluZK/vFl/KP0N
 q5Zv8KF6yZKqACU1alM+g3ta8lFeSORYGIOjkTxx1iHmFoDGfXE8mzBm4OhIuWqjzVt+
 hh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068589; x=1695673389;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jir6dLzCt+24mWC0TQKPcfjipIWQ9QkjgkfAFfzkuBI=;
 b=glojkRA1AfpVtBbtdEY+zo3EF3a7bbp6Jkj+0ZsHDG5d50AHnQvGSd1z68cc/8o99O
 OSEQOjK49Wr2LKfXuJKKBNDIBd5gtoDXdQDCW4LML7QqrNsQ4/kS3dXIpwLy97e3QLwg
 vvhK050BGrhW5Xsjng7zW24rsW47fCmynzKyMTxRjdt/m+T4CwUaxA9RFhICTtkcLag/
 DyigORPlHoqh1fB7IjxYmv6f4bMIxpbLexRUuaLW8SPBdPOB7DY1v2MMkSfqH0+6NWXX
 lqI49uGlYCDoRYTH/qAlN4oR5ZYrEAhh5pWUajvUtKUh36NbiKXl068GN/QwsxqAC7uT
 veRg==
X-Gm-Message-State: AOJu0Yy9Az2Wnhk1VBkE2KWHQqaTB0NBUvOmL6/z98KP5dFXzfuEJJ5R
 DJdAGNQaYpioSPHImDh5Ru/PKh6iHiU=
X-Google-Smtp-Source: AGHT+IHHm+YXjaXTFHPflA9/q1BPmxvR59aKqN5VhLIh3wmBquucz8LIUknU9HYtp1wbm6/meL+q8w==
X-Received: by 2002:a05:6a00:1409:b0:682:4ef7:9b17 with SMTP id
 l9-20020a056a00140900b006824ef79b17mr9631581pfu.32.1695068589290; 
 Mon, 18 Sep 2023 13:23:09 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.23.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:23:08 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:35 +1000
Message-ID: <20230918202149.4343-31-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 30/44] drm/nouveau/kms/tu102-: disable vbios
 parsing when running on RM
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

- on HW, parts of this will still be used to support LVDS
- LVDS appears to have dissapeared before Turing, so this won't be
  needed at all when running on RM

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_bios.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_bios.c b/drivers/gpu/drm/nouveau/nouveau_bios.c
index 9e878cdc8e38..479effcf607e 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bios.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bios.c
@@ -27,6 +27,8 @@
 #include "dispnv04/hw.h"
 #include "nouveau_encoder.h"
 
+#include <subdev/gsp.h>
+
 #include <linux/io-mapping.h>
 #include <linux/firmware.h>
 
@@ -2087,7 +2089,8 @@ nouveau_bios_init(struct drm_device *dev)
 	int ret;
 
 	/* only relevant for PCI devices */
-	if (!dev_is_pci(dev->dev))
+	if (!dev_is_pci(dev->dev) ||
+	    nvkm_gsp_rm(nvxx_device(&drm->client.device)->gsp))
 		return 0;
 
 	if (!NVInitVBIOS(dev))
-- 
2.41.0

