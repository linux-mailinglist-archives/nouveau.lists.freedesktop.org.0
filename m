Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 414FF59CFB7
	for <lists+nouveau@lfdr.de>; Tue, 23 Aug 2022 05:56:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 631D88B1D0;
	Tue, 23 Aug 2022 03:55:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 461 seconds by postgrey-1.36 at gabe;
 Tue, 23 Aug 2022 03:55:46 UTC
Received: from smtp-relay-internal-1.canonical.com
 (smtp-relay-internal-1.canonical.com [185.125.188.123])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2358FABDC4
 for <nouveau@lists.freedesktop.org>; Tue, 23 Aug 2022 03:55:46 +0000 (UTC)
Received: from mail-ot1-f69.google.com (mail-ot1-f69.google.com
 [209.85.210.69])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id 835123F132
 for <nouveau@lists.freedesktop.org>; Tue, 23 Aug 2022 03:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
 s=20210705; t=1661226483;
 bh=mtCEp4uiimBkFVG2jUbW2sWT9JVevWVVixkZgdiNhJM=;
 h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
 To:Cc:Content-Type;
 b=dw4hpkhE2BJCkYhMn+LbB7DHX8L0z13awZPmTm54TBCwjAoC7v+PZV+eTLkgI5CXE
 TcxbJpfna3jfQZ/LTIKxj66qbdj1zNpIxJuHH/Vp5yjRC0uAsDfOQQ+RgzYSC3zAbB
 AqZXpo1/UqF+WqlxrbyeiFdmHiaSjLmQ8dGP90243c8dq+myQWNoTSo432MzhbOdNt
 NDHEM2NHLTEVWP4xnN8hMwbH+0yX2+9RMsMyjco6Jt0x8W0hPal6wyK2F2tPBDCjci
 nwBRdJrWGR/r0yLxDafePJxWs1uDOAn7E8hjVCT6B4YdQ2/xMTKIMhnDeF6T6dADf4
 ndE7nDox5kkeQ==
Received: by mail-ot1-f69.google.com with SMTP id
 p7-20020a9d4547000000b00638eab81488so4298916oti.16
 for <nouveau@lists.freedesktop.org>; Mon, 22 Aug 2022 20:48:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=mtCEp4uiimBkFVG2jUbW2sWT9JVevWVVixkZgdiNhJM=;
 b=lrSaGqE4uvuobFPY/M1CUsAE5Mho7m3Dee11W769SQBGGhFDSc9GhxLGnn0XAX7WKn
 ykkoq7p4Zx/WX6sVOm6ytk+T/BoSWyrildqXxgn0bUftOWEGpr1+t4z02liB+IG1ucdP
 87EGj4iqRP2x9+CmGYPnsQS+IN7oiBno1/+7vuhS3vXMxJA7Z/rJu2cRNnWMtdO1eT+A
 n972PVc4w8JRYLDbTUOw69lhZ8NOcdevaxdhImfSOsOxaPwE649p9I7sqJkD0/1CAkSH
 aFKEV29r1WeDpnPKxk2vLOJ+fzQnuHJMwCvy9yMih1car0V7YEgDI73W/IKVVZ665aTS
 qTZw==
X-Gm-Message-State: ACgBeo16+pMJ4qg8HFAoB2wkdk+ny7UWJ+tB1RmbV2E0qx99bZwTfUVA
 DAuAJas+63O7OrseX/nxeH/uYf13/ECXQYm2LD3IqVBcAmWoleVB2PyguBYdBRtTNzPGScx4FX3
 pFDX3urm+3Pd7/KMdrX3G1rbzAERDs4WqydcsdVPDeBkyE2s/a8UzwoVEGk8=
X-Received: by 2002:a05:6870:8901:b0:11d:416d:2ccb with SMTP id
 i1-20020a056870890100b0011d416d2ccbmr583920oao.176.1661226482273; 
 Mon, 22 Aug 2022 20:48:02 -0700 (PDT)
X-Google-Smtp-Source: AA6agR77AfvgDfhYP1L6DVx/ZciIkJeu4mOvATNwD6si5fK0mh4kUfNdNgxn9Ve0xFqoMjMmYykDpSvmC3EGNMm+dUY=
X-Received: by 2002:a05:6870:8901:b0:11d:416d:2ccb with SMTP id
 i1-20020a056870890100b0011d416d2ccbmr583907oao.176.1661226481986; Mon, 22 Aug
 2022 20:48:01 -0700 (PDT)
