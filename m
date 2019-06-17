Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8721648AB3
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 19:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07C018926C;
	Mon, 17 Jun 2019 17:43:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from newverein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 08A538926C;
 Mon, 17 Jun 2019 17:43:22 +0000 (UTC)
Received: by newverein.lst.de (Postfix, from userid 2407)
 id EE36B67358; Mon, 17 Jun 2019 19:42:51 +0200 (CEST)
Date: Mon, 17 Jun 2019 19:42:51 +0200
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>
Message-ID: <20190617174251.GA18249@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
 <20190617122733.22432-7-hch@lst.de>
 <CAPcyv4hoRR6gzTSkWnwMiUtX6jCKz2NMOhCUfXTji8f2H1v+rg@mail.gmail.com>
 <20190617174018.GA18185@lst.de>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190617174018.GA18185@lst.de>
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

T24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMDc6NDA6MThQTSArMDIwMCwgQ2hyaXN0b3BoIEhlbGx3
aWcgd3JvdGU6Cj4gT24gTW9uLCBKdW4gMTcsIDIwMTkgYXQgMTA6Mzc6MTJBTSAtMDcwMCwgRGFu
IFdpbGxpYW1zIHdyb3RlOgo+ID4gPiArc3RydWN0IHJlc291cmNlICpkZXZtX3JlcXVlc3RfZnJl
ZV9tZW1fcmVnaW9uKHN0cnVjdCBkZXZpY2UgKmRldiwKPiA+ID4gKyAgICAgICAgICAgICAgIHN0
cnVjdCByZXNvdXJjZSAqYmFzZSwgdW5zaWduZWQgbG9uZyBzaXplKTsKPiA+IAo+ID4gVGhpcyBh
cHBlYXJzIHRvIG5lZWQgYSAnc3RhdGljIGlubGluZScgaGVscGVyIHN0dWIgaW4gdGhlCj4gPiBD
T05GSUdfREVWSUNFX1BSSVZBVEU9biBjYXNlLCBvdGhlcndpc2UgdGhpcyBjb21waWxlIGVycm9y
IHRyaWdnZXJzOgo+ID4gCj4gPiBsZDogbW0vaG1tLm86IGluIGZ1bmN0aW9uIGBobW1fZGV2bWVt
X2FkZCc6Cj4gPiAvaG9tZS9kd2lsbGlhMi9naXQvbGludXgvbW0vaG1tLmM6MTQyNzogdW5kZWZp
bmVkIHJlZmVyZW5jZSB0bwo+ID4gYGRldm1fcmVxdWVzdF9mcmVlX21lbV9yZWdpb24nCj4gCj4g
KnNpZ2gqIC0gaG1tX2Rldm1lbV9hZGQgYWxyZWFkeSBvbmx5IHdvcmtzIGZvciBkZXZpY2UgcHJp
dmF0ZSBtZW1vcnksCj4gc28gaXQgc2hvdWxkbid0IGJlIGJ1aWx0IGlmIHRoYXQgb3B0aW9uIGlz
IG5vdCBlbmFibGVkLCBidXQgaW4gdGhlCj4gY3VycmVudCBjb2RlIGl0IGlzLiAgQW5kIGEgZmV3
IHBhdGNoZXMgbGF0ZXIgaW4gdGhlIHNlcmllcyB3ZSBqdXN0Cj4ga2lsbCBpdCBvZmYgZW50aXJl
bHksIGFuZCB0aGUgb25seSByZWFsIGNhbGxlciBvZiB0aGlzIGZ1bmN0aW9uCj4gYWxyZWFkeSBk
ZXBlbmRzIG9uIENPTkZJR19ERVZJQ0VfUFJJVkFURS4gIFNvIEknbSB0ZW1wdGVkIHRvIGp1c3QK
PiBpZ25vcmUgdGhlIHN0cmljdCBiaXNlY3RhYmlsaXR5IHJlcXVpcmVtZW50IGhlcmUgaW5zdGVh
ZCBvZiBtYWtpbmcKPiB0aGluZ3MgbWVzc3kgYnkgZWl0aGVyIGFkZGluZyB0aGUgcHJvcGVyIGlm
ZGVmcyBpbiBobW0uYyBvciBwcm92aWRpbmcKPiBhIHN0dWIgd2UgZG9uJ3QgcmVhbGx5IG5lZWQu
CgpBY3R1YWxseSwgSSBjb3VsZCBqdXN0IG1vdmUgdGhlIHBhdGNoIHRvIG1hcmsgQ09ORklHX0RF
VklDRV9QVUJMSUMKYnJva2VuIGVhcmxpZXIsIHdoaWNoIHdvdWxkIGZvcmNlIGhtbV9kZXZtZW1f
YWRkIHRvIG9ubHkgYmUgYnVpbHQKd2hlbiBDT05GSUdfREVWSUNFX1BSSVZBVEUgaXN0IHNldC4K
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
