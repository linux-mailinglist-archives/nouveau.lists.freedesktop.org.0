Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 768B2203D48
	for <lists+nouveau@lfdr.de>; Mon, 22 Jun 2020 18:59:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3F0F89B96;
	Mon, 22 Jun 2020 16:59:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate26.nvidia.com (hqnvemgate26.nvidia.com
 [216.228.121.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A81D789B96
 for <nouveau@lists.freedesktop.org>; Mon, 22 Jun 2020 16:59:01 +0000 (UTC)
Received: from hqpgpgate101.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate26.nvidia.com (using TLS: TLSv1.2, DES-CBC3-SHA)
 id <B5ef0e3480000>; Mon, 22 Jun 2020 09:58:48 -0700
Received: from hqmail.nvidia.com ([172.20.161.6])
 by hqpgpgate101.nvidia.com (PGP Universal service);
 Mon, 22 Jun 2020 09:59:01 -0700
X-PGP-Universal: processed;
 by hqpgpgate101.nvidia.com on Mon, 22 Jun 2020 09:59:01 -0700
Received: from rcampbell-dev.nvidia.com (10.124.1.5) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Mon, 22 Jun
 2020 16:58:54 +0000
To: Jason Gunthorpe <jgg@mellanox.com>
References: <20200619215649.32297-1-rcampbell@nvidia.com>
 <20200622123947.GC2590509@mellanox.com>
X-Nvconfidentiality: public
From: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <05bcdcd7-d17b-9092-1a9c-759fb0eab728@nvidia.com>
Date: Mon, 22 Jun 2020 09:58:54 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.2.2
MIME-Version: 1.0
In-Reply-To: <20200622123947.GC2590509@mellanox.com>
X-Originating-IP: [10.124.1.5]
X-ClientProxiedBy: HQMAIL101.nvidia.com (172.20.187.10) To
 HQMAIL107.nvidia.com (172.20.187.13)
Content-Language: en-US
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1592845128; bh=17rmJOZx2NuUvyVDIKMt8wguy1oUyTRKNcnhF9ewJgU=;
 h=X-PGP-Universal:Subject:To:CC:References:X-Nvconfidentiality:From:
 Message-ID:Date:User-Agent:MIME-Version:In-Reply-To:
 X-Originating-IP:X-ClientProxiedBy:Content-Type:Content-Language:
 Content-Transfer-Encoding;
 b=rwo9R4gFj7zEIuYXLuR8sMIDq669bABVnTdSwAYO0cdeo2tW8lCTawdU2ufryO5gF
 TihfxNdj7WV0NLbF2cwCoY+9bQwqoKgpyRQZbZDBnr8oRJto2vtsDB8nq3YKnbCXjK
 S/uT/aAPAzmPVQU3ymyYvZSxHqUFtJxS3GDJvYhevPLnQs68Nm7fcnzgheqizzkEKG
 6aC/rTKNMF2zZNlj8LJaUFNmhRIkIEe5FrlRhUYZ+1anzI+NOgdtFQf5t2jPzzFcOB
 R1Z68hKNEXvJIC2clDRCVFbEeB2PSf95gbtf8ZlCxVHaGZSk2HTN7djCwV/nWvvK6u
 W8sju/hNTpTkQ==
Subject: Re: [Nouveau] [PATCH 00/16] mm/hmm/nouveau: THP mapping and
 migration
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


On 6/22/20 5:39 AM, Jason Gunthorpe wrote:
> On Fri, Jun 19, 2020 at 02:56:33PM -0700, Ralph Campbell wrote:
>> These patches apply to linux-5.8.0-rc1. Patches 1-3 should probably go
>> into 5.8, the others can be queued for 5.9. Patches 4-6 improve the HMM
>> self tests. Patch 7-8 prepare nouveau for the meat of this series which
>> adds support and testing for compound page mapping of system memory
>> (patches 9-11) and compound page migration to device private memory
>> (patches 12-16). Since these changes are split across mm core, nouveau,
>> and testing, I'm guessing Jason Gunthorpe's HMM tree would be appropriate.
> 
> You need to break this up into parts that go where they need to
> go. Nouveau rc changes should go to DRM or some series needs to
> explain the linkage
> 
>> Ralph Campbell (16):
>>    mm: fix migrate_vma_setup() src_owner and normal pages
>>    nouveau: fix migrate page regression
>>    nouveau: fix mixed normal and device private page migration
>>    mm/hmm: fix test timeout on slower machines
>>    mm/hmm/test: remove redundant page table invalidate
>>    mm/hmm: test mixed normal and device private migrations
>>    nouveau: make nvkm_vmm_ctor() and nvkm_mmu_ptp_get() static
>>    nouveau/hmm: fault one page at a time
>>    mm/hmm: add output flag for compound page mapping
>>    nouveau/hmm: support mapping large sysmem pages
>>    hmm: add tests for HMM_PFN_COMPOUND flag
>>    mm/hmm: optimize migrate_vma_setup() for holes
> 
> Order things so it is hmm, test, noeveau
> 
>>    mm: support THP migration to device private memory
>>    mm/thp: add THP allocation helper
>>    mm/hmm/test: add self tests for THP migration
>>    nouveau: support THP migration to private memory
> 
> This is another series, you should split it even if it has to go
> through the hmm tree
> 
> Jason

Thanks. I thought there was probably a better way to submit this but
I posted everything so people could see how it all fit together.

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
