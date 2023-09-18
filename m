Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D69627A53DF
	for <lists+nouveau@lfdr.de>; Mon, 18 Sep 2023 22:22:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB8A10E30E;
	Mon, 18 Sep 2023 20:22:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x434.google.com (mail-pf1-x434.google.com
 [IPv6:2607:f8b0:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 659C210E11B
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 20:22:09 +0000 (UTC)
Received: by mail-pf1-x434.google.com with SMTP id
 d2e1a72fcca58-68fb6fd2836so4573103b3a.0
 for <nouveau@lists.freedesktop.org>; Mon, 18 Sep 2023 13:22:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1695068528; x=1695673328; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ifhCEtXyHiSBePzh4nqPHDvdaqriqvHAFUg05i79LvA=;
 b=JaLHJEjl6kZq/P4uJ67U8YgKyIROaBseqnokVybEBIY1Ya8OFQe14IyYoOwau+BIn8
 E3lczX7LynXoxBjC4KviH1rEPUVROB71fH+2+jwFAvRq46Qdja+rNK3hfZ/zL0bbjTn2
 eSvkT0HxtuPH4V2wWHn3mOBpBt/MA5EMz+pM+Otl0/CJ5WI8ekmA7NTqnLjlkPACIGMZ
 XpGIHNbt5R3XbOkfX7wcUnf1cSZtBr92Dy6G8GcyFmZPs+DETQ/x5vLYS/8Tog65M9bo
 9UsTff6TfAw/W28YhbqZmJfkes3FuwQn/CObEe/Do7RsqeQVTniDjW0cdhzwjQjGpesZ
 kNMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695068528; x=1695673328;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ifhCEtXyHiSBePzh4nqPHDvdaqriqvHAFUg05i79LvA=;
 b=DYoFc8xgZHQ6gOtsLrfPiC/dqoJcfutTBAj3USWdZ58M2YAmLzz9HNdqUuWhDCyHEZ
 wIsSJDS67lNpuPmPw1fS/22eGI8yjd0Cs7NW4G67s/GZoqo8oS9InmIHYtzrw52HvUyd
 pE8kPN7COK5Ub1gaErVtda8UWXBGc2AnRf26LLOAc2dqAY8Ma0l4xTnc4slLP9w/l/nZ
 BTb5toBZleiawrX2k0EEMxSwGJh8CC4A6LIKfnABVXfu9NkuHALuSb/IWOzgJsj10++e
 V4kQiYSeObjGwVRHGLQNwJu+yIbWIbIE1kKKDYQZtO0WLVEOoMP51SESZ5qUnUb83PPu
 T8kQ==
X-Gm-Message-State: AOJu0YwUOgHVlS0T5d7PFLEJy6KCYfX3UcFkjn0egJg+YpzoMiii4d/N
 mkpAY6qij0XGQJK/VarD83vFuQ3MM+4=
X-Google-Smtp-Source: AGHT+IF9tlXuY0Cxw9NTqk97fSixqHdGqVXmh9jz0lgdx4MWHBvawkBMLJOClGWqgVendPnXGx5WlA==
X-Received: by 2002:a05:6a21:3d95:b0:14d:a97c:90e with SMTP id
 bj21-20020a056a213d9500b0014da97c090emr10118300pzc.23.1695068528458; 
 Mon, 18 Sep 2023 13:22:08 -0700 (PDT)
Received: from localhost.localdomain (87-121-74-45.dyn.launtel.net.au.
 [87.121.74.45]) by smtp.gmail.com with ESMTPSA id
 p21-20020aa78615000000b006889348ba6asm7446067pfn.81.2023.09.18.13.22.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Sep 2023 13:22:08 -0700 (PDT)
From: Ben Skeggs <skeggsb@gmail.com>
To: nouveau@lists.freedesktop.org
Date: Tue, 19 Sep 2023 06:21:07 +1000
Message-ID: <20230918202149.4343-3-skeggsb@gmail.com>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230918202149.4343-1-skeggsb@gmail.com>
References: <20230918202149.4343-1-skeggsb@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Nouveau] [PATCH 02/44] drm/nouveau/nvkm: bump maximum number of
 NVDEC
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

RM (and GH100) support 8 NVDEC instances.

Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/layout.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 58108dea5aeb..f326b09680be 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -42,7 +42,7 @@ NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSENC   , struct nvkm_engine  ,    msenc)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPDEC  , struct nvkm_engine  ,   mspdec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSPPP   , struct nvkm_engine  ,    msppp)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_MSVLD   , struct nvkm_engine  ,    msvld)
-NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 5)
+NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 3)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
-- 
2.41.0

