Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C7AB3D3D40
	for <lists+nouveau@lfdr.de>; Fri, 23 Jul 2021 18:13:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7619D6EDCE;
	Fri, 23 Jul 2021 16:12:56 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [216.205.24.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C059E6EDB9
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 16:12:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1627056773;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=1NTO18YcF2qw6Kpg/GloKqP6tZBxoy9gh8XmkGeF9NE=;
 b=Zdjq+0NmIV1cinRkd4HYhlDIepfNIIB53q2WbZuVfooRtpBpgHAalS/fDWG903C9ZTEELT
 YNcZglg7d0ulZWISclDAVooR6o62i7Rv4OLjkYwdKONHuufjOykGKa5H14bb18JxAdxAG3
 oz5kb4ajlLJZBC3jEBv4qWknbiOQppU=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-387--5wQQdVnNkWhNaCoSgBMyA-1; Fri, 23 Jul 2021 12:12:50 -0400
X-MC-Unique: -5wQQdVnNkWhNaCoSgBMyA-1
Received: by mail-qk1-f200.google.com with SMTP id
 b4-20020a3799040000b02903b899a4309cso1468562qke.14
 for <nouveau@lists.freedesktop.org>; Fri, 23 Jul 2021 09:12:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:message-id:subject:from:to:cc:date:in-reply-to
 :references:organization:user-agent:mime-version
 :content-transfer-encoding;
 bh=1NTO18YcF2qw6Kpg/GloKqP6tZBxoy9gh8XmkGeF9NE=;
 b=DcS/3I6ZLoojnSxAApn6gSAlgqQXwRnp8eWCGRusgXAwhLfwhFeFNljQXP9kGr/dDQ
 fi8KN1tAErEWtBUxrCBeXFgT4XLvaOrG3lNT+fu4LYArZWexr+9e7LmVvbnSWWnaa1H/
 AlQj13lUAV3iNfPYPBFZqyePxglpxKl9+d/0mi/ZnhBGcCCMpIE4iLuG98VCIC3lZCDI
 SrVHhHGn9IhFioXGmWBvP3BsFpJhfzaZvF5wPs4BZR3eieBb3uxRtaVKqzNhJRZfm75x
 E9vrbOw2xT5nr5GBiMoNEJZ/20k7lbfCibx2Nf5JZaAJpUWyBuq13NJOh9kgoRR8Y5Cs
 Om6g==
X-Gm-Message-State: AOAM532d3Ct0QQAVAAJ3CHsqBROVXoz+G6rX/tb5+Zd/J19sE94fhx/p
 uuW8/yTIc/Wb6NBw56NPey/iZ3JbOdGy6DAYh9eiFYhvDBbBtJMOkHSg/36CMBddZRWniYaPzAW
 VMKKiUpVFN0Pk7P9t6zQbVBYdrQ==
X-Received: by 2002:a37:a557:: with SMTP id o84mr5316599qke.323.1627056770355; 
 Fri, 23 Jul 2021 09:12:50 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxzYXo962QZa+/2DWnJ5qoJGgdqtJlvieTRJp2rDEjkb+nPOP4CbJIp7neDMagHLOxSUTHzkQ==
X-Received: by 2002:a37:a557:: with SMTP id o84mr5316567qke.323.1627056770077; 
 Fri, 23 Jul 2021 09:12:50 -0700 (PDT)
Received: from Ruby.lyude.net (pool-108-49-102-102.bstnma.fios.verizon.net.
 [108.49.102.102])
 by smtp.gmail.com with ESMTPSA id c11sm11667633qth.29.2021.07.23.09.12.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 23 Jul 2021 09:12:49 -0700 (PDT)
Message-ID: <d529bd638b394c7c918ff4753cf5cf18afc99989.camel@redhat.com>
From: Lyude Paul <lyude@redhat.com>
To: Daniel Vetter <daniel@ffwll.ch>, Arnd Bergmann <arnd@kernel.org>
Date: Fri, 23 Jul 2021 12:12:47 -0400
In-Reply-To: <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
References: <20210723091534.1730564-1-arnd@kernel.org>
 <CAKMK7uHG0T7kgHzrkxoGj+Cv1-5f=GaH1CviunoZd_wEL5G4YQ@mail.gmail.com>
Organization: Red Hat
User-Agent: Evolution 3.38.4 (3.38.4-1.fc33)
MIME-Version: 1.0
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=lyude@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH] drm/nouveau/kms/nv50-: fix build failure with
 CONFIG_BACKLIGHT=n
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
Cc: Arnd Bergmann <arnd@arndb.de>, David Airlie <airlied@linux.ie>,
 Nouveau Dev <nouveau@lists.freedesktop.org>,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Nikola Cornij <nikola.cornij@amd.com>, Ben Skeggs <bskeggs@redhat.com>,
 Ville =?ISO-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyMDIxLTA3LTIzIGF0IDExOjI0ICswMjAwLCBEYW5pZWwgVmV0dGVyIHdyb3RlOgo+
