Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 673DC7288C
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 08:53:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C46356E45C;
	Wed, 24 Jul 2019 06:53:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 164E86E459;
 Wed, 24 Jul 2019 06:53:17 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqB9G-0004Jk-1l; Wed, 24 Jul 2019 06:53:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 24 Jul 2019 08:52:55 +0200
Message-Id: <20190724065258.16603-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724065258.16603-1-hch@lst.de>
References: <20190724065258.16603-1-hch@lst.de>
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
 bh=OKQjQZNsY1fevItiyMnAbjI1iamy6YdinwRbq9yBGVU=; b=DAL1H9X37yVytHCPB4G34fgHgw
 f4KZFwd9A4d0cKrfI1i7CUJCG840Ln0mEXPdeYL44trM7bHs9qwiHbF3TxxesmvA1fQZMCVdAGThz
 xtwIzl+2xTdBFdk13/H3mgXI4jmkC54OsNOAeU/WscWj8k7rXOcn4o1pVkTc+cVJxW81/EkoywxsA
 mz/Q6TH9iCrd0DdEL67eyjr8RW7uD8RdDPIt7i/GfCybmcD3VJJ7TKRgHPYZeTfjlrdpFVi6sUDnm
 GaJ9+tkhmgc5dIRddICKPRVHZnbLP5QjyZTFXUc1SXOrAo4nsgnuivXn1T4osetkxmYSwdWjkGwox
 SwYGjFuQ==;
Subject: [Nouveau] [PATCH 4/7] nouveau: unlock mmap_sem on all errors from
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
ZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDExICsrKysr
Ky0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4IGUzMDk3NDkyYjRhZC4uYTgz
NWNlYmI2ZDkwIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2
bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKQEAgLTQ5NSw4
ICs0OTUsMTAgQEAgbm91dmVhdV9yYW5nZV9mYXVsdChzdHJ1Y3QgaG1tX21pcnJvciAqbWlycm9y
LCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAlyZXQgPSBobW1fcmFuZ2VfcmVnaXN0ZXIocmFu
Z2UsIG1pcnJvciwKIAkJCQkgcmFuZ2UtPnN0YXJ0LCByYW5nZS0+ZW5kLAogCQkJCSBQQUdFX1NI
SUZUKTsKLQlpZiAocmV0KQorCWlmIChyZXQpIHsKKwkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1f
bW0tPm1tYXBfc2VtKTsKIAkJcmV0dXJuIChpbnQpcmV0OworCX0KIAogCWlmICghaG1tX3Jhbmdl
X3dhaXRfdW50aWxfdmFsaWQocmFuZ2UsIEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQpKSB7CiAJ
CXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7CkBAIC01MDUsMTAgKzUwNyw5
IEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UpCiAKIAlyZXQgPSBobW1fcmFuZ2VfZmF1bHQocmFuZ2UsIHRydWUp
OwogCWlmIChyZXQgPD0gMCkgewotCQlpZiAocmV0ID09IC1FQlVTWSB8fCAhcmV0KSB7Ci0JCQl1
cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOworCQlpZiAocmV0ID09IDApCiAJ
CQlyZXQgPSAtRUJVU1k7Ci0JCX0KKwkJdXBfcmVhZCgmcmFuZ2UtPnZtYS0+dm1fbW0tPm1tYXBf
c2VtKTsKIAkJaG1tX3JhbmdlX3VucmVnaXN0ZXIocmFuZ2UpOwogCQlyZXR1cm4gcmV0OwogCX0K
QEAgLTcwNiw4ICs3MDcsOCBAQCBub3V2ZWF1X3N2bV9mYXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkg
Km5vdGlmeSkKIAkJCQkJCU5VTEwpOwogCQkJc3ZtbS0+dm1tLT52bW0ub2JqZWN0LmNsaWVudC0+
c3VwZXIgPSBmYWxzZTsKIAkJCW11dGV4X3VubG9jaygmc3ZtbS0+bXV0ZXgpOworCQkJdXBfcmVh
ZCgmc3ZtbS0+bW0tPm1tYXBfc2VtKTsKIAkJfQotCQl1cF9yZWFkKCZzdm1tLT5tbS0+bW1hcF9z
ZW0pOwogCiAJCS8qIENhbmNlbCBhbnkgZmF1bHRzIGluIHRoZSB3aW5kb3cgd2hvc2UgcGFnZXMg
ZGlkbid0IG1hbmFnZQogCQkgKiB0byBrZWVwIHRoZWlyIHZhbGlkIGJpdCwgb3Igc3RheSB3cml0
ZWFibGUgd2hlbiByZXF1aXJlZC4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
