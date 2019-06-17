Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 36A454822D
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC2168921A;
	Mon, 17 Jun 2019 12:28:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA9338921A;
 Mon, 17 Jun 2019 12:28:24 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqkF-0000KX-9f; Mon, 17 Jun 2019 12:28:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:27 +0200
Message-Id: <20190617122733.22432-20-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617122733.22432-1-hch@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
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
 bh=rfiOsXsxRAZCFDVo21abTS19/9zGASI6nRdrjMvZ5Iw=; b=oLig9/TEaZEXPR+t7+dEa5tPGZ
 RpcPa/hgJAoKo4WO6XIcMV1sCs82yI/lf9OjzRWEj+XFibg0CgidALCirzn9I/Ux8nEqBtGYl0Qhp
 UjkLcxgYpbFIOCt2hu8a+nzyW05x/LYTS/62NJNSg1oHibCDD2QPN0COJRNN2zrq9SkAjfzaA6Lr+
 zYAG9oM+7PFTegy2bOQY0pdWVMTOTKk33rjMgeztaj1iyS1JvSCd/oKCL5f0rojkYJR/4cRDYuLKc
 J4VWWF9tGqI6teBCMBGayYjyd6VOGU6+ryOE8y398cTseQsF6pbV13QaK/gGJKuNaKx6HgHODXtXL
 AcMMPXXQ==;
Subject: [Nouveau] [PATCH 19/25] mm: remove hmm_vma_alloc_locked_page
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
ZTY0ODI0MzM0Yjg1Li44OTU3MWU4ZDljNjMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaG1t
LmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNTg5LDkgKzU4OSw2IEBAIHN0YXRpYyBp
bmxpbmUgdm9pZCBobW1fbW1faW5pdChzdHJ1Y3QgbW1fc3RydWN0ICptbSkge30KICNpZiBJU19F
TkFCTEVEKENPTkZJR19ERVZJQ0VfUFJJVkFURSkgfHwgIElTX0VOQUJMRUQoQ09ORklHX0RFVklD
RV9QVUJMSUMpCiBzdHJ1Y3QgaG1tX2Rldm1lbTsKIAotc3RydWN0IHBhZ2UgKmhtbV92bWFfYWxs
b2NfbG9ja2VkX3BhZ2Uoc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCi0JCQkJICAgICAgIHVu
c2lnbmVkIGxvbmcgYWRkcik7Ci0KIC8qCiAgKiBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgLSBjYWxs
YmFjayBmb3IgWk9ORV9ERVZJQ0UgbWVtb3J5IGV2ZW50cwogICoKZGlmZiAtLWdpdCBhL21tL2ht
bS5jIGIvbW0vaG1tLmMKaW5kZXggMzA3YzEyZDc1MzFjLi4wZWYxYTE5MjFhZmIgMTAwNjQ0Ci0t
LSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzI3LDIwICsxMzI3LDYgQEAgRVhQT1JU
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
