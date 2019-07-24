Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 274E17288B
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 08:53:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B634A6E457;
	Wed, 24 Jul 2019 06:53:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B5CAD6E456;
 Wed, 24 Jul 2019 06:53:13 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqB9C-0004Im-Vl; Wed, 24 Jul 2019 06:53:11 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 24 Jul 2019 08:52:54 +0200
Message-Id: <20190724065258.16603-4-hch@lst.de>
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
 bh=D+fP/F31jlLUpmTEYvyqj+ufxmWFwYqwn3YRw+jITpw=; b=jAXuPct3oZWPyrvKK3RTq9yLMe
 P2SmrkMDBWs6EzLWrm9lZ9k9SfmUYWYPCzUjb0f4YJ5DEYdtHpJw2XFK00/7Es6CRRPhrKus/bt6c
 ER4cSvKLREXQtEc2scthDU97dFARRALlDnGlcVP8h/paihFvZ3vnN1u/ovubU485ouuzVtqwtDeHM
 q+w6iPsQcfcslsyLIsVOjOzhLjBg8m5p4lQB5sSF2bSlabyPXzWNGEKOZixnFNCj/2bdhtQLiIlHP
 3eODQlxrYKbSQ9cm/iar+AUA0hyO1Zrnswpv+8SLpPooWcr2s+GkE28X2/VeMCEw9pjvwKyYM8EaX
 F4rsi4WQ==;
Subject: [Nouveau] [PATCH 3/7] nouveau: remove the block parameter to
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
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgMTAgKysrKy0tLS0t
LQogMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwppbmRleCA2YzFiMDRkZTBkYjguLmUzMDk3NDky
YjRhZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwor
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCkBAIC00ODUsOCArNDg1
LDcgQEAgbm91dmVhdV9yYW5nZV9kb25lKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogfQogCiBz
dGF0aWMgaW50Ci1ub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1fbWlycm9yICptaXJyb3Is
IHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAotCQkgICAgYm9vbCBibG9jaykKK25vdXZlYXVfcmFu
Z2VfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFu
Z2UpCiB7CiAJbG9uZyByZXQ7CiAKQEAgLTUwNCwxMyArNTAzLDEyIEBAIG5vdXZlYXVfcmFuZ2Vf
ZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Us
CiAJCXJldHVybiAtRUFHQUlOOwogCX0KIAotCXJldCA9IGhtbV9yYW5nZV9mYXVsdChyYW5nZSwg
YmxvY2spOworCXJldCA9IGhtbV9yYW5nZV9mYXVsdChyYW5nZSwgdHJ1ZSk7CiAJaWYgKHJldCA8
PSAwKSB7CiAJCWlmIChyZXQgPT0gLUVCVVNZIHx8ICFyZXQpIHsKIAkJCXVwX3JlYWQoJnJhbmdl
LT52bWEtPnZtX21tLT5tbWFwX3NlbSk7CiAJCQlyZXQgPSAtRUJVU1k7Ci0JCX0gZWxzZSBpZiAo
cmV0ID09IC1FQUdBSU4pCi0JCQlyZXQgPSAtRUJVU1k7CisJCX0KIAkJaG1tX3JhbmdlX3VucmVn
aXN0ZXIocmFuZ2UpOwogCQlyZXR1cm4gcmV0OwogCX0KQEAgLTY5MSw3ICs2ODksNyBAQCBub3V2
ZWF1X3N2bV9mYXVsdChzdHJ1Y3QgbnZpZl9ub3RpZnkgKm5vdGlmeSkKIAkJcmFuZ2UudmFsdWVz
ID0gbm91dmVhdV9zdm1fcGZuX3ZhbHVlczsKIAkJcmFuZ2UucGZuX3NoaWZ0ID0gTlZJRl9WTU1f
UEZOTUFQX1YwX0FERFJfU0hJRlQ7CiBhZ2FpbjoKLQkJcmV0ID0gbm91dmVhdV9yYW5nZV9mYXVs
dCgmc3ZtbS0+bWlycm9yLCAmcmFuZ2UsIHRydWUpOworCQlyZXQgPSBub3V2ZWF1X3JhbmdlX2Zh
dWx0KCZzdm1tLT5taXJyb3IsICZyYW5nZSk7CiAJCWlmIChyZXQgPT0gMCkgewogCQkJbXV0ZXhf
bG9jaygmc3ZtbS0+bXV0ZXgpOwogCQkJaWYgKCFub3V2ZWF1X3JhbmdlX2RvbmUoJnJhbmdlKSkg
ewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
