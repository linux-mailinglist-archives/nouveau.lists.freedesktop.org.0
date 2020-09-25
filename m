Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9CBD427891B
	for <lists+nouveau@lfdr.de>; Fri, 25 Sep 2020 15:13:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E89616ECDB;
	Fri, 25 Sep 2020 13:13:33 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
 by gabe.freedesktop.org (Postfix) with ESMTP id 0B2A76EC91
 for <nouveau@lists.freedesktop.org>; Fri, 25 Sep 2020 11:15:42 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
 by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 34B1D101E;
 Fri, 25 Sep 2020 04:15:42 -0700 (PDT)
Received: from [10.57.48.76] (unknown [10.57.48.76])
 by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 986323F70D;
 Fri, 25 Sep 2020 04:15:38 -0700 (PDT)
To: Christoph Hellwig <hch@lst.de>, Mauro Carvalho Chehab
 <mchehab@kernel.org>, Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 Joonyoung Shim <jy0922.shim@samsung.com>,
 Seung-Woo Kim <sw0312.kim@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Marek Szyprowski <m.szyprowski@samsung.com>, Tomasz Figa
 <tfiga@chromium.org>, Matt Porter <mporter@kernel.crashing.org>,
 iommu@lists.linux-foundation.org
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-9-hch@lst.de>
From: Robin Murphy <robin.murphy@arm.com>
Message-ID: <c8ea4023-3e19-d63b-d936-46a04f502a61@arm.com>
Date: Fri, 25 Sep 2020 12:15:37 +0100
User-Agent: Mozilla/5.0 (Windows NT 10.0; rv:78.0) Gecko/20100101
 Thunderbird/78.2.2
MIME-Version: 1.0
In-Reply-To: <20200915155122.1768241-9-hch@lst.de>
Content-Language: en-GB
X-Mailman-Approved-At: Fri, 25 Sep 2020 13:13:33 +0000
Subject: Re: [Nouveau] [PATCH 08/18] dma-mapping: add a new
 dma_alloc_noncoherent API
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
Cc: alsa-devel@alsa-project.org, linux-samsung-soc@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-parisc@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mips@vger.kernel.org, linux-mm@kvack.org,
 Stefan Richter <stefanr@s5r6.in-berlin.de>, netdev@vger.kernel.org,
 linux1394-devel@lists.sourceforge.net, linux-arm-kernel@lists.infradead.org,
 linux-media@vger.kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On 2020-09-15 16:51, Christoph Hellwig wrote:
[...]
> +These APIs allow to allocate pages in the kernel direct mapping that are
> +guaranteed to be DMA addressable.  This means that unlike dma_alloc_coherent,
> +virt_to_page can be called on the resulting address, and the resulting

Nit: if we explicitly describe this as if it's a guarantee that can be 
relied upon...

> +struct page can be used for everything a struct page is suitable for.

[...]
> +This routine allocates a region of <size> bytes of consistent memory.  It
> +returns a pointer to the allocated region (in the processor's virtual address
> +space) or NULL if the allocation failed.  The returned memory may or may not
> +be in the kernels direct mapping.  Drivers must not call virt_to_page on
> +the returned memory region.

...then forbid this document's target audience from relying on it, 
something seems off. At the very least it's unhelpfully unclear :/

Given patch #17, I suspect that the first paragraph is the one that's no 
longer true.

Robin.
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
