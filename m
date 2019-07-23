Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 182A271CD3
	for <lists+nouveau@lfdr.de>; Tue, 23 Jul 2019 18:23:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A156E30C;
	Tue, 23 Jul 2019 16:23:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD4616E30C;
 Tue, 23 Jul 2019 16:23:51 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id DA76168B02; Tue, 23 Jul 2019 18:23:38 +0200 (CEST)
Date: Tue, 23 Jul 2019 18:23:38 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190723162338.GC1655@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
 <20190722094426.18563-4-hch@lst.de> <20190723145620.GK15331@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190723145620.GK15331@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 3/6] nouveau: remove the block parameter to
 nouveau_range_fault
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

T24gVHVlLCBKdWwgMjMsIDIwMTkgYXQgMDI6NTY6MjRQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIE1vbiwgSnVsIDIyLCAyMDE5IGF0IDExOjQ0OjIzQU0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVGhlIHBhcmFtZXRlciBpcyBhbHdheXMgZmFsc2UsIHNv
IHJlbW92ZSBpdCBhcyB3ZWxsIGFzIHRoZSAtRUFHQUlOCj4gPiBoYW5kbGluZyB0aGF0IGNhbiBv
bmx5IGhhcHBlbiBmb3IgdGhlIG5vbi1ibG9ja2luZyBjYXNlLgo+IAo+ID8gRGlkIHRoZSBFQUdB
SU4gaGFuZGxpbmcgZ2V0IHJlbW92ZWQgaW4gdGhpcyBwYXRjaD8KCk5vLiAgVGhlIG5leHQgcmV2
aXNpb24gd2lsbCByZW1vdmUgaXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
