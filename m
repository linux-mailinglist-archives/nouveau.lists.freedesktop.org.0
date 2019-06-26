Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C01D5568EA
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:28:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19F146E3EE;
	Wed, 26 Jun 2019 12:28:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5DA796E3F4;
 Wed, 26 Jun 2019 12:28:08 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71w-0001VC-1N; Wed, 26 Jun 2019 12:28:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:13 +0200
Message-Id: <20190626122724.13313-15-hch@lst.de>
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
 bh=ANw7RZagrpik3WocXdWXhNlp6QZ5do/+kvuvuFAYJx4=; b=ijYZ5frFBFM0E1S9/heolrZuVq
 fiehuQE8ACYkeVMEEUbSx9wtexApVjgDkdWFusYE+ResPKVxnKQ4NcJFTCxA6a0gtK/XV36izYV+4
 pVwpqJV3wZ7SyB6qaM8OjGUctQIv0YwMKWoQH44rSJ9wzSiwDaQqNfB9IaU8uumtrzxglnb/XEQG0
 xMvn3pNm5R92JRb8Vk5WeKYw90/4Vc31OIB8JzItC6bGVozyeO1DOGTbXiUtUi94Cxjfo71oNrmQ6
 yer0TSsw0af5ck30pjrW2Th16XkgYmbL7wR2ClKTCR47UyymuvMJxVb6Il4LES4ylJ3NoLxhbmQoy
 tX0YR4qQ==;
Subject: [Nouveau] [PATCH 14/25] memremap: replace the altmap_valid field
 with a PGMAP_ALTMAP_VALID flag
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

