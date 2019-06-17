Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF6A548204
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:27:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E45A589117;
	Mon, 17 Jun 2019 12:27:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3416C890EF;
 Mon, 17 Jun 2019 12:27:44 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqjb-0008KG-Cp; Mon, 17 Jun 2019 12:27:39 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:09 +0200
Message-Id: <20190617122733.22432-2-hch@lst.de>
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
 bh=PvDb2Ox1k4dZazYGdHDZANbuB1HI2/N93WOg6eXhjAQ=; b=sb1bPHYSDLwe702WgBPwsLs+J0
 vhPm0vc39IREraw5fNiKWwVi9b2XYJL8w6l2OeJY6AgdG8fPQh63r1aibZKvGoX4P777qmADQIXze
 OYKNAjycAzImv4MUUNJ1Sv6fOnX95UP0Tu509ppILxE5n4d614sDWPMcRXsHXnhq1gEXEUCA1AvUq
 OqgqDRRmXt/AFAdHkWOVd0/MMaDaR60es8wSgvkI32aP283KFFhUOZkJ79kLqoS/P/7e6eF2EVA7o
 0cDAzMOCQw8d61JCfYZgkqA5mYDhyXUXH6xL/G5qSJueB/oc/v0KwCGT+woKWUhfY5a9eI/qAtVq6
 jjs4LpNQ==;
Subject: [Nouveau] [PATCH 01/25] mm: remove the unused ARCH_HAS_HMM_DEVICE
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogbW0vS2NvbmZpZyB8IDEw
IC0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxMCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZwppbmRleCBmMGM3NmJhNDc2OTUuLjBkMmJhN2UxZjQz
ZSAxMDA2NDQKLS0tIGEvbW0vS2NvbmZpZworKysgYi9tbS9LY29uZmlnCkBAIC02NzUsMTYgKzY3
NSw2IEBAIGNvbmZpZyBBUkNIX0hBU19ITU1fTUlSUk9SCiAJZGVwZW5kcyBvbiAoWDg2XzY0IHx8
IFBQQzY0KQogCWRlcGVuZHMgb24gTU1VICYmIDY0QklUCiAKLWNvbmZpZyBBUkNIX0hBU19ITU1f
REVWSUNFCi0JYm9vbAotCWRlZmF1bHQgeQotCWRlcGVuZHMgb24gKFg4Nl82NCB8fCBQUEM2NCkK
LQlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCi0JZGVwZW5kcyBvbiBNRU1PUllfSE9UUkVNT1ZF
Ci0JZGVwZW5kcyBvbiBTUEFSU0VNRU1fVk1FTU1BUAotCWRlcGVuZHMgb24gQVJDSF9IQVNfWk9O
RV9ERVZJQ0UKLQlzZWxlY3QgWEFSUkFZX01VTFRJCi0KIGNvbmZpZyBBUkNIX0hBU19ITU0KIAli
b29sCiAJZGVmYXVsdCB5Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
