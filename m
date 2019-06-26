Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8A568D0
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CF6C46E3C7;
	Wed, 26 Jun 2019 12:27:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C89A6E3BC;
 Wed, 26 Jun 2019 12:27:47 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71T-0001LI-FP; Wed, 26 Jun 2019 12:27:36 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:02 +0200
Message-Id: <20190626122724.13313-4-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626122724.13313-1-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
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
 bh=tNgbIaFusBSvgAH0tfiGZyikD01HyoX3FofXPz2PChg=; b=M5RvEFLk+xIi2sTIO00V1tX6nN
 Gas2OAPsm1RlVSmT8mEzUg67uQy5Ztrh4Dy2+VDFaybxSBu9cD+Zubb2kEKq3ZgXa2N3+M+MjK4RS
 /lvmIiR4bg6GCmFpkNQJEblVadLbxP29esClvEVUoJpempikVE3+jPaymXArWMF5wu1d+pU/lenHS
 O832RJqlERaIYCMWPFXMC2DpvqxzI2jLAIukePF57ECvYnIUGaEn08FT4Md+/es9ooWC8+J73/u2t
 wKW9puCoUaWunC/FTlqtJUVADewWKckr6vI895VX3CSClMhkQHH6I2GbIPFNNNGq5kmrXIBkvg173
 XtY/cvdg==;
Subject: [Nouveau] [PATCH 03/25] mm: remove hmm_devmem_add_resource
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
Cc: Michal Hocko <mhocko@suse.com>, linux-nvdimm@lists.01.org,
 linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2VkIHNpbmNlIGl0IHdhcyBmaXJzdCBhZGRl
