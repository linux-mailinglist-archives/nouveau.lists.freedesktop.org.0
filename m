Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 694C84823B
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51C78922A;
	Mon, 17 Jun 2019 12:28:38 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A75C289263;
 Mon, 17 Jun 2019 12:28:36 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqkS-0000eV-VL; Mon, 17 Jun 2019 12:28:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:33 +0200
Message-Id: <20190617122733.22432-26-hch@lst.de>
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
 bh=I8PlqMUI4C1+5AXdWNAvJGUn4z7E5OvP3cFwdUwwRcM=; b=idjxwSVcGR8gj/Hv9rgN32Pbhq
 n+B3Dw/eAY5nzc0hWjvE0/DJdYcXUudxghMTEfuhBlOZzQqw6Kp9Ri+RNMJ+ZbD/rpwTc7jNnggaJ
 oWqEp9P7byqhhh4K1c+iPeFxUZ8V7J2oZFOxQqqzjxHYw+5SJgb3oBcJchVokBPs8JXyeVW8tAhRx
 i7ntPKqW6sOS8kblCvWSXQcLZNVxYW/7zdv6j5cHwyvtGEDGaTmZwfX2j/Yje0mucmxOeMh4+QyGl
 st8aBl75weQTuuByjCtZpmELlzhnz8odxyh1rYlQ1/iPx/2DY6A/ochv2KYvVjetIbSP6uDrsRviB
 sLz4N94A==;
Subject: [Nouveau] [PATCH 25/25] mm: don't select MIGRATE_VMA_HELPER from
 HMM_MIRROR
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

VGhlIG1pZ3JhdGVfdm1hIGhlbHBlciBpcyBvbmx5IHVzZWQgYnkgbm92ZWF1IHRvIG1pZ3JhdGUg
ZGV2aWNlIHByaXZhdGUKcGFnZXMgYXJvdW5kLiAgT3RoZXIgSE1NX01JUlJPUiB1c2VycyBsaWtl
IGFtZGdwdSBvciBpbmZpbmliYW5kIGRvbid0Cm5lZWQgaXQuCgpTaWduZWQtb2ZmLWJ5OiBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KUmV2aWV3ZWQtYnk6IEphc29uIEd1bnRob3JwZSA8
amdnQG1lbGxhbm94LmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIHwg
MSArCiBtbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiAyIGZpbGVzIGNoYW5n
ZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcK
aW5kZXggNjZjODM5ZDhlOWQxLi45NmI5ODE0ZTZkMDYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZp
ZwpAQCAtODgsNiArODgsNyBAQCBjb25maWcgRFJNX05PVVZFQVVfU1ZNCiAJZGVwZW5kcyBvbiBE
Uk1fTk9VVkVBVQogCWRlcGVuZHMgb24gSE1NX01JUlJPUgogCWRlcGVuZHMgb24gU1RBR0lORwor
CXNlbGVjdCBNSUdSQVRFX1ZNQV9IRUxQRVIKIAlkZWZhdWx0IG4KIAloZWxwCiAJICBTYXkgWSBo
ZXJlIGlmIHlvdSB3YW50IHRvIGVuYWJsZSBleHBlcmltZW50YWwgc3VwcG9ydCBmb3IKZGlmZiAt
LWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4IDdmYTc4NTU1MWY5Ni4uNTVjOWM2
NjFlMmVlIDEwMDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBiL21tL0tjb25maWcKQEAgLTY4MCw3
ICs2ODAsNiBAQCBjb25maWcgSE1NX01JUlJPUgogCWRlcGVuZHMgb24gKFg4Nl82NCB8fCBQUEM2
NCkKIAlkZXBlbmRzIG9uIE1NVSAmJiA2NEJJVAogCXNlbGVjdCBNTVVfTk9USUZJRVIKLQlzZWxl
Y3QgTUlHUkFURV9WTUFfSEVMUEVSCiAJaGVscAogCSAgU2VsZWN0IEhNTV9NSVJST1IgaWYgeW91
IHdhbnQgdG8gbWlycm9yIHJhbmdlIG9mIHRoZSBDUFUgcGFnZSB0YWJsZSBvZiBhCiAJICBwcm9j
ZXNzIGludG8gYSBkZXZpY2UgcGFnZSB0YWJsZS4gSGVyZSwgbWlycm9yIG1lYW5zICJrZWVwIHN5
bmNocm9uaXplZCIuCi0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
