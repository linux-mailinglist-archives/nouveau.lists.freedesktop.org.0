Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E6C74434C7
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 11:43:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68D5489831;
	Thu, 13 Jun 2019 09:43:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 588FF89831;
 Thu, 13 Jun 2019 09:43:44 +0000 (UTC)
Received: from mpp-cp1-natpool-1-198.ethz.ch ([82.130.71.198] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hbMGi-0001ki-O6; Thu, 13 Jun 2019 09:43:41 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Thu, 13 Jun 2019 11:43:07 +0200
Message-Id: <20190613094326.24093-5-hch@lst.de>
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
 bh=b0eW2dMKelYlLaleRf5bDKha7L0ij82/1V9DJV7UjR4=; b=LrHEjG0Kdxjb47axcEbnVJ75Oj
 CqNf25lmlVLOJfKQkF3m/Ep/P6iJD6MgQry617Z97k4733kia2UZW5iJya7hxNJbAcFnBT8XQs3jc
 CWcfMFVkye1tAeuYF/JO0acUBeHn7/aMj/pyCQL4Xz4x4RtvNpeoZBzNSKTz/doY+OwHfJZybszCK
 DxEJpuNXgqckVp+x3E/8EpTeHSGafD299qd+qeRl4D7XeirEUJDqvk16JkpnMnHgojP24ZnE9OVua
 8L7QeBf5I1C+3AfNY+yeF9mDvABdV472xMWynVzOzMDJZAQqG1CbAp246zQp9OX7BwYZax0tpQTMs
 15lD1mDA==;
Subject: [Nouveau] [PATCH 04/22] mm: don't clear ->mapping in hmm_devmem_free
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

LT5tYXBwaW5nIGlzbid0IGV2ZW4gdXNlZCBieSBITU0gdXNlcnMsIGFuZCB0aGUgZmllbGQgYXQg
dGhlIHNhbWUgb2Zmc2V0CmluIHRoZSB6b25lX2RldmljZSBwYXJ0IG9mIHRoZSB1bmlvbiBpcyBk
ZWNsYXJlZCBhcyBwYWQuICAoV2hpY2ggYnR3IGlzCnJhdGhlciBjb25mdXNpbmcsIGFzIERBWCB1
c2VzIC0+cGdtYXAgYW5kIC0+bWFwcGluZyBmcm9tIHR3byBkaWZmZXJlbnQKc2lkZXMgb2YgdGhl
IHVuaW9uLCBidXQgREFYIGRvZXNuJ3QgdXNlIGhtbV9kZXZtZW1fZnJlZSkuCgpTaWduZWQtb2Zm
LWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4KLS0tCiBtbS9obW0uYyB8IDIgLS0K
IDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL21tL2htbS5jIGIv
bW0vaG1tLmMKaW5kZXggMGM2MjQyNmQxMjU3Li5lMWRjOTg0MDdlN2IgMTAwNjQ0Ci0tLSBhL21t
L2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMzQ3LDggKzEzNDcsNiBAQCBzdGF0aWMgdm9pZCBo
bW1fZGV2bWVtX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCiB7CiAJc3RydWN0
IGhtbV9kZXZtZW0gKmRldm1lbSA9IGRhdGE7CiAKLQlwYWdlLT5tYXBwaW5nID0gTlVMTDsKLQog
CWRldm1lbS0+b3BzLT5mcmVlKGRldm1lbSwgcGFnZSk7CiB9CiAKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5n
IGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVz
a3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
