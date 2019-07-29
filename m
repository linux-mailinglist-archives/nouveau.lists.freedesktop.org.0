Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8055D78DF4
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E6242892BD;
	Mon, 29 Jul 2019 14:29:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20780891AB;
 Mon, 29 Jul 2019 14:29:23 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6eN-0006P2-Jm; Mon, 29 Jul 2019 14:29:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:43 +0300
Message-Id: <20190729142843.22320-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729142843.22320-1-hch@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
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
 bh=UZ1iiZ91D5ta7woyBUt0JspQpjAYy1irdMsZOOrHXMc=; b=PsKqXUcN7z7Xz9gU7L79usjrqd
 1TEUjHamWsPT+rB4y+/yJm/EmvCFSl7ml+1TBJeGQpJ7BwVxO9wF2ewwlhrRVlZhQ2fn7eM4nvSru
 Htj0+NqPiUUfos5bsZ+wlkRab0SxVL9RrtXQZ0X5t45PUuUj7wuHcCn43N+m+i27dIdLRZryJCjb+
 p41WXKWECLMO9LZLn3XL4a/cY1LJKbqbDtDs9Mnwi1jx/mtoDZJwIzftrtvBMEa3DqdCL4xlxrb9T
 Pn5dnuGhyiDr2tSO2dx5kndNT3pjthrpWfVIQvSgWUpbBrW0LeWUm490FPAwN1pfH7BrK6o7UT0aq
 y3B5AiUQ==;
