Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3A1A78DED
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 30DE089C60;
	Mon, 29 Jul 2019 14:29:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7030089C60;
 Mon, 29 Jul 2019 14:29:12 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6eC-0006LR-Lc; Mon, 29 Jul 2019 14:29:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:39 +0300
Message-Id: <20190729142843.22320-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729142843.22320-1-hch@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
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
 bh=i70xXWqzh87TL34Qzs9EFdKdlKlYP7plK4trr7HnOA4=; b=Psu0e+ZBQ2+XZy9UV042ZeHU8I
 i/PnpWVlHPDuvb4y6TyJ3J/m0czejDL3upQq+2ovRa9NJSO8ErSDcfTE7XpbIc2Ja/pT3tkDh+Gmo
 cqxw/M2PsRQsNY7b+RgIxGd4GQM8LtSBJuZkWmg9d3qGIOHrEWjpdrRkX5LWUkUa1RGaaM1dfqMem
 O/AJmxtq99mcoi0TcvBRsnpi+TeCavtT3YpedU6auEyVSa+KtwaCf4U6BSQIRazOpxKBXyxHveZgl
 uLTe8Fpu1Gnh5OcQr+wjND5uYsTwtNRgKOapUflzwpyGc51jU9lk3YAcYEPcHRuvK+5n7KuFijRR9
 0zv646bA==;
