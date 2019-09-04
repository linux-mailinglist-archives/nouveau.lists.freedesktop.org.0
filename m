Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A65DEB2C1A
	for <lists+nouveau@lfdr.de>; Sat, 14 Sep 2019 18:00:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D67E96F531;
	Sat, 14 Sep 2019 16:00:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 30FA2894D7;
 Wed,  4 Sep 2019 14:01:11 +0000 (UTC)
Received: from DGGEMS410-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 89AB9864175A505DC28B;
 Wed,  4 Sep 2019 22:01:08 +0800 (CST)
Received: from localhost.localdomain.localdomain (10.175.113.25) by
 DGGEMS410-HUB.china.huawei.com (10.3.19.210) with Microsoft SMTP Server id
 14.3.439.0; Wed, 4 Sep 2019 22:01:00 +0800
From: Wei Yongjun <weiyongjun1@huawei.com>
To: Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>, "Daniel
 Vetter" <daniel@ffwll.ch>
Date: Wed, 4 Sep 2019 14:18:57 +0000
Message-ID: <20190904141857.196103-1-weiyongjun1@huawei.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
X-Originating-IP: [10.175.113.25]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 14 Sep 2019 16:00:23 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: add missing single_release()
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
Cc: nouveau@lists.freedesktop.org, kernel-janitors@vger.kernel.org,
 Wei Yongjun <weiyongjun1@huawei.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2hlbiB1c2luZyBzaW5nbGVfb3BlbigpIGZvciBvcGVuaW5nLCBzaW5nbGVfcmVsZWFzZSgpIHNo
b3VsZCBiZQp1c2VkLCBvdGhlcndpc2UgdGhlcmUgaXMgYSBtZW1vcnkgbGVhay4KClRoaXMgaXMg
ZGV0ZWN0ZWQgYnkgQ29jY2luZWxsZSBzZW1hbnRpYyBwYXRjaC4KCkZpeGVzOiA2ZTlmYzE3NzM5
OWYgKCJkcm0vbm91dmVhdS9kZWJ1Z2ZzOiBhZGQgY29weSBvZiBzeXNmcyBwc3RhdGUgaW50ZXJm
YWNlIHBvcnRlZCB0byBkZWJ1Z2ZzIikKU2lnbmVkLW9mZi1ieTogV2VpIFlvbmdqdW4gPHdlaXlv
bmdqdW4xQGh1YXdlaS5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9k
ZWJ1Z2ZzLmMgfCAxICsKIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQoKZGlmZiAtLWdp
dCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9kZWJ1Z2ZzLmMKaW5kZXggN2RmYmJiYzFiZWVhLi4zNTY5
NWY0OTMyNzEgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVi
dWdmcy5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfZGVidWdmcy5jCkBA
IC0yMDIsNiArMjAyLDcgQEAgc3RhdGljIGNvbnN0IHN0cnVjdCBmaWxlX29wZXJhdGlvbnMgbm91
dmVhdV9wc3RhdGVfZm9wcyA9IHsKIAkub3BlbiA9IG5vdXZlYXVfZGVidWdmc19wc3RhdGVfb3Bl
biwKIAkucmVhZCA9IHNlcV9yZWFkLAogCS53cml0ZSA9IG5vdXZlYXVfZGVidWdmc19wc3RhdGVf
c2V0LAorCS5yZWxlYXNlID0gc2luZ2xlX3JlbGVhc2UsCiB9OwogCiBzdGF0aWMgc3RydWN0IGRy
bV9pbmZvX2xpc3Qgbm91dmVhdV9kZWJ1Z2ZzX2xpc3RbXSA9IHsKCgoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
