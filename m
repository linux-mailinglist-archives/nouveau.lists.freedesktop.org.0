Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CDC8AE02A
	for <lists+nouveau@lfdr.de>; Mon,  9 Sep 2019 23:08:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9571E89E1A;
	Mon,  9 Sep 2019 21:07:59 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677C689E1B
 for <nouveau@lists.freedesktop.org>; Mon,  9 Sep 2019 21:07:58 +0000 (UTC)
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by youngberry.canonical.com with esmtps
 (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128) (Exim 4.86_2)
 (envelope-from <alex.hung@canonical.com>) id 1i7Qt9-0000hZ-RJ
 for nouveau@lists.freedesktop.org; Mon, 09 Sep 2019 21:07:55 +0000
Received: by mail-io1-f70.google.com with SMTP id o6so6291660ioh.10
 for <nouveau@lists.freedesktop.org>; Mon, 09 Sep 2019 14:07:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=LH+uWheH+pNq+IGQq8MSCBunzHNQ2Gt4vqh/uMjSZaM=;
 b=FEmlEDzOqTaRaSXSMpo6b+0qHb/Z/ETgAnmrrl2rhulSINJ1XXAlGx0sNFBM+jmjXe
 GZ0NepIKgU23dYI8qnAIVqAmXiqAqld61dr9ruPTEKuzxZPZO5I1oU5j+fVH8l6DtZsJ
 jFkw386iKB+ya6cJ7adx5qnx+cl8bKGEOe963j6Z8lzhKlBUGk7ye6ujdC6m2XdIwfap
 1lo36MacQfwVaJJSEyxvX6so1/ipSuj5kU5FEB2QMPJlz5/kOe2mWragDHfpLtYp1oI5
 GoMDXDOwjpsKSSEDfLSO3QZ9D5yIJXj7F9Y1NBgii0Ch0rA89HpIkCzSDLRp0zYOo1AQ
 Av0Q==
X-Gm-Message-State: APjAAAXUTZMG5dr9lxTCqQLtNJEYO8Gce8ixBCjFqh16CcDb6gE7xbBh
 AmmoW3gNPvoXXbHABVDSzqz2Rr3qRA1OO8/pmHlSELqWpZggYmlP99Ml53Zw8oj0V8WA/xx36Ar
 w1dC3ayh16MwtgwsSc5KPfjVnovuO7U2dtguFsw+gML+Lv+CE3OyVU4oCR+M=
X-Received: by 2002:a6b:c903:: with SMTP id z3mr16805279iof.204.1568063274539; 
 Mon, 09 Sep 2019 14:07:54 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxKNWzQ0qeqd46TPzcljhuQDj1lX4oa7QzaJ3YBpbWvIApG/65YcNAjmq5SCNk2sgQ90kAmSPWN8hgTzP4YqYw=
X-Received: by 2002:a6b:c903:: with SMTP id z3mr16805248iof.204.1568063274320; 
 Mon, 09 Sep 2019 14:07:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
In-Reply-To: <5228680.jBuKzensJx@kreacher>
From: Alex Hung <alex.hung@canonical.com>
Date: Mon, 9 Sep 2019 22:07:42 +0100
Message-ID: <CAJ=jquaLthK556Lqk-zc3GCOus90HoGs66tA=d9a1aju7iNpPw@mail.gmail.com>
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

