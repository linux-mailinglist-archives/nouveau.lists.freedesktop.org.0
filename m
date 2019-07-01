Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D39E95B6BB
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 10:25:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28F7B89C13;
	Mon,  1 Jul 2019 08:25:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C09EE89C13;
 Mon,  1 Jul 2019 08:25:20 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id EE0A068B20; Mon,  1 Jul 2019 10:25:17 +0200 (CEST)
Date: Mon, 1 Jul 2019 10:25:17 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?iso-8859-1?B?Suly9G1l?= Glisse <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Message-ID: <20190701082517.GA22461@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190701062020.19239-1-hch@lst.de>
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

QW5kIEkndmUgZGVtb25zdHJhdGVkIHRoYXQgSSBjYW4ndCBzZW5kIHBhdGNoIHNlcmllcy4uICBX
aGlsZSB0aGlzCmhhcyBhbGwgdGhlIHJpZ2h0IHBhdGNoZXMsIGl0IGFsc28gaGFzIHRoZSBleHRy
YSBwYXRjaGVzIGFscmVhZHkKaW4gdGhlIGhtbSB0cmVlLCBhbmQgZm91ciBleHRyYSBwYXRjaGVz
IEkgd2FudGVkIHRvIHNlbmQgb25jZQp0aGlzIHNlcmllcyBpcyBtZXJnZWQuICBJJ2xsIGdpdmUg
dXAgZm9yIG5vdywgcGxlYXNlIHVzZSB0aGUgZ2l0CnVybCBmb3IgYW55dGhpbmcgc2VyaW91cywg
YXMgaXQgY29udGFpbnMgdGhlIHJpZ2h0IHRoaW5nLgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXU=
