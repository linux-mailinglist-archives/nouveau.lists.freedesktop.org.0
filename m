Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E68C5901A7
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 14:34:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C92F6E3B8;
	Fri, 16 Aug 2019 12:34:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1B7C6E3B8;
 Fri, 16 Aug 2019 12:34:15 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E3D2B68B05; Fri, 16 Aug 2019 14:34:12 +0200 (CEST)
Date: Fri, 16 Aug 2019 14:34:12 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190816123412.GB22140@lst.de>
References: <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <20190815205132.GC25517@redhat.com> <20190816004303.GC9929@mellanox.com>
 <20190816044448.GB4093@lst.de> <20190816123036.GD5412@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816123036.GD5412@mellanox.com>
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTI6MzA6NDFQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IAo+IEZvciBpbnN0YW5jZSwgYSBzeXN0ZW0gbWF5IGhhdmUgbXVsdGlwbGUgREVW
SUNFX1BSSVZBVEUgbWFwJ3Mgb3duZWQgYnkKPiB0aGUgc2FtZSBkcml2ZXIgLSBidXQgbXVsdGlw
bGUgcGh5c2ljYWwgZGV2aWNlcyB1c2luZyB0aGF0IGRyaXZlci4KPiAKPiBFYWNoIHBoeXNpY2Fs
IGRldmljZSdzIGRyaXZlciBzaG91bGQgb25seSBldmVyIGdldCBERVZJQ0VfUFJJVkFURQo+IHBh
Z2VzIGZvciBpdCdzIG93biBvbi1kZXZpY2UgbWVtb3J5LiBOZXZlciBhIERFVklDRV9QUklWQVRF
IGZvcgo+IGFub3RoZXIgZGV2aWNlJ3MgbWVtb3J5Lgo+IAo+IFRoZSBkZXZfcGFnZW1hcF9vcHMg
d291bGQgbm90IGJlIHVuaXF1ZSBlbm91Z2gsIHJpZ2h0PwoKVHJ1ZS4KCj4gCj4gUHJvYmFibHkg
YWxzbyBjbHVzdGVycyBvZiBzYW1lLWRyaXZlciBzdHJ1Y3QgZGV2aWNlIGNhbiBzaGFyZSBhCj4g
REVWSUNFX1BSSVZBVEUsIGF0IGxlYXN0IGhpZ2ggZW5kIEdQVSdzIG5vdyBoYXZlIHByaXZhdGUg
bWVtb3J5Cj4gY29oZXJlbmN5IGJ1c3NlcyBiZXR3ZWVuIHRoZWlyIGRldmljZXMuCj4gCj4gU2lu
Y2Ugd2Ugd2FudCB0byB0cmlnZ2VyIG1pZ3JhdGlvbiB0byBDUFUgb24gaW5jb21wYXRpYmxlCj4g
REVWSUNFX1BSSVZBVEUgcGFnZXMsIGl0IHNlZW1zIGJlc3QgdG8gc29ydCB0aGlzIG91dCBpbiB0
aGUKPiBobW1fcmFuZ2VfZmF1bHQ/Cj4gCj4gTWF5YmUgc29tZSBzb3J0IG9mIHVuaXF1ZSBJRCBp
bnNpZGUgdGhlIHBhZ2UtPnBnbWFwIGFuZCBwYXNzZWQgYXMKPiBpbnB1dD8KClllcywgd2UnbGwg
cHJvYmFibHkgbmVlZCBhbiBvd25lciBmaWVsZC4gIEFuZCBpdCdzIG5vdCBqdXN0CmhtbV9yYW5n
ZV9mYXVsdCwgdGhlIG1pZ3JhdGVfdm1hXyogcm91dGluZXMgYXMgYWZmZWN0ZWQgaW4gdGhlIHNh
bWUKd2F5LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
