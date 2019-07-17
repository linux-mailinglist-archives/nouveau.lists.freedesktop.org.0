Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 040526B74A
	for <lists+nouveau@lfdr.de>; Wed, 17 Jul 2019 09:13:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05AA76E266;
	Wed, 17 Jul 2019 07:13:57 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
X-Greylist: delayed 938 seconds by postgrey-1.36 at gabe;
 Wed, 17 Jul 2019 07:13:54 UTC
Received: from huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C53086E266
 for <nouveau@lists.freedesktop.org>; Wed, 17 Jul 2019 07:13:54 +0000 (UTC)
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 878B3B2BD220132AE72E;
 Wed, 17 Jul 2019 14:57:57 +0800 (CST)
Received: from localhost (10.133.213.239) by DGGEMS405-HUB.china.huawei.com
 (10.3.19.205) with Microsoft SMTP Server id 14.3.439.0; Wed, 17 Jul 2019
 14:57:47 +0800
From: YueHaibing <yuehaibing@huawei.com>
To: <dri-devel@lists.freedesktop.org>, <bskeggs@redhat.com>,
 <airlied@linux.ie>, <daniel@ffwll.ch>, <keescook@chromium.org>
Date: Wed, 17 Jul 2019 14:56:26 +0800
Message-ID: <20190717065626.42016-1-yuehaibing@huawei.com>
X-Mailer: git-send-email 2.10.2.windows.1
MIME-Version: 1.0
X-Originating-IP: [10.133.213.239]
X-CFilter-Loop: Reflected
Subject: [Nouveau] [PATCH -next] drm/nouveau/secboot: Make
 acr_r352_ls_gpccs_func static
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
Cc: nouveau@lists.freedesktop.org, YueHaibing <yuehaibing@huawei.com>,
 linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4IHNwYXJzZSB3YXJuaW5nOgoKZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
c2VjYm9vdC9hY3JfcjM1Mi5jOjEwOTI6MToKIHdhcm5pbmc6IHN5bWJvbCAnYWNyX3IzNTJfbHNf
Z3BjY3NfZnVuYycgd2FzIG5vdCBkZWNsYXJlZC4gU2hvdWxkIGl0IGJlIHN0YXRpYz8KClJlcG9y
dGVkLWJ5OiBIdWxrIFJvYm90IDxodWxrY2lAaHVhd2VpLmNvbT4KU2lnbmVkLW9mZi1ieTogWXVl
SGFpYmluZyA8eXVlaGFpYmluZ0BodWF3ZWkuY29tPgotLS0KIGRyaXZlcnMvZ3B1L2RybS9ub3V2
ZWF1L252a20vc3ViZGV2L3NlY2Jvb3QvYWNyX3IzNTIuYyB8IDIgKy0KIDEgZmlsZSBjaGFuZ2Vk
LCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3NlY2Jvb3QvYWNyX3IzNTIuYyBiL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3NlY2Jvb3QvYWNyX3IzNTIuYwppbmRleCA0ZmQ0Y2Zl
Li43YWY5NzFkIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRl
di9zZWNib290L2Fjcl9yMzUyLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvc2VjYm9vdC9hY3JfcjM1Mi5jCkBAIC0xMDg4LDcgKzEwODgsNyBAQCBhY3JfcjM1Ml9s
c19ncGNjc19mdW5jXzAgPSB7CiAJLmxoZHJfZmxhZ3MgPSBMU0ZfRkxBR19GT1JDRV9QUklWX0xP
QUQsCiB9OwogCi1jb25zdCBzdHJ1Y3QgYWNyX3IzNTJfbHNfZnVuYworc3RhdGljIGNvbnN0IHN0
cnVjdCBhY3JfcjM1Ml9sc19mdW5jCiBhY3JfcjM1Ml9sc19ncGNjc19mdW5jID0gewogCS5sb2Fk
ID0gYWNyX2xzX3Vjb2RlX2xvYWRfZ3BjY3MsCiAJLnZlcnNpb25fbWF4ID0gMCwKLS0gCjIuNy40
CgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
