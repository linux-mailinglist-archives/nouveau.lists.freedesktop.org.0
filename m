Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9992213CFAB
	for <lists+nouveau@lfdr.de>; Wed, 15 Jan 2020 23:05:33 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B78816EB64;
	Wed, 15 Jan 2020 22:05:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADD526EB64
 for <nouveau@lists.freedesktop.org>; Wed, 15 Jan 2020 22:05:29 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5e1f8c710000>; Wed, 15 Jan 2020 14:04:33 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Wed, 15 Jan 2020 14:05:29 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Wed, 15 Jan 2020 14:05:29 -0800
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 15 Jan
 2020 22:05:24 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200113224703.5917-1-rcampbell@nvidia.com>
 <20200113224703.5917-5-rcampbell@nvidia.com>
 <20200114124956.GN20978@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <528c1cff-608c-d342-1e72-90d780555204@nvidia.com>
Date: Wed, 15 Jan 2020 14:05:24 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20200114124956.GN20978@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1579125873; bh=THfPEihvnXha/ZAsoeHLMyQALJLZvNsiB8lapA3uV7s=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=aK0r0qzRe3LL4PZNNQF34X9swSBE5W0PHzaJ16joN7727655IDaVZCMY7EekgCaUu
 1RFbSpx/YbAPzUYrwRhZIng2dmhPiu/9QTQAjShtmI96eN6fTIEMxqZX/c+XJMLHrL
 kh+A0oXsJioOBNrZZN5C1D4GRmuVf4DsYTs7lGO+OvdEqbiMZdXyjSWf4ouXIwfy46
 whLa+qWHzzwdEkWxOIm8KdlGeh1keYvkMXk1LUeHqZseIwAo19ZOveJVl0bIu0zGnY
 psGlkKBjVp9U9sYpKqnKMB3qpI8EgEprrf1FYOxFEWiDVE/nUIe0g2m9UN8F4A5E/X
 53r6K6Lc6ZTVA==
Subject: Re: [Nouveau] [PATCH v6 4/6] mm/mmu_notifier: add
 mmu_interval_notifier_find()
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
Cc: "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 1/14/20 4:49 AM, Jason Gunthorpe wrote:
> On Mon, Jan 13, 2020 at 02:47:01PM -0800, Ralph Campbell wrote:
>> diff --git a/mm/mmu_notifier.c b/mm/mmu_notifier.c
>> index 47ad9cc89aab..4efecc0f13cb 100644
>> +++ b/mm/mmu_notifier.c
>> @@ -1171,6 +1171,39 @@ void mmu_interval_notifier_update(struct mmu_interval_notifier *mni,
>>   }
>>   EXPORT_SYMBOL_GPL(mmu_interval_notifier_update);
>>   
>> +struct mmu_interval_notifier *mmu_interval_notifier_find(struct mm_struct *mm,
>> +				const struct mmu_interval_notifier_ops *ops,
>> +				unsigned long start, unsigned long last)
>> +{
>> +	struct mmu_notifier_mm *mmn_mm = mm->mmu_notifier_mm;
>> +	struct interval_tree_node *node;
>> +	struct mmu_interval_notifier *mni;
>> +	struct mmu_interval_notifier *res = NULL;
>> +
>> +	spin_lock(&mmn_mm->lock);
>> +	node = interval_tree_iter_first(&mmn_mm->itree, start, last);
>> +	if (node) {
>> +		mni = container_of(node, struct mmu_interval_notifier,
>> +				   interval_tree);
>> +		while (true) {
>> +			if (mni->ops == ops) {
>> +				res = mni;
>> +				break;
>> +			}
>> +			node = interval_tree_iter_next(&mni->interval_tree,
>> +						       start, last);
>> +			if (!node)
>> +				break;
>> +			mni = container_of(node, struct mmu_interval_notifier,
>> +					   interval_tree);
>> +		}
>> +	}
>> +	spin_unlock(&mmn_mm->lock);
> 
> This doesn't seem safe at all, here we are returning a pointer to
> memory from the interval tree with out any kind of lifetime
> protection.

It is memory that the driver has allocated and has full control over
the lifetime since the driver does all the insertions and removals.
The driver does have to hold the HW page table lock so lookups are
synchronized with interval insertions and removals and page table
entry insertions and removals.

> If the interval tree is read it must be left in the read lock state
> until the caller is done with the pointer.
> 
> .. and this poses all sorts of questions about consistency with items
> on the deferred list. Should find return an item undergoing deletion?

I don't think so. The deferred operations are all complete when
mmu_interval_read_begin() returns, and the sequence number check
with mmu_interval_read_retry() guarantees there have been no changes
while not holding the driver page table lock and calling hmm_range_fault().

> Should find return items using the old interval tree values or their
> new updated values?
> 
> Jason

I think it should only look at the old interval tree and not the deferred
insert/remove/updates as explained above.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
