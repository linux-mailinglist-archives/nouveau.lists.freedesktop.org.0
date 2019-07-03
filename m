Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72A85EBDC
	for <lists+nouveau@lfdr.de>; Wed,  3 Jul 2019 20:45:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 515036E1A4;
	Wed,  3 Jul 2019 18:45:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E5D6D6E193;
 Wed,  3 Jul 2019 18:45:08 +0000 (UTC)
Received: from rap-us.hgst.com ([199.255.44.250] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hikFa-00079g-W0; Wed, 03 Jul 2019 18:45:03 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed,  3 Jul 2019 11:44:57 -0700
Message-Id: <20190703184502.16234-1-hch@lst.de>
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
 bh=UYUSkq3MaywALpKQmbkqpd/XlsTvFn81MlHwxqWXibw=; b=m8HcPZ2yeJKhNSw16f2U4gwi8
 VaTgheKcvNfXeBOBmB/SsYKOJeJUuVqHvJ0+uwDyysD4GPpY3lM+PzTEkWhtLBBoggskp9VkHUsIk
 UyGPHDBv6lN6uVl40S7pfVGSDzMGXP3klgrtrx8i65i7XXeXSanBjwMihL5tpASfXcWHKK8049WC9
 4COYj4vK4P48hgNN3U8YbS8v6zZFinYOWgiAEjZk+THHb3vMXSTjZKjFTltedrmFPS6mdsp2vG2Cv
 lBShDGZVA77KiqJ0Ogl95z9sCHe597CJXw4e4rhrDdE12lmFKK4fpGmHckcPOwKSG/n3t9UTbQVja
 DEmxCAQ0g==;
Subject: [Nouveau] hmm_range_fault related fixes and legacy API removal
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
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCgpiZWxvdyBpcyBhIHNlcmllcyBhZ2FpbnN0IHRo
ZSBobW0gdHJlZSB3aGljaCBmaXhlcyB1cCB0aGUgbW1hcF9zZW0KbG9ja2luZyBpbiBub3V2ZWF1
IGFuZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzCm9u
bHkgdXNlZCBieSBub3V2ZWF1LgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9w
Lm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZl
YXU=
