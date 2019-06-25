Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E25454E17
	for <lists+nouveau@lfdr.de>; Tue, 25 Jun 2019 13:59:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB7C86E0E7;
	Tue, 25 Jun 2019 11:59:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73D6E6E0E7;
 Tue, 25 Jun 2019 11:59:55 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id D3FF468B05; Tue, 25 Jun 2019 13:59:21 +0200 (CEST)
Date: Tue, 25 Jun 2019 13:59:21 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190625115921.GA3874@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-19-hch@lst.de> <20190620192648.GI12083@dhcp22.suse.cz>
 <20190625072915.GD30350@lst.de> <20190625114422.GA3118@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190625114422.GA3118@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 Michal Hocko <mhocko@kernel.org>, "linux-mm@kvack.org" <linux-mm@kvack.org>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdW4gMjUsIDIwMTkgYXQgMTE6NDQ6MjhBTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFdoaWNoIHRyZWUgYW5kIHdoYXQgZG9lcyB0aGUgcmVzb2x1dGlvbiBsb29rIGxp
a2U/CgpMb29rcyBsaWtlIGluIC1tbS4gIFRoZSBjdXJyZW50IGNvbW1pdCBpbiBsaW51eC1uZXh0
IGlzOgoKY29tbWl0IDBkMjNiMDQyZjI2OTU1ZmIzNTcyMTgxN2JlYjk4YmE3ZjFkOWVkOWYKQXV0
aG9yOiBSb2JpbiBNdXJwaHkgPHJvYmluLm11cnBoeUBhcm0uY29tPgpEYXRlOiAgIEZyaSBKdW4g
MTQgMTA6NDI6MTQgMjAxOSArMTAwMAoKICAgIG1tOiBjbGVhbiB1cCBpc19kZXZpY2VfKl9wYWdl
KCkgZGVmaW5pdGlvbnMKCgo+IEFsc28sIEkgZG9uJ3Qgd2FudCB0byBiZSBtYWtpbmcgdGhlIGRl
Y2lzaW9uIGlmIHdlIHNob3VsZCBrZWVwL3JlbW92ZQo+IERFVklDRV9QVUJMSUMsIHNvIGxldCdz
IGdldCBhbiBBY2sgZnJvbSBBbmRyZXcvZXRjPwo+IAo+IE15IG1haW4gcmVsdWN0YW5jZSBpcyB0
aGF0IEkga25vdyB0aGVyZSBpcyBIVyBvdXQgdGhlcmUgdGhhdCBjYW4gZG8KPiBjb2hlcmVudCwg
YW5kIEkgd2FudCB0byBiZWxpZXZlIHRoZXkgYXJlIGNvbWluZyB3aXRoIHBhdGNoZXMsIGp1c3QK
PiB0b28gc2xvd2x5LiBCdXQgSSdkIGFsc28gcmF0aGVyIHRob3NlIHBlb3BsZSBkZWZlbmQgdGhl
bXNlbHZlcyA6UAoKTGV0cyBrZWVwIGV2ZXJ5dGhpbmcgYXMtaXMgZm9yIG5vdy4gIEknbSBwcmV0
dHkgY2VydGFpbiBub3RoaW5nCndpbGwgc2hvdyB1cCwgYnV0IGxldHRpbmcgdGhpcyBsaW5nZXIg
YW5vdGhlciByZWxlYXNlIG9yIHR3bwpzaG91bGRuJ3QgYmUgbXVjaCBvZiBhIHByb2JsZW0uICBB
bmQgaWYgd2UgdXJnZW50bHkgZmVlbCBsaWtlIHJlbW92aW5nCml0IHdlIGNhbiBkbyBpdCBhZnRl
ciAtcmMxLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
