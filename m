Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAB223B50FD
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 041CF6E12E;
	Sun, 27 Jun 2021 03:34:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA2F6E1F6;
 Tue, 15 Jun 2021 03:16:12 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.55])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G3tg04CqHz6yQb;
 Tue, 15 Jun 2021 11:13:00 +0800 (CST)
Received: from dggpemm500016.china.huawei.com (7.185.36.25) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 11:16:09 +0800
Received: from huawei.com (10.67.174.205) by dggpemm500016.china.huawei.com
 (7.185.36.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2176.2; Tue, 15 Jun
 2021 11:16:08 +0800
From: Chen Jiahao <chenjiahao16@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>, <nikola.cornij@amd.com>,
 <ville.syrjala@linux.intel.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>, <linux-kernel@vger.kernel.org>
Date: Tue, 15 Jun 2021 11:16:58 +0800
Message-ID: <20210615031658.176218-1-chenjiahao16@huawei.com>
X-Mailer: git-send-email 2.31.1
MIME-Version: 1.0
X-Originating-IP: [10.67.174.205]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpemm500016.china.huawei.com (7.185.36.25)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: [Nouveau] [PATCH] drm: nouveau: fix nouveau_backlight compiling
 error
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Cc: chenjiahao16@huawei.com, heying24@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhlcmUgaXMgYSBjb21waWxpbmcgZXJyb3IgaW4gZGlzcC5jIHdoaWxlIG5vdCBzZWxlY3RpbmcK
Q09ORklHX0RSTV9OT1VWRUFVX0JBQ0tMSUdIVDoKCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rp
c3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24g4oCYbnY1MF9zb3JfYXRvbWljX2Rpc2FibGXigJk6
CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxNjY1OjUyOiBlcnJvcjoK
4oCYc3RydWN0IG5vdXZlYXVfY29ubmVjdG9y4oCZIGhhcyBubyBtZW1iZXIgbmFtZWQg4oCYYmFj
a2xpZ2h04oCZCiAxNjY1IHwgIHN0cnVjdCBub3V2ZWF1X2JhY2tsaWdodCAqYmFja2xpZ2h0ID0g
bnZfY29ubmVjdG9yLT5iYWNrbGlnaHQ7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICAgICAgICAgICAgXn4KZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jOjE2NzA6Mjg6IGVycm9yOiBkZXJlZmVyZW5jaW5nIHBvaW50ZXIKdG8gaW5j
b21wbGV0ZSB0eXBlIOKAmHN0cnVjdCBub3V2ZWF1X2JhY2tsaWdodOKAmQogMTY3MCB8ICBpZiAo
YmFja2xpZ2h0ICYmIGJhY2tsaWdodC0+dXNlc19kcGNkKSB7CiAgICAgIHwgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgXn4KClRoZSBwcm9ibGVtIGlzIHNvbHZlZCBieSBhZGRpbmcgdGhlIENP
TkZJR19EUk1fTk9VVkVBVV9CQUNLTElHSFQgZGVwZW5kZW5jeQp3aGVyZSBzdHJ1Y3Qgbm91dmVh
dV9iYWNrbGlnaHQgaXMgdXNlZC4KClNpZ25lZC1vZmYtYnk6IENoZW4gSmlhaGFvIDxjaGVuamlh
aGFvMTZAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9k
aXNwLmMgfCA0ICsrKysKIDEgZmlsZSBjaGFuZ2VkLCA0IGluc2VydGlvbnMoKykKCmRpZmYgLS1n
aXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dw
dS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggMDkzZTFmNzE2M2IzLi5kMjY2Yjc3
MjFlMjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKQEAgLTE2NjIs
MTcgKzE2NjIsMjEgQEAgbnY1MF9zb3JfYXRvbWljX2Rpc2FibGUoc3RydWN0IGRybV9lbmNvZGVy
ICplbmNvZGVyLCBzdHJ1Y3QgZHJtX2F0b21pY19zdGF0ZSAqc3QKIAlzdHJ1Y3Qgbm91dmVhdV9k
cm0gKmRybSA9IG5vdXZlYXVfZHJtKG52X2VuY29kZXItPmJhc2UuYmFzZS5kZXYpOwogCXN0cnVj
dCBub3V2ZWF1X2NydGMgKm52X2NydGMgPSBub3V2ZWF1X2NydGMobnZfZW5jb2Rlci0+Y3J0Yyk7
CiAJc3RydWN0IG5vdXZlYXVfY29ubmVjdG9yICpudl9jb25uZWN0b3IgPSBudjUwX291dHBfZ2V0
X29sZF9jb25uZWN0b3Ioc3RhdGUsIG52X2VuY29kZXIpOworI2lmZGVmIENPTkZJR19EUk1fTk9V
VkVBVV9CQUNLTElHSFQKIAlzdHJ1Y3Qgbm91dmVhdV9iYWNrbGlnaHQgKmJhY2tsaWdodCA9IG52
X2Nvbm5lY3Rvci0+YmFja2xpZ2h0OworI2VuZGlmCiAJc3RydWN0IGRybV9kcF9hdXggKmF1eCA9
ICZudl9jb25uZWN0b3ItPmF1eDsKIAlpbnQgcmV0OwogCXU4IHB3cjsKIAorI2lmZGVmIENPTkZJ
R19EUk1fTk9VVkVBVV9CQUNLTElHSFQKIAlpZiAoYmFja2xpZ2h0ICYmIGJhY2tsaWdodC0+dXNl
c19kcGNkKSB7CiAJCXJldCA9IGRybV9lZHBfYmFja2xpZ2h0X2Rpc2FibGUoYXV4LCAmYmFja2xp
Z2h0LT5lZHBfaW5mbyk7CiAJCWlmIChyZXQgPCAwKQogCQkJTlZfRVJST1IoZHJtLCAiRmFpbGVk
IHRvIGRpc2FibGUgYmFja2xpZ2h0IG9uIFtDT05ORUNUT1I6JWQ6JXNdOiAlZFxuIiwKIAkJCQkg
bnZfY29ubmVjdG9yLT5iYXNlLmJhc2UuaWQsIG52X2Nvbm5lY3Rvci0+YmFzZS5uYW1lLCByZXQp
OwogCX0KKyNlbmRpZgogCiAJaWYgKG52X2VuY29kZXItPmRjYi0+dHlwZSA9PSBEQ0JfT1VUUFVU
X0RQKSB7CiAJCWludCByZXQgPSBkcm1fZHBfZHBjZF9yZWFkYihhdXgsIERQX1NFVF9QT1dFUiwg
JnB3cik7Ci0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVh
dQo=
