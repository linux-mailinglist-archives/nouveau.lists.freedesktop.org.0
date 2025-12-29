Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7846BCE8464
	for <lists+nouveau@lfdr.de>; Mon, 29 Dec 2025 23:06:56 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4FA6A89220;
	Mon, 29 Dec 2025 22:06:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (1024-bit key; unprotected) header.d=broadcom.com header.i=@broadcom.com header.b="eBHaa9jz";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 19B7B44BAE;
	Mon, 29 Dec 2025 21:58:59 +0000 (UTC)
ARC-Seal: i=1; cv=none; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767045538;
 b=XT/uhMTgSdBltCMeFvb5iOPyg++NVmwfUBR2RGjqg3kM+PRLAHYsTjc4gJ8ZmT3dQM5ey
 fcz4C8ZjBitU7u7JEu8d6+cfnMLA/N3VdU9fR+V7197gNUcdakJdvi9L4kdIZrttt1GGpAv
 2cxNAxw7tkUm1H4tinYZ46eMxrGrs9WjDy3Ljofwa2YD4SfApbALrT4uGo5A+T3ckdxaA7m
 4YfIFbmblSG+ESFqh/RMBz/S2dBcqudk2mB7zr315iMwOjRr4Es5dVSDkzYMoblo6NzUYIB
 +AyeYCX01f7HgerDdTPi3YgfJRioDJ9g0J8XrqTVwhuxHKHObm6BZ4NPIz7g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767045538; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=UwzcNp2HYOV4Z1mSXVXCsNd5TObEfxUddJJZvW7JJZk=;
 b=ZhTwrij8S1JasFSAxMxk5WRBa32jIe4ZfLbCsk5g0JiBDJmdRjTSB/yqHFb9KVRMHlC7u
 GZ/UhUNTWmBqKNmhpLbMK1Z0gyi3fpiE1i5mAbI9pU0es58R8DOCTRHa9hb7Nan+CKzsvAv
 e7ZxJL+L32vFrSXVuffYAssAfIoz7XWg/jUDLrWIi0k6Dz63AUshcphHnK/+sywQb6d+XVT
 FTbwW2K4pXciuvQgXbvUzzVjxpu8a+oNn+HR0ml4ZaxS6J0ZZZ+ejm5z6GgMeFwaD+f77TV
 OcENtKLhEma5mb+2Dsc5nCRUSUIU977WwHaNYKKX0AFbaHMXvQCfi7rAGiIA==
ARC-Authentication-Results: i=1; mail.freedesktop.org;
 dkim=pass header.d=broadcom.com;
  arc=none (Message is not ARC signed);
  dmarc=pass (Used From Domain Record) header.from=broadcom.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=broadcom.com;
 arc=none (Message is not ARC signed);
 dmarc=pass (Used From Domain Record) header.from=broadcom.com
 policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id EF63643E41
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 21:58:55 +0000 (UTC)
Received: from mail-qt1-f228.google.com (mail-qt1-f228.google.com
 [209.85.160.228])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE3BA10E745
	for <nouveau@lists.freedesktop.org>; Mon, 29 Dec 2025 22:06:51 +0000 (UTC)
Received: by mail-qt1-f228.google.com with SMTP id
 d75a77b69052e-4f822b2df7aso22711671cf.2
        for <nouveau@lists.freedesktop.org>;
 Mon, 29 Dec 2025 14:06:51 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767046011; x=1767650811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:dkim-signature:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UwzcNp2HYOV4Z1mSXVXCsNd5TObEfxUddJJZvW7JJZk=;
        b=rbcPeZ5bANHfuj637uAAyTcIkp1orrT//mWXYp0fE8eRmdkd0RnzTJj+7mrLRU4sC8
         Bz4uDvPl1ahjvSRgTpAhmtGpWjpubuvRbLzckYMddaT0LnB6JUP7rVXfQxvbkCJqrWAO
         NKpd/iXFe3whS488d0jrKaY+jzklQMcEtUiNHYQg95WQTf22GKup3R1j7uk1CqWI6NvJ
         3FtdqXCAYvOp0CQnDYZMrcABcu91Fdq6ludjCLt7GAka00ScgFuyhSwDFzsQnqH6EW/v
         QRR39fXI+Sg9YTiZO71lkzTtqJwDYuFKXJb4MKnoBDpIn7JXwHwMJEcpLXkSY8DW/YYq
         TlHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhfRR+NIKnyvRAiNQAGFP0nk86OblvFzhzLnBmVmDFJ0ZzMG6V7LFF/DRdb9DkyMn8gGDRQ8Tr@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw0cdOqH5rMq8lcVMc7rYiQoqjYVX3gdh3oCDZXK8eAlK3hgQA0
	uYL3MFustgm7F2Vj8G4Vt864Y1HMmOsejzj8stYvC9MnMf0EIGdAmPbzOyPDbD9GNRH4c4TF8pi
	UFXbOFUBIPkgnGA4sz84/iRES0LqdYlvBD1eUuqhlwxZQmQz1/xpT/KdUY1xCKcbLskB6FE47xD
	KMgjmWnhLd/IRDPA/8bIGKtSHpXlqphmb/qslLMH3yjKHPLTwvSdNm3s+la8LHYbpH0sS7YI+YX
	tdhlSdXU/DnnPBwlw==
