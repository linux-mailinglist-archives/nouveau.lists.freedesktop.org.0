Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5AC63381CF8
	for <lists+nouveau@lfdr.de>; Sun, 16 May 2021 07:16:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 44E4B6E0BE;
	Sun, 16 May 2021 05:16:21 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga04-in.huawei.com (szxga04-in.huawei.com [45.249.212.190])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C20EA6E1B2;
 Sat, 15 May 2021 08:54:31 +0000 (UTC)
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FhzdM0kPvzmg0h;
 Sat, 15 May 2021 16:51:03 +0800 (CST)
Received: from huawei.com (10.175.127.227) by DGGEMS402-HUB.china.huawei.com
 (10.3.19.202) with Microsoft SMTP Server id 14.3.498.0; Sat, 15 May 2021
 16:54:19 +0800
From: Baokun Li <libaokun1@huawei.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>, <jajones@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
Date: Sat, 15 May 2021 17:01:55 +0800
Message-ID: <20210515090155.186083-1-libaokun1@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.127.227]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 16 May 2021 05:16:20 +0000
Subject: [Nouveau] [PATCH -next] drm/nouveau:disp: Remove set but not used
 variable 'ret'
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
Cc: yuehaibing@huawei.com, libaokun1@huawei.com, weiyongjun1@huawei.com,
 yukuai3@huawei.com, yangjihong1@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

RnJvbTogImxpYmFva3VuMUBodWF3ZWkuY29tIiA8bGliYW9rdW4xQGh1YXdlaS5jb20+CgpGaXhl
cyBnY2MgJy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6IEluIGZ1bmN0aW9uICdudjUwX21zdG1fY2xlYW51
cCc6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxMzg5OjY6IHdhcm5p
bmc6CiB2YXJpYWJsZSDigJhyZXTigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNl
dC12YXJpYWJsZV0KCmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4g
ZnVuY3Rpb24gJ252NTBfbXN0bV9wcmVwYXJlJzoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jOjE0MTM6Njogd2FybmluZzoKIHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0
IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKSXQgbmV2ZXIgdXNlZCBzaW5j
ZSBpbnRyb2R1Y3Rpb24uCgpTaWduZWQtb2ZmLWJ5OiBCYW9rdW4gTGkgPGxpYmFva3VuMUBodWF3
ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyB8IDkg
KysrLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBpbnNlcnRpb25zKCspLCA2IGRlbGV0aW9ucygt
KQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwppbmRleCAxYzljMGNkZjg1
ZGIuLjVlZTNmMWZjNzZkNyAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlz
cG52NTAvZGlzcC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3Au
YwpAQCAtMTM4NiwxMiArMTM4NiwxMCBAQCBudjUwX21zdG1fY2xlYW51cChzdHJ1Y3QgbnY1MF9t
c3RtICptc3RtKQogewogCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0obXN0
bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7CiAJc3RydWN0IGRybV9lbmNvZGVyICplbmNvZGVyOwot
CWludCByZXQ7CiAKIAlOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51cFxuIiwgbXN0bS0+
b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwotCXJldCA9IGRybV9kcF9jaGVja19hY3Rfc3RhdHVzKCZt
c3RtLT5tZ3IpOwotCi0JcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5t
Z3IpOworCWRybV9kcF9jaGVja19hY3Rfc3RhdHVzKCZtc3RtLT5tZ3IpOworCWRybV9kcF91cGRh
dGVfcGF5bG9hZF9wYXJ0MigmbXN0bS0+bWdyKTsKIAogCWRybV9mb3JfZWFjaF9lbmNvZGVyKGVu
Y29kZXIsIG1zdG0tPm91dHAtPmJhc2UuYmFzZS5kZXYpIHsKIAkJaWYgKGVuY29kZXItPmVuY29k
ZXJfdHlwZSA9PSBEUk1fTU9ERV9FTkNPREVSX0RQTVNUKSB7CkBAIC0xNDEwLDEwICsxNDA4LDkg
QEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKIHsKIAlzdHJ1Y3Qg
bm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJhc2UuYmFzZS5kZXYp
OwogCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKLQlpbnQgcmV0OwogCiAJTlZfQVRPTUlD
KGRybSwgIiVzOiBtc3RtIHByZXBhcmVcbiIsIG1zdG0tPm91dHAtPmJhc2UuYmFzZS5uYW1lKTsK
LQlyZXQgPSBkcm1fZHBfdXBkYXRlX3BheWxvYWRfcGFydDEoJm1zdG0tPm1ncik7CisJZHJtX2Rw
X3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOwogCiAJZHJtX2Zvcl9lYWNoX2VuY29k
ZXIoZW5jb2RlciwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewogCQlpZiAoZW5jb2Rlci0+
ZW5jb2Rlcl90eXBlID09IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKLS0gCjIuMjUuNAoKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
