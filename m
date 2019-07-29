Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 06A1F78DEC
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8030E89C56;
	Mon, 29 Jul 2019 14:29:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 43E7489C60;
 Mon, 29 Jul 2019 14:29:09 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6e9-0006K6-NS; Mon, 29 Jul 2019 14:29:06 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:38 +0300
Message-Id: <20190729142843.22320-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190729142843.22320-1-hch@lst.de>
References: <20190729142843.22320-1-hch@lst.de>
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
 bh=KRhSWVqqlsL4sNnqiKki+hdwEXJ8VTEYKaUDLbMamPM=; b=UOK0LNoApFOGwvTn+Y/XD3jBnG
 TRfhIqboSv8iqXv6omeWkilEGsmxKwQhoeVgR9UwVkpnbiS/E1ecOTCAqXTao8qWeYkvykFlXFDK/
 Ye5pIUMH+Ium1hxsiHtJ8/DyYvvHVnb673b0Q1ak9Biu2jXuy2gNUEP+jaVRTxUqOUnvjDE6IuKbu
 iEbtj/LsXhOByx+dgF6Sv3TpkO9E88HNVVuMBM12gNDgGZtDbAE9gUqgPsBxGBPNiA/8fP7mpHFRn
 qcYcymO5NouySz7CZywQqyMe/t/hyPLhwBjO/65i84oIlD1Z/999t1DYXQH9Z9WD65qRbBOoShss/
 8doBh/yw==;
Subject: [Nouveau] [PATCH 4/9] nouveau: factor out dmem fence completion
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

RmFjdG9yIG91dCB0aGUgZW5kIG9mIGZlbmNpbmcgbG9naWMgZnJvbSB0aGUgdHdvIG1pZ3JhdGlv
biByb3V0aW5lcy4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxoY2hAbHN0LmRl
PgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgMzMgKysrKysr
KysrKysrLS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAx
OCBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RtZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCmluZGV4
IGQ0NjliYzMzNDQzOC4uMjEwNTJhNGFhZjY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2RtZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2RtZW0uYwpAQCAtMTMzLDYgKzEzMywxOSBAQCBzdGF0aWMgdm9pZCBub3V2ZWF1X2RtZW1f
cGFnZV9mcmVlKHN0cnVjdCBwYWdlICpwYWdlKQogCXNwaW5fdW5sb2NrKCZjaHVuay0+bG9jayk7
CiB9CiAKK3N0YXRpYyB2b2lkIG5vdXZlYXVfZG1lbV9mZW5jZV9kb25lKHN0cnVjdCBub3V2ZWF1
X2ZlbmNlICoqZmVuY2UpCit7CisJaWYgKGZlbmNlKSB7CisJCW5vdXZlYXVfZmVuY2Vfd2FpdCgq
ZmVuY2UsIHRydWUsIGZhbHNlKTsKKwkJbm91dmVhdV9mZW5jZV91bnJlZihmZW5jZSk7CisJfSBl
bHNlIHsKKwkJLyoKKwkJICogRklYTUUgd2FpdCBmb3IgY2hhbm5lbCB0byBiZSBJRExFIGJlZm9y
ZSBjYWxsaW5nIGZpbmFsaXppbmcKKwkJICogdGhlIGhtZW0gb2JqZWN0LgorCQkgKi8KKwl9Cit9
CisKIHN0YXRpYyB2b2lkCiBub3V2ZWF1X2RtZW1fZmF1bHRfYWxsb2NfYW5kX2NvcHkoc3RydWN0
IHZtX2FyZWFfc3RydWN0ICp2bWEsCiAJCQkJICBjb25zdCB1bnNpZ25lZCBsb25nICpzcmNfcGZu
cywKQEAgLTIzNiwxNSArMjQ5LDcgQEAgbm91dmVhdV9kbWVtX2ZhdWx0X2ZpbmFsaXplX2FuZF9t
YXAoc3RydWN0IG5vdXZlYXVfZG1lbV9mYXVsdCAqZmF1bHQpCiB7CiAJc3RydWN0IG5vdXZlYXVf
ZHJtICpkcm0gPSBmYXVsdC0+ZHJtOwogCi0JaWYgKGZhdWx0LT5mZW5jZSkgewotCQlub3V2ZWF1
X2ZlbmNlX3dhaXQoZmF1bHQtPmZlbmNlLCB0cnVlLCBmYWxzZSk7Ci0JCW5vdXZlYXVfZmVuY2Vf
dW5yZWYoJmZhdWx0LT5mZW5jZSk7Ci0JfSBlbHNlIHsKLQkJLyoKLQkJICogRklYTUUgd2FpdCBm
b3IgY2hhbm5lbCB0byBiZSBJRExFIGJlZm9yZSBjYWxsaW5nIGZpbmFsaXppbmcKLQkJICogdGhl
IGhtZW0gb2JqZWN0IGJlbG93IChub3V2ZWF1X21pZ3JhdGVfaG1lbV9maW5pKCkpLgotCQkgKi8K
LQl9CisJbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoJmZhdWx0LT5mZW5jZSk7CiAKIAl3aGlsZSAo
ZmF1bHQtPm5wYWdlcy0tKSB7CiAJCWRtYV91bm1hcF9wYWdlKGRybS0+ZGV2LT5kZXYsIGZhdWx0
LT5kbWFbZmF1bHQtPm5wYWdlc10sCkBAIC03NDgsMTUgKzc1Myw3IEBAIG5vdXZlYXVfZG1lbV9t
aWdyYXRlX2ZpbmFsaXplX2FuZF9tYXAoc3RydWN0IG5vdXZlYXVfbWlncmF0ZSAqbWlncmF0ZSkK
IHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG1pZ3JhdGUtPmRybTsKIAotCWlmIChtaWdy
YXRlLT5mZW5jZSkgewotCQlub3V2ZWF1X2ZlbmNlX3dhaXQobWlncmF0ZS0+ZmVuY2UsIHRydWUs
IGZhbHNlKTsKLQkJbm91dmVhdV9mZW5jZV91bnJlZigmbWlncmF0ZS0+ZmVuY2UpOwotCX0gZWxz
ZSB7Ci0JCS8qCi0JCSAqIEZJWE1FIHdhaXQgZm9yIGNoYW5uZWwgdG8gYmUgSURMRSBiZWZvcmUg
ZmluYWxpemluZwotCQkgKiB0aGUgaG1lbSBvYmplY3QgYmVsb3cgKG5vdXZlYXVfbWlncmF0ZV9o
bWVtX2ZpbmkoKSkgPwotCQkgKi8KLQl9CisJbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoJm1pZ3Jh
dGUtPmZlbmNlKTsKIAogCXdoaWxlIChtaWdyYXRlLT5kbWFfbnItLSkgewogCQlkbWFfdW5tYXBf
cGFnZShkcm0tPmRldi0+ZGV2LCBtaWdyYXRlLT5kbWFbbWlncmF0ZS0+ZG1hX25yXSwKLS0gCjIu
MjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91
dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9s
aXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
