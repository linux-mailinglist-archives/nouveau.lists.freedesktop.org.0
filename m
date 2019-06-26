Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E3E1E568FE
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:28:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4FFBC6E3F4;
	Wed, 26 Jun 2019 12:28:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B6CAF6E3F4;
 Wed, 26 Jun 2019 12:28:23 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg72C-0001bU-3z; Wed, 26 Jun 2019 12:28:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:19 +0200
Message-Id: <20190626122724.13313-21-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626122724.13313-1-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
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
 bh=Q+TYvRiX1OhT+BScY8OczmwoERZbakk+9rslWoznBYs=; b=e1I2Wme7Ox3SphXo/U291LQsFi
 3MsV4dR6yO4KCQ2FSAu9/N4uNapXRXs4dz5vWPTNn9ZH7fPwZipzQi6fhI8Ahdaljbwgv8TKqjmXy
 iKSKLEl5eN3aNB5BKVY6ZDuPBgqiMxHFj8zu/PfbrJi+Xtpji+RaiGnOKIVP+UaYs1dxMiAc3tNMj
 xepXmBCES099SHbE2RluDL2qHrXXOo3qYkTaXO9Ys5YBarsJezAR4o94rn4r7aSSJiEUq27AMLr7Q
 Sfv5eRswkyXs4C0cmqD2h6WkAQ+t0O12yKFFanMfEUC3M8QOGS50Xyrtpl16hCtphB5Nujt/+/gJl
 +J5cCWZw==;
Subject: [Nouveau] [PATCH 20/25] mm: remove hmm_vma_alloc_locked_page
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIG9ubHkgdXNlciBvZiBpdCBoYXMganVzdCBiZWVuIHJlbW92ZWQsIGFuZCB0aGVyZSB3YXNu
J3QgcmVhbGx5IGFueSBuZWVkCnRvIHdyYXAgYSBiYXNpYyBtZW1vcnkgYWxsb2NhdG9yIHRvIHN0
YXJ0IHdpdGguCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oIHwgIDMgLS0tCiBtbS9obW0uYyAgICAgICAgICAgIHwg
MTQgLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXgg
YmExOWMxOWUyNGVkLi4xZDU1YjdlYTJkYTYgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaG1t
LmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNTg3LDkgKzU4Nyw2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1Y3QgbW1fc3RydWN0ICptbSkge30KICNpZiBJU19F
TkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkKIHN0cnVjdCBobW1fZGV2bWVtOwogCi1zdHJ1
Y3QgcGFnZSAqaG1tX3ZtYV9hbGxvY19sb2NrZWRfcGFnZShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3Qg
KnZtYSwKLQkJCQkgICAgICAgdW5zaWduZWQgbG9uZyBhZGRyKTsKLQogLyoKICAqIHN0cnVjdCBo
bW1fZGV2bWVtX29wcyAtIGNhbGxiYWNrIGZvciBaT05FX0RFVklDRSBtZW1vcnkgZXZlbnRzCiAg
KgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBlNDQ3MDQ2MjI5OGYuLmZk
YmQ0ODc3MTI5MiAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTEzMzAs
MjAgKzEzMzAsNiBAQCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9kbWFfdW5tYXApOwogCiAKICNp
ZiBJU19FTkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkKLXN0cnVjdCBwYWdlICpobW1fdm1h
X2FsbG9jX2xvY2tlZF9wYWdlKHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAotCQkJCSAgICAg
ICB1bnNpZ25lZCBsb25nIGFkZHIpCi17Ci0Jc3RydWN0IHBhZ2UgKnBhZ2U7Ci0KLQlwYWdlID0g
YWxsb2NfcGFnZV92bWEoR0ZQX0hJR0hVU0VSLCB2bWEsIGFkZHIpOwotCWlmICghcGFnZSkKLQkJ
cmV0dXJuIE5VTEw7Ci0JbG9ja19wYWdlKHBhZ2UpOwotCXJldHVybiBwYWdlOwotfQotRVhQT1JU
X1NZTUJPTChobW1fdm1hX2FsbG9jX2xvY2tlZF9wYWdlKTsKLQotCiBzdGF0aWMgdm9pZCBobW1f
ZGV2bWVtX3JlZl9yZWxlYXNlKHN0cnVjdCBwZXJjcHVfcmVmICpyZWYpCiB7CiAJc3RydWN0IGht
bV9kZXZtZW0gKmRldm1lbTsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
