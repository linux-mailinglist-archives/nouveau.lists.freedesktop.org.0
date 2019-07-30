Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE6087A0B5
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 565D06E406;
	Tue, 30 Jul 2019 05:52:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 67DBF6E408;
 Tue, 30 Jul 2019 05:52:57 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL49-0001W7-9f; Tue, 30 Jul 2019 05:52:53 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:52:03 +0300
Message-Id: <20190730055203.28467-14-hch@lst.de>
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
 bh=oeVqzqKgfl2aD6OHsHwpo1ch5592YFZchzgyQdMtYkM=; b=nqj2e5EIZMkVf+8w9hLeGVYCxs
 wdgEDivjCVoIGZbSaAkz3m0Aa7F44xnNI9z9ymc+9rjF5EAY5xgPXlBSUFqXLwPFeeVU3p8Kny9Ci
 fVesCkD2VXf5mq/sNI7dWav6POKUDEzzF4PFZkU+Sp4ftE+haMVcYARlpyIu8wUu3FtqOLhPpXRx4
 rD/U9jRX3Vp4sKK2FXFKTxABMdp8hILpluwAqHq1MSeceWcuDL5ShI5QKZN89NMwkOt6aavp3OD+F
 /euujoS2VqYYiPfYoUIBTNX2wbHkZ3H2aeas2hZTAbQ5Gzd5tys/swezApCF2bDC6z1pzrN2v5hnW
 AibQy3Zg==;
Subject: [Nouveau] [PATCH 13/13] mm: allow HMM_MIRROR on all architectures
 with MMU
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

VGhlcmUgaXNuJ3QgcmVhbGx5IGFueSBhcmNoaXRlY3R1cmUgc3BlY2lmaWMgY29kZSBpbiB0aGlz
IHBhZ2UgdGFibGUKd2FsayBpbXBsZW1lbnRhdGlvbiwgc28gZHJvcCB0aGUgZGVwZW5kZW5jaWVz
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogbW0v
S2NvbmZpZyB8IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCgpkaWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcKaW5kZXggNTZjZWM2
MzZhMWZjLi5iMTg3ODJiZTk2OWMgMTAwNjQ0Ci0tLSBhL21tL0tjb25maWcKKysrIGIvbW0vS2Nv
bmZpZwpAQCAtNjc3LDggKzY3Nyw3IEBAIGNvbmZpZyBERVZfUEFHRU1BUF9PUFMKIAogY29uZmln
IEhNTV9NSVJST1IKIAlib29sICJITU0gbWlycm9yIENQVSBwYWdlIHRhYmxlIGludG8gYSBkZXZp
Y2UgcGFnZSB0YWJsZSIKLQlkZXBlbmRzIG9uIChYODZfNjQgfHwgUFBDNjQpCi0JZGVwZW5kcyBv
biBNTVUgJiYgNjRCSVQKKwlkZXBlbmRzIG9uIE1NVQogCXNlbGVjdCBNTVVfTk9USUZJRVIKIAlo
ZWxwCiAJICBTZWxlY3QgSE1NX01JUlJPUiBpZiB5b3Ugd2FudCB0byBtaXJyb3IgcmFuZ2Ugb2Yg
dGhlIENQVSBwYWdlIHRhYmxlIG9mIGEKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
