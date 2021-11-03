Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4724444BAF
	for <lists+nouveau@lfdr.de>; Thu,  4 Nov 2021 00:33:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB486E1E9;
	Wed,  3 Nov 2021 23:33:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 358596E47A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Nov 2021 23:33:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1635982419;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=7De9Gqd8CUJxMa+TanGCv6guhL3v1dqZFI8MIBYGLDY=;
 b=QZLa9KUPT6SfXPVw6lb5F+uVG3VVdROqyeM0YLLB9BdtTbc1X9lS+r3w1OwliC0SbpWq7M
 yHgAf1/s+HqIHFrgdK9abeU1j/zadmICVfQnqVNaSZhC8foqg44Lx00wfEEkKz5h9B0axm
 rc5fyOVS5Ss6mRUf2T6dJZGzrHblpSk=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-263-tFauqqC1MimzIqTvrLErbA-1; Wed, 03 Nov 2021 19:33:37 -0400
X-MC-Unique: tFauqqC1MimzIqTvrLErbA-1
Received: by mail-wm1-f72.google.com with SMTP id
 v18-20020a7bcb52000000b00322fea1d5b7so1786841wmj.9
 for <nouveau@lists.freedesktop.org>; Wed, 03 Nov 2021 16:33:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=7De9Gqd8CUJxMa+TanGCv6guhL3v1dqZFI8MIBYGLDY=;
 b=nHsYDJ7KtypBAceqbWK3Up+aiEdAdeOJx1YymGJvUxWl9JRQj/9wjE4va0wp/sNY+4
 jo2wcYv1i5eBqPTdweDTflxRQf1awXMztUYcDmB7Kefe4L3o5RXQvqnWxj8g4UwRfUG8
 t5f14W4OERtmIZSHFb4wHmJrJxTDbfaFCb22rRRhMXefyxAIiWKo5uaUDlGT82f9gYKg
 3jBZvTvhqNQAcMXmgUetI9FsEAQg6wok+fRKNlUJBSvMTEaJFeUhk9t4oqwXXx/vJpOV
 gRil6anLkAsJ/eO2W/LGbEU3COFLgnKzSMixmokvAtdiOf/A3aiKuM6wt/mcj4nOFt1C
 pD5Q==
X-Gm-Message-State: AOAM531YPT0Gbyo+0b9zktHHpoU50eccX/rl2HH4oSWt8jzcYGxt0fLf
 PzJWpqOoUliKz+RZbbguFdlRnT9eukSGDVPLoMc5NUFfsOd37FG4BGTrJQ1lSLh6kDpW/il53mB
 egbc7HCtlwcfBi5TJrWJ8yCp1WHQqawY72b+Cpht1sQ==
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr45872362wrn.49.1635982416132; 
 Wed, 03 Nov 2021 16:33:36 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzqsfgbnO5nmV+YmqNe0Y1+aMbBesCQYIeQ4yjNTSV5UP0D0DskkCEJQoOGYhf4sRFoTFZSB/+e5dySrD+tg8U=
X-Received: by 2002:adf:eb4b:: with SMTP id u11mr45872342wrn.49.1635982415901; 
 Wed, 03 Nov 2021 16:33:35 -0700 (PDT)
MIME-Version: 1.0
References: <20211103011057.15344-1-skeggsb@gmail.com>
 <CACO55tvy5atSW9SJw1E_wmfgn1cZpDiZ2T7VuS35UGXRVdpEaw@mail.gmail.com>
In-Reply-To: <CACO55tvy5atSW9SJw1E_wmfgn1cZpDiZ2T7VuS35UGXRVdpEaw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 4 Nov 2021 00:33:25 +0100
Message-ID: <CACO55tvOAvFVhUhtttfBU9wB_2eOQL6rt8f2sKrndHgCLhHEkA@mail.gmail.com>
To: Ben Skeggs <skeggsb@gmail.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] [PATCH] ce/gf100: fix incorrect CE0 address
 calculation on some GPUs
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 stable@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Nov 3, 2021 at 8:51 AM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Wed, Nov 3, 2021 at 2:11 AM Ben Skeggs <skeggsb@gmail.com> wrote:
> >
> > From: Ben Skeggs <bskeggs@redhat.com>
> >
> > The code which constructs the modules for each engine present on the GPU
> > passes -1 for 'instance' on non-instanced engines, which affects how the
> > name for a sub-device is generated.  This is then stored as 'instance 0'
> > in nvkm_subdev.inst, so code can potentially be shared with earlier GPUs
> > that only had a single instance of an engine.
> >
> > However, GF100's CE constructor uses this value to calculate the address
> > of its falcon before it's translated, resulting in CE0 getting the wrong
> > address.
> >
> > This slightly modifies the approach, always passing a valid instance for
> > engines that *can* have multiple copies, and having the code for earlier
> > GPUs explicitly ask for non-instanced name generation.
> >
> > Bug: https://gitlab.freedesktop.org/drm/nouveau/-/issues/91
> >
> > Fixes: 50551b15c760 ("drm/nouveau/ce: switch to instanced constructor")
> > Cc: <stable@vger.kernel.org> # v5.12+
> > Signed-off-by: Ben Skeggs <bskeggs@redhat.com>
> > ---
> >  drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c    | 2 +-
> >  drivers/gpu/drm/nouveau/nvkm/engine/device/base.c | 3 +--
> >  2 files changed, 2 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
> > index 704df0f2d1f1..09a112af2f89 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/ce/gt215.c
> > @@ -78,6 +78,6 @@ int
> >  gt215_ce_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst,
> >              struct nvkm_engine **pengine)
> >  {
> > -       return nvkm_falcon_new_(&gt215_ce, device, type, inst,
> > +       return nvkm_falcon_new_(&gt215_ce, device, type, -1,
> >                                 (device->chipset != 0xaf), 0x104000, pengine);
> >  }
> > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > index ca75c5f6ecaf..b51d690f375f 100644
> > --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
> > @@ -3147,8 +3147,7 @@ nvkm_device_ctor(const struct nvkm_device_func *func,
> >         WARN_ON(device->chip->ptr.inst & ~((1 << ARRAY_SIZE(device->ptr)) - 1));             \
> >         for (j = 0; device->chip->ptr.inst && j < ARRAY_SIZE(device->ptr); j++) {            \
> >                 if ((device->chip->ptr.inst & BIT(j)) && (subdev_mask & BIT_ULL(type))) {    \
> > -                       int inst = (device->chip->ptr.inst == 1) ? -1 : (j);                 \
> > -                       ret = device->chip->ptr.ctor(device, (type), inst, &device->ptr[j]); \
> > +                       ret = device->chip->ptr.ctor(device, (type), (j), &device->ptr[j]);  \
> >                         subdev = nvkm_device_subdev(device, (type), (j));                    \
> >                         if (ret) {                                                           \
> >                                 nvkm_subdev_del(&subdev);                                    \
> > --
> > 2.31.1
> >
>
> Reviewed-by: Karol Herbst <kherbst@redhat.com>

Tested that on a GF108, so

Tested-by: Karol Herbst <kherbst@redhat.com>

