Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BE2C58508C
	for <lists+nouveau@lfdr.de>; Fri, 29 Jul 2022 15:13:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EE5910E051;
	Fri, 29 Jul 2022 13:12:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F03DA10E051;
 Fri, 29 Jul 2022 13:12:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8D88868AA6; Fri, 29 Jul 2022 15:12:48 +0200 (CEST)
Date: Fri, 29 Jul 2022 15:12:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Lyude Paul <lyude@redhat.com>
Message-ID: <20220729131248.GA27137@lst.de>
References: <20220728220545.163763-1-lyude@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220728220545.163763-1-lyude@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [RFC] drm/nouveau/ttm: Stop calling into swiotlb
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
Cc: David Airlie <airlied@linux.ie>, nouveau@lists.freedesktop.org,
 open list <linux-kernel@vger.kernel.org>,
 "open list:DRM DRIVER FOR NVIDIA GEFORCE/QUADRO GPUS"
 <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Hi Lyude, and thanks for taking a look.

> -#if IS_ENABLED(CONFIG_SWIOTLB) && IS_ENABLED(CONFIG_X86)
> -	need_swiotlb = is_swiotlb_active(dev->dev);
> -#endif
> -
>  	ret = ttm_device_init(&drm->ttm.bdev, &nouveau_bo_driver, drm->dev->dev,
> -				  dev->anon_inode->i_mapping,
> -				  dev->vma_offset_manager, need_swiotlb,
> -				  drm->client.mmu.dmabits <= 32);
> +			      dev->anon_inode->i_mapping,
> +			      dev->vma_offset_manager,
> +			      nouveau_drm_use_coherent_gpu_mapping(drm),
> +			      drm->client.mmu.dmabits <= 32);

This will break setups for two reasons:

 - swiotlb is not only used to do device addressing limitations, so
   this will not catch the case of interconnect addressing limitations
   or forced bounce buffering which used used e.g. in secure VMs.
 - we might need bouncing for any DMA address below the physical
   address limit of the CPU

But more fundamentally the use_dma32 argument to ttm_device_init
is rather broken, as the onlyway to get a memory allocation that
fits the DMA addressing needs of a device is to use the proper
DMA mapping helpers. i.e. ttm_pool_alloc_page really needs to use
dma_alloc_pages instead of alloc_pages as a first step.  That way
all users of the TTM pool will always get dma addressable pages
and there is no need to guess the addressing limitations.

The use_dma_alloc is then only needed for users that require coherent
memory and are willing to deal with the limitations that this entails
(e.g. no way to get at the page struct).

>  	if (ret) {
>  		NV_ERROR(drm, "error initialising bo driver, %d\n", ret);
>  		return ret;
> -- 
> 2.35.3
---end quoted text---
