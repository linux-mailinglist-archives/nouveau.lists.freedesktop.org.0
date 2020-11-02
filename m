Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30EEC2A2A68
	for <lists+nouveau@lfdr.de>; Mon,  2 Nov 2020 13:09:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A86356E4B1;
	Mon,  2 Nov 2020 12:09:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga07-in.huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E70526E4B1;
 Mon,  2 Nov 2020 12:09:01 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CPsCB4NGFz72Bl;
 Mon,  2 Nov 2020 20:08:54 +0800 (CST)
Received: from linux-lmwb.huawei.com (10.175.103.112) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.487.0; Mon, 2 Nov 2020 20:08:44 +0800
From: Zou Wei <zou_wei@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>
Date: Mon, 2 Nov 2020 20:20:39 +0800
Message-ID: <1604319639-12227-1-git-send-email-zou_wei@huawei.com>
X-Mailer: git-send-email 2.6.2
MIME-Version: 1.0
X-Originating-IP: [10.175.103.112]
X-CFilter-Loop: Reflected
Subject: [Nouveau] [PATCH -next] drm/nouveu: remove unused variable
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
Cc: nouveau@lists.freedesktop.org, Zou Wei <zou_wei@huawei.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4IHZhcmlhYmxlcyBzZXQgYnV0IG5vdCB1c2VkIGNvbXBpbGF0aW9uIHdhcm5pbmdzOgoKLi9u
b3V2ZWF1X2JvLmM6MTMxMzoxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQg
bm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCiAgc3RydWN0IGRldmljZSAqZGV2
OwogICAgICAgICAgICAgICAgIF5+fgouL25vdXZlYXVfYm8uYzoxMzM3OjE3OiB3YXJuaW5nOiB2
YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJp
YWJsZV0KICBzdHJ1Y3QgZGV2aWNlICpkZXY7CiAgICAgICAgICAgICAgICAgXn5+CgpSZXBvcnRl
ZC1ieTogSHVsayBSb2JvdCA8aHVsa2NpQGh1YXdlaS5jb20+ClNpZ25lZC1vZmYtYnk6IFpvdSBX
ZWkgPHpvdV93ZWlAaHVhd2VpLmNvbT4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2
ZWF1X2JvLmMgfCA0IC0tLS0KIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9ucygtKQoKZGlmZiAt
LWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwppbmRleCA4MTMzMzc3Li45NmYwMGI1IDEwMDY0NAot
LS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKKysrIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jCkBAIC0xMzEwLDcgKzEzMTAsNiBAQCBub3V2ZWF1
X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2JvX2RldmljZSAqYmRldiwKIHsKIAlzdHJ1Y3Qg
dHRtX3R0ICp0dG1fZG1hID0gKHZvaWQgKil0dG07CiAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07
Ci0Jc3RydWN0IGRldmljZSAqZGV2OwogCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2VfZmxhZ3Mg
JiBUVE1fUEFHRV9GTEFHX1NHKTsKIAogCWlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0bSkpCkBA
IC0xMzI0LDcgKzEzMjMsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Jv
X2RldmljZSAqYmRldiwKIAl9CiAKIAlkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7Ci0JZGV2ID0g
ZHJtLT5kZXYtPmRldjsKIAogCXJldHVybiB0dG1fcG9vbF9hbGxvYygmZHJtLT50dG0uYmRldi5w
b29sLCB0dG0sIGN0eCk7CiB9CkBAIC0xMzM0LDE0ICsxMzMyLDEyIEBAIG5vdXZlYXVfdHRtX3R0
X3VucG9wdWxhdGUoc3RydWN0IHR0bV9ib19kZXZpY2UgKmJkZXYsCiAJCQkgIHN0cnVjdCB0dG1f
dHQgKnR0bSkKIHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybTsKLQlzdHJ1Y3QgZGV2aWNlICpk
ZXY7CiAJYm9vbCBzbGF2ZSA9ICEhKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cp
OwogCiAJaWYgKHNsYXZlKQogCQlyZXR1cm47CiAKIAlkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7
Ci0JZGV2ID0gZHJtLT5kZXYtPmRldjsKIAogCXJldHVybiB0dG1fcG9vbF9mcmVlKCZkcm0tPnR0
bS5iZGV2LnBvb2wsIHR0bSk7CiB9Ci0tIAoyLjYuMgoKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
