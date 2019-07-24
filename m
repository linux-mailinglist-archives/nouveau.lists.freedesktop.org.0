Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B61F472892
	for <lists+nouveau@lfdr.de>; Wed, 24 Jul 2019 08:53:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 33D7F6E45D;
	Wed, 24 Jul 2019 06:53:28 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70FD6E460;
 Wed, 24 Jul 2019 06:53:26 +0000 (UTC)
Received: from 089144207240.atnat0016.highway.bob.at ([89.144.207.240]
 helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hqB9P-0004Mo-Lp; Wed, 24 Jul 2019 06:53:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 24 Jul 2019 08:52:58 +0200
Message-Id: <20190724065258.16603-8-hch@lst.de>
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
 bh=jUagJle8tiqkx+fZcCE6Gfny4t7Azmd0YxZDCEv72fs=; b=gHoA3rLxbbBb8a0isoL8eqDuAd
 5No71pHNiivV7f+CSgnKf/BnSlSNK6IHFCeFwtrWSRDbAHPCPDE3FP1zsCfMsYxHtJ90yYDlUxj2K
 HsjlpGb+HBDiw4pJkfZUt0rZPL3rR+vVkgO7MQ7aFVnbJ/dH6yr+BPTKxF7wdx1yMwjk0nxNfGN5a
 MeLw7sIA4cVOQlsewuFjuZ1oKKhb+BnYot7yxvtYabgThfnIv5HDf78+WbsMXOcknLuY5xH2VoJDX
 QIF4jW0Vtaeu3JTdStE89iThn0BlxErxbbHeDGs5EIrl76zsfFj/jdn5E2iKTaq3FlbL16zEG+dDX
 j7FGDjGg==;
Subject: [Nouveau] [PATCH 7/7] mm: comment on VM_FAULT_RETRY semantics in
 handle_mm_fault
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

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIG1hZ2ljIGRyb3Bw
aW5nIG9mIG1tYXBfc2VtIHdoZW4gaGFuZGxlX21tX2ZhdWx0IHJldHVybnMKVk1fRkFVTFRfUkVU
UlkgaXMgcmF0aGVyIHN1YnRpbGUuICBBZGQgYSBjb21tZW50IGV4cGxhaW5pbmcgaXQuCgpTaWdu
ZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+CltoY2g6IHdyb3Rl
IGEgY2hhbmdlbG9nXQpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBtbS9obW0uYyB8IDQgKysrLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygr
KSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXgg
MTZiNjczMWEzNGRiLi41NGIzYTQxNjJhZTkgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21t
L2htbS5jCkBAIC0zMDEsOCArMzAxLDEwIEBAIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVsdChz
dHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCWZsYWdzIHw9IGhtbV92
bWFfd2Fsay0+YmxvY2sgPyAwIDogRkFVTFRfRkxBR19BTExPV19SRVRSWTsKIAlmbGFncyB8PSB3
cml0ZV9mYXVsdCA/IEZBVUxUX0ZMQUdfV1JJVEUgOiAwOwogCXJldCA9IGhhbmRsZV9tbV9mYXVs
dCh2bWEsIGFkZHIsIGZsYWdzKTsKLQlpZiAocmV0ICYgVk1fRkFVTFRfUkVUUlkpCisJaWYgKHJl
dCAmIFZNX0ZBVUxUX1JFVFJZKSB7CisJCS8qIE5vdGUsIGhhbmRsZV9tbV9mYXVsdCBkaWQgdXBf
cmVhZCgmbW0tPm1tYXBfc2VtKSkgKi8KIAkJcmV0dXJuIC1FQUdBSU47CisJfQogCWlmIChyZXQg
JiBWTV9GQVVMVF9FUlJPUikgewogCQkqcGZuID0gcmFuZ2UtPnZhbHVlc1tITU1fUEZOX0VSUk9S
XTsKIAkJcmV0dXJuIC1FRkFVTFQ7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlz
dHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4v
bGlzdGluZm8vbm91dmVhdQ==
