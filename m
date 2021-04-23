Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B80BB369607
	for <lists+nouveau@lfdr.de>; Fri, 23 Apr 2021 17:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 443236EC05;
	Fri, 23 Apr 2021 15:20:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com
 [IPv6:2607:f8b0:4864:20::42d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD9C96E069
 for <nouveau@lists.freedesktop.org>; Fri, 23 Apr 2021 02:53:21 +0000 (UTC)
Received: by mail-pf1-x42d.google.com with SMTP id 10so24233632pfl.1
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 19:53:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
 b=HdsQJQRkixDre+dpQSVR58nl8K7T4MbrI4XmlnSivkYb875qGKmhwngqhS/XX43exh
 bg5Ne9Oub0puKLH8FRaSSn/FCuQxwpgf1ynisAFuTF4Wvjhe+t5iF+WotV6g96hB8Oro
 fWaQA0hAXWZxawu4WTORJsnwcVbFEg+0cCZO8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=40nhsz+kltJTf7tq6pLLkes92lT1dy5Rll207DlKzWM=;
 b=MlrUG6l/FM2a88UxXZOoe7PdPxYwp5AWhI+IK8SICrCdQahXLPjJVVNH+28U5mvw8a
 AOGwEwqjYNUxfC4Mwsg5r24Tw6wx8HaWwFoAXbQ7XNxxI1NHZwMUbGXd05FNXcVWAeop
 q8Dd8UKfRZ2DeueQCgIJZhcHZaugqkCooAPuPDc9RXEcRz69JK8obFMeEFaqQgy3FxD7
 ExS2hB+xXrC2Nds3zF6UtdhghNopwKsTma0ZajWphhaYee2I3uF5S70jfZsMSJl7faO6
 e1w5I/neAEv+lK0tuNgaKLp+7L0YP1pnV7oC0NgfG8+cdPPtv850zNDYATP8IXXihkS8
 VdxA==
X-Gm-Message-State: AOAM531gaElQ1w/g6zIR46bYn95CpwEheK21EfUwgQGv3GoAq4M8weHx
 wYQyWUcNruOKNx03CAANlcbbw7RSmQgEIg==
X-Google-Smtp-Source: ABdhPJwJq7aqLByyg7+kdPTmjwt6OPUMfPyAJh539UKIxi2Zm35FLokuhS+gds0YbWL96XJ64iEwGQ==
X-Received: by 2002:a62:dd53:0:b029:25f:ba3c:9cbe with SMTP id
 w80-20020a62dd530000b029025fba3c9cbemr1927125pff.64.1619146400847; 
 Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com.
 [209.85.215.172])
 by smtp.gmail.com with ESMTPSA id w23sm3338147pgi.63.2021.04.22.19.53.20
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
Received: by mail-pg1-f172.google.com with SMTP id z16so34230965pga.1
 for <nouveau@lists.freedesktop.org>; Thu, 22 Apr 2021 19:53:20 -0700 (PDT)
X-Received: by 2002:a6b:c913:: with SMTP id z19mr1627785iof.50.1619146389385; 
 Thu, 22 Apr 2021 19:53:09 -0700 (PDT)
MIME-Version: 1.0
References: <20210422081508.3942748-1-tientzu@chromium.org>
 <20210422081508.3942748-17-tientzu@chromium.org>
In-Reply-To: <20210422081508.3942748-17-tientzu@chromium.org>
From: Claire Chang <tientzu@chromium.org>
Date: Fri, 23 Apr 2021 10:52:58 +0800
X-Gmail-Original-Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
Message-ID: <CALiNf29NzRTRB-0JbCL7=0qF0SAiER_pJ_-SCtVRA7DHCsSpEg@mail.gmail.com>
To: Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Frank Rowand <frowand.list@gmail.com>,
 Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>, 
 boris.ostrovsky@oracle.com, jgross@suse.com, Christoph Hellwig <hch@lst.de>, 
 Marek Szyprowski <m.szyprowski@samsung.com>
