Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C585F728C8
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 09:06:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D31A6E459;
	Wed, 24 Jul 2019 07:05:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C78A6E459;
 Wed, 24 Jul 2019 07:05:57 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 715E168B20; Wed, 24 Jul 2019 09:05:54 +0200 (CEST)
Date: Wed, 24 Jul 2019 09:05:53 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190724070553.GA2523@lst.de>
References: <20190723210506.25127-1-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723210506.25127-1-rcampbell@nvidia.com>
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TG9va3MgZ29vZDoKClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
Ck9uZSBjb21tZW50IG9uIGEgcmVsYXRlZCBjbGVhbnVwOgoKPiAgCWxpc3RfZm9yX2VhY2hfZW50
cnkobWlycm9yLCAmaG1tLT5taXJyb3JzLCBsaXN0KSB7Cj4gIAkJaW50IHJjOwo+ICAKPiAtCQly
YyA9IG1pcnJvci0+b3BzLT5zeW5jX2NwdV9kZXZpY2VfcGFnZXRhYmxlcyhtaXJyb3IsICZ1cGRh
dGUpOwo+ICsJCXJjID0gbWlycm9yLT5vcHMtPnN5bmNfY3B1X2RldmljZV9wYWdldGFibGVzKG1p
cnJvciwgbnJhbmdlKTsKPiAgCQlpZiAocmMpIHsKPiAtCQkJaWYgKFdBUk5fT04odXBkYXRlLmJs
b2NrYWJsZSB8fCByYyAhPSAtRUFHQUlOKSkKPiArCQkJaWYgKFdBUk5fT04obW11X25vdGlmaWVy
X3JhbmdlX2Jsb2NrYWJsZShucmFuZ2UpIHx8Cj4gKwkJCSAgICByYyAhPSAtRUFHQUlOKSkKPiAg
CQkJCWNvbnRpbnVlOwo+ICAJCQlyZXQgPSAtRUFHQUlOOwo+ICAJCQlicmVhazsKClRoaXMgbWFn
aWMgaGFuZGxpbmcgb2YgZXJyb3Igc2VlbXMgb2RkLiAgSSB0aGluayB3ZSBzaG91bGQgbWVyZ2Ug
cmMgYW5kCnJldCBpbnRvIG9uZSB2YXJpYWJsZSBhbmQganVzdCBicmVhayBvdXQgaWYgYW55IGVy
cm9yIGhhcHBlbnMgaW5zdGVhZApvciBjbGFpbWluZyBpbiB0aGUgY29tbWVudHMgLUVBR0FJTiBp
cyB0aGUgb25seSB2YWxpZCBlcnJvciBhbmQgdGhlbgppZ25vcmluZyBhbGwgb3RoZXJzIGhlcmUu
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
