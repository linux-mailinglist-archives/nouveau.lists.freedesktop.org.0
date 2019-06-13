Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 75729434DC
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE9AA89842;
	Thu, 13 Jun 2019 09:44:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AE0908989A;
 Thu, 13 Jun 2019 09:44:12 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMHB-0001sa-6c; Thu, 13 Jun 2019 09:44:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:17 +0200
Message-Id: <20190613094326.24093-15-hch@lst.de>
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
 bh=j5NF6MNZYGnulaE88E08I95IgTMRhrbK2u/HLXeuvXI=; b=Ac6u1kwcs5Qa+uMIZP26VzBqh1
 oBc3B77m8cKbTSEIFPsUyGP6G3FUk3c8E+xk2HZWozHXtClsdTiu2RALXiDqDY43JEV1DWM9l1/Du
 GMJh/5UGQizxUaLO1dcsKhrvI14c20vJPjJ7jreMh9910F1WY99XI00fTC0entGgeaSQZLCs86xfW
 52vn6lM51A13Btvh++2O9/BZ39MqDd/CCOhxXr/jPAHEUNdYFrNi3zls/lufPVZvRZbXCwxBGi+w3
 avf91FXeX0uy9xYlvIoYY88p2jQx1BQy8vySwJ/yFSSrfYf9r3j/UGnyKprb+nbDw7XgChANaBwwz
 q7RSMx1Q==;
Subject: [Nouveau] [PATCH 14/22] nouveau: use alloc_page_vma directly
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

aG1tX3ZtYV9hbGxvY19sb2NrZWRfcGFnZSBpcyBzY2hlZHVsZWQgdG8gZ28gYXdheSwgdXNlIHRo
ZSBwcm9wZXIKbW0gZnVuY3Rpb24gZGlyZWN0bHkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGgg
SGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2RtZW0uYyB8IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVt
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCA0MGM0N2Q2
YTdkNzguLmE1MGY2ZmQyZmUyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVt
LmMKQEAgLTE0OCwxMSArMTQ4LDEyIEBAIG5vdXZlYXVfZG1lbV9mYXVsdF9hbGxvY19hbmRfY29w
eShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJaWYgKCFzcGFnZSB8fCAhKHNyY19wZm5z
W2ldICYgTUlHUkFURV9QRk5fTUlHUkFURSkpCiAJCQljb250aW51ZTsKIAotCQlkcGFnZSA9IGht
bV92bWFfYWxsb2NfbG9ja2VkX3BhZ2Uodm1hLCBhZGRyKTsKKwkJZHBhZ2UgPSBhbGxvY19wYWdl
X3ZtYShHRlBfSElHSFVTRVIsIHZtYSwgYWRkcik7CiAJCWlmICghZHBhZ2UpIHsKIAkJCWRzdF9w
Zm5zW2ldID0gTUlHUkFURV9QRk5fRVJST1I7CiAJCQljb250aW51ZTsKIAkJfQorCQlsb2NrX3Bh
Z2UoZHBhZ2UpOwogCiAJCWRzdF9wZm5zW2ldID0gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4oZHBh
Z2UpKSB8CiAJCQkgICAgICBNSUdSQVRFX1BGTl9MT0NLRUQ7Ci0tIAoyLjIwLjEKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
