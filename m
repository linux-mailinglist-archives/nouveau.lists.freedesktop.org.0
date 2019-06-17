Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2574A48224
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9EC7289227;
	Mon, 17 Jun 2019 12:28:14 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 91EA28921B;
 Mon, 17 Jun 2019 12:28:13 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqk6-0000Fs-Fr; Mon, 17 Jun 2019 12:28:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:23 +0200
Message-Id: <20190617122733.22432-16-hch@lst.de>
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
 bh=WoytrCxG5kt017Mi4r+qftdCcpzSPco9CT8jAnxV7AA=; b=cfjnQSuk0OePqkBqt1Zoo6BJSv
 YWzVaKyyvXJvGwKvelhIJkGt4h1MS45yu0wtaVOrOQWYQW9eQdRpwlluWo02xjodmYnwZgSZZt8+1
 jzywQKVxgLg1An5u3r79qC0eTU+LiFdbrO0B+smIqOb9mh1Yv64a7TiGQAYJn6+yuTiEu6beGOzX4
 PblogVq3IxXTL4MGO1JlQa7eryDUGRdrwy+ePIEKe0/njOwiXsi5TDAP2I6bETcHeOvI5IfFmsXAV
 It0kb/wuRPja6yBoYSJjboYG1k7cI0Koq9jvoZvICMYV+7UkSgs7yAO310r+FQswO/ZeVYTphiBrn
 eZrWu20w==;
Subject: [Nouveau] [PATCH 15/25] device-dax: use the dev_pagemap internal
 refcount
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

VGhlIGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgY3VycmVudGx5IG9wZW4g
Y29kZWQgaW4KZGV2aWNlLWRheC4KClNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPgotLS0KIGRyaXZlcnMvZGF4L2RheC1wcml2YXRlLmggfCAgNCAtLS0tCiBkcml2
ZXJzL2RheC9kZXZpY2UuYyAgICAgIHwgNDMgLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0t
LS0tLS0tLS0tCiAyIGZpbGVzIGNoYW5nZWQsIDQ3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBh
L2RyaXZlcnMvZGF4L2RheC1wcml2YXRlLmggYi9kcml2ZXJzL2RheC9kYXgtcHJpdmF0ZS5oCmlu
ZGV4IGE0NTYxMjE0OGNhMC4uZWQwNGExOGEzNWJlIDEwMDY0NAotLS0gYS9kcml2ZXJzL2RheC9k
YXgtcHJpdmF0ZS5oCisrKyBiL2RyaXZlcnMvZGF4L2RheC1wcml2YXRlLmgKQEAgLTUxLDggKzUx
LDYgQEAgc3RydWN0IGRheF9yZWdpb24gewogICogQHRhcmdldF9ub2RlOiBlZmZlY3RpdmUgbnVt
YSBub2RlIGlmIGRldl9kYXggbWVtb3J5IHJhbmdlIGlzIG9ubGluZWQKICAqIEBkZXYgLSBkZXZp
Y2UgY29yZQogICogQHBnbWFwIC0gcGdtYXAgZm9yIG1lbW1hcCBzZXR1cCAvIGxpZmV0aW1lIChk
cml2ZXIgb3duZWQpCi0gKiBAcmVmOiBwZ21hcCByZWZlcmVuY2UgY291bnQgKGRyaXZlciBvd25l
ZCkKLSAqIEBjbXA6IEByZWYgZmluYWwgcHV0IGNvbXBsZXRpb24gKGRyaXZlciBvd25lZCkKICAq
Lwogc3RydWN0IGRldl9kYXggewogCXN0cnVjdCBkYXhfcmVnaW9uICpyZWdpb247CkBAIC02MCw4
ICs1OCw2IEBAIHN0cnVjdCBkZXZfZGF4IHsKIAlpbnQgdGFyZ2V0X25vZGU7CiAJc3RydWN0IGRl
dmljZSBkZXY7CiAJc3RydWN0IGRldl9wYWdlbWFwIHBnbWFwOwotCXN0cnVjdCBwZXJjcHVfcmVm
IHJlZjsKLQlzdHJ1Y3QgY29tcGxldGlvbiBjbXA7CiB9OwogCiBzdGF0aWMgaW5saW5lIHN0cnVj
dCBkZXZfZGF4ICp0b19kZXZfZGF4KHN0cnVjdCBkZXZpY2UgKmRldikKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZGF4L2RldmljZS5jIGIvZHJpdmVycy9kYXgvZGV2aWNlLmMKaW5kZXggMTdiNDZjMWE3
NmI0Li5hOWQ3YzkwZWNmMWUgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZGF4L2RldmljZS5jCisrKyBi
L2RyaXZlcnMvZGF4L2RldmljZS5jCkBAIC0xNCwzNiArMTQsNiBAQAogI2luY2x1ZGUgImRheC1w
cml2YXRlLmgiCiAjaW5jbHVkZSAiYnVzLmgiCiAKLXN0YXRpYyBzdHJ1Y3QgZGV2X2RheCAqcmVm
X3RvX2Rldl9kYXgoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKLXsKLQlyZXR1cm4gY29udGFpbmVy
X29mKHJlZiwgc3RydWN0IGRldl9kYXgsIHJlZik7Ci19Ci0KLXN0YXRpYyB2b2lkIGRldl9kYXhf
cGVyY3B1X3JlbGVhc2Uoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKLXsKLQlzdHJ1Y3QgZGV2X2Rh
eCAqZGV2X2RheCA9IHJlZl90b19kZXZfZGF4KHJlZik7Ci0KLQlkZXZfZGJnKCZkZXZfZGF4LT5k
ZXYsICIlc1xuIiwgX19mdW5jX18pOwotCWNvbXBsZXRlKCZkZXZfZGF4LT5jbXApOwotfQotCi1z
dGF0aWMgdm9pZCBkZXZfZGF4X3BlcmNwdV9leGl0KHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAp
Ci17Ci0Jc3RydWN0IGRldl9kYXggKmRldl9kYXggPSBjb250YWluZXJfb2YocGdtYXAsIHN0cnVj
dCBkZXZfZGF4LCBwZ21hcCk7Ci0KLQlkZXZfZGJnKCZkZXZfZGF4LT5kZXYsICIlc1xuIiwgX19m
dW5jX18pOwotCXdhaXRfZm9yX2NvbXBsZXRpb24oJmRldl9kYXgtPmNtcCk7Ci0JcGVyY3B1X3Jl
Zl9leGl0KHBnbWFwLT5yZWYpOwotfQotCi1zdGF0aWMgdm9pZCBkZXZfZGF4X3BlcmNwdV9raWxs
KHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCi17Ci0Jc3RydWN0IGRldl9kYXggKmRldl9kYXgg
PSBjb250YWluZXJfb2YocGdtYXAsIHN0cnVjdCBkZXZfZGF4LCBwZ21hcCk7Ci0KLQlkZXZfZGJn
KCZkZXZfZGF4LT5kZXYsICIlc1xuIiwgX19mdW5jX18pOwotCXBlcmNwdV9yZWZfa2lsbChwZ21h
cC0+cmVmKTsKLX0KLQogc3RhdGljIGludCBjaGVja192bWEoc3RydWN0IGRldl9kYXggKmRldl9k
YXgsIHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hLAogCQljb25zdCBjaGFyICpmdW5jKQogewpA
QCAtNDQxLDExICs0MTEsNiBAQCBzdGF0aWMgdm9pZCBkZXZfZGF4X2tpbGwodm9pZCAqZGV2X2Rh
eCkKIAlraWxsX2Rldl9kYXgoZGV2X2RheCk7CiB9CiAKLXN0YXRpYyBjb25zdCBzdHJ1Y3QgZGV2
X3BhZ2VtYXBfb3BzIGRldl9kYXhfcGFnZW1hcF9vcHMgPSB7Ci0JLmtpbGwJCT0gZGV2X2RheF9w
ZXJjcHVfa2lsbCwKLQkuY2xlYW51cAk9IGRldl9kYXhfcGVyY3B1X2V4aXQsCi19OwotCiBpbnQg
ZGV2X2RheF9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0IGRldl9kYXggKmRl
dl9kYXggPSB0b19kZXZfZGF4KGRldik7CkBAIC00NjMsMTQgKzQyOCw2IEBAIGludCBkZXZfZGF4
X3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldikKIAkJcmV0dXJuIC1FQlVTWTsKIAl9CiAKLQlpbml0
X2NvbXBsZXRpb24oJmRldl9kYXgtPmNtcCk7Ci0JcmMgPSBwZXJjcHVfcmVmX2luaXQoJmRldl9k
YXgtPnJlZiwgZGV2X2RheF9wZXJjcHVfcmVsZWFzZSwgMCwKLQkJCUdGUF9LRVJORUwpOwotCWlm
IChyYykKLQkJcmV0dXJuIHJjOwotCi0JZGV2X2RheC0+cGdtYXAucmVmID0gJmRldl9kYXgtPnJl
ZjsKLQlkZXZfZGF4LT5wZ21hcC5vcHMgPSAmZGV2X2RheF9wYWdlbWFwX29wczsKIAlhZGRyID0g
ZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXYsICZkZXZfZGF4LT5wZ21hcCk7CiAJaWYgKElTX0VSUihh
ZGRyKSkKIAkJcmV0dXJuIFBUUl9FUlIoYWRkcik7Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
