Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D23B2624C7
	for <lists+nouveau@lfdr.de>; Wed,  9 Sep 2020 04:05:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 29F4D6E8F7;
	Wed,  9 Sep 2020 02:05:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A5496E5C1
 for <nouveau@lists.freedesktop.org>; Tue,  8 Sep 2020 08:55:49 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id e17so16471399wme.0
 for <nouveau@lists.freedesktop.org>; Tue, 08 Sep 2020 01:55:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:mail-followup-to:references
 :mime-version:content-disposition:in-reply-to;
 bh=lPf7+5yaWPR4Bsu29CBYqFns/59BDsvYdpze1XOObUQ=;
 b=PGlAHISsJbb/iYgixfJKVAK0d3OOuP3SlP2TjTpoK/oyd/DkyWjQ7j9CtU74WPEw0A
 NkxDuWQKM4W+M6eiE0fRmROTwl4OHi/jQ6z3R8Ikhb+ljBKxuSnOMNBFuSVwV7AkQa34
 kBB3vAMyk0pYZpn9c7JUOZ/xI0bfjYSUvtffY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to;
 bh=lPf7+5yaWPR4Bsu29CBYqFns/59BDsvYdpze1XOObUQ=;
 b=fzIipflZFAizynvzQ5NlnesNvwedDDNRrYODnSz5syGRn91ZWecNeI9qcK3PIygScu
 kmL8uP1An4skKuC8YXT7d/gh7x8zzM3xsOa/WkMENoTqteBZ+YfZQKjd2p7m6OM4d5RT
 HIbEHaTYO3Rksj+dSQ2ufGHBAe//AVBmRxuSJjWc0Z0tzX1bSUjvdLXmGh/uJf+AXvWb
 DIge6qFwZcx/qk8cXghawHhGjeQG5xYEbt0CRiUcJ6eN9m3Sfvl83BkAv6qRg8ERGYT3
 7q/K3Er+IRUz6cPzEcEuqYcQWioRDKbuXW+17z88el4tVjFJ/bgBqO8ZhhScjbEvIjsP
 I4Tg==
X-Gm-Message-State: AOAM532jJrw9FPlUcgmE6LHOJT5NpRiy1U9X7ufixK2/KGnSuS/ShyG3
 aa731jTbjp2VqErx2QNZnytPJg==
X-Google-Smtp-Source: ABdhPJzRIgnrsr1zISzj3JMMO+qHmnUUaLRMb8phFavthqU3M8id+c7krZN538k/E4IFJZLkveZLYQ==
X-Received: by 2002:a1c:e256:: with SMTP id z83mr3369682wmg.33.1599555347784; 
 Tue, 08 Sep 2020 01:55:47 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id l10sm30834268wru.59.2020.09.08.01.55.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Sep 2020 01:55:47 -0700 (PDT)
Date: Tue, 8 Sep 2020 10:55:44 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Gerd Hoffmann <kraxel@redhat.com>
Message-ID: <20200908085544.GI2352366@phenom.ffwll.local>
Mail-Followup-To: Gerd Hoffmann <kraxel@redhat.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Lucas Stach <l.stach@pengutronix.de>,
 Russell King <linux+etnaviv@armlinux.org.uk>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Ben Skeggs <bskeggs@redhat.com>, Sandy Huang <hjc@rock-chips.com>,
 Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Thierry Reding <thierry.reding@gmail.com>,
 Jonathan Hunter <jonathanh@nvidia.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 open list <linux-kernel@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, 
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, 
 "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>, 
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>
References: <20200907112425.15610-1-kraxel@redhat.com>
 <20200907112425.15610-2-kraxel@redhat.com>
 <CAKMK7uGjT73rh=9iuCKAXvC_CaOuygm8PgOQgofkTgH7wRysFw@mail.gmail.com>
 <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200908054858.um34wojjv6uhi7d3@sirius.home.kraxel.org>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Wed, 09 Sep 2020 02:05:38 +0000
Subject: Re: [Nouveau] [PATCH v4 1/1] drm: allow limiting the scatter list
 size.
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
Cc: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <nouveau@lists.freedesktop.org>, dri-devel <dri-devel@lists.freedesktop.org>,
 Sandy Huang <hjc@rock-chips.com>, Thierry Reding <thierry.reding@gmail.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "open list:RADEON and AMDGPU DRM DRIVERS" <amd-gfx@lists.freedesktop.org>,
 "open list:ARM/Rockchip SoC support" <linux-rockchip@lists.infradead.org>,
 Ben Skeggs <bskeggs@redhat.com>, Russell King <linux+etnaviv@armlinux.org.uk>,
 "moderated list:DRM DRIVERS FOR XEN" <xen-devel@lists.xenproject.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 "moderated list:DRM DRIVERS FOR VIVANTE GPU IP"
 <etnaviv@lists.freedesktop.org>, Maxime Ripard <mripard@kernel.org>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 "open list:DRM DRIVERS FOR NVIDIA TEGRA" <linux-tegra@vger.kernel.org>,
 Sean Paul <sean@poorly.run>, "moderated list:ARM/Rockchip SoC support"
 <linux-arm-kernel@lists.infradead.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <freedreno@lists.freedesktop.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 08, 2020 at 07:48:58AM +0200, Gerd Hoffmann wrote:
> On Mon, Sep 07, 2020 at 03:53:02PM +0200, Daniel Vetter wrote:
> > On Mon, Sep 7, 2020 at 1:24 PM Gerd Hoffmann <kraxel@redhat.com> wrote:
> > >
> > > Add drm_device argument to drm_prime_pages_to_sg(), so we can
> > > call dma_max_mapping_size() to figure the segment size limit
> > > and call into __sg_alloc_table_from_pages() with the correct
> > > limit.
> > >
> > > This fixes virtio-gpu with sev.  Possibly it'll fix other bugs
> > > too given that drm seems to totaly ignore segment size limits
> > > so far ...
> > >
> > > v2: place max_segment in drm driver not gem object.
> > > v3: move max_segment next to the other gem fields.
> > > v4: just use dma_max_mapping_size().
> > >
> > > Signed-off-by: Gerd Hoffmann <kraxel@redhat.com>
> > 
> > Uh, are you sure this works in all cases for virtio?
> 
> Sure, I've tested it ;)
> 
> > The comments I've found suggest very much not ... Or is that all very
> > old stuff only that no one cares about anymore?
> 
> I think these days it is possible to override dma_ops per device, which
> in turn allows virtio to deal with the quirks without the rest of the
> kernel knowing about these details.
> 
> I also think virtio-gpu can drop the virtio_has_dma_quirk() checks, just
> use the dma api path unconditionally and depend on virtio core having
> setup dma_ops in a way that it JustWorks[tm].  I'll look into that next.

The comment above vring_use_dma_api() suggests that this has not yet
happened, that's why I'm asking. If this has happened then I think it'd be
best if you remove that todo entry and update it, as part of the overall
series to add dma_max_mapping_size and remove the quirks.

Otherwise this all is a bit wtf material :-)
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
