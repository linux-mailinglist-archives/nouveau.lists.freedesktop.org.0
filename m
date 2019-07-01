Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A85A65B4CB
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:21:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 277D189F63;
	Mon,  1 Jul 2019 06:21:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26EF589F61;
 Mon,  1 Jul 2019 06:21:06 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgV-0003Cs-5p; Mon, 01 Jul 2019 06:21:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:16 +0200
Message-Id: <20190701062020.19239-19-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701062020.19239-1-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
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
 bh=NOvUE3MK4PBUVZYjodBNHK+lKTK0X5FfG0LU1tN7KYg=; b=HxhHD1pjEjG0nbECxGzrXlhFSd
 pYZ6FWrI65g6HDmRODhykjBJp0i+FO3Uewll57/9um1FFD20gH4ojUuQNOIz01ZkUrcxNvZkRgUQN
 d4BYKfrRc9cM6YWvqKXEPU/9hSQZ8afF1Nc8uwN+hYuTZ6mIozhJx0vvBN4rmktvAuaDt+9DRD7YH
 Yt7ORdztBsdCgvFNEe2JgqOp59ScdlPwB/6u5xSmz78zlZR86fRRWnEUBJQYKEd5eEJyrKgYxL8Vc
 B6Ul4VaxPsIcxuFe3qolUUFbeMuW1AiRr8uD2U7S106Nnsa8IJBj/Ut4/rYC3XSWoJDmQO9jELO9k
 1eio7AzQ==;
