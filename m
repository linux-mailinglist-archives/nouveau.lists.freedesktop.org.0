Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5247C7E420D
	for <lists+nouveau@lfdr.de>; Tue,  7 Nov 2023 15:47:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC40210E0C8;
	Tue,  7 Nov 2023 14:47:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4A8DE10E0C8
 for <nouveau@lists.freedesktop.org>; Tue,  7 Nov 2023 14:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1699368470;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=neTWVxdAEGaA7mxFRHRl+na5daI4i0Yj7E7J4gq760E=;
 b=g+8cg9uJ6M9Rdmw5OrJ3rSmg3wF98gXFHLMy9EySQJgcTEPENtS/s19gsqD+myE2qhPhy0
 x7LIjM4Zb8/76E1jVlJKNi/X6mDuSePcfwL6LDeLAJheavZ8HnssEZ73CFa51jnIxfcYTu
 9r/wmjf2A7ARHlBysnswoG4F0E/2OnQ=
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-220-dFqfsa4qM5aaS4d1xl5qqQ-1; Tue, 07 Nov 2023 09:47:25 -0500
X-MC-Unique: dFqfsa4qM5aaS4d1xl5qqQ-1
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-66cfa898cfeso11341486d6.0
 for <nouveau@lists.freedesktop.org>; Tue, 07 Nov 2023 06:47:25 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1699368444; x=1699973244;
 h=mime-version:user-agent:content-transfer-encoding:references
 :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=neTWVxdAEGaA7mxFRHRl+na5daI4i0Yj7E7J4gq760E=;
 b=uSviMoB0XhKPWIl0b3NobbM4Xz2habsrLv8ExJNKYnYhF31pLyznFz04Khsq0yv+AV
 5uvI3lOuQXaHoZPR6DwXpw9yXD2vhUn+szK5HxthJBKiR+n5BIpcZlk/BYN+vTmeYb2q
 iPy1CTmUl2zyzCQ/HzlHU8oHoKEPcAw/qS5bpawUJ7J37i7MGcoCwwjvEfC1utzeJE2A
 J+EkcOVVxdRPXAX+DUfyCgRWnFFdiNrfnN/ELt8Q/EKLxSFGTyx/xQ7gu5g1Tx/T3qLv
 U/zOC15w2HGLRvuZmTlTUAmPxAJ8cgEmaP4Gq3YI1/2DfslLPjq+qrACW/vlz4K0JAR0
 Z1Mw==
X-Gm-Message-State: AOJu0Yz/idTZCca88V013WZvyLiIkO+rwB2XuV98gx39VOWcekhwgYxn
 Ck+l9llw5miooIwPs5bftG8GuO+Ll9WPge3UD+6uS2VWX8k1puF5H6h8gRq82GSM5/egY1Sx5P0
 SFREcX316y9ibBXJpvBIkWg+YYD3ZpYyUfw==
X-Received: by 2002:a0c:e845:0:b0:670:d117:1f9e with SMTP id
 l5-20020a0ce845000000b00670d1171f9emr29123800qvo.2.1699368444725; 
 Tue, 07 Nov 2023 06:47:24 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG0yYiFosBWuVDRIeOPH3C+W2EM2KDIu2fFUTLceb7rrhJyZGcIICEfuH1kXYtEG6/e4KYlWw==
X-Received: by 2002:a0c:e845:0:b0:670:d117:1f9e with SMTP id
 l5-20020a0ce845000000b00670d1171f9emr29123786qvo.2.1699368444500; 
 Tue, 07 Nov 2023 06:47:24 -0800 (PST)
Received: from pstanner-thinkpadt14sgen1.remote.csb
 ([2001:9e8:32c0:300:227b:d2ff:fe26:2a7a])
 by smtp.gmail.com with ESMTPSA id
 o14-20020a05620a130e00b007757fefea79sm4195604qkj.130.2023.11.07.06.47.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Nov 2023 06:47:24 -0800 (PST)
