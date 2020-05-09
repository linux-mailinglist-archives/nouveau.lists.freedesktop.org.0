Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FBCC1CBDD7
	for <lists+nouveau@lfdr.de>; Sat,  9 May 2020 07:47:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1E116E161;
	Sat,  9 May 2020 05:47:32 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com
 [IPv6:2a00:1450:4864:20::630])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73A646E161
 for <nouveau@lists.freedesktop.org>; Sat,  9 May 2020 05:47:31 +0000 (UTC)
Received: by mail-ej1-x630.google.com with SMTP id x1so3155010ejd.8
 for <nouveau@lists.freedesktop.org>; Fri, 08 May 2020 22:47:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=TAWQA0DJPPbf3NRwmPPlJj8TFTC5Hyp/DQFt4lo19+s=;
 b=fDdLWwKcFNYH3symypdW3inNzLaJa0BqLcI3U9AVGMIUVsRx/HG8Cm9prg5rLCePiN
 oM7e81qh6dZYMTjrKqbGQ/mjVOi/8UynjrUwcnueoNrHK80cKgBB/1ukanIsWdVn+m2K
 sScHX7OOZL0LGYgpyJBb9PAIxAjzyYR5H8wN3XDDhiC+o3hESs7VlXXmOgfFlxDtlYOT
 dO1sVDJsCZrttUQu62eOTRFE1PFIqgMnJXE85Gxi1XZjS+P5s6W26PArC0XBuAJ+REOV
 nWY5XUvWsRqBEMD2agvk6vcdld2x8mam2UAaQM87mLJHbrbzFFj2y32HHOtCzsPby9gn
 5ASQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=TAWQA0DJPPbf3NRwmPPlJj8TFTC5Hyp/DQFt4lo19+s=;
 b=j2+CRd83A8fA/n0xgl910Gf2pfmiBwixVjm/bz0YSSls8aidPu3thepbe37kv84/8l
 ZxpXFk/N7Gmnx90xutLkqi6A+8ctRAm/L+uL7VZZVgTsmmY0uS8ZPprppSe9UilA5ar5
 GPxe/4p0qutKuabBqn0gNpzn8+HvRL6gMXraevPoJyX/ef5TqxodgAARz12uLElx528Q
 14gaQwU0mAzlgM5nW2JZLNSt7VJCNWe0AP04JiL4/MeI8VwNZTiHEeThE5s3IvgAAim3
 0I70pQQAUETILWwm6HbUbG0gvPZ5vSxIb+BbHmFx8DxxHA2BLDvVmfL1xxzjvQwpdM/E
 edbw==
X-Gm-Message-State: AGi0PuaInQsAY0bTIEjNdIwwdSOpsKvSyctu+dl+gzKQv+BX6A4t7kaK
 LfW0we2W9Z1pvuwrKX3fj20ORpHiHJ0I4ExJcjc=
X-Google-Smtp-Source: APiQypI8gG7L4bs/Kh//JotLEJFlVkqwVjZWmvpanLrVxLVc1dPvJlVr4/EUZ7OSs3n/4Aq7Gv9RkfHWkjCtpX3qE5k=
X-Received: by 2002:a17:906:3655:: with SMTP id
 r21mr3709495ejb.251.1589003250028; 
 Fri, 08 May 2020 22:47:30 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
 <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
 <CAFCWPPKhbbk=um2pv+ytgd+WVaT+M=-mLXXAR427QgQj=w_q3A@mail.gmail.com>
 <CAKb7Uvi7-UCoEb7GJmT2CseMkhrkg4wO5vfk06KhrVWYfAP9WQ@mail.gmail.com>
 <CAFCWPPJVwVrb5atD+Ny4rOxwPJQCrYeZzXQJN4k6yzJtyR-FEQ@mail.gmail.com>
 <CAKb7UvjAkKAHFSd2Dggf2JY5GPeGB_kQTcR1EM3QucP1VvOC0A@mail.gmail.com>
In-Reply-To: <CAKb7UvjAkKAHFSd2Dggf2JY5GPeGB_kQTcR1EM3QucP1VvOC0A@mail.gmail.com>
From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date: Sat, 9 May 2020 07:47:03 +0200
Message-ID: <CAFCWPPLTBnN4+khtU=7ZMBDFqH8y4PYG47sTM+0584d44Ah96w@mail.gmail.com>
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

