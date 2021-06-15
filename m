Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D20DB3B50F5
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:35:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A6D16E063;
	Sun, 27 Jun 2021 03:34:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B6FA89C68;
 Tue, 15 Jun 2021 01:58:26 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4G3rxH3x8kz6yrs;
 Tue, 15 Jun 2021 09:55:15 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:58:24 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 09:58:23 +0800
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <sumit.semwal@linaro.org>, <christian.koenig@amd.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>, <linux-media@vger.kernel.org>,
 <linaro-mm-sig@lists.linaro.org>
References: <20210525082511.580068-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <cee44d34-81c1-4972-e68b-e6b193598763@huawei.com>
Date: Tue, 15 Jun 2021 09:58:23 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210525082511.580068-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau: Remove set but not used
 variable 'dev'
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

cGluZwoK5ZyoIDIwMjEvNS8yNSAxNjoyNSwgQmFva3VuIExpIOWGmemBkzoKPiBGaXhlcyBnY2Mg
Jy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmM6IEluIGZ1bmN0aW9uICdub3V2ZWF1X3R0bV90dF9wb3B1bGF0
ZSc6Cj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iby5jOjEyNTg6MTc6IHdhcm5p
bmc6Cj4gICB2YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0
LXNldC12YXJpYWJsZV0KPgo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzog
SW4gZnVuY3Rpb24gJ25vdXZlYXVfdHRtX3R0X3VucG9wdWxhdGUnOgo+IGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L25vdXZlYXVfYm8uYzoxMjgxOjE3OiB3YXJuaW5nOgo+ICAgdmFyaWFibGUg4oCY
ZGV24oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBJ
dCBuZXZlciB1c2VkIHNpbmNlIGludHJvZHVjdGlvbi4KPgo+IFNpZ25lZC1vZmYtYnk6IEJhb2t1
biBMaSA8bGliYW9rdW4xQGh1YXdlaS5jb20+Cj4gLS0tCj4gICBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9ub3V2ZWF1X2JvLmMgfCA0IC0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCA0IGRlbGV0aW9u
cygtKQo+Cj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8u
YyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IGluZGV4IDdhMjYyNGMw
YmE0Yy4uNTFmOWEyZTY1MzJlIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8u
Ywo+IEBAIC0xMjU0LDcgKzEyNTQsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3Qg
dHRtX2RldmljZSAqYmRldiwKPiAgIHsKPiAgIAlzdHJ1Y3QgdHRtX3R0ICp0dG1fZG1hID0gKHZv
aWQgKil0dG07Cj4gICAJc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLQlzdHJ1Y3QgZGV2aWNl
ICpkZXY7Cj4gICAJYm9vbCBzbGF2ZSA9ICEhKHR0bS0+cGFnZV9mbGFncyAmIFRUTV9QQUdFX0ZM
QUdfU0cpOwo+ICAgCj4gICAJaWYgKHR0bV90dF9pc19wb3B1bGF0ZWQodHRtKSkKPiBAQCAtMTI2
Nyw3ICsxMjY2LDYgQEAgbm91dmVhdV90dG1fdHRfcG9wdWxhdGUoc3RydWN0IHR0bV9kZXZpY2Ug
KmJkZXYsCj4gICAJfQo+ICAgCj4gICAJZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwo+IC0JZGV2
ID0gZHJtLT5kZXYtPmRldjsKPiAgIAo+ICAgCXJldHVybiB0dG1fcG9vbF9hbGxvYygmZHJtLT50
dG0uYmRldi5wb29sLCB0dG0sIGN0eCk7Cj4gICB9Cj4gQEAgLTEyNzcsMTQgKzEyNzUsMTIgQEAg
bm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwKPiAgIAkJ
CSAgc3RydWN0IHR0bV90dCAqdHRtKQo+ICAgewo+ICAgCXN0cnVjdCBub3V2ZWF1X2RybSAqZHJt
Owo+IC0Jc3RydWN0IGRldmljZSAqZGV2Owo+ICAgCWJvb2wgc2xhdmUgPSAhISh0dG0tPnBhZ2Vf
ZmxhZ3MgJiBUVE1fUEFHRV9GTEFHX1NHKTsKPiAgIAo+ICAgCWlmIChzbGF2ZSkKPiAgIAkJcmV0
dXJuOwo+ICAgCj4gICAJZHJtID0gbm91dmVhdV9iZGV2KGJkZXYpOwo+IC0JZGV2ID0gZHJtLT5k
ZXYtPmRldjsKPiAgIAo+ICAgCXJldHVybiB0dG1fcG9vbF9mcmVlKCZkcm0tPnR0bS5iZGV2LnBv
b2wsIHR0bSk7Cj4gICB9Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
