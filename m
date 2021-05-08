Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF693774CE
	for <lists+nouveau@lfdr.de>; Sun,  9 May 2021 03:12:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7AD76E15C;
	Sun,  9 May 2021 01:11:58 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from szxga05-in.huawei.com (szxga05-in.huawei.com [45.249.212.191])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 983FB6E86F;
 Sat,  8 May 2021 09:18:24 +0000 (UTC)
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FchVB5wbPzQkJl;
 Sat,  8 May 2021 17:14:58 +0800 (CST)
Received: from [127.0.0.1] (10.174.177.72) by DGGEMS412-HUB.china.huawei.com
 (10.3.19.212) with Microsoft SMTP Server id 14.3.498.0; Sat, 8 May 2021
 17:18:14 +0800
To: Dan Carpenter <dan.carpenter@oracle.com>, Ben Skeggs <bskeggs@redhat.com>, 
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>, dri-devel
 <dri-devel@lists.freedesktop.org>, nouveau <nouveau@lists.freedesktop.org>,
 linux-kernel <linux-kernel@vger.kernel.org>
References: <20210508034810.2374-1-thunder.leizhen@huawei.com>
 <20210508073400.nnmwwyoxqqiwv36w@pmoreau.org>
From: "Leizhen (ThunderTown)" <thunder.leizhen@huawei.com>
Message-ID: <0b94bd89-c8a0-f1e8-057f-2f639464fadd@huawei.com>
Date: Sat, 8 May 2021 17:18:13 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:60.0) Gecko/20100101
 Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20210508073400.nnmwwyoxqqiwv36w@pmoreau.org>
Content-Language: en-US
X-Originating-IP: [10.174.177.72]
X-CFilter-Loop: Reflected
X-Mailman-Approved-At: Sun, 09 May 2021 01:11:57 +0000
Subject: Re: [Nouveau] [PATCH 1/1] drm/nouveau: fix error return code in
 nouveau_backlight_init()
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

CgpPbiAyMDIxLzUvOCAxNTozNCwgUGllcnJlIE1vcmVhdSB3cm90ZToKPiBIZWxsbyBaaGVuLAo+
IAo+IFRoZXJlIHdhcyBhIHNpbWlsYXIgcGF0Y2ggc2VudCBpbiBsYXN0IG1vbnRoLCB0aG91Z2gg
d2hpY2ggZG9lcyBub3Qgc2VlbSB0bwo+IGhhdmUgYmVlbiBtZXJnZWQgeWV0OyBzZWUKPiBodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9hcmNoaXZlcy9ub3V2ZWF1LzIwMjEtQXByaWwvMDM4
NDUxLmh0bWwuCj4gCj4gV2hldGhlciBgcmV0YCBzaG91bGQgYmUgYC1FTk9TUENgIG9yIGAtRU5P
TUVNYCBpcyBoYXJkIHRvIHNheSBhcwo+IGBub3V2ZWF1X2dldF9iYWNrbGlnaHRfbmFtZSgpYCBj
b3VsZCBmYWlsIGR1ZSB0byBlaXRoZXIuCj4gCj4gSSB3aWxsIHByb3Bvc2UgYW4gYWx0ZXJuYXRp
dmUgZml4IHdoaWNoIG1vZGlmaWVzIGBub3V2ZWF1X2dldF9iYWNrbGlnaHRfbmFtZSgpYAo+IHRv
IHJldHVybiBhbiBpbnQgc28gdGhlIGFjdHVhbCBlcnJvciBjb2RlIGNhbiBiZSBwcm9wYWdhdGVk
IGJhY2sgaW5zdGVhZCBvZgo+IGd1ZXNzZWQsIGFzIHdlbGwgYXMgZml4IGFuIGlkYSBJRCBsZWFr
IHdoaWNoIEkganVzdCBzcG90dGVkLgoKSXQncyBhIGdvb2QgaWRlYS4KCj4gCj4gQmVzdCwKPiBQ
aWVycmUKPiAKPiBPbiAyMDIxLTA1LTA4IOKAlCAxMTo0OCwgWmhlbiBMZWkgd3JvdGU6Cj4+IEZp
eCB0byByZXR1cm4gYSBuZWdhdGl2ZSBlcnJvciBjb2RlIGZyb20gdGhlIGVycm9yIGhhbmRsaW5n
IGNhc2UgaW5zdGVhZAo+PiBvZiAwLCBhcyBkb25lIGVsc2V3aGVyZSBpbiB0aGlzIGZ1bmN0aW9u
Lgo+Pgo+PiBGaXhlczogZGIxYTBhZTIxNDYxICgiZHJtL25vdXZlYXUvYmw6IEFzc2lnbiBkaWZm
ZXJlbnQgbmFtZXMgdG8gaW50ZXJmYWNlcyIpCj4+IFJlcG9ydGVkLWJ5OiBIdWxrIFJvYm90IDxo
dWxrY2lAaHVhd2VpLmNvbT4KPj4gU2lnbmVkLW9mZi1ieTogWmhlbiBMZWkgPHRodW5kZXIubGVp
emhlbkBodWF3ZWkuY29tPgo+PiAtLS0KPj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZl
YXVfYmFja2xpZ2h0LmMgfCAxICsKPj4gIDEgZmlsZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKQo+
Pgo+PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iYWNrbGln
aHQuYyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmMKPj4gaW5k
ZXggNzJmMzVhMmJhYmNiLi4wOTdjYTM0NGEwODYgMTAwNjQ0Cj4+IC0tLSBhL2RyaXZlcnMvZ3B1
L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmMKPj4gKysrIGIvZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYwo+PiBAQCAtMjczLDYgKzI3Myw3IEBAIG5vdXZl
YXVfYmFja2xpZ2h0X2luaXQoc3RydWN0IGRybV9jb25uZWN0b3IgKmNvbm5lY3RvcikKPj4gIAkJ
cmV0dXJuIC1FTk9NRU07Cj4+ICAKPj4gIAlpZiAoIW5vdXZlYXVfZ2V0X2JhY2tsaWdodF9uYW1l
KGJhY2tsaWdodF9uYW1lLCBibCkpIHsKPj4gKwkJcmV0ID0gLUVOT1NQQzsKPj4gIAkJTlZfRVJS
T1IoZHJtLCAiRmFpbGVkIHRvIHJldHJpZXZlIGEgdW5pcXVlIG5hbWUgZm9yIHRoZSBiYWNrbGln
aHQgaW50ZXJmYWNlXG4iKTsKPj4gIAkJZ290byBmYWlsX2FsbG9jOwo+PiAgCX0KPj4gLS0gCj4+
IDIuMjUuMQo+Pgo+Pgo+IAo+IC4KPiAKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
bm91dmVhdQo=