Subject: [Nouveau] [PATCH 5/9] nouveau: simplify nouveau_dmem_migrate_to_ram
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RmFjdG9yIHRoZSBtYWluIGNvcHkgcGFnZSB0byByYW0gcm91dGluZSBvdXQgaW50byBhIGhlbHBl
ciB0aGF0IGFjdHMgb24KYSBzaW5nbGUgcGFnZSBhbmQgd2hpY2ggZG9lc24ndCByZXF1aXJlIHRo
ZSBub3V2ZWF1X2RtZW1fZmF1bHQKc3RydWN0dXJlIGZvciBhcmd1bWVudCBwYXNzaW5nLiAgQWxz
byByZW1vdmUgdGhlIGxvb3Agb3ZlciBtdWx0aXBsZQpwYWdlcyBhcyB3ZSBvbmx5IGhhbmRsZSBv
bmUgYXQgdGhlIG1vbWVudCwgYWx0aG91Z2ggdGhlIHN0cnVjdHVyZSBvZgp0aGUgbWFpbiB3b3Jr
ZXIgZnVuY3Rpb24gbWFrZXMgaXQgcmVsYXRpdmVseSBlYXN5IHRvIGFkZCBtdWx0aSBwYWdlCnN1
cHBvcnQgYmFjayBpZiBuZWVkZWQgaW4gdGhlIGZ1dHVyZS4gIEJ1dCBhdCBsZWFzdCBmb3Igbm93
IHRoaXMgYXZvaWQKdGhlIG5lZWRlZCB0byBkeW5hbWljYWxseSBhbGxvY2F0ZSBtZW1vcnkgZm9y
IHRoZSBkbWEgYWRkcmVzc2VzIGluCndoYXQgaXMgZXNzZW50aWFsbHkgdGhlIHBhZ2UgZmF1bHQg
cGF0aC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgMTU4ICsrKysrKy0tLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzOSBpbnNlcnRpb25zKCspLCAxMTkgZGVs
ZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCAyMTA1
MmE0YWFmNjkuLjAzNmU2YzA3ZDQ4OSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMKQEAgLTg2LDEzICs4Niw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG5vdXZlYXVfZG1l
bSAqcGFnZV90b19kbWVtKHN0cnVjdCBwYWdlICpwYWdlKQogCXJldHVybiBjb250YWluZXJfb2Yo
cGFnZS0+cGdtYXAsIHN0cnVjdCBub3V2ZWF1X2RtZW0sIHBhZ2VtYXApOwogfQogCi1zdHJ1Y3Qg
bm91dmVhdV9kbWVtX2ZhdWx0IHsKLQlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybTsKLQlzdHJ1Y3Qg
bm91dmVhdV9mZW5jZSAqZmVuY2U7Ci0JZG1hX2FkZHJfdCAqZG1hOwotCXVuc2lnbmVkIGxvbmcg
bnBhZ2VzOwotfTsKLQogc3RydWN0IG5vdXZlYXVfbWlncmF0ZSB7CiAJc3RydWN0IHZtX2FyZWFf
c3RydWN0ICp2bWE7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07CkBAIC0xNDYsMTMwICsxMzks
NTUgQEAgc3RhdGljIHZvaWQgbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoc3RydWN0IG5vdXZlYXVf
ZmVuY2UgKipmZW5jZSkKIAl9CiB9CiAKLXN0YXRpYyB2b2lkCi1ub3V2ZWF1X2RtZW1fZmF1bHRf
YWxsb2NfYW5kX2NvcHkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCi0JCQkJICBjb25zdCB1
bnNpZ25lZCBsb25nICpzcmNfcGZucywKLQkJCQkgIHVuc2lnbmVkIGxvbmcgKmRzdF9wZm5zLAot
CQkJCSAgdW5zaWduZWQgbG9uZyBzdGFydCwKLQkJCQkgIHVuc2lnbmVkIGxvbmcgZW5kLAotCQkJ
CSAgc3RydWN0IG5vdXZlYXVfZG1lbV9mYXVsdCAqZmF1bHQpCitzdGF0aWMgdm1fZmF1bHRfdCBu
b3V2ZWF1X2RtZW1fZmF1bHRfY29weV9vbmUoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCisJCXN0
cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLCB1bnNpZ25lZCBsb25nIGFkZHIsCisJCXVuc2lnbmVk
IGxvbmcgc3JjLCB1bnNpZ25lZCBsb25nICpkc3QsIGRtYV9hZGRyX3QgKmRtYV9hZGRyKQogewot
CXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gZmF1bHQtPmRybTsKIAlzdHJ1Y3QgZGV2aWNlICpk
ZXYgPSBkcm0tPmRldi0+ZGV2OwotCXVuc2lnbmVkIGxvbmcgYWRkciwgaSwgbnBhZ2VzID0gMDsK
LQlub3V2ZWF1X21pZ3JhdGVfY29weV90IGNvcHk7Ci0JaW50IHJldDsKLQotCi0JLyogRmlyc3Qg
YWxsb2NhdGUgbmV3IG1lbW9yeSAqLwotCWZvciAoYWRkciA9IHN0YXJ0LCBpID0gMDsgYWRkciA8
IGVuZDsgYWRkciArPSBQQUdFX1NJWkUsIGkrKykgewotCQlzdHJ1Y3QgcGFnZSAqZHBhZ2UsICpz
cGFnZTsKLQotCQlkc3RfcGZuc1tpXSA9IDA7Ci0JCXNwYWdlID0gbWlncmF0ZV9wZm5fdG9fcGFn
ZShzcmNfcGZuc1tpXSk7Ci0JCWlmICghc3BhZ2UgfHwgIShzcmNfcGZuc1tpXSAmIE1JR1JBVEVf
UEZOX01JR1JBVEUpKQotCQkJY29udGludWU7CisJc3RydWN0IHBhZ2UgKmRwYWdlLCAqc3BhZ2U7
CiAKLQkJZHBhZ2UgPSBhbGxvY19wYWdlX3ZtYShHRlBfSElHSFVTRVIsIHZtYSwgYWRkcik7Ci0J
CWlmICghZHBhZ2UpIHsKLQkJCWRzdF9wZm5zW2ldID0gTUlHUkFURV9QRk5fRVJST1I7Ci0JCQlj
b250aW51ZTsKLQkJfQotCQlsb2NrX3BhZ2UoZHBhZ2UpOwotCi0JCWRzdF9wZm5zW2ldID0gbWln
cmF0ZV9wZm4ocGFnZV90b19wZm4oZHBhZ2UpKSB8Ci0JCQkgICAgICBNSUdSQVRFX1BGTl9MT0NL
RUQ7Ci0JCW5wYWdlcysrOwotCX0KKwlzcGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2Uoc3JjKTsK
KwlpZiAoIXNwYWdlIHx8ICEoc3JjICYgTUlHUkFURV9QRk5fTUlHUkFURSkpCisJCXJldHVybiAw
OwogCi0JLyogQWxsb2NhdGUgc3RvcmFnZSBmb3IgRE1BIGFkZHJlc3Nlcywgc28gd2UgY2FuIHVu
bWFwIGxhdGVyLiAqLwotCWZhdWx0LT5kbWEgPSBrbWFsbG9jKHNpemVvZigqZmF1bHQtPmRtYSkg
KiBucGFnZXMsIEdGUF9LRVJORUwpOwotCWlmICghZmF1bHQtPmRtYSkKKwlkcGFnZSA9IGFsbG9j
X3BhZ2Vfdm1hKEdGUF9ISUdIVVNFUiwgYXJncy0+dm1hLCBhZGRyKTsKKwlpZiAoIWRwYWdlKQog
CQlnb3RvIGVycm9yOworCWxvY2tfcGFnZShkcGFnZSk7CiAKLQkvKiBDb3B5IHRoaW5ncyBvdmVy
ICovCi0JY29weSA9IGRybS0+ZG1lbS0+bWlncmF0ZS5jb3B5X2Z1bmM7Ci0JZm9yIChhZGRyID0g
c3RhcnQsIGkgPSAwOyBhZGRyIDwgZW5kOyBhZGRyICs9IFBBR0VfU0laRSwgaSsrKSB7Ci0JCXN0
cnVjdCBwYWdlICpzcGFnZSwgKmRwYWdlOwotCi0JCWRwYWdlID0gbWlncmF0ZV9wZm5fdG9fcGFn
ZShkc3RfcGZuc1tpXSk7Ci0JCWlmICghZHBhZ2UgfHwgZHN0X3BmbnNbaV0gPT0gTUlHUkFURV9Q
Rk5fRVJST1IpCi0JCQljb250aW51ZTsKLQotCQlzcGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2Uo
c3JjX3BmbnNbaV0pOwotCQlpZiAoIXNwYWdlIHx8ICEoc3JjX3BmbnNbaV0gJiBNSUdSQVRFX1BG
Tl9NSUdSQVRFKSkgewotCQkJZHN0X3BmbnNbaV0gPSBNSUdSQVRFX1BGTl9FUlJPUjsKLQkJCV9f
ZnJlZV9wYWdlKGRwYWdlKTsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KLQkJZmF1bHQtPmRtYVtmYXVs
dC0+bnBhZ2VzXSA9Ci0JCQlkbWFfbWFwX3BhZ2VfYXR0cnMoZGV2LCBkcGFnZSwgMCwgUEFHRV9T
SVpFLAotCQkJCQkgICBQQ0lfRE1BX0JJRElSRUNUSU9OQUwsCi0JCQkJCSAgIERNQV9BVFRSX1NL
SVBfQ1BVX1NZTkMpOwotCQlpZiAoZG1hX21hcHBpbmdfZXJyb3IoZGV2LCBmYXVsdC0+ZG1hW2Zh
dWx0LT5ucGFnZXNdKSkgewotCQkJZHN0X3BmbnNbaV0gPSBNSUdSQVRFX1BGTl9FUlJPUjsKLQkJ
CV9fZnJlZV9wYWdlKGRwYWdlKTsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KLQkJcmV0ID0gY29weShk
cm0sIDEsIE5PVVZFQVVfQVBFUl9IT1NULAotCQkJCWZhdWx0LT5kbWFbZmF1bHQtPm5wYWdlcysr
XSwKLQkJCQlOT1VWRUFVX0FQRVJfVlJBTSwKLQkJCQlub3V2ZWF1X2RtZW1fcGFnZV9hZGRyKHNw
YWdlKSk7Ci0JCWlmIChyZXQpIHsKLQkJCWRzdF9wZm5zW2ldID0gTUlHUkFURV9QRk5fRVJST1I7
Ci0JCQlfX2ZyZWVfcGFnZShkcGFnZSk7Ci0JCQljb250aW51ZTsKLQkJfQotCX0KKwkqZG1hX2Fk
ZHIgPSBkbWFfbWFwX3BhZ2UoZGV2LCBkcGFnZSwgMCwgUEFHRV9TSVpFLCBETUFfQklESVJFQ1RJ
T05BTCk7CisJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgKmRtYV9hZGRyKSkKKwkJZ290byBl
cnJvcl9mcmVlX3BhZ2U7CiAKLQlub3V2ZWF1X2ZlbmNlX25ldyhkcm0tPmRtZW0tPm1pZ3JhdGUu
Y2hhbiwgZmFsc2UsICZmYXVsdC0+ZmVuY2UpOworCWlmIChkcm0tPmRtZW0tPm1pZ3JhdGUuY29w
eV9mdW5jKGRybSwgMSwgTk9VVkVBVV9BUEVSX0hPU1QsICpkbWFfYWRkciwKKwkJCU5PVVZFQVVf
QVBFUl9WUkFNLCBub3V2ZWF1X2RtZW1fcGFnZV9hZGRyKHNwYWdlKSkpCisJCWdvdG8gZXJyb3Jf
ZG1hX3VubWFwOwogCi0JcmV0dXJuOworCSpkc3QgPSBtaWdyYXRlX3BmbihwYWdlX3RvX3Bmbihk
cGFnZSkpIHwgTUlHUkFURV9QRk5fTE9DS0VEOwogCitlcnJvcl9kbWFfdW5tYXA6CisJZG1hX3Vu
bWFwX3BhZ2UoZGV2LCAqZG1hX2FkZHIsIFBBR0VfU0laRSwgRE1BX0JJRElSRUNUSU9OQUwpOwor
ZXJyb3JfZnJlZV9wYWdlOgorCV9fZnJlZV9wYWdlKGRwYWdlKTsKIGVycm9yOgotCWZvciAoYWRk
ciA9IHN0YXJ0LCBpID0gMDsgYWRkciA8IGVuZDsgYWRkciArPSBQQUdFX1NJWkUsICsraSkgewot
CQlzdHJ1Y3QgcGFnZSAqcGFnZTsKLQotCQlpZiAoIWRzdF9wZm5zW2ldIHx8IGRzdF9wZm5zW2ld
ID09IE1JR1JBVEVfUEZOX0VSUk9SKQotCQkJY29udGludWU7Ci0KLQkJcGFnZSA9IG1pZ3JhdGVf
cGZuX3RvX3BhZ2UoZHN0X3BmbnNbaV0pOwotCQlkc3RfcGZuc1tpXSA9IE1JR1JBVEVfUEZOX0VS
Uk9SOwotCQlpZiAocGFnZSA9PSBOVUxMKQotCQkJY29udGludWU7Ci0KLQkJX19mcmVlX3BhZ2Uo
cGFnZSk7Ci0JfQotfQotCi1zdGF0aWMgdm9pZAotbm91dmVhdV9kbWVtX2ZhdWx0X2ZpbmFsaXpl
X2FuZF9tYXAoc3RydWN0IG5vdXZlYXVfZG1lbV9mYXVsdCAqZmF1bHQpCi17Ci0Jc3RydWN0IG5v
dXZlYXVfZHJtICpkcm0gPSBmYXVsdC0+ZHJtOwotCi0Jbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUo
JmZhdWx0LT5mZW5jZSk7Ci0KLQl3aGlsZSAoZmF1bHQtPm5wYWdlcy0tKSB7Ci0JCWRtYV91bm1h
cF9wYWdlKGRybS0+ZGV2LT5kZXYsIGZhdWx0LT5kbWFbZmF1bHQtPm5wYWdlc10sCi0JCQkgICAg
ICAgUEFHRV9TSVpFLCBQQ0lfRE1BX0JJRElSRUNUSU9OQUwpOwotCX0KLQlrZnJlZShmYXVsdC0+
ZG1hKTsKKwlyZXR1cm4gVk1fRkFVTFRfU0lHQlVTOwogfQogCiBzdGF0aWMgdm1fZmF1bHRfdCBu
b3V2ZWF1X2RtZW1fbWlncmF0ZV90b19yYW0oc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7CiAJc3Ry
dWN0IG5vdXZlYXVfZG1lbSAqZG1lbSA9IHBhZ2VfdG9fZG1lbSh2bWYtPnBhZ2UpOwotCXVuc2ln
bmVkIGxvbmcgc3JjWzFdID0gezB9LCBkc3RbMV0gPSB7MH07CisJc3RydWN0IG5vdXZlYXVfZHJt
ICpkcm0gPSBkbWVtLT5kcm07CisJc3RydWN0IG5vdXZlYXVfZmVuY2UgKmZlbmNlOworCXVuc2ln
bmVkIGxvbmcgc3JjID0gMCwgZHN0ID0gMDsKKwlkbWFfYWRkcl90IGRtYV9hZGRyID0gMDsKKwl2
bV9mYXVsdF90IHJldDsKIAlzdHJ1Y3QgbWlncmF0ZV92bWEgYXJncyA9IHsKIAkJLnZtYQkJPSB2
bWYtPnZtYSwKIAkJLnN0YXJ0CQk9IHZtZi0+YWRkcmVzcywKIAkJLmVuZAkJPSB2bWYtPmFkZHJl
c3MgKyBQQUdFX1NJWkUsCi0JCS5zcmMJCT0gc3JjLAotCQkuZHN0CQk9IGRzdCwKKwkJLnNyYwkJ
PSAmc3JjLAorCQkuZHN0CQk9ICZkc3QsCiAJfTsKLQlzdHJ1Y3Qgbm91dmVhdV9kbWVtX2ZhdWx0
IGZhdWx0ID0geyAuZHJtID0gZG1lbS0+ZHJtIH07CiAKIAkvKgogCSAqIEZJWE1FIHdoYXQgd2Ug
cmVhbGx5IHdhbnQgaXMgdG8gZmluZCBzb21lIGhldXJpc3RpYyB0byBtaWdyYXRlIG1vcmUKQEAg
LTI4MSwxNiArMTk5LDE4IEBAIHN0YXRpYyB2bV9mYXVsdF90IG5vdXZlYXVfZG1lbV9taWdyYXRl
X3RvX3JhbShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIAlpZiAoIWFyZ3MuY3BhZ2VzKQogCQlyZXR1
cm4gMDsKIAotCW5vdXZlYXVfZG1lbV9mYXVsdF9hbGxvY19hbmRfY29weShhcmdzLnZtYSwgc3Jj
LCBkc3QsIGFyZ3Muc3RhcnQsCi0JCQlhcmdzLmVuZCwgJmZhdWx0KTsKLQltaWdyYXRlX3ZtYV9w
YWdlcygmYXJncyk7Ci0Jbm91dmVhdV9kbWVtX2ZhdWx0X2ZpbmFsaXplX2FuZF9tYXAoJmZhdWx0
KTsKKwlyZXQgPSBub3V2ZWF1X2RtZW1fZmF1bHRfY29weV9vbmUoZHJtLCB2bWYtPnZtYSwgdm1m
LT5hZGRyZXNzLCBzcmMsCisJCQkmZHN0LCAmZG1hX2FkZHIpOworCWlmIChyZXQgfHwgZHN0ID09
IDApCisJCWdvdG8gZG9uZTsKIAorCW5vdXZlYXVfZmVuY2VfbmV3KGRtZW0tPm1pZ3JhdGUuY2hh
biwgZmFsc2UsICZmZW5jZSk7CisJbWlncmF0ZV92bWFfcGFnZXMoJmFyZ3MpOworCW5vdXZlYXVf
ZG1lbV9mZW5jZV9kb25lKCZmZW5jZSk7CisJZG1hX3VubWFwX3BhZ2UoZHJtLT5kZXYtPmRldiwg
ZG1hX2FkZHIsIFBBR0VfU0laRSwgRE1BX0JJRElSRUNUSU9OQUwpOworZG9uZToKIAltaWdyYXRl
X3ZtYV9maW5hbGl6ZSgmYXJncyk7Ci0JaWYgKGRzdFswXSA9PSBNSUdSQVRFX1BGTl9FUlJPUikK
LQkJcmV0dXJuIFZNX0ZBVUxUX1NJR0JVUzsKLQotCXJldHVybiAwOworCXJldHVybiByZXQ7CiB9
CiAKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2X3BhZ2VtYXBfb3BzIG5vdXZlYXVfZG1lbV9wYWdl
bWFwX29wcyA9IHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1
