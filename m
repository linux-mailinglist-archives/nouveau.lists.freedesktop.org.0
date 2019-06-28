Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F19685A1F7
	for <lists+nouveau@lfdr.de>; Fri, 28 Jun 2019 19:10:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C37816E0D8;
	Fri, 28 Jun 2019 17:10:25 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-x343.google.com (mail-ot1-x343.google.com
 [IPv6:2607:f8b0:4864:20::343])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 703BF6E0D8
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 17:10:24 +0000 (UTC)
Received: by mail-ot1-x343.google.com with SMTP id o101so6376984ota.8
 for <nouveau@lists.freedesktop.org>; Fri, 28 Jun 2019 10:10:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qddKJwRb2cnRQ/FqFwYrdLbb8wYT8FUIpp0K6iYqKlE=;
 b=CE6rHwfjMqzRZiQO7LI7MATWVz2bJu1i3DFfnH9WzTLBGZAin/kL2357I9Ky8DpP6Z
 drSagPqpN7ISy+jiCZ3Au3Y04Dla5uGmN35idpRjl86Jmpnz++zYCp84vfN7uBNbPAX+
 SX0uQj/OL6I3oEbfjCZu8a27gcc2BI09IF1g8hi7DIv+5CkYw6G7jga1/a/6I3x/Ua2E
 a9q6ge3AuMUlZ64qYB5z8cmwojMwfQkfUj7YBtcD+Uin42dKhXKKYTg+apuRHWhuR/jN
 jMpJNlKGVQyap2NywORvK14gxkWFdF2f71HdcDcv0YBW8J9yYLTLZyl5O/legXtgEars
 9g8g==
X-Gm-Message-State: APjAAAXN1SH8+XyWIB4kDvhgP2v2h1fF6YA/qfSTgRWXiI7GUtOu2chH
 y8/4GNtkpyWc7oVhZYPyOHTVepP5x7ihyXlHxjkbbQ==
X-Google-Smtp-Source: APXvYqziEb+tNzkKv17KjDDhi4UpD13NUfzT1yqPT34PEQGi0shpxcj8jFfercRLfAyVoLhNe8H8Bkb71Cnf2tL/n+k=
X-Received: by 2002:a9d:7a9a:: with SMTP id l26mr8124495otn.71.1561741823760; 
 Fri, 28 Jun 2019 10:10:23 -0700 (PDT)
MIME-Version: 1.0
References: <20190626122724.13313-1-hch@lst.de>
 <20190626122724.13313-17-hch@lst.de>
 <20190628153827.GA5373@mellanox.com>
 <CAPcyv4joSiFMeYq=D08C-QZSkHz0kRpvRfseNQWrN34Rrm+S7g@mail.gmail.com>
 <20190628170219.GA3608@mellanox.com>
 <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
In-Reply-To: <CAPcyv4ja9DVL2zuxuSup8x3VOT_dKAOS8uBQweE9R81vnYRNWg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Fri, 28 Jun 2019 10:10:12 -0700
Message-ID: <CAPcyv4iWTe=vOXUqkr_CguFrFRqgA7hJSt4J0B3RpuP-Okz0Vw@mail.gmail.com>
To: Jason Gunthorpe <jgg@mellanox.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=intel-com.20150623.gappssmtp.com; s=20150623;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=qddKJwRb2cnRQ/FqFwYrdLbb8wYT8FUIpp0K6iYqKlE=;
 b=UnNjKOhDg6JhNrF0ffG6CmZkREW7rw22qwft9R1X5G1Y463lGz745qKb1Cpvvz1sEl
 zLMecGaZR5ynK6GE8f7Ml3Ex/6APldy0qkkzEaBAkhcBHC+GivS+i5qPLFaYjJ5IxfYg
 Ix0HdpLCjBnqAz9m39WW1jharT+5YOHNU4YfrM8Ah8R+FrEe4b6pxjgCmbbqGgh3sqcB
 2VYQ2agoAbSDUL/b0JhCGJa4iHWfU4XJrqUvTFK2MBTunnoIIjMYIkxDb4U+7zHLnerF
 GdJi7b5u2PxxVuLRhm8fJldQb7CTmEb8WCfsS3hc/y78yAwulmlFeUWonzJRUQpwECvp
 g/gw==
