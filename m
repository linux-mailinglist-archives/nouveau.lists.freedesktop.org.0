Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7F3E568D2
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:27:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D8A7D6E3C1;
	Wed, 26 Jun 2019 12:27:49 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 156C46E3BC;
 Wed, 26 Jun 2019 12:27:48 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71b-0001M0-MI; Wed, 26 Jun 2019 12:27:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:27:05 +0200
Message-Id: <20190626122724.13313-7-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190626122724.13313-1-hch@lst.de>
References: <20190626122724.13313-1-hch@lst.de>
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
 bh=BPkZHHIHMHfLZtQnho6ADB3HOg0fG+ODbmu+2ZG5xyw=; b=jk74jAEbOrotcGBG5yTuu12mN9
 C7kyksJxP1KCYqUPKHazaYWg5kM7S7/Y93S1Dfun5FvBnkOn75aymSxIlC+REhc60+4tcuXRgTbBS
 H5faXnHQq7hSL832z10DovznO408+wuzv7SZabppvcvXXiPJG5+EAKioh0Sqov/x3VderuyLZ/f3J
 vJBmHaWcyJS9+qeWoVMZdkaOKi1XqR2KxkM7w9FwTgKp7Pu5xlHdH30hk8T+St23PY28xR1/Pkz4r
 au6n9mzTWdfrklWEZECBO0+bqRU2RIMg379zl8o++5ajUzWzEVtuOnrvMCrwHG3Us4QU4vqDgbMkG
 UbjgkTBg==;
Subject: [Nouveau] [PATCH 06/25] mm: export alloc_pages_vma
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
LmY0ODU2OWFhMTg2MyAxMDA2NDQKLS0tIGEvbW0vbWVtcG9saWN5LmMKKysrIGIvbW0vbWVtcG9s
aWN5LmMKQEAgLTIwOTgsNiArMjA5OCw3IEBAIGFsbG9jX3BhZ2VzX3ZtYShnZnBfdCBnZnAsIGlu
dCBvcmRlciwgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiBvdXQ6CiAJcmV0dXJuIHBhZ2U7
CiB9CitFWFBPUlRfU1lNQk9MKGFsbG9jX3BhZ2VzX3ZtYSk7CiAKIC8qKgogICogCWFsbG9jX3Bh
Z2VzX2N1cnJlbnQgLSBBbGxvY2F0ZSBwYWdlcy4KLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
