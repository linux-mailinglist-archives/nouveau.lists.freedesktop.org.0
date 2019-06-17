Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22712490F7
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 22:10:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8954588BBA;
	Mon, 17 Jun 2019 20:10:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6923C6E090;
 Mon, 17 Jun 2019 20:10:28 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0673468B02; Mon, 17 Jun 2019 22:09:58 +0200 (CEST)
Date: Mon, 17 Jun 2019 22:09:57 +0200
From: Christoph Hellwig <hch@lst.de>
To: Logan Gunthorpe <logang@deltatee.com>
Message-ID: <20190617200957.GA20645@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
 <d68c5e4c-b2de-95c3-0b75-1f2391b25a34@deltatee.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <d68c5e4c-b2de-95c3-0b75-1f2391b25a34@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 08/25] memremap: move dev_pagemap callbacks
 into a separate structure
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDI6MDg6MTRQTSAtMDYwMCwgTG9nYW4gR3VudGhvcnBl
IHdyb3RlOgo+IEkganVzdCBub3RpY2VkIHRoaXMgaXMgbWlzc2luZyBhIGxpbmUgdG8gc2V0IHBn
bWFwLT5vcHMgdG8KPiBwY2lfcDJwZG1hX3BhZ2VtYXBfb3BzLiBJIG11c3QgaGF2ZSBnb3R0ZW4g
Y29uZnVzZWQgYnkgdGhlIG90aGVyIHVzZXJzCj4gaW4gbXkgb3JpZ2luYWwgcmV2aWV3LiBUaG91
Z2ggSSdtIG5vdCBzdXJlIGhvdyB0aGlzIGNvbXBpbGVzIGFzIHRoZSBuZXcKPiBzdHJ1Y3QgaXMg
c3RhdGljIGFuZCB1bnVzZWQuIEhvd2V2ZXIsIGl0IGlzIHJlbmRlcmVkIG1vb3QgaW4gUGF0Y2gg
MTYKPiB3aGVuIHRoaXMgaXMgYWxsIHJlbW92ZWQuCgpJdCBwcm9iYWJseSB3YXMgdGhlcmUgaW4g
dGhlIG9yaWdpbmFsIGFuZCBnb3QgbG9zdCBpbiB0aGUgbWVyZ2UgY29uZmxpY3RzCmZyb20gdGhl
IHJlYmFzZS4gIEkgc2hvdWxkIGhhdmUgZHJvcHBlZCBhbGwgdGhlIHJldmlld2VkLWJ5cyBmb3Ig
cGF0Y2hlcwp3aXRoIG5vbi10cml2aWFsIG1lcmdlIHJlc29sdXRpb24sIHNvcnJ5LgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
