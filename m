Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EC46E9C0CB
	for <lists+nouveau@lfdr.de>; Sun, 25 Aug 2019 00:39:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEEC6E0E8;
	Sat, 24 Aug 2019 22:39:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F6586E0E8;
 Sat, 24 Aug 2019 22:39:10 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id BB04B68B02; Sun, 25 Aug 2019 00:39:07 +0200 (CEST)
Date: Sun, 25 Aug 2019 00:39:07 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190824223907.GB21891@lst.de>
References: <20190823221753.2514-1-rcampbell@nvidia.com>
 <20190823221753.2514-3-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190823221753.2514-3-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 2/2] mm/hmm: hmm_range_fault() infinite loop
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, amd-gfx@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMjMsIDIwMTkgYXQgMDM6MTc6NTNQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gTm9ybWFsbHksIGNhbGxlcnMgdG8gaGFuZGxlX21tX2ZhdWx0KCkgYXJlIHN1cHBv
c2VkIHRvIGNoZWNrIHRoZQo+IHZtYS0+dm1fZmxhZ3MgZmlyc3QuIGhtbV9yYW5nZV9mYXVsdCgp
IGNoZWNrcyBmb3IgVk1fUkVBRCBidXQgZG9lc24ndAo+IGNoZWNrIGZvciBWTV9XUklURSBpZiB0
aGUgY2FsbGVyIHJlcXVlc3RzIGEgcGFnZSB0byBiZSBmYXVsdGVkIGluCj4gd2l0aCB3cml0ZSBw
ZXJtaXNzaW9uICh2aWEgdGhlIGhtbV9yYW5nZS5wZm5zW10gdmFsdWUpLgo+IElmIHRoZSB2bWEg
aXMgd3JpdGUgcHJvdGVjdGVkLCB0aGlzIGNhbiByZXN1bHQgaW4gYW4gaW5maW5pdGUgbG9vcDoK
PiAgIGhtbV9yYW5nZV9mYXVsdCgpCj4gICAgIHdhbGtfcGFnZV9yYW5nZSgpCj4gICAgICAgLi4u
Cj4gICAgICAgaG1tX3ZtYV93YWxrX2hvbGUoKQo+ICAgICAgICAgaG1tX3ZtYV93YWxrX2hvbGVf
KCkKPiAgICAgICAgICAgaG1tX3ZtYV9kb19mYXVsdCgpCj4gICAgICAgICAgICAgaGFuZGxlX21t
X2ZhdWx0KEZBVUxUX0ZMQUdfV1JJVEUpCj4gICAgICAgICAgICAgLyogcmV0dXJucyBWTV9GQVVM
VF9XUklURSAqLwo+ICAgICAgICAgICAvKiByZXR1cm5zIC1FQlVTWSAqLwo+ICAgICAgICAgLyog
cmV0dXJucyAtRUJVU1kgKi8KPiAgICAgICAvKiByZXR1cm5zIC1FQlVTWSAqLwo+ICAgICAvKiBs
b29wcyBvbiAtRUJVU1kgYW5kIHJhbmdlLT52YWxpZCAqLwo+IFByZXZlbnQgdGhpcyBieSBjaGVj
a2luZyBmb3Igdm1hLT52bV9mbGFncyAmIFZNX1dSSVRFIGJlZm9yZSBjYWxsaW5nCj4gaGFuZGxl
X21tX2ZhdWx0KCkuCj4gCj4gU2lnbmVkLW9mZi1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVs
bEBudmlkaWEuY29tPgoKTG9va3MgZ29vZCwKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdp
ZyA8aGNoQGxzdC5kZT4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
