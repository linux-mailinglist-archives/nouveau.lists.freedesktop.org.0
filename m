Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CC215690F
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:28:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E5F6E40C;
	Wed, 26 Jun 2019 12:28:36 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E15726E408;
 Wed, 26 Jun 2019 12:28:34 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg72M-0001fg-QA; Wed, 26 Jun 2019 12:28:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:23 +0200
Message-Id: <20190626122724.13313-25-hch@lst.de>
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
 bh=8c7Qw79j4iTVfYu8BDZ4XSZccS1fj4ydMQxMOZ0rYRM=; b=qeW+utdJvjdhQsheXW/BJJc+6E
 Je3Qw7KX8yqGRD61b+aMkwDnKhRl79dbPTB2oSJS9EJkkp6B04gH0AKwiMVXmZSWXedEVwmeZuHtd
 rxfolj9Lb0kntloPPle3ysnemn+eVNPk1PVLI65krTeg8f8ixCclNzvQ1VMgjJNdcaSfpbGEE5JqZ
 LdQuIQpaH4WpWeh96t9pFdDMHn8Nlh1iBjfjdCn7Tu5xaSa1u8SC412S343cnc/TFWSgHhCX2D4kz
 T8P1Ggyzn7yKEs00DA9YZRe2O9RSSxL1RnyDktKkewIGQSovonLhKuAUk0FzNPPqOPnS9qC33UPWA
 glFwMabA==;
Subject: [Nouveau] [PATCH 24/25] mm: remove the HMM config option
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

