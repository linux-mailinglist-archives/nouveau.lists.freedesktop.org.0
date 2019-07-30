Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5080A7A0A4
	for <lists+nouveau@lfdr.de>; Tue, 30 Jul 2019 07:52:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CAD356E3EF;
	Tue, 30 Jul 2019 05:52:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13ECA6E3EC;
 Tue, 30 Jul 2019 05:52:33 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hsL3l-0001D4-C6; Tue, 30 Jul 2019 05:52:29 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue, 30 Jul 2019 08:51:55 +0300
Message-Id: <20190730055203.28467-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190730055203.28467-1-hch@lst.de>
References: <20190730055203.28467-1-hch@lst.de>
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
 bh=eS5S4KohR3irhWgtUfLvLexYfgHi/N0ae1QbGrg+MN8=; b=nv/Uk3iAICQEpzysmQOiV3ryQv
 Gat/o6BVc3xRRsdrPwHSTMM2PMHHx6bU9QSukJm2PAurh78FQ6xcvWGwTwVe/vCRF8XF1u9iIfpFg
 3J91GH7pyOv19vBJ2W847BvEtuCSYnPFVfS6gjHMgFai+iGhE5jKeaX7ZjA2gHRqthFtkAG2vCK0m
 CmT9xHVXxhVaJu95LQDIP1xwx4JE6wMjVjSt4XgFBd1vs92KnozwLz39ze5LkRqyV0DWWRbdvUfKt
 37xLUeobKeP/aKEoCv2ZbxpUJT8lqkPzdAow/RTLlaRdVTvcnqTOqUpRZMSLcOSGa7xHRlobRix/L
 VaoUlOfQ==;
Subject: [Nouveau] [PATCH 05/13] mm: remove the unused vma argument to
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

U2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Ci0tLQogaW5jbHVk
ZS9saW51eC9obW0uaCB8IDEgLQogbW0vaG1tLmMgICAgICAgICAgICB8IDIgLS0KIDIgZmlsZXMg
Y2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9pbmNsdWRlL2xpbnV4L2htbS5o
IGIvaW5jbHVkZS9saW51eC9obW0uaAppbmRleCA4MjI2NTExOGQ5NGEuLjU5YmUwYWEyNDc2ZCAx
MDA2NDQKLS0tIGEvaW5jbHVkZS9saW51eC9obW0uaAorKysgYi9pbmNsdWRlL2xpbnV4L2htbS5o
CkBAIC00MjIsNyArNDIyLDYgQEAgbG9uZyBobW1fcmFuZ2VfZG1hX21hcChzdHJ1Y3QgaG1tX3Jh
bmdlICpyYW5nZSwKIAkJICAgICAgIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJICAgICAgIHVuc2ln
bmVkIGludCBmbGFncyk7CiBsb25nIGhtbV9yYW5nZV9kbWFfdW5tYXAoc3RydWN0IGhtbV9yYW5n
ZSAqcmFuZ2UsCi0JCQkgc3RydWN0IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQkgc3RydWN0IGRl
dmljZSAqZGV2aWNlLAogCQkJIGRtYV9hZGRyX3QgKmRhZGRycywKIAkJCSBib29sIGRpcnR5KTsK
ZGlmZiAtLWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggZDY2ZmEyOWI0MmUwLi4zYTM4
NTI2NjA3NTcgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC0xMTIxLDcg
KzExMjEsNiBAQCBFWFBPUlRfU1lNQk9MKGhtbV9yYW5nZV9kbWFfbWFwKTsKIC8qKgogICogaG1t
X3JhbmdlX2RtYV91bm1hcCgpIC0gdW5tYXAgcmFuZ2Ugb2YgdGhhdCB3YXMgbWFwIHdpdGggaG1t
X3JhbmdlX2RtYV9tYXAoKQogICogQHJhbmdlOiByYW5nZSBiZWluZyB1bm1hcHBlZAotICogQHZt
YTogdGhlIHZtYSBhZ2FpbnN0IHdoaWNoIHRoZSByYW5nZSAob3B0aW9uYWwpCiAgKiBAZGV2aWNl
OiBkZXZpY2UgYWdhaW5zdCB3aGljaCBkbWEgbWFwIHdhcyBkb25lCiAgKiBAZGFkZHJzOiBkbWEg
YWRkcmVzcyBvZiBtYXBwZWQgcGFnZXMKICAqIEBkaXJ0eTogZGlydHkgcGFnZSBpZiBpdCBoYWQg
dGhlIHdyaXRlIGZsYWcgc2V0CkBAIC0xMTMzLDcgKzExMzIsNiBAQCBFWFBPUlRfU1lNQk9MKGht
bV9yYW5nZV9kbWFfbWFwKTsKICAqIGNvbmN1cnJlbnQgbW11IG5vdGlmaWVyIG9yIHN5bmNfY3B1
X2RldmljZV9wYWdldGFibGVzKCkgdG8gbWFrZSBwcm9ncmVzcy4KICAqLwogbG9uZyBobW1fcmFu
Z2VfZG1hX3VubWFwKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlLAotCQkJIHN0cnVjdCB2bV9hcmVh
X3N0cnVjdCAqdm1hLAogCQkJIHN0cnVjdCBkZXZpY2UgKmRldmljZSwKIAkJCSBkbWFfYWRkcl90
ICpkYWRkcnMsCiAJCQkgYm9vbCBkaXJ0eSkKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1
