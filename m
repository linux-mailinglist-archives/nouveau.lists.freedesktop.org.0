Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB6AB568D6
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:27:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A8D86E3DF;
	Wed, 26 Jun 2019 12:27:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C32626E3C1;
 Wed, 26 Jun 2019 12:27:48 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71Z-0001Lv-4k; Wed, 26 Jun 2019 12:27:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:04 +0200
Message-Id: <20190626122724.13313-6-hch@lst.de>
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
 bh=0wBvIBHex+/cCiI1pboKPdW0nxKbhC7t4v1/DWHTWzI=; b=c6rggi27+6bcNfZZv1zIRlyPCG
 dTeW2W12t37x3woY9zWdBtIsP4n1E9dw47beifpdnx/fz2SnFKoQs6M0ObFbnzav7MGUD/YXjCZ/Y
 /nrVNGsZF9j5DfrhyO6TTdGG/hzYaJp6AQ98WUFsFTaB6Ol4fyNoNVg8mhvpvqgaxZEjbFL/UASiZ
 /3sLgB2UV5SSt6KHctKLOsDSch/tnc7UKteZTeFrWqxh0JqkYe6iQjKxxaOZL1CYQ9QXxFMmVhNNO
 27wXVoCLF43f+0c2qpIsvN2eFaGW98w89wJCDa2RWtuWV5oIL49PGwubBepu8AuvptmiewrxjXd5v
 6kqTr2hA==;
Subject: [Nouveau] [PATCH 05/25] mm: don't clear ->mapping in hmm_devmem_free
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

LT5tYXBwaW5nIGlzbid0IGV2ZW4gdXNlZCBieSBITU0gdXNlcnMsIGFuZCB0aGUgZmllbGQgYXQg
dGhlIHNhbWUgb2Zmc2V0CmluIHRoZSB6b25lX2RldmljZSBwYXJ0IG9mIHRoZSB1bmlvbiBpcyBk
ZWNsYXJlZCBhcyBwYWQuICAoV2hpY2ggYnR3IGlzCnJhdGhlciBjb25mdXNpbmcsIGFzIERBWCB1
c2VzIC0+cGdtYXAgYW5kIC0+bWFwcGluZyBmcm9tIHR3byBkaWZmZXJlbnQKc2lkZXMgb2YgdGhl
IHVuaW9uLCBidXQgREFYIGRvZXNuJ3QgdXNlIGhtbV9kZXZtZW1fZnJlZSkuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1
bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1
YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9obW0uYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAy
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggMzc2
MTU5YTc2OWZiLi5lN2RkMmFiOGY5YWIgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2ht
bS5jCkBAIC0xMzgzLDggKzEzODMsNiBAQCBzdGF0aWMgdm9pZCBobW1fZGV2bWVtX2ZyZWUoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IGhtbV9kZXZtZW0gKmRldm1l
bSA9IGRhdGE7CiAKLQlwYWdlLT5tYXBwaW5nID0gTlVMTDsKLQogCWRldm1lbS0+b3BzLT5mcmVl
KGRldm1lbSwgcGFnZSk7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
