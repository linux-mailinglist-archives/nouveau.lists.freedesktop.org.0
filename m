Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1036C5A01D3
	for <lists+nouveau@lfdr.de>; Wed, 24 Aug 2022 21:13:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32DEDC35A5;
	Wed, 24 Aug 2022 19:12:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9418B10E970
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 18:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3phrIYfyXSPAlAieQwX3BjY7MsP4c4tlCKy3HCMlajo=;
 b=cRCdW2DwlP+LqPBeco9109HwzhEraTfBAzig6Dp0XyMU+8lBTAckYCqvEq3ji5R0LYhAmj
 ykdpixyeFYABetN+WKzu7p6QNjrUFjQyYSvOTCmlhgj6yVxM6cYS/+Xv8+MSnYrex0QW2O
 BCBh54ljiK0+IKAMrZin5r2Vup0Wtvk=
Received: from mimecast-mx02.redhat.com (mx3-rdu2.redhat.com
 [66.187.233.73]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-147-r-gKo4i9PdyqahinY1YINg-1; Thu, 18 Aug 2022 14:44:43 -0400
X-MC-Unique: r-gKo4i9PdyqahinY1YINg-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 396E93815D2A;
 Thu, 18 Aug 2022 18:44:42 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id 79F03492C3B;
 Thu, 18 Aug 2022 18:44:38 +0000 (UTC)
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
Date: Thu, 18 Aug 2022 20:42:53 +0200
Message-Id: <20220818184302.10051-23-hdegoede@redhat.com>
In-Reply-To: <20220818184302.10051-1-hdegoede@redhat.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Nouveau] [PATCH v3 22/31] platform/x86: acer-wmi: Move backlight
 DMI quirks to acpi/video_detect.c
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
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Hans de Goede <hdegoede@redhat.com>, amd-gfx@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Move the backlight DMI quirks to acpi/video_detect.c, so that
the driver no longer needs to call acpi_video_set_dmi_backlight_type().

acpi_video_set_dmi_backlight_type() is troublesome because it may end up
getting called after other backlight drivers have already called
acpi_video_get_backlight_type() resulting in the other drivers
already being registered even though they should not.

Note that even though the DMI quirk table name was video_vendor_dmi_table,
5/6 quirks were actually quirks to use the GPU native backlight.

These 5 quirks also had a callback in their dmi_system_id entry which
disabled the acer-wmi vendor driver; and any DMI match resulted in:

	acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);

which disabled the acpi_video driver, so only the native driver was left.
The new entries for these 5/6 devices correctly marks these as needing
the native backlight driver.

Also note that other changes in this series change the native backlight
drivers to no longer unconditionally register their backlight. Instead
these drivers now do this check:

	if (acpi_video_get_backlight_type(false) != acpi_backlight_native)
		return 0; /* bail */

which without this patch would have broken these 5/6 "special" quirks.

Since I had to look at all the commits adding the quirks anyways, to make
sure that I understood the code correctly, I've also added links to
the various original bugzillas for these quirks to the new entries.

Acked-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 drivers/acpi/video_detect.c     | 53 ++++++++++++++++++++++++++
 drivers/platform/x86/acer-wmi.c | 66 ---------------------------------
 2 files changed, 53 insertions(+), 66 deletions(-)

diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
index 891138d47def..4545f9f1a5b1 100644
--- a/drivers/acpi/video_detect.c
+++ b/drivers/acpi/video_detect.c
@@ -149,6 +149,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "X360"),
 		},
 	},
+	{
+	 /* https://bugzilla.redhat.com/show_bug.cgi?id=1128309 */
+	 .callback = video_detect_force_vendor,
+	 /* Acer KAV80 */
+	 .matches = {
+		DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
+		},
+	},
 	{
 	.callback = video_detect_force_vendor,
 	/* Asus UL30VT */
@@ -437,6 +446,41 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "JV50"),
 		},
 	},
+	{
+	 /* https://bugzilla.redhat.com/show_bug.cgi?id=1012674 */
+	 .callback = video_detect_force_native,
+	 /* Acer Aspire 5741 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
+		},
+	},
+	{
+	 /* https://bugzilla.kernel.org/show_bug.cgi?id=42993 */
+	 .callback = video_detect_force_native,
+	 /* Acer Aspire 5750 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
+		},
+	},
+	{
+	 /* https://bugzilla.kernel.org/show_bug.cgi?id=42833 */
+	 .callback = video_detect_force_native,
+	 /* Acer Extensa 5235 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
+		},
+	},
+	{
+	 .callback = video_detect_force_native,
+	 /* Acer TravelMate 4750 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
+		},
+	},
 	{
 	 /* https://bugzilla.kernel.org/show_bug.cgi?id=207835 */
 	 .callback = video_detect_force_native,
@@ -447,6 +491,15 @@ static const struct dmi_system_id video_detect_dmi_table[] = {
 		DMI_MATCH(DMI_BOARD_NAME, "BA51_MV"),
 		},
 	},
+	{
+	 /* https://bugzilla.kernel.org/show_bug.cgi?id=36322 */
+	 .callback = video_detect_force_native,
+	 /* Acer TravelMate 5760 */
+	 .matches = {
+		DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
+		DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
+		},
+	},
 	{
 	.callback = video_detect_force_native,
 	/* ASUSTeK COMPUTER INC. GA401 */
diff --git a/drivers/platform/x86/acer-wmi.c b/drivers/platform/x86/acer-wmi.c
index e0230ea0cb7e..b933a5165edb 100644
--- a/drivers/platform/x86/acer-wmi.c
+++ b/drivers/platform/x86/acer-wmi.c
@@ -643,69 +643,6 @@ static const struct dmi_system_id non_acer_quirks[] __initconst = {
 	{}
 };
 
-static int __init
-video_set_backlight_video_vendor(const struct dmi_system_id *d)
-{
-	interface->capability &= ~ACER_CAP_BRIGHTNESS;
-	pr_info("Brightness must be controlled by generic video driver\n");
-	return 0;
-}
-
-static const struct dmi_system_id video_vendor_dmi_table[] __initconst = {
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer TravelMate 4750",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 4750"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer Extensa 5235",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Extensa 5235"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer TravelMate 5760",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "TravelMate 5760"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer Aspire 5750",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5750"),
-		},
-	},
-	{
-		.callback = video_set_backlight_video_vendor,
-		.ident = "Acer Aspire 5741",
-		.matches = {
-			DMI_MATCH(DMI_BOARD_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "Aspire 5741"),
-		},
-	},
-	{
-		/*
-		 * Note no video_set_backlight_video_vendor, we must use the
-		 * acer interface, as there is no native backlight interface.
-		 */
-		.ident = "Acer KAV80",
-		.matches = {
-			DMI_MATCH(DMI_SYS_VENDOR, "Acer"),
-			DMI_MATCH(DMI_PRODUCT_NAME, "KAV80"),
-		},
-	},
-	{}
-};
-
 /* Find which quirks are needed for a particular vendor/ model pair */
 static void __init find_quirks(void)
 {
@@ -2477,9 +2414,6 @@ static int __init acer_wmi_init(void)
 
 	set_quirks();
 
-	if (dmi_check_system(video_vendor_dmi_table))
-		acpi_video_set_dmi_backlight_type(acpi_backlight_vendor);
-
 	if (acpi_video_get_backlight_type() != acpi_backlight_vendor)
 		interface->capability &= ~ACER_CAP_BRIGHTNESS;
 
-- 
2.37.2

