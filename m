Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 271E9434D6
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D7EB8986D;
	Thu, 13 Jun 2019 09:44:04 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9DA489864;
 Thu, 13 Jun 2019 09:44:03 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMH2-0001qR-Mm; Thu, 13 Jun 2019 09:44:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:14 +0200
Message-Id: <20190613094326.24093-12-hch@lst.de>
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
 bh=kSl39t9D+nytN/xDZfA4PvUR9mE53ZbXgno/pdognno=; b=Pg029Ia8KJtlrfMQ0yw+zwPSDw
 FMI7A9BfUV19MJTx+3Zf9j3PpkbtUVH9VY8m9xQkHd3RwgbOrDoNCA19Qp091FCrZDRM/0CXcP8nf
 UcjsnWTrsgwuevTVg669Fa8aDofnaMryH2Hun/OYAXB9MiliZSYfJRgooDoNYrLm/pkZ1I6Fkmta8
 3k+SKma8EAtOLhmdRAsqEWdWPxuuBzFF8QR3KYnP39oIhc6LMbc7bhLeOsJpfxTdpo1T+14Y3k7Xb
 SVfxoSvQlltcSayigSX10q/5lD2qbaTFtAlIIb698SdZR9apu5ZPGiQU0jf01KymXFfF+uBXgtK0n
 kTCNmUFQ==;
Subject: [Nouveau] [PATCH 11/22] memremap: remove the data field in struct
 dev_pagemap
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

