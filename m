Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 50A23B14BD
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 21:17:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 210326EE09;
	Thu, 12 Sep 2019 19:17:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0CCF6EE09
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:17:48 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 36E9A2A09AB
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:17:48 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id a13so34148112ioh.18
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 12:17:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=Xu0QqNXn85Ew2qsLjKlUReE6Gk83JCUlDsb49yLa7G0=;
 b=Lz7WeExGttgPRLpZvygUApUDxsgadjlnBEE7x0lV9CmJtw44rz513axSDghAYVDwnS
 e2290M/6wc2He5IVVeZI4n9FcECVlouRwOgIOXz60/B7yN2nSAL+tF0QAglQLfQ9PK8X
 2xUo854Rh2XW3dtwIDm1e+W6rA+9dmd4JGpUPM/eho5wY5vt2osDoIAM5CvgeIwNMySq
 kBsw5/zWxmbaVkDmaYRqysG6oT8cISCTyRSi4UsxWtG+1mC9etu+PNrPJCRGoYmPYcLZ
 zPw/dUqkW2QLRdWcYOHvsv23Th5fJvBtFwOre5OQTIHRtSOd6Rsmu46MeTKOYDyELBnG
 A2Yg==
X-Gm-Message-State: APjAAAULpILnwUMNHTFv6VORGV2VISnIK+FRKaHcHcZQnRdLGyepv74k
 dCKQcW859R1z5pDIZPbeVZs9XnN2D8R321BDH56V4zQFsZTHITerjgaREjYIBZQvjtRYmY7qL/Y
 ecP68wGESwB0c1VOlrst/RePXh6WRYaqAvkbOVPWqAQ==
X-Received: by 2002:a02:634c:: with SMTP id j73mr45654764jac.99.1568315867437; 
 Thu, 12 Sep 2019 12:17:47 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxpz0FzlyKvIlA8wp4PnYMqqvYBepZ7OV+TGkvadIPbgVHEPInc4SjzuGuVXA8u8oRj1cZOpJ3xfTLWrzcQ6GY=
X-Received: by 2002:a02:634c:: with SMTP id j73mr45654733jac.99.1568315867106; 
 Thu, 12 Sep 2019 12:17:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190912190028.27977-1-kherbst@redhat.com>
 <20190912190028.27977-4-kherbst@redhat.com>
 <CAKb7UviD520oCHJNo-AKZiNBrGy6nbNoMmTdcTDt9MRdFhDY1w@mail.gmail.com>
In-Reply-To: <CAKb7UviD520oCHJNo-AKZiNBrGy6nbNoMmTdcTDt9MRdFhDY1w@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 12 Sep 2019 21:17:35 +0200
Message-ID: <CACO55tt1tHiQ=220-0S0MeGsr2DPyd2E_C8C2pg1w+UMDGb4Mg@mail.gmail.com>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Subject: Re: [Nouveau] [PATCH 3/3] pci/gk104: wait for ltssm idle before
 changing the link
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgOTowNyBQTSBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVt
Lm1pdC5lZHU+IHdyb3RlOgo+Cj4gT24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMzowMCBQTSBLYXJv
bCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPgo+ID4gdGFrZW4gZnJvbSBu
dmdwdQo+ID4KPiA+IFNpZ25lZC1vZmYtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRoYXQu
Y29tPgo+ID4gLS0tCj4gPiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMgfCA3
ICsrKysrKysKPiA+ICAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspCj4gPgo+ID4gZGlm
ZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jIGIvZHJtL25vdXZl
YXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKPiA+IGluZGV4IDZhZWIwN2ZlNC4uMmQxZmE2N2Vi
IDEwMDY0NAo+ID4gLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKPiA+
ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCj4gPiBAQCAtMjMsNiAr
MjMsOCBAQAo+ID4gICAqLwo+ID4gICNpbmNsdWRlICJwcml2LmgiCj4gPgo+ID4gKyNpbmNsdWRl
IDxzdWJkZXYvdGltZXIuaD4KPiA+ICsKPiA+ICBzdGF0aWMgaW50Cj4gPiAgZ2sxMDRfcGNpZV92
ZXJzaW9uX3N1cHBvcnRlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkKPiA+ICB7Cj4gPiBAQCAtMTQy
LDYgKzE0NCwxMSBAQCBnazEwNF9wY2llX3NldF9saW5rX3NwZWVkKHN0cnVjdCBudmttX3BjaSAq
cGNpLCBlbnVtIG52a21fcGNpZV9zcGVlZCBzcGVlZCkKPiA+ICAgICAgICAgICAgICAgICBicmVh
azsKPiA+ICAgICAgICAgfQo+ID4KPiA+ICsgICAgICAgLyogd2FpdCBmb3IgbHRzc20gaWRsZSAq
Lwo+ID4gKyAgICAgICBudmttX21zZWMoZGV2aWNlLCAyMDAsCj4gPiArICAgICAgICAgICAgICAg
aWYgKChudmttX3JkMzIoZGV2aWNlLCAweDhjMDQwKSAmIDB4MWYpID09IDApCj4gPiArICAgICAg
ICAgICAgICAgICAgICAgICBicmVhazsKPiA+ICsgICAgICAgKTsKPgo+IFdoYXQgaWYgaXQgZG9l
c24ndCBpZGxlPyBTaG91bGQgeW91IHN0aWxsIGRvIHRoZSBiZWxvdyB0aGluZ3M/Cj4KCm9oaCwg
Z29vZCBwb2ludC4gSSB0b3RhbGx5IGRpZG4ndCB0aGluayBhYm91dCB0aGF0LiBudmdwdSBhYm9y
dHMgdGhlCm9wZXJhdGlvbiBvZiBjb3Vyc2UgYW5kIHdlIHNob3VsZCBkbyB0aGUgc2FtZS4KCj4g
PiAgICAgICAgIG52a21fbWFzayhkZXZpY2UsIDB4OGMwNDAsIDB4YzAwMDAsIG1hc2tfdmFsdWUp
Owo+ID4gICAgICAgICBudmttX21hc2soZGV2aWNlLCAweDhjMDQwLCAweDEsIDB4MSk7Cj4gPiAg
fQo+ID4gLS0KPiA+IDIuMjEuMAo+ID4KPiA+IF9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCj4gPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+ID4gTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKPiA+IGh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNr
dG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25v
dXZlYXU=