Subject: Re: [Nouveau] [PATCH 16/25] device-dax: use the dev_pagemap
 internal refcount
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
Cc: "linux-nvdimm@lists.01.org" <linux-nvdimm@lists.01.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>, Ben Skeggs <bskeggs@redhat.com>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MDggQU0gRGFuIFdpbGxpYW1zIDxkYW4uai53aWxs
aWFtc0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gRnJpLCBKdW4gMjgsIDIwMTkgYXQgMTA6MDIg
QU0gSmFzb24gR3VudGhvcnBlIDxqZ2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+Cj4gPiBPbiBG
cmksIEp1biAyOCwgMjAxOSBhdCAwOToyNzo0NEFNIC0wNzAwLCBEYW4gV2lsbGlhbXMgd3JvdGU6
Cj4gPiA+IE9uIEZyaSwgSnVuIDI4LCAyMDE5IGF0IDg6MzkgQU0gSmFzb24gR3VudGhvcnBlIDxq
Z2dAbWVsbGFub3guY29tPiB3cm90ZToKPiA+ID4gPgo+ID4gPiA+IE9uIFdlZCwgSnVuIDI2LCAy
MDE5IGF0IDAyOjI3OjE1UE0gKzAyMDAsIENocmlzdG9waCBIZWxsd2lnIHdyb3RlOgo+ID4gPiA+
ID4gVGhlIGZ1bmN0aW9uYWxpdHkgaXMgaWRlbnRpY2FsIHRvIHRoZSBvbmUgY3VycmVudGx5IG9w
ZW4gY29kZWQgaW4KPiA+ID4gPiA+IGRldmljZS1kYXguCj4gPiA+ID4gPgo+ID4gPiA+ID4gU2ln
bmVkLW9mZi1ieTogQ2hyaXN0b3BoIEhlbGx3aWcgPGhjaEBsc3QuZGU+Cj4gPiA+ID4gPiBSZXZp
ZXdlZC1ieTogSXJhIFdlaW55IDxpcmEud2VpbnlAaW50ZWwuY29tPgo+ID4gPiA+ID4gIGRyaXZl
cnMvZGF4L2RheC1wcml2YXRlLmggfCAgNCAtLS0tCj4gPiA+ID4gPiAgZHJpdmVycy9kYXgvZGV2
aWNlLmMgICAgICB8IDQzIC0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLS0tLQo+
ID4gPiA+ID4gIDIgZmlsZXMgY2hhbmdlZCwgNDcgZGVsZXRpb25zKC0pCj4gPiA+ID4KPiA+ID4g
PiBEYW5XOiBJIHRoaW5rIHRoaXMgc2VyaWVzIGhhcyByZWFjaGVkIGVub3VnaCByZXZpZXcsIGRp
ZCB5b3Ugd2FudAo+ID4gPiA+IHRvIGFjay90ZXN0IGFueSBmdXJ0aGVyPwo+ID4gPiA+Cj4gPiA+
ID4gVGhpcyBuZWVkcyB0byBsYW5kIGluIGhtbS5naXQgc29vbiB0byBtYWtlIHRoZSBtZXJnZSB3
aW5kb3cuCj4gPiA+Cj4gPiA+IEkgd2FzIGF3YWl0aW5nIGEgZGVjaXNpb24gYWJvdXQgcmVzb2x2
aW5nIHRoZSBjb2xsaXNpb24gd2l0aCBJcmEncwo+ID4gPiBwYXRjaCBiZWZvcmUgdGVzdGluZyB0
aGUgZmluYWwgcmVzdWx0IGFnYWluIFsxXS4gWW91IGNhbiBnbyBhaGVhZCBhbmQKPiA+ID4gYWRk
IG15IHJldmlld2VkLWJ5IGZvciB0aGUgc2VyaWVzLCBidXQgbXkgdGVzdGVkLWJ5IHNob3VsZCBi
ZSBvbiB0aGUKPiA+ID4gZmluYWwgc3RhdGUgb2YgdGhlIHNlcmllcy4KPiA+Cj4gPiBUaGUgY29u
ZmxpY3QgbG9va3MgT0sgdG8gbWUsIEkgdGhpbmsgd2UgY2FuIGxldCBBbmRyZXcgYW5kIExpbnVz
Cj4gPiByZXNvbHZlIGl0Lgo+ID4KPgo+IEFuZHJldydzIHRyZWUgZWZmZWN0aXZlbHkgYWx3YXlz
IHJlYmFzZXMgc2luY2UgaXQncyBhIHF1aWx0IHNlcmllcy4KPiBJJ2QgcmVjb21tZW5kIHB1bGxp
bmcgSXJhJ3MgcGF0Y2ggb3V0IG9mIC1tbSBhbmQgYXBwbHlpbmcgaXQgd2l0aCB0aGUKPiByZXN0
IG9mIGhtbSByZXdvcmtzLiBBbnkgb3RoZXIgZ2l0IHRyZWUgSSdkIGFncmVlIHdpdGgganVzdCBk
b2luZyB0aGUKPiBsYXRlIGNvbmZsaWN0IHJlc29sdXRpb24sIGJ1dCBJJ20gbm90IGNsZWFyIG9u
IHdoYXQncyB0aGUgYmVzdAo+IHByYWN0aWNlIHdoZW4gY29uZmxpY3Rpbmcgd2l0aCAtbW0uCgpS
ZWdhcmRsZXNzIHRoZSBwYXRjaCBpcyBidWdneS4gSWYgeW91IHdhbnQgdG8gZG8gdGhlIGNvbmZs
aWN0CnJlc29sdXRpb24gaXQgc2hvdWxkIGJlIGJlY2F1c2UgdGhlIERFVklDRV9QVUJMSUMgcmVt
b3ZhbCBlZmZlY3RpdmVseQpkb2VzIHRoZSBzYW1lIGZpeCBvdGhlcndpc2Ugd2UncmUga25vd2lu
Z2x5IGxlYXZpbmcgYSBicm9rZW4gcG9pbnQgaW4KdGhlIGhpc3RvcnkuCl9fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vbm91dmVhdQ==
