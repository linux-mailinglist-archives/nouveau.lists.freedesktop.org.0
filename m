Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A3515EED4
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 23:51:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD4EA6E203;
	Wed,  3 Jul 2019 21:51:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6ED4F6E202;
 Wed,  3 Jul 2019 21:51:28 +0000 (UTC)
Received: by verein.lst.de (Postfix, from userid 2407)
 id C562368B05; Wed,  3 Jul 2019 23:51:26 +0200 (CEST)
Date: Wed, 3 Jul 2019 23:51:26 +0200
From: Christoph Hellwig <hch@lst.de>
To: Ralph Campbell <rcampbell@nvidia.com>
Message-ID: <20190703215126.GA17366@lst.de>
References: <20190703184502.16234-1-hch@lst.de>
 <20190703184502.16234-5-hch@lst.de>
 <ec5e86a4-4a60-0dd5-797c-41b21e3a091a@nvidia.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ec5e86a4-4a60-0dd5-797c-41b21e3a091a@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Subject: Re: [Nouveau] [PATCH 4/5] nouveau: unlock mmap_sem on all errors
 from nouveau_range_fault
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMDMsIDIwMTkgYXQgMDE6NDY6MDJQTSAtMDcwMCwgUmFscGggQ2FtcGJlbGwg
d3JvdGU6Cj4gWW91IGNhbiBkZWxldGUgdGhlIGNvbW1lbnQgIldpdGggdGhlIG9sZCBBUEkgdGhl
IGRyaXZlciBtdXN0IC4uLiIKPiAobm90IHZpc2libGUgaW4gdGhlIHBhdGNoIGhlcmUpLgoKU3Vy
ZS4KCj4gSSBzdWdnZXN0IG1vdmluZyB0aGUgdHdvIGFzc2lnbm1lbnRzOgo+IAlyYW5nZS0+ZGVm
YXVsdF9mbGFncyA9IDA7Cj4gCXJhbmdlLT5wZm5fZmxhZ3NfbWFzayA9IC0xVUw7Cj4gdG8ganVz
dCBhYm92ZSB0aGUgImFnYWluOiIgd2hlcmUgdGhlIG90aGVyIHJhbmdlLnh4eCBmaWVsZHMgYXJl
Cj4gaW5pdGlhbGl6ZWQgaW4gbm91dmVhdV9zdm1fZmF1bHQoKS4KCkZvciBub3cgSSByZWFsbHkg
anVzdCB3YW50IHRvIG1vdmUgdGhlIGNvZGUgYXJvdW5kLiAgQXMgSmFzb24gcG9pbnRlZApvdXQg
dGhlIGZsb3cgd2lsbCBuZWVkIHNvbWUgbWFqb3IgcmV3b3JrLCBhbmQgSSdkIHJhdGhlciBub3Qg
bWVzcwp3aXRoIGxpdHRsZSB0aGluZ3MgbGlrZSB0aGlzIGZvciBub3cuICBFc3BlY2lhbGx5IGFz
IEkgYXNzdW1lIEplcm9tZQptdXN0IGhhdmUgYW4gdXBkYXRlIHRvIHRoZSBwcm9wZXIgQVBJIHJl
YWR5IGdpdmVuIHRoYXQgaGUgYm90aAp3cm90ZSB0aGF0IG5ldyBBUEkgYW5kIHRoZSBub3V2ZWF1
IGNvZGUuCgo+IFlvdSBjYW4gZGVsZXRlIHRoaXMgY29tbWVudCAob25seSB0aGUgZmlyc3QgbGlu
ZSBpcyB2aXNpYmxlIGhlcmUpCj4gc2luY2UgaXQgaXMgYWJvdXQgdGhlICJvbGQgQVBJIi4KCk9r
LgoKPiBBbHNvLCBpdCBzaG91bGQgcmV0dXJuIC1FQlVTWSBub3QgLUVBR0FJTiBzaW5jZSBpdCBt
ZWFucyB0aGVyZSB3YXMgYQo+IHJhbmdlIGludmFsaWRhdGlvbiBjb2xsaXNpb24gKHNpbWlsYXIg
dG8gaG1tX3JhbmdlX2ZhdWx0KCkgaWYKPiAhcmFuZ2UtPnZhbGlkKS4KClllcywgcHJvYmFibHku
CgoKPj4gQEAgLTUxNSwxNSArNTE3LDE0IEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGht
bV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCj4+ICAgICAJcmV0ID0g
aG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCBibG9jayk7Cj4KPiBub3V2ZWF1X3JhbmdlX2ZhdWx0KCkg
aXMgb25seSBjYWxsZWQgd2l0aCAiYmxvY2sgPSB0cnVlIiBzbwo+IGNvdWxkIGVsaW1pbmF0ZSB0
aGUgYmxvY2sgcGFyYW1ldGVyIGFuZCBwYXNzIHRydWUgaGVyZS4KCkluZGVlZC4KCj4KPj4gICAJ
aWYgKHJldCA8PSAwKSB7Cj4+IC0JCWlmIChyZXQgPT0gLUVCVVNZIHx8ICFyZXQpIHsKPj4gLQkJ
CS8qIFNhbWUgYXMgYWJvdmUsIGRyb3AgbW1hcF9zZW0gdG8gbWF0Y2ggb2xkIEFQSS4gKi8KPj4g
LQkJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7Cj4+IC0JCQlyZXQgPSAt
RUJVU1k7Cj4+IC0JCX0gZWxzZSBpZiAocmV0ID09IC1FQUdBSU4pCj4+ICsJCWlmIChyZXQgPT0g
MCkKPj4gICAJCQlyZXQgPSAtRUJVU1k7Cj4+ICsJCWlmIChyZXQgIT0gLUVBR0FJTikKPj4gKwkJ
CXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7Cj4KPiBDYW4gcmV0ID09IC1F
QUdBSU4gaGFwcGVuIGlmICJibG9jayA9IHRydWUiPwoKSSBkb24ndCB0aGluayBzbywgd2UgY2Fu
IHJlbW92ZSB0aGF0LgoKPiBHZW5lcmFsbHksIEkgcHJlZmVyIHRoZSByZWFkX2Rvd24oKS9yZWFk
X3VwKCkgaW4gdGhlIHNhbWUgZnVuY3Rpb24KPiAoaS5lLiwgbm91dmVhdV9zdm1fZmF1bHQoKSkg
YnV0IEkgY2FuIHNlZSB3aHkgaXQgc2hvdWxkIGJlIGhlcmUKPiBpZiBobW1fcmFuZ2VfZmF1bHQo
KSBjYW4gcmV0dXJuIHdpdGggbW1hcF9zZW0gdW5sb2NrZWQuCgpZZXMsIGluIHRoZSBsb25nIHJ1
biB0aGlzIGFsbCBuZWVkcyBhIG1ham9yIGNsZWFudXAuLgoKCj4+ICAgQEAgLTcxOCw4ICs3MTks
OCBAQCBub3V2ZWF1X3N2bV9mYXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkKPj4gICAJ
CQkJCQlOVUxMKTsKPj4gICAJCQlzdm1tLT52bW0tPnZtbS5vYmplY3QuY2xpZW50LT5zdXBlciA9
IGZhbHNlOwo+PiAgIAkJCW11dGV4X3VubG9jaygmc3ZtbS0+bXV0ZXgpOwo+PiArCQkJdXBfcmVh
ZCgmc3ZtbS0+bW0tPm1tYXBfc2VtKTsKPj4gICAJCX0KPj4gLQkJdXBfcmVhZCgmc3ZtbS0+bW0t
Pm1tYXBfc2VtKTsKPj4gICAKPgo+IFRoZSAiZWxzZSIgY2FzZSBzaG91bGQgY2hlY2sgZm9yIC1F
QlVTWSBhbmQgZ290byBhZ2Fpbi4KCkl0IHNob3VsZCBpZiBJIHdlcmUgdHJ5aW5nIHRvIGZpeCB0
aGlzLiAgQnV0IHRoaXMgaXMganVzdCBjb2RlCmluc3BlY3Rpb24gYW5kIEkgZG9uJ3QgZXZlbiBo
YXZlIHRoZSBoYXJkd2FyZSwgc28gSSdsbCBoYXZlIHRvIGxlYXZlCnRoYXQgZm9yIHNvbWVvbmUg
d2hvIGNhbiBkbyByZWFsIGRldmVsb3BtZW50IG9uIHRoZSBkcml2ZXIuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
