Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7542E7D002
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2019 23:26:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 570A389A5D;
	Wed, 31 Jul 2019 21:26:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-io1-f68.google.com (mail-io1-f68.google.com
 [209.85.166.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2DAB289A5D
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2019 21:26:51 +0000 (UTC)
Received: by mail-io1-f68.google.com with SMTP id j5so135440085ioj.8
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2019 14:26:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=tIGma61wLHtzNprRff+9TEgirnDHGnLDSLV4ZUKzd0A=;
 b=RPi1xvLIqnJqalJhckxboHpi4cPyvUJRdO3e3m5QiAeLxCMfxbs3wmNJsclxf0hXX4
 4SDVcf6XezFhL5MuNuBMcpkIt0c314Y+3oMzrrl06t80Vw/8yNp2Hp/vWrkWvf1vejo5
 MQhOY1yGaFH0o5/nQ56xWByhzKBBeoO+vor/jQSx8CS4zg8gFMaiKuNxtdBP4flEmVnq
 6XdEoQvRKUJlvGPY0AxJ7A6+srBTYUV1XEhT1lTjXP7I03eB3IfSmwpyYurDt8kviW9f
 pgYSRnX2pii7hzE7yklG22+Ho7UkmX1mFCkDvq1GyfZMndIfHHULbg7pW7bJzMYloYd7
 ByPw==
X-Gm-Message-State: APjAAAVAO2MfjfcKtyZi0/S0LLIsBB6i9g41Z9XXsUzeQkPakzhoJii7
 xE65lzVX9KmdsFlXjWVZ7rBRIW09jHBvE353X7Z6VQ==
X-Google-Smtp-Source: APXvYqzESQ6j/S2FQ4K/46lCRs2V5bZ+p/HVw7BDuXGgow808D74rbDC31pUP/jqnm5XyBJWHTuU22rvCZ1LzMnu6TU=
X-Received: by 2002:a02:230a:: with SMTP id u10mr46030961jau.117.1564608410139; 
 Wed, 31 Jul 2019 14:26:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190731201927.22054-1-lyude@redhat.com>
 <20190731211842.befvpoyudrm2subf@wunner.de>
In-Reply-To: <20190731211842.befvpoyudrm2subf@wunner.de>
From: Karol Herbst <kherbst@redhat.com>
Date: Wed, 31 Jul 2019 23:26:39 +0200
Message-ID: <CACO55tu=9ZBzGkwdXPOwWARy1UTspFv+v=nrmLFoOKiSGU+E5Q@mail.gmail.com>
To: Lukas Wunner <lukas@wunner.de>
Subject: Re: [Nouveau] [PATCH] Revert "PCI: Enable NVIDIA HDA controllers"
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
Cc: Aaron Plattner <aplattner@nvidia.com>,
 nouveau <nouveau@lists.freedesktop.org>, Maik Freudenberg <hhfeuer@gmx.de>,
 LKML <linux-kernel@vger.kernel.org>, Daniel Drake <drake@endlessm.com>,
 Linux PCI <linux-pci@vger.kernel.org>, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMTE6MTggUE0gTHVrYXMgV3VubmVyIDxsdWthc0B3dW5u
ZXIuZGU+IHdyb3RlOgo+Cj4gT24gV2VkLCBKdWwgMzEsIDIwMTkgYXQgMDQ6MTk6MjdQTSAtMDQw
MCwgTHl1ZGUgUGF1bCB3cm90ZToKPiA+IFdoaWxlIHRoaXMgZml4ZXMgYXVkaW8gZm9yIGEgbnVt
YmVyIG9mIHVzZXJzLCB0aGlzIGNvbW1pdCBoYXMgdGhlCj4gPiBzaWRlYWZmZWN0IG9mIGJyZWFr
aW5nIHRoZSBCSU9TIHdvcmthcm91bmQgdGhhdCdzIHJlcXVpcmVkIHRvIG1ha2UgdGhlCj4gPiBH
UFUgb24gdGhlIG52aWRpYSBQNTAgd29yaywgYnkgY2F1c2luZyB0aGUgR1BVJ3MgUENJIGRldmlj
ZSBmdW5jdGlvbiB0bwo+ID4gc3RvcCB3b3JraW5nIGFmdGVyIGl0J3MgYmVlbiBzZXQgdG8gbXVs
dGlmdW5jdGlvbiBtb2RlLgo+Cj4gVGhpcyBpcyBtaXNzaW5nIGEgcmVmZXJlbmNlIHRvIHRoZSBj
b21taXQgaW50cm9kdWNpbmcgdGhlIFA1MCBxdWlyaywKPiB3aGljaCBpcyBlMDU0N2M4MWJmY2Yg
KCJQQ0k6IFJlc2V0IExlbm92byBUaGlua1BhZCBQNTAgbnZncHUgYXQgYm9vdAo+IGlmIG5lY2Vz
c2FyeSIpLgo+Cj4gUGxlYXNlIGRlc2NyaWJlIGluIG1vcmUgZGV0YWlsIGhvdyB0aGUgR1BVJ3Mg
UENJIGZ1bmN0aW9uIHN0b3BzIHdvcmtpbmcuCj4gRG9lcyBpdCByZXNwb25kIHdpdGggImFsbCBv
bmVzIiB3aGVuIGFjY2Vzc2luZyBNTUlPPwo+IERvIE1NSU8gYWNjZXNzZXMgY2F1c2UgdGhlIHN5
c3RlbSB0byBoYW5nPwo+Cj4gQ291bGQgeW91IHByb3ZpZGUgbHNwY2kgLXZ2eHggb3V0cHV0IGZv
ciB0aGUgR1BVIGFuZCBpdHMgYXNzb2NpYXRlZAo+IEhEQSBjb250cm9sbGVyIHdpdGggYW5kIHdp
dGhvdXQgYjUxNmVhNTg2ZDcxPwo+Cj4gRG9lcyB0aGlzIG1hY2hpbmUgaGF2ZSBleHRlcm5hbCBk
aXNwbGF5IGNvbm5lY3RvcnMgdmlhIHdoaWNoIGF1ZGlvCj4gY2FuIGJlIHN0cmVhbWVkPwo+Cj4K
PiA+IEknbSBub3QgcmVhbGx5IGhvbGRpbmcgbXkgYnJlYXRoIG9uIHRoaXMgcGF0Y2ggdG8gYmVp
bmcgYWNjZXB0ZWQ6Cj4gPiB0aGVyZSdzIGEgZ29vZCBjaGFuY2UgdGhlcmUncyBhIGJldHRlciBz
b2x1dGlvbiBmb3IgdGhpcyAoYW5kIEknbSBnb2luZwo+ID4gdG8gY29udGludWUgaW52ZXN0aWdh
dGluZyBmb3Igb25lIGFmdGVyIHNlbmRpbmcgdGhpcyBwYXRjaCksIHRoaXMgaXMKPiA+IG1vcmUg
anVzdCB0byBzdGFydCBhIGNvbnZlcnNhdGlvbiBvbiB3aGF0IHRoZSBwcm9wZXIgd2F5IHRvIGZp
eCB0aGlzIGlzLgo+Cj4gUG9zdGluZyBhcyBhbiBSRkMgbWlnaHQgaGF2ZSBiZWVuIG1vcmUgYXBw
cm9wcmlhdGUgdGhlbi4KPgoKbm8sIGEgcmV2ZXJ0IGlzIGFjdHVhbGx5IGFwcHJvcHJpYXRlLiAg
SWYgYSBjb21taXQgZml4ZXMgc29tZXRoaW5nLApidXQgYnJlYWtzIHNvbWV0aGluZyBlbHNlLCBp
dCBnZXRzIGVpdGhlciByZXZlcnRlZCBvciBmaXhlZC4gSWYgbm9ib2R5CmZpeGVzIGl0LCB0aGVu
IHJldmVydCBpdCBpcy4KCj4KPiA+IFNvLCBJJ20ga2luZCBvZiBjb25mdXNlZCBhYm91dCB3aHkg
ZXhhY3RseSB0aGlzIHdhcyBpbXBsZW1lbnRlZCBhcyBhbgo+ID4gZWFybHkgYm9vdCBxdWlyayBp
biB0aGUgZmlyc3QgcGxhY2UuIElmIHdlJ3JlIHNlZWluZyB0aGUgR1BVJ3MgUENJCj4gPiBkZXZp
Y2UsIHdlIGFscmVhZHkga25vdyB0aGUgR1BVIGlzIHRoZXJlLiBTaG91bGRuJ3Qgd2UgYmUgYWJs
ZSB0byBjaGVjawo+ID4gZm9yIHRoZSBleGlzdGVuY2Ugb2YgdGhlIEhEQSBkZXZpY2Ugb25jZSB3
ZSBwcm9iZSB0aGUgR1BVIGluIG5vdXZlYXU/Cj4KPiBJIHRoaW5rIGEgbW90aXZhdGlvbiB0byBr
ZWVwIHRoaXMgZ2VuZXJpYyB3YXMgdG8gbWFrZSBpdCB3b3JrIHdpdGgKPiBvdGhlciBkcml2ZXJz
IGJlc2lkZXMgbm91dmVhdSwgc3BlY2lmaWNhbGx5IE52aWRpYSdzIHByb3ByaWV0YXJ5IGRyaXZl
ci4KPiBub3V2ZWF1IG1pZ2h0IG5vdCBldmVuIGJlIGVuYWJsZWQuCj4KPgo+ID4gdGhhdCBzdGls
bCBkb2Vzbid0IGV4cGxhaW4gd2h5IHRoaXMgd2FzIGltcGxlbWVudGVkIGFzIGFuIGVhcmx5IHF1
aXJrCj4KPiBUaGlzIGlzbid0IGFuIGVhcmx5IHF1aXJrLiAgVGhvc2UgbGl2ZSBpbiBhcmNoL3g4
Ni9rZXJuZWwvZWFybHktcXVpcmtzLmMuCj4gVGhpcyBpcyBqdXN0IGEgUENJIHF1aXJrIGV4ZWN1
dGVkIG9uIGRldmljZSBlbnVtZXJhdGlvbiBhbmQgb24gcmVzdW1lLgo+IERldmljZXMgYXJlbid0
IG5lY2Vzc2FyaWx5IGVudW1lcmF0ZWQgb25seSBvbiBib290LCBlLmcuIHRoaW5rIFRodW5kZXJi
b2x0Lgo+Cj4gVGhhbmtzLAo+Cj4gTHVrYXMKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVl
ZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5m
by9ub3V2ZWF1
