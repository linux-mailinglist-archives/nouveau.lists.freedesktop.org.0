Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D5047C77E3
	for <lists+nouveau@lfdr.de>; Thu, 12 Oct 2023 22:27:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 10B4710E02F;
	Thu, 12 Oct 2023 20:27:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA7D310E02F
 for <nouveau@lists.freedesktop.org>; Thu, 12 Oct 2023 20:27:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1697142470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=kN82Bv6AzS+6BIfg6C34ptuB1mXgXD7jYJ7UO25RWqU=;
 b=CETVQE2Cnu15UAYN9vumplfOZrE25uaCOIZ9CrHuhW0L6QG57exFUJ0u9mPfFqhMjVoUcM
 u+g6dC1QYi+kJaD0SuhCkeBjeo+YUAQqOatmnmLFL8soge5o8WyD89D0nqnwsVkJFMZ2iF
 loPPV48BXJcM28NBmlGGTveWsmkF3wE=
Received: from mail-yb1-f197.google.com (mail-yb1-f197.google.com
 [209.85.219.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-495-Oo1SOS31PXq35YYMEWbGtw-1; Thu, 12 Oct 2023 16:27:48 -0400
X-MC-Unique: Oo1SOS31PXq35YYMEWbGtw-1
Received: by mail-yb1-f197.google.com with SMTP id
 3f1490d57ef6-d9a5995aa42so1795821276.2
 for <nouveau@lists.freedesktop.org>; Thu, 12 Oct 2023 13:27:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697142468; x=1697747268;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=h7MhDUaGiq9G+tWNP9KfebmzehEOtMMS/KoW8Kay4rM=;
 b=WvUmbKapJMLI7Tl/KF1cwXAD8M8SlIT6cX9dFtN9G52G0cPCNoswqtjQs/V4jTprFG
 GQZdJgawxkUrAEI1Z95eXy5UcpWsfPrSOQqXFXaCp9Zj8Aihd+THMeaSeu/riwDrwavW
 uyXhG6dCXkVtnnoHRFwS9eBFMDTwflNuau4gLpmtMruNvx5KMKx0Hl7r1w/2Zwi408rB
 N6Xg76iIwllQCFBy9vT6aB8KwLuGpY4HVndW+GUFgsff9Oa+Y5LSOaoqKcPzZX3AE6e+
 Gp7Z+GKERuUOE9kxuqthHs7eYng8V38R/PhXSPOf+IMeRwaENdDNR4g5+basqyBg5ebY
 Cr7Q==
X-Gm-Message-State: AOJu0YxCokX8FhH+pWDGqwjVH45Bs6BGJ/egNWoWTJNUO+cDgV4kUCho
 UhwqfqpWC8jprgCAwpt41uNWvtLJWc8jfpA38Zt8OOkNZM9MY1g0AI8/y/uRqp60MknPIz03mCH
 YF7ZcrQpcRhcSyKqCHj1SFt0+nw==
X-Received: by 2002:a25:2109:0:b0:d90:a7a4:7093 with SMTP id
 h9-20020a252109000000b00d90a7a47093mr22970360ybh.55.1697142466874; 
 Thu, 12 Oct 2023 13:27:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFVZ5AlehRoD4uy/fEcf9fxDTMrdIb0t8hzbkAHLfVUYwOfQMOlVAmfNUNBfHCGsp/kHBKgMA==
X-Received: by 2002:a25:2109:0:b0:d90:a7a4:7093 with SMTP id
 h9-20020a252109000000b00d90a7a47093mr22970345ybh.55.1697142466567; 
 Thu, 12 Oct 2023 13:27:46 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 dl15-20020ad44e0f000000b0066d1540f9ecsm69669qvb.77.2023.10.12.13.27.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 12 Oct 2023 13:27:45 -0700 (PDT)
Message-ID: <bd20306461d67f1c6aaadb3fe6a3d596fc70e13e.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Karol Herbst <kherbst@redhat.com>, linux-kernel@vger.kernel.org
Date: Thu, 12 Oct 2023 16:27:38 -0400
In-Reply-To: <20231011114134.861818-1-kherbst@redhat.com>
References: <20231011114134.861818-1-kherbst@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: fix DP capable DSM
 connectors
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
Cc: nouveau@lists.freedesktop.org, stable@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Wed, 2023-10-11 at 13:41 +0200, Karol Herbst wrote:
> Just special case DP DSM connectors until we properly figure out how to
> deal with this.
>=20
> This resolves user regressions on GPUs with such connectors without
> reverting the original fix.
>=20
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: stable@vger.kernel.org # 6.4+
> Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/255
> Fixes: 2b5d1c29f6c4 ("drm/nouveau/disp: PIOR DP uses GPIO for HPD, not PM=
GR AUX interrupts")
> Signed-off-by: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/g=
pu/drm/nouveau/nvkm/engine/disp/uconn.c
> index 46b057fe1412e..3249e5c1c8930 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
> @@ -62,6 +62,18 @@ nvkm_uconn_uevent_gpio(struct nvkm_object *object, u64=
 token, u32 bits)
>  =09return object->client->event(token, &args, sizeof(args.v0));
>  }
> =20
> +static bool
> +nvkm_connector_is_dp_dms(u8 type)
> +{
> +=09switch (type) {
> +=09case DCB_CONNECTOR_DMS59_DP0:
> +=09case DCB_CONNECTOR_DMS59_DP1:
> +=09=09return true;
> +=09default:
> +=09=09return false;
> +=09}
> +}
> +
>  static int
>  nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, stru=
ct nvkm_uevent *uevent)
>  {
> @@ -101,7 +113,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *a=
rgv, u32 argc, struct nvkm_
>  =09if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |=3D NVKM_GPIO_L=
O;
>  =09if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ) {
>  =09=09/* TODO: support DP IRQ on ANX9805 and remove this hack. */
> -=09=09if (!outp->info.location)
> +=09=09if (!outp->info.location && !nvkm_connector_is_dp_dms(conn->info.t=
ype))
>  =09=09=09return -EINVAL;
>  =09}
> =20

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

