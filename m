Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0028C3D481A
	for <lists+nouveau@lfdr.de>; Sat, 24 Jul 2021 16:13:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D531C6E079;
	Sat, 24 Jul 2021 14:13:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A2B236E048
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 14:13:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627136021;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=V4/jlIKZFmXnQ4/sEz3I8fDFoeb9tei6smaJLFHFWeo=;
 b=Tkibdwgs8exHHHQpHxI6BlBSWCYJDbgDWXrkpGwE4MA9P4qdVVRuuHpu0eeRG2k+bleDda
 +KSv7G/8AYCRcra5117JmfnwlInRxP6M4bCjid/vCgCBtBUbOmAFi8jyDCzAjGXCjbVAdM
 0pwr8snPDDbEizPJtDcJ5ky6LJ5lE8c=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-505-CRObHOrpOBaTmlRqFwVuXg-1; Sat, 24 Jul 2021 10:13:40 -0400
X-MC-Unique: CRObHOrpOBaTmlRqFwVuXg-1
Received: by mail-wr1-f71.google.com with SMTP id
 e13-20020a5d500d0000b029015313875da0so1762034wrt.2
 for <nouveau@lists.freedesktop.org>; Sat, 24 Jul 2021 07:13:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=V4/jlIKZFmXnQ4/sEz3I8fDFoeb9tei6smaJLFHFWeo=;
 b=QMv3NQUgUki9oKCdMU/Dp9AkWqXDDIryQ8Q+C4IOlG5nmvdLpjCSnHR/IXoAbGHwKX
 wEgUVtG8Z3TBtwCymI/LG5EtNeQetRqQhWCnRAXlTd15cFCNpd1l+5xJMIB4MXjxbWag
 0uiShr/s3kDvurnrH+9v6X7/lPn8+p6nt7/o6jx9qu4er1eO/Q8vzXqLmKYSoEMWJvFm
 gZWN3/qzoT0cildh6Sr03O82gxcTdVDIu2yyXz4SH0nKOTdc4vQPxEBXPI4HQg5U0lmP
 MuYWK/CuJ3iTJiAhfYA5Jee9A9Uz6KZqKFRg/84cFbP/0wXzpxkjYpw/HPZsqayp2YNi
 iuAw==
X-Gm-Message-State: AOAM530mBhdHYXOInwcPiAYQ6wp3sZH4or+bMgNb/TBQq3CnoasO5Qbq
 xQvKcSN2ltOacnRWcqEqxoV9R3KYplx9IbMfR0lv7CvJFRSoC1MuJ+q0Zq+2JYW5XL/tqwhMPFn
 87v2QQjZpr6SFyq6p6xQqvdymt9Rr3MxZ5fLZ0keivA==
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr10549973wrn.113.1627136018451; 
 Sat, 24 Jul 2021 07:13:38 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw2njleXmxNlYBrZEmtNe1+Kq7TVqQyyTIXXC2cI7rCUn+Ix9CU7zAAtMmjts+T2bMn/DGcuWY77ootkUu/d8E=
X-Received: by 2002:adf:ec0c:: with SMTP id x12mr10549957wrn.113.1627136018291; 
 Sat, 24 Jul 2021 07:13:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210723224617.3088886-1-kherbst@redhat.com>
 <CAK8P3a3u_jsxQW4dPXtsdKkw1mjKXL-h=qN1SGHytvUMPf3fPw@mail.gmail.com>
 <CACO55tuNWk6emjnnukgv9h-9jbpVP564Ogmi7TGbybc9n5v+ZQ@mail.gmail.com>
 <CAK8P3a1BceSaiqkTf+9Pr4Br-G3kgqD4ztwiaS7fxNiUg9t7Dg@mail.gmail.com>
 <CACO55tsoi2akTKvFdz3p48UHRjFXDW7dUnOM8qVePBFWet-3UQ@mail.gmail.com>
 <CACO55tuceMUz2pgOM23wvcmtaTqbo6S6rCB+mfLptqJRt=fMWA@mail.gmail.com>
 <CAK8P3a3+AD02-8nbULMdae2Hc=hJ+-Zb_CL+bHF-9oGieYiZWQ@mail.gmail.com>
