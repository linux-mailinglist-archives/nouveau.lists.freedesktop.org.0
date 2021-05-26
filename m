Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A08EA3915CC
	for <lists+nouveau@lfdr.de>; Wed, 26 May 2021 13:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFB786EC82;
	Wed, 26 May 2021 11:17:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5BA76EC82
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 11:17:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622027820;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=WZhb8zuVnnjhU4y7wnecCuH3x05R6lnJG5XgPPhjXY0=;
 b=SQ+vZyPsA/ceVLHoE8GHvNLwswQPrPSXDLYzp7gSosiy2d5NcpgYGlDxI0gbNHXkO1gUMx
 cnmAaITpQsTqgjwU19KH4XuAz/W8sslklao7XAKI8OZK3HBhnpcdtXIP3IOydr5+EJ6dAd
 IyscvHMvaZn+5Cixuco9lEHKNgMNn1E=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-518-WJu3zQ-mOmiW9T1kZhOIZw-1; Wed, 26 May 2021 07:16:58 -0400
X-MC-Unique: WJu3zQ-mOmiW9T1kZhOIZw-1
Received: by mail-wr1-f72.google.com with SMTP id
 u5-20020adf9e050000b029010df603f280so228787wre.18
 for <nouveau@lists.freedesktop.org>; Wed, 26 May 2021 04:16:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=WZhb8zuVnnjhU4y7wnecCuH3x05R6lnJG5XgPPhjXY0=;
 b=ImDR/MrbstC3kwkNpV2sZiTdL8K8ASvLh7c/RciXzhLKhWftauS8MzTG+TypmLBtxr
 1hbakRKmNKYMhH7uUUspdpF2ZM8lhhsMTKMnaq4oQif6Givc2PSbYcVQwa+mPlYjoN1J
 r1pbZdqGqCFI3nwRr0ha6ny9TsIpz60CXWyuc4amFEJT38CjhOMpb72BDuC7MeC+6+S2
 r5YkrSfOVfhEkzQk+rO76p27Vg5JDTGXKbpNr1iM7SsduH7qaH96yd7aBa/Yx69ZI1Y0
 2Q8KGkHA9YRY9fvBVJpuK0pSJyFS1S/yz9i66vuQRRLzje+wQOfsiuaumGH8DvM/AXFj
 WY4Q==
X-Gm-Message-State: AOAM533IIJg8MyXaVikGSgxD5afoMyO71LxatWAsFcFLBAw5bZnhXO+Q
 ZEl2jou1LD7dZsBxi8vlWLOYzWR4DpbBjpEziytZl2lHQnMSY7nVpcf+mjGZszjQK8eiAmscn7V
 Vic/Q/6buBmmC34wNgYO/n1QxL8U6EengaW5k/QwEvQ==
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr30747656wrq.177.1622027816822; 
 Wed, 26 May 2021 04:16:56 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJxC/kfOOQw4CwfWnJy7tsT5TwYrdsCpahCbg0flnKAJcY+E6BvxvK01g0k+BcUw5O2u46vOYYCfvWQxIboZsY8=
X-Received: by 2002:a5d:4a81:: with SMTP id o1mr30747629wrq.177.1622027816562; 
 Wed, 26 May 2021 04:16:56 -0700 (PDT)
MIME-Version: 1.0
References: <20210526084726.552052-1-lee.jones@linaro.org>
 <20210526084726.552052-12-lee.jones@linaro.org>
In-Reply-To: <20210526084726.552052-12-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 26 May 2021 13:16:46 +0200
Message-ID: <CACO55tuGiW=e+ee83jhvQOJxA+tedH5r_pHS+ESbEQVABgfvnQ@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 11/34] drm/nouveau/nvkm/subdev/mc/tu102: Make
 functions called by reference static
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
 Alistair Popple <apopple@nvidia.com>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBNYXkgMjYsIDIwMjEgYXQgMTA6NDcgQU0gTGVlIEpvbmVzIDxsZWUuam9uZXNAbGlu
