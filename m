Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D7D357EB4
	for <lists+nouveau@lfdr.de>; Thu, 27 Jun 2019 10:52:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF6C66E847;
	Thu, 27 Jun 2019 08:52:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 135B06E842;
 Thu, 27 Jun 2019 08:52:07 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id B4FDB68B20; Thu, 27 Jun 2019 10:51:35 +0200 (CEST)
Date: Thu, 27 Jun 2019 10:51:35 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ira Weiny <ira.weiny@intel.com>
Message-ID: <20190627085135.GB11420@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-16-hch@lst.de>
 <20190626214750.GC8399@iweiny-DESK2.sc.intel.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190626214750.GC8399@iweiny-DESK2.sc.intel.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 15/25] memremap: provide an optional internal
 refcount in struct dev_pagemap
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, nouveau@lists.freedesktop.org,
 Dan Williams <dan.j.williams@intel.com>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdW4gMjYsIDIwMTkgYXQgMDI6NDc6NTBQTSAtMDcwMCwgSXJhIFdlaW55IHdyb3Rl
Ogo+ID4gKwo+ID4gKwkJaW5pdF9jb21wbGV0aW9uKCZwZ21hcC0+ZG9uZSk7Cj4gPiArCQllcnJv
ciA9IHBlcmNwdV9yZWZfaW5pdCgmcGdtYXAtPmludGVybmFsX3JlZiwKPiA+ICsJCQkJZGV2X3Bh
Z2VtYXBfcGVyY3B1X3JlbGVhc2UsIDAsIEdGUF9LRVJORUwpOwo+ID4gKwkJaWYgKGVycm9yKQo+
ID4gKwkJCXJldHVybiBFUlJfUFRSKGVycm9yKTsKPiA+ICsJCXBnbWFwLT5yZWYgPSAmcGdtYXAt
PmludGVybmFsX3JlZjsKPiA+ICsJfSBlbHNlIHsKPiA+ICsJCWlmICghcGdtYXAtPm9wcyB8fCAh
cGdtYXAtPm9wcy0+a2lsbCB8fCAhcGdtYXAtPm9wcy0+Y2xlYW51cCkgewo+ID4gKwkJCVdBUk4o
MSwgIk1pc3NpbmcgcmVmZXJlbmNlIGNvdW50IHRlYXJkb3duIGRlZmluaXRpb25cbiIpOwo+ID4g
KwkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwo+ID4gKwkJfQo+IAo+IEFmdGVyIHRoaXMgc2Vy
aWVzIGFyZSB0aGVyZSBhbnkgdXNlcnMgd2hvIGNvbnRpbnVlIHRvIHN1cHBseSB0aGVpciBvd24K
PiByZWZlcmVuY2Ugb2JqZWN0IGFuZCB0aGVzZSBjYWxsYmFja3M/CgpZZXMsIGZzZGF4IHVzZXMg
dGhlIGJsb2NrIGxheWVyIHJlcXVlc3RfcXVldWUgcmVmZXJlbmNlIGNvdW50LgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
