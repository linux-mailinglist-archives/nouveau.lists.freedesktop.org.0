Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 012AB20466D
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 02:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2286E21A;
	Tue, 23 Jun 2020 00:57:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8DE26E21A
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 00:57:39 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef153760001>; Mon, 22 Jun 2020 17:57:26 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 17:57:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 17:57:39 -0700
Received: from [10.2.59.206] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jun
 2020 00:57:31 +0000
To: Ralph Campbell <rcampbell@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-4-rcampbell@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <c4421e68-e585-30b4-a6c3-e78e9e15c27f@nvidia.com>
Date: Mon, 22 Jun 2020 17:57:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622233854.10889-4-rcampbell@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592873846; bh=xt/DdoBrc7yZMBZQe7V2Al8LVTlDZOsWZMnDlqU0wok=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HFrX1kZHglfl1VvYBuoLqx22N0dETh2Vr8k2DJE6gl5LV9ujkobLDnbkPVN6dPZgr
 BFOxjTfLAPEJZXB5vvaAH7MZMLItWJKYIagC7RXVMlDgABKww7sZt/cpG1Z4tszwC5
 OasJ6bXWpHeJ84oshxjFQVD56tIJ+YpmI1RCawYuIbi0nnry6CkmkbVVcUQPgnC4hk
 Yw6MemJ/1EQ6XXuOig0WTHsBUZv1KaKywMaKvNNVctioQbUa04cBP2D7EVLiHbXlJ6
 YqT88zvzC1rZ+C5LNxlc7QOjzBiAjuGQN+EMw6FmDN7cfE5TjmXOlQrC4FftxUP0GK
 aLUQHXWsAbmcA==
Subject: Re: [Nouveau] [RESEND PATCH 3/3] nouveau: make nvkm_vmm_ctor() and
 nvkm_mmu_ptp_get() static
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
> The functions nvkm_vmm_ctor() and nvkm_mmu_ptp_get() are not called outside
> of the file defining them so make them static.
> 
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c  | 2 +-
>   drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h  | 3 ---
>   3 files changed, 2 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
> index ee11ccaf0563..de91e9a26172 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
> @@ -61,7 +61,7 @@ nvkm_mmu_ptp_put(struct nvkm_mmu *mmu, bool force, struct nvkm_mmu_pt *pt)
>   	kfree(pt);
>   }
>   
> -struct nvkm_mmu_pt *
> +static struct nvkm_mmu_pt *
>   nvkm_mmu_ptp_get(struct nvkm_mmu *mmu, u32 size, bool zero)
>   {
>   	struct nvkm_mmu_pt *pt;
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> index 199f94e15c5f..67b00dcef4b8 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
> @@ -1030,7 +1030,7 @@ nvkm_vmm_ctor_managed(struct nvkm_vmm *vmm, u64 addr, u64 size)
>   	return 0;
>   }
>   
> -int
> +static int
>   nvkm_vmm_ctor(const struct nvkm_vmm_func *func, struct nvkm_mmu *mmu,
>   	      u32 pd_header, bool managed, u64 addr, u64 size,
>   	      struct lock_class_key *key, const char *name,
> diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> index d3f8f916d0db..a2b179568970 100644
> --- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> +++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
> @@ -163,9 +163,6 @@ int nvkm_vmm_new_(const struct nvkm_vmm_func *, struct nvkm_mmu *,
>   		  u32 pd_header, bool managed, u64 addr, u64 size,
>   		  struct lock_class_key *, const char *name,
>   		  struct nvkm_vmm **);
> -int nvkm_vmm_ctor(const struct nvkm_vmm_func *, struct nvkm_mmu *,
> -		  u32 pd_header, bool managed, u64 addr, u64 size,
> -		  struct lock_class_key *, const char *name, struct nvkm_vmm *);
>   struct nvkm_vma *nvkm_vmm_node_search(struct nvkm_vmm *, u64 addr);
>   struct nvkm_vma *nvkm_vmm_node_split(struct nvkm_vmm *, struct nvkm_vma *,
>   				     u64 addr, u64 size);
> 

Looks accurate: the order within vmm.c (now that there is no .h
declaration) is still good, and I found no other uses of either function
within the linux.git tree, so


Reviewed-by: John Hubbard <jhubbard@nvidia.com


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
