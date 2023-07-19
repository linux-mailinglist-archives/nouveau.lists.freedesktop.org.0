Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F327590CF
	for <lists+nouveau@lfdr.de>; Wed, 19 Jul 2023 11:01:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D233010E430;
	Wed, 19 Jul 2023 09:01:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE84210E431
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 09:01:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689757286;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=yJJtae89ryvaob+KPn8Nmgb3anUlUE96Nlvd7UhxGw8=;
 b=cF9wYslNw7M2wxNktoLKSh9n77GYPRM4Jrl+hDSdOCwcG78TWBER6hEhq3hQ/NZuwr+dg9
 zqxrMGapwhoszevqKlZtjCZ07KBFACpCr8K+TLAsYnKJsWOu2Q+RPTjJcn1vtHI/i1Azc8
 oHE0LrlwTphsYXnM5/EdRtSI9YjLTjI=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-197-pAuQ7fU5OeqPvXsIG_mY0g-1; Wed, 19 Jul 2023 05:01:24 -0400
X-MC-Unique: pAuQ7fU5OeqPvXsIG_mY0g-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b72262fb80so11177531fa.0
 for <nouveau@lists.freedesktop.org>; Wed, 19 Jul 2023 02:01:23 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689757282; x=1690362082;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yJJtae89ryvaob+KPn8Nmgb3anUlUE96Nlvd7UhxGw8=;
 b=fPpzozkj2W+hhYtQLS1YhSDEo419uwYugQCvG9E7iqR+A0xRiiPHdBjSUdjv8rkCkq
 WJC7SeHL/3CNSd+p970aFUbYLVI5PCao3rT0Vy/4ZXqYH1Ha0W6wprGE1oOUKyzSgPfL
 k8Jp1aAEfA88zjJYX7hphtmPgmEcjgis3kxGD5PVi4qVfswZJQiFgiDXlnmIIDAcwYR9
 a2i2K/Blic1ij7IeguW6HE0FmNZO/Xq/yHVrOc7PWyI2u8Oq4wVYm6STP1rtRV723SoD
 YtD3BBTOZ4KIBWzuxSj3OF1qHG6ENt3Wxhn5sRgZgD2xhY28ijRJM1mP4axApAIZsQPE
 pKCQ==
X-Gm-Message-State: ABy/qLYj3/WC3WFIV2spqLCWlJAxDNJlk5xK1O+8GS6wxF/OYxd/xC8y
 FbFp/9bSo2oYqWihuu/PKQnTkyQbmXKCMcnqFd99DYtXRNF5dAh/AF1nmqgtZL37dWpzSr5/yGv
 nU8rwVgJpcHAQCyzJmIJK9SS7WpdKq5PDk5EgTz4EFw==
X-Received: by 2002:a05:651c:b1e:b0:2b6:7c3a:6adc with SMTP id
 b30-20020a05651c0b1e00b002b67c3a6adcmr8506486ljr.5.1689757282046; 
 Wed, 19 Jul 2023 02:01:22 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEIrAvJNJ+9R2Ty49M45J+p0aoFruWorDEV++QbNBQTsKyjkmo6roXl8WcfU4uK3uOQdVZf7CCs4Ln3myDevB0=
X-Received: by 2002:a05:651c:b1e:b0:2b6:7c3a:6adc with SMTP id
 b30-20020a05651c0b1e00b002b67c3a6adcmr8506479ljr.5.1689757281874; Wed, 19 Jul
 2023 02:01:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230719044051.6975-1-skeggsb@gmail.com>
 <20230719044051.6975-3-skeggsb@gmail.com>
In-Reply-To: <20230719044051.6975-3-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 19 Jul 2023 11:01:10 +0200
Message-ID: <CACO55tv3QE-eebJYRaXipc-sW_tBzQxEzbN8ecOb5eq9bQybtg@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 3/3] drm/nouveau/kms/nv50-: init hpd_irq_lock
 for PIOR DP
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
Cc: nouveau@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Jul 19, 2023 at 6:41=E2=80=AFAM Ben Skeggs <skeggsb@gmail.com> wrot=
e:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> Fixes OOPS on boards with ANX9805 DP encoders.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/dispnv50/disp.c | 4 ++++
>  1 file changed, 4 insertions(+)
>
> diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/no=
uveau/dispnv50/disp.c
> index 42e1665ba11a..1ecd3d63b108 100644
> --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> @@ -1873,6 +1873,8 @@ nv50_pior_destroy(struct drm_encoder *encoder)
>         nvif_outp_dtor(&nv_encoder->outp);
>
>         drm_encoder_cleanup(encoder);
> +
> +       mutex_destroy(&nv_encoder->dp.hpd_irq_lock);
>         kfree(encoder);
>  }
>
> @@ -1917,6 +1919,8 @@ nv50_pior_create(struct drm_connector *connector, s=
truct dcb_output *dcbe)
>         nv_encoder->i2c =3D ddc;
>         nv_encoder->aux =3D aux;
>
> +       mutex_init(&nv_encoder->dp.hpd_irq_lock);
> +
>         encoder =3D to_drm_encoder(nv_encoder);
>         encoder->possible_crtcs =3D dcbe->heads;
>         encoder->possible_clones =3D 0;
> --
> 2.41.0
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

