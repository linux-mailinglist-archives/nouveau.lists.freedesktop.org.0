Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CC5C9626306
	for <lists+nouveau@lfdr.de>; Fri, 11 Nov 2022 21:38:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B2710E8C0;
	Fri, 11 Nov 2022 20:38:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5559210E8BF
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 20:38:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1668199121;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=iOc02DiC+CaIVCkcAVw6EXV28570qCIpUk2+es1FDOA=;
 b=drQID7XaTAX3aswo40tSMFD1LWAu1r91cQUZoIIhFywYUSVtveQXrASiTKsBauMz+xm550
 xXVfFN/oCJ2e7nlMrOuHpjHORtlbD7PJ/geZabtr4Tpr7TXTGLQR4WIXA0JwSBzQmaxl+0
 OqiJhUorUdsJnWfJCbZM2PxBzw+d2Pg=
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_128_GCM_SHA256) id
 us-mta-456--N3eYgLKMaaAi66vu17aDQ-1; Fri, 11 Nov 2022 15:38:40 -0500
X-MC-Unique: -N3eYgLKMaaAi66vu17aDQ-1
Received: by mail-qt1-f197.google.com with SMTP id
 cd6-20020a05622a418600b003a54cb17ad9so4344502qtb.0
 for <nouveau@lists.freedesktop.org>; Fri, 11 Nov 2022 12:38:40 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iOc02DiC+CaIVCkcAVw6EXV28570qCIpUk2+es1FDOA=;
 b=7iYFRjLDPMZQSpqVRBknEK5DGVx3hEQI63snuUFOuHwuPwX5aUFOfWXAq0t3yb/QMD
 d/fhVVhUZ3LdbEM8C8QC/+jSfmwOyPxua3EnBoJsJ9muZcI+ZPC9lYHxqtRyjuQNTWwU
 uPqKAx48lxHMJLMgb6cf7sgjZvQLXdZjBukwlihyoxvYGlhVLd+qx7cfjx/tp6Cg7faR
 Krch9Q4rTfyNbCb5AHLFa4yianjv9Srk4Cz9MsofpS1c/hCj83+rGDM5D/lY5oXh81xL
 KlW5DU2nB3QI0+U7PObDRNWVWkLID1sjn2/cvqNakp6BSNrFoiImA1k4KK+Kp7wIAL07
 i+3g==
X-Gm-Message-State: ANoB5pkajCzQGANHQw6wlfZz1ftPSpQDlSQG+9J0X9FmwlvHgd4RRKSS
 le32K86tdZTJooawAFOtL7nECe1nIuqpD9pR4k5nRVZGUa39eBbCdW5OQpwBpkgkaUl8TkbKppu
 VAEG7xXNRI2ZZWzwb7J8RmEjx18HeqzwsheHQQ/m1sA==
X-Received: by 2002:ac8:140e:0:b0:398:5f25:649 with SMTP id
 k14-20020ac8140e000000b003985f250649mr3006116qtj.673.1668199120415; 
 Fri, 11 Nov 2022 12:38:40 -0800 (PST)
X-Google-Smtp-Source: AA0mqf5LOmUpWj0zC/+L7Y7H4Tvue8JzxcncnqkZQZYbqztBBpUxGN2/AlKbzfkTgtWEPvFTFIdqi6rdOfPhtKrf+k8=
X-Received: by 2002:ac8:140e:0:b0:398:5f25:649 with SMTP id
 k14-20020ac8140e000000b003985f250649mr3006098qtj.673.1668199120192; Fri, 11
 Nov 2022 12:38:40 -0800 (PST)
MIME-Version: 1.0
References: <202211100850.7A8DD75@keescook> <87iljl6ehe.fsf@intel.com>
 <202211111110.11B554B@keescook>
 <CACO55tt5KOgDYMEw=spDeoMaYuj2GQOuHU+BEgadr1nQiFOGhw@mail.gmail.com>
 <202211111215.1F421B7E@keescook>
In-Reply-To: <202211111215.1F421B7E@keescook>
From: Karol Herbst <kherbst@redhat.com>
Date: Fri, 11 Nov 2022 21:38:28 +0100
Message-ID: <CACO55tvaXFyAMiAYmx2DKNj9fNtapThejHkRsvZd_5StYXTy+w@mail.gmail.com>
To: Kees Cook <keescook@chromium.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Nouveau] Coverity: nouveau_dp_irq(): Null pointer dereferences
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
Cc: "Nathan E. Egge" <unlord@xiph.org>,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>,
 Jani Nikula <jani.nikula@intel.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-next@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Dave Airlie <airlied@redhat.com>,
 linux-hardening@vger.kernel.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 11, 2022 at 9:16 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Nov 11, 2022 at 09:06:54PM +0100, Karol Herbst wrote:
