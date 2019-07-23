Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 380D671CF3
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 18:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B44D6E31A;
	Tue, 23 Jul 2019 16:30:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A21F36E317;
 Tue, 23 Jul 2019 16:30:50 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9C53F68B02; Tue, 23 Jul 2019 18:30:48 +0200 (CEST)
Date: Tue, 23 Jul 2019 18:30:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190723163048.GD1655@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de> <20190723151824.GL15331@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723151824.GL15331@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 4/6] nouveau: unlock mmap_sem on all errors
 from nouveau_range_fault
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
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6MTg6MjhQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEh1bS4uCj4gCj4gVGhlIGNhbGxlciBkb2VzIHRoaXM6Cj4gCj4gYWdhaW46Cj4g
CQlyZXQgPSBub3V2ZWF1X3JhbmdlX2ZhdWx0KCZzdm1tLT5taXJyb3IsICZyYW5nZSk7Cj4gCQlp
ZiAocmV0ID09IDApIHsKPiAJCQltdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7Cj4gCQkJaWYgKCFu
b3V2ZWF1X3JhbmdlX2RvbmUoJnJhbmdlKSkgewo+IAkJCQltdXRleF91bmxvY2soJnN2bW0tPm11
dGV4KTsKPiAJCQkJZ290byBhZ2FpbjsKPiAKPiBBbmQgd2UgY2FuJ3QgY2FsbCBub3V2ZWF1X3Jh
bmdlX2ZhdWx0KCkgLT4gaG1tX3JhbmdlX2ZhdWx0KCkgd2l0aG91dAo+IGhvbGRpbmcgdGhlIG1t
YXBfc2VtLCBzbyB3ZSBjYW4ndCBhbGxvdyBub3V2ZWF1X3JhbmdlX2ZhdWx0IHRvIHVubG9jawo+
IGl0LgoKR290byBhZ2FpbiBjYW4gb25seSBoYXBwZW4gaWYgbm91dmVhdV9yYW5nZV9mYXVsdCB3
YXMgc3VjY2Vzc2Z1bCwKaW4gd2hpY2ggY2FzZSB3ZSBkaWQgbm90IGRyb3AgbW1hcF9zZW0uCgpB
bHNvOgoKPiAgCXJldCA9IGhtbV9yYW5nZV9mYXVsdChyYW5nZSwgdHJ1ZSk7Cj4gIAlpZiAocmV0
IDw9IDApIHsKPiAgCQlpZiAocmV0ID09IDApCj4gIAkJCXJldCA9IC1FQlVTWTsKPiAtCQl1cF9y
ZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwo+ICAJCWhtbV9yYW5nZV91bnJlZ2lz
dGVyKHJhbmdlKTsKClRoaXMgd291bGQgaG9sZCBtbWFwX3NlbSBvdmVyIGhtbV9yYW5nZV91bnJl
Z2lzdGVyLCB3aGljaCBjYW4gbGVhZAp0byBkZWFkbG9jayBpZiB3ZSBjYWxsIGV4aXRfbW1hcCBh
bmQgdGhlbiBhY3F1aXJlIG1tYXBfc2VtIGFnYWluLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXU=
