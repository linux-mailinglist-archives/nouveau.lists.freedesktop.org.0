Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 535CC6DA35E
	for <lists+nouveau@lfdr.de>; Thu,  6 Apr 2023 22:36:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFF0110ED03;
	Thu,  6 Apr 2023 20:36:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1433F10ED12
 for <nouveau@lists.freedesktop.org>; Thu,  6 Apr 2023 20:36:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1680813388;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=irbR4glmPEIfzFVDABEDFiMlvxyIKRZYDMi+bXbiU3E=;
 b=bFYpHCYqeTazo0T46ANHwVHvnggnjy+i8FrVfyD7C4Dk1GGCZaESDO/uf/UJ1edoH/wBOq
 8Wi1egpTdZprIpUSqjGPP4mQdImPKtdSm2uftBpA42vrTQECLxCATFt4kMVmos6+iJxMHT
 f8yxGNPMyFp5PQ6EaOokwgtnphvExls=
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-244-B1AL0F1CPji_2KUhaGrYbQ-1; Thu, 06 Apr 2023 16:36:27 -0400
X-MC-Unique: B1AL0F1CPji_2KUhaGrYbQ-1
Received: by mail-qt1-f200.google.com with SMTP id
 v10-20020a05622a130a00b003e4ee70e001so21264836qtk.6
 for <nouveau@lists.freedesktop.org>; Thu, 06 Apr 2023 13:36:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680813386; x=1683405386;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6LXsKr+a/Z33uwWnUodThDv9wbW0mvJrlyH2U+mElvk=;
 b=qdf6GyxxPe5mIz0Zz7wya5BEmNRRoyruwnVs06SSKLbE0amOPF2NSISzq/aOcz6YdS
 r6xNcCZ9hpf1IJxGbsFJI/4uuQ6mqZwC0DXWZQQeXyIylGmnjZ5+yA/6N5q0u7J5xznA
 xKFGFNCJ6xbz3QNc4hRLlAhqf/dItW+epvFxlBxfYWivcM+7zi55+xhofN2d3MbL8Q/f
 xFeEXjIe3FbHY3BkpOXZvJWIqm/Am0CkRcm0S1phBgEdVpDTFu7iYlfyW1B+/tUeLX1v
 u5igd7hl4zi1KoebgclbM4x8cNq7/MOuyTSAKGL4K83kzJ/faCjLwHwDKXoW9iVgBxIS
 VUYQ==
X-Gm-Message-State: AAQBX9f1bQtJHRTxPGj/Lo8+0YnSVMLZbRiMh8BvmS+GhLrNgcdasP/r
 FdLjYeCcftn/xl2fo4S9NJ7T4DylYoR+I05WQYwXHH/w6PiIDdqx/JwwjhzrwIYrCSVuxl84TCk
 vYR26ffNLCq2nuehsWmgw5IabjQ==
X-Received: by 2002:a05:6214:5011:b0:5e0:2d2a:33c7 with SMTP id
 jo17-20020a056214501100b005e02d2a33c7mr1134137qvb.17.1680813386438; 
 Thu, 06 Apr 2023 13:36:26 -0700 (PDT)
X-Google-Smtp-Source: AKy350aMIlr6kOr7QlKmLXQ+/A47WKSK2XBUpbzukLONDGPnJm/66bMRzwwZPj9Vn6QKrcOYSdjPyw==
X-Received: by 2002:a05:6214:5011:b0:5e0:2d2a:33c7 with SMTP id
 jo17-20020a056214501100b005e02d2a33c7mr1134098qvb.17.1680813386085; 
 Thu, 06 Apr 2023 13:36:26 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 u12-20020a0ced2c000000b005dd8b934572sm784208qvq.10.2023.04.06.13.36.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 06 Apr 2023 13:36:25 -0700 (PDT)
Message-ID: <dc98897a97ba0f7e959dbcb8465ebc522e91dc3a.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Tom Rix <trix@redhat.com>, bskeggs@redhat.com, kherbst@redhat.com, 
 airlied@gmail.com, daniel@ffwll.ch, gsamaiya@nvidia.com
Date: Thu, 06 Apr 2023 16:36:24 -0400
In-Reply-To: <20230406125102.1952202-1-trix@redhat.com>
References: <20230406125102.1952202-1-trix@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.44.4 (3.44.4-2.fc36)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: [Nouveau] (Attn. Skeggsb) Re: [PATCH] drm/nouveau/gr/tu102: remove
 unused tu102_gr_load function
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
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hey Ben - this patch looks fine to me but I figured I should check before
giving it the OK: I assume we're not planning on using tu102_gr_load for
anything in the future? (if we are, do we want to just #if 0 this for the t=
ime
being?)

On Thu, 2023-04-06 at 08:51 -0400, Tom Rix wrote:
> smatch reports
> drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c:210:1: warning: symbol
>   'tu102_gr_load' was not declared. Should it be static?
>=20
> This function is not used so remove it.
>=20
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c | 13 -------------
>  1 file changed, 13 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c b/drivers/gpu=
/drm/nouveau/nvkm/engine/gr/tu102.c
> index 3b6c8100a242..a7775aa18541 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/gr/tu102.c
> @@ -206,19 +206,6 @@ tu102_gr_av_to_init_veid(struct nvkm_blob *blob, str=
uct gf100_gr_pack **ppack)
>  =09return gk20a_gr_av_to_init_(blob, 64, 0x00100000, ppack);
>  }
> =20
> -int
> -tu102_gr_load(struct gf100_gr *gr, int ver, const struct gf100_gr_fwif *=
fwif)
> -{
> -=09int ret;
> -
> -=09ret =3D gm200_gr_load(gr, ver, fwif);
> -=09if (ret)
> -=09=09return ret;
> -
> -=09return gk20a_gr_load_net(gr, "gr/", "sw_veid_bundle_init", ver, tu102=
_gr_av_to_init_veid,
> -=09=09=09=09 &gr->bundle_veid);
> -}
> -
>  static const struct gf100_gr_fwif
>  tu102_gr_fwif[] =3D {
>  =09{  0, gm200_gr_load, &tu102_gr, &gp108_gr_fecs_acr, &gp108_gr_gpccs_a=
cr },

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

