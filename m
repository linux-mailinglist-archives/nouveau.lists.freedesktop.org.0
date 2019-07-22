Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 068F46FC78
	for <lists+nouveau@lfdr.de>; Mon, 22 Jul 2019 11:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6513D89B99;
	Mon, 22 Jul 2019 09:44:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85F5589B3C;
 Mon, 22 Jul 2019 09:44:43 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hpUs4-0001tJ-OZ; Mon, 22 Jul 2019 09:44:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 22 Jul 2019 11:44:25 +0200
Message-Id: <20190722094426.18563-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190722094426.18563-1-hch@lst.de>
References: <20190722094426.18563-1-hch@lst.de>
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
 bh=KU3XO7neiNJoCLlCx1kSbawFotPCDQuEmLUnpBRP3R8=; b=fx0OUGvargc7kZuDQBT1BVZvx6
 akZ3IxLvVFpwpTZ6mwxG/fDjJWbzOIsUrUpGAbXfOCDOTt/ZY9Og/OO6v1ZKX2WLk0UKeOuqaM5He
 JS3eKYYglPuo39ThJdRVk2HstA3K2/0b6YcWdNagG4gTFQf6qHKpgDxoFKvgUpg1SZ+OEMcU9hNeg
 nQTH/RbZzXAV6COOglFFC/UlRSXF47ADoLQbyXc03H9Kt31xN2rPHCxvirU8nLtJUgVejCURB9uha
 Iu8bHoVGJ3ZS4ucITXCip6qt9/Cmo1Y1s1eOcE8U5YqnKeJewWAL0DOk8cXwO2Rp1NvN/92mIq7KX
 5lcn/C2w==;
Subject: [Nouveau] [PATCH 5/6] nouveau: return -EBUSY when
 hmm_range_wait_until_valid fails
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
Cc: linux-mm@kvack.org, Ralph Campbell <rcampbell@nvidia.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

LUVBR0FJTiBoYXMgYSBtYWdpYyBtZWFuaW5nIGZvciBub24tYmxvY2tpbmcgZmF1bHRzLCBzbyBk
b24ndCBvdmVybG9hZAppdC4gIEdpdmVuIHRoYXQgdGhlIGNhbGxlciBkb2Vzbid0IGNoZWNrIGZv
ciBzcGVjaWZpYyBlcnJvciBjb2RlcyB0aGlzCmNoYW5nZSBpcyBwdXJlbHkgY29zbWV0aWMuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
c3ZtLmMKaW5kZXggNWRlMmQ1NGI5NzgyLi5hOWM1YzU4ZDQyNWIgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9zdm0uYwpAQCAtNTAxLDcgKzUwMSw3IEBAIG5vdXZlYXVfcmFuZ2VfZmF1
bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAK
IAlpZiAoIWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1fUkFOR0VfREVGQVVM
VF9USU1FT1VUKSkgewogCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwot
CQlyZXR1cm4gLUVBR0FJTjsKKwkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKIAlyZXQgPSBobW1fcmFu
Z2VfZmF1bHQocmFuZ2UsIHRydWUpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
