Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBC054820B
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:27:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 196CF891D4;
	Mon, 17 Jun 2019 12:27:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9B6891CA;
 Mon, 17 Jun 2019 12:27:46 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqjf-0008Kt-OO; Mon, 17 Jun 2019 12:27:44 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:11 +0200
Message-Id: <20190617122733.22432-4-hch@lst.de>
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
 bh=7iZXhGqknpU44tD1MPjuSqDckdpKS/nLGoa4L7/1O94=; b=FbRn9tnxZ5wWW5q5U1pZRBVxXs
 CxGwGMXKAq/9Ihv+awdUqjfKfebfLDdbVNObc0HyuE8WXKatstvj5dw/HK/igbfwoSFPnkwWo7ebj
 rUGor0jqTaP/NW3YZeZfVSnvBwAlo3Lo8EiyGtMu2ND6pJBqRtA/O5D4bGF6fo8S0K5psWYBY5XxU
 2c+lcusAC9Bxse0Kr01AZ9/JkVgMHxvoDiwKVC1jNIBFfo+VKR+KrNeDEBaA0xzhkfYUvWAgWPrWC
 Lfcmv9DujdDUWC5tNLBcO6Ok6TTvo8HvDhBnnc9rcvR5/dgumLg41lBugJqDsgZ6cxqqK5EVO2485
 CgZI5zyQ==;
Subject: [Nouveau] [PATCH 03/25] mm: remove hmm_devmem_add_resource
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

