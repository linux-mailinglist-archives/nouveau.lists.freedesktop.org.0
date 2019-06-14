Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 519A745520
	for <lists+nouveau@lfdr.de>; Fri, 14 Jun 2019 08:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8CD58932E;
	Fri, 14 Jun 2019 06:57:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8D2B68932E;
 Fri, 14 Jun 2019 06:57:25 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id CC60468B02; Fri, 14 Jun 2019 08:47:16 +0200 (CEST)
Date: Fri, 14 Jun 2019 08:47:16 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190614064716.GN7246@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
 <20190613094326.24093-22-hch@lst.de> <20190613200150.GB22062@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613200150.GB22062@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 21/22] mm: remove the HMM config option
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDg6MDE6NTVQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IE9uIFRodSwgSnVuIDEzLCAyMDE5IGF0IDExOjQzOjI0QU0gKzAyMDAsIENocmlz
dG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gQWxsIHRoZSBtbS9obW0uYyBjb2RlIGlzIGJldHRlciBr
ZXllZCBvZmYgSE1NX01JUlJPUi4gIEFsc28gbGV0IG5vdXZlYXUKPiA+IGRlcGVuZCBvbiBpdCBp
bnN0ZWFkIG9mIHRoZSBtaXggb2YgYSBkdW1teSBkZXBlbmRlbmN5IHN5bWJvbCBwbHVzIHRoZQo+
ID4gYWN0dWFsbHkgc2VsZWN0ZWQgb25lLiAgRHJvcCB2YXJpb3VzIG9kZCBkZXBlbmRlbmNpZXMs
IGFzIHRoZSBjb2RlIGlzCj4gPiBwcmV0dHkgcG9ydGFibGUuCj4gCj4gSSBkb24ndCByZWFsbHkg
a25vdywgYnV0IEkgdGhvdWdodCB0aGlzIG5lZWRlZCB0aGUgYXJjaCByZXN0cmljdGlvbgo+IGZv
ciB0aGUgc2FtZSByZWFzb24gZ2V0X3VzZXJfcGFnZXMgaGFzIHZhcmlvdXMgdW5pcXVlIGFyY2gg
c3BlY2lmaWMKPiBpbXBsZW1lbnRhdGlvbnMgKGl0IGRvZXMgc2VlbSB0byBoYXZlIHNvbWUgb3Bl
biBjb2RlZCBHVVAgbGlrZSB0aGluZyk/Cj4gCj4gSSB3YXMgaG9waW5nIHdlIGNvdWxkIGRvIHRo
aXMgYWZ0ZXIgeW91ciBjb21tb24gZ3VwIHNlcmllcz8gQnV0IHNvb25lcgo+IGlzIGJldHRlciB0
b28uCgpPaywgSSd2ZSBhZGRlZCB0aGUgYXJjaCBhbmQgNjQtYml0IGRlcGVuZGVuY3kgYmFjayBp
biBmb3Igbm93LiAgSXQgZG9lcwpub3QgbG9vayBwcm9wZXIgdG8gbWUsIGFuZCBpcyBjZXJ0YWlu
bHkgdW5kZXJkb2N1bWVudGVkLCBidXQgdGhlIHdob2xlCnBhZ2V0YWJsZSB3YWxraW5nIGNvZGUg
d2lsbCBuZWVkIGEgbG90IG9mIGxvdmUgZXZlbnR1YWxseSBhbnl3YXksIGFuZAp0aGUgS2NvbmZp
ZyBzdHVmZiBmb3IgaXQgY2FuIGJlIGRvbmUgcHJvcGVybHkgdGhlbi4KX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
