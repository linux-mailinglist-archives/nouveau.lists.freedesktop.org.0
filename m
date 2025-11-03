Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BDD4C2A8A9
	for <lists+nouveau@lfdr.de>; Mon, 03 Nov 2025 09:20:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 451D710E38D;
	Mon,  3 Nov 2025 08:20:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=kernel.org header.i=@kernel.org header.b="Bo6qKhDF";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from tor.source.kernel.org (tor.source.kernel.org [172.105.4.254])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3066110E38C
 for <nouveau@lists.freedesktop.org>; Mon,  3 Nov 2025 08:20:38 +0000 (UTC)
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id 678F860053
 for <nouveau@lists.freedesktop.org>; Mon,  3 Nov 2025 08:20:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1A9E8C4AF0B
 for <nouveau@lists.freedesktop.org>; Mon,  3 Nov 2025 08:20:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1762158037;
 bh=3u/rpGXSihKqhfsVaZzxD5/gPGk7i3CnGVWA2evOHm0=;
 h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
 b=Bo6qKhDFHmuEJrGxsGfbPwk4ypwIUxeAtTJIdr9604PVDl4I/oOpfS4Vi23P1E43F
 neKKqnyh2KaCp7otUPCYu8ZRZO23ozrXMqAEq/VbsAkIPE3+S9+kROvXbU4d6NPVYg
 6roav74lpadCO9XfZgltpFdH0kHt4Z021ObnVQDPjMrosBZPILdCXmG/1xDisHzNlB
 OzX6hG7i7kMoCjPCCw7f8nLQyowMTE6judYkAULirbqkO1LFLXOoSqzX3EsJ6qa4Et
 OeGWalWTun2UxibmNAoVLKAOPybj1c4jGwYU9S0r+6KqZOZ0eL7H77UMdgbIODwc2O
 9l2Jy8LNjpyjg==
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-592f3630b69so4562860e87.2
 for <nouveau@lists.freedesktop.org>; Mon, 03 Nov 2025 00:20:37 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCUqSZgZXGR1JlByvoK8PanJ2zNkGIIAbADQ9suA+CPYdX1TUDvjN1R/PrnzBD4FoPxSraocUi1o@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzU9oO0IkVy5lmkHB3Uf1Ropjigl8mrywVMuOZoVz4ndzh68+l9
 khRLOB+dYz5Qd+NRIFzm7UrZao3xcB8xXUx/hRP8LtTiEJIZBQYrBdL3XR085RUvNUsmx6t5iaI
 CVPHataLUuOQ2IiQdY1v6eNvz/WCG+uA=
X-Google-Smtp-Source: AGHT+IGTpms4Fl8IC9UDLuBvkSZZN6ewiudTr09vFFaNQ3RItMcme3lUUXAuf1yj3RWqjLu6U8QKVyN3Upfje/kcWnA=
X-Received: by 2002:a2e:be13:0:b0:37a:2e32:320a with SMTP id
 38308e7fff4ca-37a2e3232cbmr17803521fa.21.1762158035470; Mon, 03 Nov 2025
 00:20:35 -0800 (PST)
MIME-Version: 1.0
References: <20251031161045.3263665-1-ttabi@nvidia.com>
In-Reply-To: <20251031161045.3263665-1-ttabi@nvidia.com>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Mon, 3 Nov 2025 09:20:24 +0100
X-Gmail-Original-Message-ID: <CAMj1kXFigMpbzWAVz2gOSQxmtMYU22LRWQWVwkd4QeQy8J6Kqg@mail.gmail.com>
X-Gm-Features: AWmQ_bmLEk2zs6nUGb6SmLqMwVdIEOX-8EEsac_ycKBkfyzRAgVAgpeoAQZMtoU
Message-ID: <CAMj1kXFigMpbzWAVz2gOSQxmtMYU22LRWQWVwkd4QeQy8J6Kqg@mail.gmail.com>
Subject: Re: [PATCH] drm/nouveau: set DMA mask before creating the flush page
To: Timur Tabi <ttabi@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Dave Airlie <airlied@redhat.com>, 
 Danilo Krummrich <dakr@kernel.org>, nouveau@lists.freedesktop.org,
 stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, 31 Oct 2025 at 17:12, Timur Tabi <ttabi@nvidia.com> wrote:
>
> Set the DMA mask before calling nvkm_device_ctor(), so that when the
> flush page is created in nvkm_fb_ctor(), the allocation will not fail
> if the page is outside of DMA address space, which can easily happen if
> IOMMU is disable.  In such situations, you will get an error like this:
>
> nouveau 0000:65:00.0: DMA addr 0x0000000107c56000+4096 overflow (mask ffffffff, bus limit 0).
>
> Commit 38f5359354d4 ("rm/nouveau/pci: set streaming DMA mask early")
> set the mask after calling nvkm_device_ctor(), but back then there was
> no flush page being created, which might explain why the mask wasn't
> set earlier.
>
> Flush page allocation was added in commit 5728d064190e ("drm/nouveau/fb:
> handle sysmem flush page from common code").  nvkm_fb_ctor() calls
> alloc_page(), which can allocate a page anywhere in system memory, but
> then calls dma_map_page() on that page.  But since the DMA mask is still
> set to 32, the map can fail if the page is allocated above 4GB.  This is
> easy to reproduce on systems with a lot of memory and IOMMU disabled.
>
> An alternative approach would be to force the allocation of the flush
> page to low memory, by specifying __GFP_DMA32.  However, this would
> always allocate the page in low memory, even though the hardware can
> access high memory.
>
> Fixes: 5728d064190e ("drm/nouveau/fb: handle sysmem flush page from common code")
> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
> ---
>  .../gpu/drm/nouveau/nvkm/engine/device/pci.c  | 24 +++++++++----------
>  1 file changed, 12 insertions(+), 12 deletions(-)
>

This is the third time you are sending the exact same patch, right? Or
is there a difference between the versions?

> diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> index 8f0261a0d618..7cc5a7499583 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/pci.c
> @@ -1695,6 +1695,18 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
>         *pdevice = &pdev->device;
>         pdev->pdev = pci_dev;
>
> +       /* Set DMA mask based on capabilities reported by the MMU subdev. */
> +       if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
> +               bits = pdev->device.mmu->dma_bits;
> +       else
> +               bits = 32;
> +
> +       ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bits));
> +       if (ret && bits != 32) {
> +               dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
> +               pdev->device.mmu->dma_bits = 32;
> +       }
> +
>         ret = nvkm_device_ctor(&nvkm_device_pci_func, quirk, &pci_dev->dev,
>                                pci_is_pcie(pci_dev) ? NVKM_DEVICE_PCIE :
>                                pci_find_capability(pci_dev, PCI_CAP_ID_AGP) ?
> @@ -1708,17 +1720,5 @@ nvkm_device_pci_new(struct pci_dev *pci_dev, const char *cfg, const char *dbg,
>         if (ret)
>                 return ret;
>
> -       /* Set DMA mask based on capabilities reported by the MMU subdev. */
> -       if (pdev->device.mmu && !pdev->device.pci->agp.bridge)
> -               bits = pdev->device.mmu->dma_bits;
> -       else
> -               bits = 32;
> -
> -       ret = dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(bits));
> -       if (ret && bits != 32) {
> -               dma_set_mask_and_coherent(&pci_dev->dev, DMA_BIT_MASK(32));
> -               pdev->device.mmu->dma_bits = 32;
> -       }
> -
>         return 0;
>  }
>
> base-commit: 18a7e218cfcdca6666e1f7356533e4c988780b57
> --
> 2.51.0
>
