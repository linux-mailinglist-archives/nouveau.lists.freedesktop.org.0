Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C1B47A0A1
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7776989FD7;
	Tue, 30 Jul 2019 05:52:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 226E26E3E7;
 Tue, 30 Jul 2019 05:52:27 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3f-00015T-Jl; Tue, 30 Jul 2019 05:52:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:51:53 +0300
Message-Id: <20190730055203.28467-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730055203.28467-1-hch@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
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
 bh=bXbV3qDGfzrx7WoIjFecJlqT5ZuyvFJhVzdpdqMjsLk=; b=P6NBNZSercDK8PYpn8hH4MT1dI
 LpeRr03gX2BviYGoHk1vN9m29L2aP2JhMjHHKYLSgQm/itVvfO8okrbldueEpgHoKa86lEIRMpOb3
 Vadg+4NxBVvm9X02muhLuK9XEa07t1zyqX82xhH+XnZCyZUzTvEDSdfex9WY0BKYXunC85J5XmVjC
 h+fn0T7fEHa9Kh7H8LMhMwKH6XegmVI8DqDmLPtmEV4p+LQ9BAyqkcXhjbIGixsN6bXWtF7i7uc2Q
 6n/rnpFHFsp8rPWmIOvJj+RA9WpDkFQkiAYcd6WMzaNCgY+bK/6n3141sAZN02rOHPPE+SpY+MKVp
 HCEwdPvA==;
Subject: [Nouveau] [PATCH 03/13] nouveau: pass struct nouveau_svmm to
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

VGhpcyBhdm9pZCBoYXZpbmcgdG8gYWJ1c2UgdGhlIHZtYSBmaWVsZCBpbiBzdHJ1Y3QgaG1tX3Jh
bmdlIHRvIHVubG9jawp0aGUgbW1hcF9zZW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVs
bHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2
bS5jIHwgNiArKystLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0u
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKaW5kZXggYTc0NTMwYjVh
NTIzLi5iODg5ZDVlYzRjN2UgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwpA
QCAtNDg1LDE0ICs0ODUsMTQgQEAgbm91dmVhdV9yYW5nZV9kb25lKHN0cnVjdCBobW1fcmFuZ2Ug
KnJhbmdlKQogfQogCiBzdGF0aWMgaW50Ci1ub3V2ZWF1X3JhbmdlX2ZhdWx0KHN0cnVjdCBobW1f
bWlycm9yICptaXJyb3IsIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQorbm91dmVhdV9yYW5nZV9m
YXVsdChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpzdm1tLCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkK
IHsKIAlsb25nIHJldDsKIAogCXJhbmdlLT5kZWZhdWx0X2ZsYWdzID0gMDsKIAlyYW5nZS0+cGZu
X2ZsYWdzX21hc2sgPSAtMVVMOwogCi0JcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCBt
aXJyb3IsCisJcmV0ID0gaG1tX3JhbmdlX3JlZ2lzdGVyKHJhbmdlLCAmc3ZtbS0+bWlycm9yLAog
CQkJCSByYW5nZS0+c3RhcnQsIHJhbmdlLT5lbmQsCiAJCQkJIFBBR0VfU0hJRlQpOwogCWlmIChy
ZXQpIHsKQEAgLTY4OSw3ICs2ODksNyBAQCBub3V2ZWF1X3N2bV9mYXVsdChzdHJ1Y3QgbnZpZl9u
b3RpZnkgKm5vdGlmeSkKIAkJcmFuZ2UudmFsdWVzID0gbm91dmVhdV9zdm1fcGZuX3ZhbHVlczsK
IAkJcmFuZ2UucGZuX3NoaWZ0ID0gTlZJRl9WTU1fUEZOTUFQX1YwX0FERFJfU0hJRlQ7CiBhZ2Fp
bjoKLQkJcmV0ID0gbm91dmVhdV9yYW5nZV9mYXVsdCgmc3ZtbS0+bWlycm9yLCAmcmFuZ2UpOwor
CQlyZXQgPSBub3V2ZWF1X3JhbmdlX2ZhdWx0KHN2bW0sICZyYW5nZSk7CiAJCWlmIChyZXQgPT0g
MCkgewogCQkJbXV0ZXhfbG9jaygmc3ZtbS0+bXV0ZXgpOwogCQkJaWYgKCFub3V2ZWF1X3Jhbmdl
X2RvbmUoJnJhbmdlKSkgewotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
