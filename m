Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88B2810393F
	for <lists+nouveau@lfdr.de>; Wed, 20 Nov 2019 12:58:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D5A6E3EC;
	Wed, 20 Nov 2019 11:58:17 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from us-smtp-1.mimecast.com (us-smtp-delivery-1.mimecast.com
 [205.139.110.120])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B409D6E3EC
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 11:58:16 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-216-cRylSBAQNa2cuhvD-uV_pA-1; Wed, 20 Nov 2019 06:58:12 -0500
Received: by mail-qt1-f198.google.com with SMTP id f14so11732979qto.2
 for <nouveau@lists.freedesktop.org>; Wed, 20 Nov 2019 03:58:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=iOCL9BxQIaJyHhhqANHCxmzOITQkpYoVUEJdfnrVoo4=;
 b=mCyWeDc5JuvnJZTFIRgEXHg29PtMhPrOYcYcXcRxmwHSqX86L1BtEmpN8mJ2DykftX
 RBvoGZq51iUnc9GlD5QtF+DOJNzzq2lglqa0Q7RnsINp8jFWFUnWeiTsLpOWJe3aSYM3
 xcal/1qUTDzMTOhQciamF5L9wTSJZPLhOCVfYObETCe+wF4ITxh1KOFUO92r2EYbmWpV
 KyAZrduw6eTpfCacYJCc4TuNajyxxtdXxiyRGCVqiygdOVA22U4tfD8nIZ5dsJ/xA4b5
 G4bzLDTf1vB2GHzrFOxKgrA+TG2lwTN2Vbuzq/efM3koLQXw34zmUryHOZtE53gpQKdH
 paog==
X-Gm-Message-State: APjAAAWFYJrmgE2Pq6O0pck65nKs5L7du7ZHciryJpekvgaSW8BuKNGt
 015uj0r874kkrGfs21cjubCyjCD76+QVH/JhNzGl4eqcsaT11Am6SG2fqEI2k8bKFyGVNuraJHs
 3h2/xCi0AZnkAP7MS0YhcJb7qJ7fagP/LgntgeGm+aw==
X-Received: by 2002:a37:9083:: with SMTP id s125mr1985637qkd.192.1574251092241; 
 Wed, 20 Nov 2019 03:58:12 -0800 (PST)
X-Google-Smtp-Source: APXvYqwy18wz9I0hHOUfu1VGn3VlV3VWdU/sUqh2ltG6Y8Qd1I8OiMvt6Zowg+9iEuB6F1yoevUNI56w5XarEZdsbSI=
X-Received: by 2002:a37:9083:: with SMTP id s125mr1985616qkd.192.1574251091976; 
 Wed, 20 Nov 2019 03:58:11 -0800 (PST)
MIME-Version: 1.0
References: <20191017121901.13699-1-kherbst@redhat.com>
 <20191119214955.GA223696@google.com>
 <CACO55tu+8VeyMw1Lb6QvNspaJm9LDgoRbooVhr0s3v9uBt=feg@mail.gmail.com>
 <20191120101816.GX11621@lahna.fi.intel.com>
 <CAJZ5v0g4vp1C+zHU5nOVnkGsOjBvLaphK1kK=qAT6b=mK8kpsA@mail.gmail.com>
 <20191120112212.GA11621@lahna.fi.intel.com>
 <20191120115127.GD11621@lahna.fi.intel.com>
 <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
In-Reply-To: <CACO55tsfNOdtu5SZ-4HzO4Ji6gQtafvZ7Rm19nkPcJAgwUBFMw@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 20 Nov 2019 12:58:00 +0100
Message-ID: <CACO55tscD_96jUVts+MTAUsCt-fZx4O5kyhRKoo4mKoC84io8A@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
X-MC-Unique: cRylSBAQNa2cuhvD-uV_pA-1
X-Mimecast-Spam-Score: 0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=redhat.com; 
 s=mimecast20190719; t=1574251095;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=c18RNqeQqZJJjoZDe1IOCPHd07cYIVcsGN1k1gJQ+aE=;
 b=Sj/ISspplkAIL+YvwE+b/5nI0cE4aqK0q6OrjFX7ikSWklGoClQsZAobQRpI+M4qnuP++S
 i2unnY4mmu7AntJYdhBe+c+mR9vYu1TLusBAfXS2B25yNCOwrAIBKahjVGWRdO1DNYrAfc
 OAYEU9NbpANEMqvDazwowjrlAuyXzi8=
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

