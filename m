Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BA9527D5D4
	for <lists+nouveau@lfdr.de>; Thu,  1 Aug 2019 08:49:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE2246E390;
	Thu,  1 Aug 2019 06:49:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38E246E390;
 Thu,  1 Aug 2019 06:49:19 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id A602568B05; Thu,  1 Aug 2019 08:49:14 +0200 (CEST)
Date: Thu, 1 Aug 2019 08:49:14 +0200
From: Christoph Hellwig <hch@lst.de>
To: Jason Gunthorpe <jgg@mellanox.com>
Message-ID: <20190801064914.GA15404@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
 <20190730055203.28467-8-hch@lst.de> <20190730125512.GF24038@mellanox.com>
 <20190730131430.GC4566@lst.de> <20190730175011.GL24038@mellanox.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190730175011.GL24038@mellanox.com>
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

T24gVHVlLCBKdWwgMzAsIDIwMTkgYXQgMDU6NTA6MTZQTSArMDAwMCwgSmFzb24gR3VudGhvcnBl
IHdyb3RlOgo+IFRoZSB3YXkgT0RQIHNlZW1zIHRvIHdvcmsgaXMgb25jZSBpbiBodWdldGxiIG1v
ZGUgdGhlIGRtYSBhZGRyZXNzZXMKPiBtdXN0IGdpdmUgaHVnZSBwYWdlcyBvciB0aGUgcGFnZSBm
YXVsdCB3aWxsIGJlIGZhaWxlZC4gSSB0aGluayB0aGF0IGlzCj4gYSB0ZXJyaWJsZSBkZXNpZ24s
IGJ1dCB0aGlzIGlzIGhvdyB0aGUgZHJpdmVyIGlzIC4uCj4gCj4gU28sIGZyb20gdGhpcyBITU0g
cGVyc3BlY3RpdmUgaWYgdGhlIGNhbGxlciBhc2tlZCBmb3IgaHVnZSBwYWdlcyB0aGVuCj4gdGhl
IHJlc3VsdHMgaGF2ZSB0byBiZSBhbGwgaHVnZSBwYWdlcyBvciBhIGhhcmQgZmFpbHVyZS4KCldo
aWNoIGlzbid0IGhvdyB0aGUgcGFnZV9zaGlmdCBtZW1iZXIgd29ya3MgYXQgbW9tZW50LiAgSXQg
c3RpbGwKYWxsb3dzIG5vbi1odWdldGxiIG1hcHBpbmdzIGV2ZW4gd2l0aCB0aGUgbWVtYmVyLgoK
PiBJdCBpcyBub3QgbmVnb3RpYXRlZCBhcyBhbiBvcHRpbWl6YXRpb24gbGlrZSB5b3UgYXJlIHRo
aW5raW5nLgo+IAo+IFtub3RlLCBJIGhhdmVuJ3QgeWV0IGNoZWNrZWQgY2FyZWZ1bGx5IGhvdyB0
aGlzIHdvcmtzIGluIE9EUCwgZXZlcnkKPiAgdGltZSBJIGxvb2sgYXQgcGFydHMgb2YgaXQgdGhl
IHRoaW5nIHNlZW1zIGNyYXp5XQoKVGhpcyBzZWVtcyBwcmV0dHkgY3JhenkuICBFc3BlY2lhbGx5
IGFzIGh1Z2V0bGIgdXNlIGluIGFwcGxpY2F0aW9ucwpzZWVtcyB0byBmYWRlIGluIGZhdm91ciBv
ZiBUSFAsIGZvciB3aGljaCB0aGlzIE9EUCBzY2hlbWUgZG9lcyBub3Qgc2VlbQp0byB3b3JrIGF0
IGFsbC4KCj4gPiBUaGUgYmVzdCBBUEkgZm9yIG1seDQgd291bGQgb2YgY291cnNlIGJlIHRvIHBh
c3MgYSBiaW92ZWMtc3R5bGUKPiA+IHZhcmlhYmxlIGxlbmd0aCBzdHJ1Y3R1cmUgdGhhdCBobW1f
ZmF1bHQgY291bGQgZmlsbCBvdXQsIGJ1dCB0aGF0IHdvdWxkCj4gPiBiZSBhIG1ham9yIHJlc3Ry
dWN0dXJlLgo+IAo+IEl0IHdvdWxkIHdvcmssIGJ1dCB0aGUgZHJpdmVyIGhhcyB0byBleHBhbmQg
dGhhdCBpbnRvIGEgcGFnZSBsaXN0Cj4gcmlnaHQgYXdheWhvdy4KPiAKPiBXZSBjYW4ndCBldmVu
IGRtYSBtYXAgdGhlIGJpb3ZlYyB3aXRoIHRvZGF5J3MgZG1hIEFQSSBhcyBpdCBuZWVkcyB0aGUK
PiBhYmlsaXR5IHRvIHJlbWFwIG9uIGEgcGFnZSBncmFudWxhcml0eS4KCldlIGNhbiBkbyBkbWFf
bWFwX3BhZ2UgbG9vcHMgb3ZlciBlYWNoIGJpb3ZlYyBlbnRyeSBwcmV0dHkgdHJpdmlhbGx5LAph
bmQgdGhhdCB3b24ndCBiZSBhbnkgd29yc2UgdGhhbiB0aGUgY3VycmVudCBsb29wIG92ZXIgZWFj
aCBwYWdlIGluCnRoZSBobW0gZG1hIGhlbHBlcnMuICBPbmNlIEkgZ2V0IGFyb3VuZCB0aGUgd29y
ayB0byBoYXZlIGEgYmV0dGVyCkFQSSBmb3IgaW9tbXUgbWFwcGluZ3MgZm9yIGJpb192ZWNzIHdl
IGNvdWxkIGNvYWxlc2NlIGl0IHNpbWlsYXIgdG8KaG93IHdlIGRvIGl0IHdpdGggc2NhdHRlcmxp
c3QgKGJ1dCB3aXRob3V0IGFsbCB0aGUgbWVzcyBvZiBhIG5ldwpzdHJ1Y3R1cmUpLiAgVGhhdCB3
b3JrIGlzIGdvaW5nIHRvIHRha2UgYSBsaXR0bGUgbG9uZ2VyIHRocm91Z2gsIGFzCml0IG5lZWRz
IHRoZSBhbWQgYW5kIGludGVsbCBpb21tdSBkcml2ZXJzIHRvIGJlIGNvbnZlcmVkIHRvIGRtYS1p
b21tdQp3aGljaCBpc24ndCBtYWtpbmcgcHJvZ3Jlc3MgYXMgZmFyIGFzIEkgaG9wZWQuCgpMZXQg
bWUga25vdyBpZiB5b3Ugd2FudCB0byBrZWVwIHRoaXMgY29kZSBmb3Igbm93IGRlc3BpdGUgdGhl
IGlzc3VlcywKb3IgaWYgd2UnZCByYXRoZXIgcmVpbXBsZW1lbnQgaXQgb25jZSB5b3UndmUgbWFk
ZSBzZW5zZSBvZiB0aGUgT0RQCmNvZGUuCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
