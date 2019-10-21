Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 8248FDED00
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2019 15:02:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 309586E08E;
	Mon, 21 Oct 2019 13:02:37 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 191426E091
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 13:02:36 +0000 (UTC)
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 967C3796E7
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 13:02:35 +0000 (UTC)
Received: by mail-qt1-f198.google.com with SMTP id z21so13961752qtq.21
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 06:02:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=MATzqi2DYgY3f2a3E6niPS64+EAt9PrYf2/3XZiaaBU=;
 b=A7pvtdeDs62i00NjQOO373vO92KqoGR5PCIuYCsuXxMuvtQKK0P1A11FRDAxfrfsN/
 W7lv1dapwvug9jw8ZqgpPFuGsBl9Lj8x9Qm50jo+s+GG/ndx3P8xBbKHKET4wR+bslfk
 +A0Ur7rMWJGfB1lzA9Zoaf9wQnYnm1uiw1QT3nUydZX21VWc3LGSPtMawOfA5QWTBGSK
 LKFXGP+/jlR4XWI58bDUAhMApIq7rtC81/vGPwLQMIcRMM7pZ0L16J/lCsPYLTwqZSJ7
 2JWS0P3jH7QxdYw8GIO4elf6cs6cghdTK6Z2l13eJHc8aWjJtNNE4r6Pxtr8loVa2V85
 flOg==
X-Gm-Message-State: APjAAAUfMFzBDJ2H+Q6gal9cH8pyyRwSO7gRLwIgYzIz47e7P9eThvwc
 lS+vqcUrgCAwLIQ3nRe+P7/zSo+RcNTCUqCMWNdYt/B62gRfrVfvYWl6nSSRfmdZH4HBAo7/+lu
 S13TpkJADT4y9uMj1m+jiqDQ/rVXbCyzM6YTB0QEQZw==
X-Received: by 2002:a05:620a:16b9:: with SMTP id
 s25mr22921999qkj.102.1571662954891; 
 Mon, 21 Oct 2019 06:02:34 -0700 (PDT)
X-Google-Smtp-Source: APXvYqyhj+jJSrLfQkuYBSA3fMA/d8Rx0RQ7EY47UhYO+DdxvK1frDIPrR+k9EvVDJ33OZEmDSuD4GzUm4UQE4AVqWs=
X-Received: by 2002:a05:620a:16b9:: with SMTP id
 s25mr22921978qkj.102.1571662954620; 
 Mon, 21 Oct 2019 06:02:34 -0700 (PDT)
MIME-Version: 1.0
References: <20191016144449.24646-1-kherbst@redhat.com>
 <20191021114017.GY2819@lahna.fi.intel.com>
 <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
 <20191021120611.GB2819@lahna.fi.intel.com>
In-Reply-To: <20191021120611.GB2819@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Oct 2019 15:02:23 +0200
Message-ID: <CACO55tvYEvPHwFLDmLOQ_BCiNw7ZRA7dun9P=KdLb4bvYTtrcg@mail.gmail.com>
To: Mika Westerberg <mika.westerberg@intel.com>
Subject: Re: [Nouveau] [PATCH v3] pci: prevent putting nvidia GPUs into
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
 "Rafael J . Wysocki" <rjw@rjwysocki.net>, LKML <linux-kernel@vger.kernel.org>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 nouveau <nouveau@lists.freedesktop.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMjowNiBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gT24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMDI6
