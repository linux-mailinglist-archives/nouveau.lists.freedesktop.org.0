Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DFE7C1874C6
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 22:34:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC5A76E22D;
	Mon, 16 Mar 2020 21:33:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D54766E22D;
 Mon, 16 Mar 2020 21:33:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EF2A268CEC; Mon, 16 Mar 2020 22:33:53 +0100 (CET)
Date: Mon, 16 Mar 2020 22:33:53 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200316213353.GA28441@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-4-hch@lst.de> <20200316195923.GA26988@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316195923.GA26988@ziepe.ca>
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
Cc: amd-gfx@lists.freedesktop.org, nouveau@lists.freedesktop.org,
 dri-devel@lists.freedesktop.org, kvm-ppc@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Dan Williams <dan.j.williams@intel.com>,
 Bharata B Rao <bharata@linux.ibm.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Mar 16, 2020 at 04:59:23PM -0300, Jason Gunthorpe wrote:
> However, between patch 3 and 4 doesn't this break amd gpu as it will
> return device_private pages now if not requested? Squash the two?

No change in behavior in this patch as long as HMM_PFN_DEVICE_PRIVATE
isn't set in ->pfns or ->default_flags, which is the case for both
nouveau and amdgpu.  The existing behavior is broken for private
pages not known to the driver, but that is fixed in the next patch.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
