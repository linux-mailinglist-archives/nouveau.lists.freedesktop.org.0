Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A14203ED3
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 20:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CCD86E8A3;
	Mon, 22 Jun 2020 18:10:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E8B36E8A4
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 18:10:18 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef0f3fd0001>; Mon, 22 Jun 2020 11:10:05 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 11:10:18 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 11:10:18 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 18:10:10 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200619215649.32297-10-rcampbell@nvidia.com>
 <20200622172520.GB2874652@mellanox.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <15ba19a9-5f71-546b-bdea-31e65fc39693@nvidia.com>
Date: Mon, 22 Jun 2020 11:10:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200622172520.GB2874652@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592849405; bh=0DzYL4HLsgFlf9gIOFWj4t2vhG+UWKyfEYszVntTpO0=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=b3bvo3nZKLlyLX4zT4vNK4ze9NrK0gTJTIt60jX7RdpK17Jd5c/zeIaUarno5eSu/
 cAYlkDVzSTDAL6h9v2srTDkNO87bgqoWwrkJ2wqJnsOZYPpnjlXw5FI7riq8c7sCAY
 PbJ8bmgwZA0AQU6g4GUBy7MnKThdRMg/F72BluBAuDdD8Zz2IXDlW0E5mEBiaXhzPE
 RgzgjZXu5xXgj4/27EEk4mjouwk6d1IQwBiDJ0mWrWFEVM700uvC5EzWt1MnQpQjz9
 HtF/Se4o8UOcnGkz+RN3s0mJzlFrwHPIwmxmvn71XEg515EyZlfpV9DYIN85f1wPAb
 ZqD40jApIS9Qg==
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


On 6/22/20 10:25 AM, Jason Gunthorpe wrote:
> On Fri, Jun 19, 2020 at 02:56:42PM -0700, Ralph Campbell wrote:
>> hmm_range_fault() returns an array of page frame numbers and flags for
>> how the pages are mapped in the requested process' page tables. The PFN
>> can be used to get the struct page with hmm_pfn_to_page() and the page size
>> order can be determined with compound_order(page) but if the page is larger
>> than order 0 (PAGE_SIZE), there is no indication that the page is mapped
>> using a larger page size. To be fully general, hmm_range_fault() would need
>> to return the mapping size to handle cases like a 1GB compound page being
>> mapped with 2MB PMD entries. However, the most common case is the mapping
>> size is the same as the underlying compound page size.
>> Add a new output flag to indicate this so that callers know it is safe to
>> use a large device page table mapping if one is available.
> 
> But what size should the caller use?
> 
> You already explained that the caller cannot use compound_ordet() to
> get the size, so what should it be?
> 
> Probably this needs to be two flags, PUD and PMD, and the caller should
> use the PUD and PMD sizes to figure out how big it is?
> 
> Jason
> 

I guess I didn't explain it as clearly as I thought. :-)

The page size *can* be determined with compound_order(page) but without the
flag, the caller doesn't know how much of that page is being mapped by the
CPU. The flag says the CPU is mapping the whole compound page (based on compound_order)
and that the caller can use device mappings up to the size of compound_order(page).
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
