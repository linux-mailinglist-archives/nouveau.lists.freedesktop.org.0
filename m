Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 85592C24D5
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2019 18:05:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B71CC6E06B;
	Mon, 30 Sep 2019 16:05:27 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 670BE6E06B
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 16:05:27 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B36D3C049E36
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 16:05:26 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id g126so31289890iof.3
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 09:05:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=6Jo3uapkJwME3KNEX03kTFMW4ezdDySvqiZtAQI5QuE=;
 b=qoRf/BoyvQUQajPTjKUySqjHQ73Fhs46hwJJ94UmqefsRxD+0sALAvt9Mai9PvVKp1
 EBrxdpMuhlYBqRz7tEvKljb0PZjNrxqKCGy7+vCUhr3zvWqqR/wGV+RN6i5JVzcOJObW
 hoDy8Re5baWj3D/I6plTS+POMJTtGGa9BpOfmEOhef3pm1Jw1kDnduzddKQGvFgvV34p
 XIuexoLL2O2ukFPoDP3VRWaxjB7DseEw3xCDgCSLDyPd47rOsF6ejr6bU19fdUPzHpak
 BfZZAIwrQMZTnA43CZYW11uF68OeiD7phB7EDEBRKxe4d0CsKB5e8qpkwSyw1FMMBpAf
 xyXg==
X-Gm-Message-State: APjAAAW5RL+yKNjlH7c3ErwvKROCZvbQG2f0MtyaLErBbcAuFjS6O0Yz
 +56vJ275nlOSUwZ9Gp50WqWgxQXmaeXRtzOIH/GDPYe6OhYIvS6Vc6MhvAC1bTpVTc/BaUg0H5S
 W06Klfg5e7gplLytAj7WdemFHV8VG/SyZG/Qqah26gg==
X-Received: by 2002:a5d:9a17:: with SMTP id s23mr21659736iol.171.1569859526156; 
 Mon, 30 Sep 2019 09:05:26 -0700 (PDT)
X-Google-Smtp-Source: APXvYqypngOWw3ZSLYDhxUEQ9NgyFEx9J+foY40JfzIJvF4e6vjzQEx3SO7djN0Th8o3+JHT5FzrewlaBaaAcXyAtrE=
X-Received: by 2002:a5d:9a17:: with SMTP id s23mr21659711iol.171.1569859525882; 
 Mon, 30 Sep 2019 09:05:25 -0700 (PDT)
MIME-Version: 1.0
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
 <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
 <20190930092934.GT2714@lahna.fi.intel.com>
In-Reply-To: <20190930092934.GT2714@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 30 Sep 2019 18:05:14 +0200
Message-ID: <CACO55tu9M8_TWu2MxNe_NROit+d+rHJP5_Tb+t73q5vr19sd1w@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [Nouveau] [RFC PATCH] pci: prevent putting pcie devices into
 lower device states on certain intel bridges
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
Cc: Linux PM <linux-pm@vger.kernel.org>,
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, Linux PCI <linux-pci@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

