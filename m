Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 517F812B310
	for <lists+nouveau@lfdr.de>; Fri, 27 Dec 2019 09:15:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D7746E159;
	Fri, 27 Dec 2019 08:14:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqemgate14.nvidia.com (hqemgate14.nvidia.com [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8F26F595;
 Sat, 23 Nov 2019 00:54:12 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqemgate14.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5dd883360002>; Fri, 22 Nov 2019 16:54:14 -0800
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Fri, 22 Nov 2019 16:54:11 -0800
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Fri, 22 Nov 2019 16:54:11 -0800
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Sat, 23 Nov 2019 00:54:09 +0000
To: Jason Gunthorpe <jgg@mellanox.com>, Christoph Hellwig <hch@infradead.org>
References: <20191112202231.3856-1-jgg@ziepe.ca>
 <20191112202231.3856-3-jgg@ziepe.ca> <20191113135952.GB20531@infradead.org>
 <20191113164620.GG21728@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <cc5d4d76-df30-af7f-931c-eed8a7ada122@nvidia.com>
Date: Fri, 22 Nov 2019 16:54:08 -0800
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.0
MIME-Version: 1.0
In-Reply-To: <20191113164620.GG21728@mellanox.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1574470455; bh=bqXekT37QvQAiJj5unYfuv1fXYv5e9H7W3TE2f93DwM=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=GMQ2nBly/CsGkp3ClF3KTIJ1E88XFlogU0CKPbHKGfneOIgU32/QzyXGWCpi3ck0H
 UKmUjmgchhEpox9obaO4j3qQTTw6eSQygxCGNnxcaBK+BVpFaWRZVbrcittwqkbErs
 WJejHNJfQFwe6vLEnMD7C7HfZFs1YXQJh9yBGuilTWYTnXvxIDNykws8BWZk+SAp+S
 d+PBZV9+4/p5SkfIZLXh92wH6ivVMDsbJ2ewuKYIY2bfdn7qLRuC5hVl19t8Vx8dG/
 mVxeh0/CSHrPHgSQLh5+W8xVMKh8hIouqwSbqQwT0va/zbM7kkP01A2Fu3LxQSm5r1
 PfohngEf3JGCQ==
X-Mailman-Approved-At: Fri, 27 Dec 2019 08:13:31 +0000
Subject: Re: [Nouveau] [PATCH v3 02/14] mm/mmu_notifier: add an interval
 tree notifier
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
Cc: Juergen Gross <jgross@suse.com>, David Zhou <David1.Zhou@amd.com>,
 Mike Marciniszyn <mike.marciniszyn@intel.com>,
 Stefano Stabellini <sstabellini@kernel.org>, Philip Yang <Philip.Yang@amd.com>,
 Oleksandr Andrushchenko <oleksandr_andrushchenko@epam.com>,
 "linux-rdma@vger.kernel.org" <linux-rdma@vger.kernel.org>,
 "Felix.Kuehling@amd.com" <Felix.Kuehling@amd.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Dennis
 Dalessandro <dennis.dalessandro@intel.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Alex Deucher <alexander.deucher@amd.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 Boris Ostrovsky <boris.ostrovsky@oracle.com>, Petr Cvek <petrcvekcz@gmail.com>,
 =?UTF-8?Q?Christian_K=c3=b6nig?= <christian.koenig@amd.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>


On 11/13/19 8:46 AM, Jason Gunthorpe wrote:
> On Wed, Nov 13, 2019 at 05:59:52AM -0800, Christoph Hellwig wrote:
>>> +int mmu_interval_notifier_insert(struct mmu_interval_notifier *mni,
>>> +				      struct mm_struct *mm, unsigned long start,
>>> +				      unsigned long length,
>>> +				      const struct mmu_interval_notifier_ops *ops);
>>> +int mmu_interval_notifier_insert_locked(
>>> +	struct mmu_interval_notifier *mni, struct mm_struct *mm,
>>> +	unsigned long start, unsigned long length,
>>> +	const struct mmu_interval_notifier_ops *ops);
>>
>> Very inconsistent indentation between these two related functions.
> 
> clang-format.. The kernel config is set to prefer a line up under the
> ( if all the arguments will fit within the 80 cols otherwise it does a
> 1 tab continuation indent.
> 
>>> +	/*
>>> +	 * The inv_end incorporates a deferred mechanism like
>>> +	 * rtnl_unlock(). Adds and removes are queued until the final inv_end
>>> +	 * happens then they are progressed. This arrangement for tree updates
>>> +	 * is used to avoid using a blocking lock during
>>> +	 * invalidate_range_start.
>>
>> Nitpick:  That comment can be condensed into one less line:
> 
> The rtnl_unlock can move up a line too. My editor is failing me on
> this.
> 
>>> +	/*
>>> +	 * TODO: Since we already have a spinlock above, this would be faster
>>> +	 * as wake_up_q
>>> +	 */
>>> +	if (need_wake)
>>> +		wake_up_all(&mmn_mm->wq);
>>
>> So why is this important enough for a TODO comment, but not important
>> enough to do right away?
> 
> Lets drop the comment, I'm noto sure wake_up_q is even a function this
> layer should be calling.

Actually, I think you can remove the "need_wake" variable since it is
unconditionally set to "true".

Also, the comment in__mmu_interval_notifier_insert() says
"mni->mr_invalidate_seq" and I think that should be
"mni->invalidate_seq".
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
