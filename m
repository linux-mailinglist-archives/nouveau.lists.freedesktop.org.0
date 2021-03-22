Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 46CE93444CE
	for <lists+nouveau@lfdr.de>; Mon, 22 Mar 2021 14:09:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91DE88EF3;
	Mon, 22 Mar 2021 13:09:01 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7072C89D66;
 Mon, 22 Mar 2021 08:12:48 +0000 (UTC)
IronPort-SDR: tTSiCP9eEN7oFeKajwL+sxNZZoDTUUoFcCCibOtEVWEtCj608EPjKdag2lYDUK4j7ztt2CDSNW
 doO1+Ey7DZ9Q==
X-IronPort-AV: E=McAfee;i="6000,8403,9930"; a="190316952"
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="190316952"
Received: from fmsmga006.fm.intel.com ([10.253.24.20])
 by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 22 Mar 2021 01:12:47 -0700
IronPort-SDR: zKixfc3Vge6cvAaLIENhIUNu4vXi7DkRIZINrRSGKxUMNweT7bYEiYxIeZsvuXqTsuds20zoZS
 heBCPKp8AeVg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.81,268,1610438400"; d="scan'208";a="603812990"
Received: from irsmsx602.ger.corp.intel.com ([163.33.146.8])
 by fmsmga006.fm.intel.com with ESMTP; 22 Mar 2021 01:12:45 -0700
