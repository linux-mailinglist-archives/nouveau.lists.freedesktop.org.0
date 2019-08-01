Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90A247D5F9
	for <lists+nouveau@lfdr.de>; Thu,  1 Aug 2019 09:01:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1BC196E3AC;
	Thu,  1 Aug 2019 07:01:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8DA56E3AC;
 Thu,  1 Aug 2019 07:01:54 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 8C39E68AFE; Thu,  1 Aug 2019 09:01:51 +0200 (CEST)
Date: Thu, 1 Aug 2019 09:01:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190801070151.GB15404@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-12-hch@lst.de> <20190730175309.GN24038@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730175309.GN24038@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 11/13] mm: cleanup the hmm_vma_handle_pmd stub
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
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDU6NTM6MTRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gLQkvKiBJZiBUSFAgaXMgbm90IGVuYWJsZWQgdGhlbiB3ZSBzaG91bGQgbmV2
ZXIgcmVhY2ggdGhpcyAKPiAKPiBUaGlzIG9sZCBjb21tZW50IHNheXMgd2Ugc2hvdWxkIG5ldmVy
IGdldCBoZXJlCj4gCj4gPiArfQo+ID4gKyNlbHNlIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdF
UEFHRSAqLwo+ID4gK3N0YXRpYyBpbnQgaG1tX3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBtbV93YWxr
ICp3YWxrLCB1bnNpZ25lZCBsb25nIGFkZHIsCj4gPiArCQl1bnNpZ25lZCBsb25nIGVuZCwgdWlu
dDY0X3QgKnBmbnMsIHBtZF90IHBtZCkKPiA+ICt7Cj4gPiAgCXJldHVybiAtRUlOVkFMOwo+IAo+
IFNvIGNvdWxkIHdlIGp1c3QgZG8KPiAgICAjZGVmaW5lIGhtbV92bWFfaGFuZGxlX3BtZCBOVUxM
Cj4gCj4gPwo+IAo+IEF0IHRoZSB2ZXJ5IGxlYXN0IHRoaXMgc2VlbXMgbGlrZSBhIFdBUk5fT04g
dG9vPwoKRGVzcGl0ZSB0aGUgbmFtZSBvZiB0aGUgZnVuY3Rpb24gaG1tX3ZtYV9oYW5kbGVfcG1k
IGlzIG5vdCBhIGNhbGxiYWNrCmZvciB0aGUgcGFnZXdhbGssIGJ1dCBhY3R1YWxseSBjYWxsZWQg
ZnJvbSBobW1fdm1hX2hhbmRsZV9wbWQuCgpXaGF0IHdlIGNvdWxkIHRyeSBpcyBqdXN0IGFuZCBl
bXB0eSBub24taW5saW5lIHByb3RvdHlwZSB3aXRob3V0IGFuCmFjdHVhbCBpbXBsZW1lbnRhdGlv
biwgd2hpY2ggbWVhbnMgaWYgdGhlIGNvbXBpbGVyIGRvZXNuJ3Qgb3B0aW1pemUKdGhlIGNhbGxz
IGF3YXkgd2UnbGwgZ2V0IGEgbGluayBlcnJvci4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