QWRkIGEgZmxhZ3MgZmllbGQgdG8gc3RydWN0IGRldl9wYWdlbWFwIHRvIHJlcGxhY2UgdGhlIGFs
dG1hcF92YWxpZApib29sZWFuIHRvIGJlIGEgbGl0dGxlIG1vcmUgZXh0ZW5zaWJsZS4gIEFsc28g
YWRkIGEgcGdtYXBfYWx0bWFwKCkgaGVscGVyCnRvIGZpbmQgdGhlIG9wdGlvbmFsIGFsdG1hcCBh
bmQgY2xlYW4gdXAgdGhlIGNvZGUgdXNpbmcgdGhlIGFsdG1hcCB1c2luZwppdC4KClNpZ25lZC1v
ZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGFyY2gvcG93ZXJwYy9t
bS9tZW0uYyAgICAgfCAxMCArLS0tLS0tLS0tCiBhcmNoL3g4Ni9tbS9pbml0XzY0LmMgICAgIHwg
IDggKystLS0tLS0KIGRyaXZlcnMvbnZkaW1tL3Bmbl9kZXZzLmMgfCAgMyArLS0KIGRyaXZlcnMv
bnZkaW1tL3BtZW0uYyAgICAgfCAgMSAtCiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggIHwgMTIg
KysrKysrKysrKystCiBrZXJuZWwvbWVtcmVtYXAuYyAgICAgICAgIHwgMjYgKysrKysrKysrKy0t
LS0tLS0tLS0tLS0tLS0KIG1tL2htbS5jICAgICAgICAgICAgICAgICAgfCAgMSAtCiBtbS9tZW1v
cnlfaG90cGx1Zy5jICAgICAgIHwgIDYgKystLS0tCiBtbS9wYWdlX2FsbG9jLmMgICAgICAgICAg
IHwgIDUgKystLS0KIDkgZmlsZXMgY2hhbmdlZCwgMjkgaW5zZXJ0aW9ucygrKSwgNDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvYXJjaC9wb3dlcnBjL21tL21lbS5jIGIvYXJjaC9wb3dlcnBj
L21tL21lbS5jCmluZGV4IGNiYTI5MTMxYmNjYy4uZjc3NGQ4MGRmMDI1IDEwMDY0NAotLS0gYS9h
cmNoL3Bvd2VycGMvbW0vbWVtLmMKKysrIGIvYXJjaC9wb3dlcnBjL21tL21lbS5jCkBAIC0xMzEs
MTcgKzEzMSw5IEBAIHZvaWQgX19yZWYgYXJjaF9yZW1vdmVfbWVtb3J5KGludCBuaWQsIHU2NCBz
dGFydCwgdTY0IHNpemUsCiB7CiAJdW5zaWduZWQgbG9uZyBzdGFydF9wZm4gPSBzdGFydCA+PiBQ
QUdFX1NISUZUOwogCXVuc2lnbmVkIGxvbmcgbnJfcGFnZXMgPSBzaXplID4+IFBBR0VfU0hJRlQ7
Ci0Jc3RydWN0IHBhZ2UgKnBhZ2U7CisJc3RydWN0IHBhZ2UgKnBhZ2UgPSBwZm5fdG9fcGFnZShz
dGFydF9wZm4pICsgdm1lbV9hbHRtYXBfb2Zmc2V0KGFsdG1hcCk7CiAJaW50IHJldDsKIAotCS8q
Ci0JICogSWYgd2UgaGF2ZSBhbiBhbHRtYXAgdGhlbiB3ZSBuZWVkIHRvIHNraXAgb3ZlciBhbnkg
cmVzZXJ2ZWQgUEZOcwotCSAqIHdoZW4gcXVlcnlpbmcgdGhlIHpvbmUuCi0JICovCi0JcGFnZSA9
IHBmbl90b19wYWdlKHN0YXJ0X3Bmbik7Ci0JaWYgKGFsdG1hcCkKLQkJcGFnZSArPSB2bWVtX2Fs
dG1hcF9vZmZzZXQoYWx0bWFwKTsKLQogCV9fcmVtb3ZlX3BhZ2VzKHBhZ2Vfem9uZShwYWdlKSwg
c3RhcnRfcGZuLCBucl9wYWdlcywgYWx0bWFwKTsKIAogCS8qIFJlbW92ZSBodGFiIGJvbHRlZCBt
YXBwaW5ncyBmb3IgdGhpcyBzZWN0aW9uIG9mIG1lbW9yeSAqLwpkaWZmIC0tZ2l0IGEvYXJjaC94
ODYvbW0vaW5pdF82NC5jIGIvYXJjaC94ODYvbW0vaW5pdF82NC5jCmluZGV4IDY5M2FhZjI4ZDVm
ZS4uMzEzOWU5OTJlZjlkIDEwMDY0NAotLS0gYS9hcmNoL3g4Ni9tbS9pbml0XzY0LmMKKysrIGIv
YXJjaC94ODYvbW0vaW5pdF82NC5jCkBAIC0xMjExLDEzICsxMjExLDkgQEAgdm9pZCBfX3JlZiBh
cmNoX3JlbW92ZV9tZW1vcnkoaW50IG5pZCwgdTY0IHN0YXJ0LCB1NjQgc2l6ZSwKIHsKIAl1bnNp
Z25lZCBsb25nIHN0YXJ0X3BmbiA9IHN0YXJ0ID4+IFBBR0VfU0hJRlQ7CiAJdW5zaWduZWQgbG9u
ZyBucl9wYWdlcyA9IHNpemUgPj4gUEFHRV9TSElGVDsKLQlzdHJ1Y3QgcGFnZSAqcGFnZSA9IHBm
bl90b19wYWdlKHN0YXJ0X3Bmbik7Ci0Jc3RydWN0IHpvbmUgKnpvbmU7CisJc3RydWN0IHBhZ2Ug
KnBhZ2UgPSBwZm5fdG9fcGFnZShzdGFydF9wZm4pICsgdm1lbV9hbHRtYXBfb2Zmc2V0KGFsdG1h
cCk7CisJc3RydWN0IHpvbmUgKnpvbmUgPSBwYWdlX3pvbmUocGFnZSk7CiAKLQkvKiBXaXRoIGFs
dG1hcCB0aGUgZmlyc3QgbWFwcGVkIHBhZ2UgaXMgb2Zmc2V0IGZyb20gQHN0YXJ0ICovCi0JaWYg
KGFsdG1hcCkKLQkJcGFnZSArPSB2bWVtX2FsdG1hcF9vZmZzZXQoYWx0bWFwKTsKLQl6b25lID0g
cGFnZV96b25lKHBhZ2UpOwogCV9fcmVtb3ZlX3BhZ2VzKHpvbmUsIHN0YXJ0X3BmbiwgbnJfcGFn
ZXMsIGFsdG1hcCk7CiAJa2VybmVsX3BoeXNpY2FsX21hcHBpbmdfcmVtb3ZlKHN0YXJ0LCBzdGFy
dCArIHNpemUpOwogfQpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udmRpbW0vcGZuX2RldnMuYyBiL2Ry
aXZlcnMvbnZkaW1tL3Bmbl9kZXZzLmMKaW5kZXggMGY4MWZjNTZiYmZkLi41NWZiNmI3NDMzZWQg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvbnZkaW1tL3Bmbl9kZXZzLmMKKysrIGIvZHJpdmVycy9udmRp
bW0vcGZuX2RldnMuYwpAQCAtNjIyLDcgKzYyMiw2IEBAIHN0YXRpYyBpbnQgX19udmRpbW1fc2V0
dXBfcGZuKHN0cnVjdCBuZF9wZm4gKm5kX3Bmbiwgc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCkK
IAkJaWYgKG9mZnNldCA8IHJlc2VydmUpCiAJCQlyZXR1cm4gLUVJTlZBTDsKIAkJbmRfcGZuLT5u
cGZucyA9IGxlNjRfdG9fY3B1KHBmbl9zYi0+bnBmbnMpOwotCQlwZ21hcC0+YWx0bWFwX3ZhbGlk
ID0gZmFsc2U7CiAJfSBlbHNlIGlmIChuZF9wZm4tPm1vZGUgPT0gUEZOX01PREVfUE1FTSkgewog
CQluZF9wZm4tPm5wZm5zID0gUEZOX1NFQ1RJT05fQUxJR05fVVAoKHJlc291cmNlX3NpemUocmVz
KQogCQkJCQktIG9mZnNldCkgLyBQQUdFX1NJWkUpOwpAQCAtNjM0LDcgKzYzMyw3IEBAIHN0YXRp
YyBpbnQgX19udmRpbW1fc2V0dXBfcGZuKHN0cnVjdCBuZF9wZm4gKm5kX3Bmbiwgc3RydWN0IGRl
dl9wYWdlbWFwICpwZ21hcCkKIAkJbWVtY3B5KGFsdG1hcCwgJl9fYWx0bWFwLCBzaXplb2YoKmFs
dG1hcCkpOwogCQlhbHRtYXAtPmZyZWUgPSBQSFlTX1BGTihvZmZzZXQgLSByZXNlcnZlKTsKIAkJ
YWx0bWFwLT5hbGxvYyA9IDA7Ci0JCXBnbWFwLT5hbHRtYXBfdmFsaWQgPSB0cnVlOworCQlwZ21h
cC0+ZmxhZ3MgfD0gUEdNQVBfQUxUTUFQX1ZBTElEOwogCX0gZWxzZQogCQlyZXR1cm4gLUVOWElP
OwogCmRpZmYgLS1naXQgYS9kcml2ZXJzL252ZGltbS9wbWVtLmMgYi9kcml2ZXJzL252ZGltbS9w
bWVtLmMKaW5kZXggMDkzNDA4Y2U0MGFkLi5lN2Q4Y2M5ZjQxZTggMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvbnZkaW1tL3BtZW0uYworKysgYi9kcml2ZXJzL252ZGltbS9wbWVtLmMKQEAgLTQxMiw3ICs0
MTIsNiBAQCBzdGF0aWMgaW50IHBtZW1fYXR0YWNoX2Rpc2soc3RydWN0IGRldmljZSAqZGV2LAog
CQliYl9yZXMuc3RhcnQgKz0gcG1lbS0+ZGF0YV9vZmZzZXQ7CiAJfSBlbHNlIGlmIChwbWVtX3No
b3VsZF9tYXBfcGFnZXMoZGV2KSkgewogCQltZW1jcHkoJnBtZW0tPnBnbWFwLnJlcywgJm5zaW8t
PnJlcywgc2l6ZW9mKHBtZW0tPnBnbWFwLnJlcykpOwotCQlwbWVtLT5wZ21hcC5hbHRtYXBfdmFs
aWQgPSBmYWxzZTsKIAkJcG1lbS0+cGdtYXAudHlwZSA9IE1FTU9SWV9ERVZJQ0VfRlNfREFYOwog
CQlwbWVtLT5wZ21hcC5vcHMgPSAmZnNkYXhfcGFnZW1hcF9vcHM7CiAJCWFkZHIgPSBkZXZtX21l
bXJlbWFwX3BhZ2VzKGRldiwgJnBtZW0tPnBnbWFwKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvbWVtcmVtYXAuaCBiL2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaAppbmRleCAzMzZlY2E2MDFk
YWQuLmUyNTY4NWI4NzhlOSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oCisr
KyBiL2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaApAQCAtODgsNiArODgsOCBAQCBzdHJ1Y3QgZGV2
X3BhZ2VtYXBfb3BzIHsKIAl2bV9mYXVsdF90ICgqbWlncmF0ZV90b19yYW0pKHN0cnVjdCB2bV9m
YXVsdCAqdm1mKTsKIH07CiAKKyNkZWZpbmUgUEdNQVBfQUxUTUFQX1ZBTElECSgxIDw8IDApCisK
IC8qKgogICogc3RydWN0IGRldl9wYWdlbWFwIC0gbWV0YWRhdGEgZm9yIFpPTkVfREVWSUNFIG1h
cHBpbmdzCiAgKiBAYWx0bWFwOiBwcmUtYWxsb2NhdGVkL3Jlc2VydmVkIG1lbW9yeSBmb3Igdm1l
bW1hcCBhbGxvY2F0aW9ucwpAQCAtOTYsMTkgKzk4LDI3IEBAIHN0cnVjdCBkZXZfcGFnZW1hcF9v
cHMgewogICogQGRldjogaG9zdCBkZXZpY2Ugb2YgdGhlIG1hcHBpbmcgZm9yIGRlYnVnCiAgKiBA
ZGF0YTogcHJpdmF0ZSBkYXRhIHBvaW50ZXIgZm9yIHBhZ2VfZnJlZSgpCiAgKiBAdHlwZTogbWVt
b3J5IHR5cGU6IHNlZSBNRU1PUllfKiBpbiBtZW1vcnlfaG90cGx1Zy5oCisgKiBAZmxhZ3M6IFBH
TUFQXyogZmxhZ3MgdG8gc3BlY2lmeSBkZWZhaWxlZCBiZWhhdmlvcgogICogQG9wczogbWV0aG9k
IHRhYmxlCiAgKi8KIHN0cnVjdCBkZXZfcGFnZW1hcCB7CiAJc3RydWN0IHZtZW1fYWx0bWFwIGFs
dG1hcDsKLQlib29sIGFsdG1hcF92YWxpZDsKIAlzdHJ1Y3QgcmVzb3VyY2UgcmVzOwogCXN0cnVj
dCBwZXJjcHVfcmVmICpyZWY7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCWVudW0gbWVtb3J5X3R5
cGUgdHlwZTsKKwl1bnNpZ25lZCBpbnQgZmxhZ3M7CiAJdTY0IHBjaV9wMnBkbWFfYnVzX29mZnNl
dDsKIAljb25zdCBzdHJ1Y3QgZGV2X3BhZ2VtYXBfb3BzICpvcHM7CiB9OwogCitzdGF0aWMgaW5s
aW5lIHN0cnVjdCB2bWVtX2FsdG1hcCAqcGdtYXBfYWx0bWFwKHN0cnVjdCBkZXZfcGFnZW1hcCAq
cGdtYXApCit7CisJaWYgKHBnbWFwLT5mbGFncyAmIFBHTUFQX0FMVE1BUF9WQUxJRCkKKwkJcmV0
dXJuICZwZ21hcC0+YWx0bWFwOworCXJldHVybiBOVUxMOworfQorCiAjaWZkZWYgQ09ORklHX1pP
TkVfREVWSUNFCiB2b2lkICpkZXZtX21lbXJlbWFwX3BhZ2VzKHN0cnVjdCBkZXZpY2UgKmRldiwg
c3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCk7CiB2b2lkIGRldm1fbWVtdW5tYXBfcGFnZXMoc3Ry
dWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKTsKZGlmZiAtLWdpdCBh
L2tlcm5lbC9tZW1yZW1hcC5jIGIva2VybmVsL21lbXJlbWFwLmMKaW5kZXggNmMzZGJiNjkyMDM3
Li5lZWU0OTBlN2Q3ZTEgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9tZW1yZW1hcC5jCisrKyBiL2tlcm5l
bC9tZW1yZW1hcC5jCkBAIC01NCwxNCArNTQsOCBAQCBzdGF0aWMgdm9pZCBwZ21hcF9hcnJheV9k
ZWxldGUoc3RydWN0IHJlc291cmNlICpyZXMpCiAKIHN0YXRpYyB1bnNpZ25lZCBsb25nIHBmbl9m
aXJzdChzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQogewotCWNvbnN0IHN0cnVjdCByZXNvdXJj
ZSAqcmVzID0gJnBnbWFwLT5yZXM7Ci0Jc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAgPSAmcGdt
YXAtPmFsdG1hcDsKLQl1bnNpZ25lZCBsb25nIHBmbjsKLQotCXBmbiA9IHJlcy0+c3RhcnQgPj4g
UEFHRV9TSElGVDsKLQlpZiAocGdtYXAtPmFsdG1hcF92YWxpZCkKLQkJcGZuICs9IHZtZW1fYWx0
bWFwX29mZnNldChhbHRtYXApOwotCXJldHVybiBwZm47CisJcmV0dXJuIChwZ21hcC0+cmVzLnN0
YXJ0ID4+IFBBR0VfU0hJRlQpICsKKwkJdm1lbV9hbHRtYXBfb2Zmc2V0KHBnbWFwX2FsdG1hcChw
Z21hcCkpOwogfQogCiBzdGF0aWMgdW5zaWduZWQgbG9uZyBwZm5fZW5kKHN0cnVjdCBkZXZfcGFn
ZW1hcCAqcGdtYXApCkBAIC0xMDksNyArMTAzLDcgQEAgc3RhdGljIHZvaWQgZGV2bV9tZW1yZW1h
cF9wYWdlc19yZWxlYXNlKHZvaWQgKmRhdGEpCiAJCQkJYWxpZ25fc2l6ZSA+PiBQQUdFX1NISUZU
LCBOVUxMKTsKIAl9IGVsc2UgewogCQlhcmNoX3JlbW92ZV9tZW1vcnkobmlkLCBhbGlnbl9zdGFy
dCwgYWxpZ25fc2l6ZSwKLQkJCQlwZ21hcC0+YWx0bWFwX3ZhbGlkID8gJnBnbWFwLT5hbHRtYXAg
OiBOVUxMKTsKKwkJCQlwZ21hcF9hbHRtYXAocGdtYXApKTsKIAkJa2FzYW5fcmVtb3ZlX3plcm9f
c2hhZG93KF9fdmEoYWxpZ25fc3RhcnQpLCBhbGlnbl9zaXplKTsKIAl9CiAJbWVtX2hvdHBsdWdf
ZG9uZSgpOwpAQCAtMTI5LDggKzEyMyw4IEBAIHN0YXRpYyB2b2lkIGRldm1fbWVtcmVtYXBfcGFn
ZXNfcmVsZWFzZSh2b2lkICpkYXRhKQogICogMS8gQXQgYSBtaW5pbXVtIHRoZSByZXMsIHJlZiBh
bmQgdHlwZSBhbmQgb3BzIG1lbWJlcnMgb2YgQHBnbWFwIG11c3QgYmUKICAqICAgIGluaXRpYWxp
emVkIGJ5IHRoZSBjYWxsZXIgYmVmb3JlIHBhc3NpbmcgaXQgdG8gdGhpcyBmdW5jdGlvbgogICoK
LSAqIDIvIFRoZSBhbHRtYXAgZmllbGQgbWF5IG9wdGlvbmFsbHkgYmUgaW5pdGlhbGl6ZWQsIGlu
IHdoaWNoIGNhc2UgYWx0bWFwX3ZhbGlkCi0gKiAgICBtdXN0IGJlIHNldCB0byB0cnVlCisgKiAy
LyBUaGUgYWx0bWFwIGZpZWxkIG1heSBvcHRpb25hbGx5IGJlIGluaXRpYWxpemVkLCBpbiB3aGlj
aCBjYXNlCisgKiAgICBQR01BUF9BTFRNQVBfVkFMSUQgbXVzdCBiZSBzZXQgaW4gcGdtYXAtPmZs
YWdzLgogICoKICAqIDMvIHBnbWFwLT5yZWYgbXVzdCBiZSAnbGl2ZScgb24gZW50cnkgYW5kIHdp
bGwgYmUga2lsbGVkIGFuZCByZWFwZWQKICAqICAgIGF0IGRldm1fbWVtcmVtYXBfcGFnZXNfcmVs
ZWFzZSgpIHRpbWUsIG9yIGlmIHRoaXMgcm91dGluZSBmYWlscy4KQEAgLTE0MiwxNSArMTM2LDEz
IEBAIHN0YXRpYyB2b2lkIGRldm1fbWVtcmVtYXBfcGFnZXNfcmVsZWFzZSh2b2lkICpkYXRhKQog
dm9pZCAqZGV2bV9tZW1yZW1hcF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZf
cGFnZW1hcCAqcGdtYXApCiB7CiAJcmVzb3VyY2Vfc2l6ZV90IGFsaWduX3N0YXJ0LCBhbGlnbl9z
aXplLCBhbGlnbl9lbmQ7Ci0Jc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAgPSBwZ21hcC0+YWx0
bWFwX3ZhbGlkID8KLQkJCSZwZ21hcC0+YWx0bWFwIDogTlVMTDsKIAlzdHJ1Y3QgcmVzb3VyY2Ug
KnJlcyA9ICZwZ21hcC0+cmVzOwogCXN0cnVjdCBkZXZfcGFnZW1hcCAqY29uZmxpY3RfcGdtYXA7
CiAJc3RydWN0IG1ocF9yZXN0cmljdGlvbnMgcmVzdHJpY3Rpb25zID0gewogCQkvKgogCQkgKiBX
ZSBkbyBub3Qgd2FudCBhbnkgb3B0aW9uYWwgZmVhdHVyZXMgb25seSBvdXIgb3duIG1lbW1hcAog
CQkqLwotCQkuYWx0bWFwID0gYWx0bWFwLAorCQkuYWx0bWFwID0gcGdtYXBfYWx0bWFwKHBnbWFw
KSwKIAl9OwogCXBncHJvdF90IHBncHJvdCA9IFBBR0VfS0VSTkVMOwogCWludCBlcnJvciwgbmlk
LCBpc19yYW07CkBAIC0yNzQsNyArMjY2LDcgQEAgdm9pZCAqZGV2bV9tZW1yZW1hcF9wYWdlcyhz
dHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCiAKIAkJem9uZSA9
ICZOT0RFX0RBVEEobmlkKS0+bm9kZV96b25lc1taT05FX0RFVklDRV07CiAJCW1vdmVfcGZuX3Jh
bmdlX3RvX3pvbmUoem9uZSwgYWxpZ25fc3RhcnQgPj4gUEFHRV9TSElGVCwKLQkJCQlhbGlnbl9z
aXplID4+IFBBR0VfU0hJRlQsIGFsdG1hcCk7CisJCQkJYWxpZ25fc2l6ZSA+PiBQQUdFX1NISUZU
LCBwZ21hcF9hbHRtYXAocGdtYXApKTsKIAl9CiAKIAltZW1faG90cGx1Z19kb25lKCk7CkBAIC0z
MTksNyArMzExLDkgQEAgRVhQT1JUX1NZTUJPTF9HUEwoZGV2bV9tZW11bm1hcF9wYWdlcyk7CiB1
bnNpZ25lZCBsb25nIHZtZW1fYWx0bWFwX29mZnNldChzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1h
cCkKIHsKIAkvKiBudW1iZXIgb2YgcGZucyBmcm9tIGJhc2Ugd2hlcmUgcGZuX3RvX3BhZ2UoKSBp
cyB2YWxpZCAqLwotCXJldHVybiBhbHRtYXAtPnJlc2VydmUgKyBhbHRtYXAtPmZyZWU7CisJaWYg
KGFsdG1hcCkKKwkJcmV0dXJuIGFsdG1hcC0+cmVzZXJ2ZSArIGFsdG1hcC0+ZnJlZTsKKwlyZXR1
cm4gMDsKIH0KIAogdm9pZCB2bWVtX2FsdG1hcF9mcmVlKHN0cnVjdCB2bWVtX2FsdG1hcCAqYWx0
bWFwLCB1bnNpZ25lZCBsb25nIG5yX3BmbnMpCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2ht
bS5jCmluZGV4IDM2ZTI1Y2RiZGFjMS4uZTQ0NzA0NjIyOThmIDEwMDY0NAotLS0gYS9tbS9obW0u
YworKysgYi9tbS9obW0uYwpAQCAtMTQ0Miw3ICsxNDQyLDYgQEAgc3RydWN0IGhtbV9kZXZtZW0g
KmhtbV9kZXZtZW1fYWRkKGNvbnN0IHN0cnVjdCBobW1fZGV2bWVtX29wcyAqb3BzLAogCWRldm1l
bS0+cGFnZW1hcC50eXBlID0gTUVNT1JZX0RFVklDRV9QUklWQVRFOwogCWRldm1lbS0+cGFnZW1h
cC5yZXMgPSAqZGV2bWVtLT5yZXNvdXJjZTsKIAlkZXZtZW0tPnBhZ2VtYXAub3BzID0gJmhtbV9w
YWdlbWFwX29wczsKLQlkZXZtZW0tPnBhZ2VtYXAuYWx0bWFwX3ZhbGlkID0gZmFsc2U7CiAJZGV2
bWVtLT5wYWdlbWFwLnJlZiA9ICZkZXZtZW0tPnJlZjsKIAogCXJlc3VsdCA9IGRldm1fbWVtcmVt
YXBfcGFnZXMoZGV2bWVtLT5kZXZpY2UsICZkZXZtZW0tPnBhZ2VtYXApOwpkaWZmIC0tZ2l0IGEv
bW0vbWVtb3J5X2hvdHBsdWcuYyBiL21tL21lbW9yeV9ob3RwbHVnLmMKaW5kZXggZTA5NmM5ODdk
MjYxLi42MTY2YmE1YTE1ZjMgMTAwNjQ0Ci0tLSBhL21tL21lbW9yeV9ob3RwbHVnLmMKKysrIGIv
bW0vbWVtb3J5X2hvdHBsdWcuYwpAQCAtNTU3LDEwICs1NTcsOCBAQCB2b2lkIF9fcmVtb3ZlX3Bh
Z2VzKHN0cnVjdCB6b25lICp6b25lLCB1bnNpZ25lZCBsb25nIHBoeXNfc3RhcnRfcGZuLAogCWlu
dCBzZWN0aW9uc190b19yZW1vdmU7CiAKIAkvKiBJbiB0aGUgWk9ORV9ERVZJQ0UgY2FzZSBkZXZp
Y2UgZHJpdmVyIG93bnMgdGhlIG1lbW9yeSByZWdpb24gKi8KLQlpZiAoaXNfZGV2X3pvbmUoem9u
ZSkpIHsKLQkJaWYgKGFsdG1hcCkKLQkJCW1hcF9vZmZzZXQgPSB2bWVtX2FsdG1hcF9vZmZzZXQo
YWx0bWFwKTsKLQl9CisJaWYgKGlzX2Rldl96b25lKHpvbmUpKQorCQltYXBfb2Zmc2V0ID0gdm1l
bV9hbHRtYXBfb2Zmc2V0KGFsdG1hcCk7CiAKIAljbGVhcl96b25lX2NvbnRpZ3VvdXMoem9uZSk7
CiAKZGlmZiAtLWdpdCBhL21tL3BhZ2VfYWxsb2MuYyBiL21tL3BhZ2VfYWxsb2MuYwppbmRleCBk
NjZiYzhhYmUwYWYuLjE3YTM5ZDQwYTU1NiAxMDA2NDQKLS0tIGEvbW0vcGFnZV9hbGxvYy5jCisr
KyBiL21tL3BhZ2VfYWxsb2MuYwpAQCAtNTg1Myw2ICs1ODUzLDcgQEAgdm9pZCBfX3JlZiBtZW1t
YXBfaW5pdF96b25lX2RldmljZShzdHJ1Y3Qgem9uZSAqem9uZSwKIHsKIAl1bnNpZ25lZCBsb25n
IHBmbiwgZW5kX3BmbiA9IHN0YXJ0X3BmbiArIHNpemU7CiAJc3RydWN0IHBnbGlzdF9kYXRhICpw
Z2RhdCA9IHpvbmUtPnpvbmVfcGdkYXQ7CisJc3RydWN0IHZtZW1fYWx0bWFwICphbHRtYXAgPSBw
Z21hcF9hbHRtYXAocGdtYXApOwogCXVuc2lnbmVkIGxvbmcgem9uZV9pZHggPSB6b25lX2lkeCh6
b25lKTsKIAl1bnNpZ25lZCBsb25nIHN0YXJ0ID0gamlmZmllczsKIAlpbnQgbmlkID0gcGdkYXQt
Pm5vZGVfaWQ7CkBAIC01ODY1LDkgKzU4NjYsNyBAQCB2b2lkIF9fcmVmIG1lbW1hcF9pbml0X3pv
bmVfZGV2aWNlKHN0cnVjdCB6b25lICp6b25lLAogCSAqIG9mIHRoZSBwYWdlcyByZXNlcnZlZCBm
b3IgdGhlIG1lbW1hcCwgc28gd2UgY2FuIGp1c3QganVtcCB0bwogCSAqIHRoZSBlbmQgb2YgdGhh
dCByZWdpb24gYW5kIHN0YXJ0IHByb2Nlc3NpbmcgdGhlIGRldmljZSBwYWdlcy4KIAkgKi8KLQlp
ZiAocGdtYXAtPmFsdG1hcF92YWxpZCkgewotCQlzdHJ1Y3Qgdm1lbV9hbHRtYXAgKmFsdG1hcCA9
ICZwZ21hcC0+YWx0bWFwOwotCisJaWYgKGFsdG1hcCkgewogCQlzdGFydF9wZm4gPSBhbHRtYXAt
PmJhc2VfcGZuICsgdm1lbV9hbHRtYXBfb2Zmc2V0KGFsdG1hcCk7CiAJCXNpemUgPSBlbmRfcGZu
IC0gc3RhcnRfcGZuOwogCX0KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
