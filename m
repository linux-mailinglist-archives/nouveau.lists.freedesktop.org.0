Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 84E671B371A
	for <lists+nouveau@lfdr.de>; Wed, 22 Apr 2020 08:03:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A276E836;
	Wed, 22 Apr 2020 06:03:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 337046E4E8;
 Wed, 22 Apr 2020 06:03:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id F3FEA68C7B; Wed, 22 Apr 2020 08:03:29 +0200 (CEST)
Date: Wed, 22 Apr 2020 08:03:29 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200422060329.GD22366@lst.de>
References: <0-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
 <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <5-v1-4eb72686de3c+5062-hmm_no_flags_jgg@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH hmm 5/5] mm/hmm: remove the customizable pfn
 format from hmm_range_fault
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
Cc: "David \(ChunMing\) Zhou" <David1.Zhou@amd.com>,
 Ralph Campbell <rcampbell@nvidia.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Alex Deucher <alexander.deucher@amd.com>, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>,
 Niranjana Vishwanathapura <niranjana.vishwanathapura@intel.com>,
 intel-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>



On Tue, Apr 21, 2020 at 09:21:46PM -0300, Jason Gunthorpe wrote:
> +void nouveau_hmm_convert_pfn(struct nouveau_drm *drm, struct hmm_range *range,
> +			     u64 *ioctl_addr)
>  {
>  	unsigned long i, npages;
>  
> +	/*
> +	 * The ioctl_addr prepared here is passed through nvif_object_ioctl()
> +	 * to an eventual DMA map on some call chain like:
> +	 *    nouveau_svm_fault():
> +	 *      args.i.m.method = NVIF_VMM_V0_PFNMAP
> +	 *      nouveau_range_fault()
> +	 *       nvif_object_ioctl()
> +	 *        client->driver->ioctl()
> +	 *           struct nvif_driver nvif_driver_nvkm:
> +	 *             .ioctl = nvkm_client_ioctl
> +	 *            nvkm_ioctl()
> +	 *             nvkm_ioctl_path()
> +	 *               nvkm_ioctl_v0[type].func(..)
> +	 *               nvkm_ioctl_mthd()
> +	 *                nvkm_object_mthd()
> +	 *                   struct nvkm_object_func nvkm_uvmm:
> +	 *                     .mthd = nvkm_uvmm_mthd
> +	 *                    nvkm_uvmm_mthd()
> +	 *                     nvkm_uvmm_mthd_pfnmap()
> +	 *                      nvkm_vmm_pfn_map()
> +	 *                       nvkm_vmm_ptes_get_map()
> +	 *                        func == gp100_vmm_pgt_pfn
> +	 *                         struct nvkm_vmm_desc_func gp100_vmm_desc_spt:
> +	 *                           .pfn = gp100_vmm_pgt_pfn
> +	 *                          nvkm_vmm_iter()
> +	 *                           REF_PTES == func == gp100_vmm_pgt_pfn()
> +	 *			      dma_map_page()
> +	 *
> +	 * This is all just encoding the internal hmm reprensetation into a
> +	 * different nouveau internal representation.
> +	 */

Nice callchain from hell..  Unfortunately such "code listings" tend to
get out of date very quickly, so I'm not sure it is worth keeping in
the code.  What would be really worthile is consolidating the two
different sets of defines (NVIF_VMM_PFNMAP_V0_ vs NVKM_VMM_PFN_)
to make the code a little easier to follow.

>  	npages = (range->end - range->start) >> PAGE_SHIFT;
>  	for (i = 0; i < npages; ++i) {
>  		struct page *page;
>  
> +		if (!(range->hmm_pfns[i] & HMM_PFN_VALID)) {
> +			ioctl_addr[i] = 0;
>  			continue;
> +		}

Can't we rely on the caller pre-zeroing the array?

> +		page = hmm_pfn_to_page(range->hmm_pfns[i]);
> +		if (is_device_private_page(page))
> +			ioctl_addr[i] = nouveau_dmem_page_addr(page) |
> +					NVIF_VMM_PFNMAP_V0_V |
> +					NVIF_VMM_PFNMAP_V0_VRAM;
> +		else
> +			ioctl_addr[i] = page_to_phys(page) |
> +					NVIF_VMM_PFNMAP_V0_V |
> +					NVIF_VMM_PFNMAP_V0_HOST;
> +		if (range->hmm_pfns[i] & HMM_PFN_WRITE)
> +			ioctl_addr[i] |= NVIF_VMM_PFNMAP_V0_W;

Now that this routine isn't really device memory specific any more, I
wonder if it should move to nouveau_svm.c.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
