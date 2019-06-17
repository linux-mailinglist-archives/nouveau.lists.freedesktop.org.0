Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F66E48202
	for <lists+nouveau@lfdr.de>; Mon, 17 Jun 2019 14:27:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2782E890EF;
	Mon, 17 Jun 2019 12:27:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from bombadil.infradead.org (bombadil.infradead.org
 [IPv6:2607:7c80:54:e::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8354890EF;
 Mon, 17 Jun 2019 12:27:44 +0000 (UTC)
Received: from clnet-p19-102.ikbnet.co.at ([83.175.77.102] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.92 #3 (Red Hat Linux))
 id 1hcqjZ-0008K6-5z; Mon, 17 Jun 2019 12:27:37 +0000
From: Christoph Hellwig <hch@lst.de>
To: Dan Williams <dan.j.williams@intel.com>,
 =?UTF-8?q?J=C3=A9r=C3=B4me=20Glisse?= <jglisse@redhat.com>,
 Jason Gunthorpe <jgg@mellanox.com>, Ben Skeggs <bskeggs@redhat.com>
Date: Mon, 17 Jun 2019 14:27:08 +0200
Message-Id: <20190617122733.22432-1-hch@lst.de>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt;
 c=relaxed/relaxed; 
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IiaLcJALEKaB7Li7OAHwGVaUV7J5HHtfGyRFzVhVT5I=; b=nRxanBbFaXKRrfonPCdCK8x8a
 H13NLWpT/FYGEMhPawtjpKXuuFd5AsVGls0FU/bFblMxeQyfmVpGkj8pGsbrVCCWMJWTllTMnGpqR
 lLvHY6XYJAnUlu8naiV+ey/kfflUSIzdOe46iLEfPoDAcpWQgUXfY+Hmls32zlkAUygawRFXkMCHP
 wYZFnLlYcqST58xEgFnwklfAMQdGemLG8MCW+sf8MPt5vq44TqtytxlspPlDutukXjQTeeXjgmomc
 DBnAvx70XsOhTxq4s1gUZqpsTkLMt1yioXaF7KDQUOS+v7Psp7YyIakjW17TKDyANImlYyLvulA8s
 Kdy4HvCiw==;
Subject: [Nouveau] dev_pagemap related cleanups v2
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

SGkgRGFuLCBKw6lyw7RtZSBhbmQgSmFzb24sCgpiZWxvdyBpcyBhIHNlcmllcyB0aGF0IGNsZWFu
cyB1cCB0aGUgZGV2X3BhZ2VtYXAgaW50ZXJmYWNlIHNvIHRoYXQKaXQgaXMgbW9yZSBlYXNpbHkg
dXNhYmxlLCB3aGljaCByZW1vdmVzIHRoZSBuZWVkIHRvIHdyYXAgaXQgaW4gaG1tCmFuZCB0aHVz
IGFsbG93aW5nIHRvIGtpbGwgYSBsb3Qgb2YgY29kZQoKTm90ZTogdGhpcyBzZXJpZXMgaXMgb24g
dG9wIG9mIHRoZSByZG1hL2htbSBicmFuY2ggKyB0aGUgZGV2X3BhZ2VtYXAKcmVsZWFzIGZpeCBz
ZXJpZXMgZnJvbSBEYW4gdGhhdCB3ZW50IGludG8gNS4yLXJjNS4KCkdpdCB0cmVlOgoKICAgIGdp
dDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdCBobW0tZGV2bWVtLWNsZWFu
dXAuMgoKR2l0d2ViOgoKICAgIGh0dHA6Ly9naXQuaW5mcmFkZWFkLm9yZy91c2Vycy9oY2gvbWlz
Yy5naXQvc2hvcnRsb2cvcmVmcy9oZWFkcy9obW0tZGV2bWVtLWNsZWFudXAuMgoKQ2hhbmdlcyBz
aW5jZSB2MToKIC0gcmViYXNlCiAtIGFsc28gc3dpdGNoIHAycGRtYSB0byB0aGUgaW50ZXJuYWwg
cmVmY291bnQKIC0gYWRkIHR5cGUgY2hlY2tpbmcgZm9yIHBnbWFwLT50eXBlCiAtIHJlbmFtZSB0
aGUgbWlncmF0ZSBtZXRob2QgdG8gbWlncmF0ZV90b19yYW0KIC0gY2xlYW51cCB0aGUgYWx0bWFw
X3ZhbGlkIGZsYWcKIC0gdmFyaW91cyB0aWRiaXRzIGZyb20gdGhlIHJldmlld3MKX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
