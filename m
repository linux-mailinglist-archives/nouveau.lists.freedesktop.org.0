Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 01955217D7B
	for <lists+nouveau@lfdr.de>; Wed,  8 Jul 2020 05:20:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B10F6E849;
	Wed,  8 Jul 2020 03:20:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5442F6E849
 for <nouveau@lists.freedesktop.org>; Wed,  8 Jul 2020 03:20:05 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id 134so1410658ybd.6
 for <nouveau@lists.freedesktop.org>; Tue, 07 Jul 2020 20:20:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=Y395uq9ReqH2QX93opdrgHuWiwbpwhJOGLNOpbOYln4=;
 b=Wa8yVrPinL0aOLQ7Hfplhtj7J5g22NlsP9MXp9Ms1yv22XoeLGiaVaVtB7/gkAG+L4
 UaXBz9HCVN+/t+fFjg6mi8JG0/BQdFZjNE863x13dQns4fkFPVoCu42dG3DO3qoIT/6u
 Cpy36Kyz0MA4rfwt25sjvA6WzYaC8byEvYRNxhDKXuNtKauPWy0pJH2oIYh87jeE8rqI
 sTc7OvVyRJBa0mWBkrmQIbW+Tsn2cSJil+Fxu5m8vZEXDASfOo5NYCKWpuATdLbxv0Iv
 h5TzHkfcpbW7Vv0fyH+dQFQm3/1LracmJdRBWRrklkQs3rbDadtCep+hheCFXlroyhP4
 Khfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Y395uq9ReqH2QX93opdrgHuWiwbpwhJOGLNOpbOYln4=;
 b=F6SU14CVIYTipMgk5q9V1N9VGF17w8loepHomiRe/ORRxzzNQmtU6O3qR9COYcidBL
 Z2BZJgtf+fVv5jEkfq3sChOdn3mv38vlPujmpmQn0HbgRSXUA6QYMg6INj5ndSMQijZs
 wLtv8v98xN45zw2QfnRhpiyvOJJHGRYmfb8iogs8SV32SaHSaB1cUTkbEoPP+tBBi/+t
 uXNsLFwNPn+gqVYOREcKIwdr5ecGKtRXeFB5xWTW4u0OUmTbMwWUS8sankNQ/C6bqaz2
 TUFPuosT5H858xg8MOSyZeWNVupUYt2CQOSyx8J6/BvmYBx+1PvdAAlJi4b4b/CmtTVt
 XnHg==
X-Gm-Message-State: AOAM531UEFDLFKSu1UgM6s9ErDhvPgYFnFVT5QpA/gG6zK6nYcC9jGWX
 84NYeAGMst9EloTKgkGKFosuo5t1udcXCXovZV4=
X-Google-Smtp-Source: ABdhPJyJ0RqaPrAnLPhG8IAkVYaMuSdrLUc0ZhLlso+NQ+N29OO5Ct2wudI/5Wei+530PO0W2GZbgRwzD0UxnqNEto0=
X-Received: by 2002:a25:b28d:: with SMTP id k13mr2515633ybj.162.1594178404356; 
 Tue, 07 Jul 2020 20:20:04 -0700 (PDT)
MIME-Version: 1.0
References: <20200701225352.9649-1-rcampbell@nvidia.com>
 <20200701225352.9649-4-rcampbell@nvidia.com>
In-Reply-To: <20200701225352.9649-4-rcampbell@nvidia.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Wed, 8 Jul 2020 13:19:53 +1000
Message-ID: <CACAvsv4fbO8JtAjRYKnUBTccsZO7xeR4T6bYirY3QDDr1F2jsA@mail.gmail.com>
To: Ralph Campbell <rcampbell@nvidia.com>
Subject: Re: [Nouveau] [PATCH v3 3/5] nouveau: fix mapping 2MB sysmem pages
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
Cc: linux-rdma@vger.kernel.org, ML nouveau <nouveau@lists.freedesktop.org>,
 LKML <linux-kernel@vger.kernel.org>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Shuah Khan <shuah@kernel.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, 2 Jul 2020 at 08:54, Ralph Campbell <rcampbell@nvidia.com> wrote:
>
> The nvif_object_ioctl() method NVIF_VMM_V0_PFNMAP wasn't correctly
> setting the hardware specific GPU page table entries for 2MB sized
> pages. Fix this by adding functions to set and clear PD0 GPU page
> table entries.
I can take this one in my tree now, it's fairly independent of the rest.

Ben.