> > On Fri, Nov 11, 2022 at 8:21 PM Kees Cook <keescook@chromium.org> wrote:
> > >
> > > On Fri, Nov 11, 2022 at 11:13:17AM +0200, Jani Nikula wrote:
> > > > On Thu, 10 Nov 2022, coverity-bot <keescook@chromium.org> wrote:
> > > > > Hello!
> > > > >
> > > > > This is an experimental semi-automated report about issues detected by
> > > > > Coverity from a scan of next-20221110 as part of the linux-next scan project:
> > > > > https://scan.coverity.com/projects/linux-next-weekly-scan
> > > > >
> > > > > You're getting this email because you were associated with the identified
> > > > > lines of code (noted below) that were touched by commits:
> > > > >
> > > > >   Mon Aug 31 19:10:08 2020 -0400
> > > > >     a0922278f83e ("drm/nouveau/kms/nv50-: Refactor and cleanup DP HPD handling")
> > > >
> > > > Hi Kees, this looks like a good idea, but maybe double check the Cc list
> > > > generation? I was Cc'd on four mails today that I thought were
> > > > irrelevant to me.
> > >
> > > Hi!
> > >
> > > Heh, I was recently asked to _expand_ the CC list. :)
> > >
> > > For these last pass of reports, I added a get_maintainers.pl run to the
> > > identified commit. In this instance, the commit touched:
> > >
> > >  drivers/gpu/drm/nouveau/dispnv04/disp.c     |    6 +
> > >  drivers/gpu/drm/nouveau/dispnv50/disp.c     |  192 ++++++++++++++++++++++--------------------------
> > >  drivers/gpu/drm/nouveau/nouveau_connector.c |   14 ---
> > >  drivers/gpu/drm/nouveau/nouveau_display.c   |    2
> > >  drivers/gpu/drm/nouveau/nouveau_display.h   |    2
> > >  drivers/gpu/drm/nouveau/nouveau_dp.c        |  132 ++++++++++++++++++++++++++++-----
> > >  drivers/gpu/drm/nouveau/nouveau_encoder.h   |   33 +++++++-
> > >  7 files changed, 244 insertions(+), 137 deletions(-)
> > >
> > > And the get_maintainers.pl rationale was:
> > >
> > > Ben Skeggs <bskeggs@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:1/1=100%,commit_signer:6/16=38%,authored:4/16=25%,added_lines:23/124=19%,removed_lines:36/152=24%)
> > > Karol Herbst <kherbst@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:2/1=100%)
> > > Lyude Paul <lyude@redhat.com> (supporter:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS,commit_signer:9/16=56%,authored:6/16=38%,added_lines:92/124=74%,removed_lines:107/152=70%)
> > > David Airlie <airlied@gmail.com> (maintainer:DRM DRIVERS)
> > > Daniel Vetter <daniel@ffwll.ch> (maintainer:DRM DRIVERS)
> > > Ilia Mirkin <imirkin@alum.mit.edu> (commit_signer:1/1=100%,authored:1/1=100%,added_lines:2/2=100%,removed_lines:2/2=100%)
> > > "Nathan E. Egge" <unlord@xiph.org> (commit_signer:1/1=100%)
> > > Jani Nikula <jani.nikula@intel.com> (commit_signer:6/16=38%)
> > > Dave Airlie <airlied@redhat.com> (commit_signer:5/16=31%)
> > > Thomas Zimmermann <tzimmermann@suse.de> (commit_signer:4/16=25%,authored:4/16=25%)
> > > dri-devel@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
> > > nouveau@lists.freedesktop.org (open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS)
> > >
> >
> > I'd say it's good enough to message supporters and the mailing lists
> > for at least Nouveau code, maybe even all drm drivers.
>
> i.e. leave out the commit_signer hits?
>

yes.

> > Not sure what to do about actual maintainers, but I doubt Dave and
> > Daniel want to be CCed on every Coverity report here either.
>
> I updated the CC logic based on this feedback:
> https://lore.kernel.org/linux-hardening/87h6zgfub4.fsf@kernel.org/
>
> So maybe just mailing lists?
>

That should be good enough, but maybe the DRM subsystem is big enough
so it's reasonable to add special rules. For Nouveau either way is
fine.

> --
> Kees Cook
>

