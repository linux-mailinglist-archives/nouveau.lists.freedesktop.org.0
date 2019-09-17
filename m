Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01190B4719
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 07:59:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 14D946E130;
	Tue, 17 Sep 2019 05:59:24 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vs1-xe44.google.com (mail-vs1-xe44.google.com
 [IPv6:2607:f8b0:4864:20::e44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8956D6E130
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 05:59:22 +0000 (UTC)
Received: by mail-vs1-xe44.google.com with SMTP id b123so1265368vsb.5
 for <nouveau@lists.freedesktop.org>; Mon, 16 Sep 2019 22:59:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=hr8k8IIbjLwAHlX+XkdYHxzf6sDw2eCM0iZ70yTfKxE=;
 b=UnxwXKRXNgzj6YOIdUzahDb139dJEWhgzkyO8iFO4CSWrD7XNbrOF65RwgpLF8s/QZ
 R+lLtiOwXZli2j9kdX68h54zF475UhNL2TV/jIgNMPQpxvWOlSjGqbP18OmROo3oGrBW
 HyrQq+95sqCveyignstaZZJ+/2T8SrLobYCyIMgwe2ToBVZnVhykeBsWatwCb1MJ8G26
 48EbKun1Vk7o1gFr7AgQBIWHpmVfnmmKwm9D/v34afBAYCVMM8lzpbya8pkGczZqehk5
 r/4W3XFAGfhJdipofwEraUzNDUsO91X7v0flAm+IH7KpN54CFSQ7yO3ByVpvTq+tN/m/
 egZQ==
X-Gm-Message-State: APjAAAXMKkYH6YuKp22JGa6LV4QpyCnSMOpHxT3M/jZz4bs2E/qCbmNn
 CfAUNbJtut8rWWbduHHknWT2B1wKLYB5p1cpV0o=
X-Google-Smtp-Source: APXvYqwkKGEM7mnH2Xor2yj2tfNfLUz4tIcjk+Cn8atqwcKAZgtnHWMXWs0rXK0Oqd5XEhx1aIdohNtQ9LqRk9gOAXE=
X-Received: by 2002:a67:fa0b:: with SMTP id i11mr827782vsq.132.1568699961524; 
 Mon, 16 Sep 2019 22:59:21 -0700 (PDT)
MIME-Version: 1.0
References: <20190913113306.20972-1-kherbst@redhat.com>
 <20190913113306.20972-3-kherbst@redhat.com>
In-Reply-To: <20190913113306.20972-3-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 17 Sep 2019 15:59:10 +1000
Message-ID: <CACAvsv6oWgjiTPkR1Nn0JZt4v=rx1yPAD6p6aGQU+L+8AGERfw@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=hr8k8IIbjLwAHlX+XkdYHxzf6sDw2eCM0iZ70yTfKxE=;
 b=gs45SY2/qkedBPmRLK1lv+efHimgMO2Y1xE1V813089kxnd0D+vE2t3Q/cNJN59NGL
 m23MXwg2qokXVhcc0Ug37FJyiETyinluaNzU6GFmpGUthlDp3BV2np3VUUkuTiJX5uy0
 Z3TMUd5hVFM2FSBwSLP1i0YpaMHeUUBFAl1MYp6ye4TNyou/Cgcnsdq3O7cOi/++bLw/
 V/No0EyiG6+uVGbYNsraMBVIReNdI2ywftr9UouOIhHlj26Gu69PTmHTPgvjc3UEgp75
 gE0nd52y/5IAnIXVP9HpHuazzdWDQeI3gIx9pFFXl12jXNnnNHKfwWZOKpLaOie2qBBA
 vl0g==
Subject: Re: [Nouveau] [PATCH v4 2/4] pci: add nvkm_pcie_get_speed
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
Cc: ML nouveau <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAyMTozMywgS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gdjI6IGZpeGVkIGNvbXBpbGF0aW9uIGVycm9yCklzIHRoZXJlIGFu
eSBuZWVkIGZvciB0aGlzIHBhdGNoIGF0IGFsbCBub3csIGlmIHlvdSdyZSBmb3JjaW5nIDhfMApy
YXRoZXIgdGhhbiB0aGUgcHJlLURFVklOSVQgc3BlZWQ/Cgo+Cj4gU2lnbmVkLW9mZi1ieTogS2Fy
b2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gUmV2aWV3ZWQtYnk6IEx5dWRlIFBhdWwg
PGx5dWRlQHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJk
ZXYvcGNpLmggfCAxICsKPiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyAgICB8
IDggKysrKysrKysKPiAgMiBmaWxlcyBjaGFuZ2VkLCA5IGluc2VydGlvbnMoKykKPgo+IGRpZmYg
LS1naXQgYS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oIGIvZHJtL25vdXZl
YXUvaW5jbHVkZS9udmttL3N1YmRldi9wY2kuaAo+IGluZGV4IDQ4MDNhNGZhZC4uYjI5MTAxZTQ4
IDEwMDY0NAo+IC0tLSBhL2RybS9ub3V2ZWF1L2luY2x1ZGUvbnZrbS9zdWJkZXYvcGNpLmgKPiAr
KysgYi9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L3BjaS5oCj4gQEAgLTUzLDQgKzUz
LDUgQEAgaW50IGdwMTAwX3BjaV9uZXcoc3RydWN0IG52a21fZGV2aWNlICosIGludCwgc3RydWN0
IG52a21fcGNpICoqKTsKPgo+ICAvKiBwY2llIGZ1bmN0aW9ucyAqLwo+ICBpbnQgbnZrbV9wY2ll
X3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqLCBlbnVtIG52a21fcGNpZV9zcGVlZCwgdTggd2lk
dGgpOwo+ICtlbnVtIG52a21fcGNpZV9zcGVlZCBudmttX3BjaWVfZ2V0X3NwZWVkKHN0cnVjdCBu
dmttX3BjaSAqKTsKPiAgI2VuZGlmCj4gZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BjaS9wY2llLmMgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jCj4gaW5k
ZXggMzU0YWM0Yzg1Li5iNDIwM2ZmMWEgMTAwNjQ0Cj4gLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL3BjaWUuYwo+ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9wY2ll
LmMKPiBAQCAtMTc3LDMgKzE3NywxMSBAQCBudmttX3BjaWVfc2V0X2xpbmsoc3RydWN0IG52a21f
cGNpICpwY2ksIGVudW0gbnZrbV9wY2llX3NwZWVkIHNwZWVkLCB1OCB3aWR0aCkKPgo+ICAgICAg
ICAgcmV0dXJuIHJldDsKPiAgfQo+ICsKPiArZW51bSBudmttX3BjaWVfc3BlZWQKPiArbnZrbV9w
Y2llX2dldF9zcGVlZChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkKPiArewo+ICsgICAgICAgaWYgKCFw
Y2kgfHwgIXBjaV9pc19wY2llKHBjaS0+cGRldikgfHwgIXBjaS0+ZnVuYy0+cGNpZS5jdXJfc3Bl
ZWQpCj4gKyAgICAgICAgICAgICAgIHJldHVybiAtRU5PREVWOwo+ICsgICAgICAgcmV0dXJuIHBj
aS0+ZnVuYy0+cGNpZS5jdXJfc3BlZWQocGNpKTsKPiArfQo+IC0tCj4gMi4yMS4wCj4KPiBfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFp
bGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3Rz
LmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91
dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
