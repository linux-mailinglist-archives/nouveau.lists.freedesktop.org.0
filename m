Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E88EB4464E0
	for <lists+nouveau@lfdr.de>; Fri,  5 Nov 2021 15:25:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7F9676E912;
	Fri,  5 Nov 2021 14:25:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5683F6F89B
 for <nouveau@lists.freedesktop.org>; Thu,  4 Nov 2021 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1636042046;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=n/ejIrVb3rZrH44A2zViksmvIEiiBszGsTbTQyQjoKs=;
 b=hsDF9tJ9qoT6srxTuTvAMe2Qwg0BtWKJgkuKLTKcjAJ2GC3bY1IU8SqPb9al6Ve4d8YJn0
 Gu4gUe7bO6TzxiQbu2e1j6EYZ1lSEy3OKeiXsETr5LR781bBlgrWuTgOubjwlZTuSMJugz
 81fy1iW51cIrz9vj548MMHHJDpX4HZM=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-513-SmKuV3_MM2eG33cXSzgM0g-1; Thu, 04 Nov 2021 12:07:22 -0400
X-MC-Unique: SmKuV3_MM2eG33cXSzgM0g-1
Received: by mail-wm1-f70.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so2719506wmj.9
 for <nouveau@lists.freedesktop.org>; Thu, 04 Nov 2021 09:07:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=n/ejIrVb3rZrH44A2zViksmvIEiiBszGsTbTQyQjoKs=;
 b=C6C/KiS0CA4LI38bQnv0F6YxXyuCxf2DkzvfOOEs/eyqKxUBqWK4Io48LnEUtQWn8t
 fxEoXUcS7X/QZSygcjojY8wLo1uqAsc044+a6JMZpGuM1AqVFX2Na50dXaAuOCQmPEer
 wSMwVuPT5bl+dKgbWsFhWqAIOSjHPzN/AltQJNrMh31Tns9ECjSGFpnhGflp6csV/EWd
 av8d1TAeu5pS8/3gdCqyV/nDfIISFpchliaNz5wxE7sL//G34WPBwMr76NdqoLcBkqyc
 kkWDsx0nzJ8RtUyYQhMCiOQRf+mGk8yBzPRadqDnOYc7YiDttGkXen7UC5s53wtcCGHJ
 K4Fw==
X-Gm-Message-State: AOAM532LMaR/YsNkwI1Uuc1JLmk1fbrpf1CcKrzCDIBBbpmkk5Y7xQmR
 x2Z5pEJMUpgZfrmrEuhEnmtcFoJlOft5qw2Vn76FL67DYoSdIuJSEfDzX2ZEIiQhr/27kQMhMRk
 siTPALgGItne6GhjA4syhwcFKsw==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr23689901wml.100.1636042041574; 
 Thu, 04 Nov 2021 09:07:21 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwxQs3q9Q2yGgJQmZ5zypW+OBIyfR4YAS74a/Zv3Ucv5aomcisjC91zz+w+lhZHPPKLJjXLiw==
X-Received: by 2002:a7b:ca44:: with SMTP id m4mr23689832wml.100.1636042041250; 
 Thu, 04 Nov 2021 09:07:21 -0700 (PDT)
Received: from minerva.home ([92.176.231.106])
 by smtp.gmail.com with ESMTPSA id l18sm5877863wrt.81.2021.11.04.09.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 09:07:20 -0700 (PDT)
From: Javier Martinez Canillas <javierm@redhat.com>
To: linux-kernel@vger.kernel.org
Date: Thu,  4 Nov 2021 17:07:05 +0100
Message-Id: <20211104160707.1407052-1-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=javierm@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Fri, 05 Nov 2021 14:25:38 +0000
Subject: [Nouveau] [PATCH v2 0/2] Cleanups for the nomodeset kernel command
 line parameter logic
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
Cc: linux-fbdev@vger.kernel.org, David Airlie <airlied@linux.ie>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, Gurchetan Singh <gurchetansingh@chromium.org>,
 Gerd Hoffmann <kraxel@redhat.com>,
 Javier Martinez Canillas <javierm@redhat.com>, amd-gfx@lists.freedesktop.org,
 VMware Graphics <linux-graphics-maintainer@vmware.com>,
 Peter Robinson <pbrobinson@gmail.com>, nouveau@lists.freedesktop.org,
 Dave Airlie <airlied@redhat.com>, Chia-I Wu <olvaffe@gmail.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 =?UTF-8?q?Michel=20D=C3=A4nzer?= <michel@daenzer.net>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Hans de Goede <hdegoede@redhat.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 virtualization@lists.linux-foundation.org,
 Pekka Paalanen <pekka.paalanen@collabora.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, spice-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 intel-gfx@lists.freedesktop.org,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
 Zack Rusin <zackr@vmware.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

