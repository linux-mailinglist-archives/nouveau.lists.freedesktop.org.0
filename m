Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F41CFB0A46
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 10:26:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 379B76EC53;
	Thu, 12 Sep 2019 08:26:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7311A6EC53;
 Thu, 12 Sep 2019 08:26:18 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 573D1227A81; Thu, 12 Sep 2019 10:26:13 +0200 (CEST)
Date: Thu, 12 Sep 2019 10:26:13 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190912082613.GA14368@lst.de>
References: <20190911222829.28874-1-rcampbell@nvidia.com>
 <20190911222829.28874-2-rcampbell@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190911222829.28874-2-rcampbell@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 1/4] mm/hmm: make full use of walk_page_range()
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

PiArc3RhdGljIGludCBobW1fcGZuc19maWxsKHVuc2lnbmVkIGxvbmcgYWRkciwKPiArCQkJIHVu
c2lnbmVkIGxvbmcgZW5kLAo+ICsJCQkgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4gKwkJCSBl
bnVtIGhtbV9wZm5fdmFsdWVfZSB2YWx1ZSkKCk5pdDogY2FuIHdlIHVzZSB0aGUgc3BhY2UgYSBs
aXR0bGUgbW9yZSBlZmZpY2llbnQsIGUuZy46CgpzdGF0aWMgaW50IGhtbV9wZm5zX2ZpbGwodW5z
aWduZWQgbG9uZyBhZGRyLCB1bnNpZ25lZCBsb25nIGVuZCwKCQlzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSwgZW51bSBobW1fcGZuX3ZhbHVlX2UgdmFsdWUpCgo+ICtzdGF0aWMgaW50IGhtbV92bWFf
d2Fsa190ZXN0KHVuc2lnbmVkIGxvbmcgc3RhcnQsCj4gKwkJCSAgICAgdW5zaWduZWQgbG9uZyBl
bmQsCj4gKwkJCSAgICAgc3RydWN0IG1tX3dhbGsgKndhbGspCgpTYW1lIGhlcmUuCgo+ICsJaWYg
KCEodm1hLT52bV9mbGFncyAmIFZNX1JFQUQpKSB7Cj4gKwkJKHZvaWQpIGhtbV9wZm5zX2ZpbGwo
c3RhcnQsIGVuZCwgcmFuZ2UsIEhNTV9QRk5fTk9ORSk7CgpUaGVyZSBzaG91bGQgYmUgbm8gbmVl
ZCBmb3IgdGhlIHZvaWQgY2FzdCBoZXJlLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
