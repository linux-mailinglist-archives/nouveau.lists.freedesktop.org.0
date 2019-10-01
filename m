Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 092CAC3A56
	for <lists+nouveau@lfdr.de>; Tue,  1 Oct 2019 18:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9187C6E864;
	Tue,  1 Oct 2019 16:21:46 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29EDA6E864
 for <nouveau@lists.freedesktop.org>; Tue,  1 Oct 2019 16:21:46 +0000 (UTC)
Received: from mail-io1-f69.google.com (mail-io1-f69.google.com
 [209.85.166.69])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id B072C7652B
 for <nouveau@lists.freedesktop.org>; Tue,  1 Oct 2019 16:21:45 +0000 (UTC)
Received: by mail-io1-f69.google.com with SMTP id q18so39191666ios.8
 for <nouveau@lists.freedesktop.org>; Tue, 01 Oct 2019 09:21:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=x9XepyaA218QJeUBfPQdn3QeV/2Cs13v78OcqROetO0=;
 b=kTRS0XNJZ8V8jBWlKU9N9WPobQRb+Rs5imc4YgIw2SrC4nXzQbEJ9OdNxIc8RXshen
 z05Rc3BMksQQKMktsizucY866z2MjfWw964+ZJoFYIuL+EGgQ5RCcJrpYfhrYHyAfHbr
 EKZTF0UxGTSQnmoW3U02iZnsK6qu7FsnHy1lqdLMZSTr1Gjbm2n8wl406CiGWbkxTk70
 PzJEelWHypktAWBGJWm4RREcv6sAz2AJD+YIhIYflkx2wj4AU0gqG/Wxqu2wAr1JZA5b
 u37zanXN8NTQ5NAyi+uwGaAtsUuhrUoWi+2YSjTUlsjoxADzHWmPHTf0xIx+e9+9sdcO
 xzFw==
X-Gm-Message-State: APjAAAVSTHyZK/MlcpCtiJu33dRfl/7ddKbNZNHny32hQrocMLzb2gFG
 dFN6WtHThQOK4Zt0KIVtrvJV9nM7wnettCXAX9D6IMQmEHmE38to6ctHN4+G2vVpCo5jmwKBX7q
 5TJFNrexy35p9cZ23kW0p5glwqsLzIEHKQgC7/uTZCw==
X-Received: by 2002:a92:ca84:: with SMTP id t4mr27014696ilo.171.1569946900251; 
 Tue, 01 Oct 2019 09:21:40 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwtlqLpKQEmRbFAQajrYSquBKr2bsxZFd6EKkYBXsFWdm96/QShaGDSjfsdotkX0LJVFp9IEOIgc19NwrFhxQE=
X-Received: by 2002:a92:ca84:: with SMTP id t4mr27014658ilo.171.1569946899958; 
 Tue, 01 Oct 2019 09:21:39 -0700 (PDT)
MIME-Version: 1.0
References: <CACO55tuk4SA6-xUtJ-oRePy8MPXYAp2cfmSPxwW3J5nQuX3y2g@mail.gmail.com>
 <20191001132721.GA46491@google.com>
In-Reply-To: <20191001132721.GA46491@google.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Tue, 1 Oct 2019 18:21:28 +0200
Message-ID: <CACO55tvjFPAMgz6DMGmJQ3adtJBX6yYnFRO9gVBEpMVTEBu0og@mail.gmail.com>
To: Bjorn Helgaas <helgaas@kernel.org>
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
 Linux PCI <linux-pci@vger.kernel.org>,
 Mika Westerberg <mika.westerberg@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCBPY3QgMSwgMjAxOSBhdCAzOjI3IFBNIEJqb3JuIEhlbGdhYXMgPGhlbGdhYXNAa2Vy
