Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A1FF5EEEB
	for <lists+nouveau@lfdr.de>; Thu,  4 Jul 2019 00:02:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD4D6E217;
	Wed,  3 Jul 2019 22:02:22 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5D6AC6E202;
 Wed,  3 Jul 2019 22:02:20 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hinKS-0004Ek-JE; Wed, 03 Jul 2019 22:02:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 15:02:13 -0700
Message-Id: <20190703220214.28319-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190703220214.28319-1-hch@lst.de>
References: <20190703220214.28319-1-hch@lst.de>
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
 bh=DUoOwqjnTji0F9t1TBg521OpvLvqwX3Vlrvz0Ntypso=; b=efDzZwBeFkuXGAumAQiTxGRxkt
 7D+YalkdI4VpAhWfDiCr5acuRvXk3B2P6XcIKBXGzEPBierDhh0ydQYTRtK5O3oYNgb0CXsCluMgO
 z+4eQkFrCU1ogAFWQxXUO2itnHdgd5PstKF1fjC/mYhkALtlWktGH2LwfMkR3X+J+Iw2eeduXoBiZ
 TEUf3el0yJeHxkqoV3zcOygMbjfNtIkcYb7c/dNlmPWjVJG+bE00JuSW1bMeOcQZS+bZRWiWATVGf
 UdIM1NJZPbkyv3mt3mrXrTmNhpRloE/IABs8wxj3gLRGIvAGR1uw8u+PcvwC2w+8wtER9Birgc/wh
 KZgk5nNw==;
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
c3ZtLmMKaW5kZXggZDk3ZDg2MmU4YjdkLi4yNjg1M2Y1OWIwZjQgMTAwNjQ0Ci0tLSBhL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfc3ZtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9zdm0uYwpAQCAtNTA4LDcgKzUwOCw3IEBAIG5vdXZlYXVfcmFuZ2VfZmF1
bHQoc3RydWN0IGhtbV9taXJyb3IgKm1pcnJvciwgc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UpCiAK
IAlpZiAoIWhtbV9yYW5nZV93YWl0X3VudGlsX3ZhbGlkKHJhbmdlLCBOT1VWRUFVX1JBTkdFX0ZB
VUxUX1RJTUVPVVQpKSB7CiAJCXVwX3JlYWQoJnJhbmdlLT52bWEtPnZtX21tLT5tbWFwX3NlbSk7
Ci0JCXJldHVybiAtRUFHQUlOOworCQlyZXR1cm4gLUVCVVNZOwogCX0KIAogCXJldCA9IGhtbV9y
YW5nZV9mYXVsdChyYW5nZSwgdHJ1ZSk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
