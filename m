Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F49056909
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:28:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB3BE6E3BC;
	Wed, 26 Jun 2019 12:28:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CF2946E409;
 Wed, 26 Jun 2019 12:28:32 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg72E-0001cj-Jv; Wed, 26 Jun 2019 12:28:23 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:20 +0200
Message-Id: <20190626122724.13313-22-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626122724.13313-1-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From
 :Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1EWGF/F6e1vBHfjAA6nX1LYEAAsLgFm61+exsZF7p+E=; b=bL49WJDDJc3uz+E3Tq04Tm5aOh
 6UKiHfGJ4xc1EdjM+wIO+4O7TabN+U+mE4CUE7GVW/6hNT1G25p6zM6t2nVmATDNy70CoTYKvUXYh
 h63gBbqAnP0fS/lvCqryLq3sJaRMn4yQ/kLLVV4MhA9L5yzp96EXF7zgv5NJOti4WMo+m7s82bMJK
 tcjaFPnwpZ0KnnQ9gPRDwYlIZplqIULbGZnpwlX73gmGQjQ6zUyUid/upr/R6McnyA6o8yC/58lCE
 OCyyeu7FUxcUuZa0aNWyNmTN2ebeV0grSQhN82z/PKk4I5ke7M0SV3GzBYODNCZUs6sDgaWMbxtfQ
 or4ndx9w==;
