Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88185444A37
	for <lists+nouveau@lfdr.de>; Wed,  3 Nov 2021 22:26:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 499307A455;
	Wed,  3 Nov 2021 21:26:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24B8F7A454
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 21:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635974772;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=Znlql06AhhI7EaphpwppCQqpnxjsVHdYSJklJrdqL1M=;
 b=UgVstBDzG83/TybO/9nPQ/MxjO4Id1P789/KSDVLRmHqUW+JrK9VB0MGq19YByifiAg946
 vey3FmFw0qyiTaf4IekHZvzGBGPLhkgZEJFUPkRKZ+kpSzXWdk1C9pvfBN7dUZL3gGCJTL
 +TSNkofyBaSR/l7uZbNvQqVIt+J2qnw=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-8XnpODIwNeC1fmks7scIpA-1; Wed, 03 Nov 2021 17:26:10 -0400
X-MC-Unique: 8XnpODIwNeC1fmks7scIpA-1
Received: by mail-wm1-f70.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so1638049wmb.3
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 14:26:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=Znlql06AhhI7EaphpwppCQqpnxjsVHdYSJklJrdqL1M=;
 b=LdVS03wjjXCyIzXMzM3OHEy8JEenFl+AnWaQ0IEymxV9uY6xRzLl3ovFVnDsmCKyJQ
 F+4yZh3YeE2m05NVm/ELnC66gAUJK1PxKNrwAAyJ5Yx9emfVaQLvd0MCt1wrCx+9NuXP
 mKRLuZnEld/qoUfIjnYloT50f+AvbGDmJWeHzLkSUbdSQW5zLTfQ2zZ57fkxdIGhtnYR
 DrI0K107V7PHr2uGwscP8fXGGM8/Fc5WCx2JEyUOs/Eq1oqf3tCd1/vDiZNV+YE8rWCP
 A+HeienP/gQRYAszVyreyT/Ixk19Pt8v+T+1Rn3MdgyUp0n5UuW6Je0QmaBxEMWs0TJ3
 Rptw==
X-Gm-Message-State: AOAM530arv18kUXIG0d06ij9hXZ+Cu32nGMLUjGma4eurQr8cMqi77rI
 S9K8X4hTLjRR+ZvKGW7Tpwhlv/yTP/GVGn63HanaDH/xUBWQA5cWW6M+4dwSRO+4jV2+E5lPStc
 UBIxeiUfP0fkKbbymKcte5GyQJyL+nC+SUpc4se3C9Q==
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr5061527wry.142.1635974768671; 
 Wed, 03 Nov 2021 14:26:08 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxwEJRXkYNzDroD2U2ofyOYD+EctMvHrMm2ahndQNqZj0d+LO2dkGqQ/YFDy55GG7GxIjNBx/OX2kxn9iLDPiU=
X-Received: by 2002:a05:6000:2ae:: with SMTP id
 l14mr5061507wry.142.1635974768434; 
 Wed, 03 Nov 2021 14:26:08 -0700 (PDT)
MIME-Version: 1.0
References: <20211101082511.254155853@linuxfoundation.org>
 <20211101082518.624936309@linuxfoundation.org>
 <871r3x2f0y.fsf@turtle.gmx.de>
 <CACO55tsq6DOZnyCZrg+N3m_hseJfN_6+YhjDyxVBAGq9PFJmGA@mail.gmail.com>
 <CACO55tsQVcUHNWAkWcbJ8i-S5pgKhrin-Nb3JYswcBPDd3Wj4w@mail.gmail.com>
 <87tugt0xx6.fsf@turtle.gmx.de>
In-Reply-To: <87tugt0xx6.fsf@turtle.gmx.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 3 Nov 2021 22:25:57 +0100
Message-ID: <CACO55tsNKKTW6X_+Ym0oySX-iNtikyV6rgHGu01Co7_mDWkxhg@mail.gmail.com>
To: Sven Joachim <svenjoac@gmx.de>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 5.10 32/77] drm/ttm: fix memleak in
 ttm_transfered_destroy
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
Cc: "Erhard F." <erhard_f@mailbox.org>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, stable@vger.kernel.org,
 Huang Rui <ray.huang@amd.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Nov 3, 2021 at 9:47 PM Sven Joachim <svenjoac@gmx.de> wrote:
>
> On 2021-11-03 21:32 +0100, Karol Herbst wrote:
>
> > On Wed, Nov 3, 2021 at 9:29 PM Karol Herbst <kherbst@redhat.com> wrote:
> >>
> >> On Wed, Nov 3, 2021 at 8:52 PM Sven Joachim <svenjoac@gmx.de> wrote:
> >> >
> >> > On 2021-11-01 10:17 +0100, Greg Kroah-Hartman wrote:
> >> >
> >> > > From: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> > >
> >> > > commit 0db55f9a1bafbe3dac750ea669de9134922389b5 upstream.
> >> > >
> >> > > We need to cleanup the fences for ghost objects as well.
> >> > >
> >> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> >> > > Reported-by: Erhard F. <erhard_f@mailbox.org>
> >> > > Tested-by: Erhard F. <erhard_f@mailbox.org>
> >> > > Reviewed-by: Huang Rui <ray.huang@amd.com>
> >> > > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214029
> >> > > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214447
> >> > > CC: <stable@vger.kernel.org>
> >> > > Link: https://patchwork.freedesktop.org/patch/msgid/20211020173211=
.2247-1-christian.koenig@amd.com
> >> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> >> > > ---
> >> > >  drivers/gpu/drm/ttm/ttm_bo_util.c |    1 +
> >> > >  1 file changed, 1 insertion(+)
> >> > >
> >> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> >> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> >> > > @@ -322,6 +322,7 @@ static void ttm_transfered_destroy(struc
> >> > >       struct ttm_transfer_obj *fbo;
> >> > >
> >> > >       fbo =3D container_of(bo, struct ttm_transfer_obj, base);
> >> > > +     dma_resv_fini(&fbo->base.base._resv);
> >> > >       ttm_bo_put(fbo->bo);
> >> > >       kfree(fbo);
> >> > >  }
> >> >
> >> > Alas, this innocuous looking commit causes one of my systems to lock=
 up
> >> > as soon as run startx.  This happens with the nouveau driver, two ot=
her
> >> > systems with radeon and intel graphics are not affected.  Also I onl=
y
> >> > noticed it in 5.10.77.  Kernels 5.15 and 5.14.16 are not affected, a=
nd I
> >> > do not use 5.4 anymore.
> >> >
> >> > I am not familiar with nouveau's ttm management and what has changed
> >> > there between 5.10 and 5.14, but maybe one of their developers can s=
hed
> >> > a light on this.
> >> >
> >> > Cheers,
> >> >        Sven
> >> >
> >>
> >> could be related to 265ec0dd1a0d18f4114f62c0d4a794bb4e729bc1
> >
> > maybe not.. but I did remember there being a few tmm related patches
> > which only hurt nouveau :/  I guess one could do a git bisect to
> > figure out what change "fixes" it.
>
> Maybe, but since the memory leaks reported by Erhard only started to
> show up in 5.14 (if I read the bugzilla reports correctly), perhaps the
> patch should simply be reverted on earlier kernels?
>

Yeah, I think this is probably the right approach.

> > On which GPU do you see this problem?
>
> On an old GeForce 8500 GT, the whole PC is rather ancient.
>
> Cheers,
>        Sven
>