Subject: [Nouveau] [PATCH 9/9] mm: remove the MIGRATE_PFN_WRITE flag
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIE1JR1JBVEVfUEZOX1dSSVRFIGlzIG9ubHkgdXNlZCBsb2NhbGx5IGluIG1pZ3JhdGVfdm1h
X2NvbGxlY3RfcG1kLAp3aGVyZSBpdCBjYW4gYmUgcmVwbGFjZWQgd2l0aCBhIHNpbXBsZSBib29s
ZWFuIGxvY2FsIHZhcmlhYmxlLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Ci0tLQogaW5jbHVkZS9saW51eC9taWdyYXRlLmggfCAxIC0KIG1tL21pZ3JhdGUu
YyAgICAgICAgICAgIHwgOSArKysrKy0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNSBpbnNlcnRpb25z
KCspLCA1IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5o
IGIvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKaW5kZXggOGI0NmNmZGIxYTBlLi5iYTc0ZWY1YTc3
MDIgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvbWlncmF0ZS5oCkBAIC0xNjUsNyArMTY1LDYgQEAgc3RhdGljIGlubGluZSBpbnQgbWlncmF0
ZV9taXNwbGFjZWRfdHJhbnNodWdlX3BhZ2Uoc3RydWN0IG1tX3N0cnVjdCAqbW0sCiAjZGVmaW5l
IE1JR1JBVEVfUEZOX1ZBTElECSgxVUwgPDwgMCkKICNkZWZpbmUgTUlHUkFURV9QRk5fTUlHUkFU
RQkoMVVMIDw8IDEpCiAjZGVmaW5lIE1JR1JBVEVfUEZOX0xPQ0tFRAkoMVVMIDw8IDIpCi0jZGVm
aW5lIE1JR1JBVEVfUEZOX1dSSVRFCSgxVUwgPDwgMykKICNkZWZpbmUgTUlHUkFURV9QRk5fU0hJ
RlQJNgogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdlICptaWdyYXRlX3Bmbl90b19wYWdlKHVu
c2lnbmVkIGxvbmcgbXBmbikKZGlmZiAtLWdpdCBhL21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUu
YwppbmRleCA3NDczNTI1NmUyNjAuLjcyNGY5MmRjYzMxYiAxMDA2NDQKLS0tIGEvbW0vbWlncmF0
ZS5jCisrKyBiL21tL21pZ3JhdGUuYwpAQCAtMjIxMiw2ICsyMjEyLDcgQEAgc3RhdGljIGludCBt
aWdyYXRlX3ZtYV9jb2xsZWN0X3BtZChwbWRfdCAqcG1kcCwKIAkJdW5zaWduZWQgbG9uZyBtcGZu
LCBwZm47CiAJCXN0cnVjdCBwYWdlICpwYWdlOwogCQlzd3BfZW50cnlfdCBlbnRyeTsKKwkJYm9v
bCB3cml0YWJsZSA9IGZhbHNlOwogCQlwdGVfdCBwdGU7CiAKIAkJcHRlID0gKnB0ZXA7CkBAIC0y
MjQwLDcgKzIyNDEsNyBAQCBzdGF0aWMgaW50IG1pZ3JhdGVfdm1hX2NvbGxlY3RfcG1kKHBtZF90
ICpwbWRwLAogCQkJbXBmbiA9IG1pZ3JhdGVfcGZuKHBhZ2VfdG9fcGZuKHBhZ2UpKSB8CiAJCQkJ
CU1JR1JBVEVfUEZOX01JR1JBVEU7CiAJCQlpZiAoaXNfd3JpdGVfZGV2aWNlX3ByaXZhdGVfZW50
cnkoZW50cnkpKQotCQkJCW1wZm4gfD0gTUlHUkFURV9QRk5fV1JJVEU7CisJCQkJd3JpdGFibGUg
PSB0cnVlOwogCQl9IGVsc2UgewogCQkJaWYgKGlzX3plcm9fcGZuKHBmbikpIHsKIAkJCQltcGZu
ID0gTUlHUkFURV9QRk5fTUlHUkFURTsKQEAgLTIyNTAsNyArMjI1MSw4IEBAIHN0YXRpYyBpbnQg
bWlncmF0ZV92bWFfY29sbGVjdF9wbWQocG1kX3QgKnBtZHAsCiAJCQl9CiAJCQlwYWdlID0gdm1f
bm9ybWFsX3BhZ2UobWlncmF0ZS0+dm1hLCBhZGRyLCBwdGUpOwogCQkJbXBmbiA9IG1pZ3JhdGVf
cGZuKHBmbikgfCBNSUdSQVRFX1BGTl9NSUdSQVRFOwotCQkJbXBmbiB8PSBwdGVfd3JpdGUocHRl
KSA/IE1JR1JBVEVfUEZOX1dSSVRFIDogMDsKKwkJCWlmIChwdGVfd3JpdGUocHRlKSkKKwkJCQl3
cml0YWJsZSA9IHRydWU7CiAJCX0KIAogCQkvKiBGSVhNRSBzdXBwb3J0IFRIUCAqLwpAQCAtMjI4
NCw4ICsyMjg2LDcgQEAgc3RhdGljIGludCBtaWdyYXRlX3ZtYV9jb2xsZWN0X3BtZChwbWRfdCAq
cG1kcCwKIAkJCXB0ZXBfZ2V0X2FuZF9jbGVhcihtbSwgYWRkciwgcHRlcCk7CiAKIAkJCS8qIFNl
dHVwIHNwZWNpYWwgbWlncmF0aW9uIHBhZ2UgdGFibGUgZW50cnkgKi8KLQkJCWVudHJ5ID0gbWFr
ZV9taWdyYXRpb25fZW50cnkocGFnZSwgbXBmbiAmCi0JCQkJCQkgICAgIE1JR1JBVEVfUEZOX1dS
SVRFKTsKKwkJCWVudHJ5ID0gbWFrZV9taWdyYXRpb25fZW50cnkocGFnZSwgd3JpdGFibGUpOwog
CQkJc3dwX3B0ZSA9IHN3cF9lbnRyeV90b19wdGUoZW50cnkpOwogCQkJaWYgKHB0ZV9zb2Z0X2Rp
cnR5KHB0ZSkpCiAJCQkJc3dwX3B0ZSA9IHB0ZV9zd3BfbWtzb2Z0X2RpcnR5KHN3cF9wdGUpOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
