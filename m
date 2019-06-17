Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6834048232
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C71B389237;
	Mon, 17 Jun 2019 12:28:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A1059891EB;
 Mon, 17 Jun 2019 12:28:28 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqkJ-0000Qu-Su; Mon, 17 Jun 2019 12:28:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:29 +0200
Message-Id: <20190617122733.22432-22-hch@lst.de>
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
 bh=a9DxKrjk6QhfPonTyrF2mzugaowpnIicUuVlQP+zq4o=; b=cb4e9uP9535wnLLOSnyqggTl8I
 82wOdiYWnYuuZDAUgSyu83ySmcMJojBjfZpU/s/pwummAkreTbFbiDHxAlfmBp5zlGTCnvwaEkK/L
 m1+oWm8zfvKdQd7GjZ0w1pVZLn03vSyh1IoQL4nXiuZP60/CtR4bs0Fm58kSyrWF4OpfS1kgWP6tx
 YnPl/xrcUiJCqrWQhwC7a/lCoLnzRnV06voZ+USZ2cbZhzpOyPZZwkkTeqQsbHiFvOxIVh2073+QJ
 QM/0SM6iEz4vo+RuWl6T+Yc7bPyaPv8+xdh1ViBq0agPBngSwftA/sRBlGXYsGYx+CFcC1b9d2sia
 w6ZGeIZw==;
Subject: [Nouveau] [PATCH 21/25] mm: mark DEVICE_PUBLIC as broken
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

VGhlIGNvZGUgaGFzbid0IGJlZW4gdXNlZCBzaW5jZSBpdCB3YXMgYWRkZWQgdG8gdGhlIHRyZWUs
IGFuZCBkb2Vzbid0CmFwcGVhciB0byBhY3R1YWxseSBiZSB1c2FibGUuICBNYXJrIGl0IGFzIEJS
T0tFTiB1bnRpbCBlaXRoZXIgYSB1c2VyCmNvbWVzIGFsb25nIG9yIHdlIGZpbmFsbHkgZ2l2ZSB1
cCBvbiBpdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpS
ZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgotLS0KIG1tL0tj
b25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdpdCBh
L21tL0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4IDBkMmJhN2UxZjQzZS4uNDA2ZmE0NWU5ZWNj
IDEwMDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBiL21tL0tjb25maWcKQEAgLTcyMSw2ICs3MjEs
NyBAQCBjb25maWcgREVWSUNFX1BSSVZBVEUKIGNvbmZpZyBERVZJQ0VfUFVCTElDCiAJYm9vbCAi
QWRkcmVzc2FibGUgZGV2aWNlIG1lbW9yeSAobGlrZSBHUFUgbWVtb3J5KSIKIAlkZXBlbmRzIG9u
IEFSQ0hfSEFTX0hNTQorCWRlcGVuZHMgb24gQlJPS0VOCiAJc2VsZWN0IEhNTQogCXNlbGVjdCBE
RVZfUEFHRU1BUF9PUFMKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
