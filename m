Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F6667E694
	for <lists+nouveau@lfdr.de>; Fri,  2 Aug 2019 01:45:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 972886E83D;
	Thu,  1 Aug 2019 23:45:50 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe42.google.com (mail-vs1-xe42.google.com
 [IPv6:2607:f8b0:4864:20::e42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DEEDF6E83D
 for <nouveau@lists.freedesktop.org>; Thu,  1 Aug 2019 23:45:48 +0000 (UTC)
Received: by mail-vs1-xe42.google.com with SMTP id 2so50079922vso.8
 for <nouveau@lists.freedesktop.org>; Thu, 01 Aug 2019 16:45:48 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=EX8X4lO7aSaVB1FpMoDQxncs8FMEtYzW491XME/gSYQ=;
 b=gMDH7kgx3nzLN1FVaWc1gEnv5lCygCC5YwRvUTteDdP9YnQdyLZ5ZFVByj0/gbOowv
 MNnB6mt/9pJ9ZNmL+0JtM/y1TWE/z/HoJ1OMbsvTIzHffAyxi57ow1ykMECwkacfuSSs
 QIWv/TpvefnoTEEQsIuAvXag4iBD68992Ru09rRbWnxby500TSI9Y2L6uiRiRDE9xUqz
 maAHqx457PZpByZsLz+9m5tw+nROK8ZQshXLRSqODCEweOT8SvSMeukKD6m92Km9kPRX
 pH135+UOIjZ7BOcdI+MXvzlqaQownTvCFGS7Y/xumbwBl6H7BOWLPQCnD7oHA4qNaD/T
 sCaA==
X-Gm-Message-State: APjAAAW9oTU251I7NTT0Tx4xgRGo/bMIJwSbsMkOxDGYx9Cp3NfqXGY6
 BYxGKlmt0cAi9ly7gYhjfpKQS/226zi0bTtrn/8=
X-Google-Smtp-Source: APXvYqwMxagfEomHjxLC2RbiQGAR+rGQzLMmlo5MUf4VwLIYt05EApA1Z5u6c0EjAR5+WcC4BnDGCEACOcfzlLG2eVM=
X-Received: by 2002:a67:fd91:: with SMTP id k17mr84874201vsq.121.1564703147897; 
 Thu, 01 Aug 2019 16:45:47 -0700 (PDT)
MIME-Version: 1.0
References: <20190801220117.14952-1-lyude@redhat.com>
In-Reply-To: <20190801220117.14952-1-lyude@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Fri, 2 Aug 2019 09:45:36 +1000
Message-ID: <CACAvsv4RUe7RpRFcOqigyKMdXm-z0VaiF7RqVHL1bGmRALU3kw@mail.gmail.com>
To: Lyude Paul <lyude@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=EX8X4lO7aSaVB1FpMoDQxncs8FMEtYzW491XME/gSYQ=;
 b=uTv0KihHzXdFtzn+LjPKqpsUXs5DAkUGjm8wB/wmTC2piN3+7ufjR8Gkc2bMAmuhEI
 Cfx9ohunWZK6FdjhCn5oMZdAn8IvFR0ngPfc9C56hc4J/sBdN2+Z/eb/iVB3u4+FYP++
 YZ0+8RE6Yij1Ht1M96t+C0aZmGOrrttpUJXmGZy19FeYx8UbMgHxSP2DV6dJf6N+WJ7Z
 hTo0z0PRLdZon5magUgEiwBnhaqI8d/vqLa0UNKFOlQlB4A5ZG8TH25VKQLfVXYIPoh5
 n+GVUoIfKxa6cvwwL4jiGFJNjvgehcO+pqA6bGwtSZrSNeRxy99oUKMOWvARbKnRGuNl
 glQA==
Subject: Re: [Nouveau] [PATCH] PCI: Use pci_reset_bus() in
 quirk_reset_lenovo_thinkpad_50_nvgpu()
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
 ML nouveau <nouveau@lists.freedesktop.org>, Maik Freudenberg <hhfeuer@gmx.de>,
 linux-kernel@vger.kernel.org, Daniel Drake <drake@endlessm.com>,
 linux-pci@vger.kernel.org, Bjorn Helgaas <bhelgaas@google.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAyIEF1ZyAyMDE5IGF0IDA4OjAxLCBMeXVkZSBQYXVsIDxseXVkZUByZWRoYXQuY29t
PiB3cm90ZToKPgo+IFNpbmNlIHF1aXJrX252aWRpYV9oZGEoKSB3YXMgYWRkZWQgdGhlcmUncyBu
b3cgdHdvIG52aWRpYSBkZXZpY2UKPiBmdW5jdGlvbnMgb24gYW55IGxhcHRvcHMgd2l0aCBudmlk
aWEgR1BVczogdGhlIEhEQSBjb250cm9sbGVyLCBhbmQgdGhlCj4gR1BVIGl0c2VsZi4gVW5mb3J0
dW5hdGVseSB0aGlzIGhhcyB0aGUgc2lkZWFmZmVjdCBvZiBicmVha2luZwo+IHF1aXJrX3Jlc2V0
X2xlbm92b190aGlua3BhZF81MF9udmdwdSgpIHNpbmNlIHBjaV9yZXNldF9mdW5jdGlvbigpIHdh
cwo+IHVzaW5nIHBjaV9wYXJlbnRfYnVzX3Jlc2V0KCkgdG8gcmVzZXQgdGhlIEdQVSdzIHJlc3Bl
Y3RpdmUgUENJIGJ1cywgYW5kCj4gcGNpX3BhcmVudF9idXNfcmVzZXQoKSBkb2VzIG5vdCB3b3Jr
IG9uIGJ1c3NlcyB3aGljaCBoYXZlIG1vcmUgdGhlbiBhCj4gc2luZ2xlIGRldmljZSBmdW5jdGlv
biBwcmVzZW50Lgo+Cj4gU28sIGZpeCB0aGlzIGJ5IHNpbXBseSBjYWxsaW5nIHBjaV9yZXNldF9i
dXMoKSBpbnN0ZWFkIHdoaWNoIHByb3Blcmx5Cj4gcmVzZXRzIHRoZSBHUFUgYnVzIGFuZCBhbGwg
ZGV2aWNlIGZ1bmN0aW9ucyB1bmRlciBpdCwgaW5jbHVkaW5nIGJvdGggdGhlCj4gR1BVIGFuZCB0
aGUgSERBIGNvbnRyb2xsZXIuCj4KPiBGaXhlczogYjUxNmVhNTg2ZDcxICgiUENJOiBFbmFibGUg
TlZJRElBIEhEQSBjb250cm9sbGVycyIpCj4gQ2M6IEx1a2FzIFd1bm5lciA8bHVrYXNAd3VubmVy
LmRlPgo+IENjOiBEYW5pZWwgRHJha2UgPGRyYWtlQGVuZGxlc3NtLmNvbT4KPiBDYzogQmpvcm4g
SGVsZ2FhcyA8YmhlbGdhYXNAZ29vZ2xlLmNvbT4KPiBDYzogQWFyb24gUGxhdHRuZXIgPGFwbGF0
dG5lckBudmlkaWEuY29tPgo+IENjOiBQZXRlciBXdSA8cGV0ZXJAbGVrZW5zdGV5bi5ubD4KPiBD
YzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pgo+IENjOiBLYXJvbCBIZXJic3Qg
PGtoZXJic3RAcmVkaGF0LmNvbT4KPiBDYzogTWFpayBGcmV1ZGVuYmVyZyA8aGhmZXVlckBnbXgu
ZGU+Cj4gQ2M6IGxpbnV4LXBjaUB2Z2VyLmtlcm5lbC5vcmcKPiBTaWduZWQtb2ZmLWJ5OiBMeXVk
ZSBQYXVsIDxseXVkZUByZWRoYXQuY29tPgpBY2tlZC1ieTogQmVuIFNrZWdncyA8YnNrZWdnc0By
ZWRoYXQuY29tPgoKPiAtLS0KPiAgZHJpdmVycy9wY2kvcXVpcmtzLmMgfCAyICstCj4gIDEgZmls
ZSBjaGFuZ2VkLCAxIGluc2VydGlvbigrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBh
L2RyaXZlcnMvcGNpL3F1aXJrcy5jIGIvZHJpdmVycy9wY2kvcXVpcmtzLmMKPiBpbmRleCAyMDhh
YWNmMzkzMjkuLjQ0YzRhZTFhYmQwMCAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL3BjaS9xdWlya3Mu
Ywo+ICsrKyBiL2RyaXZlcnMvcGNpL3F1aXJrcy5jCj4gQEAgLTUyNTYsNyArNTI1Niw3IEBAIHN0
YXRpYyB2b2lkIHF1aXJrX3Jlc2V0X2xlbm92b190aGlua3BhZF9wNTBfbnZncHUoc3RydWN0IHBj
aV9kZXYgKnBkZXYpCj4gICAgICAgICAgKi8KPiAgICAgICAgIGlmIChpb3JlYWQzMihtYXAgKyAw
eDIyNDBjKSAmIDB4Mikgewo+ICAgICAgICAgICAgICAgICBwY2lfaW5mbyhwZGV2LCBGV19CVUcg
IkdQVSBsZWZ0IGluaXRpYWxpemVkIGJ5IEVGSSwgcmVzZXR0aW5nXG4iKTsKPiAtICAgICAgICAg
ICAgICAgcmV0ID0gcGNpX3Jlc2V0X2Z1bmN0aW9uKHBkZXYpOwo+ICsgICAgICAgICAgICAgICBy
ZXQgPSBwY2lfcmVzZXRfYnVzKHBkZXYpOwo+ICAgICAgICAgICAgICAgICBpZiAocmV0IDwgMCkK
PiAgICAgICAgICAgICAgICAgICAgICAgICBwY2lfZXJyKHBkZXYsICJGYWlsZWQgdG8gcmVzZXQg
R1BVOiAlZFxuIiwgcmV0KTsKPiAgICAgICAgIH0KPiAtLQo+IDIuMjEuMAo+Cj4gX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcg
bGlzdAo+IE5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVA
bGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxt
YW4vbGlzdGluZm8vbm91dmVhdQ==
