Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ABDEC5B4C2
	for <lists+nouveau@lfdr.de>; Mon,  1 Jul 2019 08:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F289F47;
	Mon,  1 Jul 2019 06:21:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E14E389F43;
 Mon,  1 Jul 2019 06:21:00 +0000 (UTC)
Received: from [46.140.178.35] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hhpgO-00034k-I0; Mon, 01 Jul 2019 06:20:57 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon,  1 Jul 2019 08:20:13 +0200
Message-Id: <20190701062020.19239-16-hch@lst.de>
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
 bh=K+5Y7Ez4pfTMCmPiyIGRChGh4O04+aapHsZzDHBkVJo=; b=PSbfEnpLRE8SG9bLML+fRlhf0
 HtVXUwpI1yGra8E8q+rwV6qJm4ONJSDzOZ753xm3ERQHmxUjdhHbZaiUebewXGu/ryXEdIqi7spGD
 Nlr6XlnU/i9TC0WMqh3qrx9cT7ITHZkOAeu54JXvWWQ2MaeC+xjlwX/7+GOXnST0/kVvSEpc1HmW/
 hO3augHviB0cDdLARWF6uP/j90BGjEpU45QJHn+ssAOFsyOrVWV8bsQFxpmwUu7D3kHoTQPtfD/+9
 h1Gpz4y5W71lm5fa5MIvKeZct6x0kCAYyPKLWFw3cLp1onhIVhjCvfTwvaeENThWQJ0FWVoyh0659
 oBUZxg5rA==;
Subject: [Nouveau] [PATCH 15/22] mm/hmm: Poison hmm_range during unregister
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
 linux-mm@kvack.org, Souptick Joarder <jrdr.linux@gmail.com>,
 nouveau@lists.freedesktop.org, Ira Weiny <ira.weiny@intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPgoKVHJ5aW5nIHRvIG1pc3Vz
ZSBhIHJhbmdlIG91dHNpZGUgaXRzIGxpZmV0aW1lIGlzIGEga2VybmVsIGJ1Zy4gVXNlIHBvaXNv
bgpieXRlcyB0byBoZWxwIGRldGVjdCB0aGlzIGNvbmRpdGlvbi4gRG91YmxlIHVucmVnaXN0ZXIg
d2lsbCByZWxpYWJseSBjcmFzaC4KClNpZ25lZC1vZmYtYnk6IEphc29uIEd1bnRob3JwZSA8amdn
QG1lbGxhbm94LmNvbT4KUmV2aWV3ZWQtYnk6IErDqXLDtG1lIEdsaXNzZSA8amdsaXNzZUByZWRo
YXQuY29tPgpSZXZpZXdlZC1ieTogSm9obiBIdWJiYXJkIDxqaHViYmFyZEBudmlkaWEuY29tPgpB
Y2tlZC1ieTogU291cHRpY2sgSm9hcmRlciA8anJkci5saW51eEBnbWFpbC5jb20+ClJldmlld2Vk
LWJ5OiBSYWxwaCBDYW1wYmVsbCA8cmNhbXBiZWxsQG52aWRpYS5jb20+ClJldmlld2VkLWJ5OiBJ
cmEgV2VpbnkgPGlyYS53ZWlueUBpbnRlbC5jb20+ClRlc3RlZC1ieTogUGhpbGlwIFlhbmcgPFBo
aWxpcC5ZYW5nQGFtZC5jb20+Ci0tLQogbW0vaG1tLmMgfCAxNCArKysrKysrKy0tLS0tLQogMSBm
aWxlIGNoYW5nZWQsIDggaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9tbS9obW0uYyBiL21tL2htbS5jCmluZGV4IDJlZjE0YjJiNTUwNS4uYzMwYWE5NDAzZGJlIDEw
MDY0NAotLS0gYS9tbS9obW0uYworKysgYi9tbS9obW0uYwpAQCAtOTI1LDE5ICs5MjUsMjEgQEAg
dm9pZCBobW1fcmFuZ2VfdW5yZWdpc3RlcihzdHJ1Y3QgaG1tX3JhbmdlICpyYW5nZSkKIHsKIAlz
dHJ1Y3QgaG1tICpobW0gPSByYW5nZS0+aG1tOwogCi0JLyogU2FuaXR5IGNoZWNrIHRoaXMgcmVh
bGx5IHNob3VsZCBub3QgaGFwcGVuLiAqLwotCWlmIChobW0gPT0gTlVMTCB8fCByYW5nZS0+ZW5k
IDw9IHJhbmdlLT5zdGFydCkKLQkJcmV0dXJuOwotCiAJbXV0ZXhfbG9jaygmaG1tLT5sb2NrKTsK
IAlsaXN0X2RlbF9pbml0KCZyYW5nZS0+bGlzdCk7CiAJbXV0ZXhfdW5sb2NrKCZobW0tPmxvY2sp
OwogCiAJLyogRHJvcCByZWZlcmVuY2UgdGFrZW4gYnkgaG1tX3JhbmdlX3JlZ2lzdGVyKCkgKi8K
LQlyYW5nZS0+dmFsaWQgPSBmYWxzZTsKIAltbXB1dChobW0tPm1tKTsKIAlobW1fcHV0KGhtbSk7
Ci0JcmFuZ2UtPmhtbSA9IE5VTEw7CisKKwkvKgorCSAqIFRoZSByYW5nZSBpcyBub3cgaW52YWxp
ZCBhbmQgdGhlIHJlZiBvbiB0aGUgaG1tIGlzIGRyb3BwZWQsIHNvCisJICogcG9pc29uIHRoZSBw
b2ludGVyLiAgTGVhdmUgb3RoZXIgZmllbGRzIGluIHBsYWNlLCBmb3IgdGhlIGNhbGxlcidzCisJ
ICogdXNlLgorCSAqLworCXJhbmdlLT52YWxpZCA9IGZhbHNlOworCW1lbXNldCgmcmFuZ2UtPmht
bSwgUE9JU09OX0lOVVNFLCBzaXplb2YocmFuZ2UtPmhtbSkpOwogfQogRVhQT1JUX1NZTUJPTCho
bW1fcmFuZ2VfdW5yZWdpc3Rlcik7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
