Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9E19878DF3
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 076E289D67;
	Mon, 29 Jul 2019 14:29:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C87E089DA5;
 Mon, 29 Jul 2019 14:29:19 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6eK-0006O9-Rc; Mon, 29 Jul 2019 14:29:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:42 +0300
Message-Id: <20190729142843.22320-9-hch@lst.de>
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
 bh=btXxqezSTYpMi2lLCeQ3gcAVYHUyBBOdSXXsZurrEew=; b=ZXUwnk7xK0eKvyNMCJiotaRVYY
 rDFhDzOGkIe8OqjwqnrED1/er13fgyYhrlvT/BdF5iqD2+fHbtr+SI6BVjX7Y8UUDrM5++0RTtGD+
 A6wiqxzp5hNljbLRwzQ62Oxo0eirdUqNPJBq/QV7OfJFQt+QafoC8dV+5GO3zFNzfnYPHLQIGe9Me
 uVgP7tYhnsmBNwE9+DLYy6MFGcMI2KOY40RRE4FWvTaRyAvNOgfRu14N1QeGfaqlBnzHHd60ZFwpx
 XrKs7PeR4RmkKc8b/thC2CTBP75FhQaJQp1/nAV/tBf5G2wLyPJyvf25PxBVnv3It7Os91C9hkzNf
 KazPletQ==;
Subject: [Nouveau] [PATCH 8/9] mm: remove the unused MIGRATE_PFN_DEVICE flag
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

Tm8gb25lIGV2ZXIgY2hlY2tzIHRoaXMgZmxhZywgYW5kIHdlIGNvdWxkIGVhc2lseSBnZXQgdGhh
dCBpbmZvcm1hdGlvbgpmcm9tIHRoZSBwYWdlIGlmIG5lZWRlZC4KClNpZ25lZC1vZmYtYnk6IENo
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfZG1lbS5jIHwgMyArLS0KIGluY2x1ZGUvbGludXgvbWlncmF0ZS5oICAgICAgICAg
ICAgICAgIHwgMSAtCiBtbS9taWdyYXRlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQg
KystLQogMyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCA2Y2I5MzA3NTU5NzAuLmYw
NDY4NmEyYzIxZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKQEAgLTU4
Miw4ICs1ODIsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBub3V2ZWF1X2RtZW1fbWlncmF0ZV9j
b3B5X29uZShzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKIAkJCSpkbWFfYWRkcikpCiAJCWdvdG8g
b3V0X2RtYV91bm1hcDsKIAotCXJldHVybiBtaWdyYXRlX3BmbihwYWdlX3RvX3BmbihkcGFnZSkp
IHwKLQkJTUlHUkFURV9QRk5fTE9DS0VEIHwgTUlHUkFURV9QRk5fREVWSUNFOworCXJldHVybiBt
aWdyYXRlX3BmbihwYWdlX3RvX3BmbihkcGFnZSkpIHwgTUlHUkFURV9QRk5fTE9DS0VEOwogCiBv
dXRfZG1hX3VubWFwOgogCWRtYV91bm1hcF9wYWdlKGRldiwgKmRtYV9hZGRyLCBQQUdFX1NJWkUs
IERNQV9CSURJUkVDVElPTkFMKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5o
IGIvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKaW5kZXggMjI5MTUzYzJjNDk2Li44YjQ2Y2ZkYjFh
MGUgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvbWlncmF0ZS5oCkBAIC0xNjYsNyArMTY2LDYgQEAgc3RhdGljIGlubGluZSBpbnQgbWlncmF0
ZV9taXNwbGFjZWRfdHJhbnNodWdlX3BhZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAjZGVmaW5l
IE1JR1JBVEVfUEZOX01JR1JBVEUJKDFVTCA8PCAxKQogI2RlZmluZSBNSUdSQVRFX1BGTl9MT0NL
RUQJKDFVTCA8PCAyKQogI2RlZmluZSBNSUdSQVRFX1BGTl9XUklURQkoMVVMIDw8IDMpCi0jZGVm
aW5lIE1JR1JBVEVfUEZOX0RFVklDRQkoMVVMIDw8IDQpCiAjZGVmaW5lIE1JR1JBVEVfUEZOX1NI
SUZUCTYKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqbWlncmF0ZV9wZm5fdG9fcGFnZSh1
bnNpZ25lZCBsb25nIG1wZm4pCmRpZmYgLS1naXQgYS9tbS9taWdyYXRlLmMgYi9tbS9taWdyYXRl
LmMKaW5kZXggZGM0ZTYwYTQ5NmYyLi43NDczNTI1NmUyNjAgMTAwNjQ0Ci0tLSBhL21tL21pZ3Jh
dGUuYworKysgYi9tbS9taWdyYXRlLmMKQEAgLTIyMzcsOCArMjIzNyw4IEBAIHN0YXRpYyBpbnQg
bWlncmF0ZV92bWFfY29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCiAJCQkJZ290byBuZXh0OwogCiAJ
CQlwYWdlID0gZGV2aWNlX3ByaXZhdGVfZW50cnlfdG9fcGFnZShlbnRyeSk7Ci0JCQltcGZuID0g
bWlncmF0ZV9wZm4ocGFnZV90b19wZm4ocGFnZSkpfAotCQkJCU1JR1JBVEVfUEZOX0RFVklDRSB8
IE1JR1JBVEVfUEZOX01JR1JBVEU7CisJCQltcGZuID0gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4o
cGFnZSkpIHwKKwkJCQkJTUlHUkFURV9QRk5fTUlHUkFURTsKIAkJCWlmIChpc193cml0ZV9kZXZp
Y2VfcHJpdmF0ZV9lbnRyeShlbnRyeSkpCiAJCQkJbXBmbiB8PSBNSUdSQVRFX1BGTl9XUklURTsK
IAkJfSBlbHNlIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVz
a3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9u
b3V2ZWF1
