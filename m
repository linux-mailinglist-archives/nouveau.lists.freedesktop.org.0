Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE183732CC
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 17:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91CAB6E5D2;
	Wed, 24 Jul 2019 15:33:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A3DD6E5D2;
 Wed, 24 Jul 2019 15:33:08 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id E22EC68B20; Wed, 24 Jul 2019 17:33:05 +0200 (CEST)
Date: Wed, 24 Jul 2019 17:33:05 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190724153305.GA10681@lst.de>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
 <20190724070553.GA2523@lst.de> <20190724152858.GB28493@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190724152858.GB28493@ziepe.ca>
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, Michal Hocko <mhocko@suse.com>,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Ben Skeggs <bskeggs@redhat.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMjQsIDIwMTkgYXQgMTI6Mjg6NThQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEh1bW0uIEFjdHVhbGx5IGhhdmluZyBsb29rZWQgdGhpcyBzb21lIG1vcmUsIEkg
d29uZGVyIGlmIHRoaXMgaXMgYQo+IHByb2JsZW06CgpXaGF0IGEgbWVzcy4KClF1ZXN0aW9uOiBk
byB3ZSBldmVuIGNhcmUgZm9yIHRoZSBub24tYmxvY2tpbmcgZXZlbnRzPyAgVGhlIG9ubHkgcGxh
Y2UKd2hlcmUgbW11X25vdGlmaWVyX2ludmFsaWRhdGVfcmFuZ2Vfc3RhcnRfbm9uYmxvY2sgaXMg
Y2FsbGVkIGlzIHRoZSBvb20Ka2lsbGVyLCB3aGljaCBtZWFucyB0aGUgcHJvY2VzcyBpcyBhYm91
dCB0byBkaWUgYW5kIHRoZSBwYWdldGFibGUgd2lsbApnZXQgdG9ybiBkb3duIEFTQVAuICBTaG91
bGQgd2UganVzdCBza2lwIHRoZW0gdW5jb25kaXRpb25hbGx5PyAgbm91dmVhdQphbHJlYWR5IGRv
ZXMgc28sIGJ1dCBhbWRncHUgY3VycmVudGx5IHRyaWVzIHRvIGhhbmRsZSB0aGUgbm9uLWJsb2Nr
aW5nCm5vdGlmaWNhdGlvbnMuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
