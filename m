Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4509C568D7
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C17D16E3DA;
	Wed, 26 Jun 2019 12:27:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5846E6E3E5;
 Wed, 26 Jun 2019 12:27:52 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71g-0001O4-Pe; Wed, 26 Jun 2019 12:27:49 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:07 +0200
Message-Id: <20190626122724.13313-9-hch@lst.de>
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
 bh=jJLN4PQyh+NiJMk0GjPmnktfOIwnazdB1WyLd+EwQBI=; b=AoPkQ1Ya+GVeIiAkwNrcOY3WXy
 sAhllTHY9EgHAAks54i/wuled6yq4/SYKn1NbwYo04wuJLkW52WmxaNmHyzJwOIaCd1GOvXiEtOFh
 ThHQsj3EyWPwSyeHernbRDYWFXPuc50UnHzB/Ux1T9z32tWTuakN3Zxrkm+83YlNJ6VlyDhXoVpV0
 swGfUgPd+voS9n+3QCOoIUtQgxulHB6VDtuaVG04iQieR5ANlKAx/Sb/w9GgYjty+E8OOcprpShvj
 UdtX/dRdsOG235kDLoTkXHXo33rFg+7/1zOnF3ap3zxhTo4sRT+LAOqrSL+ve8dTmWYfKoZdPNkJ2
 oG9lwaoA==;
Subject: [Nouveau] [PATCH 08/25] memremap: validate the pagemap type passed
 to devm_memremap_pages
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

