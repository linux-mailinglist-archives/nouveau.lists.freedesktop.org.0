Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D3BE8363A
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 195786E443;
	Tue,  6 Aug 2019 16:06:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 231476E443;
 Tue,  6 Aug 2019 16:06:27 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yf-0000bo-Tk; Tue, 06 Aug 2019 16:06:22 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:48 +0300
Message-Id: <20190806160554.14046-11-hch@lst.de>
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
 bh=Ip6Tv7CH1RUCf1zdL/7YnuvbR835Efr9iJJdAFn2xCE=; b=l2Q5OzCqYI6K/lwIUdGM/lRV7A
 orDsZpzbT6FSVlceE/hay+znMxbpWMtaDTBHblMXvxERMhczytc2vd81s6BqxCZFw2V+kIC1ehQpp
 k+Rn3H0gbs9x8Wd69M+u5RHtmAxHu33R+eq8t9FPKY41OyzLqR46OnL/3/uJyFvCu0wrsi53OR/mu
 7/mdjcwkmKnzaKrkH5ypk1OTp+rOzbLBQZmdtU0MQuKonn5rYEozOJUnEkPDgPRfYRrrv/ltW03W1
 B3GGyVUnYhFnzA1DZM9OJMMvOYQnSvrnyNNF7TcG618gJsqAjt8SdYkE4ny8fMR5VMnJN6+ThYxIg
 Uq/3HCWw==;
Subject: [Nouveau] [PATCH 10/15] mm: only define hmm_vma_walk_pud if needed
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

V2Ugb25seSBuZWVkIHRoZSBzcGVjaWFsIHB1ZF9lbnRyeSB3YWxrZXIgaWYgUFVELXNpemVkIGh1
Z2VwYWdlcyBhbmQKcHRlIG1hcHBpbmdzIGFyZSBzdXBwb3J0ZWQsIGVsc2UgdGhlIGNvbW1vbiBw
YWdld2FsayBjb2RlIHdpbGwgdGFrZQpjYXJlIG9mIHRoZSBpdGVyYXRpb24uICBOb3QgaW1wbGVt
ZW50aW5nIHRoaXMgY2FsbGJhY2sgcmVkdWNlZCB0aGUKYW1vdW50IG9mIGNvZGUgY29tcGlsZWQg
Zm9yIG5vbi14ODYgcGxhdGZvcm1zLCBhbmQgYWxzbyBmaXhlcyBjb21waWxlCmZhaWx1cmVzIHdp
dGggb3RoZXIgYXJjaGl0ZWN0dXJlcyB3aGVuIGhlbHBlcnMgbGlrZSBwdWRfcGZuIGFyZSBub3QK
aW1wbGVtZW50ZWQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBt
bS9obW0uYyB8IDI5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdl
ZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1t
LmMgYi9tbS9obW0uYwppbmRleCAyMDgzZTRkYjQ2ZjUuLjVlN2FmZTY4NTIxMyAxMDA2NDQKLS0t
IGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTQ1NSwxNSArNDU1LDYgQEAgc3RhdGljIGlu
bGluZSB1aW50NjRfdCBwbWRfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZSwgcG1kX3QgcG1kKQogCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1ZBTElEXTsKIH0KIAotc3Rh
dGljIGlubGluZSB1aW50NjRfdCBwdWRfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3Jhbmdl
ICpyYW5nZSwgcHVkX3QgcHVkKQotewotCWlmICghcHVkX3ByZXNlbnQocHVkKSkKLQkJcmV0dXJu
IDA7Ci0JcmV0dXJuIHB1ZF93cml0ZShwdWQpID8gcmFuZ2UtPmZsYWdzW0hNTV9QRk5fVkFMSURd
IHwKLQkJCQlyYW5nZS0+ZmxhZ3NbSE1NX1BGTl9XUklURV0gOgotCQkJCXJhbmdlLT5mbGFnc1tI
TU1fUEZOX1ZBTElEXTsKLX0KLQogc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9wbWQoc3RydWN0
IG1tX3dhbGsgKndhbGssCiAJCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsCiAJCQkgICAgICB1
bnNpZ25lZCBsb25nIGVuZCwKQEAgLTcwMCwxMCArNjkxLDE5IEBAIHN0YXRpYyBpbnQgaG1tX3Zt
YV93YWxrX3BtZChwbWRfdCAqcG1kcCwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGljIGludCBobW1f
dm1hX3dhbGtfcHVkKHB1ZF90ICpwdWRwLAotCQkJICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCi0J
CQkgICAgdW5zaWduZWQgbG9uZyBlbmQsCi0JCQkgICAgc3RydWN0IG1tX3dhbGsgKndhbGspCisj
aWYgZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUCkgJiYgXAorICAgIGRlZmluZWQo
Q09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQpCitzdGF0aWMgaW5saW5l
IHVpbnQ2NF90IHB1ZF90b19obW1fcGZuX2ZsYWdzKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLCBw
dWRfdCBwdWQpCit7CisJaWYgKCFwdWRfcHJlc2VudChwdWQpKQorCQlyZXR1cm4gMDsKKwlyZXR1
cm4gcHVkX3dyaXRlKHB1ZCkgPyByYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF0gfAorCQkJCXJh
bmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXSA6CisJCQkJcmFuZ2UtPmZsYWdzW0hNTV9QRk5fVkFM
SURdOworfQorCitzdGF0aWMgaW50IGhtbV92bWFfd2Fsa19wdWQocHVkX3QgKnB1ZHAsIHVuc2ln
bmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAorCQlzdHJ1Y3QgbW1fd2FsayAqd2Fs
aykKIHsKIAlzdHJ1Y3QgaG1tX3ZtYV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxrLT5wcml2YXRl
OwogCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlID0gaG1tX3ZtYV93YWxrLT5yYW5nZTsKQEAgLTc2
NSw2ICs3NjUsOSBAQCBzdGF0aWMgaW50IGhtbV92bWFfd2Fsa19wdWQocHVkX3QgKnB1ZHAsCiAK
IAlyZXR1cm4gMDsKIH0KKyNlbHNlCisjZGVmaW5lIGhtbV92bWFfd2Fsa19wdWQJTlVMTAorI2Vu
ZGlmCiAKIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX2h1Z2V0bGJfZW50cnkocHRlX3QgKnB0ZSwg
dW5zaWduZWQgbG9uZyBobWFzaywKIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHN0YXJ0LCB1bnNp
Z25lZCBsb25nIGVuZCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
