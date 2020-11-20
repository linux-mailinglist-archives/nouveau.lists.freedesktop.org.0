Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 111D12BBA8F
	for <lists+nouveau@lfdr.de>; Sat, 21 Nov 2020 01:11:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8388A6E94D;
	Sat, 21 Nov 2020 00:11:02 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga06-in.huawei.com (szxga06-in.huawei.com [45.249.212.32])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F48689C54;
 Fri, 20 Nov 2020 06:49:34 +0000 (UTC)
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4CcnG72s9HzhbVR;
 Fri, 20 Nov 2020 14:49:19 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Fri, 20 Nov 2020 14:49:29 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>
Date: Fri, 20 Nov 2020 14:49:53 +0800
Message-ID: <1605854993-50218-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sat, 21 Nov 2020 00:10:56 +0000
Subject: [Nouveau] [PATCH] drm/ttm: remove unused varibles
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
Cc: linaro-mm-sig@lists.linaro.org, nouveau@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Zml4ZWQgdGhlIGZvbGxvd2luZyB3YXJuaW5ncwpkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmM6MTIyNzoxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZCnNldCBidXQgbm90
IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYzoxMjUxOjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkKc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KClNpZ25lZC1vZmYtYnk6IFRp
YW4gVGFvIDx0aWFudGFvNkBoaXNpbGljb24uY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L25vdXZlYXVfYm8uYyB8IDIgLS0KIDEgZmlsZSBjaGFuZ2VkLCAyIGRlbGV0aW9ucygtKQoK
ZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA3YWE0Mjg2Li45NDY1ZjU2IDEw
MDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC0xMjI4LDcgKzEyMjgsNiBAQCBu
b3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIHsKIAlz
dHJ1Y3QgdHRtX3R0ICp0dG1fZG1hID0gKHZvaWQgKil0dG07CiAJc3RydWN0IG5vdXZlYXVfZHJt
ICpkcm07Ci0Jc3RydWN0IGRldmljZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2Vf
ZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKTsKIAogCWlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0
bSkpCkBAIC0xMjQyLDcgKzEyNDEsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3Qg
dHRtX2JvX2RldmljZSAqYmRldiwKIAl9CiAKIAlkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7Ci0J
ZGV2ID0gZHJtLT5kZXYtPmRldjsKIAogCXJldHVybiB0dG1fcG9vbF9hbGxvYygmZHJtLT50dG0u
YmRldi5wb29sLCB0dG0sIGN0eCk7CiB9Ci0tIAoyLjcuNAoKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1Cg==
