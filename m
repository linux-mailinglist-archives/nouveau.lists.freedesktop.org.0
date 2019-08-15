Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CE78EDCC
	for <lists+nouveau@lfdr.de>; Thu, 15 Aug 2019 16:11:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143E46E3E7;
	Thu, 15 Aug 2019 14:11:15 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-x244.google.com (mail-oi1-x244.google.com
 [IPv6:2607:f8b0:4864:20::244])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C6456E3E7
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 14:11:13 +0000 (UTC)
Received: by mail-oi1-x244.google.com with SMTP id l12so2129877oil.1
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 07:11:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=JoGosoNZCrkvvmYn2s5nj1f5F7hDnA1u4nMizuQrZrY=;
 b=APC1d0lQ7Esr7IpQ51n8UaaP9niX91cx6NqdvisxmZt0qOLRkPaz06szd9Iij0YWA9
 iPgwNOKn5WqLi6n/26hCxqTFrQZ7QBu5+JF97FwiNwE7irXiZRI8rX+OSl5PPR57cE/y
 8PhLzfS+5qQpDvNw+ia4LDAyXEi/Dl1BzUNYFj8m6JWLbjA9zq/OXTMZZvnygMN4J/z+
 1DsL2aK59mVV1lqWhnMfnqGEMVG57ba448StbeaLbh6b+b1mX8jzkvtV7Ch+t0HMslFz
 95tz+Vs0oRYaJGyuGGczG2BCsBEIGsuflkdAD1MEzYX0fgfM+z215TglBkWAgkPDIUSK
 +2QA==
X-Gm-Message-State: APjAAAUkM0i4YK6rhMRIu3dIXMLKUXbp9x2dU0icAf+i4bOuU6szHRIL
 HHESsA+fsbg5jqdHx1YRHLaLB5HyAI2ljlHnfhlmDA==
X-Google-Smtp-Source: APXvYqxHHuZUJHutmpU1PxQt0uV2+Ykat106aSv9mv+sZohSCF2iaIS7JJIHSD9E9jn0yYbTdunJelrlspa8xiz2IJo=
X-Received: by 2002:aca:1a0b:: with SMTP id a11mr1746505oia.128.1565878272617; 
 Thu, 15 Aug 2019 07:11:12 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
In-Reply-To: <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
From: Daniel Vetter <daniel@ffwll.ch>
Date: Thu, 15 Aug 2019 16:11:00 +0200
Message-ID: <CAKMK7uG1cugQvYLpEivDGg7+D0tUp5B9Jo7hWQCsmbXe3TC3nQ@mail.gmail.com>
To: Dave Airlie <airlied@gmail.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=JoGosoNZCrkvvmYn2s5nj1f5F7hDnA1u4nMizuQrZrY=;
 b=ZXn1m1FH5gKNEJpDzbYEQ/TeOQBFIvpbkI0YuusZkSaNu++nHT1eLRd2C0K7SmEAgt
 jcz2rhXJ7QOxzzGjCvG5GHfReRUVq1aSjj24gtd7eoYRZGB5E3+Qbmxj6k0AyKDjw0TD
 z1yiA/d8MOlh5J7FDAOEg7RTXNhViOukHDi9w=
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
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMTI6NDcgQU0gRGF2ZSBBaXJsaWUgPGFpcmxpZWRAZ21h
aWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgMTUgQXVnIDIwMTkgYXQgMDc6MzEsIEthcm9sIEhl
cmJzdCA8a2hlcmJzdEByZWRoYXQuY29tPiB3cm90ZToKPiA+Cj4gPiBUaGlzIHJldmVydHMgY29t
bWl0IDI4NTg2YTUxZWVhNjY2ZDU1MzFiY2FlZjJmNjhlNGFiYmQ4NzI0MmMuCj4gPgo+ID4gVGhl
IG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdlIGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9l
c18gc3VwcG9ydCBpdCBhbmQKPiA+IGl0IHdvcmtzIHdpdGggTm91dmVhdSBhcyB3ZWxsLgo+ID4K
PiA+IEFsc28gd2hhdCB3YXMgdGhlIGlzc3VlIGJlaW5nIHNvbHZlZCBoZXJlPyBObyByZWZlcmVu
Y2VzIHRvIGFueSBidWdzIGFuZCBub3QKPiA+IGV2ZW4gZXhwbGFpbmluZyBhbnkgaXNzdWUgYXQg
YWxsIGlzbid0IHRoZSB3YXkgd2UgZG8gdGhpbmdzLgo+ID4KPiA+IEFuZCBldmVuIGlmIGl0IG1l
YW5zIGEgbXV4ZWQgZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8gbWFrZSBpdCB3b3JrIGluc2lk
ZSB0aGUKPiA+IGRyaXZlciwgbm90IGFkZGluZyBzb21lIGhhY2t5IHdvcmthcm91bmQgdGhyb3Vn
aCBBQ1BJIHRyaWNrcy4KPiA+Cj4gPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9y
IGRvIG5vdCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25lIGJpdCBhbnl3YXkuCj4gPgo+Cj4gSSB0
aGluayB0aGUgcmV2ZXJ0cyBzaG91bGQgYmUgbWVyZ2VkIHZpYSBSYWZhZWwncyB0cmVlIGFzIHRo
ZSBvcmlnaW5hbAo+IHBhdGNoZXMgd2VudCBpbiB2aWEgdGhlcmUsIGFuZCB3ZSBzaG91bGQgZ2V0
IHRoZW0gaW4gYXNhcC4KCisxCgo+IEFja2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEByZWRo
YXQuY29tPgoKQWNrZWQtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0ZXJAZmZ3bGwuY2g+
CgpBbHNvIGZ1bGx5IGFncmVlaW5nIHdpdGggS2Fyb2wncyByZXBseSBmdXJ0aGVyIGRvd24sIGlm
IHRoaXMgZG9lc24ndAp3b3JrIHdlIG5lZWQgdG8gaW1wcm92ZSB0aGUgZHJpdmVycywgbm90IHBp
bGUgc3R1ZmYgb24gdG9wIGluIHNvbWUKQUNQSSBoYWNrcy4KLURhbmllbAotLSAKRGFuaWVsIFZl
dHRlcgpTb2Z0d2FyZSBFbmdpbmVlciwgSW50ZWwgQ29ycG9yYXRpb24KKzQxICgwKSA3OSAzNjUg
NTcgNDggLSBodHRwOi8vYmxvZy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZy
ZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3Rp
bmZvL25vdXZlYXU=
