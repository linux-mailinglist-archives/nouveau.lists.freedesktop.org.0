Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80A33C1DC2
	for <lists+nouveau@lfdr.de>; Mon, 30 Sep 2019 11:16:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9775389DB0;
	Mon, 30 Sep 2019 09:16:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1794889DED
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 09:16:01 +0000 (UTC)
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 9D39659465
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 09:16:00 +0000 (UTC)
Received: by mail-io1-f72.google.com with SMTP id w8so28914146iod.21
 for <nouveau@lists.freedesktop.org>; Mon, 30 Sep 2019 02:16:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=TYALegoGq2x0f4Xpam8g4n/KmRTLzFLFdMWS2x+BRTo=;
 b=USMZ3F4cY668Ozry+WT8RHYQyNn197ef7nOqIihSjFxxiFI+ydmtSeI4Y8RjcA59Ee
 DiltQfHuDwHQqNSC3DEvMvCXUWAbKNCv9683D8sdsqW3EE6Vg5er+quiB4eQKjPL/R8D
 MTYrAxOzjANw6hEZiImp+REwIGVNP/K0EbDv63tpdgbZuwEp60bW5FGeeyzMqzxjx4km
 2pAVrjduUDkBDl6wUzC1ec/BVjGTJukuV/amlaR/YO0KfZHUjH9e/NN4XZDuF4eLmnCv
 YB9rH+IcClc89oVInuA4rxoWtn/Kx88lQ7BDdJ/A51COIea8oqGo9dkoDjvaNO34S9Sq
 bwcg==
X-Gm-Message-State: APjAAAWLpEuUhefwHl9/mhTYX+TQsQf9pZL2toxiPdRRnVTrlqsXnYfQ
 VHHRKCE4NiTMV0Wc8onKx9+2qRpZv18eTakiXXe9YE/hwGGOOzLwaZaWdhYkZUFBCTKzI2IqDNW
 Pw2sPPNFyK3hXNwTugKOFTb4cPIjusckHfK5oejvYCw==
X-Received: by 2002:a92:5e1b:: with SMTP id s27mr19109716ilb.178.1569834960039; 
 Mon, 30 Sep 2019 02:16:00 -0700 (PDT)
X-Google-Smtp-Source: APXvYqzPkXeGqth758z+hZfIc2R8kD4VkXAa/WTJi6BfLuef+qvcqGexqJEgTITxFa30xLqGIhrpPCs116BcIvdOFKY=
X-Received: by 2002:a92:5e1b:: with SMTP id s27mr19109703ilb.178.1569834959772; 
 Mon, 30 Sep 2019 02:15:59 -0700 (PDT)
MIME-Version: 1.0
References: <20190927144421.22608-1-kherbst@redhat.com>
 <20190927214252.GA65801@google.com>
 <CACO55tuaY1jFXpJPeC9M4PoWEDyy547_tE8MpLaTDb+C+ffsbg@mail.gmail.com>
 <20190930080534.GS2714@lahna.fi.intel.com>
In-Reply-To: <20190930080534.GS2714@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 30 Sep 2019 11:15:48 +0200
Message-ID: <CACO55tuMo1aAA7meGtEey6J6sOS-ZA0ebZeL52i2zfkWtPqe_g@mail.gmail.com>
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