Message-ID: <3dd2cd0407c19480b895a9af1423d6ac7269a039.camel@redhat.com>
From: Philipp Stanner <pstanner@redhat.com>
To: Dan Carpenter <dan.carpenter@linaro.org>
Date: Tue, 07 Nov 2023 15:47:22 +0100
In-Reply-To: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
References: <3554c52a-d500-4c8e-913f-c2a32a1f7a4d@moroto.mountain>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: base64
Subject: Re: [Nouveau] [bug report] drm/nouveau/gsp/r535: add support for
 booting GSP-RM
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
Cc: nouveau@lists.freedesktop.org
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDIzLTExLTA3IGF0IDE3OjM0ICswMzAwLCBEYW4gQ2FycGVudGVyIHdyb3RlOgo+
IEhlbGxvIEJlbiBTa2VnZ3MsCgpIaSwKCkZZSSwgQmVuIGlzIG5vdCBtYWludGFpbmluZyBOb3V2
ZWF1IGFueW1vcmUuIFRoZSBNQUlOVEFJTkVSUyBmaWxlIGhhcwpiZWVuIHVwZGF0ZWQgaW4gdGhh
dCByZWdhcmQuCgpQLgoKPiAKPiBUaGUgcGF0Y2ggMTc2ZmRjYmRkZmQyOiAiZHJtL25vdXZlYXUv
Z3NwL3I1MzU6IGFkZCBzdXBwb3J0IGZvcgo+IGJvb3RpbmcgR1NQLVJNIiBmcm9tIFNlcCAxOSwg
MjAyMyAobGludXgtbmV4dCksIGxlYWRzIHRvIHRoZQo+IGZvbGxvd2luZyBTbWF0Y2ggc3RhdGlj
IGNoZWNrZXIgd2FybmluZzoKPiAKPiDCoMKgwqDCoMKgwqDCoMKgZHJpdmVycy9ncHUvZHJtL25v
dXZlYXUvbnZrbS9zdWJkZXYvZ3NwL3I1MzUuYzoxMDE2Cj4gcjUzNV9nc3BfcnBjX3VubG9hZGlu
Z19ndWVzdF9kcml2ZXIoKQo+IMKgwqDCoMKgwqDCoMKgwqB3YXJuOiAncnBjJyBpc24ndCBhbiBF
UlJfUFRSCj4gCj4gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3NwL3I1MzUu
Ywo+IMKgwqDCoCAxMDEwIHN0YXRpYyBpbnQKPiDCoMKgwqAgMTAxMSByNTM1X2dzcF9ycGNfdW5s
b2FkaW5nX2d1ZXN0X2RyaXZlcihzdHJ1Y3QgbnZrbV9nc3AgKmdzcCwKPiBib29sIHN1c3BlbmQp
Cj4gwqDCoMKgIDEwMTIgewo+IMKgwqDCoCAxMDEzwqDCoMKgwqDCoMKgwqDCoCBycGNfdW5sb2Fk
aW5nX2d1ZXN0X2RyaXZlcl92MUZfMDcgKnJwYzsKPiDCoMKgwqAgMTAxNCAKPiDCoMKgwqAgMTAx
NcKgwqDCoMKgwqDCoMKgwqAgcnBjID0gbnZrbV9nc3BfcnBjX2dldChnc3AsCj4gTlZfVkdQVV9N
U0dfRlVOQ1RJT05fVU5MT0FESU5HX0dVRVNUX0RSSVZFUiwgc2l6ZW9mKCpycGMpKTsKPiAKPiBu
dmttX2dzcF9ycGNfZ2V0KCkgcmV0dXJucyBOVUxMIG9uIGVycm9yLgo+IAo+IC0tPiAxMDE2wqDC
oMKgwqDCoMKgwqDCoCBpZiAoSVNfRVJSKHJwYykpCj4gwqDCoMKgIDEwMTfCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCByZXR1cm4gUFRSX0VSUihycGMpOwo+IMKgwqDCoCAxMDE4IAo+
IMKgwqDCoCAxMDE5wqDCoMKgwqDCoMKgwqDCoCBpZiAoc3VzcGVuZCkgewo+IMKgwqDCoCAxMDIw
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnBjLT5iSW5QTVRyYW5zaXRpb24gPSAx
Owo+IMKgwqDCoCAxMDIxwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgcnBjLT5iR2M2
RW50ZXJpbmcgPSAwOwo+IMKgwqDCoCAxMDIywqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqAgcnBjLT5uZXdMZXZlbCA9Cj4gTlYyMDgwX0NUUkxfR1BVX1NFVF9QT1dFUl9TVEFURV9HUFVf
TEVWRUxfMzsKPiDCoMKgwqAgMTAyM8KgwqDCoMKgwqDCoMKgwqAgfSBlbHNlIHsKPiDCoMKgwqAg
MTAyNMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJwYy0+YkluUE1UcmFuc2l0aW9u
ID0gMDsKPiDCoMKgwqAgMTAyNcKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIHJwYy0+
YkdjNkVudGVyaW5nID0gMDsKPiDCoMKgwqAgMTAyNsKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgIHJwYy0+bmV3TGV2ZWwgPQo+IE5WMjA4MF9DVFJMX0dQVV9TRVRfUE9XRVJfU1RBVEVf
R1BVX0xFVkVMXzA7Cj4gwqDCoMKgIDEwMjfCoMKgwqDCoMKgwqDCoMKgIH0KPiDCoMKgwqAgMTAy
OCAKPiDCoMKgwqAgMTAyOcKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIG52a21fZ3NwX3JwY193cihn
c3AsIHJwYywgdHJ1ZSk7Cj4gwqDCoMKgIDEwMzAgfQo+IAo+IHJlZ2FyZHMsCj4gZGFuIGNhcnBl
bnRlcgo+IAoK

