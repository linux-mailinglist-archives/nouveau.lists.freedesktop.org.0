Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10DC152A62E
	for <lists+nouveau@lfdr.de>; Tue, 17 May 2022 17:24:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B601B11206D;
	Tue, 17 May 2022 15:23:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BDECF112B7F
 for <nouveau@lists.freedesktop.org>; Tue, 17 May 2022 15:23:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652801035;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=nrgaigmhtT/c3yNhuGBcztXKchf7HdgOC/zOZ1F01Vw=;
 b=VDwnzCgYmBLy7Hh0gAS8Wwn7C3EPGPq6VpATo/JdCqn0RAqCK4Eg6psWTcVNu+P/P8sid8
 I0gAVpsL4+CgmRjOf3GroVbNivCaZu0Zk+CdcYPkY7pO4FrOo+nULWSIlUkPPU9aUc/Trb
 VLAr2/pvBlj3jhlHJmS5BYBMdRqW9fk=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-596-m8jAcUa4PfG3b5nOVxKb1g-1; Tue, 17 May 2022 11:23:52 -0400
X-MC-Unique: m8jAcUa4PfG3b5nOVxKb1g-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com
 [10.11.54.8])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B0AD10665A4;
 Tue, 17 May 2022 15:23:51 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.162])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 03F98C15D70;
 Tue, 17 May 2022 15:23:47 +0000 (UTC)
From: Hans de Goede <hdegoede@redhat.com>
To: Ben Skeggs <bskeggs@redhat.com>,
	Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>,
	Daniel Dadap <ddadap@nvidia.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
	Rodrigo Vivi <rodrigo.vivi@intel.com>,
	Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>,
	Alex Deucher <alexander.deucher@amd.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Pan@freedesktop.org, Xinhui <Xinhui.Pan@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Mika Westerberg <mika.westerberg@linux.intel.com>,
	Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 17 May 2022 17:23:20 +0200
Message-Id: <20220517152331.16217-4-hdegoede@redhat.com>
In-Reply-To: <20220517152331.16217-1-hdegoede@redhat.com>
References: <20220517152331.16217-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.8
Subject: [Nouveau] [PATCH 03/14] drm/amdgpu: Don't register backlight when
 another backlight should be used
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
Cc: linux-acpi@vger.kernel.org, David Airlie <airlied@linux.ie>,
 nouveau@lists.freedesktop.org, intel-gfx <intel-gfx@lists.freedesktop.org>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Before this commit when we want userspace to use the acpi_video backlight
device we register both the GPU's native backlight device and acpi_video's
firmware acpi_video# backlight device. This relies on userspace preferring
firmware type backlight devices over native ones.

Registering 2 backlight devices for a single display really is
undesirable, don't register the GPU's native backlight device when
another backlight device should be used.

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/Kconfig                           | 1 +
 drivers/gpu/drm/amd/amdgpu/atombios_encoders.c    | 7 +++++++
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 7 +++++++
 3 files changed, 15 insertions(+)

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index f1422bee3dcc..ddbeb2124df7 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -280,6 +280,7 @@ config DRM_AMDGPU
 	select HWMON
 	select BACKLIGHT_CLASS_DEVICE
 	select INTERVAL_TREE
+	select ACPI_VIDEO if ACPI && X86 && INPUT
 	help
 	  Choose this option if you have a recent AMD Radeon graphics card.
 
diff --git a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
index a92d86e12718..f9c62cd84a18 100644
--- a/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
+++ b/drivers/gpu/drm/amd/amdgpu/atombios_encoders.c
@@ -26,6 +26,8 @@
 
 #include <linux/pci.h>
 
+#include <acpi/video.h>
+
 #include <drm/drm_crtc_helper.h>
 #include <drm/amdgpu_drm.h>
 #include "amdgpu.h"
@@ -186,6 +188,11 @@ void amdgpu_atombios_encoder_init_backlight(struct amdgpu_encoder *amdgpu_encode
 	if (!(adev->mode_info.firmware_flags & ATOM_BIOS_INFO_BL_CONTROLLED_BY_GPU))
 		return;
 
+	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
+		DRM_INFO("Skipping amdgpu atom DIG backlight registration\n");
+		return;
+	}
+
 	pdata = kmalloc(sizeof(struct amdgpu_backlight_privdata), GFP_KERNEL);
 	if (!pdata) {
 		DRM_ERROR("Memory allocation failed\n");
diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 62139ff35476..a838c7b5d942 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -83,6 +83,8 @@
 #include <drm/drm_vblank.h>
 #include <drm/drm_audio_component.h>
 
+#include <acpi/video.h>
+
 #if defined(CONFIG_DRM_AMD_DC_DCN)
 #include "ivsrcid/dcn/irqsrcs_dcn_1_0.h"
 
@@ -4079,6 +4081,11 @@ amdgpu_dm_register_backlight_device(struct amdgpu_display_manager *dm)
 	amdgpu_dm_update_backlight_caps(dm, dm->num_of_edps);
 	dm->brightness[dm->num_of_edps] = AMDGPU_MAX_BL_LEVEL;
 
+	if (acpi_video_get_backlight_type(true) != acpi_backlight_native) {
+		DRM_INFO("Skipping amdgpu DM backlight registration\n");
+		return;
+	}
+
 	props.max_brightness = AMDGPU_MAX_BL_LEVEL;
 	props.brightness = AMDGPU_MAX_BL_LEVEL;
 	props.type = BACKLIGHT_RAW;
-- 
2.36.0

