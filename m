Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDCDC865DE
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 17:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DA116E87A;
	Thu,  8 Aug 2019 15:34:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 035BA6E87A;
 Thu,  8 Aug 2019 15:34:21 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvkQg-0005DV-B3; Thu, 08 Aug 2019 15:34:16 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu,  8 Aug 2019 18:33:42 +0300
Message-Id: <20190808153346.9061-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190808153346.9061-1-hch@lst.de>
References: <20190808153346.9061-1-hch@lst.de>
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
 bh=x7ybZjKxR0l979mP5Y8wGTwoC7YG2fijyFoop9SwmvY=; b=ObdDVS93ijfBipfxkruL3vThKy
 YnxggEEQI8ykUgMl/26hlGDBk03JnB6FP4dzUD3ApPS0lnql9HLqZCpje4BTnbrWfBVLGMaBEGA88
 HLJh/R1WQa+bPh3MUsY5w3uZyfozroQFpaIDNKVac4kvUC7E5rvD4YDg/FDwsMgmL3A7rcVOTbz4a
 PBITSwWfVqiOZKRqYZBSushqapyrlBvxP+Zt5FyXgyWKIumCpl+d+vdpV7/IlOw4UGYnjaLGu3NdQ
 50hJ5hO+d03U0TYzdfPi67eqLNQRKRsf7IxW337l5Mtkf6OmcyfV0xL69jFYoi/G/mURABb4p5/So
 GgYtMfFw==;
Subject: [Nouveau] [PATCH 5/9] nouveau: remove a few function stubs
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

bm91dmVhdV9kbWVtX21pZ3JhdGVfdm1hIGFuZCBub3V2ZWF1X2RtZW1fY29udmVydF9wZm4gYXJl
IG9ubHkgY2FsbGVkCndoZW4gQ09ORklHX0RSTV9OT1VWRUFVX1NWTSBpcyBlbmFibGVkLCBzbyB0
aGVyZSBpcyBubyBuZWVkIHRvIHByb3ZpZGUKIUNPTkZJR19EUk1fTk9VVkVBVV9TVk0gc3R1YnMg
Zm9yIHRoZW0uCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4K
LS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uaCB8IDExIC0tLS0tLS0t
LS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RtZW0uaAppbmRleCA5ZDk3ZDc1NmZiN2QuLjkyMzk0YmU1ZDY0OSAxMDA2NDQK
LS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmgKKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmgKQEAgLTQ1LDE2ICs0NSw1IEBAIHN0YXRp
YyBpbmxpbmUgdm9pZCBub3V2ZWF1X2RtZW1faW5pdChzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSkg
e30KIHN0YXRpYyBpbmxpbmUgdm9pZCBub3V2ZWF1X2RtZW1fZmluaShzdHJ1Y3Qgbm91dmVhdV9k
cm0gKmRybSkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBub3V2ZWF1X2RtZW1fc3VzcGVuZChzdHJ1
Y3Qgbm91dmVhdV9kcm0gKmRybSkge30KIHN0YXRpYyBpbmxpbmUgdm9pZCBub3V2ZWF1X2RtZW1f
cmVzdW1lKHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtKSB7fQotCi1zdGF0aWMgaW5saW5lIGludCBu
b3V2ZWF1X2RtZW1fbWlncmF0ZV92bWEoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCi0JCQkJCSAg
IHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAotCQkJCQkgICB1bnNpZ25lZCBsb25nIHN0YXJ0
LAotCQkJCQkgICB1bnNpZ25lZCBsb25nIGVuZCkKLXsKLQlyZXR1cm4gMDsKLX0KLQotc3RhdGlj
IGlubGluZSB2b2lkIG5vdXZlYXVfZG1lbV9jb252ZXJ0X3BmbihzdHJ1Y3Qgbm91dmVhdV9kcm0g
KmRybSwKLQkJCQkJICAgIHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKSB7fQogI2VuZGlmIC8qIElT
X0VOQUJMRUQoQ09ORklHX0RSTV9OT1VWRUFVX1NWTSkgKi8KICNlbmRpZgotLSAKMi4yMC4xCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
