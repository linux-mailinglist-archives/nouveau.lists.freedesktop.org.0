Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CD30B1CB296
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 17:13:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 528AF6EB20;
	Fri,  8 May 2020 15:13:12 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FE186EB20
 for <nouveau@lists.freedesktop.org>; Fri,  8 May 2020 15:13:11 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id t12so1501380edw.3
 for <nouveau@lists.freedesktop.org>; Fri, 08 May 2020 08:13:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TguSh5dWOj9jWrGTK8JEkJ9H/WJLiAo9JGSP1+jtyvk=;
 b=czQ8LQcaRDOZS1t+Snt2J1quki59tcNdMPZHLDJjOI/+gwE4+/Q4KEV9vqBR6NXn3n
 LYq0G8RxBK0YEBtzEPPDrk37qcFjVEccPHH8enKnU/2bnZr8q5bjw1di8gSAJh2/4haN
 JYDflfeI9EvX/vM78awgLbKLMnRcVwAgUIa1XE0BalChKH4bM2f8REgs2V6o1MGtNFQi
 H9ocB+pGQoq+UlaGpOPHiuGQRwNYYMnJopFyTqfD/SeS3s+zOk4gsV+j2kjxIO/i1CxG
 uFMwLMQykUK45UaF56AwXhACruFCmXf16NwrFNyXHHzDY/pLMdPYF8ay+UJ9nwoEE4Bb
 SDFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TguSh5dWOj9jWrGTK8JEkJ9H/WJLiAo9JGSP1+jtyvk=;
 b=RPEAXYtg7bvDtXss13GlRTMq8sHDPsRyC83R8pU7H16fSidnl2ZqzqIKUrifyr2Mm1
 fnvTdAFa9QL7aEUgoiluELojWgiw6drk75z4c2j6KIch2oS2gb55C/9WQ6aJSzYycpNE
 +d8X8qxCFZX6oaFF41gKFzIA22FjobFqetZ2j6/kS98xbPw3HwFYVVNmquzZUlIklC5K
 zcTH6HPhu06uG8Gi5gaVCenwINzus8EFKB9bspt+8innPUc/AkOOhfb5p63ah7YbKQvy
 +KanPWxCqh05zqlM9/S0Ot7S4k2AcEia+dYxjDLNS+/SyW0I0VGagC//9CYYo86NObSr
 /EKQ==
X-Gm-Message-State: AGi0PubswBUJ4syr/1FfYi3XzL9d3E/u8+hZq+HSr3N+0ZLvgJhyG3gm
 aVRbOcrynbJgSMflRC9YyyXgW1hvV3x1neCxEjY=
X-Google-Smtp-Source: APiQypLtPA8SoXjblQzk3Xy/ox40qmtJlHUaciQGxl6XdNB4AwB2hTj6koKyZlkO25xzmDu7gJ74SzsjVcBsKo7SXbA=
X-Received: by 2002:a50:f095:: with SMTP id v21mr2580981edl.103.1588950788691; 
 Fri, 08 May 2020 08:13:08 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
 <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAFCWPPKhbbk=um2pv+ytgd+WVaT+M=-mLXXAR427QgQj=w_q3A@mail.gmail.com>
 <CAKb7Uvi7-UCoEb7GJmT2CseMkhrkg4wO5vfk06KhrVWYfAP9WQ@mail.gmail.com>
In-Reply-To: <CAKb7Uvi7-UCoEb7GJmT2CseMkhrkg4wO5vfk06KhrVWYfAP9WQ@mail.gmail.com>
From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date: Fri, 8 May 2020 17:12:41 +0200
Message-ID: <CAFCWPPJVwVrb5atD+Ny4rOxwPJQCrYeZzXQJN4k6yzJtyR-FEQ@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] GeForce(R) GT 710 1GB PCIE x 1 on arm64
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

VGhhbmtzIGZvciB0aGUgaW5mby4KSSdsbCBwdWxsIGl0IG91dCBpbiBhIHllYXIgYW5kIHRyeSBp
dC4KCkdyZWV0aW5nCgpww6EgOC4gNS4gMjAyMCB2IDE1OjI3IG9kZXPDrWxhdGVsIElsaWEgTWly
a2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4gbmFwc2FsOgo+Cj4gT24gRnJpLCBNYXkgOCwgMjAy
MCBhdCA0OjM0IEFNIE1pbGFuIEJ1xaFrYSA8bWlsYW4uYnVza2FAZ21haWwuY29tPiB3cm90ZToK
PiA+Cj4gPiBHb29kIGRheS4KPiA+IEknbSBub3QgYSBwcm9ncmFtbWVyLCBzbyBJIGRvbid0IHVu
ZGVyc3RhbmQuCj4gPgo+ID4gSnVzdCBhIHF1ZXN0aW9uOgo+ID4gV2hhdCdzIHdyb25nID0+Cj4g
PiA9PiBub3V2ZWF1IGRyaXZlcgo+ID4gPT4gcGNpZSBkcml2ZXIKPiA+ID0+IGdyYXBoaWNzIGNh
cmQKPiA+Cj4gPiBJdCB3aWxsIGhlbHAgbWUgc2F2ZSB1bm5lY2Vzc2FyeSBsb3N0IHRpbWUuCj4K
PiBNb3N0IGxpa2VseSB0aGUgaXNzdWUgaXMgaW4gbm91dmVhdS4gVGhlcmUncyBhIG11Y2ggc21h
bGxlciBsaWtlbGlob29kCj4gdGhhdCB0aGUgaXNzdWUgaXMgd2l0aCBlLmcuIHRoZSBpb21tdS9k
bWEtYXBpIGltcGxlbWVudGF0aW9uLgo+Cj4gQ2hlZXJzLAo+Cj4gICAtaWxpYQoKCgotLSAKClJl
bWVtYmVyLCBubyBxdWVzdGlvbiBpcyB0b28gc3R1cGlkIGFuZCBubyBwcm9ibGVtIHRvbyBzbWFs
bAogICAgICAgLS0gV2UndmUgYWxsIGJlZW4gYmVnaW5uZXJzCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQo=
