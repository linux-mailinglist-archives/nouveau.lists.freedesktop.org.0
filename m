Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 640073640A9
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:43:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7496588ED6;
	Mon, 19 Apr 2021 11:43:10 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 744756E214
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832588;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=C8Y5CVyN1MP/Z8t2JSwEW5URSTlMomMVuaaYfv0oBM0=;
 b=dvOaGU3Xjwelx3vXo09K4YYf5HZxBiYt4QCGGFyPQrJmkpgqqpCaDVvALwBUhij3+Mv2PN
 mrWNCGFejujNXVFjp3fiGkW1JOezJQGzGlFE87l7aMmyz/rZBAQyBukVWHYI0A8mIBHp/8
 lpFqcLhE0Lu3Mdbu16PxnykNP3RHypI=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-142-_u1PDmCuMHWkqXO5jclwtg-1; Mon, 19 Apr 2021 07:43:05 -0400
X-MC-Unique: _u1PDmCuMHWkqXO5jclwtg-1
Received: by mail-wr1-f71.google.com with SMTP id
 p10-20020a5d68ca0000b0290102982b78eeso8938765wrw.16
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:43:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=C8Y5CVyN1MP/Z8t2JSwEW5URSTlMomMVuaaYfv0oBM0=;
 b=DjB/u/R+HpehD7IcKyCPCzORVrW7GMIio2czagdYS4H50tzaWZCbG+6B4g9sBoB4Ck
 9Juab+kmzC+zMCTfeP4k7oNyFhWvmPHXalq178LDDq6VQ/RmGNEArufpvuQ2vRMx5ioi
 JAfxTDopaMzk6+VwMfadmBLHfu0Ja3sp70EQCRBgGiaEnLXpVEb+3P7vQUKoQymbH2X3
 irp3Aw5SLRT+D/7LXjerYjlQlUwLshzXAvxf9i5s8TvCUJZx2gs3LdyblJzWBolKvCuT
 MZ2YL6+E2aUbitAK7zSRN4jDM3qoBhhTk54/WvFBblfVE0QzGGhzZHi+AshPLT1X+ppU
 y59A==
X-Gm-Message-State: AOAM532v41dqigFllYKJYtYQ2CPdWOqMjXm4L0MVn/cetXSxpXw4KnxG
 iLThy5sw8PF3JhH6o0zm3jVyy5sJJdgl6XABKd8whGIkvp8wQaSxrhhHUODZ0/D7Cl0+4iGhi3X
 +MVfNoxPuPF0oyKjNvUvpCZm2WgG8qYG4T0kBR4vA1A==
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13538359wrd.177.1618832584174; 
 Mon, 19 Apr 2021 04:43:04 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyfQUBy2vieiz4RATYX7I0oL2DB8pFKAjVreQXmtZ/buDJbNPRvIUWMiZeyhXngE0AQn6P4cMUuzFKThM/G5Hg=
X-Received: by 2002:a5d:58fa:: with SMTP id f26mr13538343wrd.177.1618832584067; 
 Mon, 19 Apr 2021 04:43:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-3-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-3-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:42:53 +0200
Message-ID: <CACO55tu_DT++t-0Jpf2ksa=poPmyMZH5gDpOLq7gBj6BR7_AJg@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 02/40] drm/nouveau/dispnv50/disp: Remove
 unused variable 'ret'
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
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>, Ben Skeggs <bskeggs@redhat.com>,
 Daniel Vetter <daniel@ffwll.ch>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgNDozNyBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzox
MzgxOjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKAmSBzZXQgYnV0IG5vdCB1c2VkIFstV3Vu
dXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+Cgpub3QgYSBiaWcgZmFuIG9mIGp1c3QgaWdub3Jpbmcg
cmV0dXJuIGNvZGVzLCBJJ2QgcmF0aGVyIHNlZSBpdCBoYW5kbGVkCnNvbWVob3csIHVubGVzcyBz
b21lYm9keSBrbm93aW5nIG1vcmUgYWJvdXQgdGhlIGRldGFpbHMgaGVyZSBzYXlzIGl0J3MKb2th
eS4KCj4gQ2M6IEJlbiBTa2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4KPiBDYzogRGF2aWQgQWly
bGllIDxhaXJsaWVkQGxpbnV4LmllPgo+IENjOiBEYW5pZWwgVmV0dGVyIDxkYW5pZWxAZmZ3bGwu
Y2g+Cj4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBDYzogbm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMZWUgSm9uZXMgPGxlZS5qb25l
c0BsaW5hcm8ub3JnPgo+IC0tLQo+ICBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9k
aXNwLmMgfCAzICstLQo+ICAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDIgZGVsZXRp
b25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAv
ZGlzcC5jIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jCj4gaW5kZXgg
MWM5YzBjZGY4NWRiYy4uNDgwMWFhZmQ5NTUyYiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVh
dS9kaXNwbnY1MC9kaXNwLmMKPiBAQCAtMTQxMCwxMCArMTQxMCw5IEBAIG52NTBfbXN0bV9wcmVw
YXJlKHN0cnVjdCBudjUwX21zdG0gKm1zdG0pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBub3V2ZWF1
X2RybSAqZHJtID0gbm91dmVhdV9kcm0obXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7Cj4gICAg
ICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7Cj4gLSAgICAgICBpbnQgcmV0Owo+Cj4g
ICAgICAgICBOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gcHJlcGFyZVxuIiwgbXN0bS0+b3V0cC0+
YmFzZS5iYXNlLm5hbWUpOwo+IC0gICAgICAgcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3Bh
cnQxKCZtc3RtLT5tZ3IpOwo+ICsgICAgICAgZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQxKCZt
c3RtLT5tZ3IpOwo+Cj4gICAgICAgICBkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNvZGVyLCBtc3Rt
LT5vdXRwLT5iYXNlLmJhc2UuZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGlmIChlbmNvZGVyLT5l
bmNvZGVyX3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewo+IC0tCj4gMi4yNy4wCj4K
PiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZl
YXUgbWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKCl9fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBs
aXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
