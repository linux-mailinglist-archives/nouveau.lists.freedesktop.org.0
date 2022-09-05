Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 08BCF5ACDE8
	for <lists+nouveau@lfdr.de>; Mon,  5 Sep 2022 10:36:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7FF010E219;
	Mon,  5 Sep 2022 08:36:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 690ED10E20C
 for <nouveau@lists.freedesktop.org>; Mon,  5 Sep 2022 08:35:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1662366954;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=FKWvK74RqhWO5Ba3E7ZgA5XXRtVg9Ah/YW25Q16K5a0=;
 b=W03J9ypy1ohup2A993P5R7LtK4QE6RpB7mVKXX7OqKqXCzuQp/RbGvI1TRXmPyadLfmNA6
 wMGsJ8vwYVb0yiTAEj063xLmRljOKZlqed7+CKoyQsRENxecOKZ+g3Upo7JZTiRVWyN/Do
 hjffQC+rUeUiwWjGBdQdhMByfEEfnkg=
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com
 [209.85.208.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-546-38Aj6dKiOgqWbq-RcmP7Pw-1; Mon, 05 Sep 2022 04:35:50 -0400
X-MC-Unique: 38Aj6dKiOgqWbq-RcmP7Pw-1
Received: by mail-ed1-f72.google.com with SMTP id
 c14-20020a05640227ce00b0043e5df12e2cso5443026ede.15
 for <nouveau@lists.freedesktop.org>; Mon, 05 Sep 2022 01:35:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:content-language:cc:to:subject:from
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date;
 bh=FKWvK74RqhWO5Ba3E7ZgA5XXRtVg9Ah/YW25Q16K5a0=;
 b=YebZFxihp0DShk2o6yfZwVXGL/s3DJkEtAS3VcnNIuh30Z8FMWVQoFAgjULUNmiYub
 t4WTZr1/hCUykH3tlR/jYbTflZa55E8qzSw/IAPDiCE/Pmvl4xHJMm+EtnUaMjUAEwB+
 roIBRZz7zVZPQGy78Q3Wnd02lhDvPsnHyOQmoJvpc/o8xdXDXawPzXd7HBDlKQSUb8zi
 7IosToHAYX5PantXA1QoL7S3zDfnyzDTQxY97TuMLBFhwXkIq+lvp2JdA2xdPXMGHMul
 09C5j2n0WDPEqwmC63/Is0gvJquhXCOx9l9k/PMgbZVyu60+1Omqh5sGJo9zrTVN/irV
 rp1Q==
X-Gm-Message-State: ACgBeo21OyRcEtwmEz7JiYOcaiuGaZtjbLG/JJKrfm/bFCUpppMXahaX
 RAV7MIgVd79s49FORTHpKGUo48veVZx6NMa/ZJxMvG7eMEAnmUXryB+l/kInrGLR75N0jCpm4fV
 Q5NupPYFU1dCIu1Qsx9F5+rViFg==
X-Received: by 2002:a05:6402:f92:b0:44e:84e0:1d2a with SMTP id
 eh18-20020a0564020f9200b0044e84e01d2amr3153082edb.395.1662366949057; 
 Mon, 05 Sep 2022 01:35:49 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4VBNuR9PQ8/ymdedcVLZvd83Z5BrbBJNdtbcbD4W3JQHoyQWf8ni6TYgJ7xy7xpT4yxIFbjA==
X-Received: by 2002:a05:6402:f92:b0:44e:84e0:1d2a with SMTP id
 eh18-20020a0564020f9200b0044e84e01d2amr3153055edb.395.1662366948816; 
 Mon, 05 Sep 2022 01:35:48 -0700 (PDT)
Received: from [10.40.98.142] ([78.108.130.194])
 by smtp.gmail.com with ESMTPSA id
 ee35-20020a056402292300b0044dde9244fdsm3162245edb.8.2022.09.05.01.35.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 Sep 2022 01:35:48 -0700 (PDT)
Message-ID: <261afe3d-7790-e945-adf6-a2c96c9b1eff@redhat.com>
Date: Mon, 5 Sep 2022 10:35:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.10.0
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude <lyude@redhat.com>, Daniel Dadap <ddadap@nvidia.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Xinhui <Xinhui.Pan@amd.com>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
 Andy Shevchenko <andy@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] [GIT PULL] Immutable backlight-detect-refactor branch
 between acpi, drm-* and pdx86
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
Cc: linux-acpi@vger.kernel.org, nouveau@lists.freedesktop.org,
 intel-gfx <intel-gfx@lists.freedesktop.org>, dri-devel@lists.freedesktop.org,
 platform-driver-x86@vger.kernel.org, Hans de Goede <hdegoede@redhat.com>,
 amd-gfx@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi All,

Now that all patches have been reviewed/acked here is an immutable backlight-detect-refactor
branch with 6.0-rc1 + the v5 patch-set, for merging into the relevant (acpi, drm-* and pdx86)
subsystems.

Please pull this branch into the relevant subsystems.

I will merge this into the review-hans branch of the pdx86 git tree today and
from there it will move to for-next once the builders have successfully build-tested
the merge.

Regards,

Hans


