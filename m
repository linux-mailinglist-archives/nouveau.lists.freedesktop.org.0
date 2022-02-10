Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7FA44B1193
	for <lists+nouveau@lfdr.de>; Thu, 10 Feb 2022 16:23:15 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AEF410E895;
	Thu, 10 Feb 2022 15:23:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B2F210E895;
 Thu, 10 Feb 2022 15:23:12 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4F79068AFE; Thu, 10 Feb 2022 16:23:08 +0100 (CET)
Date: Thu, 10 Feb 2022 16:23:08 +0100
From: Christoph Hellwig <hch@lst.de>
To: Alistair Popple <apopple@nvidia.com>
Message-ID: <20220210152308.GA13344@lst.de>
References: <20220210072828.2930359-1-hch@lst.de>
 <20220210072828.2930359-14-hch@lst.de> <2160837.zdNQNePZV9@nvdebian>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2160837.zdNQNePZV9@nvdebian>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 13/27] mm: move the migrate_vma_* device
 migration code into it's own file
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
Cc: nvdimm@lists.linux.dev, Ralph Campbell <rcampbell@nvidia.com>,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Felix Kuehling <Felix.Kuehling@amd.com>, "Pan,
 Xinhui" <Xinhui.Pan@amd.com>, Dan Williams <dan.j.williams@intel.com>,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 Christoph Hellwig <hch@lst.de>, Jason Gunthorpe <jgg@ziepe.ca>,
 Ben Skeggs <bskeggs@redhat.com>, Alex Deucher <alexander.deucher@amd.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 Logan Gunthorpe <logang@deltatee.com>,
 Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thu, Feb 10, 2022 at 09:35:10PM +1100, Alistair Popple wrote:
> I got the following build error:
> 
> /data/source/linux/mm/migrate_device.c: In function ‘migrate_vma_collect_pmd’:
> /data/source/linux/mm/migrate_device.c:242:3: error: implicit declaration of function ‘flush_tlb_range’; did you mean ‘flush_pmd_tlb_range’? [-Werror=implicit-function-declaration]
>   242 |   flush_tlb_range(walk->vma, start, end);
>       |   ^~~~~~~~~~~~~~~
>       |   flush_pmd_tlb_range
> 
> Including asm/tlbflush.h in migrate_device.c fixed it for me.

Yes, the buildbot also complained about this, but somehow in my test
configfs it got pulled in implicitly.
