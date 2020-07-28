Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 794D023154F
	for <lists+nouveau@lfdr.de>; Wed, 29 Jul 2020 00:04:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB6536E0A6;
	Tue, 28 Jul 2020 22:04:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate24.nvidia.com (hqnvemgate24.nvidia.com
 [216.228.121.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B136C6E0A6
 for <nouveau@lists.freedesktop.org>; Tue, 28 Jul 2020 22:04:08 +0000 (UTC)
Received: from hqpgpgate102.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate24.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5f20a07c0001>; Tue, 28 Jul 2020 15:02:37 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate102.nvidia.com (PGP Universal service);
 Tue, 28 Jul 2020 15:04:08 -0700
X-PGP-Universal: processed;
 by hqpgpgate102.nvidia.com on Tue, 28 Jul 2020 15:04:08 -0700
Received: from rcampbell-dev.nvidia.com (172.20.13.39) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3;
 Tue, 28 Jul 2020 22:04:07 +0000
To: Jason Gunthorpe <jgg@nvidia.com>
References: <20200723223004.9586-1-rcampbell@nvidia.com>
 <20200723223004.9586-7-rcampbell@nvidia.com>
 <20200728191940.GB159104@nvidia.com>
From: Ralph Campbell <rcampbell@nvidia.com>
X-Nvconfidentiality: public
Message-ID: <7f947311-0034-9148-1dca-fb9b9a10abc4@nvidia.com>
Date: Tue, 28 Jul 2020 15:04:07 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200728191940.GB159104@nvidia.com>
X-Originating-IP: [172.20.13.39]
X-ClientProxiedBy: HQMAIL107.nvidia.com (172.20.187.13) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1595973757; bh=/SJLjz3sSojWpQDSgpd98PBZSzygYVyi0IyMMu3098s=;
 h=X-PGP-Universal:Subject:To:CC:References:From:X-Nvconfidentiality:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=ACf688s9+SjBxSf7fmZ59OUOxsFr0aodwetE6vjiN3BSvfUh26jfqaij77JSfuUxk
 C+2kAu0JK8VdhOO2EMdO0B2hwaF+RTB8IePsEeV9XqoFWgM/k2zxr9uUgi19VygFGC
 NOCCpCMievqTSnfBvUbGgmTXECwgTIc7Y6xkY6QxDV6hqSSCla9FI9J+d0NF7ZjAOZ
 LXVcHTXQ224Ne6ban7+xPuMW9EizeFpXd48iSElVr/BNh0YC1w7YUQkUhGJwu6mvwM
 1TsK9+NZHWGS3VKoYqhn8Q90dsDliikSJWhetqxMhIHNA+09UosK4kHx9fdSWGbpLX
 JJn0TR+sTY22w==
Subject: Re: [Nouveau] [PATCH v4 6/6] mm/migrate: remove range invalidation
 in migrate_vma_pages()
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


On 7/28/20 12:19 PM, Jason Gunthorpe wrote:
> On Thu, Jul 23, 2020 at 03:30:04PM -0700, Ralph Campbell wrote:
>> When migrating the special zero page, migrate_vma_pages() calls
>> mmu_notifier_invalidate_range_start() before replacing the zero page
>> PFN in the CPU page tables. This is unnecessary since the range was
>> invalidated in migrate_vma_setup() and the page table entry is checked
>> to be sure it hasn't changed between migrate_vma_setup() and
>> migrate_vma_pages(). Therefore, remove the redundant invalidation.
> 
> I don't follow this logic, the purpose of the invalidation is also to
> clear out anything that may be mirroring this VA, and "the page hasn't
> changed" doesn't seem to rule out that case?
> 
> I'm also not sure I follow where the zero page came from?

The zero page comes from an anonymous private VMA that is read-only
and the user level CPU process tries to read the page data (or any
other read page fault).

> Jason
> 

The overall migration process is:

mmap_read_lock()

migrate_vma_setup()
       // invalidates range, locks/isolates pages, puts migration entry in page table

<driver allocates destination pages and copies source to dest>

migrate_vma_pages()
       // moves source struct page info to destination struct page info.
       // clears migration flag for pages that can't be migrated.

<driver updates device page tables for pages still migrating, rollback pages not migrating>

migrate_vma_finalize()
       // replaces migration page table entry with destination page PFN.

mmap_read_unlock()

Since the address range is invalidated in the migrate_vma_setup() stage,
and the page is isolated from the LRU cache, locked, unmapped, and the page table
holds a migration entry (so the page can't be faulted and the CPU page table set
valid again), and there are no extra page references (pins), the page
"should not be modified".

For pte_none()/is_zero_pfn() entries, migrate_vma_setup() leaves the
pte_none()/is_zero_pfn() entry in place but does still call
mmu_notifier_invalidate_range_start() for the whole range being migrated.

In the migrate_vma_pages() step, the pte page table is locked and the
pte entry checked to be sure it is still pte_none/is_zero_pfn(). If not,
the new page isn't inserted. If it is still none/zero, the new device private
struct page is inserted into the page table, replacing the pte_none()/is_zero_pfn()
page table entry. The secondary MMUs were already invalidated in the migrate_vma_setup()
step and a pte_none() or zero page can't be modified so the only invalidation needed
is the CPU TLB(s) for clearing the special zero page PTE entry.

Two devices could both try to do the migrate_vma_*() sequence and proceed in parallel up
to the migrate_vma_pages() step and try to install a new page for the hole/zero PTE but
only one will win and the other fail.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
