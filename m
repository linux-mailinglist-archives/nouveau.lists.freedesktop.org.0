Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FEC2259E2A
	for <lists+nouveau@lfdr.de>; Tue,  1 Sep 2020 20:38:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7EE8C6E8CB;
	Tue,  1 Sep 2020 18:38:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bedivere.hansenpartnership.com (bedivere.hansenpartnership.com
 [66.63.167.143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0B9B46E869
 for <nouveau@lists.freedesktop.org>; Tue,  1 Sep 2020 15:23:00 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
 by bedivere.hansenpartnership.com (Postfix) with ESMTP id 0E0068EE187;
 Tue,  1 Sep 2020 08:22:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1598973779;
 bh=oM6M8l0ba8Kwr86wVvWOr0ibc9GeoVF02RI3gdpRvZg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=UvqMRf/V4bYGUnXRFYzHR0MoWszTvt72MUDJlkPgLVL7Z5C9ghIwUJJ5HYM5kfJ3n
 5VYFPt986TvN+zbqjMT6pkl+t9bvzRZjP81gXVEMiUig/anUDkmm0cM9tI1gLXtLCF
 UIwKWRUmpM4JixpLzQm9dVgj9tnlX6pm+UJWHqoc=
Received: from bedivere.hansenpartnership.com ([127.0.0.1])
 by localhost (bedivere.hansenpartnership.com [127.0.0.1]) (amavisd-new,
 port 10024)
 with ESMTP id U-JPs2CIcW43; Tue,  1 Sep 2020 08:22:58 -0700 (PDT)
Received: from [153.66.254.174] (c-73-35-198-56.hsd1.wa.comcast.net
 [73.35.198.56])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by bedivere.hansenpartnership.com (Postfix) with ESMTPSA id 8B8B18EE0F5;
 Tue,  1 Sep 2020 08:22:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=hansenpartnership.com;
 s=20151216; t=1598973778;
 bh=oM6M8l0ba8Kwr86wVvWOr0ibc9GeoVF02RI3gdpRvZg=;
 h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
 b=QlglmDYfmn+LUmPHNl9G1vxZ4WANgTGEDBcv3VoTq5jkCobGzHRwV7MDXP/8CkPRF
 DlnAvyJzmngr5D0/wC86DqyXRPVdp/OwUQc4zsVd3Mrk54apOxtDVbGKnBnOuqrFqS
 /e8+ps58Vp9230FkQlqzYQQbltdvuVP33ee7Vxcw=
Message-ID: <1598973776.4238.11.camel@HansenPartnership.com>
From: James Bottomley <James.Bottomley@HansenPartnership.com>
To: Matthew Wilcox <willy@infradead.org>
Date: Tue, 01 Sep 2020 08:22:56 -0700
In-Reply-To: <20200901150554.GN14765@casper.infradead.org>
References: <20200819065555.1802761-1-hch@lst.de>
 <20200819065555.1802761-8-hch@lst.de>
 <1598971960.4238.5.camel@HansenPartnership.com>
 <20200901150554.GN14765@casper.infradead.org>
X-Mailer: Evolution 3.26.6 
Mime-Version: 1.0
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

On Tue, 2020-09-01 at 16:05 +0100, Matthew Wilcox wrote:
> On Tue, Sep 01, 2020 at 07:52:40AM -0700, James Bottomley wrote:
> > I think this looks mostly OK, except for one misnamed parameter
> > below. Unfortunately, the last non-coherent parisc was the 700
> > series and I no longer own a box, so I can't test that part of it
> > (I can fire up the C360 to test it on a coherent arch).
> 
> I have a 715/50 that probably hasn't been powered on in 15 years if
> you need something that old to test on (I believe the 725/100 uses
> the 7100LC and so is coherent).  I'll need to set up a cross-compiler 
> ...

I'm not going to say no to actual testing, but it's going to be a world
of pain getting something so old going.  I do have a box of older
systems I keep for architectural testing that I need to rummage around
in ... I just have a vague memory that my 715 actually caught fire a
decade ago and had to be disposed of.

James

_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
