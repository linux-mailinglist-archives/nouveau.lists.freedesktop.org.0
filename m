Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F77F7391E1
	for <lists+nouveau@lfdr.de>; Wed, 21 Jun 2023 23:56:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE12E10E35C;
	Wed, 21 Jun 2023 21:56:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E0D910E35C
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jun 2023 21:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1687384614;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1QarhUpZL2KX33r9k0J7rlnwnpNjd4MAwTH0Z9My6ZE=;
 b=M7M+pkD+d8PD0V1SucXf1heDIO6DEFGffPqndK1XU7ceAHlsuRIg5tP6JfEYBGA7rIXv0w
 Li0Y4wNQOao2sriDmTBHq2FzFGBMBkdn3tCNgnXPTOT2Y8HIfr5gmPaiKmfwwwiTC2CLps
 8y+/J6D8OR/jASpBfLkrEzKOn4R8158=
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-28-HZizhpI7P426HnUbPuC02Q-1; Wed, 21 Jun 2023 17:56:53 -0400
X-MC-Unique: HZizhpI7P426HnUbPuC02Q-1
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-3fda1a83608so91436611cf.3
 for <nouveau@lists.freedesktop.org>; Wed, 21 Jun 2023 14:56:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687384613; x=1689976613;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=T8LltMZx9PMSgH8ho1xLLf166XVx/LTlcYJb83sK26U=;
 b=Y2yIn6sIdgo70CNyFvvld5yh//iX8RnHnsERs/R1M5fRwrGPeILPvtJuq4ni4u266b
 wgDNZ2dIdclAkuhGvTtLujYFcTUUgQ65lGQw9f1Ie5B1HCoUVvlrwx4Zimuqxj521a85
 EllxXw8KhJlImslsp4Aa+onZY2u8zO6ntZCEjXetn+ajFGmXJtVhQm50fhgU54iHw5ag
 fMfBNrkQTjsUbpEDV12dRM8czAsRsdUN2ejR9kHv7al/8owWAAJI8PBoG7CHfTYGDXuG
 3sOpg+mKZf6axi3oxDj+o0bB7Op8HUIxGEJXV35TBLFzvdBJTAR9v47Vqm7g2nxjlSZd
 cqlQ==
X-Gm-Message-State: AC+VfDyMNXS29VdIESR3TEoVZbnvpnH4vjT1tniltJtR3Oe/Lo1nDFnQ
 A1RRGzfFz/XlZyXs6kQ34mv/EOKnsmjUARFpB13y7FNUpSZSh9KFO0gVSdjU8oTmc7fKZqhInOL
 53cTpKnQEcG/Q6TAvy5IAZ5JcxQ==
X-Received: by 2002:a05:622a:46:b0:3ff:3110:bb61 with SMTP id
 y6-20020a05622a004600b003ff3110bb61mr6706770qtw.40.1687384612962; 
 Wed, 21 Jun 2023 14:56:52 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ7HbPV/zoMfl+LVUXDgB1ESBTrQqhmQPEQMSYyUBHz9FgkqL4H5Dwtl27rYcUdN4QtnAF5N+A==
X-Received: by 2002:a05:622a:46:b0:3ff:3110:bb61 with SMTP id
 y6-20020a05622a004600b003ff3110bb61mr6706757qtw.40.1687384612771; 
 Wed, 21 Jun 2023 14:56:52 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c62:8200::feb? ([2600:4040:5c62:8200::feb])
 by smtp.gmail.com with ESMTPSA id
 f15-20020ac8464f000000b003fecd4f0063sm2795419qto.95.2023.06.21.14.56.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 14:56:52 -0700 (PDT)
Message-ID: <f70b3789d961861cdefb0752979d4666cdd151ba.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Simon Ser <contact@emersion.fr>, nouveau@lists.freedesktop.org
Date: Wed, 21 Jun 2023 17:56:51 -0400
In-Reply-To: <20230620181547.272476-1-contact@emersion.fr>
References: <20230620181547.272476-1-contact@emersion.fr>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.3 (3.48.3-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/disp: use
 drm_kms_helper_connector_hotplug_event()
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
Cc: David Airlie <airlied@linux.ie>, Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Looks alright! Some comments below

On Tue, 2023-06-20 at 18:15 +0000, Simon Ser wrote:
> This adds more information to the hotplug uevent and lets user-space
> know that it's about a particular connector only.
>=20
> Signed-off-by: Simon Ser <contact@emersion.fr>
> Cc: Ben Skeggs <bskeggs@redhat.com>
> Cc: Lyude Paul <lyude@redhat.com>
> Cc: David Airlie <airlied@linux.ie>
> Cc: Karol Herbst <kherbst@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_display.c | 17 ++++++++++++++---
>  1 file changed, 14 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/=
nouveau/nouveau_display.c
> index ec3ffff487fc..99977e5fe716 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_display.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_display.c
> @@ -465,7 +465,8 @@ nouveau_display_hpd_work(struct work_struct *work)
>  =09struct drm_connector *connector;
>  =09struct drm_connector_list_iter conn_iter;
>  =09u32 pending;
> -=09bool changed =3D false;
> +=09int changed =3D 0;
> +=09struct drm_connector *first_changed_connector =3D NULL;
> =20
>  =09pm_runtime_get_sync(dev->dev);
> =20
> @@ -509,7 +510,12 @@ nouveau_display_hpd_work(struct work_struct *work)
>  =09=09if (old_epoch_counter =3D=3D connector->epoch_counter)
>  =09=09=09continue;
> =20
> -=09=09changed =3D true;
> +=09=09changed++;
> +=09=09if (!first_changed_connector) {
> +=09=09=09drm_connector_get(connector);
> +=09=09=09first_changed_connector =3D connector;
> +=09=09}
> +
>  =09=09drm_dbg_kms(dev, "[CONNECTOR:%d:%s] status updated from %s to %s (=
epoch counter %llu->%llu)\n",
>  =09=09=09    connector->base.id, connector->name,
>  =09=09=09    drm_get_connector_status_name(old_status),
> @@ -520,9 +526,14 @@ nouveau_display_hpd_work(struct work_struct *work)
>  =09drm_connector_list_iter_end(&conn_iter);
>  =09mutex_unlock(&dev->mode_config.mutex);
> =20
> -=09if (changed)
> +=09if (changed =3D=3D 1)
> +=09=09drm_kms_helper_connector_hotplug_event(first_changed_connector);
> +=09else if (changed > 0)
>  =09=09drm_kms_helper_hotplug_event(dev);

I'm curious if you think there might be an advantage to doing this per-
connector even with multiple connectors? Seems like we could do that if we
stored changed connectors as a bitmask.

> =20
> +=09if (first_changed_connector)
> +=09=09drm_connector_put(first_changed_connector);
> +
>  =09pm_runtime_mark_last_busy(drm->dev->dev);
>  noop:
>  =09pm_runtime_put_autosuspend(dev->dev);

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

