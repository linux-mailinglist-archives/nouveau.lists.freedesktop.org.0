Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 59A94C48311
	for <lists+nouveau@lfdr.de>; Mon, 10 Nov 2025 18:05:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EA6210E46C;
	Mon, 10 Nov 2025 17:05:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; secure) header.d=mary.zone header.i=@mary.zone header.b="R09fVWj4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14B4710E3F8
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 15:33:03 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-b72cbc24637so584685566b.0
 for <nouveau@lists.freedesktop.org>; Mon, 10 Nov 2025 07:33:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mary.zone; s=google; t=1762788782; x=1763393582; darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=QZt1eoNmJghXxK3OzFUBWP+UZk12kwPAzm9DvMX3M0s=;
 b=R09fVWj490o3wMUuapQLBR7LAX4amdwriNFgfiGs7GPUgbCowfSLyaQ3R8a6OdQzK/
 4VzUk7fOYLfYxrbMYsCpQ9rGhIrNcUu2hzHkX6u9cJV7PGJbuqoiMH1yVZMK1XnE0m5y
 9N67Zz4p7/IKsJb9Lvny4sR6Aap5x6S6Ca5ODnJ8KIZBhbAuhU5FtNjKcleDciGmNhlH
 1iZmKVLwjvP58jwf8l0wDvY0IcMd1bGoNgfJUSDiJY44vqbZs2qyzhHs6sHyLmd3z5M7
 LHYs8i4rKiEki925FvNVeIavXrVW/xfGm/hgWfp+94larywSOAQ9ejOjZBd2pIxadesJ
 vAEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762788782; x=1763393582;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=QZt1eoNmJghXxK3OzFUBWP+UZk12kwPAzm9DvMX3M0s=;
 b=mS1bHOJI/6kQTYqKPEPoFCgwfYkm+utbjXBl0YEfIiZcJlUD+qhQOTTdmKI8n2B9sH
 +dSjFjKYyEf6lmPRWCqEIkFteJFWxO9pIJUxfqxLk1euSkhsw3x0YbJ2hMrISZ+JwwrX
 FN0Wq3pocDvN1IivVcS6v4PWUxojxDcivJmvEJdELFuC2ORrJnMW9CdLhOdPGIE+B0/N
 9Wq2isrD2emQ9kg0zYG697mCQPEQGy4I2L7zfnh1rEfT+XpEmZQM0SqMfDIQHFBusLDl
 PoxGJwwOrd+jkjwpGfs88ApMpsJBvbEgrXxEiSJlC0wSWvXEQS3yE9v3NKdEAJUEYNnq
 LEsQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUu3tsQ7Q6GPY0guxDxPOhl9JmSnLX5mjqXotoK5+8oibyhLidz0IPM+qdSFe+lTptNOyvGSOtS@lists.freedesktop.org
X-Gm-Message-State: AOJu0YybNPhOycl2MKHxfY0EBKq9tFWQRhM+H27eh5G41xHQyWRfY6sc
 aGIgMWM4aHMCCTzphCEYwsLH4sCPlUhspSIdPsvD8Yyz7WSMvUjs2z40/jAuli1STDM=
X-Gm-Gg: ASbGncvbt7ZaR74zFqB/dH4yipbcHGrA/z8bG0zbGNHfUnn3ROM7mUGas4QaMGmWPLt
 qnXpCX3JZtlyZGAyHbWWE/Vu/tiVqw/YA5hElHDqElKlX7i5XLLZccxNz6Zj8MrKs57otBd4OFn
 qv4rADqSwyPMkGUggoABgLUl7IxVyHOhfSdMjpeHgHYgvyxMBWVQXqRBvsryJRFPAUTvRlETkv8
 kS5P9wnekksgur5Yn4ujbfj6/DKYhBJ284YyG0/nzJitJ5DFkRFcoQwrRaCE4lPbiCSucdkkc5z
 yXcS0CDZa8xrWsQyfYsD8pJOU/1zp/cvqELgZemVFK8Ql3Y1c8r2SuDN/hMhNOTsY3ZrQcS6hfI
 XmWbCuUgshz/cpdyLC+TDcnxr2XVIh43tGvaJO0sP/0Nvbr/c8Nt6sUYcHNIEgd7ZbzgURj7KaL
 c0NFHSpmU4mm8biTV8875ic62tK5yUgE/z86HD5YV+6sCVXp3u5cB2ZnwRRQh2
X-Google-Smtp-Source: AGHT+IGL96zs748BVkStlBplObt6x+GOYGDHlU+lHOEWktwEy6wmWPMpV0MLGfLrCfASxr+Q4IKQYQ==
X-Received: by 2002:a17:907:3e9e:b0:b53:e871:f0ea with SMTP id
 a640c23a62f3a-b72e058a6d9mr938783966b.56.1762788781394; 
 Mon, 10 Nov 2025 07:33:01 -0800 (PST)
Received: from [192.168.1.42]
 (2a01cb0405e83a000cb38cfe29807c1e.ipv6.abo.wanadoo.fr.
 [2a01:cb04:5e8:3a00:cb3:8cfe:2980:7c1e])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b72bf7231dcsm1115978466b.31.2025.11.10.07.33.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 10 Nov 2025 07:33:00 -0800 (PST)
From: Mary Guillemard <mary@mary.zone>
Subject: [PATCH v6 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Mon, 10 Nov 2025 16:32:55 +0100
Message-Id: <20251110-nouveau-compv6-v6-0-83b05475f57c@mary.zone>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyzHQUlJIzE
 vPSU3UzU4B8JSMDI1NDQ0MD3bz80rLUxFLd5PzcgjIz3WRzI+NES+OkZGPjJCWgpoKi1LTMCrC
 B0bG1tQB1XZ50YAAAAA==
X-Change-ID: 20251110-nouveau-compv6-c723a93bc33b
To: Mohamed Ahmed <mohamedahmedegypt2001@gmail.com>, 
 James Jones <jajones@nvidia.com>, Lyude Paul <lyude@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Mary Guillemard <mary@mary.zone>, 
 Ben Skeggs <bskeggs@nvidia.com>
X-Mailer: b4 0.14.3
X-Mailman-Approved-At: Mon, 10 Nov 2025 17:05:26 +0000
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

- v6: Use drm_WARN_ONCE instead of dev_warn_once.
- v5: Add reviewed-by tags, use dev_warn_once() instead of WARN_ON().
- v4: Fix missing parenthesis in second patch in the series.
- v3: Add reviewed-by tags, revert page selection logic to v1 behavior.
- v2: Implement review comments, change page selection logic.
- v1: Initial implementation.

Signed-off-by: Mary Guillemard <mary@mary.zone>
---
Ben Skeggs (2):
      drm/nouveau/mmu/gp100: Remove unused/broken support for compression
      drm/nouveau/mmu/tu102: Add support for compressed kinds

Mary Guillemard (2):
      drm/nouveau/uvmm: Prepare for larger pages
      drm/nouveau/uvmm: Allow larger pages

Mohamed Ahmed (1):
      drm/nouveau/drm: Bump the driver version to 1.4.1 to report new features

 drivers/gpu/drm/nouveau/nouveau_drv.h              |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c             | 102 +++++++++++++++++----
 drivers/gpu/drm/nouveau/nouveau_uvmm.h             |   1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c |  69 ++++++++------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c |   4 +-
 5 files changed, 131 insertions(+), 49 deletions(-)
---
base-commit: a2b0c33e9423cd06133304e2f81c713849059b10
change-id: 20251110-nouveau-compv6-c723a93bc33b

Best regards,
-- 
Mary Guillemard <mary@mary.zone>

