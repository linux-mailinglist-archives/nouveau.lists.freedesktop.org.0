Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 059F61DC0DF
	for <lists+nouveau@lfdr.de>; Wed, 20 May 2020 23:05:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 645936E8B1;
	Wed, 20 May 2020 21:05:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0D76E8B1
 for <nouveau@lists.freedesktop.org>; Wed, 20 May 2020 21:05:10 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ec59af60000>; Wed, 20 May 2020 14:02:46 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 20 May 2020 14:05:10 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 20 May 2020 14:05:10 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 20 May
 2020 21:05:09 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200520183652.21633-1-rcampbell@nvidia.com>
 <20200520192045.GH24561@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <0ef69e08-7f5d-7a3d-c657-55b3a8df1dfe@nvidia.com>
Date: Wed, 20 May 2020 14:05:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200520192045.GH24561@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590008566; bh=oNYfOayL5+NnABbnpFvMSS5jJdalJIc06Ghq09EUD4E=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=OXSTJKDHNXgUvcTtaCjRAbYfLocszE4i6M3tulp2GOmCgY+AtUmJn09EYEPdwMXak
 qBNS1ru1cIpS5X+kjTGjaFfdmoHvtoZY5l3arAAiNRNiJI6/9fIRgnXyzXFfRNunfy
 e7fys5XkFfg76pjban7f52m7QSu5jIJjzW6DyHYa19Z8otwsm6BAKxOEv4s6XnhwkR
 sEElneYYy7Vr5vGMG9inFQ7oP1gdk7FgIeuEDL5HTIfhCmOQMRuqgDTQUQO22+9ASL
 t2yLvPza0CZuQ4UjzRUItjyydP5yPzO8cb9kKfk3uINysnpUQ0GMWaSRYNUYgfph5z
 qlsDmF8dXLmBA==
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: fix migrate zero page to GPU
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
Cc: linux-rdma@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 5/20/20 12:20 PM, Jason Gunthorpe wrote:
> On Wed, May 20, 2020 at 11:36:52AM -0700, Ralph Campbell wrote:
>> When calling OpenCL clEnqueueSVMMigrateMem() on a region of memory that
>> is backed by pte_none() or zero pages, migrate_vma_setup() will fill the
>> source PFN array with an entry indicating the source page is zero.
>> Use this to optimize migration to device private memory by allocating
>> GPU memory and zero filling it instead of failing to migrate the page.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>
>> This patch applies cleanly to Jason's Gunthorpe's hmm tree plus two
>> patches I posted earlier. The first is queued in Ben Skegg's nouveau
>> tree and the second is still pending review/not queued.
>> [1] ("nouveau/hmm: map pages after migration")
>> https://lore.kernel.org/linux-mm/20200304001339.8248-5-rcampbell@nvidia.com/
>> [2] ("nouveau/hmm: fix nouveau_dmem_chunk allocations")
>> https://lore.kernel.org/lkml/20200421231107.30958-1-rcampbell@nvidia.com/
> 
> It would be best if it goes through Ben's tree if it doesn't have
> conflicts with the hunks I have in the hmm tree.. Is it the case?
> 
> Jason

I think there might be some merge conflicts even though it is semantically
independent of the other changes. I guess since we are at 5.7-rc6 and not
far from the merge window, I can rebase after 5.8-rc1 and resend.
I posted this mostly to get some review and as a "heads up" of the issue.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
