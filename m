Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CD4C8F9F9
	for <lists+nouveau@lfdr.de>; Fri, 16 Aug 2019 06:44:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 81A576EABE;
	Fri, 16 Aug 2019 04:44:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A0A66EABE;
 Fri, 16 Aug 2019 04:44:52 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id B1DD368AFE; Fri, 16 Aug 2019 06:44:48 +0200 (CEST)
Date: Fri, 16 Aug 2019 06:44:48 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190816044448.GB4093@lst.de>
References: <20190814132746.GE13756@mellanox.com>
 <CAPcyv4g8usp8prJ+1bMtyV1xuedp5FKErBp-N8+KzR=rJ-v0QQ@mail.gmail.com>
 <20190815180325.GA4920@redhat.com>
 <CAPcyv4g4hzcEA=TPYVTiqpbtOoS30ahogRUttCvQAvXQbQjfnw@mail.gmail.com>
 <20190815194339.GC9253@redhat.com>
 <CAPcyv4jid8_=-8hBpn_Qm=c4S8BapL9B9RGT7e9uu303yH=Yqw@mail.gmail.com>
 <20190815203306.GB25517@redhat.com> <20190815204128.GI22970@mellanox.com>
 <20190815205132.GC25517@redhat.com> <20190816004303.GC9929@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816004303.GC9929@mellanox.com>
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

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMTI6NDM6MDdBTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgQXVnIDE1LCAyMDE5IGF0IDA0OjUxOjMzUE0gLTA0MDAsIEplcm9t
ZSBHbGlzc2Ugd3JvdGU6Cj4gCj4gPiBzdHJ1Y3QgcGFnZS4gSW4gdGhpcyBjYXNlIGFueSB3YXkg
d2UgY2FuIHVwZGF0ZSB0aGUKPiA+IG5vdXZlYXVfZG1lbV9wYWdlKCkgdG8gY2hlY2sgdGhhdCBw
YWdlIHBhZ2UtPnBnbWFwID09IHRoZQo+ID4gZXhwZWN0ZWQgcGdtYXAuCj4gCj4gSSB3YXMgYWxz
byB3b25kZXJpbmcgaWYgdGhhdCBpcyBhIHByb2JsZW0uLiBqdXN0IGJsaW5kbHkgZG9pbmcgYQo+
IGNvbnRhaW5lcl9vZiBvbiB0aGUgcGFnZS0+cGdtYXAgZG9lcyBzZWVtIGxpa2UgaXQgYXNzdW1l
cyB0aGF0IG9ubHkKPiB0aGlzIGRyaXZlciBpcyB1c2luZyBERVZJQ0VfUFJJVkFURS4KPiAKPiBJ
dCBzZWVtcyBsaWtlIHNvbWV0aGluZyBtaXNzaW5nIGluIGhtbV9yYW5nZV9mYXVsdCwgaXQgc2hv
dWxkIGJlIHRvbGQKPiB3aGF0IERFVklDRV9QUklWQVRFIGlzIGFjY2VwdGFibGUgdG8gdHJpZ2dl
ciBITU1fUEZOX0RFVklDRV9QUklWQVRFCj4gYW5kIGZhdWx0IGFsbCBvdGhlcnM/CgpUaGUgd2hv
bGUgZGV2aWNlIHByaXZhdGUgaGFuZGxpbmcgaW4gaG1tIGFuZCBtaWdyYXRlX3ZtYSBzZWVtcyBw
cmV0dHkKYnJva2VuIGFzIGZhciBhcyBJIGNhbiB0ZWxsLCBhbmQgSSBoYXZlIHNvbWUgV0lQIHBh
dGNoZXMuICBCYXNpY2FsbHkgd2UKc2hvdWxkIG5vdCB0b3VjaCAob3IgcG9zc2libHkgZXZlbnR1
YWxseSBjYWxsIG1pZ3JhdGUgdG8gcmFtIGV2ZW50dWFsbHkKaW4gdGhlIGZ1dHVyZSkgZGV2aWNl
IHByaXZhdGUgcGFnZXMgbm90IG93bmVkIGJ5IHRoZSBjYWxsZXIsIHdoZXJlIEkKdHJ5IHRvIGRl
ZmluZWQgdGhlIGNhbGxlciBieSB0aGUgZGV2X3BhZ2VtYXBfb3BzIGluc3RhbmNlLiAgCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGlu
ZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
