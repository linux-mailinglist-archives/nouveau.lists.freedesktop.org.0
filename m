Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 285D348217
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:28:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B632891FA;
	Mon, 17 Jun 2019 12:28:00 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AD50891F8;
 Mon, 17 Jun 2019 12:27:59 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqjr-00007j-7B; Mon, 17 Jun 2019 12:27:55 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:16 +0200
Message-Id: <20190617122733.22432-9-hch@lst.de>
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
 bh=7YtpHKyCpwh/jBnBJmxc0lcdvCMmZyq3FZMS/N8Gm6s=; b=WTYjqtZWDVPa1JoJT2LZGI83TG
 IRs4+NaNIEmp7EYCJWepGEdIrGAK30Qa0W3+f+sw2sPqTZuYZ+UM7HBbzX8/W1pQbd4yzdhwjyuQW
 uXvhM+BpRm7F1z1ytvBtf45PvnCfavUVPW4oIpHw3nzlf7jWvPgOxJIx1fLD03x0B5dBuBjtKLazj
 iJV8qt6qHJNno7vhSqOLtNiL9zFMGnXSsdrQ/xmJr7LtKYk1d2aLhR5JvzFWfzTV9h8Qvuu7KiKd3
 3kb1DFVgXK3pdpIQVOgLxC7/An2SE4CCqT/20AAFOO/q4YjuwTv/Gs6O/ZvCSOJy1uLwmFsRbNh2e
 PzK0M9+Q==;
Subject: [Nouveau] [PATCH 08/25] memremap: move dev_pagemap callbacks into a
 separate structure
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
 Logan Gunthorpe <logang@deltatee.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlIGRldl9wYWdlbWFwIGlzIGEgZ3Jvd2luZyB0b28gbWFueSBjYWxsYmFja3MuICBNb3ZlIHRo
