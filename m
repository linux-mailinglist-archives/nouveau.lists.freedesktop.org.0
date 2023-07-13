Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A19F751CDC
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 11:11:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD2B510E64A;
	Thu, 13 Jul 2023 09:11:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 341B710E64A
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:11:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239479;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wNbtyQ76nBuBqvvqrZSc6orqqyUgVCDr6u2ACe6GE7E=;
 b=hjzeQKtizXLLHI/Ekl0aV7Iki53HMLNnDIWLZdEjjLpGu4CqtQRLAL4c1hi9PaemTw5xoB
 yUZ0GE2ETrZkSlOdWW+C2el9w7J3Fm8fIJS6E7C+HAcHpYe+fkCXDyIGlAYoJyl7Cy8Xa4
 ZJWFZGmgpCG7j298SX1sosa2NxV1dYQ=
Received: from mail-lj1-f200.google.com (mail-lj1-f200.google.com
 [209.85.208.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-258-sSNPsM3YM_uOWu1J8q2PwA-1; Thu, 13 Jul 2023 05:11:17 -0400
X-MC-Unique: sSNPsM3YM_uOWu1J8q2PwA-1
Received: by mail-lj1-f200.google.com with SMTP id
 38308e7fff4ca-2b6ca014805so899881fa.0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 02:11:17 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239476; x=1691831476;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wNbtyQ76nBuBqvvqrZSc6orqqyUgVCDr6u2ACe6GE7E=;
 b=RxmAV3zX0YYkVbYifBQYpVIMBkSz8aBU3rfKE/d3K4fQEj8NUt+L/yUjPPiXPWpZC9
 ePlI6LaMj26aSROy/ZFLGTgxMTt4/Er+1bBciBT3XAcGVuBROLtEjCMJdDPM9MvVEpcq
 gvdBg8Nvli8JncCcxJ0D/1ZshDp8w9oFAQYjJyyq0ygANYqnJNNjfFR7srNlQkRvydMi
 wlfROtSZAL0fmsOPQipRuwzjqurxbBWPcVaFovRxdbCpmFIqkbjbb92RCsuId4e4aH25
 ECsv8+3oW33EGPG8wvdyWesKnTOcVXOdnwOJF3HvdtwKDL3cm7cURU8o0Glg5Il0aIiA
 uV7Q==
X-Gm-Message-State: ABy/qLathxjh1DMKFnmdKCTrIDKHtVSPkioWQlAUMfxbQoR6kCskbLRU
 XecVgbJKjvH1hO56NmOsqCWJ7qC2a/pxgekHX2gye3aVeTtHoN36QrisDFyiowxIbDrfT6xD8Wk
 9uRZPfZSGHxzAHS314mw+aobFLvjgzYhS7uqndlCl9w==
X-Received: by 2002:a2e:be10:0:b0:2b7:2ca0:989a with SMTP id
 z16-20020a2ebe10000000b002b72ca0989amr920197ljq.5.1689239476622; 
 Thu, 13 Jul 2023 02:11:16 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFw0DuOdoAUA01Xd1FeaBlxKLaI+Rdgpiyi8L3qD/rUV/T0VD7an8HsyTVLGisDJzNOpGN7qGOhAvSEwkaj3i8=
X-Received: by 2002:a2e:be10:0:b0:2b7:2ca0:989a with SMTP id
 z16-20020a2ebe10000000b002b72ca0989amr920186ljq.5.1689239476330; Thu, 13 Jul
 2023 02:11:16 -0700 (PDT)
MIME-Version: 1.0
References: <20230710032131.52747-1-xujianghui@cdjrlc.com>
 <decd9e6f68cbebda22d6648fa7b9b737@208suo.com>
In-Reply-To: <decd9e6f68cbebda22d6648fa7b9b737@208suo.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:11:05 +0200
Message-ID: <CACO55tut_20kwHC4-0fkkyGrh0sLrRO2e6TVCuUL_q7vuz+tPw@mail.gmail.com>
To: sunran001@208suo.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/nvkm: do not use assignment in if
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

On Mon, Jul 10, 2023 at 9:23=E2=80=AFAM <sunran001@208suo.com> wrote:
>
> Assignments in if condition are less readable and error-prone.  Fixes
> also checkpatch warning:
>
> ERROR: do not use assignment in if condition
>
> Signed-off-by:Ran Sun <sunran001@208suo.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c | 3 ++-
>   1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> index 976539de4220..054fa42f1d04 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/i2c/base.c
> @@ -286,7 +286,8 @@ nvkm_i2c_new_(const struct nvkm_i2c_func *func,
> struct nvkm_device *device,
>
>           if (ccbE.share !=3D DCB_I2C_UNUSED) {
>               const int id =3D NVKM_I2C_PAD_HYBRID(ccbE.share);
> -            if (!(pad =3D nvkm_i2c_pad_find(i2c, id)))
> +            pad =3D nvkm_i2c_pad_find(i2c, id);
> +            if (!pad)
>                   ret =3D func->pad_s_new(i2c, id, &pad);
>               else
>                   ret =3D 0;
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

