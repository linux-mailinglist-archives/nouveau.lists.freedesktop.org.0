Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B9F470BB4A
	for <lists+nouveau@lfdr.de>; Mon, 22 May 2023 13:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA7A10E2C8;
	Mon, 22 May 2023 11:13:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FC6510E2C8
 for <nouveau@lists.freedesktop.org>; Mon, 22 May 2023 11:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1684753997;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kd+PsvNileg5XRg62rxcYULjvxE2s9HN/H5lXiFohgM=;
 b=ZldgP6g1wMg9ZwUuT0LFCDkYESJO3o/KRPCubhQuBeTXIOeVnC7XA6v/cJVR6RyDBMdCjM
 tqUxwbBQRoarQB4oxE5I3UL5jI3/HpJK7EP0NM/7+2FEn5+tLH2b5GQROC4sSFKkRTxl/V
 wA+T+lamGN8Zjiah/JSOJ+FP70H9CGg=
Received: from mail-lf1-f71.google.com (mail-lf1-f71.google.com
 [209.85.167.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-126-5v_6o8UaN7KJVCKab1ha5w-1; Mon, 22 May 2023 07:13:15 -0400
X-MC-Unique: 5v_6o8UaN7KJVCKab1ha5w-1
Received: by mail-lf1-f71.google.com with SMTP id
 2adb3069b0e04-4f37c278008so234398e87.1
 for <nouveau@lists.freedesktop.org>; Mon, 22 May 2023 04:13:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684753994; x=1687345994;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kd+PsvNileg5XRg62rxcYULjvxE2s9HN/H5lXiFohgM=;
 b=Czqyq4yNFt9uqHEKqw5odIn9SOsHnBFHfcDeCQ5Uc1Si/lQeudxvPmKjQTvVBL0Iia
 K7CBLlnR0CRbl/2GhnSkb35mE2nJ7jLLLqmOMEbhWQZ/SgczJgZ3pUaQttbsgFAQzCN1
 RlY+2v9ykP50FDw8v8yx5tauqAbzlFbpe1LItBUO7NyAC/GBMFUmGgL+H/GPFJYM3J+z
 Mk0uGnIPRM4YK75Iv594M/N69Xbh/5EiraN6qttX838+Vs9JUrR21bfGjoPF4OJTB3dE
 zsuEQ0lt/apFiTArFxsZwimWW+lmwkkRl7sitIZoWbZkPz1BD8AZw6t5MsvRfdYHqayZ
 7j+A==
X-Gm-Message-State: AC+VfDz8azKtn1oe8PZ8NJ1Nd4xmRXW4jDT4OScqejQS6huAt65UB5Sq
 eXiJBQhWzXHFKZSi8mxA3xVYylsm7htb2uub550vz5Ff9LQNGfFj7MXpEoLAzspqtIJK9p2rNYM
 RZKhh6HLWtwChYEc8HT/j5sbOSD3dHuTOECPW3GYN7w==
X-Received: by 2002:a2e:a37a:0:b0:2af:150f:d421 with SMTP id
 i26-20020a2ea37a000000b002af150fd421mr3749246ljn.5.1684753994432; 
 Mon, 22 May 2023 04:13:14 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ4+vYH0Nc1ESK4QTZEtrWsGcanm7ymTNCOr4z8IJm7Iru4aBRqsqfYh/jPAqeDcjuMGqcwQ1DLogJOpk7PIIHY=
X-Received: by 2002:a2e:a37a:0:b0:2af:150f:d421 with SMTP id
 i26-20020a2ea37a000000b002af150fd421mr3749226ljn.5.1684753994119; Mon, 22 May
 2023 04:13:14 -0700 (PDT)
MIME-Version: 1.0
References: <20230517133112.873856-1-trix@redhat.com>
In-Reply-To: <20230517133112.873856-1-trix@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 22 May 2023 13:13:02 +0200
Message-ID: <CACO55tvx_45D6Jnj_HhL0H9DQ-=PezGqucDQ-=-6JD9s_aAZMg@mail.gmail.com>
To: Tom Rix <trix@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/acr/ga102: set variable
 ga102_gsps storage-class-specifier to static
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bskeggs@redhat.com, daniel@ffwll.ch,
 gsamaiya@nvidia.com
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

On Wed, May 17, 2023 at 3:31=E2=80=AFPM Tom Rix <trix@redhat.com> wrote:
>
> smatch reports
> drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c:49:1: warning: symbol
>   'ga102_gsps' was not declared. Should it be static?
>
> This variable is only used in its defining file, so it should be static
>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gp=
u/drm/nouveau/nvkm/subdev/gsp/ga102.c
> index 525267412c3e..a3996ceca995 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
> @@ -45,7 +45,7 @@ ga102_gsp_nofw(struct nvkm_gsp *gsp, int ver, const str=
uct nvkm_gsp_fwif *fwif)
>         return 0;
>  }
>
> -struct nvkm_gsp_fwif
> +static struct nvkm_gsp_fwif
>  ga102_gsps[] =3D {
>         { -1, ga102_gsp_nofw, &ga102_gsp },
>         {}
> --
> 2.27.0
>

