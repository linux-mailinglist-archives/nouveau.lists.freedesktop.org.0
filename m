Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD52B48222
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 583C689213;
	Mon, 17 Jun 2019 12:28:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E21BD89219;
 Mon, 17 Jun 2019 12:28:11 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqk4-0000Ep-9f; Mon, 17 Jun 2019 12:28:08 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:22 +0200
Message-Id: <20190617122733.22432-15-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617122733.22432-1-hch@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
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
 bh=GlNxVMm8W4O5v065JMNFU6bkRl3AbEbXSnrBr8peAhc=; b=hceq9aC6tJ73idi0gys5khCNkb
 4oa/Hc09tP2sutmhvsQMCCgbZeQ65RgYiliHtKl5ES7k4PIx5QoJOmP158XuVwgiaDMwakShQWbmE
 2BQA9YBQorrWSgUr5kX4t9vAcPMRIvxeaD7vV44sRG6NUoWodLAfV48Htg6MQ2WO2MAtKlChRMtf5
 wCam1QxlrgXhMZA6F9p2gc2Ek7aGGPTwazLl9Df998k9Zp7cthixwUdhiZdLy/lL4lTfdFLHfTxA4
 MgbRgO934AqctA5SWdhgmmfrTW0+igprb3FsAQeA/tukrmljjK2fU4vyzRWkn67p8G3T2FPFSv6xF
 0pBQDtSw==;
Subject: [Nouveau] [PATCH 14/25] memremap: provide an optional internal
 refcount in struct dev_pagemap
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

