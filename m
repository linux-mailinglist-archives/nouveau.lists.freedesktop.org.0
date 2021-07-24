Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2FA93D4789
	for <lists+nouveau@lfdr.de>; Sat, 24 Jul 2021 14:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84D16E064;
	Sat, 24 Jul 2021 12:11:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62BCD6E064
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 12:11:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627128667;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=6AcUZFHd8G5i76Vd2O5qx5HOAivGVNtt24z6TdHQF1o=;
 b=epNu0UjSa2Naa7AER7Zbs1JPjnA77O/hYw5Lf1a0C22rm/SOvU+fW9HVdjm7MfmS4a9FTJ
 zNGvewInVYrtc/M8ZpMSI8FOEbvlFuMYzDCHRbAqSAP3zwVkLhudCzSBEfe6RNWLOtHQS7
 b94DBLfx7hig+5M9VJiHMYyWwrVyhBM=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-469-t1vH7T2QNG-vOkzETyqsqQ-1; Sat, 24 Jul 2021 08:11:06 -0400
X-MC-Unique: t1vH7T2QNG-vOkzETyqsqQ-1
Received: by mail-wm1-f72.google.com with SMTP id
 r125-20020a1c2b830000b0290197a4be97b7so1850782wmr.9
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 05:11:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6AcUZFHd8G5i76Vd2O5qx5HOAivGVNtt24z6TdHQF1o=;
 b=NXkyIK8b7Uz6bEp+0DGGSQRfC2eTKals1g3RXgHPOvA2TMR9vtnaaxV33gQEsaJx6Y
 f578qkiYY8K5GoBM141Kr9EZQ7UpiYdYTe24NUZZWirMk5NB1wmaeB0BkfrXI5h1+n6Q
 1k2M5PURLXzaVHiscelOFQjTNROgwwOgg//5HJfgRR0q0CXMCtGW61A1MUG+C1wA/wvK
 p+HV1qUy6hg2z3h4XgTtIjm5uMhzRNS3U1YT258h72n7D07jGGbQdIq1CcVhng1AvtUP
 L0I+S0aj91GttC/XTDcXn1BX+Srgtkbxpk6whw5WY50MH7uJ2kRF+iNgIqPitVdEYRsW
 l8tw==
X-Gm-Message-State: AOAM5306U660hI6Xnfu3lNZ9/4LjbP2m2olOKgPIK+mwofN84WJMFP8x
 UggWYTVPRoTRY++4HD3GRi5vywv91owvoiW9XLODE5PVT6xim+3V2CaOYeGJpAbW1B/G9x9FiAv
 WZpArzFRdzVRAuoDWO7RPjhvJndZM1u37YsjDur4MYw==
X-Received: by 2002:a5d:6644:: with SMTP id f4mr9516231wrw.177.1627128665077; 
 Sat, 24 Jul 2021 05:11:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx1U/Pv5yVb884gxpjWlzIwo4rESJ/20Yl1+UEyfV86RbeZzOoyylb1wUn4yvDX+I0fEFDwDPAH06HqLqn5dkc=
X-Received: by 2002:a5d:6644:: with SMTP id f4mr9516213wrw.177.1627128664906; 
 Sat, 24 Jul 2021 05:11:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
In-Reply-To: <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 14:10:53 +0200
Message-ID: <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] nouveau: make backlight support non optional
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>,
 Randy Dunlap <rdunlap@infradead.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Sat, Jul 24, 2021 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > In the past this only led to compilation issues. Also the small amount of
> > > > extra .text shouldn't really matter compared to the entire nouveau driver
> > > > anyway.
> > > >
> > >
> > > >         select DRM_TTM_HELPER
> > > > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > > > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > > > +       select BACKLIGHT_CLASS_DEVICE
> > > > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> > > >         select X86_PLATFORM_DEVICES if ACPI && X86
> > > >         select ACPI_WMI if ACPI && X86
> > >
> > > I think the logic needs to be the reverse: instead of 'select
> > > BACKLIGHT_CLASS_DEVICE',
> > > this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
> > >
> > > We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> > > process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
> > >
> >
> > I think the problem with
> > "depends" is that the user needs to enable backlight support first
> > before even seeing nouveau and I don't know if that makes sense. But
> > maybe "default" is indeed helping here in this case.
>
> In general, no driver should ever 'select' a subsystem. Otherwise you end up
> with two problems:
>
> - enabling this one driver suddenly makes all other drivers that have
> a dependency
>   on this visible, and some of those might have a 'default y', so you
> end up with
>   a ton of stuff in the kernel that would otherwise not be there.
>
> - It becomes impossible to turn it off as long as some driver has that 'select'.
>   This is the pretty much the same problem as the one you describe, just
>    the other side of it.
>
> - You run into dependency loops that prevent a successful build when some
>    other driver has a 'depends on'. Preventing these loops was the main
>    reason I said we should do this change.
>
> In theory we could change the other 85 drivers that use 'depends on' today,
> and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
> selected by the drivers that need it. This would avoid the third problem but
> not the other one.
>
>       Arnd
>

I see. Yeah, I guess we can do it this way then. I just wasn't aware
of the bigger picture here. Thanks for explaining.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