There is a lot of historical baggage on this parameter. It is defined in
the vgacon driver as nomodeset, but its set function is called text_mode()
and the value queried with a function named vgacon_text_force().

All this implies that it's about forcing text mode for VGA, yet it is not
used in neither vgacon nor other console driver. The only users for these
are DRM drivers, that check for the vgacon_text_force() return value to
determine whether the driver should be loaded or not.

That makes it quite confusing to read the code, because the variables and
function names don't reflect what they actually do and also are not in the
same subsystem as the drivers that make use of them.

This patch-set attempts to cleanup the code by moving the nomodseset param
to the DRM subsystem and do some renaming to make their intention clearer.

There is also another aspect that could be improved, and is the fact that
drivers are checking for the nomodeset being set as an indication if have
to be loaded.

But there may be other reasons why this could be the case, so it is better
to encapsulate the logic in a separate function to make clear what's about.

This is a v2 of the patches, that address the issues pointed out by Thomas
Zimmermann and Jani Nikula in v1:

https://lore.kernel.org/lkml/5b4e4534-4786-d231-e331-78fdb5d8496a@redhat.com/T/

Patch #1 adds a drm_drv_enabled() function that could be used by drivers to
check if these could be enabled, instead of just using vgacon_text_force().

Patch #2 moves the nomodeset logic to the DRM subsystem and renames the
functions and variables to better explain what these actually do.

Changes in v2:
- Squash patch to add drm_drv_enabled() and make drivers use it.
- Make the drivers changes before moving nomodeset logic to DRM.
- Make drm_drv_enabled() return an errno and -ENODEV if nomodeset.
- Remove debug and error messages in drivers.
- Conditionally build drm_nomodeset.o if CONFIG_VGA_CONSOLE is set.
- Squash patches to move nomodeset logic to DRM and do the renaming.
- Name the function drm_check_modeset() and make it return -ENODEV.

Javier Martinez Canillas (2):
  drm: Add a drm_drv_enabled() to check if drivers should be enabled
  drm: Move nomodeset kernel parameter to the DRM subsystem

 drivers/gpu/drm/Makefile                |  2 ++
 drivers/gpu/drm/amd/amdgpu/amdgpu_drv.c |  8 +++-----
 drivers/gpu/drm/ast/ast_drv.c           |  8 +++++---
 drivers/gpu/drm/drm_drv.c               | 21 ++++++++++++++++++++
 drivers/gpu/drm/drm_nomodeset.c         | 26 +++++++++++++++++++++++++
 drivers/gpu/drm/i915/i915_module.c      |  8 +++++---
 drivers/gpu/drm/mgag200/mgag200_drv.c   |  8 +++++---
 drivers/gpu/drm/nouveau/nouveau_drm.c   |  6 ++++--
 drivers/gpu/drm/qxl/qxl_drv.c           |  8 +++++---
 drivers/gpu/drm/radeon/radeon_drv.c     |  7 ++++---
 drivers/gpu/drm/tiny/bochs.c            |  8 +++++---
 drivers/gpu/drm/tiny/cirrus.c           |  9 ++++++---
 drivers/gpu/drm/vboxvideo/vbox_drv.c    | 10 +++++-----
 drivers/gpu/drm/virtio/virtgpu_drv.c    |  6 +++---
 drivers/gpu/drm/vmwgfx/vmwgfx_drv.c     |  6 +++---
 drivers/video/console/vgacon.c          | 21 --------------------
 include/drm/drm_drv.h                   |  1 +
 include/drm/drm_mode_config.h           |  6 ++++++
 include/linux/console.h                 |  6 ------
 19 files changed, 109 insertions(+), 66 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_nomodeset.c

-- 
2.33.1

