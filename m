Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FF30865D3
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 17:33:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6DC4E6E876;
	Thu,  8 Aug 2019 15:33:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A30B6E870;
 Thu,  8 Aug 2019 15:33:55 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hvkQG-0005A3-GY; Thu, 08 Aug 2019 15:33:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu,  8 Aug 2019 18:33:37 +0300
Message-Id: <20190808153346.9061-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fPGllWDdh64nUfOs1aS3QjslyfGjQ/iJx/2zlaF/SN4=; b=QTY7+sCwU0BZU2WjQGtou3n1/
 RaWyLK5P/qG+bA80TktmQ4ddbXbYiDiqrC1m10wB4vGdGam/nfd3GWLHcEtUEQXnojGvCXInVqA8V
 ee1yHncvrQI8DqawF3fKeaPiDKYLwzb2rlkHGIWG2Xs56d6OFpVCrJmUTCDG0SVuabWVuZ5lSYg0f
 FDjUOR1WkYhep9qQgHGvKkYDcsTUS7X/VrMUXEneveGR/4KIexnaGhqwBecUTIRGg6gBkvx0TIs/F
 7njM+Q1mXMwVT7z3jzQrcMNuZ6tshLHJqB3FYBJvinsQcaKKHi+5CfzC9KOjUE4EYU1F4tceKSDHo
 wImVvIJ8g==;
Subject: [Nouveau] turn hmm migrate_vma upside down v2
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

SGkgSsOpcsO0bWUsIEJlbiBhbmQgSmFzb24sCgpiZWxvdyBpcyBhIHNlcmllcyBhZ2FpbnN0IHRo
ZSBobW0gdHJlZSB3aGljaCBzdGFydHMgcmV2YW1waW5nIHRoZQptaWdyYXRlX3ZtYSBmdW5jdGlv
bmFsaXR5LiAgVGhlIHByaW1lIGlkZWEgaXMgdG8gZXhwb3J0IHRocmVlIHNsaWdodGx5Cmxvd2Vy
IGxldmVsIGZ1bmN0aW9ucyBhbmQgdGh1cyBhdm9pZCB0aGUgbmVlZCBmb3IgbWlncmF0ZV92bWFf
b3BzCmNhbGxiYWNrcy4KCkRpZmZzdGF0OgoKICAgIDUgZmlsZXMgY2hhbmdlZCwgMjgxIGluc2Vy
dGlvbnMoKyksIDYwNyBkZWxldGlvbnMoLSkKCkEgZ2l0IHRyZWUgaXMgYWxzbyBhdmFpbGFibGUg
YXQ6CgogICAgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IG1pZ3Jh
dGVfdm1hLWNsZWFudXAuMgoKR2l0d2ViOgoKICAgIGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91
c2Vycy9oY2gvbWlzYy5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9taWdyYXRlX3ZtYS1jbGVhbnVw
LjIKCkNoYW5nZXMgc2luY2UgdjE6CiAtIGZpeCBhIGZldyB3aGl0ZXNwYWNlIGlzc3VlcwogLSBk
cm9wIHRoZSBwYXRjaCB0byByZW1vdmUgTUlHUkFURV9QRk5fV1JJVEUgZm9yIG5vdwogLSB2YXJp
b3VzIHNwZWxsaW5nIGZpeGVzCiAtIGNsZWFyIGNwYWdlcyBhbmQgbnBhZ2VzIGluIG1pZ3JhdGVf
dm1hX3NldHVwCiAtIGZpeCB0aGUgbm91dmVhdV9kbWVtX2ZhdWx0X2NvcHlfb25lIHJldHVybiB2
YWx1ZQogLSBtaW5vciBpbXByb3ZlbWVudHMgdG8gc29tZSBub3V2ZWF1IGludGVybmFsIGNhbGxp
bmcgY29udmVudGlvbnMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
