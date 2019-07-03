Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8076E5EEEC
	for <lists+nouveau@lfdr.de>; Thu,  4 Jul 2019 00:02:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C55ED6E20B;
	Wed,  3 Jul 2019 22:02:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87F716E21A;
 Wed,  3 Jul 2019 22:02:21 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hinKS-0004Eh-Da; Wed, 03 Jul 2019 22:02:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 15:02:12 -0700
Message-Id: <20190703220214.28319-5-hch@lst.de>
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
 bh=TH7ilSpN+2j82AKqVSfBr/e3/+W2L5xJvYOO3yTY4Is=; b=QkYiGjbMBjTGLVROOh+GRbmRJb
 MyoPGFJE+6teMNn9c5SEVHNaLJh/dDNSFYCEY+IvBJKEGW9ohDBcsp6CVPN0VrZ0J7fDngCYsPSv4
 CTcFISy34r27v4v0H03+M4tT46hjxR7FS9ebz/zaYpADue3mFBLXKkQiySiYo0OXMfYuIEZSyIeYM
 BCuxayLeVqoTiSZtVLEC80SQUqJFqA/SAdaH6UO6w3Q1gsl//cwPUe6JlfqruSzJ+jjOQ7dz9kSgZ
 fn9KEBBzwR+rePovn050pvLCHNfewpmtkFC8H0ZPqp/ZOMDz4QtUvPdjcKRyVJo7D+Wq8Gx7oUV5c
 ydw5RV1w==;
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
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwppbmRleCA5YTlmNzFlNGJlMjkuLmQ5
N2Q4NjJlOGI3ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9z
dm0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBAIC01MDEs
OCArNTAxLDEwIEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJv
ciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAJcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJh
bmdlLCBtaXJyb3IsCiAJCQkJIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVuZCwKIAkJCQkgUEFHRV9T
SElGVCk7Ci0JaWYgKHJldCkKKwlpZiAocmV0KSB7CisJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZt
X21tLT5tbWFwX3NlbSk7CiAJCXJldHVybiAoaW50KXJldDsKKwl9CiAKIAlpZiAoIWhtbV9yYW5n
ZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBOT1VWRUFVX1JBTkdFX0ZBVUxUX1RJTUVPVVQpKSB7
CiAJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7CkBAIC01MTEsMTEgKzUx
Myw5IEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAKIAlyZXQgPSBobW1fcmFuZ2VfZmF1bHQocmFuZ2UsIHRy
dWUpOwogCWlmIChyZXQgPD0gMCkgewotCQlpZiAocmV0ID09IC1FQlVTWSB8fCAhcmV0KSB7Ci0J
CQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwotCQkJcmV0ID0gLUVCVVNZ
OwotCQl9IGVsc2UgaWYgKHJldCA9PSAtRUFHQUlOKQorCQlpZiAocmV0ID09IDApCiAJCQlyZXQg
PSAtRUJVU1k7CisJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7CiAJCWht
bV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBAIC03MTMsOCAr
NzEzLDggQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpub3RpZnkpCiAJ
CQkJCQlOVUxMKTsKIAkJCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gZmFs
c2U7CiAJCQltdXRleF91bmxvY2soJnN2bW0tPm11dGV4KTsKKwkJCXVwX3JlYWQoJnN2bW0tPm1t
LT5tbWFwX3NlbSk7CiAJCX0KLQkJdXBfcmVhZCgmc3ZtbS0+bW0tPm1tYXBfc2VtKTsKIAogCQkv
KiBDYW5jZWwgYW55IGZhdWx0cyBpbiB0aGUgd2luZG93IHdob3NlIHBhZ2VzIGRpZG4ndCBtYW5h
Z2UKIAkJICogdG8ga2VlcCB0aGVpciB2YWxpZCBiaXQsIG9yIHN0YXkgd3JpdGVhYmxlIHdoZW4g
cmVxdWlyZWQuCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