Subject: [Nouveau] [PATCH 21/25] mm: remove hmm_devmem_add
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlcmUgaXNuJ3QgcmVhbGx5IG11Y2ggdmFsdWUgYWRkIGluIHRoZSBobW1fZGV2bWVtX2FkZCB3
cmFwcGVyIGFuZAptb3JlLCBhcyB1c2luZyBkZXZtX21lbXJlbWFwX3BhZ2VzIGRpcmVjdGx5IG5v
dyBpcyBqdXN0IGFzIHNpbXBsZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29t
PgotLS0KIERvY3VtZW50YXRpb24vdm0vaG1tLnJzdCB8ICAyNiAtLS0tLS0tLQogaW5jbHVkZS9s
aW51eC9obW0uaCAgICAgIHwgMTI5IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogbW0vaG1tLmMgICAgICAgICAgICAgICAgIHwgMTEwIC0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLQogMyBmaWxlcyBjaGFuZ2VkLCAyNjUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IGIvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0
CmluZGV4IDdjZGY3MjgyZTAyMi4uNTBlMTM4MDk1MGE5IDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL3ZtL2htbS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0CkBAIC0zMjksMzIg
KzMyOSw2IEBAIGRpcmVjdGx5IHVzaW5nIHN0cnVjdCBwYWdlIGZvciBkZXZpY2UgbWVtb3J5IHdo
aWNoIGxlZnQgbW9zdCBrZXJuZWwgY29kZSBwYXRocwogdW5hd2FyZSBvZiB0aGUgZGlmZmVyZW5j
ZS4gV2Ugb25seSBuZWVkIHRvIG1ha2Ugc3VyZSB0aGF0IG5vIG9uZSBldmVyIHRyaWVzIHRvCiBt
YXAgdGhvc2UgcGFnZXMgZnJvbSB0aGUgQ1BVIHNpZGUuCiAKLUhNTSBwcm92aWRlcyBhIHNldCBv
ZiBoZWxwZXJzIHRvIHJlZ2lzdGVyIGFuZCBob3RwbHVnIGRldmljZSBtZW1vcnkgYXMgYSBuZXcK
LXJlZ2lvbiBuZWVkaW5nIGEgc3RydWN0IHBhZ2UuIFRoaXMgaXMgb2ZmZXJlZCB0aHJvdWdoIGEg
dmVyeSBzaW1wbGUgQVBJOjoKLQotIHN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZChj
b25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKLSAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgc3RydWN0IGRldmljZSAqZGV2aWNlLAotICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICB1bnNpZ25lZCBsb25nIHNpemUpOwotIHZvaWQgaG1tX2Rldm1lbV9yZW1v
dmUoc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSk7Ci0KLVRoZSBobW1fZGV2bWVtX29wcyBpcyB3
aGVyZSBtb3N0IG9mIHRoZSBpbXBvcnRhbnQgdGhpbmdzIGFyZTo6Ci0KLSBzdHJ1Y3QgaG1tX2Rl
dm1lbV9vcHMgewotICAgICB2b2lkICgqZnJlZSkoc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSwg
c3RydWN0IHBhZ2UgKnBhZ2UpOwotICAgICBpbnQgKCpmYXVsdCkoc3RydWN0IGhtbV9kZXZtZW0g
KmRldm1lbSwKLSAgICAgICAgICAgICAgICAgIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAot
ICAgICAgICAgICAgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyLAotICAgICAgICAgICAgICAgICAg
c3RydWN0IHBhZ2UgKnBhZ2UsCi0gICAgICAgICAgICAgICAgICB1bnNpZ25lZCBmbGFncywKLSAg
ICAgICAgICAgICAgICAgIHBtZF90ICpwbWRwKTsKLSB9OwotCi1UaGUgZmlyc3QgY2FsbGJhY2sg
KGZyZWUoKSkgaGFwcGVucyB3aGVuIHRoZSBsYXN0IHJlZmVyZW5jZSBvbiBhIGRldmljZSBwYWdl
IGlzCi1kcm9wcGVkLiBUaGlzIG1lYW5zIHRoZSBkZXZpY2UgcGFnZSBpcyBub3cgZnJlZSBhbmQg
bm8gbG9uZ2VyIHVzZWQgYnkgYW55b25lLgotVGhlIHNlY29uZCBjYWxsYmFjayBoYXBwZW5zIHdo
ZW5ldmVyIHRoZSBDUFUgdHJpZXMgdG8gYWNjZXNzIGEgZGV2aWNlIHBhZ2UKLXdoaWNoIGl0IGNh
bm5vdCBkby4gVGhpcyBzZWNvbmQgY2FsbGJhY2sgbXVzdCB0cmlnZ2VyIGEgbWlncmF0aW9uIGJh
Y2sgdG8KLXN5c3RlbSBtZW1vcnkuCi0KIAogTWlncmF0aW9uIHRvIGFuZCBmcm9tIGRldmljZSBt
ZW1vcnkKID09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09PT09CmRpZmYgLS1naXQgYS9p
bmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAppbmRleCAxZDU1YjdlYTJk
YTYuLjg2YWE0ZWMzNDA0YyAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAorKysgYi9p
bmNsdWRlL2xpbnV4L2htbS5oCkBAIC01ODUsMTM1ICs1ODUsNiBAQCBzdGF0aWMgaW5saW5lIHZv
aWQgaG1tX21tX2luaXQoc3RydWN0IG1tX3N0cnVjdCAqbW0pIHt9CiAjZW5kaWYgLyogSVNfRU5B
QkxFRChDT05GSUdfSE1NX01JUlJPUikgKi8KIAogI2lmIElTX0VOQUJMRUQoQ09ORklHX0RFVklD
RV9QUklWQVRFKQotc3RydWN0IGhtbV9kZXZtZW07Ci0KLS8qCi0gKiBzdHJ1Y3QgaG1tX2Rldm1l
bV9vcHMgLSBjYWxsYmFjayBmb3IgWk9ORV9ERVZJQ0UgbWVtb3J5IGV2ZW50cwotICoKLSAqIEBm
cmVlOiBjYWxsIHdoZW4gcmVmY291bnQgb24gcGFnZSByZWFjaCAxIGFuZCB0aHVzIGlzIG5vIGxv
bmdlciB1c2UKLSAqIEBmYXVsdDogY2FsbCB3aGVuIHRoZXJlIGlzIGEgcGFnZSBmYXVsdCB0byB1
bmFkZHJlc3NhYmxlIG1lbW9yeQotICoKLSAqIEJvdGggY2FsbGJhY2sgaGFwcGVucyBmcm9tIHBh
Z2VfZnJlZSgpIGFuZCBwYWdlX2ZhdWx0KCkgY2FsbGJhY2sgb2Ygc3RydWN0Ci0gKiBkZXZfcGFn
ZW1hcCByZXNwZWN0aXZlbHkuIFNlZSBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggZm9yIG1vcmUg
ZGV0YWlscyBvbgotICogdGhvc2UuCi0gKgotICogVGhlIGhtbV9kZXZtZW1fb3BzIGNhbGxiYWNr
IGFyZSBqdXN0IGhlcmUgdG8gcHJvdmlkZSBhIGNvaGVyZW50IGFuZAotICogdW5pcSBBUEkgdG8g
ZGV2aWNlIGRyaXZlciBhbmQgZGV2aWNlIGRyaXZlciBzaG91bGQgbm90IHJlZ2lzdGVyIHRoZWly
Ci0gKiBvd24gcGFnZV9mcmVlKCkgb3IgcGFnZV9mYXVsdCgpIGJ1dCByZWx5IG9uIHRoZSBobW1f
ZGV2bWVtX29wcyBjYWxsLQotICogYmFjay4KLSAqLwotc3RydWN0IGhtbV9kZXZtZW1fb3BzIHsK
LQkvKgotCSAqIGZyZWUoKSAtIGZyZWUgYSBkZXZpY2UgcGFnZQotCSAqIEBkZXZtZW06IGRldmlj
ZSBtZW1vcnkgc3RydWN0dXJlIChzZWUgc3RydWN0IGhtbV9kZXZtZW0pCi0JICogQHBhZ2U6IHBv
aW50ZXIgdG8gc3RydWN0IHBhZ2UgYmVpbmcgZnJlZWQKLQkgKgotCSAqIENhbGwgYmFjayBvY2N1
cnMgd2hlbmV2ZXIgYSBkZXZpY2UgcGFnZSByZWZjb3VudCByZWFjaCAxIHdoaWNoCi0JICogbWVh
bnMgdGhhdCBubyBvbmUgaXMgaG9sZGluZyBhbnkgcmVmZXJlbmNlIG9uIHRoZSBwYWdlIGFueW1v
cmUKLQkgKiAoWk9ORV9ERVZJQ0UgcGFnZSBoYXZlIGFuIGVsZXZhdGVkIHJlZmNvdW50IG9mIDEg
YXMgZGVmYXVsdCBzbwotCSAqIHRoYXQgdGhleSBhcmUgbm90IHJlbGVhc2UgdG8gdGhlIGdlbmVy
YWwgcGFnZSBhbGxvY2F0b3IpLgotCSAqCi0JICogTm90ZSB0aGF0IGNhbGxiYWNrIGhhcyBleGNs
dXNpdmUgb3duZXJzaGlwIG9mIHRoZSBwYWdlIChhcyBubwotCSAqIG9uZSBpcyBob2xkaW5nIGFu
eSByZWZlcmVuY2UpLgotCSAqLwotCXZvaWQgKCpmcmVlKShzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2
bWVtLCBzdHJ1Y3QgcGFnZSAqcGFnZSk7Ci0JLyoKLQkgKiBmYXVsdCgpIC0gQ1BVIHBhZ2UgZmF1
bHQgb3IgZ2V0IHVzZXIgcGFnZSAoR1VQKQotCSAqIEBkZXZtZW06IGRldmljZSBtZW1vcnkgc3Ry
dWN0dXJlIChzZWUgc3RydWN0IGhtbV9kZXZtZW0pCi0JICogQHZtYTogdmlydHVhbCBtZW1vcnkg
YXJlYSBjb250YWluaW5nIHRoZSB2aXJ0dWFsIGFkZHJlc3MKLQkgKiBAYWRkcjogdmlydHVhbCBh
ZGRyZXNzIHRoYXQgZmF1bHRlZCBvciBmb3Igd2hpY2ggdGhlcmUgaXMgYSBHVVAKLQkgKiBAcGFn
ZTogcG9pbnRlciB0byBzdHJ1Y3QgcGFnZSBiYWNraW5nIHZpcnR1YWwgYWRkcmVzcyAodW5yZWxp
YWJsZSkKLQkgKiBAZmxhZ3M6IEZBVUxUX0ZMQUdfKiAoc2VlIGluY2x1ZGUvbGludXgvbW0uaCkK
LQkgKiBAcG1kcDogcGFnZSBtaWRkbGUgZGlyZWN0b3J5Ci0JICogUmV0dXJuczogVk1fRkFVTFRf
TUlOT1IvTUFKT1Igb24gc3VjY2VzcyBvciBvbmUgb2YgVk1fRkFVTFRfRVJST1IKLQkgKiAgIG9u
IGVycm9yCi0JICoKLQkgKiBUaGUgY2FsbGJhY2sgb2NjdXJzIHdoZW5ldmVyIHRoZXJlIGlzIGEg
Q1BVIHBhZ2UgZmF1bHQgb3IgR1VQIG9uIGEKLQkgKiB2aXJ0dWFsIGFkZHJlc3MuIFRoaXMgbWVh
bnMgdGhhdCB0aGUgZGV2aWNlIGRyaXZlciBtdXN0IG1pZ3JhdGUgdGhlCi0JICogcGFnZSBiYWNr
IHRvIHJlZ3VsYXIgbWVtb3J5IChDUFUgYWNjZXNzaWJsZSkuCi0JICoKLQkgKiBUaGUgZGV2aWNl
IGRyaXZlciBpcyBmcmVlIHRvIG1pZ3JhdGUgbW9yZSB0aGFuIG9uZSBwYWdlIGZyb20gdGhlCi0J
ICogZmF1bHQoKSBjYWxsYmFjayBhcyBhbiBvcHRpbWl6YXRpb24uIEhvd2V2ZXIgaWYgZGV2aWNl
IGRlY2lkZSB0bwotCSAqIG1pZ3JhdGUgbW9yZSB0aGFuIG9uZSBwYWdlIGl0IG11c3QgYWx3YXlz
IHByaW90aXJpemUgdGhlIGZhdWx0aW5nCi0JICogYWRkcmVzcyBvdmVyIHRoZSBvdGhlcnMuCi0J
ICoKLQkgKiBUaGUgc3RydWN0IHBhZ2UgcG9pbnRlciBpcyBvbmx5IGdpdmVuIGFzIGFuIGhpbnQg
dG8gYWxsb3cgcXVpY2sKLQkgKiBsb29rdXAgb2YgaW50ZXJuYWwgZGV2aWNlIGRyaXZlciBkYXRh
LiBBIGNvbmN1cnJlbnQgbWlncmF0aW9uCi0JICogbWlnaHQgaGF2ZSBhbHJlYWR5IGZyZWUgdGhh
dCBwYWdlIGFuZCB0aGUgdmlydHVhbCBhZGRyZXNzIG1pZ2h0Ci0JICogbm90IGxvbmdlciBiZSBi
YWNrIGJ5IGl0LiBTbyBpdCBzaG91bGQgbm90IGJlIG1vZGlmaWVkIGJ5IHRoZQotCSAqIGNhbGxi
YWNrLgotCSAqCi0JICogTm90ZSB0aGF0IG1tYXAgc2VtYXBob3JlIGlzIGhlbGQgaW4gcmVhZCBt
b2RlIGF0IGxlYXN0IHdoZW4gdGhpcwotCSAqIGNhbGxiYWNrIG9jY3VycywgaGVuY2UgdGhlIHZt
YSBpcyB2YWxpZCB1cG9uIGNhbGxiYWNrIGVudHJ5LgotCSAqLwotCXZtX2ZhdWx0X3QgKCpmYXVs
dCkoc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSwKLQkJICAgICBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1
Y3QgKnZtYSwKLQkJICAgICB1bnNpZ25lZCBsb25nIGFkZHIsCi0JCSAgICAgY29uc3Qgc3RydWN0
IHBhZ2UgKnBhZ2UsCi0JCSAgICAgdW5zaWduZWQgaW50IGZsYWdzLAotCQkgICAgIHBtZF90ICpw
bWRwKTsKLX07Ci0KLS8qCi0gKiBzdHJ1Y3QgaG1tX2Rldm1lbSAtIHRyYWNrIGRldmljZSBtZW1v
cnkKLSAqCi0gKiBAY29tcGxldGlvbjogY29tcGxldGlvbiBvYmplY3QgZm9yIGRldmljZSBtZW1v
cnkKLSAqIEBwZm5fZmlyc3Q6IGZpcnN0IHBmbiBmb3IgdGhpcyByZXNvdXJjZSAoc2V0IGJ5IGht
bV9kZXZtZW1fYWRkKCkpCi0gKiBAcGZuX2xhc3Q6IGxhc3QgcGZuIGZvciB0aGlzIHJlc291cmNl
IChzZXQgYnkgaG1tX2Rldm1lbV9hZGQoKSkKLSAqIEByZXNvdXJjZTogSU8gcmVzb3VyY2UgcmVz
ZXJ2ZWQgZm9yIHRoaXMgY2h1bmsgb2YgbWVtb3J5Ci0gKiBAcGFnZW1hcDogZGV2aWNlIHBhZ2Ug
bWFwIGZvciB0aGF0IGNodW5rCi0gKiBAZGV2aWNlOiBkZXZpY2UgdG8gYmluZCByZXNvdXJjZSB0
bwotICogQG9wczogbWVtb3J5IG9wZXJhdGlvbnMgY2FsbGJhY2sKLSAqIEByZWY6IHBlciBDUFUg
cmVmY291bnQKLSAqIEBwYWdlX2ZhdWx0OiBjYWxsYmFjayB3aGVuIENQVSBmYXVsdCBvbiBhbiB1
bmFkZHJlc3NhYmxlIGRldmljZSBwYWdlCi0gKgotICogVGhpcyBhbiBoZWxwZXIgc3RydWN0dXJl
IGZvciBkZXZpY2UgZHJpdmVycyB0aGF0IGRvIG5vdCB3aXNoIHRvIGltcGxlbWVudAotICogdGhl
IGdvcnkgZGV0YWlscyByZWxhdGVkIHRvIGhvdHBsdWdnaW5nIG5ldyBtZW1veSBhbmQgYWxsb2Nh
dGluZyBzdHJ1Y3QKLSAqIHBhZ2VzLgotICoKLSAqIERldmljZSBkcml2ZXJzIGNhbiBkaXJlY3Rs
eSB1c2UgWk9ORV9ERVZJQ0UgbWVtb3J5IG9uIHRoZWlyIG93biBpZiB0aGV5Ci0gKiB3aXNoIHRv
IGRvIHNvLgotICoKLSAqIFRoZSBwYWdlX2ZhdWx0KCkgY2FsbGJhY2sgbXVzdCBtaWdyYXRlIHBh
Z2UgYmFjaywgZnJvbSBkZXZpY2UgbWVtb3J5IHRvCi0gKiBzeXN0ZW0gbWVtb3J5LCBzbyB0aGF0
IHRoZSBDUFUgY2FuIGFjY2VzcyBpdC4gVGhpcyBtaWdodCBmYWlsIGZvciB2YXJpb3VzCi0gKiBy
ZWFzb25zIChkZXZpY2UgaXNzdWVzLCAgZGV2aWNlIGhhdmUgYmVlbiB1bnBsdWdnZWQsIC4uLiku
IFdoZW4gc3VjaCBlcnJvcgotICogY29uZGl0aW9ucyBoYXBwZW4sIHRoZSBwYWdlX2ZhdWx0KCkg
Y2FsbGJhY2sgbXVzdCByZXR1cm4gVk1fRkFVTFRfU0lHQlVTIGFuZAotICogc2V0IHRoZSBDUFUg
cGFnZSB0YWJsZSBlbnRyeSB0byAicG9pc29uZWQiLgotICoKLSAqIE5vdGUgdGhhdCBiZWNhdXNl
IG1lbW9yeSBjZ3JvdXAgY2hhcmdlcyBhcmUgdHJhbnNmZXJyZWQgdG8gdGhlIGRldmljZSBtZW1v
cnksCi0gKiB0aGlzIHNob3VsZCBuZXZlciBmYWlsIGR1ZSB0byBtZW1vcnkgcmVzdHJpY3Rpb25z
LiBIb3dldmVyLCBhbGxvY2F0aW9uCi0gKiBvZiBhIHJlZ3VsYXIgc3lzdGVtIHBhZ2UgbWlnaHQg
c3RpbGwgZmFpbCBiZWNhdXNlIHdlIGFyZSBvdXQgb2YgbWVtb3J5LiBJZgotICogdGhhdCBoYXBw
ZW5zLCB0aGUgcGFnZV9mYXVsdCgpIGNhbGxiYWNrIG11c3QgcmV0dXJuIFZNX0ZBVUxUX09PTS4K
LSAqCi0gKiBUaGUgcGFnZV9mYXVsdCgpIGNhbGxiYWNrIGNhbiBhbHNvIHRyeSB0byBtaWdyYXRl
IGJhY2sgbXVsdGlwbGUgcGFnZXMgaW4gb25lCi0gKiBjaHVuaywgYXMgYW4gb3B0aW1pemF0aW9u
LiBJdCBtdXN0LCBob3dldmVyLCBwcmlvcml0aXplIHRoZSBmYXVsdGluZyBhZGRyZXNzCi0gKiBv
dmVyIGFsbCB0aGUgb3RoZXJzLgotICovCi0KLXN0cnVjdCBobW1fZGV2bWVtIHsKLQlzdHJ1Y3Qg
Y29tcGxldGlvbgkJY29tcGxldGlvbjsKLQl1bnNpZ25lZCBsb25nCQkJcGZuX2ZpcnN0OwotCXVu
c2lnbmVkIGxvbmcJCQlwZm5fbGFzdDsKLQlzdHJ1Y3QgcmVzb3VyY2UJCQkqcmVzb3VyY2U7Ci0J
c3RydWN0IGRldmljZQkJCSpkZXZpY2U7Ci0Jc3RydWN0IGRldl9wYWdlbWFwCQlwYWdlbWFwOwot
CWNvbnN0IHN0cnVjdCBobW1fZGV2bWVtX29wcwkqb3BzOwotCXN0cnVjdCBwZXJjcHVfcmVmCQly
ZWY7Ci19OwotCi0vKgotICogVG8gYWRkIChob3RwbHVnKSBkZXZpY2UgbWVtb3J5LCBITU0gYXNz
dW1lcyB0aGF0IHRoZXJlIGlzIG5vIHJlYWwgcmVzb3VyY2UKLSAqIHRoYXQgcmVzZXJ2ZXMgYSBy
YW5nZSBpbiB0aGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSAodGhpcyBpcyBpbnRlbmRlZCB0byBi
ZQotICogdXNlIGJ5IHVuYWRkcmVzc2FibGUgZGV2aWNlIG1lbW9yeSkuIEl0IHdpbGwgcmVzZXJ2
ZSBhIHBoeXNpY2FsIHJhbmdlIGJpZwotICogZW5vdWdoIGFuZCBhbGxvY2F0ZSBzdHJ1Y3QgcGFn
ZSBmb3IgaXQuCi0gKgotICogVGhlIGRldmljZSBkcml2ZXIgY2FuIHdyYXAgdGhlIGhtbV9kZXZt
ZW0gc3RydWN0IGluc2lkZSBhIHByaXZhdGUgZGV2aWNlCi0gKiBkcml2ZXIgc3RydWN0LgotICov
Ci1zdHJ1Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1lbV9hZGQoY29uc3Qgc3RydWN0IGhtbV9kZXZt
ZW1fb3BzICpvcHMsCi0JCQkJICBzdHJ1Y3QgZGV2aWNlICpkZXZpY2UsCi0JCQkJICB1bnNpZ25l
ZCBsb25nIHNpemUpOwotCiAvKgogICogaG1tX2Rldm1lbV9wYWdlX3NldF9kcnZkYXRhIC0gc2V0
IHBlci1wYWdlIGRyaXZlciBkYXRhIGZpZWxkCiAgKgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9t
bS9obW0uYwppbmRleCBmZGJkNDg3NzEyOTIuLjkwY2EwY2RhYjlkYiAxMDA2NDQKLS0tIGEvbW0v
aG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTEzMjcsMTEzICsxMzI3LDMgQEAgbG9uZyBobW1fcmFu
Z2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogfQogRVhQT1JUX1NZTUJPTCho
bW1fcmFuZ2VfZG1hX3VubWFwKTsKICNlbmRpZiAvKiBJU19FTkFCTEVEKENPTkZJR19ITU1fTUlS
Uk9SKSAqLwotCi0KLSNpZiBJU19FTkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkKLXN0YXRp
YyB2b2lkIGhtbV9kZXZtZW1fcmVmX3JlbGVhc2Uoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKLXsK
LQlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtOwotCi0JZGV2bWVtID0gY29udGFpbmVyX29mKHJl
Ziwgc3RydWN0IGhtbV9kZXZtZW0sIHJlZik7Ci0JY29tcGxldGUoJmRldm1lbS0+Y29tcGxldGlv
bik7Ci19Ci0KLXN0YXRpYyB2b2lkIGhtbV9kZXZtZW1fcmVmX2V4aXQoc3RydWN0IGRldl9wYWdl
bWFwICpwZ21hcCkKLXsKLQlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtOwotCi0JZGV2bWVtID0g
Y29udGFpbmVyX29mKHBnbWFwLCBzdHJ1Y3QgaG1tX2Rldm1lbSwgcGFnZW1hcCk7Ci0Jd2FpdF9m
b3JfY29tcGxldGlvbigmZGV2bWVtLT5jb21wbGV0aW9uKTsKLQlwZXJjcHVfcmVmX2V4aXQocGdt
YXAtPnJlZik7Ci19Ci0KLXN0YXRpYyB2b2lkIGhtbV9kZXZtZW1fcmVmX2tpbGwoc3RydWN0IGRl
dl9wYWdlbWFwICpwZ21hcCkKLXsKLQlwZXJjcHVfcmVmX2tpbGwocGdtYXAtPnJlZik7Ci19Ci0K
LXN0YXRpYyB2bV9mYXVsdF90IGhtbV9kZXZtZW1fbWlncmF0ZV90b19yYW0oc3RydWN0IHZtX2Zh
dWx0ICp2bWYpCi17Ci0Jc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSA9Ci0JCWNvbnRhaW5lcl9v
Zih2bWYtPnBhZ2UtPnBnbWFwLCBzdHJ1Y3QgaG1tX2Rldm1lbSwgcGFnZW1hcCk7Ci0KLQlyZXR1
cm4gZGV2bWVtLT5vcHMtPmZhdWx0KGRldm1lbSwgdm1mLT52bWEsIHZtZi0+YWRkcmVzcywgdm1m
LT5wYWdlLAotCQkJdm1mLT5mbGFncywgdm1mLT5wbWQpOwotfQotCi1zdGF0aWMgdm9pZCBobW1f
ZGV2bWVtX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpCi17Ci0Jc3RydWN0IGhtbV9kZXZtZW0gKmRl
dm1lbSA9Ci0JCWNvbnRhaW5lcl9vZihwYWdlLT5wZ21hcCwgc3RydWN0IGhtbV9kZXZtZW0sIHBh
Z2VtYXApOwotCi0JZGV2bWVtLT5vcHMtPmZyZWUoZGV2bWVtLCBwYWdlKTsKLX0KLQotc3RhdGlj
IGNvbnN0IHN0cnVjdCBkZXZfcGFnZW1hcF9vcHMgaG1tX3BhZ2VtYXBfb3BzID0gewotCS5wYWdl
X2ZyZWUJCT0gaG1tX2Rldm1lbV9mcmVlLAotCS5raWxsCQkJPSBobW1fZGV2bWVtX3JlZl9raWxs
LAotCS5jbGVhbnVwCQk9IGhtbV9kZXZtZW1fcmVmX2V4aXQsCi0JLm1pZ3JhdGVfdG9fcmFtCQk9
IGhtbV9kZXZtZW1fbWlncmF0ZV90b19yYW0sCi19OwotCi0vKgotICogaG1tX2Rldm1lbV9hZGQo
KSAtIGhvdHBsdWcgWk9ORV9ERVZJQ0UgbWVtb3J5IGZvciBkZXZpY2UgbWVtb3J5Ci0gKgotICog
QG9wczogbWVtb3J5IGV2ZW50IGRldmljZSBkcml2ZXIgY2FsbGJhY2sgKHNlZSBzdHJ1Y3QgaG1t
X2Rldm1lbV9vcHMpCi0gKiBAZGV2aWNlOiBkZXZpY2Ugc3RydWN0IHRvIGJpbmQgdGhlIHJlc291
cmNlIHRvbwotICogQHNpemU6IHNpemUgaW4gYnl0ZXMgb2YgdGhlIGRldmljZSBtZW1vcnkgdG8g
YWRkCi0gKiBSZXR1cm5zOiBwb2ludGVyIHRvIG5ldyBobW1fZGV2bWVtIHN0cnVjdCBFUlJfUFRS
IG90aGVyd2lzZQotICoKLSAqIFRoaXMgZnVuY3Rpb24gZmlyc3QgZmluZHMgYW4gZW1wdHkgcmFu
Z2Ugb2YgcGh5c2ljYWwgYWRkcmVzcyBiaWcgZW5vdWdoIHRvCi0gKiBjb250YWluIHRoZSBuZXcg
cmVzb3VyY2UsIGFuZCB0aGVuIGhvdHBsdWdzIGl0IGFzIFpPTkVfREVWSUNFIG1lbW9yeSwgd2hp
Y2gKLSAqIGluIHR1cm4gYWxsb2NhdGVzIHN0cnVjdCBwYWdlcy4gSXQgZG9lcyBub3QgZG8gYW55
dGhpbmcgYmV5b25kIHRoYXQ7IGFsbAotICogZXZlbnRzIGFmZmVjdGluZyB0aGUgbWVtb3J5IHdp
bGwgZ28gdGhyb3VnaCB0aGUgdmFyaW91cyBjYWxsYmFja3MgcHJvdmlkZWQKLSAqIGJ5IGhtbV9k
ZXZtZW1fb3BzIHN0cnVjdC4KLSAqCi0gKiBEZXZpY2UgZHJpdmVyIHNob3VsZCBjYWxsIHRoaXMg
ZnVuY3Rpb24gZHVyaW5nIGRldmljZSBpbml0aWFsaXphdGlvbiBhbmQKLSAqIGlzIHRoZW4gcmVz
cG9uc2libGUgb2YgbWVtb3J5IG1hbmFnZW1lbnQuIEhNTSBvbmx5IHByb3ZpZGVzIGhlbHBlcnMu
Ci0gKi8KLXN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZChjb25zdCBzdHJ1Y3QgaG1t
X2Rldm1lbV9vcHMgKm9wcywKLQkJCQkgIHN0cnVjdCBkZXZpY2UgKmRldmljZSwKLQkJCQkgIHVu
c2lnbmVkIGxvbmcgc2l6ZSkKLXsKLQlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtOwotCXZvaWQg
KnJlc3VsdDsKLQlpbnQgcmV0OwotCi0JZGV2bWVtID0gZGV2bV9remFsbG9jKGRldmljZSwgc2l6
ZW9mKCpkZXZtZW0pLCBHRlBfS0VSTkVMKTsKLQlpZiAoIWRldm1lbSkKLQkJcmV0dXJuIEVSUl9Q
VFIoLUVOT01FTSk7Ci0KLQlpbml0X2NvbXBsZXRpb24oJmRldm1lbS0+Y29tcGxldGlvbik7Ci0J
ZGV2bWVtLT5wZm5fZmlyc3QgPSAtMVVMOwotCWRldm1lbS0+cGZuX2xhc3QgPSAtMVVMOwotCWRl
dm1lbS0+cmVzb3VyY2UgPSBOVUxMOwotCWRldm1lbS0+ZGV2aWNlID0gZGV2aWNlOwotCWRldm1l
bS0+b3BzID0gb3BzOwotCi0JcmV0ID0gcGVyY3B1X3JlZl9pbml0KCZkZXZtZW0tPnJlZiwgJmht
bV9kZXZtZW1fcmVmX3JlbGVhc2UsCi0JCQkgICAgICAwLCBHRlBfS0VSTkVMKTsKLQlpZiAocmV0
KQotCQlyZXR1cm4gRVJSX1BUUihyZXQpOwotCi0JZGV2bWVtLT5yZXNvdXJjZSA9IGRldm1fcmVx
dWVzdF9mcmVlX21lbV9yZWdpb24oZGV2aWNlLCAmaW9tZW1fcmVzb3VyY2UsCi0JCQlzaXplKTsK
LQlpZiAoSVNfRVJSKGRldm1lbS0+cmVzb3VyY2UpKQotCQlyZXR1cm4gRVJSX0NBU1QoZGV2bWVt
LT5yZXNvdXJjZSk7Ci0JZGV2bWVtLT5wZm5fZmlyc3QgPSBkZXZtZW0tPnJlc291cmNlLT5zdGFy
dCA+PiBQQUdFX1NISUZUOwotCWRldm1lbS0+cGZuX2xhc3QgPSBkZXZtZW0tPnBmbl9maXJzdCAr
Ci0JCQkgICAocmVzb3VyY2Vfc2l6ZShkZXZtZW0tPnJlc291cmNlKSA+PiBQQUdFX1NISUZUKTsK
LQotCWRldm1lbS0+cGFnZW1hcC50eXBlID0gTUVNT1JZX0RFVklDRV9QUklWQVRFOwotCWRldm1l
bS0+cGFnZW1hcC5yZXMgPSAqZGV2bWVtLT5yZXNvdXJjZTsKLQlkZXZtZW0tPnBhZ2VtYXAub3Bz
ID0gJmhtbV9wYWdlbWFwX29wczsKLQlkZXZtZW0tPnBhZ2VtYXAucmVmID0gJmRldm1lbS0+cmVm
OwotCi0JcmVzdWx0ID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXZtZW0tPmRldmljZSwgJmRldm1l
bS0+cGFnZW1hcCk7Ci0JaWYgKElTX0VSUihyZXN1bHQpKQotCQlyZXR1cm4gcmVzdWx0OwotCXJl
dHVybiBkZXZtZW07Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChobW1fZGV2bWVtX2FkZCk7Ci0jZW5k
aWYgLyogQ09ORklHX0RFVklDRV9QUklWQVRFICAqLwotLSAKMi4yMC4xCgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