Subject: [Nouveau] [PATCH 18/22] mm: return valid info from
 hmm_range_unregister
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Q2hlY2tpbmcgcmFuZ2UtPnZhbGlkIGlzIHRyaXZpYWwgYW5kIGhhcyBubyBtZWFuaW5nZnVsIGNv
c3QsIGJ1dApuaWNlbHkgc2ltcGxpZmllcyB0aGUgZmFzdHBhdGggaW4gdHlwaWNhbCBjYWxsZXJz
LiAgQWxzbyByZW1vdmUgdGhlCmhtbV92bWFfcmFuZ2VfZG9uZSBmdW5jdGlvbiwgd2hpY2ggbm93
IGlzIGEgdHJpdmlhbCB3cmFwcGVyIGFyb3VuZApobW1fcmFuZ2VfdW5yZWdpc3Rlci4KClNpZ25l
ZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMgfCAgMiArLQogaW5jbHVkZS9saW51eC9obW0uaCAg
ICAgICAgICAgICAgICAgICB8IDExICstLS0tLS0tLS0tCiBtbS9obW0uYyAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgIDYgKysrKystCiAzIGZpbGVzIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgMTIgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMK
aW5kZXggOGM5MjM3NGFmY2YyLi45ZDQwMTE0ZDc5NDkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9zdm0uYwpAQCAtNjUyLDcgKzY1Miw3IEBAIG5vdXZlYXVfc3ZtX2ZhdWx0KHN0cnVj
dCBudmlmX25vdGlmeSAqbm90aWZ5KQogCQlyZXQgPSBobW1fdm1hX2ZhdWx0KCZzdm1tLT5taXJy
b3IsICZyYW5nZSwgdHJ1ZSk7CiAJCWlmIChyZXQgPT0gMCkgewogCQkJbXV0ZXhfbG9jaygmc3Zt
bS0+bXV0ZXgpOwotCQkJaWYgKCFobW1fdm1hX3JhbmdlX2RvbmUoJnJhbmdlKSkgeworCQkJaWYg
KCFobW1fcmFuZ2VfdW5yZWdpc3RlcigmcmFuZ2UpKSB7CiAJCQkJbXV0ZXhfdW5sb2NrKCZzdm1t
LT5tdXRleCk7CiAJCQkJZ290byBhZ2FpbjsKIAkJCX0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGlu
dXgvaG1tLmggYi9pbmNsdWRlL2xpbnV4L2htbS5oCmluZGV4IDBmYThlYTM0Y2NlZi4uNGIxODVk
Mjg2YzNiIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L2htbS5oCisrKyBiL2luY2x1ZGUvbGlu
dXgvaG1tLmgKQEAgLTQ2NSw3ICs0NjUsNyBAQCBpbnQgaG1tX3JhbmdlX3JlZ2lzdGVyKHN0cnVj
dCBobW1fcmFuZ2UgKnJhbmdlLAogCQkgICAgICAgdW5zaWduZWQgbG9uZyBzdGFydCwKIAkJICAg
ICAgIHVuc2lnbmVkIGxvbmcgZW5kLAogCQkgICAgICAgdW5zaWduZWQgcGFnZV9zaGlmdCk7Ci12
b2lkIGhtbV9yYW5nZV91bnJlZ2lzdGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKTsKK2Jvb2wg
aG1tX3JhbmdlX3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpOwogbG9uZyBobW1f
cmFuZ2Vfc25hcHNob3Qoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpOwogbG9uZyBobW1fcmFuZ2Vf
ZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UsIGJvb2wgYmxvY2spOwogbG9uZyBobW1fcmFu
Z2VfZG1hX21hcChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwKQEAgLTQ4NywxNSArNDg3LDYgQEAg
bG9uZyBobW1fcmFuZ2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAogICovCiAj
ZGVmaW5lIEhNTV9SQU5HRV9ERUZBVUxUX1RJTUVPVVQgMTAwMAogCi0vKiBUaGlzIGlzIGEgdGVt
cG9yYXJ5IGhlbHBlciB0byBhdm9pZCBtZXJnZSBjb25mbGljdCBiZXR3ZWVuIHRyZWVzLiAqLwot
c3RhdGljIGlubGluZSBib29sIGhtbV92bWFfcmFuZ2VfZG9uZShzdHJ1Y3QgaG1tX3JhbmdlICpy
YW5nZSkKLXsKLQlib29sIHJldCA9IGhtbV9yYW5nZV92YWxpZChyYW5nZSk7Ci0KLQlobW1fcmFu
Z2VfdW5yZWdpc3RlcihyYW5nZSk7Ci0JcmV0dXJuIHJldDsKLX0KLQogLyogVGhpcyBpcyBhIHRl
bXBvcmFyeSBoZWxwZXIgdG8gYXZvaWQgbWVyZ2UgY29uZmxpY3QgYmV0d2VlbiB0cmVlcy4gKi8K
IHN0YXRpYyBpbmxpbmUgaW50IGhtbV92bWFfZmF1bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJv
ciwKIAkJCQlzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9vbCBibG9jaykKZGlmZiAtLWdpdCBh
L21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggZGUzNTI4OWRmMjBkLi5jODVlZDdkNGUyY2UgMTAw
NjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC05MjAsMTEgKzkyMCwxNCBAQCBF
WFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9yZWdpc3Rlcik7CiAgKgogICogUmFuZ2Ugc3RydWN0IGlz
IHVzZWQgdG8gdHJhY2sgdXBkYXRlcyB0byB0aGUgQ1BVIHBhZ2UgdGFibGUgYWZ0ZXIgYSBjYWxs
IHRvCiAgKiBobW1fcmFuZ2VfcmVnaXN0ZXIoKS4gU2VlIGluY2x1ZGUvbGludXgvaG1tLmggZm9y
IGhvdyB0byB1c2UgaXQuCisgKgorICogUmV0dXJucyBpZiB0aGUgcmFuZ2Ugd2FzIHN0aWxsIHZh
bGlkIGF0IHRoZSB0aW1lIG9mIHVucmVnaXN0ZXJpbmcuCiAgKi8KLXZvaWQgaG1tX3JhbmdlX3Vu
cmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCitib29sIGhtbV9yYW5nZV91bnJlZ2lz
dGVyKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogewogCXN0cnVjdCBobW0gKmhtbSA9IHJhbmdl
LT5obW07CiAJdW5zaWduZWQgbG9uZyBmbGFnczsKKwlib29sIHJldCA9IHJhbmdlLT52YWxpZDsK
IAogCXNwaW5fbG9ja19pcnFzYXZlKCZobW0tPnJhbmdlc19sb2NrLCBmbGFncyk7CiAJbGlzdF9k
ZWxfaW5pdCgmcmFuZ2UtPmxpc3QpOwpAQCAtOTQxLDYgKzk0NCw3IEBAIHZvaWQgaG1tX3Jhbmdl
X3VucmVnaXN0ZXIoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAJICovCiAJcmFuZ2UtPnZhbGlk
ID0gZmFsc2U7CiAJbWVtc2V0KCZyYW5nZS0+aG1tLCBQT0lTT05fSU5VU0UsIHNpemVvZihyYW5n
ZS0+aG1tKSk7CisJcmV0dXJuIHJldDsKIH0KIEVYUE9SVF9TWU1CT0woaG1tX3JhbmdlX3VucmVn
aXN0ZXIpOwogCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
