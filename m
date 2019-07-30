Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F3D67A0AD
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D48156E3F9;
	Tue, 30 Jul 2019 05:52:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FA246E3F9;
 Tue, 30 Jul 2019 05:52:48 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL40-0001NU-9X; Tue, 30 Jul 2019 05:52:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:52:00 +0300
Message-Id: <20190730055203.28467-11-hch@lst.de>
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
 bh=/5sNjyutpvGxyHVQu1GnV/XZDve/kWrhGHnNmckcmW4=; b=qUVDb0Gb7qkDZ66Y+5kTNUPiZS
 oPKFdf1FdqOh8A+YmmGZN9LNdSXHfAWdAy/P90p3MOCc2Z96eNVGgpwDoqMg90kChee4ehDTqgr0j
 Pkj3WfEI90d1K0L5yj8xDhi4zgmFwII7fKqNTkcOh87hmP8aIWYto5bpxj6Uy1e0sMmXDfuZHNiQe
 ryhsB5F5qd969AsJYWXGSU3b3LjXZyE7SQi6J6IID+hg37hn/a03/WzGB57Vb+NcFVUtwUa5rdmZi
 cmRAd6TOTOi1MrSWzl3EdA3D5NUMB0guYKclteB1z/GzP1uvBIhvL0Mxg647o4EVb80KI84ij7PDP
 xbU47HuQ==;
Subject: [Nouveau] [PATCH 10/13] mm: only define hmm_vma_walk_pud if needed
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
ZT4KLS0tCiBtbS9obW0uYyB8IDI5ICsrKysrKysrKysrKysrKystLS0tLS0tLS0tLS0tCiAxIGZp
bGUgY2hhbmdlZCwgMTYgaW5zZXJ0aW9ucygrKSwgMTMgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0
IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBlNjNhYjdmMTEzMzQuLjRkM2JkNDFiNjUyMiAx
MDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTQ1NSwxNSArNDU1LDYgQEAg
c3RhdGljIGlubGluZSB1aW50NjRfdCBwbWRfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3Jh
bmdlICpyYW5nZSwgcG1kX3QgcG1kKQogCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1ZBTElEXTsK
IH0KIAotc3RhdGljIGlubGluZSB1aW50NjRfdCBwdWRfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3Qg
aG1tX3JhbmdlICpyYW5nZSwgcHVkX3QgcHVkKQotewotCWlmICghcHVkX3ByZXNlbnQocHVkKSkK
LQkJcmV0dXJuIDA7Ci0JcmV0dXJuIHB1ZF93cml0ZShwdWQpID8gcmFuZ2UtPmZsYWdzW0hNTV9Q
Rk5fVkFMSURdIHwKLQkJCQlyYW5nZS0+ZmxhZ3NbSE1NX1BGTl9XUklURV0gOgotCQkJCXJhbmdl
LT5mbGFnc1tITU1fUEZOX1ZBTElEXTsKLX0KLQogc3RhdGljIGludCBobW1fdm1hX2hhbmRsZV9w
bWQoc3RydWN0IG1tX3dhbGsgKndhbGssCiAJCQkgICAgICB1bnNpZ25lZCBsb25nIGFkZHIsCiAJ
CQkgICAgICB1bnNpZ25lZCBsb25nIGVuZCwKQEAgLTcwMCwxMCArNjkxLDE5IEBAIHN0YXRpYyBp
bnQgaG1tX3ZtYV93YWxrX3BtZChwbWRfdCAqcG1kcCwKIAlyZXR1cm4gMDsKIH0KIAotc3RhdGlj
IGludCBobW1fdm1hX3dhbGtfcHVkKHB1ZF90ICpwdWRwLAotCQkJICAgIHVuc2lnbmVkIGxvbmcg
c3RhcnQsCi0JCQkgICAgdW5zaWduZWQgbG9uZyBlbmQsCi0JCQkgICAgc3RydWN0IG1tX3dhbGsg
KndhbGspCisjaWYgZGVmaW5lZChDT05GSUdfQVJDSF9IQVNfUFRFX0RFVk1BUCkgJiYgXAorICAg
IGRlZmluZWQoQ09ORklHX0hBVkVfQVJDSF9UUkFOU1BBUkVOVF9IVUdFUEFHRV9QVUQpCitzdGF0
aWMgaW5saW5lIHVpbnQ2NF90IHB1ZF90b19obW1fcGZuX2ZsYWdzKHN0cnVjdCBobW1fcmFuZ2Ug
KnJhbmdlLCBwdWRfdCBwdWQpCit7CisJaWYgKCFwdWRfcHJlc2VudChwdWQpKQorCQlyZXR1cm4g
MDsKKwlyZXR1cm4gcHVkX3dyaXRlKHB1ZCkgPyByYW5nZS0+ZmxhZ3NbSE1NX1BGTl9WQUxJRF0g
fAorCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXSA6CisJCQkJcmFuZ2UtPmZsYWdzW0hN
TV9QRk5fVkFMSURdOworfQorCitzdGF0aWMgaW50IGhtbV92bWFfd2Fsa19wdWQocHVkX3QgKnB1
ZHAsIHVuc2lnbmVkIGxvbmcgc3RhcnQsIHVuc2lnbmVkIGxvbmcgZW5kLAorCQlzdHJ1Y3QgbW1f
d2FsayAqd2FsaykKIHsKIAlzdHJ1Y3QgaG1tX3ZtYV93YWxrICpobW1fdm1hX3dhbGsgPSB3YWxr
LT5wcml2YXRlOwogCXN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlID0gaG1tX3ZtYV93YWxrLT5yYW5n
ZTsKQEAgLTc2NSw2ICs3NjUsOSBAQCBzdGF0aWMgaW50IGhtbV92bWFfd2Fsa19wdWQocHVkX3Qg
KnB1ZHAsCiAKIAlyZXR1cm4gMDsKIH0KKyNlbHNlCisjZGVmaW5lIGhtbV92bWFfd2Fsa19wdWQJ
TlVMTAorI2VuZGlmCiAKIHN0YXRpYyBpbnQgaG1tX3ZtYV93YWxrX2h1Z2V0bGJfZW50cnkocHRl
X3QgKnB0ZSwgdW5zaWduZWQgbG9uZyBobWFzaywKIAkJCQkgICAgICB1bnNpZ25lZCBsb25nIHN0
YXJ0LCB1bnNpZ25lZCBsb25nIGVuZCwKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
