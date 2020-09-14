Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A8CF269067
	for <lists+nouveau@lfdr.de>; Mon, 14 Sep 2020 17:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6666A6E513;
	Mon, 14 Sep 2020 15:43:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EDC689F49
 for <nouveau@lists.freedesktop.org>; Mon, 14 Sep 2020 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=qoTdF1K8QZfe59Hsr5727q9mC8g2Jr5rOYMLLk2l1RQ=; b=JD1+mg3m8jvSPy3g4VSjTLAnne
 36W7CEcoAjxEVt2IAtPzrSLLevxJXWdpbHQIw28Hd8heE9NT0eLFI3udQPI9fiPX78IfhNKa6ks+t
 B6qOI+lbhHblw0gjtrh7b4QFmisAWGkdYGLVZMa2FALPb3LmhFrZ/EhI1n0frpG3jT/9G2onhyqti
 +JAkxxX8vEDs8hVliKzd7NKSOO7+clLbM8f4UpsVvfAezc/NiKnlHpgaH4hmhufya8Q6/AXWqwdjv
 2yxTbv35hihTfi1UKALD5FKKVyct2R0rgRXAei//GMv4/Wl+PzWkc0P9X7kAFL7918W/mYBUUblZB
 Ej1HafoQ==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kHqB4-0003Xz-OV; Mon, 14 Sep 2020 15:13:58 +0000
Date: Mon, 14 Sep 2020 16:13:58 +0100
From: Matthew Wilcox <willy@infradead.org>
To: Christoph Hellwig <hch@lst.de>
Message-ID: <20200914151358.GQ6583@casper.infradead.org>
References: <20200914144433.1622958-1-hch@lst.de>
 <20200914144433.1622958-12-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20200914144433.1622958-12-hch@lst.de>
X-Mailman-Approved-At: Mon, 14 Sep 2020 15:43:42 +0000
Subject: Re: [Nouveau] [PATCH 11/17] sgiseeq: convert to
 dma_alloc_noncoherent
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
 "James E.J. Bottomley" <James.Bottomley@hansenpartnership.com>,
 linux-mm@kvack.org, linux1394-devel@lists.sourceforge.net,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Ben Skeggs <bskeggs@redhat.com>, Matt Porter <mporter@kernel.crashing.org>,
 linux-media@vger.kernel.org, Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, Tomasz Figa <tfiga@chromium.org>,
 iommu@lists.linux-foundation.org, Stefan Richter <stefanr@s5r6.in-berlin.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Mon, Sep 14, 2020 at 04:44:27PM +0200, Christoph Hellwig wrote:
>  drivers/net/ethernet/i825xx/lasi_82596.c |  25 ++---
>  drivers/net/ethernet/i825xx/lib82596.c   | 114 ++++++++++++++---------
>  drivers/net/ethernet/i825xx/sni_82596.c  |   4 -
>  drivers/net/ethernet/seeq/sgiseeq.c      |  28 ++++--
>  drivers/scsi/53c700.c                    |   9 +-
>  5 files changed, 103 insertions(+), 77 deletions(-)

I think your patch slicing-and-dicing went wrong here ;-(
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
