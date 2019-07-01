Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85F5B4D4
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:21:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 87B1D89ECB;
	Mon,  1 Jul 2019 06:21:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9281589F82;
 Mon,  1 Jul 2019 06:21:13 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgb-0003W2-Ks; Mon, 01 Jul 2019 06:21:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:19 +0200
Message-Id: <20190701062020.19239-22-hch@lst.de>
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
 bh=pfzb7DKQGxSim4j5P5NViAehCYDnD7twhlehxZF4/mk=; b=Sh+xg97CAaxfCofmcqXvvWAphg
 /FC2T86IXntWnlzo7VNQ0a7nvzkSU5M8Vor1yTinwL8XHWySWdAmf559BGxhLygWpZkXa+jWcNQpF
 yiqysTo4IQb6Xpt1GUM99QV4WcYAL16tbM/uA/Iri95ouR7gdrojQ0Q1FFO88taxm3tHE0W2P75Ls
 uFALgpav78FJe/L2HvoUQuW9Nx75lFKVz+WQqk7Svyo2Nz6faU7+QmTVPfGCiVaW1HVgnmdn0SnRa
 bWnACDf6hys4JLjnsuvv+pNy9oG68GRh5KBdYs5IrjoRydXBE/posTx59K1lsO1UsoEGdwy2Of8G0
 zfk6CmHg==;
Subject: [Nouveau] [PATCH 21/22] nouveau: unlock mmap_sem on all errors from
 nouveau_range_fault
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

Q3VycmVudGx5IG5vdXZlYXVfc3ZtX2ZhdWx0IGV4cGVjdHMgbm91dmVhdV9yYW5nZV9mYXVsdCB0
byBuZXZlciB1bmxvY2sKbW1hcF9zZW0sIGJ1dCB0aGUgbGF0dGVyIHVubG9ja3MgaXQgZm9yIGEg
cmFuZG9tIHNlbGVjdGlvbiBvZiBlcnJvcgpjb2Rlcy4gRml4IHRoaXMgdXAgYnkgYWx3YXlzIHVu
bG9ja2luZyBtbWFwX3NlbSBmb3Igbm9uLXplcm8gcmV0dXJuCnZhbHVlcyBpbiBub3V2ZWF1X3Jh
bmdlX2ZhdWx0LCBhbmQgb25seSB1bmxvY2tpbmcgaXQgaW4gdGhlIGNhbGxlcgpmb3Igc3VjY2Vz
c2Z1bCByZXR1cm5zLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3Qu
ZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDE1ICsrKysr
KysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNyBkZWxldGlvbnMo
LSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIGIv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwppbmRleCBlODMxZjQxODRhMTcu
LmMwY2Y3YWVhZWZiMyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9zdm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBAIC01
MDAsOCArNTAwLDEwIEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1p
cnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAJcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVy
KHJhbmdlLCBtaXJyb3IsCiAJCQkJIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCwKIAkJCQkgUEFH
RV9TSElGVCk7Ci0JaWYgKHJldCkKKwlpZiAocmV0KSB7CisJCXVwX3JlYWQoJnJhbmdlLT52bWEt
PnZtX21tLT5tbWFwX3NlbSk7CiAJCXJldHVybiAoaW50KXJldDsKKwl9CiAKIAlpZiAoIWhtbV9y
YW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBOT1VWRUFVX1JBTkdFX0ZBVUxUX1RJTUVPVVQp
KSB7CiAJCS8qCkBAIC01MTUsMTUgKzUxNywxNCBAQCBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVj
dCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogCiAJcmV0ID0g
aG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCBibG9jayk7CiAJaWYgKHJldCA8PSAwKSB7Ci0JCWlmIChy
ZXQgPT0gLUVCVVNZIHx8ICFyZXQpIHsKLQkJCS8qIFNhbWUgYXMgYWJvdmUsIGRyb3AgbW1hcF9z
ZW0gdG8gbWF0Y2ggb2xkIEFQSS4gKi8KLQkJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5t
bWFwX3NlbSk7Ci0JCQlyZXQgPSAtRUJVU1k7Ci0JCX0gZWxzZSBpZiAocmV0ID09IC1FQUdBSU4p
CisJCWlmIChyZXQgPT0gMCkKIAkJCXJldCA9IC1FQlVTWTsKKwkJaWYgKHJldCAhPSAtRUFHQUlO
KQorCQkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsKIAkJaG1tX3Jhbmdl
X3VucmVnaXN0ZXIocmFuZ2UpOwogCQlyZXR1cm4gcmV0OwogCX0KKwogCXJldHVybiAwOwogfQog
CkBAIC03MTgsOCArNzE5LDggQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5
ICpub3RpZnkpCiAJCQkJCQlOVUxMKTsKIAkJCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQt
PnN1cGVyID0gZmFsc2U7CiAJCQltdXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsKKwkJCXVwX3Jl
YWQoJnN2bW0tPm1tLT5tbWFwX3NlbSk7CiAJCX0KLQkJdXBfcmVhZCgmc3ZtbS0+bW0tPm1tYXBf
c2VtKTsKIAogCQkvKiBDYW5jZWwgYW55IGZhdWx0cyBpbiB0aGUgd2luZG93IHdob3NlIHBhZ2Vz
IGRpZG4ndCBtYW5hZ2UKIAkJICogdG8ga2VlcCB0aGVpciB2YWxpZCBiaXQsIG9yIHN0YXkgd3Jp
dGVhYmxlIHdoZW4gcmVxdWlyZWQuCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQ==
