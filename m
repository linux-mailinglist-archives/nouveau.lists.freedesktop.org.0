Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D88C7434D1
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54B7889857;
	Thu, 13 Jun 2019 09:44:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BBF389864;
 Thu, 13 Jun 2019 09:43:58 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMGx-0001p4-2R; Thu, 13 Jun 2019 09:43:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:12 +0200
Message-Id: <20190613094326.24093-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613094326.24093-1-hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
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
 bh=1BqK80fO4qP585H34EdwQbL6ViSgwKQddKyugyKso9Y=; b=TEMANqisnK+/nbUc3UXMfUjlI6
 Buayg3mmtOYuYeLGF0JU6+u1jMgokjY3LfM+Kk8hDa7h7fnT1VyFEP0nPB1RNUZWOVQuN3ovu93rh
 jsl9IqdSDGLWp38ra6Me2Ka5kg8BmNg4Hm/aJRiVyXtzEZPdEGsc+oaWriNBq2Pgyc+yY6y+JVwz9
 hiWaWe9czGHjymFZztKABfoCjLkCdLjhKUHvyX+YjY5iFnm8H2PyqDyfQKfS4QNRaaBGWJ6kpu+eC
 B8kr6+ivmbMx2Ql/Nf6Ttz9lfxd/+jK9BugmMtX7lveZKR7VOZd55VwgHmrGIg3nIz2pCIVHSQPaS
 k+QbBHsQ==;
Subject: [Nouveau] [PATCH 09/22] memremap: lift the devmap_enable
 manipulation into devm_memremap_pages
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

