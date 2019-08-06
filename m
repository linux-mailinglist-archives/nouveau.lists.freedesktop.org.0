Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0EF328363B
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 906356E446;
	Tue,  6 Aug 2019 16:06:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E9156E41D;
 Tue,  6 Aug 2019 16:06:28 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yi-0000cX-Ex; Tue, 06 Aug 2019 16:06:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:49 +0300
Message-Id: <20190806160554.14046-12-hch@lst.de>
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
 bh=e9aFg9y3NWAnc2PsHRJxtyHwhE0a0AbbxTY4a2BFPAw=; b=TdJihcN0imUrB+DXTgmH0YwTUb
 lhLq60JHilI/KNarxExvblJfGtJD/KeWw1YixvJmmQjZxBo3be+cmgsarEog2qaCkGzoYPJY6s8qs
 zDZh/xO+rJ1KZCNRLgq3pmAluvXZ31iOXadZOdkkZWIPMLgaTQONiL10gRria1wqAe3NyDFV1xDmY
 lHYDcFCpFmiKOrErT1VtfkzdIfcB6wRbYd0gXaFxWTUZ19blXt2ymzvsasYfbVxQsnFGJeH5AWd0S
 OPiYzPzKK5xu5e0oJQoArM98BctBcV8Y0EJN1AwB6LCKDlcmolgWN0XhXCXtGgkezGIKL8Zu2VFTc
 qp692nQg==;
Subject: [Nouveau] [PATCH 11/15] mm: cleanup the hmm_vma_handle_pmd stub
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

U3R1YiBvdXQgdGhlIHdob2xlIGZ1bmN0aW9uIHdoZW4gQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQ
QUdFIGlzIG5vdCBzZXQKdG8gbWFrZSB0aGUgZnVuY3Rpb24gZWFzaWVyIHRvIHJlYWQuCgpTaWdu
ZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBtbS9obW0uYyB8
IDE4ICsrKysrKysrLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwg
MTAgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCA1
ZTdhZmU2ODUyMTMuLjRhYTcxMzVmMTA5NCAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0v
aG1tLmMKQEAgLTQ1NSwxMyArNDU1LDEwIEBAIHN0YXRpYyBpbmxpbmUgdWludDY0X3QgcG1kX3Rv
X2htbV9wZm5fZmxhZ3Moc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIHBtZF90IHBtZCkKIAkJCQly
YW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF07CiB9CiAKLXN0YXRpYyBpbnQgaG1tX3ZtYV9oYW5k
bGVfcG1kKHN0cnVjdCBtbV93YWxrICp3YWxrLAotCQkJICAgICAgdW5zaWduZWQgbG9uZyBhZGRy
LAotCQkJICAgICAgdW5zaWduZWQgbG9uZyBlbmQsCi0JCQkgICAgICB1aW50NjRfdCAqcGZucywK
LQkJCSAgICAgIHBtZF90IHBtZCkKLXsKICNpZmRlZiBDT05GSUdfVFJBTlNQQVJFTlRfSFVHRVBB
R0UKK3N0YXRpYyBpbnQgaG1tX3ZtYV9oYW5kbGVfcG1kKHN0cnVjdCBtbV93YWxrICp3YWxrLCB1
bnNpZ25lZCBsb25nIGFkZHIsCisJCXVuc2lnbmVkIGxvbmcgZW5kLCB1aW50NjRfdCAqcGZucywg
cG1kX3QgcG1kKQorewogCXN0cnVjdCBobW1fdm1hX3dhbGsgKmhtbV92bWFfd2FsayA9IHdhbGst
PnByaXZhdGU7CiAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1hX3dhbGstPnJhbmdl
OwogCXN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPSBOVUxMOwpAQCAtNDkwLDExICs0ODcsMTIg
QEAgc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0IG1tX3dhbGsgKndhbGssCiAJ
CXB1dF9kZXZfcGFnZW1hcChwZ21hcCk7CiAJaG1tX3ZtYV93YWxrLT5sYXN0ID0gZW5kOwogCXJl
dHVybiAwOwotI2Vsc2UKLQkvKiBJZiBUSFAgaXMgbm90IGVuYWJsZWQgdGhlbiB3ZSBzaG91bGQg
bmV2ZXIgcmVhY2ggdGhpcyBjb2RlICEgKi8KLQlyZXR1cm4gLUVJTlZBTDsKLSNlbmRpZgogfQor
I2Vsc2UgLyogQ09ORklHX1RSQU5TUEFSRU5UX0hVR0VQQUdFICovCisvKiBzdHViIHRvIGFsbG93
IHRoZSBjb2RlIGJlbG93IHRvIGNvbXBpbGUgKi8KK2ludCBobW1fdm1hX2hhbmRsZV9wbWQoc3Ry
dWN0IG1tX3dhbGsgKndhbGssIHVuc2lnbmVkIGxvbmcgYWRkciwKKwkJdW5zaWduZWQgbG9uZyBl
bmQsIHVpbnQ2NF90ICpwZm5zLCBwbWRfdCBwbWQpOworI2VuZGlmIC8qIENPTkZJR19UUkFOU1BB
UkVOVF9IVUdFUEFHRSAqLwogCiBzdGF0aWMgaW5saW5lIHVpbnQ2NF90IHB0ZV90b19obW1fcGZu
X2ZsYWdzKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCBwdGVfdCBwdGUpCiB7Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
