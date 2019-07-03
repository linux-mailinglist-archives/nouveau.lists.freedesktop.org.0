Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E1A825EEE7
	for <lists+nouveau@lfdr.de>; Thu,  4 Jul 2019 00:02:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17286E204;
	Wed,  3 Jul 2019 22:02:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC24B6E202;
 Wed,  3 Jul 2019 22:02:19 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hinKR-0004EQ-QL; Wed, 03 Jul 2019 22:02:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 15:02:09 -0700
Message-Id: <20190703220214.28319-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
References: <20190703220214.28319-1-hch@lst.de>
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
 bh=NS2VTlTL88GXGtGIYTIdIxcDk6oTfWlSKFcdult1b6c=; b=UdUPRM9702sfvLifCc8pPMC2aw
 LKUsn7kyOwVNfN6MlrKBQNCi3nL1x8SmpXj43Q3xEMu+cfuC1MdIb1fHyxiZlXTDu6PCk1+p7niBV
 FZ4+8Xio8+nJ67X+uBfr7pTHgYLPuNjdCCO9+K0R9zqULuTbibDw/B77irgHa+EZfA77+WmQv5ySC
 y8D4s0hg1LlbsNh7JmvGGCBqtoHIRkMxn1/F2W/r0h7nD9QHSYIsKtQLm6F8yk4X9R3DdzINGvsSO
 F3c/PXuwTOr4ghT6Wy+P1265stXrlBzmxchknyosBXC9J8PZzgsJzPZlCsyGNOEAFf57nQ6sHdKzN
 H+pV8yAg==;
Subject: [Nouveau] [PATCH 1/6] mm: always return EBUSY for invalid ranges in
 hmm_range_{fault, snapshot}
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
 Felix Kuehling <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2Ugc2hvdWxkIG5vdCBoYXZlIHR3byBkaWZmZXJlbnQgZXJyb3IgY29kZXMgZm9yIHRoZSBzYW1l
