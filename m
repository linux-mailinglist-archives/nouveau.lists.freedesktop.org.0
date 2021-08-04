Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C53C83E086C
	for <lists+nouveau@lfdr.de>; Wed,  4 Aug 2021 20:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F85C6E438;
	Wed,  4 Aug 2021 18:59:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A56316E44B
 for <nouveau@lists.freedesktop.org>; Wed,  4 Aug 2021 18:59:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1628103592;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=m6Y9wLKgvbcBXmzq59WFKbPsBB9KXRj1k5gZ7Uo0zgM=;
 b=icQX1Ams6B2JTt9m+5XXi+9DByF93OdInlih0qJhTCjc80sJXmpSpibjSfPDVO4s6yB/YG
 4iRqqY+AfVQxUBlVq5wXg92GU6TbjPcKQ22vcBKkudD1o2Vb7d++wnQKN/VTr0gCno88DD
 HNqb1Z9uL0wZ7WzFLdlVJD+zLJVCLlk=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-349-1mh-pelrMamCDnzMCCyzNg-1; Wed, 04 Aug 2021 14:59:51 -0400
X-MC-Unique: 1mh-pelrMamCDnzMCCyzNg-1
Received: by mail-wr1-f70.google.com with SMTP id
 q13-20020a05600000cdb02901545f1bdac1so1152780wrx.4
 for <nouveau@lists.freedesktop.org>; Wed, 04 Aug 2021 11:59:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=m6Y9wLKgvbcBXmzq59WFKbPsBB9KXRj1k5gZ7Uo0zgM=;
 b=nSEujIcVFp+22z5JyyKXWaLJdBJ20qcMqCuvcfJrbR4gVCSoIjVPEefaeoYVM6rw7z
 KlgFVbGtJvaA6tv2McHNtT6k4eB1x42Wvmr2s3/kM5TaIRB6+wmzVC/J02fPUBtce7ug
 bJwBwMybSThcQR2oDJl8h+fNijB2ZId5RQj1EGImQobkTk+REqVStdanTEXi7dBTOA7g
 3FPvoIphDCE3DpwRUDtLptxgG2tbjmWXk2YJIdbfnrxlof/QQZjc8dSWk/79zIEUn+SL
 Brxx/qY70aG62RvAnGMFlaUC5cdztusGgoctPzJq0CQpCHdqCcs368NtnNQtSDF4+sOu
 z6Tw==
X-Gm-Message-State: AOAM533cZjVGkm5o2FExyV5Q/LWPDQJPF1/xmk9YlrxiznGWceMJI+VE
 cQSfbuk8rE7i0RSvi9iqA2W06xSMdOwGaoOXMTBGXz1ZG6fgSA9KWGDU1rVLao4Q/8VW9Kf6mrK
 46zeYdTRhWJmuoQITX5s4P7+03r8jI+tsZihq1PrGOA==
X-Received: by 2002:a1c:4c:: with SMTP id 73mr11093302wma.139.1628103590252;
 Wed, 04 Aug 2021 11:59:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxhSQsWnmHBJ0c+6q+9oNf5P9jAy2HMqrpqSesVTuGeJ7py4jp3l1Ku85Qc9jxKYKufAhOS69CECl/Kud9SaJo=
X-Received: by 2002:a1c:4c:: with SMTP id 73mr11093289wma.139.1628103590064;
 Wed, 04 Aug 2021 11:59:50 -0700 (PDT)
MIME-Version: 1.0
References: <CAK8P3a0i0WP24Z0TScmPqKxmM2ovtKnmm+qZq6+Tc1ju+hma0w@mail.gmail.com>
 <20210804141049.499767-1-kherbst@redhat.com>
 <CAK8P3a136c_L3yVn-841Sbfib9UMOf1M-pk+2SqWt0wD2zfRKQ@mail.gmail.com>
 <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
In-Reply-To: <CACO55tsLpURTm=Jf=4gRVtYQbit5h2OBYw_MFb6Vf1PFvTV7dw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 4 Aug 2021 20:59:39 +0200
Message-ID: <CACO55tuy5Am9zbcR490KWYYAg7MguBN5m82vbjzifGN5KpGbxw@mail.gmail.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Lyude Paul <lyude@redhat.com>, 
 Ben Skeggs <bskeggs@redhat.com>, Randy Dunlap <rdunlap@infradead.org>, 
 Daniel Vetter <daniel@ffwll.ch>, ML nouveau <nouveau@lists.freedesktop.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] depend on BACKLIGHT_CLASS_DEVICE for more
 devices
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Aug 4, 2021 at 4:43 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Aug 4, 2021 at 4:19 PM Arnd Bergmann <arnd@kernel.org> wrote:
> >
> > On Wed, Aug 4, 2021 at 4:10 PM Karol Herbst <kherbst@redhat.com> wrote:
> > >
> > > playing around a little bit with this, I think the original "select
> > > BACKLIGHT_CLASS_DEVICE" is fine. Atm we kind of have this weird mix of
> > > drivers selecting and others depending on it. We could of course convert
> > > everything over to depend, and break those cycling dependency issues with
> > > this.
> > >
> > > Anyway this change on top of my initial patch is enough to make Kconfig
> > > happy and has the advantage of not having to mess with the deps of nouveau
> > > too much.
> >
> > Looks good to me. We'd probably want to make the BACKLIGHT_CLASS_DEVICE
> > option itself 'default FB || DRM' though, to ensure that defconfigs
> > keep working.
> >
>
> okay cool. Will send out a proper updated patch series soonish.
>

mhh, actually that breaks drivers selecting FB_BACKLIGHT as now
BACKLIGHT_CLASS_DEVICE might be disabled :(

somehow it doesn't feel like worth the effort converting it all over
to depend.. dunno.

Atm I would just use "select" in nouveau and deal with the conversion
later once somebody gets annoyed enough or so...

> >       Arnd
> >

