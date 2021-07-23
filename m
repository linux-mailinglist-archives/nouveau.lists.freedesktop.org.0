Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91F7B3D3C5B
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 17:23:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE0516F412;
	Fri, 23 Jul 2021 15:23:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-x433.google.com (mail-wr1-x433.google.com
 [IPv6:2a00:1450:4864:20::433])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC276F412
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 15:23:23 +0000 (UTC)
Received: by mail-wr1-x433.google.com with SMTP id w12so2703356wro.13
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 08:23:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=VpD6pBpuIHkxy1hH2QDgXSeXKJgN811ge6cKz/eevh8=;
 b=ia6NdzfXPkb9IiHoHZzpTRtoWu2xUftCOAginiO6qKMddK3ZUnSobx3m4IJXfhqYZW
 8xT5CdNA9mt6zcu1EutCvhFGozYYPio0BuAX1DqfGwq3HC95h+FjoJTxYCuaZGDyEQ7h
 upzVl/RQp0BQ7Eb+s7tnf5zRfBp+oWiUU1j5U=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=VpD6pBpuIHkxy1hH2QDgXSeXKJgN811ge6cKz/eevh8=;
 b=LL1AADvlhU5/vCROPwhm8yVCNuFMoFPMbmuSOEIbFGestQub1cidO0aMHRVJxLf6OI
 vyAclzjcfQ7LdwYdZ2VauwQE+b9tg+e2PuPq1OzuN06f4ks1LQ2pWi4KsNFXn8yUJZuB
 ITfuRBxkUrDt4t09v7SoVwvytNoPkGQSZHXHcxdkmyl9WCVhrbdpc2OoXoMI1Ql4eFgE
 7QcHLO2NtKiC+A4+gIPiv8/wjlnHaqAer/f1VkB3mOR9dBlrHRJwx99NS2Oxn6t6v32b
 qIaZxhuneXQD0+cwNPAdgeAo8eAxYnC3tXRAl6b0FbWYH7mMD2/n85mxztC4X7Iri/Fo
 I3ag==
X-Gm-Message-State: AOAM533Y3HJX8hdz41ImNg+JVUD6CMRIQuJoa63NpSjG+UwnsWKZ6y//
 VGE2W5+QtDc0Zu4rwk4vwd62tA==
X-Google-Smtp-Source: ABdhPJxWjpKj9xIb+Pq3LUjDM/QHddsL70N5mpK2d8rkq2dS+LUwjZ9DqSk3/vwkpEz8h0zdiMQdtQ==
X-Received: by 2002:adf:edd1:: with SMTP id v17mr5736357wro.276.1627053801948; 
 Fri, 23 Jul 2021 08:23:21 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id r19sm35170770wrr.32.2021.07.23.08.23.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 08:23:21 -0700 (PDT)
Date: Fri, 23 Jul 2021 17:23:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Arnd Bergmann <arnd@kernel.org>
Message-ID: <YPre51p6TirescUu@phenom.ffwll.local>
Mail-Followup-To: Arnd Bergmann <arnd@kernel.org>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Lyude Paul <lyude@redhat.com>, Arnd Bergmann <arnd@arndb.de>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>,
 Nikola Cornij <nikola.cornij@amd.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
 <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
X-Operating-System: Linux phenom 5.10.0-7-amd64 
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 12:16:31PM +0200, Arnd Bergmann wrote:
> On Fri, Jul 23, 2021 at 11:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
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
> 
> Yes! I'd definitely be in favor of that, I've wasted way too much time trying
> to sort through dependency loops and other problems with backlight support.
> 
> Maybe we should leave the drivers/video/fbdev/ drivers untouched in this
> regard, at least for the moment, but for the drivers/gpu/drm users of
> backlight that would be a nice simplification, and even the smallest ones
> are unlikely to be used on systems that are too memory constrained to
> deal with 4KB extra .text.

Yeah I think we can do this entirely ad-hoc, i.e. any time the backlight
wheel wobbles off again we nail it down for good for that driver with a
depends on BACKGLIGHT and remove any lingering #ifdef all over.

If you want maybe start out with the biggest drm drivers in a series, I
think if nouveau/amdgpu/i915 folks ack this you're good to go to just
convert as things get in the way.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
