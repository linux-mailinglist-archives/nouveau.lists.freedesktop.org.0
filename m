Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5ED0460F70A
	for <lists+nouveau@lfdr.de>; Thu, 27 Oct 2022 14:19:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 461DE10E5E5;
	Thu, 27 Oct 2022 12:19:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com
 [209.85.160.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1AF510E3F0;
 Thu, 27 Oct 2022 12:19:44 +0000 (UTC)
Received: by mail-qt1-f176.google.com with SMTP id l28so930352qtv.4;
 Thu, 27 Oct 2022 05:19:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=3e9j5Qwiqs/f1XbIA4ZFfx647JqImc8PuBMqMLRI+CY=;
 b=nZs3hLafqLMV6OIkI1vFHA4+DfehZtA4SzMfNMQ0HMk0WhGBl5kc+fklGyUYZuf7hs
 k0BmOg3rfqQmdLktcfLulLjtP7lCqA3pp8Gl7w/YTkhvOiSu0vUcfPYm6t2TV8d0MdGO
 B/r3qT1YpCm/gOWtqZkA46oDdBVKhI429GnAfjZwmjnlXe25TMNyI9qHJrc3PwJvdKYb
 AOPN/1tVL0XH3RrIfzPmEmrOm8KwGf2rPs6T0Uc5BdCABZeRv2sQySYbN7LngD2IGZDy
 Y3BfbvCI0a/i1WoxYsJpIhIMjYPe+TqML9A+9rmiq1vBHRqURly5TY2DTgW//TcaLiOD
 kSCQ==
X-Gm-Message-State: ACrzQf0HFekXoxMC5y22s24SQAuVFrs+9pAX9sfAWclFz8a6Wt7e3N4h
 ul0VvztpHKTsM8jUdg6QtFn31CMnPUJOy8tg3Fg=
X-Google-Smtp-Source: AMsMyM69RoU0FyynhwyvAcltO78mN8wnrxDaU0H42sOUgzVaxEwEWEEjpPn5ALxiGMgXKKWihZ8uqwTw9rMyl80ilzY=
X-Received: by 2002:a05:622a:13c6:b0:39c:c34f:29ec with SMTP id
 p6-20020a05622a13c600b0039cc34f29ecmr40973105qtk.153.1666873183985; Thu, 27
 Oct 2022 05:19:43 -0700 (PDT)
MIME-Version: 1.0
References: <20221025193248.GA21457@srcf.ucam.org>
 <144cd47e-42dc-2b84-1a90-ea5e080e08a3@redhat.com>
 <20221025204043.GA23306@srcf.ucam.org>
 <cb5add36-c13c-ccd5-1b4b-71b45163a170@redhat.com>
 <20221025234040.GA27673@srcf.ucam.org>
 <fa6cc1d9-6740-b495-2c72-cae18c429ca6@redhat.com>
 <20221026204920.GA15326@srcf.ucam.org>
 <099dee98-8aeb-af36-828c-110f5ac6e9a3@redhat.com>
 <20221027091123.GA28089@srcf.ucam.org>
 <933be908-0bc2-56cc-8d6f-38f2d208ef20@redhat.com>
 <20221027095249.GA28666@srcf.ucam.org>
 <6df2016d-ed2d-57fa-dcad-48537732895f@redhat.com>
 <CAJZ5v0jM1JAySagv=u2be1bAmfTt3jJgVnOEjGzskBvZY7k6aw@mail.gmail.com>
 <526db9ed-bc39-b6be-c977-d4509ce22152@redhat.com>
In-Reply-To: <526db9ed-bc39-b6be-c977-d4509ce22152@redhat.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 27 Oct 2022 14:19:32 +0200
Message-ID: <CAJZ5v0j7_76LcMYY8s3TZGMwys4uYduCFy2-qqrpuSO_Awqhqg@mail.gmail.com>
To: Hans de Goede <hdegoede@redhat.com>
Content-Type: text/plain; charset="UTF-8"
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, nouveau@lists.freedesktop.org,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 dri-devel@lists.freedesktop.org, platform-driver-x86@vger.kernel.org,
 Daniel Dadap <ddadap@nvidia.com>, Dmitry Osipenko <digetx@gmail.com>,
 amd-gfx@lists.freedesktop.org, linux-acpi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@redhat.com>,
 Len Brown <lenb@kernel.org>, Jani Nikula <jani.nikula@intel.com>,
 intel-gfx <intel-gfx@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, Mark Gross <markgross@kernel.org>,
 Maxime Ripard <mripard@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Mika Westerberg <mika.westerberg@linux.intel.com>,
 Andy Shevchenko <andy@kernel.org>,
 Tvrtko Ursulin <tvrtko.ursulin@linux.intel.com>, Xinhui <Xinhui.Pan@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Oct 27, 2022 at 2:17 PM Hans de Goede <hdegoede@redhat.com> wrote:
>
> Hi,
>
> On 10/27/22 14:09, Rafael J. Wysocki wrote:
> > On Thu, Oct 27, 2022 at 12:37 PM Hans de Goede <hdegoede@redhat.com> wrote:
> >>
> >> Hi,
> >>
> >> On 10/27/22 11:52, Matthew Garrett wrote:
> >>> On Thu, Oct 27, 2022 at 11:39:38AM +0200, Hans de Goede wrote:
> >>>
> >>>> The *only* behavior which actually is new in 6.1 is the native GPU
> >>>> drivers now doing the equivalent of:
> >>>>
> >>>>      if (acpi_video_get_backlight_type() != acpi_backlight_native)
> >>>>              return;
> >>>>
> >>>> In their backlight register paths (i), which is causing the native
> >>>> backlight to disappear on your custom laptop setup and on Chromebooks
> >>>> (with the Chromebooks case being already solved I hope.).
> >>>
> >>> It's causing the backlight control to vanish on any machine that isn't
> >>> ((acpi_video || vendor interface) || !acpi). Most machines that fall
> >>> into that are either weird or Chromebooks or old, but there are machines
> >>> that fall into that.
> >>
> >> I acknowledge that their are machines that fall into this category,
> >> but I expect / hope there to be so few of them that we can just DMI
> >> quirk our way out if this.
> >>
> >> I believe the old group to be small because:
> >>
> >> 1. Generally speaking the "native" control method is usually not
> >> present on the really old (pre ACPI video spec) mobile GPUs.
> >>
> >> 2. On most old laptops I would still expect there to be a vendor
> >> interface too, and if both get registered standard desktop environments
> >> will prefer the vendor one, so then we need a native DMI quirk to
> >> disable the vendor interface anyways and we already have a bunch of
> >> those, so some laptops in this group are already covered by DMI quirks.
> >>
> >> And a fix for the Chromebook case is already in Linus' tree, which
> >> just leaves the weird case, of which there will hopefully be only
> >> a few.
> >>
> >> I do share your worry that this might break some machines, but
> >> the only way to really find out is to get this code out there
> >> I'm afraid.
> >>
> >> I have just written a blog post asking for people to check if
> >> their laptop might be affected; and to report various details
> >> to me of their laptop is affected:
> >>
> >> https://hansdegoede.dreamwidth.org/26548.html
> >>
> >> Lets wait and see how this goes. If I get (too) many reports then
> >> I will send a revert of the addition of the:
> >>
> >>         if (acpi_video_get_backlight_type() != acpi_backlight_native)
> >>                 return;
> >>
> >> check to the i915 / radeon / amd / nouveau drivers.
> >>
> >> (And if I only get a couple of reports I will probably just submit
> >> DMI quirks for the affected models).
> >
> > Sounds reasonable to me, FWIW.
> >
> > And IIUC the check above can be overridden by passing
> > acpi_backlight=native in the kernel command line, right?
>
> Right, that can be used as a quick workaround, but we really do
> want this to work OOTB everywhere.

Sure.

My point is that if it doesn't work OOTB for someone, and say it used
to, they can use the above workaround and report back.
