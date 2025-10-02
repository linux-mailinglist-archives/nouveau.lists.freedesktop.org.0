Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C2D43C8722E
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 21:48:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFB0A10E503;
	Tue, 25 Nov 2025 20:47:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=permerror (0-bit key) header.d=gmail.com header.i=@gmail.com header.b="KN0A0P4b";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com
 [209.85.167.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3533E10E077
 for <nouveau@lists.freedesktop.org>; Thu,  2 Oct 2025 08:33:38 +0000 (UTC)
Received: by mail-lf1-f42.google.com with SMTP id
 2adb3069b0e04-57e8e67aa3eso2624552e87.1
 for <nouveau@lists.freedesktop.org>; Thu, 02 Oct 2025 01:33:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1759394016; x=1759998816; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rCnWTNE47EKUFdNbhO9xh7Mmv5d7MGU177iaBEqF0KQ=;
 b=KN0A0P4bJWcEiEODwbwXhn0h958zNupTJ/l3tdVFEBOP5zl3+s1mFmZnVC7oF6Ille
 A++rwKBQS8pOWzmq5zID9FMeNDZqorSpj+jl8bww2d1NFTUlIhMIl7BHK5m+axD+VfTm
 EgAqSTA+WZqtgsSlmO5T52znVM86x7R8CMTBrDO0iUCUH6UudhuEjbOORDypSjRLI03K
 Lz9lXuD+2CRzpk/hexdf8pXQ1iNvtoFxOgb8GBZzZuYQbXV1pHMjBIKK8iYFh1L3x7c1
 gbaYIdiP9OS3vjyA2sbaMwEzfCmnnP2KPANiDbI/ghdFbNOEGbNxXRhwqVS9ODRk2hqS
 PVpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759394016; x=1759998816;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rCnWTNE47EKUFdNbhO9xh7Mmv5d7MGU177iaBEqF0KQ=;
 b=TBEhxMNwZAJu7Z1P4esq1Ai4gAVQbW6b8kjEJ4iGTAa99fLZSjXinr/nznoA3EOeol
 DRsicz++k5Gkvjr2NJ+/Zswqo85JqaPFJ4rCaceNl4S2VWxWJyuZBb6KR2Z8KQZUGghE
 4FJvYgJ/awwdHmHMwARzAqfKXdZ2p/gx00BQKeda5HcqTR/xgplzkEIjd4/9ABo28RbP
 IBt7b4lbofcJuvkC5Nk/Gr7Q43YpQBaEGsgM/jGQFy+SBFMY695PKHtRKnZE+Lnk/Jq+
 KLEFY5wJ7PbCEyiD2ua7rzdXqyAraJY2688iEUgKlvC6XW/eMpPnQYm54arX1E+otMp8
 TxfQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzmDzeeVZA2bk9o+wLv3X2PE+pUirUS8ZxbthWb3i3oIyBjfCatZ35xDLJQwqkhoJju1oVxBK2@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyDbFha1aqxar4Bf8i+gsG9P0fF8Nf1AOVgJAYDcHnKVDpbyCMi
 NWH3J4W3PuVvf1nft3AEt7NxIVbXIrcnR/wj1KQVfA93Dw5npJRc5zSv
X-Gm-Gg: ASbGnctY7bpweveafjfJC1gdfsamWLDas9m1tLy/vzLpKBZM+TljNacpUDOV5d8KNC4
 Ainh6MVSV4b7MZ7tDKS/aXvVZbnO9zQEn1Su3x7uM0hz8zCpETeaGj/NTHxpZkryPGMybBHF3Qs
 03flp9yRSxgjV4FOeYhIOxt/ih4l0gv1hLyc3Wl/vAwkopA6WcQIdS4Tr7sIrCtWlIlXk9pOIvc
 2j/kgv+dD9HB3ocVC5km+ZAC0ewPdNTrv+R64XXYdZ8dG7IaRzaS2n3DhZlQchlz4KV8Zp8VthL
 WbKssj29WxIKRWy/1Itp8VYLI9A2sv082EKgSg8XEWJEj4W0JWirx7QvwPN72CRFUqsW1vLHoPj
 nM/JsBJZP6SrXQGVQwQFRiIDS/GylA5gg7cRdxvGn071oxJd9KXJD2qbaqbGyQiWxWJiq1wPMSl
 l2JNTgxuOY/NADEFlDzvZtPZa29zjwgsZCieoAHtOG
X-Google-Smtp-Source: AGHT+IHjcjwtFqspT76BDrqWmxGqO8qvZJDfBRE/OUo2b+yHt06K2O/V4pEtvb4W9p4Ul/oCXQ8WRg==
X-Received: by 2002:a05:6512:401a:b0:58a:ff9b:2234 with SMTP id
 2adb3069b0e04-58b00b3d66amr894765e87.2.1759394016142; 
 Thu, 02 Oct 2025 01:33:36 -0700 (PDT)
Received: from localhost.localdomain
 (broadband-109-173-93-221.ip.moscow.rt.ru. [109.173.93.221])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-58b0114033dsm632852e87.53.2025.10.02.01.33.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Oct 2025 01:33:35 -0700 (PDT)
From: Alexandr Sapozhnkiov <alsp705@gmail.com>
To: Karol Herbst <kherbst@redhat.com>, Lyude Paul <lyude@redhat.com>,
 Danilo Krummrich <dakr@redhat.com>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Cc: Alexandr Sapozhnikov <alsp705@gmail.com>,
	lvc-project@linuxtesting.org
Subject: [PATCH] gpu/drm/nouveau/nvif: fix a null dereference in
 nvif_client_ctor()
Date: Thu,  2 Oct 2025 11:33:30 +0300
Message-ID: <20251002083332.11-1-alsp705@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Tue, 25 Nov 2025 20:47:23 +0000
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Alexandr Sapozhnikov <alsp705@gmail.com>

If the name parameter can be NULL, then you should not do 
strncpy before checking name for NULL.

Found by Linux Verification Center (linuxtesting.org) with SVACE.

Signed-off-by: Alexandr Sapozhnikov <alsp705@gmail.com>
---
 drivers/gpu/drm/nouveau/nvif/client.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvif/client.c b/drivers/gpu/drm/nouveau/nvif/client.c
index 3a27245f467f..3cfe420b5156 100644
--- a/drivers/gpu/drm/nouveau/nvif/client.c
+++ b/drivers/gpu/drm/nouveau/nvif/client.c
@@ -69,7 +69,7 @@ nvif_client_ctor(struct nvif_client *parent, const char *name, u64 device,
 	} nop = {};
 	int ret;
 
-	strscpy_pad(args.name, name, sizeof(args.name));
+	strscpy_pad(args.name, name ? name : "nvifClient", sizeof(args.name));
 	ret = nvif_object_ctor(parent != client ? &parent->object : NULL,
 			       name ? name : "nvifClient", 0,
 			       NVIF_CLASS_CLIENT, &args, sizeof(args),
-- 
2.43.0

