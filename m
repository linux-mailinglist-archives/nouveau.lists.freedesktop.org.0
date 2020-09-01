Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 89A93259E34
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 20:38:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F06456E8DC;
	Tue,  1 Sep 2020 18:38:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from casper.infradead.org (casper.infradead.org
 [IPv6:2001:8b0:10b:1236::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3C306E44B
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 15:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
 References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description;
 bh=TQLSoH0xPQ3SjLQOZr/hg2RXQ7cUeDg7DQ8wAuWlnPY=; b=jZd0L7aTlxDR248PzMNlW27wkh
 U5RPUon6By39MJmZf0ctObEI9pE6t9/Rga1EYLZwsrKYL9QKBtSzQY4MensUyVRxNASrX33Pl6ldS
 zbXRi9/lO7DOPWfK1zGncHVRI29r2AMThiNWFyK5BL0hKgOTicHc7ljMttBaeAT085JBU3dfIIkhB
 i2DXKzLWz59dGh9/sp69/KBXolj/SaGGtRWihBzzh4x4klX60zoq5kB/U7R9cVPhcDeNn5gerBNkJ
 glYPLWys77T11Ln0t8j7NNm/ySZOphISgDrR6WnPzsdkVah1bi4+EBuWuom6AkSHomcEJms18cORZ
 5mRx4n8A==;
Received: from willy by casper.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1kD7r8-0008OT-59; Tue, 01 Sep 2020 15:05:54 +0000
Date: Tue, 1 Sep 2020 16:05:54 +0100
From: Matthew Wilcox <willy@infradead.org>
To: James Bottomley <James.Bottomley@hansenpartnership.com>
Message-ID: <20200901150554.GN14765@casper.infradead.org>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
 <1598971960.4238.5.camel@HansenPartnership.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1598971960.4238.5.camel@HansenPartnership.com>
X-Mailman-Approved-At: Tue, 01 Sep 2020 18:38:08 +0000
Subject: Re: [Nouveau] [PATCH 07/28] 53c700: improve non-coherent DMA
 handling
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
Cc: alsa-devel@alsa-project.org, linux-ia64@vger.kernel.org,
 linux-doc@vger.kernel.org, nouveau@lists.freedesktop.org,
 linux-nvme@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, Christoph Hellwig <hch@lst.de>,
 Marek Szyprowski <m.szyprowski@samsung.com>, linux-samsung-soc@vger.kernel.org,
 Joonyoung Shim <jy0922.shim@samsung.com>, linux-scsi@vger.kernel.org,
 Kyungmin Park <kyungmin.park@samsung.com>, Ben Skeggs <bskeggs@redhat.com>,
 Matt Porter <mporter@kernel.crashing.org>, linux-media@vger.kernel.org,
 Tom Lendacky <thomas.lendacky@amd.com>, Pawel Osciak <pawel@osciak.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 linux-arm-kernel@lists.infradead.org,
 Thomas Bogendoerfer <tsbogend@alpha.franken.de>, linux-parisc@vger.kernel.org,
 netdev@vger.kernel.org, Seung-Woo Kim <sw0312.kim@samsung.com>,
 linux-mips@vger.kernel.org, iommu@lists.linux-foundation.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Tue, Sep 01, 2020 at 07:52:40AM -0700, James Bottomley wrote:
> I think this looks mostly OK, except for one misnamed parameter below. 
> Unfortunately, the last non-coherent parisc was the 700 series and I no
> longer own a box, so I can't test that part of it (I can fire up the
> C360 to test it on a coherent arch).

I have a 715/50 that probably hasn't been powered on in 15 years if you
need something that old to test on (I believe the 725/100 uses the 7100LC
and so is coherent).  I'll need to set up a cross-compiler ...
_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
