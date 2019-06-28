Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 243955A4B8
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 21:02:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E27866E983;
	Fri, 28 Jun 2019 19:02:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DECA56E983;
 Fri, 28 Jun 2019 19:02:09 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D53A7227A81; Fri, 28 Jun 2019 21:02:07 +0200 (CEST)
Date: Fri, 28 Jun 2019 21:02:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190628190207.GA9317@lst.de>
References: <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
 <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
 <20190628182922.GA15242@mellanox.com>
 <CAPcyv4g+zk9pnLcj6Xvwh-svKM+w4hxfYGikcmuoBAFGCr-HAw@mail.gmail.com>
 <20190628185152.GA9117@lst.de>
 <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4i+b6bKhSF2+z7Wcw4OUAvb1=m289u9QF8zPwLk402JVg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTE6NTk6MTlBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IEl0J3MgYSBidWcgdGhhdCB0aGUgY2FsbCB0byBwdXRfZGV2bWFwX21hbmFnZWRfcGFn
ZSgpIHdhcyBnYXRlZCBieQo+IE1FTU9SWV9ERVZJQ0VfUFVCTElDIGluIHJlbGVhc2VfcGFnZXMo
KS4gVGhhdCBwYXRoIGlzIGFsc28gYXBwbGljYWJsZQo+IHRvIE1FTU9SWV9ERVZJQ0VfRlNEQVgg
YmVjYXVzZSBpdCBuZWVkcyB0byB0cmlnZ2VyIHRoZSAtPnBhZ2VfZnJlZSgpCj4gY2FsbGJhY2sg
dG8gd2FrZSB1cCB3YWl0X29uX3ZhcigpIHZpYSBmc2RheF9wYWdlZnJlZSgpLgo+IAo+IFNvIEkg
Z3Vlc3MgeW91IGNvdWxkIGFyZ3VlIHRoYXQgdGhlIE1FTU9SWV9ERVZJQ0VfUFVCTElDIHJlbW92
YWwgcGF0Y2gKPiBsZWZ0IHRoZSBvcmlnaW5hbCBidWcgaW4gcGxhY2UuIEluIHRoYXQgc2Vuc2Ug
d2UncmUgbm8gd29yc2Ugb2ZmLCBidXQKPiBzaW5jZSB3ZSBrbm93IGFib3V0IHRoZSBidWcsIHRo
ZSBmaXggYW5kIHRoZSBwYXRjaGVzIGhhdmUgbm90IGJlZW4KPiBhcHBsaWVkIHlldCwgd2h5IG5v
dCBmaXggaXQgbm93PwoKVGhlIGZpeCBpdCBub3cgd291bGQgc2ltcGx5IGJlIHRvIGFwcGx5IEly
YSBvcmlnaW5hbCBwYXRjaCBub3csIGJ1dApnaXZlbiB0aGF0IHdlIGFyZSBhdCAtcmM2IGlzIHRo
aXMgcmVhbGx5IGEgZ29vZCB0aW1lPyAgQW5kIGlmIHdlIGRvbid0CmFwcGx5IGl0IG5vdyBiYXNl
ZCBvbiB0aGUgcXVpbHQgYmFzZWQgLW1tIHdvcmZsb3cgaXQganVzdCBzZWVtcyBhIGxvdAplYXNp
ZXIgdG8gYXBwbHkgaXQgYWZ0ZXIgbXkgc2VyaWVzLiAgVW5sZXNzIHdlIHdhbnQgdG8gaW5jbHVk
ZSBpdCBpbgp0aGUgc2VyaWVzLCBpbiB3aGljaCBjYXNlIEkgY2FuIGRvIGEgcXVpY2sgcmViYXNl
LCB3ZSdkIGp1c3QgbmVlZCB0bwptYWtlIHN1cmUgQW5kcmV3IHB1bGxzIGl0IGZyb20gLW1tLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
