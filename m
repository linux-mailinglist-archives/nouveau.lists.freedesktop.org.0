Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D63763640B7
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:44:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B8B3D6E250;
	Mon, 19 Apr 2021 11:44:31 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C9256E24E
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832669;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=y644e2+cDS7jfFg2KG/GSDehn2zis7rBbTsBszQ7ZZc=;
 b=Xj5OgMP/8bzzrFhUyS6yRk73FcuDZWnm4R4azR7g7cRZsUoup72yF0uL+nBNgWSUcnvljC
 9Jnwk7RTlwpKEximC68UZ4YTbqHo/NhiEviHdYFWCWGDT9HEwvmW30ouEqbrKGc/8+8FZL
 AAbW24dktgdDiB08UGgsLwr74NS3g4A=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-395-fyeewpv6Mniq1-MpV4Whog-1; Mon, 19 Apr 2021 07:44:27 -0400
X-MC-Unique: fyeewpv6Mniq1-MpV4Whog-1
Received: by mail-wr1-f72.google.com with SMTP id
 s7-20020adfc5470000b0290106eef17cbdso5493625wrf.11
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:44:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=y644e2+cDS7jfFg2KG/GSDehn2zis7rBbTsBszQ7ZZc=;
 b=FRtUDU/cNO3yvbrfBVv9zIdgNxeMgrO4o/mUQsibF51oxaE/75hj/cpFoMrNdbfXJA
 tr90dVek0pnD3LCIIeJelPsSvNMjtoTz8WHZJpAtOuRFvp7z+rZoBDe9H+RQZ8aMZTr2
 j3t3CsFOC8djTjPSNJrLUYToimBALh5YAzNib1RoY76r4Ya74IMLfklpc/fawmLw8NFe
 vZbLDxXfXvS4QiZ4crHQo5hKFyR3F26fq3oZf1DhyPxbQNnytNgKUPWyKMpOwluJ2fTe
 shzbgyV8H94/93WDNYtYwmWlMjQ8vmsEfX94E/tIBW7vMTXBsW8VxXmAUdpNko+mw+PC
 FKDg==
X-Gm-Message-State: AOAM5335io94hRzIyvE4ybH6c8EhX2Dos1EOYY+/7KSlhFNGps+1cQ8J
 nOn2rCHkCzewHBP2srYD1s2UtoBgjQM9bU/bdexVBKudsJrATqgfS7hOXBZTLE1HMsKrwt2R/mp
 s3dELwS4s5aCmnDr6rdnXytNhyC69MUJKAbzgA7uEwg==
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13544840wrd.177.1618832666331; 
 Mon, 19 Apr 2021 04:44:26 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwjlugWDWLZH+5rQly0tRCQFzwosoMjd14Y9bJuAnMN5V/27+yHQMkQQGZjse8w/vAsAyaiT8Vc7UJvMHq5TOE=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13544835wrd.177.1618832666229; 
 Mon, 19 Apr 2021 04:44:26 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-8-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-8-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:44:15 +0200
Message-ID: <CACO55tvQ=dvDbwzWmwn7ZOwqyStEXn3=8zab6rQSiau3OkKktQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 07/40] drm/nouveau/nouveau_bo: Remove unused
 variables 'dev'
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
Cc: Jeremy Kolb <jkolb@brandeis.edu>, David Airlie <airlied@linux.ie>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 =?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>,
 linaro-mm-sig@lists.linaro.org, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sumit Semwal <sumit.semwal@linaro.org>,
 Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgNDozNyBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3
cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3YXJuaW5nKHMp
Ogo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYzogSW4gZnVuY3Rpb24g
4oCYbm91dmVhdV90dG1fdHRfcG9wdWxhdGXigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L25vdXZlYXVfYm8uYzoxMjI4OjE3OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhkZXbigJkgc2V0IGJ1
dCBub3QgdXNlZCBbLVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KPiAgZHJpdmVycy9ncHUvZHJt
L25vdXZlYXUvbm91dmVhdV9iby5jOiBJbiBmdW5jdGlvbiDigJhub3V2ZWF1X3R0bV90dF91bnBv
cHVsYXRl4oCZOgo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmM6MTI1Mjox
Nzogd2FybmluZzogdmFyaWFibGUg4oCYZGV24oCZIHNldCBidXQgbm90IHVzZWQgWy1XdW51c2Vk
LWJ1dC1zZXQtdmFyaWFibGVdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29t
Pgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0
ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogU3VtaXQgU2Vtd2FsIDxzdW1pdC5zZW13YWxAbGlu
YXJvLm9yZz4KPiBDYzogIkNocmlzdGlhbiBLw7ZuaWciIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5j
b20+Cj4gQ2M6IEplcmVteSBLb2xiIDxqa29sYkBicmFuZGVpcy5lZHU+Cj4gQ2M6IGRyaS1kZXZl
bEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogbGludXgtbWVkaWFAdmdlci5rZXJuZWwub3JnCj4gQ2M6IGxpbmFyby1tbS1zaWdA
bGlzdHMubGluYXJvLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxp
bmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYyB8
IDQgLS0tLQo+ICAxIGZpbGUgY2hhbmdlZCwgNCBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9ub3V2ZWF1X2JvLmMgYi9kcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9ub3V2ZWF1X2JvLmMKPiBpbmRleCAzZTA5ZGYwNDcyY2U0Li4zN2IzZDJjMTBmNWM1
IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+ICsr
KyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L25vdXZlYXVfYm8uYwo+IEBAIC0xMjU1LDcgKzEy
NTUsNiBAQCBub3V2ZWF1X3R0bV90dF9wb3B1bGF0ZShzdHJ1Y3QgdHRtX2RldmljZSAqYmRldiwK
PiAgewo+ICAgICAgICAgc3RydWN0IHR0bV90dCAqdHRtX2RtYSA9ICh2b2lkICopdHRtOwo+ICAg
ICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAgICAgICBzdHJ1Y3QgZGV2aWNlICpk
ZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdzICYgVFRNX1BBR0Vf
RkxBR19TRyk7Cj4KPiAgICAgICAgIGlmICh0dG1fdHRfaXNfcG9wdWxhdGVkKHR0bSkpCj4gQEAg
LTEyNjgsNyArMTI2Nyw2IEBAIG5vdXZlYXVfdHRtX3R0X3BvcHVsYXRlKHN0cnVjdCB0dG1fZGV2
aWNlICpiZGV2LAo+ICAgICAgICAgfQo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1X2JkZXYoYmRl
dik7Cj4gLSAgICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICByZXR1cm4gdHRt
X3Bvb2xfYWxsb2MoJmRybS0+dHRtLmJkZXYucG9vbCwgdHRtLCBjdHgpOwo+ICB9Cj4gQEAgLTEy
NzgsMTQgKzEyNzYsMTIgQEAgbm91dmVhdV90dG1fdHRfdW5wb3B1bGF0ZShzdHJ1Y3QgdHRtX2Rl
dmljZSAqYmRldiwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgIHN0cnVjdCB0dG1fdHQgKnR0
bSkKPiAgewo+ICAgICAgICAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm07Cj4gLSAgICAgICBzdHJ1
Y3QgZGV2aWNlICpkZXY7Cj4gICAgICAgICBib29sIHNsYXZlID0gISEodHRtLT5wYWdlX2ZsYWdz
ICYgVFRNX1BBR0VfRkxBR19TRyk7Cj4KPiAgICAgICAgIGlmIChzbGF2ZSkKPiAgICAgICAgICAg
ICAgICAgcmV0dXJuOwo+Cj4gICAgICAgICBkcm0gPSBub3V2ZWF1X2JkZXYoYmRldik7Cj4gLSAg
ICAgICBkZXYgPSBkcm0tPmRldi0+ZGV2Owo+Cj4gICAgICAgICByZXR1cm4gdHRtX3Bvb2xfZnJl
ZSgmZHJtLT50dG0uYmRldi5wb29sLCB0dG0pOwo+ICB9Cj4gLS0KPiAyLjI3LjAKPgo+IF9fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWls
aW5nIGxpc3QKPiBOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQoKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
