Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B620A72885
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 08:53:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB93F6E453;
	Wed, 24 Jul 2019 06:53:06 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 091056E453;
 Wed, 24 Jul 2019 06:53:06 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqB94-0004Hw-C9; Wed, 24 Jul 2019 06:53:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 24 Jul 2019 08:52:51 +0200
Message-Id: <20190724065258.16603-1-hch@lst.de>
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
 bh=nxIVoCpennKVcI7DbytWW21ua/k9dOz1onbRbm1cQCE=; b=oT1UkxwATR3uNfX9nvhPpejPy
 pzG4vC6QYUYgAgXlECubEZvLZDF5K+eNlTayweVvSxyqIO3v6nw9O4EZdfU+CvQWHVB71+n9N5k87
 MvKaAKSxHDWIO0SYlWaDUwo7zo9qYmIU6TX6Tzzj7Dyez5Rd9Obt8H4+L8SM2mtrm3UZG7AkYcWGp
 zzslZfgg8CUU/FA1z4RFQkBt8uCYQivm2n5RUam8BYNfDFwDlM8WYlubmQPRS2u+yDI9vScOTUpJo
 rwqpUvywoSh1seqL1wWx5ykh9VGgCyI5jt61j9WRluuS2LAkxLkB+HC8fjlVw/aeppuLqe6jgBNW9
 0YbLXShAg==;
Subject: [Nouveau] hmm_range_fault related fixes and legacy API removal v3
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
ZW9wbGUgY29weWluZyB0aGUgYnJlYWthZ2UuCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBuZXcgcGF0
Y2ggZnJvbSBKYXNvbiB0byBkb2N1bWVudCBGQVVMVF9GTEFHX0FMTE9XX1JFVFJZIHNlbWFudGlj
cwogICBiZXR0ZXIKIC0gcmVtb3ZlIC1FQUdBSU4gaGFuZGxpbmcgaW4gbm91dmVhdSBlYXJsaWVy
CgpDaGFuZ2VzIHNpbmNlIHYxOgogLSBkb24ndCByZXR1cm4gdGhlIHZhbGlkIHN0YXRlIGZyb20g
aG1tX3JhbmdlX3VucmVnaXN0ZXIKIC0gYWRkaXRpb25hbCBub3V2ZWF1IGNsZWFudXBzCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGlu
ZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
