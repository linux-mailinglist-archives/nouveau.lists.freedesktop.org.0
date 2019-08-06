Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BFD98362D
	for <lists+nouveau@lfdr.de>; Tue,  6 Aug 2019 18:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8321D6E3FC;
	Tue,  6 Aug 2019 16:06:07 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 85DA46E3FC;
 Tue,  6 Aug 2019 16:06:06 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hv1yL-0000WO-Aq; Tue, 06 Aug 2019 16:06:01 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>,
 Felix Kuehling <Felix.Kuehling@amd.com>
Date: Tue,  6 Aug 2019 19:05:40 +0300
Message-Id: <20190806160554.14046-3-hch@lst.de>
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
 bh=ufYdFo+9XJwMOX62CI8v2zFvEvykN+4LFgKRtsn/jXw=; b=q54LJoAxOoyTjGRyl8D80iZGMb
 lYxNuteSkjzIL5LB2TYkC0TXo+C0bsRy0oaVuqo9j0MlqChurC+FdW3n95QWIEUWw/aLfcWCP06yu
 YXY4J7ATQpT5OS8URVwWNOdqkWOYwNLcl0Hw3gLuN6FJ0B2COSdS/G5yYN5hPpGFTaOp3SSAoAhBN
 qThI/PXzNb6HKEIEt8dVxjuNyMmN3/LShHRtoUekUi9yBJA6s3ob8DsdTaxVBL+x/f2AtJACyVtKV
 r6sws4m88ditq+6B0oyycJeE1GcnQuNUd5x4WojtPgxtoFGkbowjE63VyCmmwr/UBTCy6BBjx33BB
 No0OVtTQ==;
Subject: [Nouveau] [PATCH 02/15] amdgpu: don't initialize range->list in
 amdgpu_hmm_init_range
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

VGhlIGxpc3QgaXMgdXNlZCB0byBhZGQgdGhlIHJhbmdlIHRvIGFub3RoZXIgbGlzdCBhcyBhbiBl
bnRyeSBpbiB0aGUKY29yZSBobW0gY29kZSwgYW5kIGludGVuZGVkIGFzIGEgcHJpdmF0ZSBtZW1i
ZXIgbm90IGV4cG9zZWQgdG8gZHJpdmVycy4KVGhlcmUgaXMgbm8gbmVlZCB0byBpbml0aWFsaXpl
IGl0IGluIGEgZHJpdmVyLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBs
c3QuZGU+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJl
dmlld2VkLWJ5OiBGZWxpeCBLdWVobGluZyA8RmVsaXguS3VlaGxpbmdAYW1kLmNvbT4KLS0tCiBk
cml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYyB8IDEgLQogMSBmaWxlIGNoYW5n
ZWQsIDEgZGVsZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbW4uYyBiL2RyaXZlcnMvZ3B1L2RybS9hbWQvYW1kZ3B1L2FtZGdwdV9tbi5jCmlu
ZGV4IGI2OThiNDIzYjI1ZC4uNjBiOWZjOTU2MWQ3IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9k
cm0vYW1kL2FtZGdwdS9hbWRncHVfbW4uYworKysgYi9kcml2ZXJzL2dwdS9kcm0vYW1kL2FtZGdw
dS9hbWRncHVfbW4uYwpAQCAtNDg0LDYgKzQ4NCw1IEBAIHZvaWQgYW1kZ3B1X2htbV9pbml0X3Jh
bmdlKHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCQlyYW5nZS0+ZmxhZ3MgPSBobW1fcmFuZ2Vf
ZmxhZ3M7CiAJCXJhbmdlLT52YWx1ZXMgPSBobW1fcmFuZ2VfdmFsdWVzOwogCQlyYW5nZS0+cGZu
X3NoaWZ0ID0gUEFHRV9TSElGVDsKLQkJSU5JVF9MSVNUX0hFQUQoJnJhbmdlLT5saXN0KTsKIAl9
CiB9Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
