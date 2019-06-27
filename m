Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E6587B7
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 18:53:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D65666E21D;
	Thu, 27 Jun 2019 16:53:54 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (unknown [213.95.11.210])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E58D46E081;
 Thu, 27 Jun 2019 16:53:52 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 4B57968C4E; Thu, 27 Jun 2019 18:53:49 +0200 (CEST)
Date: Thu, 27 Jun 2019 18:53:49 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190627165349.GB10652@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-13-hch@lst.de> <20190627162439.GD9499@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190627162439.GD9499@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 12/25] memremap: add a migrate_to_ram method
 to struct dev_pagemap_ops
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMjcsIDIwMTkgYXQgMDQ6Mjk6NDVQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkndmVyIGhlYXJkIHRoZXJlIGFyZSBzb21lIG90aGVyIHVzZSBtb2RlbHMgZm9y
IGZhdWx0KCkgaGVyZSBiZXlvbmQKPiBtaWdyYXRlIHRvIHJhbSwgYnV0IHdlIGNhbiByZW5hbWUg
aXQgaWYgd2UgZXZlciBzZWUgdGhlbS4KCldlbGwsIGl0IGFic29sdXRlbHkgbmVlZHMgdG8gbWln
cmF0ZSB0byBzb21lIHBpZWNlIG9mIGFkZHJlc3NhYmxlCmFuZCBjb2hlcmVudCBtZW1vcnksIHNv
IHJhbSBtaWdodCBiZSBhIG5pY2Ugc2hvcnRjdXQgZm9yIHRoYXQuCgo+ID4gK3N0YXRpYyB2bV9m
YXVsdF90IGhtbV9kZXZtZW1fbWlncmF0ZV90b19yYW0oc3RydWN0IHZtX2ZhdWx0ICp2bWYpCj4g
PiAgewo+ID4gLQlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtID0gcGFnZS0+cGdtYXAtPmRhdGE7
Cj4gPiArCXN0cnVjdCBobW1fZGV2bWVtICpkZXZtZW0gPSB2bWYtPnBhZ2UtPnBnbWFwLT5kYXRh
Owo+ID4gIAo+ID4gLQlyZXR1cm4gZGV2bWVtLT5vcHMtPmZhdWx0KGRldm1lbSwgdm1hLCBhZGRy
LCBwYWdlLCBmbGFncywgcG1kcCk7Cj4gPiArCXJldHVybiBkZXZtZW0tPm9wcy0+ZmF1bHQoZGV2
bWVtLCB2bWYtPnZtYSwgdm1mLT5hZGRyZXNzLCB2bWYtPnBhZ2UsCj4gPiArCQkJdm1mLT5mbGFn
cywgdm1mLT5wbWQpOwo+ID4gIH0KPiAKPiBOZXh0IGN5Y2xlIHdlIHNob3VsZCBwcm9iYWJseSBy
ZW5hbWUgdGhpcyBmYXVsdCB0byBtaWdyYXRlX3RvX3JhbSBhcwo+IHdlbGwgYW5kIHBhc3MgaW4g
dGhlIHZtZi4uCgpUaGF0IC0+ZmF1bHQgb3AgZ29lcyBhd2F5IGVudGlyZWx5IGluIG9uZSBvZiB0
aGUgbmV4dCBwYXRjaGVzIGluIHRoZQpzZXJpZXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
