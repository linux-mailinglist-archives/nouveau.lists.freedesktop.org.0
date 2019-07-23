Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7345371CF8
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 18:32:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4150B6E2F8;
	Tue, 23 Jul 2019 16:32:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A6F726E2F8;
 Tue, 23 Jul 2019 16:32:46 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 1084268B02; Tue, 23 Jul 2019 18:32:45 +0200 (CEST)
Date: Tue, 23 Jul 2019 18:32:44 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190723163244.GE1655@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
 <20190723152737.GO15331@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723152737.GO15331@mellanox.com>
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDM6Mjc6NDFQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IElnbm9yaW5nIHRoZSBTVEFHSU5HIGlzc3VlIEkndmUgdHJpZWQgdG8gdXNlIHRo
ZSBzYW1lIGd1aWRlbGluZSBhcyBmb3IKPiAtc3RhYmxlIGZvciAtcmMgLi4gCj4gCj4gU28gdGhp
cyBpcyBhIHJlYWwgcHJvYmxlbSwgd2UgZGVmaW5pdGVseSBoaXQgdGhlIGxvY2tpbmcgYnVncyBp
ZiB3ZQo+IHJldHJ5L2V0YyB1bmRlciBzdHJlc3MsIHNvIEkgd291bGQgYmUgT0sgdG8gc2VuZCBp
dCB0byBMaW51cyBmb3IKPiBlYXJseS1yYy4KPiAKPiBIb3dldmVyLCBpdCBkb2Vzbid0IGxvb2sg
bGlrZSB0aGUgMXN0IHBhdGNoIGlzIGZpeGluZyBhIGN1cnJlbnQgYnVnCj4gdGhvdWdoLCB0aGUg
b25seSBjYWxsZXJzIHVzZXMgYmxvY2tpbmcgPSB0cnVlLCBzbyBqdXN0IHRoZSBtaWRkbGUKPiB0
aHJlZSBhcmUgLXJjPwoKbm9uYmxvY2tpbmcgaXNuJ3QgdXNlZCBhbnl3aGVyLCBidXQgaXQgaXMg
YSBtYWpvciwgbWFqb3IgQVBJIGJ1Zy4KWW91ciBjYWxsLCBidXQgaWYgaXQgd2FzIG15IHRyZWUg
SSdkIHByb2JhYmx5IHNlbmQgaXQgdG8gTGludXMuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
