Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2555B8CD54
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 09:59:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F6FB89A5D;
	Wed, 14 Aug 2019 07:59:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E2189A20;
 Wed, 14 Aug 2019 07:59:37 +0000 (UTC)
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxoBu-0007vG-RS; Wed, 14 Aug 2019 07:59:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 14 Aug 2019 09:59:18 +0200
Message-Id: <20190814075928.23766-1-hch@lst.de>
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
 bh=JVLupnHp/2HEL1nOJxPMzcGzWGTuwVGtB/+M404XJkE=; b=JPKkluHXANV3awUUpuvJcS5NT
 5awHaFSwZn1/i0TJJtE3fi/qxiLHwIVJg48wdR8sIbS4qLVhXATdFK9VMQs4cbxoXMHMhxIyzbTUW
 0KENQgeMZoxmA8wU4/XAyAYaABLnh5rNbE/HUxdzRZz6CSQRGkDRkDXwDWabLnEcXkLaW+l6V4Yoz
 iLKh8dBjzqUKUouq8fpd863K42hkg5zIJasXrCRyFOWrbQRYdR/zDvHLaOuRyPks+RztFhMjOfdiS
 w8QfISAZRlHzyPnXoWix4EEZp+XuxvvVxVkdvGQYuWDO3lYQqJlfIAs5ZQg2P7JkByBv8Ib0+w3Ry
 P4J23sxPA==;
Subject: [Nouveau] turn hmm migrate_vma upside down v3
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
b3BzCmNhbGxiYWNrcy4KCkRpZmZzdGF0OgoKICAgIDcgZmlsZXMgY2hhbmdlZCwgMjgyIGluc2Vy
dGlvbnMoKyksIDYxNCBkZWxldGlvbnMoLSkKCkEgZ2l0IHRyZWUgaXMgYWxzbyBhdmFpbGFibGUg
YXQ6CgogICAgZ2l0Oi8vZ2l0LmluZnJhZGVhZC5vcmcvdXNlcnMvaGNoL21pc2MuZ2l0IG1pZ3Jh
dGVfdm1hLWNsZWFudXAuMwoKR2l0d2ViOgoKICAgIGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91
c2Vycy9oY2gvbWlzYy5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9taWdyYXRlX3ZtYS1jbGVhbnVw
LjMKCgpDaGFuZ2VzIHNpbmNlIHYyOgogLSBkb24ndCB1bm1hcCBwYWdlcyB3aGVuIHJldHVybmlu
ZyAwIGZyb20gbm91dmVhdV9kbWVtX21pZ3JhdGVfdG9fcmFtCiAtIG1pbm9yIHN0eWxlIGZpeGVz
CiAtIGFkZCBhIG5ldyBwYXRjaCB0byByZW1vdmUgQ09ORklHX01JR1JBVEVfVk1BX0hFTFBFUgoK
Q2hhbmdlcyBzaW5jZSB2MToKIC0gZml4IGEgZmV3IHdoaXRlc3BhY2UgaXNzdWVzCiAtIGRyb3Ag
dGhlIHBhdGNoIHRvIHJlbW92ZSBNSUdSQVRFX1BGTl9XUklURSBmb3Igbm93CiAtIHZhcmlvdXMg
c3BlbGxpbmcgZml4ZXMKIC0gY2xlYXIgY3BhZ2VzIGFuZCBucGFnZXMgaW4gbWlncmF0ZV92bWFf
c2V0dXAKIC0gZml4IHRoZSBub3V2ZWF1X2RtZW1fZmF1bHRfY29weV9vbmUgcmV0dXJuIHZhbHVl
CiAtIG1pbm9yIGltcHJvdmVtZW50cyB0byBzb21lIG5vdXZlYXUgaW50ZXJuYWwgY2FsbGluZyBj
b252ZW50aW9ucwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
