Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 76A0E57EAE
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 10:51:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3FC56E840;
	Thu, 27 Jun 2019 08:51:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9F5C6E840;
 Thu, 27 Jun 2019 08:51:19 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 742B868B20; Thu, 27 Jun 2019 10:50:47 +0200 (CEST)
Date: Thu, 27 Jun 2019 10:50:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20190627085047.GA11420@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-12-hch@lst.de>
 <20190626190445.GE4605@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626190445.GE4605@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 11/25] memremap: lift the devmap_enable
 manipulation into devm_memremap_pages
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMTI6MDQ6NDZQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+ID4gK3N0YXRpYyBpbnQgZGV2bWFwX21hbmFnZWRfZW5hYmxlX2dldChzdHJ1Y3QgZGV2aWNl
ICpkZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCj4gPiArewo+ID4gKwlpZiAoIXBnbWFw
LT5vcHMtPnBhZ2VfZnJlZSkgewo+IAo+IE5JVDogbGF0ZXIgb24geW91IGFkZCB0aGUgY2hlY2sg
Zm9yIHBnbWFwLT5vcHMuLi4gIGl0IHNob3VsZCBwcm9iYWJseSBiZSBoZXJlLgo+IAo+IEJ1dCBu
b3Qgc3VyZSB0aGF0IGJpc2VjdGlvbiB3aWxsIGJlIGFuIGlzc3VlIGhlcmUuCgpBdCB0aGlzIHBv
aW50IHdlIGRvIG5vdCBhbGxvdyBhIE5VTEwgb3BzIHBvaW50ZXIuICBUaGF0IG9ubHkgYmVjb21l
cwphIHZhbGlkIG9wdGlvbiBvbmUgdGhlIGludGVybmFsIHJlZmNvdW50IGlzIGFkZGVkLiAgVW50
aWwgdGhlbiBhIE5VTEwKLT5vcHMgcG9pbnRlciBsZWFkcyB0byBhbiBlcnJvciByZXR1cm4gZnJv
bSBkZXZtX21lbXJlbWFwX3BhZ2VzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
