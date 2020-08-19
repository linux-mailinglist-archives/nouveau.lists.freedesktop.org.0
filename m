Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DA124A294
	for <lists+nouveau@lfdr.de>; Wed, 19 Aug 2020 17:13:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 652EC6E40D;
	Wed, 19 Aug 2020 15:13:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x642.google.com (mail-ej1-x642.google.com
 [IPv6:2a00:1450:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E478F6E40D
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 15:11:56 +0000 (UTC)
Received: by mail-ej1-x642.google.com with SMTP id d6so26722478ejr.5
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 08:11:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gblnYCzc62i56nCc5LRWss+Qf5wc+kIzyZ60hUww65Y=;
 b=CmFRV9MF78Io9lyU3ZTHQoxCUWL8rgrVpgpqOj4nEXWpRTCd1+KGSochi2kuoVhtFt
 PQJJembCFDIORAph3WzrpDoRd2cIGJpwf9VAtP5a9ydpphhRkHDHcmKRPuhZGWASaGfl
 y6rPrnsIqK2MPfXnYUVbYzJtuDwuiigpqdGRc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gblnYCzc62i56nCc5LRWss+Qf5wc+kIzyZ60hUww65Y=;
 b=KGDa/B+YIdBs98UVw0M2G8d3CATiC8/Z+np88jZo6Y7wHdd5TxthiRWAHbltrjl/g5
 TJgUcu4COcK5C86GxpfUyitfbLjncyC8sVjq11va7ZK0/hZLhkPBy7F7/60jVg6FgRmT
 bqeaoOwxS6JH7Bqxq2erEC3DqJcBlMy/YN1UuPRP3BVS33vX4DnSGT1/ERNn6AbZgRSR
 YxuQrU6Y1ZOzir5RWF36IMD4btQhc2Kzga5V9FCb9ajntWEsITnC/i0T+1TfAY/l+P2N
 D2VYDLUoumxfZXhGtAX2wZTH3s4Yy22l4aaPYYeUVsZOJrXrzAc4gWGQlr5ZMNdLjkis
 u0Mg==
X-Gm-Message-State: AOAM531VUoQrEjYzqH16hPDpWuhpp7DeJ3uOd36Tp0IMBwoIxkr+pdh0
 otgAUd9AKRfjSuy2Lyg1aSwQ7Qh5gjgpnA==
X-Google-Smtp-Source: ABdhPJy5UrP8cJpqqIau3XjAE77jsNWnU4ZOlHvwzEPpK/KXC1SAk4hEa6Qz+Wz9Q6dmAKUVAGquTg==
X-Received: by 2002:a17:906:c7d3:: with SMTP id
 dc19mr25568820ejb.495.1597849915284; 
 Wed, 19 Aug 2020 08:11:55 -0700 (PDT)
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com.
 [209.85.128.47])
 by smtp.gmail.com with ESMTPSA id g9sm18487789ejf.101.2020.08.19.08.11.54
 for <nouveau@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 19 Aug 2020 08:11:55 -0700 (PDT)
Received: by mail-wm1-f47.google.com with SMTP id g8so2434437wmk.3
 for <nouveau@lists.freedesktop.org>; Wed, 19 Aug 2020 08:11:54 -0700 (PDT)
X-Received: by 2002:a1c:4d12:: with SMTP id o18mr5316483wmh.55.1597849448826; 
 Wed, 19 Aug 2020 08:04:08 -0700 (PDT)
MIME-Version: 1.0
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-20-hch@lst.de>
In-Reply-To: <20200819065555.1802761-20-hch@lst.de>
From: Tomasz Figa <tfiga@chromium.org>
Date: Wed, 19 Aug 2020 17:03:52 +0200
X-Gmail-Original-Message-ID: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
Message-ID: <CAAFQd5Bbp-eAVKS1MKS8xtrT4ZoOmBPfZyw9mys=eOmDb6r8Lw@mail.gmail.com>
To: Christoph Hellwig <hch@lst.de>
X-Mailman-Approved-At: Wed, 19 Aug 2020 15:13:31 +0000
Subject: Re: [Nouveau] [PATCH 19/28] dma-mapping: replace
 DMA_ATTR_NON_CONSISTENT with dma_{alloc, free}_pages
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 nouveau@lists.freedesktop.org, linux-nvme@lists.infradead.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, Marek Szyprowski <m.szyprowski@samsung.com>,
 linux-samsung-soc <linux-samsung-soc@vger.kernel.org>,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <linux-arm-kernel@lists.infradead.org>,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org,
 "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
 Joerg Roedel <joro@8bytes.org>, " <iommu@lists.linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Christoph,

On Wed, Aug 19, 2020 at 8:57 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Add a new API to allocate and free pages that are guaranteed to be
> addressable by a device, but otherwise behave like pages allocated by
> alloc_pages.  The intended APIs to sync them for use with the device
> and cpu are dma_sync_single_for_{device,cpu} that are also used for
> streaming mappings.
>
> Switch all drivers over to this new API, but keep the usage of the
> crufty dma_cache_sync API for now, which will be cleaned up on a driver
> by driver basis.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  Documentation/core-api/dma-api.rst        | 68 +++++++++++------------
>  Documentation/core-api/dma-attributes.rst |  8 ---
>  arch/alpha/kernel/pci_iommu.c             |  2 +
>  arch/arm/mm/dma-mapping-nommu.c           |  2 +
>  arch/arm/mm/dma-mapping.c                 |  4 ++
>  arch/ia64/hp/common/sba_iommu.c           |  2 +
>  arch/mips/jazz/jazzdma.c                  |  7 +--
>  arch/powerpc/kernel/dma-iommu.c           |  2 +
>  arch/powerpc/platforms/ps3/system-bus.c   |  4 ++
>  arch/powerpc/platforms/pseries/vio.c      |  2 +
>  arch/s390/pci/pci_dma.c                   |  2 +
>  arch/x86/kernel/amd_gart_64.c             |  2 +
>  drivers/iommu/dma-iommu.c                 |  2 +
>  drivers/iommu/intel/iommu.c               |  4 ++
>  drivers/net/ethernet/i825xx/lasi_82596.c  | 13 ++---
>  drivers/net/ethernet/seeq/sgiseeq.c       | 12 ++--
>  drivers/parisc/ccio-dma.c                 |  2 +
>  drivers/parisc/sba_iommu.c                |  2 +
>  drivers/scsi/53c700.c                     |  8 +--
>  drivers/scsi/sgiwd93.c                    | 12 ++--
>  drivers/xen/swiotlb-xen.c                 |  2 +
>  include/linux/dma-direct.h                |  5 ++
>  include/linux/dma-mapping.h               | 29 ++++++++--
>  include/linux/dma-noncoherent.h           |  3 -
>  kernel/dma/direct.c                       | 51 ++++++++++++++++-
>  kernel/dma/mapping.c                      | 43 +++++++++++++-
>  kernel/dma/ops_helpers.c                  | 35 ++++++++++++
>  kernel/dma/virt.c                         |  2 +
>  sound/mips/hal2.c                         | 20 +++----
>  29 files changed, 254 insertions(+), 96 deletions(-)
>

Thanks for the patch. The general design looks quite nice, but please
see my comments inline.


> diff --git a/Documentation/core-api/dma-api.rst b/Documentation/core-api/dma-api.rst
> index 90239348b30f6f..047fcfffa0e5cf 100644
> --- a/Documentation/core-api/dma-api.rst
> +++ b/Documentation/core-api/dma-api.rst
> @@ -516,48 +516,53 @@ routines, e.g.:::
>         }
>
>
> -Part II - Advanced dma usage
> -----------------------------
> +Part II - Non-coherent DMA allocations
> +--------------------------------------
>
> -Warning: These pieces of the DMA API should not be used in the
> -majority of cases, since they cater for unlikely corner cases that
> -don't belong in usual drivers.
> +These APIs allow to allocate pages that can be used like normal pages
> +in the kernel direct mapping, but are guaranteed to be DMA addressable.