The following changes since commit 568035b01cfb107af8d2e4bd2fb9aea22cf5b868:

  Linux 6.0-rc1 (2022-08-14 15:50:18 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git tags/backlight-detect-refactor-1

for you to fetch changes up to 4f96b1bc156e7076f6efedc2a76a8c7e897c7977:

  drm/todo: Add entry about dealing with brightness control on devices with > 1 panel (2022-09-03 12:17:27 +0200)

----------------------------------------------------------------
Immutable backlight-detect-refactor branch between acpi, drm-* and pdx86

Tag (immutable branch) with v6.0-rc1 + the (acpi/x86) backlight
detect refactor work. For merging into the acpi, drm-* and pdx86
subsystems.

----------------------------------------------------------------
Hans de Goede (31):
      ACPI: video: Add acpi_video_backlight_use_native() helper
      drm/i915: Don't register backlight when another backlight should be used (v2)
      drm/amdgpu: Don't register backlight when another backlight should be used (v3)
      drm/radeon: Don't register backlight when another backlight should be used (v3)
      drm/nouveau: Don't register backlight when another backlight should be used (v2)
      ACPI: video: Drop backlight_device_get_by_type() call from acpi_video_get_backlight_type()
      ACPI: video: Remove acpi_video_bus from list before tearing it down
      ACPI: video: Simplify acpi_video_unregister_backlight()
      ACPI: video: Make backlight class device registration a separate step (v2)
      ACPI: video: Remove code to unregister acpi_video backlight when a native backlight registers
      drm/i915: Call acpi_video_register_backlight() (v3)
      drm/nouveau: Register ACPI video backlight when nv_backlight registration fails (v2)
      drm/amdgpu: Register ACPI video backlight when skipping amdgpu backlight registration
      drm/radeon: Register ACPI video backlight when skipping radeon backlight registration
      platform/x86: nvidia-wmi-ec-backlight: Move fw interface definitions to a header (v2)
      ACPI: video: Refactor acpi_video_get_backlight_type() a bit
      ACPI: video: Add Nvidia WMI EC brightness control detection (v3)
      ACPI: video: Add Apple GMUX brightness control detection
      platform/x86: nvidia-wmi-ec-backlight: Use acpi_video_get_backlight_type()
      platform/x86: apple-gmux: Stop calling acpi/video.h functions
      platform/x86: toshiba_acpi: Stop using acpi_video_set_dmi_backlight_type()
      platform/x86: acer-wmi: Move backlight DMI quirks to acpi/video_detect.c
      platform/x86: asus-wmi: Drop DMI chassis-type check from backlight handling
      platform/x86: asus-wmi: Move acpi_backlight=vendor quirks to ACPI video_detect.c
      platform/x86: asus-wmi: Move acpi_backlight=native quirks to ACPI video_detect.c
      platform/x86: samsung-laptop: Move acpi_backlight=[vendor|native] quirks to ACPI video_detect.c
      ACPI: video: Remove acpi_video_set_dmi_backlight_type()
      ACPI: video: Drop "Samsung X360" acpi_backlight=native quirk
      ACPI: video: Drop NL5x?U, PF4NU1F and PF5?U?? acpi_backlight=native quirks
      ACPI: video: Fix indentation of video_detect_dmi_table[] entries
      drm/todo: Add entry about dealing with brightness control on devices with > 1 panel

 Documentation/gpu/todo.rst                         |  68 ++++
 MAINTAINERS                                        |   1 +
 drivers/acpi/Kconfig                               |   1 +
 drivers/acpi/acpi_video.c                          |  64 ++-
 drivers/acpi/video_detect.c                        | 428 ++++++++++++---------
 drivers/gpu/drm/Kconfig                            |  14 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c     |  14 +-
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c  |   9 +
 drivers/gpu/drm/gma500/Kconfig                     |   2 +
 drivers/gpu/drm/i915/Kconfig                       |   2 +
 drivers/gpu/drm/i915/display/intel_acpi.c          |  27 ++
 drivers/gpu/drm/i915/display/intel_acpi.h          |   3 +
 drivers/gpu/drm/i915/display/intel_backlight.c     |   7 +
 drivers/gpu/drm/i915/display/intel_display.c       |   2 +-
 drivers/gpu/drm/nouveau/nouveau_acpi.c             |  10 +
 drivers/gpu/drm/nouveau/nouveau_acpi.h             |   4 +
 drivers/gpu/drm/nouveau/nouveau_backlight.c        |  13 +
 drivers/gpu/drm/radeon/atombios_encoders.c         |   7 +
 drivers/gpu/drm/radeon/radeon_encoders.c           |  11 +-
 drivers/gpu/drm/radeon/radeon_legacy_encoders.c    |   7 +
 drivers/platform/x86/Kconfig                       |   1 +
 drivers/platform/x86/acer-wmi.c                    |  66 ----
 drivers/platform/x86/apple-gmux.c                  |   3 -
 drivers/platform/x86/asus-nb-wmi.c                 |  21 -
 drivers/platform/x86/asus-wmi.c                    |  13 -
 drivers/platform/x86/asus-wmi.h                    |   2 -
 drivers/platform/x86/eeepc-wmi.c                   |  25 +-
 drivers/platform/x86/nvidia-wmi-ec-backlight.c     |  82 +---
 drivers/platform/x86/samsung-laptop.c              |  87 -----
 drivers/platform/x86/toshiba_acpi.c                |  16 -
 include/acpi/video.h                               |   9 +-
 .../platform_data/x86/nvidia-wmi-ec-backlight.h    |  76 ++++
 32 files changed, 588 insertions(+), 507 deletions(-)
 create mode 100644 include/linux/platform_data/x86/nvidia-wmi-ec-backlight.h

