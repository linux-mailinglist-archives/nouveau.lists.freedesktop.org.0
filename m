Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 240CB568C7
	for <lists+nouveau@lfdr.de>; Wed, 26 Jun 2019 14:27:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80EDD6E3B7;
	Wed, 26 Jun 2019 12:27:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA4B6E3B7;
 Wed, 26 Jun 2019 12:27:38 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hg71L-0001Kf-Nf; Wed, 26 Jun 2019 12:27:28 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 26 Jun 2019 14:26:59 +0200
Message-Id: <20190626122724.13313-1-hch@lst.de>
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
 bh=YGx69ktqFfd50Mnd66pLKlz3uikDiZWUcfJ3jfUuvQk=; b=e05g33Wex+0CQQ9qi04aK+PPD
 72YJJQlOybfiI5HDpvAwNw3qyS9BQ2WnPDw3YMr+fSZN7R9d4Tn5T/Kg6qLvyaoDaHQZ0vlVbYbhx
 sH7r9sk7n9uAVs7ytRQPMUWtpIBu34n75RQsdX09ZN7vTlq63SjgxFL3+W2CGRZnbY4b1uq2QoXC9
 wfCap12FyOEmQpV3o8HSsJ+3sDUypgYRRenguNdBNIJhO4plDWVryg6VP0j/VmweKz3YUcCgDWjkR
 wJkxMMcljSkpHVx1W9E80XqfefYKjbk4v/9jvt3SU/bAHja9Xecuu8HugJFvBvJ02cUDAF0fQb/UW
 LymOmxY1g==;
Subject: [Nouveau] dev_pagemap related cleanups v3
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

SGkgRGFuLCBKw6lyw7RtZSBhbmQgSmFzb24sCgpiZWxvdyBpcyBhIHNlcmllcyB0aGF0IGNsZWFu
cyB1cCB0aGUgZGV2X3BhZ2VtYXAgaW50ZXJmYWNlIHNvIHRoYXQKaXQgaXMgbW9yZSBlYXNpbHkg
dXNhYmxlLCB3aGljaCByZW1vdmVzIHRoZSBuZWVkIHRvIHdyYXAgaXQgaW4gaG1tCmFuZCB0aHVz
IGFsbG93aW5nIHRvIGtpbGwgYSBsb3Qgb2YgY29kZQoKTm90ZTogdGhpcyBzZXJpZXMgaXMgb24g
dG9wIG9mIExpbnV4IDUuMi1yYzUgYW5kIGhhcyBzb21lIG1pbm9yCmNvbmZsaWN0cyB3aXRoIHRo
ZSBobW0gdHJlZSB0aGF0IGFyZSBlYXN5IHRvIHJlc29sdmUuCgpEaWZmc3RhdCBzdW1tYXJ5OgoK
IDMyIGZpbGVzIGNoYW5nZWQsIDM2MSBpbnNlcnRpb25zKCspLCAxMDEyIGRlbGV0aW9ucygtKQoK
R2l0IHRyZWU6CgogICAgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0
IGhtbS1kZXZtZW0tY2xlYW51cC4zCgpHaXR3ZWI6CgogICAgaHR0cDovL2dpdC5pbmZyYWRlYWQu
b3JnL3VzZXJzL2hjaC9taXNjLmdpdC9zaG9ydGxvZy9yZWZzL2hlYWRzL2htbS1kZXZtZW0tY2xl
YW51cC4zCgoKQ2hhbmdlcyBzaW5jZSB2MjoKIC0gZml4IG52ZGltbSBrdW5pdCBidWlsZAogLSBh
ZGQgYSBuZXcgbWVtb3J5IHR5cGUgZm9yIGRldmljZSBkYXgKIC0gZml4IGEgZmV3IGlzc3VlcyBp
biBpbnRlcm1lZGlhdGUgcGF0Y2hlcyB0aGF0IGRpZG4ndCBzaG93IHVwIGluIHRoZSBlbmQKICAg
cmVzdWx0CiAtIGluY29ycG9yYXRlIGZlZWRiYWNrIGZyb20gTWljaGFsIEhvY2tvLCBpbmNsdWRp
bmcga2lsbGluZyBvZgogICB0aGUgREVWSUNFX1BVQkxJQyBtZW1vcnkgdHlwZSBlbnRpcmVseQoK
Q2hhbmdlcyBzaW5jZSB2MToKIC0gcmViYXNlCiAtIGFsc28gc3dpdGNoIHAycGRtYSB0byB0aGUg
aW50ZXJuYWwgcmVmY291bnQKIC0gYWRkIHR5cGUgY2hlY2tpbmcgZm9yIHBnbWFwLT50eXBlCiAt
IHJlbmFtZSB0aGUgbWlncmF0ZSBtZXRob2QgdG8gbWlncmF0ZV90b19yYW0KIC0gY2xlYW51cCB0
aGUgYWx0bWFwX3ZhbGlkIGZsYWcKIC0gdmFyaW91cyB0aWRiaXRzIGZyb20gdGhlIHJldmlld3MK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
