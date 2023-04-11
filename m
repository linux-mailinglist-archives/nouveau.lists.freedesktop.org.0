Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E65E86DDD3D
	for <lists+nouveau@lfdr.de>; Tue, 11 Apr 2023 16:05:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3076710E553;
	Tue, 11 Apr 2023 14:05:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70FDC10E391
 for <nouveau@lists.freedesktop.org>; Tue, 11 Apr 2023 14:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1681221949;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=7Ptm4DEXFusgjoGKLkYnDTCXvT/rOJ3Pu6Hnf86R9zo=;
 b=PyX6VJwvQm1z457Pv5ErwuO/BLosH3ii7rcpe2qB9Pz0TcNWns1TFpT/nDKMKGkLtaD5J5
 62aRvJPw/bshLHZSyWHaOfw21Qu7DTFi+Ch1X/2BX4szkaAQxpg6XjN2c9mnjCetKqv0aO
 EjfKeGZcX1AkZ0iYsMY7vU5KEPjVT0Y=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-127-hgby9n0pPUSzLSNKNi8GvQ-1; Tue, 11 Apr 2023 10:05:48 -0400
X-MC-Unique: hgby9n0pPUSzLSNKNi8GvQ-1
Received: by mail-lf1-f72.google.com with SMTP id
 s24-20020a197718000000b004ec89359465so2278184lfc.17
 for <nouveau@lists.freedesktop.org>; Tue, 11 Apr 2023 07:05:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1681221946;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7Ptm4DEXFusgjoGKLkYnDTCXvT/rOJ3Pu6Hnf86R9zo=;
 b=ulZaQWGXRBlmW/mj6j3p/hV/3Hv2u3tOl0XKrS4sFeZM+R3WPoRU2KK2gZznTrke2B
 Q8m9JvSGdAhEQSl5p5lHAra+r+A3SNsWO6T6UpbeSin1bY5+R+Qrp7ikql0W9ScZXlP4
 q+FBbjBz2MxVaYOvT/owq9ZJBbTPc9tlTyG4SfyWxCCu452gnzF7rqbBg1LbaSdkUc/9
 j/m2F5BclNUf4YBQoao8sg4vuOwPXPCmwrFdXtUEs8Er6IJ/AgL/fsekrQkESVI0oVxP
 J5GhSUxWmdfmfOp13uT6ZX2i9c/No6UQMLAULCPCI4BgRcmtl36OuVEAd9LsIuwsw6Kp
 flKA==
X-Gm-Message-State: AAQBX9d+v7SkChOE5A0x9JPDs30J+HB70JspZqo7N+Fr0fmsEUfYNs3A
 r8E7V2eMCmHj/2dpZ8vlZrgkY9Ha+wa1VUITifYddaWV3Giba3LOYVyD6G45b+0eicZywJGQv+4
 SFyF7mzllgJgorXqgTLkYxp3fOimGkh7+PHP+0Rh5FQ==
X-Received: by 2002:ac2:5549:0:b0:4ec:8087:b346 with SMTP id
 l9-20020ac25549000000b004ec8087b346mr3055936lfk.11.1681221946755; 
 Tue, 11 Apr 2023 07:05:46 -0700 (PDT)
X-Google-Smtp-Source: AKy350ZHNUuRwFptiOr8WxUy16ysnLhlRlVskTDI96rBiwONMf4bIomWxULQGE6LPuV3y9HwCEdj7RLbrvl/9EFHYWk=
X-Received: by 2002:ac2:5549:0:b0:4ec:8087:b346 with SMTP id
 l9-20020ac25549000000b004ec8087b346mr3055928lfk.11.1681221946462; Tue, 11 Apr
 2023 07:05:46 -0700 (PDT)
MIME-Version: 1.0
References: <20221229155249.669436-1-ben-linux@fluff.org>
In-Reply-To: <20221229155249.669436-1-ben-linux@fluff.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 11 Apr 2023 16:05:35 +0200
Message-ID: <CACO55tujarFtbLjTKGcbpuYHp-8jAdLSSrXcwRawPOtcXAKQRA@mail.gmail.com>
To: Ben Dooks <ben-linux@fluff.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/mc/ga100: make ga100_mc_device
 static
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
Cc: nouveau@lists.freedesktop.org, daniel@ffwll.ch,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Thu, Dec 29, 2022 at 4:52=E2=80=AFPM Ben Dooks <ben-linux@fluff.org> wro=
te:
>
> Make ga100_mc_device static as it isn't exported, to
> fix the following sparse warning:
>
> drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c:51:1: warning: symbol 'ga1=
00_mc_device' was not declared. Should it be static?
>
> Signed-off-by: Ben Dooks <ben-linux@fluff.org>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c b/drivers/gpu=
/drm/nouveau/nvkm/subdev/mc/ga100.c
> index 1e2eabec1a76..5d28d30d09d5 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mc/ga100.c
> @@ -47,7 +47,7 @@ ga100_mc_device_enabled(struct nvkm_mc *mc, u32 mask)
>         return (nvkm_rd32(mc->subdev.device, 0x000600) & mask) =3D=3D mas=
k;
>  }
>
> -const struct nvkm_mc_device_func
> +static const struct nvkm_mc_device_func
>  ga100_mc_device =3D {
>         .enabled =3D ga100_mc_device_enabled,
>         .enable =3D ga100_mc_device_enable,
> --
> 2.39.0
>

