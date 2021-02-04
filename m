Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BEFBE30F517
	for <lists+nouveau@lfdr.de>; Thu,  4 Feb 2021 15:37:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDE656ED8A;
	Thu,  4 Feb 2021 14:37:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 375 seconds by postgrey-1.36 at gabe;
 Thu, 04 Feb 2021 07:36:10 UTC
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D82226ECE5;
 Thu,  4 Feb 2021 07:36:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DD16068AFE; Thu,  4 Feb 2021 08:29:47 +0100 (CET)
Date: Thu, 4 Feb 2021 08:29:47 +0100
From: Christoph Hellwig <hch@lst.de>
To: Dongli Zhang <dongli.zhang@oracle.com>
Message-ID: <20210204072947.GA29812@lst.de>
References: <20210203233709.19819-1-dongli.zhang@oracle.com>
 <20210203233709.19819-3-dongli.zhang@oracle.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210203233709.19819-3-dongli.zhang@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
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
 hpa@zytor.com, hch@lst.de, m.szyprowski@samsung.com, sstabellini@kernel.org,
 adrian.hunter@intel.com, mpe@ellerman.id.au, x86@kernel.org,
 joe.jin@oracle.com, mingo@kernel.org, peterz@infradead.org, mingo@redhat.com,
 bskeggs@redhat.com, linux-pci@vger.kernel.org, xen-devel@lists.xenproject.org,
 matthew.auld@intel.com, thomas.lendacky@amd.com, konrad.wilk@oracle.com,
 intel-gfx@lists.freedesktop.org, jani.nikula@linux.intel.com, bp@alien8.de,
 rodrigo.vivi@intel.com, nouveau@lists.freedesktop.org,
 Claire Chang <tientzu@chromium.org>, boris.ostrovsky@oracle.com,
 chris@chris-wilson.co.uk, jgross@suse.com, tsbogend@alpha.franken.de,
 robin.murphy@arm.com, linux-mmc@vger.kernel.org, linux-mips@vger.kernel.org,
 iommu@lists.linux-foundation.org, tglx@linutronix.de, bauerman@linux.ibm.com,
 daniel@ffwll.ch, akpm@linux-foundation.org, linuxppc-dev@lists.ozlabs.org,
 rppt@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Wed, Feb 03, 2021 at 03:37:05PM -0800, Dongli Zhang wrote:
> This patch converts several swiotlb related variables to arrays, in
> order to maintain stat/status for different swiotlb buffers. Here are
> variables involved:
> 
> - io_tlb_start and io_tlb_end
> - io_tlb_nslabs and io_tlb_used
> - io_tlb_list
> - io_tlb_index
> - max_segment
> - io_tlb_orig_addr
> - no_iotlb_memory
> 
> There is no functional change and this is to prepare to enable 64-bit
> swiotlb.

Claire Chang (on Cc) already posted a patch like this a month ago,
which looks much better because it actually uses a struct instead
of all the random variables. 
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
