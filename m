Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 427832253C8
	for <lists+nouveau@lfdr.de>; Sun, 19 Jul 2020 21:51:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDD906E0F6;
	Sun, 19 Jul 2020 19:51:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-1.mimecast.com (us-smtp-1.mimecast.com
 [205.139.110.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC1EE6E0F6
 for <nouveau@lists.freedesktop.org>; Sun, 19 Jul 2020 19:51:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1595188270;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=5+W4juhVWCiEA3fhSp7PQYC8FiX7DnbLymUoDvTE4gg=;
 b=T581rY+6LivIVZfkVQG+v1GvL/ovc8P0Mr9fVBRnaYFJHGjVjvD4x1AflqAEvayHi2Nhlp
 +ZGwvb+W9ugTLecRadqCT0u/fUBs3a3OEjh3ouAp5/WunmXYKhIe2mo6UNOnyWoMldT94Q
 azLeia3ZnYqQZ/iattXa/r8r7CtH/fU=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-290-h0FyyPTyO7m38Eo5V0UmFQ-1; Sun, 19 Jul 2020 15:51:08 -0400
X-MC-Unique: h0FyyPTyO7m38Eo5V0UmFQ-1
Received: by mail-qt1-f197.google.com with SMTP id i5so10613132qtw.3
 for <nouveau@lists.freedesktop.org>; Sun, 19 Jul 2020 12:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=5+W4juhVWCiEA3fhSp7PQYC8FiX7DnbLymUoDvTE4gg=;
 b=BIUcLG3uKfUUveuX/sOd1OmERRs9tp+P5k+hNlBpOLwXJoqCcZoQ0m2FwOrn7S25vD
 f6vJcdzoXS5VulFUr9o4hGZivAFS7dQIT9ur7qXKr6UEWjZ5GImNQjmJkIiw5KucFSnM
 F2sxXp+kTJmAZ1uSJ/wvEPxkcyZCGPZL2ydyKtJK99NJZ4cmshfmMdz4qExTzx1r7WcB
 l2DkSKdXG1oQeTeS+p6ABuwP2bG8JTKuCQBqr/OfPXFpmAkkVQXAtEpCZBgFx1W8q5dv
 gvcpisBJiQ2RmFRTbsmS/BelZJsAJMYTbY5a34u6/5cujZ6Yk2O5UCn/Sdi9OeJgF1T4
 J4hQ==
X-Gm-Message-State: AOAM5319Gr6lh9il1Gd4Oes3mYm2lb/Dzgm4cT69oRZM1Co/2KCvTOl4
 hZf+Olog71PN0qgEZEeLDv/UyRuZzyUTkEGLPxQu9JueVxmTmjEjaVBbGM/F5l6pifu5cUH+731
 /vvvJPiXhdFmlFOa9eloEsnCIvxvqjjniHAFHmI6gog==
X-Received: by 2002:ac8:4250:: with SMTP id r16mr20990804qtm.378.1595188267468; 
 Sun, 19 Jul 2020 12:51:07 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw9yVJg1QjyL9ivv5A6w+hu0GivIVSEEJqorLOC5n0j8PWQVDcfmYvz9E5//ryrqzbOSjwmCLlGhUm5y3yGbRs=
X-Received: by 2002:ac8:4250:: with SMTP id r16mr20990785qtm.378.1595188267211; 
 Sun, 19 Jul 2020 12:51:07 -0700 (PDT)
MIME-Version: 1.0
References: <20200717190547.648604-1-kherbst@redhat.com>
 <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
In-Reply-To: <e7a8cb3a-e9f8-b78a-93f0-c09e5eb5ed10@canonical.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Sun, 19 Jul 2020 21:50:56 +0200
Message-ID: <CACO55tvLCrqeV8MsVDbTaWP2EPAeZtfU08Kb2fVGCD6X+g3-rg@mail.gmail.com>
To: Alex Hung <alex.hung@canonical.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] RFC: ACPI / OSI: remove workarounds for
 hybrid graphics laptops
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Len Brown <lenb@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 17, 2020 at 9:52 PM Alex Hung <alex.hung@canonical.com> wrote:
>
> On 2020-07-17 1:05 p.m., Karol Herbst wrote:
> > It's hard to figure out what systems are actually affected and right now I
> > don't see a good way of removing those...
> >
> > But I'd like to see thos getting removed and drivers fixed instead (which
> > happened at least for nouveau).
> >
> > And as mentioned before, I prefer people working on fixing issues instead
> > of spending time to add firmware level workarounds which are hard to know
> > to which systems they apply to, hard to remove and basically a big huge
> > pain to work with.> In the end I have no idea how to even figure out what systems are affected
> > and which not by this, so I have no idea how to even verify we can safely
> > remove this (which just means those are impossible to remove unless we risk
> > breaking systems, which again makes those supper annoying to deal with).
> >
> > Also from the comments it's hard to get what those bits really do. Are they
> > just preventing runtime pm or do the devices are powered down when booting?
> > I am sure it's the former, still...
> >
> > Please, don't do this again.
> >
> > For now, those workaround prevent power savings on systems those workaround
> > applies to, which might be any so those should get removed asap and if
> > new issues arrise removing those please do a proper bug report and we can
> > look into it and come up with a proper fix (and keep this patch out until
> > we resolve all of those).
> >
> > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > CC: Alex Hung <alex.hung@canonical.com>
> > CC: "Rafael J. Wysocki" <rjw@rjwysocki.net>
> > CC: Len Brown <lenb@kernel.org>
> > CC: Lyude Paul <lyude@redhat.com>
> > CC: linux-kernel@vger.kernel.org
> > CC: dri-devel@lists.freedesktop.org
> > CC: nouveau@lists.freedesktop.org
> > ---
> >  drivers/acpi/osi.c | 24 ------------------------
> >  1 file changed, 24 deletions(-)
> >
> > diff --git a/drivers/acpi/osi.c b/drivers/acpi/osi.c
> > index 9f68538091384..d4405e1ca9b97 100644
> > --- a/drivers/acpi/osi.c
> > +++ b/drivers/acpi/osi.c
> > @@ -44,30 +44,6 @@ osi_setup_entries[OSI_STRING_ENTRIES_MAX] __initdata = {
> >       {"Processor Device", true},
> >       {"3.0 _SCP Extensions", true},
> >       {"Processor Aggregator Device", true},
> > -     /*
> > -      * Linux-Dell-Video is used by BIOS to disable RTD3 for NVidia graphics
> > -      * cards as RTD3 is not supported by drivers now.  Systems with NVidia
> > -      * cards will hang without RTD3 disabled.
> > -      *
> > -      * Once NVidia drivers officially support RTD3, this _OSI strings can
> > -      * be removed if both new and old graphics cards are supported.
> > -      */
> > -     {"Linux-Dell-Video", true},
> > -     /*
> > -      * Linux-Lenovo-NV-HDMI-Audio is used by BIOS to power on NVidia's HDMI
> > -      * audio device which is turned off for power-saving in Windows OS.
> > -      * This power management feature observed on some Lenovo Thinkpad
> > -      * systems which will not be able to output audio via HDMI without
> > -      * a BIOS workaround.
> > -      */
> > -     {"Linux-Lenovo-NV-HDMI-Audio", true},
> > -     /*
> > -      * Linux-HPI-Hybrid-Graphics is used by BIOS to enable dGPU to
> > -      * output video directly to external monitors on HP Inc. mobile
> > -      * workstations as Nvidia and AMD VGA drivers provide limited
> > -      * hybrid graphics supports.
> > -      */
> > -     {"Linux-HPI-Hybrid-Graphics", true},
> >  };
> >
> >  static u32 acpi_osi_handler(acpi_string interface, u32 supported)
> >
>
> The changes were discussed and tested a while ago, and no crashes were
> observed. Thanks for solving PM issues in nouveau.
>
> Acked-by: Alex Hung <alex.hung@canonical.com>
>

By any chance, do you have a list of systems implementing those workarounds?

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
