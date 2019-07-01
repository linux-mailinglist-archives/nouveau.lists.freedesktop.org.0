Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7A5B4D6
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:21:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED04289F71;
	Mon,  1 Jul 2019 06:21:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0245689F89;
 Mon,  1 Jul 2019 06:21:15 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgd-0003Y2-QA; Mon, 01 Jul 2019 06:21:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:20 +0200
Message-Id: <20190701062020.19239-23-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701062020.19239-1-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
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
 bh=8byVWDDjomwL6qH7S0OtanLtekPodjhPaEDKqBoEUGs=; b=gymyO8jYdkpQB45FPyoqo5QVRO
 pxdxLE/pukS1Gk+9MEFhUMYN00wWfJtK9mHMqd13ChvWkK6i3fJFh5i3DGPvBqQ37V8+yF0igt9nN
 Y9V4N/egahV3v/1fcDcj6gtqMt3/1tKmCmBZNUOPuZDmSMXGT7uyE2F/3McRlbRBhxwK2jh6sWGos
 ctgD/8HuEKjDbXkk6fDiLK/fGApomgUO2pe9gIo2ZW5OLFiUrBVFWmZ11yFMq+imU7W5vNvpz+ObV
 JvmhVL1Q0WzgqBRzkrgih94Su6CSqN/FTPUhjuxgRAK49QrB82cKbelNL+xMhaE0alH06JPe6B65V
 JIyEF0zw==;
Subject: [Nouveau] [PATCH 22/22] mm: remove the legacy hmm_pfn_* APIs
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U3dpdGNoIHRoZSBvbmUgcmVtYWluaW5nIHVzZXIgaW4gbm91dmVhdSBvdmVyIHRvIGl0cyByZXBs
YWNlbWVudCwKYW5kIHJlbW92ZSBhbGwgdGhlIHdyYXBwZXJzLgoKU2lnbmVkLW9mZi1ieTogQ2hy
aXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWVtLmMgfCAgMiArLQogaW5jbHVkZS9saW51eC9obW0uaCAgICAgICAgICAgICAg
ICAgICAgfCAzNiAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCAx
IGluc2VydGlvbigrKSwgMzcgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RtZW0uYwppbmRleCA0MGM0N2Q2YTdkNzguLjUzNDA2OWZmZTIwYSAxMDA2NDQKLS0tIGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKQEAgLTg1Myw3ICs4NTMsNyBAQCBub3V2ZWF1X2Rt
ZW1fY29udmVydF9wZm4oc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCiAJCXN0cnVjdCBwYWdlICpw
YWdlOwogCQl1aW50NjRfdCBhZGRyOwogCi0JCXBhZ2UgPSBobW1fcGZuX3RvX3BhZ2UocmFuZ2Us
IHJhbmdlLT5wZm5zW2ldKTsKKwkJcGFnZSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5n
ZSwgcmFuZ2UtPnBmbnNbaV0pOwogCQlpZiAocGFnZSA9PSBOVUxMKQogCQkJY29udGludWU7CiAK
ZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmlu
ZGV4IDM0NTdjZjkxODJlNS4uOTc5OWZkZTcxZjJlIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4
L2htbS5oCisrKyBiL2luY2x1ZGUvbGludXgvaG1tLmgKQEAgLTI5MCw0MiArMjkwLDYgQEAgc3Rh
dGljIGlubGluZSB1aW50NjRfdCBobW1fZGV2aWNlX2VudHJ5X2Zyb21fcGZuKGNvbnN0IHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlLAogCQlyYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF07CiB9CiAK
LS8qCi0gKiBPbGQgQVBJOgotICogaG1tX3Bmbl90b19wYWdlKCkKLSAqIGhtbV9wZm5fdG9fcGZu
KCkKLSAqIGhtbV9wZm5fZnJvbV9wYWdlKCkKLSAqIGhtbV9wZm5fZnJvbV9wZm4oKQotICoKLSAq
IFRoaXMgYXJlIHRoZSBPTEQgQVBJIHBsZWFzZSB1c2UgbmV3IEFQSSwgaXQgaXMgaGVyZSB0byBh
dm9pZCBjcm9zcy10cmVlCi0gKiBtZXJnZSBwYWluZnVsbG5lc3MgaWUgd2UgY29udmVydCB0aGlu
Z3MgdG8gbmV3IEFQSSBpbiBzdGFnZXMuCi0gKi8KLXN0YXRpYyBpbmxpbmUgc3RydWN0IHBhZ2Ug
KmhtbV9wZm5fdG9fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJICAg
dWludDY0X3QgcGZuKQotewotCXJldHVybiBobW1fZGV2aWNlX2VudHJ5X3RvX3BhZ2UocmFuZ2Us
IHBmbik7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdW5zaWduZWQgbG9uZyBobW1fcGZuX3RvX3Bmbihj
b25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJICAgdWludDY0X3QgcGZuKQotewot
CXJldHVybiBobW1fZGV2aWNlX2VudHJ5X3RvX3BmbihyYW5nZSwgcGZuKTsKLX0KLQotc3RhdGlj
IGlubGluZSB1aW50NjRfdCBobW1fcGZuX2Zyb21fcGFnZShjb25zdCBzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwKLQkJCQkJIHN0cnVjdCBwYWdlICpwYWdlKQotewotCXJldHVybiBobW1fZGV2aWNl
X2VudHJ5X2Zyb21fcGFnZShyYW5nZSwgcGFnZSk7Ci19Ci0KLXN0YXRpYyBpbmxpbmUgdWludDY0
X3QgaG1tX3Bmbl9mcm9tX3Bmbihjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKLQkJCQkJ
dW5zaWduZWQgbG9uZyBwZm4pCi17Ci0JcmV0dXJuIGhtbV9kZXZpY2VfZW50cnlfZnJvbV9wZm4o
cmFuZ2UsIHBmbik7Ci19Ci0KLQotCiAjaWYgSVNfRU5BQkxFRChDT05GSUdfSE1NX01JUlJPUikK
IC8qCiAgKiBNaXJyb3Jpbmc6IGhvdyB0byBzeW5jaHJvbml6ZSBkZXZpY2UgcGFnZSB0YWJsZSB3
aXRoIENQVSBwYWdlIHRhYmxlLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXU=