T24gVGh1LCBTZXAgNSwgMjAxOSBhdCA1OjI2IFBNIFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3
eXNvY2tpLm5ldD4gd3JvdGU6Cj4KPiBPbiBUaHVyc2RheSwgU2VwdGVtYmVyIDUsIDIwMTkgNTo1
MToyMyBQTSBDRVNUIEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IGlzIHRoZXJlIGFueSB1cGRhdGUg
b24gdGhlIHRlc3Rpbmcgd2l0aCBteSBwYXRjaGVzPyBPbiB0aGUgaGFyZHdhcmUgSQo+ID4gaGFk
IGFjY2VzcyB0byB0aG9zZSBwYXRjaGVzIGhlbHBlZCwgYnV0IEkgY2FuJ3Qga25vdyBpZiBpdCBh
bHNvIGhlbHBlZAo+ID4gb24gdGhlIGhhcmR3YXJlIGZvciB3aGljaCB0aG9zZSB3b3JrYXJvdW5k
cyB3aGVyZSBhY3R1YWxseSBhZGRlZC4KPgo+IEFsZXggSHVuZyBhbmQgTWFyaW8gbmVlZCB0byBh
bnN3ZXIgdGhpcyBxdWVzdGlvbiBJIHRoaW5rLgoKU29ycnkgZm9yIHRha2luZyBhIGxvbmcgdGlt
ZS4gSSBkb24ndCBoYXZlIGZ1bGwgdGVzdGluZyByZXN1bHRzIHlldApidXQgd2UgZm91bmQgYXQg
bGVhc3QgYSByZWdyZXNzaW9uIG9jY3VycmVkIHdpdGggX09TSSBzdHJpbmcgcmVtb3ZlZCAtCml0
IGlzIG5vdCBvbiBuVmlkaWEgaGFyZHdhcmUgYnV0IG9uIEFNRCBQWCBvbmUuCgpJIHdpbGwgdHJ5
IHRvIGNvbGxlY3QgYW5kIHNoYXJlIG1vcmUgZGV0YWlscy4KCj4KPiA+IE9uIE1vbiwgQXVnIDE5
LCAyMDE5IGF0IDExOjUyIEFNIFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3eXNvY2tpLm5ldD4g
d3JvdGU6Cj4gPiA+Cj4gPiA+IE9uIFRodXJzZGF5LCBBdWd1c3QgMTUsIDIwMTkgMTI6NDc6MzUg
QU0gQ0VTVCBEYXZlIEFpcmxpZSB3cm90ZToKPiA+ID4gPiBPbiBUaHUsIDE1IEF1ZyAyMDE5IGF0
IDA3OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6Cj4gPiA+ID4g
Pgo+ID4gPiA+ID4gVGhpcyByZXZlcnRzIGNvbW1pdCAyODU4NmE1MWVlYTY2NmQ1NTMxYmNhZWYy
ZjY4ZTRhYmJkODcyNDJjLgo+ID4gPiA+ID4KPiA+ID4gPiA+IFRoZSBvcmlnaW5hbCBjb21taXQg
bWVzc2FnZSBkaWRuJ3QgZXZlbiBtYWtlIHNlbnNlLiBBTUQgX2RvZXNfIHN1cHBvcnQgaXQgYW5k
Cj4gPiA+ID4gPiBpdCB3b3JrcyB3aXRoIE5vdXZlYXUgYXMgd2VsbC4KPiA+ID4gPiA+Cj4gPiA+
ID4gPiBBbHNvIHdoYXQgd2FzIHRoZSBpc3N1ZSBiZWluZyBzb2x2ZWQgaGVyZT8gTm8gcmVmZXJl
bmNlcyB0byBhbnkgYnVncyBhbmQgbm90Cj4gPiA+ID4gPiBldmVuIGV4cGxhaW5pbmcgYW55IGlz
c3VlIGF0IGFsbCBpc24ndCB0aGUgd2F5IHdlIGRvIHRoaW5ncy4KPiA+ID4gPiA+Cj4gPiA+ID4g
PiBBbmQgZXZlbiBpZiBpdCBtZWFucyBhIG11eGVkIGRlc2lnbiwgdGhlbiB0aGUgZml4IGlzIHRv
IG1ha2UgaXQgd29yayBpbnNpZGUgdGhlCj4gPiA+ID4gPiBkcml2ZXIsIG5vdCBhZGRpbmcgc29t
ZSBoYWNreSB3b3JrYXJvdW5kIHRocm91Z2ggQUNQSSB0cmlja3MuCj4gPiA+ID4gPgo+ID4gPiA+
ID4gQW5kIHdoYXQgb3V0IG9mIHRyZWUgZHJpdmVycyBkbyBvciBkbyBub3Qgc3VwcG9ydCB3ZSBk
b24ndCBjYXJlIG9uZSBiaXQgYW55d2F5Lgo+ID4gPiA+ID4KPiA+ID4gPgo+ID4gPiA+IEkgdGhp
bmsgdGhlIHJldmVydHMgc2hvdWxkIGJlIG1lcmdlZCB2aWEgUmFmYWVsJ3MgdHJlZSBhcyB0aGUg
b3JpZ2luYWwKPiA+ID4gPiBwYXRjaGVzIHdlbnQgaW4gdmlhIHRoZXJlLCBhbmQgd2Ugc2hvdWxk
IGdldCB0aGVtIGluIGFzYXAuCj4gPiA+ID4KPiA+ID4gPiBBY2tlZC1ieTogRGF2ZSBBaXJsaWUg
PGFpcmxpZWRAcmVkaGF0LmNvbT4KPiA+ID4KPiA+ID4gVGhlIF9PU0kgc3RyaW5ncyBhcmUgdG8g
YmUgZHJvcHBlZCB3aGVuIGFsbCBvZiB0aGUgbmVlZGVkIHN1cHBvcnQgaXMgdGhlcmUgaW4KPiA+
ID4gZHJpdmVycywgc28gdGhleSBzaG91bGQgZ28gYXdheSBhbG9uZyB3aXRoIHRoZSByZXF1aXNp
dGUgZHJpdmVyIGNoYW5nZXMuCj4gPiA+Cj4gPgo+ID4gdGhhdCBnb2VzIGJlc2lkZSB0aGUgcG9p
bnQuIGZpcm13YXJlIGxldmVsIHdvcmthcm91bmRzIGZvciBHUFUgZHJpdmVyCj4gPiBpc3N1ZXMg
d2VyZSBwdXNoZWQgd2l0aG91dCBjb25zdWx0aW5nIHdpdGggdXBzdHJlYW0gR1BVIGRldmVsb3Bl
cnMuCj4gPiBUaGF0J3Mgc29tZXRoaW5nIHdoaWNoIHNob3VsZG4ndCBoYXZlIGhhcHBlbmVkIGlu
IHRoZSBmaXJzdCBwbGFjZS4gQW5kCj4gPiB5ZXMsIEkgYW0gcGVyc29uYWxseSBhbm5veWVkIGJ5
IHRoZSBmYWN0LCB0aGF0IHBlb3BsZSBrbm93IGFib3V0Cj4gPiBpc3N1ZXMsIGJ1dCBpbnN0ZWFk
IG9mIGNvbnRhY3RpbmcgdGhlIHByb3BlciBwZXJzb25zIGFuZCB3b3JraW5nIG9uIGEKPiA+IHBy
b3BlciBmaXgsIHdlIGVuZCB1cCB3aXRoIHN0dXBpZCBmaXJtd2FyZSBsZXZlbCB3b3JrYXJvdW5k
cy4gSSBjYW4ndAo+ID4gc2VlIHdoeSB3ZSBldmVyIHdvdWxkIGhhdmUgd2FudGVkIHN1Y2ggd29y
a2Fyb3VuZHMgaW4gdGhlIGZpcnN0IHBsYWNlLgo+ID4KPiA+IEFuZCBJIHdvdWxkIGJlIG11Y2gg
aGFwcGllciBpZiB0aGUgbmV4dCB0aW1lIHNvbWV0aGluZyBsaWtlIHRoYXQgY29tZXMKPiA+IHVw
LCB0aGF0IHRoZSBkcm0gbWFpbGluZyBsaXN0IHdpbGwgYmUgY29udGFjdGVkIGFzIHdlbGwgb3Ig
c29tZWJvZHkKPiA+IGludm9sdmVkLgo+ID4KPiA+IFdlIGNvdWxkIGhhdmUgYWxzbyBqdXN0IGRp
c2FibGUgdGhlIGZlYXR1cmUgaW5zaWRlIHRoZSBkcml2ZXIgKGFuZAo+ID4gcHJvYmFibHkgd2Ug
c2hvdWxkIGhhdmUgZG9uZSB0aGF0IGEgbG9uZyB0aW1lIGFnbywgc28gdGhhdCBpcwo+ID4gZXNz
ZW50aWFsbHkgb3VyIGZhdWx0LCBidXQgc3RpbGwuLi4uKQo+ID4KPiA+ID4gSSdtIGFsbCBmb3Ig
ZHJvcHBpbmcgdGhlbiB3aGVuIHRoYXQncyB0aGUgY2FzZSwgc28gcGxlYXNlIGZlZWwgZnJlZSB0
byBhZGQgQUNLcwo+ID4gPiBmcm9tIG1lIHRvIHRoZSBwYXRjaGVzIGluIHF1ZXN0aW9uIGF0IHRo
YXQgcG9pbnQuCj4gPiA+Cj4gPiA+IENoZWVycywKPiA+ID4gUmFmYWVsCj4gPiA+Cj4gPiA+Cj4g
PiA+Cj4gPgo+Cj4KPgo+CgoKLS0gCkNoZWVycywKQWxleCBIdW5nCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZl
YXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21h
aWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
