Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F7D9523A7F
	for <lists+nouveau@lfdr.de>; Wed, 11 May 2022 18:41:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30A0710FF22;
	Wed, 11 May 2022 16:41:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 052C910FF22
 for <nouveau@lists.freedesktop.org>; Wed, 11 May 2022 16:41:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1652287285;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iux52UB19Xj7rG0qscst3nXbIgBW5SFalcw5GZc1f60=;
 b=NuggRo9nSuH4qUAB77TFDA2DULzxQ0RiOKL6CSNpC1ENJjeagK8/MqBSIxANdkZj+PigUA
 kRnRMHeWU03wZiJwGKco7cYQgMXRhEMUQWHiGoR4UXv+IUY3RXp6auVHCRsU0fiKpDSt+i
 RHtpDmHR4xa8T9/m4YIrT2v3jrW8jms=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-657-lnxCOFXMMcmZX8iy6NhMyw-1; Wed, 11 May 2022 12:41:24 -0400
X-MC-Unique: lnxCOFXMMcmZX8iy6NhMyw-1
Received: by mail-wr1-f72.google.com with SMTP id
 j27-20020adfb31b000000b0020c4ca11566so1042114wrd.14
 for <nouveau@lists.freedesktop.org>; Wed, 11 May 2022 09:41:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iux52UB19Xj7rG0qscst3nXbIgBW5SFalcw5GZc1f60=;
 b=rDJVmFE76QVhZjgBmSXJfPhCTVzdkCgQJNSHSzdOKxtV3Kz+rgZJuyh0uG0ETQhMWO
 bVpjMZCa0cGDslEIKi48FrWcQRNr6ECqqK9wSJ5d0SaNddTkwlpqa4TY3s55IoI5SWx2
 xvdTg16IrraEfsg2t1952z/s6ScEK4DZ9z+DoQ+oU0y4rCa3gBVLjRTZQWKaiyoliFfl
 qVtA0krTOSU21PgXNGRl8+2CPhOsWELFKxGOEnop82IEXeI8ha8/EjF7zK4Kh0UJh1zN
 A2N/05ock4sJXkVZ41gdghrBT0ziXjE//Fk/IS5Da8BM1sWIqGE6iGuGcG7bk7N7k3Ji
 gVGQ==
X-Gm-Message-State: AOAM530Z+3ODU4O1TLwKDEJKQvDPOoaSNOz+oPxIItm8HeoCC2EYEfmP
 ofAk/GdE0fpcxzfqIbddPlL7TqmXS5PYXz/7FHzgb9mcf6MpHHRZHyYn90i7itbzrw7E3cOwkAa
 8oG0eo6dEebs3HpmUkXgClR+sZo8PAf0VTdqdH5VVmA==
X-Received: by 2002:a5d:63ce:0:b0:20a:da1f:aac5 with SMTP id
 c14-20020a5d63ce000000b0020ada1faac5mr23121216wrw.589.1652287283450; 
 Wed, 11 May 2022 09:41:23 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwUgF2Cen3AaDFLngiitOaTF0b9KtAShRJidSaPA/AEkb6wEgG0B58jTDI+XuO6yCQiONDi/37FcAu2r4HREvM=
X-Received: by 2002:a5d:63ce:0:b0:20a:da1f:aac5 with SMTP id
 c14-20020a5d63ce000000b0020ada1faac5mr23121201wrw.589.1652287283262; Wed, 11
 May 2022 09:41:23 -0700 (PDT)
MIME-Version: 1.0
References: <20220511163716.3520591-1-ttabi@nvidia.com>
In-Reply-To: <20220511163716.3520591-1-ttabi@nvidia.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 11 May 2022 18:41:12 +0200
Message-ID: <CACO55tuQneQYwAq_p3ztDBOA+HnzcCOSDc=1R7h4tc3LWFJRtw@mail.gmail.com>
To: Timur Tabi <ttabi@nvidia.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] drm/nouveau: fix another off-by-one in
 nvbios_addr
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Nick Lopez <github@glowingmonkey.org>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, May 11, 2022 at 6:37 PM Timur Tabi <ttabi@nvidia.com> wrote:
>
> This check determines whether a given address is part of
> image 0 or image 1.  Image 1 starts at offset image0_size,
> so that address should be included.
>
> Fixes: 4d4e9907ff572 ("drm/nouveau/bios: guard against out-of-bounds accesses to image")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> index 64e423dddd9e..6c318e41bde0 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/bios/base.c
> @@ -33,7 +33,7 @@ nvbios_addr(struct nvkm_bios *bios, u32 *addr, u8 size)
>  {
>         u32 p = *addr;
>
> -       if (*addr > bios->image0_size && bios->imaged_addr) {
> +       if (*addr >= bios->image0_size && bios->imaged_addr) {
>                 *addr -= bios->image0_size;
>                 *addr += bios->imaged_addr;
>         }
> --
> 2.36.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

I don't like how this could fail for values spanning both images, but
at least this looks more correct.

I think in the future we should keep a copy without that gap on the
host side to make access to the vbios image cheaper. What do you say
Ben?

