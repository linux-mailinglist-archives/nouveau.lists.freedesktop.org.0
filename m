Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012BC262F7E
	for <lists+nouveau@lfdr.de>; Wed,  9 Sep 2020 16:07:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 866826E329;
	Wed,  9 Sep 2020 14:07:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A5986E329
 for <nouveau@lists.freedesktop.org>; Wed,  9 Sep 2020 14:07:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599660434;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=AyBwbPv8eeKvlLBjOakfjoLGMVOfW6zd9C67uN/maIo=;
 b=er1aBiuUGnKzUEbJrlGyb6ga7iZ41NM5aTuJV3S4cNxhMBzaXVkM7ghiEXNuuaZNzTO20j
 EzhuehVWvPKBrHClpdLJd2p9hBzwJ7NaW5553fFqshtkbJfwNnixTgRwXF7rZevxrg9fo2
 yLjq51r3/kfwMPZtXVkxhPLAqZhRbMI=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-200-jPr_wr7BOh6AGleSivU0yw-1; Wed, 09 Sep 2020 10:07:10 -0400
X-MC-Unique: jPr_wr7BOh6AGleSivU0yw-1
Received: by mail-qt1-f197.google.com with SMTP id f12so1864860qtq.5
 for <nouveau@lists.freedesktop.org>; Wed, 09 Sep 2020 07:07:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=AyBwbPv8eeKvlLBjOakfjoLGMVOfW6zd9C67uN/maIo=;
 b=jOooLwwE4L/HTc8Tbdkp+C36RVjwqLN3Ydfgti66UtvMCxoWlpyWakFAKvf/2LAD+0
 GKtReECqI+iD3Ylp/sAoxMeq7utzVY95M0S++/RpsxBjZTi3AwZ07bfeDxYrvf5b/szv
 SWmTHMHkLWHQV8IMZpTS/XuVPhx42tYUDXFIhGb9r/k6cNtcX+8ZW8p58N0XYNgEfhlh
 zZDrnAXf/ZFmZmRs6y7RufXEbXBjc/gR54zDtvF2tejvXBhD9WoCeZpdYSzyJ18tC04G
 uGS3F2DLxe2SrDn1/J5eUZPYPf7zOxkfT3ee+vi2+tPvPu0G3rYuTJ7TUIqsIcVadq2s
 Ivyw==
X-Gm-Message-State: AOAM530659DZiRGn4s6VDDxQqPUfxpKLVdZOYXsfAgCCtfp17Fx95LbE
 tpsHoZw2g6d8TiEO9xAyNEq0GxbC3CFfg8zLj2g7/ziuIMfOn2OxPbsQ9tRgaoLxr3v68HD/ozJ
 XOeQzUwJvspkb/t+XHB1xc6UanA==
X-Received: by 2002:ad4:45a6:: with SMTP id y6mr4343660qvu.8.1599660429910;
 Wed, 09 Sep 2020 07:07:09 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyR62IGHKCUdInJpA3KR7u+Fm1jkeugqEcJXQiLZYHdCq9aP3hWO+P2sN+mj2H1K846ayPcXg==
X-Received: by 2002:ad4:45a6:: with SMTP id y6mr4343635qvu.8.1599660429620;
 Wed, 09 Sep 2020 07:07:09 -0700 (PDT)
Received: from dev.jcline.org ([136.56.20.95])
 by smtp.gmail.com with ESMTPSA id d76sm2649240qkc.81.2020.09.09.07.07.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Sep 2020 07:07:08 -0700 (PDT)
Date: Wed, 9 Sep 2020 10:07:06 -0400
From: Jeremy Cline <jcline@redhat.com>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <20200909140706.GA27322@dev.jcline.org>
References: <20200812204952.1921587-1-jcline@redhat.com>
 <CACAvsv71oxCYB1+LCAUHD5v_NGAP-DpxPY_dPz53iw2=91KAJg@mail.gmail.com>
 <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CACO55tvv6REmNzZZyyRSJyRT5z-xEf38+tk9cDnft63DX5JQUw@mail.gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=jcline@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
Content-Disposition: inline
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Add fine-grain temperature
 reporting
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
Cc: David Airlie <airlied@linux.ie>, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 ML dri-devel <dri-devel@lists.freedesktop.org>,
 Ben Skeggs <bskeggs@redhat.com>, Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Sep 09, 2020 at 10:22:14AM +0200, Karol Herbst wrote:
> On Wed, Sep 9, 2020 at 6:06 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> >
> > On Thu, 13 Aug 2020 at 06:50, Jeremy Cline <jcline@redhat.com> wrote:
> > >
> > > Commit d32656373857 ("drm/nouveau/therm/gp100: initial implementation of
> > > new gp1xx temperature sensor") added support for reading finer-grain
> > > temperatures, but continued to report temperatures in 1 degree Celsius
> > > increments via nvkm_therm_temp_get().
> > >
> > > Rather than altering nvkm_therm_temp_get() to report finer-grain
> > > temperatures, which would be inconvenient for other users of the
> > > function, a second interface has been added to line up with hwmon's
> > > native unit of temperature.
> > Hey Jeremy,
> >
> > Sorry this slipped past me until now.  I'm OK with adding support for
> > millidegree temperature reporting, but don't think we need to keep
> > both interfaces around and would rather see the existing code
> > converted to return millidegrees (even on GPUs that don't support it)
> > instead of degrees.
> >
> > Thanks!
> > Ben.
> >
> 
> just a note as I was trying something like that in the past: we have a
> lot of code which fetches the temperature and there are a lot of
> places where we would then do a divide by 1000, so having a wrapper
> function at least makes sense. If we want to keep the func pointers?
> well.. I guess the increased CPU overhead wouldn't be as bad if all
> sub classes do this static * 1000 as well either. I just think we
> should have both interfaces in subdev/therm.h so we can just keep most
> of the current code as is.
> 

Indeed. My initial plan was to change the meaning of temp_get() and
adjust all the users, but there's around a dozen of them and based on my
understanding of the users none of them cared much about such accuracy.

However, I do find having one way to do things appealing, so if there's
a strong preference for it, I'm happy to produce a somewhat more
invasive patch where all users expect millidegrees.

- Jeremy

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
