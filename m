Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7D6EC249AF
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 11:49:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F52E10EB9D;
	Fri, 31 Oct 2025 10:49:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="fd9xUXlA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com
 [209.85.221.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E57710EB9D
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 10:49:42 +0000 (UTC)
Received: by mail-wr1-f45.google.com with SMTP id
 ffacd0b85a97d-429bf011e6cso741337f8f.1
 for <nouveau@lists.freedesktop.org>; Fri, 31 Oct 2025 03:49:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761907781; x=1762512581; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=+5RYdD1QoUGDR2Tgu8m6WkM1ZGxPlfPcnOpoxoT7WDc=;
 b=fd9xUXlAbWajSa5A4YiX2lXTbkKNaS0tRinXOP3tybUe51w8gvjg4tCBiWPUsNoi7o
 5XsGUDw9rim93ddQO8g/tDfZbtsRG1gKdPmB81hOEkUaitZdnNKbD/rZDJsZvJZCWacD
 /P+eRInEgZnpD6ZUY6bhP7vYwhRPsWCspGfs8TDn3mD7LqDan7kAjnc/siiIqrqZnyEa
 qyQTeALLupia4F7XqFZNfH9DBtTjdF/VxBFMk0PCAcE47Ii5a3Mks9MArp5ZK4e84h+p
 Vyts1A0LYEoVWPV5mY73A1fjMtLifa2eR8lyUeXWdpra/4v16tmf3rTBO/3CP6/cm2oZ
 fBUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761907781; x=1762512581;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+5RYdD1QoUGDR2Tgu8m6WkM1ZGxPlfPcnOpoxoT7WDc=;
 b=Nlz7WiDG50l2wsyiyYmyyjlSVuTtr7udro3QV1NQRngqXZ7+E982Q5KGy31/qOlUX8
 YM8LKtjoe6dY6eM/QN8RmMi8eezrQ6d8hgU9N/6UPUwpSHHV9G+SJUYuNTYoD8Zgqj/r
 X5945i/l6nivS079gqm/04XYj8xhAJhsXBl3Lw3wnUjf9+1uEIvUp3W3se0VTMi4mSs8
 RzFBkKKX4Mha3/WlfTP3RQYksEvnuwx6B+pWvnGdgGLqeFrtEO56HRlzeO8KtEQ947BU
 fBKjsOgFHgUOgnGqsaMoZMOAoXRRog7B7wgdAw4eSJ5KJ2um84ySs70mgUUemOHRFTiO
 WZGg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXbGLukYK8IpVT2/aryqcLEWUuD+q1NcT+49/aZznV9N0vmo/+f0pzw2yfVkX8+OCnjgGanULnw@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwDGlHTXN68ABqBCphQF/HrGlQlD0MJi5px96s68kK2NqP+czAU
 5zmeukZJEjbiC1L0UPjE/aqDSwyQDqRBQ4bWxoRhqqHhNoQGupOe71fe
X-Gm-Gg: ASbGnctYknLRXiQEO5EwZlHcVmIhabfNG5NhHfr/lLUyyxGAxi12PTSZDLIUnbytvWE
 2mklxmF2MUoFIheMYm4Q0qY3AyMPCW3FCStLLfw5XEsyJ10pCObk5wZzwK5hAPLr8X4pjG0YrcD
 Df9CQZx5hrEmX7ArAkvce0UoYNDxvRYgM2klrHEfX/+XJ7hij7/miH1tkoNLaapBnX8vtz8LjV9
 FNNtWBnJpTkOTR5bS1tP5S7vzIcxqxR7vLiqSby7PltW8xTM0JZ0yOVcaYM0ekn/8QUBKq+3AV0
 G/4VP4RUkuOpZz7u8ivSFkP4+PLM5aesu6ihtx2JHXXcMqNN2Ck20GeAYs2RFiC21VI85kOWJIK
 fDe1LpTrn7FH565HQNOdm0OjUTPXEalRJZMNa7RqSWLLNAelG6bUa00HPaJjKe2ErJbvGZQYSiD
 DGQxYBquOohZkOGo0szZl4jg==
X-Google-Smtp-Source: AGHT+IE8VBb875dxLRxDB34lR0lZEjeaTd1sqXxjVzPNZFqjTJI6vGaaBoNW4XialIBbVA/YfCjRrw==
X-Received: by 2002:a5d:5888:0:b0:425:7c2f:8f98 with SMTP id
 ffacd0b85a97d-429bd675fc0mr2308988f8f.1.1761907780764; 
 Fri, 31 Oct 2025 03:49:40 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4772fcf7d07sm19498025e9.9.2025.10.31.03.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 31 Oct 2025 03:49:40 -0700 (PDT)
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
Subject: [PATCH v4 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Fri, 31 Oct 2025 12:49:19 +0200
Message-ID: <20251031104924.10631-1-mohamedahmedegypt2001@gmail.com>
X-Mailer: git-send-email 2.51.1
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

- v4: Fix missing parenthesis in second patch in the series.
- v3: Add reviewed-by tags, revert page selection logic to v1 behavior.
- v2: Implement review comments, change page selection logic.
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

 drivers/gpu/drm/nouveau/nouveau_drv.h         |   4 +-
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        | 102 +++++++++++++++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.h        |   1 +
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    |  69 +++++++-----
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |   4 +-
 5 files changed, 131 insertions(+), 49 deletions(-)

-- 
2.51.1