X-Gm-Gg: AY/fxX5h5oEUntCOA5/8OfB+UVLPntShKX0iamwrfytcdtsGdriCJV4ZelWOm5eWpjk
	6CeDghI7dAwKczBPqTnwMTP+qmpZNwo2LVrabKrC5YgzJ2lkydzFeuInG7SCJpWYsB/Ebn5t7gn
	DEZNzoj/9Yvgpt8NLircs0FGYIq5t6QiHsFx4QoPbIT/J66i17io5gyU7z4jMtAm4sjwAueQplC
	UlUtfv9P6rvM1MqPjNEahmEJ2+vWpDjE4x7OZEwfJnMdpYMTrsbhG6Bx5bd4uiXpuAVvPunJ2cS
	5OSk8hjUpjDohw4Rg20zcHSEGKeivewtqBoo3dQtcVRFxH0NGU9Qj1KlXWqbkEsZKGRX1vzTc7O
	rpvyrrj6afdk5KIF3kXyFyiZUvdlvnP+pqefVK/bFdU+nKV0ED/e3Rre/Suxwwv8PeqZpaUE/Rv
	cWoNSeOZo9e6pIXHHYb1CGhvblutUGul03llrr8Gw=
X-Google-Smtp-Source: 
 AGHT+IFWsYx6SBzE9eZY4IA+B1TA/17bYYSve3pyYCHnZqaDeE41x2/6DNHuuqL2+0M3iPUgVtJ48RQxfhAW
X-Received: by 2002:a05:622a:5792:b0:4f1:e9da:e876 with SMTP id
 d75a77b69052e-4f4abda20cdmr488224021cf.62.1767046011009;
        Mon, 29 Dec 2025 14:06:51 -0800 (PST)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com
 (address-144-49-247-2.dlp.protect.broadcom.com. [144.49.247.2])
        by smtp-relay.gmail.com with ESMTPS id
 d75a77b69052e-4f4ac603962sm10177301cf.8.2025.12.29.14.06.49
        for <nouveau@lists.freedesktop.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 29 Dec 2025 14:06:51 -0800 (PST)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-34c5d6193daso18865830a91.1
        for <nouveau@lists.freedesktop.org>;
 Mon, 29 Dec 2025 14:06:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1767046009; x=1767650809;
 darn=lists.freedesktop.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=UwzcNp2HYOV4Z1mSXVXCsNd5TObEfxUddJJZvW7JJZk=;
        b=eBHaa9jzn5YXQTljEOBDDfbdc5vBP44EDiU5Gbpomvm1A9bzUwb3IQK3b8puFwE00n
         RieTQzDdfdTNTld5j0Pr8ZJzy8oSS2xqUF9p9zWcLO9KTik8ir+puzJNsMvxIyUbd+7H
         aMJlLL4/kkz96FUoeDM081u5F262Mc3Y/PeI0=
X-Forwarded-Encrypted: i=1;
 AJvYcCVOGnbMyUVsFa8LusnKsuZVwSbDirquGff/ZkHkd78z3tWr58MXmBfjHcFGEKN2Cl0btnB0zQUD@lists.freedesktop.org
X-Received: by 2002:a05:6214:428e:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-88d881b984fmr478636136d6.63.1767045551438;
        Mon, 29 Dec 2025 13:59:11 -0800 (PST)
