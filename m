Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1711C204469
	for <lists+nouveau@lfdr.de>; Tue, 23 Jun 2020 01:26:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F0BB36E1A3;
	Mon, 22 Jun 2020 23:26:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A13226E1A3
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 23:26:51 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef13e0e0000>; Mon, 22 Jun 2020 16:26:06 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 16:26:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 16:26:51 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 23:26:41 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-10-rcampbell@nvidia.com>
 <20200622172520.GB2874652@mellanox.com>
 <15ba19a9-5f71-546b-bdea-31e65fc39693@nvidia.com>
 <20200622231835.GD2874652@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <f5ae2cdd-5774-8d1e-5a30-657b611568b8@nvidia.com>
Date: Mon, 22 Jun 2020 16:26:41 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200622231835.GD2874652@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592868366; bh=+OkYuEGtBWmCdamoI5RkV/30Ug8LA8Bd48QQ050WpCg=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=Z0yrcSnqqy39UtthHbXgST4onrT+geCMj9CZGPtxxEjYRjvnZ/kvuaig9BtbS5ewN
 4PIcptsE5rT/Cya1Dawz6nY7KqIoA4ZCnrFgV8aylqKRcIyulrCQdQucOix/auD69Y
 o+5+eqPgRY6cWpvS5AVPdQy8HhlNirNtE6d1O6Ay43A0Ufmn/YhE81mHzy6s8SVxj6
 l2dqTvOK7OV8EoRMMdgr944mPz2zbtHk7IGwF+944sFLpQW5BPEzArNOBM6eKvlkia
 GV7w1FT1kKnHhScFUsDCR2TRDrVQdKPPziglWU4Q7P8t1qWhtZohHk+jb9zgeiNkMI
 oeV7F+nI1CdpQ==
Subject: Re: [Nouveau] [PATCH 09/16] mm/hmm: add output flag for compound
 page mapping
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
 linux-kernel@vger.kernel.org, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 6/22/20 4:18 PM, Jason Gunthorpe wrote:
> On Mon, Jun 22, 2020 at 11:10:05AM -0700, Ralph Campbell wrote:
>>
>> On 6/22/20 10:25 AM, Jason Gunthorpe wrote:
>>> On Fri, Jun 19, 2020 at 02:56:42PM -0700, Ralph Campbell wrote:
>>>> hmm_range_fault() returns an array of page frame numbers and flags for
>>>> how the pages are mapped in the requested process' page tables. The PFN
>>>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>>>> order can be determined with compound_order(page) but if the page is larger
>>>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>>>> using a larger page size. To be fully general, hmm_range_fault() would need
>>>> to return the mapping size to handle cases like a 1GB compound page being
>>>> mapped with 2MB PMD entries. However, the most common case is the mapping
>>>> size is the same as the underlying compound page size.
>>>> Add a new output flag to indicate this so that callers know it is safe to
>>>> use a large device page table mapping if one is available.
>>>
>>> But what size should the caller use?
>>>
>>> You already explained that the caller cannot use compound_ordet() to
>>> get the size, so what should it be?
>>>
>>> Probably this needs to be two flags, PUD and PMD, and the caller should
>>> use the PUD and PMD sizes to figure out how big it is?
>>>
>>> Jason
>>>
>>
>> I guess I didn't explain it as clearly as I thought. :-)
>>
>> The page size *can* be determined with compound_order(page) but without the
>> flag, the caller doesn't know how much of that page is being mapped by the
>> CPU. The flag says the CPU is mapping the whole compound page (based on compound_order)
>> and that the caller can use device mappings up to the size of compound_order(page).
> 
> No, I got it, I just don't like the assumption that just because a PMD
> or PUD points to a page that the only possible value for
> compound_page() is PMD or PUD respectively. Partial mapping should be
> possible in both cases, if not today, then maybe down the road with
> some of the large page work that has been floating about
> 
> It seems much safer to just directly encode the PUD/PMD size in the
> flags
> 
> Jason

That is fine with me. I'll make that change for v2.
I was just trying to minimize the number of flags being added.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