IE9uIEZyaSwgSnVsIDIzLCAyMDIxIGF0IDExOjE1IEFNIEFybmQgQmVyZ21hbm4gPGFybmRAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4gPiAKPiA+IEZyb206IEFybmQgQmVyZ21hbm4gPGFybmRAYXJuZGIu
ZGU+Cj4gPiAKPiA+IFdoZW4gdGhlIGJhY2tsaWdodCBzdXBwb3J0IGlzIGRpc2FibGVkLCB0aGUg
ZHJpdmVyIGZhaWxzIHRvIGJ1aWxkOgo+ID4gCj4gPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmM6IEluIGZ1bmN0aW9uCj4gPiAnbnY1MF9zb3JfYXRvbWljX2Rpc2FibGUn
Ogo+ID4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjE2NjU6NTk6IGVy
cm9yOiAnc3RydWN0Cj4gPiBub3V2ZWF1X2Nvbm5lY3RvcicgaGFzIG5vIG1lbWJlciBuYW1lZCAn
YmFja2xpZ2h0Jwo+ID4gwqAxNjY1IHzCoMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2Jh
Y2tsaWdodCAqYmFja2xpZ2h0ID0gbnZfY29ubmVjdG9yLQo+ID4gPmJhY2tsaWdodDsKPiA+IMKg
wqDCoMKgwqAgfMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIF5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNw
LmM6MTY3MDozNTogZXJyb3I6IGludmFsaWQgdXNlIG9mCj4gPiB1bmRlZmluZWQgdHlwZSAnc3Ry
dWN0IG5vdXZlYXVfYmFja2xpZ2h0Jwo+ID4gwqAxNjcwIHzCoMKgwqDCoMKgwqDCoMKgIGlmIChi
YWNrbGlnaHQgJiYgYmFja2xpZ2h0LT51c2VzX2RwY2QpIHsKPiA+IMKgwqDCoMKgwqAgfMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIF5+Cj4gPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6MTY3
MTo2NDogZXJyb3I6IGludmFsaWQgdXNlIG9mCj4gPiB1bmRlZmluZWQgdHlwZSAnc3RydWN0IG5v
dXZlYXVfYmFja2xpZ2h0Jwo+ID4gwqAxNjcxIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoCByZXQgPSBkcm1fZWRwX2JhY2tsaWdodF9kaXNhYmxlKGF1eCwgJmJhY2tsaWdodC0KPiA+
ID5lZHBfaW5mbyk7Cj4gPiDCoMKgwqDCoMKgIHzCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgXn4KPiA+IAo+ID4gVGhl
IHBhdGNoIHRoYXQgaW50cm9kdWNlZCB0aGUgcHJvYmxlbSBhbHJlYWR5IGNvbnRhaW5zIHNvbWUg
I2lmZGVmCj4gPiBjaGVja3MsIHNvIGp1c3QgYWRkIGFub3RoZXIgb25lIHRoYXQgbWFrZXMgaXQg
YnVpbGQgYWdhaW4uCj4gPiAKPiA+IEZpeGVzOiA2ZWNhMzEwZTg5MjQgKCJkcm0vbm91dmVhdS9r
bXMvbnY1MC06IEFkZCBiYXNpYyBEUENEIGJhY2tsaWdodAo+ID4gc3VwcG9ydCBmb3Igbm91dmVh
dSIpCj4gPiBTaWduZWQtb2ZmLWJ5OiBBcm5kIEJlcmdtYW5uIDxhcm5kQGFybmRiLmRlPgo+IAo+
IENhbiB3ZSBqdXN0IHRvc3MgdGhlIGlkZWEgdGhhdCBCQUNLVExJR0hUPW4gaXMgYSByZWFzb25h
YmxlIGNvbmZpZyBmb3IKPiBkcm0gZHJpdmVycyB1c2luZyBiYWNrbGlnaHRzLCBhbmQgYWRkIGRl
cGVuZHMgQkFDS0xJR0hUIHRvIGFsbCBvZgo+IHRoZW0/CgpZZWFoIC0gSSdtIGZpbmUgd2l0aCB0
aGlzIElNSE8sIGF0IGxlYXN0IGZvciB0aGUgZHJpdmVycyBhY3R1YWxseSBzdXBwb3J0aW5nCmJh
Y2tsaWdodHMgaW4gc29tZSBtYW5uZXIgKEkgYXNzdW1lIHRoaXMgaXMgbW9zdCBvZiB0aGVtIHRo
b3VnaCkKCj4gCj4gSSBtZWFuIHRoaXMgaXMgYSBwZXJmZWN0IHNvdXJjZSBvZiBjb250aW51ZWQg
cGF0Y2ggc3RyZWFtcyB0byBrZWVwIHVzCj4gYWxsIGJ1c3ksIGJ1dCBiZXlvbmQgdGhhdCBJIHJl
YWxseSBkb24ndCBzZWUgdGhlIHBvaW50IC4uLiBJIGZyYW5rbHkKPiBoYXZlIGJldHRlciB0aGlu
Z3MgdG8gZG8sIGFuZCBlc3BlY2lhbGx5IHdpdGggdGhlIGJpZyBkcml2ZXJzIHdlIGhhdmUKPiBt
YWtpbmcgYmFja2xpZ2h0IG9wdGlvbmFsIHNhdmVzIGNvbXBhcml0aXZlbHkgbm90aGluZy4KPiAt
RGFuaWVsCj4gCj4gPiAtLS0KPiA+IMKgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jIHwgMTEgKysrKysrKy0tLS0KPiA+IMKgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9u
cygrKSwgNCBkZWxldGlvbnMoLSkKPiA+IAo+ID4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+ID4gYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9k
aXNwbnY1MC9kaXNwLmMKPiA+IGluZGV4IDA5M2UxZjcxNjNiMy4uZmNmNTNlMjRkYjIxIDEwMDY0
NAo+ID4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gPiAr
KysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiA+IEBAIC0xNjU5
LDIwICsxNjU5LDIzIEBAIHN0YXRpYyB2b2lkCj4gPiDCoG52NTBfc29yX2F0b21pY19kaXNhYmxl
KHN0cnVjdCBkcm1fZW5jb2RlciAqZW5jb2Rlciwgc3RydWN0Cj4gPiBkcm1fYXRvbWljX3N0YXRl
ICpzdGF0ZSkKPiA+IMKgewo+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IG5vdXZlYXVfZW5jb2Rl
ciAqbnZfZW5jb2RlciA9IG5vdXZlYXVfZW5jb2RlcihlbmNvZGVyKTsKPiA+IC3CoMKgwqDCoMKg
wqAgc3RydWN0IG5vdXZlYXVfZHJtICpkcm0gPSBub3V2ZWF1X2RybShudl9lbmNvZGVyLT5iYXNl
LmJhc2UuZGV2KTsKPiA+IMKgwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2NydGMgKm52X2Ny
dGMgPSBub3V2ZWF1X2NydGMobnZfZW5jb2Rlci0+Y3J0Yyk7Cj4gPiDCoMKgwqDCoMKgwqDCoCBz
dHJ1Y3Qgbm91dmVhdV9jb25uZWN0b3IgKm52X2Nvbm5lY3RvciA9Cj4gPiBudjUwX291dHBfZ2V0
X29sZF9jb25uZWN0b3Ioc3RhdGUsIG52X2VuY29kZXIpOwo+ID4gLcKgwqDCoMKgwqDCoCBzdHJ1
Y3Qgbm91dmVhdV9iYWNrbGlnaHQgKmJhY2tsaWdodCA9IG52X2Nvbm5lY3Rvci0+YmFja2xpZ2h0
Owo+ID4gwqDCoMKgwqDCoMKgwqAgc3RydWN0IGRybV9kcF9hdXggKmF1eCA9ICZudl9jb25uZWN0
b3ItPmF1eDsKPiA+IC3CoMKgwqDCoMKgwqAgaW50IHJldDsKPiA+IMKgwqDCoMKgwqDCoMKgIHU4
IHB3cjsKPiA+IAo+ID4gKyNpZmRlZiBDT05GSUdfRFJNX05PVVZFQVVfQkFDS0xJR0hUCj4gPiAr
wqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0obnZfZW5j
b2Rlci0+YmFzZS5iYXNlLmRldik7Cj4gPiArwqDCoMKgwqDCoMKgIHN0cnVjdCBub3V2ZWF1X2Jh
Y2tsaWdodCAqYmFja2xpZ2h0ID0gbnZfY29ubmVjdG9yLT5iYWNrbGlnaHQ7Cj4gPiArCj4gPiDC
oMKgwqDCoMKgwqDCoCBpZiAoYmFja2xpZ2h0ICYmIGJhY2tsaWdodC0+dXNlc19kcGNkKSB7Cj4g
PiAtwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCByZXQgPSBkcm1fZWRwX2JhY2tsaWdodF9k
aXNhYmxlKGF1eCwgJmJhY2tsaWdodC0KPiA+ID5lZHBfaW5mbyk7Cj4gPiArwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoCBpbnQgcmV0ID0gZHJtX2VkcF9iYWNrbGlnaHRfZGlzYWJsZShhdXgs
ICZiYWNrbGlnaHQtCj4gPiA+ZWRwX2luZm8pOwo+ID4gKwo+ID4gwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgIGlmIChyZXQgPCAwKQo+ID4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBOVl9FUlJPUihkcm0sICJGYWlsZWQgdG8gZGlzYWJsZSBiYWNr
bGlnaHQgb24KPiA+IFtDT05ORUNUT1I6JWQ6JXNdOiAlZFxuIiwKPiA+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgbnZfY29u
bmVjdG9yLT5iYXNlLmJhc2UuaWQsIG52X2Nvbm5lY3Rvci0KPiA+ID5iYXNlLm5hbWUsIHJldCk7
Cj4gPiDCoMKgwqDCoMKgwqDCoCB9Cj4gPiArI2VuZGlmCj4gPiAKPiA+IMKgwqDCoMKgwqDCoMKg
IGlmIChudl9lbmNvZGVyLT5kY2ItPnR5cGUgPT0gRENCX09VVFBVVF9EUCkgewo+ID4gwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludCByZXQgPSBkcm1fZHBfZHBjZF9yZWFkYihhdXgs
IERQX1NFVF9QT1dFUiwgJnB3cik7Cj4gPiAtLQo+ID4gMi4yOS4yCj4gPiAKPiAKPiAKCi0tIApD
aGVlcnMsCiBMeXVkZSBQYXVsIChzaGUvaGVyKQogU29mdHdhcmUgRW5naW5lZXIgYXQgUmVkIEhh
dAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