c3RpbGwgaGFwcGVucyB3aXRoIHlvdXIgcGF0Y2ggYXBwbGllZC4gVGhlIG1hY2hpbmUgc2ltcGx5
IGdldHMgc2h1dCBkb3duLgoKZG1lc2cgY2FuIGJlIGZvdW5kIGhlcmU6Cmh0dHBzOi8vZ2lzdC5n
aXRodWJ1c2VyY29udGVudC5jb20va2Fyb2xoZXJic3QvNDBlYjA5MWM3YjdiMzNlZjk5MzUyNWRl
NjYwZjFhM2IvcmF3LzIzODBlMzFmNTY2ZTkzZTViYTdjODdlZjU0NTQyMDk2NWQ0YzQ5MmMvZ2lz
dGZpbGUxLnR4dAoKSWYgdGhlcmUgYXJlIG5vIG90aGVyIHRoaW5ncyB0byB0cnkgb3V0LCBJIHdp
bGwgcG9zdCB0aGUgdXBkYXRlZCBwYXRjaCBzaG9ydGx5LgoKT24gTW9uLCBTZXAgMzAsIDIwMTkg
YXQgMTE6MjkgQU0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndlc3RlcmJlcmdAbGludXguaW50ZWwu
Y29tPiB3cm90ZToKPgo+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDExOjE1OjQ4QU0gKzAyMDAs
IEthcm9sIEhlcmJzdCB3cm90ZToKPiA+IE9uIE1vbiwgU2VwIDMwLCAyMDE5IGF0IDEwOjA1IEFN
IE1pa2EgV2VzdGVyYmVyZwo+ID4gPG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+IHdy
b3RlOgo+ID4gPgo+ID4gPiBIaSBLYXJvbCwKPiA+ID4KPiA+ID4gT24gRnJpLCBTZXAgMjcsIDIw
MTkgYXQgMTE6NTM6NDhQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gPiA+ID4gV2hh
dCBleGFjdGx5IGlzIHRoZSBzZXJpb3VzIGlzc3VlPyAgSSBndWVzcyBpdCdzIHRoYXQgdGhlIHJl
c2Nhbgo+ID4gPiA+ID4gZG9lc24ndCBkZXRlY3QgdGhlIEdQVSwgd2hpY2ggbWVhbnMgaXQncyBu
b3QgcmVzcG9uZGluZyB0byBjb25maWcKPiA+ID4gPiA+IGFjY2Vzc2VzPyAgSXMgdGhlcmUgYW55
IHRpbWluZyBjb21wb25lbnQgaGVyZSwgZS5nLiwgbWF5YmUgd2UncmUKPiA+ID4gPiA+IG1pc3Np
bmcgc29tZSBkZWxheSBsaWtlIHRoZSBvbmVzIE1pa2EgaXMgYWRkaW5nIHRvIHRoZSByZXNldCBw
YXRocz8KPiA+ID4gPgo+ID4gPiA+IFdoZW4gSSB3YXMgY2hlY2tpbmcgdXAgb24gc29tZSBvZiB0
aGUgUENJIHJlZ2lzdGVycyBvZiB0aGUgYnJpZGdlCj4gPiA+ID4gY29udHJvbGxlciwgdGhlIHNs
b3QgZGV0ZWN0aW9uIHRvbGQgbWUgdGhhdCB0aGVyZSBpcyBubyBkZXZpY2UKPiA+ID4gPiByZWNv
Z25pemVkIGFueW1vcmUuIEkgZG9uJ3Qga25vdyB3aGljaCByZWdpc3RlciBpdCB3YXMgYW55bW9y
ZSwgdGhvdWdoCj4gPiA+ID4gSSBndWVzcyBvbmUgY291bGQgcmVhZCBpdCB1cCBpbiB0aGUgU29D
IHNwZWMgZG9jdW1lbnQgYnkgSW50ZWwuCj4gPiA+ID4KPiA+ID4gPiBNeSBndWVzcyBpcywgdGhh
dCB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgZmFpbHMgdG8gZGV0ZWN0IHRoZSBHUFUgYmVpbmcKPiA+
ID4gPiBoZXJlIG9yIGFjdGl2ZWx5IHRocmV3IGl0IG9mIHRoZSBidXMgb3Igc29tZXRoaW5nLiBC
dXQgYSBub3JtYWwgc3lzdGVtCj4gPiA+ID4gc3VzcGVuZC9yZXN1bWUgY3ljbGUgYnJpbmdzIHRo
ZSBHUFUgYmFjayBvbmxpbmUgKGRvaW5nIGEgcmVzY2FuIHZpYQo+ID4gPiA+IHN5c2ZzIGdldHMg
dGhlIGRldmljZSBkZXRlY3RlZCBhZ2FpbikKPiA+ID4KPiA+ID4gQ2FuIHlvdSBlbGFib3JhdGUg
YSBiaXQgd2hhdCBraW5kIG9mIHNjZW5hcmlvIHRoZSBpc3N1ZSBoYXBwZW5zIChlLmcKPiA+ID4g
c3RlcHMgaG93IGl0IHJlcHJvZHVjZXMpPyBJdCB3YXMgbm90IDEwMCUgY2xlYXIgZnJvbSB0aGUg
Y2hhbmdlbG9nLiBBbHNvCj4gPiA+IHdoYXQgdGhlIHJlc3VsdCB3aGVuIHRoZSBmYWlsdXJlIGhh
cHBlbnM/Cj4gPiA+Cj4gPgo+ID4geWVhaCwgSSBhbHJlYWR5IGhhdmUgYW4gdXBkYXRlZCBwYXRj
aCBpbiB0aGUgd29ya3Mgd2hpY2ggYWxzbyBkb2VzIHRoZQo+ID4gcmV3b3JrIEJqb3JuIHN1Z2dl
c3RlZC4gSGFkIG5vIHRpbWUgeWV0IHRvIHRlc3QgaWYgSSBkaWRuJ3QgbWVzcyBpdAo+ID4gdXAu
Cj4gPgo+ID4gSSBhbSBhbHNvIHRoaW5raW5nIG9mIGFkZGluZyBhIGtlcm5lbCBwYXJhbWV0ZXIg
dG8gZW5hYmxlIHRoaXMKPiA+IHdvcmthcm91bmQgb24gZGVtYW5kLCBidXQgbm90IHF1aXRlIHN1
cmUgb24gdGhhdCBvbmUgeWV0Lgo+Cj4gUmlnaHQsIEkgdGhpbmsgaXQgd291bGQgYmUgZ29vZCB0
byBmaWd1cmUgb3V0IHRoZSByb290IGNhdXNlIGJlZm9yZQo+IGFkZGluZyBhbnkgd29ya2Fyb3Vu
ZHMgOy0pIEl0IG1pZ2h0IHZlcnkgd2VsbCBiZSB0aGF0IHdlIGFyZSBqdXN0Cj4gbWlzc2luZyBz
b21ldGhpbmcgdGhlIFBDSWUgc3BlYyByZXF1aXJlcyBidXQgbm90IGltcGxlbWVudGVkIGluIExp
bnV4Lgo+Cj4gPiA+IEkgc2VlIHRoZXJlIGlzIGEgc2NyaXB0IHRoYXQgZG9lcyBzb21ldGhpbmcg
YnV0IHVuZm9ydHVuYXRlbHkgSSdtIG5vdAo+ID4gPiBmbHVlbnQgaW4gUHl0aG9uIHNvIGNhbid0
IGV4dHJhY3QgdGhlIHN0ZXBzIGhvdyB0aGUgaXNzdWUgY2FuIGJlCj4gPiA+IHJlcHJvZHVjZWQg
Oy0pCj4gPiA+Cj4gPiA+IE9uZSB0aGluZyB0aGF0IEknbSB3b3JraW5nIG9uIGlzIHRoYXQgTGlu
dXggUENJIHN1YnN5c3RlbSBtaXNzZXMgY2VydGFpbgo+ID4gPiBkZWxheXMgdGhhdCBhcmUgbmVl
ZGVkIGFmdGVyIEQzY29sZCAtPiBEMCB0cmFuc2l0aW9uLCBvdGhlcndpc2UgdGhlCj4gPiA+IGRl
dmljZSBhbmQvb3IgbGluayBtYXkgbm90IGJlIHJlYWR5IGJlZm9yZSB3ZSBhY2Nlc3MgaXQuIFdo
YXQgeW91IGFyZQo+ID4gPiBleHBlcmllbmNpbmcgc291bmRzIHNpbWlsYXIuIEkgd29uZGVyIGlm
IHlvdSBjb3VsZCB0cnkgdGhlIGZvbGxvd2luZwo+ID4gPiBwYXRjaCBhbmQgc2VlIGlmIGl0IG1h
a2VzIGFueSBkaWZmZXJlbmNlPwo+ID4gPgo+ID4gPiBodHRwczovL3BhdGNod29yay5rZXJuZWwu
b3JnL3BhdGNoLzExMTA2NjExLwo+ID4KPiA+IEkgdGhpbmsgSSBhbHJlYWR5IHRyaWVkIHRoaXMg
cGF0aC4gVGhlIHByb2JsZW0gaXNuJ3QgdGhhdCB0aGUgZGV2aWNlCj4gPiBpc24ndCBhY2Nlc3Np
YmxlIHRvbyBsYXRlLCBidXQgdGhhdCBpdCBzZWVtcyB0aGF0IHRoZSBkZXZpY2UKPiA+IGNvbXBs
ZXRlbHkgZmFsbHMgb2ZmIHRoZSBidXMuIEJ1dCBJIGNhbiByZXRlc3QgYWdhaW4ganVzdCB0byBi
ZSBzdXJlLgo+Cj4gWWVzLCBwbGVhc2UgdHJ5IGl0IGFuZCBzaGFyZSBmdWxsIGRtZXNnIGlmL3do
ZW4gdGhlIGZhaWx1cmUgc3RpbGwgaGFwcGVucy4KX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9ub3V2ZWF1
