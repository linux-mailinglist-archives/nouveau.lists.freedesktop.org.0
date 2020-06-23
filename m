Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8EF720462E
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 02:51:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7C96E201;
	Tue, 23 Jun 2020 00:51:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE50C6E201
 for <nouveau@lists.freedesktop.org>; Tue, 23 Jun 2020 00:51:34 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef152090000>; Mon, 22 Jun 2020 17:51:21 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 17:51:34 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 17:51:34 -0700
Received: from [10.2.59.206] (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Tue, 23 Jun
 2020 00:51:26 +0000
To: Ralph Campbell <rcampbell@nvidia.com>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20200622233854.10889-1-rcampbell@nvidia.com>
 <20200622233854.10889-2-rcampbell@nvidia.com>
From: John Hubbard <jhubbard@nvidia.com>
Message-ID: <53751f8e-d901-df2e-a2e0-1b1484b31b81@nvidia.com>
Date: Mon, 22 Jun 2020 17:51:26 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.9.0
MIME-Version: 1.0
In-Reply-To: <20200622233854.10889-2-rcampbell@nvidia.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL105.nvidia.com (172.20.187.12) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592873481; bh=M5JpDj0By/NXP/evMyGItwbU3cOrKr1W3Gf6kJ1yhow=;
 h=X-PGP-Universal:Subject:To:CC:References:From:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:X-Originating-IP:
 X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=FjAEsgqZOHCD5Y2lJ3rJvBJxyTDAAT7f2T2k3awy8TT3tw62KkqIEfBAVdDk7X0ar
 S9zdWi7YdDIsMwxtqRzep7bFKp83t1o2SgpFzjUvqkVeBfRG+OzDeRIdCcnACQhzYK
 zmrntuXB+iqInv0bFRNBVrUZ7cM8pvDhm3liuq+RROLpo+cdLteh0+SVXWYoqnjNqq
 vjCr/EvEFNCNO3I9kLzBFP1be2wa+1UaXCU6izslR7s/gfanxexhEL/jQv7WS8VCXU
 lR8/fxc36R9kwQdJE/HJKQnJQ79XUVBiqMz8zcY+4DvD5VLEuL0QdQMf4U+9Ak9m0K
 wmFk/TWgZw4Tg==
Subject: Re: [Nouveau] [RESEND PATCH 1/3] nouveau: fix migrate page
 regression
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
> The patch to add zero page migration to GPU memory inadvertantly included

inadvertently

> part of a future change which broke normal page migration to GPU memory
> by copying too much data and corrupting GPU memory.
> Fix this by only copying one page instead of a byte count.
> 
> Fixes: 9d4296a7d4b3 ("drm/nouveau/nouveau/hmm: fix migrate zero page to GPU")
> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> ---
>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> index e5c230d9ae24..cc9993837508 100644
> --- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
> +++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
> @@ -550,7 +550,7 @@ static unsigned long nouveau_dmem_migrate_copy_one(struct nouveau_drm *drm,
>   					 DMA_BIDIRECTIONAL);
>   		if (dma_mapping_error(dev, *dma_addr))
>   			goto out_free_page;
> -		if (drm->dmem->migrate.copy_func(drm, page_size(spage),
> +		if (drm->dmem->migrate.copy_func(drm, 1,
>   			NOUVEAU_APER_VRAM, paddr, NOUVEAU_APER_HOST, *dma_addr))
>   			goto out_dma_unmap;
>   	} else {
>


I Am Not A Nouveau Expert, nor is it really clear to me how
page_size(spage) came to contain something other than a page's worth of
byte count, but this fix looks accurate to me. It's better for
maintenance, too, because the function never intends to migrate "some
number of bytes". It intends to migrate exactly one page.

Hope I'm not missing something fundamental, but:

Reviewed-by: John Hubbard <jhubbard@nvidia.com


thanks,
-- 
John Hubbard
NVIDIA
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
