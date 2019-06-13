Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF87A44D4C
	for <lists+nouveau@lfdr.de>; Thu, 13 Jun 2019 22:21:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CE1D68926A;
	Thu, 13 Jun 2019 20:21:39 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x342.google.com (mail-ot1-x342.google.com
 [IPv6:2607:f8b0:4864:20::342])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E48EF8928B
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 20:21:38 +0000 (UTC)
Received: by mail-ot1-x342.google.com with SMTP id d17so450906oth.5
 for <nouveau@lists.freedesktop.org>; Thu, 13 Jun 2019 13:21:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=8C1DPfN32M3hy89DclQbm10r/6nHw68ntXJVKpP7b9Y=;
 b=NwaTJOBL6K2MzwFnSAD5sO5wnL2mj0LSEJa3O9NP1ZaDQQErLoxWHR9In20OXMKV54
 KNC/NzXwKJYHlILx8LVtPRXfUOW3nxAP+a9856qvBb8tjT3++5mzxBCwuJHUseJ7nLnE
 KLonUbEgA50Riz2K8G0QlsKD5Y8ukSXaLWRgclj4580U15XUgLdNwCIz95hLIfYD14is
 L0Hpx5tzDx5pYUsloTdfx9g1MXrWs4kNBNRRcjM0QctkkTnpnuehkC1HACWHnUIwYFMK
 vb+JmfsrPRkbZSwrAgiB0AYqBvrWX4uSoOTbqbAmhyJ0QUrc4Z9FI86gOQDXB9yrvyWC
 LB8g==
X-Gm-Message-State: APjAAAXit6otwIUc0L/zOxJbQ8/GLZDX9yKxPAwLjSQ4vDztcUZAB3ds
 LAjlrouITPAZpr8i/BUl7FKn+TzrUjmJyDjhVvM96A==
X-Google-Smtp-Source: APXvYqyjtP3QbVJvzI3dCCMhA8qeDJqydQ8D7TK+PF2b5eiWZzF3IhMkwvK4lONxsyfmaoM/M+8Dcj6PJdtpVy6CFmg=
X-Received: by 2002:a9d:7248:: with SMTP id a8mr1406727otk.363.1560457298006; 
 Thu, 13 Jun 2019 13:21:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190613094326.24093-1-hch@lst.de>
 <CAPcyv4jBdwYaiVwkhy6kP78OBAs+vJme1UTm47dX4Eq_5=JgSg@mail.gmail.com>
 <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
In-Reply-To: <283e87e8-20b6-0505-a19b-5d18e057f008@deltatee.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Thu, 13 Jun 2019 13:21:27 -0700
Message-ID: <CAPcyv4hx=ng3SxzAWd8s_8VtAfoiiWhiA5kodi9KPc=jGmnejg@mail.gmail.com>
To: Logan Gunthorpe <logang@deltatee.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=8C1DPfN32M3hy89DclQbm10r/6nHw68ntXJVKpP7b9Y=;
 b=f8QwnyQT51rXgqH07uWM2kqXhbWRJNnV74LW/yRvR2x776SPj5Pfk2O+kG2AmGkO8T
 trYSPptgpa5/GXF/WDtITF1+EbHojK5NlrUWtkmk/zSrRfZi5l9VktyZN13ffa5Hc6Ev
 0msFAvfYWphm24CFoDY7wyxaucG4FVHRbGTisLD6oBUXsztdH3fUW9TN5VMHOpT3cvr0
 sCPmY0lNjqi+LcWw5XMhpewNnmhVYTSePA2WSDRkeUne9k6nQVV9YwwkLBcNkm4aAYQp
 hwiX33VeD0WOTvpFOoQcm71sdbaOX7SnxHZ9aM2nx+Itu4NnNsqFxSwSt5OwJVwaJq25
 COoQ==
Subject: Re: [Nouveau] dev_pagemap related cleanups
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
Cc: linux-nvdimm <linux-nvdimm@lists.01.org>, nouveau@lists.freedesktop.org,
 Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
 Maling list - DRI developers <dri-devel@lists.freedesktop.org>,
 Linux MM <linux-mm@kvack.org>, Jason Gunthorpe <jgg@mellanox.com>,
 Ben Skeggs <bskeggs@redhat.com>, linux-pci@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMToxOCBQTSBMb2dhbiBHdW50aG9ycGUgPGxvZ2FuZ0Bk