TW9zdCBwZ21hcCB0eXBlcyBhcmUgb25seSBzdXBwb3J0ZWQgd2hlbiBjZXJ0YWluIGNvbmZpZyBv
cHRpb25zIGFyZQplbmFibGVkLiAgQ2hlY2sgZm9yIGEgdHlwZSB0aGF0IGlzIHZhbGlkIGZvciB0
aGUgY3VycmVudCBjb25maWd1cmF0aW9uCmJlZm9yZSBzZXR0aW5nIHVwIHRoZSBwYWdlbWFwLiAg
Rm9yIHRoaXMgdGhlIHVzYWdlIG9mIHRoZSAwIHR5cGUgZm9yCmRldmljZSBkYXggZ2V0cyByZXBs
YWNlZCB3aXRoIGFuIGV4cGxpY2l0IE1FTU9SWV9ERVZJQ0VfREVWREFYIHR5cGUuCgpTaWduZWQt
b2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2RheC9k
ZXZpY2UuYyAgICAgfCAgMSArCiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggfCAgOCArKysrKysr
Kwoga2VybmVsL21lbXJlbWFwLmMgICAgICAgIHwgMjIgKysrKysrKysrKysrKysrKysrKysrKwog
MyBmaWxlcyBjaGFuZ2VkLCAzMSBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9k
YXgvZGV2aWNlLmMgYi9kcml2ZXJzL2RheC9kZXZpY2UuYwppbmRleCA4NDY1ZDEyZmVjYmEuLjc5
MDE0YmFhNzgyZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9kYXgvZGV2aWNlLmMKKysrIGIvZHJpdmVy
cy9kYXgvZGV2aWNlLmMKQEAgLTQ2OCw2ICs0NjgsNyBAQCBpbnQgZGV2X2RheF9wcm9iZShzdHJ1
Y3QgZGV2aWNlICpkZXYpCiAJZGV2X2RheC0+cGdtYXAucmVmID0gJmRldl9kYXgtPnJlZjsKIAlk
ZXZfZGF4LT5wZ21hcC5raWxsID0gZGV2X2RheF9wZXJjcHVfa2lsbDsKIAlkZXZfZGF4LT5wZ21h
cC5jbGVhbnVwID0gZGV2X2RheF9wZXJjcHVfZXhpdDsKKwlkZXZfZGF4LT5wZ21hcC50eXBlID0g
TUVNT1JZX0RFVklDRV9ERVZEQVg7CiAJYWRkciA9IGRldm1fbWVtcmVtYXBfcGFnZXMoZGV2LCAm
ZGV2X2RheC0+cGdtYXApOwogCWlmIChJU19FUlIoYWRkcikpCiAJCXJldHVybiBQVFJfRVJSKGFk
ZHIpOwpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oIGIvaW5jbHVkZS9saW51
eC9tZW1yZW1hcC5oCmluZGV4IDk5NWM2MmM1YTQ4Yi4uMGM4NmYyYzVhYzljIDEwMDY0NAotLS0g
YS9pbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5o
CkBAIC00NSwxMyArNDUsMjEgQEAgc3RydWN0IHZtZW1fYWx0bWFwIHsKICAqIHdha2V1cCBpcyB1
c2VkIHRvIGNvb3JkaW5hdGUgcGh5c2ljYWwgYWRkcmVzcyBzcGFjZSBtYW5hZ2VtZW50IChleDoK
ICAqIGZzIHRydW5jYXRlL2hvbGUgcHVuY2gpIHZzIHBpbm5lZCBwYWdlcyAoZXg6IGRldmljZSBk
bWEpLgogICoKKyAqIE1FTU9SWV9ERVZJQ0VfREVWREFYOgorICogSG9zdCBtZW1vcnkgdGhhdCBo
YXMgc2ltaWxhciBhY2Nlc3Mgc2VtYW50aWNzIGFzIFN5c3RlbSBSQU0gaS5lLiBETUEKKyAqIGNv
aGVyZW50IGFuZCBzdXBwb3J0cyBwYWdlIHBpbm5pbmcuIEluIGNvbnRyYXN0IHRvCisgKiBNRU1P
UllfREVWSUNFX0ZTX0RBWCwgdGhpcyBtZW1vcnkgaXMgYWNjZXNzIHZpYSBhIGRldmljZS1kYXgK
KyAqIGNoYXJhY3RlciBkZXZpY2UuCisgKgogICogTUVNT1JZX0RFVklDRV9QQ0lfUDJQRE1BOgog
ICogRGV2aWNlIG1lbW9yeSByZXNpZGluZyBpbiBhIFBDSSBCQVIgaW50ZW5kZWQgZm9yIHVzZSB3
aXRoIFBlZXItdG8tUGVlcgogICogdHJhbnNhY3Rpb25zLgogICovCiBlbnVtIG1lbW9yeV90eXBl
IHsKKwkvKiAwIGlzIHJlc2VydmVkIHRvIGNhdGNoIHVuaW5pdGlhbGl6ZWQgdHlwZSBmaWVsZHMg
Ki8KIAlNRU1PUllfREVWSUNFX1BSSVZBVEUgPSAxLAogCU1FTU9SWV9ERVZJQ0VfRlNfREFYLAor
CU1FTU9SWV9ERVZJQ0VfREVWREFYLAogCU1FTU9SWV9ERVZJQ0VfUENJX1AyUERNQSwKIH07CiAK
ZGlmZiAtLWdpdCBhL2tlcm5lbC9tZW1yZW1hcC5jIGIva2VybmVsL21lbXJlbWFwLmMKaW5kZXgg
NmUxOTcwNzE5ZGMyLi5hYmRhNjJkMWU1YTMgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9tZW1yZW1hcC5j
CisrKyBiL2tlcm5lbC9tZW1yZW1hcC5jCkBAIC0xNTcsNiArMTU3LDI4IEBAIHZvaWQgKmRldm1f
bWVtcmVtYXBfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2X3BhZ2VtYXAgKnBn
bWFwKQogCXBncHJvdF90IHBncHJvdCA9IFBBR0VfS0VSTkVMOwogCWludCBlcnJvciwgbmlkLCBp
c19yYW07CiAKKwlzd2l0Y2ggKHBnbWFwLT50eXBlKSB7CisJY2FzZSBNRU1PUllfREVWSUNFX1BS
SVZBVEU6CisJCWlmICghSVNfRU5BQkxFRChDT05GSUdfREVWSUNFX1BSSVZBVEUpKSB7CisJCQlX
QVJOKDEsICJEZXZpY2UgcHJpdmF0ZSBtZW1vcnkgbm90IHN1cHBvcnRlZFxuIik7CisJCQlyZXR1
cm4gRVJSX1BUUigtRUlOVkFMKTsKKwkJfQorCQlicmVhazsKKwljYXNlIE1FTU9SWV9ERVZJQ0Vf
RlNfREFYOgorCQlpZiAoIUlTX0VOQUJMRUQoQ09ORklHX1pPTkVfREVWSUNFKSB8fAorCQkgICAg
SVNfRU5BQkxFRChDT05GSUdfRlNfREFYX0xJTUlURUQpKSB7CisJCQlXQVJOKDEsICJGaWxlIHN5
c3RlbSBEQVggbm90IHN1cHBvcnRlZFxuIik7CisJCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsK
KwkJfQorCQlicmVhazsKKwljYXNlIE1FTU9SWV9ERVZJQ0VfREVWREFYOgorCWNhc2UgTUVNT1JZ
X0RFVklDRV9QQ0lfUDJQRE1BOgorCQlicmVhazsKKwlkZWZhdWx0OgorCQlXQVJOKDEsICJJbnZh
bGlkIHBnbWFwIHR5cGUgJWRcbiIsIHBnbWFwLT50eXBlKTsKKwkJYnJlYWs7CisJfQorCiAJaWYg
KCFwZ21hcC0+cmVmIHx8ICFwZ21hcC0+a2lsbCB8fCAhcGdtYXAtPmNsZWFudXApIHsKIAkJV0FS
TigxLCAiTWlzc2luZyByZWZlcmVuY2UgY291bnQgdGVhcmRvd24gZGVmaW5pdGlvblxuIik7CiAJ
CXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
