Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362B21897FB
	for <lists+nouveau@lfdr.de>; Wed, 18 Mar 2020 10:34:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 576D46E884;
	Wed, 18 Mar 2020 09:34:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88ABD6E3AE;
 Wed, 18 Mar 2020 09:34:32 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id CF1E568C65; Wed, 18 Mar 2020 10:34:28 +0100 (CET)
Date: Wed, 18 Mar 2020 10:34:28 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20200318093428.GA6538@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de>
 <7256f88d-809e-4aba-3c46-a223bd8cc521@nvidia.com>
 <20200317073454.GA5843@lst.de>
 <a8c5a33d-4c64-df74-2b98-26ddd5e6da00@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a8c5a33d-4c64-df74-2b98-26ddd5e6da00@nvidia.com>
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

On Tue, Mar 17, 2020 at 03:43:47PM -0700, Ralph Campbell wrote:
>> Obviously no driver cared for that so far.  Once we have test cases
>> for that and thus testable code we can add code to fault it in from
>> hmm_vma_handle_pte.
>>
>
> I'm OK with the series. I think I would have been less confused if I looked at
> patch 4 then 3.

I guess I could just merge 3 and 4 if it is too confusing otherwise.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
