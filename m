Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2727C5EEED
	for <lists+nouveau@lfdr.de>; Thu,  4 Jul 2019 00:02:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90A2D6E20C;
	Wed,  3 Jul 2019 22:02:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091B26E20C;
 Wed,  3 Jul 2019 22:02:26 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hinKS-0004Er-Pp; Wed, 03 Jul 2019 22:02:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 15:02:14 -0700
Message-Id: <20190703220214.28319-7-hch@lst.de>
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
 bh=GmIbzmtd8tOzuQLg/EqjNzFkCAF84w76eG2p5TWzhiU=; b=rntZ06uUlfg/5V+8FahH4VKRve
 0MTWu0xf0b1aqm0wYAYPxxooNt2SSuQ4vvjpnEEOS5h9gKLJ3rgNyZ5EJcPK3FjtJHY4t0WVemkdA
 y3sGrURy8SD/wfZyHPlvdc4Y0rB7DCzAbOMjatokw8rBtMyajtZFa8eUdnBzSIFtpGf0TICahDuUb
 Ua5BOTAsjHhBLjVqtdRVsqi5KqQR1r9mDEVMh70w7Ycs+P/S+rHEY+JhB3PREIVP/hBdt+xg9WWli
 52ZJ6E8O3cpcXHKds0bFgglaJbptoQ5a1RVSGE8FFl75HsRneFOQTkbkPoPjNF808QquF6LjNNhKV
 Rj9RIUZw==;
Subject: [Nouveau] [PATCH 6/6] mm: remove the legacy hmm_pfn_* APIs
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

U3dpdGNoIHRoZSBvbmUgcmVtYWluaW5nIHVzZXIgaW4gbm91dmVhdSBvdmVyIHRvIGl0cyByZXBs
YWNlbWVudCwKYW5kIHJlbW92ZSBhbGwgdGhlIHdyYXBwZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8
cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0Bt
ZWxsYW5veC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMg
fCAgMiArLQogaW5jbHVkZS9saW51eC9obW0uaCAgICAgICAgICAgICAgICAgICAgfCAzNCAtLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwg
MzUgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRl
eCA0MmMwMjYwMTA5MzguLmI5Y2VkMmU2MTY2NyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kbWVtLmMKQEAgLTg0NCw3ICs4NDQsNyBAQCBub3V2ZWF1X2RtZW1fY29udmVydF9wZm4o
c3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCiAJCXN0cnVjdCBwYWdlICpwYWdlOwogCQl1aW50NjRf
dCBhZGRyOwogCi0JCXBhZ2UgPSBobW1fcGZuX3RvX3BhZ2UocmFuZ2UsIHJhbmdlLT5wZm5zW2ld
KTsKKwkJcGFnZSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5nZSwgcmFuZ2UtPnBmbnNb
aV0pOwogCQlpZiAocGFnZSA9PSBOVUxMKQogCQkJY29udGludWU7CiAKZGlmZiAtLWdpdCBhL2lu
Y2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IGZhNDNhOWY1Mzgz
My4uYmY2NDFiYmVjYzdlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2lu
Y2x1ZGUvbGludXgvaG1tLmgKQEAgLTI5MCw0MCArMjkwLDYgQEAgc3RhdGljIGlubGluZSB1aW50
NjRfdCBobW1fZGV2aWNlX2VudHJ5X2Zyb21fcGZuKGNvbnN0IHN0cnVjdCBobW1fcmFuZ2UgKnJh
bmdlLAogCQlyYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF07CiB9CiAKLS8qCi0gKiBPbGQgQVBJ
OgotICogaG1tX3Bmbl90b19wYWdlKCkKLSAqIGhtbV9wZm5fdG9fcGZuKCkKLSAqIGhtbV9wZm5f
ZnJvbV9wYWdlKCkKLSAqIGhtbV9wZm5fZnJvbV9wZm4oKQotICoKLSAqIFRoaXMgYXJlIHRoZSBP
TEQgQVBJIHBsZWFzZSB1c2UgbmV3IEFQSSwgaXQgaXMgaGVyZSB0byBhdm9pZCBjcm9zcy10cmVl
Ci0gKiBtZXJnZSBwYWluZnVsbG5lc3MgaWUgd2UgY29udmVydCB0aGluZ3MgdG8gbmV3IEFQSSBp
biBzdGFnZXMuCi0gKi8KLXN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2UgKmhtbV9wZm5fdG9fcGFn
ZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJICAgdWludDY0X3QgcGZuKQot
ewotCXJldHVybiBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UocmFuZ2UsIHBmbik7Ci19Ci0KLXN0
YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBobW1fcGZuX3RvX3Bmbihjb25zdCBzdHJ1Y3QgaG1t
X3JhbmdlICpyYW5nZSwKLQkJCQkJICAgdWludDY0X3QgcGZuKQotewotCXJldHVybiBobW1fZGV2
aWNlX2VudHJ5X3RvX3BmbihyYW5nZSwgcGZuKTsKLX0KLQotc3RhdGljIGlubGluZSB1aW50NjRf
dCBobW1fcGZuX2Zyb21fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJ
IHN0cnVjdCBwYWdlICpwYWdlKQotewotCXJldHVybiBobW1fZGV2aWNlX2VudHJ5X2Zyb21fcGFn
ZShyYW5nZSwgcGFnZSk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdWludDY0X3QgaG1tX3Bmbl9mcm9t
X3Bmbihjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJdW5zaWduZWQgbG9uZyBw
Zm4pCi17Ci0JcmV0dXJuIGhtbV9kZXZpY2VfZW50cnlfZnJvbV9wZm4ocmFuZ2UsIHBmbik7Ci19
Ci0KIC8qCiAgKiBNaXJyb3Jpbmc6IGhvdyB0byBzeW5jaHJvbml6ZSBkZXZpY2UgcGFnZSB0YWJs
ZSB3aXRoIENQVSBwYWdlIHRhYmxlLgogICoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
