Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBA725BE511
	for <lists+nouveau@lfdr.de>; Tue, 20 Sep 2022 13:59:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50F610E4F8;
	Tue, 20 Sep 2022 11:59:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com
 [IPv6:2a00:1450:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172F10E4F1;
 Tue, 20 Sep 2022 11:59:36 +0000 (UTC)
Received: by mail-ej1-x632.google.com with SMTP id sb3so5503887ejb.9;
 Tue, 20 Sep 2022 04:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:from:to:cc:subject:date;
 bh=SC6OE5NQVppkG8ec1Bn2cJrZ5JuNfZEXXEVMq2fc1nE=;
 b=JKiXlIOjQWrVZIt6TBVBA2nvdwgBofVoLbO9nChl0L1nJmnQnVvoFMPaYj9pyzFfqN
 +VdavKa4O35l7pCZ1T30sp1fy7+7uq1lZ8xmU3DvhiKklC7z1EKF1h1N9ufcSRA9yTAy
 /yAY+9iOqKKxZuTfCPqw+MoWCpkCOHsK0zFS2/9hcmYHm3QH+ZiOSnEyNDDdEP2VCN2j
 HBtobpikJXKpItUjrAiYMuneZYdCHZueqx9rwfmUjhiuYBfk6oSCEF26CyEQ5c1SC4Kc
 wWiSdEE8oX/PTWKPfzVl6KowR8XaIgwisR2EVJgRi2Vpa0N3AEZLuStiH9nkMSE32Q8Z
 NHnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
 :subject:date;
 bh=SC6OE5NQVppkG8ec1Bn2cJrZ5JuNfZEXXEVMq2fc1nE=;
 b=7+ez0f6CvZ+HPYNBf0PcmPfunHBxs3MmD/8ot2VFYE5BxxuyCravkvmSA6B3+/rMme
 EwHRb2YFkSxJnvMtEWfRuUfxDmumfKGfxUFpBAOiufoPpgLJo+fHJ4kipPIcwe6/NrKT
 w2G0Bem5/LQB5QwYjGJCpA1J89YkCJevmvg2tXPU0BaGZcBlW7IW1+oELlLPly3ospJo
 EhmipH6e0dXEMK0zSxOQfuJCZZGIIzsJKG1XkmrvhK6NrxcK5Na4Ta7kqXMyX1NAilFK
 yGv53UUINX5d9RU1uWazPhrXhPqYE9VgwD4ODprDurE9bWO9pU/4Ttc9TvFzeTMp/2ce
 NovQ==
X-Gm-Message-State: ACrzQf2QH/SwdtLwdYoz1QGiGCYTSZLyYHMQXcpAOyrKP4U+aSOysdNz
 2fDGplHpYQP07sNsB4euGfE=
X-Google-Smtp-Source: AMsMyM5XZEcTzipjvNCPeZLjA+G0dWoNeLLNjY91MsM3cfvxahrH2M9ghnXEdTaBdeBhYgVRR0rRWQ==
X-Received: by 2002:a17:907:2d0b:b0:77c:68a8:a47 with SMTP id
 gs11-20020a1709072d0b00b0077c68a80a47mr16789733ejc.473.1663675174834; 
 Tue, 20 Sep 2022 04:59:34 -0700 (PDT)
Received: from eldamar.lan (c-82-192-242-114.customer.ggaweb.ch.
 [82.192.242.114]) by smtp.gmail.com with ESMTPSA id
 17-20020a170906211100b0073ddb2eff27sm714916ejt.167.2022.09.20.04.59.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Sep 2022 04:59:34 -0700 (PDT)
Received: by eldamar.lan (Postfix, from userid 1000)
 id 1E80DBE356D; Tue, 20 Sep 2022 13:59:33 +0200 (CEST)
Date: Tue, 20 Sep 2022 13:59:33 +0200
From: Salvatore Bonaccorso <carnil@debian.org>
To: Karol Herbst <kherbst@redhat.com>
Message-ID: <YymrJSfXe4LaXmkA@eldamar.lan>
References: <20220819200928.401416-1-kherbst@redhat.com>
 <YymY+3+C2aI7T3GU@eldamar.lan>
 <CACO55ts7rpbyYv3ovWt1iCfkGsChCUVitmHqtzAwFpfbPEZGYQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CACO55ts7rpbyYv3ovWt1iCfkGsChCUVitmHqtzAwFpfbPEZGYQ@mail.gmail.com>
Subject: Re: [Nouveau] [PATCH] nouveau: explicitly wait on the fence in
 nouveau_bo_move_m2mf
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Ben Skeggs <bskeggs@redhat.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi,

On Tue, Sep 20, 2022 at 01:36:32PM +0200, Karol Herbst wrote:
> On Tue, Sep 20, 2022 at 12:42 PM Salvatore Bonaccorso <carnil@debian.org> wrote:
> >
> > Hi,
> >
> > On Fri, Aug 19, 2022 at 10:09:28PM +0200, Karol Herbst wrote:
> > > It is a bit unlcear to us why that's helping, but it does and unbreaks
> > > suspend/resume on a lot of GPUs without any known drawbacks.
> > >
> > > Cc: stable@vger.kernel.org # v5.15+
> > > Closes: https://gitlab.freedesktop.org/drm/nouveau/-/issues/156
> > > Signed-off-by: Karol Herbst <kherbst@redhat.com>
> > > ---
> > >  drivers/gpu/drm/nouveau/nouveau_bo.c | 9 +++++++++
> > >  1 file changed, 9 insertions(+)
> > >
> > > diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > index 35bb0bb3fe61..126b3c6e12f9 100644
> > > --- a/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > +++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
> > > @@ -822,6 +822,15 @@ nouveau_bo_move_m2mf(struct ttm_buffer_object *bo, int evict,
> > >               if (ret == 0) {
> > >                       ret = nouveau_fence_new(chan, false, &fence);
> > >                       if (ret == 0) {
> > > +                             /* TODO: figure out a better solution here
> > > +                              *
> > > +                              * wait on the fence here explicitly as going through
> > > +                              * ttm_bo_move_accel_cleanup somehow doesn't seem to do it.
> > > +                              *
> > > +                              * Without this the operation can timeout and we'll fallback to a
> > > +                              * software copy, which might take several minutes to finish.
> > > +                              */
> > > +                             nouveau_fence_wait(fence, false, false);
> > >                               ret = ttm_bo_move_accel_cleanup(bo,
> > >                                                               &fence->base,
> > >                                                               evict, false,
> > > --
> > > 2.37.1
> > >
> > >
> >
> > While this is marked for 5.15+ only, a user in Debian was seeing the
> > suspend issue as well on 5.10.y and did confirm the commit fixes the
> > issue as well in the 5.10.y series:
> >
> > https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=989705#69
> >
> > Karol, Lyude, should that as well be picked for 5.10.y?
> >
> 
> mhh from the original report 5.10 was fine, but maybe something got
> backported and it broke it? I'll try to do some testing on my machine
> and see what I can figure out, but it could also be a debian only
> issue at this point.

Right, this is a possiblity, thanks for looking into it!

Computer Enthusiastic, can you verify the problem as well in a
non-Debian patched upstream kernel directly from the 5.10.y series
(latest 5.10.144) and verify the fix there?

Regards,
Salvatore
