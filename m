Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 068FF4820D
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:27:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 57BFF891CD;
	Mon, 17 Jun 2019 12:27:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 80003891A1;
 Mon, 17 Jun 2019 12:27:49 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqji-0008Q6-8H; Mon, 17 Jun 2019 12:27:46 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:12 +0200
Message-Id: <20190617122733.22432-5-hch@lst.de>
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
 bh=K9g0rbDWkkxSMGlYVgcFvd5xNggbvRNJSx9Dd0Ro7/M=; b=Bpx0/+YDXKRBCn8UCT2IVcE71B
 X2OqFR2P6cQnqBb88ElPZ9QzRIcJuB6fh/pwFQhL10fCq/BTxAcobe/zVEp/r2n7V0pP7sSWfY3vI
 grf6B5YyGDCZtvbTmqOmLHV4oQdCc5CWcHzwXul0Xks3Jy5S8OX2HaJLSwsERvlhqYUhbplZj+Hbe
 nGltq+FfZLW+kAOtOqlrJUw+V8Bf9yuRaWt+YX/y8HdJGvUzLzWUpFih1p8MBWWbxiSlX6mIpF/9f
 YI8qf3+O29zr6OMxqhKepaX1ADDNERghmpgXvc2+qF1AVzDFKhLXEhxF4xHhfGx1sWibYKtViGFl+
 Wp33jgyA==;
Subject: [Nouveau] [PATCH 04/25] mm: don't clear ->mapping in hmm_devmem_free
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
IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggZGMy
NTFjNTE4MDNhLi42NGU3ODhiYjEyMTEgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2ht
bS5jCkBAIC0xMzgwLDggKzEzODAsNiBAQCBzdGF0aWMgdm9pZCBobW1fZGV2bWVtX2ZyZWUoc3Ry
dWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0IGhtbV9kZXZtZW0gKmRldm1l
bSA9IGRhdGE7CiAKLQlwYWdlLT5tYXBwaW5nID0gTlVMTDsKLQogCWRldm1lbS0+b3BzLT5mcmVl
KGRldm1lbSwgcGFnZSk7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
