Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6035E59F7CA
	for <lists+nouveau@lfdr.de>; Wed, 24 Aug 2022 12:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A845710E2CA;
	Wed, 24 Aug 2022 10:32:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B7D4010E1B1
 for <nouveau@lists.freedesktop.org>; Wed, 24 Aug 2022 10:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1661337118;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=UlcbDkRsbrYM78mAh3aiQrEPy8DVYsbqCH24GNpBqNU=;
 b=dA1qffggcJCxBj8w9zDfomzjf21xl3k349mliZ8nWDageJNH+DNsChxYf0rqnIDLDsxiu4
 g5t2HQztYbQ2Q4Yo37eCpsAYBirUD3znsKYznKG0xYslqJA35uuJ3TfpDtVwF7TDbhZOA+
 Wa7GgcGvVC8Fvp/L19+EIhdfop4jY/w=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-596-kKbb7eZtNS6Lr1wUxwN75w-1; Wed, 24 Aug 2022 06:31:57 -0400
X-MC-Unique: kKbb7eZtNS6Lr1wUxwN75w-1
Received: by mail-ej1-f70.google.com with SMTP id
 gn32-20020a1709070d2000b0073d7a2dbc62so2850220ejc.14
 for <nouveau@lists.freedesktop.org>; Wed, 24 Aug 2022 03:31:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:subject:from:cc:to:content-language
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc; bh=UlcbDkRsbrYM78mAh3aiQrEPy8DVYsbqCH24GNpBqNU=;
 b=1R7prXWW6SoYzXM2Exbu5wqTBeFIHif7qvN0Hni50frSp6R9fZnKfIipClyQ1PHsB8
 qQWaajqvyHQZQMjaBJQTD46BcF10faagCl8pNxDp9m7Ni5v9Tpg+yHwe7n3BJO5+VeiK
 YIrMH/xhS+rW3O3BWQnjpvSbFCCBGooImyqUKsVR80wCdbYTPxPVGj29GEPXjLUrflCq
 4KiOrEA3XMm5Am51W9JDfniN50SlOkuV2lYVoMzp3HfE4IipnKpICclcUb0rcgaZXVZQ
 XrhlzdmO/bZVhhjXnkyTrGzKiB3G37jF+Ra3KnHXRC+HQeSHYKf+Qr3l6p+wCYI7lVhx
 CUOg==
X-Gm-Message-State: ACgBeo0JVn5C+rYfGKHPb4Id/HtmRfFoSG4lJDd6v8EG6nIHO7J0SvK/
 a/ALm57kOebuhZ6WCBX09AuYYFxBa7CrX9XLNY4OVdrA/Im74jScECk8dZnYC8Sr67Bp3f2g2WG
 yeDTBhZYpIGW8lv6fEiJD0zpjig==
X-Received: by 2002:a17:906:505:b0:73d:b188:17d9 with SMTP id
 j5-20020a170906050500b0073db18817d9mr2363715eja.97.1661337116261; 
 Wed, 24 Aug 2022 03:31:56 -0700 (PDT)
X-Google-Smtp-Source: AA6agR4SB95cO3waA1C06t6rp3/pVG9CaQ3bT04tbtrPXnZGVEhmtFt56VEQ9hxlV/iJt5m79kjjHQ==
X-Received: by 2002:a17:906:505:b0:73d:b188:17d9 with SMTP id
 j5-20020a170906050500b0073db18817d9mr2363680eja.97.1661337115486; 
 Wed, 24 Aug 2022 03:31:55 -0700 (PDT)
Received: from ?IPV6:2001:1c00:c1e:bf00:d69d:5353:dba5:ee81?
 (2001-1c00-0c1e-bf00-d69d-5353-dba5-ee81.cable.dynamic.v6.ziggo.nl.
 [2001:1c00:c1e:bf00:d69d:5353:dba5:ee81])
 by smtp.gmail.com with ESMTPSA id
 14-20020a170906308e00b007314a01766asm944151ejv.211.2022.08.24.03.31.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 24 Aug 2022 03:31:54 -0700 (PDT)
Message-ID: <d65ba52b-4e1f-507c-187c-032d6155588e@redhat.com>
Date: Wed, 24 Aug 2022 12:31:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.12.0
To: Ben Skeggs <bskeggs@redhat.com>, Karol Herbst <kherbst@redhat.com>,
 Lyude <lyude@redhat.com>
From: Hans de Goede <hdegoede@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: [Nouveau] Question about selecting ACPI_VIDEO for nouveau on non
 X86 platforms
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi All,

Since 6.0-rc1 it is possible for ACPI_VIDEO to be enabled on non X86
platforms. I already send an email about this being a possible problem
for nouveau, when nouveau is builtin and apci_video is a module:

