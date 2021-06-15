Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D81F3B5115
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F8916E153;
	Sun, 27 Jun 2021 03:34:48 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B2AD6E1B6;
 Tue, 15 Jun 2021 01:58:12 +0000 (UTC)
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4G3rts0gXPzXg0C;
 Tue, 15 Jun 2021 09:53:09 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:58:07 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:58:07 +0800
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20210525081733.571257-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <1142566d-2e15-e73d-1fa1-b3713cebff4a@huawei.com>
Date: Tue, 15 Jun 2021 09:58:06 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210525081733.571257-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau: Remove set but not used
 variable 'width'
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
Cc: yuehaibing@huawei.com, weiyongjun1@huawei.com, yukuai3@huawei.com,
 yangjihong1@huawei.com
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

cGluZwoK5ZyoIDIwMjEvNS8yNSAxNjoxNywgQmFva3VuIExpIOWGmemBkzoKPiBGaXhlcyBnY2Mg
Jy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYzogSW4gZnVuY3Rpb24gJ25vdXZlYXVfZnJhbWVidWZm
ZXJfbmV3JzoKPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYzozMDk6
MTU6IHdhcm5pbmc6Cj4gICB2YXJpYWJsZSDigJh3aWR0aOKAmSBzZXQgYnV0IG5vdCB1c2VkIFst
V3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gSXQgbmV2ZXIgdXNlZCBzaW5jZSBpbnRyb2R1
Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYW9rdW4gTGkgPGxpYmFva3VuMUBodWF3ZWkuY29t
Pgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5LmMgfCA1
ICstLS0tCj4gICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDQgZGVsZXRpb25zKC0p
Cj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9kaXNwbGF5
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2Rpc3BsYXkuYwo+IGluZGV4IDky
OWRlNDFjMjgxZi4uMmI0NjA4MzVhNDM4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L25vdXZlYXVfZGlzcGxheS5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
bm91dmVhdV9kaXNwbGF5LmMKPiBAQCAtMzA2LDcgKzMwNiw3IEBAIG5vdXZlYXVfZnJhbWVidWZm
ZXJfbmV3KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsCj4gICAJc3RydWN0IG5vdXZlYXVfYm8gKm52
Ym8gPSBub3V2ZWF1X2dlbV9vYmplY3QoZ2VtKTsKPiAgIAlzdHJ1Y3QgZHJtX2ZyYW1lYnVmZmVy
ICpmYjsKPiAgIAljb25zdCBzdHJ1Y3QgZHJtX2Zvcm1hdF9pbmZvICppbmZvOwo+IC0JdW5zaWdu
ZWQgaW50IHdpZHRoLCBoZWlnaHQsIGk7Cj4gKwl1bnNpZ25lZCBpbnQgaGVpZ2h0LCBpOwo+ICAg
CXVpbnQzMl90IHRpbGVfbW9kZTsKPiAgIAl1aW50OF90IGtpbmQ7Cj4gICAJaW50IHJldDsKPiBA
QCAtMzQzLDkgKzM0Myw2IEBAIG5vdXZlYXVfZnJhbWVidWZmZXJfbmV3KHN0cnVjdCBkcm1fZGV2
aWNlICpkZXYsCj4gICAJaW5mbyA9IGRybV9nZXRfZm9ybWF0X2luZm8oZGV2LCBtb2RlX2NtZCk7
Cj4gICAKPiAgIAlmb3IgKGkgPSAwOyBpIDwgaW5mby0+bnVtX3BsYW5lczsgaSsrKSB7Cj4gLQkJ
d2lkdGggPSBkcm1fZm9ybWF0X2luZm9fcGxhbmVfd2lkdGgoaW5mbywKPiAtCQkJCQkJICAgIG1v
ZGVfY21kLT53aWR0aCwKPiAtCQkJCQkJICAgIGkpOwo+ICAgCQloZWlnaHQgPSBkcm1fZm9ybWF0
X2luZm9fcGxhbmVfaGVpZ2h0KGluZm8sCj4gICAJCQkJCQkgICAgICBtb2RlX2NtZC0+aGVpZ2h0
LAo+ICAgCQkJCQkJICAgICAgaSk7Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91
dmVhdQo=
