Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AB1E434C4
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:43:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 18C96897E4;
	Thu, 13 Jun 2019 09:43:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FBFA897E4;
 Thu, 13 Jun 2019 09:43:41 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMGf-0001kQ-VY; Thu, 13 Jun 2019 09:43:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:06 +0200
Message-Id: <20190613094326.24093-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613094326.24093-1-hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
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
 bh=xP52k8PSxiWJA231A7iOWwtNJf1wPwc/yjXMJD2RBtk=; b=YfEdLD5CH3U9ysOCwdL2FYmTCm
 7+M9qmqGSvaM914U2KnoFaX+n4shPpJhrUd/PvcrkZkqrHimpFDBxMasr7oVEDrDKecmBuTaLZCGM
 iT/KWUgZgRrB5zdJ/8S6pGh3KqkYgPjzhaOvvfgtZVAUrvCGJ6viIrfd+IFAUOmCbaSXdn3Xqi6dP
 IyH7Omvq4XCgzsLItQEh8dQn6hfmBqy4TB1udG/rSepK2+eOtVvT3UK4eCYBuVf36OinvPDjaWT7K
 MXnnYC67WwxGCvY3QR0pM8YGYOMCMRIMWbIz573pF9NwIAyI8Sbpnmm+OJEQEqq7JYkUxrcjdGlkh
 kmjcQnIg==;
