Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3933921BE55
	for <lists+nouveau@lfdr.de>; Fri, 10 Jul 2020 22:13:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73A036ED05;
	Fri, 10 Jul 2020 20:13:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E82B56ED05
 for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2020 20:13:47 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f08cb8e0000>; Fri, 10 Jul 2020 13:11:58 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 10 Jul 2020 13:13:47 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 10 Jul 2020 13:13:47 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Jul 2020 20:13:46 +0000
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200701225352.9649-1-rcampbell@nvidia.com>
 <20200710192704.GA2128670@nvidia.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <886151ff-c8e7-7b49-cc8d-c0e32fdc770b@nvidia.com>
Date: Fri, 10 Jul 2020 13:13:46 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200710192704.GA2128670@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594411918; bh=kBUZGsLnFvs5AsR2jhrWWoSLsoCM1L3w7Wtbc0qtxj0=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=K3Dzp89zmicqXa+y0n8OOLym6kCUeazXTrxWKuXyC/tYXivwEn0t+LYOLybh7UIRs
 Whs4nbq3XhoKckYmk5hxdDJJSjc6+tcenmizLcZ+9hITHo2ymlHwDKw/KzgD4jXqsf
 CXDG/OIoOriWZjxSZ++/DUQBySlgupmLwEWHAfvI027WffQPvJ7ZoaeX/h+2ZvgYeP
 j7WWMTd0i9jcYA2k64awuSTUKnT1Qh+ex05aqZegl13YwSrWZKL4+LHbSpgsqYIP3I
 GJp51Ge7rgvO8jvpE3yAqsR2Hr4rRbjWfc9fbzbffbmYY0FtlkVHSYd1HMRqVZkjgo
 2VapRmOWglIeg==
Subject: Re: [Nouveau] [PATCH v3 0/5] mm/hmm/nouveau: add PMD system memory
 mapping
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


On 7/10/20 12:27 PM, Jason Gunthorpe wrote:
> On Wed, Jul 01, 2020 at 03:53:47PM -0700, Ralph Campbell wrote:
>> The goal for this series is to introduce the hmm_pfn_to_map_order()
>> function. This allows a device driver to know that a given 4K PFN is
>> actually mapped by the CPU using a larger sized CPU page table entry and
>> therefore the device driver can safely map system memory using larger
>> device MMU PTEs.
>> The series is based on 5.8.0-rc3 and is intended for Jason Gunthorpe's
>> hmm tree. These were originally part of a larger series:
>> https://lore.kernel.org/linux-mm/20200619215649.32297-1-rcampbell@nvidia.com/
>>
>> Changes in v3:
>> Replaced the HMM_PFN_P[MU]D flags with hmm_pfn_to_map_order() to
>> indicate the size of the CPU mapping.
>>
>> Changes in v2:
>> Make the hmm_range_fault() API changes into a separate series and add
>>    two output flags for PMD/PUD instead of a single compund page flag as
>>    suggested by Jason Gunthorpe.
>> Make the nouveau page table changes a separate patch as suggested by
>>    Ben Skeggs.
>> Only add support for 2MB nouveau mappings initially since changing the
>> 1:1 CPU/GPU page table size assumptions requires a bigger set of changes.
>> Rebase to 5.8.0-rc3.
>>
>> Ralph Campbell (5):
>>    nouveau/hmm: fault one page at a time
>>    mm/hmm: add hmm_mapping order
>>    nouveau: fix mapping 2MB sysmem pages
>>    nouveau/hmm: support mapping large sysmem pages
>>    hmm: add tests for HMM_PFN_PMD flag
> 
> Applied to hmm.git.
> 
> I edited the comment for hmm_pfn_to_map_order() and added a function
> to compute the field.
> 
> Thanks,
> Jason

Looks good, thanks.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
