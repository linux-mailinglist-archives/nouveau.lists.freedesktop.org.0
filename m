Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C21EB751CEE
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 11:14:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FC1C10E657;
	Thu, 13 Jul 2023 09:14:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9614F10E657
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:14:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239641;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=EINzy8OMuu+nLPtYF3xlSMnhvtIBY4/1ybYAlD/eApY=;
 b=brHT9VF5+hC27HdZhBQDKAsNOvAR4HygczAtGQ2k9fY86qTooSxFdXkVY6a2nULRsnKaqT
 3dfHAMGKjKTxgslKsH4G4ZRxCsabFWOvZHMmc5VaCVwVZiox+OtCnWACJ5AU+FcrItyyEU
 SzehCdHbemEmicUuHt+hkP+F8JDWg+4=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-370-VixRtYYNM8-CFJbf15bZqQ-1; Thu, 13 Jul 2023 05:14:00 -0400
X-MC-Unique: VixRtYYNM8-CFJbf15bZqQ-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6a64c5aa5so685691fa.0
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 02:14:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239639; x=1691831639;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EINzy8OMuu+nLPtYF3xlSMnhvtIBY4/1ybYAlD/eApY=;
 b=R5gZNpv1Drz3EIGwilUY65y6mopKyPjwM6SSND3XOMqAng4NQtP41XJedDXQKAvdhb
 Ej2wITzJvdyBsW5tAlqVdOmNvZijVpUkIP4ASizIfyRh/mKcA5crwsDVSSXRg3AADUA0
 FvhQkF1R9zMBcX8Mr+1xgbbx6LgvKhEgRpbypjHP/OqXVtHxMK3r6SGy3b3s09Vj978F
 jOzyz4QKlbmHcBfbOR9B+Pn8kiRdAAt0jjuqNcnkSF/qTTjn2XMBXv+oAa0EsW0YjCs/
 Nwaxj+aifCK/6nx74+6V40nr8CAWeDW/Ql6jtnySf+oVr9tFb273DihtT/zo13Bn07Pc
 1/nQ==
X-Gm-Message-State: ABy/qLali9Dka+BUQ4i9diEMi0Ssm1MQOJYqWH/7KAkAe9e4aRRWMURU
 kQeuKHdQC214tXOz/NwwVo3eIWohQZbKnnvqSEO7zeadTl8rpLd4U8PBKaGlnCzWa75KONVU1Bh
 7U/JIE9L3pSibCXQlqMSxa0iRWsrtpVWQS4ZqbKb7EQ==
X-Received: by 2002:a05:651c:198a:b0:2b6:120a:af65 with SMTP id
 bx10-20020a05651c198a00b002b6120aaf65mr1098587ljb.3.1689239639064; 
 Thu, 13 Jul 2023 02:13:59 -0700 (PDT)
X-Google-Smtp-Source: APBJJlF9pWLznHO6dCvVxwuohZtwG1kEt1OdgiJxyzIeD3eMvB3IqEKi9luli955rnWYGXvh91SLOIVoA6r9lksfANY=
X-Received: by 2002:a05:651c:198a:b0:2b6:120a:af65 with SMTP id
 bx10-20020a05651c198a00b002b6120aaf65mr1098567ljb.3.1689239638795; Thu, 13
 Jul 2023 02:13:58 -0700 (PDT)
MIME-Version: 1.0
References: <20230710070505.53916-1-xujianghui@cdjrlc.com>
 <1ddf673283e93e83d912066f2241b976@208suo.com>
 <ZKvK4NXzkKZTE35E@debian.me>
In-Reply-To: <ZKvK4NXzkKZTE35E@debian.me>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:13:47 +0200
Message-ID: <CACO55tuG+4=4MTGq=FRuuP8dJaAHwtMCy3e9H8v5d8dVGsnkJw@mail.gmail.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/iccsense:
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
Cc: sunran001@208suo.com, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Jul 10, 2023 at 11:10=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.co=
m> wrote:
>
> On Mon, Jul 10, 2023 at 03:06:47PM +0800, sunran001@208suo.com wrote:
> > Fixed error: 'do not use assignment in if condition'
> >
> > This patch fixes error: 'do not use assignment in if condition'
> > in drm/nouveau/iccsense
>
> I guess this is checkpatch fix, right?
>
> >
> > Signed-off-by: Ran Sun <sunran001@208suo.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 ++-
> >  1 file changed, 2 insertions(+), 1 deletion(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > index 8f0ccd3664eb..2428f3d6e477 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > @@ -322,7 +322,8 @@ int
> >  nvkm_iccsense_new_(struct nvkm_device *device, enum nvkm_subdev_type t=
ype,
> > int inst,
> >             struct nvkm_iccsense **iccsense)
> >  {
> > -    if (!(*iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL)))
> > +    *iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL);
> > +    if (!*iccsense)
> >          return -ENOMEM;
> >      INIT_LIST_HEAD(&(*iccsense)->sensors);
> >      INIT_LIST_HEAD(&(*iccsense)->rails);
>
> Your patch is corrupted (tabs converted to spaces) because you're using
> Roundcube. Please use git-send-mail(1) instead.
>

oh right, I didn't notice with the patches I reviewed already here.
Yeah, none of them apply, please use git to send those patches.

> Thanks.
>
> --
> An old man doll... just what I always wanted! - Clara

