Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1350B3D47B2
	for <lists+nouveau@lfdr.de>; Sat, 24 Jul 2021 14:52:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B45B26E11A;
	Sat, 24 Jul 2021 12:52:05 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B6146E11A
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 12:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627131123;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=SqP8PeLUX+bkAijbG1F91uxgBzPDOmlyO/TzLjQPs+k=;
 b=CrSSreZshwzQdPuBJyUJ6ngbhoaUb0FPIcJQ6ubUfHp6k8aoRVFFcsN8jF6EFP4ONjpmOl
 So74cngrSC9eUcfCHz/jpF+zBeYHZnuCNwKRlmNzARcBeqsgr+il9/5y7LO5yDTh0hrioC
 XRpgmrj5pH7VlqFsVWl3wbYn4YbVDfc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-63-GGXxJk0jPzChybkbKgTl5A-1; Sat, 24 Jul 2021 08:52:00 -0400
X-MC-Unique: GGXxJk0jPzChybkbKgTl5A-1
Received: by mail-wr1-f71.google.com with SMTP id
 n1-20020a5d59810000b029013cd60e9baaso2084025wri.7
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 05:51:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=SqP8PeLUX+bkAijbG1F91uxgBzPDOmlyO/TzLjQPs+k=;
 b=IBpXzSbJpSShOpYyh6Anf3GrIDRpPIckFU3BHK7A53ldmprj+hg/6bWbLn2uZD3QwO
 RByvqez6P86cngRReqYx2pgAtC/64sSF2ghKGLnr9/WkGFjIl5s+kuIAKAzrqrvpLZl9
 K2CPP1GHWMqywORcvngeug8FkZNywCkO7WHQPlO3DZu0IFy+mRlayQBh6nMfA9KIteRb
 VM+ObDSqeccgLsJ5WBbGVK3Hsne3AdaEYGQPoaJX6x1SwHDdMQiAFtZR3fDVM56b+QDf
 kAYKP7hgM483w6EMS3p9D2JRgzyzJjJ8q/VJrWNIiqfG+l2qRNtBGHgrP8uEjlx4s8u6
 LtcQ==
X-Gm-Message-State: AOAM533Lukjew8Wtla++leT2HidSn46dV9DV0DQlvpHsinjL3CB326DT
 /aysmp93bfKjrbiSIxLltxU8CrCLOF/BgtS0MqBCRjLoDHl9FWp3tu9F9GcPwo0TqCqANL+bqOd
 jBDLB8RzkNrQIZNmlFjlmeSAoJr7Yn92rmHG0ymgULA==
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1809643wmq.171.1627131118777; 
 Sat, 24 Jul 2021 05:51:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxkscYT672ybkBRK9AVIA/U5x33XrDVYao8PYSEV9N4uRmE4HwCi033ERdfHRxKag3E+wklUBG0a0zMSGLw8pg=
X-Received: by 2002:a05:600c:354a:: with SMTP id
 i10mr1809620wmq.171.1627131118511; 
 Sat, 24 Jul 2021 05:51:58 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
 <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
In-Reply-To: <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 14:51:47 +0200
Message-ID: <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
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

On Sat, Jul 24, 2021 at 2:10 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Sat, Jul 24, 2021 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Sat, Jul 24, 2021 at 8:55 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > > >
> > > > On Sat, Jul 24, 2021 at 12:47 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > > >
> > > > > In the past this only led to compilation issues. Also the small amount of
> > > > > extra .text shouldn't really matter compared to the entire nouveau driver
> > > > > anyway.
> > > > >
> > > >
> > > > >         select DRM_TTM_HELPER
> > > > > -       select BACKLIGHT_CLASS_DEVICE if DRM_NOUVEAU_BACKLIGHT
> > > > > -       select ACPI_VIDEO if ACPI && X86 && BACKLIGHT_CLASS_DEVICE && INPUT
> > > > > +       select BACKLIGHT_CLASS_DEVICE
> > > > > +       select ACPI_VIDEO if ACPI && X86 && INPUT
> > > > >         select X86_PLATFORM_DEVICES if ACPI && X86
> > > > >         select ACPI_WMI if ACPI && X86
> > > >
> > > > I think the logic needs to be the reverse: instead of 'select
> > > > BACKLIGHT_CLASS_DEVICE',
> > > > this should be 'depends on BACKLIGHT_CLASS_DEVICE', and the same for ACPI_VIDEO.
> > > >
> > > > We may want to add 'default DRM || FB' to BACKLIGHT_CLASS_DEVICE in the
> > > > process so we don't lose it for users doing 'make oldconfig' or 'make defconfig'
> > > >
> > >
> > > I think the problem with
> > > "depends" is that the user needs to enable backlight support first
> > > before even seeing nouveau and I don't know if that makes sense. But
> > > maybe "default" is indeed helping here in this case.
> >
> > In general, no driver should ever 'select' a subsystem. Otherwise you end up
> > with two problems:
> >
> > - enabling this one driver suddenly makes all other drivers that have
> > a dependency
> >   on this visible, and some of those might have a 'default y', so you
> > end up with
> >   a ton of stuff in the kernel that would otherwise not be there.
> >
> > - It becomes impossible to turn it off as long as some driver has that 'select'.
> >   This is the pretty much the same problem as the one you describe, just
> >    the other side of it.
> >
> > - You run into dependency loops that prevent a successful build when some
> >    other driver has a 'depends on'. Preventing these loops was the main
> >    reason I said we should do this change.
> >
> > In theory we could change the other 85 drivers that use 'depends on' today,
> > and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
> > selected by the drivers that need it. This would avoid the third problem but
> > not the other one.
> >
> >       Arnd
> >
>
> I see. Yeah, I guess we can do it this way then. I just wasn't aware
> of the bigger picture here. Thanks for explaining.

yeah... that doesn't work. So the issue is, that X86_PLATFORM_DEVICES
is a little bit in the way. If I remove the select
X86_PLATFORM_DEVICES then I guess problems once ACPI is enabled, but
if I keep it, I get cyclic dep errors :/

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
