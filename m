Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 94E19107161
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2019 12:30:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 68EA06F52D;
	Fri, 22 Nov 2019 11:30:34 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-oi1-f193.google.com (mail-oi1-f193.google.com
 [209.85.167.193])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54B6B6F52C;
 Fri, 22 Nov 2019 11:30:33 +0000 (UTC)
Received: by mail-oi1-f193.google.com with SMTP id a14so6200064oid.5;
 Fri, 22 Nov 2019 03:30:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=1AztedQRtvfRwxfo3QRrdXEr1MGU4pSr0i/7X1wXzMk=;
 b=k/snj6lAG2ppcvEk+viifpJESmpLOy2MIIaaIesFI12S+MUni3tmz2UAYr2GxJ91GR
 JmawIezCkc74VtBB4sGKYHVq/BT0gyNe3/viQqwiAICjE8LOmEaxvjTttKt0RBAB0mJL
 EmESwzBcecdGpHkD0RzVklkokgf2lEeBDweCB2t2CqmjPfIw7FcOM3X0PjWlSnFuHJ5c
 U31A3lp/p6Pc+AeI0Hyuut0+sdeaFpUtBfk4v4GDfA1qYYFLQzwXCSK1LuPtonHDnVt6
 yeCHK5NIpIstEfzLRHv87/VD5knjXdM5hx4Lf+dubo/DcTDKQzqCzTF3i/dDKPbJ8DYA
 YzYA==
X-Gm-Message-State: APjAAAWoHGo+OdPI/sbZzfWkeu+ZU8zI2gJjyoaAVSk3ZG6EbUTnd3sm
 n3iusKH6oD+95GIeYUPHO+O35evSspXLdJdMILs=
X-Google-Smtp-Source: APXvYqzti1aGeFlD9zDtiv/CrHKaEJKHYU24UOkwwawEgE4xSBwiOz2/phcrsYazP5xsApZ2IvGteoKR1Op2YMhdvWc=
X-Received: by 2002:aca:1101:: with SMTP id 1mr12076316oir.103.1574422232306; 
 Fri, 22 Nov 2019 03:30:32 -0800 (PST)
MIME-Version: 1.0
References: <CAJZ5v0hkT-fHFOQKzp2qYPyR+NUa4c-G-uGLPZuQxqsG454PiQ@mail.gmail.com>
 <CACO55ttTPi2XpRRM_NYJU5c5=OvG0=-YngFy1BiR8WpHkavwXw@mail.gmail.com>
 <CAJZ5v0h=7zu3A+ojgUSmwTH0KeXmYP5OKDL__rwkkWaWqcJcWQ@mail.gmail.com>
 <20191121112821.GU11621@lahna.fi.intel.com>
 <CAJZ5v0hQhj5Wf+piU11abC4pF26yM=XHGHAcDv8Jsgdx04aN-w@mail.gmail.com>
 <20191121114610.GW11621@lahna.fi.intel.com>
 <20191121125236.GX11621@lahna.fi.intel.com>
 <CAJZ5v0iMwhudB7O0hR-6KfRfa+_iGOY=t0Zzeh6+9OiTzeYJfA@mail.gmail.com>
 <20191121194942.GY11621@lahna.fi.intel.com>
 <CAJZ5v0gyna0b135uxBVfNXgB9v-U9-93EYe0uzsr2BukJ9OtuA@mail.gmail.com>
 <20191122103637.GA11621@lahna.fi.intel.com>
In-Reply-To: <20191122103637.GA11621@lahna.fi.intel.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Fri, 22 Nov 2019 12:30:20 +0100
Message-ID: <CAJZ5v0gifnGZcKr6mgc6C2EfqX13OyJnOac0uDxYNKN=A0cgMg@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [Nouveau] [PATCH v4] pci: prevent putting nvidia GPUs into
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
Cc: "Rafael J. Wysocki" <rafael@kernel.org>,
 Linux PCI <linux-pci@vger.kernel.org>, Linux PM <linux-pm@vger.kernel.org>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBOb3YgMjIsIDIwMTkgYXQgMTE6MzYgQU0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgTm92IDIxLCAyMDE5IGF0IDEx
