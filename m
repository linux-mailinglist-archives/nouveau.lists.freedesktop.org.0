Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 82CE37A087
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:46:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C9466E3E3;
	Tue, 30 Jul 2019 05:46:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDB8A6E3E3;
 Tue, 30 Jul 2019 05:46:37 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id ABD1D68AEF; Tue, 30 Jul 2019 07:46:33 +0200 (CEST)
Date: Tue, 30 Jul 2019 07:46:33 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jerome Glisse <jglisse@redhat.com>
Message-ID: <20190730054633.GA28515@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
 <20190729142843.22320-10-hch@lst.de> <20190729233044.GA7171@redhat.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190729233044.GA7171@redhat.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
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
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgMDc6MzA6NDRQTSAtMDQwMCwgSmVyb21lIEdsaXNzZSB3
cm90ZToKPiBPbiBNb24sIEp1bCAyOSwgMjAxOSBhdCAwNToyODo0M1BNICswMzAwLCBDaHJpc3Rv
cGggSGVsbHdpZyB3cm90ZToKPiA+IFRoZSBNSUdSQVRFX1BGTl9XUklURSBpcyBvbmx5IHVzZWQg
bG9jYWxseSBpbiBtaWdyYXRlX3ZtYV9jb2xsZWN0X3BtZCwKPiA+IHdoZXJlIGl0IGNhbiBiZSBy
ZXBsYWNlZCB3aXRoIGEgc2ltcGxlIGJvb2xlYW4gbG9jYWwgdmFyaWFibGUuCj4gPiAKPiA+IFNp
Z25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgo+IAo+IE5BSyB0aGF0
IGZsYWcgaXMgdXNlZnVsLCBmb3IgaW5zdGFuY2UgYSBhbm9ueW1vdXMgdm1hIG1pZ2h0IGhhdmUK
PiBzb21lIG9mIGl0cyBwYWdlIHJlYWQgb25seSBldmVuIGlmIHRoZSB2bWEgaGFzIHdyaXRlIHBl
cm1pc3Npb24uCj4gCj4gSXQgc2VlbXMgdGhhdCB0aGUgY29kZSBpbiBub3V2ZWF1IGlzIHdyb25n
IChwcm9iYWJseSBsb3N0IHRoYXQKPiBpbiB2YXJpb3VzIHJlYmFzZS9yZXdvcmspIGFzIHRoaXMg
ZmxhZyBzaG91bGQgYmUgdXNlIHRvIGRlY2lkZQo+IHdldGhlciB0byBtYXAgdGhlIGRldmljZSBt
ZW1vcnkgd2l0aCB3cml0ZSBwZXJtaXNzaW9uIG9yIG5vdC4KPiAKPiBJIGFtIHRyYXZlbGluZyBy
aWdodCBub3csIGkgd2lsbCBpbnZlc3RpZ2F0ZSB3aGF0IGhhcHBlbmVkIHRvCj4gbm91dmVhdSBj
b2RlLgoKV2UgY2FuIGFkZCBpdCBiYWNrIHdoZW4gbmVlZGVkIHByZXR0eSBlYXNpbHkuICBNdWNo
IG9mIHRoaXMgaGFzIGJpdHJvdHRlZAp3YXkgdG8gZmFzdCwgYW5kIHRoZSBwZW5kaW5nIHBwYyBr
dm1obW0gY29kZSBkb2Vzbid0IG5lZWQgaXQgZWl0aGVyLgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
