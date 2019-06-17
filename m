Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4730348211
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:27:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7D891DA;
	Mon, 17 Jun 2019 12:27:53 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C45E0891D9;
 Mon, 17 Jun 2019 12:27:51 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqjk-0008W5-FE; Mon, 17 Jun 2019 12:27:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:13 +0200
Message-Id: <20190617122733.22432-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190617122733.22432-1-hch@lst.de>
References: <20190617122733.22432-1-hch@lst.de>
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
 bh=0rpTHljYB087yEOOsZI9c9yqKYmTPhfVemezVGqcscg=; b=gQAEn4aBEmQ132Z0wP5I7jCauB
 LBw2hOlfvCDQ7d5fQKNPO6djGCxEKQh4CVo9EuYbFLF4QJhOgBejZ8OlWo206WldjRYOfhT4AFXLE
 9L9qHayf35ChGEv7g6MIcpHnXhCiExQ4fiDCZ31LF2RdPao4FFTC2z3uorshZP+Aw61Hgacx5tekH
 AsvC3ssCa68V+0zIIoesTfI1zxzVEaOuvsIAMGhuXyHQ3tSMzjWx14WKmPXgm3FDPe3h/HDsavVrv
 jUYfnpdHPmfR+1OXsOoS+idioOXrQhBTR8rrL0J5g0GVZnduKQ9EwD/JKCrznGMn1BshcDxe2+90o
 qyyv31zA==;
Subject: [Nouveau] [PATCH 05/25] mm: export alloc_pages_vma
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

bm91dmVhdSBpcyBjdXJyZW50bHkgdXNpbmcgdGhpcyB0aHJvdWdoIGFuIG9kZCBobW0gd3JhcHBl
ciwgYW5kIEkgcGxhbgp0byBzd2l0Y2ggaXQgdG8gdGhlIHJlYWwgdGhpbmcgbGF0ZXIgaW4gdGhp
cyBzZXJpZXMuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
UmV2aWV3ZWQtYnk6IEpvaG4gSHViYmFyZCA8amh1YmJhcmRAbnZpZGlhLmNvbT4KLS0tCiBtbS9t
ZW1wb2xpY3kuYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0t
Z2l0IGEvbW0vbWVtcG9saWN5LmMgYi9tbS9tZW1wb2xpY3kuYwppbmRleCAwMTYwMGQ4MGFlMDEu
LmY5MDIzYjVmYmEzNyAxMDA2NDQKLS0tIGEvbW0vbWVtcG9saWN5LmMKKysrIGIvbW0vbWVtcG9s
aWN5LmMKQEAgLTIwOTgsNiArMjA5OCw3IEBAIGFsbG9jX3BhZ2VzX3ZtYShnZnBfdCBnZnAsIGlu
dCBvcmRlciwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiBvdXQ6CiAJcmV0dXJuIHBhZ2U7
CiB9CitFWFBPUlRfU1lNQk9MX0dQTChhbGxvY19wYWdlc192bWEpOwogCiAvKioKICAqIAlhbGxv
Y19wYWdlc19jdXJyZW50IC0gQWxsb2NhdGUgcGFnZXMuCi0tIAoyLjIwLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0
Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