ZW0gaW50byBhCnNlcGFyYXRlIG9wcyBzdHJ1Y3R1cmUgc28gdGhhdCB0aGV5IGFyZSBub3QgZHVw
bGljYXRlZCBmb3IgbXVsdGlwbGUKaW5zdGFuY2VzLCBhbmQgYW4gYXR0YWNrZXIgY2FuJ3QgZWFz
aWx5IG92ZXJ3cml0ZSB0aGVtLgoKU2lnbmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhj
aEBsc3QuZGU+ClJldmlld2VkLWJ5OiBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0BkZWx0YXRlZS5j
b20+ClJldmlld2VkLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+Ci0tLQog
ZHJpdmVycy9kYXgvZGV2aWNlLmMgICAgICAgICAgICAgIHwgMTEgKysrKysrLS0tLQogZHJpdmVy
cy9kYXgvcG1lbS9jb3JlLmMgICAgICAgICAgIHwgIDIgKy0KIGRyaXZlcnMvbnZkaW1tL3BtZW0u
YyAgICAgICAgICAgICB8IDE5ICsrKysrKysrKy0tLS0tLS0KIGRyaXZlcnMvcGNpL3AycGRtYS5j
ICAgICAgICAgICAgICB8ICA5ICsrKysrLS0tCiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmggICAg
ICAgICAgfCAzNiArKysrKysrKysrKysrKysrKy0tLS0tLS0tLS0tLS0tCiBrZXJuZWwvbWVtcmVt
YXAuYyAgICAgICAgICAgICAgICAgfCAxOCArKysrKysrKy0tLS0tLS0tCiBtbS9obW0uYyAgICAg
ICAgICAgICAgICAgICAgICAgICAgfCAxMCArKysrKystLS0KIHRvb2xzL3Rlc3RpbmcvbnZkaW1t
L3Rlc3QvaW9tYXAuYyB8ICA5ICsrKystLS0tCiA4IGZpbGVzIGNoYW5nZWQsIDY1IGluc2VydGlv
bnMoKyksIDQ5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZGF4L2RldmljZS5j
IGIvZHJpdmVycy9kYXgvZGV2aWNlLmMKaW5kZXggODQ2NWQxMmZlY2JhLi5jZDQ4MzA1MGE3NzUg
MTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZGF4L2RldmljZS5jCisrKyBiL2RyaXZlcnMvZGF4L2Rldmlj
ZS5jCkBAIC0zNiw5ICszNiw4IEBAIHN0YXRpYyB2b2lkIGRldl9kYXhfcGVyY3B1X2V4aXQoc3Ry
dWN0IHBlcmNwdV9yZWYgKnJlZikKIAlwZXJjcHVfcmVmX2V4aXQocmVmKTsKIH0KIAotc3RhdGlj
IHZvaWQgZGV2X2RheF9wZXJjcHVfa2lsbChzdHJ1Y3QgcGVyY3B1X3JlZiAqZGF0YSkKK3N0YXRp
YyB2b2lkIGRldl9kYXhfcGVyY3B1X2tpbGwoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKIHsKLQlz
dHJ1Y3QgcGVyY3B1X3JlZiAqcmVmID0gZGF0YTsKIAlzdHJ1Y3QgZGV2X2RheCAqZGV2X2RheCA9
IHJlZl90b19kZXZfZGF4KHJlZik7CiAKIAlkZXZfZGJnKCZkZXZfZGF4LT5kZXYsICIlc1xuIiwg
X19mdW5jX18pOwpAQCAtNDQyLDYgKzQ0MSwxMSBAQCBzdGF0aWMgdm9pZCBkZXZfZGF4X2tpbGwo
dm9pZCAqZGV2X2RheCkKIAlraWxsX2Rldl9kYXgoZGV2X2RheCk7CiB9CiAKK3N0YXRpYyBjb25z
dCBzdHJ1Y3QgZGV2X3BhZ2VtYXBfb3BzIGRldl9kYXhfcGFnZW1hcF9vcHMgPSB7CisJLmtpbGwJ
CT0gZGV2X2RheF9wZXJjcHVfa2lsbCwKKwkuY2xlYW51cAk9IGRldl9kYXhfcGVyY3B1X2V4aXQs
Cit9OworCiBpbnQgZGV2X2RheF9wcm9iZShzdHJ1Y3QgZGV2aWNlICpkZXYpCiB7CiAJc3RydWN0
IGRldl9kYXggKmRldl9kYXggPSB0b19kZXZfZGF4KGRldik7CkBAIC00NjYsOCArNDcwLDcgQEAg
aW50IGRldl9kYXhfcHJvYmUoc3RydWN0IGRldmljZSAqZGV2KQogCQlyZXR1cm4gcmM7CiAKIAlk
ZXZfZGF4LT5wZ21hcC5yZWYgPSAmZGV2X2RheC0+cmVmOwotCWRldl9kYXgtPnBnbWFwLmtpbGwg
PSBkZXZfZGF4X3BlcmNwdV9raWxsOwotCWRldl9kYXgtPnBnbWFwLmNsZWFudXAgPSBkZXZfZGF4
X3BlcmNwdV9leGl0OworCWRldl9kYXgtPnBnbWFwLm9wcyA9ICZkZXZfZGF4X3BhZ2VtYXBfb3Bz
OwogCWFkZHIgPSBkZXZtX21lbXJlbWFwX3BhZ2VzKGRldiwgJmRldl9kYXgtPnBnbWFwKTsKIAlp
ZiAoSVNfRVJSKGFkZHIpKQogCQlyZXR1cm4gUFRSX0VSUihhZGRyKTsKZGlmZiAtLWdpdCBhL2Ry
aXZlcnMvZGF4L3BtZW0vY29yZS5jIGIvZHJpdmVycy9kYXgvcG1lbS9jb3JlLmMKaW5kZXggZjlm
NTE3ODZkNTU2Li42ZWI2ZGZkZjE5YmYgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZGF4L3BtZW0vY29y
ZS5jCisrKyBiL2RyaXZlcnMvZGF4L3BtZW0vY29yZS5jCkBAIC0xNiw3ICsxNiw3IEBAIHN0cnVj
dCBkZXZfZGF4ICpfX2RheF9wbWVtX3Byb2JlKHN0cnVjdCBkZXZpY2UgKmRldiwgZW51bSBkZXZf
ZGF4X3N1YnN5cyBzdWJzeXMpCiAJc3RydWN0IGRldl9kYXggKmRldl9kYXg7CiAJc3RydWN0IG5k
X25hbWVzcGFjZV9pbyAqbnNpbzsKIAlzdHJ1Y3QgZGF4X3JlZ2lvbiAqZGF4X3JlZ2lvbjsKLQlz
dHJ1Y3QgZGV2X3BhZ2VtYXAgcGdtYXAgPSB7IDAgfTsKKwlzdHJ1Y3QgZGV2X3BhZ2VtYXAgcGdt
YXAgPSB7IH07CiAJc3RydWN0IG5kX25hbWVzcGFjZV9jb21tb24gKm5kbnM7CiAJc3RydWN0IG5k
X2RheCAqbmRfZGF4ID0gdG9fbmRfZGF4KGRldik7CiAJc3RydWN0IG5kX3BmbiAqbmRfcGZuID0g
Jm5kX2RheC0+bmRfcGZuOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9udmRpbW0vcG1lbS5jIGIvZHJp
dmVycy9udmRpbW0vcG1lbS5jCmluZGV4IGM0ZjVhODA4YjlkYS4uMWE5OTg2ZGM0ZGM2IDEwMDY0
NAotLS0gYS9kcml2ZXJzL252ZGltbS9wbWVtLmMKKysrIGIvZHJpdmVycy9udmRpbW0vcG1lbS5j
CkBAIC0zMTEsNyArMzExLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBhdHRyaWJ1dGVfZ3JvdXAg
KnBtZW1fYXR0cmlidXRlX2dyb3Vwc1tdID0gewogCU5VTEwsCiB9OwogCi1zdGF0aWMgdm9pZCBf
X3BtZW1fcmVsZWFzZV9xdWV1ZShzdHJ1Y3QgcGVyY3B1X3JlZiAqcmVmKQorc3RhdGljIHZvaWQg
cG1lbV9wYWdlbWFwX2NsZWFudXAoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKIHsKIAlzdHJ1Y3Qg
cmVxdWVzdF9xdWV1ZSAqcTsKIApAQCAtMzIxLDEwICszMjEsMTAgQEAgc3RhdGljIHZvaWQgX19w
bWVtX3JlbGVhc2VfcXVldWUoc3RydWN0IHBlcmNwdV9yZWYgKnJlZikKIAogc3RhdGljIHZvaWQg
cG1lbV9yZWxlYXNlX3F1ZXVlKHZvaWQgKnJlZikKIHsKLQlfX3BtZW1fcmVsZWFzZV9xdWV1ZShy
ZWYpOworCXBtZW1fcGFnZW1hcF9jbGVhbnVwKHJlZik7CiB9CiAKLXN0YXRpYyB2b2lkIHBtZW1f
ZnJlZXplX3F1ZXVlKHN0cnVjdCBwZXJjcHVfcmVmICpyZWYpCitzdGF0aWMgdm9pZCBwbWVtX3Bh
Z2VtYXBfa2lsbChzdHJ1Y3QgcGVyY3B1X3JlZiAqcmVmKQogewogCXN0cnVjdCByZXF1ZXN0X3F1
ZXVlICpxOwogCkBAIC0zNDcsMTkgKzM0NywyNCBAQCBzdGF0aWMgdm9pZCBwbWVtX3JlbGVhc2Vf
cGdtYXBfb3BzKHZvaWQgKl9fcGdtYXApCiAJZGV2X3BhZ2VtYXBfcHV0X29wcygpOwogfQogCi1z
dGF0aWMgdm9pZCBmc2RheF9wYWdlZnJlZShzdHJ1Y3QgcGFnZSAqcGFnZSwgdm9pZCAqZGF0YSkK
K3N0YXRpYyB2b2lkIHBtZW1fcGFnZW1hcF9wYWdlX2ZyZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZv
aWQgKmRhdGEpCiB7CiAJd2FrZV91cF92YXIoJnBhZ2UtPl9yZWZjb3VudCk7CiB9CiAKK3N0YXRp
YyBjb25zdCBzdHJ1Y3QgZGV2X3BhZ2VtYXBfb3BzIGZzZGF4X3BhZ2VtYXBfb3BzID0geworCS5w
YWdlX2ZyZWUJCT0gcG1lbV9wYWdlbWFwX3BhZ2VfZnJlZSwKKwkua2lsbAkJCT0gcG1lbV9wYWdl
bWFwX2tpbGwsCisJLmNsZWFudXAJCT0gcG1lbV9wYWdlbWFwX2NsZWFudXAsCit9OworCiBzdGF0
aWMgaW50IHNldHVwX3BhZ2VtYXBfZnNkYXgoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3QgZGV2
X3BhZ2VtYXAgKnBnbWFwKQogewogCWRldl9wYWdlbWFwX2dldF9vcHMoKTsKIAlpZiAoZGV2bV9h
ZGRfYWN0aW9uX29yX3Jlc2V0KGRldiwgcG1lbV9yZWxlYXNlX3BnbWFwX29wcywgcGdtYXApKQog
CQlyZXR1cm4gLUVOT01FTTsKIAlwZ21hcC0+dHlwZSA9IE1FTU9SWV9ERVZJQ0VfRlNfREFYOwot
CXBnbWFwLT5wYWdlX2ZyZWUgPSBmc2RheF9wYWdlZnJlZTsKLQorCXBnbWFwLT5vcHMgPSAmZnNk
YXhfcGFnZW1hcF9vcHM7CiAJcmV0dXJuIDA7CiB9CiAKQEAgLTQxNyw4ICs0MjIsNiBAQCBzdGF0
aWMgaW50IHBtZW1fYXR0YWNoX2Rpc2soc3RydWN0IGRldmljZSAqZGV2LAogCiAJcG1lbS0+cGZu
X2ZsYWdzID0gUEZOX0RFVjsKIAlwbWVtLT5wZ21hcC5yZWYgPSAmcS0+cV91c2FnZV9jb3VudGVy
OwotCXBtZW0tPnBnbWFwLmtpbGwgPSBwbWVtX2ZyZWV6ZV9xdWV1ZTsKLQlwbWVtLT5wZ21hcC5j
bGVhbnVwID0gX19wbWVtX3JlbGVhc2VfcXVldWU7CiAJaWYgKGlzX25kX3BmbihkZXYpKSB7CiAJ
CWlmIChzZXR1cF9wYWdlbWFwX2ZzZGF4KGRldiwgJnBtZW0tPnBnbWFwKSkKIAkJCXJldHVybiAt
RU5PTUVNOwpkaWZmIC0tZ2l0IGEvZHJpdmVycy9wY2kvcDJwZG1hLmMgYi9kcml2ZXJzL3BjaS9w
MnBkbWEuYwppbmRleCBhOTgxMjZhZDljM2EuLmUwODM1NjdkMjZlZiAxMDA2NDQKLS0tIGEvZHJp
dmVycy9wY2kvcDJwZG1hLmMKKysrIGIvZHJpdmVycy9wY2kvcDJwZG1hLmMKQEAgLTEwMCw3ICsx
MDAsNyBAQCBzdGF0aWMgdm9pZCBwY2lfcDJwZG1hX3BlcmNwdV9jbGVhbnVwKHN0cnVjdCBwZXJj
cHVfcmVmICpyZWYpCiAJc3RydWN0IHAycGRtYV9wYWdlbWFwICpwMnBfcGdtYXAgPSB0b19wMnBf
cGdtYXAocmVmKTsKIAogCXdhaXRfZm9yX2NvbXBsZXRpb24oJnAycF9wZ21hcC0+cmVmX2RvbmUp
OwotCXBlcmNwdV9yZWZfZXhpdCgmcDJwX3BnbWFwLT5yZWYpOworCXBlcmNwdV9yZWZfZXhpdChy
ZWYpOwogfQogCiBzdGF0aWMgdm9pZCBwY2lfcDJwZG1hX3JlbGVhc2Uodm9pZCAqZGF0YSkKQEAg
LTE1Miw2ICsxNTIsMTEgQEAgc3RhdGljIGludCBwY2lfcDJwZG1hX3NldHVwKHN0cnVjdCBwY2lf
ZGV2ICpwZGV2KQogCXJldHVybiBlcnJvcjsKIH0KIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZf
cGFnZW1hcF9vcHMgcGNpX3AycGRtYV9wYWdlbWFwX29wcyA9IHsKKwkua2lsbAkJPSBwY2lfcDJw
ZG1hX3BlcmNwdV9raWxsLAorCS5jbGVhbnVwCT0gcGNpX3AycGRtYV9wZXJjcHVfY2xlYW51cCwK
K307CisKIC8qKgogICogcGNpX3AycGRtYV9hZGRfcmVzb3VyY2UgLSBhZGQgbWVtb3J5IGZvciB1
c2UgYXMgcDJwIG1lbW9yeQogICogQHBkZXY6IHRoZSBkZXZpY2UgdG8gYWRkIHRoZSBtZW1vcnkg
dG8KQEAgLTIwNyw4ICsyMTIsNiBAQCBpbnQgcGNpX3AycGRtYV9hZGRfcmVzb3VyY2Uoc3RydWN0
IHBjaV9kZXYgKnBkZXYsIGludCBiYXIsIHNpemVfdCBzaXplLAogCXBnbWFwLT50eXBlID0gTUVN
T1JZX0RFVklDRV9QQ0lfUDJQRE1BOwogCXBnbWFwLT5wY2lfcDJwZG1hX2J1c19vZmZzZXQgPSBw
Y2lfYnVzX2FkZHJlc3MocGRldiwgYmFyKSAtCiAJCXBjaV9yZXNvdXJjZV9zdGFydChwZGV2LCBi
YXIpOwotCXBnbWFwLT5raWxsID0gcGNpX3AycGRtYV9wZXJjcHVfa2lsbDsKLQlwZ21hcC0+Y2xl
YW51cCA9IHBjaV9wMnBkbWFfcGVyY3B1X2NsZWFudXA7CiAKIAlhZGRyID0gZGV2bV9tZW1yZW1h
cF9wYWdlcygmcGRldi0+ZGV2LCBwZ21hcCk7CiAJaWYgKElTX0VSUihhZGRyKSkgewpkaWZmIC0t
Z2l0IGEvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oIGIvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5o
CmluZGV4IDE3MzJkZWEwMzBiMi4uMWNkY2ZkNTk1NzcwIDEwMDY0NAotLS0gYS9pbmNsdWRlL2xp
bnV4L21lbXJlbWFwLmgKKysrIGIvaW5jbHVkZS9saW51eC9tZW1yZW1hcC5oCkBAIC02Myw0MSAr
NjMsNDUgQEAgZW51bSBtZW1vcnlfdHlwZSB7CiAJTUVNT1JZX0RFVklDRV9QQ0lfUDJQRE1BLAog
fTsKIAotLyoKLSAqIEFkZGl0aW9uYWwgbm90ZXMgYWJvdXQgTUVNT1JZX0RFVklDRV9QUklWQVRF
IG1heSBiZSBmb3VuZCBpbgotICogaW5jbHVkZS9saW51eC9obW0uaCBhbmQgRG9jdW1lbnRhdGlv
bi92bS9obW0ucnN0LiBUaGVyZSBpcyBhbHNvIGEgYnJpZWYKLSAqIGV4cGxhbmF0aW9uIGluIGlu
Y2x1ZGUvbGludXgvbWVtb3J5X2hvdHBsdWcuaC4KLSAqCi0gKiBUaGUgcGFnZV9mcmVlKCkgY2Fs
bGJhY2sgaXMgY2FsbGVkIG9uY2UgdGhlIHBhZ2UgcmVmY291bnQgcmVhY2hlcyAxCi0gKiAoWk9O
RV9ERVZJQ0UgcGFnZXMgbmV2ZXIgcmVhY2ggMCByZWZjb3VudCB1bmxlc3MgdGhlcmUgaXMgYSBy
ZWZjb3VudCBidWcuCi0gKiBUaGlzIGFsbG93cyB0aGUgZGV2aWNlIGRyaXZlciB0byBpbXBsZW1l
bnQgaXRzIG93biBtZW1vcnkgbWFuYWdlbWVudC4pCi0gKi8KLXR5cGVkZWYgdm9pZCAoKmRldl9w
YWdlX2ZyZWVfdCkoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpOworc3RydWN0IGRldl9w
YWdlbWFwX29wcyB7CisJLyoKKwkgKiBDYWxsZWQgb25jZSB0aGUgcGFnZSByZWZjb3VudCByZWFj
aGVzIDEuICAoWk9ORV9ERVZJQ0UgcGFnZXMgbmV2ZXIKKwkgKiByZWFjaCAwIHJlZmNvdW50IHVu
bGVzcyB0aGVyZSBpcyBhIHJlZmNvdW50IGJ1Zy4gVGhpcyBhbGxvd3MgdGhlCisJICogZGV2aWNl
IGRyaXZlciB0byBpbXBsZW1lbnQgaXRzIG93biBtZW1vcnkgbWFuYWdlbWVudC4pCisJICovCisJ
dm9pZCAoKnBhZ2VfZnJlZSkoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpOworCisJLyoK
KwkgKiBUcmFuc2l0aW9uIHRoZSByZWZjb3VudCBpbiBzdHJ1Y3QgZGV2X3BhZ2VtYXAgdG8gdGhl
IGRlYWQgc3RhdGUuCisJICovCisJdm9pZCAoKmtpbGwpKHN0cnVjdCBwZXJjcHVfcmVmICpyZWYp
OworCisJLyoKKwkgKiBXYWl0IGZvciByZWZjb3VudCBpbiBzdHJ1Y3QgZGV2X3BhZ2VtYXAgdG8g
YmUgaWRsZSBhbmQgcmVhcCBpdC4KKwkgKi8KKwl2b2lkICgqY2xlYW51cCkoc3RydWN0IHBlcmNw
dV9yZWYgKnJlZik7Cit9OwogCiAvKioKICAqIHN0cnVjdCBkZXZfcGFnZW1hcCAtIG1ldGFkYXRh
IGZvciBaT05FX0RFVklDRSBtYXBwaW5ncwotICogQHBhZ2VfZnJlZTogZnJlZSBwYWdlIGNhbGxi
YWNrIHdoZW4gcGFnZSByZWZjb3VudCByZWFjaGVzIDEKICAqIEBhbHRtYXA6IHByZS1hbGxvY2F0
ZWQvcmVzZXJ2ZWQgbWVtb3J5IGZvciB2bWVtbWFwIGFsbG9jYXRpb25zCiAgKiBAcmVzOiBwaHlz
aWNhbCBhZGRyZXNzIHJhbmdlIGNvdmVyZWQgYnkgQHJlZgogICogQHJlZjogcmVmZXJlbmNlIGNv
dW50IHRoYXQgcGlucyB0aGUgZGV2bV9tZW1yZW1hcF9wYWdlcygpIG1hcHBpbmcKLSAqIEBraWxs
OiBjYWxsYmFjayB0byB0cmFuc2l0aW9uIEByZWYgdG8gdGhlIGRlYWQgc3RhdGUKLSAqIEBjbGVh
bnVwOiBjYWxsYmFjayB0byB3YWl0IGZvciBAcmVmIHRvIGJlIGlkbGUgYW5kIHJlYXAgaXQKICAq
IEBkZXY6IGhvc3QgZGV2aWNlIG9mIHRoZSBtYXBwaW5nIGZvciBkZWJ1ZwogICogQGRhdGE6IHBy
aXZhdGUgZGF0YSBwb2ludGVyIGZvciBwYWdlX2ZyZWUoKQogICogQHR5cGU6IG1lbW9yeSB0eXBl
OiBzZWUgTUVNT1JZXyogaW4gbWVtb3J5X2hvdHBsdWcuaAorICogQG9wczogbWV0aG9kIHRhYmxl
CiAgKi8KIHN0cnVjdCBkZXZfcGFnZW1hcCB7Ci0JZGV2X3BhZ2VfZnJlZV90IHBhZ2VfZnJlZTsK
IAlzdHJ1Y3Qgdm1lbV9hbHRtYXAgYWx0bWFwOwogCWJvb2wgYWx0bWFwX3ZhbGlkOwogCXN0cnVj
dCByZXNvdXJjZSByZXM7CiAJc3RydWN0IHBlcmNwdV9yZWYgKnJlZjsKLQl2b2lkICgqa2lsbCko
c3RydWN0IHBlcmNwdV9yZWYgKnJlZik7Ci0Jdm9pZCAoKmNsZWFudXApKHN0cnVjdCBwZXJjcHVf
cmVmICpyZWYpOwogCXN0cnVjdCBkZXZpY2UgKmRldjsKIAl2b2lkICpkYXRhOwogCWVudW0gbWVt
b3J5X3R5cGUgdHlwZTsKIAl1NjQgcGNpX3AycGRtYV9idXNfb2Zmc2V0OworCWNvbnN0IHN0cnVj
dCBkZXZfcGFnZW1hcF9vcHMgKm9wczsKIH07CiAKICNpZmRlZiBDT05GSUdfWk9ORV9ERVZJQ0UK
ZGlmZiAtLWdpdCBhL2tlcm5lbC9tZW1yZW1hcC5jIGIva2VybmVsL21lbXJlbWFwLmMKaW5kZXgg
NmEyZGQzMWE2MjUwLi44NTYzNWZmNTdlMDQgMTAwNjQ0Ci0tLSBhL2tlcm5lbC9tZW1yZW1hcC5j
CisrKyBiL2tlcm5lbC9tZW1yZW1hcC5jCkBAIC05MiwxMCArOTIsMTAgQEAgc3RhdGljIHZvaWQg
ZGV2bV9tZW1yZW1hcF9wYWdlc19yZWxlYXNlKHZvaWQgKmRhdGEpCiAJdW5zaWduZWQgbG9uZyBw
Zm47CiAJaW50IG5pZDsKIAotCXBnbWFwLT5raWxsKHBnbWFwLT5yZWYpOworCXBnbWFwLT5vcHMt
PmtpbGwocGdtYXAtPnJlZik7CiAJZm9yX2VhY2hfZGV2aWNlX3BmbihwZm4sIHBnbWFwKQogCQlw
dXRfcGFnZShwZm5fdG9fcGFnZShwZm4pKTsKLQlwZ21hcC0+Y2xlYW51cChwZ21hcC0+cmVmKTsK
KwlwZ21hcC0+b3BzLT5jbGVhbnVwKHBnbWFwLT5yZWYpOwogCiAJLyogcGFnZXMgYXJlIGRlYWQg
YW5kIHVudXNlZCwgdW5kbyB0aGUgYXJjaCBtYXBwaW5nICovCiAJYWxpZ25fc3RhcnQgPSByZXMt
PnN0YXJ0ICYgfihTRUNUSU9OX1NJWkUgLSAxKTsKQEAgLTEyOCw4ICsxMjgsOCBAQCBzdGF0aWMg
dm9pZCBkZXZtX21lbXJlbWFwX3BhZ2VzX3JlbGVhc2Uodm9pZCAqZGF0YSkKICAqIEBwZ21hcDog
cG9pbnRlciB0byBhIHN0cnVjdCBkZXZfcGFnZW1hcAogICoKICAqIE5vdGVzOgotICogMS8gQXQg
YSBtaW5pbXVtIHRoZSByZXMsIHJlZiBhbmQgdHlwZSBtZW1iZXJzIG9mIEBwZ21hcCBtdXN0IGJl
IGluaXRpYWxpemVkCi0gKiAgICBieSB0aGUgY2FsbGVyIGJlZm9yZSBwYXNzaW5nIGl0IHRvIHRo
aXMgZnVuY3Rpb24KKyAqIDEvIEF0IGEgbWluaW11bSB0aGUgcmVzLCByZWYgYW5kIHR5cGUgYW5k
IG9wcyBtZW1iZXJzIG9mIEBwZ21hcCBtdXN0IGJlCisgKiAgICBpbml0aWFsaXplZCBieSB0aGUg
Y2FsbGVyIGJlZm9yZSBwYXNzaW5nIGl0IHRvIHRoaXMgZnVuY3Rpb24KICAqCiAgKiAyLyBUaGUg
YWx0bWFwIGZpZWxkIG1heSBvcHRpb25hbGx5IGJlIGluaXRpYWxpemVkLCBpbiB3aGljaCBjYXNl
IGFsdG1hcF92YWxpZAogICogICAgbXVzdCBiZSBzZXQgdG8gdHJ1ZQpAQCAtMTg0LDcgKzE4NCw4
IEBAIHZvaWQgKmRldm1fbWVtcmVtYXBfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1Y3Qg
ZGV2X3BhZ2VtYXAgKnBnbWFwKQogCQlicmVhazsKIAl9CiAKLQlpZiAoIXBnbWFwLT5yZWYgfHwg
IXBnbWFwLT5raWxsIHx8ICFwZ21hcC0+Y2xlYW51cCkgeworCWlmICghcGdtYXAtPnJlZiB8fCAh
cGdtYXAtPm9wcyB8fCAhcGdtYXAtPm9wcy0+a2lsbCB8fAorCSAgICAhcGdtYXAtPm9wcy0+Y2xl
YW51cCkgewogCQlXQVJOKDEsICJNaXNzaW5nIHJlZmVyZW5jZSBjb3VudCB0ZWFyZG93biBkZWZp
bml0aW9uXG4iKTsKIAkJcmV0dXJuIEVSUl9QVFIoLUVJTlZBTCk7CiAJfQpAQCAtMjk4LDkgKzI5
OSw4IEBAIHZvaWQgKmRldm1fbWVtcmVtYXBfcGFnZXMoc3RydWN0IGRldmljZSAqZGV2LCBzdHJ1
Y3QgZGV2X3BhZ2VtYXAgKnBnbWFwKQogIGVycl9wZm5fcmVtYXA6CiAJcGdtYXBfYXJyYXlfZGVs
ZXRlKHJlcyk7CiAgZXJyX2FycmF5OgotCXBnbWFwLT5raWxsKHBnbWFwLT5yZWYpOwotCXBnbWFw
LT5jbGVhbnVwKHBnbWFwLT5yZWYpOwotCisJcGdtYXAtPm9wcy0+a2lsbChwZ21hcC0+cmVmKTsK
KwlwZ21hcC0+b3BzLT5jbGVhbnVwKHBnbWFwLT5yZWYpOwogCXJldHVybiBFUlJfUFRSKGVycm9y
KTsKIH0KIEVYUE9SVF9TWU1CT0xfR1BMKGRldm1fbWVtcmVtYXBfcGFnZXMpOwpAQCAtMzkzLDcg
KzM5Myw3IEBAIHZvaWQgX19wdXRfZGV2bWFwX21hbmFnZWRfcGFnZShzdHJ1Y3QgcGFnZSAqcGFn
ZSkKIAogCQltZW1fY2dyb3VwX3VuY2hhcmdlKHBhZ2UpOwogCi0JCXBhZ2UtPnBnbWFwLT5wYWdl
X2ZyZWUocGFnZSwgcGFnZS0+cGdtYXAtPmRhdGEpOworCQlwYWdlLT5wZ21hcC0+b3BzLT5wYWdl
X2ZyZWUocGFnZSwgcGFnZS0+cGdtYXAtPmRhdGEpOwogCX0gZWxzZSBpZiAoIWNvdW50KQogCQlf
X3B1dF9wYWdlKHBhZ2UpOwogfQpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9tbS9obW0uYwppbmRl
eCAxNzJkNjk1ZGNiOGIuLjY5NGU1M2JjNTVmNCAxMDA2NDQKLS0tIGEvbW0vaG1tLmMKKysrIGIv
bW0vaG1tLmMKQEAgLTEzODEsNiArMTM4MSwxMiBAQCBzdGF0aWMgdm9pZCBobW1fZGV2bWVtX2Zy
ZWUoc3RydWN0IHBhZ2UgKnBhZ2UsIHZvaWQgKmRhdGEpCiAJZGV2bWVtLT5vcHMtPmZyZWUoZGV2
bWVtLCBwYWdlKTsKIH0KIAorc3RhdGljIGNvbnN0IHN0cnVjdCBkZXZfcGFnZW1hcF9vcHMgaG1t
X3BhZ2VtYXBfb3BzID0geworCS5wYWdlX2ZyZWUJCT0gaG1tX2Rldm1lbV9mcmVlLAorCS5raWxs
CQkJPSBobW1fZGV2bWVtX3JlZl9raWxsLAorCS5jbGVhbnVwCQk9IGhtbV9kZXZtZW1fcmVmX2V4
aXQsCit9OworCiAvKgogICogaG1tX2Rldm1lbV9hZGQoKSAtIGhvdHBsdWcgWk9ORV9ERVZJQ0Ug
bWVtb3J5IGZvciBkZXZpY2UgbWVtb3J5CiAgKgpAQCAtMTQzNSwxMiArMTQ0MSwxMCBAQCBzdHJ1
Y3QgaG1tX2Rldm1lbSAqaG1tX2Rldm1lbV9hZGQoY29uc3Qgc3RydWN0IGhtbV9kZXZtZW1fb3Bz
ICpvcHMsCiAKIAlkZXZtZW0tPnBhZ2VtYXAudHlwZSA9IE1FTU9SWV9ERVZJQ0VfUFJJVkFURTsK
IAlkZXZtZW0tPnBhZ2VtYXAucmVzID0gKmRldm1lbS0+cmVzb3VyY2U7Ci0JZGV2bWVtLT5wYWdl
bWFwLnBhZ2VfZnJlZSA9IGhtbV9kZXZtZW1fZnJlZTsKKwlkZXZtZW0tPnBhZ2VtYXAub3BzID0g
JmhtbV9wYWdlbWFwX29wczsKIAlkZXZtZW0tPnBhZ2VtYXAuYWx0bWFwX3ZhbGlkID0gZmFsc2U7
CiAJZGV2bWVtLT5wYWdlbWFwLnJlZiA9ICZkZXZtZW0tPnJlZjsKIAlkZXZtZW0tPnBhZ2VtYXAu
ZGF0YSA9IGRldm1lbTsKLQlkZXZtZW0tPnBhZ2VtYXAua2lsbCA9IGhtbV9kZXZtZW1fcmVmX2tp
bGw7Ci0JZGV2bWVtLT5wYWdlbWFwLmNsZWFudXAgPSBobW1fZGV2bWVtX3JlZl9leGl0OwogCiAJ
cmVzdWx0ID0gZGV2bV9tZW1yZW1hcF9wYWdlcyhkZXZtZW0tPmRldmljZSwgJmRldm1lbS0+cGFn
ZW1hcCk7CiAJaWYgKElTX0VSUihyZXN1bHQpKQpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9u
dmRpbW0vdGVzdC9pb21hcC5jIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21hcC5jCmlu
ZGV4IDIxOWRkMGExY2IwOC4uYTY2N2Q5NzQxNTVlIDEwMDY0NAotLS0gYS90b29scy90ZXN0aW5n
L252ZGltbS90ZXN0L2lvbWFwLmMKKysrIGIvdG9vbHMvdGVzdGluZy9udmRpbW0vdGVzdC9pb21h
cC5jCkBAIC0xMDYsMTEgKzEwNiwxMCBAQCBFWFBPUlRfU1lNQk9MKF9fd3JhcF9kZXZtX21lbXJl
bWFwKTsKIAogc3RhdGljIHZvaWQgbmZpdF90ZXN0X2tpbGwodm9pZCAqX3BnbWFwKQogewotCXN0
cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXAgPSBfcGdtYXA7Ci0KLQlXQVJOX09OKCFwZ21hcCB8fCAh
cGdtYXAtPnJlZiB8fCAhcGdtYXAtPmtpbGwgfHwgIXBnbWFwLT5jbGVhbnVwKTsKLQlwZ21hcC0+
a2lsbChwZ21hcC0+cmVmKTsKLQlwZ21hcC0+Y2xlYW51cChwZ21hcC0+cmVmKTsKKwlXQVJOX09O
KCFwZ21hcCB8fCAhcGdtYXAtPnJlZiB8fCAhcGdtYXAtPm9wcy0+a2lsbCB8fAorCQkhcGdtYXAt
Pm9wcy0+Y2xlYW51cCk7CisJcGdtYXAtPm9wcy0+a2lsbChwZ21hcC0+cmVmKTsKKwlwZ21hcC0+
b3BzLT5jbGVhbnVwKHBnbWFwLT5yZWYpOwogfQogCiB2b2lkICpfX3dyYXBfZGV2bV9tZW1yZW1h
cF9wYWdlcyhzdHJ1Y3QgZGV2aWNlICpkZXYsIHN0cnVjdCBkZXZfcGFnZW1hcCAqcGdtYXApCi0t
IAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
