Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BF0172ED35
	for <lists+nouveau@lfdr.de>; Tue, 13 Jun 2023 22:40:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 929AA10E040;
	Tue, 13 Jun 2023 20:40:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F1AC510E013
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 20:40:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1686688822;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=5F0M7/J2pBqIlbj07I33+sdD0PR1/h1TZjZ1JXWtMIM=;
 b=WTv20EMrZ9n1PQnvea0/Q8W6xtNkxo2n+k/yxytwZN5uKAOCnuHfoh0iyJRDNlDhT0WtYe
 OIbLi7qFB7pmkMVXLe02vv6KbOcBqwO8Vrh/hfNS5vb8G8Xba+jeFanbugpEJInG3PO43V
 usLGsa9xE3eS45k5kWlXPh+Stt4pKkE=
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-214-scj-5q5pOregDultY7rXpQ-1; Tue, 13 Jun 2023 16:40:19 -0400
X-MC-Unique: scj-5q5pOregDultY7rXpQ-1
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-76202be14b4so16045985a.1
 for <nouveau@lists.freedesktop.org>; Tue, 13 Jun 2023 13:40:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686688819; x=1689280819;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/KEV8rgNWQcziNkOQw3aa12KM/0QxpSM9LvG+rNFReA=;
 b=ZFJu++wUs6kLOnIXlitYD2/EJE9froc0DR2fkDpzQWInm/caRezNoA/RGcPLFRnJXu
 R28D4rvvPKlgSnQPrtr3On9Wq9UQkvptAxwQggCKAh91C9NSpuvDzQcfplNIRhmj7V2I
 8tbDeLtSecuuUT61L5FncBUuUSrOq9PRbyVjmPjOC+w5GHW/KQVbKVYHTQCn+kQmDHth
 cm15eZ9VVDyJOQuJacTRzkT3kA14SjHPkEmAzGfcksvH4uGQ4Aoq6z8HGf3NfXGHItws
 /IsFsuVgR87mpUj0cXD0I1pbrSrhb/2XPH964HEpx6dhPe9LdVYKVgJn4Zq1vdgh/29w
 TFrg==
X-Gm-Message-State: AC+VfDyra2mzSE+chULZJnUSasmIJQoDJ9xdzSc70siP4MxDsWei2b+E
 sFqAt2mISXvpNMU6PGTYavFkHFXyKnhJ6F8fM4GIWoZZBH/TEubJi3cfeyufCOumihvZfLauJhe
 CSqI6APQEToknq8sU275ghAQslQ==
X-Received: by 2002:a05:620a:8e13:b0:75b:23a1:8e67 with SMTP id
 re19-20020a05620a8e1300b0075b23a18e67mr10918316qkn.56.1686688819333; 
 Tue, 13 Jun 2023 13:40:19 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ531Nu7ofpSl0Xf9KKfuKJTyiRduM7Azc8WhTHGMU/grfOlSdbBgp+kcjzgvYLlWsWJIlQgoQ==
X-Received: by 2002:a05:620a:8e13:b0:75b:23a1:8e67 with SMTP id
 re19-20020a05620a8e1300b0075b23a18e67mr10918309qkn.56.1686688819045; 
 Tue, 13 Jun 2023 13:40:19 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 g17-20020ae9e111000000b0075d49ce31c3sm3823609qkm.91.2023.06.13.13.40.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 13 Jun 2023 13:40:18 -0700 (PDT)
Message-ID: <c2bf9c25b5ba7d00cc476ed1389ad5e2dd9b2491.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Natalia Petrova <n.petrova@fintech.ru>, Ben Skeggs <bskeggs@redhat.com>
Date: Tue, 13 Jun 2023 16:40:17 -0400
In-Reply-To: <20230512111526.82408-1-n.petrova@fintech.ru>
References: <20230512111526.82408-1-n.petrova@fintech.ru>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/dp: check for NULL
 nv_connector->native_mode
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
Cc: lvc-project@linuxtesting.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

Will push upstream in a bit

On Fri, 2023-05-12 at 14:15 +0300, Natalia Petrova wrote:
> Add checking for NULL before calling nouveau_connector_detect_depth() in
> nouveau_connector_get_modes() function because nv_connector->native_mode
> could be dereferenced there since connector pointer passed to
> nouveau_connector_detect_depth() and the same value of
> nv_connector->native_mode is used there.
>=20
> Found by Linux Verification Center (linuxtesting.org) with SVACE.
>=20
> Fixes: d4c2c99bdc83 ("drm/nouveau/dp: remove broken display depth functio=
n, use the improved one")
>=20
> Signed-off-by: Natalia Petrova <n.petrova@fintech.ru>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index 086b66b60d91..5dbf025e6873 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -966,7 +966,7 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
>  =09/* Determine display colour depth for everything except LVDS now,
>  =09 * DP requires this before mode_valid() is called.
>  =09 */
> -=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS)
> +=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS && nv_conn=
ector->native_mode)
>  =09=09nouveau_connector_detect_depth(connector);
> =20
>  =09/* Find the native mode if this is a digital panel, if we didn't
> @@ -987,7 +987,7 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
>  =09 * "native" mode as some VBIOS tables require us to use the
>  =09 * pixel clock as part of the lookup...
>  =09 */
> -=09if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS)
> +=09if (connector->connector_type =3D=3D DRM_MODE_CONNECTOR_LVDS && nv_co=
nnector->native_mode)
>  =09=09nouveau_connector_detect_depth(connector);
> =20
>  =09if (nv_encoder->dcb->type =3D=3D DCB_OUTPUT_TV)

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