UHJvdmlkZSBhbiBpbnRlcm5hbCByZWZjb3VudGluZyBsb2dpYyBpZiBubyAtPnJlZiBmaWVsZCBp
cyBwcm92aWRlZAppbiB0aGUgcGFnZW1hcCBwYXNzZWQgaW50byBkZXZtX21lbXJlbWFwX3BhZ2Vz
IHNvIHRoYXQgY2FsbGVycyBkb24ndApoYXZlIHRvIHJlaW52ZW50IGl0IHBvb3JseS4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGluY2x1ZGUvbGlu
dXgvbWVtcmVtYXAuaCAgICAgICAgICB8ICA0ICsrCiBrZXJuZWwvbWVtcmVtYXAuYyAgICAgICAg
ICAgICAgICAgfCA2NCArKysrKysrKysrKysrKysrKysrKysrKystLS0tLS0tCiB0b29scy90ZXN0
aW5nL252ZGltbS90ZXN0L2lvbWFwLmMgfCAxNyArKysrKystLQogMyBmaWxlcyBjaGFuZ2VkLCA2
OCBpbnNlcnRpb25zKCspLCAxNyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xp
bnV4L21lbXJlbWFwLmggYi9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKaW5kZXggNzI4OWViMDkx
YjA0Li43ZTBmMDcyZGRjZTcgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaAor
KysgYi9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKQEAgLTk1LDYgKzk1LDggQEAgc3RydWN0IGRl
dl9wYWdlbWFwX29wcyB7CiAgKiBAYWx0bWFwOiBwcmUtYWxsb2NhdGVkL3Jlc2VydmVkIG1lbW9y
eSBmb3Igdm1lbW1hcCBhbGxvY2F0aW9ucwogICogQHJlczogcGh5c2ljYWwgYWRkcmVzcyByYW5n
ZSBjb3ZlcmVkIGJ5IEByZWYKICAqIEByZWY6IHJlZmVyZW5jZSBjb3VudCB0aGF0IHBpbnMgdGhl
IGRldm1fbWVtcmVtYXBfcGFnZXMoKSBtYXBwaW5nCisgKiBAaW50ZXJuYWxfcmVmOiBpbnRlcm5h
bCByZWZlcmVuY2UgaWYgQHJlZiBpcyBub3QgcHJvdmlkZWQgYnkgdGhlIGNhbGxlcgorICogQGRv
bmU6IGNvbXBsZXRpb24gZm9yIEBpbnRlcm5hbF9yZWYKICAqIEBkZXY6IGhvc3QgZGV2aWNlIG9m
IHRoZSBtYXBwaW5nIGZvciBkZWJ1ZwogICogQGRhdGE6IHByaXZhdGUgZGF0YSBwb2ludGVyIGZv
ciBwYWdlX2ZyZWUoKQogICogQHR5cGU6IG1lbW9yeSB0eXBlOiBzZWUgTUVNT1JZXyogaW4gbWVt
b3J5X2hvdHBsdWcuaApAQCAtMTA1LDYgKzEwNyw4IEBAIHN0cnVjdCBkZXZfcGFnZW1hcCB7CiAJ
c3RydWN0IHZtZW1fYWx0bWFwIGFsdG1hcDsKIAlzdHJ1Y3QgcmVzb3VyY2UgcmVzOwogCXN0cnVj
dCBwZXJjcHVfcmVmICpyZWY7CisJc3RydWN0IHBlcmNwdV9yZWYgaW50ZXJuYWxfcmVmOworCXN0
cnVjdCBjb21wbGV0aW9uIGRvbmU7CiAJc3RydWN0IGRldmljZSAqZGV2OwogCWVudW0gbWVtb3J5
X3R5cGUgdHlwZTsKIAl1bnNpZ25lZCBpbnQgZmxhZ3M7CmRpZmYgLS1naXQgYS9rZXJuZWwvbWVt
cmVtYXAuYyBiL2tlcm5lbC9tZW1yZW1hcC5jCmluZGV4IGI0MWQ5OGE2NGViZi4uNjA2OTNhMWU4
ZTkyIDEwMDY0NAotLS0gYS9rZXJuZWwvbWVtcmVtYXAuYworKysgYi9rZXJuZWwvbWVtcmVtYXAu
YwpAQCAtMjksNyArMjksNyBAQCBzdGF0aWMgdm9pZCBkZXZfcGFnZW1hcF9wdXRfb3BzKHZvaWQg
KmRhdGEpCiAKIHN0YXRpYyBpbnQgZGV2X3BhZ2VtYXBfZ2V0X29wcyhzdHJ1Y3QgZGV2aWNlICpk
ZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCiB7Ci0JaWYgKCFwZ21hcC0+b3BzLT5wYWdl
X2ZyZWUpIHsKKwlpZiAoIXBnbWFwLT5vcHMgfHwgIXBnbWFwLT5vcHMtPnBhZ2VfZnJlZSkgewog
CQlXQVJOKDEsICJNaXNzaW5nIHBhZ2VfZnJlZSBtZXRob2RcbiIpOwogCQlyZXR1cm4gLUVJTlZB
TDsKIAl9CkBAIC03NSw2ICs3NSwyNCBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBwZm5fbmV4dCh1
bnNpZ25lZCBsb25nIHBmbikKICNkZWZpbmUgZm9yX2VhY2hfZGV2aWNlX3BmbihwZm4sIG1hcCkg
XAogCWZvciAocGZuID0gcGZuX2ZpcnN0KG1hcCk7IHBmbiA8IHBmbl9lbmQobWFwKTsgcGZuID0g
cGZuX25leHQocGZuKSkKIAorc3RhdGljIHZvaWQgZGV2X3BhZ2VtYXBfa2lsbChzdHJ1Y3QgZGV2
X3BhZ2VtYXAgKnBnbWFwKQoreworCWlmIChwZ21hcC0+b3BzICYmIHBnbWFwLT5vcHMtPmtpbGwp
CisJCXBnbWFwLT5vcHMtPmtpbGwocGdtYXApOworCWVsc2UKKwkJcGVyY3B1X3JlZl9raWxsKHBn
bWFwLT5yZWYpOworfQorCitzdGF0aWMgdm9pZCBkZXZfcGFnZW1hcF9jbGVhbnVwKHN0cnVjdCBk
ZXZfcGFnZW1hcCAqcGdtYXApCit7CisJaWYgKHBnbWFwLT5vcHMgJiYgcGdtYXAtPm9wcy0+Y2xl
YW51cCkgeworCQlwZ21hcC0+b3BzLT5jbGVhbnVwKHBnbWFwKTsKKwl9IGVsc2UgeworCQl3YWl0
X2Zvcl9jb21wbGV0aW9uKCZwZ21hcC0+ZG9uZSk7CisJCXBlcmNwdV9yZWZfZXhpdChwZ21hcC0+
cmVmKTsKKwl9Cit9CisKIHN0YXRpYyB2b2lkIGRldm1fbWVtcmVtYXBfcGFnZXNfcmVsZWFzZSh2
b2lkICpkYXRhKQogewogCXN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPSBkYXRhOwpAQCAtODQs
MTAgKzEwMiwxMCBAQCBzdGF0aWMgdm9pZCBkZXZtX21lbXJlbWFwX3BhZ2VzX3JlbGVhc2Uodm9p
ZCAqZGF0YSkKIAl1bnNpZ25lZCBsb25nIHBmbjsKIAlpbnQgbmlkOwogCi0JcGdtYXAtPm9wcy0+
a2lsbChwZ21hcCk7CisJZGV2X3BhZ2VtYXBfa2lsbChwZ21hcCk7CiAJZm9yX2VhY2hfZGV2aWNl
X3BmbihwZm4sIHBnbWFwKQogCQlwdXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKLQlwZ21hcC0+
b3BzLT5jbGVhbnVwKHBnbWFwKTsKKwlkZXZfcGFnZW1hcF9jbGVhbnVwKHBnbWFwKTsKIAogCS8q
IHBhZ2VzIGFyZSBkZWFkIGFuZCB1bnVzZWQsIHVuZG8gdGhlIGFyY2ggbWFwcGluZyAqLwogCWFs
aWduX3N0YXJ0ID0gcmVzLT5zdGFydCAmIH4oU0VDVElPTl9TSVpFIC0gMSk7CkBAIC0xMTQsMjAg
KzEzMiwyOSBAQCBzdGF0aWMgdm9pZCBkZXZtX21lbXJlbWFwX3BhZ2VzX3JlbGVhc2Uodm9pZCAq
ZGF0YSkKIAkJICAgICAgIiVzOiBmYWlsZWQgdG8gZnJlZSBhbGwgcmVzZXJ2ZWQgcGFnZXNcbiIs
IF9fZnVuY19fKTsKIH0KIAorc3RhdGljIHZvaWQgZGV2X3BhZ2VtYXBfcGVyY3B1X3JlbGVhc2Uo
c3RydWN0IHBlcmNwdV9yZWYgKnJlZikKK3sKKwlzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwID0K
KwkJY29udGFpbmVyX29mKHJlZiwgc3RydWN0IGRldl9wYWdlbWFwLCBpbnRlcm5hbF9yZWYpOwor
CisJY29tcGxldGUoJnBnbWFwLT5kb25lKTsKK30KKwogLyoqCiAgKiBkZXZtX21lbXJlbWFwX3Bh
Z2VzIC0gcmVtYXAgYW5kIHByb3ZpZGUgbWVtbWFwIGJhY2tpbmcgZm9yIHRoZSBnaXZlbiByZXNv
dXJjZQogICogQGRldjogaG9zdGluZyBkZXZpY2UgZm9yIEByZXMKICAqIEBwZ21hcDogcG9pbnRl
ciB0byBhIHN0cnVjdCBkZXZfcGFnZW1hcAogICoKICAqIE5vdGVzOgotICogMS8gQXQgYSBtaW5p
bXVtIHRoZSByZXMsIHJlZiBhbmQgdHlwZSBhbmQgb3BzIG1lbWJlcnMgb2YgQHBnbWFwIG11c3Qg
YmUKLSAqICAgIGluaXRpYWxpemVkIGJ5IHRoZSBjYWxsZXIgYmVmb3JlIHBhc3NpbmcgaXQgdG8g
dGhpcyBmdW5jdGlvbgorICogMS8gQXQgYSBtaW5pbXVtIHRoZSByZXMgYW5kIHR5cGUgbWVtYmVy
cyBvZiBAcGdtYXAgbXVzdCBiZSBpbml0aWFsaXplZAorICogICAgYnkgdGhlIGNhbGxlciBiZWZv
cmUgcGFzc2luZyBpdCB0byB0aGlzIGZ1bmN0aW9uCiAgKgogICogMi8gVGhlIGFsdG1hcCBmaWVs
ZCBtYXkgb3B0aW9uYWxseSBiZSBpbml0aWFsaXplZCwgaW4gd2hpY2ggY2FzZQogICogICAgUEdN
QVBfQUxUTUFQX1ZBTElEIG11c3QgYmUgc2V0IGluIHBnbWFwLT5mbGFncy4KICAqCi0gKiAzLyBw
Z21hcC0+cmVmIG11c3QgYmUgJ2xpdmUnIG9uIGVudHJ5IGFuZCB3aWxsIGJlIGtpbGxlZCBhbmQg
cmVhcGVkCi0gKiAgICBhdCBkZXZtX21lbXJlbWFwX3BhZ2VzX3JlbGVhc2UoKSB0aW1lLCBvciBp
ZiB0aGlzIHJvdXRpbmUgZmFpbHMuCisgKiAzLyBUaGUgcmVmIGZpZWxkIG1heSBvcHRpb25hbGx5
IGJlIHByb3ZpZGVkLCBpbiB3aGljaCBwZ21hcC0+cmVmIG11c3QgYmUKKyAqICAgICdsaXZlJyBv
biBlbnRyeSBhbmQgd2lsbCBiZSBraWxsZWQgYW5kIHJlYXBlZCBhdAorICogICAgZGV2bV9tZW1y
ZW1hcF9wYWdlc19yZWxlYXNlKCkgdGltZSwgb3IgaWYgdGhpcyByb3V0aW5lIGZhaWxzLgogICoK
ICAqIDQvIHJlcyBpcyBleHBlY3RlZCB0byBiZSBhIGhvc3QgbWVtb3J5IHJhbmdlIHRoYXQgY291
bGQgZmVhc2libHkgYmUKICAqICAgIHRyZWF0ZWQgYXMgYSAiU3lzdGVtIFJBTSIgcmFuZ2UsIGku
ZS4gbm90IGEgZGV2aWNlIG1taW8gcmFuZ2UsIGJ1dApAQCAtMTc4LDEwICsyMDUsMjEgQEAgdm9p
ZCAqZGV2bV9tZW1yZW1hcF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZfcGFn
ZW1hcCAqcGdtYXApCiAJCWJyZWFrOwogCX0KIAotCWlmICghcGdtYXAtPnJlZiB8fCAhcGdtYXAt
Pm9wcyB8fCAhcGdtYXAtPm9wcy0+a2lsbCB8fAotCSAgICAhcGdtYXAtPm9wcy0+Y2xlYW51cCkg
ewotCQlXQVJOKDEsICJNaXNzaW5nIHJlZmVyZW5jZSBjb3VudCB0ZWFyZG93biBkZWZpbml0aW9u
XG4iKTsKLQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CisJaWYgKCFwZ21hcC0+cmVmKSB7CisJ
CWlmIChwZ21hcC0+b3BzICYmIChwZ21hcC0+b3BzLT5raWxsIHx8IHBnbWFwLT5vcHMtPmNsZWFu
dXApKQorCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CisKKwkJaW5pdF9jb21wbGV0aW9uKCZw
Z21hcC0+ZG9uZSk7CisJCWVycm9yID0gcGVyY3B1X3JlZl9pbml0KCZwZ21hcC0+aW50ZXJuYWxf
cmVmLAorCQkJCWRldl9wYWdlbWFwX3BlcmNwdV9yZWxlYXNlLCAwLCBHRlBfS0VSTkVMKTsKKwkJ
aWYgKGVycm9yKQorCQkJcmV0dXJuIEVSUl9QVFIoZXJyb3IpOworCQlwZ21hcC0+cmVmID0gJnBn
bWFwLT5pbnRlcm5hbF9yZWY7CisJfSBlbHNlIHsKKwkJaWYgKCFwZ21hcC0+b3BzIHx8ICFwZ21h
cC0+b3BzLT5raWxsIHx8ICFwZ21hcC0+b3BzLT5jbGVhbnVwKSB7CisJCQlXQVJOKDEsICJNaXNz
aW5nIHJlZmVyZW5jZSBjb3VudCB0ZWFyZG93biBkZWZpbml0aW9uXG4iKTsKKwkJCXJldHVybiBF
UlJfUFRSKC1FSU5WQUwpOworCQl9CiAJfQogCiAJaWYgKHBnbWFwLT50eXBlICE9IE1FTU9SWV9E
RVZJQ0VfUENJX1AyUERNQSkgewpAQCAtMjk5LDggKzMzNyw4IEBAIHZvaWQgKmRldm1fbWVtcmVt
YXBfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQog
IGVycl9wZm5fcmVtYXA6CiAJcGdtYXBfYXJyYXlfZGVsZXRlKHJlcyk7CiAgZXJyX2FycmF5Ogot
CXBnbWFwLT5vcHMtPmtpbGwocGdtYXApOwotCXBnbWFwLT5vcHMtPmNsZWFudXAocGdtYXApOwor
CWRldl9wYWdlbWFwX2tpbGwocGdtYXApOworCWRldl9wYWdlbWFwX2NsZWFudXAocGdtYXApOwog
CXJldHVybiBFUlJfUFRSKGVycm9yKTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRldm1fbWVtcmVt
YXBfcGFnZXMpOwpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5j
IGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jCmluZGV4IDNhMWZhNzczNWY0Ny4u
OGNkOWI5ODczYTdmIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5nL252ZGltbS90ZXN0L2lvbWFw
LmMKKysrIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jCkBAIC0xMDYsMTAgKzEw
NiwxOSBAQCBFWFBPUlRfU1lNQk9MKF9fd3JhcF9kZXZtX21lbXJlbWFwKTsKIAogc3RhdGljIHZv
aWQgbmZpdF90ZXN0X2tpbGwodm9pZCAqX3BnbWFwKQogewotCVdBUk5fT04oIXBnbWFwIHx8ICFw
Z21hcC0+cmVmIHx8ICFwZ21hcC0+b3BzLT5raWxsIHx8Ci0JCSFwZ21hcC0+b3BzLT5jbGVhbnVw
KTsKLQlwZ21hcC0+b3BzLT5raWxsKHBnbWFwKTsKLQlwZ21hcC0+b3BzLT5jbGVhbnVwKHBnbWFw
KTsKKwlXQVJOX09OKCFwZ21hcCB8fCAhcGdtYXAtPnJlZikKKworCWlmIChwZ21hcC0+b3BzICYm
IHBnbWFwLT5vcHMtPmtpbGwpCisJCXBnbWFwLT5vcHMtPmtpbGwocGdtYXApOworCWVsc2UKKwkJ
cGVyY3B1X3JlZl9raWxsKHBnbWFwLT5yZWYpOworCisJaWYgKHBnbWFwLT5vcHMgJiYgcGdtYXAt
Pm9wcy0+Y2xlYW51cCkgeworCQlwZ21hcC0+b3BzLT5jbGVhbnVwKHBnbWFwKTsKKwl9IGVsc2Ug
eworCQl3YWl0X2Zvcl9jb21wbGV0aW9uKCZwZ21hcC0+ZG9uZSk7CisJCXBlcmNwdV9yZWZfZXhp
dChwZ21hcC0+cmVmKTsKKwl9CiB9CiAKIHZvaWQgKl9fd3JhcF9kZXZtX21lbXJlbWFwX3BhZ2Vz
KHN0cnVjdCBkZXZpY2UgKmRldiwgc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCkKLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
