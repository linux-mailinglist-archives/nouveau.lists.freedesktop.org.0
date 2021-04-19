Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 892133640C2
	for <lists+nouveau@lfdr.de>; Mon, 19 Apr 2021 13:46:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E06DC6E252;
	Mon, 19 Apr 2021 11:46:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99B906E252
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 11:46:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1618832775;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=ZNNDgS/DJt2QoriZuV2s4KpJFXyuczWKmKTdkPTzwJc=;
 b=GV5b9jgOPC6wyHw6L97sPQJ1K9s0dHlGDCdfs9aLhVycdXXr9qGdvvWO0qg0ZMi2+Bye65
 SVod2wF3HcciilqSc+6P+GG20OY+WQ/m+ah1xdregCx9lV2IbXXyfgfH+2C0G9e2oaBiGW
 juE/yN84nX1hUZZg91ptzMsjO8m/OrA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-316-JmrwEXPeOSOrijJODaOJhg-1; Mon, 19 Apr 2021 07:46:14 -0400
X-MC-Unique: JmrwEXPeOSOrijJODaOJhg-1
Received: by mail-wr1-f71.google.com with SMTP id
 d15-20020a5d538f0000b02901027c18c581so8853277wrv.3
 for <nouveau@lists.freedesktop.org>; Mon, 19 Apr 2021 04:46:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=ZNNDgS/DJt2QoriZuV2s4KpJFXyuczWKmKTdkPTzwJc=;
 b=N0cN9G4noPQxF5LVmcLFMM0xFn6+gmHqsp9JnDclZ1uGMrkvfkSzJfWjHHmCE1qwcU
 qbPaG+emidUo/AjNSoC1Hg1aZsDP/ujJLRIQw4zapkRpI1+IbZruGGiwKdFxa9ufqTZg
 b9CNq+R0494sKk+Xq/aU/XF8YDAHuu20nZhEStNq2cOaBE7oMbauPSj8xg9nbWoSkfrs
 u3XU6F1W+Kz2EZGRcO3Zh74D2Sh991bxt5IFZcq12I6dYdUvTzftKO1UtLsm6eF/NYeQ
 vrWw/h9d/hvDcek6kV5b465Qo0G0qjTh3ECXJ+oibs2IWVs0lhj386W2PSnINNkFk6/j
 Es2A==
X-Gm-Message-State: AOAM531br+NPomUAKBBVWh3LERQIsqOJ/7zxOdhw7OCiv4qP1BFAFh8v
 QLe0MJBHC9TttUnoMcYsRmnX6FaU4EaviB8cDQrpC/U6LMv46aiK7SFsVD09KBMVmM3ygIBgLXt
 /7/+qhg9iLIKmIPOtyzJoNwcqp7JkpYaoBeGuPnY0RQ==
X-Received: by 2002:a1c:b656:: with SMTP id g83mr21220082wmf.163.1618832772826; 
 Mon, 19 Apr 2021 04:46:12 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyc36e3XbifOKjDUWSKMAEVxvDyobteKY+iWwQTENq4j97KWY9GuD+Osi2UrIND/jrqWxZZjJydw+YBSnHR6jQ=
X-Received: by 2002:a1c:b656:: with SMTP id g83mr21220070wmf.163.1618832772716; 
 Mon, 19 Apr 2021 04:46:12 -0700 (PDT)
MIME-Version: 1.0
References: <20210416143725.2769053-1-lee.jones@linaro.org>
 <20210416143725.2769053-11-lee.jones@linaro.org>
In-Reply-To: <20210416143725.2769053-11-lee.jones@linaro.org>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 19 Apr 2021 13:46:02 +0200
Message-ID: <CACO55tu=3H=vEcE6zDA951CqQf1wmKJrVMvBy=EEpp+R5MZG0w@mail.gmail.com>
To: Lee Jones <lee.jones@linaro.org>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=kherbst@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Subject: Re: [Nouveau] [PATCH 10/40] drm/nouveau/dispnv50/disp: Remove
 unused variable 'ret' from function returning void
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

