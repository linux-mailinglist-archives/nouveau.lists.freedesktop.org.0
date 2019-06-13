Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20495434DF
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5C8982F;
	Thu, 13 Jun 2019 09:44:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 484BE8989E;
 Thu, 13 Jun 2019 09:44:18 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMHG-0001u9-ME; Thu, 13 Jun 2019 09:44:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:19 +0200
Message-Id: <20190613094326.24093-17-hch@lst.de>
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
 bh=AuQMTpcqJo62VjhPIKMCZhZk+h6e6THsOZ01qDGPkX8=; b=rUn+qQErmwhgGijTtCS+CPfQfX
 C6JSAQ1wYIYTWBE1sk8wIkEnTQn0lkCbB5R+ffY6ISa5sjGbOSw0+7bEyC7m+Qij4zcVeeFUifawM
 Un1Dx3C+QCWSrqmn1w2RLX0JpvUup817a1QufBRSu4NPSt1SswH6b9wJA03REDNoLrDPDc5TclJrr
 xEr8kX7Hqw6gfUzged3ZKit4eyUFtG+CmH6acz3g27hPRgnBplRhZJoO5JRbm+/AUSeySbU2/KzoK
 i4uKJlLh0eU/1N6Uuc+zL/fMMHvYHpiCNP22jqmNO+zDGCudBxJG6+3+BI8MnXE1HOXlORblkJtCC
 FLHmz0jw==;
Subject: [Nouveau] [PATCH 16/22] mm: remove hmm_vma_alloc_locked_page
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

VGhlIG9ubHkgdXNlciBvZiBpdCBoYXMganVzdCBiZWVuIHJlbW92ZWQsIGFuZCB0aGVyZSB3YXNu
J3QgcmVhbGx5IGFueSBuZWVkCnRvIHdyYXAgYSBiYXNpYyBtZW1vcnkgYWxsb2NhdG9yIHRvIHN0
YXJ0IHdpdGguCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBpbmNsdWRlL2xpbnV4L2htbS5oIHwgIDMgLS0tCiBtbS9obW0uYyAgICAgICAgICAgIHwg
MTQgLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgMTcgZGVsZXRpb25zKC0pCgpkaWZm
IC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXgg
M2M5YTU5ZGJmZGI4Li4wZTYxZDgzMGIwYTkgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaG1t
LmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNTUzLDkgKzU1Myw2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1Y3QgbW1fc3RydWN0ICptbSkge30KICNpZiBJU19F
TkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkgfHwgIElTX0VOQUJMRUQoQ09ORklHX0RFVklD
RV9QVUJMSUMpCiBzdHJ1Y3QgaG1tX2Rldm1lbTsKIAotc3RydWN0IHBhZ2UgKmhtbV92bWFfYWxs
b2NfbG9ja2VkX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCi0JCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgYWRkcik7Ci0KIC8qCiAgKiBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgLSBjYWxs
YmFjayBmb3IgWk9ORV9ERVZJQ0UgbWVtb3J5IGV2ZW50cwogICoKZGlmZiAtLWdpdCBhL21tL2ht
bS5jIGIvbW0vaG1tLmMKaW5kZXggZmYwZjk1Njg5MjJiLi5jMTUyODNmOWJiZjAgMTAwNjQ0Ci0t
LSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMjkzLDIwICsxMjkzLDYgQEAgRVhQT1JU
X1NZTUJPTChobW1fcmFuZ2VfZG1hX3VubWFwKTsKIAogCiAjaWYgSVNfRU5BQkxFRChDT05GSUdf
REVWSUNFX1BSSVZBVEUpIHx8ICBJU19FTkFCTEVEKENPTkZJR19ERVZJQ0VfUFVCTElDKQotc3Ry
dWN0IHBhZ2UgKmhtbV92bWFfYWxsb2NfbG9ja2VkX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0
ICp2bWEsCi0JCQkJICAgICAgIHVuc2lnbmVkIGxvbmcgYWRkcikKLXsKLQlzdHJ1Y3QgcGFnZSAq
cGFnZTsKLQotCXBhZ2UgPSBhbGxvY19wYWdlX3ZtYShHRlBfSElHSFVTRVIsIHZtYSwgYWRkcik7
Ci0JaWYgKCFwYWdlKQotCQlyZXR1cm4gTlVMTDsKLQlsb2NrX3BhZ2UocGFnZSk7Ci0JcmV0dXJu
IHBhZ2U7Ci19Ci1FWFBPUlRfU1lNQk9MKGhtbV92bWFfYWxsb2NfbG9ja2VkX3BhZ2UpOwotCi0K
IHN0YXRpYyB2b2lkIGhtbV9kZXZtZW1fcmVmX3JlbGVhc2Uoc3RydWN0IHBlcmNwdV9yZWYgKnJl
ZikKIHsKIAlzdHJ1Y3QgaG1tX2Rldm1lbSAqZGV2bWVtOwotLSAKMi4yMC4xCgpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlz
dApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
