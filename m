Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B3284B1CEB
	for <lists+nouveau@lfdr.de>; Fri, 11 Feb 2022 04:28:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E3E210E9F5;
	Fri, 11 Feb 2022 03:28:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E25D410E811;
 Thu, 10 Feb 2022 11:37:29 +0000 (UTC)
Received: from canpemm500002.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4JvZT42pQKzcckG;
 Thu, 10 Feb 2022 19:36:24 +0800 (CST)
Received: from [10.174.177.76] (10.174.177.76) by
 canpemm500002.china.huawei.com (7.192.104.244) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2308.21; Thu, 10 Feb 2022 19:37:24 +0800
To: Christoph Hellwig <hch@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-2-hch@lst.de>
From: Miaohe Lin <linmiaohe@huawei.com>
Message-ID: <fcd1848f-19af-6572-942f-bdcd51bf143c@huawei.com>
Date: Thu, 10 Feb 2022 19:37:24 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.6.0
MIME-Version: 1.0
In-Reply-To: <20220210072828.2930359-2-hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.174.177.76]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 canpemm500002.china.huawei.com (7.192.104.244)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Fri, 11 Feb 2022 03:28:13 +0000
Subject: Re: [Nouveau] [PATCH 01/27] mm: remove a pointless
 CONFIG_ZONE_DEVICE check in memremap_pages
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
Cc: nvdimm@lists.linux.dev, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Chaitanya Kulkarni <kch@nvidia.com>, Alistair Popple <apopple@nvidia.com>,
 amd-gfx@lists.freedesktop.org, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Jason Gunthorpe <jgg@nvidia.com>,
 Ralph Campbell <rcampbell@nvidia.com>, Muchun Song <songmuchun@bytedance.com>,
 Dan Williams <dan.j.williams@intel.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>, "Pan, Xinhui" <Xinhui.Pan@amd.com>,
 linux-kernel@vger.kernel.org, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2022/2/10 15:28, Christoph Hellwig wrote:
> memremap.c is only built when CONFIG_ZONE_DEVICE is set, so remove
> the superflous extra check.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Logan Gunthorpe <logang@deltatee.com>
> Reviewed-by: Jason Gunthorpe <jgg@nvidia.com>
> Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>
> Reviewed-by: Muchun Song <songmuchun@bytedance.com>
> Reviewed-by: Dan Williams <dan.j.williams@intel.com>
> ---
>  mm/memremap.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)
> 
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 6aa5f0c2d11fda..5f04a0709e436e 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -328,8 +328,7 @@ void *memremap_pages(struct dev_pagemap *pgmap, int nid)
>  		}
>  		break;
>  	case MEMORY_DEVICE_FS_DAX:
> -		if (!IS_ENABLED(CONFIG_ZONE_DEVICE) ||
> -		    IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
> +		if (IS_ENABLED(CONFIG_FS_DAX_LIMITED)) {
>  			WARN(1, "File system DAX not supported\n");
>  			return ERR_PTR(-EINVAL);
>  		}
> 

LGTM. Thanks.

Reviewed-by: Miaohe Lin <linmiaohe@huawei.com>
