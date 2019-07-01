Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DF7D5B4A5
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70D9989EB1;
	Mon,  1 Jul 2019 06:20:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7ED0489E8C;
 Mon,  1 Jul 2019 06:20:35 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpfz-0002ta-A6; Mon, 01 Jul 2019 06:20:31 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:02 +0200
Message-Id: <20190701062020.19239-5-hch@lst.de>
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
 bh=ha0G2SIX3qJwQBHCJ94hXS+l70ON3HkLuGbICbqpRXk=; b=McY+jahORBX9m/je/bQ6Q38b0
 28WcXEPXZE6Hcjq+4+sHpTWSUUYsygvbEwNrGXLJDRekMZBBLHs2JA6d74Md5I104lXzbV968Av2Z
 J3DQ3Q8m0Co759Cpf29dQlJNwis3r3MTh0SnOtF3FTLzlzDD1UtJcPF1MrRi/lcAYx9uEtoYU6DI1
 zW2v8jIkosACsyQpdiePRz4xMw1/0Q20ytuHFjDVBFY4moXLnh+l4DZt9Ylgq8UV1BYJzXJjsmDli
 YQZuhtMWHmwqMewYBuiuiE9Re+8KsGcSZTxhoYiwxkwOqQWnvw8dyNpA8uGeK74XtpU4V04Cfy3z7
 hn4lvcOUg==;
Subject: [Nouveau] [PATCH 04/22] mm/hmm: support automatic NUMA balancing
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
Cc: Philip Yang <Philip.Yang@amd.com>, linux-nvdimm@lists.01.org,
 linux-pci@vger.kernel.org, Felix Kuehling <Felix.Kuehling@amd.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, nouveau@lists.freedesktop.org,
 Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogUGhpbGlwIFlhbmcgPFBoaWxpcC5ZYW5nQGFtZC5jb20+CgpXaGlsZSB0aGUgcGFnZSBp
cyBtaWdyYXRpbmcgYnkgTlVNQSBiYWxhbmNpbmcsIEhNTSBmYWlsZWQgdG8gZGV0ZWN0IHRoaXMK
Y29uZGl0aW9uIGFuZCBzdGlsbCByZXR1cm4gdGhlIG9sZCBwYWdlLiBBcHBsaWNhdGlvbiB3aWxs
IHVzZSB0aGUgbmV3IHBhZ2UKbWlncmF0ZWQsIGJ1dCBkcml2ZXIgcGFzcyB0aGUgb2xkIHBhZ2Ug
cGh5c2ljYWwgYWRkcmVzcyB0byBHUFUsIHRoaXMgY3Jhc2gKdGhlIGFwcGxpY2F0aW9uIGxhdGVy
LgoKVXNlIHB0ZV9wcm90bm9uZShwdGUpIHRvIHJldHVybiB0aGlzIGNvbmRpdGlvbiBhbmQgdGhl
biBobW1fdm1hX2RvX2ZhdWx0CndpbGwgYWxsb2NhdGUgbmV3IHBhZ2UuCgpTaWduZWQtb2ZmLWJ5
OiBQaGlsaXAgWWFuZyA8UGhpbGlwLllhbmdAYW1kLmNvbT4KU2lnbmVkLW9mZi1ieTogRmVsaXgg
S3VlaGxpbmcgPEZlbGl4Lkt1ZWhsaW5nQGFtZC5jb20+ClJldmlld2VkLWJ5OiBKw6lyw7RtZSBH
bGlzc2UgPGpnbGlzc2VAcmVkaGF0LmNvbT4KU2lnbmVkLW9mZi1ieTogSmFzb24gR3VudGhvcnBl
IDxqZ2dAbWVsbGFub3guY29tPgotLS0KIG1tL2htbS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQs
IDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvbW0vaG1tLmMgYi9t
bS9obW0uYwppbmRleCA0ZGI1ZGNmMTEwYmEuLmRjZTRlNzBlNjQ4YSAxMDA2NDQKLS0tIGEvbW0v
aG1tLmMKKysrIGIvbW0vaG1tLmMKQEAgLTU0OCw3ICs1NDgsNyBAQCBzdGF0aWMgaW50IGhtbV92
bWFfaGFuZGxlX3BtZChzdHJ1Y3QgbW1fd2FsayAqd2FsaywKIAogc3RhdGljIGlubGluZSB1aW50
NjRfdCBwdGVfdG9faG1tX3Bmbl9mbGFncyhzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSwgcHRlX3Qg
cHRlKQogewotCWlmIChwdGVfbm9uZShwdGUpIHx8ICFwdGVfcHJlc2VudChwdGUpKQorCWlmIChw
dGVfbm9uZShwdGUpIHx8ICFwdGVfcHJlc2VudChwdGUpIHx8IHB0ZV9wcm90bm9uZShwdGUpKQog
CQlyZXR1cm4gMDsKIAlyZXR1cm4gcHRlX3dyaXRlKHB0ZSkgPyByYW5nZS0+ZmxhZ3NbSE1NX1BG
Tl9WQUxJRF0gfAogCQkJCXJhbmdlLT5mbGFnc1tITU1fUEZOX1dSSVRFXSA6Ci0tIAoyLjIwLjEK
Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUg
bWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
