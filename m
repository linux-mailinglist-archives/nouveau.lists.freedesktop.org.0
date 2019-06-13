Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AC5E434E9
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A891A898A8;
	Thu, 13 Jun 2019 09:44:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A87A8898BC;
 Thu, 13 Jun 2019 09:44:30 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMHS-0001wn-Qc; Thu, 13 Jun 2019 09:44:27 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:23 +0200
Message-Id: <20190613094326.24093-21-hch@lst.de>
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
 bh=FtWCNVd4QOpMTthKbNz1MFUxeFEvCSuwTqmj0Q74N1M=; b=lGnynT1HToRc+NaRbBtuR81QYR
 NemOaLZIDgAQej+KaIa1UxM9jdzyIje1zBDkPe1VX9Ai3Z8hZ/9xJPbgJt4zVuMpEcWMze36SAPe8
 jadfF1tnyC53GvHJN+XmEhIe1jarXKgqt4YOPBypOu+e8vTxzEa3yDupP2NKBlUg2R8XoiT+70txr
 XjVnT4tikVWG9g+QrpVgLj/2IWv0sdZQEPOrc3z1nIk8VZ3R1YxTTaO5R14SWaIYcAO2xKeDnsgkf
 BG35saHwjH85vx0W3/7W5L524Osw05sNZ5JeAjweKs/0jw6m5MZxo8PHbgl0DcrLc6CYCGDX6R30L
 Li0+Fu8g==;
Subject: [Nouveau] [PATCH 20/22] mm: sort out the DEVICE_PRIVATE Kconfig mess
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

VGhlIFpPTkVfREVWSUNFIHN1cHBvcnQgZG9lc24ndCBkZXBlbmQgb24gYW55dGhpbmcgSE1NIHJl
bGF0ZWQsIGp1c3Qgb24KdmFyaW91cyBiaXRzIG9mIGFyY2ggc3VwcG9ydCBhcyBpbmRpY2F0ZWQg
YnkgdGhlIGFyY2hpdGVjdHVyZS4gIEFsc28KZG9uJ3Qgc2VsZWN0IHRoZSBvcHRpb24gZnJvbSBu
b3V2ZWF1IGFzIGl0IGlzbid0IHByZXNlbnQgaW4gbWFueSBzZXR1cHMsCmFuZCBkZXBlbmQgb24g
aXQgaW5zdGVhZC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcgfCAyICstCiBtbS9LY29uZmln
ICAgICAgICAgICAgICAgICAgICAgIHwgNSArKy0tLQogMiBmaWxlcyBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcKaW5kZXggZGJh
MjYxM2Y3MTgwLi42MzAzZDIwM2FiMWQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZwpAQCAtODUs
MTAgKzg1LDEwIEBAIGNvbmZpZyBEUk1fTk9VVkVBVV9CQUNLTElHSFQKIGNvbmZpZyBEUk1fTk9V
VkVBVV9TVk0KIAlib29sICIoRVhQRVJJTUVOVEFMKSBFbmFibGUgU1ZNIChTaGFyZWQgVmlydHVh
bCBNZW1vcnkpIHN1cHBvcnQiCiAJZGVwZW5kcyBvbiBBUkNIX0hBU19ITU0KKwlkZXBlbmRzIG9u
IERFVklDRV9QUklWQVRFCiAJZGVwZW5kcyBvbiBEUk1fTk9VVkVBVQogCWRlcGVuZHMgb24gU1RB
R0lORwogCXNlbGVjdCBITU1fTUlSUk9SCi0Jc2VsZWN0IERFVklDRV9QUklWQVRFCiAJZGVmYXVs
dCBuCiAJaGVscAogCSAgU2F5IFkgaGVyZSBpZiB5b3Ugd2FudCB0byBlbmFibGUgZXhwZXJpbWVu
dGFsIHN1cHBvcnQgZm9yCmRpZmYgLS1naXQgYS9tbS9LY29uZmlnIGIvbW0vS2NvbmZpZwppbmRl
eCA0MDZmYTQ1ZTllY2MuLjRkYmQ3MThjOGNmNCAxMDA2NDQKLS0tIGEvbW0vS2NvbmZpZworKysg
Yi9tbS9LY29uZmlnCkBAIC02NzcsMTMgKzY3NywxMyBAQCBjb25maWcgQVJDSF9IQVNfSE1NX01J
UlJPUgogCiBjb25maWcgQVJDSF9IQVNfSE1NCiAJYm9vbAotCWRlZmF1bHQgeQogCWRlcGVuZHMg
b24gKFg4Nl82NCB8fCBQUEM2NCkKIAlkZXBlbmRzIG9uIFpPTkVfREVWSUNFCiAJZGVwZW5kcyBv
biBNTVUgJiYgNjRCSVQKIAlkZXBlbmRzIG9uIE1FTU9SWV9IT1RQTFVHCiAJZGVwZW5kcyBvbiBN
RU1PUllfSE9UUkVNT1ZFCiAJZGVwZW5kcyBvbiBTUEFSU0VNRU1fVk1FTU1BUAorCWRlZmF1bHQg
eQogCiBjb25maWcgTUlHUkFURV9WTUFfSEVMUEVSCiAJYm9vbApAQCAtNzA5LDggKzcwOSw3IEBA
IGNvbmZpZyBITU1fTUlSUk9SCiAKIGNvbmZpZyBERVZJQ0VfUFJJVkFURQogCWJvb2wgIlVuYWRk
cmVzc2FibGUgZGV2aWNlIG1lbW9yeSAoR1BVIG1lbW9yeSwgLi4uKSIKLQlkZXBlbmRzIG9uIEFS
Q0hfSEFTX0hNTQotCXNlbGVjdCBITU0KKwlkZXBlbmRzIG9uIFpPTkVfREVWSUNFCiAJc2VsZWN0
IERFVl9QQUdFTUFQX09QUwogCiAJaGVscAotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWls
bWFuL2xpc3RpbmZvL25vdXZlYXU=
