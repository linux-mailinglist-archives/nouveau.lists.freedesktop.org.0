Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93BBD283CA9
	for <lists+nouveau@lfdr.de>; Mon,  5 Oct 2020 18:40:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20D156E095;
	Mon,  5 Oct 2020 16:40:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EBD76E095
 for <nouveau@lists.freedesktop.org>; Mon,  5 Oct 2020 16:40:12 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B5f7b4c5e0001>; Mon, 05 Oct 2020 09:39:58 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 5 Oct 2020 16:40:07 +0000
To: Christoph Hellwig <hch@lst.de>
References: <20201001181715.17416-1-rcampbell@nvidia.com>
 <20201001181715.17416-3-rcampbell@nvidia.com> <20201002055930.GB8891@lst.de>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <1fbc3d0c-327a-6a8c-31c9-bb4c43e97b88@nvidia.com>
Date: Mon, 5 Oct 2020 09:40:02 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20201002055930.GB8891@lst.de>
Content-Language: en-US
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1601915998; bh=uKk/1IMmMSP6NJytgKSyNjisbvF89JkxZoPEU8aydWg=;
 h=Subject:To:CC:References:From:X-Nvconfidentiality:Message-ID:Date:
 User-Agent:MIME-Version:In-Reply-To:Content-Type:Content-Language:
 Content-Transfer-Encoding:X-Originating-IP:X-ClientProxiedBy;
 b=MIWNyI7HClm4jhRQdfRz7T5k7m1C6oRm/K3Sbl/0D+sGPVRFTpx4DVJpBcgbpPz1l
 /pRYAjUFHz0djJLBCDe92VgnQbmDyuNmFDU20/JVkkQgTDlRs/a2tIqq1ZMOixgje7
 +/NWmFXXwkKqD2JkbomwOFqAzE7b3zFzQ5BBD8RBQZ2EzRmT5pQWrbnNzGTGpq1Mmb
 zMnZ1eFh9iJ1oqF6a76KsYr2tdEIFvkTtTXaW6OlVfiAvbyu82wQr9W7T4y+s4b7tH
 oRR5zYqhwtb2SE4ti+rOPZz8spWn+dVkbicrVU7RtalMQSMhj1VyesNlw3Hs8YQu1F
 tIOY2k74rpwyQ==
Subject: Re: [Nouveau] [RFC PATCH v3 2/2] mm: remove extra ZONE_DEVICE
 struct page refcount
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, Paul Mackerras <paulus@ozlabs.org>,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Dan Williams <dan.j.williams@intel.com>,
 Ira Weiny <ira.weiny@intel.com>, Andrew Morton <akpm@linux-foundation.org>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 10/1/20 10:59 PM, Christoph Hellwig wrote:
> On Thu, Oct 01, 2020 at 11:17:15AM -0700, Ralph Campbell wrote:
>> ZONE_DEVICE struct pages have an extra reference count that complicates the
>> code for put_page() and several places in the kernel that need to check the
>> reference count to see that a page is not being used (gup, compaction,
>> migration, etc.). Clean up the code so the reference count doesn't need to
>> be treated specially for ZONE_DEVICE.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
> 
> Looks good,
> 
> Reviewed-by: Christoph Hellwig <hch@lst.de>

Thanks for the review.

I still have reservations about making this an official patch.
Did you see the updated cover letter?
Basically, I'm concerned about ZONE_DEVICE struct pages being inserted into
the process page table with a zero reference count with vmf_insert_mixed().
If it is to be a non-zero reference count, then DAX, pmem, and other uses
of ZONE_DEVICE pages need to be changed (or vmf_insert_mixed()) to
inc/dec in appropriate places but I don't feel I know that code well enough
to make those changes.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
