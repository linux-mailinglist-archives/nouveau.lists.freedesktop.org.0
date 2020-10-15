Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6C928EDD8
	for <lists+nouveau@lfdr.de>; Thu, 15 Oct 2020 09:44:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 904FA6EC2F;
	Thu, 15 Oct 2020 07:44:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E22D56EC2F
 for <nouveau@lists.freedesktop.org>; Thu, 15 Oct 2020 07:44:27 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0DBFA68AFE; Thu, 15 Oct 2020 09:44:24 +0200 (CEST)
Date: Thu, 15 Oct 2020 09:44:23 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20201015074423.GC14082@lst.de>
References: <20201012174540.17328-1-rcampbell@nvidia.com>
 <CAPcyv4ijD+=3rje1CfSG4XKuRNfuAWOui93NQV09NmBte_gc0w@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4ijD+=3rje1CfSG4XKuRNfuAWOui93NQV09NmBte_gc0w@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH v2] mm/hmm: make device private reference
 counts zero based
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 Yang Shi <yang.shi@linux.alibaba.com>, Zi Yan <ziy@nvidia.com>,
 nouveau@lists.freedesktop.org, Alistair Popple <apopple@nvidia.com>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>,
 Linux MM <linux-mm@kvack.org>, Matthew Wilcox <willy@infradead.org>,
 Jason Gunthorpe <jgg@nvidia.com>, Andrew Morton <akpm@linux-foundation.org>,
 Ira Weiny <ira.weiny@intel.com>, Christoph Hellwig <hch@lst.de>,
 "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
 Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Oct 12, 2020 at 02:14:07PM -0700, Dan Williams wrote:
> > ZONE_DEVICE struct pages have an extra reference count that complicates the
> > code for put_page() and several places in the kernel that need to check the
> > reference count to see that a page is not being used (gup, compaction,
> > migration, etc.). Clean up the code so the reference count doesn't need to
> > be treated specially for device private pages, leaving DAX as still being
> > a special case.
> 
> Please no half-step to removing the special casing...

Agreed.  I really like where the refcount changes are heading, but
I don't think this half-step is helpful.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