Subject: [Nouveau] [PATCH 03/22] mm: remove hmm_devmem_add_resource
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2VkIHNpbmNlIGl0IHdhcyBmaXJzdCBhZGRl
ZCB0byB0aGUga2VybmVsCm1vcmUgdGhhbiBhIHllYXIgYW5kIGEgaGFsZiBhZ28sIGFuZCBpZiB3
ZSBldmVyIGdyb3cgYSBjb25zdW1lciBvZiB0aGUKTUVNT1JZX0RFVklDRV9QVUJMSUMgaW5mcmFz
dHJ1Y3R1cmUgaXQgY2FuIGVhc2lseSB1c2UgZGV2bV9tZW1yZW1hcF9wYWdlcwpkaXJlY3RseSBu
b3cgdGhhdCB3ZSd2ZSBzaW1wbGlmaWVkIHRoZSBBUEkgZm9yIGl0LgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogaW5jbHVkZS9saW51eC9obW0uaCB8
ICAzIC0tLQogbW0vaG1tLmMgICAgICAgICAgICB8IDU0IC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1NyBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaApp
bmRleCA0ODY3YjlkYTFiNmMuLjU3NjFhMzkyMjFhNiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51
eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC02ODgsOSArNjg4LDYgQEAgc3Ry
dWN0IGhtbV9kZXZtZW0gewogc3RydWN0IGhtbV9kZXZtZW0gKmhtbV9kZXZtZW1fYWRkKGNvbnN0
IHN0cnVjdCBobW1fZGV2bWVtX29wcyAqb3BzLAogCQkJCSAgc3RydWN0IGRldmljZSAqZGV2aWNl
LAogCQkJCSAgdW5zaWduZWQgbG9uZyBzaXplKTsKLXN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2
bWVtX2FkZF9yZXNvdXJjZShjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKLQkJCQkJ
ICAgc3RydWN0IGRldmljZSAqZGV2aWNlLAotCQkJCQkgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlcyk7
CiAKIC8qCiAgKiBobW1fZGV2bWVtX3BhZ2Vfc2V0X2RydmRhdGEgLSBzZXQgcGVyLXBhZ2UgZHJp
dmVyIGRhdGEgZmllbGQKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggZmYy
NTk4ZWI3Mzc3Li4wYzYyNDI2ZDEyNTcgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2ht
bS5jCkBAIC0xNDQ1LDU4ICsxNDQ1LDQgQEAgc3RydWN0IGhtbV9kZXZtZW0gKmhtbV9kZXZtZW1f
YWRkKGNvbnN0IHN0cnVjdCBobW1fZGV2bWVtX29wcyAqb3BzLAogCXJldHVybiBkZXZtZW07CiB9
CiBFWFBPUlRfU1lNQk9MX0dQTChobW1fZGV2bWVtX2FkZCk7Ci0KLXN0cnVjdCBobW1fZGV2bWVt
ICpobW1fZGV2bWVtX2FkZF9yZXNvdXJjZShjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9w
cywKLQkJCQkJICAgc3RydWN0IGRldmljZSAqZGV2aWNlLAotCQkJCQkgICBzdHJ1Y3QgcmVzb3Vy
Y2UgKnJlcykKLXsKLQlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtOwotCXZvaWQgKnJlc3VsdDsK
LQlpbnQgcmV0OwotCi0JaWYgKHJlcy0+ZGVzYyAhPSBJT1JFU19ERVNDX0RFVklDRV9QVUJMSUNf
TUVNT1JZKQotCQlyZXR1cm4gRVJSX1BUUigtRUlOVkFMKTsKLQotCWRldl9wYWdlbWFwX2dldF9v
cHMoKTsKLQotCWRldm1lbSA9IGRldm1fa3phbGxvYyhkZXZpY2UsIHNpemVvZigqZGV2bWVtKSwg
R0ZQX0tFUk5FTCk7Ci0JaWYgKCFkZXZtZW0pCi0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwot
Ci0JaW5pdF9jb21wbGV0aW9uKCZkZXZtZW0tPmNvbXBsZXRpb24pOwotCWRldm1lbS0+cGZuX2Zp
cnN0ID0gLTFVTDsKLQlkZXZtZW0tPnBmbl9sYXN0ID0gLTFVTDsKLQlkZXZtZW0tPnJlc291cmNl
ID0gcmVzOwotCWRldm1lbS0+ZGV2aWNlID0gZGV2aWNlOwotCWRldm1lbS0+b3BzID0gb3BzOwot
Ci0JcmV0ID0gcGVyY3B1X3JlZl9pbml0KCZkZXZtZW0tPnJlZiwgJmhtbV9kZXZtZW1fcmVmX3Jl
bGVhc2UsCi0JCQkgICAgICAwLCBHRlBfS0VSTkVMKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gRVJS
X1BUUihyZXQpOwotCi0JcmV0ID0gZGV2bV9hZGRfYWN0aW9uX29yX3Jlc2V0KGRldmljZSwgaG1t
X2Rldm1lbV9yZWZfZXhpdCwKLQkJCSZkZXZtZW0tPnJlZik7Ci0JaWYgKHJldCkKLQkJcmV0dXJu
IEVSUl9QVFIocmV0KTsKLQotCWRldm1lbS0+cGZuX2ZpcnN0ID0gZGV2bWVtLT5yZXNvdXJjZS0+
c3RhcnQgPj4gUEFHRV9TSElGVDsKLQlkZXZtZW0tPnBmbl9sYXN0ID0gZGV2bWVtLT5wZm5fZmly
c3QgKwotCQkJICAgKHJlc291cmNlX3NpemUoZGV2bWVtLT5yZXNvdXJjZSkgPj4gUEFHRV9TSElG
VCk7Ci0JZGV2bWVtLT5wYWdlX2ZhdWx0ID0gaG1tX2Rldm1lbV9mYXVsdDsKLQotCWRldm1lbS0+
cGFnZW1hcC50eXBlID0gTUVNT1JZX0RFVklDRV9QVUJMSUM7Ci0JZGV2bWVtLT5wYWdlbWFwLnJl
cyA9ICpkZXZtZW0tPnJlc291cmNlOwotCWRldm1lbS0+cGFnZW1hcC5wYWdlX2ZyZWUgPSBobW1f
ZGV2bWVtX2ZyZWU7Ci0JZGV2bWVtLT5wYWdlbWFwLmFsdG1hcF92YWxpZCA9IGZhbHNlOwotCWRl
dm1lbS0+cGFnZW1hcC5yZWYgPSAmZGV2bWVtLT5yZWY7Ci0JZGV2bWVtLT5wYWdlbWFwLmRhdGEg
PSBkZXZtZW07Ci0JZGV2bWVtLT5wYWdlbWFwLmtpbGwgPSBobW1fZGV2bWVtX3JlZl9raWxsOwot
Ci0JcmVzdWx0ID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXZtZW0tPmRldmljZSwgJmRldm1lbS0+
cGFnZW1hcCk7Ci0JaWYgKElTX0VSUihyZXN1bHQpKQotCQlyZXR1cm4gcmVzdWx0OwotCXJldHVy
biBkZXZtZW07Ci19Ci1FWFBPUlRfU1lNQk9MX0dQTChobW1fZGV2bWVtX2FkZF9yZXNvdXJjZSk7
CiAjZW5kaWYgLyogQ09ORklHX0RFVklDRV9QUklWQVRFIHx8IENPTkZJR19ERVZJQ0VfUFVCTElD
ICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
