Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8883F568E8
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:28:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D23B6E3F0;
	Wed, 26 Jun 2019 12:28:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 21B176E3EE;
 Wed, 26 Jun 2019 12:28:06 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71t-0001U5-Fd; Wed, 26 Jun 2019 12:28:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:12 +0200
Message-Id: <20190626122724.13313-14-hch@lst.de>
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
 bh=u3zsuvlhpuVlW2irmLMymipD93NE9PuZGgr9ihGk+cw=; b=d5qB8osfJqMohKxbGTFQMSvZ2L
 1KQRqOrBzZgw95hqR7pC5Tucj3aBgj0VNA4cifFq8mAtLKD0y1772q8m2Z/ML4g9MnP7VyGZXROYQ
 CGsjiwCerbX6BpeiN/MViA/hM/oV9hr2xUNh/hyDYSytiOYO4VuD3HQ99ONPGzpXSDohyUZvaf5+5
 tEP6Go2MhIcoBaHR6YQM6iXPbXRjeKNPZuAc5iukG7vmbCG+osMb+7klCclgJbFAUga+T2bDeuUhW
 MOLIB+v5w+TI2bA58t30lzk9E06TgqWSiqBPClXaFtnn8gsbsrA6lO0aCw7Xfkzg6beeIa6ehrRFz
 vyIO8/mQ==;
Subject: [Nouveau] [PATCH 13/25] memremap: remove the data field in struct
 dev_pagemap
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

