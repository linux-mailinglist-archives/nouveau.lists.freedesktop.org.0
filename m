Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3D3C47A0B0
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC82B6E402;
	Tue, 30 Jul 2019 05:52:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CEE7C6E3FB;
 Tue, 30 Jul 2019 05:52:50 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL43-0001QQ-Bt; Tue, 30 Jul 2019 05:52:47 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:52:01 +0300
Message-Id: <20190730055203.28467-12-hch@lst.de>
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
 bh=WWqUlWBk9SeNDsTgchqiBvCPPdXQGby4eLwA4l1Wn/c=; b=UQt+nBOCFLuTt9lR9m80f7mUgE
 lS9m/3kgkBnUgWm075wpjDvoWcfsvGjj6XNdiPu0xYJSsIR91F3EVZwqjOtGPHT3tWlZR1g4Z/KQV
 sMdXE4d3yo6a78yBkEuoY1UtuG8aYk83pTsB59Pqnw9yKDyyqlzcymrOVg3Ou7ovmKyZvBhF6NEzZ
 YLcfiBi183KQGYbKJQFVbR+/FEJmnM8Cf0NcQFhzluMjCVBfbn7EewshSuoqwtxhgBLdNx+a/2VgS
 05Skzq6tlpaW0rNMPwXleuGdfG+87MF1AAS0XJXPfCY9/nfdHzoMBWXoCqJG0YWhBv5LN55u8SyqL
 DNIqFunQ==;
Subject: [Nouveau] [PATCH 11/13] mm: cleanup the hmm_vma_handle_pmd stub
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
IDE4ICsrKysrKysrKy0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwg
OSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDRk
M2JkNDFiNjUyMi4uZjRlOTBlYTU3NzlmIDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9o
bW0uYwpAQCAtNDU1LDEzICs0NTUsMTAgQEAgc3RhdGljIGlubGluZSB1aW50NjRfdCBwbWRfdG9f
aG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgcG1kX3QgcG1kKQogCQkJCXJh
bmdlLT5mbGFnc1tITU1fUEZOX1ZBTElEXTsKIH0KIAotc3RhdGljIGludCBobW1fdm1hX2hhbmRs
ZV9wbWQoc3RydWN0IG1tX3dhbGsgKndhbGssCi0JCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIs
Ci0JCQkgICAgICB1bnNpZ25lZCBsb25nIGVuZCwKLQkJCSAgICAgIHVpbnQ2NF90ICpwZm5zLAot
CQkJICAgICAgcG1kX3QgcG1kKQotewogI2lmZGVmIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFH
RQorc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0IG1tX3dhbGsgKndhbGssIHVu
c2lnbmVkIGxvbmcgYWRkciwKKwkJdW5zaWduZWQgbG9uZyBlbmQsIHVpbnQ2NF90ICpwZm5zLCBw
bWRfdCBwbWQpCit7CiAJc3RydWN0IGhtbV92bWFfd2FsayAqaG1tX3ZtYV93YWxrID0gd2Fsay0+
cHJpdmF0ZTsKIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fsay0+cmFuZ2U7
CiAJc3RydWN0IGRldl9wYWdlbWFwICpwZ21hcCA9IE5VTEw7CkBAIC00OTAsMTEgKzQ4NywxNCBA
QCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywKIAkJ
cHV0X2Rldl9wYWdlbWFwKHBnbWFwKTsKIAlobW1fdm1hX3dhbGstPmxhc3QgPSBlbmQ7CiAJcmV0
dXJuIDA7Ci0jZWxzZQotCS8qIElmIFRIUCBpcyBub3QgZW5hYmxlZCB0aGVuIHdlIHNob3VsZCBu
ZXZlciByZWFjaCB0aGlzIGNvZGUgISAqLworfQorI2Vsc2UgLyogQ09ORklHX1RSQU5TUEFSRU5U
X0hVR0VQQUdFICovCitzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2Fs
ayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAorCQl1bnNpZ25lZCBsb25nIGVuZCwgdWludDY0
X3QgKnBmbnMsIHBtZF90IHBtZCkKK3sKIAlyZXR1cm4gLUVJTlZBTDsKLSNlbmRpZgogfQorI2Vu
ZGlmIC8qIENPTkZJR19UUkFOU1BBUkVOVF9IVUdFUEFHRSAqLwogCiBzdGF0aWMgaW5saW5lIHVp
bnQ2NF90IHB0ZV90b19obW1fcGZuX2ZsYWdzKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCBwdGVf
dCBwdGUpCiB7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
