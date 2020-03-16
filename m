Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F282187227
	for <lists+nouveau@lfdr.de>; Mon, 16 Mar 2020 19:20:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 385B76E49D;
	Mon, 16 Mar 2020 18:20:44 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E96326E49D;
 Mon, 16 Mar 2020 18:20:42 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E7A4568BFE; Mon, 16 Mar 2020 19:20:39 +0100 (CET)
Date: Mon, 16 Mar 2020 19:20:39 +0100
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20200316182039.GA24736@lst.de>
References: <20200316175259.908713-1-hch@lst.de>
 <20200316175259.908713-2-hch@lst.de> <20200316181707.GJ20941@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200316181707.GJ20941@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 1/2] mm: handle multiple owners of device
 private pages in migrate_vma
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

On Mon, Mar 16, 2020 at 03:17:07PM -0300, Jason Gunthorpe wrote:
> On Mon, Mar 16, 2020 at 06:52:58PM +0100, Christoph Hellwig wrote:
> > Add a new opaque owner field to struct dev_pagemap, which will allow
> > the hmm and migrate_vma code to identify who owns ZONE_DEVICE memory,
> > and refuse to work on mappings not owned by the calling entity.
> 
> Using a pointer seems like a good solution to me.
> 
> Is this a bug fix? What is the downside for migrate on pages it
> doesn't work? I'm not up to speed on migrate..

migrating private pages not owned by driver simply won't work, as
the device can't access it.  Even inside the same driver say
GPU A can't just migrate CPU B's memory.  In that sense it is
a bug fix for the rather unlikely case of using the experimental
nouveau with multiple GPUs, or in a power secure VM (if that is
even possible).
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
