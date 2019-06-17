Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8AE48229
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 028E489238;
	Mon, 17 Jun 2019 12:28:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F45589230;
 Mon, 17 Jun 2019 12:28:18 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqkA-0000HW-SJ; Mon, 17 Jun 2019 12:28:15 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:25 +0200
Message-Id: <20190617122733.22432-18-hch@lst.de>
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
 bh=wJ4xmBbrpfmUG188a6jPO21+BmohIhmVPW5AXcG365o=; b=NvmFARNv3ttc4OZA1xiWtFgk6o
 tdVi27VruAOhBspuUA7ohwBhG+sI+yUMmYAM2rIE5UYw1cs2pTWfZ5xIVYWVSXUUYfaE8dtGle2Q+
 38vp2DyzOrGYunTTU5sPPOW1gV+9VLzWPhfKjWesQc1OJz9ey6i02luy1iyDV8NU1UR55DXdLFs9z
 B9xnWZA1uQSxsPRX5ddbG4TDgFEBCcCk03gT6ou9BHPOe0aifePHXmZwWJ2ck3Ck5I+IpfSXcmFDY
 +sO1BEfn842pbMLtdEO4fcpFGGwrpdcLeDmymIa1vyB92Bk6rnJwTQxlA1Cs4HiPx7qswZydHD0rW
 ZXjVyVEQ==;
Subject: [Nouveau] [PATCH 17/25] nouveau: use alloc_page_vma directly
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
SGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8amdnQG1l
bGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8
IDMgKystCiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCA0MGM0N2Q2YTdkNzguLmE1
MGY2ZmQyZmUyNCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
bWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKQEAgLTE0
OCwxMSArMTQ4LDEyIEBAIG5vdXZlYXVfZG1lbV9mYXVsdF9hbGxvY19hbmRfY29weShzdHJ1Y3Qg
dm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAkJaWYgKCFzcGFnZSB8fCAhKHNyY19wZm5zW2ldICYgTUlH
UkFURV9QRk5fTUlHUkFURSkpCiAJCQljb250aW51ZTsKIAotCQlkcGFnZSA9IGhtbV92bWFfYWxs
b2NfbG9ja2VkX3BhZ2Uodm1hLCBhZGRyKTsKKwkJZHBhZ2UgPSBhbGxvY19wYWdlX3ZtYShHRlBf
SElHSFVTRVIsIHZtYSwgYWRkcik7CiAJCWlmICghZHBhZ2UpIHsKIAkJCWRzdF9wZm5zW2ldID0g
TUlHUkFURV9QRk5fRVJST1I7CiAJCQljb250aW51ZTsKIAkJfQorCQlsb2NrX3BhZ2UoZHBhZ2Up
OwogCiAJCWRzdF9wZm5zW2ldID0gbWlncmF0ZV9wZm4ocGFnZV90b19wZm4oZHBhZ2UpKSB8CiAJ
CQkgICAgICBNSUdSQVRFX1BGTl9MT0NLRUQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
