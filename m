Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD946F04
	for <lists+nouveau@lfdr.de>; Sat, 15 Jun 2019 10:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 844CE8969E;
	Sat, 15 Jun 2019 08:34:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56CE289686;
 Sat, 15 Jun 2019 08:34:27 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 31A9C68AFE; Sat, 15 Jun 2019 10:33:57 +0200 (CEST)
Date: Sat, 15 Jun 2019 10:33:56 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190615083356.GB23406@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <20190614061333.GC7246@lst.de>
 <CAPcyv4jmk6OBpXkuwjMn0Ovtv__2LBNMyEOWx9j5LWvWnr8f_A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4jmk6OBpXkuwjMn0Ovtv__2LBNMyEOWx9j5LWvWnr8f_A@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] dev_pagemap related cleanups
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDY6MTQ6NDVQTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjE0IFBNIENocmlzdG9waCBIZWxsd2ln
IDxoY2hAbHN0LmRlPiB3cm90ZToKPiA+Cj4gPiBPbiBUaHUsIEp1biAxMywgMjAxOSBhdCAxMToy
NzozOUFNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6Cj4gPiA+IEl0IGFsc28gdHVybnMgb3V0
IHRoZSBudmRpbW0gdW5pdCB0ZXN0cyBjcmFzaCB3aXRoIHRoaXMgc2lnbmF0dXJlIG9uCj4gPiA+
IHRoYXQgYnJhbmNoIHdoZXJlIGJhc2UgdjUuMi1yYzMgcGFzc2VzOgo+ID4KPiA+IEhvdyBkbyB5
b3UgcnVuIHRoYXQgdGVzdD8KPiAKPiBUaGlzIGlzIHRoZSB1bml0IHRlc3Qgc3VpdGUgdGhhdCBn
ZXRzIGtpY2tlZCBvZmYgYnkgcnVubmluZyAibWFrZQo+IGNoZWNrIiBmcm9tIHRoZSBuZGN0bCBz
b3VyY2UgcmVwb3NpdG9yeS4gSW4gdGhpcyBjYXNlIGl0IHJlcXVpcmVzIHRoZQo+IG5maXRfdGVz
dCBzZXQgb2YgbW9kdWxlcyB0byBjcmVhdGUgYSBmYWtlIG52ZGltbSBlbnZpcm9ubWVudC4KPiAK
PiBUaGUgc2V0dXAgaW5zdHJ1Y3Rpb25zIGFyZSBpbiB0aGUgUkVBRE1FLCBidXQgZmVlbCBmcmVl
IHRvIHNlbmQgbWUKPiBicmFuY2hlcyBhbmQgSSBjYW4ga2ljayBvZmYgYSB0ZXN0LiBPbmUgb2Yg
dGhlc2Ugd2UnbGwgZ2V0IGFyb3VuZCB0bwo+IG1ha2luZyBpdCBhdXRvbWF0ZWQgZm9yIHBhdGNo
IHN1Ym1pc3Npb25zIHRvIHRoZSBsaW51eC1udmRpbW0gbWFpbGluZwo+IGxpc3QuCgpPaCwgbm93
IEkgcmVtZW1iZXIsIGFuZCB0aGF0IHdhcyB0aGUgYnVtbWVyIGFzIGFueXRoaW5nIHJlcXVpcmlu
ZyBtb2R1bGVzCmp1c3QgZG9lcyBub3QgZml0IGF0IGFsbCBpbnRvIG15IG5vcm1hbCB0ZXN0IGZs
b3dzIHRoYXQganVzdCBpbmplY3QKa2VybmVsIGltYWdlcyBhbmQgdXNlIG90aGVyd2lzZSBzdGF0
aWMgaW1hZ2VzLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