https://lore.kernel.org/linux-acpi/a385b626-217f-25be-f076-7478da3d1147@redhat.com/

"""
I just noticed this change:
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=038275d227841d4978ceceb397b584b4b39f2b50

--- a/drivers/acpi/Kconfig
+++ b/drivers/acpi/Kconfig
@@ -210,7 +210,7 @@ config ACPI_TINY_POWER_BUTTON_SIGNAL
 
 config ACPI_VIDEO
 	tristate "Video"
-	depends on X86 && BACKLIGHT_CLASS_DEVICE
+	depends on BACKLIGHT_CLASS_DEVICE
 	depends on INPUT
 	select THERMAL
 	help

I think this is going to cause random-config build errors because
at the nouveau driver calls acpi_video functions and it expects
those functions to either be there or to get the stubs.

This is an issue when acpi_video is build as a module and the
i915 / nouveau code is builtin.

To avoid this issue nouveau does a select on ACPI_VIDEO,
here is the code from drivers/gpu/drm/nouveau/Kconfig

        # Similar to i915, we need to select ACPI_VIDEO and it's dependencies
        select BACKLIGHT_CLASS_DEVICE if ACPI && X86
        select INPUT if ACPI && X86
        select THERMAL if ACPI && X86
        select ACPI_VIDEO if ACPI && X86

notice the if ACPI && X86, since ACPI_VIDEO can now be selected
on ARM, this can lead to ACPI_VIDEO being enabled as
module (so no stubs) while nouveau can be builtin which will
lead to unresolved symbol errors in nouveau when building the zImage.

I believe that to fix this the conditions after the select must
be changed from "if ACPI && X86" to just "if ACPI"
"""

I was looking at a lkp warning in my backlight refactor series
which is explained by the above today:

https://lore.kernel.org/lkml/202208231625.icHjRXDI-lkp@intel.com/

and while working on fixing this I noticed that nouveau not
only assumes ACPI[_VIDEO] is only available on X86 in its Kconfig
but also in other places:

drivers/gpu/drm/nouveau/Kbuild:

ifdef CONFIG_X86
nouveau-$(CONFIG_ACPI) += nouveau_acpi.o
endif

drivers/gpu/drm/nouveau/nouveau_acpi.h:

#if defined(CONFIG_ACPI) && defined(CONFIG_X86)
bool nouveau_is_optimus(void);
...
#else
static inline bool nouveau_is_optimus(void) { return false; };
...
#endif

Since currently the only nouveau dep on acpi_video is
inside nouveau_acpi.c the not building + stubbing of
nouveau_acpi.c is saving us from the problem which I expected
in my mail quoted above.

The backlight refactor series breaks this though, because
it adds calls to:
acpi_video_backlight_use_native()
acpi_video_register_backlight()

to nouveau outside of the drivers/gpu/drm/nouveau/nouveau_acpi.c
file.

To fix this for the next version of the backlight refactor series
I have added wrappers for:
acpi_video_backlight_use_native()
acpi_video_register_backlight()
to nouveau_acpi.?

After thinking about this a bit this seemed by far the cleanest
and consistent with how the current nouveau code is abstracting
other ACPI use, so this makes the backlight changes consistent
with existing nouveau practices.

Lyude, because of these changes I've dropped your Reviewed-by.
I'll send out a new version 4 series sometime today, can you
please re-review the 2 nouveau patches?

###

My first instinct to fix this, was to adjust the nouveau Kconfig bits
selecting ACPI_VIDEO to take into account that it now is available
on non X86 too:

diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
index 03d12caf9e26..26b895a49b9c 100644
--- a/drivers/gpu/drm/nouveau/Kconfig
+++ b/drivers/gpu/drm/nouveau/Kconfig
@@ -16,10 +16,10 @@ config DRM_NOUVEAU
 	select MXM_WMI if ACPI && X86
 	select POWER_SUPPLY
 	# Similar to i915, we need to select ACPI_VIDEO and it's dependencies
-	select BACKLIGHT_CLASS_DEVICE if ACPI && X86
-	select INPUT if ACPI && X86
-	select THERMAL if ACPI && X86
-	select ACPI_VIDEO if ACPI && X86
+	select BACKLIGHT_CLASS_DEVICE if ACPI
+	select INPUT if ACPI
+	select THERMAL if ACPI
+	select ACPI_VIDEO if ACPI
 	select SND_HDA_COMPONENT if SND_HDA_CORE
 	help
 	  Choose this option for open-source NVIDIA support.

We could still make this change together with Kbuild +
nouveau_acpi.h to build on non x86 too. This might be good to
prepare for some aarch64 devices which may use some of the
ACPI bits, they may need e.g. acpi_video_get_edid().

OTOH this might cause unexpected issue so it might be better
to wait with making such a change until it is actually
necessary.

Regards,

Hans

