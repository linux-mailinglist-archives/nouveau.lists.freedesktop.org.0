Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8450A39797F
	for <lists+nouveau@lfdr.de>; Tue,  1 Jun 2021 19:51:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A374F6EA9E;
	Tue,  1 Jun 2021 17:51:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga01-in.huawei.com (szxga01-in.huawei.com [45.249.212.187])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED54F6E8F7;
 Mon, 31 May 2021 12:39:04 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Ftvsv0DjqzYnPQ;
 Mon, 31 May 2021 20:36:19 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 20:39:01 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Mon, 31 May 2021 20:39:01 +0800
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <lyude@redhat.com>, <airlied@redhat.com>, <jajones@nvidia.com>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20210515090155.186083-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <e9062811-76ff-4728-17f2-c43fb40af9ed@huawei.com>
Date: Mon, 31 May 2021 20:38:55 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210515090155.186083-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Tue, 01 Jun 2021 17:51:50 +0000
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau:disp: Remove set but not
 used variable 'ret'
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

cGluZwoK5ZyoIDIwMjEvNS8xNSAxNzowMSwgQmFva3VuIExpIOWGmemBkzoKPiBGcm9tOiAibGli
YW9rdW4xQGh1YXdlaS5jb20iIDxsaWJhb2t1bjFAaHVhd2VpLmNvbT4KPgo+IEZpeGVzIGdjYyAn
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZScgd2FybmluZzoKPgo+IGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzogSW4gZnVuY3Rpb24gJ252NTBfbXN0bV9jbGVhbnVwJzoK
PiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6MTM4OTo2OiB3YXJuaW5n
Ogo+ICAgdmFyaWFibGUg4oCYcmV04oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2VkLWJ1dC1z
ZXQtdmFyaWFibGVdCj4KPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6
IEluIGZ1bmN0aW9uICdudjUwX21zdG1fcHJlcGFyZSc6Cj4gZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jOjE0MTM6Njogd2FybmluZzoKPiAgIHZhcmlhYmxlIOKAmHJldOKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cj4gSXQgbmV2
ZXIgdXNlZCBzaW5jZSBpbnRyb2R1Y3Rpb24uCj4KPiBTaWduZWQtb2ZmLWJ5OiBCYW9rdW4gTGkg
PGxpYmFva3VuMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUv
ZGlzcG52NTAvZGlzcC5jIHwgOSArKystLS0tLS0KPiAgIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2Vy
dGlvbnMoKyksIDYgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52
NTAvZGlzcC5jCj4gaW5kZXggMWM5YzBjZGY4NWRiLi41ZWUzZjFmYzc2ZDcgMTAwNjQ0Cj4gLS0t
IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gKysrIGIvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gQEAgLTEzODYsMTIgKzEzODYsMTAg
QEAgbnY1MF9tc3RtX2NsZWFudXAoc3RydWN0IG52NTBfbXN0bSAqbXN0bSkKPiAgIHsKPiAgIAlz
dHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0tPm91dHAtPmJhc2UuYmFz
ZS5kZXYpOwo+ICAgCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsKPiAtCWludCByZXQ7Cj4g
ICAKPiAgIAlOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51cFxuIiwgbXN0bS0+b3V0cC0+
YmFzZS5iYXNlLm5hbWUpOwo+IC0JcmV0ID0gZHJtX2RwX2NoZWNrX2FjdF9zdGF0dXMoJm1zdG0t
Pm1ncik7Cj4gLQo+IC0JcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5t
Z3IpOwo+ICsJZHJtX2RwX2NoZWNrX2FjdF9zdGF0dXMoJm1zdG0tPm1ncik7Cj4gKwlkcm1fZHBf
dXBkYXRlX3BheWxvYWRfcGFydDIoJm1zdG0tPm1ncik7Cj4gICAKPiAgIAlkcm1fZm9yX2VhY2hf
ZW5jb2RlcihlbmNvZGVyLCBtc3RtLT5vdXRwLT5iYXNlLmJhc2UuZGV2KSB7Cj4gICAJCWlmIChl
bmNvZGVyLT5lbmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewo+IEBAIC0x
NDEwLDEwICsxNDA4LDkgQEAgbnY1MF9tc3RtX3ByZXBhcmUoc3RydWN0IG52NTBfbXN0bSAqbXN0
bSkKPiAgIHsKPiAgIAlzdHJ1Y3Qgbm91dmVhdV9kcm0gKmRybSA9IG5vdXZlYXVfZHJtKG1zdG0t
Pm91dHAtPmJhc2UuYmFzZS5kZXYpOwo+ICAgCXN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2RlcjsK
PiAtCWludCByZXQ7Cj4gICAKPiAgIAlOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gcHJlcGFyZVxu
IiwgbXN0bS0+b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwo+IC0JcmV0ID0gZHJtX2RwX3VwZGF0ZV9w
YXlsb2FkX3BhcnQxKCZtc3RtLT5tZ3IpOwo+ICsJZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQx
KCZtc3RtLT5tZ3IpOwo+ICAgCj4gICAJZHJtX2Zvcl9lYWNoX2VuY29kZXIoZW5jb2RlciwgbXN0
bS0+b3V0cC0+YmFzZS5iYXNlLmRldikgewo+ICAgCQlpZiAoZW5jb2Rlci0+ZW5jb2Rlcl90eXBl
ID09IERSTV9NT0RFX0VOQ09ERVJfRFBNU1QpIHsKX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1Cg==
