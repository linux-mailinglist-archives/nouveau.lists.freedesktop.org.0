Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBE077A0B2
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B3686E405;
	Tue, 30 Jul 2019 05:52:55 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FD676E405;
 Tue, 30 Jul 2019 05:52:54 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL46-0001T1-B3; Tue, 30 Jul 2019 05:52:50 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:52:02 +0300
Message-Id: <20190730055203.28467-13-hch@lst.de>
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
 bh=5I6cv8rPAulGunfRGkEsTPG6LGj3MyO3rpoe2rANz8U=; b=oDf9sTqLOFXjgtQQfZeUNN/vp5
 lCVFV/7Tr8JxHR/pQ+/TMmCyjB6NjzjA2mMLkEkCi7jL4ivm6humWCpK5bUJBpgGkIVEIqxfqPwDM
 4YTgjZfSuNSKi4iH6bf2ix1BFnAHfKSiDJt5tuFXYnbRAPanFBN7galzFX5sH/RzaX/Ar5BkCfFvd
 41uRDFgvEN7sG3tRwMzHosXwxm3yjKdGtPSFyxJvDop/5dTh5Q/5Zvl1zocmST9V55oZcYCaE7QDT
 9yH7K0Mb6/P0GmUwfW3WtYnIUZ9WM04YEB6aiSTy77a+Q6/+Ce1zgMON+82ync3MS6VeeHv8iSw9J
 klDnrBYw==;
Subject: [Nouveau] [PATCH 12/13] mm: cleanup the hmm_vma_walk_hugetlb_entry
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
OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBtbS9obW0uYyB8IDggKysrKy0t
LS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBmNGU5MGVhNTc3OWYuLjJiNTZhNGFm
MTAwMSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTc2OSwxMSArNzY5
LDExIEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX3B1ZChwdWRfdCAqcHVkcCwgdW5zaWduZWQg
bG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCiAjZGVmaW5lIGhtbV92bWFfd2Fsa19wdWQJ
TlVMTAogI2VuZGlmCiAKKyNpZmRlZiBDT05GSUdfSFVHRVRMQl9QQUdFCiBzdGF0aWMgaW50IGht
bV92bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcgaG1hc2ss
CiAJCQkJICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwgdW5zaWduZWQgbG9uZyBlbmQsCiAJCQkJ
ICAgICAgc3RydWN0IG1tX3dhbGsgKndhbGspCiB7Ci0jaWZkZWYgQ09ORklHX0hVR0VUTEJfUEFH
RQogCXVuc2lnbmVkIGxvbmcgYWRkciA9IHN0YXJ0LCBpLCBwZm47CiAJc3RydWN0IGhtbV92bWFf
d2FsayAqaG1tX3ZtYV93YWxrID0gd2Fsay0+cHJpdmF0ZTsKIAlzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSA9IGhtbV92bWFfd2Fsay0+cmFuZ2U7CkBAIC04MTIsMTAgKzgxMiwxMCBAQCBzdGF0aWMg
aW50IGhtbV92bWFfd2Fsa19odWdldGxiX2VudHJ5KHB0ZV90ICpwdGUsIHVuc2lnbmVkIGxvbmcg
aG1hc2ssCiAJCXJldHVybiBobW1fdm1hX3dhbGtfaG9sZV8oYWRkciwgZW5kLCBmYXVsdCwgd3Jp
dGVfZmF1bHQsIHdhbGspOwogCiAJcmV0dXJuIHJldDsKLSNlbHNlIC8qIENPTkZJR19IVUdFVExC
X1BBR0UgKi8KLQlyZXR1cm4gLUVJTlZBTDsKLSNlbmRpZgogfQorI2Vsc2UKKyNkZWZpbmUgaG1t
X3ZtYV93YWxrX2h1Z2V0bGJfZW50cnkgTlVMTAorI2VuZGlmIC8qIENPTkZJR19IVUdFVExCX1BB
R0UgKi8KIAogc3RhdGljIHZvaWQgaG1tX3BmbnNfY2xlYXIoc3RydWN0IGhtbV9yYW5nZSAqcmFu
Z2UsCiAJCQkgICB1aW50NjRfdCAqcGZucywKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
