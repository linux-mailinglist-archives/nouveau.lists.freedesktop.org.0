Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 488C278DF0
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B985389CF1;
	Mon, 29 Jul 2019 14:29:18 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66A6889D99;
 Mon, 29 Jul 2019 14:29:17 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6eI-0006N3-7M; Mon, 29 Jul 2019 14:29:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:41 +0300
Message-Id: <20190729142843.22320-8-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729142843.22320-1-hch@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
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
 bh=ADCug91zuoANeBM/f4yCo270YqgttY1AZGH+RTcphSg=; b=PoRZVZGWUXTPpfSubNbeDA1LdQ
 b1LU/fQcfLbyytc2sKwhS9XHDPhN/gAt57LwReU5qOooafXp0ZDGWpFF/2t4PTI/oaQv6W14tY4mb
 rza6MeZTZ9XBJh/slw1Y3bcBA1QSUV+n4ZlZw0NYQfKPrQTDFtZI5E9tOFs20qu0RAJJTghI3SRgm
 YgD2M6gbXV0E6tWBxPYGCgN/DTlYlaMlgZrQe+O/igafLpjEuov7/uqXg2nCrGYgEePTo7BvTg3Gz
 k3Lax/R6rvcpq4mDKiz84UhDA+aZJS5tGJi7fwLDd/1s0vbKGIGuHFzxXh6MbT37dORGy06wuzQKy
 8BoJHZmQ==;
Subject: [Nouveau] [PATCH 7/9] mm: remove the unused MIGRATE_PFN_ERROR flag
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
Cc: Ralph Campbell <rcampbell@nvidia.com>, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2UgZG9uJ3QgdXNlIHRoaXMgZmxhZyBhbnltb3JlLCBzbyByZW1vdmUgaXQuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBpbmNsdWRlL2xpbnV4L21p
Z3JhdGUuaCB8IDEgLQogMSBmaWxlIGNoYW5nZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQg
YS9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaCBiL2luY2x1ZGUvbGludXgvbWlncmF0ZS5oCmluZGV4
IDA5M2Q2N2ZjZjZkZC4uMjI5MTUzYzJjNDk2IDEwMDY0NAotLS0gYS9pbmNsdWRlL2xpbnV4L21p
Z3JhdGUuaAorKysgYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaApAQCAtMTY3LDcgKzE2Nyw2IEBA
IHN0YXRpYyBpbmxpbmUgaW50IG1pZ3JhdGVfbWlzcGxhY2VkX3RyYW5zaHVnZV9wYWdlKHN0cnVj
dCBtbV9zdHJ1Y3QgKm1tLAogI2RlZmluZSBNSUdSQVRFX1BGTl9MT0NLRUQJKDFVTCA8PCAyKQog
I2RlZmluZSBNSUdSQVRFX1BGTl9XUklURQkoMVVMIDw8IDMpCiAjZGVmaW5lIE1JR1JBVEVfUEZO
X0RFVklDRQkoMVVMIDw8IDQpCi0jZGVmaW5lIE1JR1JBVEVfUEZOX0VSUk9SCSgxVUwgPDwgNSkK
ICNkZWZpbmUgTUlHUkFURV9QRk5fU0hJRlQJNgogCiBzdGF0aWMgaW5saW5lIHN0cnVjdCBwYWdl
ICptaWdyYXRlX3Bmbl90b19wYWdlKHVuc2lnbmVkIGxvbmcgbXBmbikKLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
