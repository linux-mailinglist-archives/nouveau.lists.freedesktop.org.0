Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B475D434ED
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:44:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68E1289890;
	Thu, 13 Jun 2019 09:44:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FADB89890;
 Thu, 13 Jun 2019 09:44:36 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMHY-0001yQ-Rm; Thu, 13 Jun 2019 09:44:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:25 +0200
Message-Id: <20190613094326.24093-23-hch@lst.de>
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
 bh=0sAfzDlcAsndHKBt75dqqx/GnOCOQqtRdathOjahJzQ=; b=trz7K9USBFzK+xAnepin47AmRr
 Ru/Ufe0ArOAav00lGoPPzRUVxrswp05DRpD2d5fXaeZItnlHIGrtF1O1z/B5eK/v1ypkuEUV33AoE
 O6sWXD/9uMVmrJLXNRSSRwxNiWV3okj38PS6HOorCIE1095zMfIxNPliWKgHj+KFNGQYjRJfvAAE9
 OZPPi7DMhfjs+Ay9FbxkmMkIi0kMa6qSNkzN8TL3yorsUR6y30VoiV0rQhnhlXUczuR6wnoc3Tr3D
 5CrUdFq3rR6UxwQZviB1fSzfyE69t0fvrojVXmSEKwbbynKreccgHDzaxSTGmzkzt23o/mQnE0h+e
 YEeclslA==;
Subject: [Nouveau] [PATCH 22/22] mm: don't select MIGRATE_VMA_HELPER from
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
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9L
Y29uZmlnIHwgMSArCiBtbS9LY29uZmlnICAgICAgICAgICAgICAgICAgICAgIHwgMSAtCiAyIGZp
bGVzIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEv
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvS2NvbmZpZyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L0tjb25maWcKaW5kZXggNjZjODM5ZDhlOWQxLi45NmI5ODE0ZTZkMDYgMTAwNjQ0Ci0tLSBhL2Ry
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L0tjb25maWcKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvS2NvbmZpZwpAQCAtODgsNiArODgsNyBAQCBjb25maWcgRFJNX05PVVZFQVVfU1ZNCiAJZGVw
ZW5kcyBvbiBEUk1fTk9VVkVBVQogCWRlcGVuZHMgb24gSE1NX01JUlJPUgogCWRlcGVuZHMgb24g
U1RBR0lORworCXNlbGVjdCBNSUdSQVRFX1ZNQV9IRUxQRVIKIAlkZWZhdWx0IG4KIAloZWxwCiAJ
ICBTYXkgWSBoZXJlIGlmIHlvdSB3YW50IHRvIGVuYWJsZSBleHBlcmltZW50YWwgc3VwcG9ydCBm
b3IKZGlmZiAtLWdpdCBhL21tL0tjb25maWcgYi9tbS9LY29uZmlnCmluZGV4IDczNjc2Y2I0Njkz
Zi4uZWNhODg2NzliNjI0IDEwMDY0NAotLS0gYS9tbS9LY29uZmlnCisrKyBiL21tL0tjb25maWcK
QEAgLTY3OSw3ICs2NzksNiBAQCBjb25maWcgSE1NX01JUlJPUgogCWJvb2wgIkhNTSBtaXJyb3Ig
Q1BVIHBhZ2UgdGFibGUgaW50byBhIGRldmljZSBwYWdlIHRhYmxlIgogCWRlcGVuZHMgb24gTU1V
CiAJc2VsZWN0IE1NVV9OT1RJRklFUgotCXNlbGVjdCBNSUdSQVRFX1ZNQV9IRUxQRVIKIAloZWxw
CiAJICBTZWxlY3QgSE1NX01JUlJPUiBpZiB5b3Ugd2FudCB0byBtaXJyb3IgcmFuZ2Ugb2YgdGhl
IENQVSBwYWdlIHRhYmxlIG9mIGEKIAkgIHByb2Nlc3MgaW50byBhIGRldmljZSBwYWdlIHRhYmxl
LiBIZXJlLCBtaXJyb3IgbWVhbnMgImtlZXAgc3luY2hyb25pemVkIi4KLS0gCjIuMjAuMQoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
