Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D794F48A81
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 19:40:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C94E089216;
	Mon, 17 Jun 2019 17:40:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66461891C4;
 Mon, 17 Jun 2019 17:40:49 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id AA7D667358; Mon, 17 Jun 2019 19:40:18 +0200 (CEST)
Date: Mon, 17 Jun 2019 19:40:18 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190617174018.GA18185@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-7-hch@lst.de>
 <CAPcyv4hoRR6gzTSkWnwMiUtX6jCKz2NMOhCUfXTji8f2H1v+rg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAPcyv4hoRR6gzTSkWnwMiUtX6jCKz2NMOhCUfXTji8f2H1v+rg@mail.gmail.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 06/25] mm: factor out a
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6Mzc6MTJBTSAtMDcwMCwgRGFuIFdpbGxpYW1zIHdy
b3RlOgo+ID4gK3N0cnVjdCByZXNvdXJjZSAqZGV2bV9yZXF1ZXN0X2ZyZWVfbWVtX3JlZ2lvbihz
dHJ1Y3QgZGV2aWNlICpkZXYsCj4gPiArICAgICAgICAgICAgICAgc3RydWN0IHJlc291cmNlICpi
YXNlLCB1bnNpZ25lZCBsb25nIHNpemUpOwo+IAo+IFRoaXMgYXBwZWFycyB0byBuZWVkIGEgJ3N0
YXRpYyBpbmxpbmUnIGhlbHBlciBzdHViIGluIHRoZQo+IENPTkZJR19ERVZJQ0VfUFJJVkFURT1u
IGNhc2UsIG90aGVyd2lzZSB0aGlzIGNvbXBpbGUgZXJyb3IgdHJpZ2dlcnM6Cj4gCj4gbGQ6IG1t
L2htbS5vOiBpbiBmdW5jdGlvbiBgaG1tX2Rldm1lbV9hZGQnOgo+IC9ob21lL2R3aWxsaWEyL2dp
dC9saW51eC9tbS9obW0uYzoxNDI3OiB1bmRlZmluZWQgcmVmZXJlbmNlIHRvCj4gYGRldm1fcmVx
dWVzdF9mcmVlX21lbV9yZWdpb24nCgoqc2lnaCogLSBobW1fZGV2bWVtX2FkZCBhbHJlYWR5IG9u
bHkgd29ya3MgZm9yIGRldmljZSBwcml2YXRlIG1lbW9yeSwKc28gaXQgc2hvdWxkbid0IGJlIGJ1
aWx0IGlmIHRoYXQgb3B0aW9uIGlzIG5vdCBlbmFibGVkLCBidXQgaW4gdGhlCmN1cnJlbnQgY29k
ZSBpdCBpcy4gIEFuZCBhIGZldyBwYXRjaGVzIGxhdGVyIGluIHRoZSBzZXJpZXMgd2UganVzdApr
aWxsIGl0IG9mZiBlbnRpcmVseSwgYW5kIHRoZSBvbmx5IHJlYWwgY2FsbGVyIG9mIHRoaXMgZnVu
Y3Rpb24KYWxyZWFkeSBkZXBlbmRzIG9uIENPTkZJR19ERVZJQ0VfUFJJVkFURS4gIFNvIEknbSB0
ZW1wdGVkIHRvIGp1c3QKaWdub3JlIHRoZSBzdHJpY3QgYmlzZWN0YWJpbGl0eSByZXF1aXJlbWVu
dCBoZXJlIGluc3RlYWQgb2YgbWFraW5nCnRoaW5ncyBtZXNzeSBieSBlaXRoZXIgYWRkaW5nIHRo
ZSBwcm9wZXIgaWZkZWZzIGluIGhtbS5jIG9yIHByb3ZpZGluZwphIHN0dWIgd2UgZG9uJ3QgcmVh
bGx5IG5lZWQuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
