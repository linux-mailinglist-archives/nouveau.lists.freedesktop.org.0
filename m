Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C27226F5C
	for <lists+nouveau@lfdr.de>; Mon, 20 Jul 2020 21:56:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA65489DDF;
	Mon, 20 Jul 2020 19:56:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7315489DDF
 for <nouveau@lists.freedesktop.org>; Mon, 20 Jul 2020 19:56:40 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f15f6800000>; Mon, 20 Jul 2020 12:54:40 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 20 Jul 2020 12:56:39 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 20 Jul 2020 12:56:39 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Mon, 20 Jul 2020 19:56:31 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200713172149.2310-1-rcampbell@nvidia.com>
 <20200713172149.2310-4-rcampbell@nvidia.com>
 <20200720184020.GS2021248@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <86e3730a-bdf9-8d93-6dec-f658a8684f6e@nvidia.com>
Date: Mon, 20 Jul 2020 12:56:31 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200720184020.GS2021248@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595274880; bh=5GRiSBs3RDOMk08dKGgpct0rWCZMLTR1JrSTRec7I5Q=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=J/HjJ/a4Z1TyqdDeMi/trUuxwre2mngbZuk4MS7bh5bh0WX1m3ugS3ZC6r1Sr63hL
 jxw0u1znD+p4jaGRMJFIKV5Nv7U4UndgsV5nVoGqRzw8Z1I1HyohTbwpCiEPt9Iju+
 Pp2jtt8Qtbed/25hYEqaHZPDxIkFLq561hpNsdRSyAhv8KXIyPKMwAAyb6Wplsu3wY
 uHfsi35PrgZ6A1el4uTZPEg2VVA31PS0U8sKjKnUMWFsBXWzPDEwnM8LTJ1rNCkdyD
 wZHst3Xm3c+A3P/AuVFwuj1gEglhhLMDcUvCAxRi59G7lZpg39UF6hJxTeZvfmajnt
 Jgp9CMjMTEugA==
Subject: Re: [Nouveau] [PATCH v2 3/5] mm/notifier: add migration
 invalidation type
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


On 7/20/20 11:40 AM, Jason Gunthorpe wrote:
> On Mon, Jul 13, 2020 at 10:21:47AM -0700, Ralph Campbell wrote:
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
>> index fc68f3570e19..1921fcf6be5b 100644
>> +++ b/include/linux/mmu_notifier.h
>> @@ -38,6 +38,10 @@ struct mmu_interval_notifier;
>>    *
>>    * @MMU_NOTIFY_RELEASE: used during mmu_interval_notifier invalidate to signal
>>    * that the mm refcount is zero and the range is no longer accessible.
>> + *
>> + * @MMU_NOTIFY_MIGRATE: used during migrate_vma_collect() invalidate to signal
>> + * a device driver to possibly ignore the invalidation if the
>> + * migrate_pgmap_owner field matches the driver's device private pgmap owner.
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
>> +	void *migrate_pgmap_owner;
>>   };
>>   
>>   static inline int mm_has_notifiers(struct mm_struct *mm)
>> @@ -513,6 +519,7 @@ static inline void mmu_notifier_range_init(struct mmu_notifier_range *range,
>>   	range->start = start;
>>   	range->end = end;
>>   	range->flags = flags;
>> +	range->migrate_pgmap_owner = NULL;
>>   }
>>   
>>   #define ptep_clear_flush_young_notify(__vma, __address, __ptep)		\
>> diff --git a/mm/migrate.c b/mm/migrate.c
>> index 2bbc5c4c672e..9b3dcb81be5f 100644
>> +++ b/mm/migrate.c
>> @@ -2391,8 +2391,14 @@ static void migrate_vma_collect(struct migrate_vma *migrate)
>>   {
>>   	struct mmu_notifier_range range;
>>   
>> -	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, NULL,
>> +	/*
>> +	 * Note that the src_owner is passed to the mmu notifier callback so
>> +	 * that the registered device driver can skip invalidating device
>> +	 * private page mappings that won't be migrated.
>> +	 */
>> +	mmu_notifier_range_init(&range, MMU_NOTIFY_MIGRATE, 0, migrate->vma,
>>   			migrate->vma->vm_mm, migrate->start, migrate->end);
> 
> So the idea is that src_owner is always set to the pgmap owner when
> working with DEVICE_PRIVATE?
> 
> But then the comment in the prior patch should be fixed:
> 
> @@ -199,11 +204,12 @@  struct migrate_vma {
>   
>   	/*
>   	 * Set to the owner value also stored in page->pgmap->owner for
> +	 * migrating device private memory. The direction also needs to
> +	 * be set to MIGRATE_VMA_FROM_DEVICE_PRIVATE.
> 
> To say the caller must always provide src_owner.
> 
> And that field should probably be renamed at this point, as there is
> nothing "src" about it. It is just the pgmap_owner of the
> DEVICE_PRIVATE pages the TO/FROM DEVICE migration is working on.
> 
> Jason

Good point. I'll send a v3 with your suggested changes.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
