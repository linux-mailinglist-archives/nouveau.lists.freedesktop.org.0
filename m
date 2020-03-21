Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9896F18E25A
	for <lists+nouveau@lfdr.de>; Sat, 21 Mar 2020 16:18:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7C1F96E1F7;
	Sat, 21 Mar 2020 15:18:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20BA6E1F7;
 Sat, 21 Mar 2020 15:18:29 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 264F468BEB; Sat, 21 Mar 2020 16:18:26 +0100 (CET)
Date: Sat, 21 Mar 2020 16:18:25 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200321151825.GA7692@lst.de>
References: <20200316193216.920734-1-hch@lst.de>
 <20200316193216.920734-5-hch@lst.de> <20200320134109.GA30230@ziepe.ca>
 <20200321082236.GB28613@lst.de> <20200321123804.GV20941@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200321123804.GV20941@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 4/4] mm: check the device private page owner
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

On Sat, Mar 21, 2020 at 09:38:04AM -0300, Jason Gunthorpe wrote:
> > I don't think there is any specific protection.  Let me see if we
> > can throw in a get_dev_pagemap here
> 
> The page tables are RCU protected right? could we do something like
> 
>  if (is_device_private_entry()) {
>        rcu_read_lock()
>        if (READ_ONCE(*ptep) != pte)
>            return -EBUSY;
>        hmm_is_device_private_entry()
>        rcu_read_unlock()
>  }
> 
> ?

Are they everywhere?  I'd really love to hear from people that really
know this ara..

> 
> Then pgmap needs a synchronize_rcu before the struct page's are
> destroyed (possibly gup_fast already requires this?)
> 
> I've got some other patches trying to close some of these styles of
> bugs, but 
> 
> > note that current mainline doesn't even use it for this path..
> 
> Don't follow?

If you look at mainline (or any other tree), we only do a
get_dev_pagemap for devmap ptes.  But device private pages are encoded
as non-present swap ptes.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