b3ZlcmFsbCwgd2hhdCBJIHJlYWxseSB3YW50IHRvIGtub3cgaXMsIF93aHlfIGRvZXMgaXQgd29y
ayBvbiB3aW5kb3dzPwpPciB3aGF0IGFyZSB3ZSBkb2luZyBkaWZmZXJlbnRseSBvbiBMaW51eCBz
byB0aGF0IGl0IGRvZXNuJ3Qgd29yaz8gSWYKYW55Ym9keSBoYXMgYW55IGlkZWEgb24gaG93IHdl
IGNvdWxkIGRpZyBpbnRvIHRoaXMgYW5kIGZpZ3VyZSBpdCBvdXQKb24gdGhpcyBsZXZlbCwgdGhp
cyB3b3VsZCBwcm9iYWJseSBhbGxvdyB1cyB0byBnZXQgY2xvc2VyIHRvIHRoZSByb290CmNhdXNl
PyBubz8KCk9uIFdlZCwgTm92IDIwLCAyMDE5IGF0IDEyOjU0IFBNIEthcm9sIEhlcmJzdCA8a2hl
cmJzdEByZWRoYXQuY29tPiB3cm90ZToKPgo+IGZvciBuZXdlciBXaW5kb3dzIHRoZSBmaXJtd2Fy
ZSB1c2VzIGJpdCAgMHg4MCBvbiAweDI0OCAoUTBMMiBiZWluZyB0aGUKPiBmaWVsZCBuYW1lKSBv
biB0aGUgYnJpZGdlIGNvbnRyb2xsZXIgdG8gdHVybiBvZiB0aGUgZGV2aWNlLCBvbiBvdGhlcgo+
IHZlcnNpb25zIGl0IHVzZXMgdGhlICJvbGRlciI/IDB4YjAgcmVnaXN0ZXIgYW5kIHRoZSBQMExE
IGZpZWxkLCB3aGljaAo+IGlzIGRvY3VtZW50ZWQsIHdoZXJlIHRoZSBmb3JtZXIgaXMgbm90Lgo+
Cj4gT24gV2VkLCBOb3YgMjAsIDIwMTkgYXQgMTI6NTEgUE0gTWlrYSBXZXN0ZXJiZXJnCj4gPG1p
a2Eud2VzdGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+ID4KPiA+IE9uIFdlZCwgTm92IDIwLCAy
MDE5IGF0IDAxOjIyOjE2UE0gKzAyMDAsIE1pa2EgV2VzdGVyYmVyZyB3cm90ZToKPiA+ID4gICAg
ICAgICAgICAgSWYgKCgoT1NZUyA8PSAweDA3RDkpIHx8ICgoT1NZUyA9PSAweDA3REYpICYmIChf
UkVWID09Cj4gPiA+ICAgICAgICAgICAgICAgICAweDA1KSkpKQo+ID4gPiAgICAgICAgICAgICB7
Cj4gPgo+ID4gVGhlIE9TWVMgY29tZXMgZnJvbSB0aGlzIChpbiBEU0RUKToKPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMDkiKSkKPiA+ICAgICAgICAgICAgICAg
ICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgIE9TWVMgPSAweDA3RDkKPiA+ICAgICAgICAgICAg
ICAgICB9Cj4gPgo+ID4gICAgICAgICAgICAgICAgIElmIChfT1NJICgiV2luZG93cyAyMDEyIikp
Cj4gPiAgICAgICAgICAgICAgICAgewo+ID4gICAgICAgICAgICAgICAgICAgICBPU1lTID0gMHgw
N0RDCj4gPiAgICAgICAgICAgICAgICAgfQo+ID4KPiA+ICAgICAgICAgICAgICAgICBJZiAoX09T
SSAoIldpbmRvd3MgMjAxMyIpKQo+ID4gICAgICAgICAgICAgICAgIHsKPiA+ICAgICAgICAgICAg
ICAgICAgICAgT1NZUyA9IDB4MDdERAo+ID4gICAgICAgICAgICAgICAgIH0KPiA+Cj4gPiAgICAg
ICAgICAgICAgICAgSWYgKF9PU0kgKCJXaW5kb3dzIDIwMTUiKSkKPiA+ICAgICAgICAgICAgICAg
ICB7Cj4gPiAgICAgICAgICAgICAgICAgICAgIE9TWVMgPSAweDA3REYKPiA+ICAgICAgICAgICAg
ICAgICB9Cj4gPgo+ID4gU28gSSBndWVzcyB0aGlzIHBhcnRpY3VsYXIgY2hlY2sgdHJpZXMgdG8g
aWRlbnRpZnkgV2luZG93cyA3IGFuZCBvbGRlciwKPiA+IGFuZCBMaW51eC4KPiA+Cj4gPiA+ICAg
ICAgICAgICAgICAgICBJZiAoKFBJT0YgPT0gWmVybykpCj4gPiA+ICAgICAgICAgICAgICAgICB7
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgUDBMRCA9IE9uZQo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgIFRDTlQgPSBaZXJvCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgV2hpbGUgKChUQ05U
IDwgTERMWSkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgewo+ID4gPiAgICAgICAgICAgICAg
ICAgICAgICAgICBJZiAoKFAwTFQgPT0gMHgwOCkpCj4gPiA+ICAgICAgICAgICAgICAgICAgICAg
ICAgIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgICAgIEJyZWFrCj4gPiA+ICAgICAg
ICAgICAgICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAg
U2xlZXAgKDB4MTApCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIFRDTlQgKz0gMHgxMAo+
ID4gPiAgICAgICAgICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgICAgICAg
ICBQMFJNID0gT25lCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgUDBBUCA9IDB4MDMKPiA+ID4g
ICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgICAgIEVsc2VJZiAoKFBJT0YgPT0g
T25lKSkKPiA+ID4gICAgICAgICAgICAgICAgIHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBQ
MUxEID0gT25lCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgVENOVCA9IFplcm8KPiA+ID4gICAg
ICAgICAgICAgICAgICAgICBXaGlsZSAoKFRDTlQgPCBMRExZKSkKPiA+ID4gICAgICAgICAgICAg
ICAgICAgICB7Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgICAgIElmICgoUDFMVCA9PSAweDA4
KSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgewo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgICAgICAgICAgQnJlYWsKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPgo+
ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICBTbGVlcCAoMHgxMCkKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICAgICAgVENOVCArPSAweDEwCj4gPiA+ICAgICAgICAgICAgICAgICAgICAgfQo+
ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgIFAxUk0gPSBPbmUKPiA+ID4gICAgICAgICAg
ICAgICAgICAgICBQMUFQID0gMHgwMwo+ID4gPiAgICAgICAgICAgICAgICAgfQo+ID4gPiAgICAg
ICAgICAgICAgICAgRWxzZUlmICgoUElPRiA9PSAweDAyKSkKPiA+ID4gICAgICAgICAgICAgICAg
IHsKPiA+ID4gICAgICAgICAgICAgICAgICAgICBQMkxEID0gT25lCj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgVENOVCA9IFplcm8KPiA+ID4gICAgICAgICAgICAgICAgICAgICBXaGlsZSAoKFRD
TlQgPCBMRExZKSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICB7Cj4gPiA+ICAgICAgICAgICAg
ICAgICAgICAgICAgIElmICgoUDJMVCA9PSAweDA4KSkKPiA+ID4gICAgICAgICAgICAgICAgICAg
ICAgICAgewo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAgQnJlYWsKPiA+ID4gICAg
ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgICAgICAg
ICBTbGVlcCAoMHgxMCkKPiA+ID4gICAgICAgICAgICAgICAgICAgICAgICAgVENOVCArPSAweDEw
Cj4gPiA+ICAgICAgICAgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgIFAyUk0gPSBPbmUKPiA+ID4gICAgICAgICAgICAgICAgICAgICBQMkFQID0gMHgwMwo+ID4g
PiAgICAgICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAgICAgICAgICAgICAgICAgSWYgKChQQkdF
ICE9IFplcm8pKQo+ID4gPiAgICAgICAgICAgICAgICAgewo+ID4gPiAgICAgICAgICAgICAgICAg
ICAgIElmIChTQkRMIChQSU9GKSkKPiA+ID4gICAgICAgICAgICAgICAgICAgICB7Cj4gPiA+ICAg
ICAgICAgICAgICAgICAgICAgICAgIE1CREwgPSBHTVhCIChQSU9GKQo+ID4gPiAgICAgICAgICAg
ICAgICAgICAgICAgICBQRFVCIChQSU9GLCBNQkRMKQo+ID4gPiAgICAgICAgICAgICAgICAgICAg
IH0KPiA+ID4gICAgICAgICAgICAgICAgIH0KPiA+ID4gICAgICAgICAgICAgfQo+ID4gPiAgICAg
ICAgICAgICBFbHNlCj4gPiA+ICAgICAgICAgICAgIHsKPiA+ID4gICAgICAgICAgICAgICAgIExL
RFMgKFBJT0YpCj4gPiA+ICAgICAgICAgICAgIH0KPiA+ID4KPiA+ID4gICAgICAgICAgICAgSWYg
KChEZXJlZk9mIChTQ0xLIFtaZXJvXSkgIT0gWmVybykpCj4gPiA+ICAgICAgICAgICAgIHsKPiA+
ID4gICAgICAgICAgICAgICAgIFBDUk8gKDB4REMsIDB4MTAwQywgRGVyZWZPZiAoU0NMSyBbT25l
XSkpCj4gPiA+ICAgICAgICAgICAgICAgICBTbGVlcCAoMHgxMCkKPiA+ID4gICAgICAgICAgICAg
fQo+ID4gPgo+ID4gPiAgICAgICAgICAgICBHUFBSIChQSU9GLCBaZXJvKQo+ID4gPiAgICAgICAg
ICAgICBJZiAoKE9TWVMgIT0gMHgwN0Q5KSkKPiA+ID4gICAgICAgICAgICAgewo+ID4gPiAgICAg
ICAgICAgICAgICAgRElXSyAoUElPRikKPiA+ID4gICAgICAgICAgICAgfQo+ID4gPgo+ID4gPiAg
ICAgICAgICAgICBcX1NCLlNHT1YgKDB4MDEwMTAwMDQsIFplcm8pCj4gPiA+ICAgICAgICAgICAg
IFNsZWVwICgweDE0KQo+ID4gPiAgICAgICAgICAgICBSZXR1cm4gKFplcm8pCj4gPiA+ICAgICAg
ICAgfQo+ID4KCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
Ck5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBz
Oi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