TWF5YmUgdGhlcmUgYXJlIG1vcmUgb2YgdXMgdHJ5aW5nIHRvIGdldCBvdXIgaGFuZHMKb24gdGhl
IGRlc2t0b3AganVzdCBub3QgdG8gdGFsayBhYm91dCBpdCBtdWNoLgpoZSBvcmlnaW5hbCBkcml2
ZXIgZnJvbSBudmlkaWEgYWxzbyBoYXMgaXRzIGxpbWl0cywKYnV0IHdoZW4gdGhlIGNhcmQgaXMg
YWRkZWQgdXNpbmcgUENJLCB0aGUgcG9zc2liaWxpdGllcwpleHBhbmQgY29uc2lkZXJhYmx5LgpB
bmQgd2UgYWxzbyBoYXZlIHRvIGxvb2sgYXQgdGhlIGVuZXJneSBhc3BlY3QuCk92ZXJhbGwsIHRo
aXMgbW9kZWwgY2FuIHJlZHVjZSBlbmVyZ3kgY29uc3VtcHRpb24uCgpww6EgOC4gNS4gMjAyMCB2
IDE3OjE5IG9kZXPDrWxhdGVsIElsaWEgTWlya2luIDxpbWlya2luQGFsdW0ubWl0LmVkdT4gbmFw
c2FsOgo+Cj4gSSBkb24ndCB0aGluayB0aGF0IGxvZ2ljIGhhcyBjaGFuZ2VkIGluIG92ZXIgYSB5
ZWFyLCBub3IgZG8gSSBleHBlY3QKPiBpdCB3aWxsIGluIHRoZSBmdXR1cmUsIHVubGVzcyBzb21l
b25lIGNvbWVzIGluIGFuZCBkb2VzIHRoZSB3b3JrIHRvCj4gZmlndXJlIG91dCB3aGF0J3Mgd3Jv
bmcuIElmIHRoYXQncyBub3QgeW91LCB0aGVuIHlvdSBoYXZlIHRvIGhvcGUKPiB0aGVyZSB3aWxs
IGJlIHNvbWVvbmUgZWxzZSBpbnRlcmVzdGVkIGluIHJ1bm5pbmcgYSBkZXNrdG9wIEdQVSBvbiBh
bgo+IGFybS1iYXNlZCBib2FyZC4KPgo+IE9uIEZyaSwgTWF5IDgsIDIwMjAgYXQgMTE6MTMgQU0g
TWlsYW4gQnXFoWthIDxtaWxhbi5idXNrYUBnbWFpbC5jb20+IHdyb3RlOgo+ID4KPiA+IFRoYW5r
cyBmb3IgdGhlIGluZm8uCj4gPiBJJ2xsIHB1bGwgaXQgb3V0IGluIGEgeWVhciBhbmQgdHJ5IGl0
Lgo+ID4KPiA+IEdyZWV0aW5nCj4gPgo+ID4gcMOhIDguIDUuIDIwMjAgdiAxNToyNyBvZGVzw61s
YXRlbCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1pdC5lZHU+IG5hcHNhbDoKPiA+ID4KPiA+
ID4gT24gRnJpLCBNYXkgOCwgMjAyMCBhdCA0OjM0IEFNIE1pbGFuIEJ1xaFrYSA8bWlsYW4uYnVz
a2FAZ21haWwuY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IEdvb2QgZGF5Lgo+ID4gPiA+IEkn
bSBub3QgYSBwcm9ncmFtbWVyLCBzbyBJIGRvbid0IHVuZGVyc3RhbmQuCj4gPiA+ID4KPiA+ID4g
PiBKdXN0IGEgcXVlc3Rpb246Cj4gPiA+ID4gV2hhdCdzIHdyb25nID0+Cj4gPiA+ID4gPT4gbm91
dmVhdSBkcml2ZXIKPiA+ID4gPiA9PiBwY2llIGRyaXZlcgo+ID4gPiA+ID0+IGdyYXBoaWNzIGNh
cmQKPiA+ID4gPgo+ID4gPiA+IEl0IHdpbGwgaGVscCBtZSBzYXZlIHVubmVjZXNzYXJ5IGxvc3Qg
dGltZS4KPiA+ID4KPiA+ID4gTW9zdCBsaWtlbHkgdGhlIGlzc3VlIGlzIGluIG5vdXZlYXUuIFRo
ZXJlJ3MgYSBtdWNoIHNtYWxsZXIgbGlrZWxpaG9vZAo+ID4gPiB0aGF0IHRoZSBpc3N1ZSBpcyB3
aXRoIGUuZy4gdGhlIGlvbW11L2RtYS1hcGkgaW1wbGVtZW50YXRpb24uCj4gPiA+Cj4gPiA+IENo
ZWVycywKPiA+ID4KPiA+ID4gICAtaWxpYQo+ID4KPiA+Cj4gPgo+ID4gLS0KPiA+Cj4gPiBSZW1l
bWJlciwgbm8gcXVlc3Rpb24gaXMgdG9vIHN0dXBpZCBhbmQgbm8gcHJvYmxlbSB0b28gc21hbGwK
PiA+ICAgICAgICAtLSBXZSd2ZSBhbGwgYmVlbiBiZWdpbm5lcnMKCgoKLS0gCgpSZW1lbWJlciwg
bm8gcXVlc3Rpb24gaXMgdG9vIHN0dXBpZCBhbmQgbm8gcHJvYmxlbSB0b28gc21hbGwKICAgICAg
IC0tIFdlJ3ZlIGFsbCBiZWVuIGJlZ2lubmVycwpfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXUK
