Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 622F05EDAE
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 22:35:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CF66E1BB;
	Wed,  3 Jul 2019 20:35:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1B6E1BB
 for <nouveau@lists.freedesktop.org>; Wed,  3 Jul 2019 20:35:13 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hilyD-0007KJ-BO; Wed, 03 Jul 2019 20:35:13 +0000
From: Christoph Hellwig <hch@lst.de>
To: bskeggs@redhat.com
Date: Wed,  3 Jul 2019 13:35:13 -0700
Message-Id: <20190703203513.22692-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6wVvKVSMYVfCvl9aNHnGnrJdrKBsm+sQjf5j3JbyT50=; b=ikgrok46t5C4CA+xVVHpukMbk
 5sZjuxLMFP9iZsNr8P3Q8NGRw3DGYCe5+w4j9xMHyjfnK/gOdKUu1JwVZL1moxEZzmly4EYpeT83v
 Ui+0EWqSNA3X1rkLJho1Bv77+qi5IDN9JUFNQcoXAytE/1fJCy/9S8CKYf7sysNV7XmhcgAktbVqw
 LZPXi4SSjCbkn2nNHT+UBtEPPJLEtP7xAuD1iBnnqZ7HFUvR5oKYmEmXVecgPAnbpuZ9wNEVdVcBv
 J88vbzRc7jQBoaz4pSWwxv/my8uX7bTzMq5+VbbRPqguph/wMxHgfezntQDtW05F6y2TsMN/8+RbY
 QvhKhTjFQ==;
Subject: [Nouveau] [PATCH] nouveau: remove bogus uses of
 DMA_ATTR_SKIP_CPU_SYNC
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RE1BX0FUVFJfU0tJUF9DUFVfU1lOQyBzaG91bGQgb25seSBiZSB1c2VkIHdoZW4gdGhlIGRyaXZl
ciBtYW51YWxseQpwZXJmb3JtcyBkbWEgY2FjaGUgbWFpbnRhaW5hbmNlIG9wZXJhdGlvbnMgdXNp
bmcgdGhlIGRtYV9zeW5jXyoKY2FsbHMuICBOb3V2ZWF1IGRvZXNuJ3QgZG8gdGhhdCwgYW5kIGdl
bmVyYWxseSBqdXN0IGFzc3VtZXMgRE1BCmlzIGNvaGVyZW50LiAgVXNlIHBsYWluIGRtYV9tYXBf
cGFnZSB3aGljaCBkb2Vzbid0IG1ha2UgdGhpcyBjb2RlCmNvcnJlY3QgYnV0IGF0IGxlYXN0IGEg
bGl0dGxlIGxlc3Mgd3JvbmcgYW5kIHNpbXBsZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2RtZW0uYyB8IDEwICsrKystLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyks
IDYgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRl
eCBiOWNlZDJlNjE2NjcuLmE1ZDliNTM3Y2JhZiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9kbWVtLmMKQEAgLTE4Niw5ICsxODYsOCBAQCBub3V2ZWF1X2RtZW1fZmF1bHRfYWxsb2Nf
YW5kX2NvcHkoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCX0KIAogCQlmYXVsdC0+ZG1h
W2ZhdWx0LT5ucGFnZXNdID0KLQkJCWRtYV9tYXBfcGFnZV9hdHRycyhkZXYsIGRwYWdlLCAwLCBQ
QUdFX1NJWkUsCi0JCQkJCSAgIFBDSV9ETUFfQklESVJFQ1RJT05BTCwKLQkJCQkJICAgRE1BX0FU
VFJfU0tJUF9DUFVfU1lOQyk7CisJCQlkbWFfbWFwX3BhZ2UoZGV2LCBkcGFnZSwgMCwgUEFHRV9T
SVpFLAorCQkJCSAgICAgUENJX0RNQV9CSURJUkVDVElPTkFMKTsKIAkJaWYgKGRtYV9tYXBwaW5n
X2Vycm9yKGRldiwgZmF1bHQtPmRtYVtmYXVsdC0+bnBhZ2VzXSkpIHsKIAkJCWRzdF9wZm5zW2ld
ID0gTUlHUkFURV9QRk5fRVJST1I7CiAJCQlfX2ZyZWVfcGFnZShkcGFnZSk7CkBAIC03MDYsOSAr
NzA1LDggQEAgbm91dmVhdV9kbWVtX21pZ3JhdGVfYWxsb2NfYW5kX2NvcHkoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsCiAJCX0KIAogCQltaWdyYXRlLT5kbWFbbWlncmF0ZS0+ZG1hX25yXSA9
Ci0JCQlkbWFfbWFwX3BhZ2VfYXR0cnMoZGV2LCBzcGFnZSwgMCwgUEFHRV9TSVpFLAotCQkJCQkg
ICBQQ0lfRE1BX0JJRElSRUNUSU9OQUwsCi0JCQkJCSAgIERNQV9BVFRSX1NLSVBfQ1BVX1NZTkMp
OworCQkJZG1hX21hcF9wYWdlKGRldiwgc3BhZ2UsIDAsIFBBR0VfU0laRSwKKwkJCQkgICAgIFBD
SV9ETUFfQklESVJFQ1RJT05BTCk7CiAJCWlmIChkbWFfbWFwcGluZ19lcnJvcihkZXYsIG1pZ3Jh
dGUtPmRtYVttaWdyYXRlLT5kbWFfbnJdKSkgewogCQkJbm91dmVhdV9kbWVtX3BhZ2VfZnJlZV9s
b2NrZWQoZHJtLCBkcGFnZSk7CiAJCQlkc3RfcGZuc1tpXSA9IDA7Ci0tIAoyLjIwLjEKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGlu
ZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
