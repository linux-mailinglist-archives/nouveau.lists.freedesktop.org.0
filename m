Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4C745D827
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 00:47:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 858946E09C;
	Tue,  2 Jul 2019 22:47:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DFFE6E09C;
 Tue,  2 Jul 2019 22:47:35 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9F50E68B20; Wed,  3 Jul 2019 00:47:31 +0200 (CEST)
Date: Wed, 3 Jul 2019 00:47:31 +0200
From: Christoph Hellwig <hch@lst.de>
To: "Weiny, Ira" <ira.weiny@intel.com>
Message-ID: <20190702224731.GA23841@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
 <20190701082517.GA22461@lst.de> <20190702184201.GO31718@mellanox.com>
 <2807E5FD2F6FDA4886F6618EAC48510E79DEA747@CRSMSX101.amr.corp.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2807E5FD2F6FDA4886F6618EAC48510E79DEA747@CRSMSX101.amr.corp.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] dev_pagemap related cleanups v4
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>, "Williams,
 Dan J" <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMDIsIDIwMTkgYXQgMTA6NDU6MzRQTSArMDAwMCwgV2VpbnksIElyYSB3cm90
ZToKPiA+IAo+ID4gT24gTW9uLCBKdWwgMDEsIDIwMTkgYXQgMTA6MjU6MTdBTSArMDIwMCwgQ2hy
aXN0b3BoIEhlbGx3aWcgd3JvdGU6Cj4gPiA+IEFuZCBJJ3ZlIGRlbW9uc3RyYXRlZCB0aGF0IEkg
Y2FuJ3Qgc2VuZCBwYXRjaCBzZXJpZXMuLiAgV2hpbGUgdGhpcyBoYXMKPiA+ID4gYWxsIHRoZSBy
aWdodCBwYXRjaGVzLCBpdCBhbHNvIGhhcyB0aGUgZXh0cmEgcGF0Y2hlcyBhbHJlYWR5IGluIHRo
ZQo+ID4gPiBobW0gdHJlZSwgYW5kIGZvdXIgZXh0cmEgcGF0Y2hlcyBJIHdhbnRlZCB0byBzZW5k
IG9uY2UgdGhpcyBzZXJpZXMgaXMKPiA+ID4gbWVyZ2VkLiAgSSdsbCBnaXZlIHVwIGZvciBub3cs
IHBsZWFzZSB1c2UgdGhlIGdpdCB1cmwgZm9yIGFueXRoaW5nCj4gPiA+IHNlcmlvdXMsIGFzIGl0
IGNvbnRhaW5zIHRoZSByaWdodCB0aGluZy4KPiA+IAo+ID4gT2theSwgSSBzb3J0ZWQgaXQgYWxs
IG91dCBhbmQgdGVtcG9yYXJpbHkgcHV0IGl0IGhlcmU6Cj4gPiAKPiA+IGh0dHBzOi8vZ2l0aHVi
LmNvbS9qZ3VudGhvcnBlL2xpbnV4L2NvbW1pdHMvaG1tCj4gPiAKPiA+IEJpdCBpbnZvbHZlZCBq
b2I6Cj4gPiAtIFRvb2sgSXJhJ3MgdjQgcGF0Y2ggaW50byBobW0uZ2l0IGFuZCBjb25maXJtZWQg
aXQgbWF0Y2hlcyB3aGF0Cj4gPiAgIEFuZHJldyBoYXMgaW4gbGludXgtbmV4dCBhZnRlciBhbGwg
dGhlIGZpeHVwcwo+IAo+IExvb2tpbmcgYXQgdGhlIGZpbmFsIGJyYW5jaCBzZWVtcyBnb29kLgoK
TG9va3MgZ29vZCB0byBtZSBhcyB3ZWxsLgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
