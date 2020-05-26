Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C1A01E28D9
	for <lists+nouveau@lfdr.de>; Tue, 26 May 2020 19:32:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 562F48981B;
	Tue, 26 May 2020 17:32:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E100689D2F
 for <nouveau@lists.freedesktop.org>; Tue, 26 May 2020 17:32:49 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ecd52680001>; Tue, 26 May 2020 10:31:20 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Tue, 26 May 2020 10:32:49 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Tue, 26 May 2020 10:32:49 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 26 May 2020 17:32:48 +0000
To: Jason Gunthorpe <jgg@ziepe.ca>
References: <20200508192009.15302-1-rcampbell@nvidia.com>
 <20200525134118.GA2536@ziepe.ca>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <4743ec6e-a5a0-16ac-a1b8-992f851515f0@nvidia.com>
Date: Tue, 26 May 2020 10:32:48 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200525134118.GA2536@ziepe.ca>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1590514280; bh=gY1xHSzU0BixoChtgpMiGs26xB1k45JS1OITIdF0cPM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=YT6X8ZnMP3j2H98e/7bMTxvdcizzJii7qVVjHUfEFojmdIyhUbS3YLngjP0oO5mnQ
 vMVFflzmbMRnAtJAvCGfn27zgKrru6NNKyc6215BVmJQv5P2SlhTOzfdIOtvkLILKd
 eK8IB+aZBBKf+9QcOz3hHhbFq48EGMdTwSkqFXiaK8tMiGfqpR2y6WIl0vArwJinF8
 /M/m6VN4l777oH6kgroSbuBL3/KyGVYBbYUEe3EsIObrnVtyX6ZE2IQ8g16O645XNw
 OzjiUse4raMuhGPim7qMXfvYnXckCIUkzcKfIwBj1rHL5NI2x3jIWhjAqGjyqJWX9L
 bsa3lTJ9hIpqw==
Subject: Re: [Nouveau] [PATCH 0/6] nouveau/hmm: add support for mapping
 large pages
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
 Shuah Khan <shuah@linuxfoundation.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 5/25/20 6:41 AM, Jason Gunthorpe wrote:
> On Fri, May 08, 2020 at 12:20:03PM -0700, Ralph Campbell wrote:
>> hmm_range_fault() returns an array of page frame numbers and flags for
>> how the pages are mapped in the requested process' page tables. The PFN
>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>> order can be determined with compound_order(page) but if the page is larger
>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>> using a larger page size. To be fully general, hmm_range_fault() would need
>> to return the mapping size to handle cases like a 1GB compound page being
>> mapped with 2MB PMD entries. However, the most common case is the mapping
>> size the same as the underlying compound page size.
>> This series adds a new output flag to indicate this so that callers know it
>> is safe to use a large device page table mapping if one is available.
>> Nouveau and the HMM tests are updated to use the new flag.
>>
>> Note that this series depends on a patch queued in Ben Skeggs' nouveau
>> tree ("nouveau/hmm: map pages after migration") and the patches queued
>> in Jason's HMM tree.
>> There is also a patch outstanding ("nouveau/hmm: fix nouveau_dmem_chunk
>> allocations") that is independent of the above and could be applied
>> before or after.
> 
> Did Christoph and Matt's remarks get addressed here?

Both questioned the need to add the HMM_PFN_COMPOUND flag to the
hmm_range_fault() output array saying that the PFN can be used to get the
struct page pointer and the page can be examined to determine the page size.
My response is that while is true, it is also important that the device only
access the same parts of a large page that the process/cpu has access to.
There are places where a large page is mapped with smaller page table entries
when a page is shared by multiple processes.
After I explained this, I haven't seen any further comments from Christoph
and Matt. I'm still looking for reviews, acks, or suggested changes.


> I think ODP could use something like this, currently it checks every
> page to get back to the huge page size and this flag would optimze
> that
> 
> Jason
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
