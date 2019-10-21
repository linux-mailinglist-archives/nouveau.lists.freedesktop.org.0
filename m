Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDDCDEB7E
	for <lists+nouveau@lfdr.de>; Mon, 21 Oct 2019 14:01:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F5C789949;
	Mon, 21 Oct 2019 12:01:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C7B8189D79
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 12:00:59 +0000 (UTC)
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 4C3BC86662
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 12:00:59 +0000 (UTC)
Received: by mail-qk1-f199.google.com with SMTP id k67so13318669qkc.3
 for <nouveau@lists.freedesktop.org>; Mon, 21 Oct 2019 05:00:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=d3fNeTrb8zczujjHnQNEjI0XuAROR+Pj6w/x2dFfu/8=;
 b=FJlVG/1wtK0dQ0KFtRl2uS74mrLskgMW76Ad1wRWOp1v2ik+a2j/zsUEL7Xuq9FiFR
 A5WHy0D02Kmtm63QbRzQvIzZ6lt+Fxe7nYfhkugjLSd9y3bPW5jtl42A0YCc/syjop/S
 A/67amR2Sjx8/JXSMrrB6PhZlwX54XFaWaj7ivPyZM9bL+hMNpv4etYUt/bsqkH7IBCN
 tCz0amAAsjXerNJMapFL26iSzmstkirnsK9s+eRYny6Xf6SDPaf+8aWqEPHza0Oth1VX
 GznntRgF15qba2NCk7OlapZc2a2o+9R7OVmGcFJBdWrQ8Xcli69lvT45VkSZXTPEgvC7
 CC5g==
X-Gm-Message-State: APjAAAUIId5iKwCxypjyGdPkxUomC0VHl7pr4RxAbEIaaLxYqyVb9zQ/
 Emav/1IJPFq0pPmiY1o/eybP1gJPh13R3L4D1I1uR+fKbm+910tABTTymmjO0o8HqD7jVrIxRI/
 FyOquKLgulrB3T1eacOuhbameHi/AMWuJ3Thg303HgQ==
X-Received: by 2002:a05:620a:16b9:: with SMTP id
 s25mr22668517qkj.102.1571659258427; 
 Mon, 21 Oct 2019 05:00:58 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxLKUy/SzC+Ir3UqXb3Coc4vgrt7sjwm3oLMxhXO6j4sAHWuzrRvXNIFYbci0UPZXZOe/I7+Lh9FVGm0cooVzg=
X-Received: by 2002:a05:620a:16b9:: with SMTP id
 s25mr22668481qkj.102.1571659258106; 
 Mon, 21 Oct 2019 05:00:58 -0700 (PDT)
MIME-Version: 1.0
References: <20191016144449.24646-1-kherbst@redhat.com>
 <20191021114017.GY2819@lahna.fi.intel.com>
In-Reply-To: <20191021114017.GY2819@lahna.fi.intel.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Mon, 21 Oct 2019 14:00:46 +0200
Message-ID: <CACO55tt2iGcySugTAb1khEYpiGoq6Os3upG5fGq+0PbE2gyyeQ@mail.gmail.com>
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

T24gTW9uLCBPY3QgMjEsIDIwMTkgYXQgMTo0MCBQTSBNaWthIFdlc3RlcmJlcmcKPG1pa2Eud2Vz
dGVyYmVyZ0BpbnRlbC5jb20+IHdyb3RlOgo+Cj4gSGkgS2Fyb2wsCj4KPiBTb3JyeSBmb3IgY29t
bWVudGluZyBsYXRlLCBJIGp1c3QgY2FtZSBiYWNrIGZyb20gdmFjYXRpb24uCj4KPiBPbiBXZWQs
IE9jdCAxNiwgMjAxOSBhdCAwNDo0NDo0OVBNICswMjAwLCBLYXJvbCBIZXJic3Qgd3JvdGU6Cj4g
PiBGaXhlcyBzdGF0ZSB0cmFuc2l0aW9ucyBvZiBOdmlkaWEgUGFzY2FsIEdQVXMgZnJvbSBEM2Nv
bGQgaW50byBoaWdoZXIgZGV2aWNlCj4gPiBzdGF0ZXMuCj4gPgo+ID4gdjI6IGNvbnZlcnQgdG8g
cGNpX2RldiBxdWlyawo+ID4gICAgIHB1dCBhIHByb3BlciB0ZWNobmljYWwgZXhwbGFuYXRpb24g
b2YgdGhlIGlzc3VlIGFzIGEgaW4tY29kZSBjb21tZW50Cj4gPiB2MzogZGlzYWJsZSBpdCBvbmx5
IGZvciBjZXJ0YWluIGNvbWJpbmF0aW9ucyBvZiBpbnRlbCBhbmQgbnZpZGlhIGhhcmR3YXJlCj4g
Pgo+ID4gU2lnbmVkLW9mZi1ieTogS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4g
PiBDYzogQmpvcm4gSGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiA+IENjOiBMeXVkZSBQ
YXVsIDxseXVkZUByZWRoYXQuY29tPgo+ID4gQ2M6IFJhZmFlbCBKLiBXeXNvY2tpIDxyandAcmp3
eXNvY2tpLm5ldD4KPiA+IENjOiBNaWthIFdlc3RlcmJlcmcgPG1pa2Eud2VzdGVyYmVyZ0BpbnRl
bC5jb20+Cj4gPiBDYzogbGludXgtcGNpQHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGxpbnV4LXBt
QHZnZXIua2VybmVsLm9yZwo+ID4gQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcK
PiA+IENjOiBub3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwo+ID4gLS0tCj4gPiAgZHJpdmVy
cy9wY2kvcGNpLmMgICAgfCAxMSArKysrKysrKysrCj4gPiAgZHJpdmVycy9wY2kvcXVpcmtzLmMg
fCA1MiArKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKysrKwo+Cj4gSSBt
YXkgYmUgbWlzc2luZyBzb21ldGhpbmcgYnV0IHdoeSB5b3UgY2FuJ3QgZG8gdGhpcyBpbiB0aGUg
bm91dmVhdQo+IGRyaXZlciBpdHNlbGY/CgpXaGF0IGRvIHlvdSBtZWFuIHByZWNpc2VseT8gTW92
ZSB0aGUgcXVpcmsgaW50byBub3V2ZWF1LCBidXQga2VlcCB0aGUKY2hhbmdlcyB0byBwY2kgY29y
ZT8KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVh
dSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0
cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