MDA6NDZQTSArMDIwMCwgS2Fyb2wgSGVyYnN0IHdyb3RlOgo+ID4gT24gTW9uLCBPY3QgMjEsIDIw
MTkgYXQgMTo0MCBQTSBNaWthIFdlc3RlcmJlcmcKPiA+IDxtaWthLndlc3RlcmJlcmdAaW50ZWwu
Y29tPiB3cm90ZToKPiA+ID4KPiA+ID4gSGkgS2Fyb2wsCj4gPiA+Cj4gPiA+IFNvcnJ5IGZvciBj
b21tZW50aW5nIGxhdGUsIEkganVzdCBjYW1lIGJhY2sgZnJvbSB2YWNhdGlvbi4KPiA+ID4KPiA+
ID4gT24gV2VkLCBPY3QgMTYsIDIwMTkgYXQgMDQ6NDQ6NDlQTSArMDIwMCwgS2Fyb2wgSGVyYnN0
IHdyb3RlOgo+ID4gPiA+IEZpeGVzIHN0YXRlIHRyYW5zaXRpb25zIG9mIE52aWRpYSBQYXNjYWwg
R1BVcyBmcm9tIEQzY29sZCBpbnRvIGhpZ2hlciBkZXZpY2UKPiA+ID4gPiBzdGF0ZXMuCj4gPiA+
ID4KPiA+ID4gPiB2MjogY29udmVydCB0byBwY2lfZGV2IHF1aXJrCj4gPiA+ID4gICAgIHB1dCBh
IHByb3BlciB0ZWNobmljYWwgZXhwbGFuYXRpb24gb2YgdGhlIGlzc3VlIGFzIGEgaW4tY29kZSBj
b21tZW50Cj4gPiA+ID4gdjM6IGRpc2FibGUgaXQgb25seSBmb3IgY2VydGFpbiBjb21iaW5hdGlv
bnMgb2YgaW50ZWwgYW5kIG52aWRpYSBoYXJkd2FyZQo+ID4gPiA+Cj4gPiA+ID4gU2lnbmVkLW9m
Zi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gPiA+ID4gQ2M6IEJqb3Ju
IEhlbGdhYXMgPGJoZWxnYWFzQGdvb2dsZS5jb20+Cj4gPiA+ID4gQ2M6IEx5dWRlIFBhdWwgPGx5
dWRlQHJlZGhhdC5jb20+Cj4gPiA+ID4gQ2M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3eXNv
Y2tpLm5ldD4KPiA+ID4gPiBDYzogTWlrYSBXZXN0ZXJiZXJnIDxtaWthLndlc3RlcmJlcmdAaW50
ZWwuY29tPgo+ID4gPiA+IENjOiBsaW51eC1wY2lAdmdlci5rZXJuZWwub3JnCj4gPiA+ID4gQ2M6
IGxpbnV4LXBtQHZnZXIua2VybmVsLm9yZwo+ID4gPiA+IENjOiBkcmktZGV2ZWxAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCj4gPiA+ID4gQ2M6IG5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4g
PiA+ID4gLS0tCj4gPiA+ID4gIGRyaXZlcnMvcGNpL3BjaS5jICAgIHwgMTEgKysrKysrKysrKwo+
ID4gPiA+ICBkcml2ZXJzL3BjaS9xdWlya3MuYyB8IDUyICsrKysrKysrKysrKysrKysrKysrKysr
KysrKysrKysrKysrKysrKysrKysrCj4gPiA+Cj4gPiA+IEkgbWF5IGJlIG1pc3Npbmcgc29tZXRo
aW5nIGJ1dCB3aHkgeW91IGNhbid0IGRvIHRoaXMgaW4gdGhlIG5vdXZlYXUKPiA+ID4gZHJpdmVy
IGl0c2VsZj8KPiA+Cj4gPiBXaGF0IGRvIHlvdSBtZWFuIHByZWNpc2VseT8gTW92ZSB0aGUgcXVp
cmsgaW50byBub3V2ZWF1LCBidXQga2VlcCB0aGUKPiA+IGNoYW5nZXMgdG8gcGNpIGNvcmU/Cj4K
PiBObywganVzdCBibG9jayBydW50aW1lIFBNIGZyb20gdGhlIGRldmljZSBpbiBub3V2ZWF1IGRy
aXZlci4KCmJ1dCB0aGF0J3Mgbm90IHdoYXQgdGhlIHBhdGNoIGRvZXMuIEl0IG9ubHkgc2tpcHMg
dGhlIFBDSSBQTSByZWcKd3JpdGUsIGJ1dCBzdGlsbCBsZXQgdGhlIEFDUEkgbWV0aG9kIGJlIGlu
dm9rZWQgdG8gcHV0IHRoZSBkZXZpY2UgaW50bwpEM2NvbGQKX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBs
aXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1h
bi9saXN0aW5mby9ub3V2ZWF1
