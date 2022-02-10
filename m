Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9517D4B0686
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 07:45:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DD3BF10E715;
	Thu, 10 Feb 2022 06:45:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E27810E715;
 Thu, 10 Feb 2022 06:45:26 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DE15A68BFE; Thu, 10 Feb 2022 07:45:19 +0100 (CET)
Date: Thu, 10 Feb 2022 07:45:19 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20220210064519.GA3692@lst.de>
References: <20220207063249.1833066-1-hch@lst.de>
 <3287da2f-defa-9adb-e21c-c498972e674d@amd.com>
 <20220209174836.GA24864@lst.de> <2168128.7o4XcKHI9n@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2168128.7o4XcKHI9n@nvdebian>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 6/8] mm: don't include <linux/memremap.h> in
 <linux/mm.h>
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
Cc: dri-devel@lists.freedesktop.org, nvdimm@lists.linux.dev,
 Ralph Campbell <rcampbell@nvidia.com>,
 Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <felix.kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, linux-kernel@vger.kernel.org,
 amd-gfx@lists.freedesktop.org,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Alex Deucher <alexander.deucher@amd.com>,
 Dan Williams <dan.j.williams@intel.com>, Logan Gunthorpe <logang@deltatee.com>,
 Christoph Hellwig <hch@lst.de>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 01:10:47PM +1100, Alistair Popple wrote:
> diff --git a/mm/gup.c b/mm/gup.c
> index cbb49abb7992..8e85c9fb8df4 100644
> --- a/mm/gup.c
> +++ b/mm/gup.c
> @@ -2007,7 +2007,6 @@ static long check_and_migrate_movable_pages(unsigned long nr_pages,
>  	if (!ret && list_empty(&movable_page_list) && !isolation_error_count)
>  		return nr_pages;
>  
> -	ret = 0;
>  unpin_pages:

This isn't quite correct as ret is initially set to -EFAULT now.  I'll
fix it by removing the early ret initialization and always using the
goto. I've also added another refactoring patch for this messy function.

I've folded the inversion of the is_device_coherent_page check in
migrate.c in as well, thanks!
