Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3940377EAFC
	for <lists+nouveau@lfdr.de>; Wed, 16 Aug 2023 22:47:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A398D10E3BC;
	Wed, 16 Aug 2023 20:47:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 272B010E3BC
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 20:47:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1692218836;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lp/ElRMpuHX0ZQF1pFmv/A7hZ/+TiJdwRTSI4ctDg4Q=;
 b=U9V03XlWWEGYWMhiGJgZUsnvasy4jWLY3pHVUhZKtA6Vz+lfnlPYNEZ03pikNnr+vQghXz
 gPW8eATEH2/2rY+Bfi1yoyt26n8/9lnLtEdcPsw+43NtheMt5QZbkvcm5HyirXsZVg/GRT
 H/c5WyGBgjU+45HHeaHiHfhJhaNer10=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-640-G2Xd4AQeOZqelcWNQA8g1Q-1; Wed, 16 Aug 2023 16:47:14 -0400
X-MC-Unique: G2Xd4AQeOZqelcWNQA8g1Q-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7659d103147so885422985a.3
 for <nouveau@lists.freedesktop.org>; Wed, 16 Aug 2023 13:47:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692218834; x=1692823634;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=e3IvmL0y1viiHXLAUyfip1yCYlhOkZ7NLyhRvcY+CDk=;
 b=NDjn/7hVLwZmlcHuWMdI59ibvlm/znihfWpJj6i9CZ2ZfFLVsd6yixreLHn2YvrzIt
 fMWMIZABv39QwxfyKzTk8LWDVfehfJzrtrNrwx7uGmOZDrg/09OfJDgoEZJm7wXGyUWu
 l2HRLyxlGVV4L8aSfjSBXKHgh/ZgX541/ih+tA1W3M+H+wL1eL938syE3LlFMulv6bHU
 3F/5JglZesY61OYEcDVCoef0rFajX22hqlUSRq8XponaiVZIVHZrDWIqhpIQn998OQwC
 sFgCdKoXeQKUQTaxbtEOzDw97yvowYyu3J0ik8wvehZHnTcS1Sjj5+oNgLzyt0wcEgkY
 /iPQ==
X-Gm-Message-State: AOJu0YxrOSpu9SNNoYBzgoIUft08fFQOPDyNW8vM819illJ6fXtdx/vl
 F57fNFbOweeZolCRyyqq+iIbOPKSoV9XOhg9Cg4eDEXuHmBmbDHhlZZ55cWV2ta3QP04rzd95cm
 MmqBpWhYnBx7w8Vpx9s88Tc3QVg==
X-Received: by 2002:a05:622a:1210:b0:403:e895:155b with SMTP id
 y16-20020a05622a121000b00403e895155bmr3853831qtx.34.1692218834029; 
 Wed, 16 Aug 2023 13:47:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEey1QVl493qQLI7bMS4KR7ZC4Pq5U6vCDQZyZMtY+jGAPCQ+P+AzAMGob1aMDWpaV//+fi6g==
X-Received: by 2002:a05:622a:1210:b0:403:e895:155b with SMTP id
 y16-20020a05622a121000b00403e895155bmr3853816qtx.34.1692218833802; 
 Wed, 16 Aug 2023 13:47:13 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00::feb? ([2600:4040:5c7d:5f00::feb])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac84d08000000b0040b8ba13701sm4735297qtv.52.2023.08.16.13.47.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Aug 2023 13:47:13 -0700 (PDT)
Message-ID: <a612e9d4560aa3827114339b1ea92f0181550eca.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Wed, 16 Aug 2023 16:47:12 -0400
In-Reply-To: <20230814144933.3956959-1-kherbst@redhat.com>
References: <20230814144933.3956959-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix use-after-free in error
 handling of nouveau_connector_create
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
Cc: Takashi Iwai <tiwai@suse.de>, nouveau@lists.freedesktop.org,
 Borislav Petkov <bp@alien8.de>, Ben Skeggs <bskeggs@redhat.com>,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-08-14 at 16:49 +0200, Karol Herbst wrote:
> We can't simply free the connector after calling drm_connector_init on it=
.
> We need to clean up the drm side first.
>=20
> It might not fix all regressions from 2b5d1c29f6c4 ("drm/nouveau/disp:
> PIOR DP uses GPIO for HPD, not PMGR AUX interrupts"), but at least it
> fixes a memory corruption in error handling related to that commit.
>=20
> Link: https://lore.kernel.org/lkml/20230806213107.GFZNARG6moWpFuSJ9W@fat_=
crate.local/
> Fixes: 95983aea8003 ("drm/nouveau/disp: add connector class")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 11 +++++++----
>  1 file changed, 7 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index a2e0033e8a260..622f6eb9a8bfd 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -1408,8 +1408,7 @@ nouveau_connector_create(struct drm_device *dev,
>  =09=09ret =3D nvif_conn_ctor(&disp->disp, nv_connector->base.name, nv_co=
nnector->index,
>  =09=09=09=09     &nv_connector->conn);
>  =09=09if (ret) {
> -=09=09=09kfree(nv_connector);
> -=09=09=09return ERR_PTR(ret);
> +=09=09=09goto drm_conn_err;
>  =09=09}
> =20
>  =09=09ret =3D nvif_conn_event_ctor(&nv_connector->conn, "kmsHotplug",
> @@ -1426,8 +1425,7 @@ nouveau_connector_create(struct drm_device *dev,
>  =09=09=09if (ret) {
>  =09=09=09=09nvif_event_dtor(&nv_connector->hpd);
>  =09=09=09=09nvif_conn_dtor(&nv_connector->conn);
> -=09=09=09=09kfree(nv_connector);
> -=09=09=09=09return ERR_PTR(ret);
> +=09=09=09=09goto drm_conn_err;
>  =09=09=09}
>  =09=09}
>  =09}
> @@ -1475,4 +1473,9 @@ nouveau_connector_create(struct drm_device *dev,
> =20
>  =09drm_connector_register(connector);
>  =09return connector;
> +
> +drm_conn_err:
> +=09drm_connector_cleanup(connector);
> +=09kfree(nv_connector);
> +=09return ERR_PTR(ret);
>  }

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