OjM5OjIzUE0gKzAxMDAsIFJhZmFlbCBKLiBXeXNvY2tpIHdyb3RlOgo+ID4gT24gVGh1LCBOb3Yg
MjEsIDIwMTkgYXQgODo0OSBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3RlcmJlcmdA
aW50ZWwuY29tPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gVGh1LCBOb3YgMjEsIDIwMTkgYXQgMDQ6
NDM6MjRQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gT24gVGh1LCBO
b3YgMjEsIDIwMTkgYXQgMTo1MiBQTSBNaWthIFdlc3RlcmJlcmcKPiA+ID4gPiA8bWlrYS53ZXN0
ZXJiZXJnQGludGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPgo+ID4gPiA+ID4gT24gVGh1LCBOb3Yg
MjEsIDIwMTkgYXQgMDE6NDY6MTRQTSArMDIwMCwgTWlrYSBXZXN0ZXJiZXJnIHdyb3RlOgo+ID4g
PiA+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAxMjozNDoyMlBNICswMTAwLCBSYWZhZWwg
Si4gV3lzb2NraSB3cm90ZToKPiA+ID4gPiA+ID4gPiBPbiBUaHUsIE5vdiAyMSwgMjAxOSBhdCAx
MjoyOCBQTSBNaWthIFdlc3RlcmJlcmcKPiA+ID4gPiA+ID4gPiA8bWlrYS53ZXN0ZXJiZXJnQGlu
dGVsLmNvbT4gd3JvdGU6Cj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gT24gV2VkLCBO
b3YgMjAsIDIwMTkgYXQgMTE6Mjk6MzNQTSArMDEwMCwgUmFmYWVsIEouIFd5c29ja2kgd3JvdGU6
Cj4gPiA+ID4gPiA+ID4gPiA+ID4gbGFzdCB3ZWVrIG9yIHNvIEkgZm91bmQgc3lzdGVtcyB3aGVy
ZSB0aGUgR1BVIHdhcyB1bmRlciB0aGUgIlBDSQo+ID4gPiA+ID4gPiA+ID4gPiA+IEV4cHJlc3Mg
Um9vdCBQb3J0IiAobmFtZSBmcm9tIGxzcGNpKSBhbmQgb24gdGhvc2Ugc3lzdGVtcyBhbGwgb2Yg
dGhhdAo+ID4gPiA+ID4gPiA+ID4gPiA+IHNlZW1zIHRvIHdvcmsuIFNvIEkgYW0gd29uZGVyaW5n
IGlmIGl0J3MgaW5kZWVkIGp1c3QgdGhlIDB4MTkwMSBvbmUsCj4gPiA+ID4gPiA+ID4gPiA+ID4g
d2hpY2ggYWxzbyBleHBsYWlucyBNaWthcyBjYXNlIHRoYXQgVGh1bmRlcmJvbHQgc3R1ZmYgd29y
a3MgYXMgZGV2aWNlcwo+ID4gPiA+ID4gPiA+ID4gPiA+IG5ldmVyIGdldCBwb3B1bGF0ZWQgdW5k
ZXIgdGhpcyBwYXJ0aWN1bGFyIGJyaWRnZSBjb250cm9sbGVyLCBidXQgdW5kZXIKPiA+ID4gPiA+
ID4gPiA+ID4gPiB0aG9zZSAiUm9vdCBQb3J0InMKPiA+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+
ID4gPiA+ID4gSXQgYWx3YXlzIGlzIGEgUENJZSBwb3J0LCBidXQgaXRzIGxvY2F0aW9uIHdpdGhp
biB0aGUgU29DIG1heSBtYXR0ZXIuCj4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+ID4gRXhh
Y3RseS4gSW50ZWwgaGFyZHdhcmUgaGFzIFBDSWUgcG9ydHMgb24gQ1BVIHNpZGUgKHRoZXNlIGFy
ZSBjYWxsZWQKPiA+ID4gPiA+ID4gPiA+IFBFRywgUENJIEV4cHJlc3MgR3JhcGhpY3MsIHBvcnRz
KSwgYW5kIHRoZSBQQ0ggc2lkZS4gSSB0aGluayB0aGUgSVAgaXMKPiA+ID4gPiA+ID4gPiA+IHN0
aWxsIHRoZSBzYW1lLgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4gPiA+ID4gPiA+ID4gQWxzbyBzb21l
IGN1c3RvbSBBTUwtYmFzZWQgcG93ZXIgbWFuYWdlbWVudCBpcyBpbnZvbHZlZCBhbmQgdGhhdCBt
YXkKPiA+ID4gPiA+ID4gPiA+ID4gYmUgbWFraW5nIHNwZWNpZmljIGFzc3VtcHRpb25zIG9uIHRo
ZSBjb25maWd1cmF0aW9uIG9mIHRoZSBTb0MgYW5kIHRoZQo+ID4gPiA+ID4gPiA+ID4gPiBHUFUg
YXQgdGhlIHRpbWUgb2YgaXRzIGludm9jYXRpb24gd2hpY2ggdW5mb3J0dW5hdGVseSBhcmUgbm90
IGtub3duIHRvCj4gPiA+ID4gPiA+ID4gPiA+IHVzLgo+ID4gPiA+ID4gPiA+ID4gPgo+ID4gPiA+
ID4gPiA+ID4gPiBIb3dldmVyLCBpdCBsb29rcyBsaWtlIHRoZSBBTUwgaW52b2tlZCB0byBwb3dl
ciBkb3duIHRoZSBHUFUgZnJvbQo+ID4gPiA+ID4gPiA+ID4gPiBhY3BpX3BjaV9zZXRfcG93ZXJf
c3RhdGUoKSBnZXRzIGNvbmZ1c2VkIGlmIGl0IGlzIG5vdCBpbiBQQ0kgRDAgYXQKPiA+ID4gPiA+
ID4gPiA+ID4gdGhhdCBwb2ludCwgc28gaXQgbG9va3MgbGlrZSB0aGF0IEFNTCB0cmllcyB0byBh
Y2Nlc3MgZGV2aWNlIG1lbW9yeSBvbgo+ID4gPiA+ID4gPiA+ID4gPiB0aGUgR1BVIChiZXlvbmQg
dGhlIFBDSSBjb25maWcgc3BhY2UpIG9yIHNpbWlsYXIgd2hpY2ggaXMgbm90Cj4gPiA+ID4gPiA+
ID4gPiA+IGFjY2Vzc2libGUgaW4gUENJIHBvd2VyIHN0YXRlcyBiZWxvdyBEMC4KPiA+ID4gPiA+
ID4gPiA+Cj4gPiA+ID4gPiA+ID4gPiBPciB0aGUgUENJIGNvbmZpZyBzcGFjZSBvZiB0aGUgR1BV
IHdoZW4gdGhlIHBhcmVudCByb290IHBvcnQgaXMgaW4gRDNob3QKPiA+ID4gPiA+ID4gPiA+IChh
cyBpdCBpcyB0aGUgY2FzZSBoZXJlKS4gQWxzbyB0aGVuIHRoZSBHUFUgY29uZmlnIHNwYWNlIGlz
IG5vdAo+ID4gPiA+ID4gPiA+ID4gYWNjZXNzaWJsZS4KPiA+ID4gPiA+ID4gPgo+ID4gPiA+ID4g
PiA+IFdoeSB3b3VsZCB0aGUgcGFyZW50IHBvcnQgYmUgaW4gRDNob3QgYXQgdGhhdCBwb2ludD8g
IFdvdWxkbid0IHRoYXQgYmUKPiA+ID4gPiA+ID4gPiBhIHN1c3BlbmQgb3JkZXJpbmcgdmlvbGF0
aW9uPwo+ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiBOby4gV2UgcHV0IHRoZSBHUFUgaW50byBEM2hv
dCBmaXJzdCwKPiA+ID4gPgo+ID4gPiA+IE9LCj4gPiA+ID4KPiA+ID4gPiBEb2VzIHRoaXMgaW52
b2x2ZSBhbnkgQU1MLCBsaWtlIGEgX1BTMyB1bmRlciB0aGUgR1BVIG9iamVjdD8KPiA+ID4KPiA+
ID4gSSBkb24ndCBzZWUgX1BTMyAobm9yIF9QUzApIGZvciB0aGF0IG9iamVjdC4gSWYgSSByZWFk
IGl0IHJpZ2h0IHRoZSBHUFUKPiA+ID4gaXRzZWxmIGlzIG5vdCBkZXNjcmliZWQgaW4gQUNQSSB0
YWJsZXMgYXQgYWxsLgo+ID4KPiA+IE9LCj4gPgo+ID4gPiA+ID4gPiB0aGVuIHRoZSByb290IHBv
cnQgYW5kIHRoZW4gdHVybgo+ID4gPiA+ID4gPiBvZmYgdGhlIHBvd2VyIHJlc291cmNlICh3aGlj
aCBpcyBhdHRhY2hlZCB0byB0aGUgcm9vdCBwb3J0KSByZXN1bHRpbmcKPiA+ID4gPiA+ID4gdGhl
IHRvcG9sb2d5IGVudGVyaW5nIEQzY29sZC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBJIGRvbid0IHNl
ZSB0aGF0IGhhcHBlbmluZyBpbiB0aGUgQU1MIHRob3VnaC4KPiA+ID4gPgo+ID4gPiA+IFdoaWNo
IEFNTCBkbyB5b3UgbWVhbiwgc3BlY2lmaWNhbGx5PyAgVGhlIF9PRkYgbWV0aG9kIGZvciB0aGUg
cm9vdAo+ID4gPiA+IHBvcnQncyBfUFIzIHBvd2VyIHJlc291cmNlIG9yIHNvbWV0aGluZyBlbHNl
Pwo+ID4gPgo+ID4gPiBUaGUgcm9vdCBwb3J0J3MgX09GRiBtZXRob2QgZm9yIHRoZSBwb3dlciBy
ZXNvdXJjZSByZXR1cm5lZCBieSBpdHMgX1BSMy4KPiA+Cj4gPiBPSywgc28gd2l0aG91dCB0aGUg
JHN1YmplY3QgcGF0Y2ggd2UgKDEpIHByb2dyYW0gdGhlIGRvd25zdHJlYW0KPiA+IGNvbXBvbmVu
dCAoR1BVKSBpbnRvIEQzaG90LCB0aGVuIHdlICgyKSBwcm9ncmFtIHRoZSBwb3J0IGhvbGRpbmcg
aXQKPiA+IGludG8gRDNob3QgYW5kIHRoZW4gd2UgKDMpIGxldCB0aGUgQU1MIChfT0ZGIGZvciB0
aGUgcG93ZXIgcmVzb3VyY2UKPiA+IGxpc3RlZCBieSBfUFIzIHVuZGVyIHRoZSBwb3J0IG9iamVj
dCkgcnVuLgo+ID4KPiA+IFNvbWV0aGluZyBzdHJhbmdlIGhhcHBlbnMgYXQgdGhpcyBwb2ludCAo
YW5kIEkgZ3Vlc3MgdGhhdCBfT0ZGIGRvZXNuJ3QKPiA+IGV2ZW4gcmVhY2ggdGhlIHBvaW50IHdo
ZXJlIGl0IHJlbW92ZXMgcG93ZXIgZnJvbSB0aGUgcG9ydCB3aGljaCBpcyB3aHkKPiA+IHdlIHNl
ZSBhIGxvY2stdXApLgo+Cj4gSXQgZG9lcyBub3QgbmVjZXNzYXJ5IGxlYWQgdG8gbG9jay11cC4g
SGVyZSBpcyBkbWVzZyBmcm9tIEthcm9sJ3MKPiBzeXN0ZW06Cj4KPiAgIGh0dHBzOi8vZ2lzdC5n
aXRodWJ1c2VyY29udGVudC5jb20va2Fyb2xoZXJic3QvNDBlYjA5MWM3YjdiMzNlZjk5MzUyNWRl
NjYwZjFhM2IvcmF3LzIzODBlMzFmNTY2ZTkzZTViYTdjODdlZjU0NTQyMDk2NWQ0YzQ5MmMvZ2lz
dGZpbGUxLnR4dAo+Cj4gd2hhdCBzZWVtcyB0byBoYXBwZW4gaXMgdGhhdCB0aGUgR1BVIG5ldmVy
ICJjb21lcyBiYWNrIiBmcm9tIEQzY29sZCBzbwo+IHRoZSBkcml2ZXIgc3RhcnRzIGJyZWFraW5n
IGFwYXJ0IGFzIHRoZSBoYXJkd2FyZSBpcyBnb25lIG5vdy4KCkkgbWVhbnQgYSBsb2NrLXVwIGlu
IGhhcmR3YXJlIHRvIGJlIHByZWNpc2UsIHRoYXQgY2F1c2VzIGl0IHRvIHN0b3AgdG8KcmVzcG9u
ZCAod2hpY2ggY2F1c2VzIGl0IHRvIGFwcGVhciB0byBiZSBwZXJtYW5lbnRseSBpbiBEM2NvbGQp
LgoKSSB3b25kZXIgaWYgdGhlIHBvcnQgYWNjZXB0cyBQQ0kgY29uZmlnIHNwYWNlIHdyaXRlcyB0
aGVuLgoKPiA+IFdlIGtub3cgdGhhdCBza2lwcGluZyAoMSkgbWFrZXMgdGhpbmdzIHdvcmsgYW5k
IHdlIGtpbmQgb2Ygc3VzcGVjdAo+ID4gdGhhdCBza2lwcGluZyAoMykgd291bGQgbWFrZSB0aGlu
Z3Mgd29yayBlaXRoZXIsIGJ1dCB3aGF0IGFib3V0IGRvaW5nCj4gPiAoMSkgYW5kICgzKSB3aXRo
b3V0ICgyKT8KPgo+IFlvdSBtZWFuIGluIHRoaXMgcGFydGljdWxhciBjYXNlIG9yIGluIGdlbmVy
YWw/CgpJbiB0aGlzIGNhc2UgaW4gcGFydGljdWxhciB0byBzdGFydCB3aXRoLiAgSnVzdCBkbyBh
biBleHBlcmltZW50IHRvCnNlZSB3aGF0IGhhcHBlbnMgaWYgd2Ugc2tpcCBwY2lfcmF3X3NldF9w
b3dlcl9zdGF0ZSgpIGZvciB0aGUgcG9ydAppbnN0ZWFkIG9mIHNraXBwaW5nIGl0IGZvciB0aGUg
ZG93bnN0cmVhbSBkZXZpY2UuCgo+IEJlY2F1c2UgaWYgdGhlIHBvcnQgaGFzIF9QU3ggbWV0aG9k
cyB3ZSBuZWVkIHRvIHB1dCBpdCBpbnRvIEQzaG90IEFGQUlLLgoKWWVzLCB3ZSBuZWVkIHRvIHJ1
biBfUFMzIHRoZW4sIGJ1dCBtYXliZSB3ZSBkb24ndCBuZWVkIHRvIHdyaXRlIHRvIGl0cwpQTUNT
UiBkaXJlY3RseS4KCj4gPiA+ID4gPiBCYXNpY2FsbHkgdGhlIGRpZmZlcmVuY2UgaXMgdGhhdCB3
aGVuIFdpbmRvd3MgNyBvciBMaW51eCAodGhlIF9SRVY9PTUKPiA+ID4gPiA+IGNoZWNrKSB0aGVu
IHdlIGRpcmVjdGx5IGRvIGxpbmsgZGlzYWJsZSB3aGVyZWFzIGluIFdpbmRvd3MgOCsgd2UgaW52
b2tlCj4gPiA+ID4gPiBMS0RTKCkgbWV0aG9kIHRoYXQgcHV0cyB0aGUgbGluayBpbnRvIEwyL0wz
LiBOb25lIG9mIHRoZSBmaWVsZHMgdGhleQo+ID4gPiA+ID4gYWNjZXNzIHNlZW0gdG8gdG91Y2gg
dGhlIEdQVSBpdHNlbGYuCj4gPiA+ID4KPiA+ID4gPiBTbyB0aGF0IG1heSBiZSB3aGVyZSB0aGUg
cHJvYmxlbSBpcy4KPiA+ID4gPgo+ID4gPiA+IFB1dHRpbmcgdGhlIGRvd25zdHJlYW0gY29tcG9u
ZW50IGludG8gUENJIERbMS0zXSBpcyBleHBlY3RlZCB0byBwdXQKPiA+ID4gPiB0aGUgbGluayBp
bnRvIEwxLCBzbyBJJ20gbm90IHN1cmUgaG93IHRoYXQgcGxheXMgd2l0aCB0aGUgbGF0ZXIKPiA+
ID4gPiBhdHRlbXB0IHRvIHB1dCBpdCBpbnRvIEwyL0wzIFJlYWR5Lgo+ID4gPgo+ID4gPiBUaGF0
IHNob3VsZCBiZSBmaW5lLiBXaGF0IEkndmUgc2VlbiB0aGUgbGluayBnb2VzIGludG8gTDEgd2hl
bgo+ID4gPiBkb3duc3RyZWFtIGNvbXBvbmVudCBpcyBwdXQgdG8gRC1zdGF0ZSAobm90IEQwKSBh
bmQgdGhlbiBpdCBpcyBwdXQgYmFjawo+ID4gPiB0byBMMCB3aGVuIEwyLzMgcmVhZHkgaXMgcHJv
cGFnYXRlZC4gRXZlbnR1YWxseSBpdCBnb2VzIGludG8gTDIgb3IgTDMuCj4gPgo+ID4gV2VsbCwg
dGhhdCdzIHRoZSBleHBlY3RlZCBiZWhhdmlvciwgYnV0IHRoZSBvYnNlcnZlZCBiZWhhdmlvciBp
c24ndCBhcwo+ID4gZXhwZWN0ZWQuIDotKQo+Cj4gUmlnaHQgOikKPgo+ID4gPiA+IEFsc28sIEwy
L0wzIFJlYWR5IGlzIGV4cGVjdGVkIHRvIGJlIHRyYW5zaWVudCwgc28gZmluYWxseSBwb3dlciBz
aG91bGQKPiA+ID4gPiBiZSByZW1vdmVkIHNvbWVob3cuCj4gPiA+Cj4gPiA+IFRoZXJlIGlzIEdQ
SU8gZm9yIGJvdGggcG93ZXIgYW5kIFBFUlNULCBJIHRoaW5rIHRoZSBsaW5lIGhlcmU6Cj4gPiA+
Cj4gPiA+ICAgXF9TQi5TR09WICgweDAxMDEwMDA0LCBaZXJvKQo+ID4gPgo+ID4gPiBpcyB0aGUg
b25lIHRoYXQgcmVtb3ZlcyBwb3dlci4KPiA+Cj4gPiBPSwo+ID4KPiA+ID4gPiA+IExLRFMoKSBm
b3IgdGhlIGZpcnN0IFBFRyBwb3J0IGxvb2tzIGxpa2UgdGhpczoKPiA+ID4gPiA+Cj4gPiA+ID4g
PiAgICBQMEwyID0gT25lCj4gPiA+ID4gPiAgICBTbGVlcCAoMHgxMCkKPiA+ID4gPiA+ICAgIExv
Y2FsMCA9IFplcm8KPiA+ID4gPiA+ICAgIFdoaWxlIChQMEwyKQo+ID4gPiA+ID4gICAgewo+ID4g
PiA+ID4gICAgICAgICBJZiAoKExvY2FsMCA+IDB4MDQpKQo+ID4gPiA+ID4gICAgICAgICB7Cj4g
PiA+ID4gPiAgICAgICAgICAgICBCcmVhawo+ID4gPiA+ID4gICAgICAgICB9Cj4gPiA+ID4gPgo+
ID4gPiA+ID4gICAgICAgICBTbGVlcCAoMHgxMCkKPiA+ID4gPiA+ICAgICAgICAgTG9jYWwwKysK
PiA+ID4gPiA+ICAgIH0KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPbmUgdGhpbmcgdGhhdCBjb21lcyB0
byBtaW5kIGlzIHRoYXQgdGhlIGxvb3AgY2FuIGVuZCBldmVuIGlmIFAwTDIgaXMKPiA+ID4gPiA+
IG5vdCBjbGVhcmVkIGFzIGl0IGRvZXMgb25seSA1IGl0ZXJhdGlvbnMgd2l0aCAxNiBtcyBzbGVl
cCBiZXR3ZWVuLiBNYXliZQo+ID4gPiA+ID4gU2xlZXAoKSBpcyBpbXBsZW1lbnRlZCBkaWZmZXJl
bnRseSBpbiBXaW5kb3dzPyBJIG1lYW4gTGludXggbWF5IGJlCj4gPiA+ID4gPiAiZmFzdGVyIiBo
ZXJlIGFuZCByZXR1cm4gcHJlbWF0dXJlbHkgYW5kIGlmIHdlIGxlYXZlIHRoZSBwb3J0IGludG8g
RDAKPiA+ID4gPiA+IHRoaXMgZG9lcyBub3QgaGFwcGVuLCBvciBzb21ldGhpbmcuIEknbSBqdXN0
IHRocm93aW5nIG91dCBpZGVhcyA6KQo+ID4gPiA+Cj4gPiA+ID4gQnV0IHRoaXMgYWN0dWFsbHkg
d29ya3MgZm9yIHRoZSBkb3duc3RyZWFtIGNvbXBvbmVudCBpbiBEMCwgZG9lc24ndCBpdD8KPiA+
ID4KPiA+ID4gSXQgZG9lcyBhbmQgdGhhdCBsZWF2ZXMgdGhlIGxpbmsgaW4gTDAgc28gaXQgY291
bGQgYmUgdGhhdCB0aGVuIHRoZQo+ID4gPiBhYm92ZSBBTUwgd29ya3MgYmV0dGVyIG9yIHNvbWV0
aGluZy4KPiA+Cj4gPiBUaGF0IHdvdWxkIGJlIG15IGd1ZXNzLgo+ID4KPiA+ID4gVGhhdCByZW1p
bmRzIG1lLCBBU1BNIG1heSBoYXZlIHNvbWV0aGluZyB0byBkbyB3aXRoIHRoaXMgYXMgd2VsbC4K
PiA+Cj4gPiBOb3QgcmVhbGx5IGlmIEQtc3RhdGVzIGFyZSBpbnZvbHZlZC4KPiA+Cj4gPiA+ID4g
QWxzbywgaWYgdGhlIGRvd25zdHJlYW0gY29tcG9uZW50IGlzIGluIEQwLCB0aGUgcG9ydCBhY3R1
YWxseSBzaG91bGQKPiA+ID4gPiBzdGF5IGluIEQwIHRvbywgc28gd2hhdCB3b3VsZCBoYXBwZW4g
d2l0aCB0aGUgJHN1YmplY3QgcGF0Y2ggYXBwbGllZD8KPiA+ID4KPiA+ID4gUGFyZW50IHBvcnQg
Y2Fubm90IGJlIGxvd2VyIEQtc3RhdGUgdGhhbiB0aGUgY2hpbGQgc28gSSBhZ3JlZSBpdCBzaG91
bGQKPiA+ID4gc3RheSBpbiBEMCBhcyB3ZWxsLiBIb3dldmVyLCBpdCBzZWVtcyB0aGF0IHdoYXQg
aGFwcGVucyBpcyB0aGF0IHRoZQo+ID4gPiBpc3N1ZSBnb2VzIGF3YXkgOikKPiA+Cj4gPiBXZWxs
LCBhdCBsZWFzdCB0aGlzIGlzIGtpbmQgb2Ygb3V0IG9mIHRoZSBzcGVjLgo+ID4KPiA+IE5vdGUg
dGhhdCBwY2lfcG1fc3VzcGVuZF9ub2lycSgpIHdvbid0IGxldCB0aGUgcG9ydCBnbyBpbnRvIEQz
IGlmIHRoZQo+ID4gZG93bnN0cmVhbSBkZXZpY2UgaXMgaW4gRDAsIHNvIHRoZSAkc3ViamVjdCBw
YXRjaCB3aWxsIG5vdCB3b3JrIGFzCj4gPiBleHBlY3RlZCBpbiB0aGUgc3VzcGVuZC10by1pZGxl
IGNhc2UuCj4gPgo+ID4gQWxzbyB3ZSByZWFsbHkgc2hvdWxkIG1ha2UgdXAgb3VyIG1pbmRzIG9u
IHdoZXRoZXIgb3Igbm90IHRvIGZvcmNlCj4gPiBQQ0llIHBvcnRzIHRvIHN0YXkgaW4gRDAgd2hl
biBkb3duc3RyZWFtIGRldmljZXMgYXJlIGluIEQwIGFuZCBiZQo+ID4gY29uc2VxdWVudCBhYm91
dCB0aGF0LiAgUmlnaHQgbm93IHdlIGRvIG9uZSB0aGluZyBkdXJpbmcgc3lzdGVtLXdpZGUKPiA+
IHN1c3BlbmQgYW5kIHRoZSBvdGhlciBvbmUgaW4gUE0tcnVudGltZSwgd2hpY2ggaXMgY29uZnVz
aW5nLgo+ID4KPiA+IFRoZSBjdXJyZW50IGRlc2lnbiBpcyBtb3N0bHkgYmFzZWQgb24gdGhlIFBD
SSBQTSBTcGVjIDEuMiwgc28gaXQgd291bGQKPiA+IGJlIGNvbnNlcXVlbnQgdG8gZm9sbG93IHN5
c3RlbS13aWRlIHN1c3BlbmQgaW4gUE0tcnVudGltZSBhbmQgYXZvaWQKPiA+IHB1dHRpbmcgUENJ
ZSBwb3J0cyBob2xkaW5nIGRldmljZXMgaW4gRDAgaW50byBhbnkgbG93LXBvd2VyIHN0YXRlcy4K
PiA+IGJ1dCB0aGF0IHdvdWxkIG1ha2UgdGhlIGFwcHJvYWNoIGluIHRoZSAkc3ViamVjdCBwYXRj
aCBpbmVmZmVjdGl2ZS4KPiA+Cj4gPiBNb3Jlb3ZlciwgdGhlIGZhY3QgdGhhdCB0aGVyZSBhcmUg
c2VwYXJhdGUgYnJhbmNoZXMgZm9yICJXaW5kb3dzIDciCj4gPiBhbmQgIldpbmRvd3MgOCsiIGtp
bmQgb2Ygc3VnZ2VzdCBhIGNoYW5nZSBpbiB0aGUgZXhwZWN0ZWQgYmVoYXZpb3IKPiA+IGJldHdl
ZW4gV2luZG93cyA3IGFuZCBXaW5kb3dzIDgsIGZyb20gdGhlIEFNTCBwZXJzcGVjdGl2ZS4gIEkg
d291bGQKPiA+IGd1ZXNzIHRoYXQgV2luZG93cyA3IGZvbGxvd2VkIFBDSSBQTSAxLjIgYW5kIFdp
bmRvd3MgOCAoYW5kIGxhdGVyKQo+ID4gZG9lcyBzb21ldGhpbmcgZWxzZS4KPgo+IE15IHVuZGVy
c3RhbmRpbmcgKHdoaWNoIG1heSBub3QgYmUgY29ycmVjdCkgaXMgdGhhdCB1cCB0byBXaW5kb3dz
IDcgaXQKPiBuZXZlciBwdXQgdGhlIGRldmljZXMgaW50byBEM2NvbGQgcnVudGltZS4gT25seSB3
aGVuIHRoZSBzeXN0ZW0gZW50ZXJlZAo+IFN4IHN0YXRlcyBpdCBldmFsdWF0ZWQgdGhlIF9PRkYg
bWV0aG9kcy4KCkkgc2VlLgoKPiBTdGFydGluZyBmcm9tIFdpbmRvd3MgOCBpdCBzdGFydGVkIGRv
aW5nIHRoaXMgcnVudGltZSBzbyBkZXZpY2VzIGNhbgo+IGVudGVyIEQzY29sZCBldmVuIHdoZW4g
c3lzdGVtIGlzIGluIFMwLgoKSG1tLiAgU28gYnkgc2V0dGluZyBfUkVWIHRvIDUgd2UgZWZmZWN0
aXZlbHkgY2hhbmdlIHRoZSBfT0ZGIGludG8gYSBOT1A/Cgo+ID4gTm93LCB0aGUgc3RydWN0dXJl
IG9mIHRoZSAiV2luZG93cyA4KyIgYnJhbmNoCj4gPiBkZXNjcmliZWQgYnkgeW91IHN1Z2dlc3Rz
IHRoYXQsIGF0IGxlYXN0IGluIHRoZSBjYXNlcyB3aGVuIGl0IGlzIGdvaW5nCj4gPiB0byByZW1v
dmUgcG93ZXIgZnJvbSB0aGUgcG9ydCBldmVudHVhbGx5LCBpdCBnb2VzIHN0cmFpZ2h0IGZvciB0
aGUKPiA+IGxpbmsgcHJlcGFyYXRpb24gKHRoZSBMMi9MMyBSZWFkeSB0cmFuc2l0aW9uKSBhbmQg
cG93ZXIgcmVtb3ZhbAo+ID4gd2l0aG91dCBib3RoZXJpbmcgdG8gcHJvZ3JhbSB0aGUgZG93bnN0
cmVhbSBkZXZpY2UgYW5kIHBvcnQgaW50byBEM2hvdAo+ID4gKGJlY2F1c2UgdGhhdCdzIGtpbmQg
b2YgcmVkdW5kYW50KS4KPiA+Cj4gPiBUaGF0IGh5cG90aGV0aWNhbCAiV2luZG93cyA4KyIgYXBw
cm9hY2ggbWF5IHJlYWxseSB3b3JrIHVuaXZlcnNhbGx5LAo+ID4gYmVjYXVzZSBpdCBkb2Vzbid0
IHNlZW0gdG8gYnJlYWsgYW55IHJ1bGVzIChnb2luZyBzdHJhaWdodCBmcm9tIEQwIHRvCj4gPiBE
M2NvbGQgaXMgbm90IGRpc2FsbG93ZWQgYW5kIGRvaW5nIHRoYXQgZm9yIGJvdGggYSBwb3J0IGFu
ZCBhCj4gPiBkb3duc3RyZWFtIGRldmljZSBhdCB0aGUgc2FtZSB0aW1lIGlzIGtpbmQgb2YgT0sg
ZWl0aGVyLCBhcyBsb25nIGFzCj4gPiB0aGUgbGluayBpcyByZWFkeSBmb3IgdGhhdCkuCj4KPiBJ
IGd1ZXNzIGl0IGRlcGVuZHMgb24gaG93IHlvdSBpbnRlcnByZXQgdGhlIHNwZWNzIDstKSBGcm9t
IFBDSWUgNS4wIHNlYwo+IDUuOCB3ZSBjYW4gc2VlIHRoZSBzdXBwb3J0ZWQgUE0gc3RhdGUgdHJh
bnNpdGlvbnMgYW5kIGl0IHNob3dzIHRoYXQgeW91Cj4gZ2V0IHRvIEQzY29sZCB0aHJvdWdoIEQz
aG90LiBPZiBjb3Vyc2UgdGhlIGRldmljZSBnb2VzIGludG8gRDNjb2xkIGlmCj4geW91IHNpbXBs
eSByZW1vdmUgaXRzIHBvd2VyIHNvIEkgYWdyZWUgd2l0aCB5b3UgYXMgd2VsbC4gSG93ZXZlciwg
aWYKPiB0aGVyZSBpcyBfUFMzIG1ldGhvZCB3ZSBjYW4ndCBza2lwIHRoZSBEM2hvdCBwaGFzZS4K
ClRoYXQncyBteSB1bmRlcnN0YW5kaW5nIHRvbywgYnV0IEknbSB3b25kZXJpbmcgYWJvdXQgZGly
ZWN0IFBNQ1NSCndyaXRlcy4gIEl0IGlzIHVuY2xlYXIgdG8gbWUgaWYgdGhleSBhcmUgbmVjZXNz
YXJ5LCBvciBtb3JlIHByZWNpc2VseSwKd2hldGhlciBvciBub3QgV2luZG93cyAxMCwgc2F5LCBj
YXJyaWVzIHRoZW0gb3V0IGlmIEFDUEkgUE0gaXMgZ29pbmcKdG8gYmUgYXBwbGllZC4KCk1heWJl
IEknbSBnb2luZyB0b28gZmFyIHdpdGggbXkgY29uY2x1c2lvbnMsIGJ1dCBwbGVhc2UgbGV0IG1l
IGtub3cKd2hhdCB5b3UgdGhpbmsgYWJvdXQgdGhlIGFwcHJvYWNoIHByb3Bvc2VkIGF0IHRoZSBl
bmQgb2YKaHR0cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGludXgtcG0vQ0FKWjV2MGlRdHRHQjRtNVRi
ekN0anAyQzFqNXFFa1VocWhwV2IrK0xoU2szbWJXPUx3QG1haWwuZ21haWwuY29tL1QvI3QKPwpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
