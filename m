Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F3341598BF1
	for <lists+nouveau@lfdr.de>; Thu, 18 Aug 2022 20:47:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18E7D10F118;
	Thu, 18 Aug 2022 18:45:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C664810EF56
 for <nouveau@lists.freedesktop.org>; Thu, 18 Aug 2022 18:45:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660848323;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=3SH44BXwktH40KCcDZ9+emR32b1FaNxTyVmnyphrNZ0=;
 b=CTIIk3h3TqDklhMo7iaZ79QwH3QTzilYexsgsJzFRdcU5bwxsqXnUx15/vzZPrhsINjuMw
 6XRauMaB8aiSVSKWzO1UH5YkyQpEyHQy/Wp5B6HQ8LfZfYwvo8EVbOhkIUT3YJ5cK1ADZy
 TQd7n9J4hpfQ5LquAjUNUWu6NeeYUJg=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-619-LFpjrYx6M1uDx4MF-Xar3w-1; Thu, 18 Aug 2022 14:45:20 -0400
X-MC-Unique: LFpjrYx6M1uDx4MF-Xar3w-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com
 [10.11.54.10])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 490D285A581;
 Thu, 18 Aug 2022 18:45:18 +0000 (UTC)
Received: from localhost.localdomain (unknown [10.39.192.20])
 by smtp.corp.redhat.com (Postfix) with ESMTP id A84A7492C3B;
 Thu, 18 Aug 2022 18:45:14 +0000 (UTC)
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
Date: Thu, 18 Aug 2022 20:43:02 +0200
Message-Id: <20220818184302.10051-32-hdegoede@redhat.com>
In-Reply-To: <20220818184302.10051-1-hdegoede@redhat.com>
References: <20220818184302.10051-1-hdegoede@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang 2.85 on 10.11.54.10
Subject: [Nouveau] [PATCH v3 31/31] drm/todo: Add entry about dealing with
 brightness control on devices with > 1 panel
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

Add an entry summarizing the discussion about dealing with brightness
control on devices with more then 1 internal panel.

The original discussion can be found here:
https://lore.kernel.org/dri-devel/20220517152331.16217-1-hdegoede@redhat.com/

Signed-off-by: Hans de Goede <hdegoede@redhat.com>
---
 Documentation/gpu/todo.rst | 68 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 68 insertions(+)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 7634c27ac562..393d218e4a0c 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -679,6 +679,74 @@ Contact: Sam Ravnborg
 
 Level: Advanced
 
+Brightness handling on devices with multiple internal panels
+============================================================
+
+On x86/ACPI devices there can be multiple backlight firmware interfaces:
+(ACPI) video, vendor specific and others. As well as direct/native (PWM)
+register programming by the KMS driver.
+
+To deal with this backlight drivers used on x86/ACPI call
+acpi_video_get_backlight_type() which has heuristics (+quirks) to select
+which backlight interface to use; and backlight drivers which do not match
+the returned type will not register themselves, so that only one backlight
+device gets registered (in a single GPU setup, see below).
+
+At the moment this more or less assumes that there will only
+be 1 (internal) panel on a system.
+
+On systems with 2 panels this may be a problem, depending on
+what interface acpi_video_get_backlight_type() selects:
+
+1. native: in this case the KMS driver is expected to know which backlight
+   device belongs to which output so everything should just work.
+2. video: this does support controlling multiple backlights, but some work
+   will need to be done to get the output <-> backlight device mapping
+
+The above assumes both panels will require the same backlight interface type.
+Things will break on systems with multiple panels where the 2 panels need
+a different type of control. E.g. one panel needs ACPI video backlight control,
+where as the other is using native backlight control. Currently in this case
+only one of the 2 required backlight devices will get registered, based on
+the acpi_video_get_backlight_type() return value.
+
+If this (theoretical) case ever shows up, then supporting this will need some
+work. A possible solution here would be to pass a device and connector-name
+to acpi_video_get_backlight_type() so that it can deal with this.
+
+Note in a way we already have a case where userspace sees 2 panels,
+in dual GPU laptop setups with a mux. On those systems we may see
+either 2 native backlight devices; or 2 native backlight devices.
+
+Userspace already has code to deal with this by detecting if the related
+panel is active (iow which way the mux between the GPU and the panels
+points) and then uses that backlight device. Userspace here very much
+assumes a single panel though. It picks only 1 of the 2 backlight devices
+and then only uses that one.
+
+Note that all userspace code (that I know off) is currently hardcoded
+to assume a single panel.
+
+Before the recent changes to not register multiple (e.g. video + native)
+/sys/class/backlight devices for a single panel (on a single GPU laptop),
+userspace would see multiple backlight devices all controlling the same
+backlight.
+
+To deal with this userspace had to always picks one preferred device under
+/sys/class/backlight and will ignore the others. So to support brightness
+control on multiple panels userspace will need to be updated too.
+
+There are plans to allow brightness control through the KMS API by adding
+a "display brightness" property to drm_connector objects for panels. This
+solves a number of issues with the /sys/class/backlight API, including not
+being able to map a sysfs backlight device to a specific connector. Any
+userspace changes to add support for brightness control on devices with
+multiple panels really should build on top of this new KMS property.
+
+Contact: Hans de Goede
+
+Level: Advanced
+
 Outside DRM
 ===========
 
-- 
2.37.2

