Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4581039F0
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 13:19:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 966C66E4E8;
	Wed, 20 Nov 2019 12:19:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D101D6E4E8
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 12:19:46 +0000 (UTC)
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-302-vaJ73VsOOIq5K47cScAfwA-1; Wed, 20 Nov 2019 07:19:42 -0500
Received: by mail-qv1-f72.google.com with SMTP id a4so16990296qvz.20
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 04:19:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=oWs1Gk0ow9/Ugo0hlEi2MnfVfxY0H34jjDGUnWVNnGE=;
 b=UlHWjoSQvLAP+S5mxF92Fon+In/2nXtajRfHM15QCVe/cQLbBtCfNosa1E81Uz59yj
 OqG1gM2A55RtQM+UqRZwMMDIWCy5TETZ6MxSERuu1POLuq7g7YTilqxNl6aW766iMJ6t
 V9he2rFe/obPXu/1/ma0oj6tjfYz9+KhtC+7UYKvluBoInPQUUWRzwXxhxWtlljNtx/L
 olP/FRqKYcRhPV6fn8fZp/oE/PYAKm1qVSrpwjj01ZeaALVEnzdoMsBQWM/9gLywBSCW
 jPZxLadrFqnG2hTGqnudSOy9G7j6c5Il+phwTWIcoaQj3iCZzT+REqaX9bzcdCy2ALYf
 /CbQ==
X-Gm-Message-State: APjAAAUhzknNWC0fizXU0/fH7rJFT4Q5W3RiZnGhqEDtF7lyZWk13U8o
 oGWmchQY4UNSjxVS3N5pzp2lDHNChrHUCnjsyopyT/4cO7ZX6Y+sSQA3cHCSG5Azzi+JYAr+F2u
 llt8Ryn1DgbGpZO2+fE6OTFVupoPBjeHnTNrcQc+vAA==
X-Received: by 2002:ae9:f511:: with SMTP id o17mr2053119qkg.157.1574252382239; 
 Wed, 20 Nov 2019 04:19:42 -0800 (PST)
X-Google-Smtp-Source: APXvYqwYYwY32hdZJpgO9a9F96+AV3XWlzoWfPmJ3+IXJz1kjQ4tZP3raHWzLm6tC4nakFswJXw9vp47sPBOfFGfJkw=
X-Received: by 2002:ae9:f511:: with SMTP id o17mr2053086qkg.157.1574252381985; 
 Wed, 20 Nov 2019 04:19:41 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <CAJZ5v0in4VSULsfLshHxhNLf+NZxVQM0xx=hzdNa2X3FW=V7DA@mail.gmail.com>
 <CACO55tsjj+xkDjubz1J=fsPecW4H_J8AaBTeaMm+NYjp8Kiq8g@mail.gmail.com>
 <CAJZ5v0ithxMPK2YxfTUx_Ygpze2FMDJ6LwKwJb2vx89dfgHX_A@mail.gmail.com>
 <CACO55tupFbq0T1DcR+C+YxtPR=csPBQhwVXz_SHWT5F8bRK8JA@mail.gmail.com>
 <CAJZ5v0h_ymqsoOVm9s2h5X0ejYdM4x03H7xPQ38uiO009OVgpQ@mail.gmail.com>