c3RydWN0IGRldl9wYWdlbWFwIGlzIGFsd2F5cyBlbWJlZGRlZCBpbnRvIGEgY29udGFpbmluZyBz
dHJ1Y3R1cmUsIHNvCnRoZXJlIGlzIG5vIG5lZWQgdG8gYW4gYWRkaXRpb25hbCBwcml2YXRlIGRh
dGEgZmllbGQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBkcml2ZXJzL252ZGltbS9wbWVtLmMgICAgfCAyICstCiBpbmNsdWRlL2xpbnV4L21lbXJl
bWFwLmggfCAzICstLQoga2VybmVsL21lbXJlbWFwLmMgICAgICAgIHwgMiArLQogbW0vaG1tLmMg
ICAgICAgICAgICAgICAgIHwgOSArKysrKy0tLS0KIDQgZmlsZXMgY2hhbmdlZCwgOCBpbnNlcnRp
b25zKCspLCA4IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvbnZkaW1tL3BtZW0u
YyBiL2RyaXZlcnMvbnZkaW1tL3BtZW0uYwppbmRleCA2NjgzN2VlZDYzNzUuLjg0N2QxYjJiYzEw
ZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9udmRpbW0vcG1lbS5jCisrKyBiL2RyaXZlcnMvbnZkaW1t
L3BtZW0uYwpAQCAtMzM0LDcgKzMzNCw3IEBAIHN0YXRpYyB2b2lkIHBtZW1fcmVsZWFzZV9kaXNr
KHZvaWQgKl9fcG1lbSkKIAlwdXRfZGlzayhwbWVtLT5kaXNrKTsKIH0KIAotc3RhdGljIHZvaWQg
cG1lbV9mc2RheF9wYWdlX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCitzdGF0
aWMgdm9pZCBwbWVtX2ZzZGF4X3BhZ2VfZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSkKIHsKIAl3YWtl
X3VwX3ZhcigmcGFnZS0+X3JlZmNvdW50KTsKIH0KZGlmZiAtLWdpdCBhL2luY2x1ZGUvbGludXgv
bWVtcmVtYXAuaCBiL2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaAppbmRleCAwM2E0MDk5YmU3MDEu
Ljc1YjgwZGU2Mzk0YSAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oCisrKyBi
L2luY2x1ZGUvbGludXgvbWVtcmVtYXAuaApAQCAtNjksNyArNjksNyBAQCBzdHJ1Y3QgZGV2X3Bh
Z2VtYXBfb3BzIHsKIAkgKiByZWFjaCAwIHJlZmNvdW50IHVubGVzcyB0aGVyZSBpcyBhIHJlZmNv
dW50IGJ1Zy4gVGhpcyBhbGxvd3MgdGhlCiAJICogZGV2aWNlIGRyaXZlciB0byBpbXBsZW1lbnQg
aXRzIG93biBtZW1vcnkgbWFuYWdlbWVudC4pCiAJICovCi0Jdm9pZCAoKnBhZ2VfZnJlZSkoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpOworCXZvaWQgKCpwYWdlX2ZyZWUpKHN0cnVjdCBw
YWdlICpwYWdlKTsKIAogCS8qCiAJICogVHJhbnNpdGlvbiB0aGUgcGVyY3B1X3JlZiBpbiBzdHJ1
Y3QgZGV2X3BhZ2VtYXAgdG8gdGhlIGRlYWQgc3RhdGUuCkBAIC05OSw3ICs5OSw2IEBAIHN0cnVj
dCBkZXZfcGFnZW1hcCB7CiAJc3RydWN0IHJlc291cmNlIHJlczsKIAlzdHJ1Y3QgcGVyY3B1X3Jl
ZiAqcmVmOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKLQl2b2lkICpkYXRhOwogCWVudW0gbWVtb3J5
X3R5cGUgdHlwZTsKIAl1NjQgcGNpX3AycGRtYV9idXNfb2Zmc2V0OwogCWNvbnN0IHN0cnVjdCBk
ZXZfcGFnZW1hcF9vcHMgKm9wczsKZGlmZiAtLWdpdCBhL2tlcm5lbC9tZW1yZW1hcC5jIGIva2Vy
bmVsL21lbXJlbWFwLmMKaW5kZXggNzE2N2U3MTc2NDdkLi41Yzk0YWQ0ZjU3ODMgMTAwNjQ0Ci0t
LSBhL2tlcm5lbC9tZW1yZW1hcC5jCisrKyBiL2tlcm5lbC9tZW1yZW1hcC5jCkBAIC0zMzcsNyAr
MzM3LDcgQEAgdm9pZCBfX3B1dF9kZXZtYXBfbWFuYWdlZF9wYWdlKHN0cnVjdCBwYWdlICpwYWdl
KQogCiAJCW1lbV9jZ3JvdXBfdW5jaGFyZ2UocGFnZSk7CiAKLQkJcGFnZS0+cGdtYXAtPm9wcy0+
cGFnZV9mcmVlKHBhZ2UsIHBhZ2UtPnBnbWFwLT5kYXRhKTsKKwkJcGFnZS0+cGdtYXAtPm9wcy0+
cGFnZV9mcmVlKHBhZ2UpOwogCX0gZWxzZSBpZiAoIWNvdW50KQogCQlfX3B1dF9wYWdlKHBhZ2Up
OwogfQpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBhYWI3OTk2NzdjN2Qu
LmZmMGY5NTY4OTIyYiAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTEz
MzIsMTUgKzEzMzIsMTcgQEAgc3RhdGljIHZvaWQgaG1tX2Rldm1lbV9yZWZfa2lsbChzdHJ1Y3Qg
ZGV2X3BhZ2VtYXAgKnBnbWFwKQogCiBzdGF0aWMgdm1fZmF1bHRfdCBobW1fZGV2bWVtX21pZ3Jh
dGUoc3RydWN0IHZtX2ZhdWx0ICp2bWYpCiB7Ci0Jc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSA9
IHZtZi0+cGFnZS0+cGdtYXAtPmRhdGE7CisJc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSA9CisJ
CWNvbnRhaW5lcl9vZih2bWYtPnBhZ2UtPnBnbWFwLCBzdHJ1Y3QgaG1tX2Rldm1lbSwgcGFnZW1h
cCk7CiAKIAlyZXR1cm4gZGV2bWVtLT5vcHMtPmZhdWx0KGRldm1lbSwgdm1mLT52bWEsIHZtZi0+
YWRkcmVzcywgdm1mLT5wYWdlLAogCQkJdm1mLT5mbGFncywgdm1mLT5wbWQpOwogfQogCi1zdGF0
aWMgdm9pZCBobW1fZGV2bWVtX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCitz
dGF0aWMgdm9pZCBobW1fZGV2bWVtX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UpCiB7Ci0Jc3RydWN0
IGhtbV9kZXZtZW0gKmRldm1lbSA9IGRhdGE7CisJc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbSA9
CisJCWNvbnRhaW5lcl9vZihwYWdlLT5wZ21hcCwgc3RydWN0IGhtbV9kZXZtZW0sIHBhZ2VtYXAp
OwogCiAJZGV2bWVtLT5vcHMtPmZyZWUoZGV2bWVtLCBwYWdlKTsKIH0KQEAgLTE0MDksNyArMTQx
MSw2IEBAIHN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZChjb25zdCBzdHJ1Y3QgaG1t
X2Rldm1lbV9vcHMgKm9wcywKIAlkZXZtZW0tPnBhZ2VtYXAub3BzID0gJmhtbV9wYWdlbWFwX29w
czsKIAlkZXZtZW0tPnBhZ2VtYXAuYWx0bWFwX3ZhbGlkID0gZmFsc2U7CiAJZGV2bWVtLT5wYWdl
bWFwLnJlZiA9ICZkZXZtZW0tPnJlZjsKLQlkZXZtZW0tPnBhZ2VtYXAuZGF0YSA9IGRldm1lbTsK
IAogCXJlc3VsdCA9IGRldm1fbWVtcmVtYXBfcGFnZXMoZGV2bWVtLT5kZXZpY2UsICZkZXZtZW0t
PnBhZ2VtYXApOwogCWlmIChJU19FUlIocmVzdWx0KSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
