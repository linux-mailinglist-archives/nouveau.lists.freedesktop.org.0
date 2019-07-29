Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A28478DEE
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 16:29:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E797189CF5;
	Mon, 29 Jul 2019 14:29:16 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E51E89CF1;
 Mon, 29 Jul 2019 14:29:15 +0000 (UTC)
Received: from [195.167.85.94] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hs6eF-0006MP-Nu; Mon, 29 Jul 2019 14:29:12 +0000
From: Christoph Hellwig <hch@lst.de>
To: =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 29 Jul 2019 17:28:40 +0300
Message-Id: <20190729142843.22320-7-hch@lst.de>
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
 bh=LWms1tzdUBSIpVLSl2mZ1UudV6rJZIzfLpKlWyzdeIg=; b=ZBx3zr3C8ZbL0ZZco849pWWOjo
 eqE6HR29il18amM1+MRcsK7O9dUQzttNiJFk35Pwg4KplCTrezQhPnABVSHt8xpqUDsC3M+5D/mga
 BzUHIBTbT6aEbX2bMehCKE03hP2fHEtv5TdomEBY3QxGzafgXnYMSloGvZIv0CH/Qt5Om+QJbNTVg
 Tg176OEZHdJ6ZTJAEBcU8ZexiXQKJ8MdZb7Mpn8oi/T/KCh4Z53pxvBmkQE5PQyj/ChxZvF9ekXRf
 t324BKXjFOVA6A1HJYk/IkVmIkymfShrpglwVhxKATFEqvBYgFvGZ5aCxN/3okNLwH36wqChrVK13
 DxOvWc/w==;
Subject: [Nouveau] [PATCH 6/9] nouveau: simplify nouveau_dmem_migrate_vma
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

