Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B8BF434BF
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:43:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68B89892F0;
	Thu, 13 Jun 2019 09:43:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1465C892F0;
 Thu, 13 Jun 2019 09:43:37 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMGa-0001jn-7o; Thu, 13 Jun 2019 09:43:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:04 +0200
Message-Id: <20190613094326.24093-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190613094326.24093-1-hch@lst.de>
References: <20190613094326.24093-1-hch@lst.de>
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
 bh=kaMWV25JLh2oaHk6KDUPHO1aktYAmWaT94i0RYQYzUw=; b=SIOUKYPAoDNdv7dWJhGfW0ob9k
 SLpR4leODIPqaX5ZslP+W4SJcJ9U7DECzPF7id4CLr1TIXVk0TrdeRnB2mSBfkwHV0BwXM9hz+pAg
 MRIkDGTi/GEKbHR7IahvnzYVCFrGOql4J+HQbbAxBYnBDBvqLJf14fWFUzQPYx6sWG+RncvSxlFHs
 UVuWutw1NZcBceRsSHnUv96ep8AN6pJSCjApiFhahvIwVDcAXbo2avAu2oiRkulO4cM29bofUBPE/
 aJ6WgM8we7zOD5oK498LUnb7YTFkOzfiKswyBFy1ZCZiC3yGAwDX1/fPAToXlZJ0IO1qvMnAWyaKu
 nuFh1UuA==;
Subject: [Nouveau] [PATCH 01/22] mm: remove the unused ARCH_HAS_HMM_DEVICE
 Kconfig option
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogbW0vS2Nv
bmZpZyB8IDEwIC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRp
ZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZwppbmRleCBmMGM3NmJhNDc2OTUuLjBk
MmJhN2UxZjQzZSAxMDA2NDQKLS0tIGEvbW0vS2NvbmZpZworKysgYi9tbS9LY29uZmlnCkBAIC02
NzUsMTYgKzY3NSw2IEBAIGNvbmZpZyBBUkNIX0hBU19ITU1fTUlSUk9SCiAJZGVwZW5kcyBvbiAo
WDg2XzY0IHx8IFBQQzY0KQogCWRlcGVuZHMgb24gTU1VICYmIDY0QklUCiAKLWNvbmZpZyBBUkNI
X0hBU19ITU1fREVWSUNFCi0JYm9vbAotCWRlZmF1bHQgeQotCWRlcGVuZHMgb24gKFg4Nl82NCB8
fCBQUEM2NCkKLQlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCi0JZGVwZW5kcyBvbiBNRU1PUllf
SE9UUkVNT1ZFCi0JZGVwZW5kcyBvbiBTUEFSU0VNRU1fVk1FTU1BUAotCWRlcGVuZHMgb24gQVJD
SF9IQVNfWk9ORV9ERVZJQ0UKLQlzZWxlY3QgWEFSUkFZX01VTFRJCi0KIGNvbmZpZyBBUkNIX0hB
U19ITU0KIAlib29sCiAJZGVmYXVsdCB5Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
