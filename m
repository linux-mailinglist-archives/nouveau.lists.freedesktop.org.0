Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91449490A4
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 21:55:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EACB789A35;
	Mon, 17 Jun 2019 19:55:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A33C89B69;
 Mon, 17 Jun 2019 19:55:55 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 82B6768B02; Mon, 17 Jun 2019 21:55:26 +0200 (CEST)
Date: Mon, 17 Jun 2019 21:55:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190617195526.GB20275@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-9-hch@lst.de>
 <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4i_0wUJHDqY91R=x5M2o_De+_QKZxPyob5=E9CCv8rM7A@mail.gmail.com>
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Logan Gunthorpe <logang@deltatee.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6NTE6MzVBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ID4gLSAgICAgICBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwID0gX3BnbWFwOwo+IAo+
IFdob29wcywgbmVlZGVkIHRvIGtlZXAgdGhpcyBsaW5lIHRvIGF2b2lkOgo+IAo+IHRvb2xzL3Rl
c3RpbmcvbnZkaW1tL3Rlc3QvaW9tYXAuYzoxMDk6MTE6IGVycm9yOiDigJhwZ21hcOKAmSB1bmRl
Y2xhcmVkCj4gKGZpcnN0IHVzZSBpbiB0aGlzIGZ1bmN0aW9uKTsgZGlkIHlvdSBtZWFuIOKAmF9w
Z21hcOKAmT8KClNvIEkgcmVhbGx5IHNob3VsZG4ndCBiZSB0cmlwcGluZyBvdmVyIHRoaXMgYW55
bW9yZSwgYnV0IGNhbiB3ZSBzb21laG93CnRoaXMgbWVzcz8KCiAtIGF0IGxlYXN0IGFkZCBpdCB0
byB0aGUgbm9ybWFsIGJ1aWxkIHN5c3RlbSBhbmQga2NvbmZpZyBkZXBzIGluc3RlYWQKICAgb2Yg
c3Rhc2hpbmcgaXQgYXdheSBzbyB0aGF0IHRoaW5ncyBsaWtlIGJ1aWxkYm90IGNhbiBidWlsZCBp
dD8KIC0gYXQgbGVhc3QgYWxsb3cgYnVpbGRpbmcgaXQgKHVuZGVyIENPTVBJTEVfVEVTVCkgaWYg
bmVlZGVkIGV2ZW4gd2hlbgogICBwbWVtLmtvIGFuZCBmcmllbmRzIGFyZSBidWlsdCBpbiB0aGUg
a2VybmVsPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