X-Received: by 2002:a05:6214:428e:b0:88a:3681:1d96 with SMTP id
 6a1803df08f44-88d881b984fmr478635666d6.63.1767045550918;
        Mon, 29 Dec 2025 13:59:10 -0800 (PST)
Received: from localhost.localdomain
 (pool-173-49-113-140.phlapa.fios.verizon.net. [173.49.113.140])
        by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-88d9759f164sm231530026d6.24.2025.12.29.13.59.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 29 Dec 2025 13:59:10 -0800 (PST)
From: Zack Rusin <zack.rusin@broadcom.com>
To: dri-devel@lists.freedesktop.org
Subject: [PATCH 00/12] Recover sysfb after DRM probe failure
Date: Mon, 29 Dec 2025 16:58:06 -0500
Message-ID: <20251229215906.3688205-1-zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
Message-ID-Hash: ENO6K44PIPE2FMR4WZY24FHI5FZ5MFIB
X-Message-ID-Hash: ENO6K44PIPE2FMR4WZY24FHI5FZ5MFIB
X-MailFrom: zack.rusin@broadcom.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
CC: Alex Deucher <alexander.deucher@amd.com>, amd-gfx@lists.freedesktop.org,
 Ard Biesheuvel <ardb@kernel.org>, Ce Sun <cesun102@amd.com>,
 Chia-I Wu <olvaffe@gmail.com>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Danilo Krummrich <dakr@kernel.org>, Dave Airlie <airlied@redhat.com>,
 Deepak Rawat <drawat.floss@gmail.com>,
 Dmitry Osipenko <dmitry.osipenko@collabora.com>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Gurchetan Singh <gurchetansingh@chromium.org>,
 Hans de Goede <hansg@kernel.org>, Hawking Zhang <Hawking.Zhang@amd.com>,
 Helge Deller <deller@gmx.de>, intel-gfx@lists.freedesktop.org,
 intel-xe@lists.freedesktop.org, Jani Nikula <jani.nikula@linux.intel.com>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Lijo Lazar <lijo.lazar@amd.com>, linux-efi@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hyperv@vger.kernel.org,
 linux-kernel@vger.kernel.org, Lucas De Marchi <lucas.demarchi@intel.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "Mario Limonciello (AMD)" <superm1@kernel.org>,
 Mario Limonciello <mario.limonciello@amd.com>,
 Maxime Ripard <mripard@kernel.org>, nouveau@lists.freedesktop.org,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, Simona Vetter <simona@ffwll.ch>,
 spice-devel@lists.freedesktop.org,
 =?UTF-8?q?Thomas=20Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>,
 =?UTF-8?q?Timur=20Krist=C3=B3f?= <timur.kristof@gmail.com>,
 Tvrtko Ursulin <tursulin@ursulin.net>, virtualization@lists.linux.dev,
 Vitaly Prosyak <vitaly.prosyak@amd.com>
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/ENO6K44PIPE2FMR4WZY24FHI5FZ5MFIB/>
Archived-At: 
 <https://lore.freedesktop.org/20251229215906.3688205-1-zack.rusin@broadcom.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Almost a rite of passage for every DRM developer and most Linux users
is upgrading your DRM driver/updating boot flags/changing some config
and having DRM driver fail at probe resulting in a blank screen.

Currently there's no way to recover from DRM driver probe failure. PCI
DRM driver explicitly throw out the existing sysfb to get exclusive
access to PCI resources so if the probe fails the system is left without
a functioning display driver.

Add code to sysfb to recever system framebuffer when DRM driver's probe
fails. This means that a DRM driver that fails to load reloads the system
framebuffer driver.

This works best with simpledrm. Without it Xorg won't recover because
it still tries to load the vendor specific driver which ends up usually
not working at all. With simpledrm the system recovers really nicely
ending up with a working console and not a blank screen.

There's a caveat in that some hardware might require some special magic
register write to recover EFI display. I'd appreciate it a lot if
maintainers could introduce a temporary failure in their drivers
probe to validate that the sysfb recovers and they get a working console.
The easiest way to double check it is by adding:
 /* XXX: Temporary failure to test sysfb restore - REMOVE BEFORE COMMIT */
 dev_info(&pdev->dev, "Testing sysfb restore: forcing probe failure\n");
 ret = -EINVAL;
 goto out_error;
or such right after the devm_aperture_remove_conflicting_pci_devices .

