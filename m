Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 191747A53E0
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 521A810E30F;
	Mon, 18 Sep 2023 20:22:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69E9A10E30E
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:11 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id
 d2e1a72fcca58-68fc1bbc94eso4359353b3a.3
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068530; x=1695673330; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=0b9XAejj79TEpGMhd8/bHdQ56Xt0ExqHyD4jHjChLaM=;
 b=k9hvj0RPUiWvgfgehugVvfZAGRIHkmHzu2cggxdo8nt1h1g6vLIjd4OPWiLO46cZwd
 uPTn2BdaSzbPXJoU6RfboM6MH+ewF+Jnq65dhz9zep72lUgSFWTCLKByd5O9WvcVLBhY
 OUEFfV01K8rQqq2CtNavZ5Od+tG+FqmEwZvO/IlV59XKEF5sGY/y9OKZSvFX0xKmDTZc
 95vkT4ffVi477eObpF8YHnYu+JvpuMGiYu8AQWDUJBZej9JCzhPNWnPwLwv60AWQsqgC
 bwCQLnIw60lG56d6kkLX6xWHumm50ibc7TGGOy582IRraZDyKixdqphqgAXKATThz10+
 fZTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068530; x=1695673330;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0b9XAejj79TEpGMhd8/bHdQ56Xt0ExqHyD4jHjChLaM=;
 b=VqjupApqRkECWO4epUPSnSGddOD15BFetaLwRKzJ+nX8i8cecmrd5ozfbFzNPp59RB
 jgaf1jigp5QjSMVwWrR4Nakpo2anuWWcHsXBwKMLCvMXbbVuEK/TzGfSMZK+kZtAcRfG
 BPg7A0fQA+iwZ2pVdif0ECjURxJ21BctMbXEPMXorS3X6Rbf86mbzhTflx16gSVyWZMu
 E081BMgYJbna/4Z24MDHD+1pvIpYckBaJxzuYly3WFvRLxRFu3i2jJSQd2aKLN5W4f7J
 mb5mX1x/ztAB6US3VdTeuCarC8lnLXHBNbJDf1+9UKdLU7B0+DGN6ND5xB0xcB+DyUrK
 Wq7w==
X-Gm-Message-State: AOJu0Yx9vamPyJEsziq++urgwRpxo+pO03Ci2wPnCWavtQkjk79eT1Yz
 lzHjcIkmdgXzfmpWO0b9RbZNfswXiH8=
X-Google-Smtp-Source: AGHT+IFfpXvdqlhrNz7f0WtpXkLYbBJTfzo4yBNzzax4aHds95qIou6WqgbE7GbBQaz2VjRj5gYBMQ==
X-Received: by 2002:a05:6a21:619:b0:14b:b42c:34a6 with SMTP id
 ll25-20020a056a21061900b0014bb42c34a6mr10228332pzb.24.1695068530588; 
 Mon, 18 Sep 2023 13:22:10 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:10 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:08 +1000
Message-ID: <20230918202149.4343-4-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 03/44] drm/nouveau/nvkm: bump maximum number of
 NVJPG
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

RM (and GH100) support 8 NVJPG instances.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c    | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c    | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index f326b09680be..6af0352a4873 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -44,7 +44,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPPP   , struct nvkm_engine  ,    msppp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 3)
-NVKM_LAYOUT_ONCE(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg)
+NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_PM      , struct nvkm_pm      ,       pm)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
index 84790cf52b90..4fa6e2f19bfe 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/ga100.c
@@ -76,7 +76,7 @@ ga100_top_parse(struct nvkm_top *top)
 		case 0x00000012: I_(NVKM_SUBDEV_IOCTRL, inst); break;
 		case 0x00000013: I_(NVKM_ENGINE_CE    , inst); break;
 		case 0x00000014: O_(NVKM_SUBDEV_GSP   ,    0); break;
-		case 0x00000015: O_(NVKM_ENGINE_NVJPG ,    0); break;
+		case 0x00000015: I_(NVKM_ENGINE_NVJPG , inst); break;
 		case 0x00000016: O_(NVKM_ENGINE_OFA   ,    0); break;
 		case 0x00000017: O_(NVKM_SUBDEV_FLA   ,    0); break;
 			break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
index 2bbba8244cbf..0f1675e57256 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/top/gk104.c
@@ -89,7 +89,7 @@ gk104_top_parse(struct nvkm_top *top)
 		case 0x00000012: I_(NVKM_SUBDEV_IOCTRL, inst); break;
 		case 0x00000013: I_(NVKM_ENGINE_CE    , inst); break;
 		case 0x00000014: O_(NVKM_SUBDEV_GSP   ,    0); break;
-		case 0x00000015: O_(NVKM_ENGINE_NVJPG ,    0); break;
+		case 0x00000015: I_(NVKM_ENGINE_NVJPG , inst); break;
 		default:
 			break;
 		}
-- 
2.41.0

