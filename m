Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 101BF45486
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:13:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D24A389199;
	Fri, 14 Jun 2019 06:13:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CFCA89199;
 Fri, 14 Jun 2019 06:13:17 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0B9D068B02; Fri, 14 Jun 2019 08:12:48 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:12:47 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190614061247.GB7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613141622.GE22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613141622.GE22062@mellanox.com>
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDI6MTY6MjdQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjAzQU0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gSGkgRGFuLCBKw6lyw7RtZSBhbmQgSmFzb24sCj4gPiAK
PiA+IGJlbG93IGlzIGEgc2VyaWVzIHRoYXQgY2xlYW5zIHVwIHRoZSBkZXZfcGFnZW1hcCBpbnRl
cmZhY2Ugc28gdGhhdAo+ID4gaXQgaXMgbW9yZSBlYXNpbHkgdXNhYmxlLCB3aGljaCByZW1vdmVz
IHRoZSBuZWVkIHRvIHdyYXAgaXQgaW4gaG1tCj4gPiBhbmQgdGh1cyBhbGxvd2luZyB0byBraWxs
IGEgbG90IG9mIGNvZGUKPiAKPiBEbyB5b3Ugd2FudCBzb21lIG9mIHRoaXMgdG8gcnVuIHRocm91
Z2ggaG1tLmdpdD8gSSBzZWUgbWFueSBwYXRjaGVzCj4gdGhhdCBkb24ndCBzZWVtIHRvIGhhdmUg
aW50ZXItZGVwZW5kZW5jaWVzLi4KCkkgdGhpbmsgcnVubmluZyBpdCB0aHJvdWdoIGhtbS5naXQg
bWFrZXMgc2Vuc2UuICBXaGlsZSB0aGVyZSBhcmUgbm90CmFjdHVhbCBmdW5jdGlvbmFsIGRlcGVu
ZGVuY3kgYW5kIGp1c3QgYSBmZXcgY29zbWV0aWMgY29uZmxpY3RzIGtlZXBpbmcKdGhlIGhtbSBz
dHVmZiB0b2dldGhlciBtYWtlcyBhIGxvdCBvZiBzZW5zZS4KX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