IGNvbmRpdGlvbi4gIEluCmFkZGl0aW9uIHRoaXMgcmVhbGx5IGNvbXBsaWNhdGVzIHRoZSBjb2Rl
IGR1ZSB0byB0aGUgc3BlY2lhbCBoYW5kbGluZyBvZgpFQUdBSU4gdGhhdCBkcm9wcyB0aGUgbW1h
cF9zZW0gZHVlIHRvIHRoZSBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGxvZ2ljCmluIHRoZSBjb3Jl
IHZtLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmll
d2VkLWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5
OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KLS0tCiBEb2N1bWVudGF0
aW9uL3ZtL2htbS5yc3QgfCAgMiArLQogbW0vaG1tLmMgICAgICAgICAgICAgICAgIHwgMTAgKysr
Ky0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0p
CgpkaWZmIC0tZ2l0IGEvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IGIvRG9jdW1lbnRhdGlvbi92
bS9obW0ucnN0CmluZGV4IDdkOTA5NjRhYmJiMC4uNzEwY2UxYzcwMWJmIDEwMDY0NAotLS0gYS9E
b2N1bWVudGF0aW9uL3ZtL2htbS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0CkBA
IC0yMzcsNyArMjM3LDcgQEAgVGhlIHVzYWdlIHBhdHRlcm4gaXM6OgogICAgICAgcmV0ID0gaG1t
X3JhbmdlX3NuYXBzaG90KCZyYW5nZSk7CiAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAgdXBf
cmVhZCgmbW0tPm1tYXBfc2VtKTsKLSAgICAgICAgICBpZiAocmV0ID09IC1FQUdBSU4pIHsKKyAg
ICAgICAgICBpZiAocmV0ID09IC1FQlVTWSkgewogICAgICAgICAgICAgLyoKICAgICAgICAgICAg
ICAqIE5vIG5lZWQgdG8gY2hlY2sgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoKSByZXR1cm4g
dmFsdWUKICAgICAgICAgICAgICAqIG9uIHJldHJ5IHdlIHdpbGwgZ2V0IHByb3BlciBlcnJvciB3
aXRoIGhtbV9yYW5nZV9zbmFwc2hvdCgpCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5j
CmluZGV4IGQ0OGI5MjgzNzI1YS4uMWQ1N2MzOWMxZDhiIDEwMDY0NAotLS0gYS9tbS9obW0uYwor
KysgYi9tbS9obW0uYwpAQCAtOTQ2LDcgKzk0Niw3IEBAIEVYUE9SVF9TWU1CT0woaG1tX3Jhbmdl
X3VucmVnaXN0ZXIpOwogICogQHJhbmdlOiByYW5nZQogICogUmV0dXJuOiAtRUlOVkFMIGlmIGlu
dmFsaWQgYXJndW1lbnQsIC1FTk9NRU0gb3V0IG9mIG1lbW9yeSwgLUVQRVJNIGludmFsaWQKICAq
ICAgICAgICAgIHBlcm1pc3Npb24gKGZvciBpbnN0YW5jZSBhc2tpbmcgZm9yIHdyaXRlIGFuZCBy
YW5nZSBpcyByZWFkIG9ubHkpLAotICogICAgICAgICAgLUVBR0FJTiBpZiB5b3UgbmVlZCB0byBy
ZXRyeSwgLUVGQVVMVCBpbnZhbGlkIChpZSBlaXRoZXIgbm8gdmFsaWQKKyAqICAgICAgICAgIC1F
QlVTWSBpZiB5b3UgbmVlZCB0byByZXRyeSwgLUVGQVVMVCBpbnZhbGlkIChpZSBlaXRoZXIgbm8g
dmFsaWQKICAqICAgICAgICAgIHZtYSBvciBpdCBpcyBpbGxlZ2FsIHRvIGFjY2VzcyB0aGF0IHJh
bmdlKSwgbnVtYmVyIG9mIHZhbGlkIHBhZ2VzCiAgKiAgICAgICAgICBpbiByYW5nZS0+cGZuc1td
IChmcm9tIHJhbmdlIHN0YXJ0IGFkZHJlc3MpLgogICoKQEAgLTk2Nyw3ICs5NjcsNyBAQCBsb25n
IGhtbV9yYW5nZV9zbmFwc2hvdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAlkbyB7CiAJCS8q
IElmIHJhbmdlIGlzIG5vIGxvbmdlciB2YWxpZCBmb3JjZSByZXRyeS4gKi8KIAkJaWYgKCFyYW5n
ZS0+dmFsaWQpCi0JCQlyZXR1cm4gLUVBR0FJTjsKKwkJCXJldHVybiAtRUJVU1k7CiAKIAkJdm1h
ID0gZmluZF92bWEoaG1tLT5tbSwgc3RhcnQpOwogCQlpZiAodm1hID09IE5VTEwgfHwgKHZtYS0+
dm1fZmxhZ3MgJiBkZXZpY2Vfdm1hKSkKQEAgLTEwNjIsMTAgKzEwNjIsOCBAQCBsb25nIGhtbV9y
YW5nZV9mYXVsdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9vbCBibG9jaykKIAogCWRvIHsK
IAkJLyogSWYgcmFuZ2UgaXMgbm8gbG9uZ2VyIHZhbGlkIGZvcmNlIHJldHJ5LiAqLwotCQlpZiAo
IXJhbmdlLT52YWxpZCkgewotCQkJdXBfcmVhZCgmaG1tLT5tbS0+bW1hcF9zZW0pOwotCQkJcmV0
dXJuIC1FQUdBSU47Ci0JCX0KKwkJaWYgKCFyYW5nZS0+dmFsaWQpCisJCQlyZXR1cm4gLUVCVVNZ
OwogCiAJCXZtYSA9IGZpbmRfdm1hKGhtbS0+bW0sIHN0YXJ0KTsKIAkJaWYgKHZtYSA9PSBOVUxM
IHx8ICh2bWEtPnZtX2ZsYWdzICYgZGV2aWNlX3ZtYSkpCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
