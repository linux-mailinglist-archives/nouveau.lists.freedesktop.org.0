Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C9ABF773055
	for <lists+nouveau@lfdr.de>; Mon,  7 Aug 2023 22:33:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B70E610E37E;
	Mon,  7 Aug 2023 20:33:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B99310E37E
 for <nouveau@lists.freedesktop.org>; Mon,  7 Aug 2023 20:32:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1691440377;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=feydv8gzqlPAj6AHa2Vc58a8yXOwJJf6YmsxhyRJzEg=;
 b=PcQSPMUmB+vUrfK8s51P4lABfqP9a74C9i9iFvZhos2l6LcKAUEg2UKgdHezEbo3e6MXzp
 6FMBlUQepn5kBa2/qYxvSs2bFa6mzvgyktp01/dYZmiLMssdFpA21LpegdwmshReBEyVvE
 qWb2mIwcajrHdm+KcZI+AlL9zVSkK1Y=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-633-ERWXMv7oPjeX-J7kwCN5pg-1; Mon, 07 Aug 2023 16:32:56 -0400
X-MC-Unique: ERWXMv7oPjeX-J7kwCN5pg-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-40feb0c08c0so37243711cf.3
 for <nouveau@lists.freedesktop.org>; Mon, 07 Aug 2023 13:32:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691440376; x=1692045176;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Ef2qFHsqfq9w04kkUFwpr5VGp6ZXP1q9+YtKoiAHED8=;
 b=ZQp4C8C3lucv3NW2fqn6J/4EAhns7U23Cwk80/yL4XIoZ+i1HkadTjrXcG38oTSQ4K
 6S03UNmFvb3r3zJIADYjtyUo0D2+fUp2xDfHa3YWdg+F6UH3W40odrAdPPuSyBHDgBi/
 TCR72dOfNywj2ezcXtNQd6M3g294G1fFtaFMnBRPCHIVcQ0BU1Q/FESLnOdz3+wgm/CD
 5olDccerPVnsggZt8vOyUa2nYn9gqiaiitbz3lFLXCXbqRImWjGZCiymWIgK5YoiQZQ9
 owFBJxwOpzZGt7r0qmD1r7xRC25Khz9e2ZakfNdit41naQ88ecGSJR44zCZLc0R3iEgv
 e+5g==
X-Gm-Message-State: AOJu0Yz98sgSCnJeRFjunF14iYiJnTiPgZFgib4hMe/VEDVA92Q6HU+Y
 AeP7nD0xy8KTm6lCxYuZKgETxSIomrmwp6SF2Z62cbh60CLhiMv5D8tD0LSfLuO6dCh/JDwuZlJ
 /Nz8nX0eVTLXP9Xju/Jbc6xzB7Q==
X-Received: by 2002:a05:622a:1301:b0:410:682:972c with SMTP id
 v1-20020a05622a130100b004100682972cmr6058596qtk.62.1691440375842; 
 Mon, 07 Aug 2023 13:32:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPqPsJ9+KhVuwjTgj9i7DT2wVC/+erfl77JxIrDG0C82kOepjLE2//seLYHR3tPeHf0bg4Kg==
X-Received: by 2002:a05:622a:1301:b0:410:682:972c with SMTP id
 v1-20020a05622a130100b004100682972cmr6058576qtk.62.1691440375600; 
 Mon, 07 Aug 2023 13:32:55 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c7d:5f00:6966:42dc:c4a4:dad3?
 ([2600:4040:5c7d:5f00:6966:42dc:c4a4:dad3])
 by smtp.gmail.com with ESMTPSA id
 r17-20020ac87951000000b00401217aa51dsm2894075qtt.76.2023.08.07.13.32.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 13:32:54 -0700 (PDT)
Message-ID: <b350fd1e60cc0fa24a81be512e35f9b6a2358f94.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Mon, 07 Aug 2023 16:32:53 -0400
In-Reply-To: <20230805101813.2603989-1-kherbst@redhat.com>
References: <20230805101813.2603989-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: Revert a NULL check inside
 nouveau_connector_get_modes
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
Cc: Olaf Skibbe <news@kravcenko.com>, nouveau@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>, dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Ugh, thanks for catching this!

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Sat, 2023-08-05 at 12:18 +0200, Karol Herbst wrote:
> The original commit adding that check tried to protect the kenrel against
> a potential invalid NULL pointer access.
>=20
> However we call nouveau_connector_detect_depth once without a native_mode
> set on purpose for non LVDS connectors and this broke DP support in a few
> cases.
>=20
> Cc: Olaf Skibbe <news@kravcenko.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/238
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/245
> Fixes: 20a2ce87fbaf8 ("drm/nouveau/dp: check for NULL nv_connector->nativ=
e_mode")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_connector.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/dr=
m/nouveau/nouveau_connector.c
> index f75c6f09dd2af..a2e0033e8a260 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_connector.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
> @@ -967,7 +967,7 @@ nouveau_connector_get_modes(struct drm_connector *con=
nector)
>  =09/* Determine display colour depth for everything except LVDS now,
>  =09 * DP requires this before mode_valid() is called.
>  =09 */
> -=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS && nv_conn=
ector->native_mode)
> +=09if (connector->connector_type !=3D DRM_MODE_CONNECTOR_LVDS)
>  =09=09nouveau_connector_detect_depth(connector);
> =20
>  =09/* Find the native mode if this is a digital panel, if we didn't

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