MIME-Version: 1.0
References: <20220819142519.5684-1-mario.limonciello@amd.com>
 <CACO55tuw_2QWFMr0t6-JfUiQ4M7V3ZMKC7jHYTyERypaU3TekQ@mail.gmail.com>
 <c10b243a7be185ba119bdfce9a46e609db3bdd3b.camel@redhat.com>
In-Reply-To: <c10b243a7be185ba119bdfce9a46e609db3bdd3b.camel@redhat.com>
From: Kai-Heng Feng <kai.heng.feng@canonical.com>
Date: Tue, 23 Aug 2022 11:47:50 +0800
Message-ID: <CAAd53p6dTdWzkiyH6Sz=YubhdibvGa4hZ+EPN7mZA4aYSPd_6g@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [RFC 0/2] Stop the abuse of Linux-* _OSI strings
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
Cc: ddadap@nvidia.com, hdegoede@redhat.com, rafael@kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, Mario Limonciello <mario.limonciello@amd.com>,
 Aaron Ma <aaron.ma@canonical.com>, Dell.Client.Kernel@dell.com,
 Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

[+Cc Aaron]

On Tue, Aug 23, 2022 at 5:18 AM Lyude Paul <lyude@redhat.com> wrote:
>
> On Fri, 2022-08-19 at 17:44 +0200, Karol Herbst wrote:
> > On Fri, Aug 19, 2022 at 4:25 PM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> > >
> > > 3 _OSI strings were introduced in recent years that were intended
> > > to workaround very specific problems found on specific systems.
> > >
> > > The idea was supposed to be that these quirks were only used on
> > > those systems, but this proved to be a bad assumption.  I've found
> > > at least one system in the wild where the vendor using the _OSI
> > > string doesn't match the _OSI string and the neither does the use.
> > >
> > > So this brings a good time to review keeping those strings in the kernel.
> > > There are 3 strings that were introduced:
> > >
> > > Linux-Dell-Video
> > > -> Intended for systems with NVIDIA cards that didn't support RTD3
> > > Linux-Lenovo-NV-HDMI-Audio
> > > -> Intended for powering on NVIDIA HDMI device
> > > Linux-HPI-Hybrid-Graphics
> > > -> Intended for changing dGPU output
> > >
> > > AFAIK the first string is no longer relevant as nouveau now supports
> > > RTD3.  If that's wrong, this can be changed for the series.
> > >
> >
> > Nouveau always supported RTD3, because that's mainly a kernel feature.
> > When those were introduced we simply had a bug only hit on a few
> > systems. And instead of helping us to debug this, this workaround was
> > added :( We were not even asked about this.
> >
> > I am a bit curious about the other two though as I am not even sure
> > they are needed at all as we put other work arounds in place. @Lyude
> > Paul might know more about these.
>
> Some of the _OSI strings are totally fine. From my recollection:
>
> [    0.242993] ACPI: Added _OSI(Linux-Lenovo-NV-HDMI-Audio)
> ^ this one is needed to do a couple of ACPI tricks at startup to get the PCIe
> device for audio on nvidia's GPU to be detected properly

This should be fixed by commit b516ea586d71 ("PCI: Enable NVIDIA HDA
controllers").
Aaron worked on more Lenovo systems than me, so he may be more sure of it.

>
> [    0.242993] ACPI: Added _OSI(Linux-HPI-Hybrid-Graphics)
>
> I don't actually know how necessary this is, but I'm hesistant to call this
> one bad as it may be related to the funny mux configurations that I'm learning
> may exist on HP machines.

Should be fixed by commit 8e55f99c510f ("drm/i915: Invoke another _DSM
to enable MUX on HP Workstation laptops").

And for "Linux-Dell-Video", it should be fixed by 5775b843a619 ("PCI:
Restore config space on runtime resume despite being unbound").

So actually I am in favor of removing them all.

Kai-Heng

>
> >
>
> --
> Cheers,
>  Lyude Paul (she/her)
>  Software Engineer at Red Hat
>
