Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E28837B630
	for <lists+nouveau@lfdr.de>; Wed, 12 May 2021 08:34:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAA6F6E0DE;
	Wed, 12 May 2021 06:34:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A9E2D6E0DE;
 Wed, 12 May 2021 06:34:38 +0000 (UTC)
Received: from Normandy.localdomain (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 46A19B00592;
 Wed, 12 May 2021 08:34:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620801276;
 bh=Qh+Kw2XY7YRpt085r9aB8KMAvN5of6Ggxs62130FJgw=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=I9ybmQbeZM9xf5k940y/d2LGUSVyIOO/dlHj260THvJM90r3FOKT3Rbz7FzabOsqA
 2sVnNGIyLsn6LRFB2A4Ta27pF6LgJ0d8EPQTSjbjQr1gm6o89G1AWLnCJJrxsKH6WM
 w+rtj11qHNpkO8ca5g9o2ZSO2qq7ZPxnR0/s2Z5Q9kXuZmonNE8x0HW8PlXXJcC+u2
 n7NuG5zodut+SBm+ZRuuJ18jthZzgIR76gmVQs4TNno0pCkSs4obNu3lWGozVEGpVq
 zTDgklteO/9qzR4WNGqPUqM23LmOirPrpI0+JnWgbAThNLzAIBXyMpqMBOVtHUxQHU
 Jc+5DFO/vLjDw==
Date: Wed, 12 May 2021 08:34:18 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20210512063418.mgec2b5x73n6iwr6@Normandy.localdomain>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
 <20210511082841.4181-3-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511082841.4181-3-thunder.leizhen@huawei.com>
Subject: Re: [Nouveau] [PATCH v2 2/2] drm/nouveau: Fix error return code in
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
Cc: David Airlie <airlied@linux.ie>, nouveau <nouveau@lists.freedesktop.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IFBpZXJyZSBNb3JlYXUgPHBpZXJyZS5tb3Jyb3dAZnJlZS5mcj4KCk9uIDIw
MjEtMDUtMTEg4oCUIDE2OjI4LCBaaGVuIExlaSB3cm90ZToKPiBGaXggdG8gcmV0dXJuIGEgbmVn
YXRpdmUgZXJyb3IgY29kZSBmcm9tIHRoZSBlcnJvciBoYW5kbGluZyBjYXNlIGluc3RlYWQKPiBv
ZiAwLCBhcyBkb25lIGVsc2V3aGVyZSBpbiB0aGlzIGZ1bmN0aW9uLgo+IAo+IEZpeGVzOiBkYjFh
MGFlMjE0NjEgKCJkcm0vbm91dmVhdS9ibDogQXNzaWduIGRpZmZlcmVudCBuYW1lcyB0byBpbnRl
cmZhY2VzIikKPiBTdWdnZXN0ZWQtYnk6IFBpZXJyZSBNb3JlYXUgPHBpZXJyZS5tb3Jyb3dAZnJl
ZS5mcj4KPiBTaWduZWQtb2ZmLWJ5OiBaaGVuIExlaSA8dGh1bmRlci5sZWl6aGVuQGh1YXdlaS5j
b20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmMg
fCA5ICsrKysrLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNSBpbnNlcnRpb25zKCspLCA0IGRlbGV0
aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1
X2JhY2tsaWdodC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbm91dmVhdV9iYWNrbGlnaHQu
Ywo+IGluZGV4IGQxYzk5OGU2NDVmYjRiNi4uZjA4NTZhZGJlNzc1NjI0IDEwMDY0NAo+IC0tLSBh
L2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYmFja2xpZ2h0LmMKPiArKysgYi9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JhY2tsaWdodC5jCj4gQEAgLTQ3LDIwICs0Nywy
MCBAQCBzdHJ1Y3Qgbm91dmVhdV9iYWNrbGlnaHQgewo+ICAJaW50IGlkOwo+ICB9Owo+ICAKPiAt
c3RhdGljIGJvb2wKPiArc3RhdGljIGludAo+ICBub3V2ZWF1X2dldF9iYWNrbGlnaHRfbmFtZShj
aGFyIGJhY2tsaWdodF9uYW1lW0JMX05BTUVfU0laRV0sCj4gIAkJCSAgIHN0cnVjdCBub3V2ZWF1
X2JhY2tsaWdodCAqYmwpCj4gIHsKPiAgCWludCBuYiA9IGlkYV9zaW1wbGVfZ2V0KCZibF9pZGEs
IDAsIDEwMCwgR0ZQX0tFUk5FTCk7Cj4gIAo+ICAJaWYgKG5iIDwgMCkKPiAtCQlyZXR1cm4gZmFs
c2U7Cj4gKwkJcmV0dXJuIG5iOwo+ICAJaWYgKG5iID4gMCkKPiAgCQlzbnByaW50ZihiYWNrbGln
aHRfbmFtZSwgQkxfTkFNRV9TSVpFLCAibnZfYmFja2xpZ2h0JWQiLCBuYik7Cj4gIAllbHNlCj4g
IAkJc25wcmludGYoYmFja2xpZ2h0X25hbWUsIEJMX05BTUVfU0laRSwgIm52X2JhY2tsaWdodCIp
Owo+ICAJYmwtPmlkID0gbmI7Cj4gLQlyZXR1cm4gdHJ1ZTsKPiArCXJldHVybiAwOwo+ICB9Cj4g
IAo+ICBzdGF0aWMgaW50Cj4gQEAgLTI3Myw3ICsyNzMsOCBAQCBub3V2ZWF1X2JhY2tsaWdodF9p
bml0KHN0cnVjdCBkcm1fY29ubmVjdG9yICpjb25uZWN0b3IpCj4gIAlpZiAoIWJsKQo+ICAJCXJl
dHVybiAtRU5PTUVNOwo+ICAKPiAtCWlmICghbm91dmVhdV9nZXRfYmFja2xpZ2h0X25hbWUoYmFj
a2xpZ2h0X25hbWUsIGJsKSkgewo+ICsJcmV0ID0gbm91dmVhdV9nZXRfYmFja2xpZ2h0X25hbWUo
YmFja2xpZ2h0X25hbWUsIGJsKTsKPiArCWlmIChyZXQpIHsKPiAgCQlOVl9FUlJPUihkcm0sICJG
YWlsZWQgdG8gcmV0cmlldmUgYSB1bmlxdWUgbmFtZSBmb3IgdGhlIGJhY2tsaWdodCBpbnRlcmZh
Y2VcbiIpOwo+ICAJCWdvdG8gZmFpbF9hbGxvYzsKPiAgCX0KPiAtLSAKPiAyLjI2LjAuMTA2Lmc5
ZmFkZWRkCj4gCj4gCj4gX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Au
b3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZl
YXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlz
dHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
