Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E7CD56FC71
	for <lists+nouveau@lfdr.de>; Mon, 22 Jul 2019 11:44:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 248D889061;
	Mon, 22 Jul 2019 09:44:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7AFFA89010;
 Mon, 22 Jul 2019 09:44:32 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hpUrs-0001rX-DG; Mon, 22 Jul 2019 09:44:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 22 Jul 2019 11:44:20 +0200
Message-Id: <20190722094426.18563-1-hch@lst.de>
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
 bh=O26sc2nLoVFgJqI+86Nh+/jE5QZWcSMhT2Y2hH/y3V8=; b=AfgJ8lP1A7t1NBzOAMyaRjNbd
 T7I9Zn/foXgv6ag7KA/LDtL1Fh5GITciR4hIQAlS1u3mi0JtAqcdEFqbeD8V7L5YoeZQpj8qCpTEb
 w3J1/Qeffo9punlPAzBqh5esZiJsiko9MyMhJo15FFT3k4bJ5rW6JtUxbDeHdKRN5MoOM2ban6PLO
 vm80xm0u0Zd4kBX34rz+RMHF+g83+rgSzKOcWWeJtlM0NSyheBCY+FayqQuVWf2u+mhYMDA6LgPUT
 m8X2OIBfxYeAdHjxte71yKVXT/1qfYuiMLaSqLrcboQb5GQJHyKyIpj3af5EFzxqXsIe+SJKcOcE2
 5wys/HGlw==;
Subject: [Nouveau] hmm_range_fault related fixes and legacy API removal v2
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

SGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCgpiZWxvdyBpcyBhIHNlcmllcyBhZ2FpbnN0IHRo
ZSBobW0gdHJlZSB3aGljaCBmaXhlcyB1cCB0aGUgbW1hcF9zZW0KbG9ja2luZyBpbiBub3V2ZWF1
IGFuZCB3aGlsZSBhdCBpdCBhbHNvIHJlbW92ZXMgbGVmdG92ZXIgbGVnYWN5IEhNTSBBUElzCm9u
bHkgdXNlZCBieSBub3V2ZWF1LgoKVGhlIGZpcnN0IDQgcGF0Y2hlcyBhcmUgYSBidWcgZml4IGZv
ciBub3V2ZWF1LCB3aGljaCBJIHN1c3BlY3Qgc2hvdWxkCmdvIGludG8gdGhpcyBtZXJnZSB3aW5k
b3cgZXZlbiBpZiB0aGUgY29kZSBpcyBtYXJrZWQgYXMgc3RhZ2luZywganVzdAp0byBhdm9pZCBw
ZW9wbGUgY29weWluZyB0aGUgYnJlYWthZ2UuCgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBkb24ndCBy
ZXR1cm4gdGhlIHZhbGlkIHN0YXRlIGZyb20gaG1tX3JhbmdlX3VucmVnaXN0ZXIKIC0gYWRkaXRp
b25hbCBub3V2ZWF1IGNsZWFudXBzCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
