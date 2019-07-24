Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41B0073A49
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 21:49:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 35B196E644;
	Wed, 24 Jul 2019 19:49:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21BF66E644;
 Wed, 24 Jul 2019 19:49:00 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E520F68B20; Wed, 24 Jul 2019 21:48:55 +0200 (CEST)
Date: Wed, 24 Jul 2019 21:48:55 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190724194855.GA15029@lst.de>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
 <20190724175858.GC6410@dhcp22.suse.cz> <20190724180837.GF28493@ziepe.ca>
 <20190724185617.GE6410@dhcp22.suse.cz> <20190724185910.GF6410@dhcp22.suse.cz>
 <20190724192155.GG28493@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724192155.GG28493@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH] mm/hmm: replace hmm_update with
 mmu_notifier_range
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
 Michal Hocko <mhocko@kernel.org>, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMDQ6MjE6NTVQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IElmIHdlIGNoYW5nZSB0aGUgcmVnaXN0ZXIgdG8ga2VlcCB0aGUgaGxpc3Qgc29y
dGVkIGJ5IGFkZHJlc3MgdGhlbiB3ZQo+IGNhbiBkbyBhIHRhcmdldHRlZCAndW5kbycgb2YgcGFz
dCBzdGFydHMgdGVybWluYXRlZCBieSBhZGRyZXNzCj4gbGVzcy10aGFuIGNvbXBhcmlzb24gb2Yg
dGhlIGZpcnN0IGZhaWxpbmcgc3RydWN0IG1tdV9ub3RpZmllci4KPiAKPiBJdCByZWxpZXMgb24g
dGhlIGZhY3QgdGhhdCByY3UgaXMgb25seSB1c2VkIHRvIHJlbW92ZSBpdGVtcywgdGhlIGxpc3QK
PiBhZGRzIGFyZSBhbGwgcHJvdGVjdGVkIGJ5IG1tIGxvY2tzLCBhbmQgdGhlIG51bWJlciBvZiBt
bXUgbm90aWZpZXJzIGlzCj4gdmVyeSBzbWFsbC4KPiAKPiBUaGlzIHNlZW1zIHdvcmthYmxlIGFu
ZCBkb2VzIG5vdCBuZWVkIG1vcmUgZHJpdmVyIHJldmlldy91cGRhdGUuLi4KPiAKPiBIb3dldmVy
LCBobW0ncyBpbXBsZW1lbnRhdGlvbiBzdGlsbCBuZWVkcyBtb3JlIGZpeGluZy4KCkNhbiB3ZSB0
YWtlIG9uZSBzdGVwIGJhY2ssIHBsZWFzZT8gIFRoZSBvbmx5IHJlYXNvbiB3aHkgZHJpdmVycwpp
bXBsZW1lbnQgYm90aCAtPmludmFsaWRhdGVfcmFuZ2Vfc3RhcnQgYW5kIC0+aW52YWxpZGF0ZV9y
YW5nZV9lbmQgYW5kCmV4cGVjdCB0aGVtIHRvIGJlIGNhbGxlZCBwYWlyZWQgaXMgdG8ga2VlcCBz
b21lIGZvcm0gb2YgY291bnRlciBvZgphY3RpdmUgaW52YWxpZGF0aW9uICJzZWN0aW9ucyIuICBT
byBpbnN0ZWFkIG9mIGRvY3RvcmluZyBhcm91bmQKdW5kbyBzY2hlbWVzIHRoZSBvbmx5IHNhbmUg
YW5zd2VyIGlzIHRvIHRha2Ugc3VjaCBhIGNvdW50ZXIgaW50byB0aGUKY29yZSBWTSBjb2RlIGlu
c3RlYWQgb2YgaGF2aW5nIGVhY2ggZHJpdmVyIHN0cnVnZ2xlIHdpdGggaXQuCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
