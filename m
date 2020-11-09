Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5842AB354
	for <lists+nouveau@lfdr.de>; Mon,  9 Nov 2020 10:14:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAFE489182;
	Mon,  9 Nov 2020 09:14:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA7789182
 for <nouveau@lists.freedesktop.org>; Mon,  9 Nov 2020 09:14:24 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BBE6E68B05; Mon,  9 Nov 2020 10:14:20 +0100 (CET)
Date: Mon, 9 Nov 2020 10:14:15 +0100
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20201109091415.GC28918@lst.de>
References: <20201106005147.20113-1-rcampbell@nvidia.com>
 <20201106005147.20113-4-rcampbell@nvidia.com> <20201106080322.GE31341@lst.de>
 <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a7b8b90c-09b7-2009-0784-908b61f61ef2@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v3 3/6] mm: support THP migration to device
 private memory
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
Cc: Yang Shi <yang.shi@linux.alibaba.com>, Jason Gunthorpe <jgg@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 linux-kernel@vger.kernel.org, Bharata B Rao <bharata@linux.ibm.com>,
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 linux-kselftest@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Zi Yan <ziy@nvidia.com>, Shuah Khan <shuah@kernel.org>,
 Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Fri, Nov 06, 2020 at 01:26:50PM -0800, Ralph Campbell wrote:
>
> On 11/6/20 12:03 AM, Christoph Hellwig wrote:
>> I hate the extra pin count magic here.  IMHO we really need to finish
>> off the series to get rid of the extra references on the ZONE_DEVICE
>> pages first.
>
> First, thanks for the review comments.
>
> I don't like the extra refcount either, that is why I tried to fix that up
> before resending this series. However, you didn't like me just fixing the
> refcount only for device private pages and I don't know the dax/pmem code
> and peer-to-peer PCIe uses of ZONE_DEVICE pages well enough to say how
> long it will take me to fix all the use cases.
> So I wanted to make progress on the THP migration code in the mean time.

I think P2P is pretty trivial, given that ZONE_DEVICE pages are used like
a normal memory allocator.  DAX is the interesting case, any specific
help that you need with that?
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