Cc: Alex Deucher <alexander.deucher@amd.com>
Cc: amd-gfx@lists.freedesktop.org
Cc: Ard Biesheuvel <ardb@kernel.org>
Cc: Ce Sun <cesun102@amd.com>
Cc: Chia-I Wu <olvaffe@gmail.com>
Cc: "Christian König" <christian.koenig@amd.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Dave Airlie <airlied@redhat.com>
Cc: Deepak Rawat <drawat.floss@gmail.com>
Cc: Dmitry Osipenko <dmitry.osipenko@collabora.com>
Cc: dri-devel@lists.freedesktop.org
Cc: Gerd Hoffmann <kraxel@redhat.com>
Cc: Gurchetan Singh <gurchetansingh@chromium.org>
Cc: Hans de Goede <hansg@kernel.org>
Cc: Hawking Zhang <Hawking.Zhang@amd.com>
Cc: Helge Deller <deller@gmx.de>
Cc: intel-gfx@lists.freedesktop.org
Cc: intel-xe@lists.freedesktop.org
Cc: Jani Nikula <jani.nikula@linux.intel.com>
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Joonas Lahtinen <joonas.lahtinen@linux.intel.com>
Cc: Lijo Lazar <lijo.lazar@amd.com>
Cc: linux-efi@vger.kernel.org
Cc: linux-fbdev@vger.kernel.org
Cc: linux-hyperv@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: Lyude Paul <lyude@redhat.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: "Mario Limonciello (AMD)" <superm1@kernel.org>
Cc: Mario Limonciello <mario.limonciello@amd.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: nouveau@lists.freedesktop.org
Cc: Rodrigo Vivi <rodrigo.vivi@intel.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: spice-devel@lists.freedesktop.org
Cc: "Thomas Hellström" <thomas.hellstrom@linux.intel.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: "Timur Kristóf" <timur.kristof@gmail.com>
Cc: Tvrtko Ursulin <tursulin@ursulin.net>
Cc: virtualization@lists.linux.dev
Cc: Vitaly Prosyak <vitaly.prosyak@amd.com>

Zack Rusin (12):
  video/aperture: Add sysfb restore on DRM probe failure
  drm/vmwgfx: Use devm aperture helpers for sysfb restore on probe
    failure
  drm/xe: Use devm aperture helpers for sysfb restore on probe failure
  drm/amdgpu: Use devm aperture helpers for sysfb restore on probe
    failure
  drm/virtio: Add sysfb restore on probe failure
  drm/nouveau: Use devm aperture helpers for sysfb restore on probe
    failure
  drm/qxl: Use devm aperture helpers for sysfb restore on probe failure
  drm/vboxvideo: Use devm aperture helpers for sysfb restore on probe
    failure
  drm/hyperv: Add sysfb restore on probe failure
  drm/ast: Use devm aperture helpers for sysfb restore on probe failure
  drm/radeon: Use devm aperture helpers for sysfb restore on probe
    failure
  drm/i915: Use devm aperture helpers for sysfb restore on probe failure

 drivers/firmware/efi/sysfb_efi.c           |   2 +-
 drivers/firmware/sysfb.c                   | 191 +++++++++++++--------
 drivers/firmware/sysfb_simplefb.c          |  10 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_device.c |   9 +-
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c    |   7 +
 drivers/gpu/drm/ast/ast_drv.c              |  13 +-
 drivers/gpu/drm/hyperv/hyperv_drm_drv.c    |  23 +++
 drivers/gpu/drm/i915/i915_driver.c         |  13 +-
 drivers/gpu/drm/nouveau/nouveau_drm.c      |  16 +-
 drivers/gpu/drm/qxl/qxl_drv.c              |  14 +-
 drivers/gpu/drm/radeon/radeon_drv.c        |  15 +-
 drivers/gpu/drm/vboxvideo/vbox_drv.c       |  13 +-
 drivers/gpu/drm/virtio/virtgpu_drv.c       |  29 ++++
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c        |  13 +-
 drivers/gpu/drm/xe/xe_device.c             |   7 +-
 drivers/gpu/drm/xe/xe_pci.c                |   7 +
 drivers/video/aperture.c                   |  54 ++++++
 include/linux/aperture.h                   |  14 ++
 include/linux/sysfb.h                      |   6 +
 19 files changed, 368 insertions(+), 88 deletions(-)

-- 
2.48.1

