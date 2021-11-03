Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 495A4444993
	for <lists+nouveau@lfdr.de>; Wed,  3 Nov 2021 21:33:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E9F57A30D;
	Wed,  3 Nov 2021 20:33:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91CD47A30D
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 20:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635971579;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=gfQZLDxKX9/JNdtn85c81b4wR0b9S/y3uO901LWse8U=;
 b=QA4t5P78+HShMuUBgjMkbKNNQPQY8U8sGyhxzszMTvSnx5f4GIxqJDh5qBvR8ZnN76lFi/
 TEAZcNt3iFLjlz6P4eWKiJV8f0waw/SoQtUT/wyZ1AQOMZ4zCcg1HS4PpkscaXRRc6GkF1
 kNEUaNerpIbSP+77SFsPYCw1SYAZao8=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-107-5Q9pNWuKP_KADCoVNDziWg-1; Wed, 03 Nov 2021 16:32:56 -0400
X-MC-Unique: 5Q9pNWuKP_KADCoVNDziWg-1
Received: by mail-wm1-f70.google.com with SMTP id
 69-20020a1c0148000000b0033214e5b021so1581116wmb.3
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 13:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=gfQZLDxKX9/JNdtn85c81b4wR0b9S/y3uO901LWse8U=;
 b=vyRxrp/MCbaT5HCQNPNdCdFkBUjyqkgLIlmcjvL+kvrLZgqCsiMlJ4aUJj0J89xGFS
 HUOUBK0OADodRmHXvJy8Em+E0M86Pehi0U/ieWU9PuUlwAUvzOvXSWUf+qXNFChe6Bo6
 bdmsKK3W3ccvKnjQZXHVigFOAaVMSTcmk+Fz3BeQhfsKxztx5yuNx9HOqzozM9JCm8zZ
 QxoGF75xBQ0Ws4ME3AEJhReUKnpDUj0rgZ+QPeLvV0QEp02GJgyND7VR5NZnvMOQmber
 l/uHJ20g+nceQzy3bBMsDK5iWhEgSZB6oPlH4fU+T0fJCKqABoweR5bE51cN/PQr1X3O
 hCqg==
X-Gm-Message-State: AOAM533XlOX8wlJdYEQegrQNAJl2xTwMsQGAR90RRRRjhgR5R/Rdhwzs
 W3oWrDonoqmF/SbMhEcCsXjWUJ9YWT41djQzK+EBxLcrsY8sQGWzfkT1ElgIuBQmliNGVO0tHxf
 7iuhk1X/c3G7WmrLSBp2x5iyvwOvVmCMkTK5F101Q4g==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr42357377wrw.116.1635971574477; 
 Wed, 03 Nov 2021 13:32:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwaqj5Gs323amjeimgkzdO2tqEMBafiLuOySEH+DhXBTc0oejehhYPZYhUBqzOi2hU5Xn/Csb1p+6irM4y+lT8=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr42357362wrw.116.1635971574338; 
 Wed, 03 Nov 2021 13:32:54 -0700 (PDT)
MIME-Version: 1.0
References: <20211101082511.254155853@linuxfoundation.org>
 <20211101082518.624936309@linuxfoundation.org>
 <871r3x2f0y.fsf@turtle.gmx.de>
 <CACO55tsq6DOZnyCZrg+N3m_hseJfN_6+YhjDyxVBAGq9PFJmGA@mail.gmail.com>
In-Reply-To: <CACO55tsq6DOZnyCZrg+N3m_hseJfN_6+YhjDyxVBAGq9PFJmGA@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 3 Nov 2021 21:32:43 +0100
Message-ID: <CACO55tsQVcUHNWAkWcbJ8i-S5pgKhrin-Nb3JYswcBPDd3Wj4w@mail.gmail.com>
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

On Wed, Nov 3, 2021 at 9:29 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Nov 3, 2021 at 8:52 PM Sven Joachim <svenjoac@gmx.de> wrote:
> >
> > On 2021-11-01 10:17 +0100, Greg Kroah-Hartman wrote:
> >
> > > From: Christian K=C3=B6nig <christian.koenig@amd.com>
> > >
> > > commit 0db55f9a1bafbe3dac750ea669de9134922389b5 upstream.
> > >
> > > We need to cleanup the fences for ghost objects as well.
> > >
> > > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > > Reported-by: Erhard F. <erhard_f@mailbox.org>
> > > Tested-by: Erhard F. <erhard_f@mailbox.org>
> > > Reviewed-by: Huang Rui <ray.huang@amd.com>
> > > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214029
> > > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214447
> > > CC: <stable@vger.kernel.org>
> > > Link: https://patchwork.freedesktop.org/patch/msgid/20211020173211.22=
47-1-christian.koenig@amd.com
> > > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > > ---
> > >  drivers/gpu/drm/ttm/ttm_bo_util.c |    1 +
> > >  1 file changed, 1 insertion(+)
> > >
> > > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > > @@ -322,6 +322,7 @@ static void ttm_transfered_destroy(struc
> > >       struct ttm_transfer_obj *fbo;
> > >
> > >       fbo =3D container_of(bo, struct ttm_transfer_obj, base);
> > > +     dma_resv_fini(&fbo->base.base._resv);
> > >       ttm_bo_put(fbo->bo);
> > >       kfree(fbo);
> > >  }
> >
> > Alas, this innocuous looking commit causes one of my systems to lock up
> > as soon as run startx.  This happens with the nouveau driver, two other
> > systems with radeon and intel graphics are not affected.  Also I only
> > noticed it in 5.10.77.  Kernels 5.15 and 5.14.16 are not affected, and =
I
> > do not use 5.4 anymore.
> >
> > I am not familiar with nouveau's ttm management and what has changed
> > there between 5.10 and 5.14, but maybe one of their developers can shed
> > a light on this.
> >
> > Cheers,
> >        Sven
> >
>
> could be related to 265ec0dd1a0d18f4114f62c0d4a794bb4e729bc1

maybe not.. but I did remember there being a few tmm related patches
which only hurt nouveau :/  I guess one could do a git bisect to
figure out what change "fixes" it. On which GPU do you see this
problem?

