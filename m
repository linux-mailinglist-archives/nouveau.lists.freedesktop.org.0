Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F0E0751CCC
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 11:09:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 06E1910E655;
	Thu, 13 Jul 2023 09:09:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0CD010E64E
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:09:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239342;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=hUpFy+8PT4u79LgrjVCf5QWEAaQj/iACvNS6/iRtcoM=;
 b=gnyf3NQJuuwjRfEifZNH+2T2C6rBK/0UZ12f3mkfHtYFfSazK6z7OFxieFabJ6qS6uQiS7
 FxGovzRaU8+xZX0M+/7Y3e3/uLsXtFxkFD3zECjmnsIAAE3qjF6qJsADjWIIEVdTMgQ80z
 hPoiJTWSWrNMRJ6aD8zNkSZi5o0rEd4=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-96-B-fY4p-KPtGv-9N2XKfYsw-1; Thu, 13 Jul 2023 05:09:01 -0400
X-MC-Unique: B-fY4p-KPtGv-9N2XKfYsw-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2b6c4c018aaso1227711fa.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 02:09:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239340; x=1689844140;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hUpFy+8PT4u79LgrjVCf5QWEAaQj/iACvNS6/iRtcoM=;
 b=WaKJpn4x6EE24qUoZqUq4Y9+0YCHYklqMvbnJNDKz0OhovS77Y/EkA6KGvCbZbkOfw
 L0x8/Fb5aVzRrBodWqJJ1qKUtKBCrVQZ6tcZdE4wd/PKjQ9ucnjrRPqwNr1ci1+JRKXE
 rY+k8RJAT6cELfeor4WgEyCz1IUfKmOh7pVhWNFrGS+zWe/DJxRq5C9Ztd0W4Q3ed04q
 v1OaToK/YiQYkoBDM2zOsIguZ++4KKTCmA7MmQJoKBJ1YPBdZZ71mRDituRwHBSmM7RA
 Y+6i0HDTt2AvbJrr0YF40paCvZXnbjmN3tgraPJZpyP+2urM7oMys4QOL0nhS85UquN+
 gc9A==
X-Gm-Message-State: ABy/qLZ+6jtq+34yFiw7qzBeESKOhhTcZ0EQDB10EvW0Iz3xdzb2kqd7
 mwV/xzmJGj+0L2QGQ58eT296ECua3jh/iKWh0BCl0QYQIsCdr+D3otdn/p8T9ehKA74ybxQpRNU
 AabHb7lZ6t9mDYFX+GBvIyK0/2cm61xISnV39NJB2MmZ3n/wk1wq/
X-Received: by 2002:a05:651c:1c7:b0:2b6:9b02:cf1c with SMTP id
 d7-20020a05651c01c700b002b69b02cf1cmr786691ljn.2.1689239339832; 
 Thu, 13 Jul 2023 02:08:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlHkkcDpkbmRv5mhgZhEUsmC9uPWxawlczs6fpfBEbxv/TjvIaMUhATKq+oc+c0OgRiAoxO+FmksdCen7QhUoPY=
X-Received: by 2002:a05:651c:1c7:b0:2b6:9b02:cf1c with SMTP id
 d7-20020a05651c01c700b002b69b02cf1cmr786682ljn.2.1689239339523; Thu, 13 Jul
 2023 02:08:59 -0700 (PDT)
MIME-Version: 1.0
References: <20230710063529.53769-1-xujianghui@cdjrlc.com>
 <2156ff3c1fcec8914f1493ac6d7cd807@208suo.com>
In-Reply-To: <2156ff3c1fcec8914f1493ac6d7cd807@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:08:48 +0200
Message-ID: <CACO55tuMNXZmuqSCVoRTOanWd5m26sf-nYOW7OHuhwC-gV9GwQ@mail.gmail.com>
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/i2c: do not use assignment in if
 condition
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
Cc: nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Assignments in if condition are less readable and error-prone.  Fixes
> also checkpatch warning:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by: Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> index 96bbdda0f439..a1cf406ff141 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/busgf119.c
> @@ -85,7 +85,8 @@ gf119_i2c_bus_new(struct nvkm_i2c_pad *pad, int id, u8
> drive,
>   {
>       struct gf119_i2c_bus *bus;
>
> -    if (!(bus =3D kzalloc(sizeof(*bus), GFP_KERNEL)))
> +    bus =3D kzalloc(sizeof(*bus), GFP_KERNEL);
> +    if (!bus)
>           return -ENOMEM;
>       *pbus =3D &bus->base;
>

