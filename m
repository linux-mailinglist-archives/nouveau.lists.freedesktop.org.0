Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E71B14B0
	for <lists+nouveau@lfdr.de>; Thu, 12 Sep 2019 21:07:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E51906EE01;
	Thu, 12 Sep 2019 19:07:20 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-f66.google.com (mail-vs1-f66.google.com
 [209.85.217.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 154326EE01
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 19:07:19 +0000 (UTC)
Received: by mail-vs1-f66.google.com with SMTP id b11so16988786vsq.2
 for <nouveau@lists.freedesktop.org>; Thu, 12 Sep 2019 12:07:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=WFn1WCVEcO7x6gnda7YmaAkt6c8/nK2HgDyDi+Vlxbo=;
 b=tm9G6PllZViGQMhg9LUnVy0e+qpL94K6zBVEpEv2cYOmKuoaW515UcvvuUrC0BFoGU
 l9KRbHLJvuedHjdiLY4uz2C8LStUcYz+N6OQsWWBkM25ZXxxMT+J6dt3FKXz6UOVjPbY
 ASHD3SEjgsIEGOa3KsN2gYxpCE5aLy2gbyVigjJkY0NRcRJJJXZiacLBED/C9rFcOia5
 xftY1/4e67GKUMsD1XPHzED7DLKg7yDq0erl7QkRp5uSVVfcV4xFuYLFOECfwjwpP6bJ
 hIVcpP+WSeL+hns0lJ8xXgmjnGSr5wGcFaKXOEWpEO4Gr8Tw9NPSwab7c93H2CXTArg6
 n8aQ==
X-Gm-Message-State: APjAAAXTVGslO0Lqbo/4AqlEG6edXoFEfZVU5Gh3bZ8UwHVxiBwPK/qn
 NsskcU4iIts/jHPMq7yOyyGLkVH+53SfbF4kMvo=
X-Google-Smtp-Source: APXvYqwoiR/IYWs/5M8I8UyIiA383PGjwdNIT6Sx4dWlZfllw2L6qRPY4KuAFaMCY5Q31QLEWZyXUUvFO1OLNY83HCc=
X-Received: by 2002:a67:fd97:: with SMTP id k23mr17766821vsq.220.1568315238080; 
 Thu, 12 Sep 2019 12:07:18 -0700 (PDT)
MIME-Version: 1.0
References: <20190912190028.27977-1-kherbst@redhat.com>
 <20190912190028.27977-4-kherbst@redhat.com>
In-Reply-To: <20190912190028.27977-4-kherbst@redhat.com>
From: Ilia Mirkin <imirkin@alum.mit.edu>
Date: Thu, 12 Sep 2019 15:07:06 -0400
Message-ID: <CAKb7UviD520oCHJNo-AKZiNBrGy6nbNoMmTdcTDt9MRdFhDY1w@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
Subject: Re: [Nouveau] [PATCH 3/3] pci/gk104: wait for ltssm idle before
 changing the link
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
Cc: nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVGh1LCBTZXAgMTIsIDIwMTkgYXQgMzowMCBQTSBLYXJvbCBIZXJic3QgPGtoZXJic3RAcmVk
aGF0LmNvbT4gd3JvdGU6Cj4KPiB0YWtlbiBmcm9tIG52Z3B1Cj4KPiBTaWduZWQtb2ZmLWJ5OiBL
YXJvbCBIZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4KPiAtLS0KPiAgZHJtL25vdXZlYXUvbnZr
bS9zdWJkZXYvcGNpL2drMTA0LmMgfCA3ICsrKysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5z
ZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9n
azEwNC5jIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2drMTA0LmMKPiBpbmRleCA2YWVi
MDdmZTQuLjJkMWZhNjdlYiAxMDA2NDQKPiAtLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvZ2sxMDQuYwo+ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCj4g
QEAgLTIzLDYgKzIzLDggQEAKPiAgICovCj4gICNpbmNsdWRlICJwcml2LmgiCj4KPiArI2luY2x1
ZGUgPHN1YmRldi90aW1lci5oPgo+ICsKPiAgc3RhdGljIGludAo+ICBnazEwNF9wY2llX3ZlcnNp
b25fc3VwcG9ydGVkKHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ICB7Cj4gQEAgLTE0Miw2ICsxNDQs
MTEgQEAgZ2sxMDRfcGNpZV9zZXRfbGlua19zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSwgZW51
bSBudmttX3BjaWVfc3BlZWQgc3BlZWQpCj4gICAgICAgICAgICAgICAgIGJyZWFrOwo+ICAgICAg
ICAgfQo+Cj4gKyAgICAgICAvKiB3YWl0IGZvciBsdHNzbSBpZGxlICovCj4gKyAgICAgICBudmtt
X21zZWMoZGV2aWNlLCAyMDAsCj4gKyAgICAgICAgICAgICAgIGlmICgobnZrbV9yZDMyKGRldmlj
ZSwgMHg4YzA0MCkgJiAweDFmKSA9PSAwKQo+ICsgICAgICAgICAgICAgICAgICAgICAgIGJyZWFr
Owo+ICsgICAgICAgKTsKCldoYXQgaWYgaXQgZG9lc24ndCBpZGxlPyBTaG91bGQgeW91IHN0aWxs
IGRvIHRoZSBiZWxvdyB0aGluZ3M/Cgo+ICAgICAgICAgbnZrbV9tYXNrKGRldmljZSwgMHg4YzA0
MCwgMHhjMDAwMCwgbWFza192YWx1ZSk7Cj4gICAgICAgICBudmttX21hc2soZGV2aWNlLCAweDhj
MDQwLCAweDEsIDB4MSk7Cj4gIH0KPiAtLQo+IDIuMjEuMAo+Cj4gX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KPiBOb3V2ZWF1IG1haWxpbmcgbGlzdAo+IE5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnCj4gaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5v
cmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1Cl9fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vbm91dmVhdQ==
