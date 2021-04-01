Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C835157F
	for <lists+nouveau@lfdr.de>; Thu,  1 Apr 2021 16:07:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CE5F6E14D;
	Thu,  1 Apr 2021 14:06:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from out4436.biz.mail.alibaba.com (out4436.biz.mail.alibaba.com
 [47.88.44.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AB66E104;
 Thu,  1 Apr 2021 09:04:00 +0000 (UTC)
X-Alimail-AntiSpam: AC=PASS; BC=-1|-1; BR=01201311R101e4; CH=green; DM=||false|;
 DS=||; FP=0|-1|-1|-1|0|-1|-1|-1; HT=e01e04394;
 MF=jiapeng.chong@linux.alibaba.com; NM=1; PH=DS; RN=11; SR=0;
 TI=SMTPD_---0UU5S6MB_1617267817; 
Received: from
 j63c13417.sqa.eu95.tbsite.net(mailfrom:jiapeng.chong@linux.alibaba.com
 fp:SMTPD_---0UU5S6MB_1617267817) by smtp.aliyun-inc.com(127.0.0.1);
 Thu, 01 Apr 2021 17:03:44 +0800
From: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>
To: bskeggs@redhat.com
Date: Thu,  1 Apr 2021 17:03:35 +0800
Message-Id: <1617267815-110014-1-git-send-email-jiapeng.chong@linux.alibaba.com>
X-Mailer: git-send-email 1.8.3.1
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 01 Apr 2021 14:06:57 +0000
Subject: [Nouveau] [PATCH] drm/nouveau: remove unused code
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
Cc: Jiapeng Chong <jiapeng.chong@linux.alibaba.com>, airlied@linux.ie,
 nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, christian.koenig@amd.com,
 linaro-mm-sig@lists.linaro.org, daniel@ffwll.ch, sumit.semwal@linaro.org,
 linux-media@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

Rml4IHRoZSBmb2xsb3dpbmcgd2hpdGVzY2FuIHdhcm5pbmc6Cgpkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2JvLmM6MTI4NzoxNzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZCnNl
dCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdLgoKUmVwb3J0ZWQtYnk6
IEFiYWNpIFJvYm90IDxhYmFjaUBsaW51eC5hbGliYWJhLmNvbT4KU2lnbmVkLW9mZi1ieTogSmlh
cGVuZyBDaG9uZyA8amlhcGVuZy5jaG9uZ0BsaW51eC5hbGliYWJhLmNvbT4KLS0tCiBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgfCAyIC0tCiAxIGZpbGUgY2hhbmdlZCwgMiBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMKaW5kZXggZjI3MjBh
MC4uYjY2MWQwZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9i
by5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwpAQCAtMTI4NCwx
NCArMTI4NCwxMiBAQCB2bV9mYXVsdF90IG5vdXZlYXVfdHRtX2ZhdWx0X3Jlc2VydmVfbm90aWZ5
KHN0cnVjdCB0dG1fYnVmZmVyX29iamVjdCAqYm8pCiAJCQkgIHN0cnVjdCB0dG1fdHQgKnR0bSkK
IHsKIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybTsKLQlzdHJ1Y3QgZGV2aWNlICpkZXY7CiAJYm9v
bCBzbGF2ZSA9ICEhKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZMQUdfU0cpOwogCiAJaWYg
KHNsYXZlKQogCQlyZXR1cm47CiAKIAlkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7Ci0JZGV2ID0g
ZHJtLT5kZXYtPmRldjsKIAogCXJldHVybiB0dG1fcG9vbF9mcmVlKCZkcm0tPnR0bS5iZGV2LnBv
b2wsIHR0bSk7CiB9Ci0tIAoxLjguMy4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXUK
