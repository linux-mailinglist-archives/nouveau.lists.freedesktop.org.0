Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FC527288D
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 08:53:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BBE256E45B;
	Wed, 24 Jul 2019 06:53:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E39AB6E45E;
 Wed, 24 Jul 2019 06:53:19 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqB9J-0004Ko-0z; Wed, 24 Jul 2019 06:53:17 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 24 Jul 2019 08:52:56 +0200
Message-Id: <20190724065258.16603-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190724065258.16603-1-hch@lst.de>
References: <20190724065258.16603-1-hch@lst.de>
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
 bh=igXh/3abv0ooQdkv/Vfc/WSfVB4lkdoSYebCAR1TL48=; b=IDkGONdXpH3tW1oxhx++LkR9Lr
 WtaFZ+boWB9F31gk5CqaFbhNeFfrtl5YLLAPAezcvPdlRxacMmzCyuUcbJkfsIU6ge7zEVv6VK3Lp
 BVN8c2sSrD9gXy2zzFgQNQxPeES0fjs+kwg6uO+b6FRTGfvZoI4LaBGXq5SxfAg1diq5NAYBrGEmT
 LgBCFZZp8wWhbrk+FwzSlyBkPvD4HtkVG7f4VC7cE6HJ/umGb0LSiSUT67UWqJ0MlfM/eAnG+yM66
 VhwUGjcVxt/otVXADUHsEEIdhJYMPPs8S9yngWBDr8DsSJQqvQUpJqMoQJQ2kuAdZG+rSN7e5CHvH
 SlT6wdaA==;
Subject: [Nouveau] [PATCH 5/7] nouveau: return -EBUSY when
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
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6
IEphc29uIEd1bnRob3JwZSA8amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3N2bS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9u
KCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKaW5k
ZXggYTgzNWNlYmI2ZDkwLi41NDUxMDBmN2M1OTQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91
dmVhdV9zdm0uYwpAQCAtNTAyLDcgKzUwMiw3IEBAIG5vdXZlYXVfcmFuZ2VfZmF1bHQoc3RydWN0
IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAKIAlpZiAoIWht
bV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBITU1fUkFOR0VfREVGQVVMVF9USU1FT1VU
KSkgewogCQl1cF9yZWFkKCZyYW5nZS0+dm1hLT52bV9tbS0+bW1hcF9zZW0pOwotCQlyZXR1cm4g
LUVBR0FJTjsKKwkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKIAlyZXQgPSBobW1fcmFuZ2VfZmF1bHQo
cmFuZ2UsIHRydWUpOwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
