Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 076EB751CF2
	for <lists+nouveau@lfdr.de>; Thu, 13 Jul 2023 11:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C07CA10E65C;
	Thu, 13 Jul 2023 09:14:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A61910E65B
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 09:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1689239670;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KAprlvR1Ix2PbgQmaBalxSCG9P2sXZzbouDbbLDyB+A=;
 b=R0PBHlv0+dXPUdBcmn/Wz3aE3jsHeQ/914qE8V2rUGlaMOeBYEaFZ1Fp1gCkBbd8I7Itoe
 cG1M+2eiOtj3doRGme8pDpWFhJ/GElPVy3AdAg9lTVEY7O6lgT35TFkRxnxIr9zCYz1YwM
 gA9a0aVt00JSVFXirjy7nI/22QsOZoQ=
Received: from mail-lj1-f199.google.com (mail-lj1-f199.google.com
 [209.85.208.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-106-yyKaSqqgNfOEUYKvL1Qs5A-1; Thu, 13 Jul 2023 05:14:29 -0400
X-MC-Unique: yyKaSqqgNfOEUYKvL1Qs5A-1
Received: by mail-lj1-f199.google.com with SMTP id
 38308e7fff4ca-2b6c4c018aaso1241341fa.1
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jul 2023 02:14:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689239667; x=1689844467;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=KAprlvR1Ix2PbgQmaBalxSCG9P2sXZzbouDbbLDyB+A=;
 b=KSEzQ6MnAAhGLNXBMBQNS4z4QYuJwbd9pPE8EVZJeDDnl+nE9QradN/n3CoEcFj6fF
 VJxzQ4WPY03I/Q1U2viG6yjBgT/I/Nml7k/jbp/Yijn0NFFE4GFJkWn+zrhJEGXPnQc2
 PrOYguDIKsDCl3xFlG0v8LUMVzzG5JGIo2dm0PMKiDlNhvb/JUKTn/8Nphdv7yEPb/Oh
 RvU70dkD/N2jKZREctFMVETf04+0+7PdPR6Js45QJxUil6jzMlsHpTZu9ZHIs5MPyRfO
 3DYiklICxKypV+ODZQLy/KJ7hbeo2hAl0yUx0UOPd1QvDkg8G08mHm1+/2HblqPIvLIM
 gVCQ==
X-Gm-Message-State: ABy/qLaZDysZPcH/9G7ZjK3/CxWZD166mlrruuxBvd5aFyPBeWp/scR0
 jIhx/At2TnH0tR/sDkmIfVeUCT0Hh+jhMtEaFR/McY/0WT6Y0SrqFlmXxeq8XAi61PzwgAYyWBT
 FZb/3YtJWxi88M3sliW1i7c0GrqBxECxwcxIew8xquw==
X-Received: by 2002:a2e:a790:0:b0:2b6:99a7:2fb4 with SMTP id
 c16-20020a2ea790000000b002b699a72fb4mr1037278ljf.0.1689239667745; 
 Thu, 13 Jul 2023 02:14:27 -0700 (PDT)
X-Google-Smtp-Source: APBJJlEkshQIMfUIvgmhESYeAU1+QrImVvQD8hS/q4nZ4jzkB6vlgYRDkE2AQxSAa5zT+wKB/ukH3fmIoOvzD5m3kis=
X-Received: by 2002:a2e:a790:0:b0:2b6:99a7:2fb4 with SMTP id
 c16-20020a2ea790000000b002b699a72fb4mr1037259ljf.0.1689239667458; Thu, 13 Jul
 2023 02:14:27 -0700 (PDT)
MIME-Version: 1.0
References: <20230710070505.53916-1-xujianghui@cdjrlc.com>
 <1ddf673283e93e83d912066f2241b976@208suo.com>
 <ZKvK4NXzkKZTE35E@debian.me>
 <CACO55tuG+4=4MTGq=FRuuP8dJaAHwtMCy3e9H8v5d8dVGsnkJw@mail.gmail.com>
In-Reply-To: <CACO55tuG+4=4MTGq=FRuuP8dJaAHwtMCy3e9H8v5d8dVGsnkJw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 13 Jul 2023 11:14:16 +0200
Message-ID: <CACO55tubrPUcdcsfavOqNt6_oqibNceVLGmpjS3Vtz13RqELGw@mail.gmail.com>
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

On Thu, Jul 13, 2023 at 11:13=E2=80=AFAM Karol Herbst <kherbst@redhat.com> =
wrote:
>
> On Mon, Jul 10, 2023 at 11:10=E2=80=AFAM Bagas Sanjaya <bagasdotme@gmail.=
com> wrote:
> >
> > On Mon, Jul 10, 2023 at 03:06:47PM +0800, sunran001@208suo.com wrote:
> > > Fixed error: 'do not use assignment in if condition'
> > >
> > > This patch fixes error: 'do not use assignment in if condition'
> > > in drm/nouveau/iccsense
> >
> > I guess this is checkpatch fix, right?
> >
> > >
> > > Signed-off-by: Ran Sun <sunran001@208suo.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c | 3 ++-
> > >  1 file changed, 2 insertions(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > > b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > > index 8f0ccd3664eb..2428f3d6e477 100644
> > > --- a/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > > +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/iccsense/base.c
> > > @@ -322,7 +322,8 @@ int
> > >  nvkm_iccsense_new_(struct nvkm_device *device, enum nvkm_subdev_type=
 type,
> > > int inst,
> > >             struct nvkm_iccsense **iccsense)
> > >  {
> > > -    if (!(*iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL)))
> > > +    *iccsense =3D kzalloc(sizeof(**iccsense), GFP_KERNEL);
> > > +    if (!*iccsense)
> > >          return -ENOMEM;
> > >      INIT_LIST_HEAD(&(*iccsense)->sensors);
> > >      INIT_LIST_HEAD(&(*iccsense)->rails);
> >
> > Your patch is corrupted (tabs converted to spaces) because you're using
> > Roundcube. Please use git-send-mail(1) instead.
> >
>
> oh right, I didn't notice with the patches I reviewed already here.
> Yeah, none of them apply, please use git to send those patches.
>

also please send them all together in a single series the next time.

> > Thanks.
> >
> > --
> > An old man doll... just what I always wanted! - Clara

