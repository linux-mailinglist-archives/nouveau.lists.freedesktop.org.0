Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA6763640CF
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:47:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F9266E255;
	Mon, 19 Apr 2021 11:47:11 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 44EE16E255
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:47:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832828;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=lodamhupIClPRvQVAJcc8N1PrnJrjvEQCs2vDJeC4is=;
 b=MnF/lBntby0OCF9A9DjfAjH79Hw0IA8qcnqsftDGGpJf1UUuCq/rPbDWmsM7+kdP4EPwd/
 K9HJ06f4quAT376NM4WHbff5ewTAMRB+ebF4jeVAbUWv6y9Dm4nww3NemVA672ESNlX6Th
 AQdyHeun7nMpm1RRMLM7cqjX+PYPkaI=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-184-5n7rakCcMlWg-XkU-NOPFg-1; Mon, 19 Apr 2021 07:47:06 -0400
X-MC-Unique: 5n7rakCcMlWg-XkU-NOPFg-1
Received: by mail-wr1-f69.google.com with SMTP id
 s9-20020a5d51090000b02901028ea30da6so8891975wrt.7
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:47:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lodamhupIClPRvQVAJcc8N1PrnJrjvEQCs2vDJeC4is=;
 b=S5ukDMf8E0isfkVzmuWPPzZDK1iW818TGrWyjgxzj8i9gShLeh632d7hDnPf9jvoW4
 JKiDH1PyZnrRfTUtwxTuScpuIYOq7BbOM07zXesfOUjDWZjH4QAyXilJZLpagFZfOaKp
 Pg/MgKb/bL1DIV0fAl148ft0fLywimGGieHt8gPewvDTpMYyUBTvqToTJ3DERVUQBIJA
 KcrsNLLRYpGRAnWUNox6ib2ygoLDSKNBvwO7EP99Es3wUPeSfMbcAg8ZkjCBwCuM2LrO
 bimM/CnyLKvZZ7ObtTyDhMgvD+l31g5JXEUcxMy1nNalzpaNfhXTKmnpXDaCNtLw17f7
 JL8A==
X-Gm-Message-State: AOAM530aglb2XJ97dg8NiVIHun4cNWhezB8zAuo7f6ZBfel6WMh33wHX
 FRgCWl+WsVf39T2aDfFzTS/DQmaWR+BFe5NcpBpBf7uIuMzM6u81VjM9AXOq3kOgl45CgcIwkDf
 KGwAQ0c6/4TJEZH/WXRC2i4VuPAMGS+q55fiOIjovgg==
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr21149954wma.164.1618832825756; 
 Mon, 19 Apr 2021 04:47:05 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwz2DBi+eaf78G0k67QC0inXD2fGPAwhGBsJQeP4aS5Z+prjC2fisj6mCReZm8TlIb6JLrYH8C0u6hrguIqBF8=
X-Received: by 2002:a7b:cc86:: with SMTP id p6mr21149933wma.164.1618832825581; 
 Mon, 19 Apr 2021 04:47:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-13-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-13-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:46:54 +0200
Message-ID: <CACO55ts=J1XGubumoTJMAj0w6F2KBJFUV601oq-2uVD08FrWuA@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 12/40] drm/nouveau/nv50_display: Remove
 superfluous prototype for local static functions
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

UmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPgoKT24gRnJpLCBB
cHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5hcm8ub3JnPiB3
cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgYnVpbGQgZXJyb3I6Cj4KPiAgZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjI1MzA6MTogZXJyb3I6IGNvbmZsaWN0aW5n
IHR5cGVzIGZvciDigJhudjUwX2Rpc3BsYXlfZmluaeKAmQo+ICBJbiBmaWxlIGluY2x1ZGVkIGZy
b20gZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jOjcxOgo+ICBkcml2ZXJz
L2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaDozNjo2OiBub3RlOiBwcmV2aW91cyBkZWNs
YXJhdGlvbiBvZiDigJhudjUwX2Rpc3BsYXlfZmluaeKAmSB3YXMgaGVyCj4gIEluIGZpbGUgaW5j
bHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6NzE6Cj4g
IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oOjM1OjY6IG5vdGU6IHByZXZp
b3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52NTBfZGlzcGxheV9pbml04oCZIHdhcyBoZXJlCj4gIGRy
aXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoyNTgxOjE6IGVycm9yOiBzdGF0
aWMgZGVjbGFyYXRpb24gb2Yg4oCYbnY1MF9kaXNwbGF5X2Rlc3Ryb3nigJkgZm9sbG93cyBub24t
c3RhdGljIGRlY2xhcmF0aW9uCj4gIEluIGZpbGUgaW5jbHVkZWQgZnJvbSBkcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmM6NzE6Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252NTBfZGlzcGxheS5oOjM0OjY6IG5vdGU6IHByZXZpb3VzIGRlY2xhcmF0aW9uIG9mIOKAmG52
NTBfZGlzcGxheV9kZXN0cm954oCZIHdhcyBoZXJlCj4KPiBDYzogQmVuIFNrZWdncyA8YnNrZWdn
c0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6
IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25l
ZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpvbmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZl
cnMvZ3B1L2RybS9ub3V2ZWF1L252NTBfZGlzcGxheS5oIHwgMyAtLS0KPiAgMSBmaWxlIGNoYW5n
ZWQsIDMgZGVsZXRpb25zKC0pCj4KPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvbnY1MF9kaXNwbGF5LmggYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udjUwX2Rpc3BsYXku
aAo+IGluZGV4IGZiZDNiMTU1ODNiYzguLjI0MjE0MDFkMTI2MzYgMTAwNjQ0Cj4gLS0tIGEvZHJp
dmVycy9ncHUvZHJtL25vdXZlYXUvbnY1MF9kaXNwbGF5LmgKPiArKysgYi9kcml2ZXJzL2dwdS9k
cm0vbm91dmVhdS9udjUwX2Rpc3BsYXkuaAo+IEBAIC0zMSw3ICszMSw0IEBACj4gICNpbmNsdWRl
ICJub3V2ZWF1X3JlZy5oIgo+Cj4gIGludCAgbnY1MF9kaXNwbGF5X2NyZWF0ZShzdHJ1Y3QgZHJt
X2RldmljZSAqKTsKPiAtdm9pZCBudjUwX2Rpc3BsYXlfZGVzdHJveShzdHJ1Y3QgZHJtX2Rldmlj
ZSAqKTsKPiAtaW50ICBudjUwX2Rpc3BsYXlfaW5pdChzdHJ1Y3QgZHJtX2RldmljZSAqKTsKPiAt
dm9pZCBudjUwX2Rpc3BsYXlfZmluaShzdHJ1Y3QgZHJtX2RldmljZSAqKTsKPiAgI2VuZGlmIC8q
IF9fTlY1MF9ESVNQTEFZX0hfXyAqLwo+IC0tCj4gMi4yNy4wCj4KPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4g
Tm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9w
Lm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKCl9fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMu
ZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlz
dGluZm8vbm91dmVhdQo=