VGhpcyBmdW5jdGlvbiBoYXMgbmV2ZXIgYmVlbiB1c2VkIHNpbmNlIGl0IHdhcyBmaXJzdCBhZGRl
ZCB0byB0aGUga2VybmVsCm1vcmUgdGhhbiBhIHllYXIgYW5kIGEgaGFsZiBhZ28sIGFuZCBpZiB3
ZSBldmVyIGdyb3cgYSBjb25zdW1lciBvZiB0aGUKTUVNT1JZX0RFVklDRV9QVUJMSUMgaW5mcmFz
dHJ1Y3R1cmUgaXQgY2FuIGVhc2lseSB1c2UgZGV2bV9tZW1yZW1hcF9wYWdlcwpkaXJlY3RseS4K
ClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRlPgpSZXZpZXdlZC1i
eTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTogSm9obiBI
dWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgotLS0KIGluY2x1ZGUvbGludXgvaG1tLmggfCAg
MyAtLS0KIG1tL2htbS5jICAgICAgICAgICAgfCA1MCAtLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tLS0tLS0tLS0tLS0KIDIgZmlsZXMgY2hhbmdlZCwgNTMgZGVsZXRpb25zKC0pCgpk
aWZmIC0tZ2l0IGEvaW5jbHVkZS9saW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5k
ZXggYzkyZjM1M2Q3MDFhLi4zMWUxYzUzNDczMzEgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgv
aG1tLmgKKysrIGIvaW5jbHVkZS9saW51eC9obW0uaApAQCAtNzI0LDkgKzcyNCw2IEBAIHN0cnVj
dCBobW1fZGV2bWVtIHsKIHN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2FkZChjb25zdCBz
dHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKIAkJCQkgIHN0cnVjdCBkZXZpY2UgKmRldmljZSwK
IAkJCQkgIHVuc2lnbmVkIGxvbmcgc2l6ZSk7Ci1zdHJ1Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1l
bV9hZGRfcmVzb3VyY2UoY29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3BzICpvcHMsCi0JCQkJCSAg
IHN0cnVjdCBkZXZpY2UgKmRldmljZSwKLQkJCQkJICAgc3RydWN0IHJlc291cmNlICpyZXMpOwog
CiAvKgogICogaG1tX2Rldm1lbV9wYWdlX3NldF9kcnZkYXRhIC0gc2V0IHBlci1wYWdlIGRyaXZl
ciBkYXRhIGZpZWxkCmRpZmYgLS1naXQgYS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IGYzMzUw
ZmM1NjdhYi4uZGMyNTFjNTE4MDNhIDEwMDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0u
YwpAQCAtMTQ3NSw1NCArMTQ3NSw0IEBAIHN0cnVjdCBobW1fZGV2bWVtICpobW1fZGV2bWVtX2Fk
ZChjb25zdCBzdHJ1Y3QgaG1tX2Rldm1lbV9vcHMgKm9wcywKIAlyZXR1cm4gZGV2bWVtOwogfQog
RVhQT1JUX1NZTUJPTF9HUEwoaG1tX2Rldm1lbV9hZGQpOwotCi1zdHJ1Y3QgaG1tX2Rldm1lbSAq
aG1tX2Rldm1lbV9hZGRfcmVzb3VyY2UoY29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3BzICpvcHMs
Ci0JCQkJCSAgIHN0cnVjdCBkZXZpY2UgKmRldmljZSwKLQkJCQkJICAgc3RydWN0IHJlc291cmNl
ICpyZXMpCi17Ci0Jc3RydWN0IGhtbV9kZXZtZW0gKmRldm1lbTsKLQl2b2lkICpyZXN1bHQ7Ci0J
aW50IHJldDsKLQotCWlmIChyZXMtPmRlc2MgIT0gSU9SRVNfREVTQ19ERVZJQ0VfUFVCTElDX01F
TU9SWSkKLQkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7Ci0KLQlkZXZfcGFnZW1hcF9nZXRfb3Bz
KCk7Ci0KLQlkZXZtZW0gPSBkZXZtX2t6YWxsb2MoZGV2aWNlLCBzaXplb2YoKmRldm1lbSksIEdG
UF9LRVJORUwpOwotCWlmICghZGV2bWVtKQotCQlyZXR1cm4gRVJSX1BUUigtRU5PTUVNKTsKLQot
CWluaXRfY29tcGxldGlvbigmZGV2bWVtLT5jb21wbGV0aW9uKTsKLQlkZXZtZW0tPnBmbl9maXJz
dCA9IC0xVUw7Ci0JZGV2bWVtLT5wZm5fbGFzdCA9IC0xVUw7Ci0JZGV2bWVtLT5yZXNvdXJjZSA9
IHJlczsKLQlkZXZtZW0tPmRldmljZSA9IGRldmljZTsKLQlkZXZtZW0tPm9wcyA9IG9wczsKLQot
CXJldCA9IHBlcmNwdV9yZWZfaW5pdCgmZGV2bWVtLT5yZWYsICZobW1fZGV2bWVtX3JlZl9yZWxl
YXNlLAotCQkJICAgICAgMCwgR0ZQX0tFUk5FTCk7Ci0JaWYgKHJldCkKLQkJcmV0dXJuIEVSUl9Q
VFIocmV0KTsKLQotCWRldm1lbS0+cGZuX2ZpcnN0ID0gZGV2bWVtLT5yZXNvdXJjZS0+c3RhcnQg
Pj4gUEFHRV9TSElGVDsKLQlkZXZtZW0tPnBmbl9sYXN0ID0gZGV2bWVtLT5wZm5fZmlyc3QgKwot
CQkJICAgKHJlc291cmNlX3NpemUoZGV2bWVtLT5yZXNvdXJjZSkgPj4gUEFHRV9TSElGVCk7Ci0J
ZGV2bWVtLT5wYWdlX2ZhdWx0ID0gaG1tX2Rldm1lbV9mYXVsdDsKLQotCWRldm1lbS0+cGFnZW1h
cC50eXBlID0gTUVNT1JZX0RFVklDRV9QVUJMSUM7Ci0JZGV2bWVtLT5wYWdlbWFwLnJlcyA9ICpk
ZXZtZW0tPnJlc291cmNlOwotCWRldm1lbS0+cGFnZW1hcC5wYWdlX2ZyZWUgPSBobW1fZGV2bWVt
X2ZyZWU7Ci0JZGV2bWVtLT5wYWdlbWFwLmFsdG1hcF92YWxpZCA9IGZhbHNlOwotCWRldm1lbS0+
cGFnZW1hcC5yZWYgPSAmZGV2bWVtLT5yZWY7Ci0JZGV2bWVtLT5wYWdlbWFwLmRhdGEgPSBkZXZt
ZW07Ci0JZGV2bWVtLT5wYWdlbWFwLmtpbGwgPSBobW1fZGV2bWVtX3JlZl9raWxsOwotCWRldm1l
bS0+cGFnZW1hcC5jbGVhbnVwID0gaG1tX2Rldm1lbV9yZWZfZXhpdDsKLQotCXJlc3VsdCA9IGRl
dm1fbWVtcmVtYXBfcGFnZXMoZGV2bWVtLT5kZXZpY2UsICZkZXZtZW0tPnBhZ2VtYXApOwotCWlm
IChJU19FUlIocmVzdWx0KSkKLQkJcmV0dXJuIHJlc3VsdDsKLQlyZXR1cm4gZGV2bWVtOwotfQot
RVhQT1JUX1NZTUJPTF9HUEwoaG1tX2Rldm1lbV9hZGRfcmVzb3VyY2UpOwogI2VuZGlmIC8qIENP
TkZJR19ERVZJQ0VfUFJJVkFURSB8fCBDT05GSUdfREVWSUNFX1BVQkxJQyAqLwotLSAKMi4yMC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1
IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
