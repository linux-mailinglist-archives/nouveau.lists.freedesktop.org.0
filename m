Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC9B5B4B4
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:20:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2E92F89ED3;
	Mon,  1 Jul 2019 06:20:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ADF89EB7;
 Mon,  1 Jul 2019 06:20:48 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgC-0002z3-Um; Mon, 01 Jul 2019 06:20:45 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:08 +0200
Message-Id: <20190701062020.19239-11-hch@lst.de>
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
 bh=bXqDiAvJQco6LqrLgE2xZQsqez3vWo2ZZ+dsCe1H1Ss=; b=MG3bxxRoYFqyzGKH+nrS8kwcHT
 y4aRjpQDTsEzCm695PnLVWV4y3Nrb7KXmkZHwkZH2ZSo+YGrZHifwDp5/3N2Q85v6ZTpB83rmHwSW
 2ZYA10EnLDTDWXHbqkWUJeCn12MZ76qYKsC8+eAoddv6/nO+8gFJtGrc/IScul0oIOi3hf/6zHlwR
 rA11CIUIt645tmGyq0jk63+C0aXj84m1y56+nvvBKt4o888CTQnsLXmPb0sMZMQWQabg0JYeoJ6lX
 YpLjzVCN9DpjKikQ+fmNMiIAg0IoiKxuPWZjAs+0qiOKMAUokvMS59FUFc+SETnlDJlxowjQF7kaz
 87AtjB8g==;
Subject: [Nouveau] [PATCH 10/22] mm/hmm: Remove duplicate condition test
 before wait_event_timeout
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
Cc: Philip Yang <Philip.Yang@amd.com>, Ralph Campbell <rcampbell@nvidia.com>,
 linux-nvdimm@lists.01.org, linux-pci@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVGhlIHdhaXRfZXZlbnRf
dGltZW91dCBtYWNybyBhbHJlYWR5IHRlc3RzIHRoZSBjb25kaXRpb24gYXMgaXRzIGZpcnN0CmFj
dGlvbiwgc28gdGhlcmUgaXMgbm8gcmVhc29uIHRvIG9wZW4gY29kZSBhbm90aGVyIHZlcnNpb24g
b2YgdGhpcywgYWxsCnRoYXQgZG9lcyBpcyBza2lwIHRoZSBtaWdodF9zbGVlcCgpIGRlYnVnZ2lu
ZyBpbiBjb21tb24gY2FzZXMsIHdoaWNoIGlzCm5vdCBoZWxwZnVsLgoKRnVydGhlciwgYmFzZWQg
b24gcHJpb3IgcGF0Y2hlcywgd2UgY2FuIG5vdyBzaW1wbGlmeSB0aGUgcmVxdWlyZWQgY29uZGl0
aW9uCnRlc3Q6CiAtIElmIHJhbmdlIGlzIHZhbGlkIG1lbW9yeSB0aGVuIHNvIGlzIHJhbmdlLT5o
bW0KIC0gSWYgaG1tX3JlbGVhc2UoKSBoYXMgcnVuIHRoZW4gcmFuZ2UtPnZhbGlkIGlzIHNldCB0
byBmYWxzZQogICBhdCB0aGUgc2FtZSB0aW1lIGFzIGRlYWQsIHNvIG5vIHJlYXNvbiB0byBjaGVj
ayBib3RoLgogLSBBIHZhbGlkIGhtbSBoYXMgYSB2YWxpZCBobW0tPm1tLgoKQWxsb3dpbmcgdGhl
IHJldHVybiB2YWx1ZSBvZiB3YWl0X2V2ZW50X3RpbWVvdXQoKSAoYWxvbmcgd2l0aCBpdHMgaW50
ZXJuYWwKYmFycmllcnMpIHRvIGNvbXB1dGUgdGhlIHJlc3VsdCBvZiB0aGUgZnVuY3Rpb24uCgpT
aWduZWQtb2ZmLWJ5OiBKYXNvbiBHdW50aG9ycGUgPGpnZ0BtZWxsYW5veC5jb20+ClJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBK
b2huIEh1YmJhcmQgPGpodWJiYXJkQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJcmEgV2Vpbnkg
PGlyYS53ZWlueUBpbnRlbC5jb20+ClJldmlld2VkLWJ5OiBDaHJpc3RvcGggSGVsbHdpZyA8aGNo
QGxzdC5kZT4KVGVzdGVkLWJ5OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KLS0t
CiBpbmNsdWRlL2xpbnV4L2htbS5oIHwgMTMgKystLS0tLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQs
IDIgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvaW5jbHVkZS9s
aW51eC9obW0uaCBiL2luY2x1ZGUvbGludXgvaG1tLmgKaW5kZXggMWQ5N2I2ZDYyYzViLi4yNmU3
YzQ3NzQ5MGMgMTAwNjQ0Ci0tLSBhL2luY2x1ZGUvbGludXgvaG1tLmgKKysrIGIvaW5jbHVkZS9s
aW51eC9obW0uaApAQCAtMjA5LDE3ICsyMDksOCBAQCBzdGF0aWMgaW5saW5lIHVuc2lnbmVkIGxv
bmcgaG1tX3JhbmdlX3BhZ2Vfc2l6ZShjb25zdCBzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIHN0
YXRpYyBpbmxpbmUgYm9vbCBobW1fcmFuZ2Vfd2FpdF91bnRpbF92YWxpZChzdHJ1Y3QgaG1tX3Jh
bmdlICpyYW5nZSwKIAkJCQkJICAgICAgdW5zaWduZWQgbG9uZyB0aW1lb3V0KQogewotCS8qIENo
ZWNrIGlmIG1tIGlzIGRlYWQgPyAqLwotCWlmIChyYW5nZS0+aG1tID09IE5VTEwgfHwgcmFuZ2Ut
PmhtbS0+ZGVhZCB8fCByYW5nZS0+aG1tLT5tbSA9PSBOVUxMKSB7Ci0JCXJhbmdlLT52YWxpZCA9
IGZhbHNlOwotCQlyZXR1cm4gZmFsc2U7Ci0JfQotCWlmIChyYW5nZS0+dmFsaWQpCi0JCXJldHVy
biB0cnVlOwotCXdhaXRfZXZlbnRfdGltZW91dChyYW5nZS0+aG1tLT53cSwgcmFuZ2UtPnZhbGlk
IHx8IHJhbmdlLT5obW0tPmRlYWQsCi0JCQkgICBtc2Vjc190b19qaWZmaWVzKHRpbWVvdXQpKTsK
LQkvKiBSZXR1cm4gY3VycmVudCB2YWxpZCBzdGF0dXMganVzdCBpbiBjYXNlIHdlIGdldCBsdWNr
eSAqLwotCXJldHVybiByYW5nZS0+dmFsaWQ7CisJcmV0dXJuIHdhaXRfZXZlbnRfdGltZW91dChy
YW5nZS0+aG1tLT53cSwgcmFuZ2UtPnZhbGlkLAorCQkJCSAgbXNlY3NfdG9famlmZmllcyh0aW1l
b3V0KSkgIT0gMDsKIH0KIAogLyoKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1
