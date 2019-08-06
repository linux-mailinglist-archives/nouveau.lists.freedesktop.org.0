Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9F3F8363D
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 246E96E453;
	Tue,  6 Aug 2019 16:06:35 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 562F36E445;
 Tue,  6 Aug 2019 16:06:33 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yn-0000dn-PQ; Tue, 06 Aug 2019 16:06:30 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:51 +0300
Message-Id: <20190806160554.14046-14-hch@lst.de>
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
 bh=4qKgBQZXWXwTBeUsDVCjJZkYmTExx287iM57Vyx6Y0w=; b=Bvgunk/17so9cVPFtrFvb/oAYe
 utWSSLH8JHbMNSIEnE52z7hb3mMGYEuLsxBPJwPNcL85QDt9s3oMn/8gSdfDI94Vl68ZYF6E2HTmh
 2CSuFc5mHOZpxHvRiBi4XMp/D2Nrz/C5Z8Sd+68h66wQQUEBe8/zuz5nTWImH5N9TH0oaGS0xmLSr
 nQm2HdXrYj1F4tz1jpUu7FGHbc5wwvCOeuDFImiYrzCOcbAZwn5cH6Dcbl32haJzzjJbE8rUkWbeV
 ySHWE4hYGGUpoGRQw0UfImuDAtA/m93vnOxClQ7CeTYmpjAOngizf1+aQKrmD52wW3gMGr5CLn1Md
 UerXxonw==;
Subject: [Nouveau] [PATCH 13/15] mm: allow HMM_MIRROR on all architectures
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
LgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2Vk
LWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogbW0vS2NvbmZpZyB8
IDMgKy0tCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvbW0vS2NvbmZpZyBiL21tL0tjb25maWcKaW5kZXggNTZjZWM2MzZhMWZjLi5i
MTg3ODJiZTk2OWMgMTAwNjQ0Ci0tLSBhL21tL0tjb25maWcKKysrIGIvbW0vS2NvbmZpZwpAQCAt
Njc3LDggKzY3Nyw3IEBAIGNvbmZpZyBERVZfUEFHRU1BUF9PUFMKIAogY29uZmlnIEhNTV9NSVJS
T1IKIAlib29sICJITU0gbWlycm9yIENQVSBwYWdlIHRhYmxlIGludG8gYSBkZXZpY2UgcGFnZSB0
YWJsZSIKLQlkZXBlbmRzIG9uIChYODZfNjQgfHwgUFBDNjQpCi0JZGVwZW5kcyBvbiBNTVUgJiYg
NjRCSVQKKwlkZXBlbmRzIG9uIE1NVQogCXNlbGVjdCBNTVVfTk9USUZJRVIKIAloZWxwCiAJICBT
ZWxlY3QgSE1NX01JUlJPUiBpZiB5b3Ugd2FudCB0byBtaXJyb3IgcmFuZ2Ugb2YgdGhlIENQVSBw
YWdlIHRhYmxlIG9mIGEKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
