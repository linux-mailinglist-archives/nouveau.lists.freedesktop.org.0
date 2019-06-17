Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D6648214
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:27:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A238891F4;
	Mon, 17 Jun 2019 12:27:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3434891EF;
 Mon, 17 Jun 2019 12:27:56 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqjo-00006K-S6; Mon, 17 Jun 2019 12:27:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:15 +0200
Message-Id: <20190617122733.22432-8-hch@lst.de>
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
 bh=oE9zu8FnI80f0vIXdSsRJj3CowB8S40euLFZ8PS9IMM=; b=OFYLPou6TnJdcozuPN11iH/XmD
 RXqmC2lmrDIc90Y8NVCjfx83nqCVoiH00luftBKkX1QDJ9uDCWGmyeDihR9euPlBZLFFLvJEN37Oo
 IIGmTTp9s0JMz7OdQZzjJL8bCIoH3QG3msxcqq8GDVUPyrKek3uGmO1P50zrhewkvIMSsilKB9HGc
 i4vW8MnTCxNbowvDwKJqKc0RrobmUyUT5HllZCeGgrgyTx/O9YaW+CGOhU3j1YYqPcXiTiC58Lsdi
 v5jaT4YEYq+jrlR8fw59fAbQne0n1H6nJnvoV8aVZnyedTnbxgGT+xJd2gzeJqPQ1tUfzHY9lv2CT
 M6eP8oLQ==;
Subject: [Nouveau] [PATCH 07/25] memremap: validate the pagemap type passed
 to devm_memremap_pages
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

TW9zdCBwZ21hcCB0eXBlcyBhcmUgb25seSBzdXBwb3J0ZWQgd2hlbiBjZXJ0YWluIGNvbmZpZyBv
cHRpb25zIGFyZQplbmFibGVkLiAgQ2hlY2sgZm9yIGEgdHlwZSB0aGF0IGlzIHZhbGlkIGZvciB0
aGUgY3VycmVudCBjb25maWd1cmF0aW9uCmJlZm9yZSBzZXR0aW5nIHVwIHRoZSBwYWdlbWFwLgoK
U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQoga2VybmVs
L21lbXJlbWFwLmMgfCAyNyArKysrKysrKysrKysrKysrKysrKysrKysrKysKIDEgZmlsZSBjaGFu
Z2VkLCAyNyBpbnNlcnRpb25zKCspCgpkaWZmIC0tZ2l0IGEva2VybmVsL21lbXJlbWFwLmMgYi9r
ZXJuZWwvbWVtcmVtYXAuYwppbmRleCA2ZTE5NzA3MTlkYzIuLjZhMmRkMzFhNjI1MCAxMDA2NDQK
LS0tIGEva2VybmVsL21lbXJlbWFwLmMKKysrIGIva2VybmVsL21lbXJlbWFwLmMKQEAgLTE1Nyw2
ICsxNTcsMzMgQEAgdm9pZCAqZGV2bV9tZW1yZW1hcF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYs
IHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCiAJcGdwcm90X3QgcGdwcm90ID0gUEFHRV9LRVJO
RUw7CiAJaW50IGVycm9yLCBuaWQsIGlzX3JhbTsKIAorCXN3aXRjaCAocGdtYXAtPnR5cGUpIHsK
KwljYXNlIE1FTU9SWV9ERVZJQ0VfUFJJVkFURToKKwkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19E
RVZJQ0VfUFJJVkFURSkpIHsKKwkJCVdBUk4oMSwgIkRldmljZSBwcml2YXRlIG1lbW9yeSBub3Qg
c3VwcG9ydGVkXG4iKTsKKwkJCXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOworCQl9CisJCWJyZWFr
OworCWNhc2UgTUVNT1JZX0RFVklDRV9QVUJMSUM6CisJCWlmICghSVNfRU5BQkxFRChDT05GSUdf
REVWSUNFX1BVQkxJQykpIHsKKwkJCVdBUk4oMSwgIkRldmljZSBwdWJsaWMgbWVtb3J5IG5vdCBz
dXBwb3J0ZWRcbiIpOworCQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CisJCX0KKwkJYnJlYWs7
CisJY2FzZSBNRU1PUllfREVWSUNFX0ZTX0RBWDoKKwkJaWYgKCFJU19FTkFCTEVEKENPTkZJR19a
T05FX0RFVklDRSkgfHwKKwkJICAgIElTX0VOQUJMRUQoQ09ORklHX0ZTX0RBWF9MSU1JVEVEKSkg
eworCQkJV0FSTigxLCAiRmlsZSBzeXN0ZW0gREFYIG5vdCBzdXBwb3J0ZWRcbiIpOworCQkJcmV0
dXJuIEVSUl9QVFIoLUVJTlZBTCk7CisJCX0KKwkJYnJlYWs7CisJY2FzZSBNRU1PUllfREVWSUNF
X1BDSV9QMlBETUE6CisJCWJyZWFrOworCWRlZmF1bHQ6CisJCVdBUk4oMSwgIkludmFsaWQgcGdt
YXAgdHlwZSAlZFxuIiwgcGdtYXAtPnR5cGUpOworCQlicmVhazsKKwl9CisKIAlpZiAoIXBnbWFw
LT5yZWYgfHwgIXBnbWFwLT5raWxsIHx8ICFwZ21hcC0+Y2xlYW51cCkgewogCQlXQVJOKDEsICJN
aXNzaW5nIHJlZmVyZW5jZSBjb3VudCB0ZWFyZG93biBkZWZpbml0aW9uXG4iKTsKIAkJcmV0dXJu
IEVSUl9QVFIoLUVJTlZBTCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQ==
