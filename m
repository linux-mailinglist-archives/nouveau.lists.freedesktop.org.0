Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE1E037B593
	for <lists+nouveau@lfdr.de>; Wed, 12 May 2021 07:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 200916E040;
	Wed, 12 May 2021 05:46:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-il1-x133.google.com (mail-il1-x133.google.com
 [IPv6:2607:f8b0:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A04B86E7D1
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 16:49:14 +0000 (UTC)
Received: by mail-il1-x133.google.com with SMTP id e2so17755529ilr.1
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 09:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Ll12iwWOH+g7rF+Qcvmc/ZPVWK50RY5A+TnwOnViek8=;
 b=jF9yywweDau5byF0sr7SVkFA9hoYDaWzF8iy+wyA9wHf9oOaCvA+67rLL4jVjSY9gn
 QoY25mdgO7IV1eEXpAEk5s63+vTygeFS39HRXfLrmhNXD74fIDm9qeLodCWWHbiJG3ic
 G2KrYNbeLupAhGANRLweLDvdOuGV9VrSQUJi8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Ll12iwWOH+g7rF+Qcvmc/ZPVWK50RY5A+TnwOnViek8=;
 b=EQo3JMtLLFUOheBc2HvTnZryAwRFiWVRHT8EIWJ6r10GYtyTqcGAKRn/nShL3WBOTW
 0nYhNjS3oHWFe/puX6D5xYY2faRINtrdVaCMn2LnhDjiL7iT3Whgt5oFE9aj9fyeRlIL
 21r0xq0sbCxv4v1k/PaGk+kyoEKasLXw9Xf/xzRhTXlyej54E+b44FLEfWCzrcxoONix
 ciE0KC9Wp7jEHnefmxbKIrGAe30Kobk0ukIctTyIDOR0lx4hVgovF5OGjRLEo9AcCNdx
 JYjV43FA/NB1MTApmLly8PsFmevDCiYb97uZ0e2rHo9lJEZpu8H73LYN6DBhl95Em2X7
 /usQ==
X-Gm-Message-State: AOAM531Fxge6W4ZhEetiwuAyZG3ICgB/YNAcL8k8eBFejX25NwQq1unU
 viXUOncIchmlkCkEC1xUSYQcjdbZ6tBJhA==
X-Google-Smtp-Source: ABdhPJzMaj6cBNcG8bGSGwq2qTdULqOKoTlZyR7XH9AAoTH99a65xpm3iEZa8TS6arLlB7biiVvCQw==
X-Received: by 2002:a92:611:: with SMTP id x17mr26539434ilg.239.1620751753719; 
 Tue, 11 May 2021 09:49:13 -0700 (PDT)
Received: from mail-il1-f181.google.com (mail-il1-f181.google.com.
 [209.85.166.181])
 by smtp.gmail.com with ESMTPSA id h14sm9750778ils.13.2021.05.11.09.49.13
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 11 May 2021 09:49:13 -0700 (PDT)
Received: by mail-il1-f181.google.com with SMTP id e2so17755482ilr.1
 for <nouveau@lists.freedesktop.org>; Tue, 11 May 2021 09:49:13 -0700 (PDT)
X-Received: by 2002:a05:6e02:e82:: with SMTP id
 t2mr17831684ilj.18.1620751359226; 
 Tue, 11 May 2021 09:42:39 -0700 (PDT)
MIME-Version: 1.0
References: <20210510095026.3477496-1-tientzu@chromium.org>
 <20210510095026.3477496-5-tientzu@chromium.org>
 <20210510150256.GC28066@lst.de>
In-Reply-To: <20210510150256.GC28066@lst.de>
From: Claire Chang <tientzu@chromium.org>
Date: Wed, 12 May 2021 00:42:28 +0800
X-Gmail-Original-Message-ID: <CALiNf28jgAU7zN4pwgPKgaecM-KXRHHqwHj4sPXVf_3M0-goMQ@mail.gmail.com>
Message-ID: <CALiNf28jgAU7zN4pwgPKgaecM-KXRHHqwHj4sPXVf_3M0-goMQ@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 12 May 2021 05:46:37 +0000
Subject: Re: [Nouveau] [PATCH v6 04/15] swiotlb: Add restricted DMA pool
 initialization
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
 Frank Rowand <frowand.list@gmail.com>, mingo@kernel.org,
 Marek Szyprowski <m.szyprowski@samsung.com>, sstabellini@kernel.org,
 Saravana Kannan <saravanak@google.com>, mpe@ellerman.id.au,
 Joerg Roedel <joro@8bytes.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 Bartosz Golaszewski <bgolaszewski@baylibre.com>, bskeggs@redhat.com,
 linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 Thierry Reding <treding@nvidia.com>, intel-gfx@lists.freedesktop.org,
 matthew.auld@intel.com, linux-devicetree <devicetree@vger.kernel.org>,
 Jianxiong Gao <jxgao@google.com>, Daniel Vetter <daniel@ffwll.ch>,
 Will Deacon <will@kernel.org>, Konrad Rzeszutek Wilk <konrad.wilk@oracle.com>,
 maarten.lankhorst@linux.intel.com, airlied@linux.ie,
 Dan Williams <dan.j.williams@intel.com>, linuxppc-dev@lists.ozlabs.org,
 jani.nikula@linux.intel.com, Rob Herring <robh+dt@kernel.org>,
 rodrigo.vivi@intel.com, Bjorn Helgaas <bhelgaas@google.com>,
 boris.ostrovsky@oracle.com,
 Andy Shevchenko <andriy.shevchenko@linux.intel.com>, jgross@suse.com,
 Nicolas Boichat <drinkcat@chromium.org>, nouveau@lists.freedesktop.org,
 Greg KH <gregkh@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 lkml <linux-kernel@vger.kernel.org>, Tomasz Figa <tfiga@chromium.org>,
 "list@263.net:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
 Jim Quinlan <james.quinlan@broadcom.com>, xypron.glpk@gmx.de,
 Robin Murphy <robin.murphy@arm.com>, bauerman@linux.ibm.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, May 10, 2021 at 11:03 PM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +#include <linux/io.h>
> > +#include <linux/of.h>
> > +#include <linux/of_fdt.h>
> > +#include <linux/of_reserved_mem.h>
> > +#include <linux/slab.h>
> > +#endif
>
> I don't think any of this belongs into swiotlb.c.  Marking
> swiotlb_init_io_tlb_mem non-static and having all this code in a separate
> file is probably a better idea.

Will do in the next version.

>
> > +#ifdef CONFIG_DMA_RESTRICTED_POOL
> > +static int rmem_swiotlb_device_init(struct reserved_mem *rmem,
> > +                                 struct device *dev)
> > +{
> > +     struct io_tlb_mem *mem = rmem->priv;
> > +     unsigned long nslabs = rmem->size >> IO_TLB_SHIFT;
> > +
> > +     if (dev->dma_io_tlb_mem)
> > +             return 0;
> > +
> > +     /* Since multiple devices can share the same pool, the private data,
> > +      * io_tlb_mem struct, will be initialized by the first device attached
> > +      * to it.
> > +      */
>
> This is not the normal kernel comment style.

Will fix this in the next version.

>
> > +#ifdef CONFIG_ARM
> > +             if (!PageHighMem(pfn_to_page(PHYS_PFN(rmem->base)))) {
> > +                     kfree(mem);
> > +                     return -EINVAL;
> > +             }
> > +#endif /* CONFIG_ARM */
>
> And this is weird.  Why would ARM have such a restriction?  And if we have
> such rstrictions it absolutely belongs into an arch helper.

Now I think the CONFIG_ARM can just be removed?
The goal here is to make sure we're using linear map and can safely
use phys_to_dma/dma_to_phys.

>
> > +             swiotlb_init_io_tlb_mem(mem, rmem->base, nslabs, false);
> > +
> > +             rmem->priv = mem;
> > +
> > +#ifdef CONFIG_DEBUG_FS
> > +             if (!debugfs_dir)
> > +                     debugfs_dir = debugfs_create_dir("swiotlb", NULL);
> > +
> > +             swiotlb_create_debugfs(mem, rmem->name, debugfs_dir);
>
> Doesn't the debugfs_create_dir belong into swiotlb_create_debugfs?  Also
> please use IS_ENABLEd or a stub to avoid ifdefs like this.

Will move it into swiotlb_create_debugfs and use IS_ENABLED in the next version.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
