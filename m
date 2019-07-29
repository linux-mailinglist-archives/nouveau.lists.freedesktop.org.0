Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F02478BF6
	for <lists+nouveau@lfdr.de>; Mon, 29 Jul 2019 14:45:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D25689D4B;
	Mon, 29 Jul 2019 12:45:41 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ua1-f43.google.com (mail-ua1-f43.google.com
 [209.85.222.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA43989D4B
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2019 12:45:39 +0000 (UTC)
Received: by mail-ua1-f43.google.com with SMTP id a97so23851598uaa.9
 for <nouveau@lists.freedesktop.org>; Mon, 29 Jul 2019 05:45:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8Tg5oK2mpOxSBm0wsiIuGMHKDFRSRdPPU+7BzCovvxw=;
 b=qWx3GAIe49YYyoe7h6dtCU0Repa23QlAUTi5JTEU5If8aHYqx7rl4k4XR3MixuconC
 0N9mrF3D7sRbXHAqeDaavd1E5t1JSSoTsWSMmjp4N0WkYnkRRdDkKdVpmk2EnU1b3BVq
 XoPYGt9c/L42kUqGXn8WFrw3S7EXmrOuHCHdBEPxmoDOaKlbi2XiyXM6MXdBoE5eQvb4
 WMb/+BecisyYMBHB7m8Hi596fhYwaulC8egxXm1Hlh4In8hEHqrKWphqGJwg/LIaBb58
 vY8+YFvPIHbsljMZH172SZelo5geYvzLr5kba0T1n9YpisGbSzK+nwR9bC6B/ordJKOL
 I3Jw==
X-Gm-Message-State: APjAAAUoZLQBiTmXYzkhpmc0FePV7mHr7ZE7SU6UoMpej+q7pJu3fuZ/
 NSTuP595VvUR62RHJOMw8rMsb/WDesUB6sxLQIg=
X-Google-Smtp-Source: APXvYqxe2lDhyt7a0lk1GpnJbbsHDSWDSxd/eL6kP3LLNK7ZHH4t71dSl9haJezBYSwJ1AbmfLIBwA9HEU8SL9Ld4Qk=
X-Received: by 2002:ab0:470e:: with SMTP id h14mr42438276uac.98.1564404339014; 
 Mon, 29 Jul 2019 05:45:39 -0700 (PDT)
MIME-Version: 1.0
References: <20190727113726.2EF4D21F78@orac.inputplus.co.uk>
 <CAKb7UvhqXGz7_t9EXJvu02J+f0STGB7wvwNcSM8F7YHCcJ3KbA@mail.gmail.com>
 <97a6ab0d-89bc-0bd6-76d3-445255952d97@gmail.com>
In-Reply-To: <97a6ab0d-89bc-0bd6-76d3-445255952d97@gmail.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Mon, 29 Jul 2019 08:45:27 -0400
Message-ID: <CAKb7UvgxBqicqbpKe5iR2uZvTfCd16xXpNDFMRG2AX17q=JQow@mail.gmail.com>
To: Solerman Kaplon <solerman@gmail.com>
Subject: Re: [Nouveau] Video Hardware Decoding: Jittery Rectangles on Nvidia
 GT218 NVA8 VP4.
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

T24gTW9uLCBKdWwgMjksIDIwMTkgYXQgNzoyOSBBTSBTb2xlcm1hbiBLYXBsb24gPHNvbGVybWFu
QGdtYWlsLmNvbT4gd3JvdGU6Cj4KPiDDgHMgMTQ6NDYgZGUgMjcvMDcvMjAxOSwgSWxpYSBNaXJr
aW4gZXNjcmV2ZXU6Cj4gPiBPbiBTYXQsIEp1bCAyNywgMjAxOSBhdCA3OjM3IEFNIFJhbHBoIENv
cmRlcm95IDxyYWxwaEBpbnB1dHBsdXMuY28udWs+IHdyb3RlOgo+ID4+IFRoZSB2aWRlbyBwbGF5
cywgQ1BVIGxvYWQgaXMgbGVzcyAobXkgYWltKSwgYnV0IHRoZXJlJ3Mg4oCYdGVhcmluZ+KAmSBv
ZiB0aGUKPiA+PiBwaWN0dXJlIGFzIGlmIHNtYWxsIHJlY3RhbmdsZXMgdGhhdCBhcmUgdXBkYXRl
cyBhcmUgYXBwZWFyaW5nIGluIHRoZQo+ID4+IHdyb25nIGxvY2F0aW9uLCBvZmYgYnkgYSBsaXR0
bGUuICBJZiBJIHN0ZXAgdGhyb3VnaCB0aGUgZnJhbWVzIHdpdGgKPiA+PiBtcHYncyDigJgu4oCZ
IGFuZCDigJgs4oCZIHRoZW4gSSd2ZSBmb3VuZCBhIHBhdHRlcm46IG9uZSBmcmFtZSdzIHBpY3R1
cmUgaXMKPiA+PiBnb29kLCBmb2xsb3dlZCBieSBOIGJhZCBvbmVzIHdoZXJlIE4gaXMgMyBvciA3
LCBpLmUuIGV2ZXJ5IDR0aCBvciA4dGgKPiA+PiBmcmFtZSBpcyBva2F5LiAgRG9uJ3Qga25vdyBp
ZiB0aGF0J3MgYSBjbHVlIG9yIGhlbHBzIHNvbWVvbmUgaGVyZQo+ID4+IHJlY29nbmlzZSBhIGtu
b3duIHByb2JsZW0uCj4gPHNuaXA+Cj4gPj4gVW5mb3J0dW5hdGVseSBJJ3ZlIG5ldmVyIHRyYWNr
ZWQgZG93biB0aGUgY2F1c2UgZm9yIHRoaXMuCj4gPj4gaHR0cHM6Ly9ub3V2ZWF1LmZyZWVkZXNr
dG9wLm9yZy93aWtpL1ZpZGVvQWNjZWxlcmF0aW9uLyAtIHNlZSBub3RlICM0Lgo+ID4+Cj4gPj4g
SSBoYXZlLCBvdmVyIHRpbWUsIGNvbGxlY3RlZCBzb21lIHNhbXBsZSB2aWRlb3Mgd2hlcmUgdGhp
cyBoYXBwZW5zIGluCj4gPj4gdGhlIGZpcnN0IGZldyBmcmFtZXMuIFRoZSBwbGFuIHdhcyB0byBk
byBtbXQgdHJhY2VzIG9mIHRoZSBibG9iCj4gPj4gZHJpdmVyLCBhbmQgZmlndXJlIG91dCB3aGF0
IGl0IHdhcyBkb2luZyBkaWZmZXJlbnRseS4KPgo+IDxzbmlwPgo+Cj4gSSBkb24ndCByZWFsbHkg
a25vdyBhbnl0aGluZyBhYm91dCBodyBjb2RpbmcsIGJ1dCBsb29raW5nIGZyb20gdGhlIG91dHNp
ZGUsIGl0Cj4gc2VlbXMgc29tZSBraW5kIG9mIHJpbmcgYnVmZmVyIHdpdGggZXhhY3QgMyBmcmFt
ZXMgbWF5YmUgaW50ZW5kZWQgdG8gd29yayBraW5kYQo+IGxpa2UgdXNpbmcgdHJpcHBsZSBidWZm
ZXJpbmc/IEkga25vdyBmb3Igb25jZSB0aGF0IG52aWRpYSB3b3JrcyBiZXR0ZXIgdXNpbmcKPiB0
cmlwcGxlIGJ1ZmZlcmluZyBmcm9tIHdoYXQgSSd2ZSByZWFkIGZyb20gdGhlIGt3aW4gdGhyZWFk
cy4KClRoZSBhY3R1YWwgZGVjb2RlZCBpbWFnZXMgYXJlIHdyb25nIGhlcmUgLS0gdHJpcGxlIGJ1
ZmZlcmluZyBub3JtYWxseQpyZWZlcnMgdG8gaG93IG1hbnkgKGltYWdlKSBidWZmZXJzIHlvdSBo
b2xkIGluIHRoZSBkaXNwbGF5IHF1ZXVlLiBUaGUKZGVlcGVyIHRoZSBxdWV1ZSwgdGhlIG1vcmUg
eW91J3JlIGlzb2xhdGVkIGZyb20gcmVuZGVyIHRpbWluZy4gSG93ZXZlcgppbiB0aGlzIGNhc2Us
IHRoZSBpbWFnZXMgdGhlbXNlbHZlcyBhcmUgYmFkIG91dCBvZiB0aGUgZGVjb2RpbmcgbG9naWMu
CgogIC1pbGlhCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
