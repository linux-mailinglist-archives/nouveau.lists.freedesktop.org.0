Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 341C1454DD
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:39:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F5A889316;
	Fri, 14 Jun 2019 06:39:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8233B89316;
 Fri, 14 Jun 2019 06:39:55 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id D92E768B02; Fri, 14 Jun 2019 08:39:26 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:39:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190614063926.GL7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-18-hch@lst.de> <20190613194239.GX22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613194239.GX22062@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 17/22] mm: remove hmm_devmem_add
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
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDc6NDI6NDNQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjIwQU0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gVGhlcmUgaXNuJ3QgcmVhbGx5IG11Y2ggdmFsdWUgYWRk
IGluIHRoZSBobW1fZGV2bWVtX2FkZCB3cmFwcGVyLiAgSnVzdAo+ID4gZmFjdG9yIG91dCBhIGxp
dHRsZSBoZWxwZXIgdG8gZmluZCB0aGUgcmVzb3VyY2UsIGFuZCBvdGhlcndpc2UgbGV0IHRoZQo+
ID4gZHJpdmVyIGltcGxlbWVudCB0aGUgZGV2X3BhZ2VtYXBfb3BzIGRpcmVjdGx5Lgo+IAo+IFdh
cyB0aGlzIGNvbW1pdCBtZXNzYWdlIHdyaXR0ZW4gd2hlbiBvdGhlciBwYXRjaGVzIHdlcmUgc3F1
YXNoZWQgaW4KPiBoZXJlPyBJIHRoaW5rIHRoZSBoZWxwZXIgdGhpcyBtZW50aW9ucyB3YXMgZnJv
bSBhbiBlYXJsaWVyIHBhdGNoCgpZZXMsIGl0IHdhcyB3cml0dGVuIGJlZm9yZSBhIGxvdCBvZiBi
aXRzIHdlcmUgc3BsaXQgb3V0LiAgSSd2ZSB1cGRhdGVkCml0IGZvciB0aGUgbmV4dCB2ZXJzaW9u
LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
