Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4D9601C7500
	for <lists+nouveau@lfdr.de>; Wed,  6 May 2020 17:34:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D63536E2BD;
	Wed,  6 May 2020 15:34:47 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com
 [IPv6:2a00:1450:4864:20::631])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D296B6E2BD
 for <nouveau@lists.freedesktop.org>; Wed,  6 May 2020 15:34:46 +0000 (UTC)
Received: by mail-ej1-x631.google.com with SMTP id e2so1671666eje.13
 for <nouveau@lists.freedesktop.org>; Wed, 06 May 2020 08:34:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=1hcOUt+crf8Hu2ZASsFqkLNcNeRhJGAWPRRb/oIs3d8=;
 b=gIrbG0Ar5evRNd99jZGOXTXpRrJHTkvC+d7FcdXoNtQCIcUm2QZYd9MNpMmjexNYi3
 2Ga6Q78PpWHCzCFBUgBGSOXQnQgRpUTt45jtg4BX2qU2wC3HRcVYtOXrKVSuH19E9smC
 SJe0uL35G5JNaZFsLUq5fj7XcIB/nNbBqQLsoQEyQPnAfLQJSxXgbAOd5G96OYnK61fq
 6OiGyu4rtSFAfvw3CITkTvTe2l1liFt9i5O2Y/Zt+FK0Ktp5xj6O04AoYDEHpEwi2g7Z
 aZ4Lld9sR4WOO9Ho3snW/h35k27WznxicUq/bIHA8u3BS3jsWyy2oVMMMvrJyAX1y+4E
 jNTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=1hcOUt+crf8Hu2ZASsFqkLNcNeRhJGAWPRRb/oIs3d8=;
 b=VRH5/Rjp2mAGII5ZEFL+AXZyLdKv2vLA062IRYnYdJVfCjGBpL/U64AE0lD2itwO/m
 Y9uPLyxw8I8AcrVw9DdTRbiOSNruDJ4aWsfYVTlRJTPaW7ipH8OLdAqSCgWGAgrf7Lg5
 yI26j9IJ/UavIXZ0tyHjxIE4jBlxbPh9hBYIWXDO40/RpjGtFNIVi7uKybiKf9ogwZpk
 yu6F64unhXiPr6zapg2aY7DLP8dRE5dcPigOWnzov2aAl/IDUhaLxjdqI8+fmqiUx1g6
 Yzkn1bCw7nURuS2q/7mRqDuoIg7H9XRRDU/FyUfhaYad2iGzfew1uozgXueD8Na4W67v
 PTGA==
X-Gm-Message-State: AGi0Puad9rHawkiatp1tc7tRuAmMnNNYPu5fh+1DTsH0XqtC3IkLJFdQ
 l8pwSF4EeMyGEEzjd+buyDkKNYShm9aTg7oo+a0=
X-Google-Smtp-Source: APiQypIRNf9xRe+GN/2z2h0m9De6ioaa3SntY7MkRS5fFyDtvYu+mJOgh1O+/OGDmDfoGrqbowXmH/sAG4XERh1jzOA=
X-Received: by 2002:a17:906:7743:: with SMTP id
 o3mr8173424ejn.120.1588779284250; 
 Wed, 06 May 2020 08:34:44 -0700 (PDT)
MIME-Version: 1.0
References: <CAFCWPP+WKRhhXG3CRfqRztWbFJwUqeeY6tiip4fT9gwtyjKNwQ@mail.gmail.com>
 <CAKb7UvhNDFKHkOV8p0v8cVHf7cMadNLVKi0iD_mCZnH_j5=2OA@mail.gmail.com>
 <CAFCWPP+WmbjM0O2T9ODi-iVU1qGXjpk9V9LeE9PsuT7t+APLQA@mail.gmail.com>
 <CAKb7Uvj6nMk2U6MD-iMXEWQzc4ok2xxuq7K3C8ti6mfFDqhuDw@mail.gmail.com>
 <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
