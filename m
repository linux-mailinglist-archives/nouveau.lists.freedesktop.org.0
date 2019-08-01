Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60EE97D693
	for <lists+nouveau@lfdr.de>; Thu,  1 Aug 2019 09:46:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEFDA6E3C1;
	Thu,  1 Aug 2019 07:46:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C5E06E3C1;
 Thu,  1 Aug 2019 07:46:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 2CC4D227A81; Thu,  1 Aug 2019 09:46:15 +0200 (CEST)
Date: Thu, 1 Aug 2019 09:46:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Bharata B Rao <bharata@linux.ibm.com>
Message-ID: <20190801074614.GC16178@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-6-hch@lst.de> <20190731095735.GB18807@in.ibm.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190731095735.GB18807@in.ibm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 5/9] nouveau: simplify
 nouveau_dmem_migrate_to_ram
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDM6Mjc6MzVQTSArMDUzMCwgQmhhcmF0YSBCIFJhbyB3
cm90ZToKPiA+IC0Ja2ZyZWUoZmF1bHQtPmRtYSk7Cj4gPiArCXJldHVybiBWTV9GQVVMVF9TSUdC
VVM7Cgo+IExvb2tzIGxpa2Ugbm91dmVhdV9kbWVtX2ZhdWx0X2NvcHlfb25lKCkgaXMgbm93IHJl
dHVybmluZyBWTV9GQVVMVF9TSUdCVVMKPiBmb3Igc3VjY2VzcyBjYXNlLiBJcyB0aGlzIGV4cGVj
dGVkPwoKTm8sIGZpeGVkLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
