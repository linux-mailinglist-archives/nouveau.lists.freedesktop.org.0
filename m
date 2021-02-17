Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C95CC31E2E0
	for <lists+nouveau@lfdr.de>; Thu, 18 Feb 2021 00:01:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF47E6E7F5;
	Wed, 17 Feb 2021 23:01:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from hqnvemgate25.nvidia.com (hqnvemgate25.nvidia.com
 [216.228.121.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601B16E195;
 Wed, 17 Feb 2021 23:01:00 +0000 (UTC)
Received: from hqmail.nvidia.com (Not Verified[216.228.121.13]) by
 hqnvemgate25.nvidia.com (using TLS: TLSv1.2, AES256-SHA)
 id <B602da02b0005>; Wed, 17 Feb 2021 15:00:59 -0800
Received: from nvdebian.localnet (172.20.145.6) by HQMAIL107.nvidia.com
 (172.20.187.13) with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 17 Feb
 2021 23:00:56 +0000
From: Alistair Popple <apopple@nvidia.com>
To: <linux-mm@kvack.org>
Date: Thu, 18 Feb 2021 10:00:54 +1100
Message-ID: <6616185.Wbe1NtApLk@nvdebian>
In-Reply-To: <20210211075510.GA2368090@infradead.org>
References: <20210209010722.13839-1-apopple@nvidia.com>
 <20210210175913.GO4718@ziepe.ca> <20210211075510.GA2368090@infradead.org>
MIME-Version: 1.0
X-Originating-IP: [172.20.145.6]
X-ClientProxiedBy: HQMAIL111.nvidia.com (172.20.187.18) To
 HQMAIL107.nvidia.com (172.20.187.13)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nvidia.com; s=n1;
 t=1613602859; bh=Zcp6FwQOo6uCl+bAC2DWEr4Viwiu5nIBT+YN6D2qruU=;
 h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
 MIME-Version:Content-Transfer-Encoding:Content-Type:
 X-Originating-IP:X-ClientProxiedBy;
 b=AXb+ut3ot7Odaa4NfndUdnHlBWh/CmCbxa90e7XGqYDqOl0itTA0ey/0xdqSoXbA2
 JlMNydOcVXGiAO1uyIryQXCh6IJNMB5+ajbf7PvbtDcER0T/TTnEqkgpU2USIY0Ya+
 NqYaHlrJc7yam1VcZFkBNUvumzVGyvnQedJAd2+hs20Ac8NKfjzT6p3t31zwxNt/Hq
 gR+sHNOCuxdnohI6TOW7pnPo+iGVNWMyVlv0cNOIZszQSsdsXR69vsDcRIyKwiHLuU
 QHMPy9U3pXXKcoKf2xltHJbe92pWiS2sWG6fQJuE1wnVVzjgSmr5R0ufLguVI0LbOK
 oydiyGx+ixcIg==
Subject: Re: [Nouveau] [PATCH 0/9] Add support for SVM atomics in Nouveau
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
 Linux Doc Mailing List <linux-doc@vger.kernel.org>, Nouveau
 Dev <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 kvm-ppc@vger.kernel.org, Christoph Hellwig <hch@infradead.org>,
 Jason Gunthorpe <jgg@ziepe.ca>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

On Thursday, 11 February 2021 6:55:10 PM AEDT Christoph Hellwig wrote:
> On Wed, Feb 10, 2021 at 01:59:13PM -0400, Jason Gunthorpe wrote:
> > Really what you want to do here is leave the CPU page in the VMA and
> > the page tables where it started and deny CPU access to the page. Then
> > all the proper machinery will continue to work.
> > 
> > IMHO "migration" is the wrong idea if the data isn't actually moving.
> 
> Agreed.
 
I chose "migration" because device private pages seemed like a good way of 
reusing existing code to do what was required (a callback on CPU access).

However I have been reworking this to use mmu notifiers as the callback and it 
seems to simplify some things nicely so think I also agree. It removes the 
requirement for the pin as well which is nice, I'll post it as a v2 soon.

 - Alistair



_______________________________________________
Nouveau mailing list
Nouveau@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/nouveau