ZWx0YXRlZS5jb20+IHdyb3RlOgo+Cj4KPgo+IE9uIDIwMTktMDYtMTMgMTI6MjcgcC5tLiwgRGFu
IFdpbGxpYW1zIHdyb3RlOgo+ID4gT24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMjo0MyBBTSBDaHJp
c3RvcGggSGVsbHdpZyA8aGNoQGxzdC5kZT4gd3JvdGU6Cj4gPj4KPiA+PiBIaSBEYW4sIErDqXLD
tG1lIGFuZCBKYXNvbiwKPiA+Pgo+ID4+IGJlbG93IGlzIGEgc2VyaWVzIHRoYXQgY2xlYW5zIHVw
IHRoZSBkZXZfcGFnZW1hcCBpbnRlcmZhY2Ugc28gdGhhdAo+ID4+IGl0IGlzIG1vcmUgZWFzaWx5
IHVzYWJsZSwgd2hpY2ggcmVtb3ZlcyB0aGUgbmVlZCB0byB3cmFwIGl0IGluIGhtbQo+ID4+IGFu
ZCB0aHVzIGFsbG93aW5nIHRvIGtpbGwgYSBsb3Qgb2YgY29kZQo+ID4+Cj4gPj4gRGlmZnN0YXQ6
Cj4gPj4KPiA+PiAgMjIgZmlsZXMgY2hhbmdlZCwgMjQ1IGluc2VydGlvbnMoKyksIDgwMiBkZWxl
dGlvbnMoLSkKPiA+Cj4gPiBIb29yYXkhCj4gPgo+ID4+IEdpdCB0cmVlOgo+ID4+Cj4gPj4gICAg
IGdpdDovL2dpdC5pbmZyYWRlYWQub3JnL3VzZXJzL2hjaC9taXNjLmdpdCBobW0tZGV2bWVtLWNs
ZWFudXAKPiA+Cj4gPiBJIGp1c3QgcmVhbGl6ZWQgdGhpcyBjb2xsaWRlcyB3aXRoIHRoZSBkZXZf
cGFnZW1hcCByZWxlYXNlIHJld29yayBpbgo+ID4gQW5kcmV3J3MgdHJlZSAoY29tbWl0IGlkcyBi
ZWxvdyBhcmUgZnJvbSBuZXh0LmdpdCBhbmQgYXJlIG5vdCBzdGFibGUpCj4gPgo+ID4gNDQyMmVl
ODQ3NmYwIG1tL2Rldm1fbWVtcmVtYXBfcGFnZXM6IGZpeCBmaW5hbCBwYWdlIHB1dCByYWNlCj4g
PiA3NzFmMDcxNGQwZGMgUENJL1AyUERNQTogdHJhY2sgcGdtYXAgcmVmZXJlbmNlcyBwZXIgcmVz
b3VyY2UsIG5vdCBnbG9iYWxseQo+ID4gYWYzNzA4NWRlOTA2IGxpYi9nZW5hbGxvYzogaW50cm9k
dWNlIGNodW5rIG93bmVycwo+ID4gZTAwNDdmZjhhYTc3IFBDSS9QMlBETUE6IGZpeCB0aGUgZ2Vu
X3Bvb2xfYWRkX3ZpcnQoKSBmYWlsdXJlIHBhdGgKPiA+IDAzMTVkNDdkNmFlOSBtbS9kZXZtX21l
bXJlbWFwX3BhZ2VzOiBpbnRyb2R1Y2UgZGV2bV9tZW11bm1hcF9wYWdlcwo+ID4gMjE2NDc1Yzdl
YWE4IGRyaXZlcnMvYmFzZS9kZXZyZXM6IGludHJvZHVjZSBkZXZtX3JlbGVhc2VfYWN0aW9uKCkK
PiA+Cj4gPiBDT05GTElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIHRvb2xzL3Rlc3Rp
bmcvbnZkaW1tL3Rlc3QvaW9tYXAuYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25m
bGljdCBpbiBtbS9obW0uYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGljdCBp
biBrZXJuZWwvbWVtcmVtYXAuYwo+ID4gQ09ORkxJQ1QgKGNvbnRlbnQpOiBNZXJnZSBjb25mbGlj
dCBpbiBpbmNsdWRlL2xpbnV4L21lbXJlbWFwLmgKPiA+IENPTkZMSUNUIChjb250ZW50KTogTWVy
Z2UgY29uZmxpY3QgaW4gZHJpdmVycy9wY2kvcDJwZG1hLmMKPiA+IENPTkZMSUNUIChjb250ZW50
KTogTWVyZ2UgY29uZmxpY3QgaW4gZHJpdmVycy9udmRpbW0vcG1lbS5jCj4gPiBDT05GTElDVCAo
Y29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvZGF4L2RldmljZS5jCj4gPiBDT05G
TElDVCAoY29udGVudCk6IE1lcmdlIGNvbmZsaWN0IGluIGRyaXZlcnMvZGF4L2RheC1wcml2YXRl
LmgKPiA+Cj4gPiBQZXJoYXBzIHdlIHNob3VsZCBwdWxsIHRob3NlIG91dCBhbmQgcmVzZW5kIHRo
ZW0gdGhyb3VnaCBobW0uZ2l0Pwo+Cj4gSG1tLCBJJ3ZlIGJlZW4gd2FpdGluZyBmb3IgdGhvc2Ug
cGF0Y2hlcyB0byBnZXQgaW4gZm9yIGEgbGl0dGxlIHdoaWxlIG5vdyA7KAoKVW5sZXNzIEFuZHJl
dyB3YXMgZ29pbmcgdG8gc3VibWl0IGFzIHY1LjItcmMgZml4ZXMgSSB0aGluayBJIHNob3VsZApy
ZWJhc2UgLyBzdWJtaXQgdGhlbSBvbiBjdXJyZW50IGhtbS5naXQgYW5kIHRoZW4gdGhyb3cgdGhl
c2UgY2xlYW51cHMKZnJvbSBDaHJpc3RvcGggb24gdG9wPwpfX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxp
c3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXU=
