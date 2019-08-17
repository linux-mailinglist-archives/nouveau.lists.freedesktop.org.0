Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 58AA790D4B
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2019 08:11:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C11206E453;
	Sat, 17 Aug 2019 06:11:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 60B1F6E453;
 Sat, 17 Aug 2019 06:11:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 0AE0168B05; Sat, 17 Aug 2019 08:11:04 +0200 (CEST)
Date: Sat, 17 Aug 2019 08:11:03 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ben Skeggs <bskeggs@redhat.com>
Message-ID: <20190817061103.GA18179@lst.de>
References: <20190807150214.3629-1-rcampbell@nvidia.com>
 <20190808070701.GC29382@lst.de>
 <0b96a8d8-86b5-3ce0-db95-669963c1f8a7@nvidia.com>
 <20190810111308.GB26349@lst.de>
 <1a84e6b6-31e6-6955-509f-9883f4a7a322@nvidia.com>
 <20190816071132.GA7513@lst.de>
 <CABDvA=n4Y0QticHZowEWFOqiEB3p99nV71GvHAySYdkcgw-Aow@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CABDvA=n4Y0QticHZowEWFOqiEB3p99nV71GvHAySYdkcgw-Aow@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH] nouveau/hmm: map pages after migration
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
Cc: nouveau <nouveau@lists.freedesktop.org>, Christoph Hellwig <hch@lst.de>,
 dri-devel <dri-devel@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gU2F0LCBBdWcgMTcsIDIwMTkgYXQgMTE6MDU6MzZBTSArMTAwMCwgQmVuIFNrZWdncyB3cm90
ZToKPiA+ID4+IGNvbnN0YW50cyB3aXRoIHNpbWlsYXIgbmFtZXMgYW5kIGlkZW50aWNhbCB2YWx1
ZXMsIGFuZCB0aG9zZSBhcmUgdXNlZAo+ID4gPj4gaW4gbW11L3ZtbWdwMTAwLmMgYW5kIHdoYXQg
YXBwZWFycyB0byBmaW5hbGx5IGRvIHRoZSBsb3ctbGV2ZWwgZG1hCj4gPiA+PiBtYXBwaW5nIGFu
ZCB0YWxraW5nIHRvIHRoZSBoYXJkd2FyZS4gIEFyZSB0aGVzZSB0d28gc2V0cyBvZiBjb25zdGFu
dHMKPiA+ID4+IHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1lPyAgQXJlIHRoZSBhY3R1YWwgaGFyZHdh
cmUgdmFsdWVzIG9yIGp1c3QgYQo+ID4gPj4gZHJpdmVyIGludGVybmFsIGludGVyZmFjZT8KPiA+
ID4KPiA+ID4gSXQgbG9va3MgYSBiaXQgb2RkIHRvIG1lIHRvby4KPiA+ID4gSSBkb24ndCByZWFs
bHkga25vdyB0aGUgc3RydWN0dXJlL2hpc3Rvcnkgb2Ygbm91dmVhdS4KPiA+ID4gUGVyaGFwcyBC
ZW4gU2tlZ2dzIGNhbiBzaGVkIG1vcmUgbGlnaHQgb24geW91ciBxdWVzdGlvbi4KPiA+Cj4gPiBC
ZW4sIGRvIHlvdSBoYXZlIGFueSBpbnNpZ2h0cyBvbiB0aGVzZSBjb25zdGFudHM/Cj4gVGhvc2Ug
c2V0cyBvZiBjb25zdGFudHMgYXJlIChjdXJyZW50bHkpIHN1cHBvc2VkIHRvIGJlIHRoZSBzYW1l
IHZhbHVlLgo+IFRoZXkgZG9uJ3QgbmVjZXNzYXJpbHkgbWFwIHRvIHRoZSBIVyBkaXJlY3RseSBh
dCB0aGlzIHN0YWdlLCBhbmQKPiBzb21ldGhpbmcgZGlmZmVyZW50IHdpbGwgbGlrZWx5IGJlIGRv
bmUgaW4gdGhlIGZ1dHVyZSBhcyBIVyBjaGFuZ2VzLgoKU28gd2h5IGRvIHdlIGhhdmUgdHdvIHNl
dHMgb2YgY29uc3RhbnRzIGluc3RlYWQgb2Ygb25lIHNldCBmb3IgdGhlc2UKdmFsdWVzPyAgVGhh
dCBtYWtlcyB0cnlpbmcgdG8gZm9sbG93IHRoZSBjb2RlIHByZXR0eSBoYXJkLgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
