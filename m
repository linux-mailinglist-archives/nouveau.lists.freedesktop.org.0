Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDE6F846674
	for <lists+nouveau@lfdr.de>; Fri,  2 Feb 2024 04:17:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3F6510ED8D;
	Fri,  2 Feb 2024 03:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="OMfuwREF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com
 [209.85.218.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEE4110ED8D
 for <nouveau@lists.freedesktop.org>; Fri,  2 Feb 2024 03:17:01 +0000 (UTC)
Received: by mail-ej1-f44.google.com with SMTP id
 a640c23a62f3a-a271a28aeb4so242151166b.2
 for <nouveau@lists.freedesktop.org>; Thu, 01 Feb 2024 19:17:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706843820; x=1707448620; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=Btg7ZQ/FO1ntFLzC3fbpm2l59h2UFyvCqMi/lPgfQjA=;
 b=OMfuwREFMID0MIoGMtzRpv3CWEazTRClmEHYVeOpe0NqRiV/ulknKC0cq3xDcfLN/y
 +WqOhjkau9Jt5tlwe8zNBSChMI9HxLGMkTWGZUK3O/ufzLomEevHdMtodbaOoYJ4Tx1p
 /5pUMqqmnk1CSgY9R3Viy975DX6GrxjSIr27c71iuC6eTa0XXo4KY2XK3yPioSJVg8dI
 f8GsRaKyg9EbU3WT8+RB0dMWnLtM/sT7mclXM0PCDJBPMt79HJN9y4a1urK9H9bOg6gP
 yNZ9wp/4A8Qa/TpeFa99Vni/x1I0sdnJCsSaMBvGVvOcx2iJXc95hGB+eXdBSCe7qAii
 B9Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706843820; x=1707448620;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Btg7ZQ/FO1ntFLzC3fbpm2l59h2UFyvCqMi/lPgfQjA=;
 b=SUeM8/QGZFLRebuoIRn4CbfbsdFbqq4ULTn4WS0LEdg5IPLXjNVKI3dFDS8A51XVZC
 OrDkvnqtuTbUSt5HGu5g1rK0uxfNHxT9RqONmE++2yt/QxOLKwZ+TRj5/tHpKkyYwfv8
 1XZBZNwoUqAwB/cj67HBnoSeYdmAYBAeuFkfAFfG6Xm6IkuDbgpSBFWdQh1HaMPhfqrg
 ax+lHtLP4IUOIFv6nUgpAv6deoUq1aJaPJ/Vsi1orml0bHeJHeKENhc6EIdBGDAANDNL
 7hbtk6IV0nfKLfIPZ+2JM9hBFpiX/U2KJwNqQZFAei1SsarL8a/kODfhEziQDFwyteIU
 ZFGA==
X-Gm-Message-State: AOJu0Yz8CozU+y5P3m+8qrx5h5EVTy885S1flbnHWiOOSbXdlLg7WMpI
 6g+L2aJkKs7pkh+UiypHaA8xa4kv0XB4GWxDSv82adb8BG5yJY2i3ZbbQ6EvXN/1B6vF6l8t8xg
 /4JcsqX8J5sj+xNaOh2tkrjMUXys=
X-Google-Smtp-Source: AGHT+IF0ZLrKIAkNU2T7Wjwsm+wEI38mOjXoV2mudFGW6imuEQrAQILz8aPteplVHcIP72fCb9RfLFveT8JwGBu5aQo=
X-Received: by 2002:a17:906:680a:b0:a35:b827:e5f7 with SMTP id
 k10-20020a170906680a00b00a35b827e5f7mr534104ejr.50.1706843820038; Thu, 01 Feb
 2024 19:17:00 -0800 (PST)
MIME-Version: 1.0
References: <20240201195502.1706490-1-ttabi@nvidia.com>
 <668e68a40a81d751682033684e049dda07ab049d.camel@nvidia.com>
In-Reply-To: <668e68a40a81d751682033684e049dda07ab049d.camel@nvidia.com>
From: Dave Airlie <airlied@gmail.com>
Date: Fri, 2 Feb 2024 13:16:48 +1000
Message-ID: <CAPM=9txV2cByuVZayeY=DJtWA4oZLj-aHFTssT3hP=y9h56zxw@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: fix several DMA buffer leaks
To: Timur Tabi <ttabi@nvidia.com>
Cc: "airlied@redhat.com" <airlied@redhat.com>, 
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 2 Feb 2024 at 07:33, Timur Tabi <ttabi@nvidia.com> wrote:
>
> On Thu, 2024-02-01 at 13:55 -0600, Timur Tabi wrote:
> > +static void
> > +nvkm_gsp_mem_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_mem *mem)
> > +{
> > +       if (mem->data) {
> > +               dma_free_coherent(gsp->subdev.device->dev, mem->size, mem-
> > >data, mem->addr);
> > +               mem->data = NULL;
> > +               mem->addr = 0;
> > +       }
> > +}
>
> Dave, what do you think about doing this:
>
> if (mem->data) {
>
>         memset(mem->data, 0, mem->size);   <-------
>
>         dma_free_coherent(gsp->subdev.device->dev, mem->size,
> mem->data, mem->addr);
>         mem->data = NULL;
>         mem->addr = 0;
> }
>
> This would help situations where a buffer is access by GSP-RM after we think
> it's safe to free it.

I'd prefer to fill it with a posion value than 0

Dave.
