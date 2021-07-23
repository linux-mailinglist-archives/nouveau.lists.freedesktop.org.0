Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C85A83D44F4
	for <lists+nouveau@lfdr.de>; Sat, 24 Jul 2021 06:31:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BE3BD6FE65;
	Sat, 24 Jul 2021 04:31:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DD266EABD;
 Fri, 23 Jul 2021 10:16:49 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id 2EE4A60E73;
 Fri, 23 Jul 2021 10:16:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1627035409;
 bh=eBzt2n0xOqHlBvF7aRsjRRJPQRR0GZoHKCArOqHMbnA=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=gUd3YBzYI3+ChqWwG8xG/YcyCyhLt4pdo/xN/vW5wpAXrWUFVx3R7ty+D33jEix6w
 sJ9VTEbzDcrVJAG6DGe7ZDpU2BszjzR8pBEuGxcPkmfTyonYCjm189FWGXg3KXhoES
 /4Qq8g7chg6tVPo11uw3Mt+zAFRW7B+aUSC8olGh/Q0UmiYClcAFcEdMF/xxPaSLkm
 8bCZY4Kt+1XCdpbt7DXpg8vOFaUUV+Zs5QQBW9/Z/g60o5+zF2+lSvqsD4qRHmhWUI
 yrllJ0uG6byClZ+uRF0kLsh2uFnkLmkF1ITL0iX1vJ8jYjcCy2rIGP9/91blbZH985
 RnVtr6I0mQy5g==
Received: by mail-wm1-f46.google.com with SMTP id k4so488815wms.3;
 Fri, 23 Jul 2021 03:16:49 -0700 (PDT)
X-Gm-Message-State: AOAM530qGei2gvPnywdz0Cp9dKDvsOPrWvhYbSIvFza5w56bAR76ih2G
 PBgHnyHxIcg+6DMzJdjStUwmDy1Sinmg+ZeL9pw=
X-Google-Smtp-Source: ABdhPJwBriPt4dTcNwE3BGv5cf7FScUwWKH8mN6ZDjljoRtKp64H/dz4+H7KChwVJTdiPt+6EDqL+lbLXkOOxsq0TXs=
X-Received: by 2002:a7b:c385:: with SMTP id s5mr3670132wmj.43.1627035407814;
 Fri, 23 Jul 2021 03:16:47 -0700 (PDT)
MIME-Version: 1.0
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
In-Reply-To: <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Jul 2021 12:16:31 +0200
X-Gmail-Original-Message-ID: <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
Message-ID: <CAK8P3a3xjS-zJFiQgjYDz2Gja4KBeHWyrQX4PrbkkZfEV2OJgg@mail.gmail.com>
To: Daniel Vetter <daniel@ffwll.ch>
X-Mailman-Approved-At: Sat, 24 Jul 2021 04:31:21 +0000
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
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Jul 23, 2021 at 11:25 AM Daniel Vetter <daniel@ffwll.ch> wrote:
>
> On Fri, Jul 23, 2021 at 11:15 AM Arnd Bergmann <arnd@kernel.org> wrote:
> >
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
>
> Can we just toss the idea that BACKTLIGHT=n is a reasonable config for
> drm drivers using backlights, and add depends BACKLIGHT to all of
> them?
>
> I mean this is a perfect source of continued patch streams to keep us
> all busy, but beyond that I really don't see the point ... I frankly
> have better things to do, and especially with the big drivers we have
> making backlight optional saves comparitively nothing.
> -Daniel

Yes! I'd definitely be in favor of that, I've wasted way too much time trying
to sort through dependency loops and other problems with backlight support.

Maybe we should leave the drivers/video/fbdev/ drivers untouched in this
regard, at least for the moment, but for the drivers/gpu/drm users of
backlight that would be a nice simplification, and even the smallest ones
are unlikely to be used on systems that are too memory constrained to
deal with 4KB extra .text.

       Arnd
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
