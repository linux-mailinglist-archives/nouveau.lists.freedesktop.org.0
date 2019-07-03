Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F2815EEE5
	for <lists+nouveau@lfdr.de>; Thu,  4 Jul 2019 00:02:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D2F416E202;
	Wed,  3 Jul 2019 22:02:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C54336E204;
 Wed,  3 Jul 2019 22:02:19 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hinKS-0004Ec-6y; Wed, 03 Jul 2019 22:02:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 15:02:11 -0700
Message-Id: <20190703220214.28319-4-hch@lst.de>
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
 bh=aR5JFpbAtZwK/e60Yd9Huxe2JebEBXUD/VqFe6j363c=; b=OpDvh8ugx9CCqIn6z/3y1udmC9
 KVHOJ4bsImzFgtZfExFnufvlaVFq0giHc/vuAIxKY0IiLV8hawN4olAqJfcL1gDdEfW57uyU5nj5l
 x3GGSB43dDPINYm/NEWoe96PFuvG+2P/z1Fr7axSCD8q98G6fn0/H5jngAe4xoO/Hqe9fnlPDrQYK
 maGsjZPeEo6lxfX+g7EBD2wrEI05R7gGH9G0i/0CFtnM1uTTiOFnW1vZT+aE3Q3gNb/qwMOnPVVa+
 tpRen6TJqloiQxgbHEfAFv64GJOvH3Z05gcv5LDRyQ7BCWPwdBTu1oVT9mXca+ZqiZNiHRN1JiAaF
 aEarK4YQ==;
Subject: [Nouveau] [PATCH 3/6] nouveau: remove the block parameter to
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

VGhlIHBhcmFtZXRlciBpcyBhbHdheXMgZmFsc2UsIHNvIHJlbW92ZSBpdCBhcyB3ZWxsIGFzIHRo
ZSAtRUFHQUlOCmhhbmRsaW5nIHRoYXQgY2FuIG9ubHkgaGFwcGVuIGZvciB0aGUgbm9uLWJsb2Nr
aW5nIGNhc2UuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgNyArKystLS0tCiAx
IGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCmluZGV4IDAzM2E5MjQxYTE0YS4uOWE5ZjcxZTRiZTI5
IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKQEAgLTQ5MSw4ICs0OTEsNyBA
QCBzdGF0aWMgaW5saW5lIGJvb2wgbm91dmVhdV9yYW5nZV9kb25lKHN0cnVjdCBobW1fcmFuZ2Ug
KnJhbmdlKQogfQogCiBzdGF0aWMgaW50Ci1ub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1f
bWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAotCQkgICAgYm9vbCBibG9j
aykKK25vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0
IGhtbV9yYW5nZSAqcmFuZ2UpCiB7CiAJbG9uZyByZXQ7CiAKQEAgLTUxMCw3ICs1MDksNyBAQCBu
b3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1f
cmFuZ2UgKnJhbmdlLAogCQlyZXR1cm4gLUVBR0FJTjsKIAl9CiAKLQlyZXQgPSBobW1fcmFuZ2Vf
ZmF1bHQocmFuZ2UsIGJsb2NrKTsKKwlyZXQgPSBobW1fcmFuZ2VfZmF1bHQocmFuZ2UsIHRydWUp
OwogCWlmIChyZXQgPD0gMCkgewogCQlpZiAocmV0ID09IC1FQlVTWSB8fCAhcmV0KSB7CiAJCQl1
cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwpAQCAtNjk3LDcgKzY5Niw3IEBA
IG5vdXZlYXVfc3ZtX2ZhdWx0KHN0cnVjdCBudmlmX25vdGlmeSAqbm90aWZ5KQogCQlyYW5nZS52
YWx1ZXMgPSBub3V2ZWF1X3N2bV9wZm5fdmFsdWVzOwogCQlyYW5nZS5wZm5fc2hpZnQgPSBOVklG
X1ZNTV9QRk5NQVBfVjBfQUREUl9TSElGVDsKIGFnYWluOgotCQlyZXQgPSBub3V2ZWF1X3Jhbmdl
X2ZhdWx0KCZzdm1tLT5taXJyb3IsICZyYW5nZSwgdHJ1ZSk7CisJCXJldCA9IG5vdXZlYXVfcmFu
Z2VfZmF1bHQoJnN2bW0tPm1pcnJvciwgJnJhbmdlKTsKIAkJaWYgKHJldCA9PSAwKSB7CiAJCQlt
dXRleF9sb2NrKCZzdm1tLT5tdXRleCk7CiAJCQlpZiAoIW5vdXZlYXVfcmFuZ2VfZG9uZSgmcmFu
Z2UpKSB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
