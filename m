Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FD6B3B515C
	for <lists+nouveau@lfdr.de>; Sun, 27 Jun 2021 05:36:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A5226E1F2;
	Sun, 27 Jun 2021 03:35:29 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga03-in.huawei.com (szxga03-in.huawei.com [45.249.212.189])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7E87289C89;
 Tue, 15 Jun 2021 02:00:16 +0000 (UTC)
Received: from dggemv704-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4G3ryR64tQz62vQ;
 Tue, 15 Jun 2021 09:56:15 +0800 (CST)
Received: from dggpeml500020.china.huawei.com (7.185.36.88) by
 dggemv704-chm.china.huawei.com (10.3.19.47) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 10:00:13 +0800
Received: from [10.174.177.174] (10.174.177.174) by
 dggpeml500020.china.huawei.com (7.185.36.88) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2176.2; Tue, 15 Jun 2021 10:00:12 +0800
To: <bskeggs@redhat.com>, <airlied@linux.ie>, <daniel@ffwll.ch>,
 <dri-devel@lists.freedesktop.org>, <nouveau@lists.freedesktop.org>,
 <linux-kernel@vger.kernel.org>
References: <20210531023811.477542-1-libaokun1@huawei.com>
From: "libaokun (A)" <libaokun1@huawei.com>
Message-ID: <aff157a6-d301-fe4f-d25c-f4ea0705f5a1@huawei.com>
Date: Tue, 15 Jun 2021 10:00:12 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <20210531023811.477542-1-libaokun1@huawei.com>
X-Originating-IP: [10.174.177.174]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 dggpeml500020.china.huawei.com (7.185.36.88)
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 27 Jun 2021 03:34:44 +0000
Subject: Re: [Nouveau] [PATCH -next] drm/nouveau/svm: Remove set but not
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

cGluZwoK5ZyoIDIwMjEvNS8zMSAxMDozOCwgQmFva3VuIExpIOWGmemBkzoKPiBGaXhlcyBnY2Mg
Jy1XdW51c2VkLWJ1dC1zZXQtdmFyaWFibGUnIHdhcm5pbmc6Cj4KPiBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X3N2bS5jOiBJbiBmdW5jdGlvbiAnbm91dmVhdV9wZm5zX21hcCc6Cj4g
ZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYzo4MTQ6Njogd2FybmluZzoKPiAg
IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZh
cmlhYmxlXQo+Cj4gSXQgbmV2ZXIgdXNlZCBzaW5jZSBpbnRyb2R1Y3Rpb24uCj4KPiBTaWduZWQt
b2ZmLWJ5OiBCYW9rdW4gTGkgPGxpYmFva3VuMUBodWF3ZWkuY29tPgo+IC0tLQo+ICAgZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyB8IDMgKy0tCj4gICAxIGZpbGUgY2hhbmdl
ZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVy
cy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfc3ZtLmMKPiBpbmRleCA4NDcyNmE4OWU2NjUuLjE2ZmJmOTBmOWYzMSAxMDA2NDQK
PiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X3N2bS5jCj4gKysrIGIvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9zdm0uYwo+IEBAIC05MjEsNyArOTIxLDYgQEAg
bm91dmVhdV9wZm5zX21hcChzdHJ1Y3Qgbm91dmVhdV9zdm1tICpzdm1tLCBzdHJ1Y3QgbW1fc3Ry
dWN0ICptbSwKPiAgIAkJIHVuc2lnbmVkIGxvbmcgYWRkciwgdTY0ICpwZm5zLCB1bnNpZ25lZCBs
b25nIG5wYWdlcykKPiAgIHsKPiAgIAlzdHJ1Y3Qgbm91dmVhdV9wZm5tYXBfYXJncyAqYXJncyA9
IG5vdXZlYXVfcGZuc190b19hcmdzKHBmbnMpOwo+IC0JaW50IHJldDsKPiAgIAo+ICAgCWFyZ3Mt
PnAuYWRkciA9IGFkZHI7Cj4gICAJYXJncy0+cC5zaXplID0gbnBhZ2VzIDw8IFBBR0VfU0hJRlQ7
Cj4gQEAgLTkyOSw3ICs5MjgsNyBAQCBub3V2ZWF1X3BmbnNfbWFwKHN0cnVjdCBub3V2ZWF1X3N2
bW0gKnN2bW0sIHN0cnVjdCBtbV9zdHJ1Y3QgKm1tLAo+ICAgCW11dGV4X2xvY2soJnN2bW0tPm11
dGV4KTsKPiAgIAo+ICAgCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQtPnN1cGVyID0gdHJ1
ZTsKPiAtCXJldCA9IG52aWZfb2JqZWN0X2lvY3RsKCZzdm1tLT52bW0tPnZtbS5vYmplY3QsIGFy
Z3MsIHNpemVvZigqYXJncykgKwo+ICsJbnZpZl9vYmplY3RfaW9jdGwoJnN2bW0tPnZtbS0+dm1t
Lm9iamVjdCwgYXJncywgc2l6ZW9mKCphcmdzKSArCj4gICAJCQkJbnBhZ2VzICogc2l6ZW9mKGFy
Z3MtPnAucGh5c1swXSksIE5VTEwpOwo+ICAgCXN2bW0tPnZtbS0+dm1tLm9iamVjdC5jbGllbnQt
PnN1cGVyID0gZmFsc2U7Cj4gICAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
