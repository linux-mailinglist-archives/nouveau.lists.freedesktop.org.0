Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6F55EBDF
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:45:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E385E6E1B3;
	Wed,  3 Jul 2019 18:45:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A48336E1A4;
 Wed,  3 Jul 2019 18:45:09 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hikFb-0007Gl-TU; Wed, 03 Jul 2019 18:45:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 11:45:01 -0700
Message-Id: <20190703184502.16234-5-hch@lst.de>
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
 bh=pfzb7DKQGxSim4j5P5NViAehCYDnD7twhlehxZF4/mk=; b=RuEQvC5Szk3Lm7vVbLr+MfSSqa
 XBkXs0IYy8wwiP8zUJ+sptGQCbIJgaonwPKADc6EYKfe8cyLXuX6OJAXDLaSAqo00fEJgivMA8G9r
 Jp3rCAEIlz5o5MUoRMlgjCGuRlKGShwoKhkln491IBgIkVFD2jgvlsNTOIVjVI9KsBedL8bGACTAc
 Y6LiYyZQM8WHHYqbip9c8930hWAY1B3O4CF9CFWJhVXPoSCnctq2177N1Vc5lVbLit4yJeQh82Csg
 Uw0Xc8TeK5lNphU2JBlRLkMw4VS923+E5sYbHWFj/v3i0IpK3DbzoSl+Hs3Td3pWdzq4YCGK8hnn6
 B82DJdiA==;
Subject: [Nouveau] [PATCH 4/5] nouveau: unlock mmap_sem on all errors from
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
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