In-Reply-To: <e681b4315b596dca39bb4a28866d509e23a150c1.camel@lynxeye.de>
From: =?UTF-8?B?TWlsYW4gQnXFoWth?= <milan.buska@gmail.com>
Date: Wed, 6 May 2020 17:34:17 +0200
Message-ID: <CAFCWPP+3Lu8rF64PEbN8m2aeqKbKhB8aBtdEm0Rsi4p9KqA6VA@mail.gmail.com>
To: Lucas Stach <dev@lynxeye.de>
Subject: Re: [Nouveau] GeForce(R) GT 710 1GB PCIE x 1 on arm64
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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

c3QgNi4gNS4gMjAyMCB2IDE2OjM5IG9kZXPDrWxhdGVsIEx1Y2FzIFN0YWNoIDxkZXZAbHlueGV5
ZS5kZT4gbmFwc2FsOgo+Cj4gQW0gTWl0dHdvY2gsIGRlbiAwNi4wNS4yMDIwLCAxMDoyNiAtMDQw
MCBzY2hyaWViIElsaWEgTWlya2luOgo+ID4gW3BsZWFzZSBrZWVwIGxpc3QgY2MnZCBpbiB5b3Vy
IHJlcGxpZXNdCj4gPgo+ID4gT24gV2VkLCBNYXkgNiwgMjAyMCBhdCAxMDoxNSBBTSBNaWxhbiBC
dcWha2EgPG1pbGFuLmJ1c2thQGdtYWlsLmNvbT4gd3JvdGU6Cj4gPiA+IFsgICAgMC4wMDAwMDBd
IExpbnV4IHZlcnNpb24gNS42LjEwLXpvdGFjIChyb290QHNhdXgpIChnY2MgdmVyc2lvbiA5LjMu
MCAoU0FVWCBBYXJjaDY0KSkgIzEgU01QIFBSRUVNUFQgVHVlIE1heSA1IDIyOjE2OjQwIENFU1Qg
MjAyMAo+ID4gPiBbICAgIDAuMDAwMDAwXSBNYWNoaW5lIG1vZGVsOiBOVklESUEgSmV0c29uIFRY
MiBEZXZlbG9wZXIgS2l0Cj4gPgo+ID4gWy4uLl0KPiA+Cj4gPiA+IFsgICAgMy45NjU5MzRdIHRl
Z3JhLXBjaWUgMTAwMDMwMDAucGNpZTogQWRkaW5nIHRvIGlvbW11IGdyb3VwIDUKPiA+ID4gWyAg
ICAzLjk2NjQzNV0gdGVncmEtcGNpZSAxMDAwMzAwMC5wY2llOiA0eDEsIDF4MSBjb25maWd1cmF0
aW9uCj4gPiA+IFsgICAgMy45NjgwNTddIHRlZ3JhLXBjaWUgMTAwMDMwMDAucGNpZTogcHJvYmlu
ZyBwb3J0IDAsIHVzaW5nIDQgbGFuZXMKPiA+ID4gWyAgICAzLjk3MDEyMV0gdGVncmEtcGNpZSAx
MDAwMzAwMC5wY2llOiBwcm9iaW5nIHBvcnQgMSwgdXNpbmcgMCBsYW5lcwo+ID4gPiBbICAgIDMu
OTcyMTgzXSB0ZWdyYS1wY2llIDEwMDAzMDAwLnBjaWU6IHByb2JpbmcgcG9ydCAyLCB1c2luZyAx
IGxhbmVzCj4gPiA+IFsgICAgNS4yNjAzMTZdIHRlZ3JhLXBjaWUgMTAwMDMwMDAucGNpZTogbGlu
ayAxIGRvd24sIGlnbm9yaW5nCj4gPiA+IFsgICAgNi40Nzk0MTBdIHRlZ3JhLXBjaWUgMTAwMDMw
MDAucGNpZTogbGluayAyIGRvd24sIGlnbm9yaW5nCj4gPiA+IFsgICAgNi40Nzk1NzldIHRlZ3Jh
LXBjaWUgMTAwMDMwMDAucGNpZTogUENJIGhvc3QgYnJpZGdlIHRvIGJ1cyAwMDAwOjAwCj4gPiA+
IFsgICAgNi40Nzk2MDJdIHBjaV9idXMgMDAwMDowMDogcm9vdCBidXMgcmVzb3VyY2UgW2lvICAw
eDAwMDAtMHhmZmZmXQo+ID4gPiBbICAgIDYuNDc5NjI3XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3Qg
YnVzIHJlc291cmNlIFttZW0gMHg1MDEwMDAwMC0weDU3ZmZmZmZmXQo+ID4gPiBbICAgIDYuNDc5
NjQ2XSBwY2lfYnVzIDAwMDA6MDA6IHJvb3QgYnVzIHJlc291cmNlIFttZW0gMHg1ODAwMDAwMC0w
eDdmZmZmZmZmIHByZWZdCj4gPiA+IFsgICAgNi40Nzk2NjhdIHBjaV9idXMgMDAwMDowMDogcm9v
dCBidXMgcmVzb3VyY2UgW2J1cyAwMC1mZl0KPiA+ID4gWyAgICA2LjQ3OTg1MF0gcGNpIDAwMDA6
MDA6MDEuMDogWzEwZGU6MTBlNV0gdHlwZSAwMSBjbGFzcyAweDA2MDQwMAo+ID4gPiBbICAgIDYu
NDc5ODg3XSBwY2lfYnVzIDAwMDA6MDA6IDItYnl0ZSBjb25maWcgd3JpdGUgdG8gMDAwMDowMDow
MS4wIG9mZnNldCAweDQgbWF5IGNvcnJ1cHQgYWRqYWNlbnQgUlcxQyBiaXRzCj4gPiA+IFsgICAg
Ni40Nzk5MTZdIHBjaV9idXMgMDAwMDowMDogMi1ieXRlIGNvbmZpZyB3cml0ZSB0byAwMDAwOjAw
OjAxLjAgb2Zmc2V0IDB4NCBtYXkgY29ycnVwdCBhZGphY2VudCBSVzFDIGJpdHMKPiA+ID4gWyAg
ICA2LjQ3OTk5M10gcGNpX2J1cyAwMDAwOjAwOiAyLWJ5dGUgY29uZmlnIHdyaXRlIHRvIDAwMDA6
MDA6MDEuMCBvZmZzZXQgMHgzZSBtYXkgY29ycnVwdCBhZGphY2VudCBSVzFDIGJpdHMKPiA+ID4g
WyAgICA2LjQ4MDA0MV0gcGNpX2J1cyAwMDAwOjAwOiAyLWJ5dGUgY29uZmlnIHdyaXRlIHRvIDAw
MDA6MDA6MDEuMCBvZmZzZXQgMHg1MiBtYXkgY29ycnVwdCBhZGphY2VudCBSVzFDIGJpdHMKPiA+
ID4gWyAgICA2LjQ4MDExOF0gcGNpIDAwMDA6MDA6MDEuMDogUE1FIyBzdXBwb3J0ZWQgZnJvbSBE
MCBEMSBEMiBEM2hvdCBEM2NvbGQKPiA+ID4gWyAgICA2LjQ4MDE0MV0gcGNpX2J1cyAwMDAwOjAw
OiAyLWJ5dGUgY29uZmlnIHdyaXRlIHRvIDAwMDA6MDA6MDEuMCBvZmZzZXQgMHg0YyBtYXkgY29y
cnVwdCBhZGphY2VudCBSVzFDIGJpdHMKPiA+ID4gWyAgICA2LjQ4MjQ4NV0gcGNpIDAwMDA6MDA6
MDEuMDogYnJpZGdlIGNvbmZpZ3VyYXRpb24gaW52YWxpZCAoW2J1cyAwMC0wMF0pLCByZWNvbmZp
Z3VyaW5nCj4gPiA+IFsgICAgNi40ODI1MjFdIHBjaV9idXMgMDAwMDowMDogMi1ieXRlIGNvbmZp
ZyB3cml0ZSB0byAwMDAwOjAwOjAxLjAgb2Zmc2V0IDB4M2UgbWF5IGNvcnJ1cHQgYWRqYWNlbnQg
UlcxQyBiaXRzCj4gPiA+IFsgICAgNi40ODI1NzZdIHBjaV9idXMgMDAwMDowMDogMi1ieXRlIGNv
bmZpZyB3cml0ZSB0byAwMDAwOjAwOjAxLjAgb2Zmc2V0IDB4M2UgbWF5IGNvcnJ1cHQgYWRqYWNl
bnQgUlcxQyBiaXRzCj4gPiA+IFsgICAgNi40ODI2MDddIHBjaV9idXMgMDAwMDowMDogMi1ieXRl
IGNvbmZpZyB3cml0ZSB0byAwMDAwOjAwOjAxLjAgb2Zmc2V0IDB4M2UgbWF5IGNvcnJ1cHQgYWRq
YWNlbnQgUlcxQyBiaXRzCj4gPiA+IFsgICAgNi40ODI2MzVdIHBjaV9idXMgMDAwMDowMDogMi1i
eXRlIGNvbmZpZyB3cml0ZSB0byAwMDAwOjAwOjAxLjAgb2Zmc2V0IDB4NiBtYXkgY29ycnVwdCBh
ZGphY2VudCBSVzFDIGJpdHMKPiA+ID4gWyAgICA2LjQ4Mjc5NF0gcGNpIDAwMDA6MDE6MDAuMDog
WzEwZGU6MTI4Yl0gdHlwZSAwMCBjbGFzcyAweDAzMDAwMAo+ID4gPiBbICAgIDYuNDgyOTMxXSBw
Y2kgMDAwMDowMTowMC4wOiByZWcgMHgxMDogW21lbSAweDAwMDAwMDAwLTB4MDBmZmZmZmZdCj4g
PiA+IFsgICAgNi40ODI5NzZdIHBjaSAwMDAwOjAxOjAwLjA6IHJlZyAweDE0OiBbbWVtIDB4MDAw
MDAwMDAtMHgwN2ZmZmZmZiA2NGJpdCBwcmVmXQo+ID4gPiBbICAgIDYuNDgzMDIyXSBwY2kgMDAw
MDowMTowMC4wOiByZWcgMHgxYzogW21lbSAweDAwMDAwMDAwLTB4MDFmZmZmZmYgNjRiaXQgcHJl
Zl0KPiA+ID4gWyAgICA2LjQ4MzA1Nl0gcGNpIDAwMDA6MDE6MDAuMDogcmVnIDB4MjQ6IFtpbyAg
MHgwMDAwLTB4MDA3Zl0KPiA+ID4gWyAgICA2LjQ4MzA4N10gcGNpIDAwMDA6MDE6MDAuMDogcmVn
IDB4MzA6IFttZW0gMHgwMDAwMDAwMC0weDAwMDdmZmZmIHByZWZdCj4gPiA+IFsgICAgNi40ODMz
MTNdIHBjaSAwMDAwOjAxOjAwLjA6IDQuMDAwIEdiL3MgYXZhaWxhYmxlIFBDSWUgYmFuZHdpZHRo
LCBsaW1pdGVkIGJ5IDUgR1QvcyB4MSBsaW5rIGF0IDAwMDA6MDA6MDEuMCAoY2FwYWJsZSBvZiAz
Mi4wMDAgR2IvcyB3aXRoIDUgR1QvcyB4OCBsaW5rKQo+ID4gPiBbICAgIDYuNDgzNDYzXSBwY2kg
MDAwMDowMTowMC4wOiB2Z2FhcmI6IFZHQSBkZXZpY2UgYWRkZWQ6IGRlY29kZXM9aW8rbWVtLG93
bnM9bm9uZSxsb2Nrcz1ub25lCj4gPiA+IFsgICAgNi40ODM1NTZdIHBjaSAwMDAwOjAxOjAwLjE6
IFsxMGRlOjBlMGZdIHR5cGUgMDAgY2xhc3MgMHgwNDAzMDAKPiA+ID4gWyAgICA2LjQ4MzY0OF0g
cGNpIDAwMDA6MDE6MDAuMTogcmVnIDB4MTA6IFttZW0gMHgwMDAwMDAwMC0weDAwMDAzZmZmXQo+
ID4gPiBbICAgIDYuNDg1MzQ0XSBwY2lfYnVzIDAwMDA6MDE6IGJ1c25fcmVzOiBbYnVzIDAxLWZm
XSBlbmQgaXMgdXBkYXRlZCB0byAwMQo+ID4gPiBbICAgIDYuNDg1MzY4XSBwY2lfYnVzIDAwMDA6
MDA6IDEtYnl0ZSBjb25maWcgd3JpdGUgdG8gMDAwMDowMDowMS4wIG9mZnNldCAweDFhIG1heSBj
b3JydXB0IGFkamFjZW50IFJXMUMgYml0cwo+ID4gPiBbICAgIDYuNDg1NDExXSBwY2kgMDAwMDow
MDowMS4wOiBCQVIgMTU6IGFzc2lnbmVkIFttZW0gMHg1ODAwMDAwMC0weDYzZmZmZmZmIDY0Yml0
IHByZWZdCj4gPiA+IFsgICAgNi40ODU0MzFdIHBjaSAwMDAwOjAwOjAxLjA6IEJBUiAxNDogYXNz
aWduZWQgW21lbSAweDUwODAwMDAwLTB4NTFmZmZmZmZdCj4gPiA+IFsgICAgNi40ODU0NDhdIHBj
aSAwMDAwOjAwOjAxLjA6IEJBUiAxMzogYXNzaWduZWQgW2lvICAweDEwMDAtMHgxZmZmXQo+ID4g
PiBbICAgIDYuNDg1NDcxXSBwY2kgMDAwMDowMTowMC4wOiBCQVIgMTogYXNzaWduZWQgW21lbSAw
eDU4MDAwMDAwLTB4NWZmZmZmZmYgNjRiaXQgcHJlZl0KPiA+ID4gWyAgICA2LjQ4NTUxMF0gcGNp
IDAwMDA6MDE6MDAuMDogQkFSIDM6IGFzc2lnbmVkIFttZW0gMHg2MDAwMDAwMC0weDYxZmZmZmZm
IDY0Yml0IHByZWZdCj4gPiA+IFsgICAgNi40ODU1NDddIHBjaSAwMDAwOjAxOjAwLjA6IEJBUiAw
OiBhc3NpZ25lZCBbbWVtIDB4NTEwMDAwMDAtMHg1MWZmZmZmZl0KPiA+ID4gWyAgICA2LjQ4NTU2
OV0gcGNpIDAwMDA6MDE6MDAuMDogQkFSIDY6IGFzc2lnbmVkIFttZW0gMHg1MDgwMDAwMC0weDUw
ODdmZmZmIHByZWZdCj4gPiA+IFsgICAgNi40ODU1ODhdIHBjaSAwMDAwOjAxOjAwLjE6IEJBUiAw
OiBhc3NpZ25lZCBbbWVtIDB4NTA4ODAwMDAtMHg1MDg4M2ZmZl0KPiA+ID4gWyAgICA2LjQ4NTYx
MF0gcGNpIDAwMDA6MDE6MDAuMDogQkFSIDU6IGFzc2lnbmVkIFtpbyAgMHgxMDAwLTB4MTA3Zl0K
PiA+ID4gWyAgICA2LjQ4NTYzMV0gcGNpIDAwMDA6MDA6MDEuMDogUENJIGJyaWRnZSB0byBbYnVz
IDAxXQo+ID4gPiBbICAgIDYuNDg1NjQ4XSBwY2kgMDAwMDowMDowMS4wOiAgIGJyaWRnZSB3aW5k
b3cgW2lvICAweDEwMDAtMHgxZmZmXQo+ID4gPiBbICAgIDYuNDg1NjY4XSBwY2kgMDAwMDowMDow
MS4wOiAgIGJyaWRnZSB3aW5kb3cgW21lbSAweDUwODAwMDAwLTB4NTFmZmZmZmZdCj4gPiA+IFsg
ICAgNi40ODU2OTFdIHBjaSAwMDAwOjAwOjAxLjA6ICAgYnJpZGdlIHdpbmRvdyBbbWVtIDB4NTgw
MDAwMDAtMHg2M2ZmZmZmZiA2NGJpdCBwcmVmXQo+ID4gPiBbICAgIDYuNDg1NzYwXSBwY2kgMDAw
MDowMDowMS4wOiBudl9tc2lfaHRfY2FwX3F1aXJrIGRpZG4ndCBsb2NhdGUgaG9zdCBicmlkZ2UK
PiA+ID4gWyAgICA2LjQ4NTg1N10gcGNpZXBvcnQgMDAwMDowMDowMS4wOiBBZGRpbmcgdG8gaW9t
bXUgZ3JvdXAgNQo+ID4gPiBbICAgIDYuNDg1OTMwXSBwY2llcG9ydCAwMDAwOjAwOjAxLjA6IGVu
YWJsaW5nIGRldmljZSAoMDAwMCAtPiAwMDAzKQo+ID4gPiBbICAgIDYuNDg2MDUxXSBwY2llcG9y
dCAwMDAwOjAwOjAxLjA6IFBNRTogU2lnbmFsaW5nIHdpdGggSVJRIDQwCj4gPiA+IFsgICAgNi40
ODYzNzhdIHBjaWVwb3J0IDAwMDA6MDA6MDEuMDogQUVSOiBlbmFibGVkIHdpdGggSVJRIDQwCj4g
PiA+IFsgICAgNi40ODY3MTRdIHBjaSAwMDAwOjAxOjAwLjE6IEQwIHBvd2VyIHN0YXRlIGRlcGVu
ZHMgb24gMDAwMDowMTowMC4wCj4gPgo+ID4gSG0sIEkgY2FuJ3Qgc2F5IHRoYXQgSSd2ZSBldmVy
IHNlZW4gdGhhdCAiMi1ieXRlIGNvbmZpZyB3cml0ZSIgZXJyb3JzLgo+ID4gSG93ZXZlciBpdCBk
b2VzIGFwcGVhciB0byBoYXZlIGFzc2lnbmVkIHRoZSBCQVJzIGNvcnJlY3RseSwgc28gdGhlcmUn
cwo+ID4gdGhhdC4KPiA+Cj4gPiA+IFsgICAxMi44ODU4NjZdIG5vdXZlYXUgMDAwMDowMTowMC4w
OiBBZGRpbmcgdG8gaW9tbXUgZ3JvdXAgNQo+ID4gPiBbICAgMTIuODkxMzczXSBub3V2ZWF1IDAw
MDA6MDE6MDAuMDogZW5hYmxpbmcgZGV2aWNlICgwMDAwIC0+IDAwMDMpCj4gPiA+IFsgICAxMi44
OTc2MTldIG5vdXZlYXUgMDAwMDowMTowMC4wOiBOVklESUEgR0syMDhCIChiMDYwYjBiMSkKPiA+
ID4gWyAgIDEzLjA4NjY4Ml0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IGJpb3M6IHZlcnNpb24gODAu
MjguYTYuMDAuMTAKPiA+ID4gWyAgIDEzLjI4ODYyNl0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IGZi
OiAxMDI0IE1pQiBERFIzCj4gPiA+IFsgICAxNC43NDk1NDJdIFtUVE1dIFpvbmUgIGtlcm5lbDog
QXZhaWxhYmxlIGdyYXBoaWNzIG1lbW9yeTogMzk4NjI3MiBLaUIKPiA+ID4gWyAgIDE0Ljc1NjA5
Nl0gW1RUTV0gWm9uZSAgIGRtYTMyOiBBdmFpbGFibGUgZ3JhcGhpY3MgbWVtb3J5OiAyMDk3MTUy
IEtpQgo+ID4gPiBbICAgMTQuNzYyNjI2XSBbVFRNXSBJbml0aWFsaXppbmcgcG9vbCBhbGxvY2F0
b3IKPiA+ID4gWyAgIDE0Ljc2Njk5OV0gW1RUTV0gSW5pdGlhbGl6aW5nIERNQSBwb29sIGFsbG9j
YXRvcgo+ID4gPiBbICAgMTQuNzcxNzUwXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBWUkFN
OiAxMDI0IE1pQgo+ID4gPiBbICAgMTQuNzc2ODA4XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJN
OiBHQVJUOiAxMDQ4NTc2IE1pQgo+ID4gPiBbICAgMTQuNzgyMTQ3XSBub3V2ZWF1IDAwMDA6MDE6
MDAuMDogRFJNOiBUTURTIHRhYmxlIHZlcnNpb24gMi4wCj4gPiA+IFsgICAxNC43ODc5MDVdIG5v
dXZlYXUgMDAwMDowMTowMC4wOiBEUk06IERDQiB2ZXJzaW9uIDQuMAo+ID4gPiBbICAgMTQuNzkz
MDUzXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0Igb3V0cCAwMDogMDEwMDBmMDIgMDAw
MjAwMzAKPiA+ID4gWyAgIDE0Ljc5OTUwNF0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogRENC
IG91dHAgMDE6IDAyMDExZjYyIDAwMDIwMDEwCj4gPiA+IFsgICAxNC44MDU5NDhdIG5vdXZlYXUg
MDAwMDowMTowMC4wOiBEUk06IERDQiBvdXRwIDAyOiAwMjAyMmYxMCAwMDAwMDAwMAo+ID4gPiBb
ICAgMTQuODEyMzkzXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBEQ0IgY29ubiAwMDogMDAw
MDEwMzEKPiA+ID4gWyAgIDE0LjgxODA1Nl0gbm91dmVhdSAwMDAwOjAxOjAwLjA6IERSTTogRENC
IGNvbm4gMDE6IDAwMDAyMTYxCj4gPiA+IFsgICAxNC44MjM3MjRdIG5vdXZlYXUgMDAwMDowMTow
MC4wOiBEUk06IERDQiBjb25uIDAyOiAwMDAwMDIwMAo+ID4gPiBbICAgMTQuODMxOTc3XSBub3V2
ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBNTTogdXNpbmcgQ09QWSBmb3IgYnVmZmVyIGNvcGllcwo+
ID4gPiBbICAgMTQuODQxNjkwXSBbZHJtXSBTdXBwb3J0cyB2YmxhbmsgdGltZXN0YW1wIGNhY2hp
bmcgUmV2IDIgKDIxLjEwLjIwMTMpLgo+ID4gPiBbICAgMTQuODQ4MzIyXSBbZHJtXSBEcml2ZXIg
c3VwcG9ydHMgcHJlY2lzZSB2YmxhbmsgdGltZXN0YW1wIHF1ZXJ5Lgo+ID4gPiBbICAgMTUuMTM2
NjQ3XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBhbGxvY2F0ZWQgMTkyMHgxMDgwIGZiOiAw
eDgwMDAwLCBibyAwMDAwMDAwMGQ1MzI0MWU0Cj4gPiA+IFsgICAxNy4xNDY5MjldIG5vdXZlYXUg
MDAwMDowMTowMC4wOiBEUk06IGNvcmUgbm90aWZpZXIgdGltZW91dAo+ID4gPiBbICAgMTkuMTQ2
ODQ2XSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJNOiBiYXNlLTA6IHRpbWVvdXQKPiA+ID4gWyAg
IDE5LjE0NzU1NF0gQ29uc29sZTogc3dpdGNoaW5nIHRvIGNvbG91ciBmcmFtZSBidWZmZXIgZGV2
aWNlIDI0MHg2Nwo+ID4gPiBbICAgMTkuNDQ2MzExXSBub3V2ZWF1IDAwMDA6MDE6MDAuMDogRFJN
OiBHUFUgbG9ja3VwIC0gc3dpdGNoaW5nIHRvIHNvZnR3YXJlIGZiY29uCj4gPiA+IFsgICAxOS41
MDEwNDNdIG5vdXZlYXUgMDAwMDowMTowMC4wOiBmYjA6IG5vdXZlYXVkcm1mYiBmcmFtZSBidWZm
ZXIgZGV2aWNlCj4gPiA+IFsgICAxOS41MjM0NzFdIFtkcm1dIEluaXRpYWxpemVkIG5vdXZlYXUg
MS4zLjEgMjAxMjA4MDEgZm9yIDAwMDA6MDE6MDAuMCBvbiBtaW5vciAwCj4gPgo+ID4gU28gdGhh
dCAiY29yZSBub3RpZmllciB0aW1lb3V0IiBhbmQgc3Vic2VxdWVudCBHUFUgbG9ja3VwIGluZGlj
YXRlCj4gPiB0aGF0IHNvbWV0aGluZydzIGFtaXNzLiBNb3N0IG9mIHRoZSBpbml0aWFsaXphdGlv
biB3YXMgYWJsZSB0byBiZQo+ID4gY29tcGxldGVkLCBpbmNsdWRpbmcgcmVhZGluZyBFRElEIGZy
b20geW91ciBtb25pdG9yIChoZW5jZSB0aGUKPiA+IG5vbi1kZWZhdWx0IHJlc29sdXRpb24pLCBi
dXQgd2UncmUgbm90IHNlZWluZyB2YWx1ZXMgY2hhbmdlIHByb3Blcmx5IC8KPiA+IG1pc3Npbmcg
bm90aWZpY2F0aW9ucy4gSSdtIGFjdHVhbGx5IHdvbmRlcmluZyBpZiB3ZSBhcmVuJ3QKPiA+IGlu
aXRpYWxpemluZyB0aGUgR1BVIGJlY2F1c2Ugd2UgdGhpbmsgaXQncyBhbHJlYWR5IGluaXRpYWxp
emVkLiBDb3VsZAo+ID4geW91IGJvb3Qgd2l0aCBub3V2ZWF1LmNvbmZpZz1OdkZvcmNlUG9zdD0x
IGFuZCBzZWUgaWYgdGhhdCBoZWxwcz8KPgo+IE5vdGUgdGhhdCBQQ0llIGlzIG5vbi1jb2hlcmVu
dCBvbiBtb3N0IEFSTSBkZXZpY2VzIChpbmNsdWRpbmcgVGVncmEgVFgyCj4gSUlSQyksIHNvIGlm
IHRoZSBub3RpZmllciBCTyBpc24ndCBtYXBwZWQgYXMgdW5jYWNoZWQgbWVtb3J5LCB5b3UKPiBw
cm9iYWJseSB3b24ndCBzZWUgdGhlIGV4cGVjdGVkIG5vdGlmaWVyIGNvbnRlbnQsIGFzIHlvdSBh
cmUgcmVhZGluZwo+IHN0YWxlIGNhY2hlIGxpbmUgY29udGVudC4KPgo+IFJlZ2FyZHMsCj4gTHVj
YXMKPgoKU28gZnVydGhlciBleHBlcmltZW50cyB3aXRoIHRoaXMgY2FyZCBpcyBqdXN0IGEgd2Fz
dGUgb2YgdGltZSBhbmQKdW5uZWNlc3Nhcnkgd29yay4KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0
cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9s
aXN0aW5mby9ub3V2ZWF1Cg==
