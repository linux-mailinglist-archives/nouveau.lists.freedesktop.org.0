Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 33D70274E07
	for <lists+nouveau@lfdr.de>; Wed, 23 Sep 2020 02:59:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 76AA66E3EC;
	Wed, 23 Sep 2020 00:59:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from elvis.franken.de (elvis.franken.de [193.175.24.41])
 by gabe.freedesktop.org (Postfix) with ESMTP id A66396E127
 for <nouveau@lists.freedesktop.org>; Tue, 22 Sep 2020 10:56:14 +0000 (UTC)
Received: from uucp (helo=alpha)
 by elvis.franken.de with local-bsmtp (Exim 3.36 #1)
 id 1kKfxs-000822-00; Tue, 22 Sep 2020 12:56:04 +0200
Received: by alpha.franken.de (Postfix, from userid 1000)
 id EA522C0FFF; Tue, 22 Sep 2020 10:52:52 +0200 (CEST)
Date: Tue, 22 Sep 2020 10:52:52 +0200
From: Thomas Bogendoerfer <tsbogend@alpha.franken.de>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200922085252.GH8477@alpha.franken.de>
References: <20200915155122.1768241-1-hch@lst.de>
 <20200915155122.1768241-15-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200915155122.1768241-15-hch@lst.de>
User-Agent: Mutt/1.5.23 (2014-03-12)
X-Mailman-Approved-At: Wed, 23 Sep 2020 00:58:49 +0000
Subject: Re: [Nouveau] [PATCH 14/18] dma-mapping: remove dma_cache_sync
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
Cc: alsa-devel@alsa-project.org, linux-doc@vger.kernel.org,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 15, 2020 at 05:51:18PM +0200, Christoph Hellwig wrote:
> All users are gone now, remove the API.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  arch/mips/Kconfig               |  1 -
>  arch/mips/jazz/jazzdma.c        |  1 -
>  arch/mips/mm/dma-noncoherent.c  |  6 ------
>  arch/parisc/Kconfig             |  1 -
>  arch/parisc/kernel/pci-dma.c    |  6 ------
>  include/linux/dma-mapping.h     |  8 --------
>  include/linux/dma-noncoherent.h | 10 ----------
>  kernel/dma/Kconfig              |  3 ---
>  kernel/dma/mapping.c            | 14 --------------
>  9 files changed, 50 deletions(-)

Acked-by: Thomas Bogendoerfer <tsbogend@alpha.franken.de> (MIPS part)

-- 
Crap can work. Given enough thrust pigs will fly, but it's not necessarily a
good idea.                                                [ RFC1925, 2.3 ]
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