Could we elaborate a bit more on what "like normal pages in kernel
direct mapping" mean from the driver perspective?

>
>  If you don't understand how cache line coherency works between a
>  processor and an I/O device, you should not be using this part of the
> -API at all.
> +API.
>
>  ::
>
>         void *
> -       dma_alloc_attrs(struct device *dev, size_t size, dma_addr_t *dma_handle,
> -                       gfp_t flag, unsigned long attrs)
> +       dma_alloc_pages(struct device *dev, size_t size, dma_addr_t *dma_handle,
> +                       enum dma_data_direction dir, gfp_t gfp)
> +
> +This routine allocates a region of <size> bytes of consistent memory.  It
> +returns a pointer to the allocated region (in the processor's virtual address
> +space) or NULL if the allocation failed. The returned memory is guanteed to
> +behave like memory allocated using alloc_pages.

There is one aspect that the existing dma_alloc_attrs() handles, but
this new function doesn't: IOMMU support. The function will always
allocate a physically-contiguous block memory, which is a costly
operation and not even guaranteed to succeed, even if enough free
memory is available.

Modern SoCs employ IOMMUs to avoid the need to allocate
physically-contiguous memory and those happen to be also the devices
that could benefit from non-coherent allocations a lot. One of the
tasks of the DMA API was making it possible to allocate suitable
memory for a given device, without having the driver know about the
SoC integration details, such as the presence of an IOMMU.

Today, dma_alloc_attrs() uses the .alloc callback of the dma_ops
struct and the IOMMU-aware implementations, like the dma-iommu helpers
[1], would allocate discontiguous pages. Therefore, while I see the
DMA-aware page allocation functionality as a useful functionality on
its own for scatter-gather-capable hardware, I believe it is not a
complete replacement for dma_alloc_attrs() with the
DMA_ATTR_NON_CONSISTENT attribute.

[1] https://elixir.bootlin.com/linux/v5.9-rc1/source/drivers/iommu/dma-iommu.c#L510

Best regards,
Tomasz
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
