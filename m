Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CE008363C
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EFCE6E449;
	Tue,  6 Aug 2019 16:06:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28E3C6E450;
 Tue,  6 Aug 2019 16:06:30 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yl-0000cx-0P; Tue, 06 Aug 2019 16:06:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:50 +0300
Message-Id: <20190806160554.14046-13-hch@lst.de>
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
 bh=YRRjZVhDBKVOH1jTuQF7A3O3z8BLVwvvxYuFPnL2EoU=; b=IOHXbjZxSo82prtQ4bNa7kyk3F
 ERoxF4OGQgr4Pywg2DaD0Fxz1thwKfufBvzCaB2SwknrAvMue4z8IwQDnfIS7C4dAIUE8D6MTBuSI
 TchmmS+U2xN96UVExRPZkKqdgBDJuV4HpexZYppF7x90Fp/azYAP4RG/FK+ihZw9+RcMPOc6lKJbb
 0918M0qgnb9VPmscGzQmtBWlAFXzEp561MFwTV/2Aldr8SoEMk4DlcqiqHrPlS2N7xv/WHPKtkInz
 9Zn5COJcEiL1EXqqFP+SaUI5SeOLPANFuORCxuyIops6El+WaLmnA1TRSJ4ubesVQF6Cwg5OX2of2
 4XBWzr8A==;
Subject: [Nouveau] [PATCH 12/15] mm: cleanup the hmm_vma_walk_hugetlb_entry
 stub
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

U3R1YiBvdXQgdGhlIHdob2xlIGZ1bmN0aW9uIGFuZCBhc3NpZ24gTlVMTCB0byB0aGUgLmh1Z2V0
bGJfZW50cnkgbWV0aG9kCmlmIENPTkZJR19IVUdFVExCX1BBR0UgaXMgbm90IHNldCwgYXMgdGhl
IG1ldGhvZCB3b24ndCBldmVyIGJlIGNhbGxlZCBpbgp0aGF0IGNhc2UuCgpTaWduZWQtb2ZmLWJ5
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRo
b3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBtbS9obW0uYyB8IDggKysrKy0tLS0KIDEgZmls
ZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEv
bW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCA0YWE3MTM1ZjEwOTQuLmRlZTk5ZDBjYzg1NiAxMDA2
NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTc2NywxMSArNzY3LDExIEBAIHN0
YXRpYyBpbnQgaG1tX3ZtYV93YWxrX3B1ZChwdWRfdCAqcHVkcCwgdW5zaWduZWQgbG9uZyBzdGFy
dCwgdW5zaWduZWQgbG9uZyBlbmQsCiAjZGVmaW5lIGhtbV92bWFfd2Fsa19wdWQJTlVMTAogI2Vu
ZGlmCiAKKyNpZmRlZiBDT05GSUdfSFVHRVRMQl9QQUdFCiBzdGF0aWMgaW50IGhtbV92bWFfd2Fs
a19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcgaG1hc2ssCiAJCQkJICAg
ICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCiAJCQkJICAgICAgc3Ry
dWN0IG1tX3dhbGsgKndhbGspCiB7Ci0jaWZkZWYgQ09ORklHX0hVR0VUTEJfUEFHRQogCXVuc2ln
bmVkIGxvbmcgYWRkciA9IHN0YXJ0LCBpLCBwZm47CiAJc3RydWN0IGhtbV92bWFfd2FsayAqaG1t
X3ZtYV93YWxrID0gd2Fsay0+cHJpdmF0ZTsKIAlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSA9IGht
bV92bWFfd2Fsay0+cmFuZ2U7CkBAIC04MTAsMTAgKzgxMCwxMCBAQCBzdGF0aWMgaW50IGhtbV92
bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcgaG1hc2ssCiAJ
CXJldHVybiBobW1fdm1hX3dhbGtfaG9sZV8oYWRkciwgZW5kLCBmYXVsdCwgd3JpdGVfZmF1bHQs
IHdhbGspOwogCiAJcmV0dXJuIHJldDsKLSNlbHNlIC8qIENPTkZJR19IVUdFVExCX1BBR0UgKi8K
LQlyZXR1cm4gLUVJTlZBTDsKLSNlbmRpZgogfQorI2Vsc2UKKyNkZWZpbmUgaG1tX3ZtYV93YWxr
X2h1Z2V0bGJfZW50cnkgTlVMTAorI2VuZGlmIC8qIENPTkZJR19IVUdFVExCX1BBR0UgKi8KIAog
c3RhdGljIHZvaWQgaG1tX3BmbnNfY2xlYXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsCiAJCQkg
ICB1aW50NjRfdCAqcGZucywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
