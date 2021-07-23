Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E2F5D3D3861
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 12:12:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324026FA93;
	Fri, 23 Jul 2021 10:12:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E38476FA93
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 10:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627035163;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Q9pRT+TDioDd0ny044PT7McbtP/VkEKPsqs+fpZmGxs=;
 b=J7JeJ/MsgtN8LiIlmC4RdV5A5qwymwDJgW19USuvqNu8/jQuYjPIRG9/ziPHx4g/o9W0RA
 581/Ef0jpzLIJyGRo/4aOThKmSZ0UtdOpSDj6dhRKW1WwTS5DGlb8ph2PJzAOzCP0m3hPC
 ZRMtJM2owgl8smwAj4RZDja7xhZuGLQ=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-241-ogpP6OkcOAqq9dDxOVvQ8g-1; Fri, 23 Jul 2021 06:12:41 -0400
X-MC-Unique: ogpP6OkcOAqq9dDxOVvQ8g-1
Received: by mail-wr1-f72.google.com with SMTP id
 d2-20020adfef820000b0290137e68ed637so767378wro.22
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 03:12:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Q9pRT+TDioDd0ny044PT7McbtP/VkEKPsqs+fpZmGxs=;
 b=ZsJzG5cDHiYqPcu/7OBa/nxoH9H4KEv8PDIfQvsKPWAtE0esZ7sLTpXzGHaPQ/Ak+D
 UOmu2bL7r+gppxOSXVq33VwfnIEb246nlT4g2exn/J5PLkR7BYwxwcYqsKoEaOtvAcRk
 PDkDq3IEe1NiOWMNV4f2kvnHFrTX0z1/ySq/uzDngayNU5G9QxyFQBc2hotwxp7Wh/iD
 agkR8iICS08D1mMMcD+/r+Ce6Sig48fix1ao7I51muSnIXzc8VeN4R+SFGqUXFyGoJNr
 5o5tQ/BGKwyXvFqz4/7Hcmg1JBwGYrxWrC2/yNziyL1EVDK8XQ/YeNBkiwDmvAanNdwy
 udbA==
X-Gm-Message-State: AOAM531PIuZE+bjheKL8hwFSpfTtIjKCiQap0w477XtfRmn2Wu5xy3oD
 A3mQRKagn7aTQqHSMdPf+77FIrZ6BXBVQ91lURNoqa6mzIBsX29k9kykg6l1iZrzhDPlF2Wh0SR
 4uHSXG3dPa2IITuIXY5grR4pmFC3R6Al5NQ3wfRK5kQ==
X-Received: by 2002:a05:600c:3ba7:: with SMTP id
 n39mr3755671wms.164.1627035160636; 
 Fri, 23 Jul 2021 03:12:40 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJx2n0dFuqSnizQabm+vXjBCnDF5inrP51MQVNclVAB1hSAcJbJ3coTLI37aBZNo+JsNAeWu1UbltRxODh+umPQ=
X-Received: by 2002:a05:600c:3ba7:: with SMTP id
 n39mr3755652wms.164.1627035160411; 
 Fri, 23 Jul 2021 03:12:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
 <CACO55ttWCe2NLBiDW+nujiXTE1nGgNJy4C0q+5Aa6uh0OJ1sww@mail.gmail.com>
In-Reply-To: <CACO55ttWCe2NLBiDW+nujiXTE1nGgNJy4C0q+5Aa6uh0OJ1sww@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 23 Jul 2021 12:12:29 +0200
Message-ID: <CACO55tvfzMiwfh87M=x3d_KWm41btDVHEGxPQLV0+iSskPQzWA@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
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
Cc: Arnd Bergmann <arnd@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
 David Airlie <airlied@linux.ie>, Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 12:10 PM Karol Herbst <kherbst@redhat.com> wrote:
>
> On Fri, Jul 23, 2021 at 11:24 AM Daniel Vetter <daniel@ffwll.ch> wrote:
> >
> > On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> > >
> > > From: Arnd Bergmann <arnd@arndb.de>
> > >
> > > When the backlight support is disabled, the driver fails to build:
> > >
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
> > >  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
> > >       |                                                           ^~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
> > >  1670 |         if (backlight && backlight->uses_dpcd) {
> > >       |                                   ^~
> > > drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
> > >  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > >       |                                                                ^~
> > >
> > > The patch that introduced the problem already contains some #ifdef
> > > checks, so just add another one that makes it build again.
> > >
> > > Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> > > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> >
> > Can we just toss the idea that BACKTLIGHT=n is a reasonable config for
> > drm drivers using backlights, and add depends BACKLIGHT to all of
> > them?
> >
> > I mean this is a perfect source of continued patch streams to keep us
> > all busy, but beyond that I really don't see the point ... I frankly
> > have better things to do, and especially with the big drivers we have
> > making backlight optional saves comparitively nothing.
> > -Daniel
> >
>
> same, I'd just require BACKLIGHT as well tbh.
>

ehhh, get rid of DRM_NOUVEAU_BACKLIGHT I meant.

> > > ---
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
> > >  1 file changed, 7 insertions(+), 4 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > index 093e1f7163b3..fcf53e24db21 100644
> > > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > > @@ -1659,20 +1659,23 @@ static void
> > >  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
> > >  {
> > >         struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> > > -       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> > >         struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
> > >         struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
> > > -       struct nouveau_backlight *backlight = nv_connector->backlight;
> > >         struct drm_dp_aux *aux = &nv_connector->aux;
> > > -       int ret;
> > >         u8 pwr;
> > >
> > > +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> > > +       struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> > > +       struct nouveau_backlight *backlight = nv_connector->backlight;
> > > +
> > >         if (backlight && backlight->uses_dpcd) {
> > > -               ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > > +               int ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > > +
> > >                 if (ret < 0)
> > >                         NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
> > >                                  nv_connector->base.base.id, nv_connector->base.name, ret);
> > >         }
> > > +#endif
> > >
> > >         if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> > >                 int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> > > --
> > > 2.29.2
> > >
> >
> >
> > --
> > Daniel Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> >

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
