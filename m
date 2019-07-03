Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E71015EEEA
	for <lists+nouveau@lfdr.de>; Thu,  4 Jul 2019 00:02:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28DED6E20A;
	Wed,  3 Jul 2019 22:02:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CE7F86E207;
 Wed,  3 Jul 2019 22:02:19 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hinKS-0004EV-0U; Wed, 03 Jul 2019 22:02:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 15:02:10 -0700
Message-Id: <20190703220214.28319-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
References: <20190703220214.28319-1-hch@lst.de>
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
 bh=/hemVxgPEOdbiVtqmrJ7Pu3HACPpqgUeF/rrQJ8zMho=; b=Kkz67VFiEYQBRKNbXzQ6Ojm7Ri
 OcwpoDV/CsFrwaqGuhBbSPNg3mkKTGK3IBm4+RL/EUwlT0NR3dRRgi/wPRUKHT9sxRXcnmpRyRMwf
 m6MHJce1FU7Shn767N08Sk0B9F/mSAOHWhU6/7GIcuZm/DWc1kgge97CFqvxLueX1nexjJfh2RFvu
 Gs6UiDeiyfwXE/5jyQ+mVDkX0Cgeidpr53Uwx7wASNMlwTwo61RQBiZYib9OefWnsuFa4yw4ZR+dS
 jGCf81A/6pWNFN7na5WjJOH3ajeY3WvYZLe26FCPeDdEc0pyG2G39NSjTPRsO5OI7H1G9xOMn0fIR
 3b9pwbVA==;
