Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D1E5B4A7
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BA3C89EBB;
	Mon,  1 Jul 2019 06:20:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D2789E8C;
 Mon,  1 Jul 2019 06:20:37 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpg1-0002tx-JM; Mon, 01 Jul 2019 06:20:33 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:03 +0200
Message-Id: <20190701062020.19239-6-hch@lst.de>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190701062020.19239-1-hch@lst.de>
References: <20190701062020.19239-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aDDV0kJ/bs5He1sJYNTcx8QRyDKaqv7PRbW2xYMan0w=; b=SRjdRB90aDp9ri+nwpQyyHN9q
 qGQh2uFv5+oBVnpCH4SJ+S82Wpl/5WlkHeVnbWe5AlpG9jmwibSgKOUPVlmKBymW6MzbzMs+Z5o5x
 Ggnd73UXr0J0EaH1JLkQ+tGELOwpt6iVaxq/8Lv9lorXyp9nYihVahCxuZEkCLErZAFZV/QTwiXbj
 oiqBjQ3hmd4hDDsYPsDc5xc2RtHEVg21y2T/8EgBWohFixCBg5aFXa4NXJZnpcyUlA/vxFRjuIkQg
 kNIQKzf0Emx+NwpXszIeVaqahmKQdjRNxfXxrmrM0Gmy6pasBag0nyerbXo0boyU6/Q3xNOwrjEQY
 5fLWM2pmQ==;
Subject: [Nouveau] [PATCH 05/22] mm/hmm: Only set FAULT_FLAG_ALLOW_RETRY for
 non-blocking
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
Cc: linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org, "Kuehling,
 Felix" <Felix.Kuehling@amd.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 nouveau@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogIkt1ZWhsaW5nLCBGZWxpeCIgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+CgpEb24ndCBz
ZXQgdGhpcyBmbGFnIGJ5IGRlZmF1bHQgaW4gaG1tX3ZtYV9kb19mYXVsdC4gSXQgaXMgc2V0CmNv
bmRpdGlvbmFsbHkganVzdCBhIGZldyBsaW5lcyBiZWxvdy4gU2V0dGluZyBpdCB1bmNvbmRpdGlv
bmFsbHkgY2FuIGxlYWQKdG8gaGFuZGxlX21tX2ZhdWx0IGRvaW5nIGEgbm9uLWJsb2NraW5nIGZh
dWx0LCByZXR1cm5pbmcgLUVCVVNZIGFuZAp1bmxvY2tpbmcgbW1hcF9zZW0gdW5leHBlY3RlZGx5
LgoKU2lnbmVkLW9mZi1ieTogRmVsaXggS3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+
ClJldmlld2VkLWJ5OiBKw6lyw7RtZSBHbGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVk
LW9mZi1ieTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgotLS0KIG1tL2htbS5j
IHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpk
aWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRleCBkY2U0ZTcwZTY0OGEuLjgyNjgx
NmFiMjM3NyAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTMyOCw3ICsz
MjgsNyBAQCBzdHJ1Y3QgaG1tX3ZtYV93YWxrIHsKIHN0YXRpYyBpbnQgaG1tX3ZtYV9kb19mYXVs
dChzdHJ1Y3QgbW1fd2FsayAqd2FsaywgdW5zaWduZWQgbG9uZyBhZGRyLAogCQkJICAgIGJvb2wg
d3JpdGVfZmF1bHQsIHVpbnQ2NF90ICpwZm4pCiB7Ci0JdW5zaWduZWQgaW50IGZsYWdzID0gRkFV
TFRfRkxBR19BTExPV19SRVRSWSB8IEZBVUxUX0ZMQUdfUkVNT1RFOworCXVuc2lnbmVkIGludCBm
bGFncyA9IEZBVUxUX0ZMQUdfUkVNT1RFOwogCXN0cnVjdCBobW1fdm1hX3dhbGsgKmhtbV92bWFf
d2FsayA9IHdhbGstPnByaXZhdGU7CiAJc3RydWN0IGhtbV9yYW5nZSAqcmFuZ2UgPSBobW1fdm1h
X3dhbGstPnJhbmdlOwogCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1hID0gd2Fsay0+dm1hOwot
LSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
