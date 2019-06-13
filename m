Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B6F18434E5
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7759898A7;
	Thu, 13 Jun 2019 09:44:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABC5489872;
 Thu, 13 Jun 2019 09:44:24 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMHM-0001vf-Vf; Thu, 13 Jun 2019 09:44:21 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:21 +0200
Message-Id: <20190613094326.24093-19-hch@lst.de>
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
 bh=CRiADhhFQCJg9nNjQAj6fEu4785skzNOaJQJ8kIUJ84=; b=RICVtgPD9yRZZLP5zsYav1rSx/
 4WdeVXj2hZit21ZRFFahZ0/Xb9mrzF4vFMbjwhHwZzDxsHyjhAYAjmS4CGJjsNQ74TT7TZO+AoiA8
 +ykg9PdHRyJwz/zj0+/7ArN0Je2Zw3qhosZvIyWbnFjQtkiduRtXyxNYuw04kKoGUORMz6fHpxLtZ
 YTsDeVucQ5ychr3mWksaSDMicYxSgVYHcYqX1CuoizhG/ngsFEwRbS6GP4xrZvfELvZso8ubWK1Qy
 sTIETQwqU64lawnEds6n1N2gMvIX74tlW7hKHlfT8cTH89GLpVOhPBfu2I9eGuksdH2m3MVGivwF/
 Hf1LW1Lg==;
Subject: [Nouveau] [PATCH 18/22] mm: mark DEVICE_PUBLIC as broken
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
cCBvbiBpdC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgot
LS0KIG1tL0tjb25maWcgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlm
ZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4IDBkMmJhN2UxZjQzZS4uNDA2
ZmE0NWU5ZWNjIDEwMDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBiL21tL0tjb25maWcKQEAgLTcy
MSw2ICs3MjEsNyBAQCBjb25maWcgREVWSUNFX1BSSVZBVEUKIGNvbmZpZyBERVZJQ0VfUFVCTElD
CiAJYm9vbCAiQWRkcmVzc2FibGUgZGV2aWNlIG1lbW9yeSAobGlrZSBHUFUgbWVtb3J5KSIKIAlk
ZXBlbmRzIG9uIEFSQ0hfSEFTX0hNTQorCWRlcGVuZHMgb24gQlJPS0VOCiAJc2VsZWN0IEhNTQog
CXNlbGVjdCBERVZfUEFHRU1BUF9PUFMKIAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
