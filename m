Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1090F72887
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 08:53:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F44D6E455;
	Wed, 24 Jul 2019 06:53:09 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B64C6E455;
 Wed, 24 Jul 2019 06:53:08 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqB97-0004IF-4l; Wed, 24 Jul 2019 06:53:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 24 Jul 2019 08:52:52 +0200
Message-Id: <20190724065258.16603-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724065258.16603-1-hch@lst.de>
References: <20190724065258.16603-1-hch@lst.de>
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
 bh=DSjx3V8seGjWbwtcA9zyGdO2uw7ke18fmJwoWmqMVnM=; b=PTpmJ/2qJ58v0Yn7xWag2yZ4ef
 VhRhiyB0VamFSm/AzvXGbwI1J1iNXfwAIOx9CqQeqJG+6qoNH24LLcL8LRkeL0GGTNRFSff85NWoz
 xBcuEzvSyLoJpa2SwhN9ePQsgmeTvYsFJwH61I34/01jbQSmoVRmNu0Dqvyu8LxE/c6XLsw0PIDgs
 EsRCpWtRTg/GzpZPGrSl3fkLoByjtS8UwgWbA+pnyBgqRQHBBjASyZ2gZHwMeRF9rLwoYxcrFzbqs
 LBOcdZ/AW4DSb5YW36uQh7jbcNN5xQ7CSV6LHqd+GuCw3/ziT1lLD7n4rUIezcKRBCUNNWstdC55d
 yxqUSZjw==;
Subject: [Nouveau] [PATCH 1/7] mm: always return EBUSY for invalid ranges in
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
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2VkLWJ5OiBGZWxpeCBL
dWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KLS0tCiBEb2N1bWVudGF0aW9uL3ZtL2ht
bS5yc3QgfCAgMiArLQogbW0vaG1tLmMgICAgICAgICAgICAgICAgIHwgMTAgKysrKy0tLS0tLQog
MiBmaWxlcyBjaGFuZ2VkLCA1IGluc2VydGlvbnMoKyksIDcgZGVsZXRpb25zKC0pCgpkaWZmIC0t
Z2l0IGEvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0IGIvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0
CmluZGV4IDdkOTA5NjRhYmJiMC4uNzEwY2UxYzcwMWJmIDEwMDY0NAotLS0gYS9Eb2N1bWVudGF0
aW9uL3ZtL2htbS5yc3QKKysrIGIvRG9jdW1lbnRhdGlvbi92bS9obW0ucnN0CkBAIC0yMzcsNyAr
MjM3LDcgQEAgVGhlIHVzYWdlIHBhdHRlcm4gaXM6OgogICAgICAgcmV0ID0gaG1tX3JhbmdlX3Nu
YXBzaG90KCZyYW5nZSk7CiAgICAgICBpZiAocmV0KSB7CiAgICAgICAgICAgdXBfcmVhZCgmbW0t
Pm1tYXBfc2VtKTsKLSAgICAgICAgICBpZiAocmV0ID09IC1FQUdBSU4pIHsKKyAgICAgICAgICBp
ZiAocmV0ID09IC1FQlVTWSkgewogICAgICAgICAgICAgLyoKICAgICAgICAgICAgICAqIE5vIG5l
ZWQgdG8gY2hlY2sgaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQoKSByZXR1cm4gdmFsdWUKICAg
ICAgICAgICAgICAqIG9uIHJldHJ5IHdlIHdpbGwgZ2V0IHByb3BlciBlcnJvciB3aXRoIGhtbV9y
YW5nZV9zbmFwc2hvdCgpCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IGUx
ZWVkZWYxMjljZi4uMTZiNjczMWEzNGRiIDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9o
bW0uYwpAQCAtOTQ2LDcgKzk0Niw3IEBAIEVYUE9SVF9TWU1CT0woaG1tX3JhbmdlX3VucmVnaXN0
ZXIpOwogICogQHJhbmdlOiByYW5nZQogICogUmV0dXJuOiAtRUlOVkFMIGlmIGludmFsaWQgYXJn
dW1lbnQsIC1FTk9NRU0gb3V0IG9mIG1lbW9yeSwgLUVQRVJNIGludmFsaWQKICAqICAgICAgICAg
IHBlcm1pc3Npb24gKGZvciBpbnN0YW5jZSBhc2tpbmcgZm9yIHdyaXRlIGFuZCByYW5nZSBpcyBy
ZWFkIG9ubHkpLAotICogICAgICAgICAgLUVBR0FJTiBpZiB5b3UgbmVlZCB0byByZXRyeSwgLUVG
QVVMVCBpbnZhbGlkIChpZSBlaXRoZXIgbm8gdmFsaWQKKyAqICAgICAgICAgIC1FQlVTWSBpZiB5
b3UgbmVlZCB0byByZXRyeSwgLUVGQVVMVCBpbnZhbGlkIChpZSBlaXRoZXIgbm8gdmFsaWQKICAq
ICAgICAgICAgIHZtYSBvciBpdCBpcyBpbGxlZ2FsIHRvIGFjY2VzcyB0aGF0IHJhbmdlKSwgbnVt
YmVyIG9mIHZhbGlkIHBhZ2VzCiAgKiAgICAgICAgICBpbiByYW5nZS0+cGZuc1tdIChmcm9tIHJh
bmdlIHN0YXJ0IGFkZHJlc3MpLgogICoKQEAgLTk2Nyw3ICs5NjcsNyBAQCBsb25nIGhtbV9yYW5n
ZV9zbmFwc2hvdChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAlkbyB7CiAJCS8qIElmIHJhbmdl
IGlzIG5vIGxvbmdlciB2YWxpZCBmb3JjZSByZXRyeS4gKi8KIAkJaWYgKCFyYW5nZS0+dmFsaWQp
Ci0JCQlyZXR1cm4gLUVBR0FJTjsKKwkJCXJldHVybiAtRUJVU1k7CiAKIAkJdm1hID0gZmluZF92
bWEoaG1tLT5tbSwgc3RhcnQpOwogCQlpZiAodm1hID09IE5VTEwgfHwgKHZtYS0+dm1fZmxhZ3Mg
JiBkZXZpY2Vfdm1hKSkKQEAgLTEwNjIsMTAgKzEwNjIsOCBAQCBsb25nIGhtbV9yYW5nZV9mYXVs
dChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgYm9vbCBibG9jaykKIAogCWRvIHsKIAkJLyogSWYg
cmFuZ2UgaXMgbm8gbG9uZ2VyIHZhbGlkIGZvcmNlIHJldHJ5LiAqLwotCQlpZiAoIXJhbmdlLT52
YWxpZCkgewotCQkJdXBfcmVhZCgmaG1tLT5tbS0+bW1hcF9zZW0pOwotCQkJcmV0dXJuIC1FQUdB
SU47Ci0JCX0KKwkJaWYgKCFyYW5nZS0+dmFsaWQpCisJCQlyZXR1cm4gLUVCVVNZOwogCiAJCXZt
YSA9IGZpbmRfdm1hKGhtbS0+bW0sIHN0YXJ0KTsKIAkJaWYgKHZtYSA9PSBOVUxMIHx8ICh2bWEt
PnZtX2ZsYWdzICYgZGV2aWNlX3ZtYSkpCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