YXJvLm9yZz4gd3JvdGU6Cj4KPiBGaXhlcyB0aGUgZm9sbG93aW5nIFc9MSBrZXJuZWwgYnVpbGQg
d2FybmluZyhzKToKPgo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9tYy90
dTEwMi5jOjUwOjE6IHdhcm5pbmc6IG5vIHByZXZpb3VzIHByb3RvdHlwZSBmb3Ig4oCYdHUxMDJf
bWNfaW50cl91bmFybeKAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4gIGRyaXZlcnMvZ3B1L2Ry
bS9ub3V2ZWF1L252a20vc3ViZGV2L21jL3R1MTAyLmM6NjI6MTogd2FybmluZzogbm8gcHJldmlv
dXMgcHJvdG90eXBlIGZvciDigJh0dTEwMl9tY19pbnRyX3JlYXJt4oCZIFstV21pc3NpbmctcHJv
dG90eXBlc10KPiAgZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbWMvdHUxMDIu
Yzo3NDoxOiB3YXJuaW5nOiBubyBwcmV2aW91cyBwcm90b3R5cGUgZm9yIOKAmHR1MTAyX21jX2lu
dHJfbWFza+KAmSBbLVdtaXNzaW5nLXByb3RvdHlwZXNdCj4KPiBDYzogQmVuIFNrZWdncyA8YnNr
ZWdnc0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4g
Q2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogQWxpc3RhaXIgUG9wcGxl
IDxhcG9wcGxlQG52aWRpYS5jb20+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKPiBDYzogbm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBM
ZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9tYy90dTEwMi5jIHwgNiArKystLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2
ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9tYy90dTEwMi5jIGIvZHJpdmVycy9ncHUv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvbWMvdHUxMDIuYwo+IGluZGV4IDU4ZGI4M2ViYWRjNWYu
LmE5NjA4NGIzNGE3ODggMTAwNjQ0Cj4gLS0tIGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvbWMvdHUxMDIuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252a20v
c3ViZGV2L21jL3R1MTAyLmMKPiBAQCAtNDYsNyArNDYsNyBAQCB0dTEwMl9tY19pbnRyX3VwZGF0
ZShzdHJ1Y3QgdHUxMDJfbWMgKm1jKQo+ICAgICAgICAgICAgICAgICBudmttX3dyMzIoZGV2aWNl
LCAweGI4MTYxMCwgMHg2KTsKPiAgfQo+Cj4gLXZvaWQKPiArc3RhdGljIHZvaWQKPiAgdHUxMDJf
bWNfaW50cl91bmFybShzdHJ1Y3QgbnZrbV9tYyAqYmFzZSkKPiAgewo+ICAgICAgICAgc3RydWN0
IHR1MTAyX21jICptYyA9IHR1MTAyX21jKGJhc2UpOwo+IEBAIC01OCw3ICs1OCw3IEBAIHR1MTAy
X21jX2ludHJfdW5hcm0oc3RydWN0IG52a21fbWMgKmJhc2UpCj4gICAgICAgICBzcGluX3VubG9j
a19pcnFyZXN0b3JlKCZtYy0+bG9jaywgZmxhZ3MpOwo+ICB9Cj4KPiAtdm9pZAo+ICtzdGF0aWMg
dm9pZAo+ICB0dTEwMl9tY19pbnRyX3JlYXJtKHN0cnVjdCBudmttX21jICpiYXNlKQo+ICB7Cj4g
ICAgICAgICBzdHJ1Y3QgdHUxMDJfbWMgKm1jID0gdHUxMDJfbWMoYmFzZSk7Cj4gQEAgLTcwLDcg
KzcwLDcgQEAgdHUxMDJfbWNfaW50cl9yZWFybShzdHJ1Y3QgbnZrbV9tYyAqYmFzZSkKPiAgICAg
ICAgIHNwaW5fdW5sb2NrX2lycXJlc3RvcmUoJm1jLT5sb2NrLCBmbGFncyk7Cj4gIH0KPgo+IC12
b2lkCj4gK3N0YXRpYyB2b2lkCj4gIHR1MTAyX21jX2ludHJfbWFzayhzdHJ1Y3QgbnZrbV9tYyAq
YmFzZSwgdTMyIG1hc2ssIHUzMiBpbnRyKQo+ICB7Cj4gICAgICAgICBzdHJ1Y3QgdHUxMDJfbWMg
Km1jID0gdHUxMDJfbWMoYmFzZSk7Cj4gLS0KPiAyLjMxLjEKPgo+IF9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCj4gTm91dmVhdSBtYWlsaW5nIGxpc3QKPiBO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Au
b3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQoKUmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8
a2hlcmJzdEByZWRoYXQuY29tPgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1Cg==
