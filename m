Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71D0452B52D
	for <lists+nouveau@lfdr.de>; Wed, 18 May 2022 10:55:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A567C10E656;
	Wed, 18 May 2022 08:55:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga04.intel.com (mga04.intel.com [192.55.52.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F153A10E2CA;
 Wed, 18 May 2022 08:55:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
 d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
 t=1652864148; x=1684400148;
 h=from:to:cc:subject:in-reply-to:references:date:
 message-id:mime-version;
 bh=C57//7ylgGo/HSVGnaIk0RKSXtsb/KUCW24SV/5qRTc=;
 b=X2pYq/e283qa74s4b4JG0fHnJIzqf1/QMAIoLXmpKOIlcOSA7+oMRKFz
 /SMH/nr+UjtwXJDmgl9Kxhggaz7pv9g44u19PMDeRnNkUAHrtVNBCrX+Q
 KMGJNvgznYg5DKF+jQOwrgGLuvoMwcsnE1uGRITlbE7o+xFz9nbN5Kt0R
 oVasbuwl7CZkVU7L67h5k7Mqtjut4Tk7dybuosaxeesYgGO91vsvsDHC9
 jQ+t54tV1l51u/Lnhh6p5nLlgh9lSPgKoXKr68YhWRUTJ8AbHUGQGbl2v
 khGjx9xunKv/lrQVk4CV1dGHuKVV4ZmQ3V7eud2j/NbIOe1EBrPY/Z0LA A==;
X-IronPort-AV: E=McAfee;i="6400,9594,10350"; a="270390520"
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="270390520"
Received: from orsmga008.jf.intel.com ([10.7.209.65])
 by fmsmga104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 01:55:47 -0700
X-IronPort-AV: E=Sophos;i="5.91,234,1647327600"; d="scan'208";a="597666716"
Received: from ksobisz-mobl.ger.corp.intel.com (HELO localhost)
 ([10.249.132.195])
 by orsmga008-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 18 May 2022 01:55:38 -0700
From: Jani Nikula <jani.nikula@linux.intel.com>
To: Hans de Goede <hdegoede@redhat.com>, Ben Skeggs <bskeggs@redhat.com>,
 Karol Herbst <kherbst@redhat.com>, Lyude <lyude@redhat.com>, Daniel Dadap
 <ddadap@nvidia.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Joonas Lahtinen
 <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Alex Deucher
 <alexander.deucher@amd.com>, Christian =?utf-8?Q?K=C3=B6nig?=
 <christian.koenig@amd.com>,
 "Pan, Xinhui" <Xinhui.Pan@amd.com>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Mika Westerberg <mika.westerberg@linux.intel.com>,
 Mark Gross <markgross@kernel.org>, Andy Shevchenko <andy@kernel.org>
In-Reply-To: <20220517152331.16217-2-hdegoede@redhat.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <20220517152331.16217-1-hdegoede@redhat.com>
 <20220517152331.16217-2-hdegoede@redhat.com>
Date: Wed, 18 May 2022 11:55:35 +0300
Message-ID: <87y1yzdxtk.fsf@intel.com>
MIME-Version: 1.0
Content-Type: text/plain
Subject: Re: [Nouveau] [PATCH 01/14] ACPI: video: Add a native function
 parameter to acpi_video_get_backlight_type()
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

On Tue, 17 May 2022, Hans de Goede <hdegoede@redhat.com> wrote:
> ATM on x86 laptops where we want userspace to use the acpi_video backlight
> device we often register both the GPU's native backlight device and
> acpi_video's firmware acpi_video# backlight device. This relies on
> userspace preferring firmware type backlight devices over native ones, but
> registering 2 backlight devices for a single display really is undesirable.
>
> On x86 laptops where the native GPU backlight device should be used,
> the registering of other backlight devices is avoided by their drivers
> using acpi_video_get_backlight_type() and only registering their backlight
> if the return value matches their type.
>
> acpi_video_get_backlight_type() uses
> backlight_device_get_by_type(BACKLIGHT_RAW) to determine if a native
> driver is available and will never return native if this returns
> false. This means that the GPU's native backlight registering code
> cannot just call acpi_video_get_backlight_type() to determine if it
> should register its backlight, since acpi_video_get_backlight_type() will
> never return native until the native backlight has already registered.
>
> To fix this add a native function parameter to
> acpi_video_get_backlight_type(), which when set to true will make
> acpi_video_get_backlight_type() behave as if a native backlight has
> already been registered.
>
> Note that all current callers are updated to pass false for the new
> parameter, so this change in itself causes no functional changes.


> diff --git a/drivers/acpi/video_detect.c b/drivers/acpi/video_detect.c
> index becc198e4c22..0a06f0edd298 100644
> --- a/drivers/acpi/video_detect.c
> +++ b/drivers/acpi/video_detect.c
> @@ -17,12 +17,14 @@
>   * Otherwise vendor specific drivers like thinkpad_acpi, asus-laptop,
>   * sony_acpi,... can take care about backlight brightness.
>   *
> - * Backlight drivers can use acpi_video_get_backlight_type() to determine
> - * which driver should handle the backlight.
> + * Backlight drivers can use acpi_video_get_backlight_type() to determine which
> + * driver should handle the backlight. RAW/GPU-driver backlight drivers must
> + * pass true for the native function argument, other drivers must pass false.
>   *
>   * If CONFIG_ACPI_VIDEO is neither set as "compiled in" (y) nor as a module (m)
>   * this file will not be compiled and acpi_video_get_backlight_type() will
> - * always return acpi_backlight_vendor.
> + * return acpi_backlight_native when its native argument is true and
> + * acpi_backlight_vendor when it is false.
>   */

Frankly, I think the boolean native parameter here, and at the call
sites, is confusing, and the slightly different explanations in the
commit message and comment here aren't helping.

I suggest adding a separate function that the native backlight drivers
should use. I think it's more obvious all around, and easier to document
too.


BR,
Jani.

-- 
Jani Nikula, Intel Open Source Graphics Center
