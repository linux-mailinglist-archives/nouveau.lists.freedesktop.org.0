Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 36C895725FD
	for <lists+nouveau@lfdr.de>; Tue, 12 Jul 2022 21:41:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF4A964A7;
	Tue, 12 Jul 2022 19:41:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67CD8964BB
 for <nouveau@lists.freedesktop.org>; Tue, 12 Jul 2022 19:41:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1657654859;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=dzP8m0+OdxFl+RF9YZTli7Vf0c0whffJshQRMkWNm88=;
 b=gIRLzvAS5aebd2NtIYGW3Ehr/EzEOm3kFPngOcEbxhfTLL37WbNTXBqosX2lW+X11+HL1i
 JPq7M6DKY8yUZhIGvnrOBM7Mb8SXxLj9vujlFMYCI5eadB0o/NEII5cwXQmf4tjGOsy+o1
 +1B9rP481d0Mr5nAIYbmD7SoPduFY+w=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-612-YQIOoUAVPeiO--TSPvAhgA-1; Tue, 12 Jul 2022 15:40:47 -0400
X-MC-Unique: YQIOoUAVPeiO--TSPvAhgA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com
 [10.11.54.2])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id E62CB101A589;
 Tue, 12 Jul 2022 19:40:46 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.30])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 4463540E80E0;
 Tue, 12 Jul 2022 19:40:43 +0000 (UTC)
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
Date: Tue, 12 Jul 2022 21:39:02 +0200
Message-Id: <20220712193910.439171-22-hdegoede@redhat.com>
In-Reply-To: <20220712193910.439171-1-hdegoede@redhat.com>
References: <20220712193910.439171-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.84 on 10.11.54.2
Subject: [Nouveau] [PATCH v2 21/29] platform/x86: asus-wmi: Drop DMI
 chassis-type check from backlight handling
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

Remove this check from the asus-wmi backlight handling:

	/* Some Asus desktop boards export an acpi-video backlight interface,
	   stop this from showing up */
	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
	if (chassis_type && !strcmp(chassis_type, "3"))
		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);

This acpi_video_set_dmi_backlight_type(acpi_backlight_vendor) call must be
removed because other changes in this series change the native backlight
drivers to no longer unconditionally register their backlight. Instead
these drivers now do this check:

        if (acpi_video_get_backlight_type(false) != acpi_backlight_native)
                return 0; /* bail */

So leaving this in place can break things on laptops with a broken
DMI chassis-type, which would have GPU native brightness control before
the addition of the acpi_video_get_backlight_type() != native check.

Removing this should be ok now, since the ACPI video code has improved
heuristics for this itself now (which includes a chassis-type check).

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/platform/x86/asus-wmi.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/platform/x86/asus-wmi.c b/drivers/platform/x86/asus-wmi.c
index 62ce198a3463..9dab0998cd20 100644
--- a/drivers/platform/x86/asus-wmi.c
+++ b/drivers/platform/x86/asus-wmi.c
@@ -3528,7 +3528,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	struct platform_driver *pdrv = to_platform_driver(pdev->dev.driver);
 	struct asus_wmi_driver *wdrv = to_asus_wmi_driver(pdrv);
 	struct asus_wmi *asus;
-	const char *chassis_type;
 	acpi_status status;
 	int err;
 	u32 result;
@@ -3610,12 +3609,6 @@ static int asus_wmi_add(struct platform_device *pdev)
 	if (asus->driver->quirks->wmi_force_als_set)
 		asus_wmi_set_als();
 
-	/* Some Asus desktop boards export an acpi-video backlight interface,
-	   stop this from showing up */
-	chassis_type = dmi_get_system_info(DMI_CHASSIS_TYPE);
-	if (chassis_type && !strcmp(chassis_type, "3"))
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-
 	if (asus->driver->quirks->wmi_backlight_power)
 		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
 
-- 
2.36.0

