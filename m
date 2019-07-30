Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 480047A939
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 15:14:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 882656E4F1;
	Tue, 30 Jul 2019 13:14:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B53226E4F1;
 Tue, 30 Jul 2019 13:14:33 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id 9486D68AFE; Tue, 30 Jul 2019 15:14:30 +0200 (CEST)
Date: Tue, 30 Jul 2019 15:14:30 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190730131430.GC4566@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-8-hch@lst.de> <20190730125512.GF24038@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730125512.GF24038@mellanox.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 07/13] mm: remove the page_shift member from
 struct hmm_range
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
Cc: Ralph Campbell <rcampbell@nvidia.com>,
 "amd-gfx@lists.freedesktop.org" <amd-gfx@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Felix Kuehling <Felix.Kuehling@amd.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMTI6NTU6MTdQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IEkgc3VzcGVjdCB0aGlzIHdhcyBhZGRlZCBmb3IgdGhlIE9EUCBjb252ZXJzaW9u
IHRoYXQgZG9lcyB1c2UgYm90aAo+IHBhZ2Ugc2l6ZXMuIEkgdGhpbmsgdGhlIE9EUCBjb2RlIGZv
ciB0aGlzIGlzIGtpbmQgb2YgYnJva2VuLCBidXQgSQo+IGhhdmVuJ3QgZGVsdmVkIGludG8gdGhh
dC4uCj4gCj4gVGhlIGNoYWxsZW5nZSBpcyB0aGF0IHRoZSBkcml2ZXIgbmVlZHMgdG8ga25vdyB3
aGF0IHBhZ2Ugc2l6ZSB0bwo+IGNvbmZpZ3VyZSB0aGUgaGFyZHdhcmUgYmVmb3JlIGl0IGRvZXMg
YW55IHJhbmdlIHN0dWZmLgo+IAo+IFRoZSBvdGhlciBjaGFsbGVuZ2UgaXMgdGhhdCB0aGUgSFcg
aXMgY29uZmlndXJlZCB0byBkbyBvbmx5IG9uZSBwYWdlCj4gc2l6ZSwgYW5kIGlmIHRoZSB1bmRl
cmx5aW5nIENQVSBwYWdlIHNpZGUgY2hhbmdlcyBpdCBnb2VzIHNvdXRoLgo+IAo+IFdoYXQgSSB3
b3VsZCBwcmVmZXIgaXMgaWYgdGhlIGRyaXZlciBjb3VsZCBzb21laG93IGR5bmFtaWNhbGx5IGFk
anVzdAo+IHRoZSB0aGUgcGFnZSBzaXplIGFmdGVyIGVhY2ggZG1hIG1hcCwgYnV0IEkgZG9uJ3Qg
a25vdyBpZiBPRFAgSFcgY2FuCj4gZG8gdGhhdC4KPiAKPiBTaW5jZSB0aGlzIGlzIGFsbCBkcml2
aW5nIHRvd2FyZCBtYWtpbmcgT0RQIHVzZSB0aGlzIG1heWJlIHdlIHNob3VsZAo+IGtlZXAgdGhp
cyBBUEk/IAo+IAo+IEknbSBub3Qgc3VyZSBJIGNhbiBsb29zZSB0aGUgY3JhcHB5IGh1Z2UgcGFn
ZSBzdXBwb3J0IGluIE9EUC4KClRoZSBwcm9ibGVtIGlzIHRoYXQgSSBzZWUgbm8gd2F5IGhvdyB0
byB1c2UgdGhlIGN1cnJlbnQgQVBJLiAgVG8ga25vdwp0aGUgaHVnZSBwYWdlIHNpemUgeW91IG5l
ZWQgdG8gaGF2ZSB0aGUgdm1hLCBhbmQgdGhlIGN1cnJlbnQgQVBJCmRvZXNuJ3QgcmVxdWlyZSBh
IHZtYSB0byBiZSBwYXNzZWQgaW4uCgpUaGF0J3Mgd2h5IEkgc3VnZ2VzdGVkIGFuIGFwaSB3aGVy
ZSB3ZSBwYXNzIGluIGEgZmxhZyB0aGF0IGh1Z2UgcGFnZXMKYXJlIG9rIGludG8gaG1tX3Jhbmdl
X2ZhdWx0LCBhbmQgaXQgdGhlbiBjb3VsZCBwYXNzIHRoZSBzaGlmdCBvdXQsIGFuZApsaW1pdHMg
aXRzZWxmIHRvIGEgc2luZ2xlIHZtYSAod2hpY2ggaXQgbm9ybWFsbHkgZG9lc24ndCwgdGhhdCBp
cyBhbgphZGRpdGlvbmFsIGNvbXBsaWNhdGlvbikuICBCdXQgYWxsIHRoaXMgc2VlbXMgcmVhbGx5
IGF3a3dhcmQgaW4gdGVybXMKb2YgYW4gQVBJIHN0aWxsLiAgQUZBSUsgT0RQIGlzIG9ubHkgdXNl
ZCBieSBtbHg1LCBhbmQgbWx4NSB1bmxpa2Ugb3RoZXIKSUIgSENBcyBjYW4gdXNlIHNjYXR0ZXJs
aXN0IHN0eWxlIE1ScyB3aXRoIHZhcmlhYmxlIGxlbmd0aCBwZXIgZW50cnksCnNvIGV2ZW4gaWYg
d2UgcGFzcyBtdWx0aXBsZSBwYWdlcyBwZXIgZW50cnkgZnJvbSBobW0gaXQgY291bGQgY29hbGVz
Y2UKdGhlbS4gIFRoZSBiZXN0IEFQSSBmb3IgbWx4NCB3b3VsZCBvZiBjb3Vyc2UgYmUgdG8gcGFz
cyBhIGJpb3ZlYy1zdHlsZQp2YXJpYWJsZSBsZW5ndGggc3RydWN0dXJlIHRoYXQgaG1tX2ZhdWx0
IGNvdWxkIGZpbGwgb3V0LCBidXQgdGhhdCB3b3VsZApiZSBhIG1ham9yIHJlc3RydWN0dXJlLgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
