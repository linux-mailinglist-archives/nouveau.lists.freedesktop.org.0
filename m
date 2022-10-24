Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FB9960BACA
	for <lists+nouveau@lfdr.de>; Mon, 24 Oct 2022 22:41:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F030F10E28E;
	Mon, 24 Oct 2022 20:40:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 595 seconds by postgrey-1.36 at gabe;
 Mon, 24 Oct 2022 20:40:55 UTC
Received: from cavan.codon.org.uk (irc.codon.org.uk [IPv6:2a00:1098:84:22e::2])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 794B910E09F;
 Mon, 24 Oct 2022 20:40:55 +0000 (UTC)
Received: by cavan.codon.org.uk (Postfix, from userid 1000)
 id 9492F40A6A; Mon, 24 Oct 2022 21:30:57 +0100 (BST)
Date: Mon, 24 Oct 2022 21:30:57 +0100
From: Matthew Garrett <mjg59@srcf.ucam.org>
To: Hans de Goede <hdegoede@redhat.com>
Message-ID: <20221024203057.GA28675@srcf.ucam.org>
References: <20220825143726.269890-1-hdegoede@redhat.com>
 <20220825143726.269890-3-hdegoede@redhat.com>
 <f914ceb3-94bd-743c-f8b6-0334086e731a@gmail.com>
 <42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42a5f2c9-a1dc-8fc0-7334-fe6c390ecfbb@redhat.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Subject: Re: [Nouveau] [PATCH v5 02/31] drm/i915: Don't register backlight
 when another backlight should be used (v2)
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
Cc: Pan@freedesktop.org, "Rafael J . Wysocki" <rafael@kernel.org>,
 nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Dmitry Osipenko <digetx@gmail.com>, amd-gfx@lists.freedesktop.org,
 linux-acpi@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>, Len Brown <lenb@kernel.org>,
 Daniel Dadap <ddadap@nvidia.com>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Mark Gross <markgross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 27, 2022 at 01:04:52PM +0200, Hans de Goede wrote:

> So to fix this we need to make acpi_video_get_backlight_type()
> return native on the Acer Chromebook Spin 713.

Isn't the issue broader than that? Unless the platform is Windows 8 or 
later, we'll *always* (outside of some corner cases) return 
acpi_backlight_vendor if there's no ACPI video interface. This is broken 
for any platform that implements ACPI but relies on native video 
control, which is going to include a range of Coreboot platforms, not 
just Chromebooks. I think for this to work correctly you need to have 
the infrastructure be aware of whether or not a vendor interface exists, 
which means having to handle cleanup if a vendor-specific module gets 
loaded later.
