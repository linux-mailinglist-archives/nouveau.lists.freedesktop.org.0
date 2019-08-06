Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46F83638
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 324366E427;
	Tue,  6 Aug 2019 16:06:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 544396E41D;
 Tue,  6 Aug 2019 16:06:20 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1ya-0000aD-R6; Tue, 06 Aug 2019 16:06:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:46 +0300
Message-Id: <20190806160554.14046-9-hch@lst.de>
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
 bh=CFSretyqs/RdirX2o42+13inYYFm9UN8GL7VmbVQVoQ=; b=tzhuPYOZCfgFbsA9DJibfh/0Jh
 woYpb6mEK7ChEy3EQSIGvnXDPse4koxKMp2IVNjgzLQ6T38WsL385CiPX1vHD2Jucbed+H/5Pu4lp
 H/90sdP/K9vSYZY7RNildl5jevquWCkAzhbCbvPIWLnT8ZyEjqMSz1km+VUCFKhynvVxvf7KPyJzg
 9mcmtQVc/phVgwX4EZ1FmOwnOHVrXcWWe9j1QCmpobC8EUhF4daYBvAmBpQimWumDoicwaVczgeco
 1Y8lm/34Pe/d56aQqfFjYbBd3j92PHqKQzIpa9qOWRMFQHFJdLuWEV9jOHRkdM2ZEkyYHq03VPBtC
 QFOhtlvA==;
Subject: [Nouveau] [PATCH 08/15] mm: remove the mask variable in
 hmm_vma_walk_hugetlb_entry
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

VGhlIHBhZ2V3YWxrIGNvZGUgYWxyZWFkeSBwYXNzZXMgdGhlIHZhbHVlIGFzIHRoZSBobWFzayBw
YXJhbWV0ZXIuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBtbS9obW0uYyB8IDcgKystLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygr
KSwgNSBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4
IGYyNmQ2YWJjNGVkMi4uMDNkMzdlMTAyZTNiIDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9t
bS9obW0uYwpAQCAtNzcxLDE5ICs3NzEsMTYgQEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfaHVn
ZXRsYl9lbnRyeShwdGVfdCAqcHRlLCB1bnNpZ25lZCBsb25nIGhtYXNrLAogCQkJCSAgICAgIHN0
cnVjdCBtbV93YWxrICp3YWxrKQogewogI2lmZGVmIENPTkZJR19IVUdFVExCX1BBR0UKLQl1bnNp
Z25lZCBsb25nIGFkZHIgPSBzdGFydCwgaSwgcGZuLCBtYXNrOworCXVuc2lnbmVkIGxvbmcgYWRk
ciA9IHN0YXJ0LCBpLCBwZm47CiAJc3RydWN0IGhtbV92bWFfd2FsayAqaG1tX3ZtYV93YWxrID0g
d2Fsay0+cHJpdmF0ZTsKIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGhtbV92bWFfd2Fsay0+
cmFuZ2U7CiAJc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEgPSB3YWxrLT52bWE7Ci0Jc3RydWN0
IGhzdGF0ZSAqaCA9IGhzdGF0ZV92bWEodm1hKTsKIAl1aW50NjRfdCBvcmlnX3BmbiwgY3B1X2Zs
YWdzOwogCWJvb2wgZmF1bHQsIHdyaXRlX2ZhdWx0OwogCXNwaW5sb2NrX3QgKnB0bDsKIAlwdGVf
dCBlbnRyeTsKIAlpbnQgcmV0ID0gMDsKIAotCW1hc2sgPSBodWdlX3BhZ2Vfc2l6ZShoKSAtIDE7
Ci0KIAlwdGwgPSBodWdlX3B0ZV9sb2NrKGhzdGF0ZV92bWEodm1hKSwgd2Fsay0+bW0sIHB0ZSk7
CiAJZW50cnkgPSBodWdlX3B0ZXBfZ2V0KHB0ZSk7CiAKQEAgLTc5OSw3ICs3OTYsNyBAQCBzdGF0
aWMgaW50IGhtbV92bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxv
bmcgaG1hc2ssCiAJCWdvdG8gdW5sb2NrOwogCX0KIAotCXBmbiA9IHB0ZV9wZm4oZW50cnkpICsg
KChzdGFydCAmIG1hc2spID4+IFBBR0VfU0hJRlQpOworCXBmbiA9IHB0ZV9wZm4oZW50cnkpICsg
KChzdGFydCAmIH5obWFzaykgPj4gUEFHRV9TSElGVCk7CiAJZm9yICg7IGFkZHIgPCBlbmQ7IGFk
ZHIgKz0gUEFHRV9TSVpFLCBpKyssIHBmbisrKQogCQlyYW5nZS0+cGZuc1tpXSA9IGhtbV9kZXZp
Y2VfZW50cnlfZnJvbV9wZm4ocmFuZ2UsIHBmbikgfAogCQkJCSBjcHVfZmxhZ3M7Ci0tIAoyLjIw
LjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
