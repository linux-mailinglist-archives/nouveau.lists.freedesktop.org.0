Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C450187A90
	for <lists+nouveau@lfdr.de>; Tue, 17 Mar 2020 08:35:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 686586E084;
	Tue, 17 Mar 2020 07:34:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F33D6E084;
 Tue, 17 Mar 2020 07:34:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 46FA068BFE; Tue, 17 Mar 2020 08:34:54 +0100 (CET)
Date: Tue, 17 Mar 2020 08:34:54 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200317073454.GA5843@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 3/4] mm: simplify device private page handling
 in hmm_range_fault
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
Cc: amd-gfx@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 kvm-ppc@vger.kernel.org, Christoph Hellwig <hch@lst.de>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 03:49:51PM -0700, Ralph Campbell wrote:
> On 3/16/20 12:32 PM, Christoph Hellwig wrote:
>> Remove the code to fault device private pages back into system memory
>> that has never been used by any driver.  Also replace the usage of the
>> HMM_PFN_DEVICE_PRIVATE flag in the pfns array with a simple
>> is_device_private_page check in nouveau.
>>
>> Signed-off-by: Christoph Hellwig <hch@lst.de>
>
> Getting rid of HMM_PFN_DEVICE_PRIVATE seems reasonable to me since a driver can
> look at the struct page but what if a driver needs to fault in a page from
> another device's private memory? Should it call handle_mm_fault()?

Obviously no driver cared for that so far.  Once we have test cases
for that and thus testable code we can add code to fault it in from
hmm_vma_handle_pte.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