c3RydWN0IGRldl9wYWdlbWFwIGlzIGFsd2F5cyBlbWJlZGRlZCBpbnRvIGEgY29udGFpbmluZyBz
dHJ1Y3R1cmUsIHNvCnRoZXJlIGlzIG5vIG5lZWQgdG8gYW4gYWRkaXRpb25hbCBwcml2YXRlIGRh
dGEgZmllbGQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
UmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2
ZXJzL252ZGltbS9wbWVtLmMgICAgfCAyICstCiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggfCAz
ICstLQoga2VybmVsL21lbXJlbWFwLmMgICAgICAgIHwgMiArLQogbW0vaG1tLmMgICAgICAgICAg
ICAgICAgIHwgOSArKysrKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRpb25zKCspLCA4
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL3BtZW0uYyBiL2RyaXZl
cnMvbnZkaW1tL3BtZW0uYwppbmRleCA0ODc2NzE3MWE0ZGYuLjA5MzQwOGNlNDBhZCAxMDA2NDQK
LS0tIGEvZHJpdmVycy9udmRpbW0vcG1lbS5jCisrKyBiL2RyaXZlcnMvbnZkaW1tL3BtZW0uYwpA
QCAtMzM0LDcgKzMzNCw3IEBAIHN0YXRpYyB2b2lkIHBtZW1fcmVsZWFzZV9kaXNrKHZvaWQgKl9f
cG1lbSkKIAlwdXRfZGlzayhwbWVtLT5kaXNrKTsKIH0KIAotc3RhdGljIHZvaWQgcG1lbV9wYWdl
bWFwX3BhZ2VfZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdm9pZCAqZGF0YSkKK3N0YXRpYyB2b2lk
IHBtZW1fcGFnZW1hcF9wYWdlX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7CiAJd2FrZV91cF92
YXIoJnBhZ2UtPl9yZWZjb3VudCk7CiB9CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L21lbXJl
bWFwLmggYi9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKaW5kZXggYWM5ODViZDAzYTdmLi4zMzZl
Y2E2MDFkYWQgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaAorKysgYi9pbmNs
dWRlL2xpbnV4L21lbXJlbWFwLmgKQEAgLTY5LDcgKzY5LDcgQEAgc3RydWN0IGRldl9wYWdlbWFw
X29wcyB7CiAJICogcmVhY2ggMCByZWZjb3VudCB1bmxlc3MgdGhlcmUgaXMgYSByZWZjb3VudCBi
dWcuIFRoaXMgYWxsb3dzIHRoZQogCSAqIGRldmljZSBkcml2ZXIgdG8gaW1wbGVtZW50IGl0cyBv
d24gbWVtb3J5IG1hbmFnZW1lbnQuKQogCSAqLwotCXZvaWQgKCpwYWdlX2ZyZWUpKHN0cnVjdCBw
YWdlICpwYWdlLCB2b2lkICpkYXRhKTsKKwl2b2lkICgqcGFnZV9mcmVlKShzdHJ1Y3QgcGFnZSAq
cGFnZSk7CiAKIAkvKgogCSAqIFRyYW5zaXRpb24gdGhlIHJlZmNvdW50IGluIHN0cnVjdCBkZXZf
cGFnZW1hcCB0byB0aGUgZGVhZCBzdGF0ZS4KQEAgLTEwNCw3ICsxMDQsNiBAQCBzdHJ1Y3QgZGV2
X3BhZ2VtYXAgewogCXN0cnVjdCByZXNvdXJjZSByZXM7CiAJc3RydWN0IHBlcmNwdV9yZWYgKnJl
ZjsKIAlzdHJ1Y3QgZGV2aWNlICpkZXY7Ci0Jdm9pZCAqZGF0YTsKIAllbnVtIG1lbW9yeV90eXBl
IHR5cGU7CiAJdTY0IHBjaV9wMnBkbWFfYnVzX29mZnNldDsKIAljb25zdCBzdHJ1Y3QgZGV2X3Bh
Z2VtYXBfb3BzICpvcHM7CmRpZmYgLS1naXQgYS9rZXJuZWwvbWVtcmVtYXAuYyBiL2tlcm5lbC9t
ZW1yZW1hcC5jCmluZGV4IGMwNmE1NDg3ZGRhNy4uNmMzZGJiNjkyMDM3IDEwMDY0NAotLS0gYS9r
ZXJuZWwvbWVtcmVtYXAuYworKysgYi9rZXJuZWwvbWVtcmVtYXAuYwpAQCAtMzc2LDcgKzM3Niw3
IEBAIHZvaWQgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIAog
CQltZW1fY2dyb3VwX3VuY2hhcmdlKHBhZ2UpOwogCi0JCXBhZ2UtPnBnbWFwLT5vcHMtPnBhZ2Vf
ZnJlZShwYWdlLCBwYWdlLT5wZ21hcC0+ZGF0YSk7CisJCXBhZ2UtPnBnbWFwLT5vcHMtPnBhZ2Vf
ZnJlZShwYWdlKTsKIAl9IGVsc2UgaWYgKCFjb3VudCkKIAkJX19wdXRfcGFnZShwYWdlKTsKIH0K
ZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggOTY2MzNlZTA2NmQ4Li4zNmUy
NWNkYmRhYzEgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzY4LDE1
ICsxMzY4LDE3IEBAIHN0YXRpYyB2b2lkIGhtbV9kZXZtZW1fcmVmX2tpbGwoc3RydWN0IGRldl9w
YWdlbWFwICpwZ21hcCkKIAogc3RhdGljIHZtX2ZhdWx0X3QgaG1tX2Rldm1lbV9taWdyYXRlX3Rv
X3JhbShzdHJ1Y3Qgdm1fZmF1bHQgKnZtZikKIHsKLQlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVt
ID0gdm1mLT5wYWdlLT5wZ21hcC0+ZGF0YTsKKwlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtID0K
KwkJY29udGFpbmVyX29mKHZtZi0+cGFnZS0+cGdtYXAsIHN0cnVjdCBobW1fZGV2bWVtLCBwYWdl
bWFwKTsKIAogCXJldHVybiBkZXZtZW0tPm9wcy0+ZmF1bHQoZGV2bWVtLCB2bWYtPnZtYSwgdm1m
LT5hZGRyZXNzLCB2bWYtPnBhZ2UsCiAJCQl2bWYtPmZsYWdzLCB2bWYtPnBtZCk7CiB9CiAKLXN0
YXRpYyB2b2lkIGhtbV9kZXZtZW1fZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdm9pZCAqZGF0YSkK
K3N0YXRpYyB2b2lkIGhtbV9kZXZtZW1fZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKLQlzdHJ1
Y3QgaG1tX2Rldm1lbSAqZGV2bWVtID0gZGF0YTsKKwlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVt
ID0KKwkJY29udGFpbmVyX29mKHBhZ2UtPnBnbWFwLCBzdHJ1Y3QgaG1tX2Rldm1lbSwgcGFnZW1h
cCk7CiAKIAlkZXZtZW0tPm9wcy0+ZnJlZShkZXZtZW0sIHBhZ2UpOwogfQpAQCAtMTQ0Miw3ICsx
NDQ0LDYgQEAgc3RydWN0IGhtbV9kZXZtZW0gKmhtbV9kZXZtZW1fYWRkKGNvbnN0IHN0cnVjdCBo
bW1fZGV2bWVtX29wcyAqb3BzLAogCWRldm1lbS0+cGFnZW1hcC5vcHMgPSAmaG1tX3BhZ2VtYXBf
b3BzOwogCWRldm1lbS0+cGFnZW1hcC5hbHRtYXBfdmFsaWQgPSBmYWxzZTsKIAlkZXZtZW0tPnBh
Z2VtYXAucmVmID0gJmRldm1lbS0+cmVmOwotCWRldm1lbS0+cGFnZW1hcC5kYXRhID0gZGV2bWVt
OwogCiAJcmVzdWx0ID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXZtZW0tPmRldmljZSwgJmRldm1l
bS0+cGFnZW1hcCk7CiAJaWYgKElTX0VSUihyZXN1bHQpKQotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