Subject: [Nouveau] [PATCH 2/6] mm: move hmm_vma_range_done and hmm_vma_fault
 to nouveau
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
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlc2UgdHdvIGZ1bmN0aW9ucyBhcmUgbWFya2VkIGFzIGEgbGVnYWN5IEFQSXMgdG8gZ2V0IHJp
ZCBvZiwgYnV0IHNlZW0KdG8gc3VpdCB0aGUgY3VycmVudCBub3V2ZWF1IGZsb3cuICBNb3ZlIGl0
IHRvIHRoZSBvbmx5IHVzZXIgaW4KcHJlcGFyYXRpb24gZm9yIGZpeGluZyBhIGxvY2tpbmcgYnVn
IGludm9sdmluZyBjYWxsZXIgYW5kIGNhbGxlZS4KQWxsIGNvbW1lbnRzIHJlZmVycmluZyB0byB0
aGUgb2xkIEFQSSBoYXZlIGJlZW4gcmVtb3ZlZCBhcyB0aGlzIG5vdwppcyBhIGRyaXZlciBwcml2
YXRlIGhlbHBlci4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgfCA1MiArKysrKysr
KysrKysrKysrKysrKystCiBpbmNsdWRlL2xpbnV4L2htbS5oICAgICAgICAgICAgICAgICAgIHwg
NjMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDUwIGluc2Vy
dGlvbnMoKyksIDY1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2
bS5jCmluZGV4IDhjOTIzNzRhZmNmMi4uMDMzYTkyNDFhMTRhIDEwMDY0NAotLS0gYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfc3ZtLmMKQEAgLTM2LDYgKzM2LDEzIEBACiAjaW5jbHVkZSA8bGludXgvc29y
dC5oPgogI2luY2x1ZGUgPGxpbnV4L2htbS5oPgogCisvKgorICogV2hlbiB3YWl0aW5nIGZvciBt
bXUgbm90aWZpZXJzIHdlIG5lZWQgc29tZSBraW5kIG9mIHRpbWUgb3V0IG90aGVyd2lzZSB3ZQor
ICogY291bGQgcG90ZW50aWFseSB3YWl0IGZvciBldmVyLCAxMDAwbXMgaWUgMXMgc291bmRzIGxp
a2UgYSBsb25nIHRpbWUgdG8KKyAqIHdhaXQgYWxyZWFkeS4KKyAqLworI2RlZmluZSBOT1VWRUFV
X1JBTkdFX0ZBVUxUX1RJTUVPVVQgMTAwMAorCiBzdHJ1Y3Qgbm91dmVhdV9zdm0gewogCXN0cnVj
dCBub3V2ZWF1X2RybSAqZHJtOwogCXN0cnVjdCBtdXRleCBtdXRleDsKQEAgLTQ3NSw2ICs0ODIs
NDcgQEAgbm91dmVhdV9zdm1fZmF1bHRfY2FjaGUoc3RydWN0IG5vdXZlYXVfc3ZtICpzdm0sCiAJ
CWZhdWx0LT5pbnN0LCBmYXVsdC0+YWRkciwgZmF1bHQtPmFjY2Vzcyk7CiB9CiAKK3N0YXRpYyBp
bmxpbmUgYm9vbCBub3V2ZWF1X3JhbmdlX2RvbmUoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCit7
CisJYm9vbCByZXQgPSBobW1fcmFuZ2VfdmFsaWQocmFuZ2UpOworCisJaG1tX3JhbmdlX3VucmVn
aXN0ZXIocmFuZ2UpOworCXJldHVybiByZXQ7Cit9CisKK3N0YXRpYyBpbnQKK25vdXZlYXVfcmFu
Z2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFu
Z2UsCisJCSAgICBib29sIGJsb2NrKQoreworCWxvbmcgcmV0OworCisJcmFuZ2UtPmRlZmF1bHRf
ZmxhZ3MgPSAwOworCXJhbmdlLT5wZm5fZmxhZ3NfbWFzayA9IC0xVUw7CisKKwlyZXQgPSBobW1f
cmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwKKwkJCQkgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+
ZW5kLAorCQkJCSBQQUdFX1NISUZUKTsKKwlpZiAocmV0KQorCQlyZXR1cm4gKGludClyZXQ7CisK
KwlpZiAoIWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBOT1VWRUFVX1JBTkdFX0ZB
VUxUX1RJTUVPVVQpKSB7CisJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7
CisJCXJldHVybiAtRUFHQUlOOworCX0KKworCXJldCA9IGhtbV9yYW5nZV9mYXVsdChyYW5nZSwg
YmxvY2spOworCWlmIChyZXQgPD0gMCkgeworCQlpZiAocmV0ID09IC1FQlVTWSB8fCAhcmV0KSB7
CisJCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOworCQkJcmV0ID0gLUVC
VVNZOworCQl9IGVsc2UgaWYgKHJldCA9PSAtRUFHQUlOKQorCQkJcmV0ID0gLUVCVVNZOworCQlo
bW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7CisJCXJldHVybiByZXQ7CisJfQorCXJldHVybiAw
OworfQorCiBzdGF0aWMgaW50CiBub3V2ZWF1X3N2bV9mYXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkg
Km5vdGlmeSkKIHsKQEAgLTY0OSwxMCArNjk3LDEwIEBAIG5vdXZlYXVfc3ZtX2ZhdWx0KHN0cnVj
dCBudmlmX25vdGlmeSAqbm90aWZ5KQogCQlyYW5nZS52YWx1ZXMgPSBub3V2ZWF1X3N2bV9wZm5f
dmFsdWVzOwogCQlyYW5nZS5wZm5fc2hpZnQgPSBOVklGX1ZNTV9QRk5NQVBfVjBfQUREUl9TSElG
VDsKIGFnYWluOgotCQlyZXQgPSBobW1fdm1hX2ZhdWx0KCZzdm1tLT5taXJyb3IsICZyYW5nZSwg
dHJ1ZSk7CisJCXJldCA9IG5vdXZlYXVfcmFuZ2VfZmF1bHQoJnN2bW0tPm1pcnJvciwgJnJhbmdl
LCB0cnVlKTsKIAkJaWYgKHJldCA9PSAwKSB7CiAJCQltdXRleF9sb2NrKCZzdm1tLT5tdXRleCk7
Ci0JCQlpZiAoIWhtbV92bWFfcmFuZ2VfZG9uZSgmcmFuZ2UpKSB7CisJCQlpZiAoIW5vdXZlYXVf
cmFuZ2VfZG9uZSgmcmFuZ2UpKSB7CiAJCQkJbXV0ZXhfdW5sb2NrKCZzdm1tLT5tdXRleCk7CiAJ
CQkJZ290byBhZ2FpbjsKIAkJCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9p
bmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IGI4YTA4YjJhMTBjYS4uZmE0M2E5ZjUzODMzIDEwMDY0
NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAg
LTQ3NSw2OSArNDc1LDYgQEAgbG9uZyBobW1fcmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlLAogCQkJIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJCSBib29sIGRpcnR5KTsKIAot
LyoKLSAqIEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQgLSBkZWZhdWx0IHRpbWVvdXQgKG1zKSB3
aGVuIHdhaXRpbmcgZm9yIGEgcmFuZ2UKLSAqCi0gKiBXaGVuIHdhaXRpbmcgZm9yIG1tdSBub3Rp
ZmllcnMgd2UgbmVlZCBzb21lIGtpbmQgb2YgdGltZSBvdXQgb3RoZXJ3aXNlIHdlCi0gKiBjb3Vs
ZCBwb3RlbnRpYWx5IHdhaXQgZm9yIGV2ZXIsIDEwMDBtcyBpZSAxcyBzb3VuZHMgbGlrZSBhIGxv
bmcgdGltZSB0bwotICogd2FpdCBhbHJlYWR5LgotICovCi0jZGVmaW5lIEhNTV9SQU5HRV9ERUZB
VUxUX1RJTUVPVVQgMTAwMAotCi0vKiBUaGlzIGlzIGEgdGVtcG9yYXJ5IGhlbHBlciB0byBhdm9p
ZCBtZXJnZSBjb25mbGljdCBiZXR3ZWVuIHRyZWVzLiAqLwotc3RhdGljIGlubGluZSBib29sIGht
bV92bWFfcmFuZ2VfZG9uZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKLXsKLQlib29sIHJldCA9
IGhtbV9yYW5nZV92YWxpZChyYW5nZSk7Ci0KLQlobW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7
Ci0JcmV0dXJuIHJldDsKLX0KLQotLyogVGhpcyBpcyBhIHRlbXBvcmFyeSBoZWxwZXIgdG8gYXZv
aWQgbWVyZ2UgY29uZmxpY3QgYmV0d2VlbiB0cmVlcy4gKi8KLXN0YXRpYyBpbmxpbmUgaW50IGht
bV92bWFfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwKLQkJCQlzdHJ1Y3QgaG1tX3Jh
bmdlICpyYW5nZSwgYm9vbCBibG9jaykKLXsKLQlsb25nIHJldDsKLQotCS8qCi0JICogV2l0aCB0
aGUgb2xkIEFQSSB0aGUgZHJpdmVyIG11c3Qgc2V0IGVhY2ggaW5kaXZpZHVhbCBlbnRyaWVzIHdp
dGgKLQkgKiB0aGUgcmVxdWVzdGVkIGZsYWdzICh2YWxpZCwgd3JpdGUsIC4uLikuIFNvIGhlcmUg
d2Ugc2V0IHRoZSBtYXNrIHRvCi0JICoga2VlcCBpbnRhY3QgdGhlIGVudHJpZXMgcHJvdmlkZWQg
YnkgdGhlIGRyaXZlciBhbmQgemVybyBvdXQgdGhlCi0JICogZGVmYXVsdF9mbGFncy4KLQkgKi8K
LQlyYW5nZS0+ZGVmYXVsdF9mbGFncyA9IDA7Ci0JcmFuZ2UtPnBmbl9mbGFnc19tYXNrID0gLTFV
TDsKLQotCXJldCA9IGhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLAotCQkJCSByYW5n
ZS0+c3RhcnQsIHJhbmdlLT5lbmQsCi0JCQkJIFBBR0VfU0hJRlQpOwotCWlmIChyZXQpCi0JCXJl
dHVybiAoaW50KXJldDsKLQotCWlmICghaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2Us
IEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQpKSB7Ci0JCS8qCi0JCSAqIFRoZSBtbWFwX3NlbSB3
YXMgdGFrZW4gYnkgZHJpdmVyIHdlIHJlbGVhc2UgaXQgaGVyZSBhbmQKLQkJICogcmV0dXJucyAt
RUFHQUlOIHdoaWNoIGNvcnJlc3BvbmQgdG8gbW1hcF9zZW0gaGF2ZSBiZWVuCi0JCSAqIGRyb3Ag
aW4gdGhlIG9sZCBBUEkuCi0JCSAqLwotCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1h
cF9zZW0pOwotCQlyZXR1cm4gLUVBR0FJTjsKLQl9Ci0KLQlyZXQgPSBobW1fcmFuZ2VfZmF1bHQo
cmFuZ2UsIGJsb2NrKTsKLQlpZiAocmV0IDw9IDApIHsKLQkJaWYgKHJldCA9PSAtRUJVU1kgfHwg
IXJldCkgewotCQkJLyogU2FtZSBhcyBhYm92ZSwgZHJvcCBtbWFwX3NlbSB0byBtYXRjaCBvbGQg
QVBJLiAqLwotCQkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsKLQkJCXJl
dCA9IC1FQlVTWTsKLQkJfSBlbHNlIGlmIChyZXQgPT0gLUVBR0FJTikKLQkJCXJldCA9IC1FQlVT
WTsKLQkJaG1tX3JhbmdlX3VucmVnaXN0ZXIocmFuZ2UpOwotCQlyZXR1cm4gcmV0OwotCX0KLQly
ZXR1cm4gMDsKLX0KLQogLyogQmVsb3cgYXJlIGZvciBITU0gaW50ZXJuYWwgdXNlIG9ubHkhIE5v
dCB0byBiZSB1c2VkIGJ5IGRldmljZSBkcml2ZXIhICovCiBzdGF0aWMgaW5saW5lIHZvaWQgaG1t
X21tX2luaXQoc3RydWN0IG1tX3N0cnVjdCAqbW0pCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
