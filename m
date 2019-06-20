Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DF7764C786
	for <lists+nouveau@lfdr.de>; Thu, 20 Jun 2019 08:33:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 185866E484;
	Thu, 20 Jun 2019 06:33:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3614C6E484;
 Thu, 20 Jun 2019 06:33:08 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id 0877068B05; Thu, 20 Jun 2019 08:32:37 +0200 (CEST)
Date: Thu, 20 Jun 2019 08:32:36 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@ziepe.ca>
Message-ID: <20190620063236.GE20765@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <CAPcyv4hBUJB2RxkDqHkfEGCupDdXfQSrEJmAdhLFwnDOwt8Lig@mail.gmail.com>
 <20190619094032.GA8928@lst.de> <20190619163655.GG9360@ziepe.ca>
 <CAPcyv4hYtQdg0DTYjrJxCNXNjadBSWQ5QaMJYsA-QSribKuwrQ@mail.gmail.com>
 <20190619181923.GJ9360@ziepe.ca>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190619181923.GJ9360@ziepe.ca>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] dev_pagemap related cleanups v2
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
 Linux MM <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 linux-pci@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMTksIDIwMTkgYXQgMDM6MTk6MjNQTSAtMDMwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+ID4gSnVzdCBtYWtlIHN1cmUgdGhhdCB3aGVuIHlvdSBiYWNrbWVyZ2UgdjUuMi1y
YzUgeW91IGhhdmUgYSBjbGVhcgo+ID4gcmVhc29uIGluIHRoZSBtZXJnZSBjb21taXQgbWVzc2Fn
ZSBhYm91dCB3aHkgeW91IG5lZWRlZCB0byBkbyBpdC4KPiA+IFdoaWxlIG5lZWRsZXNzIHJlYmFz
aW5nIGlzIHRvcCBvZiB0aGUgcGV0IHBlZXZlIGxpc3QsIHNlY29uZCBwbGFjZSwgYXMKPiA+IEkg
Zm91bmQgb3V0LCBpcyBteXN0ZXJ5IG1lcmdlcyB3aXRob3V0IGV4cGxhbmF0aW9ucy4KPiAKPiBZ
ZXMsIEkgYWx3YXlzIGRlc2NyaWJlIHRoZSBtZXJnZSBjb21taXRzLiBMaW51cyBhbHNvIHBhcnRp
Y3VsYXIgYWJvdXQKPiBoYXZpbmcgKmdvb2QgcmVhc29ucyogZm9yIG1lcmdlcy4KPiAKPiBUaGlz
IGlzIHdoeSBJIGNhbid0IGZpeCB0aGUgaG1tLmdpdCB0byBoYXZlIHJjNSB1bnRpbCBJIGhhdmUg
cGF0Y2hlcwo+IHRvIGFwcGx5Li4KPiAKPiBQcm9iYmFseSBJIHdpbGwganVzdCBwdXQgQ0gncyBz
ZXJpZXMgb24gcmM1IGFuZCBtZXJnZSBpdCB3aXRoIHRoZQo+IGNvdmVyIGxldHRlciBhcyB0aGUg
bWVyZ2UgbWVzc2FnZS4gVGhpcyBhdm9pZCBib3RoIHJlYmFzaW5nIGFuZCBnaXZlcwo+IHB1cnBv
c2VmdWwgbWVyZ2VzLgoKRmluZSB3aXRoIG1lLiAgTXkgc2VyaWVzIHJpZ2h0IG5vdyBpcyBvbiB0
b3Agb2YgdGhlIHJkbWEvaG1tIGJyYW5jaC4KVGhlcmUgaXMgYSB0cml2aWFsIGNvbmZsaWN0IHRo
YXQgaXMgc29sdmVkIGJ5IGRvaW5nIHNvLCBhcyBteSBzZXJpZXMKcmVtb3ZlcyBkb2N1bWVudGF0
aW9uIHRoYXQgaXMgZml4ZWQgdXAgdGhlcmUgYSBiaXQuICBUaGVyZSBpcyBhbm90aGVyCnRyaXZp
YWwgY29uZmxpY3Qgd2l0aCB5b3VyIHBlbmRpbmcgc2VyaWVzIGFzIHRoZXkgcmVtb3ZlIGNvZGUg
bmV4dCB0bwplYWNoIG90aGVyIGluIGhtbS5naXQuCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
