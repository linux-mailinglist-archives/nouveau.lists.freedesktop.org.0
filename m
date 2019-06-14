Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FF4845499
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:20:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1038B892F3;
	Fri, 14 Jun 2019 06:20:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0A70892F3;
 Fri, 14 Jun 2019 06:20:14 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 4C76A68B02; Fri, 14 Jun 2019 08:19:46 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:19:46 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190614061946.GE7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-4-hch@lst.de> <20190613185239.GP22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613185239.GP22062@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 03/22] mm: remove hmm_devmem_add_resource
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDY6NTI6NDRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjA2QU0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2Vk
IHNpbmNlIGl0IHdhcyBmaXJzdCBhZGRlZCB0byB0aGUga2VybmVsCj4gPiBtb3JlIHRoYW4gYSB5
ZWFyIGFuZCBhIGhhbGYgYWdvLCBhbmQgaWYgd2UgZXZlciBncm93IGEgY29uc3VtZXIgb2YgdGhl
Cj4gPiBNRU1PUllfREVWSUNFX1BVQkxJQyBpbmZyYXN0cnVjdHVyZSBpdCBjYW4gZWFzaWx5IHVz
ZSBkZXZtX21lbXJlbWFwX3BhZ2VzCj4gPiBkaXJlY3RseSBub3cgdGhhdCB3ZSd2ZSBzaW1wbGlm
aWVkIHRoZSBBUEkgZm9yIGl0Lgo+IAo+IG5pdDogSGF2ZSB3ZSBzaW1wbGlmaWVkIHRoZSBpbnRl
cmZhY2UgZm9yIGRldm1fbWVtcmVtYXBfcGFnZXMoKSBhdAo+IHRoaXMgcG9pbnQsIG9yIGFyZSB5
b3UgdGFsa2luZyBhYm91dCBsYXRlciBwYXRjaGVzIGluIHRoaXMgc2VyaWVzLgoKQWZ0ZXIgdGhp
cyBzZXJpZXMuICBJJ3ZlIGp1c3QgZHJvcGVkIHRoYXQgcGFydCBvZiB0aGUgc2VudGVuY2UgdG8K
YXZvaWQgY29uZnVzaW9uLgoKPiBJIGNoZWNrZWQgdGhpcyBhbmQgYWxsIHRoZSBjYWxsZWQgZnVu
Y3Rpb25zIGFyZSBleHBvcnRlZCBzeW1ib2xzLCBzbwo+IHRoZXJlIGlzIG5vIGJsb2NrZXIgZm9y
IGEgZnV0dXJlIGRyaXZlciB0byBjYWxsIGRldm1fbWVtcmVtYXBfcGFnZXMoKSwKPiBtYXliZSBl
dmVuIHdpdGggYWxsIHRoaXMgYm9pbGVyIHBsYXRlLCBpbiBmdXR1cmUuCj4gCj4gSWYgd2UgZXZl
bnR1YWxseSBnZXQgbWFueSB1c2VycyB0aGF0IG5lZWQgc29tZSBzaW1wbGlmaWVkIHJlZ2lzdHJh
dGlvbgo+IHRoZW4gd2Ugc2hvdWxkIGFkZCBhIGRldm1fbWVtcmVtYXBfcGFnZXNfc2ltcGxpZmll
ZCgpIGludGVyZmFjZSBhbmQKPiBmYWN0b3Igb3V0IHRoYXQgY29kZSB3aGVuIHdlIGNhbiBzZWUg
dGhlIHBhdHRlcm4uCgpBZnRlciB0aGlzIHNlcmllcyBkZXZtX21lbXJlbWFwX3BhZ2VzIGFscmVh
ZHkgaXMgc2ltcGxlciB0byB1c2UgdGhhbgpobW1fZGV2aWNlX2FkZF9yZXNvdXJjZSB3YXMgYmVm
b3JlLCBzbyBJJ20gbm90IHdvcnJpZWQgYXQgYWxsLiAgVGhlCnNlcmllcyBhY3R1YWxseSBuZXQg
cmVtb3ZlcyBsaW5lcyBmcm9tIG5vdmVhdSAoaWYgb25seSBhIGZldykuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
