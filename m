Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 954F52AA2DC
	for <lists+nouveau@lfdr.de>; Sat,  7 Nov 2020 07:36:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA6CB6E101;
	Sat,  7 Nov 2020 06:36:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wm1-x342.google.com (mail-wm1-x342.google.com
 [IPv6:2a00:1450:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE8476EA54
 for <nouveau@lists.freedesktop.org>; Thu,  5 Nov 2020 12:54:36 +0000 (UTC)
Received: by mail-wm1-x342.google.com with SMTP id h22so1514860wmb.0
 for <nouveau@lists.freedesktop.org>; Thu, 05 Nov 2020 04:54:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ffwll.ch; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=iR+CVMR9Igk+i7q6zQ360QpQoQUWwq9hKMxFO8Y7cGA=;
 b=bPPrnh4BjIGHxssI9in0eI8avIf6lVSA1Fd+jmaHNuJRYj4GLesWwatvAf+cWdJ1Gn
 +T1a9zT5WiAc7uq+YkZ1UAi9uQqINJcLFkN5pbawGR6HDSkkCEunVz0GKT5BPbCo522L
 G94YF8sd+EF3xMH5d9NYF5qFQjmBr4VXc5pXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=iR+CVMR9Igk+i7q6zQ360QpQoQUWwq9hKMxFO8Y7cGA=;
 b=fi24T9t1nMLmWXrwARCLMrCfqOSB3Nwewmb6yjJd1cPnEvU0A8udDieZ0jgn4BA9QO
 /6nlqsQWxOmzPJKr4UyxXoxscjiY3J0fIVEglbU577L1zkEphqgUJfWrkvPa1NDIR9rq
 hmmsxBtXJ4SyUzr5uNAbAmyw02Cbmv9HjW6f40NquYkYKOmBV5PPTibQkI7lZbIdznip
 sxVxDlR0Jg06er/kMpNKroTuehJ0ZOOgcA66vYywni/RWrgm7FZG6ogjFwygSGP9biek
 6DPbtDEx7qbVfWM1bAU252SZc06Tl/Fd5yp5hyOBYJjnXqpQFJmtu4lhnzlhpV0VD+fV
 HZlA==
X-Gm-Message-State: AOAM531giszOrgvPwGnB7fK3/mv6w9CJwPaP4D9hmbF6zAzpa76OX6pe
 I6lisw02HYis5NgW8Y3bjdHcSg==
X-Google-Smtp-Source: ABdhPJwrW3OjL7kR/bAr74WjxI8azvpsj46DeaIlccjHcQq2wan765xbIbWOOKK6+3jptMrcJuyztQ==
X-Received: by 2002:a1c:6843:: with SMTP id d64mr2670603wmc.131.1604580875284; 
 Thu, 05 Nov 2020 04:54:35 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:efd0:b9e5:5ae6:c2fa])
 by smtp.gmail.com with ESMTPSA id m12sm2468188wrs.92.2020.11.05.04.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Nov 2020 04:54:34 -0800 (PST)
Date: Thu, 5 Nov 2020 13:54:31 +0100
From: Daniel Vetter <daniel@ffwll.ch>
To: Thomas Zimmermann <tzimmermann@suse.de>
Message-ID: <20201105125431.GW401619@phenom.ffwll.local>
References: <20201020122046.31167-1-tzimmermann@suse.de>
 <20201020122046.31167-10-tzimmermann@suse.de>
 <CACRpkdbvGWKo8y323actUJn9xXmxpgDw1EKLiPH4RqB_kFx=XQ@mail.gmail.com>
 <27acbd7e-d72e-4e05-c147-b50f56e21589@suse.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <27acbd7e-d72e-4e05-c147-b50f56e21589@suse.de>
