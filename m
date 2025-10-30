Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C76D5C229F4
	for <lists+nouveau@lfdr.de>; Fri, 31 Oct 2025 00:04:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20BAA10EA56;
	Thu, 30 Oct 2025 23:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="COsAGacy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com
 [209.85.128.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7161B10EA56
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 23:04:12 +0000 (UTC)
Received: by mail-wm1-f49.google.com with SMTP id
 5b1f17b1804b1-4711b95226dso20560265e9.0
 for <nouveau@lists.freedesktop.org>; Thu, 30 Oct 2025 16:04:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761865451; x=1762470251; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=spTnbkYHkS5sFJlII3J1Det01f4GO/gKWkvcwEWUpZ8=;
 b=COsAGacy9abVFTIeoHkawrTwGn1++vH0ViOCMnck2RY4ZbdiuEyA2UAN78WgS1s/o2
 H7sIfs8z3MBeRIlCQcXTxJHtP7aoojIm8Yi6UGKxYtYMB78PRFxpnwwqUCYCRQYxOsPb
 UDe2KHvL9SyAqLqz9j8GJAH5GAtP+I5e/M5o8qD+qyzC/woauJO71CZ6su394YeZv1U9
 0I5QeNImKXRMe5iNoF2r1WP3U5c12Tvp/sLyQGkZt7GWCI42NeUkf023egmBZ4ghIwjv
 IFgEt2RSYg73eQF1AcT+DCkGQ1P6Rg0NOIsTA9fiZm1FNM9lQSpz8cfo8BbjTi86UQZW
 bpIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761865451; x=1762470251;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=spTnbkYHkS5sFJlII3J1Det01f4GO/gKWkvcwEWUpZ8=;
 b=MuxMyornFFeznh5xLsR/jou26SUx6ak8I4N7kw6ecodo+7fpwr7Jwfg3HfsN8oTyua
 pNlGBZ3Veosxczi3kCpNOh0DLL7EmhKskL6TiJTt4s+6EBKicZpauFfGLW7g10cxr+uG
 W+4SRq4lScLcXXUcAVEMlSCSxKv47xxivjMPiAuNC3mDQrUUX0RlPDW12PCfK+OElY5x
 aNWXGdUlX/BjDY8g+rgB514rboRoQ7m47RMkaXUbH5SVg3JsUIfq5n2eUS6GItmwEpS5
 n/sG4oOsMjxtamCPorAGKGlVahhCK3Ns04MKoIiC5XSVQjEDeSbxdeyYN0Bq4DZyakvX
 FoWw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVcqnaR+GoSz7F9rU/3w4gK0HVibI6twSBvW6LSfu3l4E+r8yQjhbiS84ovGZdv92xk0T6Y8MGy@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmLue8Biq00mXZOY+r+QsYE6xa77vXTvzePVuz/w91VDdKlEqe
 pfEkvO052waHMnWo4WNnCaDMEbyqQclKnnGk6y4+pAOGMz/2annwgk/6
X-Gm-Gg: ASbGncu6hbEb3OLperivqblrGUk2JQkzusnw3YFIx84C/zJvaqTDNPmkLuVQ3kE5urE
 PA+hMSgHzB3nKs4GJOEEr0miAAxTNEHHMt8+RbdpxH1XjIY1Z1l0RRDz4MzPgEEy2trOR5uI/4H
 2bSt3fjWJfBosLflGQP7p8tvqOZMFlaK2ymKqHXSNbC1v2NNvBORG4NnWRmwyaEHXa78UYIAGNE
 y936wbtUq0jdZlvMWEkUu80KpIFQ6vfk/d7hXSC5pQf28M2nk7QF8aeXcqErj6jmimfY2lvs3Zj
 GWT1g5S4xKH1Zjo5pFHqgc3kJLH6H/cnjWIp8Q2Q6j5vMWj6e8YHjkx3xmS477YFT7ZS6/aca/F
 WmrS1e/ndyJ1XeEb/V7WRJBQ2AwsNUxjXq2dfppW2bnHtt3DijQ4r+JblT2Bg4huYD+wjbpKGn/
 jgv2ToiawU5sU=
X-Google-Smtp-Source: AGHT+IFC7JbgK0f+mgKIcbZcySjz0mcvo7VVc4C2hDfzVb829xeoqBnvTAh+hZXl4KB+Y0uGYyJg1A==
X-Received: by 2002:a05:600c:538e:b0:477:214f:bd95 with SMTP id
 5b1f17b1804b1-4773087b183mr13255895e9.23.1761865450511; 
 Thu, 30 Oct 2025 16:04:10 -0700 (PDT)
Received: from fedora ([154.182.161.198]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-47732ff8235sm2227025e9.14.2025.10.30.16.04.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Oct 2025 16:04:09 -0700 (PDT)
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
Subject: [PATCH v3 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Fri, 31 Oct 2025 01:03:52 +0200
Message-ID: <20251030230357.45070-1-mohamedahmedegypt2001@gmail.com>
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

