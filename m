Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id ECE3F37B640
	for <lists+nouveau@lfdr.de>; Wed, 12 May 2021 08:40:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1CB016E102;
	Wed, 12 May 2021 06:40:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from smtp1-g21.free.fr (smtp1-g21.free.fr [IPv6:2a01:e0c:1:1599::10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 20B676E0DE;
 Wed, 12 May 2021 06:40:10 +0000 (UTC)
Received: from Normandy.localdomain (unknown [88.129.173.226])
 (Authenticated sender: pierre.morrow@free.fr)
 by smtp1-g21.free.fr (Postfix) with ESMTPSA id 7B565B00539;
 Wed, 12 May 2021 08:39:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
 s=smtp-20201208; t=1620801608;
 bh=G+fqPsWs7aNx2UZuhTvM3ja9/zXQOlLMol12RyDINks=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=M2z1VMzIygzUWd8rnIfcb+AyqAQ/Zv7SIWIofNWU2sUGh5MUZqopSGl2jxO0Ttykt
 xBvjCCl9x8uRSh6DqKnGbhC6CQTK0CbU/C1l+yhjUA8nFvSqrXDG1ZwPlX4Mj8cuGI
 2D9iG2W8lfXPaikDHTmsvG38g4LsPuGjOZlGMozQF2eTJsclFLGlBw7WfO1a2VuGkK
 N5L6I7a1jk2s3y/UpYHXm65Q17IySJQZJImcL2KQyPPU34vEF7yNCePuQ8ehyl2j3n
 yeaT7JkepMYPyHqtTWd5Utwk+Pf7XAYAOCMJThc/p2eb8ME2dck9Z3+16DbShaNYNL
 8+xqDOadaVuMg==
Date: Wed, 12 May 2021 08:39:52 +0200
From: Pierre Moreau <pierre.morrow@free.fr>
To: Zhen Lei <thunder.leizhen@huawei.com>
Message-ID: <20210512063952.5kwdrq2yzbmgmn4x@Normandy.localdomain>
Mail-Followup-To: Zhen Lei <thunder.leizhen@huawei.com>,
 Ben Skeggs <bskeggs@redhat.com>, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>
References: <20210511082841.4181-1-thunder.leizhen@huawei.com>
 <20210511082841.4181-2-thunder.leizhen@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210511082841.4181-2-thunder.leizhen@huawei.com>
Subject: Re: [Nouveau] [PATCH v2 1/2] drm/nouveau: Fix ida leak
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

V2h5IHJlbW92ZSB0aGUgY29uc3QgbW9kaWZpZXIgb24gYG5iYD8KCk9uIDIwMjEtMDUtMTEg4oCU
IDE2OjI4LCBaaGVuIExlaSB3cm90ZToKPiBXaGVuIHRoZSAnbmInIHZhbHVlIGFsbG9jYXRlZCBm
cm9tICdibF9pZGEnIGlzIGdyZWF0ZXIgdGhhbiBvciBlcXVhbCB0bwo+IDEwMCwgaXQgd2lsbCBu
b3QgYmUgcmVsZWFzZWQuIEluIGZhY3QsIHdlIGNhbiBzaW1wbGlmeSBvcGVyYXRpb25zIGJ5Cj4g
bGltaXRpbmcgdGhlIHJhbmdlIG9mIGlkYXMgdGhhdCBjYW4gYmUgYXBwbGllZCBmb3IuCj4gCj4g
QnkgdGhlIHdheSwgZGVsZXRlIHRoZSBjb25zdCBtb2RpZmllciBvZiB0aGUgbG9jYWwgdmFyaWFi
bGUgJ25iJy4KPiAKPiBGaXhlczogZGIxYTBhZTIxNDYxICgiZHJtL25vdXZlYXUvYmw6IEFzc2ln
biBkaWZmZXJlbnQgbmFtZXMgdG8gaW50ZXJmYWNlcyIpCj4gU2lnbmVkLW9mZi1ieTogWmhlbiBM
ZWkgPHRodW5kZXIubGVpemhlbkBodWF3ZWkuY29tPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JhY2tsaWdodC5jIHwgNSArKystLQo+ICAxIGZpbGUgY2hhbmdlZCwg
MyBpbnNlcnRpb25zKCspLCAyIGRlbGV0aW9ucygtKQo+IAo+IGRpZmYgLS1naXQgYS9kcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JhY2tsaWdodC5jIGIvZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbm91dmVhdV9iYWNrbGlnaHQuYwo+IGluZGV4IDcyZjM1YTJiYWJjYjIwZS4uZDFjOTk4
ZTY0NWZiNGI2IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVf
YmFja2xpZ2h0LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JhY2ts
aWdodC5jCj4gQEAgLTUxLDggKzUxLDkgQEAgc3RhdGljIGJvb2wKPiAgbm91dmVhdV9nZXRfYmFj
a2xpZ2h0X25hbWUoY2hhciBiYWNrbGlnaHRfbmFtZVtCTF9OQU1FX1NJWkVdLAo+ICAJCQkgICBz
dHJ1Y3Qgbm91dmVhdV9iYWNrbGlnaHQgKmJsKQo+ICB7Cj4gLQljb25zdCBpbnQgbmIgPSBpZGFf
c2ltcGxlX2dldCgmYmxfaWRhLCAwLCAwLCBHRlBfS0VSTkVMKTsKPiAtCWlmIChuYiA8IDAgfHwg
bmIgPj0gMTAwKQo+ICsJaW50IG5iID0gaWRhX3NpbXBsZV9nZXQoJmJsX2lkYSwgMCwgMTAwLCBH
RlBfS0VSTkVMKTsKPiArCj4gKwlpZiAobmIgPCAwKQo+ICAJCXJldHVybiBmYWxzZTsKPiAgCWlm
IChuYiA+IDApCj4gIAkJc25wcmludGYoYmFja2xpZ2h0X25hbWUsIEJMX05BTUVfU0laRSwgIm52
X2JhY2tsaWdodCVkIiwgbmIpOwo+IC0tIAo+IDIuMjYuMC4xMDYuZzlmYWRlZGQKPiAKPiAKPiBf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUg
bWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xp
c3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QK
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