X-Operating-System: Linux phenom 5.7.0-1-amd64 
X-Mailman-Approved-At: Sat, 07 Nov 2020 06:36:02 +0000
Subject: Re: [Nouveau] [PATCH v5 09/10] dma-buf-map: Add memcpy and
 pointer-increment interfaces
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
Cc: luben.tuikov@amd.com, Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>,
 Dave Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 Linus Walleij <linus.walleij@linaro.org>,
 "open list:DRM PANEL DRIVERS" <dri-devel@lists.freedesktop.org>,
 Chris Wilson <chris@chris-wilson.co.uk>, melissa.srw@gmail.com,
 Eric Anholt <eric@anholt.net>, ray.huang@amd.com,
 Gerd Hoffmann <kraxel@redhat.com>, Sam Ravnborg <sam@ravnborg.org>,
 Sumit Semwal <sumit.semwal@linaro.org>,
 Emil Velikov <emil.velikov@collabora.com>, Rob Herring <robh@kernel.org>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, lima@lists.freedesktop.org,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 Krzysztof Kozlowski <krzk@kernel.org>, steven.price@arm.com,
 "open list:ARM/Rockchip SoC..." <linux-rockchip@lists.infradead.org>,
 Kukjin Kim <kgene@kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux+etnaviv@armlinux.org.uk, spice-devel@lists.freedesktop.org,
 alyssa.rosenzweig@collabora.com,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 etnaviv@lists.freedesktop.org, Maxime Ripard <mripard@kernel.org>,
 Inki Dae <inki.dae@samsung.com>, Hans de Goede <hdegoede@redhat.com>,
 Christian Gmeiner <christian.gmeiner@gmail.com>,
 xen-devel@lists.xenproject.org, virtualization@lists.linux-foundation.org,
 Sean Paul <sean@poorly.run>, apaneers@amd.com,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linaro-mm-sig@lists.linaro.org, amd-gfx@lists.freedesktop.org,
 Tomeu Vizoso <tomeu.vizoso@collabora.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Sandy Huang <hjc@rock-chips.com>,
 Kyungmin Park <kyungmin.park@samsung.com>,
 Qinglang Miao <miaoqinglang@huawei.com>, yuq825@gmail.com,
 Daniel Vetter <daniel@ffwll.ch>, Alex Deucher <alexander.deucher@amd.com>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Lucas Stach <l.stach@pengutronix.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Nov 05, 2020 at 11:37:08AM +0100, Thomas Zimmermann wrote:
> Hi
> 
> Am 05.11.20 um 11:07 schrieb Linus Walleij:
> > Overall I like this, just an inline question:
> > 
> > On Tue, Oct 20, 2020 at 2:20 PM Thomas Zimmermann <tzimmermann@suse.de> wrote:
> > 
> >> To do framebuffer updates, one needs memcpy from system memory and a
> >> pointer-increment function. Add both interfaces with documentation.
> > 
> > (...)
> >> +/**
> >> + * dma_buf_map_memcpy_to - Memcpy into dma-buf mapping
> >> + * @dst:       The dma-buf mapping structure
> >> + * @src:       The source buffer
> >> + * @len:       The number of byte in src
> >> + *
> >> + * Copies data into a dma-buf mapping. The source buffer is in system
> >> + * memory. Depending on the buffer's location, the helper picks the correct
> >> + * method of accessing the memory.
> >> + */
> >> +static inline void dma_buf_map_memcpy_to(struct dma_buf_map *dst, const void *src, size_t len)
> >> +{
> >> +       if (dst->is_iomem)
> >> +               memcpy_toio(dst->vaddr_iomem, src, len);
> >> +       else
> >> +               memcpy(dst->vaddr, src, len);
> >> +}
> > 
> > Are these going to be really big memcpy() operations?
> 
> Individually, each could be a scanline, so a few KiB. (4 bytes *
> horizontal resolution). Updating a full framebuffer can sum up to
> several MiB.
> 
> > 
> > Some platforms have DMA offload engines that can perform memcpy(),They could be
> > drivers/dma, include/linux/dmaengine.h
> > especially if the CPU doesn't really need to touch the contents
> > and flush caches etc.
> > An example exist in some MTD drivers that move large quantities of
> > data off flash memory like this:
> > drivers/mtd/nand/raw/cadence-nand-controller.c
> > 
> > Notice that DMAengine and DMAbuf does not have much in common,
> > the names can be deceiving.
> > 
> > The value of this varies with the system architecture. It is not just
> > a question about performance but also about power and the CPU
> > being able to do other stuff in parallel for large transfers. So *when*
> > to use this facility to accelerate memcpy() is a delicate question.
> > 
> > What I'm after here is if these can be really big, do we want
> > (in the long run, not now) open up to the idea to slot in
> > hardware-accelerated memcpy() here?
> 
> We currently use this functionality for the graphical framebuffer
> console that most DRM drivers provide. It's non-accelerated and slow,
> but this has not been much of a problem so far.
> 
> Within DRM, we're more interested in removing console code from drivers
> and going for the generic implementation.
> 
> Most of the graphics HW allocates framebuffers from video RAM, system
> memory or CMA pools and does not really need these memcpys. Only a few
> systems with small video RAM require a shadow buffer, which we flush
> into VRAM as needed. Those might benefit.
> 
> OTOH, off-loading memcpys to hardware sounds reasonable if we can hide
> it from the DRM code. I think it all depends on how invasive that change
> would be.

I wouldn't, all the additional locks this would pull in sound like
nightmare. And when an oops happens, this might be the only thing that
manages to get the oops to the user.

Unless someone really starts caring about fbcon acceleration I really
wouldn't bother. Ok maybe it also matters for fbdev, but the problem is
that the page fault intercepting alone is already expensive, so the only
real solution if you care about performance in that case is to use kms
natively, and use a dirty rectangle flip (or the DIRTY syscall).

And in there drivers should (and do) use any dma engines they have to
upload the frames already.
-Daniel
-- 
Daniel Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
