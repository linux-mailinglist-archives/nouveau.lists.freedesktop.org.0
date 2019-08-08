Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8BF5865D5
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 17:34:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B78B6E885;
	Thu,  8 Aug 2019 15:34:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 62D5F6E870;
 Thu,  8 Aug 2019 15:34:00 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvkQN-0005Ak-P2; Thu, 08 Aug 2019 15:33:56 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu,  8 Aug 2019 18:33:39 +0300
Message-Id: <20190808153346.9061-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808153346.9061-1-hch@lst.de>
References: <20190808153346.9061-1-hch@lst.de>
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
 bh=r4axfViZZyZ+fuvT3jC+Yx773mt75vv7oepOJvLdF2Q=; b=tMlq/k++S7BlJF3D0IEJuqTiM6
 oqe5hKyEHH8CDmDKg/HmAt2rE73V4uPht0nVKiXD7U/2sWNbvrtvdTYnSe9A0uMfHV1GTMAocfrZe
 Ez6ZnLo9Oq7Y44HE7PPtfLoXruoTWqHHBDl8c5ijWE+wdI0Mnb4PqsoCzJHFGlgupiuSJHN33JcCC
 yysnIlvB94o4LnPBKd7u77cy+tjNHSPn5szyd/vrNWL1lix66MTnaXSMIrsCC/VYJOmjK1F4TwfAM
 F83YjQ/z5Hu9qyggzcysNHSygOCOmR/cTep7P0Q3SKjtTyRoBCizKh34pseJoX+Esu02CkwQepujN
 9ykuGN1A==;
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
YXkuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3
ZWQtYnk6IFJhbHBoIENhbXBiZWxsIDxyY2FtcGJlbGxAbnZpZGlhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDEgKwogMSBmaWxlIGNoYW5nZWQsIDEg
aW5zZXJ0aW9uKCspCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kbWVtLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYwppbmRleCAz
ODQxNjc5OGFiZDQuLmU2OTYxNTdmNzcxZSAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9kbWVtLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVh
dV9kbWVtLmMKQEAgLTY4Miw2ICs2ODIsNyBAQCBub3V2ZWF1X2RtZW1fbWlncmF0ZV9hbGxvY19h
bmRfY29weShzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYSwKIAltaWdyYXRlLT5kbWEgPSBrbWFs
bG9jKHNpemVvZigqbWlncmF0ZS0+ZG1hKSAqIG5wYWdlcywgR0ZQX0tFUk5FTCk7CiAJaWYgKCFt
aWdyYXRlLT5kbWEpCiAJCWdvdG8gZXJyb3I7CisJbWlncmF0ZS0+ZG1hX25yID0gMDsKIAogCS8q
IENvcHkgdGhpbmdzIG92ZXIgKi8KIAljb3B5ID0gZHJtLT5kbWVtLT5taWdyYXRlLmNvcHlfZnVu
YzsKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
