Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3500E5ED80
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 22:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A4CA6E1D6;
	Wed,  3 Jul 2019 20:29:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 681A46E1D6;
 Wed,  3 Jul 2019 20:28:59 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BA28168B05; Wed,  3 Jul 2019 22:28:57 +0200 (CEST)
Date: Wed, 3 Jul 2019 22:28:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190703202857.GA15690@lst.de>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-2-hch@lst.de> <20190703190045.GN18688@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190703190045.GN18688@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 1/5] mm: return valid info from
 hmm_range_unregister
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

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDc6MDA6NTBQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgZG9uJ3QgdGhpbmsgdGhlIEFQSSBzaG91bGQgYmUgZW5jb3VyYWdpbmcgc29t
ZSBzaG9ydGN1dCBoZXJlLi4KPiAKPiBXZSBjYW4ndCBkbyB0aGUgYWJvdmUgcGF0dGVybiBiZWNh
dXNlIHRoZSBvbGQgaG1tX3ZtYSBBUEkgZGlkbid0IGFsbG93Cj4gaXQsIHdoaWNoIGlzIHByZXN1
bWFibHkgYSByZWFzb24gd2h5IGl0IGlzIG9ic29sZXRlLgo+IAo+IEknZCByYXRoZXIgc2VlIGRy
aXZlcnMgbW92ZSB0byBhIGNvbnNpc3RlbnQgcGF0dGVybiBzbyB3ZSBjYW4gdGhlbgo+IGVhc2ls
eSBob2lzdCB0aGUgc2VxY291bnQgbG9jayBzY2hlbWUgaW50byBzb21lIGNvbW1vbiBtbXUgbm90
aWZpZXIKPiBjb2RlLCBhcyBkaXNjdXNzZWQuCgpTbyB5b3UgZG9uJ3QgbGlrZSB0aGUgdmVyc2lv
biBpbiBhbWRncHVfdHRtX3R0X2dldF91c2VyX3BhZ2VzX2RvbmUgaW4KbGludXgtbmV4dCBlaXRo
ZXI/CgpJIGNhbiByZW1vdmUgdGhpcyBhbmQganVzdCBtb3ZlIGhtbV92bWFfcmFuZ2VfZG9uZSB0
byBub3V2ZWF1IGluc3RlYWQuCkxldCBtZSBrbm93IGlmIHlvdSBoYXZlIG90aGVyIGNvbW1lbnRz
IGJlZm9yZSBJIHJlc2VuZC4gIE5vdGUgdGhhdApJJ2xsIHByb2JhYmx5IGJlIG9mZmxpbmUgVGh1
LVN1biB0aGlzIHdlZWsuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
