Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CECE6DE709
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2019 10:48:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 304E589A98;
	Mon, 21 Oct 2019 08:48:43 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D41289A98
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 08:48:42 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 5E6CF85362
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 08:48:41 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id n4so13417072qtp.19
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 01:48:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=IRqmfLWgWgklrhuIT0YEqcb3zcO5An3swDX6Xn5ZmWQ=;
 b=ZQMLgbzq3PRG3dljUS4MUQ7x00oF/LUFrMjW/be/7W5c4kXw/DWXidZDf7iYA7inMr
 2Tp/GFA7CaP0J1tqTsOtdb+rzrIJgjTyD1KpHvUI1aHv+/9QyBrAHqUuPnzIu2OzToCB
 05N1wV++7Uh1RMZi1+EUEPEHBTrnPUujK0nl0NFib7UXbGTU7M9rrTqjaE7p3s5iZoW+
 9gZlqchws47NjU7fBvaJVU0qmkADwxKkq2Q3Bzb01LW9SBeUE/7/OV70aUl0+F+OhD0K
 V3XpkKrIKzL8jLZsIEUFESfmzGe4FMp8CmHipYI4qmBV773PyCf4TDEgsDtL7sg3qFBa
 725A==
X-Gm-Message-State: APjAAAVoTJ79CxkzqOysrSMzCMQhvET1ZFhvWNQDF/lsp4+FTrb1YA5m
 zzNzMR0gUDHHR+R6tfU4T6ATVJLRKFbK8XT2ngUAhIm3DRB3HdaoR8xNwQKWaJp7qXA9anBRveb
 HVDuk9XDhs/YETEPk9pilQyHJDN2e6v8CI0IpKeh/lA==
X-Received: by 2002:a05:620a:718:: with SMTP id
 24mr21040847qkc.157.1571647720595; 
 Mon, 21 Oct 2019 01:48:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyMSJL3T6FDafLXsYkKHSRUn9ds4wEGZrqyrQwy1ZdVD37ycdGAVZNZ8hFxO2cMo4t/PkEIVrqxmsVkDYGB08g=
X-Received: by 2002:a05:620a:718:: with SMTP id
 24mr21040840qkc.157.1571647720291; 
 Mon, 21 Oct 2019 01:48:40 -0700 (PDT)
MIME-Version: 1.0
References: <20190814213118.28473-1-kherbst@redhat.com>
 <2215840.qs0dBhReda@kreacher>
 <CACO55ttC-o9bKU7nHNcfjm2YnffiupQ7UHUt7BYL3fu+yEyTbw@mail.gmail.com>
 <5228680.jBuKzensJx@kreacher>
 <CAJ=jquZLU2=yxayGCs=XGghxdMMre6qAWRY0Q4VErjBGqeWdjQ@mail.gmail.com>
 <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
In-Reply-To: <CAJZ5v0hogSM3OgfJ0GFn7+BYwxR05Hb5ZMLo=NiB2wmpu=qeug@mail.gmail.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Oct 2019 10:48:29 +0200
Message-ID: <CACO55tvAyE1t2Bm8J=Yb_Gi5PDAgof=mRsJAKHFxOvEZpV-qGg@mail.gmail.com>
To: "Rafael J. Wysocki" <rafael@kernel.org>
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
 nouveau <nouveau@lists.freedesktop.org>,
 "Rafael J. Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Linux ACPI <linux-acpi@vger.kernel.org>, Alex Hung <alex.hung@canonical.com>,
 Ben Skeggs <bskeggs@redhat.com>, Dave Airlie <airlied@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

