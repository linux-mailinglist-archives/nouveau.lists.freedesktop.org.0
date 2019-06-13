Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6D4B434C9
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:43:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AD898984D;
	Thu, 13 Jun 2019 09:43:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B07A78984D;
 Thu, 13 Jun 2019 09:43:46 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMGl-0001l6-GH; Thu, 13 Jun 2019 09:43:43 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:08 +0200
Message-Id: <20190613094326.24093-6-hch@lst.de>
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
 bh=FEkGt+ty/uGWp0o9n/p7YTGA7bk3QKQR9GKnB3yrWi0=; b=L3WbZ0JSiDvBXJFsDUCJ02wcbX
 BVJRpc0UiDSz8hdf9PGCQmrkNO9cC3Ct9Euv83j64Pvqa+bMG7zPftv6Qc47ddagd0apxJ3S9LtxK
 YL0Gd6JRejUQjbVJguc5cGI104IqQQmLmGxj/QrnU1/8eCRFXHiVtvxgGKwlwToPy+mfQe5RgeuNc
 7YyFcHDGYRl8yFp9cwxZhKia1V56GYhuyZqZJ3NB32yZYe7DQM/hr05KkwXqr/uf34lWIk5VMshTf
 CpMaS4eanmRpQSDsR1G7yDdfQpx78Otwq1ePYvSywGpRHwk4jd2yXAVh0H6em6K2SgA7+4HrNyFnG
 Se1/PImw==;
Subject: [Nouveau] [PATCH 05/22] mm: export alloc_pages_vma
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

bm92ZWF1IGlzIGN1cnJlbnRseSB1c2luZyB0aGlzIHRocm91Z2ggYW4gb2RkIGhtbSB3cmFwcGVy
LCBhbmQgSSBwbGFuCnRvIHN3aXRjaCBpdCB0byB0aGUgcmVhbCB0aGluZyBsYXRlciBpbiB0aGlz
IHNlcmllcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgot
LS0KIG1tL21lbXBvbGljeS5jIHwgMSArCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKykK
CmRpZmYgLS1naXQgYS9tbS9tZW1wb2xpY3kuYyBiL21tL21lbXBvbGljeS5jCmluZGV4IDAxNjAw
ZDgwYWUwMS4uZjkwMjNiNWZiYTM3IDEwMDY0NAotLS0gYS9tbS9tZW1wb2xpY3kuYworKysgYi9t
bS9tZW1wb2xpY3kuYwpAQCAtMjA5OCw2ICsyMDk4LDcgQEAgYWxsb2NfcGFnZXNfdm1hKGdmcF90
IGdmcCwgaW50IG9yZGVyLCBzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIG91dDoKIAlyZXR1
cm4gcGFnZTsKIH0KK0VYUE9SVF9TWU1CT0xfR1BMKGFsbG9jX3BhZ2VzX3ZtYSk7CiAKIC8qKgog
ICogCWFsbG9jX3BhZ2VzX2N1cnJlbnQgLSBBbGxvY2F0ZSBwYWdlcy4KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
