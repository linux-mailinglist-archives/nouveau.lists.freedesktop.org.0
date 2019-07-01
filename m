Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D134B5B4CF
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:21:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55DD989F2D;
	Mon,  1 Jul 2019 06:21:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB83E89F2D;
 Mon,  1 Jul 2019 06:21:08 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgX-0003Jv-Ab; Mon, 01 Jul 2019 06:21:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:17 +0200
Message-Id: <20190701062020.19239-20-hch@lst.de>
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
 bh=IzZcWaqQrWGdZeOcxQugf7n/YqC01MqphcLxaz0+wR0=; b=iKEi8d7gceCqjmsj3y6uTQglI6
 NtyilHlo/Z3cOVWCQphycuVqQ9ZQEAaUmLuPbPaLq8x+TUQ4nPQItVtJhEJtMCQJXUZZyE10291/3
 /dabnPYnGrVGTga/rAs5SVW+jf9uVsAeL5AaxVeQdjMWxlyZygrHjfY498GAHgBJlLG/qdbo7Qntr
 l/rPVwz9p2HuKbtcYVxPcUdGtLeSCQZMVE6Ev8BYFiKy+/6rYLpa5KX6wp4Uhe+17QegQ7nBpRiaR
 MLNX+XmpbzcP/dTJzryRXIqgDprZnE9ZupEE72sMJwkCLSY4so6Z5irk7JglSSP6q8vxZyFsiEJ/m
 AzaC/mig==;
Subject: [Nouveau] [PATCH 19/22] mm: always return EBUSY for invalid ranges
 in hmm_range_{fault, snapshot}
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

V2Ugc2hvdWxkIG5vdCBoYXZlIHR3byBkaWZmZXJlbnQgZXJyb3IgY29kZXMgZm9yIHRoZSBzYW1l
IGNvbmRpdGlvbi4gIEluCmFkZGl0aW9uIHRoaXMgcmVhbGx5IGNvbXBsaWNhdGVzIHRoZSBjb2Rl
IGR1ZSB0byB0aGUgc3BlY2lhbCBoYW5kbGluZyBvZgpFQUdBSU4gdGhhdCBkcm9wcyB0aGUgbW1h
cF9zZW0gZHVlIHRvIHRoZSBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIGxvZ2ljCmluIHRoZSBjb3Jl
IHZtLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQog
bW0vaG1tLmMgfCA4ICsrKy0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA1
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggYzg1
ZWQ3ZDRlMmNlLi5kMTI1ZGY2OThlMmIgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2ht
bS5jCkBAIC05NzQsNyArOTc0LDcgQEAgbG9uZyBobW1fcmFuZ2Vfc25hcHNob3Qoc3RydWN0IGht
bV9yYW5nZSAqcmFuZ2UpCiAJZG8gewogCQkvKiBJZiByYW5nZSBpcyBubyBsb25nZXIgdmFsaWQg
Zm9yY2UgcmV0cnkuICovCiAJCWlmICghcmFuZ2UtPnZhbGlkKQotCQkJcmV0dXJuIC1FQUdBSU47
CisJCQlyZXR1cm4gLUVCVVNZOwogCiAJCXZtYSA9IGZpbmRfdm1hKGhtbS0+bW0sIHN0YXJ0KTsK
IAkJaWYgKHZtYSA9PSBOVUxMIHx8ICh2bWEtPnZtX2ZsYWdzICYgZGV2aWNlX3ZtYSkpCkBAIC0x
MDY5LDEwICsxMDY5LDggQEAgbG9uZyBobW1fcmFuZ2VfZmF1bHQoc3RydWN0IGhtbV9yYW5nZSAq
cmFuZ2UsIGJvb2wgYmxvY2spCiAKIAlkbyB7CiAJCS8qIElmIHJhbmdlIGlzIG5vIGxvbmdlciB2
YWxpZCBmb3JjZSByZXRyeS4gKi8KLQkJaWYgKCFyYW5nZS0+dmFsaWQpIHsKLQkJCXVwX3JlYWQo
JmhtbS0+bW0tPm1tYXBfc2VtKTsKLQkJCXJldHVybiAtRUFHQUlOOwotCQl9CisJCWlmICghcmFu
Z2UtPnZhbGlkKQorCQkJcmV0dXJuIC1FQlVTWTsKIAogCQl2bWEgPSBmaW5kX3ZtYShobW0tPm1t
LCBzdGFydCk7CiAJCWlmICh2bWEgPT0gTlVMTCB8fCAodm1hLT52bV9mbGFncyAmIGRldmljZV92
bWEpKQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9y
ZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
