Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A67CE59A277
	for <lists+nouveau@lfdr.de>; Fri, 19 Aug 2022 18:37:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D923210E62E;
	Fri, 19 Aug 2022 16:37:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7630310E632
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 16:37:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1660927051;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=PgAv2gfeT+DjVQ0ygCcgGDt5H9pi8jbfYe8g0Dy8ho8=;
 b=UToaUg31jAPJbbsce3Z+pCofpv21AyLvouDFtrRXaBQbxTOttra5XUrm3bIAg52lq3gJ2C
 cgVpfFWM1QmZLJQr17ES/3NTb9g+1L/ltllDK2T29qlSQZYvEO+MbPL9ia3xbE812+Uhzf
 8iF6ds+t5IXDTNgsB0pB6M0/r6xgwwc=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-368-9HXhGu9AMOyhQLLhbBw3bw-1; Fri, 19 Aug 2022 12:37:28 -0400
X-MC-Unique: 9HXhGu9AMOyhQLLhbBw3bw-1
Received: by mail-qk1-f200.google.com with SMTP id
 bl27-20020a05620a1a9b00b0069994eeb30cso4118657qkb.11
 for <nouveau@lists.freedesktop.org>; Fri, 19 Aug 2022 09:37:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc;
 bh=PgAv2gfeT+DjVQ0ygCcgGDt5H9pi8jbfYe8g0Dy8ho8=;
 b=ejxKAKqErlY79kfS+AoCJPfRuV9TN9INWliFL0KKskN6TTMBnE74Qu46WbnIOPzsIs
 66g9TziCyLe68AJWomA5kJ2cpKiPhs4wTMCogdhMdCAnWOeIFYyR9nETXASLG5PuJlcy
 pLg3KCeDOBzAoWKFQNaB1LDNhtnx+Kf0PuZ7ouqPlExacEWjuG8LaDafEVE+jF6LRij2
 d++1lzjxyAvsolVO8M48MraEKgVud2DhIMlbMOYK77XgbzQtD27+cvUIoY6E8YoK6KmZ
 AX4T8a+te03+vAmFe08DgRpGgxFmmujgEGZJVcuVzz/+kPr2fobXnBAYZ9GHocJ3joFz
 dgeg==
X-Gm-Message-State: ACgBeo0yaJWzHGhUBzrGit3C4sCyqzg3JJKoN6vp8wEjTzDZN5SctXrv
 90buBr0nZOlUkKSheb686a60eLqTZ9YUf/k8RQKX9XMDSyb2CeNPC+5IHMRQNXp2z25ewjO4R19
 UYGVyFC+P1UPCMkmkrQru0f/Pi9j5sofVz7ZtmiCDyQ==
X-Received: by 2002:a05:622a:230e:b0:343:616b:1f88 with SMTP id
 ck14-20020a05622a230e00b00343616b1f88mr7033368qtb.457.1660927047511; 
 Fri, 19 Aug 2022 09:37:27 -0700 (PDT)
X-Google-Smtp-Source: AA6agR5jDRfWr7ZoGy5GcBr/OoJivAhIrJNf3OBVmCNTmdUUm5Fun3lhCXMpYjgaWh0B1rAidKm/bZIJ68WjdJqiEUE=
X-Received: by 2002:a05:622a:230e:b0:343:616b:1f88 with SMTP id
 ck14-20020a05622a230e00b00343616b1f88mr7033351qtb.457.1660927047299; Fri, 19
 Aug 2022 09:37:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220819142519.5684-1-mario.limonciello@amd.com>
 <CACO55tuw_2QWFMr0t6-JfUiQ4M7V3ZMKC7jHYTyERypaU3TekQ@mail.gmail.com>
 <57cf9b61-82f4-f6d4-7f43-c3f94de7aaf3@amd.com>
In-Reply-To: <57cf9b61-82f4-f6d4-7f43-c3f94de7aaf3@amd.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 19 Aug 2022 18:37:15 +0200
Message-ID: <CACO55tuRZOyoo79sgnewETF50Unzm_uksGtaB24Y93pej+2vgA@mail.gmail.com>
To: "Limonciello, Mario" <mario.limonciello@amd.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
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
 linux-acpi@vger.kernel.org, kai.heng.feng@canonical.com,
 Dell.Client.Kernel@dell.com, Len Brown <lenb@kernel.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Aug 19, 2022 at 6:00 PM Limonciello, Mario
<mario.limonciello@amd.com> wrote:
>
> On 8/19/2022 10:44, Karol Herbst wrote:
> > On Fri, Aug 19, 2022 at 4:25 PM Mario Limonciello
> > <mario.limonciello@amd.com> wrote:
> >>
> >> 3 _OSI strings were introduced in recent years that were intended
> >> to workaround very specific problems found on specific systems.
> >>
> >> The idea was supposed to be that these quirks were only used on
> >> those systems, but this proved to be a bad assumption.  I've found
> >> at least one system in the wild where the vendor using the _OSI
> >> string doesn't match the _OSI string and the neither does the use.
> >>
> >> So this brings a good time to review keeping those strings in the kernel.
> >> There are 3 strings that were introduced:
> >>
> >> Linux-Dell-Video
> >> -> Intended for systems with NVIDIA cards that didn't support RTD3
> >> Linux-Lenovo-NV-HDMI-Audio
> >> -> Intended for powering on NVIDIA HDMI device
> >> Linux-HPI-Hybrid-Graphics
> >> -> Intended for changing dGPU output
> >>
> >> AFAIK the first string is no longer relevant as nouveau now supports
> >> RTD3.  If that's wrong, this can be changed for the series.
> >>
> >
> > Nouveau always supported RTD3, because that's mainly a kernel feature.
> > When those were introduced we simply had a bug only hit on a few
> > systems. And instead of helping us to debug this, this workaround was
> > added :( We were not even asked about this.
>
> My apologies, I was certainly part of the impetus for this W/A in the
> first place while I was at my previous employer.  Your comment
> re-affirms to me that at least the first patch is correct.
>

Yeah, no worries. I just hope that people in the future will
communicate such things.

Anyway, there are a few issues with the runpm stuff left, and looking
at what nvidia does in their open driver makes me wonder if we might
need a bigger overhaul of runpm. They do apply bridge/host controller
specific workarounds and I suspect some of them are related here as
the workaround I came up with in nouveau can be seen in 434fdb51513bf.

But also having access to documentation/specification from what Nvidia
is doing would be quite helpful. We know that on some really new AMD
systems we run into new issues and this needs some investigation. I
simply don't access to any laptops where this problem can be seen.

> >
> > I am a bit curious about the other two though as I am not even sure
> > they are needed at all as we put other work arounds in place. @Lyude
> > Paul might know more about these.
> >
>
> If the other two really aren't needed anymore, then yeah we should just
> tear all 3 out.  If that's the direction we go, I would appreciate some
> commit IDs to reference in the commit message for tearing them out so
> that if they end up backporting to stable we know how far they should go.
>

