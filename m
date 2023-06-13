Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9515172EE3B
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 23:45:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 15ACF89F35;
	Tue, 13 Jun 2023 21:45:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48BBC89F35
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 21:45:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686692711;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=9QQZQy68bt9qh/YAukyxxzaRpSDgdVZPohvQ7bKtSTU=;
 b=SKciQ5ABPaR7VPNO6xagAVtJkdZ7953V+8t4jDcSkwfjkZBDoS/tt6qZgH80jS6j/7EBYP
 kD2eiOQIo+CUNvtUTM3FeLMBEMfwKS5iphOT78EtwIjEKe0IM4Vr/KS++wGOyhL9SESHDr
 zXLOfqdtlM0d4zg2y+nRbz6uZMnBmrM=
Received: from mail-lj1-f197.google.com (mail-lj1-f197.google.com
 [209.85.208.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-434-ar8xo97IO7iY2kzvewrp8g-1; Tue, 13 Jun 2023 17:45:10 -0400
X-MC-Unique: ar8xo97IO7iY2kzvewrp8g-1
Received: by mail-lj1-f197.google.com with SMTP id
 38308e7fff4ca-2b1b8ec9343so9537551fa.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 14:45:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686692708; x=1689284708;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=9QQZQy68bt9qh/YAukyxxzaRpSDgdVZPohvQ7bKtSTU=;
 b=VP2m/C8HJolVR5YxLmpilvqaeayPdkrOYSWfIwiaOpWSeI7vE6u/Ghpcx9BuGMuJyV
 nXuQOgcD9PwEJM6uvubvVtYG8qlYwrAuFlgqSzMVlYF/pzmmzsV2lhDXAeZGXw4R+Z+2
 5RRMFY1arxyzyndhIR5mWaaxbBjI5CTrroEaAjRZ77AkS19vNrgL5hh+2M2qDfKrzxxU
 YiqtBjwTlf8YVAZhlsdc2lCO/ji+zhY1p1pxqWzJbniXSGYLcpIk6t/0FS71sk++CzRa
 F/VkqkxkgN2ygZ6XVxeZEqrOkkEo2L6zaU+JaoSN0Gmfm4zY7iMmB8DlqbVKQtUn+pKx
 JOww==
X-Gm-Message-State: AC+VfDwt+gKBMncsL91237SoklxRHcyRSh90s5/K5ZoRxUfbqmI4dPcK
 IJxvkuXzEVGCvSuVqmnjWhlnBSD4sTl67g9nYhEPI48/tshIzxfhMWQQzYt+PHdyNgRekkZpK0i
 dtgaDM0/eawLFYNlU+Gx3+hxf8i2xG81VY9u07PK5/7JpwMg4SoN3
X-Received: by 2002:a2e:b5dc:0:b0:2b1:c184:9afe with SMTP id
 g28-20020a2eb5dc000000b002b1c1849afemr6854769ljn.4.1686692708653; 
 Tue, 13 Jun 2023 14:45:08 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ5IqN1pxbHDNNyX7+nLZvWywvui88tRb9vVkuFFQlNC1rmoTFnkhl2S26WVXakxHS4gfOmXOh6MibG80kCvIBY=
X-Received: by 2002:a2e:b5dc:0:b0:2b1:c184:9afe with SMTP id
 g28-20020a2eb5dc000000b002b1c1849afemr6854761ljn.4.1686692708353; Tue, 13 Jun
 2023 14:45:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230525003106.3853741-1-skeggsb@gmail.com>
 <20230525003106.3853741-10-skeggsb@gmail.com>
In-Reply-To: <20230525003106.3853741-10-skeggsb@gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 13 Jun 2023 23:44:57 +0200
Message-ID: <CACO55tsX+L5Jv8LefvyM=Z3qzi1Q=Rpvsv+pqx7d23i_aqWaoQ@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH 10/10] drm/nouveau/kms: don't call
 drm_dp_cec_set_edid() on TMDS
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

On Thu, May 25, 2023 at 2:31=E2=80=AFAM Ben Skeggs <skeggsb@gmail.com> wrot=
e:
>
> From: Ben Skeggs <bskeggs@redhat.com>
>
> RM complains very loudly at the aux transaction attempts.
>
> Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 086b66b60d91..4c0cb32f6f2c 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -619,7 +619,10 @@ nouveau_connector_detect(struct drm_connector *conne=
ctor, bool force)
>
>                 nouveau_connector_set_encoder(connector, nv_encoder);
>                 conn_status =3D connector_status_connected;
> -               drm_dp_cec_set_edid(&nv_connector->aux, nv_connector->edi=
d);
> +
> +               if (nv_encoder->dcb->type =3D=3D DCB_OUTPUT_DP)
> +                       drm_dp_cec_set_edid(&nv_connector->aux, nv_connec=
tor->edid);
> +
>                 goto out;
>         } else {
>                 nouveau_connector_set_edid(nv_connector, NULL);
> --
> 2.40.1
>

Reviewed-by: Karol Herbst <kherbst@redhat.com>

