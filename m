Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 26DEC8EE1D
	for <lists+nouveau@lfdr.de>; Thu, 15 Aug 2019 16:25:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C7466E42C;
	Thu, 15 Aug 2019 14:25:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com
 [209.85.210.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCAD66E9C6
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 14:25:18 +0000 (UTC)
Received: by mail-ot1-f65.google.com with SMTP id q20so5444176otl.0
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 07:25:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1srfTVVrcLRgd7+YxvKeopiwdoMN+JSwzxmbw7BufKY=;
 b=l8ebpR8LK1y80Nr4tUOKyeaPSjzn7xYpTMhHPyjx6XgiBtZpmUk1k8Fky13ioJpDhJ
 osVo01oC/DSDlgZr2tySIVhJeUI794lkMMYGaQR3r2oqrruqkOgZQJbkCafP8XsKKJ2W
 6LeALGU+eTWloX4GQhQHHCmm4n0CJMyzD6lFMOfDMwxkjkfnjeRO5NPJFhdG0UoiNz5w
 pPPWb1uCyZBG3bh7Nb28jd+nfDPqy9GBKX4cACHbz1gIh89qxdnjE/V7dTeb1rW7VlyR
 PFTleTHyvSktG477W6GBwvk/RcOecSCfXO2R6AzU9MrnyX/m6TPER1Ct2YEl+lhwXohL
 3VCA==
X-Gm-Message-State: APjAAAWH9SnSStCqi//NgdUNWxdlprh6tIQudzNLv75qsPZLLO1cLLtP
 ALxWI+8fYfCJh5EYc1KwfwHYGOxu7WlMURdgXh3n5sRP
X-Google-Smtp-Source: APXvYqyrsllK46/iEpgqVrPevhv4r81hiZTZAIlyGy948ydui3IANnmoo0w+/y8635P46GWeANx/Vo/sumdoLjxDBXo=
X-Received: by 2002:a6b:7606:: with SMTP id g6mr5795786iom.288.1565879117968; 
 Thu, 15 Aug 2019 07:25:17 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
 <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
 <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <3fc22fe8bcaf4304bb07534b61c4de90@AUSX13MPC101.AMER.DELL.COM>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 16:25:06 +0200
Message-ID: <CACO55tvDfxYMZr0BGv2ROSNEVB4GvXZnBnWBy=RDPOG5hnk7OA@mail.gmail.com>
To: Mario.Limonciello@dell.com
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>,
 LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI Mailing List <linux-acpi@vger.kernel.org>,
 Alex Hung <alex.hung@canonical.com>, Ben Skeggs <bskeggs@redhat.com>,
 David Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgNDoyMCBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5j
b20+IHdyb3RlOgo+Cj4gPiA+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRvIGJlIHJlZ3Jl
c3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZCB3aXRoIHRoZQo+ID4gPiBpbiB0cmVlIGRy
aXZlcnMgYnkgcmV2ZXJ0aW5nIHRoaXMuICBJIHRoaW5rIHdlIHNob3VsZCBoYXZlIGFuIGFuc3dl
ciBmb3IgYWxsIG9mCj4gPiB0aG9zZQo+ID4gPiBiZWZvcmUgdGhpcyByZXZlcnQgaXMgYWNjZXB0
ZWQuCj4gPiA+Cj4gPiA+IFJlZ2FyZGluZyBzeXN0ZW1zIHdpdGggSW50ZWwrTlZJRElBLCB3ZSds
bCBoYXZlIHRvIHdvcmsgd2l0aCBwYXJ0bmVycyB0bwo+ID4gY29sbGVjdAo+ID4gPiBzb21lIGlu
Zm9ybWF0aW9uIG9uIHRoZSBpbXBhY3Qgb2YgcmV2ZXJ0aW5nIHRoaXMuCj4gPiA+Cj4gPiA+IFdo
ZW4gdGhpcyBpcyB1c2VkIG9uIGEgc3lzdGVtIHdpdGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmln
dXJlcyBBTUQgR1BVIHRvCj4gPiB1c2UKPiA+ID4gIkh5YnJpZCBHcmFwaGljcyIgd2hlbiBvbiBX
aW5kb3dzIGFuZCAiUG93ZXIgRXhwcmVzcyIgYW5kICJTd2l0Y2hhYmxlCj4gPiBHcmFwaGljcyIK
PiA+ID4gd2hlbiBvbiBMaW51eC4KPiA+Cj4gPiBhbmQgd2hhdCdzIGV4YWN0bHkgdGhlIGRpZmZl
cmVuY2UgYmV0d2VlbiB0aG9zZT8gQW5kIHdoYXQncyB0aGUgYWN0dWFsCj4gPiBpc3N1ZSBoZXJl
Pwo+Cj4gRFAvSERNSSBpcyBub3QgZGV0ZWN0ZWQgdW5sZXNzIHBsdWdnZWQgaW4gYXQgYm9vdHVw
LiAgSXQncyBkdWUgdG8gbWlzc2luZyBIUEQKPiBldmVudHMuCj4KCmFmYWlrIEx5dWRlIHdhcyB3
b3JraW5nIG9uIGZpeGluZyBhbGwgdGhhdCwgYXQgbGVhc3QgZm9yIHNvbWUgZHJpdmVycy4KSWYg
dGhlcmUgaXMgc29tZXRoaW5nIHdyb25nLCB3ZSBzdGlsbCBzaG91bGQgZml4IHRoZSBkcml2ZXJz
LCBub3QKYWRkaW5nIEFDUEkgd29ya2Fyb3VuZHMuCgpBbGV4OiBkbyB5b3Uga25vdyBpZiB0aGVy
ZSBhcmUgcmVtYWluaW5nIGlzc3VlcyByZWdhcmRpbmcgdGhhdCB3aXRoIGFtZGdwdT8KCj4gPgo+
ID4gV2UgYWxyZWFkeSBoYXZlIHRoZSBQUklNRSBvZmZsb2FkaW5nIGluIHBsYWNlIGFuZCBpZiB0
aGF0J3Mgbm90Cj4gPiBlbm91Z2gsIHdlIHNob3VsZCB3b3JrIG9uIGV4dGVuZGluZyBpdCwgbm90
IGFkZGluZyBzb21lIEFDUEkgYmFzZWQKPiA+IHdvcmthcm91bmRzLCBiZWNhdXNlIHRoYXQncyBl
eGFjdGx5IGhvdyB0aGF0IGxvb2tzIGxpa2UuCj4gPgo+ID4gQWxzbywgd2FzIHRoaXMgZGlzY3Vz
c2VkIHdpdGggYW55Ym9keSBpbnZvbHZlZCBpbiB0aGUgZHJtIHN1YnN5c3RlbT8KPiA+Cj4gPiA+
Cj4gPiA+IEkgZmVlbCB3ZSBuZWVkIGEga25vYiBhbmQvb3IgRE1JIGRldGVjdGlvbiB0byBhZmZl
Y3QgdGhlIGNoYW5nZXMgdGhhdCB0aGUgQVNMCj4gPiA+IG5vcm1hbGx5IHBlcmZvcm1zLgo+ID4K
PiA+IFdoeSBkbyB3ZSBoYXZlIHRvIGRvIHRoYXQgb24gYSBmaXJtd2FyZSBsZXZlbCBhdCBhbGw/
Cj4KPiBGb2xrcyBmcm9tIEFNRCBHcmFwaGljcyB0ZWFtIHJlY29tbWVuZGVkIHRoaXMgYXBwcm9h
Y2guICBGcm9tIHRoZWlyIHBlcnNwZWN0aXZlCj4gaXQncyBub3QgYSB3b3JrYXJvdW5kLiAgVGhl
eSB2aWV3IHRoaXMgYXMgYSBkaWZmZXJlbnQgYXJjaGl0ZWN0dXJlIGZvciBBTUQgZ3JhcGhpY3Mg
ZHJpdmVyIG9uCj4gV2luZG93cyBhbmQgQU1EIGdyYXBoaWNzIHcvIGFtZGdwdSBkcml2ZXIuICBU
aGV5IGhhdmUgZGlmZmVyZW50IEFTTCBwYXRocyB1c2VkIGZvcgo+IGVhY2guCgpAYWxleDogaXMg
dGhpcyB0cnVlPwpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRw
czovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
