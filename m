Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0061083639
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 073836E41A;
	Tue,  6 Aug 2019 16:06:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F0A26E41D;
 Tue,  6 Aug 2019 16:06:23 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yd-0000b0-BS; Tue, 06 Aug 2019 16:06:19 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:47 +0300
Message-Id: <20190806160554.14046-10-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806160554.14046-1-hch@lst.de>
References: <20190806160554.14046-1-hch@lst.de>
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
 bh=hA5e1EMCJqgYejGyHIpPpeJ8rKRPHls2nPKmf9TbEpQ=; b=LJcJrwq5ZQewZswvYmY5mRyZpk
 1/AAsPIRIW9UA0cst7PGgdo7pRhh4ePjyxEFTqCdsjh7EUORxH2CndglB5DcSZf9X3N8Sn6sKAltb
 WWBPJiV/lfl2ul+hsqSrk3D/C5ivDdgjfKPGZTXQhSeNBkogGgnyFlzPfkD559I+eEh9rfGeY2c5w
 FXeB6uScMW1EUmmFK+YdXOfdvFKqwMpCyBF9uzdonrdefrto7s1GONe11pm+yR0lE/qvtGNXNdtUe
 37jSnqybZHehtfCReL3qhmxac2PdimKbmfpWhqJn7mnocY10bShkJ+bK3Y3BkCgnsn/hpbFZ7MPsn
 8usxetzw==;
Subject: [Nouveau] [PATCH 09/15] mm: don't abuse pte_index() in
 hmm_vma_handle_pmd
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

cHRlX2luZGV4IGlzIGFuIGludGVybmFsIGFyY2ggaGVscGVyIGluIHZhcmlvdXMgYXJjaGl0ZWN0
dXJlcywKd2l0aG91dCBjb25zaXN0ZW50IHNlbWFudGljcy4gIE9wZW4gY29kZSB0aGF0IGNhbGN1
bGF0aW9uIG9mIGEgUE1ECmluZGV4IGJhc2VkIG9uIHRoZSB2aXJ0dWFsIGFkZHJlc3MgaW5zdGVh
ZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgotLS0KIG1t
L2htbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9u
KC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCAwM2QzN2UxMDJlM2Iu
LjIwODNlNGRiNDZmNSAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTQ4
Niw3ICs0ODYsNyBAQCBzdGF0aWMgaW50IGhtbV92bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2Fs
ayAqd2FsaywKIAlpZiAocG1kX3Byb3Rub25lKHBtZCkgfHwgZmF1bHQgfHwgd3JpdGVfZmF1bHQp
CiAJCXJldHVybiBobW1fdm1hX3dhbGtfaG9sZV8oYWRkciwgZW5kLCBmYXVsdCwgd3JpdGVfZmF1
bHQsIHdhbGspOwogCi0JcGZuID0gcG1kX3BmbihwbWQpICsgcHRlX2luZGV4KGFkZHIpOworCXBm
biA9IHBtZF9wZm4ocG1kKSArICgoYWRkciAmIH5QTURfTUFTSykgPj4gUEFHRV9TSElGVCk7CiAJ
Zm9yIChpID0gMDsgYWRkciA8IGVuZDsgYWRkciArPSBQQUdFX1NJWkUsIGkrKywgcGZuKyspIHsK
IAkJaWYgKHBtZF9kZXZtYXAocG1kKSkgewogCQkJcGdtYXAgPSBnZXRfZGV2X3BhZ2VtYXAocGZu
LCBwZ21hcCk7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQ==
