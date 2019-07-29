Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C12FC78DE5
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F15989BFE;
	Mon, 29 Jul 2019 14:29:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F36489BFE;
 Mon, 29 Jul 2019 14:28:59 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6dy-0006J2-NA; Mon, 29 Jul 2019 14:28:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:34 +0300
Message-Id: <20190729142843.22320-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gQDoUkRn7ohUi0AK4193GFFAVxKRpJGWSsD1aIDW0XQ=; b=p6H12wQgajmyDHgmBXKdemE7Y
 C8YxAS2Y+3b6ukgwoyVL9zbIvTacyBgW4tCrngVCwU+jaE8kWjD6arMSdL7X396OaWBv7cPNeR1sg
 wfirWKCQZYamFRQEpP35Crsfu7nifa9oziKwmOzjVzlhDro5Yn8PH0XkSZh7FQuxVrFF5vssBb95Z
 FzVuaLZZ787LDALYCdA1svJ9fKFIWVdIYLs5d1bWWzZO/pGHVpy4Y1Mq0JJctiKFck2EKLiQ1Ykdd
 EoLkzi9cw1xX9PIv4fjFm/IWGznw5KS+KN8yxTCxKhZo7oBCTYFqOwyygWPleV6mcS7+MsXs4LQ7f
 k8v32wtEg==;
Subject: [Nouveau] turn the hmm migrate_vma upside down
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

SGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCgpiZWxvdyBpcyBhIHNlcmllcyBhZ2FpbnN0IHRo
ZSBobW0gdHJlZSB3aGljaCBzdGFydHMgcmV2YW1waW5nIHRoZQptaWdyYXRlX3ZtYSBmdW5jdGlv
bmFsaXR5LiAgVGhlIHByaW1lIGlkZWEgaXMgdG8gZXhwb3J0IHRocmVlIHNsaWdodGx5Cmxvd2Vy
IGxldmVsIGZ1bmN0aW9ucyBhbmQgdGh1cyBhdm9pZCB0aGUgbmVlZCBmb3IgbWlncmF0ZV92bWFf
b3BzCmNhbGxiYWNrcy4KCkRpZmZzdGF0OgoKICAgIDQgZmlsZXMgY2hhbmdlZCwgMjg1IGluc2Vy
dGlvbnMoKyksIDYwMiBkZWxldGlvbnMoLSkKCkEgZ2l0IHRyZWUgaXMgYWxzbyBhdmFpbGFibGUg
YXQ6CgogICAgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IG1pZ3Jh
dGVfdm1hLWNsZWFudXAKCkdpdHdlYjoKCiAgICBodHRwOi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNl
cnMvaGNoL21pc2MuZ2l0L3Nob3J0bG9nL3JlZnMvaGVhZHMvbWlncmF0ZV92bWEtY2xlYW51cApf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
