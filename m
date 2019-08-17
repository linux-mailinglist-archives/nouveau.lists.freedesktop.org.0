Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8AC591043
	for <lists+nouveau@lfdr.de>; Sat, 17 Aug 2019 13:31:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966E06E44D;
	Sat, 17 Aug 2019 11:31:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6E8A6E44D;
 Sat, 17 Aug 2019 11:31:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id D1B4A68B02; Sat, 17 Aug 2019 13:31:28 +0200 (CEST)
Date: Sat, 17 Aug 2019 13:31:28 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190817113128.GA23295@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
 <20190814075928.23766-2-hch@lst.de> <20190816171101.GK5412@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190816171101.GK5412@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 01/10] mm: turn migrate_vma upside down
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
 Bharata B Rao <bharata@linux.ibm.com>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBdWcgMTYsIDIwMTkgYXQgMDU6MTE6MDdQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IC0JaWYgKGFyZ3MtPmNwYWdlcykKPiAtCQltaWdyYXRlX3ZtYV9wcmVwYXJlKGFy
Z3MpOwo+IC0JaWYgKGFyZ3MtPmNwYWdlcykKPiAtCQltaWdyYXRlX3ZtYV91bm1hcChhcmdzKTsK
PiArCWlmICghYXJncy0+Y3BhZ2VzKQo+ICsJCXJldHVybiAwOwo+ICsKPiArCW1pZ3JhdGVfdm1h
X3ByZXBhcmUoYXJncyk7Cj4gKwltaWdyYXRlX3ZtYV91bm1hcChhcmdzKTsKCkkgZG9uJ3QgdGhp
bmsgdGhpcyBpcyBvay4gIEJvdGggbWlncmF0ZV92bWFfcHJlcGFyZSBhbmQgbWlncmF0ZV92bWFf
dW5tYXAKY2FuIHJlZHVjZSBhcmdzLT5jcGFnZXMsIGluY2x1ZGluZyBwb3NzaWJseSB0byAwLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
