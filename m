Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E33D865E6
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 17:34:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FF3B6E4DD;
	Thu,  8 Aug 2019 15:34:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D98AF6E4DD;
 Thu,  8 Aug 2019 15:34:48 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvkR8-0005SM-Q1; Thu, 08 Aug 2019 15:34:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu,  8 Aug 2019 18:33:46 +0300
Message-Id: <20190808153346.9061-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808153346.9061-1-hch@lst.de>
References: <20190808153346.9061-1-hch@lst.de>
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
 bh=v2zlW2TiTRHwHc1yYHq4FO4tl1SIGTw6xolj0rdYBaw=; b=JXmENGUroLS1HvW6SqOdL/yinM
 YhhrtUMBsr8Pp2pdozCHtVifO3k7GMTDmpdKlncX2cr8/JZF4MId19cVBV3hRfqZX9U7dwI09fbf/
 hexxS1WO+lCCjUlb3s3FnCPFYhsUI3QKf5vMKJKuZfCrN0Bye2whoBDloM+y9jftT/rzgkBUHvoL7
 INJQ3PlxLsjyTixA/U353JAunFQ3zuvbkRhSLKZRo5tQIo2uT6sk+w2Bbh2VNQ745efaWvJlKnNcW
 4lWB4m6MECSZAgpf2+1UG8uLFd8+qz0HzLUXM8UdRHRkHEd6XuHB4ZkMLXOOv1+EFAMuMQiuxZp1D
 jcB06A1w==;
Subject: [Nouveau] [PATCH 9/9] mm: remove the unused MIGRATE_PFN_DEVICE flag
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
cmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwg
PHJjYW1wYmVsbEBudmlkaWEuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfZG1lbS5jIHwgMyArLS0KIGluY2x1ZGUvbGludXgvbWlncmF0ZS5oICAgICAgICAgICAgICAg
IHwgMSAtCiBtbS9taWdyYXRlLmMgICAgICAgICAgICAgICAgICAgICAgICAgICB8IDQgKystLQog
MyBmaWxlcyBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCBlMjA0MzJhNThkZGIuLmVjYTQxNjBl
YjI3YiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMK
KysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKQEAgLTU4Miw4ICs1
ODIsNyBAQCBzdGF0aWMgdW5zaWduZWQgbG9uZyBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jb3B5X29u
ZShzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSwKIAkJCSpkbWFfYWRkcikpCiAJCWdvdG8gb3V0X2Rt
YV91bm1hcDsKIAotCXJldHVybiBtaWdyYXRlX3BmbihwYWdlX3RvX3BmbihkcGFnZSkpIHwKLQkJ
TUlHUkFURV9QRk5fTE9DS0VEIHwgTUlHUkFURV9QRk5fREVWSUNFOworCXJldHVybiBtaWdyYXRl
X3BmbihwYWdlX3RvX3BmbihkcGFnZSkpIHwgTUlHUkFURV9QRk5fTE9DS0VEOwogCiBvdXRfZG1h
X3VubWFwOgogCWRtYV91bm1hcF9wYWdlKGRldiwgKmRtYV9hZGRyLCBQQUdFX1NJWkUsIERNQV9C
SURJUkVDVElPTkFMKTsKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oIGIvaW5j
bHVkZS9saW51eC9taWdyYXRlLmgKaW5kZXggMWU2N2RjZmQzMThmLi43MjEyMDA2MWI3ZDQgMTAw
NjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCisrKyBiL2luY2x1ZGUvbGludXgvbWln
cmF0ZS5oCkBAIC0xNjYsNyArMTY2LDYgQEAgc3RhdGljIGlubGluZSBpbnQgbWlncmF0ZV9taXNw
bGFjZWRfdHJhbnNodWdlX3BhZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAjZGVmaW5lIE1JR1JB
VEVfUEZOX01JR1JBVEUJKDFVTCA8PCAxKQogI2RlZmluZSBNSUdSQVRFX1BGTl9MT0NLRUQJKDFV
TCA8PCAyKQogI2RlZmluZSBNSUdSQVRFX1BGTl9XUklURQkoMVVMIDw8IDMpCi0jZGVmaW5lIE1J
R1JBVEVfUEZOX0RFVklDRQkoMVVMIDw8IDQpCiAjZGVmaW5lIE1JR1JBVEVfUEZOX1NISUZUCTYK
IAogc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqbWlncmF0ZV9wZm5fdG9fcGFnZSh1bnNpZ25l
ZCBsb25nIG1wZm4pCmRpZmYgLS1naXQgYS9tbS9taWdyYXRlLmMgYi9tbS9taWdyYXRlLmMKaW5k
ZXggZTI1NjUzNzRkMzMwLi4zM2UwNjNjMjhjMWIgMTAwNjQ0Ci0tLSBhL21tL21pZ3JhdGUuYwor
KysgYi9tbS9taWdyYXRlLmMKQEAgLTIyMzcsOCArMjIzNyw4IEBAIHN0YXRpYyBpbnQgbWlncmF0
ZV92bWFfY29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCiAJCQkJZ290byBuZXh0OwogCiAJCQlwYWdl
ID0gZGV2aWNlX3ByaXZhdGVfZW50cnlfdG9fcGFnZShlbnRyeSk7Ci0JCQltcGZuID0gbWlncmF0
ZV9wZm4ocGFnZV90b19wZm4ocGFnZSkpfAotCQkJCU1JR1JBVEVfUEZOX0RFVklDRSB8IE1JR1JB
VEVfUEZOX01JR1JBVEU7CisJCQltcGZuID0gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4ocGFnZSkp
IHwKKwkJCQkJTUlHUkFURV9QRk5fTUlHUkFURTsKIAkJCWlmIChpc193cml0ZV9kZXZpY2VfcHJp
dmF0ZV9lbnRyeShlbnRyeSkpCiAJCQkJbXBmbiB8PSBNSUdSQVRFX1BGTl9XUklURTsKIAkJfSBl
bHNlIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
