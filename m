Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B280AB4717
	for <lists+nouveau@lfdr.de>; Tue, 17 Sep 2019 07:56:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71D9A6E116;
	Tue, 17 Sep 2019 05:56:52 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-vk1-xa42.google.com (mail-vk1-xa42.google.com
 [IPv6:2607:f8b0:4864:20::a42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0179C6E116
 for <nouveau@lists.freedesktop.org>; Tue, 17 Sep 2019 05:56:50 +0000 (UTC)
Received: by mail-vk1-xa42.google.com with SMTP id p189so463128vkf.10
 for <nouveau@lists.freedesktop.org>; Mon, 16 Sep 2019 22:56:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=0O2571qNujeeS7KC1cjcJUchia6ZfyZvKqoom+jRnfY=;
 b=WxjHMqqx1Z1iEsO5Id2m0IhHSykdZ6GmNK3E3U13bHl/LKvUDNqiDXLTqX1zX0aI5/
 h26/DlIlZPWhV/eCobi1jFiy3AjBzNRXuPBOxuaqSRRdpsRylLqB1892QuqQ2IilPvlI
 oG5Nhh604enL4hoyWted56jgq1yB2ZGMPEynK7NH/0UQ9fJKHof+GlYAARtzzhLuXwGV
 EqAfjNHLL1Bzr9cDNJJRwFogPIQwEBB65qF2hQh00Zpj0CEZcTG6DLswIH0ued8etKRv
 un8PTa3W51CcnPOXKAv/Mx3wWjK2tmnV07cLRD2kP03X7qgvv/MmITmSAnckbvp1WmC2
 aufg==
X-Gm-Message-State: APjAAAWguJKtn3lS5L/4rPIbLq4Dlr+XvxQZIQUWp1vLzPMME7O9juqu
 p/gG/8XyXj9NyIG62R2DM9sndN73zmXzqM5rF64=
X-Google-Smtp-Source: APXvYqzw8mXK161pdV6aE/cU/ajsSXqW2cK28vK6SoQ0LvjbM+NiUdd4MAKMIV56YBvINnS2Z6opjOpS7ZO2AU9mGLA=
X-Received: by 2002:a1f:ec5:: with SMTP id 188mr653005vko.90.1568699809897;
 Mon, 16 Sep 2019 22:56:49 -0700 (PDT)
MIME-Version: 1.0
References: <20190912190028.27977-1-kherbst@redhat.com>
 <20190912190028.27977-2-kherbst@redhat.com>
In-Reply-To: <20190912190028.27977-2-kherbst@redhat.com>
From: Ben Skeggs <skeggsb@gmail.com>
Date: Tue, 17 Sep 2019 15:56:38 +1000
Message-ID: <CACAvsv73OSi1ELoERRy0H9qVLaG+6Lu8FQy_L7VNA1w_uKSSJA@mail.gmail.com>
To: Karol Herbst <kherbst@redhat.com>
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;
 bh=0O2571qNujeeS7KC1cjcJUchia6ZfyZvKqoom+jRnfY=;
 b=Xnxi+B2FXLYEKJz+iO0oSSCdZUGkW0n368tyathR4ijRdl7JtmrlUwnWwxrTD7wYWh
 j+GIVIIcPENhtqDplNypaROrTzXeFfbJJJryZEnQN05VnAICv3l+fEqVvdAfFri/CgNC
 iawmRJz4V6gP1GbrhKuWSnNiUj2MwJ3lu+Kru3ltONQsd1mAHWVZsvVvwaIKrb8WTPNd
 JRaHPtxZlJI5tRIOmWo2JGYsI1FiBxjzS0qc1Y6fkdrn2Iv2ZrvG7k+cLw1r0GxYGo+P
 r+kzwrsjUbz470YsrrfJLPc5A3rNBdkMBrNdoDLTbwvTfzVpaU8x1NzJomv9hJx7ZmIt
 HSXA==
Subject: Re: [Nouveau] [PATCH 1/3] pci: force disable ASPM before changing
 the link speed
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

T24gRnJpLCAxMyBTZXAgMjAxOSBhdCAwNTowMCwgS2Fyb2wgSGVyYnN0IDxraGVyYnN0QHJlZGhh
dC5jb20+IHdyb3RlOgo+Cj4gdGFrZW4gZnJvbSBudmdwdQo+Cj4gU2lnbmVkLW9mZi1ieTogS2Fy
b2wgSGVyYnN0IDxraGVyYnN0QHJlZGhhdC5jb20+Cj4gLS0tCj4gIGRybS9ub3V2ZWF1L252a20v
c3ViZGV2L3BjaS9nODQuYyAgIHwgIDkgKysrKysrKysrCj4gIGRybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BjaS9nOTIuYyAgIHwgIDEgKwo+ICBkcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZzk0
LmMgICB8ICAxICsKPiAgZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dmMTAwLmMgfCAgMSAr
Cj4gIGRybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nZjEwNi5jIHwgIDEgKwo+ICBkcm0vbm91
dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYyB8ICAxICsKPiAgZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL3BjaWUuYyAgfCAxNCArKysrKysrKysrKysrKwo+ICBkcm0vbm91dmVhdS9udmtt
L3N1YmRldi9wY2kvcHJpdi5oICB8ICAyICsrCj4gIDggZmlsZXMgY2hhbmdlZCwgMzAgaW5zZXJ0
aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nODQu
YyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nODQuYwo+IGluZGV4IDYyNDM4ZDg5Mi4u
MzUzZDcwZDdlIDEwMDY0NAo+IC0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nODQu
Ywo+ICsrKyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nODQuYwo+IEBAIC0xMjIsNiAr
MTIyLDE0IEBAIGc4NF9wY2lfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKnBjaSkKPiAgICAgICAgICAg
ICAgICAgbnZrbV9wY2lfbWFzayhwY2ksIDB4MDQxYywgMHgwMDAwMDA2MCwgMHgwMDAwMDAwMCk7
Cj4gIH0KPgo+ICt2b2lkCj4gK2c4NF9wY2llX2ZvcmNlX2FzcG1fb2ZmKHN0cnVjdCBudmttX3Bj
aSAqcGNpLCBib29sIHN0YXR1cykKPiArewo+ICsgICAgICAgLyogTDBzIGFuZCBMMSAqLwo+ICsg
ICAgICAgdTMyIHZhbHVlID0gc3RhdHVzID8gMHgxODAgOiAweDA7Cj4gKyAgICAgICBudmttX3Bj
aV9tYXNrKHBjaSwgMHgxNTAsIDB4MTgwLCB2YWx1ZSk7Cj4gK30KPiArCj4gIGludAo+ICBnODRf
cGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ICB7Cj4gQEAgLTE0Nyw2ICsxNTUsNyBA
QCBnODRfcGNpX2Z1bmMgPSB7Cj4gICAgICAgICAucGNpZS5zZXRfdmVyc2lvbiA9IGc4NF9wY2ll
X3NldF92ZXJzaW9uLAo+ICAgICAgICAgLnBjaWUudmVyc2lvbiA9IGc4NF9wY2llX3ZlcnNpb24s
Cj4gICAgICAgICAucGNpZS52ZXJzaW9uX3N1cHBvcnRlZCA9IGc4NF9wY2llX3ZlcnNpb25fc3Vw
cG9ydGVkLAo+ICsgICAgICAgLnBjaWUuZm9yY2VfYXNwbV9vZmYgPSBnODRfcGNpZV9mb3JjZV9h
c3BtX29mZiwKPiAgfTsKPgo+ICBpbnQKPiBkaWZmIC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2c5Mi5jIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2c5Mi5jCj4gaW5k
ZXggNDg4NzQzNTlkLi44YzM1Y2M4OWUgMTAwNjQ0Cj4gLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9z
dWJkZXYvcGNpL2c5Mi5jCj4gKysrIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2c5Mi5j
Cj4gQEAgLTQ4LDYgKzQ4LDcgQEAgZzkyX3BjaV9mdW5jID0gewo+ICAgICAgICAgLnBjaWUuc2V0
X3ZlcnNpb24gPSBnODRfcGNpZV9zZXRfdmVyc2lvbiwKPiAgICAgICAgIC5wY2llLnZlcnNpb24g
PSBnODRfcGNpZV92ZXJzaW9uLAo+ICAgICAgICAgLnBjaWUudmVyc2lvbl9zdXBwb3J0ZWQgPSBn
OTJfcGNpZV92ZXJzaW9uX3N1cHBvcnRlZCwKPiArICAgICAgIC5wY2llLmZvcmNlX2FzcG1fb2Zm
ID0gZzg0X3BjaWVfZm9yY2VfYXNwbV9vZmYsCj4gIH07Cj4KPiAgaW50Cj4gZGlmZiAtLWdpdCBh
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nOTQuYyBiL2RybS9ub3V2ZWF1L252a20vc3Vi
ZGV2L3BjaS9nOTQuYwo+IGluZGV4IDA5YWRiMzdhNS4uYWExNTJkNzk4IDEwMDY0NAo+IC0tLSBh
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nOTQuYwo+ICsrKyBiL2RybS9ub3V2ZWF1L252
a20vc3ViZGV2L3BjaS9nOTQuYwo+IEBAIC00MCw2ICs0MCw3IEBAIGc5NF9wY2lfZnVuYyA9IHsK
PiAgICAgICAgIC5wY2llLnNldF92ZXJzaW9uID0gZzg0X3BjaWVfc2V0X3ZlcnNpb24sCj4gICAg
ICAgICAucGNpZS52ZXJzaW9uID0gZzg0X3BjaWVfdmVyc2lvbiwKPiAgICAgICAgIC5wY2llLnZl
cnNpb25fc3VwcG9ydGVkID0gZzkyX3BjaWVfdmVyc2lvbl9zdXBwb3J0ZWQsCj4gKyAgICAgICAu
cGNpZS5mb3JjZV9hc3BtX29mZiA9IGc4NF9wY2llX2ZvcmNlX2FzcG1fb2ZmLAo+ICB9Owo+Cj4g
IGludAo+IGRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2YxMDAuYyBi
L2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nZjEwMC5jCj4gaW5kZXggMDBhNWU3ZDNlLi44
Njc2NDgwYzMgMTAwNjQ0Cj4gLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dmMTAw
LmMKPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2YxMDAuYwo+IEBAIC05Myw2
ICs5Myw3IEBAIGdmMTAwX3BjaV9mdW5jID0gewo+ICAgICAgICAgLnBjaWUuc2V0X3ZlcnNpb24g
PSBnZjEwMF9wY2llX3NldF92ZXJzaW9uLAo+ICAgICAgICAgLnBjaWUudmVyc2lvbiA9IGdmMTAw
X3BjaWVfdmVyc2lvbiwKPiAgICAgICAgIC5wY2llLnZlcnNpb25fc3VwcG9ydGVkID0gZzkyX3Bj
aWVfdmVyc2lvbl9zdXBwb3J0ZWQsCj4gKyAgICAgICAucGNpZS5mb3JjZV9hc3BtX29mZiA9IGc4
NF9wY2llX2ZvcmNlX2FzcG1fb2ZmLAo+ICB9Owo+Cj4gIGludAo+IGRpZmYgLS1naXQgYS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2YxMDYuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L3BjaS9nZjEwNi5jCj4gaW5kZXggMTFiZjQxOWFmLi44MDc5ZWJkZDQgMTAwNjQ0Cj4gLS0tIGEv
ZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL2dmMTA2LmMKPiArKysgYi9kcm0vbm91dmVhdS9u
dmttL3N1YmRldi9wY2kvZ2YxMDYuYwo+IEBAIC00MCw2ICs0MCw3IEBAIGdmMTA2X3BjaV9mdW5j
ID0gewo+ICAgICAgICAgLnBjaWUuc2V0X3ZlcnNpb24gPSBnZjEwMF9wY2llX3NldF92ZXJzaW9u
LAo+ICAgICAgICAgLnBjaWUudmVyc2lvbiA9IGdmMTAwX3BjaWVfdmVyc2lvbiwKPiAgICAgICAg
IC5wY2llLnZlcnNpb25fc3VwcG9ydGVkID0gZzkyX3BjaWVfdmVyc2lvbl9zdXBwb3J0ZWQsCj4g
KyAgICAgICAucGNpZS5mb3JjZV9hc3BtX29mZiA9IGc4NF9wY2llX2ZvcmNlX2FzcG1fb2ZmLAo+
ICB9Owo+Cj4gIGludAo+IGRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kv
Z2sxMDQuYyBiL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L3BjaS9nazEwNC5jCj4gaW5kZXggZTY4
MDMwNTA3Li5iNzM5MjJjNTIgMTAwNjQ0Cj4gLS0tIGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYv
cGNpL2drMTA0LmMKPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvZ2sxMDQuYwo+
IEBAIC0yMTksNiArMjE5LDcgQEAgZ2sxMDRfcGNpX2Z1bmMgPSB7Cj4gICAgICAgICAucGNpZS5z
ZXRfdmVyc2lvbiA9IGdmMTAwX3BjaWVfc2V0X3ZlcnNpb24sCj4gICAgICAgICAucGNpZS52ZXJz
aW9uID0gZ2YxMDBfcGNpZV92ZXJzaW9uLAo+ICAgICAgICAgLnBjaWUudmVyc2lvbl9zdXBwb3J0
ZWQgPSBnazEwNF9wY2llX3ZlcnNpb25fc3VwcG9ydGVkLAo+ICsgICAgICAgLnBjaWUuZm9yY2Vf
YXNwbV9vZmYgPSBnODRfcGNpZV9mb3JjZV9hc3BtX29mZiwKPiAgfTsKPgo+ICBpbnQKPiBkaWZm
IC0tZ2l0IGEvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYyBiL2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L3BjaS9wY2llLmMKPiBpbmRleCBkNzFlNWRiNTAuLjM1NGFjNGM4NSAxMDA2
NDQKPiAtLS0gYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcGNpZS5jCj4gKysrIGIvZHJt
L25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3BjaWUuYwo+IEBAIC0xMTEsNiArMTExLDE0IEBAIG52
a21fcGNpZV9pbml0KHN0cnVjdCBudmttX3BjaSAqcGNpKQo+ICAgICAgICAgcmV0dXJuIDA7Cj4g
IH0KPgo+ICt2b2lkCj4gK252a21fcGNpZV9mb3JjZV9hc3BtX29mZihzdHJ1Y3QgbnZrbV9wY2kg
KnBjaSwgYm9vbCBzdGF0dXMpCj4gK3sKPiArICAgICAgIGlmICghcGNpLT5mdW5jLT5wY2llLmZv
cmNlX2FzcG1fb2ZmKQo+ICsgICAgICAgICAgICAgICByZXR1cm47Cj4gKyAgICAgICBwY2ktPmZ1
bmMtPnBjaWUuZm9yY2VfYXNwbV9vZmYocGNpLCBzdGF0dXMpOwo+ICt9Cj4gKwo+ICBpbnQKPiAg
bnZrbV9wY2llX3NldF9saW5rKHN0cnVjdCBudmttX3BjaSAqcGNpLCBlbnVtIG52a21fcGNpZV9z
cGVlZCBzcGVlZCwgdTggd2lkdGgpCj4gIHsKPiBAQCAtMTU3LDkgKzE2NSwxNSBAQCBudmttX3Bj
aWVfc2V0X2xpbmsoc3RydWN0IG52a21fcGNpICpwY2ksIGVudW0gbnZrbV9wY2llX3NwZWVkIHNw
ZWVkLCB1OCB3aWR0aCkKPiAgICAgICAgIG52a21fZGVidWcoc3ViZGV2LCAic2V0IGxpbmsgdG8g
JXMgeCVpXG4iLAo+ICAgICAgICAgICAgICAgICAgICBudmttX3BjaWVfc3BlZWRzW3NwZWVkXSwg
d2lkdGgpOwo+Cj4gKyAgICAgICAvKiBmb3JjZSBkaXNhYmxlIEFTUE0gKi8KPiArICAgICAgIG52
a21fcGNpZV9mb3JjZV9hc3BtX29mZihwY2ksIHRydWUpOwo+ICsKPiAgICAgICAgIHJldCA9IHBj
aS0+ZnVuYy0+cGNpZS5zZXRfbGluayhwY2ksIHNwZWVkLCB3aWR0aCk7Cj4gICAgICAgICBpZiAo
cmV0IDwgMCkKPiAgICAgICAgICAgICAgICAgbnZrbV9lcnJvcihzdWJkZXYsICJzZXR0aW5nIGxp
bmsgZmFpbGVkOiAlaVxuIiwgcmV0KTsKPgo+ICsgICAgICAgLyogbGlmdCBmb3JjZSBkaXNhYmxl
IEFTUE0gKi8KPiArICAgICAgIG52a21fcGNpZV9mb3JjZV9hc3BtX29mZihwY2ksIGZhbHNlKTsK
VGhpcyBkb2Vzbid0IGRvIHdoYXQgaXMgc2F5cyBvbiB0aGUgYm94LiAgSXQncyBmb3JjaWJseSBk
aXNhYmxpbmcKQVNQTSwgdGhlbiBmb3JjaWJseSBlbmFibGluZyBpdC4gIFlvdSBzaG91bGQgaW5z
dGVhZCByZXN0b3JlIHRoZQpzZXR0aW5ncyBmcm9tIGJlZm9yZSBmb3JjaW5nIGl0IG9mZiwgd2hp
Y2ggaXMgd2hhdCBOVkdQVSBhY3R1YWxseSBkb2VzCnRvby4KCkJlbi4KCj4gKwo+ICAgICAgICAg
cmV0dXJuIHJldDsKPiAgfQo+IGRpZmYgLS1naXQgYS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9w
Y2kvcHJpdi5oIGIvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvcGNpL3ByaXYuaAo+IGluZGV4IDcw
MDlhYWQ4Ni4uYzZhOWVmMzMwIDEwMDY0NAo+IC0tLSBhL2RybS9ub3V2ZWF1L252a20vc3ViZGV2
L3BjaS9wcml2LmgKPiArKysgYi9kcm0vbm91dmVhdS9udmttL3N1YmRldi9wY2kvcHJpdi5oCj4g
QEAgLTI0LDYgKzI0LDcgQEAgc3RydWN0IG52a21fcGNpX2Z1bmMgewo+ICAgICAgICAgICAgICAg
ICB2b2lkICgqc2V0X3ZlcnNpb24pKHN0cnVjdCBudmttX3BjaSAqLCB1OCk7Cj4gICAgICAgICAg
ICAgICAgIGludCAoKnZlcnNpb24pKHN0cnVjdCBudmttX3BjaSAqKTsKPiAgICAgICAgICAgICAg
ICAgaW50ICgqdmVyc2lvbl9zdXBwb3J0ZWQpKHN0cnVjdCBudmttX3BjaSAqKTsKPiArICAgICAg
ICAgICAgICAgdm9pZCAoKmZvcmNlX2FzcG1fb2ZmKShzdHJ1Y3QgbnZrbV9wY2kgKiwgYm9vbCk7
Cj4gICAgICAgICB9IHBjaWU7Cj4gIH07Cj4KPiBAQCAtNDIsNiArNDMsNyBAQCBpbnQgZzg0X3Bj
aWVfdmVyc2lvbihzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gIHZvaWQgZzg0X3BjaWVfc2V0X2xpbmtf
c3BlZWQoc3RydWN0IG52a21fcGNpICosIGVudW0gbnZrbV9wY2llX3NwZWVkKTsKPiAgZW51bSBu
dmttX3BjaWVfc3BlZWQgZzg0X3BjaWVfY3VyX3NwZWVkKHN0cnVjdCBudmttX3BjaSAqKTsKPiAg
ZW51bSBudmttX3BjaWVfc3BlZWQgZzg0X3BjaWVfbWF4X3NwZWVkKHN0cnVjdCBudmttX3BjaSAq
KTsKPiArdm9pZCBnODRfcGNpZV9mb3JjZV9hc3BtX29mZihzdHJ1Y3QgbnZrbV9wY2kgKiwgYm9v
bCBzdGF0dXMpOwo+ICBpbnQgZzg0X3BjaWVfaW5pdChzdHJ1Y3QgbnZrbV9wY2kgKik7Cj4gIGlu
dCBnODRfcGNpZV9zZXRfbGluayhzdHJ1Y3QgbnZrbV9wY2kgKiwgZW51bSBudmttX3BjaWVfc3Bl
ZWQsIHU4KTsKPgo+IC0tCj4gMi4yMS4wCj4KPiBfX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fXwo+IE5vdXZlYXUgbWFpbGluZyBsaXN0Cj4gTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKPiBodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9tYWlsbWFu
L2xpc3RpbmZvL25vdXZlYXUKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5v
cmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
