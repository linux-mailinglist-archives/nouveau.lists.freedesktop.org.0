Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 97DC38362E
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03E5A6E419;
	Tue,  6 Aug 2019 16:06:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C0AE6E3FC;
 Tue,  6 Aug 2019 16:06:07 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yO-0000X0-0k; Tue, 06 Aug 2019 16:06:04 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:41 +0300
Message-Id: <20190806160554.14046-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806160554.14046-1-hch@lst.de>
References: <20190806160554.14046-1-hch@lst.de>
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
 bh=jw2njJjxDN00xjjd9oeT2JTOUWmPpUSj71zvFEWivDw=; b=cmioyjZCRaAvXECnpQCfCtKV3C
 K6YAmV14z7KzaLLRcZnOGNm3ot7ObXpIslQKkBo302RvxpCZ57t1lyfgPMlq0K6LpFLAnnuXnxN2l
 oK6v0GVmq4XYrQlvovjELgFqZz8EvXaxN7ZAD+Zzn5q9BWmWt0Bj9Ng4wanLQM9xg9QLPubAnfYfs
 o87f0v3ABw2MP8ipKyGHf5hthuEMCBJiFKlblJH1sngrV+4+Yt59Ls/zba8gozAbC/+Xx83B8UIBT
 qbQ8T3GYeHHLhVMf6okW/RCk/RAHVfakdX+WZ43C01pgYavVeXeSjx5UpdazVVL0bwLYw0obZTQhj
 gvK/DVXQ==;
Subject: [Nouveau] [PATCH 03/15] nouveau: pass struct nouveau_svmm to
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2UnbGwgbmVlZCB0aGUgbm91dmVhdV9zdm1tIHN0cnVjdHVyZSB0byBpbXByb3ZlIHRoZSBmdW5j
dGlvbiBzb29uLgpGb3Igbm93IHRoaXMgYWxsb3dzIHVzaW5nIHRoZSBzdm1tLT5tbSByZWZlcmVu
Y2UgdG8gdW5sb2NrIHRoZQptbWFwX3NlbSwgYW5kIHRodXMgdGhlIHNhbWUgZGVyZWZlcmVuY2Ug
Y2hhaW4gdGhhdCB0aGUgY2FsbGVyIHVzZXMKdG8gbG9jayBhbmQgdW5sb2NrIGl0LgoKU2lnbmVk
LW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDEyICsrKysrKy0tLS0tLQogMSBmaWxlIGNoYW5n
ZWQsIDYgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9zdm0uYwppbmRleCBhNzQ1MzBiNWE1MjMuLjk4MDcyZmQ0OGNmNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYworKysgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBAIC00ODUsMjMgKzQ4NSwyMyBAQCBub3V2ZWF1
X3JhbmdlX2RvbmUoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiB9CiAKIHN0YXRpYyBpbnQKLW5v
dXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9y
YW5nZSAqcmFuZ2UpCitub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBub3V2ZWF1X3N2bW0gKnN2
bW0sIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogewogCWxvbmcgcmV0OwogCiAJcmFuZ2UtPmRl
ZmF1bHRfZmxhZ3MgPSAwOwogCXJhbmdlLT5wZm5fZmxhZ3NfbWFzayA9IC0xVUw7CiAKLQlyZXQg
PSBobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwKKwlyZXQgPSBobW1fcmFuZ2VfcmVn
aXN0ZXIocmFuZ2UsICZzdm1tLT5taXJyb3IsCiAJCQkJIHJhbmdlLT5zdGFydCwgcmFuZ2UtPmVu
ZCwKIAkJCQkgUEFHRV9TSElGVCk7CiAJaWYgKHJldCkgewotCQl1cF9yZWFkKCZyYW5nZS0+aG1t
LT5tbS0+bW1hcF9zZW0pOworCQl1cF9yZWFkKCZzdm1tLT5tbS0+bW1hcF9zZW0pOwogCQlyZXR1
cm4gKGludClyZXQ7CiAJfQogCiAJaWYgKCFobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChyYW5n
ZSwgSE1NX1JBTkdFX0RFRkFVTFRfVElNRU9VVCkpIHsKLQkJdXBfcmVhZCgmcmFuZ2UtPmhtbS0+
bW0tPm1tYXBfc2VtKTsKKwkJdXBfcmVhZCgmc3ZtbS0+bW0tPm1tYXBfc2VtKTsKIAkJcmV0dXJu
IC1FQlVTWTsKIAl9CiAKQEAgLTUwOSw3ICs1MDksNyBAQCBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0
cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCWlmIChy
ZXQgPD0gMCkgewogCQlpZiAocmV0ID09IDApCiAJCQlyZXQgPSAtRUJVU1k7Ci0JCXVwX3JlYWQo
JnJhbmdlLT5obW0tPm1tLT5tbWFwX3NlbSk7CisJCXVwX3JlYWQoJnN2bW0tPm1tLT5tbWFwX3Nl
bSk7CiAJCWhtbV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsKIAkJcmV0dXJuIHJldDsKIAl9CkBA
IC02ODksNyArNjg5LDcgQEAgbm91dmVhdV9zdm1fZmF1bHQoc3RydWN0IG52aWZfbm90aWZ5ICpu
b3RpZnkpCiAJCXJhbmdlLnZhbHVlcyA9IG5vdXZlYXVfc3ZtX3Bmbl92YWx1ZXM7CiAJCXJhbmdl
LnBmbl9zaGlmdCA9IE5WSUZfVk1NX1BGTk1BUF9WMF9BRERSX1NISUZUOwogYWdhaW46Ci0JCXJl
dCA9IG5vdXZlYXVfcmFuZ2VfZmF1bHQoJnN2bW0tPm1pcnJvciwgJnJhbmdlKTsKKwkJcmV0ID0g
bm91dmVhdV9yYW5nZV9mYXVsdChzdm1tLCAmcmFuZ2UpOwogCQlpZiAocmV0ID09IDApIHsKIAkJ
CW11dGV4X2xvY2soJnN2bW0tPm11dGV4KTsKIAkJCWlmICghbm91dmVhdV9yYW5nZV9kb25lKCZy
YW5nZSkpIHsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
