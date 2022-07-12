Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF9D15725C4
	for <lists+nouveau@lfdr.de>; Tue, 12 Jul 2022 21:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08E4996444;
	Tue, 12 Jul 2022 19:39:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E364C9644A
 for <nouveau@lists.freedesktop.org>; Tue, 12 Jul 2022 19:39:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654792;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EOdZWfJ0s00LfG3ihwHm2AlZ5TsRZCM/ycawztBlr3E=;
 b=EgRNYyMl64tcACZRby+PPvRUrxdYus4/oaRR3d7Bqw26Bo+8mzVjAM6ljhObD9aMbC4Oz0
 XzDh66kwOWqk95x/cHKTcy9bLPBJcfXjoTMazzS6GJCgewgDZNjvkw/2ISAxelMCCgDQCn
 eIwPpbmR+GBzeOQuSd0WS+7ugPG+17o=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-310-rzdjylmQOoOwRSXtRbcvfA-1; Tue, 12 Jul 2022 15:39:42 -0400
X-MC-Unique: rzdjylmQOoOwRSXtRbcvfA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B8D9C805AF5;
 Tue, 12 Jul 2022 19:39:41 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id EA23D40E80E1;
 Tue, 12 Jul 2022 19:39:36 +0000 (UTC)
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
	Lukas Wunner <lukas@wunner.de>, Mark Gross <markgross@kernel.org>,
	Andy Shevchenko <andy@kernel.org>
Date: Tue, 12 Jul 2022 21:38:46 +0200
Message-Id: <20220712193910.439171-6-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-1-hdegoede@redhat.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Nouveau] [PATCH v2 05/29] drm/nouveau: Don't register backlight
 when another backlight should be used
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

Reviewed-by: Lyude Paul <lyude@redhat.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/gpu/drm/nouveau/nouveau_backlight.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nouveau_backlight.c b/drivers/gpu/drm/nouveau/nouveau_backlight.c
index a2141d3d9b1d..91c504c7b82c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_backlight.c
+++ b/drivers/gpu/drm/nouveau/nouveau_backlight.c
@@ -34,6 +34,8 @@
 #include <linux/backlight.h>
 #include <linux/idr.h>
 
+#include <acpi/video.h>
+
 #include "nouveau_drv.h"
 #include "nouveau_reg.h"
 #include "nouveau_encoder.h"
@@ -405,6 +407,11 @@ nouveau_backlight_init(struct drm_connector *connector)
 		goto fail_alloc;
 	}
 
+	if (!acpi_video_backlight_use_native()) {
+		NV_INFO(drm, "Skipping nv_backlight registration\n");
+		goto fail_alloc;
+	}
+
 	if (!nouveau_get_backlight_name(backlight_name, bl)) {
 		NV_ERROR(drm, "Failed to retrieve a unique name for the backlight interface\n");
 		goto fail_alloc;
-- 
2.36.0

