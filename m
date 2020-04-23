Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B2AD1B63D4
	for <lists+nouveau@lfdr.de>; Thu, 23 Apr 2020 20:32:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E14EA6E998;
	Thu, 23 Apr 2020 18:32:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F13D76E998
 for <nouveau@lists.freedesktop.org>; Thu, 23 Apr 2020 18:32:37 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ea1ded00001>; Thu, 23 Apr 2020 11:30:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Thu, 23 Apr 2020 11:32:37 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Thu, 23 Apr 2020 11:32:37 -0700
Received: from DRHQMAIL107.nvidia.com (10.27.9.16) by HQMAIL111.nvidia.com
 (172.20.187.18) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 23 Apr
 2020 18:32:37 +0000
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by DRHQMAIL107.nvidia.com
 (10.27.9.16) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Thu, 23 Apr 2020 18:32:31 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200421231107.30958-1-rcampbell@nvidia.com>
 <20200423121744.GY11945@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <a4a405d7-c136-b479-2bbe-5a2304f59c99@nvidia.com>
Date: Thu, 23 Apr 2020 11:32:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200423121744.GY11945@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 DRHQMAIL107.nvidia.com (10.27.9.16)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1587666640; bh=G+nUmnRcJ5ydh6Fqsxvex5y164yAqJgOdeSWpoSvEso=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=HvIBjsiN8WsVxIg/1f+qlmPDtr3fRvI0oZ5uaHP5qXZw0HG9CI+njrtxsYGY/1yBS
 gNZgb8LHMvioY5p19Rd2AaNkmFIC3MzXPIu+svmr/faDMM3L1luHXfeYHjBBJaqPMV
 ips0u32xtmp29/wFUIzqCilWvdIVZRHX6BKXfw4BNV4T+tIyKdNZ+TeRakfTQXbxvY
 JJLVVpYIXpf5CHB0xN4aob7nw72twxqb9HclE4yz67VxVgGB5KaANTiHlY1M1Ly6gH
 h63Sm5raZ5X3QJk1IhCnHLSjLeUKbj+VOPo512LIQSA2jT16TBSCoAPBeC8YXvtVLt
 yKzfd0z5K1BGg==
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: fix nouveau_dmem_chunk
 allocations
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


On 4/23/20 5:17 AM, Jason Gunthorpe wrote:
> On Tue, Apr 21, 2020 at 04:11:07PM -0700, Ralph Campbell wrote:
>> In nouveau_dmem_init(), a number of struct nouveau_dmem_chunk are allocated
>> and put on the dmem->chunk_empty list. Then in nouveau_dmem_pages_alloc(),
>> a nouveau_dmem_chunk is removed from the list and GPU memory is allocated.
>> However, the nouveau_dmem_chunk is never removed from the chunk_empty
>> list nor placed on the chunk_free or chunk_full lists. This results
>> in only one chunk ever being actually used (2MB) and quickly leads to
>> migration to device private memory failures.
>>
>> Fix this by having just one list of free device private pages and if no
>> pages are free, allocate a chunk of device private pages and GPU memory.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>> ---
>>   drivers/gpu/drm/nouveau/nouveau_dmem.c | 304 +++++++++----------------
>>   1 file changed, 112 insertions(+), 192 deletions(-)
> 
> Does this generate any conflicts with my series to rework
> hmm_range_fault?
> 
> Jason

I based it on top of your series and the patch that Ben already has queued
("nouveau/hmm: map pages after migration") so it shouldn't have any conflicts.

I guess I should have mentioned that in a cover letter.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
