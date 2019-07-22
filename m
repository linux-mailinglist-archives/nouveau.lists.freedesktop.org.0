Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 389406FC77
	for <lists+nouveau@lfdr.de>; Mon, 22 Jul 2019 11:44:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45C489B8E;
	Mon, 22 Jul 2019 09:44:42 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2A3A189B3C;
 Mon, 22 Jul 2019 09:44:41 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hpUs2-0001ss-AE; Mon, 22 Jul 2019 09:44:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 22 Jul 2019 11:44:24 +0200
Message-Id: <20190722094426.18563-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722094426.18563-1-hch@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
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
 bh=7FsIrxY02SwL66nSI+mJn6yPhyHFx4vF4xrsx6w9rHE=; b=KBrWujtJOcYc9XfEbicugrh0Ld
 WNtLBZQsXjaV9zG4rza6opsoXkHSVU7X6uZkzlxFHi6MsHHy0+PcuHhana1BszUNp8Vz6cBez9Ue4
 lR4CHnIFsGeZ/Y9okLdcFzmr7AM8zdJeoz88kBt4imZWSN9mspryETy3V896mi/j7diZq7x5xf6Xl
 9wcVv5WzOBsbGHk8ZDhV5+bt1qqSHyVvaTrKA4lFLINhGHFemEvdx228VplD4T33YKY3JBy4Ybui8
 rV5r1H5tG+d8FVqHsVlNuFyYCzShgyzz/le6tL8pmGTUPrA72N4i8B1la8aDBZTfhXBNtMdEklZ69
 BqQvr05Q==;
Subject: [Nouveau] [PATCH 4/6] nouveau: unlock mmap_sem on all errors from
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
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
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
ZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDEyICsrKysr
Ky0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwppbmRleCA1ZGQ4M2E0NjU3OGYuLjVk
ZTJkNTRiOTc4MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9z
dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBAIC00OTQs
OCArNDk0LDEwIEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJv
ciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAJcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJh
bmdlLCBtaXJyb3IsCiAJCQkJIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCwKIAkJCQkgUEFHRV9T
SElGVCk7Ci0JaWYgKHJldCkKKwlpZiAocmV0KSB7CisJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZt
X21tLT5tbWFwX3NlbSk7CiAJCXJldHVybiAoaW50KXJldDsKKwl9CiAKIAlpZiAoIWhtbV9yYW5n
ZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1fUkFOR0VfREVGQVVMVF9USU1FT1VUKSkgewog
CQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwpAQCAtNTA0LDExICs1MDYs
OSBAQCBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlKQogCiAJcmV0ID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCB0cnVl
KTsKIAlpZiAocmV0IDw9IDApIHsKLQkJaWYgKHJldCA9PSAtRUJVU1kgfHwgIXJldCkgewotCQkJ
dXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBfc2VtKTsKLQkJCXJldCA9IC1FQlVTWTsK
LQkJfSBlbHNlIGlmIChyZXQgPT0gLUVBR0FJTikKKwkJaWYgKHJldCA9PSAwKQogCQkJcmV0ID0g
LUVCVVNZOworCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwogCQlobW1f
cmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7CiAJCXJldHVybiByZXQ7CiAJfQpAQCAtNzA2LDggKzcw
Niw4IEBAIG5vdXZlYXVfc3ZtX2ZhdWx0KHN0cnVjdCBudmlmX25vdGlmeSAqbm90aWZ5KQogCQkJ
CQkJTlVMTCk7CiAJCQlzdm1tLT52bW0tPnZtbS5vYmplY3QuY2xpZW50LT5zdXBlciA9IGZhbHNl
OwogCQkJbXV0ZXhfdW5sb2NrKCZzdm1tLT5tdXRleCk7CisJCQl1cF9yZWFkKCZzdm1tLT5tbS0+
bW1hcF9zZW0pOwogCQl9Ci0JCXVwX3JlYWQoJnN2bW0tPm1tLT5tbWFwX3NlbSk7CiAKIAkJLyog
Q2FuY2VsIGFueSBmYXVsdHMgaW4gdGhlIHdpbmRvdyB3aG9zZSBwYWdlcyBkaWRuJ3QgbWFuYWdl
CiAJCSAqIHRvIGtlZXAgdGhlaXIgdmFsaWQgYml0LCBvciBzdGF5IHdyaXRlYWJsZSB3aGVuIHJl
cXVpcmVkLgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