RmFjdG9yIHRoZSBtYWluIGNvcHkgcGFnZSB0byB2cmFtIHJvdXRpbmUgb3V0IGludG8gYSBoZWxw
ZXIgdGhhdCBhY3RzCm9uIGEgc2luZ2xlIHBhZ2UgYW5kIHdoaWNoIGRvZXNuJ3QgcmVxdWlyZSB0
aGUgbm91dmVhdV9kbWVtX21pZ3JhdGUKc3RydWN0dXJlIGZvciBhcmd1bWVudCBwYXNzaW5nLiAg
QXMgYW4gYWRkZWQgYmVuZWZpdCB0aGUgbmV3IHZlcnNpb24Kb25seSBhbGxvY2F0ZXMgdGhlIGRt
YSBhZGRyZXNzIGFycmF5IG9uY2UgYW5kIHJldXNlcyBpdCBmb3IgZWFjaApzdWJzZXF1ZW50IGNo
dW5rIG9mIHdvcmsuCgpTaWduZWQtb2ZmLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNoQGxzdC5k
ZT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2RtZW0uYyB8IDE4NSArKysr
KysrKy0tLS0tLS0tLS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNTYgaW5zZXJ0aW9ucygrKSwg
MTI5IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZG1lbS5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kbWVtLmMKaW5k
ZXggMDM2ZTZjMDdkNDg5Li42Y2I5MzA3NTU5NzAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfZG1lbS5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25v
dXZlYXVfZG1lbS5jCkBAIC00NCw4ICs0NCw2IEBACiAjZGVmaW5lIERNRU1fQ0hVTktfU0laRSAo
MlVMIDw8IDIwKQogI2RlZmluZSBETUVNX0NIVU5LX05QQUdFUyAoRE1FTV9DSFVOS19TSVpFID4+
IFBBR0VfU0hJRlQpCiAKLXN0cnVjdCBub3V2ZWF1X21pZ3JhdGU7Ci0KIGVudW0gbm91dmVhdV9h
cGVyIHsKIAlOT1VWRUFVX0FQRVJfVklSVCwKIAlOT1VWRUFVX0FQRVJfVlJBTSwKQEAgLTg2LDE1
ICs4NCw2IEBAIHN0YXRpYyBpbmxpbmUgc3RydWN0IG5vdXZlYXVfZG1lbSAqcGFnZV90b19kbWVt
KHN0cnVjdCBwYWdlICpwYWdlKQogCXJldHVybiBjb250YWluZXJfb2YocGFnZS0+cGdtYXAsIHN0
cnVjdCBub3V2ZWF1X2RtZW0sIHBhZ2VtYXApOwogfQogCi1zdHJ1Y3Qgbm91dmVhdV9taWdyYXRl
IHsKLQlzdHJ1Y3Qgdm1fYXJlYV9zdHJ1Y3QgKnZtYTsKLQlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRy
bTsKLQlzdHJ1Y3Qgbm91dmVhdV9mZW5jZSAqZmVuY2U7Ci0JdW5zaWduZWQgbG9uZyBucGFnZXM7
Ci0JZG1hX2FkZHJfdCAqZG1hOwotCXVuc2lnbmVkIGxvbmcgZG1hX25yOwotfTsKLQogc3RhdGlj
IHVuc2lnbmVkIGxvbmcgbm91dmVhdV9kbWVtX3BhZ2VfYWRkcihzdHJ1Y3QgcGFnZSAqcGFnZSkK
IHsKIAlzdHJ1Y3Qgbm91dmVhdV9kbWVtX2NodW5rICpjaHVuayA9IHBhZ2UtPnpvbmVfZGV2aWNl
X2RhdGE7CkBAIC01NjksMTMxICs1NTgsNjcgQEAgbm91dmVhdV9kbWVtX2luaXQoc3RydWN0IG5v
dXZlYXVfZHJtICpkcm0pCiAJZHJtLT5kbWVtID0gTlVMTDsKIH0KIAotc3RhdGljIHZvaWQKLW5v
dXZlYXVfZG1lbV9taWdyYXRlX2FsbG9jX2FuZF9jb3B5KHN0cnVjdCB2bV9hcmVhX3N0cnVjdCAq
dm1hLAotCQkJCSAgICBjb25zdCB1bnNpZ25lZCBsb25nICpzcmNfcGZucywKLQkJCQkgICAgdW5z
aWduZWQgbG9uZyAqZHN0X3BmbnMsCi0JCQkJICAgIHVuc2lnbmVkIGxvbmcgc3RhcnQsCi0JCQkJ
ICAgIHVuc2lnbmVkIGxvbmcgZW5kLAotCQkJCSAgICBzdHJ1Y3Qgbm91dmVhdV9taWdyYXRlICpt
aWdyYXRlKQorc3RhdGljIHVuc2lnbmVkIGxvbmcgbm91dmVhdV9kbWVtX21pZ3JhdGVfY29weV9v
bmUoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCisJCXN0cnVjdCB2bV9hcmVhX3N0cnVjdCAqdm1h
LCB1bnNpZ25lZCBsb25nIGFkZHIsCisJCXVuc2lnbmVkIGxvbmcgc3JjLCBkbWFfYWRkcl90ICpk
bWFfYWRkcikKIHsKLQlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG1pZ3JhdGUtPmRybTsKIAlz
dHJ1Y3QgZGV2aWNlICpkZXYgPSBkcm0tPmRldi0+ZGV2OwotCXVuc2lnbmVkIGxvbmcgYWRkciwg
aSwgbnBhZ2VzID0gMDsKLQlub3V2ZWF1X21pZ3JhdGVfY29weV90IGNvcHk7Ci0JaW50IHJldDsK
LQotCS8qIEZpcnN0IGFsbG9jYXRlIG5ldyBtZW1vcnkgKi8KLQlmb3IgKGFkZHIgPSBzdGFydCwg
aSA9IDA7IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCBpKyspIHsKLQkJc3RydWN0IHBh
Z2UgKmRwYWdlLCAqc3BhZ2U7Ci0KLQkJZHN0X3BmbnNbaV0gPSAwOwotCQlzcGFnZSA9IG1pZ3Jh
dGVfcGZuX3RvX3BhZ2Uoc3JjX3BmbnNbaV0pOwotCQlpZiAoIXNwYWdlIHx8ICEoc3JjX3BmbnNb
aV0gJiBNSUdSQVRFX1BGTl9NSUdSQVRFKSkKLQkJCWNvbnRpbnVlOwotCi0JCWRwYWdlID0gbm91
dmVhdV9kbWVtX3BhZ2VfYWxsb2NfbG9ja2VkKGRybSk7Ci0JCWlmICghZHBhZ2UpCi0JCQljb250
aW51ZTsKLQotCQlkc3RfcGZuc1tpXSA9IG1pZ3JhdGVfcGZuKHBhZ2VfdG9fcGZuKGRwYWdlKSkg
fAotCQkJICAgICAgTUlHUkFURV9QRk5fTE9DS0VEIHwKLQkJCSAgICAgIE1JR1JBVEVfUEZOX0RF
VklDRTsKLQkJbnBhZ2VzKys7Ci0JfQotCi0JaWYgKCFucGFnZXMpCi0JCXJldHVybjsKLQotCS8q
IEFsbG9jYXRlIHN0b3JhZ2UgZm9yIERNQSBhZGRyZXNzZXMsIHNvIHdlIGNhbiB1bm1hcCBsYXRl
ci4gKi8KLQltaWdyYXRlLT5kbWEgPSBrbWFsbG9jKHNpemVvZigqbWlncmF0ZS0+ZG1hKSAqIG5w
YWdlcywgR0ZQX0tFUk5FTCk7Ci0JaWYgKCFtaWdyYXRlLT5kbWEpCi0JCWdvdG8gZXJyb3I7Ci0J
bWlncmF0ZS0+ZG1hX25yID0gMDsKLQotCS8qIENvcHkgdGhpbmdzIG92ZXIgKi8KLQljb3B5ID0g
ZHJtLT5kbWVtLT5taWdyYXRlLmNvcHlfZnVuYzsKLQlmb3IgKGFkZHIgPSBzdGFydCwgaSA9IDA7
IGFkZHIgPCBlbmQ7IGFkZHIgKz0gUEFHRV9TSVpFLCBpKyspIHsKLQkJc3RydWN0IHBhZ2UgKnNw
YWdlLCAqZHBhZ2U7Ci0KLQkJZHBhZ2UgPSBtaWdyYXRlX3Bmbl90b19wYWdlKGRzdF9wZm5zW2ld
KTsKLQkJaWYgKCFkcGFnZSB8fCBkc3RfcGZuc1tpXSA9PSBNSUdSQVRFX1BGTl9FUlJPUikKLQkJ
CWNvbnRpbnVlOwotCi0JCXNwYWdlID0gbWlncmF0ZV9wZm5fdG9fcGFnZShzcmNfcGZuc1tpXSk7
Ci0JCWlmICghc3BhZ2UgfHwgIShzcmNfcGZuc1tpXSAmIE1JR1JBVEVfUEZOX01JR1JBVEUpKSB7
Ci0JCQlub3V2ZWF1X2RtZW1fcGFnZV9mcmVlX2xvY2tlZChkcm0sIGRwYWdlKTsKLQkJCWRzdF9w
Zm5zW2ldID0gMDsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KLQkJbWlncmF0ZS0+ZG1hW21pZ3JhdGUt
PmRtYV9ucl0gPQotCQkJZG1hX21hcF9wYWdlX2F0dHJzKGRldiwgc3BhZ2UsIDAsIFBBR0VfU0la
RSwKLQkJCQkJICAgUENJX0RNQV9CSURJUkVDVElPTkFMLAotCQkJCQkgICBETUFfQVRUUl9TS0lQ
X0NQVV9TWU5DKTsKLQkJaWYgKGRtYV9tYXBwaW5nX2Vycm9yKGRldiwgbWlncmF0ZS0+ZG1hW21p
Z3JhdGUtPmRtYV9ucl0pKSB7Ci0JCQlub3V2ZWF1X2RtZW1fcGFnZV9mcmVlX2xvY2tlZChkcm0s
IGRwYWdlKTsKLQkJCWRzdF9wZm5zW2ldID0gMDsKLQkJCWNvbnRpbnVlOwotCQl9Ci0KLQkJcmV0
ID0gY29weShkcm0sIDEsIE5PVVZFQVVfQVBFUl9WUkFNLAotCQkJCW5vdXZlYXVfZG1lbV9wYWdl
X2FkZHIoZHBhZ2UpLAotCQkJCU5PVVZFQVVfQVBFUl9IT1NULAotCQkJCW1pZ3JhdGUtPmRtYVtt
aWdyYXRlLT5kbWFfbnIrK10pOwotCQlpZiAocmV0KSB7Ci0JCQlub3V2ZWF1X2RtZW1fcGFnZV9m
cmVlX2xvY2tlZChkcm0sIGRwYWdlKTsKLQkJCWRzdF9wZm5zW2ldID0gMDsKLQkJCWNvbnRpbnVl
OwotCQl9Ci0JfQorCXN0cnVjdCBwYWdlICpkcGFnZSwgKnNwYWdlOwogCi0Jbm91dmVhdV9mZW5j
ZV9uZXcoZHJtLT5kbWVtLT5taWdyYXRlLmNoYW4sIGZhbHNlLCAmbWlncmF0ZS0+ZmVuY2UpOwor
CXNwYWdlID0gbWlncmF0ZV9wZm5fdG9fcGFnZShzcmMpOworCWlmICghc3BhZ2UgfHwgIShzcmMg
JiBNSUdSQVRFX1BGTl9NSUdSQVRFKSkKKwkJZ290byBvdXQ7CiAKLQlyZXR1cm47CisJZHBhZ2Ug
PSBub3V2ZWF1X2RtZW1fcGFnZV9hbGxvY19sb2NrZWQoZHJtKTsKKwlpZiAoIWRwYWdlKQorCQly
ZXR1cm4gMDsKIAotZXJyb3I6Ci0JZm9yIChhZGRyID0gc3RhcnQsIGkgPSAwOyBhZGRyIDwgZW5k
OyBhZGRyICs9IFBBR0VfU0laRSwgKytpKSB7Ci0JCXN0cnVjdCBwYWdlICpwYWdlOworCSpkbWFf
YWRkciA9IGRtYV9tYXBfcGFnZShkZXYsIHNwYWdlLCAwLCBQQUdFX1NJWkUsIERNQV9CSURJUkVD
VElPTkFMKTsKKwlpZiAoZG1hX21hcHBpbmdfZXJyb3IoZGV2LCAqZG1hX2FkZHIpKQorCQlnb3Rv
IG91dF9mcmVlX3BhZ2U7CiAKLQkJaWYgKCFkc3RfcGZuc1tpXSB8fCBkc3RfcGZuc1tpXSA9PSBN
SUdSQVRFX1BGTl9FUlJPUikKLQkJCWNvbnRpbnVlOworCWlmIChkcm0tPmRtZW0tPm1pZ3JhdGUu
Y29weV9mdW5jKGRybSwgMSwgTk9VVkVBVV9BUEVSX1ZSQU0sCisJCQlub3V2ZWF1X2RtZW1fcGFn
ZV9hZGRyKGRwYWdlKSwgTk9VVkVBVV9BUEVSX0hPU1QsCisJCQkqZG1hX2FkZHIpKQorCQlnb3Rv
IG91dF9kbWFfdW5tYXA7CiAKLQkJcGFnZSA9IG1pZ3JhdGVfcGZuX3RvX3BhZ2UoZHN0X3BmbnNb
aV0pOwotCQlkc3RfcGZuc1tpXSA9IE1JR1JBVEVfUEZOX0VSUk9SOwotCQlpZiAocGFnZSA9PSBO
VUxMKQotCQkJY29udGludWU7CisJcmV0dXJuIG1pZ3JhdGVfcGZuKHBhZ2VfdG9fcGZuKGRwYWdl
KSkgfAorCQlNSUdSQVRFX1BGTl9MT0NLRUQgfCBNSUdSQVRFX1BGTl9ERVZJQ0U7CiAKLQkJX19m
cmVlX3BhZ2UocGFnZSk7Ci0JfQorb3V0X2RtYV91bm1hcDoKKwlkbWFfdW5tYXBfcGFnZShkZXYs
ICpkbWFfYWRkciwgUEFHRV9TSVpFLCBETUFfQklESVJFQ1RJT05BTCk7CitvdXRfZnJlZV9wYWdl
OgorCW5vdXZlYXVfZG1lbV9wYWdlX2ZyZWVfbG9ja2VkKGRybSwgZHBhZ2UpOworb3V0OgorCXJl
dHVybiAwOwogfQogCi1zdGF0aWMgdm9pZAotbm91dmVhdV9kbWVtX21pZ3JhdGVfZmluYWxpemVf
YW5kX21hcChzdHJ1Y3Qgbm91dmVhdV9taWdyYXRlICptaWdyYXRlKQorc3RhdGljIHZvaWQgbm91
dmVhdV9kbWVtX21pZ3JhdGVfY2h1bmsoc3RydWN0IG1pZ3JhdGVfdm1hICphcmdzLAorCQlzdHJ1
Y3Qgbm91dmVhdV9kcm0gKmRybSwgZG1hX2FkZHJfdCAqZG1hX2FkZHJzKQogewotCXN0cnVjdCBu
b3V2ZWF1X2RybSAqZHJtID0gbWlncmF0ZS0+ZHJtOworCXN0cnVjdCBub3V2ZWF1X2ZlbmNlICpm
ZW5jZTsKKwl1bnNpZ25lZCBsb25nIGFkZHIgPSBhcmdzLT5zdGFydCwgbnJfZG1hID0gMCwgaTsK
KworCWZvciAoaSA9IDA7IGFkZHIgPCBhcmdzLT5lbmQ7IGkrKykgeworCQlhcmdzLT5kc3RbaV0g
PSBub3V2ZWF1X2RtZW1fbWlncmF0ZV9jb3B5X29uZShkcm0sIGFyZ3MtPnZtYSwKKwkJCQlhZGRy
LCBhcmdzLT5zcmNbaV0sICZkbWFfYWRkcnNbbnJfZG1hXSk7CisJCWlmIChhcmdzLT5kc3RbaV0p
CisJCQlucl9kbWErKzsKKwkJYWRkciArPSBQQUdFX1NJWkU7CisJfQogCi0Jbm91dmVhdV9kbWVt
X2ZlbmNlX2RvbmUoJm1pZ3JhdGUtPmZlbmNlKTsKKwlub3V2ZWF1X2ZlbmNlX25ldyhkcm0tPmRt
ZW0tPm1pZ3JhdGUuY2hhbiwgZmFsc2UsICZmZW5jZSk7CisJbWlncmF0ZV92bWFfcGFnZXMoYXJn
cyk7CisJbm91dmVhdV9kbWVtX2ZlbmNlX2RvbmUoJmZlbmNlKTsKIAotCXdoaWxlIChtaWdyYXRl
LT5kbWFfbnItLSkgewotCQlkbWFfdW5tYXBfcGFnZShkcm0tPmRldi0+ZGV2LCBtaWdyYXRlLT5k
bWFbbWlncmF0ZS0+ZG1hX25yXSwKLQkJCSAgICAgICBQQUdFX1NJWkUsIFBDSV9ETUFfQklESVJF
Q1RJT05BTCk7CisJd2hpbGUgKG5yX2RtYS0tKSB7CisJCWRtYV91bm1hcF9wYWdlKGRybS0+ZGV2
LT5kZXYsIGRtYV9hZGRyc1tucl9kbWFdLCBQQUdFX1NJWkUsCisJCQkJRE1BX0JJRElSRUNUSU9O
QUwpOwogCX0KLQlrZnJlZShtaWdyYXRlLT5kbWEpOwotCiAJLyoKLQkgKiBGSVhNRSBvcHRpbWl6
YXRpb246IHVwZGF0ZSBHUFUgcGFnZSB0YWJsZSB0byBwb2ludCB0byBuZXdseQotCSAqIG1pZ3Jh
dGVkIG1lbW9yeS4KKwkgKiBGSVhNRSBvcHRpbWl6YXRpb246IHVwZGF0ZSBHUFUgcGFnZSB0YWJs
ZSB0byBwb2ludCB0byBuZXdseSBtaWdyYXRlZAorCSAqIG1lbW9yeS4KIAkgKi8KLX0KLQotc3Rh
dGljIHZvaWQgbm91dmVhdV9kbWVtX21pZ3JhdGVfY2h1bmsoc3RydWN0IG1pZ3JhdGVfdm1hICph
cmdzLAotCQlzdHJ1Y3Qgbm91dmVhdV9taWdyYXRlICptaWdyYXRlKQotewotCW5vdXZlYXVfZG1l
bV9taWdyYXRlX2FsbG9jX2FuZF9jb3B5KGFyZ3MtPnZtYSwgYXJncy0+c3JjLCBhcmdzLT5kc3Qs
Ci0JCQlhcmdzLT5zdGFydCwgYXJncy0+ZW5kLCBtaWdyYXRlKTsKLQltaWdyYXRlX3ZtYV9wYWdl
cyhhcmdzKTsKLQlub3V2ZWF1X2RtZW1fbWlncmF0ZV9maW5hbGl6ZV9hbmRfbWFwKG1pZ3JhdGUp
OwogCW1pZ3JhdGVfdm1hX2ZpbmFsaXplKGFyZ3MpOwogfQogCkBAIC03MDUsMzggKzYzMCw0MCBA
QCBub3V2ZWF1X2RtZW1fbWlncmF0ZV92bWEoc3RydWN0IG5vdXZlYXVfZHJtICpkcm0sCiB7CiAJ
dW5zaWduZWQgbG9uZyBucGFnZXMgPSAoZW5kIC0gc3RhcnQpID4+IFBBR0VfU0hJRlQ7CiAJdW5z
aWduZWQgbG9uZyBtYXggPSBtaW4oU0dfTUFYX1NJTkdMRV9BTExPQywgbnBhZ2VzKTsKKwlkbWFf
YWRkcl90ICpkbWFfYWRkcnM7CiAJc3RydWN0IG1pZ3JhdGVfdm1hIGFyZ3MgPSB7CiAJCS52bWEJ
CT0gdm1hLAogCQkuc3RhcnQJCT0gc3RhcnQsCiAJfTsKLQlzdHJ1Y3Qgbm91dmVhdV9taWdyYXRl
IG1pZ3JhdGUgPSB7Ci0JCS5kcm0JCT0gZHJtLAotCQkudm1hCQk9IHZtYSwKLQkJLm5wYWdlcwkJ
PSBucGFnZXMsCi0JfTsKIAl1bnNpZ25lZCBsb25nIGMsIGk7CiAJaW50IHJldCA9IC1FTk9NRU07
CiAKLQlhcmdzLnNyYyA9IGt6YWxsb2Moc2l6ZW9mKGxvbmcpICogbWF4LCBHRlBfS0VSTkVMKTsK
KwlhcmdzLnNyYyA9IGtjYWxsb2MobWF4LCBzaXplb2YoYXJncy5zcmMpLCBHRlBfS0VSTkVMKTsK
IAlpZiAoIWFyZ3Muc3JjKQogCQlnb3RvIG91dDsKLQlhcmdzLmRzdCA9IGt6YWxsb2Moc2l6ZW9m
KGxvbmcpICogbWF4LCBHRlBfS0VSTkVMKTsKKwlhcmdzLmRzdCA9IGtjYWxsb2MobWF4LCBzaXpl
b2YoYXJncy5kc3QpLCBHRlBfS0VSTkVMKTsKIAlpZiAoIWFyZ3MuZHN0KQogCQlnb3RvIG91dF9m
cmVlX3NyYzsKIAorCWRtYV9hZGRycyA9IGttYWxsb2NfYXJyYXkobWF4LCBzaXplb2YoKmRtYV9h
ZGRycyksIEdGUF9LRVJORUwpOworCWlmICghZG1hX2FkZHJzKQorCQlnb3RvIG91dF9mcmVlX2Rz
dDsKKwogCWZvciAoaSA9IDA7IGkgPCBucGFnZXM7IGkgKz0gYykgewogCQljID0gbWluKFNHX01B
WF9TSU5HTEVfQUxMT0MsIG5wYWdlcyk7CiAJCWFyZ3MuZW5kID0gc3RhcnQgKyAoYyA8PCBQQUdF
X1NISUZUKTsKIAkJcmV0ID0gbWlncmF0ZV92bWFfc2V0dXAoJmFyZ3MpOwogCQlpZiAocmV0KQot
CQkJZ290byBvdXRfZnJlZV9kc3Q7CisJCQlnb3RvIG91dF9mcmVlX2RtYTsKIAogCQlpZiAoYXJn
cy5jcGFnZXMpCi0JCQlub3V2ZWF1X2RtZW1fbWlncmF0ZV9jaHVuaygmYXJncywgJm1pZ3JhdGUp
OworCQkJbm91dmVhdV9kbWVtX21pZ3JhdGVfY2h1bmsoJmFyZ3MsIGRybSwgZG1hX2FkZHJzKTsK
IAkJYXJncy5zdGFydCA9IGFyZ3MuZW5kOwogCX0KIAogCXJldCA9IDA7CitvdXRfZnJlZV9kbWE6
CisJa2ZyZWUoZG1hX2FkZHJzKTsKIG91dF9mcmVlX2RzdDoKIAlrZnJlZShhcmdzLmRzdCk7CiBv
dXRfZnJlZV9zcmM6Ci0tIAoyLjIwLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQ==