QWxsIHRoZSBtbS9obW0uYyBjb2RlIGlzIGJldHRlciBrZXllZCBvZmYgSE1NX01JUlJPUi4gIEFs
c28gbGV0IG5vdXZlYXUKZGVwZW5kIG9uIGl0IGluc3RlYWQgb2YgdGhlIG1peCBvZiBhIGR1bW15
IGRlcGVuZGVuY3kgc3ltYm9sIHBsdXMgdGhlCmFjdHVhbGx5IHNlbGVjdGVkIG9uZS4gIERyb3Ag
dmFyaW91cyBvZGQgZGVwZW5kZW5jaWVzLCBhcyB0aGUgY29kZSBpcwpwcmV0dHkgcG9ydGFibGUu
CgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIHwgIDMgKy0tCiBpbmNsdWRlL2xpbnV4L2htbS5o
ICAgICAgICAgICAgIHwgIDUgKy0tLS0KIGluY2x1ZGUvbGludXgvbW1fdHlwZXMuaCAgICAgICAg
fCAgMiArLQogbW0vS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICB8IDI3ICsrKystLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLQogbW0vTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICB8ICAyICst
CiBtbS9obW0uYyAgICAgICAgICAgICAgICAgICAgICAgIHwgIDIgLS0KIDYgZmlsZXMgY2hhbmdl
ZCwgOCBpbnNlcnRpb25zKCspLCAzMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZp
ZwppbmRleCA2MzAzZDIwM2FiMWQuLjY2YzgzOWQ4ZTlkMSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvS2NvbmZpZworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29u
ZmlnCkBAIC04NCwxMSArODQsMTAgQEAgY29uZmlnIERSTV9OT1VWRUFVX0JBQ0tMSUdIVAogCiBj
b25maWcgRFJNX05PVVZFQVVfU1ZNCiAJYm9vbCAiKEVYUEVSSU1FTlRBTCkgRW5hYmxlIFNWTSAo
U2hhcmVkIFZpcnR1YWwgTWVtb3J5KSBzdXBwb3J0IgotCWRlcGVuZHMgb24gQVJDSF9IQVNfSE1N
CiAJZGVwZW5kcyBvbiBERVZJQ0VfUFJJVkFURQogCWRlcGVuZHMgb24gRFJNX05PVVZFQVUKKwlk
ZXBlbmRzIG9uIEhNTV9NSVJST1IKIAlkZXBlbmRzIG9uIFNUQUdJTkcKLQlzZWxlY3QgSE1NX01J
UlJPUgogCWRlZmF1bHQgbgogCWhlbHAKIAkgIFNheSBZIGhlcmUgaWYgeW91IHdhbnQgdG8gZW5h
YmxlIGV4cGVyaW1lbnRhbCBzdXBwb3J0IGZvcgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9o
bW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggM2QwMGU5NTUwZTc3Li5iNjk3NDk2ZTg1
YmEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaG1tLmgKKysrIGIvaW5jbHVkZS9saW51eC9o
bW0uaApAQCAtNjIsNyArNjIsNyBAQAogI2luY2x1ZGUgPGxpbnV4L2tjb25maWcuaD4KICNpbmNs
dWRlIDxhc20vcGd0YWJsZS5oPgogCi0jaWYgSVNfRU5BQkxFRChDT05GSUdfSE1NKQorI2lmZGVm
IENPTkZJR19ITU1fTUlSUk9SCiAKICNpbmNsdWRlIDxsaW51eC9kZXZpY2UuaD4KICNpbmNsdWRl
IDxsaW51eC9taWdyYXRlLmg+CkBAIC0zMzIsOSArMzMyLDYgQEAgc3RhdGljIGlubGluZSB1aW50
NjRfdCBobW1fcGZuX2Zyb21fcGZuKGNvbnN0IHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCXJl
dHVybiBobW1fZGV2aWNlX2VudHJ5X2Zyb21fcGZuKHJhbmdlLCBwZm4pOwogfQogCi0KLQotI2lm
IElTX0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1IpCiAvKgogICogTWlycm9yaW5nOiBob3cgdG8g
c3luY2hyb25pemUgZGV2aWNlIHBhZ2UgdGFibGUgd2l0aCBDUFUgcGFnZSB0YWJsZS4KICAqCmRp
ZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmggYi9pbmNsdWRlL2xpbnV4L21tX3R5
cGVzLmgKaW5kZXggZjMzYTEyODljMTAxLi44ZDM3MTgyZjhkYmUgMTAwNjQ0Ci0tLSBhL2luY2x1
ZGUvbGludXgvbW1fdHlwZXMuaAorKysgYi9pbmNsdWRlL2xpbnV4L21tX3R5cGVzLmgKQEAgLTUw
MSw3ICs1MDEsNyBAQCBzdHJ1Y3QgbW1fc3RydWN0IHsKICNlbmRpZgogCQlzdHJ1Y3Qgd29ya19z
dHJ1Y3QgYXN5bmNfcHV0X3dvcms7CiAKLSNpZiBJU19FTkFCTEVEKENPTkZJR19ITU0pCisjaWZk
ZWYgQ09ORklHX0hNTV9NSVJST1IKIAkJLyogSE1NIG5lZWRzIHRvIHRyYWNrIGEgZmV3IHRoaW5n
cyBwZXIgbW0gKi8KIAkJc3RydWN0IGhtbSAqaG1tOwogI2VuZGlmCmRpZmYgLS1naXQgYS9tbS9L
Y29uZmlnIGIvbW0vS2NvbmZpZwppbmRleCBlZWNmMDM3YTU0YjMuLjFlNDI2YzI2YjFkNiAxMDA2
NDQKLS0tIGEvbW0vS2NvbmZpZworKysgYi9tbS9LY29uZmlnCkBAIC02NjksMzcgKzY2OSwxOCBA
QCBjb25maWcgWk9ORV9ERVZJQ0UKIAogCSAgSWYgRlNfREFYIGlzIGVuYWJsZWQsIHRoZW4gc2F5
IFkuCiAKLWNvbmZpZyBBUkNIX0hBU19ITU1fTUlSUk9SCi0JYm9vbAotCWRlZmF1bHQgeQotCWRl
cGVuZHMgb24gKFg4Nl82NCB8fCBQUEM2NCkKLQlkZXBlbmRzIG9uIE1NVSAmJiA2NEJJVAotCi1j
b25maWcgQVJDSF9IQVNfSE1NCi0JYm9vbAotCWRlcGVuZHMgb24gKFg4Nl82NCB8fCBQUEM2NCkK
LQlkZXBlbmRzIG9uIFpPTkVfREVWSUNFCi0JZGVwZW5kcyBvbiBNTVUgJiYgNjRCSVQKLQlkZXBl
bmRzIG9uIE1FTU9SWV9IT1RQTFVHCi0JZGVwZW5kcyBvbiBNRU1PUllfSE9UUkVNT1ZFCi0JZGVw
ZW5kcyBvbiBTUEFSU0VNRU1fVk1FTU1BUAotCWRlZmF1bHQgeQotCiBjb25maWcgTUlHUkFURV9W
TUFfSEVMUEVSCiAJYm9vbAogCiBjb25maWcgREVWX1BBR0VNQVBfT1BTCiAJYm9vbAogCi1jb25m
aWcgSE1NCi0JYm9vbAotCXNlbGVjdCBNTVVfTk9USUZJRVIKLQlzZWxlY3QgTUlHUkFURV9WTUFf
SEVMUEVSCi0KIGNvbmZpZyBITU1fTUlSUk9SCiAJYm9vbCAiSE1NIG1pcnJvciBDUFUgcGFnZSB0
YWJsZSBpbnRvIGEgZGV2aWNlIHBhZ2UgdGFibGUiCi0JZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0K
LQlzZWxlY3QgSE1NCisJZGVwZW5kcyBvbiAoWDg2XzY0IHx8IFBQQzY0KQorCWRlcGVuZHMgb24g
TU1VICYmIDY0QklUCisJc2VsZWN0IE1NVV9OT1RJRklFUgorCXNlbGVjdCBNSUdSQVRFX1ZNQV9I
RUxQRVIKIAloZWxwCiAJICBTZWxlY3QgSE1NX01JUlJPUiBpZiB5b3Ugd2FudCB0byBtaXJyb3Ig
cmFuZ2Ugb2YgdGhlIENQVSBwYWdlIHRhYmxlIG9mIGEKIAkgIHByb2Nlc3MgaW50byBhIGRldmlj
ZSBwYWdlIHRhYmxlLiBIZXJlLCBtaXJyb3IgbWVhbnMgImtlZXAgc3luY2hyb25pemVkIi4KZGlm
ZiAtLWdpdCBhL21tL01ha2VmaWxlIGIvbW0vTWFrZWZpbGUKaW5kZXggYWM1ZTViYTc4ODc0Li45
MWM5OTA0MDA2NWMgMTAwNjQ0Ci0tLSBhL21tL01ha2VmaWxlCisrKyBiL21tL01ha2VmaWxlCkBA
IC0xMDIsNSArMTAyLDUgQEAgb2JqLSQoQ09ORklHX0ZSQU1FX1ZFQ1RPUikgKz0gZnJhbWVfdmVj
dG9yLm8KIG9iai0kKENPTkZJR19ERUJVR19QQUdFX1JFRikgKz0gZGVidWdfcGFnZV9yZWYubwog
b2JqLSQoQ09ORklHX0hBUkRFTkVEX1VTRVJDT1BZKSArPSB1c2VyY29weS5vCiBvYmotJChDT05G
SUdfUEVSQ1BVX1NUQVRTKSArPSBwZXJjcHUtc3RhdHMubwotb2JqLSQoQ09ORklHX0hNTSkgKz0g
aG1tLm8KK29iai0kKENPTkZJR19ITU1fTUlSUk9SKSArPSBobW0ubwogb2JqLSQoQ09ORklHX01F
TUZEX0NSRUFURSkgKz0gbWVtZmQubwpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwpp
bmRleCA5MGNhMGNkYWI5ZGIuLmQ2MmNlNjRkNmJjYSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysr
IGIvbW0vaG1tLmMKQEAgLTI1LDcgKzI1LDYgQEAKICNpbmNsdWRlIDxsaW51eC9tbXVfbm90aWZp
ZXIuaD4KICNpbmNsdWRlIDxsaW51eC9tZW1vcnlfaG90cGx1Zy5oPgogCi0jaWYgSVNfRU5BQkxF
RChDT05GSUdfSE1NX01JUlJPUikKIHN0YXRpYyBjb25zdCBzdHJ1Y3QgbW11X25vdGlmaWVyX29w
cyBobW1fbW11X25vdGlmaWVyX29wczsKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgaG1tICptbV9n
ZXRfaG1tKHN0cnVjdCBtbV9zdHJ1Y3QgKm1tKQpAQCAtMTMyNiw0ICsxMzI1LDMgQEAgbG9uZyBo
bW1fcmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCXJldHVybiBjcGFn
ZXM7CiB9CiBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9kbWFfdW5tYXApOwotI2VuZGlmIC8qIElT
X0VOQUJMRUQoQ09ORklHX0hNTV9NSVJST1IpICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