>
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>  drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  5 +-
>  .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 82 +++++++++++++++++++
>  2 files changed, 84 insertions(+), 3 deletions(-)
>
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 199f94e15c5f..19a6804e3989 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -1204,7 +1204,6 @@ nvkm_vmm_pfn_unmap(struct nvkm_vmm *vmm, u64 addr, u64 size)
>  /*TODO:
>   * - Avoid PT readback (for dma_unmap etc), this might end up being dealt
>   *   with inside HMM, which would be a lot nicer for us to deal with.
> - * - Multiple page sizes (particularly for huge page support).
>   * - Support for systems without a 4KiB page size.
>   */
>  int
> @@ -1220,8 +1219,8 @@ nvkm_vmm_pfn_map(struct nvkm_vmm *vmm, u8 shift, u64 addr, u64 size, u64 *pfn)
>         /* Only support mapping where the page size of the incoming page
>          * array matches a page size available for direct mapping.
>          */
> -       while (page->shift && page->shift != shift &&
> -              page->desc->func->pfn == NULL)
> +       while (page->shift && (page->shift != shift ||
> +              page->desc->func->pfn == NULL))
>                 page++;
>
>         if (!page->shift || !IS_ALIGNED(addr, 1ULL << shift) ||
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> index d86287565542..ed37fddd063f 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
> @@ -258,12 +258,94 @@ gp100_vmm_pd0_unmap(struct nvkm_vmm *vmm,
>         VMM_FO128(pt, vmm, pdei * 0x10, 0ULL, 0ULL, pdes);
>  }
>
> +static void
> +gp100_vmm_pd0_pfn_unmap(struct nvkm_vmm *vmm,
> +                       struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
> +{
> +       struct device *dev = vmm->mmu->subdev.device->dev;
> +       dma_addr_t addr;
> +
> +       nvkm_kmap(pt->memory);
> +       while (ptes--) {
> +               u32 datalo = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 0);
> +               u32 datahi = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 4);
> +               u64 data   = (u64)datahi << 32 | datalo;
> +
> +               if ((data & (3ULL << 1)) != 0) {
> +                       addr = (data >> 8) << 12;
> +                       dma_unmap_page(dev, addr, 1UL << 21, DMA_BIDIRECTIONAL);
> +               }
> +               ptei++;
> +       }
> +       nvkm_done(pt->memory);
> +}
> +
> +static bool
> +gp100_vmm_pd0_pfn_clear(struct nvkm_vmm *vmm,
> +                       struct nvkm_mmu_pt *pt, u32 ptei, u32 ptes)
> +{
> +       bool dma = false;
> +
> +       nvkm_kmap(pt->memory);
> +       while (ptes--) {
> +               u32 datalo = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 0);
> +               u32 datahi = nvkm_ro32(pt->memory, pt->base + ptei * 16 + 4);
> +               u64 data   = (u64)datahi << 32 | datalo;
> +
> +               if ((data & BIT_ULL(0)) && (data & (3ULL << 1)) != 0) {
> +                       VMM_WO064(pt, vmm, ptei * 16, data & ~BIT_ULL(0));
> +                       dma = true;
> +               }
> +               ptei++;
> +       }
> +       nvkm_done(pt->memory);
> +       return dma;
> +}
> +
> +static void
> +gp100_vmm_pd0_pfn(struct nvkm_vmm *vmm, struct nvkm_mmu_pt *pt,
> +                 u32 ptei, u32 ptes, struct nvkm_vmm_map *map)
> +{
> +       struct device *dev = vmm->mmu->subdev.device->dev;
> +       dma_addr_t addr;
> +
> +       nvkm_kmap(pt->memory);
> +       while (ptes--) {
> +               u64 data = 0;
> +
> +               if (!(*map->pfn & NVKM_VMM_PFN_W))
> +                       data |= BIT_ULL(6); /* RO. */
> +
> +               if (!(*map->pfn & NVKM_VMM_PFN_VRAM)) {
> +                       addr = *map->pfn >> NVKM_VMM_PFN_ADDR_SHIFT;
> +                       addr = dma_map_page(dev, pfn_to_page(addr), 0,
> +                                           1UL << 21, DMA_BIDIRECTIONAL);
> +                       if (!WARN_ON(dma_mapping_error(dev, addr))) {
> +                               data |= addr >> 4;
> +                               data |= 2ULL << 1; /* SYSTEM_COHERENT_MEMORY. */
> +                               data |= BIT_ULL(3); /* VOL. */
> +                               data |= BIT_ULL(0); /* VALID. */
> +                       }
> +               } else {
> +                       data |= (*map->pfn & NVKM_VMM_PFN_ADDR) >> 4;
> +                       data |= BIT_ULL(0); /* VALID. */
> +               }
> +
> +               VMM_WO064(pt, vmm, ptei++ * 16, data);
> +               map->pfn++;
> +       }
> +       nvkm_done(pt->memory);
> +}
> +
>  static const struct nvkm_vmm_desc_func
>  gp100_vmm_desc_pd0 = {
>         .unmap = gp100_vmm_pd0_unmap,
>         .sparse = gp100_vmm_pd0_sparse,
>         .pde = gp100_vmm_pd0_pde,
>         .mem = gp100_vmm_pd0_mem,
> +       .pfn = gp100_vmm_pd0_pfn,
> +       .pfn_clear = gp100_vmm_pd0_pfn_clear,
> +       .pfn_unmap = gp100_vmm_pd0_pfn_unmap,
>  };
>
>  static void
> --
> 2.20.1
>
> _______________________________________________
> Nouveau mailing list
> Nouveau@lists.freedesktop.org
> https://lists.freedesktop.org/mailman/listinfo/nouveau
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
