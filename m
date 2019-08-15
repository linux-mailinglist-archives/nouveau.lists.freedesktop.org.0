Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE88EDA6
	for <lists+nouveau@lfdr.de>; Thu, 15 Aug 2019 16:04:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 365446E9C2;
	Thu, 15 Aug 2019 14:04:40 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f67.google.com (mail-ot1-f67.google.com
 [209.85.210.67])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D3A476E9C0
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 14:04:38 +0000 (UTC)
Received: by mail-ot1-f67.google.com with SMTP id c7so6159739otp.1
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 07:04:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/zM3G1xWX3WogoYIxIH0si8CwpIiqkYLZ2hiihxpOqQ=;
 b=mW8kBXFaxrnrlxKUMwLRyHfWJCnVdbBx3Xv53xOgM5W1LVzvAAI0GMJ+NXPoTxAjd+
 RHgyNxXBtqvJhsi/Sdg+mwOH6cUUskndVKYMhiI2GdrUZo70EaFPLgZ6RGS+bBmut5ID
 8QFQKRAekOgOc0dCgeRH44pl9We2huVL36GTpU4JWVfi0uZ2DiScj78bWCSf9sYc8Z0a
 Av6HQs5OMMNLhGolIoS8MPKL545dqSQQxOXW8XZjOL6l58hQNrGWWvHyA8p5AYav7F9j
 HQS38jHVg2l48xWC7R/dKK5lio3zRcxUkr+d0EjZI2lEi8eiakQVrh7nKyQx51Ep9WVr
 qMnQ==
X-Gm-Message-State: APjAAAWfZar25zSp8uD8za2i0QlGKqVQ96o2rCL8JYH6wjst4EZST0er
 nOG7KdKHK1RsRFBslTgRYPxgS1PbWR0nTe4ArtEZjg==
X-Google-Smtp-Source: APXvYqzchRXgP4x789+GjQl+9hOyJZGL6tLjLzEJ8LcaNO1Yx6DCAmdlcRIEhnpH8KVHbuj5x4BhAACAIvjM27sfOC8=
X-Received: by 2002:a5d:8195:: with SMTP id u21mr5821290ion.260.1565877878036; 
 Thu, 15 Aug 2019 07:04:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <20190814213118.28473-2-kherbst@redhat.com>
 <CAPM=9ty7yEUqKrcixV1tTuWCpyh6UikA3rxX8BF1E3fDb6WLQQ@mail.gmail.com>
 <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
In-Reply-To: <5e05532328324d01bc554c573f6298f8@AUSX13MPC101.AMER.DELL.COM>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 16:04:27 +0200
Message-ID: <CACO55tsDA1WpMGtAPqUJpWt0AmPDnv9LuC09g2KB5GXB-VSCew@mail.gmail.com>
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

