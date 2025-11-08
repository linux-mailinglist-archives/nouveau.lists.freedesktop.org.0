Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17DC9C4341C
	for <lists+nouveau@lfdr.de>; Sat, 08 Nov 2025 20:49:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A71C10E1F9;
	Sat,  8 Nov 2025 19:49:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="P7nWTqUQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com
 [209.85.128.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E433710E1F9
 for <nouveau@lists.freedesktop.org>; Sat,  8 Nov 2025 19:49:51 +0000 (UTC)
Received: by mail-wm1-f44.google.com with SMTP id
 5b1f17b1804b1-47754e9cc7fso12246345e9.2
 for <nouveau@lists.freedesktop.org>; Sat, 08 Nov 2025 11:49:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1762631390; x=1763236190; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=b0uy50dOrdzc9k+anVLIDVkwfvmPwxiEPkSelHBhPk8=;
 b=P7nWTqUQq7k2YRYKUuCU8eqpTyqnctnzAkX+encXO57izfUhpmwrKCI46bccYWxqd3
 XXNE872IKv/5QjFdoctJai1rJlPmw/rpvMe2T3F54Ixj2gePuEnGqheCX1f9Pc7w59/l
 326sYblZ/ZNgPJgyIIb07wzQVeKYE89jchfINtrKnzg/CMiY7nu1Nnq0mOsTVOQ/jNG/
 XmMcYTMrPSk/3oKbGU6AO61+4n+VfY1A5eVtaf0yRFbebjtxf4xwxfjLwmCYHKtrPqc+
 qJlFhmAU7uamiQJexbDLOkElQSKyiDXIvSM0diqcaUS/ZOypi19xPE4A3GeFQDd1tiIy
 XgTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1762631390; x=1763236190;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=b0uy50dOrdzc9k+anVLIDVkwfvmPwxiEPkSelHBhPk8=;
 b=c8jM3wo4AtDReHvBo3EKTQHkn5jMe907cIPlmpPgWU7Ma6NrvMwaXnWxZRUeDwl0Xr
 SBEduz3bXDWYCzPBx1+ReScjmJAVqeu/ugV/2NfHRipW76r70fm+JeUGi32vAQLydAnc
 TohyndBrnuk7GN2POD0hdARdSVYOI/RLmDIlC4+wZHD6O8Up9ob6wpVsHVMn7BSvUqyQ
 jkE+0yxRf2uRszthhyZjzoWFADEE33jMceRbfhh9BQLr3neA4UjuoR0Z3DgXLYj4VW0U
 gtrtjSGuDp/WPThYEZe8/saYHlWsAuYa4eDn7ygWIbBTLemJnz8WN50Dfp3bNvHY+IwE
 DFQQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXnqxD6yeMOC0GjSLtTRjtxaLwy3r4N/Clg0ajWBy7qByM5ncwOU7+WjA+PVmzF4FxM1eyauNV0@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZDD6e2mjqc5pCB5AL227aerERWW1Cx6QTXdo2vMWWx5tsk+p8
 sJAgTBiES/0JOQeiL4//M9LyORXbix5XyFX3FQ1v5LGVtomNFqBiizgX
X-Gm-Gg: ASbGnctDRlqyQOmSr66fXUiHfah3hEkeA/eb5RHPkengYSsjqma6WjTG2gGpMwodk3K
 xnJEtJSv4/dFZT39HwGfCsZ+oYsdq1DVAqNSFlmygtQmPOf0WpqtfxIHMtv5KBXtnEWuWJjvudW
 kEbmdQXQ8/KHlVTaBTAHnkasRgL0w6H9tsqVLk2HVOJYcs2kCAqiOqlV02BKHHFrgQ6LpjTZpfi
 Xw5P9pjHm1HIqHnIrIXTtH9bFlZf5gb34nQcgv00WZeXfrWrIgvowLPBuZTN2+BPT8+BAXGmo98
 fEB6tWnpFwFmpe6iCW2QlelbRUdzZkgaUa3s2sU+28H7BwiSDlLpNjWEaf9DaVPmxrp3uVSSrzM
 rKUMcl906DKTLNoll1jmGDyS/Jyb8jsU1QMGusmAwSVocZmfeVxUbVZV1+tcMwuNRJ8diIpuY7p
 gjuJLwRWg4rlNik9Jmf9Xk
X-Google-Smtp-Source: AGHT+IEI7PfgcH4CwLjfZxsDK95X3Phk9kmaJW2SV5zjU3Vr74pa1DgjlYR9lHlBmHuBOuZhK0oYOQ==
X-Received: by 2002:a05:600c:45d3:b0:46e:4783:1a7a with SMTP id
 5b1f17b1804b1-47773228b39mr24583095e9.3.1762631390046; 
 Sat, 08 Nov 2025 11:49:50 -0800 (PST)
Received: from fedora ([156.208.73.128]) by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-4775cdc33bdsm233461435e9.1.2025.11.08.11.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Nov 2025 11:49:49 -0800 (PST)
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
Subject: [PATCH v5 0/5] drm/nouveau: Enable variable page sizes and compression
Date: Sat,  8 Nov 2025 21:49:14 +0200
Message-ID: <20251108194919.68754-1-mohamedahmedegypt2001@gmail.com>
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

- v5: Add reviewed-by tags, use dev_warn_once() instead of WARN_ON().
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

