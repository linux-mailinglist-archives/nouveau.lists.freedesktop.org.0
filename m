Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 43AD7204558
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 02:31:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C086E1F4;
	Tue, 23 Jun 2020 00:31:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E3946E1F4
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 00:30:59 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef14ce70000>; Mon, 22 Jun 2020 17:29:27 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 17:30:58 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Mon, 22 Jun 2020 17:30:58 -0700
Received: from [10.2.59.206] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jun
 2020 00:30:50 +0000
To: Ralph Campbell <rcampbell@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-3-rcampbell@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <f2bf81df-8faa-0f51-3f74-cb3b31d96aad@nvidia.com>
Date: Mon, 22 Jun 2020 17:30:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622233854.10889-3-rcampbell@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592872167; bh=2WrAbqXV4DGqxlrZm0+ZDSPDtMkQaV6QGvn6pSPJL84=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GUxJV+C/xcw2X+UKzYR0HO4lSwOnk4RAsKDmxnyBhUc/ZDOpq7i1TBhtNI0IuxO8t
 Vk3aU9aLCeDYez3x/H43zWX4DVKc7QreC8NXnlEDeI6R1j2f10oqs644W1dGmzh+vp
 3d1+XPUn3Qt0Y8dyGN1pG/18VShsrDIK+uZxaMdNQuaTdUoZaTkcoesEazRT376OJS
 KNAxa2LzMt6rAmVPucNTn5Lpahf5/zF5vaRa1HPQ5H2GLNV/WaMzoduLSJnX2PwT6x
 8cGJ8f8oRxHYkmU9TDnVvOT9Fv+gWry9WmY8iIA/L2UlSqnNZtiwHjomp3maYRYPB+
 h7QmH3p7gxbzA==
Subject: Re: [Nouveau] [RESEND PATCH 2/3] nouveau: fix mixed normal and
 device private page migration
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
Cc: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@lst.de>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2020-06-22 16:38, Ralph Campbell wrote:
> The OpenCL function clEnqueueSVMMigrateMem(), without any flags, will
> migrate memory in the given address range to device private memory. The
> source pages might already have been migrated to device private memory.
> In that case, the source struct page is not checked to see if it is
> a device private page and incorrectly computes the GPU's physical
> address of local memory leading to data corruption.
> Fix this by checking the source struct page and computing the correct
> physical address.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 8 ++++++++
>   1 file changed, 8 insertions(+)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index cc9993837508..f6a806ba3caa 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -540,6 +540,12 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   	if (!(src & MIGRATE_PFN_MIGRATE))
>   		goto out;
>   
> +	if (spage && is_device_private_page(spage)) {
> +		paddr = nouveau_dmem_page_addr(spage);
> +		*dma_addr = DMA_MAPPING_ERROR;
> +		goto done;
> +	}
> +
>   	dpage = nouveau_dmem_page_alloc_locked(drm);
>   	if (!dpage)
>   		goto out;
> @@ -560,6 +566,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   			goto out_free_page;
>   	}
>   
> +done:
>   	*pfn = NVIF_VMM_PFNMAP_V0_V | NVIF_VMM_PFNMAP_V0_VRAM |
>   		((paddr >> PAGE_SHIFT) << NVIF_VMM_PFNMAP_V0_ADDR_SHIFT);
>   	if (src & MIGRATE_PFN_WRITE)
> @@ -615,6 +622,7 @@ nouveau_dmem_migrate_vma(struct nouveau_drm *drm,
>   	struct migrate_vma args = {
>   		.vma		= vma,
>   		.start		= start,
> +		.src_owner	= drm->dev,

Hi Ralph,

This .src_owner setting does look like a required fix, but it seems like
a completely separate fix from what is listed in this patch's commit
description, right? (It feels like a casualty of rearranging the patches.)


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
