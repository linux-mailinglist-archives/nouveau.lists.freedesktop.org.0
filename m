Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DBAD47073
	for <lists+nouveau@lfdr.de>; Sat, 15 Jun 2019 16:31:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E33489294;
	Sat, 15 Jun 2019 14:31:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28B0F89294;
 Sat, 15 Jun 2019 14:31:15 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 57B1468B02; Sat, 15 Jun 2019 16:30:44 +0200 (CEST)
Date: Sat, 15 Jun 2019 16:30:43 +0200
From: Christoph Hellwig <hch@lst.de>
To: John Hubbard <jhubbard@nvidia.com>
Message-ID: <20190615143043.GA27825@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-7-hch@lst.de>
 <56c130b1-5ed9-7e75-41d9-c61e73874cb8@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <56c130b1-5ed9-7e75-41d9-c61e73874cb8@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 06/22] mm: factor out a
 devm_request_free_mem_region helper
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
Cc: linux-nvdimm@lists.01.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMTQsIDIwMTkgYXQgMDc6MjE6NTRQTSAtMDcwMCwgSm9obiBIdWJiYXJkIHdy
b3RlOgo+IE9uIDYvMTMvMTkgMjo0MyBBTSwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiBL
ZWVwIHRoZSBwaHlzaWNhbCBhZGRyZXNzIGFsbG9jYXRpb24gdGhhdCBobW1fYWRkX2RldmljZSBk
b2VzIHdpdGggdGhlCj4gPiByZXN0IG9mIHRoZSByZXNvdXJjZSBjb2RlLCBhbmQgYWxsb3cgZnV0
dXJlIHJldXNlIG9mIGl0IHdpdGhvdXQgdGhlIGhtbQo+ID4gd3JhcHBlci4KPiA+IAo+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiAtLS0KPiA+ICBp
bmNsdWRlL2xpbnV4L2lvcG9ydC5oIHwgIDIgKysKPiA+ICBrZXJuZWwvcmVzb3VyY2UuYyAgICAg
IHwgMzkgKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrCj4gPiAgbW0vaG1t
LmMgICAgICAgICAgICAgICB8IDMzICsrKystLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gIDMgZmlsZXMgY2hhbmdlZCwgNDUgaW5zZXJ0aW9ucygrKSwgMjkgZGVsZXRpb25zKC0pCj4g
Cj4gU29tZSB0cml2aWFsIHR5cG9zIG5vdGVkIGJlbG93LCBidXQgdGhpcyBhY2N1cmF0ZWx5IG1v
dmVzIHRoZSBjb2RlCj4gaW50byBhIGhlbHBlciByb3V0aW5lLCBsb29rcyBnb29kLgoKVGhhbmtz
IGZvciB0aGUgdHlwbyBzcG90dGluZy4gIFRoZXNlIHR3byBhY3R1YWxseSB3ZXJlIGNvcHkgYW5k
IHBhc3RlZApmcm9tIHRoZSBvcmlnaW5hbCBobW0gY29kZSwgYnV0IEknbGwgZ2xhZGx5IGZpeCB0
aGVtIGZvciB0aGUgbmV4dAppdGVyYXRpb24uCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
