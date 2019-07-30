Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 809FC7A09E
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60426E3E9;
	Tue, 30 Jul 2019 05:52:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAA86E3E9;
 Tue, 30 Jul 2019 05:52:23 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3c-00015E-DZ; Tue, 30 Jul 2019 05:52:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:51:52 +0300
Message-Id: <20190730055203.28467-3-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730055203.28467-1-hch@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
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
 bh=MiAJz6/LGZ9crHwvj8CLjPFMqAcUr7sr54tyumAelRs=; b=Rg7K55yowl6k/ZPgtgKzOFotco
 EVRGBimUYALuPVAK+Kd0lIYGAgz8qtzz4r7Rt2jsMd0MtpQWT8xWTjMhSpjmP6B+WzSAt0NQxsH3z
 +abmLHxfsepvGEZ16JG88WTk4KK/xmmi/835FUkRt3rJXl5jFfuGcN+T4XXHJZr+nfh2bJRDlW3PY
 pEOwZbQr5FVYHNr00EG+63WsoZ6aeTTX2HHITa6njQqVgFg/XDoSqkAj0N5KDOYMSp9n85MUhgF5D
 whhEQ2w7Jug4LOPnVeW4QA+7KPrsRNLvw5OSVDmss722pMK5UEW5tPkequZrhaCLygy8OXTJOT9po
 zeDCXljw==;
Subject: [Nouveau] [PATCH 02/13] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
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

VGhlIGxpc3QgaXMgdXNlZCB0byBhZGQgdGhlIHJhbmdlIHRvIGFub3RoZXIgbGlzdCBhcyBhbiBl
bnRyeSBpbiB0aGUKY29yZSBobW0gY29kZSwgc28gdGhlcmUgaXMgbm8gbmVlZCB0byBpbml0aWFs
aXplIGl0IGluIGEgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+Ci0tLQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgfCAx
IC0KIDEgZmlsZSBjaGFuZ2VkLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbW4uYwppbmRleCBiNjk4YjQyM2IyNWQuLjYwYjlmYzk1NjFkNyAxMDA2NDQKLS0t
IGEvZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X21uLmMKQEAgLTQ4NCw2ICs0ODQsNSBAQCB2b2lkIGFt
ZGdwdV9obW1faW5pdF9yYW5nZShzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIAkJcmFuZ2UtPmZs
YWdzID0gaG1tX3JhbmdlX2ZsYWdzOwogCQlyYW5nZS0+dmFsdWVzID0gaG1tX3JhbmdlX3ZhbHVl
czsKIAkJcmFuZ2UtPnBmbl9zaGlmdCA9IFBBR0VfU0hJRlQ7Ci0JCUlOSVRfTElTVF9IRUFEKCZy
YW5nZS0+bGlzdCk7CiAJfQogfQotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3Rz
LmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xp
c3RpbmZvL25vdXZlYXU=
