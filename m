Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B43085B28
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 08:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F4DD6E457;
	Thu,  8 Aug 2019 06:59:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 498EC6E457;
 Thu,  8 Aug 2019 06:59:38 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D398268AEF; Thu,  8 Aug 2019 08:59:33 +0200 (CEST)
Date: Thu, 8 Aug 2019 08:59:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190808065933.GA29382@lst.de>
References: <20190806160554.14046-1-hch@lst.de>
 <20190806160554.14046-5-hch@lst.de> <20190807174548.GJ1571@mellanox.com>
 <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hPCuHBLhSJgZZEh0CbuuJNPLFDA3f-79FX5uVOO0yubA@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 04/15] mm: remove the pgmap field from struct
 hmm_vma_walk
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
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBBdWcgMDcsIDIwMTkgYXQgMTE6NDc6MjJBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ID4gVW5yZWxhdGVkIHRvIHRoaXMgcGF0Y2gsIGJ1dCB3aGF0IGlzIHRoZSBwb2ludCBv
ZiBnZXR0aW5nIGNoZWNraW5nCj4gPiB0aGF0IHRoZSBwZ21hcCBleGlzdHMgZm9yIHRoZSBwYWdl
IGFuZCB0aGVuIGltbWVkaWF0ZWx5IHJlbGVhc2luZyBpdD8KPiA+IFRoaXMgY29kZSBoYXMgdGhp
cyBwYXR0ZXJuIGluIHNldmVyYWwgcGxhY2VzLgo+ID4KPiA+IEl0IGZlZWxzIHJhY3kKPiAKPiBB
Z3JlZSwgbm90IHN1cmUgd2hhdCB0aGUgaW50ZW50IGlzIGhlcmUuIFRoZSBvbmx5IG90aGVyIHJl
YXNvbiBjYWxsCj4gZ2V0X2Rldl9wYWdlbWFwKCkgaXMgdG8ganVzdCBjaGVjayBpbiBnZW5lcmFs
IGlmIHRoZSBwZm4gaXMgaW5kZWVkCj4gb3duZWQgYnkgc29tZSBaT05FX0RFVklDRSBpbnN0YW5j
ZSwgYnV0IGlmIHRoZSBpbnRlbnQgaXMgdG8gbWFrZSBzdXJlCj4gdGhlIGRldmljZSBpcyBzdGls
bCBhdHRhY2hlZC9lbmFibGVkIHRoYXQgY2hlY2sgaXMgaW52YWxpZGF0ZWQgYXQKPiBwdXRfZGV2
X3BhZ2VtYXAoKS4KPiAKPiBJZiBpdCdzIHRoZSBmb3JtZXIgY2FzZSwgdmFsaWRhdGluZyBaT05F
X0RFVklDRSBwZm5zLCBJIGltYWdpbmUgd2UgY2FuCj4gZG8gc29tZXRoaW5nIGNoZWFwZXIgd2l0
aCBhIGhlbHBlciB0aGF0IGlzIG9uIHRoZSBvcmRlciBvZiB0aGUgc2FtZQo+IGNvc3QgYXMgcGZu
X3ZhbGlkKCkuIEkuZS4gcmVwbGFjZSBQVEVfREVWTUFQIHdpdGggYSBtZW1fc2VjdGlvbiBmbGFn
Cj4gb3Igc29tZXRoaW5nIHNpbWlsYXIuCgpUaGUgaG1tIGxpdGVyYWxseSBuZXZlciBkZXJlZmVy
ZW5jZXMgdGhlIHBnbWFwLCBzbyB2YWxpZGl0eSBjaGVja2luZyBpcwp0aGUgb25seSBleHBsYW5h
dGlvbiBmb3IgaXQuCgo+ID4gKyAgICAgICAgICAgICAgIC8qCj4gPiArICAgICAgICAgICAgICAg
ICogV2UgZG8gcHV0X2Rldl9wYWdlbWFwKCkgaGVyZSBzbyB0aGF0IHdlIGNhbiBsZXZlcmFnZQo+
ID4gKyAgICAgICAgICAgICAgICAqIGdldF9kZXZfcGFnZW1hcCgpIG9wdGltaXphdGlvbiB3aGlj
aCB3aWxsIG5vdCByZS10YWtlIGEKPiA+ICsgICAgICAgICAgICAgICAgKiByZWZlcmVuY2Ugb24g
YSBwZ21hcCBpZiB3ZSBhbHJlYWR5IGhhdmUgb25lLgo+ID4gKyAgICAgICAgICAgICAgICAqLwo+
ID4gKyAgICAgICAgICAgICAgIGlmIChobW1fdm1hX3dhbGstPnBnbWFwKQo+ID4gKyAgICAgICAg
ICAgICAgICAgICAgICAgcHV0X2Rldl9wYWdlbWFwKGhtbV92bWFfd2Fsay0+cGdtYXApOwo+ID4g
Kwo+IAo+IFNlZW1zIG9rLCBidXQgb25seSBpZiB0aGUgY2FsbGVyIGlzIGd1YXJhbnRlZWluZyB0
aGF0IHRoZSByYW5nZSBkb2VzCj4gbm90IHNwYW4gb3V0c2lkZSBvZiBhIHNpbmdsZSBwYWdlbWFw
IGluc3RhbmNlLiBJZiB0aGF0IGd1YXJhbnRlZSBpcwo+IG1ldCB3aHkgbm90IGp1c3QgaGF2ZSB0
aGUgY2FsbGVyIHBhc3MgaW4gYSBwaW5uZWQgcGFnZW1hcD8gSWYgdGhhdAo+IGd1YXJhbnRlZSBp
cyBub3QgbWV0LCB0aGVuIEkgdGhpbmsgd2UncmUgYmFjayB0byB5b3VyIHJhY2UgY29uY2Vybi4K
Ckl0IGl0ZXJhdGVzIG92ZXIgbXVsdGlwbGUgcHRlcyBpbiBhIG5vbi1odWdlIHBtZC4gIElzIHRo
ZXJlIGFueSBraW5kIG9mCmxpbWl0YXRpb25zIG9uIGRpZmZlcmVudCBwZ21hcCBpbnN0YW5jZXMg
aW5zaWRlIGEgcG1kPyAgSSBjYW4ndCB0aGluawpvZiBvbmUsIHNvIHRoaXMgbWlnaHQgYWN0dWFs
bHkgYmUgYSBidWcuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0
dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