In-Reply-To: <CAK8P3a3+AD02-8nbULMdae2Hc=hJ+-Zb_CL+bHF-9oGieYiZWQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sat, 24 Jul 2021 16:13:27 +0200
Message-ID: <CACO55tswMuDE9u3asU2Ls7BhA0uKGGarLk+E-WTD6MVnLwc3tw@mail.gmail.com>
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

On Sat, Jul 24, 2021 at 4:05 PM Arnd Bergmann <arnd@kernel.org> wrote:
>
> On Sat, Jul 24, 2021 at 2:52 PM Karol Herbst <kherbst@redhat.com> wrote:
> >
> > On Sat, Jul 24, 2021 at 2:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > On Sat, Jul 24, 2021 at 1:56 PM Arnd Bergmann <arnd@kernel.org> wrote:
> > > >
> > > > On Sat, Jul 24, 2021 at 11:55 AM Karol Herbst <kherbst@redhat.com> wrote:
> > > >
> > > > - You run into dependency loops that prevent a successful build when some
> > > >    other driver has a 'depends on'. Preventing these loops was the main
> > > >    reason I said we should do this change.
> > > >
> > > > In theory we could change the other 85 drivers that use 'depends on' today,
> > > > and make BACKLIGHT_CLASS_DEVICE a hidden symbol that only ever
> > > > selected by the drivers that need it. This would avoid the third problem but
> > > > not the other one.
> > > >
> > > I see. Yeah, I guess we can do it this way then. I just wasn't aware
> > > of the bigger picture here. Thanks for explaining.
> >
> > yeah... that doesn't work. So the issue is, that X86_PLATFORM_DEVICES
> > is a little bit in the way. If I remove the select
> > X86_PLATFORM_DEVICES then I guess problems once ACPI is enabled, but
> > if I keep it, I get cyclic dep errors :/
>
> Right, this is the exact problem I explained: since all other drivers use
> 'depends on X86_PLATFORM_DEVICES' instead of 'select', you get a
> loop again. Prior to changing the BACKLIGHT_CLASS_DEVICE dependency,
> nouveau was pretty much on top of everything else in the hierarchy,
> changing part of it can result in a loop.
>
> I see that there are about ten more 'select' statements that look like
> they should not be there, and almost all of them were added in order
> to be able to 'select MXM_WMI'.
>
> I think we can go as far as the patch below, which I've put in my
> randconfig build machine, on top of your patch. I'm not entirely
> sure how strong the dependency on MXM_WMI is: does it cause
> a build failure when that is not enabled, or was this select just
> added for convenience so users don't get surprised when it's missing?
>
>        Arnd
>

we use the MXM_WMI in code. We also have to keep arm in mind and not
break stuff there. So I will try to play around with your changes and
see how that goes.

> diff --git a/drivers/gpu/drm/nouveau/Kconfig b/drivers/gpu/drm/nouveau/Kconfig
> index 9c2108b48524..f2585416507e 100644
> --- a/drivers/gpu/drm/nouveau/Kconfig
> +++ b/drivers/gpu/drm/nouveau/Kconfig
> @@ -3,21 +3,14 @@ config DRM_NOUVEAU
>         tristate "Nouveau (NVIDIA) cards"
>         depends on DRM && PCI && MMU
>         depends on AGP || !AGP
> +       depends on ACPI_VIDEO || !ACPI
> +       depends on BACKLIGHT_CLASS_DEVICE
> +       depends on MXM_WMI || !X86 || !ACPI
>         select IOMMU_API
>         select FW_LOADER
>         select DRM_KMS_HELPER
>         select DRM_TTM
>         select DRM_TTM_HELPER
> -       select BACKLIGHT_CLASS_DEVICE
> -       select ACPI_VIDEO if ACPI && X86 && INPUT
> -       select X86_PLATFORM_DEVICES if ACPI && X86
> -       select ACPI_WMI if ACPI && X86
> -       select MXM_WMI if ACPI && X86
> -       select POWER_SUPPLY
> -       # Similar to i915, we need to select ACPI_VIDEO and it's dependencies
> -       select INPUT if ACPI && X86
> -       select THERMAL if ACPI && X86
> -       select ACPI_VIDEO if ACPI && X86
>         select SND_HDA_COMPONENT if SND_HDA_CORE
>         help
>           Choose this option for open-source NVIDIA support.
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
