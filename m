Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D50244498C
	for <lists+nouveau@lfdr.de>; Wed,  3 Nov 2021 21:29:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78C8E6E8CD;
	Wed,  3 Nov 2021 20:29:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E9746E8CD
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 20:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635971389;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=JYXXoD382YlaWwsm8RhT98RSUt90ubtt9LhxFyoOKpU=;
 b=i69iRZyOSJt/M8oCOQyhZ5QYTfD0Nii+nn9t1bQNuK/vnEw8hx4tAMhmERlzqEuBD6261o
 fHZjQrEcbxc9R1RzJIYi438hycu1oJnIXpLYfu88/0JJVijkT6LcYkckBxx0kyEMXbp+kc
 cDuPIOum0zhLIX/+Vt6f1rYAlY2WTWc=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-378-CJBzd2E-OGSJJObiSrABkQ-1; Wed, 03 Nov 2021 16:29:42 -0400
X-MC-Unique: CJBzd2E-OGSJJObiSrABkQ-1
Received: by mail-wm1-f71.google.com with SMTP id
 j25-20020a05600c1c1900b00332372c252dso1615868wms.1
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 13:29:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=JYXXoD382YlaWwsm8RhT98RSUt90ubtt9LhxFyoOKpU=;
 b=JH+vWIIVqU2WfmSYaJRMcHpWxDoaIiJl09TRPpnYmWUnPK7UIu6VHTwuHgza4Lludr
 xcypPSgjTM9IXocuTHDZ+N2WgAmp8Yi2/5+RKnVWjqsPMun3+BGbEX7h82oTSSeH/ozb
 chvLTD/QuytqqahM4+4WBh4hAst8hHTO8cDOwbsSiZE1miP+8a4hRquKAHljwVyPyJFD
 NPcokREpX3Nsy2MenMjWamfmaJHHi7nmBsg/A2/o9J5PDV5t/eOYNjSNGI8wjUjN9Ai8
 E4OF/c+eFmIQphdGvBHYpOKrJ9WG8limiCHFiXnCYgGV+MRjNo0+Wx/+ZJylMmcIBlVe
 mgiQ==
X-Gm-Message-State: AOAM533KakJhMee9J9V6hJIpAoYhvgapn0Yb5vScCZClSdyseSES7zO7
 V9xnV2jTjYJzUsl6fRnDjt5Nf2wh02QWw5ql80lCU/XxaS+LUDtkaFOT79CJKeWIU+fJguEqJmD
 rff8hsqnEFZMYzmF/+vQScrwVFy9V0uAZNsgElKo8rw==
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr42336871wrw.116.1635971380582; 
 Wed, 03 Nov 2021 13:29:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfxtpdZAb0gL1AyUceKUTqCM9ysy/gh/RGCREHQblh5YqhTwn/yGQ6pNsAfrWkscr3Mxm3+yr4U09BDGEkSO4=
X-Received: by 2002:a5d:68ce:: with SMTP id p14mr42336850wrw.116.1635971380397; 
 Wed, 03 Nov 2021 13:29:40 -0700 (PDT)
MIME-Version: 1.0
References: <20211101082511.254155853@linuxfoundation.org>
 <20211101082518.624936309@linuxfoundation.org>
 <871r3x2f0y.fsf@turtle.gmx.de>
In-Reply-To: <871r3x2f0y.fsf@turtle.gmx.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 3 Nov 2021 21:29:29 +0100
Message-ID: <CACO55tsq6DOZnyCZrg+N3m_hseJfN_6+YhjDyxVBAGq9PFJmGA@mail.gmail.com>
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

On Wed, Nov 3, 2021 at 8:52 PM Sven Joachim <svenjoac@gmx.de> wrote:
>
> On 2021-11-01 10:17 +0100, Greg Kroah-Hartman wrote:
>
> > From: Christian K=C3=B6nig <christian.koenig@amd.com>
> >
> > commit 0db55f9a1bafbe3dac750ea669de9134922389b5 upstream.
> >
> > We need to cleanup the fences for ghost objects as well.
> >
> > Signed-off-by: Christian K=C3=B6nig <christian.koenig@amd.com>
> > Reported-by: Erhard F. <erhard_f@mailbox.org>
> > Tested-by: Erhard F. <erhard_f@mailbox.org>
> > Reviewed-by: Huang Rui <ray.huang@amd.com>
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214029
> > Bug: https://bugzilla.kernel.org/show_bug.cgi?id=3D214447
> > CC: <stable@vger.kernel.org>
> > Link: https://patchwork.freedesktop.org/patch/msgid/20211020173211.2247=
-1-christian.koenig@amd.com
> > Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> > ---
> >  drivers/gpu/drm/ttm/ttm_bo_util.c |    1 +
> >  1 file changed, 1 insertion(+)
> >
> > --- a/drivers/gpu/drm/ttm/ttm_bo_util.c
> > +++ b/drivers/gpu/drm/ttm/ttm_bo_util.c
> > @@ -322,6 +322,7 @@ static void ttm_transfered_destroy(struc
> >       struct ttm_transfer_obj *fbo;
> >
> >       fbo =3D container_of(bo, struct ttm_transfer_obj, base);
> > +     dma_resv_fini(&fbo->base.base._resv);
> >       ttm_bo_put(fbo->bo);
> >       kfree(fbo);
> >  }
>
> Alas, this innocuous looking commit causes one of my systems to lock up
> as soon as run startx.  This happens with the nouveau driver, two other
> systems with radeon and intel graphics are not affected.  Also I only
> noticed it in 5.10.77.  Kernels 5.15 and 5.14.16 are not affected, and I
> do not use 5.4 anymore.
>
> I am not familiar with nouveau's ttm management and what has changed
> there between 5.10 and 5.14, but maybe one of their developers can shed
> a light on this.
>
> Cheers,
>        Sven
>

could be related to 265ec0dd1a0d18f4114f62c0d4a794bb4e729bc1