ZnlpOiBJIGRlY2lkZWQgdG8gZ28gZm9yIGEgZGlmZmVyZW50IHdvcmthcm91bmQgdG8gZml4IHRo
ZSBydW5wbQppc3N1ZXMgb2JzZXJ2ZWQgd2l0aCBudmlkaWEgZ3B1cyB3aXRoIG5vdXZlYXUgaW4g
dGhlICJwY2k6IHByZXZlbnQKcHV0dGluZyBudmlkaWEgR1BVcyBpbnRvIGxvd2VyIGRldmljZSBz
dGF0ZXMgb24gY2VydGFpbiBpbnRlbCBicmlkZ2VzIgp0aHJlYWQKCnRoYXQncyBvbiB0aGUgcGNp
IGFuZCBwbSBtYWlsaW5nIGxpc3QuIE1heWJlIGl0IG1ha2VzIHNlbnNlIHRvIHdhaXQKZm9yIHRo
YXQgdG8gbGFuZCBiZWZvcmUgYWN0dWFsbHkgcmVtb3ZpbmcgdGhlIEFDUEkgd29ya2Fyb3VuZHMg
aGVyZT8KVGhlIHdvcmthcm91bmQgSSBoYWQgaW4gdGhpcyBzZXJpZXMgZGlkbid0IHNlZW0gdG8g
YmUgcmVsaWFibGUgZW5vdWdoLApzbyBJIGRpdGNoZWQgdGhhdCBhcHByb2FjaGVkLgoKT24gTW9u
LCBPY3QgMjEsIDIwMTkgYXQgMTA6MTQgQU0gUmFmYWVsIEouIFd5c29ja2kgPHJhZmFlbEBrZXJu
ZWwub3JnPiB3cm90ZToKPgo+IE9uIE1vbiwgT2N0IDIxLCAyMDE5IGF0IDQ6MTQgQU0gQWxleCBI
dW5nIDxhbGV4Lmh1bmdAY2Fub25pY2FsLmNvbT4gd3JvdGU6Cj4gPgo+ID4gV2UgaGF2ZSBkb25l
IHNvbWUgdGVzdHMgb24gdGhyZWUgb2YgSW50ZWwgKyBuVmlkaWEgY29uZmlndXJhdGlvbgo+ID4g
c3lzdGVtcyB3aXRoIE9FTSBfT1NJIHN0cmluZ3MgcmVtb3ZlZCAtIHdoaWxlIHNvbWUgYnVncyBh
cmUgc3RpbGwKPiA+IG9ic2VydmVkLCBleC4gb25lIG91dCBvZiB0aHJlZSBoYXMgc3VzcGVuZC9y
ZXN1bWUgaXNzdWVzLCBubyBzeXN0ZW0KPiA+IGNyYXNoZXMgd2VyZSBvYnNlcnZlZCAtIHRoZSBi
aWdnZXN0IGlzc3VlIHRoYXQgd29ycmllcyB1cy4KPiA+Cj4gPiBUaGUgcG9zaXRpdmUgcmVzdWx0
cyBnaXZlIHVzIGNvbmZpZGVudCB0byBhY2sgdGhlIHJlbW92YWwgb2YgdGhlIE9FTQo+ID4gX09T
SSBzdHJpbmdzLiBXaGlsZSBvdXIgdGVzdHMgd2VyZSBub3QgYWJsZSB0byBjb3ZlciBhbGwgcG9z
c2libGUgSStOCj4gPiBzeXN0ZW1zLCB3ZSBhcmUgc3VyZSB3ZSBjYW4gZml4IGlzc3VlcyBhbG9u
ZyB0aGUgd2F5LiBJZiB0aGVyZSBhcmVuJ3QKPiA+IHN5c3RlbXMgdGhhdCBjYW5ub3QgYmUgZml4
ZWQgd2l0aG91dCB0aGVzZSBPRU0gX09TSSBzdHJpbmdzLCB0aGVzZQo+ID4gc3RyaW5ncyBzaG91
bGQgcHJvYmFibHkgZW5hYmxlIHdpdGggRE1JIHF1aXJrcyAocG9zc2libGUgZnV0dXJlCj4gPiBw
YXRjaGVzKSBzbyB0aGV5IHdvbid0IGFmZmVjdCBvdGhlcnMuCj4gPgo+ID4gQWNrZWQtYnk6IEFs
ZXggSHVuZyA8YWxleC5odW5nQGNhbm9uaWNhbC5jb20+Cj4KPiBPSywgdGhhbmtzIQo+Cj4gSSBj
YW4gcXVldWUgdGhpcyB1cCBvciBpZiBpdCdzIGJldHRlciB0byByb3V0ZSBpdCB0aHJvdWdoIHRo
ZSBEUk0KPiB0cmVlLCBwbGVhc2UgZG8gdGhhdCAoYW5kIGxldCBtZSBrbm93KS4KX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxp
c3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3Rv
cC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