In-Reply-To: <CAJZ5v0h_ymqsoOVm9s2h5X0ejYdM4x03H7xPQ38uiO009OVgpQ@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 13:19:30 +0100
Message-ID: <CACO55tu9PqhgjCEB0psaqnh+-FEOj7Y+sB_So56iHnE2kj9Z+A@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
X-MC-Unique: vaJ73VsOOIq5K47cScAfwA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574252385;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=6tQSiatJZXoqislkFRtZVMOCpA4DqNNH30wH7vD5XN4=;
 b=dKpe/N2N7qsJzY2TGiMm9c6S839gctYTWhB5apuWBXbvhUCLcicI/yMddAg5FVl36lMIWR
 fAWWH/widBZ0G4Aluh6TiquSs63V/h8UZXYG7B9bsuJPPTwT9x/KvH248x3VmFvbrectkl
 2uWaDfqRj0u5is8JACQSKtFw0gGGiDw=
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
Cc: Linux PM <linux-pm@vger.kernel.org>, Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@intel.com>,
 Mario Limonciello <Mario.Limonciello@dell.com>,
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Bjorn Helgaas <helgaas@kernel.org>, nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SXQgZGVwZW5kcyBvbiB0aGUga2VybmVsIGJlaW5nIGJ1aWx0IHdpdGggQUNQSV9SRVZfT1ZFUlJJ
REVfUE9TU0lCTEU9eQphbmQgYWNwaV9yZXZfb3ZlcnJpZGU9MSBiZWluZyBzZXQgb24gdGhlIGtl
cm5lbCBjb21tYW5kIGxpbmUKCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDE6MTUgUE0gUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPgo+IE9uIFdlZCwgTm92IDIw
LCAyMDE5IGF0IDE6MTAgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3Rl
Ogo+ID4KPiA+IE9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDE6MDYgUE0gUmFmYWVsIEouIFd5c29j
a2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4KPiA+ID4gT24gV2VkLCBOb3YgMjAs
IDIwMTkgYXQgMTI6NTEgUE0gS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+IHdyb3Rl
Ogo+ID4gPiA+Cj4gPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NDggUE0gUmFmYWVs
IEouIFd5c29ja2kgPHJhZmFlbEBrZXJuZWwub3JnPiB3cm90ZToKPiA+ID4gPiA+Cj4gPiA+ID4g
PiBPbiBXZWQsIE5vdiAyMCwgMjAxOSBhdCAxMjoyMiBQTSBNaWthIFdlc3RlcmJlcmcKPiA+ID4g
PiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwuY29tPiB3cm90ZToKPiA+ID4gPiA+ID4KPiA+ID4g
PiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6NTI6MjJBTSArMDEwMCwgUmFmYWVsIEou
IFd5c29ja2kgd3JvdGU6Cj4gPiA+ID4gPiA+ID4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTE6
MTggQU0gTWlrYSBXZXN0ZXJiZXJnCj4gPiA+ID4gPiA+ID4gPG1pa2Eud2VzdGVyYmVyZ0BpbnRl
bC5jb20+IHdyb3RlOgo+ID4gPiA+ID4gPiA+ID4KPiA+ID4KPiA+ID4gW2N1dF0KPiA+ID4KPiA+
ID4gPiA+ID4gPgo+ID4gPiA+ID4gPiA+IE9oLCBzbyBkb2VzIGl0IGxvb2sgbGlrZSB3ZSBhcmUg
dHJ5aW5nIHRvIHdvcmsgYXJvdW5kIEFNTCB0aGF0IHRyaWVkCj4gPiA+ID4gPiA+ID4gdG8gd29y
ayBhcm91bmQgc29tZSBwcm9ibGVtYXRpYyBiZWhhdmlvciBpbiBMaW51eCBhdCBvbmUgcG9pbnQ/
Cj4gPiA+ID4gPiA+Cj4gPiA+ID4gPiA+IFllcywgaXQgbG9va3MgbGlrZSBzbyBpZiBJIHJlYWQg
dGhlIEFTTCByaWdodC4KPiA+ID4gPiA+Cj4gPiA+ID4gPiBPSywgc28gdGhhdCB3b3VsZCBjYWxs
IGZvciBhIERNSS1iYXNlZCBxdWlyayBhcyB0aGUgcmVhbCBjYXVzZSBmb3IgdGhlCj4gPiA+ID4g
PiBpc3N1ZSBzZWVtcyB0byBiZSB0aGUgQU1MIGluIHF1ZXN0aW9uLCB3aGljaCBtZWFucyBhIGZp
cm13YXJlIHByb2JsZW0uCj4gPiA+ID4gPgo+ID4gPiA+Cj4gPiA+ID4gQW5kIEkgZGlzYWdyZWUg
YXMgdGhpcyBpcyBhIGxpbnV4IHNwZWNpZmljIHdvcmthcm91bmQgYW5kIHdpbmRvd3MgZ29lcwo+
ID4gPiA+IHRoYXQgcGF0aCBhbmQgc3VjY2VlZHMuIFRoaXMgZmlybXdhcmUgYmFzZWQgd29ya2Fy
b3VuZCB3YXMgYWRkZWQsCj4gPiA+ID4gYmVjYXVzZSBpdCBicm9rZSBvbiBMaW51eC4KPiA+ID4K
PiA+ID4gQXBwYXJlbnRseSBzbyBhdCB0aGUgdGltZSBpdCB3YXMgYWRkZWQsIGJ1dCB3b3VsZCBp
dCBzdGlsbCBicmVhayBhZnRlcgo+ID4gPiB0aGUga2VybmVsIGNoYW5nZXMgbWFkZSBzaW5jZSB0
aGVuPwo+ID4gPgo+ID4gPiBNb3Jlb3ZlciwgaGFzIGl0IG5vdCBiZWNvbWUgaGFybWZ1bCBub3c/
ICBJT1csIHdvdWxkbid0IGl0IHdvcmsgYWZ0ZXIKPiA+ID4gcmVtb3ZpbmcgdGhlICJMaW51eCB3
b3JrYXJvdW5kIiBmcm9tIHRoZSBBTUw/Cj4gPiA+Cj4gPiA+IFRoZSBvbmx5IHdheSB0byB2ZXJp
ZnkgdGhhdCBJIGNhbiBzZWUgd291bGQgYmUgdG8gcnVuIHRoZSBzeXN0ZW0gd2l0aAo+ID4gPiBj
dXN0b20gQUNQSSB0YWJsZXMgd2l0aG91dCB0aGUgIkxpbnV4IHdvcmthcm91bmQiIGluIHRoZSBB
TUwgaW4KPiA+ID4gcXVlc3Rpb24uCj4gPiA+Cj4gPgo+ID4gdGhlIHdvcmthcm91bmQgaXMgbm90
IGVuYWJsZWQgYnkgZGVmYXVsdCwgYmVjYXVzZSBpdCBoYXMgdG8gYmUKPiA+IGV4cGxpY2l0bHkg
ZW5hYmxlZCBieSB0aGUgdXNlci4KPgo+IEknbSBub3Qgc3VyZSB3aGF0IHlvdSBhcmUgdGFsa2lu
ZyBhYm91dC4KPgo+IEknbSB0YWtpbmcgc3BlY2lmaWNhbGx5IGFib3V0IHRoZSAoKE9TWVMgPT0g
MHgwN0RGKSAmJiAoX1JFViA9PSAweDA1KSkKPiBjaGVjayBtZW50aW9uZWQgYnkgTWlrYSB3aGlj
aCBkb2Vzbid0IHNlZW0gdG8gZGVwZW5kIG9uIHVzZXIgaW5wdXQgaW4KPiBhbnkgd2F5Lgo+Cgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1h
aWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