T24gRnJpLCBBcHIgMTYsIDIwMjEgYXQgNDozOCBQTSBMZWUgSm9uZXMgPGxlZS5qb25lc0BsaW5h
cm8ub3JnPiB3cm90ZToKPgo+IEZpeGVzIHRoZSBmb2xsb3dpbmcgVz0xIGtlcm5lbCBidWlsZCB3
YXJuaW5nKHMpOgo+Cj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzog
SW4gZnVuY3Rpb24g4oCYbnY1MF9tc3RtX2NsZWFudXDigJk6Cj4gIGRyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYzoxMzU3OjY6IHdhcm5pbmc6IHZhcmlhYmxlIOKAmHJldOKA
mSBzZXQgYnV0IG5vdCB1c2VkIFstV3VudXNlZC1idXQtc2V0LXZhcmlhYmxlXQo+CgpzYW1lIGNv
bW1lbnQgaGVyZTogd2Ugc2hvdWxkIHJlYWxseSBjaGVjayBpZiBpdCdzIGJldHRlciB0byBoYW5k
bGUgdGhlCmVycm9yIGFuZCByZXBvcnQgaXQgYmFjayB0aGF0IHNvbWV0aGluZyBmYWlsZWQgb3Ig
c28uLgoKPiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPgo+IENjOiBEYXZpZCBB
aXJsaWUgPGFpcmxpZWRAbGludXguaWU+Cj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZnds
bC5jaD4KPiBDYzogZHJpLWRldmVsQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IENjOiBub3V2ZWF1
QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+IFNpZ25lZC1vZmYtYnk6IExlZSBKb25lcyA8bGVlLmpv
bmVzQGxpbmFyby5vcmc+Cj4gLS0tCj4gIGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUw
L2Rpc3AuYyB8IDUgKystLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9ucygrKSwgMyBk
ZWxldGlvbnMoLSkKPgo+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNw
bnY1MC9kaXNwLmMgYi9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1MC9kaXNwLmMKPiBp
bmRleCA0ODAxYWFmZDk1NTJiLi4zNTFmOTU0OTg5NTMwIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMv
Z3B1L2RybS9ub3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+ICsrKyBiL2RyaXZlcnMvZ3B1L2RybS9u
b3V2ZWF1L2Rpc3BudjUwL2Rpc3AuYwo+IEBAIC0xMzg2LDEyICsxMzg2LDExIEBAIG52NTBfbXN0
bV9jbGVhbnVwKHN0cnVjdCBudjUwX21zdG0gKm1zdG0pCj4gIHsKPiAgICAgICAgIHN0cnVjdCBu
b3V2ZWF1X2RybSAqZHJtID0gbm91dmVhdV9kcm0obXN0bS0+b3V0cC0+YmFzZS5iYXNlLmRldik7
Cj4gICAgICAgICBzdHJ1Y3QgZHJtX2VuY29kZXIgKmVuY29kZXI7Cj4gLSAgICAgICBpbnQgcmV0
Owo+Cj4gICAgICAgICBOVl9BVE9NSUMoZHJtLCAiJXM6IG1zdG0gY2xlYW51cFxuIiwgbXN0bS0+
b3V0cC0+YmFzZS5iYXNlLm5hbWUpOwo+IC0gICAgICAgcmV0ID0gZHJtX2RwX2NoZWNrX2FjdF9z
dGF0dXMoJm1zdG0tPm1ncik7Cj4gKyAgICAgICBkcm1fZHBfY2hlY2tfYWN0X3N0YXR1cygmbXN0
bS0+bWdyKTsKPgo+IC0gICAgICAgcmV0ID0gZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZt
c3RtLT5tZ3IpOwo+ICsgICAgICAgZHJtX2RwX3VwZGF0ZV9wYXlsb2FkX3BhcnQyKCZtc3RtLT5t
Z3IpOwo+Cj4gICAgICAgICBkcm1fZm9yX2VhY2hfZW5jb2RlcihlbmNvZGVyLCBtc3RtLT5vdXRw
LT5iYXNlLmJhc2UuZGV2KSB7Cj4gICAgICAgICAgICAgICAgIGlmIChlbmNvZGVyLT5lbmNvZGVy
X3R5cGUgPT0gRFJNX01PREVfRU5DT0RFUl9EUE1TVCkgewo+IC0tCj4gMi4yNy4wCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFp
bGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
