Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EECCD83630
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 869856E417;
	Tue,  6 Aug 2019 16:06:13 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01F8A6E417;
 Tue,  6 Aug 2019 16:06:12 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yT-0000Xl-31; Tue, 06 Aug 2019 16:06:09 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:43 +0300
Message-Id: <20190806160554.14046-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190806160554.14046-1-hch@lst.de>
References: <20190806160554.14046-1-hch@lst.de>
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
 bh=HrWzyj8Xwb8+ibZdNfy7jRFBuLt7LJC7W3wGhE3v6+k=; b=tn2lwfTfokh2Oc5zgMto3Ypnv3
 6iPGcbfNQjgmkUu5mqIUEy9RxUmoQoXg0P7FxJsxuV2BqHEUOHG1ZqrGSY77Pd6zjtOG6Kfvy56LL
 m3DeHaj1r7hN8MK2Z91bk1YSOGvBk4kWiIC+TWAZpScFP1nDvvHRZt0EY0fVphGycnOn6kL6BeVrB
 1ZEVzB+PTNmO7XUSZqoPkpb0bHShNHZF8PKoFc0MtKMY3kUn01xaKVO1LGg6/Iiv1krfGhdfpgyoI
 fiwRrtGmUw7YQTJ+jHCBUcPckkdw/G7pPSJPaJuqBBDwA0N34uvyfuMud/oaFaEHpUJsbW+AcXaEM
 neN8+r1A==;
Subject: [Nouveau] [PATCH 05/15] mm: remove the unused vma argument to
 hmm_range_dma_unmap
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
 linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-mm@kvack.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+ClJldmlld2VkLWJ5
OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQogaW5jbHVkZS9saW51eC9o
bW0uaCB8IDEgLQogbW0vaG1tLmMgICAgICAgICAgICB8IDIgLS0KIDIgZmlsZXMgY2hhbmdlZCwg
MyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5oIGIvaW5jbHVk
ZS9saW51eC9obW0uaAppbmRleCA4MjI2NTExOGQ5NGEuLjU5YmUwYWEyNDc2ZCAxMDA2NDQKLS0t
IGEvaW5jbHVkZS9saW51eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5oCkBAIC00MjIs
NyArNDIyLDYgQEAgbG9uZyBobW1fcmFuZ2VfZG1hX21hcChzdHJ1Y3QgaG1tX3JhbmdlICpyYW5n
ZSwKIAkJICAgICAgIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJICAgICAgIHVuc2lnbmVkIGludCBm
bGFncyk7CiBsb25nIGhtbV9yYW5nZV9kbWFfdW5tYXAoc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2Us
Ci0JCQkgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQkgc3RydWN0IGRldmljZSAqZGV2
aWNlLAogCQkJIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJCSBib29sIGRpcnR5KTsKZGlmZiAtLWdp
dCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggZDY2ZmEyOWI0MmUwLi4zYTM4NTI2NjA3NTcg
MTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMTIxLDcgKzExMjEsNiBA
QCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9kbWFfbWFwKTsKIC8qKgogICogaG1tX3JhbmdlX2Rt
YV91bm1hcCgpIC0gdW5tYXAgcmFuZ2Ugb2YgdGhhdCB3YXMgbWFwIHdpdGggaG1tX3JhbmdlX2Rt
YV9tYXAoKQogICogQHJhbmdlOiByYW5nZSBiZWluZyB1bm1hcHBlZAotICogQHZtYTogdGhlIHZt
YSBhZ2FpbnN0IHdoaWNoIHRoZSByYW5nZSAob3B0aW9uYWwpCiAgKiBAZGV2aWNlOiBkZXZpY2Ug
YWdhaW5zdCB3aGljaCBkbWEgbWFwIHdhcyBkb25lCiAgKiBAZGFkZHJzOiBkbWEgYWRkcmVzcyBv
ZiBtYXBwZWQgcGFnZXMKICAqIEBkaXJ0eTogZGlydHkgcGFnZSBpZiBpdCBoYWQgdGhlIHdyaXRl
IGZsYWcgc2V0CkBAIC0xMTMzLDcgKzExMzIsNiBAQCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9k
bWFfbWFwKTsKICAqIGNvbmN1cnJlbnQgbW11IG5vdGlmaWVyIG9yIHN5bmNfY3B1X2RldmljZV9w
YWdldGFibGVzKCkgdG8gbWFrZSBwcm9ncmVzcy4KICAqLwogbG9uZyBobW1fcmFuZ2VfZG1hX3Vu
bWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAotCQkJIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAogCQkJIHN0cnVjdCBkZXZpY2UgKmRldmljZSwKIAkJCSBkbWFfYWRkcl90ICpkYWRkcnMs
CiAJCQkgYm9vbCBkaXJ0eSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
