Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C76A13B2C
	for <lists+nouveau@lfdr.de>; Sat,  4 May 2019 18:32:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6046B8936E;
	Sat,  4 May 2019 16:32:26 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-wr1-f66.google.com (mail-wr1-f66.google.com
 [209.85.221.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B2E68936E
 for <nouveau@lists.freedesktop.org>; Sat,  4 May 2019 16:32:25 +0000 (UTC)
Received: by mail-wr1-f66.google.com with SMTP id a9so11656663wrp.6
 for <nouveau@lists.freedesktop.org>; Sat, 04 May 2019 09:32:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QXyMybY/v3ec3Fp8WWSMV1lhd9yia8Q3haChRy4SV2k=;
 b=h92kWabKFYlZzkA7AUVnQi43KJKN5fuo5grvfV5JfL0w9Zt2csc2iy2szB4HFOPUU4
 CUYdRx5kKsM3ReUX9lAYVDuJ03Ut/YjJ/+MPis2jkJGzkdo2nQtkqrk75pi/pGWnJA9e
 Xw7TZ4QdjKdbCYCRv5ALpFBCrfxXOvNFBbqogdZv2Cz5JRvF1/hSJzG2/sY8Xtp5qHT0
 PLAQVqnEaJC6Ank2ev4ea8EQJWwMat9GyrB9luR6J7yUaEy5yYKTjQDOiCBTDPi9ZcAw
 LdgIWHSdrY4fGBV+CtKQoqN8SVnaeZjJVf2Kr/FtuPKKq1EuY7Ho42x1NRT/6Nc1zdYY
 DQhg==
X-Gm-Message-State: APjAAAW69wGvK+dHyE2J8ijjvHjQ2Xu+cBhPYqqGUIZ6kN60HRFCY40M
 WVszUNkOg0YZEEmxunWWMirIcA7pfDo=
X-Google-Smtp-Source: APXvYqyoa1mGMfP9tbIiN3Q2l0WoO6cUP+hpQjaAiaWsoM6s1HIAJSKzYqu2EX/zRKBdfzc+3L0Gww==
X-Received: by 2002:adf:ef4d:: with SMTP id c13mr4647888wrp.191.1556987543423; 
 Sat, 04 May 2019 09:32:23 -0700 (PDT)
Received: from kherbst.pingu ([2a02:8308:b0be:6900:3cb7:ac97:41a7:519d])
 by smtp.gmail.com with ESMTPSA id z17sm3824707wrm.33.2019.05.04.09.32.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sat, 04 May 2019 09:32:22 -0700 (PDT)
From: Karol Herbst <kherbst@redhat.com>
To: nouveau@lists.freedesktop.org
Date: Sat,  4 May 2019 18:32:14 +0200
Message-Id: <20190504163219.8349-1-kherbst@redhat.com>
X-Mailer: git-send-email 2.20.1
MIME-Version: 1.0
Subject: [Nouveau] [PATCH 0/5] Potential fix for runpm issues on various
 laptops
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

V2hpbGUgaW52ZXN0aWdhdGluZyB0aGUgcnVucG0gaXNzdWVzIG9uIG15IEdQMTA3IEkgbm90aWNl
ZCB0aGF0IHNvbWV0aGluZwppbnNpZGUgZGV2aW5pdCBtYWtlcyBydW5wbSBicmVhay4gSWYgTm91
dmVhdSBsb2FkcyB1cCB0byB0aGUgcG9pbnQgcmlnaHQKYmVmb3JlIGRvaW5nIGRldmluaXQsIHJ1
bnBtIHdvcmtzIHdpdGhvdXQgYW55IGlzc3VlcywgaWYgZGV2aW5pdCBpcyByYW4sCm5vdCBhbnlt
b3JlLgoKT3V0IG9mIGN1cmlvdXNpdHkgSSBldmVuIHRyaWVkIHRvICJiaXNlY3QiIGRldmluaXQg
Ynkgbm90IHJ1bm5pbmcgaXQgb24KdmJpb3MgcHJvdmlkZWQgc2lnbmVkIFBNVSBpbWFnZSwgYnV0
IG9uIHRoZSBkZXZpbml0IHBhcnNlciB3ZSBoYXZlIGluc2lkZQpOb3V2ZWF1LgpBbGx0aG91Z2gg
dGhpcyBvbmUgaXNuJ3QgYXMgZmVhdHVyZSBjb21wbGV0ZSBhcyB0aGUgdmJpb3Mgb25lLCBJIHdh
cyBhYmxlCnRvIHJlcHJvZHVjZSB0aGUgcnVucG0gaXNzdWVzIGFzIHdlbGwuIEZyb20gdGhhdCBw
b2ludCBJIHdhcyBhYmxlIHRvIG9ubHkKcnVuIGEgY2VydGFpbiBhbW91bnQgb2YgY29tbWFuZHMg
dW50aWwgSSBnb3QgdG8gc29tZSBQQ0llIGluaXRpYWxpemF0aW9uCmNvZGUgaW5zaWRlIGRldmlu
aXQgd2hpY2ggdHJpZ2dlciB0aG9zZSBydW5wbSBpc3N1ZXMuCgpEZXZpbml0IG9uIG15IEdQVSB3
YXMgY2hhbmdpbmcgdGhlIFBDSWUgbGluayBmcm9tIDguMCB0byAyLjUsIHJldmVyc2luZwp0aGF0
IG9uIHRoZSBmaW5pIHBhdGggbWFrZXMgcnVucG0gd29yayBhZ2Fpbi4KClRoZXJlIGFyZSBhIGZl
dyBvdGhlciB0aGluZ3MgZ29pbmcgb24sIGJ1dCB3aXRoIG15IGxpbWl0ZWQga25vd2xlZGdlIGFi
b3V0ClBDSWUgaW4gZ2VuZXJhbCwgdGhlIGNoYW5nZSBpbiB0aGUgbGluayBzcGVlZCBzb3VuZGVk
IGxpa2UgaXQgY291bGQgY2F1c2UKaXNzdWVzIG9uIHJlc3VtZSBpZiB0aGUgY29udHJvbGxlciBh
bmQgdGhlIGRldmljZSBkaXNhZ3JlZSBvbiB0aGUgYWN0dWFsCmxpbmsuCgpNYXliZSB0aGlzIGlz
IGp1c3QgYSBidWcgd2l0aGluIHRoZSBQQ0kgc3Vic3lzdGVtIGluc2lkZSBsaW51eCBpbnN0ZWFk
IGFuZAp0aGUgY29udHJvbGxlciBoYXMgdG8gYmUgZm9yY2VkIHRvIGRvIF9zb21ldGhpbmdfPwoK
QW55d2F5LCB3aXRoIHRoaXMgcnVucG0gc2VlbXMgdG8gd29yayBuaWNlbHkgb24gbXkgbWFjaGlu
ZS4gU2VjdXJlIGJvb3RpbmcKdGhlIGdyIChldmVuIHdpdGggbXkgd29ya2Fyb3VuZCBhcHBsaWVk
IEkgbmVlZCBhbnl3YXkpIG1pZ2h0IGZhaWwgYWZ0ZXIKdGhlIEdQVSBnb3QgcnVudGltZSByZXN1
bWVkIHRob3VnaC4uLgoKS2Fyb2wgSGVyYnN0ICg1KToKICBkcm06IGRvbid0IHNldCB0aGUgcGNp
IHBvd2VyIHN0YXRlIGlmIHRoZSBwY2kgc3Vic3lzdGVtIGhhbmRsZXMgdGhlCiAgICBBQ1BJIGJp
dHMKICBwY2k6IGVuYWJsZSBwY2llIGxpbmsgY2hhbmdlcyBmb3IgcGFzY2FsCiAgcGNpOiBhZGQg
bnZrbV9wY2llX2dldF9zcGVlZAogIHBjaTogc2F2ZSB0aGUgYm9vdCBwY2llIGxpbmsgc3BlZWQK
ICBwY2k6IHJlc3RvcmUgdGhlIGJvb3QgcGNpZSBsaW5rIHNwZWVkIG9uIGZpbmkKCiBkcm0vbm91
dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oIHwgIDYgKysrKy0tCiBkcm0vbm91dmVhdS9u
b3V2ZWF1X2FjcGkuYyAgICAgICAgICAgIHwgIDYgKysrLS0tCiBkcm0vbm91dmVhdS9ub3V2ZWF1
X2FjcGkuaCAgICAgICAgICAgIHwgIDQgKystLQogZHJtL25vdXZlYXUvbm91dmVhdV9kcm0uYyAg
ICAgICAgICAgICB8IDE1ICsrKysrKysrKy0tLS0KIGRybS9ub3V2ZWF1L25vdXZlYXVfZHJ2Lmgg
ICAgICAgICAgICAgfCAgMiArKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2Jhc2UuYyAg
ICB8ICA5ICsrKysrKy0tCiBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyAgIHwg
IDggKysrLS0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dwMTAwLmMgICB8IDEwICsr
KysrKysrKwogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyAgICB8IDMxICsrKysr
KysrKysrKysrKysrKysrKysrLS0tLQogZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYu
aCAgICB8ICA3ICsrKysrKwogMTAgZmlsZXMgY2hhbmdlZCwgNzcgaW5zZXJ0aW9ucygrKSwgMjEg
ZGVsZXRpb25zKC0pCgotLSAKMi4yMC4xCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcgbGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVk
ZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZv
L25vdXZlYXU=
