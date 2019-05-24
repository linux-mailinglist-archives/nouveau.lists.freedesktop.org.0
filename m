Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1AEE029D1E
	for <lists+nouveau@lfdr.de>; Fri, 24 May 2019 19:36:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 797AB89FBC;
	Fri, 24 May 2019 17:35:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 1219 seconds by postgrey-1.36 at gabe;
 Fri, 24 May 2019 17:35:57 UTC
Received: from gateway30.websitewelcome.com (gateway30.websitewelcome.com
 [192.185.193.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 19B7C89E32
 for <nouveau@lists.freedesktop.org>; Fri, 24 May 2019 17:35:57 +0000 (UTC)
Received: from cm16.websitewelcome.com (cm16.websitewelcome.com [100.42.49.19])
 by gateway30.websitewelcome.com (Postfix) with ESMTP id CED48ADFD
 for <nouveau@lists.freedesktop.org>; Fri, 24 May 2019 12:15:37 -0500 (CDT)
Received: from gator4166.hostgator.com ([108.167.133.22]) by cmsmtp with SMTP
 id UDn7hHGzK4FKpUDn7hdRz8; Fri, 24 May 2019 12:15:37 -0500
X-Authority-Reason: nr=8
Received: from [189.250.47.159] (port=51588 helo=embeddedor)
 by gator4166.hostgator.com with esmtpa (Exim 4.91)
 (envelope-from <gustavo@embeddedor.com>)
 id 1hUDn6-002Ami-S9; Fri, 24 May 2019 12:15:36 -0500
Date: Fri, 24 May 2019 12:15:36 -0500
From: "Gustavo A. R. Silva" <gustavo@embeddedor.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>
Message-ID: <20190524171536.GA20883@embeddedor>
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.9.4 (2018-02-28)
X-AntiAbuse: This header was added to track abuse,
 please include it with any abuse report
X-AntiAbuse: Primary Hostname - gator4166.hostgator.com
X-AntiAbuse: Original Domain - lists.freedesktop.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - embeddedor.com
X-BWhitelist: no
X-Source-IP: 189.250.47.159
X-Source-L: No
X-Exim-ID: 1hUDn6-002Ami-S9
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: (embeddedor) [189.250.47.159]:51588
X-Source-Auth: gustavo@embeddedor.com
X-Email-Count: 16
X-Source-Cap: Z3V6aWRpbmU7Z3V6aWRpbmU7Z2F0b3I0MTY2Lmhvc3RnYXRvci5jb20=
X-Local-Domain: yes
Subject: [Nouveau] [PATCH] drm/nouveau/mmu: use struct_size() helper
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
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 "Gustavo A. R. Silva" <gustavo@embeddedor.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

TWFrZSB1c2Ugb2YgdGhlIHN0cnVjdF9zaXplKCkgaGVscGVyIGluc3RlYWQgb2YgYW4gb3Blbi1j
b2RlZCB2ZXJzaW9uCmluIG9yZGVyIHRvIGF2b2lkIGFueSBwb3RlbnRpYWwgdHlwZSBtaXN0YWtl
cywgaW4gcGFydGljdWxhciBpbiB0aGUKY29udGV4dCBpbiB3aGljaCB0aGlzIGNvZGUgaXMgYmVp
bmcgdXNlZC4KClNvLCByZXBsYWNlIHRoZSBmb2xsb3dpbmcgZm9ybToKCnNpemVvZigqa2luZCkg
KyBzaXplb2YoKmtpbmQtPmRhdGEpICogbW11LT5raW5kX25yOwoKd2l0aDoKCnN0cnVjdF9zaXpl
KGtpbmQsIGRhdGEsIG1tdS0+a2luZF9ucikKClRoaXMgY29kZSB3YXMgZGV0ZWN0ZWQgd2l0aCB0
aGUgaGVscCBvZiBDb2NjaW5lbGxlLgoKU2lnbmVkLW9mZi1ieTogR3VzdGF2byBBLiBSLiBTaWx2
YSA8Z3VzdGF2b0BlbWJlZGRlZG9yLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9u
dmlmL21tdS5jIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0aW9uKCspLCAxIGRlbGV0
aW9uKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZpZi9tbXUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252aWYvbW11LmMKaW5kZXggYWUwOGExY2E4MDQ0Li41
NjQxYmRhMjA0NmQgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252aWYvbW11
LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZpZi9tbXUuYwpAQCAtMTEwLDcgKzEx
MCw3IEBAIG52aWZfbW11X2luaXQoc3RydWN0IG52aWZfb2JqZWN0ICpwYXJlbnQsIHMzMiBvY2xh
c3MsIHN0cnVjdCBudmlmX21tdSAqbW11KQogCiAJaWYgKG1tdS0+a2luZF9ucikgewogCQlzdHJ1
Y3QgbnZpZl9tbXVfa2luZF92MCAqa2luZDsKLQkJdTMyIGFyZ2MgPSBzaXplb2YoKmtpbmQpICsg
c2l6ZW9mKCpraW5kLT5kYXRhKSAqIG1tdS0+a2luZF9ucjsKKwkJc2l6ZV90IGFyZ2MgPSBzdHJ1
Y3Rfc2l6ZShraW5kLCBkYXRhLCBtbXUtPmtpbmRfbnIpOwogCiAJCWlmIChyZXQgPSAtRU5PTUVN
LCAhKGtpbmQgPSBrbWFsbG9jKGFyZ2MsIEdGUF9LRVJORUwpKSkKIAkJCWdvdG8gZG9uZTsKLS0g
CjIuMjEuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
