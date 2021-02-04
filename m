Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42B3230F518
	for <lists+nouveau@lfdr.de>; Thu,  4 Feb 2021 15:37:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04E1B6ED8D;
	Thu,  4 Feb 2021 14:37:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id CACDF6E04B;
 Thu,  4 Feb 2021 11:49:32 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E69ABD6E;
 Thu,  4 Feb 2021 03:49:31 -0800 (PST)
Received: from [10.57.49.26] (unknown [10.57.49.26])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6C76A3F73B;
 Thu,  4 Feb 2021 03:49:25 -0800 (PST)
To: Christoph Hellwig <hch@lst.de>, Dongli Zhang <dongli.zhang@oracle.com>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-3-dongli.zhang@oracle.com>
 <20210204072947.GA29812@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <b46ddefe-d91a-fa6a-0e0d-cf1edc343c2e@arm.com>
Date: Thu, 4 Feb 2021 11:49:23 +0000
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.7.0
MIME-Version: 1.0
In-Reply-To: <20210204072947.GA29812@lst.de>
Content-Language: en-GB
X-Mailman-Approved-At: Thu, 04 Feb 2021 14:37:30 +0000
Subject: Re: [Nouveau] [PATCH RFC v1 2/6] swiotlb: convert variables to
 arrays
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
Cc: ulf.hansson@linaro.org, airlied@linux.ie, benh@kernel.crashing.org,
 joonas.lahtinen@linux.intel.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, bhelgaas@google.com, paulus@samba.org,
 hpa@zytor.com, mingo@kernel.org, m.szyprowski@samsung.com,
 sstabellini@kernel.org, adrian.hunter@intel.com, mpe@ellerman.id.au,
 x86@kernel.org, joe.jin@oracle.com, peterz@infradead.org, mingo@redhat.com,
 bskeggs@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, nouveau@lists.freedesktop.org,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 chris@chris-wilson.co.uk, jgross@suse.com, tsbogend@alpha.franken.de,
 linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, tglx@linutronix.de, bauerman@linux.ibm.com,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2021-02-04 07:29, Christoph Hellwig wrote:
> On Wed, Feb 03, 2021 at 03:37:05PM -0800, Dongli Zhang wrote:
>> This patch converts several swiotlb related variables to arrays, in
>> order to maintain stat/status for different swiotlb buffers. Here are
>> variables involved:
>>
>> - io_tlb_start and io_tlb_end
>> - io_tlb_nslabs and io_tlb_used
>> - io_tlb_list
>> - io_tlb_index
>> - max_segment
>> - io_tlb_orig_addr
>> - no_iotlb_memory
>>
>> There is no functional change and this is to prepare to enable 64-bit
>> swiotlb.
> 
> Claire Chang (on Cc) already posted a patch like this a month ago,
> which looks much better because it actually uses a struct instead
> of all the random variables.

Indeed, I skimmed the cover letter and immediately thought that this 
whole thing is just the restricted DMA pool concept[1] again, only from 
a slightly different angle.

Robin.

[1] 
https://lore.kernel.org/linux-iommu/20210106034124.30560-1-tientzu@chromium.org/
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
