Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E11D98E76B
	for <lists+nouveau@lfdr.de>; Thu, 15 Aug 2019 10:51:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 641F16E954;
	Thu, 15 Aug 2019 08:51:08 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ot1-f68.google.com (mail-ot1-f68.google.com
 [209.85.210.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 489376E954
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 08:51:07 +0000 (UTC)
Received: by mail-ot1-f68.google.com with SMTP id o101so4342794ota.8
 for <nouveau@lists.freedesktop.org>; Thu, 15 Aug 2019 01:51:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=wNNENm22qpG0hXUPGdAmX55NY+4YCrpdGbfJ2rCG9cE=;
 b=rdz8ACRWvib7/BCp5TXbX2JZOb3YNFNntOD6xpV+M99z0eIBCLi1exOUtwyRz/p4h/
 6dNOlFE9NFXCs974LWpIoKCrMvnTWcXj+UDfPjnPYTDeU7Z78v+z2GqoYRodunraGkXT
 3LAfqS2gWfCqzWWwmy1eLtU1UymPhRQAidSi6jDONIqzYxnPR1HvCa8WXi9r4kD8wJLL
 zAY8a5KG/LyGhHqB2jdF6c+767AjsOOhGiACR9POGjNgw0IGBe/sr4wtcaQV8stolobW
 CMdQDKwX8lgQgL7PkWPyYKA6g8yqSil2mp7uCW6xItdle+KixMwquSWZVfDlS/73I1lY
 oYzQ==
X-Gm-Message-State: APjAAAVeMoeb0iGTXW265fUUmnvO7rukkUQMukuNPSDee2AObcuTNrsh
 elAAfXmwSa6t3fDZWMFW6bmqsfBnKx8WI98OO8i5jg==
X-Google-Smtp-Source: APXvYqyqUkirjMrFjZ5TYCEnwAVhXgh0UHeSVqFLerVPav05zWJtrTsI3hljyY2mdWBAV+QndGF/yFL1ZAvge06Choo=
X-Received: by 2002:a6b:7e45:: with SMTP id k5mr4349960ioq.178.1565859066511; 
 Thu, 15 Aug 2019 01:51:06 -0700 (PDT)
MIME-Version: 1.0
References: <20190802092100.5897-1-mmenzyns@redhat.com>
In-Reply-To: <20190802092100.5897-1-mmenzyns@redhat.com>
From: Karol Herbst <kherbst@redhat.com>
Date: Thu, 15 Aug 2019 10:50:55 +0200
Message-ID: <CACO55ttfUd7XBH+vttVE0S_We3iEFRLheCTjHX0mBq95+i3xqg@mail.gmail.com>
To: Mark Menzynski <mmenzyns@redhat.com>
Subject: Re: [Nouveau] [PATCH] volt: Fix for some cards having 0 maximum
 voltage
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
Cc: nouveau <nouveau@lists.freedesktop.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

YWx0aG91Z2ggSSdkIGxpa2UgdG8gaGF2ZSBhIGRlZXBlciB1bmRlcnN0YW5kaW5nIG9mIHRoaXMg
dGFibGUsIEkKdGhpbmsgaXQncyBmaW5lIGFzIGl0IGlzIHJpZ2h0IG5vdyBhbmQgdGhpcyBhY3R1
YWxseSBkb2VzIGZpeApzb21ldGhpbmcgd2l0aG91dCBjYXVzaW5nIGFueSBpc3N1ZXMgKGFzIGZh
ciBhcyB3ZSBrbm93IG9mKQoKUmV2aWV3ZWQtYnk6IEthcm9sIEhlcmJzdCA8a2hlcmJzdEByZWRo
YXQuY29tPgoKT24gRnJpLCBBdWcgMiwgMjAxOSBhdCAxMToyMSBBTSBNYXJrIE1lbnp5bnNraSA8
bW1lbnp5bnNAcmVkaGF0LmNvbT4gd3JvdGU6Cj4KPiBTb21lLCBtb3N0bHkgRmVybWksIHZiaW9z
ZXMgYXBwZWFyIHRvIGhhdmUgemVybyBtYXggdm9sdGFnZS4gVGhhdCBjYXVzZXMgTm91dmVhdSB0
byBub3QgcGFyc2Ugdm9sdGFnZSBlbnRyaWVzLCB0aHVzIHVzZXJzIG5vdCBiZWluZyBhYmxlIHRv
IHNldCBoaWdoZXIgY2xvY2tzLgo+Cj4gV2hlbiBjaGFuZ2luZyB0aGlzIHZhbHVlIE52aWRpYSBk
cml2ZXIgc3RpbGwgYXBwZWFyZWQgdG8gaWdub3JlIGl0LCBhbmQgSSB3YXNuJ3QgYWJsZSB0byBm
aW5kIG91dCB3aHksIHRodXMgdGhlIGNvZGUgaXMgaWdub3JpbmcgdGhlIHZhbHVlIGlmIGl0IGlz
IHplcm8uCj4KPiBDQzogTWFhcnRlbiBMYW5raG9yc3QgPG1hYXJ0ZW4ubGFua2hvcnN0QGxpbnV4
LmludGVsLmNvbT4KPiBTaWduZWQtb2ZmLWJ5OiBNYXJrIE1lbnp5bnNraSA8bW1lbnp5bnNAcmVk
aGF0LmNvbT4KPiAtLS0KPiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmlvcy92b2x0LmMgfCAy
ICsrCj4gIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKykKPgo+IGRpZmYgLS1naXQgYS9k
cm0vbm91dmVhdS9udmttL3N1YmRldi9iaW9zL3ZvbHQuYyBiL2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L2Jpb3Mvdm9sdC5jCj4gaW5kZXggNzE0M2VhNDYuLjMzYTlmYjVhIDEwMDY0NAo+IC0tLSBh
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2Jpb3Mvdm9sdC5jCj4gKysrIGIvZHJtL25vdXZlYXUv
bnZrbS9zdWJkZXYvYmlvcy92b2x0LmMKPiBAQCAtOTYsNiArOTYsOCBAQCBudmJpb3Nfdm9sdF9w
YXJzZShzdHJ1Y3QgbnZrbV9iaW9zICpiaW9zLCB1OCAqdmVyLCB1OCAqaGRyLCB1OCAqY250LCB1
OCAqbGVuLAo+ICAgICAgICAgICAgICAgICBpbmZvLT5taW4gICAgID0gbWluKGluZm8tPmJhc2Us
Cj4gICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgaW5mby0+YmFzZSArIGluZm8t
PnN0ZXAgKiBpbmZvLT52aWRtYXNrKTsKPiAgICAgICAgICAgICAgICAgaW5mby0+bWF4ICAgICA9
IG52Ymlvc19yZDMyKGJpb3MsIHZvbHQgKyAweDBlKTsKPiArICAgICAgICAgICAgICAgaWYgKCFp
bmZvLT5tYXgpCj4gKyAgICAgICAgICAgICAgICAgICAgICAgaW5mby0+bWF4ID0gbWF4KGluZm8t
PmJhc2UsIGluZm8tPmJhc2UgKyBpbmZvLT5zdGVwICogaW5mby0+dmlkbWFzayk7Cj4gICAgICAg
ICAgICAgICAgIGJyZWFrOwo+ICAgICAgICAgY2FzZSAweDUwOgo+ICAgICAgICAgICAgICAgICBp
bmZvLT5taW4gICAgID0gbnZiaW9zX3JkMzIoYmlvcywgdm9sdCArIDB4MGEpOwo+IC0tCj4gMi4y
MS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+
IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBo
dHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWls
aW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVl
ZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