T24gVGh1LCBBdWcgMTUsIDIwMTkgYXQgMzo1NiBQTSA8TWFyaW8uTGltb25jaWVsbG9AZGVsbC5j
b20+IHdyb3RlOgo+Cj4gPiAtLS0tLU9yaWdpbmFsIE1lc3NhZ2UtLS0tLQo+ID4gRnJvbTogbGlu
dXgtYWNwaS1vd25lckB2Z2VyLmtlcm5lbC5vcmcgPGxpbnV4LWFjcGktb3duZXJAdmdlci5rZXJu
ZWwub3JnPiBPbgo+ID4gQmVoYWxmIE9mIERhdmUgQWlybGllCj4gPiBTZW50OiBXZWRuZXNkYXks
IEF1Z3VzdCAxNCwgMjAxOSA1OjQ4IFBNCj4gPiBUbzogS2Fyb2wgSGVyYnN0Cj4gPiBDYzogTEtN
TDsgTGludXggQUNQSTsgZHJpLWRldmVsOyBub3V2ZWF1OyBSYWZhZWwgSiAuIFd5c29ja2k7IEFs
ZXggSHVuZzsgQmVuCj4gPiBTa2VnZ3M7IERhdmUgQWlybGllCj4gPiBTdWJqZWN0OiBSZTogW05v
dXZlYXVdIFtQQVRDSCAxLzddIFJldmVydCAiQUNQSSAvIE9TSTogQWRkIE9FTSBfT1NJIHN0cmlu
ZyB0bwo+ID4gZW5hYmxlIGRHUFUgZGlyZWN0IG91dHB1dCIKPiA+Cj4gPiBPbiBUaHUsIDE1IEF1
ZyAyMDE5IGF0IDA3OjMxLCBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6
Cj4gPiA+Cj4gPiA+IFRoaXMgcmV2ZXJ0cyBjb21taXQgMjg1ODZhNTFlZWE2NjZkNTUzMWJjYWVm
MmY2OGU0YWJiZDg3MjQyYy4KPiA+ID4KPiA+ID4gVGhlIG9yaWdpbmFsIGNvbW1pdCBtZXNzYWdl
IGRpZG4ndCBldmVuIG1ha2Ugc2Vuc2UuIEFNRCBfZG9lc18gc3VwcG9ydCBpdCBhbmQKPiA+ID4g
aXQgd29ya3Mgd2l0aCBOb3V2ZWF1IGFzIHdlbGwuCj4gPiA+Cj4gPiA+IEFsc28gd2hhdCB3YXMg
dGhlIGlzc3VlIGJlaW5nIHNvbHZlZCBoZXJlPyBObyByZWZlcmVuY2VzIHRvIGFueSBidWdzIGFu
ZCBub3QKPiA+ID4gZXZlbiBleHBsYWluaW5nIGFueSBpc3N1ZSBhdCBhbGwgaXNuJ3QgdGhlIHdh
eSB3ZSBkbyB0aGluZ3MuCj4gPiA+Cj4gPiA+IEFuZCBldmVuIGlmIGl0IG1lYW5zIGEgbXV4ZWQg
ZGVzaWduLCB0aGVuIHRoZSBmaXggaXMgdG8gbWFrZSBpdCB3b3JrIGluc2lkZSB0aGUKPiA+ID4g
ZHJpdmVyLCBub3QgYWRkaW5nIHNvbWUgaGFja3kgd29ya2Fyb3VuZCB0aHJvdWdoIEFDUEkgdHJp
Y2tzLgo+ID4gPgo+ID4gPiBBbmQgd2hhdCBvdXQgb2YgdHJlZSBkcml2ZXJzIGRvIG9yIGRvIG5v
dCBzdXBwb3J0IHdlIGRvbid0IGNhcmUgb25lIGJpdCBhbnl3YXkuCj4gPiA+Cj4gPgo+ID4gSSB0
aGluayB0aGUgcmV2ZXJ0cyBzaG91bGQgYmUgbWVyZ2VkIHZpYSBSYWZhZWwncyB0cmVlIGFzIHRo
ZSBvcmlnaW5hbAo+ID4gcGF0Y2hlcyB3ZW50IGluIHZpYSB0aGVyZSwgYW5kIHdlIHNob3VsZCBn
ZXQgdGhlbSBpbiBhc2FwLgo+ID4KPiA+IEFja2VkLWJ5OiBEYXZlIEFpcmxpZSA8YWlybGllZEBy
ZWRoYXQuY29tPgo+ID4gRGF2ZS4KPgo+IFRoZXJlIGFyZSBkZWZpbml0ZWx5IGdvaW5nIHRvIGJl
IHJlZ3Jlc3Npb25zIG9uIG1hY2hpbmVzIGluIHRoZSBmaWVsZCB3aXRoIHRoZQo+IGluIHRyZWUg
ZHJpdmVycyBieSByZXZlcnRpbmcgdGhpcy4gIEkgdGhpbmsgd2Ugc2hvdWxkIGhhdmUgYW4gYW5z
d2VyIGZvciBhbGwgb2YgdGhvc2UKPiBiZWZvcmUgdGhpcyByZXZlcnQgaXMgYWNjZXB0ZWQuCj4K
PiBSZWdhcmRpbmcgc3lzdGVtcyB3aXRoIEludGVsK05WSURJQSwgd2UnbGwgaGF2ZSB0byB3b3Jr
IHdpdGggcGFydG5lcnMgdG8gY29sbGVjdAo+IHNvbWUgaW5mb3JtYXRpb24gb24gdGhlIGltcGFj
dCBvZiByZXZlcnRpbmcgdGhpcy4KPgo+IFdoZW4gdGhpcyBpcyB1c2VkIG9uIGEgc3lzdGVtIHdp
dGggSW50ZWwrQU1EIHRoZSBBU0wgY29uZmlndXJlcyBBTUQgR1BVIHRvIHVzZQo+ICJIeWJyaWQg
R3JhcGhpY3MiIHdoZW4gb24gV2luZG93cyBhbmQgIlBvd2VyIEV4cHJlc3MiIGFuZCAiU3dpdGNo
YWJsZSBHcmFwaGljcyIKPiB3aGVuIG9uIExpbnV4LgoKYW5kIHdoYXQncyBleGFjdGx5IHRoZSBk
aWZmZXJlbmNlIGJldHdlZW4gdGhvc2U/IEFuZCB3aGF0J3MgdGhlIGFjdHVhbAppc3N1ZSBoZXJl
PwoKV2UgYWxyZWFkeSBoYXZlIHRoZSBQUklNRSBvZmZsb2FkaW5nIGluIHBsYWNlIGFuZCBpZiB0
aGF0J3Mgbm90CmVub3VnaCwgd2Ugc2hvdWxkIHdvcmsgb24gZXh0ZW5kaW5nIGl0LCBub3QgYWRk
aW5nIHNvbWUgQUNQSSBiYXNlZAp3b3JrYXJvdW5kcywgYmVjYXVzZSB0aGF0J3MgZXhhY3RseSBo
b3cgdGhhdCBsb29rcyBsaWtlLgoKQWxzbywgd2FzIHRoaXMgZGlzY3Vzc2VkIHdpdGggYW55Ym9k
eSBpbnZvbHZlZCBpbiB0aGUgZHJtIHN1YnN5c3RlbT8KCj4KPiBJIGZlZWwgd2UgbmVlZCBhIGtu
b2IgYW5kL29yIERNSSBkZXRlY3Rpb24gdG8gYWZmZWN0IHRoZSBjaGFuZ2VzIHRoYXQgdGhlIEFT
TAo+IG5vcm1hbGx5IHBlcmZvcm1zLgoKV2h5IGRvIHdlIGhhdmUgdG8gZG8gdGhhdCBvbiBhIGZp
cm13YXJlIGxldmVsIGF0IGFsbD8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3Rv
cC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2
ZWF1
