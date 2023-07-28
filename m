Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 65913766997
	for <lists+nouveau@lfdr.de>; Fri, 28 Jul 2023 12:00:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E948210E6D2;
	Fri, 28 Jul 2023 10:00:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B467C10E6D2
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jul 2023 09:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1690538398;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=64cwbX0RqK2VCO/K9nDSDwV09g6WKDYXzEmbeoTby84=;
 b=YT7gJHZYlnEJnlQJT89Bm5H9L3NR972nuLv7jHSbLUHKL66xJnnKxb23VB1wuUNZok1hTE
 NYZOffpFlw5pPGTzepleN2nKVb2N7enJ5tkwC91weLvfcPn6rhvpTuNYqe/5zLqlJIWIyu
 CKaAX/Jl48IbJnpDqsWCxn4pH92F8xk=
Received: from mail-lj1-f198.google.com (mail-lj1-f198.google.com
 [209.85.208.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-213-js8PwF1dOFeyEQc2c-G39w-1; Fri, 28 Jul 2023 05:59:54 -0400
X-MC-Unique: js8PwF1dOFeyEQc2c-G39w-1
Received: by mail-lj1-f198.google.com with SMTP id
 38308e7fff4ca-2a7a6393ba6so4049161fa.1
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jul 2023 02:59:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690538393; x=1691143193;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=64cwbX0RqK2VCO/K9nDSDwV09g6WKDYXzEmbeoTby84=;
 b=UJ4BpDkTVk/EhJmK0jeV0nsBXMxtaT1pjU5rPGT2l3/MHsf/wjESPdX2RwzoiArB1U
 /t+ZgEXaV9p1PaFLItrVabAw/H9+XXi3KZfZS9ivgxBp/7Z7+xlhjSPMC4WmeBu/HMwD
 l2yRBg5eXp/6eKQCFS3H+eEfAn8V9VKAMradPcsEUq2bRI2B1p+ZcO1VmG17xgVw4Nj3
 O+yEY8Jk0JYFm1Blci6a+J5+1BlbUT1bpIF/ofLdfBpvBnn0zZXGjFjYEEGhFSK2QQC5
 QuaNTtepRqIISXhU3V9xC2m/5WnF2tEpnOLaWSmZImkhZCOKihVYyP/9SCiDRrOv5Osy
 EZHg==
X-Gm-Message-State: ABy/qLZc0pMmnXuA2mT5bpE4W2z9H6LOqKNk87Odggu5MfHcrRZ0Vodp
 3DZfh+N0DUW6/H2bfNLN8Cml3t/BESeZYwYdF4fMkvAXp0e2tGmHJZCqdqUjOXxjPwaRwGQd45J
 c3LU8bgxDZhtQ1zMgSW4IhaIAiTSjvSCNhh5/obWQ7w==
X-Received: by 2002:a2e:501c:0:b0:2b6:af68:6803 with SMTP id
 e28-20020a2e501c000000b002b6af686803mr705819ljb.4.1690538393209; 
 Fri, 28 Jul 2023 02:59:53 -0700 (PDT)
X-Google-Smtp-Source: APBJJlFAIXcAWMCt7sf6hNC3aFwCm0EH6PL4GAUcsvLw8voE2q9DUMDvV3f/2rOa2DVWhU8XcDIjRJl86zmb1WZ6ujo=
X-Received: by 2002:a2e:501c:0:b0:2b6:af68:6803 with SMTP id
 e28-20020a2e501c000000b002b6af686803mr705816ljb.4.1690538392874; Fri, 28 Jul
 2023 02:59:52 -0700 (PDT)
MIME-Version: 1.0
References: <20230707215851.590754-1-lyude@redhat.com>
 <CACO55tvfTDu8XcKowWXcSRqp8OMLb8Q4jnPG_Fn5y=yJy-Dqbw@mail.gmail.com>
 <badef3d33469d97b01a42da520ad22ae4c9485fe.camel@redhat.com>
 <CACO55ttVgw=uuG1i9bNOi5hh-0Xi+WhcR4eL_TQOzjzUKGX1rw@mail.gmail.com>
In-Reply-To: <CACO55ttVgw=uuG1i9bNOi5hh-0Xi+WhcR4eL_TQOzjzUKGX1rw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 28 Jul 2023 11:59:41 +0200
Message-ID: <CACO55tt=Hr0RWhVEJeffMFxwvLuNmB38dUz2ZB1zWf5cNpXYKQ@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Nouveau] [PATCH] drm/nouveau/nvkm/dp: Add hack to fix DP 1.3+
 DPCD issues
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
Cc: nouveau@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 dri-devel@lists.freedesktop.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 28, 2023 at 1:11=E2=80=AFAM Karol Herbst <kherbst@redhat.com> w=
rote:
>
> On Thu, Jul 27, 2023 at 11:57=E2=80=AFPM Lyude Paul <lyude@redhat.com> wr=
ote:
> >
> > On Sun, 2023-07-09 at 01:42 +0200, Karol Herbst wrote:
> > > On Fri, Jul 7, 2023 at 11:58=E2=80=AFPM Lyude Paul <lyude@redhat.com>=
 wrote:
> > > >
> > > > Currently we use the drm_dp_dpcd_read_caps() helper in the DRM side=
 of
> > > > nouveau in order to read the DPCD of a DP connector, which makes su=
re we do
> > > > the right thing and also check for extended DPCD caps. However, it =
turns
> > > > out we're not currently doing this on the nvkm side since we don't =
have
> > > > access to the drm_dp_aux structure there - which means that the DRM=
 side of
> > > > the driver and the NVKM side can end up with different DPCD capabil=
ities
> > > > for the same connector.
> > > >
> > > > Ideally to fix this, we want to start setting up the drm_dp_aux dev=
ice in
> > > > NVKM before we've made contact with the DRM side - which should be =
pretty
> > > > easy to accomplish (I'm already working on it!). Until then however=
, let's
> > > > workaround this problem by porting a copy of drm_dp_read_dpcd_caps(=
) into
> > > > NVKM - which should fix this issue.
> > > >
> > > > Issue: https://gitlab.freedesktop.org/drm/nouveau/-/issues/211
> > >
> > > Should a Fixes: or Cc: stable tag be added so it gets backported?
> >
> > JFYI I think not adding one is fine nowadays? The stable bot seems to b=
e
> > pretty good at catching anything with the words fix/fixes in it
> >
>
> Yeah not sure.. I'd rather be specific and add it just to be sure.
> Anyway, it could also be done while pushing. I think the bigger
> question here was if this fix is good enough for stable or if you plan
> to rework it.
>
> > >
> > > > Signed-off-by: Lyude Paul <lyude@redhat.com>
> > > > ---
> > > >  drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c | 48 +++++++++++++++=
+++-
> > > >  1 file changed, 47 insertions(+), 1 deletion(-)
> > > >
> > > > diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c b/driver=
s/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > > index 40c8ea43c42f..b8ac66b4a2c4 100644
> > > > --- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > > +++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/dp.c
> > > > @@ -26,6 +26,8 @@
> > > >  #include "head.h"
> > > >  #include "ior.h"
> > > >
> > > > +#include <drm/display/drm_dp.h>
> > > > +
> > > >  #include <subdev/bios.h>
> > > >  #include <subdev/bios/init.h>
> > > >  #include <subdev/gpio.h>
> > > > @@ -634,6 +636,50 @@ nvkm_dp_enable_supported_link_rates(struct nvk=
m_outp *outp)
> > > >         return outp->dp.rates !=3D 0;
> > > >  }
> > > >
> > > > +/* XXX: This is a big fat hack, and this is just drm_dp_read_dpcd_=
caps()
> > >
> > > Well.. maybe we should rephrase that _if_ we want to see it
> > > backported. But is this code really that bad? It kinda looks
> > > reasonable enough.
> > >
> > > > + * converted to work inside nvkm. This is a temporary holdover unt=
il we start
> > > > + * passing the drm_dp_aux device through NVKM
> > > > + */
> > > > +static int
> > > > +nvkm_dp_read_dpcd_caps(struct nvkm_outp *outp)
> > > > +{
> > > > +       struct nvkm_i2c_aux *aux =3D outp->dp.aux;
> > > > +       u8 dpcd_ext[DP_RECEIVER_CAP_SIZE];
> > > > +       int ret;
> > > > +
> > > > +       ret =3D nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.dpcd, =
DP_RECEIVER_CAP_SIZE);
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > > +       /*
> > > > +        * Prior to DP1.3 the bit represented by
> > > > +        * DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT was reserved.
> > > > +        * If it is set DP_DPCD_REV at 0000h could be at a value le=
ss than
> > > > +        * the true capability of the panel. The only way to check =
is to
> > > > +        * then compare 0000h and 2200h.
> > > > +        */
> > > > +       if (!(outp->dp.dpcd[DP_TRAINING_AUX_RD_INTERVAL] &
> > > > +             DP_EXTENDED_RECEIVER_CAP_FIELD_PRESENT))
> > > > +               return 0;
> > > > +
> > > > +       ret =3D nvkm_rdaux(aux, DP_DP13_DPCD_REV, dpcd_ext, sizeof(=
dpcd_ext));
> > > > +       if (ret < 0)
> > > > +               return ret;
> > > > +
> > > > +       if (outp->dp.dpcd[DP_DPCD_REV] > dpcd_ext[DP_DPCD_REV]) {
> > > > +               OUTP_DBG(outp, "Extended DPCD rev less than base DP=
CD rev (%d > %d)\n",
> > > > +                        outp->dp.dpcd[DP_DPCD_REV], dpcd_ext[DP_DP=
CD_REV]);
> > > > +               return 0;
> > > > +       }
> > > > +
> > > > +       if (!memcmp(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext)))
> > > > +               return 0;
> > > > +
> > > > +       memcpy(outp->dp.dpcd, dpcd_ext, sizeof(dpcd_ext));
> > > > +
> > > > +       return 0;
> > > > +}
> > > > +
> > > >  void
> > > >  nvkm_dp_enable(struct nvkm_outp *outp, bool auxpwr)
> > > >  {
> > > > @@ -689,7 +735,7 @@ nvkm_dp_enable(struct nvkm_outp *outp, bool aux=
pwr)
> > > >                         memset(outp->dp.lttpr, 0x00, sizeof(outp->d=
p.lttpr));
> > > >                 }
> > > >
> > > > -               if (!nvkm_rdaux(aux, DPCD_RC00_DPCD_REV, outp->dp.d=
pcd, sizeof(outp->dp.dpcd))) {
> > > > +               if (!nvkm_dp_read_dpcd_caps(outp)) {
> > > >                         const u8 rates[] =3D { 0x1e, 0x14, 0x0a, 0x=
06, 0 };
> > > >                         const u8 *rate;
> > > >                         int rate_max;
> > > > --
> > > > 2.40.1
> > > >
> > >
> >
> > --
> > Cheers,
> >  Lyude Paul (she/her)
> >  Software Engineer at Red Hat
> >

before I forget:

Reviewed-by: Karol Herbst <kherbst@redhat.com>

