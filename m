Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8798771D97
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 19:23:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F5826E320;
	Tue, 23 Jul 2019 17:23:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC34789E19;
 Tue, 23 Jul 2019 17:23:36 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 4F84E68B02; Tue, 23 Jul 2019 19:23:35 +0200 (CEST)
Date: Tue, 23 Jul 2019 19:23:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190723172335.GA2846@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-5-hch@lst.de> <20190723151824.GL15331@mellanox.com>
 <20190723163048.GD1655@lst.de> <20190723171731.GD15357@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723171731.GD15357@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 4/6] nouveau: unlock mmap_sem on all errors
 from nouveau_range_fault
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6MTc6MzFQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFRoYXQgcmVtaW5kcyBtZSwgdGhpcyBjb2RlIGlzIGFsc28gbGVha2luZyBobW1f
cmFuZ2VfdW5yZWdpc3RlcigpIGluCj4gdGhlIHN1Y2Nlc3MgcGF0aCwgcmlnaHQ/CgpObywgdGhh
dCBpcyBkb25lIGJ5IGhtbV92bWFfcmFuZ2VfZG9uZSAvIG5vdXZlYXVfcmFuZ2VfZG9uZSBmb3Ig
dGhlCnN1Y2Nlc3MgcGF0aC4KCj4gCj4gSSB0aGluayB0aGUgcmlnaHQgd2F5IHRvIHN0cnVjdHVy
ZSB0aGlzIGlzIHRvIG1vdmUgdGhlIGdvdG8gYWdhaW4gYW5kCj4gcmVsYXRlZCBpbnRvIHRoZSBu
b3V2ZWF1X3JhbmdlX2ZhdWx0KCkgc28gdGhlIHdob2xlIHJldHJ5IGFsZ29yaXRobSBpcwo+IHNl
bnNpYmx5IHNlbGYgY29udGFpbmVkLgoKVGhlbiB3ZSdkIHRha2Ugc3ZtbS0+bXV0ZXggaW5zaWRl
IHRoZSBoZWxwZXIgYW5kIGxldCB0aGUgY2FsbGVyCnVubG9jayB0aGF0LiAgRWl0aGVyIHdheSBp
dCBpcyBhIGJpdCBvZiBhIG1lc3MsIGFuZCBJJ2QgcmF0aGVyIHByZWZlcgppZiBzb21lb25lIGhh
cyB0aGUgaGFyZHdhcmUgd291bGQgZG8gYSBncmFuZCByZXdyaXRlIG9mIHRoaXMgcGF0aApldmVu
dHVhbGx5LiAgQWx0ZXJuYXRpdmVseSBpZiBubyBvbmUgc2lnbnMgdXAgdG8gbWFpbmFpbiB0aGlz
IGNvZGUKd2Ugc2hvdWxkIGV2ZW50dWFsbHkgZHJvcCBpdCBnaXZlbiB0aGUgc3RhZ2luZyBzdGF0
dXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
