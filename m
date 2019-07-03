Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F3F615EBE1
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 027296E19C;
	Wed,  3 Jul 2019 18:45:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A3C426E19C;
 Wed,  3 Jul 2019 18:45:09 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hikFc-0007IN-2j; Wed, 03 Jul 2019 18:45:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 11:45:02 -0700
Message-Id: <20190703184502.16234-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703184502.16234-1-hch@lst.de>
References: <20190703184502.16234-1-hch@lst.de>
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
 bh=6gkdMJihz+BKdhYSYDXoVp/HUiw1Ip+q05LF7yiN7rY=; b=ucKTI3Jt8HPKO6aQAQZ7BDiOrL
 JA4m8aEc2YkLhNz0//fOAOG6Y8t08qWufStZFGqAnWYxKPOi0a76+qnTmd5O02jnsQMB5pruHubyf
 /2+F0XgKJFWuWREiSjqaFDrVOJKlrABvu7R9hLTeiH+ikhD5ICmo7sxkL1FVc71ucDmxQPaEFEyXT
 Ibj/z7a8efuY6jJeoXi/uVQ2G5dcgrA2Efgd5ddEDS4sqPaWFIEnuaEOAns4nwG8p0iebCG9bj478
 2Tqro3odGJdmIAeBqlMIQ3X+fYxnvypX3SWREdvaaSH7rNfG4Y+OliRWm7B5/p0tE6DBihH2aXHBw
 So0kvONg==;
Subject: [Nouveau] [PATCH 5/5] mm: remove the legacy hmm_pfn_* APIs
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U3dpdGNoIHRoZSBvbmUgcmVtYWluaW5nIHVzZXIgaW4gbm91dmVhdSBvdmVyIHRvIGl0cyByZXBs
YWNlbWVudCwKYW5kIHJlbW92ZSBhbGwgdGhlIHdyYXBwZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUg
PGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMgfCAgMiArLQogaW5jbHVkZS9saW51eC9obW0uaCAgICAgICAgICAgICAgICAgICAgfCAz
NCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlv
bigrKSwgMzUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0u
YwppbmRleCA0MmMwMjYwMTA5MzguLmI5Y2VkMmU2MTY2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9kbWVtLmMKQEAgLTg0NCw3ICs4NDQsNyBAQCBub3V2ZWF1X2RtZW1fY29udmVy
dF9wZm4oc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCiAJCXN0cnVjdCBwYWdlICpwYWdlOwogCQl1
aW50NjRfdCBhZGRyOwogCi0JCXBhZ2UgPSBobW1fcGZuX3RvX3BhZ2UocmFuZ2UsIHJhbmdlLT5w
Zm5zW2ldKTsKKwkJcGFnZSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5nZSwgcmFuZ2Ut
PnBmbnNbaV0pOwogCQlpZiAocGFnZSA9PSBOVUxMKQogCQkJY29udGludWU7CiAKZGlmZiAtLWdp
dCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IDY1NzYw
NmY0ODc5Ni4uY2RjZDc4NjI3MzkzIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisr
KyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTI5MCw0MCArMjkwLDYgQEAgc3RhdGljIGlubGlu
ZSB1aW50NjRfdCBobW1fZGV2aWNlX2VudHJ5X2Zyb21fcGZuKGNvbnN0IHN0cnVjdCBobW1fcmFu
Z2UgKnJhbmdlLAogCQlyYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF07CiB9CiAKLS8qCi0gKiBP
bGQgQVBJOgotICogaG1tX3Bmbl90b19wYWdlKCkKLSAqIGhtbV9wZm5fdG9fcGZuKCkKLSAqIGht
bV9wZm5fZnJvbV9wYWdlKCkKLSAqIGhtbV9wZm5fZnJvbV9wZm4oKQotICoKLSAqIFRoaXMgYXJl
IHRoZSBPTEQgQVBJIHBsZWFzZSB1c2UgbmV3IEFQSSwgaXQgaXMgaGVyZSB0byBhdm9pZCBjcm9z
cy10cmVlCi0gKiBtZXJnZSBwYWluZnVsbG5lc3MgaWUgd2UgY29udmVydCB0aGluZ3MgdG8gbmV3
IEFQSSBpbiBzdGFnZXMuCi0gKi8KLXN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmhtbV9wZm5f
dG9fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJICAgdWludDY0X3Qg
cGZuKQotewotCXJldHVybiBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UocmFuZ2UsIHBmbik7Ci19
Ci0KLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBobW1fcGZuX3RvX3Bmbihjb25zdCBzdHJ1
Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJICAgdWludDY0X3QgcGZuKQotewotCXJldHVybiBo
bW1fZGV2aWNlX2VudHJ5X3RvX3BmbihyYW5nZSwgcGZuKTsKLX0KLQotc3RhdGljIGlubGluZSB1
aW50NjRfdCBobW1fcGZuX2Zyb21fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwK
LQkJCQkJIHN0cnVjdCBwYWdlICpwYWdlKQotewotCXJldHVybiBobW1fZGV2aWNlX2VudHJ5X2Zy
b21fcGFnZShyYW5nZSwgcGFnZSk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdWludDY0X3QgaG1tX3Bm
bl9mcm9tX3Bmbihjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJdW5zaWduZWQg
bG9uZyBwZm4pCi17Ci0JcmV0dXJuIGhtbV9kZXZpY2VfZW50cnlfZnJvbV9wZm4ocmFuZ2UsIHBm
bik7Ci19Ci0KIC8qCiAgKiBNaXJyb3Jpbmc6IGhvdyB0byBzeW5jaHJvbml6ZSBkZXZpY2UgcGFn
ZSB0YWJsZSB3aXRoIENQVSBwYWdlIHRhYmxlLgogICoKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
