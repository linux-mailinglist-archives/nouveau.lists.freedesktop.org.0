Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA0261CB2B1
	for <lists+nouveau@lfdr.de>; Fri,  8 May 2020 17:19:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E29B46E894;
	Fri,  8 May 2020 15:19:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f42.google.com (mail-ua1-f42.google.com
 [209.85.222.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DEBC6E894
 for <nouveau@lists.freedesktop.org>; Fri,  8 May 2020 15:19:38 +0000 (UTC)
Received: by mail-ua1-f42.google.com with SMTP id 36so767110uaf.9
 for <nouveau@lists.freedesktop.org>; Fri, 08 May 2020 08:19:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=lNAR0LcneBM15bnsIe9DhRwPgdH2lsuKnjWnOLObeo0=;
 b=TyoMTYbxDlZrCUMVEGjB0IWCibxx8uM7+C5Q17ivE/X5UOzCKvevsDSISmFV5SbwVo
 0Yv9iOXyRfX6gtdcJYPRzWuJjKE/s04lQ+h5SC+UARQyHdf60o1qqhwnV9vIIu+A15b5
 Tyi7MQQi/OKLrCM4Eh0UNTBDIPv4vKdWHEapzTfiLYU6qewXj2xwhpwbr1uNXWCu1WlI
 xEUmV1OLsDRYQ0JUiWUOLhU1f7YGncOfys4p3YA3AIJXLk+dkbDRdvfS2tfdp5c3Ki+d
 MUhqmITac2mksj6P7z82xm1ePCKoaXLtfPLGWGCAewaZxuwaT/M6H49Tq2Uaw5j/YovP
 ua0A==
X-Gm-Message-State: AGi0PuaYP4h4XXwjoxKcCHNvOwX2nurNLgmanJI76I6TXHUN6XSS0oIY
 8jTW2UX/OqyWCjaS3ggYQY2/N9uVDzXE98tPxZk=
X-Google-Smtp-Source: APiQypI5EqGtcATEwWDJ6v2xZfmm6+lOO6r/2mfIsSp5NCOb3FECrDQFrZkIeJRHF880tai6iOMV03VNdp+wuMCmpiE=
X-Received: by 2002:ab0:544a:: with SMTP id o10mr2549277uaa.15.1588951177005; 
 Fri, 08 May 2020 08:19:37 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
 <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAFCWPPKhbbk=um2pv+ytgd+WVaT+M=-mLXXAR427QgQj=w_q3A@mail.gmail.com>
 <CAKb7Uvi7-UCoEb7GJmT2CseMkhrkg4wO5vfk06KhrVWYfAP9WQ@mail.gmail.com>
 <CAFCWPPJVwVrb5atD+Ny4rOxwPJQCrYeZzXQJN4k6yzJtyR-FEQ@mail.gmail.com>
In-Reply-To: <CAFCWPPJVwVrb5atD+Ny4rOxwPJQCrYeZzXQJN4k6yzJtyR-FEQ@mail.gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Fri, 8 May 2020 11:19:25 -0400
Message-ID: <CAKb7UvjAkKAHFSd2Dggf2JY5GPeGB_kQTcR1EM3QucP1VvOC0A@mail.gmail.com>
To: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
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

SSBkb24ndCB0aGluayB0aGF0IGxvZ2ljIGhhcyBjaGFuZ2VkIGluIG92ZXIgYSB5ZWFyLCBub3Ig
ZG8gSSBleHBlY3QKaXQgd2lsbCBpbiB0aGUgZnV0dXJlLCB1bmxlc3Mgc29tZW9uZSBjb21lcyBp
biBhbmQgZG9lcyB0aGUgd29yayB0bwpmaWd1cmUgb3V0IHdoYXQncyB3cm9uZy4gSWYgdGhhdCdz
IG5vdCB5b3UsIHRoZW4geW91IGhhdmUgdG8gaG9wZQp0aGVyZSB3aWxsIGJlIHNvbWVvbmUgZWxz
ZSBpbnRlcmVzdGVkIGluIHJ1bm5pbmcgYSBkZXNrdG9wIEdQVSBvbiBhbgphcm0tYmFzZWQgYm9h
cmQuCgpPbiBGcmksIE1heSA4LCAyMDIwIGF0IDExOjEzIEFNIE1pbGFuIEJ1xaFrYSA8bWlsYW4u
YnVza2FAZ21haWwuY29tPiB3cm90ZToKPgo+IFRoYW5rcyBmb3IgdGhlIGluZm8uCj4gSSdsbCBw
dWxsIGl0IG91dCBpbiBhIHllYXIgYW5kIHRyeSBpdC4KPgo+IEdyZWV0aW5nCj4KPiBww6EgOC4g
NS4gMjAyMCB2IDE1OjI3IG9kZXPDrWxhdGVsIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0
LmVkdT4gbmFwc2FsOgo+ID4KPiA+IE9uIEZyaSwgTWF5IDgsIDIwMjAgYXQgNDozNCBBTSBNaWxh
biBCdcWha2EgPG1pbGFuLmJ1c2thQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+Cj4gPiA+IEdvb2Qg
ZGF5Lgo+ID4gPiBJJ20gbm90IGEgcHJvZ3JhbW1lciwgc28gSSBkb24ndCB1bmRlcnN0YW5kLgo+
ID4gPgo+ID4gPiBKdXN0IGEgcXVlc3Rpb246Cj4gPiA+IFdoYXQncyB3cm9uZyA9Pgo+ID4gPiA9
PiBub3V2ZWF1IGRyaXZlcgo+ID4gPiA9PiBwY2llIGRyaXZlcgo+ID4gPiA9PiBncmFwaGljcyBj
YXJkCj4gPiA+Cj4gPiA+IEl0IHdpbGwgaGVscCBtZSBzYXZlIHVubmVjZXNzYXJ5IGxvc3QgdGlt
ZS4KPiA+Cj4gPiBNb3N0IGxpa2VseSB0aGUgaXNzdWUgaXMgaW4gbm91dmVhdS4gVGhlcmUncyBh
IG11Y2ggc21hbGxlciBsaWtlbGlob29kCj4gPiB0aGF0IHRoZSBpc3N1ZSBpcyB3aXRoIGUuZy4g
dGhlIGlvbW11L2RtYS1hcGkgaW1wbGVtZW50YXRpb24uCj4gPgo+ID4gQ2hlZXJzLAo+ID4KPiA+
ICAgLWlsaWEKPgo+Cj4KPiAtLQo+Cj4gUmVtZW1iZXIsIG5vIHF1ZXN0aW9uIGlzIHRvbyBzdHVw
aWQgYW5kIG5vIHByb2JsZW0gdG9vIHNtYWxsCj4gICAgICAgIC0tIFdlJ3ZlIGFsbCBiZWVuIGJl
Z2lubmVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpO
b3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczov
L2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
