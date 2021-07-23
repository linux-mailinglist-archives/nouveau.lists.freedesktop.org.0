Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 181D73D3C45
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 17:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DEA26FB93;
	Fri, 23 Jul 2021 15:16:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 86CE76FB94
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 15:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627053358;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=Hg7Wgll5Dqrto/c+cLJ/aZ8SYqDsqKJnk73SqfFyHqc=;
 b=f/lIeuvbIRyOLmbzOyTGLXlCX4VMcMr5dynaUBTJnuC2OooTYm6f8LzPS22yleTqzGWT3A
 ckRQsdtebrb933SzfIUoGFF8e9rqIow/egNgO2vrtDT/3HYk+9lT0c0rnHCtsaCc2zljJ0
 MP+jsUuHFabNoIoy8sToDmsirRFdOMQ=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-150-oo25WjXtMlmSCCn1faB0CA-1; Fri, 23 Jul 2021 11:15:55 -0400
X-MC-Unique: oo25WjXtMlmSCCn1faB0CA-1
Received: by mail-wm1-f71.google.com with SMTP id
 j11-20020a05600c190bb02902190142995dso1525174wmq.4
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 08:15:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Hg7Wgll5Dqrto/c+cLJ/aZ8SYqDsqKJnk73SqfFyHqc=;
 b=TTmZsyna7Ym9vPy/qwx4YihtWQvC5CNZ9HPHRyCdL04HtyRiiusuj1Zv+yZ/RaKGKY
 zebgOmDOF18BLQjSEqn1g/wrtWgWTTXWhxV65g6sub+/SaaCBElBxwFHsaGOHpzDri58
 LRm8AlMK0g1wVcnqH0637CAZLAH/CzS7TKPzF8kwkIj+MTQgiITaxt4T71q3PUEuD40G
 IlJmL5ZiqorRMl1xkTYSiutAsJdSpXg20TdM3zgsfWdv+wzZ3KA8BDMRbp44DlWzoGQH
 k05N//TXHr+io1kKKTa5QBnUMzQZ5VgFFBHH8jp8e38rpaZfcNHYq5BFq3C7Dh8eiSos
 tp+A==
X-Gm-Message-State: AOAM531hduiKyLIsyluqWlNumvNjmcfgLEhHEpWgg90eOEnpqNpyrXeC
 yDRuisznNTJPATKLt4XZjuAeNWOCZ6DTQ2zAPdkhmfBdBIhkvzJSp7TthQEDiYyBlmtQJkSzR4f
 SqMK9epIZrYqYDe9EOahBWubhMN14y8VuCB6dmi0nsA==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr5053747wmk.1.1627053354282; 
 Fri, 23 Jul 2021 08:15:54 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwY8WT3or1Lwpu7iDbVDMw0gke7BYDmxM+rPUnWUEewCC1YlfLrsOiH2H5OFIGSgEJGHI7Q/9Go9PH9zpc3t5c=
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr5053718wmk.1.1627053354043; 
 Fri, 23 Jul 2021 08:15:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
In-Reply-To: <a618e29a-e4b7-bda4-a3e0-7dfd67d64e92@infradead.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 23 Jul 2021 17:15:43 +0200
Message-ID: <CACO55tvQoCnjQWRJhrJ+8TzY5MuDDSUSnwd5AU8G1qsQYCSCBg@mail.gmail.com>
To: Randy Dunlap <rdunlap@infradead.org>
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
 David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 5:10 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 7/23/21 2:15 AM, Arnd Bergmann wrote:
> > From: Arnd Bergmann <arnd@arndb.de>
> >
> > When the backlight support is disabled, the driver fails to build:
> >
> > drivers/gpu/drm/nouveau/dispnv50/disp.c: In function 'nv50_sor_atomic_disable':
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1665:59: error: 'struct nouveau_connector' has no member named 'backlight'
> >  1665 |         struct nouveau_backlight *backlight = nv_connector->backlight;
> >       |                                                           ^~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1670:35: error: invalid use of undefined type 'struct nouveau_backlight'
> >  1670 |         if (backlight && backlight->uses_dpcd) {
> >       |                                   ^~
> > drivers/gpu/drm/nouveau/dispnv50/disp.c:1671:64: error: invalid use of undefined type 'struct nouveau_backlight'
> >  1671 |                 ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> >       |                                                                ^~
> >
> > The patch that introduced the problem already contains some #ifdef
> > checks, so just add another one that makes it build again.
> >
> > Fixes: 6eca310e8924 ("drm/nouveau/kms/nv50-: Add basic DPCD backlight support for nouveau")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> > ---
> >  drivers/gpu/drm/nouveau/dispnv50/disp.c | 11 +++++++----
> >  1 file changed, 7 insertions(+), 4 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > index 093e1f7163b3..fcf53e24db21 100644
> > --- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > +++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
> > @@ -1659,20 +1659,23 @@ static void
> >  nv50_sor_atomic_disable(struct drm_encoder *encoder, struct drm_atomic_state *state)
> >  {
> >       struct nouveau_encoder *nv_encoder = nouveau_encoder(encoder);
> > -     struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> >       struct nouveau_crtc *nv_crtc = nouveau_crtc(nv_encoder->crtc);
> >       struct nouveau_connector *nv_connector = nv50_outp_get_old_connector(state, nv_encoder);
> > -     struct nouveau_backlight *backlight = nv_connector->backlight;
> >       struct drm_dp_aux *aux = &nv_connector->aux;
> > -     int ret;
> >       u8 pwr;
> >
> > +#ifdef CONFIG_DRM_NOUVEAU_BACKLIGHT
> > +     struct nouveau_drm *drm = nouveau_drm(nv_encoder->base.base.dev);
> > +     struct nouveau_backlight *backlight = nv_connector->backlight;
> > +
> >       if (backlight && backlight->uses_dpcd) {
> > -             ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > +             int ret = drm_edp_backlight_disable(aux, &backlight->edp_info);
> > +
> >               if (ret < 0)
> >                       NV_ERROR(drm, "Failed to disable backlight on [CONNECTOR:%d:%s]: %d\n",
> >                                nv_connector->base.base.id, nv_connector->base.name, ret);
> >       }
> > +#endif
> >
> >       if (nv_encoder->dcb->type == DCB_OUTPUT_DP) {
> >               int ret = drm_dp_dpcd_readb(aux, DP_SET_POWER, &pwr);
> >
>
> Hm, only Lyude Paul replied to this patch:
>
> https://lore.kernel.org/lkml/20210714171523.413-1-rdunlap@infradead.org/
>

what's actually the use case of compiling with
CONFIG_DRM_NOUVEAU_BACKLIGHT=n anyway?

>
>
> --
> ~Randy
>

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