SnVzdCBjaGVjayBpZiB0aGVyZSBpcyBhIC0+cGFnZV9mcmVlIG9wZXJhdGlvbiBzZXQgYW5kIHRh
a2UgY2FyZSBvZiB0aGUKc3RhdGljIGtleSBlbmFibGUsIGFzIHdlbGwgYXMgdGhlIHB1dCB1c2lu
ZyBkZXZpY2UgbWFuYWdlZCByZXNvdXJjZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL252ZGltbS9wbWVtLmMgfCAyMyArKystLS0t
LS0tLS0tLS0tLQogaW5jbHVkZS9saW51eC9tbS5oICAgIHwgMTAgLS0tLS0tLS0KIGtlcm5lbC9t
ZW1yZW1hcC5jICAgICB8IDU5ICsrKysrKysrKysrKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0t
LS0tLS0KIG1tL2htbS5jICAgICAgICAgICAgICB8ICAyIC0tCiA0IGZpbGVzIGNoYW5nZWQsIDQx
IGluc2VydGlvbnMoKyksIDUzIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZk
aW1tL3BtZW0uYyBiL2RyaXZlcnMvbnZkaW1tL3BtZW0uYwppbmRleCBiOTYzOGM2NTUzYTEuLjY2
ODM3ZWVkNjM3NSAxMDA2NDQKLS0tIGEvZHJpdmVycy9udmRpbW0vcG1lbS5jCisrKyBiL2RyaXZl
cnMvbnZkaW1tL3BtZW0uYwpAQCAtMzM0LDExICszMzQsNiBAQCBzdGF0aWMgdm9pZCBwbWVtX3Jl
bGVhc2VfZGlzayh2b2lkICpfX3BtZW0pCiAJcHV0X2Rpc2socG1lbS0+ZGlzayk7CiB9CiAKLXN0
YXRpYyB2b2lkIHBtZW1fcmVsZWFzZV9wZ21hcF9vcHModm9pZCAqX19wZ21hcCkKLXsKLQlkZXZf
cGFnZW1hcF9wdXRfb3BzKCk7Ci19Ci0KIHN0YXRpYyB2b2lkIHBtZW1fZnNkYXhfcGFnZV9mcmVl
KHN0cnVjdCBwYWdlICpwYWdlLCB2b2lkICpkYXRhKQogewogCXdha2VfdXBfdmFyKCZwYWdlLT5f
cmVmY291bnQpOwpAQCAtMzUzLDE2ICszNDgsNiBAQCBzdGF0aWMgY29uc3Qgc3RydWN0IGRldl9w
YWdlbWFwX29wcyBwbWVtX2xlZ2FjeV9wYWdlbWFwX29wcyA9IHsKIAkua2lsbAkJCT0gcG1lbV9r
aWxsLAogfTsKIAotc3RhdGljIGludCBzZXR1cF9wYWdlbWFwX2ZzZGF4KHN0cnVjdCBkZXZpY2Ug
KmRldiwgc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCkKLXsKLQlkZXZfcGFnZW1hcF9nZXRfb3Bz
KCk7Ci0JaWYgKGRldm1fYWRkX2FjdGlvbl9vcl9yZXNldChkZXYsIHBtZW1fcmVsZWFzZV9wZ21h
cF9vcHMsIHBnbWFwKSkKLQkJcmV0dXJuIC1FTk9NRU07Ci0JcGdtYXAtPnR5cGUgPSBNRU1PUllf
REVWSUNFX0ZTX0RBWDsKLQlwZ21hcC0+b3BzID0gJmZzZGF4X3BhZ2VtYXBfb3BzOwotCXJldHVy
biAwOwotfQotCiBzdGF0aWMgaW50IHBtZW1fYXR0YWNoX2Rpc2soc3RydWN0IGRldmljZSAqZGV2
LAogCQlzdHJ1Y3QgbmRfbmFtZXNwYWNlX2NvbW1vbiAqbmRucykKIHsKQEAgLTQyMSw4ICs0MDYs
OCBAQCBzdGF0aWMgaW50IHBtZW1fYXR0YWNoX2Rpc2soc3RydWN0IGRldmljZSAqZGV2LAogCXBt
ZW0tPnBmbl9mbGFncyA9IFBGTl9ERVY7CiAJcG1lbS0+cGdtYXAucmVmID0gJnEtPnFfdXNhZ2Vf
Y291bnRlcjsKIAlpZiAoaXNfbmRfcGZuKGRldikpIHsKLQkJaWYgKHNldHVwX3BhZ2VtYXBfZnNk
YXgoZGV2LCAmcG1lbS0+cGdtYXApKQotCQkJcmV0dXJuIC1FTk9NRU07CisJCXBtZW0tPnBnbWFw
LnR5cGUgPSBNRU1PUllfREVWSUNFX0ZTX0RBWDsKKwkJcG1lbS0+cGdtYXAub3BzID0gJmZzZGF4
X3BhZ2VtYXBfb3BzOwogCQlhZGRyID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXYsICZwbWVtLT5w
Z21hcCk7CiAJCXBmbl9zYiA9IG5kX3Bmbi0+cGZuX3NiOwogCQlwbWVtLT5kYXRhX29mZnNldCA9
IGxlNjRfdG9fY3B1KHBmbl9zYi0+ZGF0YW9mZik7CkBAIC00MzQsOCArNDE5LDggQEAgc3RhdGlj
IGludCBwbWVtX2F0dGFjaF9kaXNrKHN0cnVjdCBkZXZpY2UgKmRldiwKIAl9IGVsc2UgaWYgKHBt
ZW1fc2hvdWxkX21hcF9wYWdlcyhkZXYpKSB7CiAJCW1lbWNweSgmcG1lbS0+cGdtYXAucmVzLCAm
bnNpby0+cmVzLCBzaXplb2YocG1lbS0+cGdtYXAucmVzKSk7CiAJCXBtZW0tPnBnbWFwLmFsdG1h
cF92YWxpZCA9IGZhbHNlOwotCQlpZiAoc2V0dXBfcGFnZW1hcF9mc2RheChkZXYsICZwbWVtLT5w
Z21hcCkpCi0JCQlyZXR1cm4gLUVOT01FTTsKKwkJcG1lbS0+cGdtYXAudHlwZSA9IE1FTU9SWV9E
RVZJQ0VfRlNfREFYOworCQlwbWVtLT5wZ21hcC5vcHMgPSAmZnNkYXhfcGFnZW1hcF9vcHM7CiAJ
CWFkZHIgPSBkZXZtX21lbXJlbWFwX3BhZ2VzKGRldiwgJnBtZW0tPnBnbWFwKTsKIAkJcG1lbS0+
cGZuX2ZsYWdzIHw9IFBGTl9NQVA7CiAJCW1lbWNweSgmYmJfcmVzLCAmcG1lbS0+cGdtYXAucmVz
LCBzaXplb2YoYmJfcmVzKSk7CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21tLmggYi9pbmNs
dWRlL2xpbnV4L21tLmgKaW5kZXggMGU4ODM0YWMzMmI3Li5lZGNmMmI4MjE2NDcgMTAwNjQ0Ci0t
LSBhL2luY2x1ZGUvbGludXgvbW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L21tLmgKQEAgLTkyMSw4
ICs5MjEsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfem9uZV9kZXZpY2VfcGFnZShjb25zdCBz
dHJ1Y3QgcGFnZSAqcGFnZSkKICNlbmRpZgogCiAjaWZkZWYgQ09ORklHX0RFVl9QQUdFTUFQX09Q
Uwotdm9pZCBkZXZfcGFnZW1hcF9nZXRfb3BzKHZvaWQpOwotdm9pZCBkZXZfcGFnZW1hcF9wdXRf
b3BzKHZvaWQpOwogdm9pZCBfX3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpw
YWdlKTsKIERFQ0xBUkVfU1RBVElDX0tFWV9GQUxTRShkZXZtYXBfbWFuYWdlZF9rZXkpOwogc3Rh
dGljIGlubGluZSBib29sIHB1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdl
KQpAQCAtOTY5LDE0ICs5NjcsNiBAQCBzdGF0aWMgaW5saW5lIGJvb2wgaXNfcGNpX3AycGRtYV9w
YWdlKGNvbnN0IHN0cnVjdCBwYWdlICpwYWdlKQogI2VuZGlmIC8qIENPTkZJR19QQ0lfUDJQRE1B
ICovCiAKICNlbHNlIC8qIENPTkZJR19ERVZfUEFHRU1BUF9PUFMgKi8KLXN0YXRpYyBpbmxpbmUg
dm9pZCBkZXZfcGFnZW1hcF9nZXRfb3BzKHZvaWQpCi17Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdm9p
ZCBkZXZfcGFnZW1hcF9wdXRfb3BzKHZvaWQpCi17Ci19Ci0KIHN0YXRpYyBpbmxpbmUgYm9vbCBw
dXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAlyZXR1cm4gZmFs
c2U7CmRpZmYgLS1naXQgYS9rZXJuZWwvbWVtcmVtYXAuYyBiL2tlcm5lbC9tZW1yZW1hcC5jCmlu
ZGV4IDk0YjgzMGI2ZWNhNS4uNmEzMTgzY2FjNzY0IDEwMDY0NAotLS0gYS9rZXJuZWwvbWVtcmVt
YXAuYworKysgYi9rZXJuZWwvbWVtcmVtYXAuYwpAQCAtMTcsNiArMTcsMzcgQEAgc3RhdGljIERF
RklORV9YQVJSQVkocGdtYXBfYXJyYXkpOwogI2RlZmluZSBTRUNUSU9OX01BU0sgfigoMVVMIDw8
IFBBX1NFQ1RJT05fU0hJRlQpIC0gMSkKICNkZWZpbmUgU0VDVElPTl9TSVpFICgxVUwgPDwgUEFf
U0VDVElPTl9TSElGVCkKIAorI2lmZGVmIENPTkZJR19ERVZfUEFHRU1BUF9PUFMKK0RFRklORV9T
VEFUSUNfS0VZX0ZBTFNFKGRldm1hcF9tYW5hZ2VkX2tleSk7CitFWFBPUlRfU1lNQk9MKGRldm1h
cF9tYW5hZ2VkX2tleSk7CitzdGF0aWMgYXRvbWljX3QgZGV2bWFwX2VuYWJsZTsKKworc3RhdGlj
IHZvaWQgZGV2X3BhZ2VtYXBfcHV0X29wcyh2b2lkICpkYXRhKQoreworCWlmIChhdG9taWNfZGVj
X2FuZF90ZXN0KCZkZXZtYXBfZW5hYmxlKSkKKwkJc3RhdGljX2JyYW5jaF9kaXNhYmxlKCZkZXZt
YXBfbWFuYWdlZF9rZXkpOworfQorCisvKgorICogVG9nZ2xlIHRoZSBzdGF0aWMga2V5IGZvciAt
PnBhZ2VfZnJlZSgpIGNhbGxiYWNrcyB3aGVuIGRldl9wYWdlbWFwCisgKiBwYWdlcyBnbyBpZGxl
LgorICovCitzdGF0aWMgaW50IGRldl9wYWdlbWFwX2VuYWJsZShzdHJ1Y3QgZGV2aWNlICpkZXYp
Cit7CisJaWYgKGF0b21pY19pbmNfcmV0dXJuKCZkZXZtYXBfZW5hYmxlKSA9PSAxKQorCQlzdGF0
aWNfYnJhbmNoX2VuYWJsZSgmZGV2bWFwX21hbmFnZWRfa2V5KTsKKworCWlmIChkZXZtX2FkZF9h
Y3Rpb25fb3JfcmVzZXQoZGV2LCBkZXZfcGFnZW1hcF9wdXRfb3BzLCBOVUxMKSkKKwkJcmV0dXJu
IC1FTk9NRU07CisJcmV0dXJuIDA7Cit9CisjZWxzZQorc3RhdGljIGlubGluZSBpbnQgZGV2X3Bh
Z2VtYXBfZW5hYmxlKHN0cnVjdCBkZXZpY2UgKmRldikKK3sKKwlyZXR1cm4gMDsKK30KKyNlbmRp
ZiAvKiBDT05GSUdfREVWX1BBR0VNQVBfT1BTICovCisKICNpZiBJU19FTkFCTEVEKENPTkZJR19E
RVZJQ0VfUFJJVkFURSkKIHZtX2ZhdWx0X3QgZGV2aWNlX3ByaXZhdGVfZW50cnlfZmF1bHQoc3Ry
dWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCSAgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsCkBA
IC0xNTksNiArMTkwLDEyIEBAIHZvaWQgKmRldm1fbWVtcmVtYXBfcGFnZXMoc3RydWN0IGRldmlj
ZSAqZGV2LCBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQogCWlmICghcGdtYXAtPnJlZiB8fCAh
cGdtYXAtPm9wcyB8fCAhcGdtYXAtPm9wcy0+a2lsbCkKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZB
TCk7CiAKKwlpZiAocGdtYXAtPm9wcy0+cGFnZV9mcmVlKSB7CisJCWVycm9yID0gZGV2X3BhZ2Vt
YXBfZW5hYmxlKGRldik7CisJCWlmIChlcnJvcikKKwkJCXJldHVybiBFUlJfUFRSKGVycm9yKTsK
Kwl9CisKIAlhbGlnbl9zdGFydCA9IHJlcy0+c3RhcnQgJiB+KFNFQ1RJT05fU0laRSAtIDEpOwog
CWFsaWduX3NpemUgPSBBTElHTihyZXMtPnN0YXJ0ICsgcmVzb3VyY2Vfc2l6ZShyZXMpLCBTRUNU
SU9OX1NJWkUpCiAJCS0gYWxpZ25fc3RhcnQ7CkBAIC0zMTYsMjggKzM1Myw2IEBAIHN0cnVjdCBk
ZXZfcGFnZW1hcCAqZ2V0X2Rldl9wYWdlbWFwKHVuc2lnbmVkIGxvbmcgcGZuLAogRVhQT1JUX1NZ
TUJPTF9HUEwoZ2V0X2Rldl9wYWdlbWFwKTsKIAogI2lmZGVmIENPTkZJR19ERVZfUEFHRU1BUF9P
UFMKLURFRklORV9TVEFUSUNfS0VZX0ZBTFNFKGRldm1hcF9tYW5hZ2VkX2tleSk7Ci1FWFBPUlRf
U1lNQk9MKGRldm1hcF9tYW5hZ2VkX2tleSk7Ci1zdGF0aWMgYXRvbWljX3QgZGV2bWFwX2VuYWJs
ZTsKLQotLyoKLSAqIFRvZ2dsZSB0aGUgc3RhdGljIGtleSBmb3IgLT5wYWdlX2ZyZWUoKSBjYWxs
YmFja3Mgd2hlbiBkZXZfcGFnZW1hcAotICogcGFnZXMgZ28gaWRsZS4KLSAqLwotdm9pZCBkZXZf
cGFnZW1hcF9nZXRfb3BzKHZvaWQpCi17Ci0JaWYgKGF0b21pY19pbmNfcmV0dXJuKCZkZXZtYXBf
ZW5hYmxlKSA9PSAxKQotCQlzdGF0aWNfYnJhbmNoX2VuYWJsZSgmZGV2bWFwX21hbmFnZWRfa2V5
KTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKGRldl9wYWdlbWFwX2dldF9vcHMpOwotCi12b2lkIGRl
dl9wYWdlbWFwX3B1dF9vcHModm9pZCkKLXsKLQlpZiAoYXRvbWljX2RlY19hbmRfdGVzdCgmZGV2
bWFwX2VuYWJsZSkpCi0JCXN0YXRpY19icmFuY2hfZGlzYWJsZSgmZGV2bWFwX21hbmFnZWRfa2V5
KTsKLX0KLUVYUE9SVF9TWU1CT0xfR1BMKGRldl9wYWdlbWFwX3B1dF9vcHMpOwotCiB2b2lkIF9f
cHV0X2Rldm1hcF9tYW5hZ2VkX3BhZ2Uoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7CiAJaW50IGNvdW50
ID0gcGFnZV9yZWZfZGVjX3JldHVybihwYWdlKTsKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0v
aG1tLmMKaW5kZXggYzc2YTFiNWRlZmRhLi42ZGM3NjlmZWIyZTEgMTAwNjQ0Ci0tLSBhL21tL2ht
bS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzc4LDggKzEzNzgsNiBAQCBzdHJ1Y3QgaG1tX2Rldm1l
bSAqaG1tX2Rldm1lbV9hZGQoY29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3BzICpvcHMsCiAJdm9p
ZCAqcmVzdWx0OwogCWludCByZXQ7CiAKLQlkZXZfcGFnZW1hcF9nZXRfb3BzKCk7Ci0KIAlkZXZt
ZW0gPSBkZXZtX2t6YWxsb2MoZGV2aWNlLCBzaXplb2YoKmRldm1lbSksIEdGUF9LRVJORUwpOwog
CWlmICghZGV2bWVtKQogCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
