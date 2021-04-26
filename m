Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A7AD836BBA3
	for <lists+nouveau@lfdr.de>; Tue, 27 Apr 2021 00:23:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F436E8A0;
	Mon, 26 Apr 2021 22:23:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-qv1-xf2d.google.com (mail-qv1-xf2d.google.com
 [IPv6:2607:f8b0:4864:20::f2d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F7996E852
 for <nouveau@lists.freedesktop.org>; Mon, 26 Apr 2021 16:46:28 +0000 (UTC)
Received: by mail-qv1-xf2d.google.com with SMTP id gv2so18242444qvb.8
 for <nouveau@lists.freedesktop.org>; Mon, 26 Apr 2021 09:46:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=KlgosoMJOAaR/ET01AhknsNf3mj6gtcliiDg0dLL1e0=;
 b=FfxC6YTfTyKRjULzScvZeh080rowzObsgfkNkB6PbFU85WK18TorFZb3nTplFpotQN
 FCzKzeHFiWHC6SAAz0H1ZvobWir4E6RenbNbEqtrFbyTUyimRczwWol0BDixJHUTha+x
 eXWW6lC9g26ZhTBX/V5pk140gf+3zGj/JaWxQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=KlgosoMJOAaR/ET01AhknsNf3mj6gtcliiDg0dLL1e0=;
 b=kriSkIUhuN//iL2UN5BWfpDehrDaZ2VEE/2YHp2CiQzKbY/oLMPKsI0qJGhdop8Fvx
 sbVXShnf+WGN0pVnFe4igj59uuTVp+SqJaxphGtMu/2+I3FsaBHYKR2j6qTJLft0UxTO
 VaJpU3yrZolGm7Z0incj6iEF+Wz3HTxmk4EBRmHgfttU6lw1LdprYaVAKD+phIeOD8k+
 lew1RnNdz92LrJEN/M8Rwl4lHMGEcwvwDWvYDExO+SF6D+2Vm1FO6JYsC+S90oZ4BEXk
 QOZa9oO11fPcMvZbwJ27HgmpwdCwefKmW1Tj/iLUum9eM89MPz3URHOnHbHcmohCSo7a
 SJzg==
X-Gm-Message-State: AOAM531AwRKdxZyEuTJf2mux/2fJqthkKcniV7r0XAJgj4+HmKC62mV2
 OnzOMYqyz+6X2x5D5765XuEpTTKv94bhTA==
X-Google-Smtp-Source: ABdhPJxePJeMHsUmhMzmyC6ALoANhfU4wViaRKCx/d9seVt85TBvS2HbJdo0LvPhZGXXvuaXKX7+2g==
X-Received: by 2002:ad4:5f8a:: with SMTP id jp10mr19029320qvb.56.1619455587043; 
 Mon, 26 Apr 2021 09:46:27 -0700 (PDT)
Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com.
 [209.85.160.180])
 by smtp.gmail.com with ESMTPSA id t63sm537748qkh.6.2021.04.26.09.46.26
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Apr 2021 09:46:26 -0700 (PDT)
Received: by mail-qt1-f180.google.com with SMTP id g1so374868qtq.6
 for <nouveau@lists.freedesktop.org>; Mon, 26 Apr 2021 09:46:26 -0700 (PDT)
X-Received: by 2002:a05:6638:68b:: with SMTP id
 i11mr17242768jab.90.1619455099476; 
 Mon, 26 Apr 2021 09:38:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org>
 <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
In-Reply-To: <03c5bc8a-3965-bf1d-01a4-97d074dfbe2b@arm.com>
From: Claire Chang <tientzu@chromium.org>
Date: Tue, 27 Apr 2021 00:38:08 +0800
X-Gmail-Original-Message-ID: <CALiNf28ExE8OLsuDaN9nC=eAi-iG0rct_TJCCxAcWW4+_pdj2g@mail.gmail.com>
Message-ID: <CALiNf28ExE8OLsuDaN9nC=eAi-iG0rct_TJCCxAcWW4+_pdj2g@mail.gmail.com>
To: Robin Murphy <robin.murphy@arm.com>
X-Mailman-Approved-At: Mon, 26 Apr 2021 22:23:06 +0000
Subject: Re: [Nouveau] [PATCH v5 16/16] of: Add plumbing for restricted DMA
 pool
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
Cc: heikki.krogerus@linux.intel.com, thomas.hellstrom@linux.intel.com,
 peterz@infradead.org, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 lkml <linux-kernel@vger.kernel.org>, grant.likely@arm.com, paulus@samba.org,
 Will Deacon <will@kernel.org>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Christoph Hellwig <hch@lst.de>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 Bjorn Helgaas <bhelgaas@google.com>, boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 chris@chris-wilson.co.uk, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 Frank Rowand <frowand.list@gmail.com>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Apr 23, 2021 at 9:35 PM Robin Murphy <robin.murphy@arm.com> wrote:
>
> On 2021-04-22 09:15, Claire Chang wrote:
> > If a device is not behind an IOMMU, we look up the device node and set
> > up the restricted DMA when the restricted-dma-pool is presented.
> >
> > Signed-off-by: Claire Chang <tientzu@chromium.org>
> > ---
> >   drivers/of/address.c    | 25 +++++++++++++++++++++++++
> >   drivers/of/device.c     |  3 +++
> >   drivers/of/of_private.h |  5 +++++
> >   3 files changed, 33 insertions(+)
> >
> > diff --git a/drivers/of/address.c b/drivers/of/address.c
> > index 54f221dde267..fff3adfe4986 100644
> > --- a/drivers/of/address.c
> > +++ b/drivers/of/address.c
> > @@ -8,6 +8,7 @@
> >   #include <linux/logic_pio.h>
> >   #include <linux/module.h>
> >   #include <linux/of_address.h>
> > +#include <linux/of_reserved_mem.h>
> >   #include <linux/pci.h>
> >   #include <linux/pci_regs.h>
> >   #include <linux/sizes.h>
> > @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
> >   }
> >   EXPORT_SYMBOL_GPL(of_dma_is_coherent);
> >
> > +int of_dma_set_restricted_buffer(struct device *dev)
> > +{
> > +     struct device_node *node;
> > +     int count, i;
> > +
> > +     if (!dev->of_node)
> > +             return 0;
> > +
> > +     count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> > +                                             sizeof(phandle));
> > +     for (i = 0; i < count; i++) {
> > +             node = of_parse_phandle(dev->of_node, "memory-region", i);
> > +             /* There might be multiple memory regions, but only one
> > +              * restriced-dma-pool region is allowed.
> > +              */
>
> What's the use-case for having multiple regions if the restricted pool
> is by definition the only one accessible?

There might be a device coherent pool (shared-dma-pool) and
dma_alloc_attrs might allocate memory from that pool [1].
I'm not sure if it makes sense to have another device coherent pool
while using restricted DMA pool though.

[1] https://elixir.bootlin.com/linux/v5.12/source/kernel/dma/mapping.c#L435


>
> Robin.
>
> > +             if (of_device_is_compatible(node, "restricted-dma-pool") &&
> > +                 of_device_is_available(node))
> > +                     return of_reserved_mem_device_init_by_idx(
> > +                             dev, dev->of_node, i);
> > +     }
> > +
> > +     return 0;
> > +}
> > +
> >   /**
> >    * of_mmio_is_nonposted - Check if device uses non-posted MMIO
> >    * @np:     device node
> > diff --git a/drivers/of/device.c b/drivers/of/device.c
> > index c5a9473a5fb1..d8d865223e51 100644
> > --- a/drivers/of/device.c
> > +++ b/drivers/of/device.c
> > @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
> >
> >       arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
> >
> > +     if (!iommu)
> > +             return of_dma_set_restricted_buffer(dev);
> > +
> >       return 0;
> >   }
> >   EXPORT_SYMBOL_GPL(of_dma_configure_id);
> > diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> > index d717efbd637d..e9237f5eff48 100644
> > --- a/drivers/of/of_private.h
> > +++ b/drivers/of/of_private.h
> > @@ -163,12 +163,17 @@ struct bus_dma_region;
> >   #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
> >   int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map);
> > +int of_dma_set_restricted_buffer(struct device *dev);
> >   #else
> >   static inline int of_dma_get_range(struct device_node *np,
> >               const struct bus_dma_region **map)
> >   {
> >       return -ENODEV;
> >   }
> > +static inline int of_dma_get_restricted_buffer(struct device *dev)
> > +{
> > +     return -ENODEV;
> > +}
> >   #endif
> >
> >   #endif /* _LINUX_OF_PRIVATE_H */
> >
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
