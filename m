Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4957741AD94
	for <lists+nouveau@lfdr.de>; Tue, 28 Sep 2021 13:07:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B66F66E079;
	Tue, 28 Sep 2021 11:07:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C9A86E079
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 11:07:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1632827229;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=WR6VXnQsyOwoBA0NqYwQwAM8amF8J8DkhanQviHV1Bg=;
 b=cUf89hnswajcaxORMV4VhZrY5cBduGGgRBdhDrBUdyw2dZYsAyhlNlq65V57icHQQQAeXm
 qdrAXcs6TDI/FxO9elNT1GhOTTjv5QwmGokNmrG9R6NrORIs2+C0vuAxWMuuh05n+Iql7/
 83Iyjbr5tC1v+rwCIk+2zoUnd9ToE1s=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-158-LAQHil4PNmCC66eYFvcXRw-1; Tue, 28 Sep 2021 07:07:06 -0400
X-MC-Unique: LAQHil4PNmCC66eYFvcXRw-1
Received: by mail-wm1-f72.google.com with SMTP id
 x10-20020a7bc76a000000b002f8cba3fd65so970564wmk.2
 for <nouveau@lists.freedesktop.org>; Tue, 28 Sep 2021 04:07:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WR6VXnQsyOwoBA0NqYwQwAM8amF8J8DkhanQviHV1Bg=;
 b=fZOXMMuRFdTO3mdRymHcRKfIjTXwUnteyML9sQJuHrzWyGFWx04CizOvIjw+yO0X1m
 XBAbnrTargLlujcdszO+IpOKXNR4gzYbBxeZ84pdPk9pSpB/dvtQLTQcTUjiJU1h3HgD
 2xemJOpIU3T5XZYokzXzQ+50Ab1kYEZEwRmIHPrzN/FbozuxCmYouJ2S714EnWaFGIQl
 5agYr3ALkk29J63O9RTXTFVemkclAgUJj+NA4ra64NuvlQZ04BeSpdJYt3hxLLxAYvIp
 6IyiWHFHTqvH1cWCqqNX0mXrfs2HtMnd806tQT77XnEV8G0/bSgkJLk44C4kqONlZbgw
 KTCA==
X-Gm-Message-State: AOAM532MfENw10yI7w4Qs543ybkB2yC5Xu0QCObLJPKW5qe0QiRRiTHY
 y9CMwx0OXVW/wqkfgMiuWIU75sUrtj2IXCQ6B7DiWJYjeU/iHR6NnGz/CpGTC+WUPZynE5mU4lC
 oOcKoBhAeaPvDwan7ta0f1b7NRIRbhVD+fm+WfVoiCg==
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr4036171wmk.141.1632827224695; 
 Tue, 28 Sep 2021 04:07:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJw0TvRX1heajsLZFd4GGwP4vhnY328h7RyY16leHPFWlcyFhg8AWc8/US2AUGlQu71mjn+OzM8EFLIlyzTcL7Y=
X-Received: by 2002:a7b:c5c9:: with SMTP id n9mr4036143wmk.141.1632827224471; 
 Tue, 28 Sep 2021 04:07:04 -0700 (PDT)
MIME-Version: 1.0
References: <20201203000220.18238-1-jcline@redhat.com>
 <7f51dbe3dac85f692e01bb5cecdf4454a40b1893.camel@redhat.com>
In-Reply-To: <7f51dbe3dac85f692e01bb5cecdf4454a40b1893.camel@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 28 Sep 2021 13:06:53 +0200
Message-ID: <CACO55ttDK4eCZ-RUOnPRLawZYUbX9xyXDnqwB=4z7vNrZkkvxg@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
Cc: Jeremy Cline <jcline@redhat.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>, 
 Thierry Reding <treding@nvidia.com>, LKML <linux-kernel@vger.kernel.org>, 
 dri-devel <dri-devel@lists.freedesktop.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau: avoid a use-after-free when BO
 init fails
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

Reviewed-by: Karol Herbst <kherbst@redhat.com>

and queued

On Fri, Mar 26, 2021 at 10:41 PM Lyude Paul <lyude@redhat.com> wrote:
>
> Reviewed-by: Lyude Paul <lyude@redhat.com>
>
> On Wed, 2020-12-02 at 19:02 -0500, Jeremy Cline wrote:
> > nouveau_bo_init() is backed by ttm_bo_init() and ferries its return code
> > back to the caller. On failures, ttm_bo_init() invokes the provided
> > destructor which should de-initialize and free the memory.
> >
> > Thus, when nouveau_bo_init() returns an error the gem object has already
> > been released and the memory freed by nouveau_bo_del_ttm().
> >
> > Fixes: 019cbd4a4feb ("drm/nouveau: Initialize GEM object before TTM object")
> > Cc: Thierry Reding <treding@nvidia.com>
> > Signed-off-by: Jeremy Cline <jcline@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nouveau_gem.c | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > index 787d05eefd9c..d30157cc7169 100644
> > --- a/drivers/gpu/drm/nouveau/nouveau_gem.c
> > +++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
> > @@ -211,10 +211,8 @@ nouveau_gem_new(struct nouveau_cli *cli, u64 size, int
> > align, uint32_t domain,
> >         }
> >
> >         ret = nouveau_bo_init(nvbo, size, align, domain, NULL, NULL);
> > -       if (ret) {
> > -               nouveau_bo_ref(NULL, &nvbo);
> > +       if (ret)
> >                 return ret;
> > -       }
> >
> >         /* we restrict allowed domains on nv50+ to only the types
> >          * that were requested at creation time.  not possibly on
>
> --
> Sincerely,
>    Lyude Paul (she/her)
>    Software Engineer at Red Hat
>
> Note: I deal with a lot of emails and have a lot of bugs on my plate. If you've
> asked me a question, are waiting for a review/merge on a patch, etc. and I
> haven't responded in a while, please feel free to send me another email to check
> on my status. I don't bite!
>
> _______________________________________________
> dri-devel mailing list
> dri-devel@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/dri-devel