bmVsLm9yZz4gd3JvdGU6Cj4KPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwNjozNjoxMlBNICsw
MjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCA2OjMw
IFBNIE1pa2EgV2VzdGVyYmVyZwo+ID4gPG1pa2Eud2VzdGVyYmVyZ0BsaW51eC5pbnRlbC5jb20+
IHdyb3RlOgo+ID4gPgo+ID4gPiBPbiBNb24sIFNlcCAzMCwgMjAxOSBhdCAwNjowNToxNFBNICsw
MjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4gPiA+ID4gc3RpbGwgaGFwcGVucyB3aXRoIHlvdXIg
cGF0Y2ggYXBwbGllZC4gVGhlIG1hY2hpbmUgc2ltcGx5IGdldHMgc2h1dCBkb3duLgo+ID4gPiA+
Cj4gPiA+ID4gZG1lc2cgY2FuIGJlIGZvdW5kIGhlcmU6Cj4gPiA+ID4gaHR0cHM6Ly9naXN0Lmdp
dGh1YnVzZXJjb250ZW50LmNvbS9rYXJvbGhlcmJzdC80MGViMDkxYzdiN2IzM2VmOTkzNTI1ZGU2
NjBmMWEzYi9yYXcvMjM4MGUzMWY1NjZlOTNlNWJhN2M4N2VmNTQ1NDIwOTY1ZDRjNDkyYy9naXN0
ZmlsZTEudHh0Cj4gPiA+Cj4gPiA+IExvb2tpbmcgeW91ciBkbWVzZzoKPiA+ID4KPiA+ID4gU2Vw
IDMwIDE3OjI0OjI3IGtlcm5lbDogbm91dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogRENCIHZlcnNp
b24gNC4xCj4gPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IG5vdXZlYXUgMDAwMDowMTowMC4w
OiBEUk06IE1NOiB1c2luZyBDT1BZIGZvciBidWZmZXIgY29waWVzCj4gPiA+IFNlcCAzMCAxNzoy
NDoyNyBrZXJuZWw6IFtkcm1dIEluaXRpYWxpemVkIG5vdXZlYXUgMS4zLjEgMjAxMjA4MDEgZm9y
IDAwMDA6MDE6MDAuMCBvbiBtaW5vciAxCj4gPiA+Cj4gPiA+IEkgd291bGQgYXNzdW1lIGl0IHJ1
bnRpbWUgc3VzcGVuZHMgaGVyZS4gVGhlbiBpdCB3YWtlcyB1cCBiZWNhdXNlIG9mIFBDSQo+ID4g
PiBhY2Nlc3MgZnJvbSB1c2Vyc3BhY2U6Cj4gPiA+Cj4gPiA+IFNlcCAzMCAxNzoyNDo0MiBrZXJu
ZWw6IHBjaV9yYXdfc2V0X3Bvd2VyX3N0YXRlOiA1NiBjYWxsYmFja3Mgc3VwcHJlc3NlZAo+ID4g
Pgo+ID4gPiBhbmQgZm9yIHNvbWUgcmVhc29uIGl0IGRvZXMgbm90IGdldCByZXN1bWVkIHByb3Bl
cmx5LiBUaGVyZSBhcmUgYWxzbyBmZXcKPiA+ID4gd2FybmluZ3MgZnJvbSBBQ1BJIHRoYXQgbWln
aHQgYmUgcmVsZXZhbnQ6Cj4gPiA+Cj4gPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IEFDUEkg
V2FybmluZzogXF9TQi5QQ0kwLkdGWDAuX0RTTTogQXJndW1lbnQgIzQgdHlwZSBtaXNtYXRjaCAt
IEZvdW5kIFtCdWZmZXJdLCBBQ1BJIHJlcXVpcmVzIFtQYWNrYWdlXSAoMjAxOTA1MDkvbnNhcmd1
bWVudHMtNTkpCj4gPiA+IFNlcCAzMCAxNzoyNDoyNyBrZXJuZWw6IEFDUEkgV2FybmluZzogXF9T
Qi5QQ0kwLlBFRzAuUEVHUC5fRFNNOiBBcmd1bWVudCAjNCB0eXBlIG1pc21hdGNoIC0gRm91bmQg
W0J1ZmZlcl0sIEFDUEkgcmVxdWlyZXMgW1BhY2thZ2VdICgyMDE5MDUwOS9uc2FyZ3VtZW50cy01
OSkKPiA+Cj4gPiBhZmFpayB0aGlzIGlzIHRoZSBjYXNlIGZvciBlc3NlbnRpYWxseSBldmVyeSBs
YXB0b3Agb3V0IHRoZXJlLgo+Cj4gSSB0aGluayB3ZSBzaG91bGQgbG9vayBpbnRvIHRoaXMgYSBs
aXR0bGUgYml0Lgo+IGFjcGlfbnNfY2hlY2tfYXJndW1lbnRfdHlwZXMoKSBjaGVja3MgdGhlIGFy
Z3VtZW50IHR5cGUgYW5kIHByaW50cwo+IHRoaXMgbWVzc2FnZSwgYnV0IEFGQUlDVCBpdCBkb2Vz
bid0IGFjdHVhbGx5IGZpeCBhbnl0aGluZyBvciBwcmV2ZW50Cj4gZXhlY3V0aW9uIG9mIHRoZSBt
ZXRob2QsIHNvIEkgaGF2ZSBubyBpZGVhIHdoYXQgaGFwcGVucyB3aGVuIHdlCj4gYWN0dWFsbHkg
ZXhlY3V0ZSB0aGUgX0RTTS4KPgoKSSBjYW4gYXNzdXJlIHlvdSB0aGF0IHRoaXMgd2FybmluZyBo
YXBwZW5zIG9uIGV2ZXJ5IHNpbmdsZSBsYXB0b3Agb3V0CnRoZXJlIHdpdGggZHVhbCBOdmlkaWEg
Z3JhcGhpY3MgYW5kIGl0J3MgZXNzZW50aWFsbHkganVzdCBhIGZpcm13YXJlCmJ1Zy4gQW5kIGl0
IG5ldmVyIGNhdXNlZCBhbnkgaXNzdWVzIG9uIGFueSBvZiB0aGUgb2xkZXIgbGFwdG9wcyAob3IK
bmV3ZXN0IG9uZSBmb3IgdGhhdCBtYXR0ZXIpLgoKPiBJZiB3ZSBleGVjdXRlIHRoaXMgX0RTTSBh
cyBwYXJ0IG9mIHBvd2VyIG1hbmFnZW1lbnQsIGFuZCB0aGUgX0RTTQo+IGRvZXNuJ3Qgd29yayBy
aWdodCwgaXQgd291bGQgYmUgbm8gc3VycHJpc2UgdGhhdCB3ZSBoYXZlIHByb2JsZW1zLgo+Cj4g
TWF5YmUgd2UgY291bGQgbGVhcm4gc29tZXRoaW5nIGJ5IHR1cm5pbmcgb24gQUNQSV9EQl9QQVJT
RSBvdXRwdXQgKHNlZQo+IERvY3VtZW50YXRpb24vZmlybXdhcmUtZ3VpZGUvYWNwaS9kZWJ1Zy5y
c3QpLgo+Cj4gWW91IG11c3QgaGF2ZSBhbiBhY3BpZHVtcCBhbHJlYWR5IGZyb20gYWxsIHlvdXIg
aW52ZXN0aWdhdGlvbi4gIENhbgo+IHlvdSBwdXQgaXQgc29tZXdoZXJlLCBlLmcuLCBidWd6aWxs
YS5rZXJuZWwub3JnLCBhbmQgaW5jbHVkZSBhIFVSTD8KCldpbGwgZG8gc28gbGF0ZXIsIHJpZ2h0
IG5vdyBJIGFtIHRyYXZlbGluZyB0byBYREMgYW5kIHdpbGwgaGF2ZSBtb3JlCnRpbWUgZm9yIHRo
YXQgdGhlbi4KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
