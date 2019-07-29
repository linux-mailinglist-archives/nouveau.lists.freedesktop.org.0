Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5884B78DE8
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBCE589C0A;
	Mon, 29 Jul 2019 14:29:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90D5A89C33;
 Mon, 29 Jul 2019 14:29:06 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6e4-0006JM-9F; Mon, 29 Jul 2019 14:29:00 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:36 +0300
Message-Id: <20190729142843.22320-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729142843.22320-1-hch@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
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
 bh=rLwKSOlafAJb8n3hQj6kWA/VptqS/47DN+jL5NpRAcY=; b=A+IRZ8M1YJH2N/gpPN/5CPiigV
 i/LsLL/cCmEExGvDC7zuiAS3QzG/GI0Ed8MghHETAe8DC5dwOCftZsYXuDgDha21U89uP4jRALlx6
 wYIarlhg/pz70o5kgZxi0oDVRBFxgi2caIj3mgBuRcZbFBF84n+3Ps25EnKxvguNY8dZm/GG6xlCO
 2lPhHQ1IEuUTTjUmEPOo7Qx6Ji0Inu5VxdUlf2aSxirRwZtpZ4Rn+/aQ8E3fFDscxF8hLpUOco1PP
 s5Nej8OFdg0xkTb7AewQR47WxbZ4yp+Hr/wJShONMpmmeawP3eh4LVmkE0GVIWJAp4keNUAaACguQ
 uGoMGT8A==;
Subject: [Nouveau] [PATCH 2/9] nouveau: reset dma_nr in
 nouveau_dmem_migrate_alloc_and_copy
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

V2hlbiB3ZSBzdGFydCBhIG5ldyBiYXRjaCBvZiBkbWFfbWFwIG9wZXJhdGlvbnMgd2UgbmVlZCB0
byByZXNldCBkbWFfbnIsCmFzIHdlIHN0YXJ0IGZpbGxpbmcgYSBuZXdseSBhbGxvY2F0ZWQgYXJy
YXkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDEgKwogMSBmaWxlIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwpp
bmRleCAzODQxNjc5OGFiZDQuLmU2OTYxNTdmNzcxZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kbWVtLmMKQEAgLTY4Miw2ICs2ODIsNyBAQCBub3V2ZWF1X2RtZW1fbWlncmF0ZV9h
bGxvY19hbmRfY29weShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAltaWdyYXRlLT5kbWEg
PSBrbWFsbG9jKHNpemVvZigqbWlncmF0ZS0+ZG1hKSAqIG5wYWdlcywgR0ZQX0tFUk5FTCk7CiAJ
aWYgKCFtaWdyYXRlLT5kbWEpCiAJCWdvdG8gZXJyb3I7CisJbWlncmF0ZS0+ZG1hX25yID0gMDsK
IAogCS8qIENvcHkgdGhpbmdzIG92ZXIgKi8KIAljb3B5ID0gZHJtLT5kbWVtLT5taWdyYXRlLmNv
cHlfZnVuYzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
