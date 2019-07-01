Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E65F65B49D
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:20:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1CB089E98;
	Mon,  1 Jul 2019 06:20:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4760889E7B;
 Mon,  1 Jul 2019 06:20:30 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpfs-0002sg-H6; Mon, 01 Jul 2019 06:20:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:19:59 +0200
Message-Id: <20190701062020.19239-2-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701062020.19239-1-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
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
 bh=UlLC8XGw3CfveOE+CE9qUf9ABEe6OmzNIUUnRKazXzE=; b=mMtjeXqRDcDlmyLmrlKFtZtdRU
 1ZECHbYWTfCpkYG1u7NxycM68aGZsaYVHMGnG4IQzU0TAgr9BXvJmFLjN1uPnSkkanle0EQD+/cUS
 ysH15a0tARem1UDKd65mwKxipLWalrdQsGtNrZr4Ay04rG8pu2TsMymVBvSIJ23mdukOSrcE5tXS+
 BWHN4YZYUOMExmZHWnv83906SilXzAL2f2pgaif+KbkA2D1AQX1pNsvBi8cwWmL7Fz0f8pQe7JPnj
 XXI8WLRTzHBt3FMBIQfyW16QH39tSa/OW8ex+6Eu1UTsQsmyJMJobkLg5Jcwv6wJjHpb7mHbkiY/n
 MjKn053w==;
Subject: [Nouveau] [PATCH 01/22] mm/hmm.c: suppress compilation warnings
 when CONFIG_HUGETLB_PAGE is not set
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
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Andrew Morton <akpm@linux-foundation.org>, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKZ2NjIHJlcG9ydHMgdGhh
dCBzZXZlcmFsIHZhcmlhYmxlcyBhcmUgZGVmaW5lZCBidXQgbm90IHVzZWQuCgpGb3IgdGhlIGZp
cnN0IGh1bmsgQ09ORklHX0hVR0VUTEJfUEFHRSB0aGUgZW50aXJlIGlmIGJsb2NrIGlzIGFscmVh
ZHkKcHJvdGVjdGVkIGJ5IHB1ZF9odWdlKCkgd2hpY2ggaXMgZm9yY2VkIHRvIDAuICBOb25lIG9m
IHRoZSBzdHVmZiB1bmRlciB0aGUKaWZkZWYgY2F1c2VzIGNvbXBpbGF0aW9uIHByb2JsZW1zIGFz
IGl0IGlzIGFscmVhZHkgc3R1YmJlZCBvdXQgaW4gdGhlCmhlYWRlciBmaWxlcy4KCkZvciB0aGUg
c2Vjb25kIGh1bmsgdGhlIGR1bW15IGh1Z2VfcGFnZV9zaGlmdCBtYWNybyBkb2Vzbid0IHRvdWNo
IHRoZQphcmd1bWVudCwgc28ganVzdCBpbmxpbmUgdGhlIGFyZ3VtZW50LgoKTGluazogaHR0cDov
L2xrbWwua2VybmVsLm9yZy9yLzIwMTkwNTIyMTk1MTUxLkdBMjM5NTVAemllcGUuY2EKU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgpSZXZpZXdlZC1ieTog
QW5kcmV3IE1vcnRvbiA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KUmV2aWV3ZWQtYnk6IEly
YSBXZWlueSA8aXJhLndlaW55QGludGVsLmNvbT4KU2lnbmVkLW9mZi1ieTogQW5kcmV3IE1vcnRv
biA8YWtwbUBsaW51eC1mb3VuZGF0aW9uLm9yZz4KLS0tCiBtbS9obW0uYyB8IDkgKystLS0tLS0t
CiAxIGZpbGUgY2hhbmdlZCwgMiBpbnNlcnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL21tL2htbS5jIGIvbW0vaG1tLmMKaW5kZXggYzVkODQwZTM0YjI4Li5jNjJhZTQxNGEz
YTIgMTAwNjQ0Ci0tLSBhL21tL2htbS5jCisrKyBiL21tL2htbS5jCkBAIC03ODgsNyArNzg4LDYg
QEAgc3RhdGljIGludCBobW1fdm1hX3dhbGtfcHVkKHB1ZF90ICpwdWRwLAogCQkJcmV0dXJuIGht
bV92bWFfd2Fsa19ob2xlXyhhZGRyLCBlbmQsIGZhdWx0LAogCQkJCQkJd3JpdGVfZmF1bHQsIHdh
bGspOwogCi0jaWZkZWYgQ09ORklHX0hVR0VUTEJfUEFHRQogCQlwZm4gPSBwdWRfcGZuKHB1ZCkg
KyAoKGFkZHIgJiB+UFVEX01BU0spID4+IFBBR0VfU0hJRlQpOwogCQlmb3IgKGkgPSAwOyBpIDwg
bnBhZ2VzOyArK2ksICsrcGZuKSB7CiAJCQlobW1fdm1hX3dhbGstPnBnbWFwID0gZ2V0X2Rldl9w
YWdlbWFwKHBmbiwKQEAgLTgwNCw5ICs4MDMsNiBAQCBzdGF0aWMgaW50IGhtbV92bWFfd2Fsa19w
dWQocHVkX3QgKnB1ZHAsCiAJCX0KIAkJaG1tX3ZtYV93YWxrLT5sYXN0ID0gZW5kOwogCQlyZXR1
cm4gMDsKLSNlbHNlCi0JCXJldHVybiAtRUlOVkFMOwotI2VuZGlmCiAJfQogCiAJc3BsaXRfaHVn
ZV9wdWQod2Fsay0+dm1hLCBwdWRwLCBhZGRyKTsKQEAgLTEwMTUsOSArMTAxMSw4IEBAIGxvbmcg
aG1tX3JhbmdlX3NuYXBzaG90KHN0cnVjdCBobW1fcmFuZ2UgKnJhbmdlKQogCQkJcmV0dXJuIC1F
RkFVTFQ7CiAKIAkJaWYgKGlzX3ZtX2h1Z2V0bGJfcGFnZSh2bWEpKSB7Ci0JCQlzdHJ1Y3QgaHN0
YXRlICpoID0gaHN0YXRlX3ZtYSh2bWEpOwotCi0JCQlpZiAoaHVnZV9wYWdlX3NoaWZ0KGgpICE9
IHJhbmdlLT5wYWdlX3NoaWZ0ICYmCisJCQlpZiAoaHVnZV9wYWdlX3NoaWZ0KGhzdGF0ZV92bWEo
dm1hKSkgIT0KKwkJCQkgICAgcmFuZ2UtPnBhZ2Vfc2hpZnQgJiYKIAkJCSAgICByYW5nZS0+cGFn
ZV9zaGlmdCAhPSBQQUdFX1NISUZUKQogCQkJCXJldHVybiAtRUlOVkFMOwogCQl9IGVsc2Ugewot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
