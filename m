Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BB5B637EB
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2019 16:30:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EAD589AE6;
	Tue,  9 Jul 2019 14:30:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 923A289AE6;
 Tue,  9 Jul 2019 14:30:40 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C51FA68B02; Tue,  9 Jul 2019 16:30:38 +0200 (CEST)
Date: Tue, 9 Jul 2019 16:30:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190709143038.GA3092@lst.de>
References: <20190703220214.28319-1-hch@lst.de>
 <20190705123336.GA31543@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190705123336.GA31543@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] hmm_range_fault related fixes and legacy API removal
 v2
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
 linux-mm@kvack.org, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdWwgMDUsIDIwMTkgYXQgMDk6MzM6MzZBTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFdlZCwgSnVsIDAzLCAyMDE5IGF0IDAzOjAyOjA4UE0gLTA3MDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gSGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCj4gPiAK
PiA+IGJlbG93IGlzIGEgc2VyaWVzIGFnYWluc3QgdGhlIGhtbSB0cmVlIHdoaWNoIGZpeGVzIHVw
IHRoZSBtbWFwX3NlbQo+ID4gbG9ja2luZyBpbiBub3V2ZWF1IGFuZCB3aGlsZSBhdCBpdCBhbHNv
IHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzCj4gPiBvbmx5IHVzZWQgYnkgbm91dmVh
dS4KPiAKPiBBcyBtdWNoIGFzIEkgbGlrZSB0aGlzIHNlcmllcywgaXQgd29uJ3QgbWFrZSBpdCB0
byB0aGlzIG1lcmdlIHdpbmRvdywKPiBzb3JyeS4KCk5vdGUgdGhhdCBwYXRjaCA0IGZpeGVzIGEg
cHJldHR5IHNldmVyZSBsb2NraW5nIGJ1ZywgYW5kIDEtMyBpcyBqdXN0CnByZXBhcmF0aW9uIGZv
ciB0aGF0LiAgCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