Received: from irsmsx603.ger.corp.intel.com (163.33.146.9) by
 irsmsx602.ger.corp.intel.com (163.33.146.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2106.2; Mon, 22 Mar 2021 08:12:45 +0000
Received: from irsmsx603.ger.corp.intel.com ([163.33.146.9]) by
 irsmsx603.ger.corp.intel.com ([163.33.146.9]) with mapi id 15.01.2106.013;
 Mon, 22 Mar 2021 08:12:45 +0000
From: "Saarinen, Jani" <jani.saarinen@intel.com>
To: "juhapekka.heikkila@gmail.com" <juhapekka.heikkila@gmail.com>, "Martin
 Peres" <martin.peres@mupuf.org>, Lyude <lyude@redhat.com>,
 "igt-dev@lists.freedesktop.org" <igt-dev@lists.freedesktop.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: [igt-dev] [PATCH i-g-t] tests/kms_plane: Don't unset primary_fb
 when testing other planes
Thread-Index: AQHXG38ZEUebd1vC2UKjn8iHnfkKgKqJTIIAgAWW2QCAAMvKUA==
Date: Mon, 22 Mar 2021 08:12:44 +0000
Message-ID: <60064b4df632422fb1ee5782605b19d0@intel.com>
References: <20210317224407.447572-1-lyude@redhat.com>
 <f5554f76-fc26-e307-0fe0-e59d3bca15ba@mupuf.org>
 <3c1b6581-9b61-4e1a-56bd-95c8a2ec6472@gmail.com>
In-Reply-To: <3c1b6581-9b61-4e1a-56bd-95c8a2ec6472@gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
dlp-version: 11.5.1.3
dlp-reaction: no-action
dlp-product: dlpe-windows
x-originating-ip: [163.33.253.164]
MIME-Version: 1.0
X-Mailman-Approved-At: Mon, 22 Mar 2021 13:09:01 +0000
Subject: Re: [Nouveau] [igt-dev] [PATCH i-g-t] tests/kms_plane: Don't unset
 primary_fb when testing other planes
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
Cc: Ben Skeggs <bskeggs@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGksIA0KDQo+IC0tLS0tT3JpZ2luYWwgTWVzc2FnZS0tLS0tDQo+IEZyb206IGlndC1kZXYgPGln
dC1kZXYtYm91bmNlc0BsaXN0cy5mcmVlZGVza3RvcC5vcmc+IE9uIEJlaGFsZiBPZiBKdWhhLVBl
a2thDQo+IEhlaWtraWxhDQo+IFNlbnQ6IHN1bm51bnRhaSAyMS4gbWFhbGlza3V1dGEgMjAyMSAy
Mi4wMw0KPiBUbzogTWFydGluIFBlcmVzIDxtYXJ0aW4ucGVyZXNAbXVwdWYub3JnPjsgTHl1ZGUg
PGx5dWRlQHJlZGhhdC5jb20+OyBpZ3QtDQo+IGRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmc7IG5v
dXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRpbi5w
ZXJlc0BmcmVlLmZyPjsgQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29tPg0KPiBTdWJqZWN0
OiBSZTogW2lndC1kZXZdIFtQQVRDSCBpLWctdF0gdGVzdHMva21zX3BsYW5lOiBEb24ndCB1bnNl
dCBwcmltYXJ5X2ZiIHdoZW4NCj4gdGVzdGluZyBvdGhlciBwbGFuZXMNCj4gDQo+IE9uIDE4LjMu
MjAyMSA4LjQxLCBNYXJ0aW4gUGVyZXMgd3JvdGU6DQo+ID4gT24gMTgvMDMvMjAyMSAwMDo0NCwg
THl1ZGUgd3JvdGU6DQo+ID4+IEZyb206IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQo+
ID4+DQo+ID4+IEN1cnJlbnRseSwgbm91dmVhdSBkb2Vzbid0IHN1cHBvcnQgaGF2aW5nIGEgQ1JU
QyB3aXRob3V0IGEgcHJpbWFyeSBGQg0KPiA+PiBzZXQuIFdlIHdvbid0IHJlamVjdCBzdWNoIGNv
bmZpZ3VyYXRpb25zLCBidXQgdGhlIGJlaGF2aW9yIGlzDQo+ID4+IHVuZGVmaW5lZCB3aGljaCB3
aWxsIGNhdXNlIENSQ3MgdG8gYmVjb21lIHVuZGVmaW5lZC4gU28sIGF2b2lkDQo+ID4+IGNsZWFy
aW5nIHRoZSBwcmltYXJ5IEZCIHdoaWxlIHdlJ3JlIHRlc3Rpbmcgbm9uLXByaW1hcnkgcGxhbmVz
Lg0KPiA+DQo+ID4gTG9va3MgZ29vZCB0byBtZToNCj4gPg0KPiA+IFJldmlld2VkLWJ5OiBNYXJ0
aW4gUGVyZXMgPG1hcnRpbi5wZXJlc0BtdXB1Zi5vcmc+DQo+ID4NCj4gDQo+IFRoaXMgZG9lc24n
dCBsb29rIGdvb2QgYXQgYWxsLiBDb2RlIGNoYW5nZXMgd2VyZSBuZXZlciBydW4gb24gY2ksIHNl
ZSB0aGlzOg0KPiBodHRwczovL2ludGVsLWdmeC1jaS4wMS5vcmcvdHJlZS9kcm0tdGlwL0lHVFBX
XzU2MTQvc2hhcmRzLQ0KPiBhbGwuaHRtbD90ZXN0ZmlsdGVyPWttc19wbGFuZUBwaXhlbC1mb3Jt
YXQNCj4gDQo+IFRoaXMgaGFwcGVuIGJlY2F1c2Ugb2Y6DQo+IGlndC1ncHUtdG9vbHMkIGdpdCBi
bGFtZSB0ZXN0cy9pbnRlbC1jaS9ibGFja2xpc3QtcHJlLW1lcmdlLnR4dCAtTCAxNzMsKzENCj4g
M2U2ODYwOThkOSAoTWFydGluIFBlcmVzIDIwMjAtMDItMjEgMTE6MDA6NDcgKzAyMDAgMTczKSBp
Z3RAa21zX3BsYW5lQHBpeGVsLQ0KPiBmb3JtYXQtcGlwZS1bYS1kXS1wbGFuZXMoLXNvdXJjZS1j
bGFtcGluZyk/DQo+IA0KPiBZb3UnbGwgbmVlZCB0byBpbmNsdWRlIHNvbWV0aGluZyBsaWtlIHRo
aXMgdG8gdGVzdCBhbmQgcmV2aWV3IHdoYXQgZGlkIGNoYW5nZSBvbiBwaXhlbA0KPiBmb3JtYXQg
dGVzdHM6DQo+IGh0dHBzOi8vcGF0Y2h3b3JrLmZyZWVkZXNrdG9wLm9yZy9wYXRjaC80MDQ3MDYv
P3Nlcmllcz04NDM3MCZyZXY9MQ0KPiANCj4gYnV0IGFzIHRoaXMgcGF0Y2ggc2VlbXMgdG8gYmUg
YWxyZWFkeSBtZXJnZWQgYXMgdW50ZXN0ZWQgd2Ugbm93IGhhdmUgcGl4ZWwgZm9ybWF0DQo+IHRl
c3RzIGZhaWxpbmcgcmVsaWFibHkgZXZlciBzaW5jZToNCj4gaHR0cHM6Ly9pbnRlbC1nZngtY2ku
MDEub3JnL3RyZWUvZHJtLXRpcC9pbmRleC5odG1sP3Rlc3RmaWx0ZXI9a21zX3BsYW5lQHBpeGVs
LQ0KPiBmb3JtYXQmaG9zdHM9dGdsJTdDaWNsDQo+IA0KPiBJIGhhdmUgb25seSBpbnRlbCBpY2wg
YXQgaGFuZCBzbyBJIGhhdmUgbm8gc3VnZ2VzdGlvbnMgZm9yIGZpeC4gVGhvdWdoLCBsb29raW5n
IGF0IHRob3NlDQo+IGZhaWx1cmVzIFN0YW4gKENDZCkgbWF5IGhhdmUgc29tZSBpbnRlcmVzdCBv
biB0aGVtLg0KQ2FuIHdlIGp1c3Qgc2ltcGx5IHJldmVydCB1bnRpbCBmaXhlZCBwcm9wZXJseT8g
DQoNCg0KPiANCj4gL0p1aGEtUGVra2ENCj4gDQo+ID4+DQo+ID4+IFNpZ25lZC1vZmYtYnk6IEx5
dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQo+ID4+IENjOiBNYXJ0aW4gUGVyZXMgPG1hcnRp
bi5wZXJlc0BmcmVlLmZyPg0KPiA+PiBDYzogQmVuIFNrZWdncyA8YnNrZWdnc0ByZWRoYXQuY29t
Pg0KPiA+PiBDYzogSmVyZW15IENsaW5lIDxqY2xpbmVAcmVkaGF0LmNvbT4NCj4gPj4gLS0tDQo+
ID4+IMKgIHRlc3RzL2ttc19wbGFuZS5jIHwgOSArKysrKy0tLS0NCj4gPj4gwqAgMSBmaWxlIGNo
YW5nZWQsIDUgaW5zZXJ0aW9ucygrKSwgNCBkZWxldGlvbnMoLSkNCj4gPj4NCj4gPj4gZGlmZiAt
LWdpdCBhL3Rlc3RzL2ttc19wbGFuZS5jIGIvdGVzdHMva21zX3BsYW5lLmMgaW5kZXgNCj4gPj4g
Mjk4YTkzNzUuLmM4Nzk4M2E0IDEwMDY0NA0KPiA+PiAtLS0gYS90ZXN0cy9rbXNfcGxhbmUuYw0K
PiA+PiArKysgYi90ZXN0cy9rbXNfcGxhbmUuYw0KPiA+PiBAQCAtODE3LDkgKzgxNywxMCBAQCBl
bnVtIGNyY19zZXQgeyBQQUNLRURfQ1JDX1NFVCwNCj4gPj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgIE1BWF9DUkNfU0VUIH07DQo+ID4+IMKgIHN0YXRpYyBib29sIHRlc3RfZm9ybWF0X3BsYW5l
KGRhdGFfdCAqZGF0YSwgZW51bSBwaXBlIHBpcGUsDQo+ID4+IC3CoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIGlndF9vdXRwdXRfdCAqb3V0cHV0LCBpZ3RfcGxhbmVfdCAqcGxhbmUp
DQo+ID4+ICvCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGlndF9vdXRwdXRfdCAq
b3V0cHV0LCBpZ3RfcGxhbmVfdCAqcGxhbmUsIGlndF9mYl90DQo+ID4+ICpwcmltYXJ5X2ZiKQ0K
PiA+PiDCoCB7DQo+ID4+IMKgwqDCoMKgwqAgc3RydWN0IGlndF9mYiBmYiA9IHt9Ow0KPiA+PiAr
wqDCoMKgIHN0cnVjdCBpZ3RfZmIgKmNsZWFyX2ZiID0gcGxhbmUtPnR5cGUgPT0gRFJNX1BMQU5F
X1RZUEVfUFJJTUFSWSA/DQo+ID4+IHByaW1hcnlfZmIgOiBOVUxMOw0KPiA+PiDCoMKgwqDCoMKg
IGRybU1vZGVNb2RlSW5mbyAqbW9kZTsNCj4gPj4gwqDCoMKgwqDCoCB1aW50MzJfdCBmb3JtYXQs
IHJlZl9mb3JtYXQ7DQo+ID4+IMKgwqDCoMKgwqAgdWludDY0X3QgbW9kaWZpZXIsIHJlZl9tb2Rp
ZmllcjsgQEAgLTg3OSw3ICs4ODAsNyBAQCBzdGF0aWMNCj4gPj4gYm9vbCB0ZXN0X2Zvcm1hdF9w
bGFuZShkYXRhX3QgKmRhdGEsIGVudW0gcGlwZSBwaXBlLA0KPiA+PiDCoMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoCBoZWlnaHQgPSB0ZXN0X2ZiLmhlaWdodDsNCj4gPj4gwqDCoMKgwqDCoMKgwqDC
oMKgIH0NCj4gPj4gLcKgwqDCoMKgwqDCoMKgIGlndF9wbGFuZV9zZXRfZmIocGxhbmUsIE5VTEwp
Ow0KPiA+PiArwqDCoMKgwqDCoMKgwqAgaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgY2xlYXJfZmIp
Ow0KPiA+PiDCoMKgwqDCoMKgwqDCoMKgwqAgaWd0X3JlbW92ZV9mYihkYXRhLT5kcm1fZmQsICZ0
ZXN0X2ZiKTsNCj4gPj4gwqDCoMKgwqDCoCB9DQo+ID4+IEBAIC05MzcsNyArOTM4LDcgQEAgc3Rh
dGljIGJvb2wgdGVzdF9mb3JtYXRfcGxhbmUoZGF0YV90ICpkYXRhLCBlbnVtDQo+ID4+IHBpcGUg
cGlwZSwNCj4gPj4gwqDCoMKgwqDCoCBpZ3RfcGlwZV9jcmNfc3RvcChkYXRhLT5waXBlX2NyYyk7
DQo+ID4+IC3CoMKgwqAgaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgTlVMTCk7DQo+ID4+ICvCoMKg
wqAgaWd0X3BsYW5lX3NldF9mYihwbGFuZSwgY2xlYXJfZmIpOw0KPiA+PiDCoMKgwqDCoMKgIGln
dF9yZW1vdmVfZmIoZGF0YS0+ZHJtX2ZkLCAmZmIpOw0KPiA+PiDCoMKgwqDCoMKgIHJldHVybiBy
ZXN1bHQ7DQo+ID4+IEBAIC0xMDEwLDcgKzEwMTEsNyBAQCB0ZXN0X3BpeGVsX2Zvcm1hdHMoZGF0
YV90ICpkYXRhLCBlbnVtIHBpcGUNCj4gPj4gcGlwZSkNCj4gPj4gwqDCoMKgwqDCoCBmb3JfZWFj
aF9wbGFuZV9vbl9waXBlKCZkYXRhLT5kaXNwbGF5LCBwaXBlLCBwbGFuZSkgew0KPiA+PiDCoMKg
wqDCoMKgwqDCoMKgwqAgaWYgKHNraXBfcGxhbmUoZGF0YSwgcGxhbmUpKQ0KPiA+PiDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBjb250aW51ZTsNCj4gPj4gLcKgwqDCoMKgwqDCoMKgIHJlc3Vs
dCAmPSB0ZXN0X2Zvcm1hdF9wbGFuZShkYXRhLCBwaXBlLCBvdXRwdXQsIHBsYW5lKTsNCj4gPj4g
K8KgwqDCoMKgwqDCoMKgIHJlc3VsdCAmPSB0ZXN0X2Zvcm1hdF9wbGFuZShkYXRhLCBwaXBlLCBv
dXRwdXQsIHBsYW5lLA0KPiA+PiAmcHJpbWFyeV9mYik7DQo+ID4+IMKgwqDCoMKgwqAgfQ0KPiA+
PiDCoMKgwqDCoMKgIHRlc3RfZmluaShkYXRhKTsNCj4gPj4NCj4gPiBfX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXw0KPiA+IGlndC1kZXYgbWFpbGluZyBsaXN0
DQo+ID4gaWd0LWRldkBsaXN0cy5mcmVlZGVza3RvcC5vcmcNCj4gPiBodHRwczovL2xpc3RzLmZy
ZWVkZXNrdG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2lndC1kZXYNCj4gDQo+IF9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fDQo+IGlndC1kZXYgbWFpbGluZyBs
aXN0DQo+IGlndC1kZXZAbGlzdHMuZnJlZWRlc2t0b3Aub3JnDQo+IGh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vaWd0LWRldg0KX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KTm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVh
dUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFp
bG1hbi9saXN0aW5mby9ub3V2ZWF1Cg==
