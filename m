Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6479E8CD63
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 10:00:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91ADC6E41B;
	Wed, 14 Aug 2019 08:00:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C9F1A6E2F6;
 Wed, 14 Aug 2019 08:00:00 +0000 (UTC)
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxoCK-000864-11; Wed, 14 Aug 2019 07:59:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 14 Aug 2019 09:59:26 +0200
Message-Id: <20190814075928.23766-9-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
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
 bh=vBk1LYfglvU9WhzFBd+HGPsCFZW0PolzMu2uE5RY+Ss=; b=GMnK8vxSRHA4WBgd0X24IGMQFS
 3/qyPBXcIpuzxhIzULi17D+Sxbxfz3UHdutVGw8hYZT7dg9L5K4HJP9Zv1ybkLfKiIvv0Xj0zbKSq
 B4a0igjfBisQeyWlPE6esFoPgkgyt1o7d6hwHwEcaqW86UVtNw/YOYaa4k9WRDj0kqNN6/VIiWs7b
 k1AnlR1SWZoy5oVOjtnLMXcTaUQWZmvy9GDnfMx1qHAWq9eFCgZqC1zu8Fl2N0sOsy8yBZnwinBe/
 G9yeDxATQuVNZHLLRBa8CfidabY+rvSRysvvBABm6agbj9RFnL44HhqRpySHsZz8/p1SnC10Aa8if
 xBnjGJuQ==;
Subject: [Nouveau] [PATCH 08/10] mm: remove the unused MIGRATE_PFN_ERROR flag
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

Tm93IHRoYXQgd2UgY2FuIHJlbHkgZXJyb3JzIGluIHRoZSBub3JtYWwgY29udHJvbCBmbG93IHRo
ZXJlIGlzIG5vCm5lZWQgZm9yIHRoaXMgZmxhZywgcmVtb3ZlIGl0LgoKU2lnbmVkLW9mZi1ieTog
Q2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5OiBSYWxwaCBDYW1wYmVs
bCA8cmNhbXBiZWxsQG52aWRpYS5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9taWdyYXRlLmggfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9taWdyYXRlLmggYi9pbmNsdWRlL2xpbnV4L21pZ3JhdGUuaAppbmRleCAxODE1NmQzNzll
YmYuLjFlNjdkY2ZkMzE4ZiAxMDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKKysr
IGIvaW5jbHVkZS9saW51eC9taWdyYXRlLmgKQEAgLTE2Nyw3ICsxNjcsNiBAQCBzdGF0aWMgaW5s
aW5lIGludCBtaWdyYXRlX21pc3BsYWNlZF90cmFuc2h1Z2VfcGFnZShzdHJ1Y3QgbW1fc3RydWN0
ICptbSwKICNkZWZpbmUgTUlHUkFURV9QRk5fTE9DS0VECSgxVUwgPDwgMikKICNkZWZpbmUgTUlH
UkFURV9QRk5fV1JJVEUJKDFVTCA8PCAzKQogI2RlZmluZSBNSUdSQVRFX1BGTl9ERVZJQ0UJKDFV
TCA8PCA0KQotI2RlZmluZSBNSUdSQVRFX1BGTl9FUlJPUgkoMVVMIDw8IDUpCiAjZGVmaW5lIE1J
R1JBVEVfUEZOX1NISUZUCTYKIAogc3RhdGljIGlubGluZSBzdHJ1Y3QgcGFnZSAqbWlncmF0ZV9w
Zm5fdG9fcGFnZSh1bnNpZ25lZCBsb25nIG1wZm4pCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
