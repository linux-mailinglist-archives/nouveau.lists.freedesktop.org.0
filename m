Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A475274E01
	for <lists+nouveau@lfdr.de>; Wed, 23 Sep 2020 02:58:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1996E3D0;
	Wed, 23 Sep 2020 00:58:51 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from huawei.com (szxga07-in.huawei.com [45.249.212.35])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97DC66E849;
 Tue, 22 Sep 2020 09:28:27 +0000 (UTC)
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id BFF1CC94CA3D576514D3;
 Tue, 22 Sep 2020 17:28:23 +0800 (CST)
Received: from localhost.localdomain (10.69.192.56) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 22 Sep 2020 17:28:11 +0800
From: Tian Tao <tiantao6@hisilicon.com>
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>,
 <pankaj.laxminarayan.bharadiya@intel.com>, <alexander.deucher@amd.com>,
 <tiwai@suse.de>, <jajones@nvidia.com>, <dri-devel@lists.freedesktop.org>,
 <nouveau@lists.freedesktop.org>
Date: Tue, 22 Sep 2020 17:25:45 +0800
Message-ID: <1600766745-56543-1-git-send-email-tiantao6@hisilicon.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [10.69.192.56]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Wed, 23 Sep 2020 00:58:49 +0000
Subject: [Nouveau] [PATCH] drm/nouveau/kms: Remove set but not used 'ret'
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
Cc: linuxarm@huawei.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhpcyBhZGRyZXNzZXMgdGhlIGZvbGxvd2luZyBnY2Mgd2FybmluZyB3aXRoICJtYWtlIFc9MSI6
CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24g4oCY
bnY1MF9tc3RtX3ByZXBhcmXigJk6CmRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rp
c3AuYzoxMzc4OjY6IHdhcm5pbmc6CnZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2Vk
IFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQoKU2lnbmVkLW9mZi1ieTogVGlhbiBUYW8gPHRp
YW50YW82QGhpc2lsaWNvbi5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jIHwgMyArKysKIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCmRpZmYg
LS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMgYi9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKaW5kZXggYjExMWZlMi4uZDA1YzU3YyAx
MDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCisrKyBi
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwpAQCAtMTM3OSw2ICsxMzc5
LDkgQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKIAogCU5WX0FU
T01JQyhkcm0sICIlczogbXN0bSBwcmVwYXJlXG4iLCBtc3RtLT5vdXRwLT5iYXNlLmJhc2UubmFt
ZSk7CiAJcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOworCWlm
IChyZXQpIHsKKyAgICAgICAgICAgICAgICBOVl9BVE9NSUMoZHJtLCAiZmFpbGVkIHRvIHVwZGF0
ZSBwYXlsb2FkICVkXG4iLCByZXQpOworICAgICAgICB9CiAKIAlkcm1fZm9yX2VhY2hfZW5jb2Rl
cihlbmNvZGVyLCBtc3RtLT5vdXRwLT5iYXNlLmJhc2UuZGV2KSB7CiAJCWlmIChlbmNvZGVyLT5l
bmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewotLSAKMi43LjQKCl9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGlu
ZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRl
c2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
