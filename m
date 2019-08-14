Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 905BF8CD65
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 10:00:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F073D6E47E;
	Wed, 14 Aug 2019 08:00:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F103989A92;
 Wed, 14 Aug 2019 08:00:09 +0000 (UTC)
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxoCP-0008Bl-UL; Wed, 14 Aug 2019 08:00:02 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 14 Aug 2019 09:59:28 +0200
Message-Id: <20190814075928.23766-11-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
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
 bh=aAnmSRph1c1Gu2+S0Bf5dmihLUaL6lE7+YQ+WyB/8Io=; b=bM+YSebvWYi9TWCoNWvznDU4rK
 PbGYSC1kDL4lM+HJPv/XKvL+1+89tZCp9zpByE9sGHwJjWDQjUUyETZEtrYJ2ZVWr+nImLnODGhGr
 Px7VZx/459JkWE+617Z320wbe59gs70dEAfTZFkf7gxjUpz+comcBvRsHIs/2/wp7d/28TxxQGeaC
 QnxdelxFLgpddzI4JUuX9iBWcEcI3jEaTh983n/LE0kJUerNxqxQekySl+oWl/1d+10zpd/blkhvt
 1FKMaw1LL9eaVdr02KhYgcBEOpEj61YaLSReU27GR2//wmzBVDoKxKWf4VXSE3L6wcQsGyle3EMmm
 WVu8ZTag==;
Subject: [Nouveau] [PATCH 10/10] mm: remove CONFIG_MIGRATE_VMA_HELPER
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Bharata B Rao <bharata@linux.ibm.com>, linux-mm@kvack.org,
 Andrew Morton <akpm@linux-foundation.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Q09ORklHX01JR1JBVEVfVk1BX0hFTFBFUiBndWFyZHMgaGVscGVycyB0aGF0IGFyZSByZXF1aXJl
ZCBmb3IgcHJvcGVyCmRldmljIHByaXZhdGUgbWVtb3J5IHN1cHBvcnQuICBSZW1vdmUgdGhlIG9w
dGlvbiBhbmQganVzdCBjaGVjayBmb3IKQ09ORklHX0RFVklDRV9QUklWQVRFIGluc3RlYWQuCgpT
aWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9LY29uZmlnIHwgMSAtCiBtbS9LY29uZmlnICAgICAgICAgICAgICAg
ICAgICAgIHwgMyAtLS0KIG1tL21pZ3JhdGUuYyAgICAgICAgICAgICAgICAgICAgfCA0ICsrLS0K
IDMgZmlsZXMgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9LY29uZmlnCmluZGV4IGRmNDM1MmMyNzliYS4uMzU1OGRmMDQzNTkyIDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9LY29uZmlnCisrKyBiL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L0tjb25maWcKQEAgLTg5LDcgKzg5LDYgQEAgY29uZmlnIERSTV9OT1VWRUFVX1NW
TQogCWRlcGVuZHMgb24gTU1VCiAJZGVwZW5kcyBvbiBTVEFHSU5HCiAJc2VsZWN0IEhNTV9NSVJS
T1IKLQlzZWxlY3QgTUlHUkFURV9WTUFfSEVMUEVSCiAJc2VsZWN0IE1NVV9OT1RJRklFUgogCWRl
ZmF1bHQgbgogCWhlbHAKZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4
IDU2MzQzNmRjMWYyNC4uMmZlNDkwMmFkNzU1IDEwMDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBi
L21tL0tjb25maWcKQEAgLTY2OSw5ICs2NjksNiBAQCBjb25maWcgWk9ORV9ERVZJQ0UKIAogCSAg
SWYgRlNfREFYIGlzIGVuYWJsZWQsIHRoZW4gc2F5IFkuCiAKLWNvbmZpZyBNSUdSQVRFX1ZNQV9I
RUxQRVIKLQlib29sCi0KIGNvbmZpZyBERVZfUEFHRU1BUF9PUFMKIAlib29sCiAKZGlmZiAtLWdp
dCBhL21tL21pZ3JhdGUuYyBiL21tL21pZ3JhdGUuYwppbmRleCAzM2UwNjNjMjhjMWIuLjk5MzM4
NmNiNTMzNSAxMDA2NDQKLS0tIGEvbW0vbWlncmF0ZS5jCisrKyBiL21tL21pZ3JhdGUuYwpAQCAt
MjExNyw3ICsyMTE3LDcgQEAgaW50IG1pZ3JhdGVfbWlzcGxhY2VkX3RyYW5zaHVnZV9wYWdlKHN0
cnVjdCBtbV9zdHJ1Y3QgKm1tLAogCiAjZW5kaWYgLyogQ09ORklHX05VTUEgKi8KIAotI2lmIGRl
ZmluZWQoQ09ORklHX01JR1JBVEVfVk1BX0hFTFBFUikKKyNpZmRlZiBDT05GSUdfREVWSUNFX1BS
SVZBVEUKIHN0YXRpYyBpbnQgbWlncmF0ZV92bWFfY29sbGVjdF9ob2xlKHVuc2lnbmVkIGxvbmcg
c3RhcnQsCiAJCQkJICAgIHVuc2lnbmVkIGxvbmcgZW5kLAogCQkJCSAgICBzdHJ1Y3QgbW1fd2Fs
ayAqd2FsaykKQEAgLTI5NDIsNCArMjk0Miw0IEBAIHZvaWQgbWlncmF0ZV92bWFfZmluYWxpemUo
c3RydWN0IG1pZ3JhdGVfdm1hICptaWdyYXRlKQogCX0KIH0KIEVYUE9SVF9TWU1CT0wobWlncmF0
ZV92bWFfZmluYWxpemUpOwotI2VuZGlmIC8qIGRlZmluZWQoTUlHUkFURV9WTUFfSEVMUEVSKSAq
LworI2VuZGlmIC8qIENPTkZJR19ERVZJQ0VfUFJJVkFURSAqLwotLSAKMi4yMC4xCgpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
