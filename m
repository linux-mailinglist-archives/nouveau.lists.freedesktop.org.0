Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0FE257A09D
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C4BE6E3E5;
	Tue, 30 Jul 2019 05:52:23 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6BA8A89FD7;
 Tue, 30 Jul 2019 05:52:21 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3Z-000154-Lg; Tue, 30 Jul 2019 05:52:18 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:51:51 +0300
Message-Id: <20190730055203.28467-2-hch@lst.de>
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
 bh=wGT0bIW6ZV4QHMeBIyzrsptb3Nkhx6kX9nD5TRsY+c8=; b=ki48yLXEl1xJO9gV+39wOL1+y4
 wZUPYoqzhuNLoAUej9SJNFqjxYoDfeF+zcoWTFIq79SU2dw9V4rtDFH9JYB6dp5qDlHOfUF6g5GUx
 JPpQ+gBYb9/5cNNU1yw5rxdau5EGWyoD1usdNNwqaDiB2NAzGKDv39L59sbM/rDJL0O/c8V8icRLO
 IDGx1Argn4Mazv1HFxn+KxWQbirB8spS5aq6oofxF4YASh2sIDt4wCApTnUblx5u77wLLZLq+Mq8q
 EkU5EF5o8yTZ2SfJUnTVtafXCPfDL7NTm4L9dySd4Nqc3T4K/jP1nQG6ETC9e6EK/1Vr44X4BbE1V
 nstFkRew==;
Subject: [Nouveau] [PATCH 01/13] amdgpu: remove -EAGAIN handling for
 hmm_range_fault
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

aG1tX3JhbmdlX2ZhdWx0IGNhbiBvbmx5IHJldHVybiAtRUFHQUlOIGlmIGNhbGxlZCB3aXRoIHRo
ZSBibG9jawphcmd1bWVudCBzZXQgdG8gZmFsc2UsIHNvIHJlbW92ZSB0aGUgc3BlY2lhbCBoYW5k
bGluZyBmb3IgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfdHRtLmMgfCAyMyArKyst
LS0tLS0tLS0tLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMjAg
ZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1k
Z3B1X3R0bS5jIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jCmluZGV4
IDEyYTU5YWM4M2Y3Mi4uZjA4MjE2MzhiYmM2IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
YW1kL2FtZGdwdS9hbWRncHVfdHRtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUv
YW1kZ3B1X3R0bS5jCkBAIC03NzgsNyArNzc4LDYgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3Vz
ZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBwYWdlICoqcGFnZXMpCiAJc3Ry
dWN0IGhtbV9yYW5nZSAqcmFuZ2U7CiAJdW5zaWduZWQgbG9uZyBpOwogCXVpbnQ2NF90ICpwZm5z
OwotCWludCByZXRyeSA9IDA7CiAJaW50IHIgPSAwOwogCiAJaWYgKCFtbSkgLyogSGFwcGVucyBk
dXJpbmcgcHJvY2VzcyBzaHV0ZG93biAqLwpAQCAtODIyLDcgKzgyMSw2IEBAIGludCBhbWRncHVf
dHRtX3R0X2dldF91c2VyX3BhZ2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAq
KnBhZ2VzKQogCWhtbV9yYW5nZV9yZWdpc3RlcihyYW5nZSwgbWlycm9yLCBzdGFydCwKIAkJCSAg
IHN0YXJ0ICsgdHRtLT5udW1fcGFnZXMgKiBQQUdFX1NJWkUsIFBBR0VfU0hJRlQpOwogCi1yZXRy
eToKIAkvKgogCSAqIEp1c3Qgd2FpdCBmb3IgcmFuZ2UgdG8gYmUgdmFsaWQsIHNhZmUgdG8gaWdu
b3JlIHJldHVybiB2YWx1ZSBhcyB3ZQogCSAqIHdpbGwgdXNlIHRoZSByZXR1cm4gdmFsdWUgb2Yg
aG1tX3JhbmdlX2ZhdWx0KCkgYmVsb3cgdW5kZXIgdGhlCkBAIC04MzEsMjQgKzgyOSwxMiBAQCBp
bnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3Ry
dWN0IHBhZ2UgKipwYWdlcykKIAlobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChyYW5nZSwgSE1N
X1JBTkdFX0RFRkFVTFRfVElNRU9VVCk7CiAKIAlkb3duX3JlYWQoJm1tLT5tbWFwX3NlbSk7Ci0K
IAlyID0gaG1tX3JhbmdlX2ZhdWx0KHJhbmdlLCAwKTsKLQlpZiAodW5saWtlbHkociA8IDApKSB7
Ci0JCWlmIChsaWtlbHkociA9PSAtRUFHQUlOKSkgewotCQkJLyoKLQkJCSAqIHJldHVybiAtRUFH
QUlOLCBtbWFwX3NlbSBpcyBkcm9wcGVkCi0JCQkgKi8KLQkJCWlmIChyZXRyeSsrIDwgTUFYX1JF
VFJZX0hNTV9SQU5HRV9GQVVMVCkKLQkJCQlnb3RvIHJldHJ5OwotCQkJZWxzZQotCQkJCXByX2Vy
cigiUmV0cnkgaG1tIGZhdWx0IHRvbyBtYW55IHRpbWVzXG4iKTsKLQkJfQotCi0JCWdvdG8gb3V0
X3VwX3JlYWQ7Ci0JfQotCiAJdXBfcmVhZCgmbW0tPm1tYXBfc2VtKTsKIAorCWlmICh1bmxpa2Vs
eShyIDwgMCkpCisJCWdvdG8gb3V0X2ZyZWVfcGZuczsKKwogCWZvciAoaSA9IDA7IGkgPCB0dG0t
Pm51bV9wYWdlczsgaSsrKSB7CiAJCXBhZ2VzW2ldID0gaG1tX2RldmljZV9lbnRyeV90b19wYWdl
KHJhbmdlLCBwZm5zW2ldKTsKIAkJaWYgKHVubGlrZWx5KCFwYWdlc1tpXSkpIHsKQEAgLTg2NCw5
ICs4NTAsNiBAQCBpbnQgYW1kZ3B1X3R0bV90dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1
X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdlcykKIAogCXJldHVybiAwOwogCi1vdXRfdXBfcmVh
ZDoKLQlpZiAobGlrZWx5KHIgIT0gLUVBR0FJTikpCi0JCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7
CiBvdXRfZnJlZV9wZm5zOgogCWhtbV9yYW5nZV91bnJlZ2lzdGVyKHJhbmdlKTsKIAlrdmZyZWUo
cGZucyk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQ==
