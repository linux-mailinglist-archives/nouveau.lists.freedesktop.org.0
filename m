Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92C02DE1F9
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2019 04:14:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B98C89906;
	Mon, 21 Oct 2019 02:14:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 447F289906
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 02:14:38 +0000 (UTC)
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alex.hung@canonical.com>) id 1iMNDQ-0007MO-KF
 for nouveau@lists.freedesktop.org; Mon, 21 Oct 2019 02:14:36 +0000
Received: by mail-io1-f71.google.com with SMTP id d11so1129665ioc.21
 for <nouveau@lists.freedesktop.org>; Sun, 20 Oct 2019 19:14:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=BnluuLx7N5FU6R1K0tIitcyLNhQag0yWZU1ygvdJBl4=;
 b=QkRt+VmnqJLUtV9PCWVUKFcdGMzc3HAsw/QpL41z5vI5v0pESKpeXAqyUVEvKoQL4t
 zU5L162ESP+iW953b/yQ+m9xECrNCrdLWXWAdLJja+ng5++42Sl4bruA24chKfCHMUR1
 /CoX4BYPJw5V1FBwdaM/TTqlZSv7L/7ngAgpuoi62yEA3HLNC96ZTjXczAHtDO3Q8n/K
 YB08NodL4DzcH8lnOxkpiLA/lv7ily1B3Y3/uJqX0o8aI8uqgbyLLNnI3dGtQtlnxIub
 /ltMTcOyW13V1tHfQeE5PdGYZGSt23iOCglN2w9ixJOQ+MmQr22Y5qVuD2f0yyby7hPZ
 VAiw==
X-Gm-Message-State: APjAAAUkWrtmC2EZzrpSBH+lmBLVx6XZKEF/sIdJaEgZLChOkqzlwX6A
 Vj8TRJrVEJ4yAx6bE3V7JDaLq/t6QqOuT3F6n7QBwejrwiBCLdNijVdeOPxzLfPQFMbhMPUnUSc
 vUcoRV4I7L3FoL/JtEdwk71mkfGs5LPfJJtjCwTazbBomm5HFgRWtzemYHBQ=
X-Received: by 2002:a6b:e20f:: with SMTP id z15mr768958ioc.199.1571624075665; 
 Sun, 20 Oct 2019 19:14:35 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxfgJ3t7vqgICblfa3NVl6kSA7Md5mj/NPEb9Mqkp3Oi93uOwzfRxJ2gDaqQ9Rhf5GlAlggXH16Bna+cOgAtvk=
X-Received: by 2002:a6b:e20f:: with SMTP id z15mr768950ioc.199.1571624075361; 
 Sun, 20 Oct 2019 19:14:35 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
In-Reply-To: <5228680.jBuKzensJx@kreacher>
From: Alex Hung <alex.hung@canonical.com>
Date: Sun, 20 Oct 2019 20:14:23 -0600
Message-ID: <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
To: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: [Nouveau] [PATCH 1/7] Revert "ACPI / OSI: Add OEM _OSI string
 to enable dGPU direct output"
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
Cc: Mario Limonciello <mario.limonciello@dell.com>,
 nouveau <nouveau@lists.freedesktop.org>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Ben Skeggs <bskeggs@redhat.com>,
 Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2UgaGF2ZSBkb25lIHNvbWUgdGVzdHMgb24gdGhyZWUgb2YgSW50ZWwgKyBuVmlkaWEgY29uZmln
