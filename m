Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FA668CD5D
	for <lists+nouveau@lfdr.de>; Wed, 14 Aug 2019 09:59:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FDA289A75;
	Wed, 14 Aug 2019 07:59:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0765D89A75;
 Wed, 14 Aug 2019 07:59:49 +0000 (UTC)
Received: from [2001:4bb8:180:1ec3:c70:4a89:bc61:2] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hxoC8-00080x-Et; Wed, 14 Aug 2019 07:59:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Wed, 14 Aug 2019 09:59:22 +0200
Message-Id: <20190814075928.23766-5-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190814075928.23766-1-hch@lst.de>
References: <20190814075928.23766-1-hch@lst.de>
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
 bh=13C43s4pw+qYxbSiHBqNJBxy3y8L+AabNOPsvifMBs4=; b=ij9LwdqHGLo4wrAxd8rG6Kb6yC
 fER/ySeZKiiT3l5Qqoxhu5pFNrhI1H/Txm7yGmYQe1PONZmTZgaNvzpVzv3eT1Qo94j2ISZL46tzZ
 +0Tr31Az6V5GVb5f5sO12tVJiYRYd7TYYW789M1i9bCww8eGuVQ6nlYYaNr/6LQIZxnSrAHY52dXp
 GqKtRq/VM09VRrnKsx8Ff6KFihMdQd+6wwRu4wfVdD/EgL++Myvvf6mVeE7fzE1yfIHtRBPpCbL5S
 nIGPkY4wGoR5fbhlKn3C6KcJTgQrniIWJ4gqUDyVLx05oULJ5uD85VZ3wf/zBY0IVv2d9pTqVTog5
 MOXeCnmA==;
Subject: [Nouveau] [PATCH 04/10] nouveau: factor out dmem fence completion
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
PgpSZXZpZXdlZC1ieTogUmFscGggQ2FtcGJlbGwgPHJjYW1wYmVsbEBudmlkaWEuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jIHwgMzMgKysrKysrKysrKysr
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAxNSBpbnNlcnRpb25zKCspLCAxOCBkZWxl
dGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rt
ZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCmluZGV4IGQ0Njli
YzMzNDQzOC4uMjEwNTJhNGFhZjY5IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9ub3V2ZWF1X2RtZW0uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rt
ZW0uYwpAQCAtMTMzLDYgKzEzMywxOSBAQCBzdGF0aWMgdm9pZCBub3V2ZWF1X2RtZW1fcGFnZV9m
cmVlKHN0cnVjdCBwYWdlICpwYWdlKQogCXNwaW5fdW5sb2NrKCZjaHVuay0+bG9jayk7CiB9CiAK
K3N0YXRpYyB2b2lkIG5vdXZlYXVfZG1lbV9mZW5jZV9kb25lKHN0cnVjdCBub3V2ZWF1X2ZlbmNl
ICoqZmVuY2UpCit7CisJaWYgKGZlbmNlKSB7CisJCW5vdXZlYXVfZmVuY2Vfd2FpdCgqZmVuY2Us
IHRydWUsIGZhbHNlKTsKKwkJbm91dmVhdV9mZW5jZV91bnJlZihmZW5jZSk7CisJfSBlbHNlIHsK
KwkJLyoKKwkJICogRklYTUUgd2FpdCBmb3IgY2hhbm5lbCB0byBiZSBJRExFIGJlZm9yZSBjYWxs
aW5nIGZpbmFsaXppbmcKKwkJICogdGhlIGhtZW0gb2JqZWN0LgorCQkgKi8KKwl9Cit9CisKIHN0
YXRpYyB2b2lkCiBub3V2ZWF1X2RtZW1fZmF1bHRfYWxsb2NfYW5kX2NvcHkoc3RydWN0IHZtX2Fy
ZWFfc3RydWN0ICp2bWEsCiAJCQkJICBjb25zdCB1bnNpZ25lZCBsb25nICpzcmNfcGZucywKQEAg
LTIzNiwxNSArMjQ5LDcgQEAgbm91dmVhdV9kbWVtX2ZhdWx0X2ZpbmFsaXplX2FuZF9tYXAoc3Ry
dWN0IG5vdXZlYXVfZG1lbV9mYXVsdCAqZmF1bHQpCiB7CiAJc3RydWN0IG5vdXZlYXVfZHJtICpk
cm0gPSBmYXVsdC0+ZHJtOwogCi0JaWYgKGZhdWx0LT5mZW5jZSkgewotCQlub3V2ZWF1X2ZlbmNl
X3dhaXQoZmF1bHQtPmZlbmNlLCB0cnVlLCBmYWxzZSk7Ci0JCW5vdXZlYXVfZmVuY2VfdW5yZWYo
JmZhdWx0LT5mZW5jZSk7Ci0JfSBlbHNlIHsKLQkJLyoKLQkJICogRklYTUUgd2FpdCBmb3IgY2hh
bm5lbCB0byBiZSBJRExFIGJlZm9yZSBjYWxsaW5nIGZpbmFsaXppbmcKLQkJICogdGhlIGhtZW0g
b2JqZWN0IGJlbG93IChub3V2ZWF1X21pZ3JhdGVfaG1lbV9maW5pKCkpLgotCQkgKi8KLQl9CisJ
bm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoJmZhdWx0LT5mZW5jZSk7CiAKIAl3aGlsZSAoZmF1bHQt
Pm5wYWdlcy0tKSB7CiAJCWRtYV91bm1hcF9wYWdlKGRybS0+ZGV2LT5kZXYsIGZhdWx0LT5kbWFb
ZmF1bHQtPm5wYWdlc10sCkBAIC03NDgsMTUgKzc1Myw3IEBAIG5vdXZlYXVfZG1lbV9taWdyYXRl
X2ZpbmFsaXplX2FuZF9tYXAoc3RydWN0IG5vdXZlYXVfbWlncmF0ZSAqbWlncmF0ZSkKIHsKIAlz
dHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG1pZ3JhdGUtPmRybTsKIAotCWlmIChtaWdyYXRlLT5m
ZW5jZSkgewotCQlub3V2ZWF1X2ZlbmNlX3dhaXQobWlncmF0ZS0+ZmVuY2UsIHRydWUsIGZhbHNl
KTsKLQkJbm91dmVhdV9mZW5jZV91bnJlZigmbWlncmF0ZS0+ZmVuY2UpOwotCX0gZWxzZSB7Ci0J
CS8qCi0JCSAqIEZJWE1FIHdhaXQgZm9yIGNoYW5uZWwgdG8gYmUgSURMRSBiZWZvcmUgZmluYWxp
emluZwotCQkgKiB0aGUgaG1lbSBvYmplY3QgYmVsb3cgKG5vdXZlYXVfbWlncmF0ZV9obWVtX2Zp
bmkoKSkgPwotCQkgKi8KLQl9CisJbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoJm1pZ3JhdGUtPmZl
bmNlKTsKIAogCXdoaWxlIChtaWdyYXRlLT5kbWFfbnItLSkgewogCQlkbWFfdW5tYXBfcGFnZShk
cm0tPmRldi0+ZGV2LCBtaWdyYXRlLT5kbWFbbWlncmF0ZS0+ZG1hX25yXSwKLS0gCjIuMjAuMQoK
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBt
YWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5m
cmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