T24gTW9uLCBTZXAgMzAsIDIwMTkgYXQgMTA6MDUgQU0gTWlrYSBXZXN0ZXJiZXJnCjxtaWthLndl
c3RlcmJlcmdAbGludXguaW50ZWwuY29tPiB3cm90ZToKPgo+IEhpIEthcm9sLAo+Cj4gT24gRnJp
LCBTZXAgMjcsIDIwMTkgYXQgMTE6NTM6NDhQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+
ID4gPiBXaGF0IGV4YWN0bHkgaXMgdGhlIHNlcmlvdXMgaXNzdWU/ICBJIGd1ZXNzIGl0J3MgdGhh
dCB0aGUgcmVzY2FuCj4gPiA+IGRvZXNuJ3QgZGV0ZWN0IHRoZSBHUFUsIHdoaWNoIG1lYW5zIGl0
J3Mgbm90IHJlc3BvbmRpbmcgdG8gY29uZmlnCj4gPiA+IGFjY2Vzc2VzPyAgSXMgdGhlcmUgYW55
IHRpbWluZyBjb21wb25lbnQgaGVyZSwgZS5nLiwgbWF5YmUgd2UncmUKPiA+ID4gbWlzc2luZyBz
b21lIGRlbGF5IGxpa2UgdGhlIG9uZXMgTWlrYSBpcyBhZGRpbmcgdG8gdGhlIHJlc2V0IHBhdGhz
Pwo+ID4KPiA+IFdoZW4gSSB3YXMgY2hlY2tpbmcgdXAgb24gc29tZSBvZiB0aGUgUENJIHJlZ2lz
dGVycyBvZiB0aGUgYnJpZGdlCj4gPiBjb250cm9sbGVyLCB0aGUgc2xvdCBkZXRlY3Rpb24gdG9s
ZCBtZSB0aGF0IHRoZXJlIGlzIG5vIGRldmljZQo+ID4gcmVjb2duaXplZCBhbnltb3JlLiBJIGRv
bid0IGtub3cgd2hpY2ggcmVnaXN0ZXIgaXQgd2FzIGFueW1vcmUsIHRob3VnaAo+ID4gSSBndWVz
cyBvbmUgY291bGQgcmVhZCBpdCB1cCBpbiB0aGUgU29DIHNwZWMgZG9jdW1lbnQgYnkgSW50ZWwu
Cj4gPgo+ID4gTXkgZ3Vlc3MgaXMsIHRoYXQgdGhlIGJyaWRnZSBjb250cm9sbGVyIGZhaWxzIHRv
IGRldGVjdCB0aGUgR1BVIGJlaW5nCj4gPiBoZXJlIG9yIGFjdGl2ZWx5IHRocmV3IGl0IG9mIHRo
ZSBidXMgb3Igc29tZXRoaW5nLiBCdXQgYSBub3JtYWwgc3lzdGVtCj4gPiBzdXNwZW5kL3Jlc3Vt
ZSBjeWNsZSBicmluZ3MgdGhlIEdQVSBiYWNrIG9ubGluZSAoZG9pbmcgYSByZXNjYW4gdmlhCj4g
PiBzeXNmcyBnZXRzIHRoZSBkZXZpY2UgZGV0ZWN0ZWQgYWdhaW4pCj4KPiBDYW4geW91IGVsYWJv
cmF0ZSBhIGJpdCB3aGF0IGtpbmQgb2Ygc2NlbmFyaW8gdGhlIGlzc3VlIGhhcHBlbnMgKGUuZwo+
IHN0ZXBzIGhvdyBpdCByZXByb2R1Y2VzKT8gSXQgd2FzIG5vdCAxMDAlIGNsZWFyIGZyb20gdGhl
IGNoYW5nZWxvZy4gQWxzbwo+IHdoYXQgdGhlIHJlc3VsdCB3aGVuIHRoZSBmYWlsdXJlIGhhcHBl
bnM/Cj4KCnllYWgsIEkgYWxyZWFkeSBoYXZlIGFuIHVwZGF0ZWQgcGF0Y2ggaW4gdGhlIHdvcmtz
IHdoaWNoIGFsc28gZG9lcyB0aGUKcmV3b3JrIEJqb3JuIHN1Z2dlc3RlZC4gSGFkIG5vIHRpbWUg
eWV0IHRvIHRlc3QgaWYgSSBkaWRuJ3QgbWVzcyBpdAp1cC4KCkkgYW0gYWxzbyB0aGlua2luZyBv
ZiBhZGRpbmcgYSBrZXJuZWwgcGFyYW1ldGVyIHRvIGVuYWJsZSB0aGlzCndvcmthcm91bmQgb24g
ZGVtYW5kLCBidXQgbm90IHF1aXRlIHN1cmUgb24gdGhhdCBvbmUgeWV0LgoKPiBJIHNlZSB0aGVy
ZSBpcyBhIHNjcmlwdCB0aGF0IGRvZXMgc29tZXRoaW5nIGJ1dCB1bmZvcnR1bmF0ZWx5IEknbSBu
b3QKPiBmbHVlbnQgaW4gUHl0aG9uIHNvIGNhbid0IGV4dHJhY3QgdGhlIHN0ZXBzIGhvdyB0aGUg
aXNzdWUgY2FuIGJlCj4gcmVwcm9kdWNlZCA7LSkKPgo+IE9uZSB0aGluZyB0aGF0IEknbSB3b3Jr
aW5nIG9uIGlzIHRoYXQgTGludXggUENJIHN1YnN5c3RlbSBtaXNzZXMgY2VydGFpbgo+IGRlbGF5
cyB0aGF0IGFyZSBuZWVkZWQgYWZ0ZXIgRDNjb2xkIC0+IEQwIHRyYW5zaXRpb24sIG90aGVyd2lz
ZSB0aGUKPiBkZXZpY2UgYW5kL29yIGxpbmsgbWF5IG5vdCBiZSByZWFkeSBiZWZvcmUgd2UgYWNj
ZXNzIGl0LiBXaGF0IHlvdSBhcmUKPiBleHBlcmllbmNpbmcgc291bmRzIHNpbWlsYXIuIEkgd29u
ZGVyIGlmIHlvdSBjb3VsZCB0cnkgdGhlIGZvbGxvd2luZwo+IHBhdGNoIGFuZCBzZWUgaWYgaXQg
bWFrZXMgYW55IGRpZmZlcmVuY2U/Cj4KPiBodHRwczovL3BhdGNod29yay5rZXJuZWwub3JnL3Bh
dGNoLzExMTA2NjExLwoKSSB0aGluayBJIGFscmVhZHkgdHJpZWQgdGhpcyBwYXRoLiBUaGUgcHJv
YmxlbSBpc24ndCB0aGF0IHRoZSBkZXZpY2UKaXNuJ3QgYWNjZXNzaWJsZSB0b28gbGF0ZSwgYnV0
IHRoYXQgaXQgc2VlbXMgdGhhdCB0aGUgZGV2aWNlCmNvbXBsZXRlbHkgZmFsbHMgb2ZmIHRoZSBi
dXMuIEJ1dCBJIGNhbiByZXRlc3QgYWdhaW4ganVzdCB0byBiZSBzdXJlLgpfX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApO
b3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXU=