dXJhdGlvbgpzeXN0ZW1zIHdpdGggT0VNIF9PU0kgc3RyaW5ncyByZW1vdmVkIC0gd2hpbGUgc29t
ZSBidWdzIGFyZSBzdGlsbApvYnNlcnZlZCwgZXguIG9uZSBvdXQgb2YgdGhyZWUgaGFzIHN1c3Bl
bmQvcmVzdW1lIGlzc3Vlcywgbm8gc3lzdGVtCmNyYXNoZXMgd2VyZSBvYnNlcnZlZCAtIHRoZSBi
aWdnZXN0IGlzc3VlIHRoYXQgd29ycmllcyB1cy4KClRoZSBwb3NpdGl2ZSByZXN1bHRzIGdpdmUg
dXMgY29uZmlkZW50IHRvIGFjayB0aGUgcmVtb3ZhbCBvZiB0aGUgT0VNCl9PU0kgc3RyaW5ncy4g
V2hpbGUgb3VyIHRlc3RzIHdlcmUgbm90IGFibGUgdG8gY292ZXIgYWxsIHBvc3NpYmxlIEkrTgpz
eXN0ZW1zLCB3ZSBhcmUgc3VyZSB3ZSBjYW4gZml4IGlzc3VlcyBhbG9uZyB0aGUgd2F5LiBJZiB0
aGVyZSBhcmVuJ3QKc3lzdGVtcyB0aGF0IGNhbm5vdCBiZSBmaXhlZCB3aXRob3V0IHRoZXNlIE9F
TSBfT1NJIHN0cmluZ3MsIHRoZXNlCnN0cmluZ3Mgc2hvdWxkIHByb2JhYmx5IGVuYWJsZSB3aXRo
IERNSSBxdWlya3MgKHBvc3NpYmxlIGZ1dHVyZQpwYXRjaGVzKSBzbyB0aGV5IHdvbid0IGFmZmVj
dCBvdGhlcnMuCgpBY2tlZC1ieTogQWxleCBIdW5nIDxhbGV4Lmh1bmdAY2Fub25pY2FsLmNvbT4K
CgoKCk9uIFRodSwgU2VwIDUsIDIwMTkgYXQgMTA6MjYgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJq
d0Byand5c29ja2kubmV0PiB3cm90ZToKPgo+IE9uIFRodXJzZGF5LCBTZXB0ZW1iZXIgNSwgMjAx
OSA1OjUxOjIzIFBNIENFU1QgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gaXMgdGhlcmUgYW55IHVw
ZGF0ZSBvbiB0aGUgdGVzdGluZyB3aXRoIG15IHBhdGNoZXM/IE9uIHRoZSBoYXJkd2FyZSBJCj4g
PiBoYWQgYWNjZXNzIHRvIHRob3NlIHBhdGNoZXMgaGVscGVkLCBidXQgSSBjYW4ndCBrbm93IGlm
IGl0IGFsc28gaGVscGVkCj4gPiBvbiB0aGUgaGFyZHdhcmUgZm9yIHdoaWNoIHRob3NlIHdvcmth
cm91bmRzIHdoZXJlIGFjdHVhbGx5IGFkZGVkLgo+Cj4gQWxleCBIdW5nIGFuZCBNYXJpbyBuZWVk
IHRvIGFuc3dlciB0aGlzIHF1ZXN0aW9uIEkgdGhpbmsuCj4KPiA+IE9uIE1vbiwgQXVnIDE5LCAy
MDE5IGF0IDExOjUyIEFNIFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3eXNvY2tpLm5ldD4gd3Jv
dGU6Cj4gPiA+Cj4gPiA+IE9uIFRodXJzZGF5LCBBdWd1c3QgMTUsIDIwMTkgMTI6NDc6MzUgQU0g
Q0VTVCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0IDA3
OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMxYmNhZWYyZjY4
ZTRhYmJkODcyNDJjLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBvcmlnaW5hbCBjb21taXQgbWVz
c2FnZSBkaWRuJ3QgZXZlbiBtYWtlIHNlbnNlLiBBTUQgX2RvZXNfIHN1cHBvcnQgaXQgYW5kCj4g
PiA+ID4gPiBpdCB3b3JrcyB3aXRoIE5vdXZlYXUgYXMgd2VsbC4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBBbHNvIHdoYXQgd2FzIHRoZSBpc3N1ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJlbmNl
cyB0byBhbnkgYnVncyBhbmQgbm90Cj4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55IGlzc3Vl
IGF0IGFsbCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBB
bmQgZXZlbiBpZiBpdCBtZWFucyBhIG11eGVkIGRlc2lnbiwgdGhlbiB0aGUgZml4IGlzIHRvIG1h
a2UgaXQgd29yayBpbnNpZGUgdGhlCj4gPiA+ID4gPiBkcml2ZXIsIG5vdCBhZGRpbmcgc29tZSBo
YWNreSB3b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCj4gPiA+ID4gPgo+ID4gPiA+ID4g
QW5kIHdoYXQgb3V0IG9mIHRyZWUgZHJpdmVycyBkbyBvciBkbyBub3Qgc3VwcG9ydCB3ZSBkb24n
dCBjYXJlIG9uZSBiaXQgYW55d2F5Lgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgdGhpbmsg
dGhlIHJldmVydHMgc2hvdWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUgb3Jp
Z2luYWwKPiA+ID4gPiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxkIGdl
dCB0aGVtIGluIGFzYXAuCj4gPiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogRGF2ZSBBaXJsaWUgPGFp
cmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4gVGhlIF9PU0kgc3RyaW5ncyBhcmUgdG8gYmUg
ZHJvcHBlZCB3aGVuIGFsbCBvZiB0aGUgbmVlZGVkIHN1cHBvcnQgaXMgdGhlcmUgaW4KPiA+ID4g
ZHJpdmVycywgc28gdGhleSBzaG91bGQgZ28gYXdheSBhbG9uZyB3aXRoIHRoZSByZXF1aXNpdGUg
ZHJpdmVyIGNoYW5nZXMuCj4gPiA+Cj4gPgo+ID4gdGhhdCBnb2VzIGJlc2lkZSB0aGUgcG9pbnQu
IGZpcm13YXJlIGxldmVsIHdvcmthcm91bmRzIGZvciBHUFUgZHJpdmVyCj4gPiBpc3N1ZXMgd2Vy
ZSBwdXNoZWQgd2l0aG91dCBjb25zdWx0aW5nIHdpdGggdXBzdHJlYW0gR1BVIGRldmVsb3BlcnMu
Cj4gPiBUaGF0J3Mgc29tZXRoaW5nIHdoaWNoIHNob3VsZG4ndCBoYXZlIGhhcHBlbmVkIGluIHRo
ZSBmaXJzdCBwbGFjZS4gQW5kCj4gPiB5ZXMsIEkgYW0gcGVyc29uYWxseSBhbm5veWVkIGJ5IHRo
ZSBmYWN0LCB0aGF0IHBlb3BsZSBrbm93IGFib3V0Cj4gPiBpc3N1ZXMsIGJ1dCBpbnN0ZWFkIG9m
IGNvbnRhY3RpbmcgdGhlIHByb3BlciBwZXJzb25zIGFuZCB3b3JraW5nIG9uIGEKPiA+IHByb3Bl
ciBmaXgsIHdlIGVuZCB1cCB3aXRoIHN0dXBpZCBmaXJtd2FyZSBsZXZlbCB3b3JrYXJvdW5kcy4g
SSBjYW4ndAo+ID4gc2VlIHdoeSB3ZSBldmVyIHdvdWxkIGhhdmUgd2FudGVkIHN1Y2ggd29ya2Fy
b3VuZHMgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4KPiA+IEFuZCBJIHdvdWxkIGJlIG11Y2ggaGFw
cGllciBpZiB0aGUgbmV4dCB0aW1lIHNvbWV0aGluZyBsaWtlIHRoYXQgY29tZXMKPiA+IHVwLCB0
aGF0IHRoZSBkcm0gbWFpbGluZyBsaXN0IHdpbGwgYmUgY29udGFjdGVkIGFzIHdlbGwgb3Igc29t
ZWJvZHkKPiA+IGludm9sdmVkLgo+ID4KPiA+IFdlIGNvdWxkIGhhdmUgYWxzbyBqdXN0IGRpc2Fi
bGUgdGhlIGZlYXR1cmUgaW5zaWRlIHRoZSBkcml2ZXIgKGFuZAo+ID4gcHJvYmFibHkgd2Ugc2hv
dWxkIGhhdmUgZG9uZSB0aGF0IGEgbG9uZyB0aW1lIGFnbywgc28gdGhhdCBpcwo+ID4gZXNzZW50
aWFsbHkgb3VyIGZhdWx0LCBidXQgc3RpbGwuLi4uKQo+ID4KPiA+ID4gSSdtIGFsbCBmb3IgZHJv
cHBpbmcgdGhlbiB3aGVuIHRoYXQncyB0aGUgY2FzZSwgc28gcGxlYXNlIGZlZWwgZnJlZSB0byBh
ZGQgQUNLcwo+ID4gPiBmcm9tIG1lIHRvIHRoZSBwYXRjaGVzIGluIHF1ZXN0aW9uIGF0IHRoYXQg
cG9pbnQuCj4gPiA+Cj4gPiA+IENoZWVycywKPiA+ID4gUmFmYWVsCj4gPiA+Cj4gPiA+Cj4gPiA+
Cj4gPgo+Cj4KPgo+CgoKLS0gCkNoZWVycywKQWxleCBIdW5nCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
