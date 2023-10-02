Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D7D77B5A9D
	for <lists+nouveau@lfdr.de>; Mon,  2 Oct 2023 20:58:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4310910E1CD;
	Mon,  2 Oct 2023 18:58:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF57F10E1CD
 for <nouveau@lists.freedesktop.org>; Mon,  2 Oct 2023 18:58:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1696273107;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EGNa1xr9dVJClNC/hmiFO6gNvSEzJS7L4kJGy1CQbyA=;
 b=CM9YHiBc6gKGd4cplTzeCdnIb1eedA98Yskbj7OSfeWSdD/Cd4w7v1GCvpDDZaFdKpTMh4
 ISQyKo0pAaeDtxch4606fv9ZPuuDh9ttY8deeid+ob/nm4YKjcc0NYakPaaBy0dq0+AsHj
 xrb+1KjjuHxZJSKzveFRlTL532YhtYA=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-654-1hxYWoSGPhSdMueWNGow4w-1; Mon, 02 Oct 2023 14:58:26 -0400
X-MC-Unique: 1hxYWoSGPhSdMueWNGow4w-1
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-77578227e4bso17647585a.2
 for <nouveau@lists.freedesktop.org>; Mon, 02 Oct 2023 11:58:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696273106; x=1696877906;
 h=mime-version:user-agent:content-transfer-encoding:organization
 :references:in-reply-to:date:cc:to:from:subject:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TPjWE/fwf7KsUGXjjsz0HVK1W6Mzf4sfbKxCMUto/gU=;
 b=LP8SK3yS1uJb7FsnVe6V3oL6vmm6ZNxJh8eDpjkqhjuulTRmnjMFuVSfSvQmnzVmRp
 hSyDqzoPe2U2+DriZ80b8k0hCxuTvkKphhOBf10LUGdrdGoBPHaJrAR/MbtNx9AxkSI7
 H3PiUbme6IakLC1YxtocQfHVH1dGhUY5QpUbTYgGRRcBQyR0Xvp9CqNCpUI3G42TcGrQ
 qEfe699pEruy7qd5W/jAY76ilsuU0CzPzU421evxVAPP+OWbzDWzqHUVpNBQkRvfTHtV
 gYXAJ11dPeqWu9kwNsS6UFBz01fRkI5sUPlf4SMc4xlc2BkCHWmvqb6jBkeX/hZl9yIw
 yyWA==
X-Gm-Message-State: AOJu0YwnFAh+epjzNCDfEaQX5/vPFZlZyJglbvfqZ80rtTWT2NXC76UE
 Eso6jlo0UE0zlxS7LBD9Sd3Y8W1cVQsJ8p3DtpQpsUm2HfgNiYhszcAG/YbEzkxpghyxJY4Bw4J
 MzN++OZjeXdeJZ2Xsddfpy3iXIw==
X-Received: by 2002:a05:620a:2099:b0:775:7339:68f8 with SMTP id
 e25-20020a05620a209900b00775733968f8mr11843378qka.57.1696273106067; 
 Mon, 02 Oct 2023 11:58:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGzC8D2AZ9hblHwHu6cd6XI9ESJtzXDAnBlh/+KUDLaB/humaF4Fj/v770LkQU4U4z4B7OJtw==
X-Received: by 2002:a05:620a:2099:b0:775:7339:68f8 with SMTP id
 e25-20020a05620a209900b00775733968f8mr11843360qka.57.1696273105746; 
 Mon, 02 Oct 2023 11:58:25 -0700 (PDT)
Received: from ?IPv6:2600:4040:5c6c:a300::feb? ([2600:4040:5c6c:a300::feb])
 by smtp.gmail.com with ESMTPSA id
 q9-20020a05620a038900b0076cb1eff83csm3635903qkm.5.2023.10.02.11.58.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Oct 2023 11:58:24 -0700 (PDT)
Message-ID: <8e78b86a8f3201a943a333fedc5f282cd0f46fc4.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Danilo Krummrich <dakr@redhat.com>, nouveau@lists.freedesktop.org, 
 faith@gfxstrand.net
Date: Mon, 02 Oct 2023 14:58:22 -0400
In-Reply-To: <20231002135008.10651-1-dakr@redhat.com>
References: <20231002135008.10651-1-dakr@redhat.com>
Organization: Red Hat Inc.
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH v2 1/3] drm/nouveau: chan: use struct
 nvif_mclass
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
Cc: dri-devel@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

For the whole series:

Reviewed-by: Lyude Paul <lyude@redhat.com>

On Mon, 2023-10-02 at 15:46 +0200, Danilo Krummrich wrote:
> Use actual struct nvif_mclass instead of identical anonymous struct.
>=20
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  drivers/gpu/drm/nouveau/nouveau_chan.c | 5 +----
>  1 file changed, 1 insertion(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nou=
veau/nouveau_chan.c
> index 1fd5ccf41128..dffbee59be6a 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_chan.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
> @@ -259,10 +259,7 @@ static int
>  nouveau_channel_ctor(struct nouveau_drm *drm, struct nvif_device *device=
, bool priv, u64 runm,
>  =09=09     struct nouveau_channel **pchan)
>  {
> -=09static const struct {
> -=09=09s32 oclass;
> -=09=09int version;
> -=09} hosts[] =3D {
> +=09const struct nvif_mclass hosts[] =3D {
>  =09=09{  AMPERE_CHANNEL_GPFIFO_B, 0 },
>  =09=09{  AMPERE_CHANNEL_GPFIFO_A, 0 },
>  =09=09{  TURING_CHANNEL_GPFIFO_A, 0 },

--=20
Cheers,
 Lyude Paul (she/her)
 Software Engineer at Red Hat

