Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 23A5A21BE5A
	for <lists+nouveau@lfdr.de>; Fri, 10 Jul 2020 22:17:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BE4B6EC3B;
	Fri, 10 Jul 2020 20:17:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DDF06EC3B
 for <nouveau@lists.freedesktop.org>; Fri, 10 Jul 2020 20:17:52 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f08ccb80000>; Fri, 10 Jul 2020 13:16:56 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Fri, 10 Jul 2020 13:17:51 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Fri, 10 Jul 2020 13:17:51 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Fri, 10 Jul 2020 20:17:51 +0000
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200706222347.32290-1-rcampbell@nvidia.com>
 <20200706222347.32290-4-rcampbell@nvidia.com>
 <20200710193939.GA2129070@nvidia.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <9364c81b-10a1-1fe4-b2c2-f48a73d2e04a@nvidia.com>
Date: Fri, 10 Jul 2020 13:17:50 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200710193939.GA2129070@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1594412216; bh=rUDxEVDDXg2ewE0+kszxB/UwPBy9zLM3dlTpNaw+dUU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=IeX73XrMpdnEzMR3GU6vvGaowi1ON8mbtbHE8oD4o0cC8C8T17muOcgvoL3nje3j9
 H+nq23dn58RFQrzvqy5KHLpfXdOSIdwT32OUCRjroCnbkBRsA1SemDH7JyDZkVBvWH
 D6Q3iTflCh0zMowlVcbuClrA7FkfIRqV17397yMqNWQQTQiuYVbAdysB4Lv7MqpXMB
 N+8fNe30DS2jEVW3jw0s00eVM8AtnLIbv9aEu4S9JEHW3SsMs/5XYPT4GkgHvPCkuB
 RIjrMcZyZOndBWT61zU2V9kVMTzzC/PFf0x3p5WXjCwpBqbcs4a1ixNVYGmkzmdWa+
 nQOVi6u+my9XQ==
Subject: Re: [Nouveau] [PATCH 3/5] mm/notifier: add migration invalidation
 type
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
 linux-kernel@vger.kernel.org, kvm-ppc@vger.kernel.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, linux-kselftest@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 7/10/20 12:39 PM, Jason Gunthorpe wrote:
> On Mon, Jul 06, 2020 at 03:23:45PM -0700, Ralph Campbell wrote:
>> Currently migrate_vma_setup() calls mmu_notifier_invalidate_range_start()
>> which flushes all device private page mappings whether or not a page
>> is being migrated to/from device private memory. In order to not disrupt
>> device mappings that are not being migrated, shift the responsibility
>> for clearing device private mappings to the device driver and leave
>> CPU page table unmapping handled by migrate_vma_setup(). To support
>> this, the caller of migrate_vma_setup() should always set struct
>> migrate_vma::src_owner to a non NULL value that matches the device
>> private page->pgmap->owner. This value is then passed to the struct
>> mmu_notifier_range with a new event type which the driver's invalidation
>> function can use to avoid device MMU invalidations.
>>
>> Signed-off-by: Ralph Campbell <rcampbell@nvidia.com>
>>   include/linux/mmu_notifier.h | 7 +++++++
>>   mm/migrate.c                 | 8 +++++++-
>>   2 files changed, 14 insertions(+), 1 deletion(-)
>>
>> diff --git a/include/linux/mmu_notifier.h b/include/linux/mmu_notifier.h
>> index fc68f3570e19..bd0b34dbe4de 100644
>> +++ b/include/linux/mmu_notifier.h
>> @@ -38,6 +38,10 @@ struct mmu_interval_notifier;
>>    *
>>    * @MMU_NOTIFY_RELEASE: used during mmu_interval_notifier invalidate to signal
>>    * that the mm refcount is zero and the range is no longer accessible.
>> + *
>> + * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
>> + * a device driver to possibly ignore the invalidation if the src_own
>> + * field matches.
>>    */
>>   enum mmu_notifier_event {
>>   	MMU_NOTIFY_UNMAP = 0,
>> @@ -46,6 +50,7 @@ enum mmu_notifier_event {
>>   	MMU_NOTIFY_PROTECTION_PAGE,
>>   	MMU_NOTIFY_SOFT_DIRTY,
>>   	MMU_NOTIFY_RELEASE,
>> +	MMU_NOTIFY_MIGRATE,
>>   };
>>   
>>   #define MMU_NOTIFIER_RANGE_BLOCKABLE (1 << 0)
>> @@ -264,6 +269,7 @@ struct mmu_notifier_range {
>>   	unsigned long end;
>>   	unsigned flags;
>>   	enum mmu_notifier_event event;
>> +	void *data;
>>   };
> 
> This generic member usually ends up a bit ugly, can we do a tagged
> union instead?
> 
> union
> {
>       void *migrate_pgmap_owner;
> };
> 
> and probably drop the union until we actually need two things here.
> 
> Jason

OK, I'll send a v2 with this change.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