ZCB0byB0aGUga2VybmVsCm1vcmUgdGhhbiBhIHllYXIgYW5kIGEgaGFsZiBhZ28sIGFuZCBpZiB3
ZSBldmVyIGdyb3cgYSBjb25zdW1lciBvZiB0aGUKTUVNT1JZX0RFVklDRV9QVUJMSUMgaW5mcmFz
dHJ1Y3R1cmUgaXQgY2FuIGVhc2lseSB1c2UgZGV2bV9tZW1yZW1hcF9wYWdlcwpkaXJlY3RseS4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpSZXZpZXdlZC1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTogSm9obiBI
dWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpBY2tlZC1ieTogTWljaGFsIEhvY2tvIDxtaG9j
a29Ac3VzZS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9obW0uaCB8ICAzIC0tLQogbW0vaG1tLmMg
ICAgICAgICAgICB8IDUwIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLQogMiBmaWxlcyBjaGFuZ2VkLCA1MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNs
dWRlL2xpbnV4L2htbS5oIGIvaW5jbHVkZS9saW51eC9obW0uaAppbmRleCA5OTc2NWJlMzI4NGQu
LjVjNDZiMGY2MDNmZCAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAorKysgYi9pbmNs
dWRlL2xpbnV4L2htbS5oCkBAIC03MjIsOSArNzIyLDYgQEAgc3RydWN0IGhtbV9kZXZtZW0gewog
c3RydWN0IGhtbV9kZXZtZW0gKmhtbV9kZXZtZW1fYWRkKGNvbnN0IHN0cnVjdCBobW1fZGV2bWVt
X29wcyAqb3BzLAogCQkJCSAgc3RydWN0IGRldmljZSAqZGV2aWNlLAogCQkJCSAgdW5zaWduZWQg
bG9uZyBzaXplKTsKLXN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZF9yZXNvdXJjZShj
b25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKLQkJCQkJICAgc3RydWN0IGRldmljZSAq
ZGV2aWNlLAotCQkJCQkgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlcyk7CiAKIC8qCiAgKiBobW1fZGV2
bWVtX3BhZ2Vfc2V0X2RydmRhdGEgLSBzZXQgcGVyLXBhZ2UgZHJpdmVyIGRhdGEgZmllbGQKZGlm
ZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggMDBjYzY0MmIzZDdlLi5iZDI2MGEz
YjZiMDkgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xNDc4LDU0ICsx
NDc4LDQgQEAgc3RydWN0IGhtbV9kZXZtZW0gKmhtbV9kZXZtZW1fYWRkKGNvbnN0IHN0cnVjdCBo
bW1fZGV2bWVtX29wcyAqb3BzLAogCXJldHVybiBkZXZtZW07CiB9CiBFWFBPUlRfU1lNQk9MX0dQ
TChobW1fZGV2bWVtX2FkZCk7Ci0KLXN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZF9y
ZXNvdXJjZShjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKLQkJCQkJICAgc3RydWN0
IGRldmljZSAqZGV2aWNlLAotCQkJCQkgICBzdHJ1Y3QgcmVzb3VyY2UgKnJlcykKLXsKLQlzdHJ1
Y3QgaG1tX2Rldm1lbSAqZGV2bWVtOwotCXZvaWQgKnJlc3VsdDsKLQlpbnQgcmV0OwotCi0JaWYg
KHJlcy0+ZGVzYyAhPSBJT1JFU19ERVNDX0RFVklDRV9QVUJMSUNfTUVNT1JZKQotCQlyZXR1cm4g
RVJSX1BUUigtRUlOVkFMKTsKLQotCWRldl9wYWdlbWFwX2dldF9vcHMoKTsKLQotCWRldm1lbSA9
IGRldm1fa3phbGxvYyhkZXZpY2UsIHNpemVvZigqZGV2bWVtKSwgR0ZQX0tFUk5FTCk7Ci0JaWYg
KCFkZXZtZW0pCi0JCXJldHVybiBFUlJfUFRSKC1FTk9NRU0pOwotCi0JaW5pdF9jb21wbGV0aW9u
KCZkZXZtZW0tPmNvbXBsZXRpb24pOwotCWRldm1lbS0+cGZuX2ZpcnN0ID0gLTFVTDsKLQlkZXZt
ZW0tPnBmbl9sYXN0ID0gLTFVTDsKLQlkZXZtZW0tPnJlc291cmNlID0gcmVzOwotCWRldm1lbS0+
ZGV2aWNlID0gZGV2aWNlOwotCWRldm1lbS0+b3BzID0gb3BzOwotCi0JcmV0ID0gcGVyY3B1X3Jl
Zl9pbml0KCZkZXZtZW0tPnJlZiwgJmhtbV9kZXZtZW1fcmVmX3JlbGVhc2UsCi0JCQkgICAgICAw
LCBHRlBfS0VSTkVMKTsKLQlpZiAocmV0KQotCQlyZXR1cm4gRVJSX1BUUihyZXQpOwotCi0JZGV2
bWVtLT5wZm5fZmlyc3QgPSBkZXZtZW0tPnJlc291cmNlLT5zdGFydCA+PiBQQUdFX1NISUZUOwot
CWRldm1lbS0+cGZuX2xhc3QgPSBkZXZtZW0tPnBmbl9maXJzdCArCi0JCQkgICAocmVzb3VyY2Vf
c2l6ZShkZXZtZW0tPnJlc291cmNlKSA+PiBQQUdFX1NISUZUKTsKLQlkZXZtZW0tPnBhZ2VfZmF1
bHQgPSBobW1fZGV2bWVtX2ZhdWx0OwotCi0JZGV2bWVtLT5wYWdlbWFwLnR5cGUgPSBNRU1PUllf
REVWSUNFX1BVQkxJQzsKLQlkZXZtZW0tPnBhZ2VtYXAucmVzID0gKmRldm1lbS0+cmVzb3VyY2U7
Ci0JZGV2bWVtLT5wYWdlbWFwLnBhZ2VfZnJlZSA9IGhtbV9kZXZtZW1fZnJlZTsKLQlkZXZtZW0t
PnBhZ2VtYXAuYWx0bWFwX3ZhbGlkID0gZmFsc2U7Ci0JZGV2bWVtLT5wYWdlbWFwLnJlZiA9ICZk
ZXZtZW0tPnJlZjsKLQlkZXZtZW0tPnBhZ2VtYXAuZGF0YSA9IGRldm1lbTsKLQlkZXZtZW0tPnBh
Z2VtYXAua2lsbCA9IGhtbV9kZXZtZW1fcmVmX2tpbGw7Ci0JZGV2bWVtLT5wYWdlbWFwLmNsZWFu
dXAgPSBobW1fZGV2bWVtX3JlZl9leGl0OwotCi0JcmVzdWx0ID0gZGV2bV9tZW1yZW1hcF9wYWdl
cyhkZXZtZW0tPmRldmljZSwgJmRldm1lbS0+cGFnZW1hcCk7Ci0JaWYgKElTX0VSUihyZXN1bHQp
KQotCQlyZXR1cm4gcmVzdWx0OwotCXJldHVybiBkZXZtZW07Ci19Ci1FWFBPUlRfU1lNQk9MX0dQ
TChobW1fZGV2bWVtX2FkZF9yZXNvdXJjZSk7CiAjZW5kaWYgLyogQ09ORklHX0RFVklDRV9QUklW
QVRFIHx8IENPTkZJR19ERVZJQ0VfUFVCTElDICovCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
