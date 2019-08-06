Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AEBD68362B
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B6CA06E40B;
	Tue,  6 Aug 2019 16:06:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65E176E40B;
 Tue,  6 Aug 2019 16:06:02 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yI-0000Vj-LP; Tue, 06 Aug 2019 16:05:59 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:39 +0300
Message-Id: <20190806160554.14046-2-hch@lst.de>
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
 bh=ilF0L5eSgEyyYaXFSbddhy3bpJmKXINzOGRCtzZ9aSI=; b=hikw7GF8n+d60ROTxLBfZvDIvt
 lWGBz9OAMJ4nVqhoGyF4yYzPEmJ50hwItuCKNXTUScMYDtgdD6ZtVj3qYG7++ZGVk2Q9ltV1R4RHc
 VqGAKowzDVzvNZ7dsp+tGHAjV0mYw5H5M1cyez5eq1JzrGvXUiS7lApWz9SBQ/bibG532unQjBY13
 ObQgADiTMFp8hoPx6SpBkPuWGpWTBCAbirU5kADQ6QscvnjbmbVC0GEWrdHpMovVv26BjA8cMUAt3
 tEUUxB/GXyk0FXHu5Z89DXWfkmfju4jCd9ICs/SYWALm/vkEEUwmU+M8iyftX3yZHv5hdll4Qa2Lc
 j6pVLf9Q==;
Subject: [Nouveau] [PATCH 01/15] amdgpu: remove -EAGAIN handling for
 hmm_range_fault
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

aG1tX3JhbmdlX2ZhdWx0IGNhbiBvbmx5IHJldHVybiAtRUFHQUlOIGlmIGNhbGxlZCB3aXRoIHRo
ZQpITU1fRkFVTFRfQUxMT1dfUkVUUlkgZmxhZywgd2hpY2ggYW1kZ3B1IG5ldmVyIGRvZXMuICBS
ZW1vdmUgdGhlCmhhbmRsaW5nIGZvciB0aGUgLUVBR0FJTiBjYXNlIHdpdGggaXRzIG5vbi1zdGFu
ZGFyZCBsb2NraW5nIHNjaGVtZS4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgpSZXZpZXdlZC1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29t
PgpSZXZpZXdlZC1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL2FtZC9hbWRncHUvYW1kZ3B1X3R0bS5jIHwgMjMgKysrLS0tLS0t
LS0tLS0tLS0tLS0tLS0KIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDIwIGRlbGV0
aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90
dG0uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV90dG0uYwppbmRleCAxMmE1
OWFjODNmNzIuLmYwODIxNjM4YmJjNiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL2FtZC9h
bWRncHUvYW1kZ3B1X3R0bS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdw
dV90dG0uYwpAQCAtNzc4LDcgKzc3OCw2IEBAIGludCBhbWRncHVfdHRtX3R0X2dldF91c2VyX3Bh
Z2VzKHN0cnVjdCBhbWRncHVfYm8gKmJvLCBzdHJ1Y3QgcGFnZSAqKnBhZ2VzKQogCXN0cnVjdCBo
bW1fcmFuZ2UgKnJhbmdlOwogCXVuc2lnbmVkIGxvbmcgaTsKIAl1aW50NjRfdCAqcGZuczsKLQlp
bnQgcmV0cnkgPSAwOwogCWludCByID0gMDsKIAogCWlmICghbW0pIC8qIEhhcHBlbnMgZHVyaW5n
IHByb2Nlc3Mgc2h1dGRvd24gKi8KQEAgLTgyMiw3ICs4MjEsNiBAQCBpbnQgYW1kZ3B1X3R0bV90
dF9nZXRfdXNlcl9wYWdlcyhzdHJ1Y3QgYW1kZ3B1X2JvICpibywgc3RydWN0IHBhZ2UgKipwYWdl
cykKIAlobW1fcmFuZ2VfcmVnaXN0ZXIocmFuZ2UsIG1pcnJvciwgc3RhcnQsCiAJCQkgICBzdGFy
dCArIHR0bS0+bnVtX3BhZ2VzICogUEFHRV9TSVpFLCBQQUdFX1NISUZUKTsKIAotcmV0cnk6CiAJ
LyoKIAkgKiBKdXN0IHdhaXQgZm9yIHJhbmdlIHRvIGJlIHZhbGlkLCBzYWZlIHRvIGlnbm9yZSBy
ZXR1cm4gdmFsdWUgYXMgd2UKIAkgKiB3aWxsIHVzZSB0aGUgcmV0dXJuIHZhbHVlIG9mIGhtbV9y
YW5nZV9mYXVsdCgpIGJlbG93IHVuZGVyIHRoZQpAQCAtODMxLDI0ICs4MjksMTIgQEAgaW50IGFt
ZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAqYm8sIHN0cnVjdCBw
YWdlICoqcGFnZXMpCiAJaG1tX3JhbmdlX3dhaXRfdW50aWxfdmFsaWQocmFuZ2UsIEhNTV9SQU5H
RV9ERUZBVUxUX1RJTUVPVVQpOwogCiAJZG93bl9yZWFkKCZtbS0+bW1hcF9zZW0pOwotCiAJciA9
IGhtbV9yYW5nZV9mYXVsdChyYW5nZSwgMCk7Ci0JaWYgKHVubGlrZWx5KHIgPCAwKSkgewotCQlp
ZiAobGlrZWx5KHIgPT0gLUVBR0FJTikpIHsKLQkJCS8qCi0JCQkgKiByZXR1cm4gLUVBR0FJTiwg
bW1hcF9zZW0gaXMgZHJvcHBlZAotCQkJICovCi0JCQlpZiAocmV0cnkrKyA8IE1BWF9SRVRSWV9I
TU1fUkFOR0VfRkFVTFQpCi0JCQkJZ290byByZXRyeTsKLQkJCWVsc2UKLQkJCQlwcl9lcnIoIlJl
dHJ5IGhtbSBmYXVsdCB0b28gbWFueSB0aW1lc1xuIik7Ci0JCX0KLQotCQlnb3RvIG91dF91cF9y
ZWFkOwotCX0KLQogCXVwX3JlYWQoJm1tLT5tbWFwX3NlbSk7CiAKKwlpZiAodW5saWtlbHkociA8
IDApKQorCQlnb3RvIG91dF9mcmVlX3BmbnM7CisKIAlmb3IgKGkgPSAwOyBpIDwgdHRtLT5udW1f
cGFnZXM7IGkrKykgewogCQlwYWdlc1tpXSA9IGhtbV9kZXZpY2VfZW50cnlfdG9fcGFnZShyYW5n
ZSwgcGZuc1tpXSk7CiAJCWlmICh1bmxpa2VseSghcGFnZXNbaV0pKSB7CkBAIC04NjQsOSArODUw
LDYgQEAgaW50IGFtZGdwdV90dG1fdHRfZ2V0X3VzZXJfcGFnZXMoc3RydWN0IGFtZGdwdV9ibyAq
Ym8sIHN0cnVjdCBwYWdlICoqcGFnZXMpCiAKIAlyZXR1cm4gMDsKIAotb3V0X3VwX3JlYWQ6Ci0J
aWYgKGxpa2VseShyICE9IC1FQUdBSU4pKQotCQl1cF9yZWFkKCZtbS0+bW1hcF9zZW0pOwogb3V0
X2ZyZWVfcGZuczoKIAlobW1fcmFuZ2VfdW5yZWdpc3RlcihyYW5nZSk7CiAJa3ZmcmVlKHBmbnMp
OwotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