X-Mailman-Approved-At: Fri, 23 Apr 2021 15:20:27 +0000
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
 chris@chris-wilson.co.uk, grant.likely@arm.com, paulus@samba.org,
 mingo@kernel.org, jxgao@google.com, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, xypron.glpk@gmx.de,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 daniel@ffwll.ch, airlied@linux.ie, maarten.lankhorst@linux.intel.com,
 Robin Murphy <robin.murphy@arm.com>, jani.nikula@linux.intel.com,
 Nicolas Boichat <drinkcat@chromium.org>, rodrigo.vivi@intel.com,
 bhelgaas@google.com, Dan Williams <dan.j.williams@intel.com>,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
 nouveau@lists.freedesktop.org, Greg KH <gregkh@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>, lkml <linux-kernel@vger.kernel.org>,
 Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, linuxppc-dev@lists.ozlabs.org,
 bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Apr 22, 2021 at 4:17 PM Claire Chang <tientzu@chromium.org> wrote:
>
> If a device is not behind an IOMMU, we look up the device node and set
> up the restricted DMA when the restricted-dma-pool is presented.
>
> Signed-off-by: Claire Chang <tientzu@chromium.org>
> ---
>  drivers/of/address.c    | 25 +++++++++++++++++++++++++
>  drivers/of/device.c     |  3 +++
>  drivers/of/of_private.h |  5 +++++
>  3 files changed, 33 insertions(+)
>
> diff --git a/drivers/of/address.c b/drivers/of/address.c
> index 54f221dde267..fff3adfe4986 100644
> --- a/drivers/of/address.c
> +++ b/drivers/of/address.c
> @@ -8,6 +8,7 @@
>  #include <linux/logic_pio.h>
>  #include <linux/module.h>
>  #include <linux/of_address.h>
> +#include <linux/of_reserved_mem.h>
>  #include <linux/pci.h>
>  #include <linux/pci_regs.h>
>  #include <linux/sizes.h>
> @@ -1109,6 +1110,30 @@ bool of_dma_is_coherent(struct device_node *np)
>  }
>  EXPORT_SYMBOL_GPL(of_dma_is_coherent);
>
> +int of_dma_set_restricted_buffer(struct device *dev)
> +{
> +       struct device_node *node;
> +       int count, i;
> +
> +       if (!dev->of_node)
> +               return 0;
> +
> +       count = of_property_count_elems_of_size(dev->of_node, "memory-region",
> +                                               sizeof(phandle));
> +       for (i = 0; i < count; i++) {
> +               node = of_parse_phandle(dev->of_node, "memory-region", i);
> +               /* There might be multiple memory regions, but only one
> +                * restriced-dma-pool region is allowed.
> +                */
> +               if (of_device_is_compatible(node, "restricted-dma-pool") &&
> +                   of_device_is_available(node))
> +                       return of_reserved_mem_device_init_by_idx(
> +                               dev, dev->of_node, i);
> +       }
> +
> +       return 0;
> +}
> +
>  /**
>   * of_mmio_is_nonposted - Check if device uses non-posted MMIO
>   * @np:        device node
> diff --git a/drivers/of/device.c b/drivers/of/device.c
> index c5a9473a5fb1..d8d865223e51 100644
> --- a/drivers/of/device.c
> +++ b/drivers/of/device.c
> @@ -165,6 +165,9 @@ int of_dma_configure_id(struct device *dev, struct device_node *np,
>
>         arch_setup_dma_ops(dev, dma_start, size, iommu, coherent);
>
> +       if (!iommu)
> +               return of_dma_set_restricted_buffer(dev);
> +
>         return 0;
>  }
>  EXPORT_SYMBOL_GPL(of_dma_configure_id);
> diff --git a/drivers/of/of_private.h b/drivers/of/of_private.h
> index d717efbd637d..e9237f5eff48 100644
> --- a/drivers/of/of_private.h
> +++ b/drivers/of/of_private.h
> @@ -163,12 +163,17 @@ struct bus_dma_region;
>  #if defined(CONFIG_OF_ADDRESS) && defined(CONFIG_HAS_DMA)
>  int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map);
> +int of_dma_set_restricted_buffer(struct device *dev);
>  #else
>  static inline int of_dma_get_range(struct device_node *np,
>                 const struct bus_dma_region **map)
>  {
>         return -ENODEV;
>  }
> +static inline int of_dma_get_restricted_buffer(struct device *dev)

This one should be of_dma_set_restricted_buffer. Sorry for the typo.

> +{
> +       return -ENODEV;
> +}
>  #endif
>
>  #endif /* _LINUX_OF_PRIVATE_H */
> --
> 2.31.1.368.gbe11c130af-goog
>
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
