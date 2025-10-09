Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AAF8EBCB341
	for <lists+nouveau@lfdr.de>; Fri, 10 Oct 2025 01:39:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A9CC10E248;
	Thu,  9 Oct 2025 23:39:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="WNxcVm2D";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com
 [209.85.128.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A181D10E045
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 23:39:18 +0000 (UTC)
Received: by mail-wm1-f52.google.com with SMTP id
 5b1f17b1804b1-46e61ebddd6so15286805e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 09 Oct 2025 16:39:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1760053157; x=1760657957; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yJFaIMUPoYmzAjPmdOJ59lzNVZeNVTShHGh4jV4ztic=;
 b=WNxcVm2Dyj2RajpjjD7x5DoLMulgPu5KwV2cPlLz45ui4tFMMr3yHiHq6Mf8lM6sBQ
 GZgH7GPrLyQG01qAlKh2ymgiqdtyo6bCozC2ObhT/4Vytj4rfbEWHAPwjhuh5Rd+ttv5
 6RPLU812Bwir/boSbhG38BOE+Y3fu42GQMkSuNnAK3LerYCf6SxkWvx8iTVDU5HC+za/
 4+Zb6ydkLhyd6r/sfJsQTC6+F+sK7aTabt8mUa4LGxiEpor3bPIv/nx5uDBNOkPpEXss
 A586ETwnRTwBmftSLftEIZxdE5O+OeWBE11ZDr0KoR0Bgm9l1g6IFNlnswWyPE5IRL6w
 /Psg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760053157; x=1760657957;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yJFaIMUPoYmzAjPmdOJ59lzNVZeNVTShHGh4jV4ztic=;
 b=Jz9l9A8+ynl49/hqHWUTdiDbiIqP7HfBd+5E67U2Cvi8mMdD14NIKk0Ij4MR8cLGcm
 8922TV0F8sNHkWNyp6/0BgaO/fcEGFHbikKTGJplR2ILtrgeH/SHBAwBNuLsZxt1kLMC
 BtBywmhJi87Q4nryHmFmZ8W/G7Sm4cb253uS1PYIaoOqEQQ596hSwnhHTpLRATJKHwmb
 gXQjq7Nuawka3n/o8nLPs6sozeVRhK/Olize01JcemQRWdt1qb5gPKBR2dcMt6x9dToU
 KANXPBKkFiLfB9t2cIu1oxle1QBIiq/KfOLLZfpJz0WwJ+Pie8ylC/QQHqQC+xQ2bZT5
 AVLQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVY5PjsdnjJG0YjjFi35tupa2N1c9fyhDgH1HfdlyoW5etP9I6hz1l95BZxwWDQIQc6L72tpG9M@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY32K7dxUfF99o9Nsz53qU7Y/u2TpIf8iXVcbtxOqoK/Fhc4K4
 J/3pARKzQNRpZvPZu4gKNbPJl+ajbicSTvv83RuZ8Ztp3WbG9nm7NJCa
X-Gm-Gg: ASbGnct5yYLr85PwNUgYH/gzpywWFh3uyC7ozmy9l03EGrVdsp/Cmf8gWBDAiWdQmnL
 Mm70RJ+fANZkqETggI4GOmTWfaDibbOW9SvKteJs7ZQI2SW53RIzhMlizmYDfRayZ0mlrL2cw3r
 qWuocWhajsc/DoZ2Ft/x0E6ZQOUeEquqT4WssfQCVSc4p379f1hahc3b6vSoUAPRogZjOmPPjJz
 mGUBIQ36DVZvZF4InQoiFCc5oJUvkShZDQOwsp1n7ClgVP6wDYnpAATTKhUhzdTrw7vnyYbGDh/
 kwNErKn/vBN0utfkMot4lkTMn0jeJifocoZ9PKOtVhsCLPEHFv42ycCZRJX5bMj0Xb0ApQlpqKh
 pnV873nil2gAsaG3k+x1tJRiiwtLK923sCPtTYfxWE2RmqbjJUnDc
X-Google-Smtp-Source: AGHT+IEWq4VpnqfU8FFLrzl/DHl5jygZ2q4d7dLrByZ4bLt3b/dzlYCAmwAed5vYoO1IY1J7qpOOUg==
X-Received: by 2002:a05:600c:a08b:b0:45f:2bc5:41c3 with SMTP id
 5b1f17b1804b1-46fa9a8f261mr65000185e9.8.1760053156830; 
 Thu, 09 Oct 2025 16:39:16 -0700 (PDT)
Received: from fedora ([41.45.27.42]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-46fab3e3206sm46066075e9.4.2025.10.09.16.39.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Oct 2025 16:39:15 -0700 (PDT)
From: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
To: linux-kernel@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org, Mary Guillemard <mary@mary.zone>,
 Faith Ekstrand <faith.ekstrand@collabora.com>,
 Lyude Paul <lyude@redhat.com>, Danilo Krummrich <dakr@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, nouveau@lists.freedesktop.org,
 Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>
Subject: [PATCH 0/5 v2] drm/nouveau: Enable variable page sizes and compression
Date: Fri, 10 Oct 2025 02:38:32 +0300
Message-ID: <20251009233837.10283-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The new VM_BIND interface only supported 4K pages. This was problematic as
it left performance on the table because GPUs don't have sophisticated TLB
and page walker hardware. 

Additionally, the HW can only do compression on large (64K) and huge (2M)
pages, which is a major performance booster (>50% in some cases).

This patchset sets out to add support for larger page sizes and also
enable compression and set the compression tags when userspace binds with
the corresponding PTE kinds and alignment. It also increments the nouveau
version number which allows userspace to use compression only when the
kernel actually supports both features and avoid breaking the system if a
newer mesa version is paired with an older kernel version.

For the associated userspace MR, please see !36450:
https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/36450

- v2: Implement review comments.
- v1: Initial implementation.

Ben Skeggs (2):
  drm/nouveau/mmu/gp100: Remove unused/broken support for compression
  drm/nouveau/mmu/tu102: Add support for compressed kinds

Mary Guillemard (2):
  drm/nouveau/uvmm: Prepare for larger pages
  drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
  drm/nouveau/drm: Bump the driver version to 1.4.1 to report new
    features

 drivers/gpu/drm/nouveau/nouveau_drv.h         |  4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 71 ++++++++++++++-----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |  1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 69 ++++++++++--------
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |  4 +-
 5 files changed, 100 insertions(+), 49 deletions(-)

-- 
2.51.0

