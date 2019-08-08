Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 662F586889
	for <lists+nouveau@lfdr.de>; Thu,  8 Aug 2019 20:17:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E81576E051;
	Thu,  8 Aug 2019 18:17:30 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM05-BY2-obe.outbound.protection.outlook.com
 (mail-oln040092012047.outbound.protection.outlook.com [40.92.12.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 059896E051
 for <nouveau@lists.freedesktop.org>; Thu,  8 Aug 2019 18:17:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=i0EW54c9A5HRsubXYbb5wvpKf6AlHTM21YTOE/39eIDmvHUWqnHM0jHuZXKPL2dUE218Cj2emKIXezpxg9xbBLEX6hu80ukqNDxLvSKD4aWymkRfLoHTCtCK0pPsBL1vjnbHPkdzF8n13refZOfOmMKqDRSQ3i6td2KCkkIGMjRIB0FinBIVyOh7b10pAVGEFHR21QmiPV8WDC2pmdEJGDO89MOy2nJi48V5E2tgwKDCct6FHIJsGX9JsZ7vcMOBVSHmf0NeJ0wutCak/Oq7wb4czn1eYl0pmYenLQ6dHLNZOsXsSTsaN81OA63hTQok3mGl7lqBq1XX//bo2sxCcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU/k2Mqsyo8LlmeYWkAAVYEpV19Y6Dkbg9SpwcRJrFY=;
 b=ZK19cHTKo3WpkFig3Zm9ryVJlPvmzrKxKnHNsDicBBGrS7k9BT2TpXJFfeL8Twsb9r24owTkKDwf5f23/A53NrOvSyvgU0m2ZvxNoixl1A7xJSeyqcsi5TsOlHqSAAqs038ou/iyABw5m1BqTPLta3uq2BXAUq98A9voXKLvI2OQQY2XzIpddgpQthHgbt5xg3RnCtZqcDnl7ADf/AKlJF5EUF5Apa7jcKtfLJVbQG1glDysJudgAY3vfZ3trHoKhiVGgjb3Zr4IeqR53wmrJaUcA1x2rUyPrPnMPoc1n9V3rM2nUhW8WT3x8wQJwkJbDPe8SbB6lVufARd6iBDE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from CO1NAM05FT035.eop-nam05.prod.protection.outlook.com
 (10.152.96.53) by CO1NAM05HT044.eop-nam05.prod.protection.outlook.com
 (10.152.96.236) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id 15.20.2178.6; Thu, 8 Aug
 2019 18:17:28 +0000
Received: from DM6PR15MB2316.namprd15.prod.outlook.com (10.152.96.54) by
 CO1NAM05FT035.mail.protection.outlook.com (10.152.96.147) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384) id
 15.20.2178.6 via Frontend Transport; Thu, 8 Aug 2019 18:17:28 +0000
Received: from DM6PR15MB2316.namprd15.prod.outlook.com
 ([fe80::3192:d5d3:bb16:2f4a]) by DM6PR15MB2316.namprd15.prod.outlook.com
 ([fe80::3192:d5d3:bb16:2f4a%7]) with mapi id 15.20.2157.015; Thu, 8 Aug 2019
 18:17:28 +0000
From: William Lewis <minutemaidpark@hotmail.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: [Nouveau] [PATCH] drm/nouveau: Only recalculate PBN/VCPI on
 mode/connector changes
Thread-Index: AQHVThPWUT3S5lhNe0GsZGmb5Kd3EKbxjugA
Date: Thu, 8 Aug 2019 18:17:28 +0000
Message-ID: <DM6PR15MB231633F4AB3882F5B310518EC8D70@DM6PR15MB2316.namprd15.prod.outlook.com>
References: <20190808180439.19118-1-lyude@redhat.com>
In-Reply-To: <20190808180439.19118-1-lyude@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-clientproxiedby: SN4PR0801CA0012.namprd08.prod.outlook.com
 (2603:10b6:803:29::22) To DM6PR15MB2316.namprd15.prod.outlook.com
 (2603:10b6:5:8d::10)
x-incomingtopheadermarker: OriginalChecksum:D37C8FF3E9B67AA1B90DAFA9255E22EFAB0FEF0603FD378A876DA0757156F0B1;
 UpperCasedChecksum:741725DBDF5E57818E2838E702F9F96BA53850CE620A41421520AF1FF651949D;
 SizeAsReceived:7441; Count:48
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [spevkXYgaIR4sm8h+aysgHS3ntieIk0N]
x-microsoft-original-message-id: <489124cd-9919-64e6-dd87-c99cb47d6968@hotmail.com>
x-ms-publictraffictype: Email
x-incomingheadercount: 48
x-eopattributedmessage: 0
x-microsoft-antispam: BCL:0; PCL:0;
 RULEID:(2390118)(5050001)(7020095)(20181119110)(201702061078)(5061506573)(5061507331)(1603103135)(2017031320274)(2017031322404)(2017031323274)(2017031324274)(1601125500)(1603101475)(1701031045);
 SRVR:CO1NAM05HT044; 
x-ms-traffictypediagnostic: CO1NAM05HT044:
x-microsoft-antispam-message-info: aeshvLCzEQ+9EbjfyWaweBcjrGiVr2opNdLsFKK9NCrB7j5QnAnuunSc16xA9Uo9y9ni0vsJg96cXx/dl5a+ITBUiP6cMDafYqpXVMGNhVk9CKgg8ePnFV/CgNw5tGiuSCUE1jOfvH4hPZNSSyluNFTCi6c2SD40uBPvFJxpDKjYYDU680Nk2gTL7YnrIAlN
x-ms-exchange-transport-forked: True
Content-ID: <4E5A932D0909574A90D6F16350E16FA6@namprd15.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: hotmail.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: e99bc0f3-b964-44c9-be8f-08d71c2cab88
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 08 Aug 2019 18:17:28.7223 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO1NAM05HT044
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=hotmail.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aU/k2Mqsyo8LlmeYWkAAVYEpV19Y6Dkbg9SpwcRJrFY=;
 b=gPUCDeK3/2XdjgwvLDGUY+/sepJ6FKg9eJa9Soxf8e01dEvSVkVECbQ44W83xNUZFzRKbzvRzlFFa1Fobzq3a0BFfOK6mG8O2KjDYc4GU+DphkETi7qHYs7dWc2jMSto/edOoq9oAgVPntEs+ogPGCWXKwAPb8qQ/Gk4YR801f+3D+rNXVW4CDPuUZ18Q47C62rpHlds+VPwB8L6W2EPIGflUZytM2KTKEyXfk8uMiBnjz5eyFQLBcka9+Z7wS+lVCt95W7wy7DMQu0NNWSmFPECngvmrHTiDE06PkhIQHY5+6mPWU4S4Cydgk9pwfB0KbpW0pprR0gduoaXpPqxeg==
Subject: Re: [Nouveau] [PATCH] drm/nouveau: Only recalculate PBN/VCPI on
 mode/connector changes
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

DQpPbiA4LzgvMTkgMTowNCBQTSwgTHl1ZGUgUGF1bCB3cm90ZToNCj4gSSAtdGhvdWdodC0gSSBo
YWQgZml4ZWQgdGhpcyBlbnRpcmVseSwgYnV0IGl0IGxvb2tzIGxpa2UgdGhhdCBJIGRpZG4ndA0K
PiB0ZXN0IHRoaXMgdGhvcm91Z2hseSBlbm91Z2ggYXMgd2UgYXBwYXJlbnRseSBzdGlsbCBtYWtl
IG9uZSBiaWcgbWlzdGFrZQ0KPiB3aXRoIG52NTBfbXN0b19hdG9taWNfY2hlY2soKSAtIHdlIGRv
bid0IGhhbmRsZSB0aGUgZm9sbG93aW5nIHNjZW5hcmlvOg0KPg0KPiAqIENSVEMgIzEgaGFzIG4g
VkNQSSBhbGxvY2F0ZWQgdG8gaXQsIGlzIGF0dGFjaGVkIHRvIGNvbm5lY3RvciBEUC00DQo+ICAg
IHdoaWNoIGlzIGF0dGFjaGVkIHRvIGVuY29kZXIgIzEuIGVuYWJsZWQ9eSBhY3RpdmU9bg0KPiAq
IENSVEMgIzEgaXMgY2hhbmdlZCBmcm9tIERQLTQgdG8gRFAtNSwgY2F1c2luZzoNCj4gICAgKiBE
UC00IGNydGM9IzHihpJOVUxMIChWQ1BJIG7ihpIwKQ0KPiAgICAqIERQLTUgY3J0Yz1OVUxM4oaS
IzENCj4gICAgKiBDUlRDICMxIHN0ZWFscyBlbmNvZGVyICMxIGJhY2sgZnJvbSBEUC00IGFuZCBn
aXZlcyBpdCB0byBEUC01DQo+ICAgICogQ1JUQyAjMSBtYWludGFpbnMgdGhlIHNhbWUgbW9kZSBh
cyBiZWZvcmUsIGp1c3Qgd2l0aCBhIGRpZmZlcmVudA0KPiAgICAgIGNvbm5lY3Rvcg0KPiAqIG1v
ZGVfY2hhbmdlZD1uIGNvbm5lY3RvcnNfY2hhbmdlZD15DQo+ICAgICh3ZSBfU0hPVUxEXyBkbyBW
Q1BJIDDihpJuIGhlcmUsIGJ1dCBkb24ndCkNCj4NCj4gT25jZSB0aGUgYWJvdmUgc2NlbmFyaW8g
aXMgcmVwZWF0ZWQgb25jZSwgd2UnbGwgYXR0ZW1wdCBmcmVlaW5nIFZDUEkNCj4gZnJvbSB0aGUg
Y29ubmVjdG9yIHRoYXQgd2UgZGlkbid0IGFsbG9jYXRlIGR1ZSB0byB0aGUgY29ubmVjdG9ycw0K
PiBjaGFuZ2luZywgYnV0IHRoZSBtb2RlIHN0YXlpbmcgdGhlIHNhbWUuIFNpZ2guDQo+DQo+IFNp
bmNlIG52NTBfbXN0b19hdG9taWNfY2hlY2soKSBoYXMgYnJva2VuIGEgZmV3IHRpbWVzIG5vdywg
bGV0J3MgcmV0aGluaw0KPiB0aGluZ3MgYSBiaXQgdG8gYmUgbW9yZSBjYXJlZnVsOiBsaW1pdCBi
b3RoIFZDUEkvUEJOIGFsbG9jYXRpb25zIHRvDQo+IG1vZGVfY2hhbmdlZCB8fCBjb25uZWN0b3Jz
X2NoYW5nZWQsIHNpbmNlIG5laXRoZXIgVkNQSSBvciBQQk4gc2hvdWxkDQo+IGV2ZXIgbmVlZCB0
byBjaGFuZ2Ugb3V0c2lkZSBvZiByb3V0aW5nIGFuZCBtb2RlIGNoYW5nZXMuDQo+DQo+IFNpZ25l
ZC1vZmYtYnk6IEx5dWRlIFBhdWwgPGx5dWRlQHJlZGhhdC5jb20+DQo+IFJlcG9ydGVkLWJ5OiBC
b2hkYW4gTWlsYXIgPGJtaWxhckByZWRoYXQuY29tPg0KPiBUZXN0ZWQtYnk6IEJvaGRhbiBNaWxh
ciA8Ym1pbGFyQHJlZGhhdC5jb20+DQo+IEZpeGVzOiAyMzJjOWVlYzQxN2EgKCJkcm0vbm91dmVh
dTogVXNlIGF0b21pYyBWQ1BJIGhlbHBlcnMgZm9yIE1TVCIpDQo+IFJlZmVyZW5jZXM6IDQxMmU4
NWI2MDUzMSAoImRybS9ub3V2ZWF1OiBPbmx5IHJlbGVhc2UgVkNQSSBzbG90cyBvbiBtb2RlIGNo
YW5nZXMiKQ0KPiBDYzogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4NCj4gQ2M6IEJlbiBT
a2VnZ3MgPGJza2VnZ3NAcmVkaGF0LmNvbT4NCj4gQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52
ZXR0ZXJAZmZ3bGwuY2g+DQo+IENjOiBEYXZpZCBBaXJsaWUgPGFpcmxpZWRAcmVkaGF0LmNvbT4N
Cj4gQ2M6IEplcnJ5IFp1byA8SmVycnkuWnVvQGFtZC5jb20+DQo+IENjOiBIYXJyeSBXZW50bGFu
ZCA8aGFycnkud2VudGxhbmRAYW1kLmNvbT4NCj4gQ2M6IEp1c3RvbiBMaSA8anVzdG9uLmxpQGlu
dGVsLmNvbT4NCj4gQ2M6IExhdXJlbnQgUGluY2hhcnQgPGxhdXJlbnQucGluY2hhcnRAaWRlYXNv
bmJvYXJkLmNvbT4NCj4gQ2M6IEthcm9sIEhlcmJzdCA8a2Fyb2xoZXJic3RAZ21haWwuY29tPg0K
PiBDYzogSWxpYSBNaXJraW4gPGltaXJraW5AYWx1bS5taXQuZWR1Pg0KPiBDYzogPHN0YWJsZUB2
Z2VyLmtlcm5lbC5vcmc+ICMgdjUuMSsNCj4gLS0tDQo+ICAgZHJpdmVycy9ncHUvZHJtL25vdXZl
YXUvZGlzcG52NTAvZGlzcC5jIHwgMjIgKysrKysrKysrKysrKy0tLS0tLS0tLQ0KPiAgIDEgZmls
ZSBjaGFuZ2VkLCAxMyBpbnNlcnRpb25zKCspLCA5IGRlbGV0aW9ucygtKQ0KPg0KPiBkaWZmIC0t
Z2l0IGEvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jIGIvZHJpdmVycy9n
cHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5jDQo+IGluZGV4IDEyNjcwMzgxNjc5NC4uNWQy
M2FiOGU0OTE3IDEwMDY0NA0KPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9kaXNwbnY1
MC9kaXNwLmMNCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL25vdXZlYXUvZGlzcG52NTAvZGlzcC5j
DQo+IEBAIC03NzEsMTYgKzc3MSwyMCBAQCBudjUwX21zdG9fYXRvbWljX2NoZWNrKHN0cnVjdCBk
cm1fZW5jb2RlciAqZW5jb2RlciwNCj4gICAJc3RydWN0IG52NTBfaGVhZF9hdG9tICphc3loID0g
bnY1MF9oZWFkX2F0b20oY3J0Y19zdGF0ZSk7DQo+ICAgCWludCBzbG90czsNCj4gICANCj4gLQkv
KiBXaGVuIHJlc3RvcmluZyBkdXBsaWNhdGVkIHN0YXRlcywgd2UgbmVlZCB0byBtYWtlIHN1cmUg
dGhhdCB0aGUNCj4gLQkgKiBidyByZW1haW5zIHRoZSBzYW1lIGFuZCBhdm9pZCByZWNhbGN1bGF0
aW5nIGl0LCBhcyB0aGUgY29ubmVjdG9yJ3MNCj4gLQkgKiBicGMgbWF5IGhhdmUgY2hhbmdlZCBh
ZnRlciB0aGUgc3RhdGUgd2FzIGR1cGxpY2F0ZWQNCj4gLQkgKi8NCj4gLQlpZiAoIXN0YXRlLT5k
dXBsaWNhdGVkKQ0KPiAtCQlhc3loLT5kcC5wYm4gPQ0KPiAtCQkJZHJtX2RwX2NhbGNfcGJuX21v
ZGUoY3J0Y19zdGF0ZS0+YWRqdXN0ZWRfbW9kZS5jbG9jaywNCj4gLQkJCQkJICAgICBjb25uZWN0
b3ItPmRpc3BsYXlfaW5mby5icGMgKiAzKTsNCmRybV9kcF9jYWxjX3Bibl9tb2RlKGNsb2NrLCBi
cHApDQo+ICsJaWYgKGNydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCB8fCBjcnRjX3N0YXRlLT5jb25u
ZWN0b3JzX2NoYW5nZWQpIHsNCj4gKwkJLyoNCj4gKwkJICogV2hlbiByZXN0b3JpbmcgZHVwbGlj
YXRlZCBzdGF0ZXMsIHdlIG5lZWQgdG8gbWFrZSBzdXJlIHRoYXQNCj4gKwkJICogdGhlIGJ3IHJl
bWFpbnMgdGhlIHNhbWUgYW5kIGF2b2lkIHJlY2FsY3VsYXRpbmcgaXQsIGFzIHRoZQ0KPiArCQkg
KiBjb25uZWN0b3IncyBicGMgbWF5IGhhdmUgY2hhbmdlZCBhZnRlciB0aGUgc3RhdGUgd2FzDQo+
ICsJCSAqIGR1cGxpY2F0ZWQNCj4gKwkJICovDQo+ICsJCWlmICghc3RhdGUtPmR1cGxpY2F0ZWQp
IHsNCj4gKwkJCWNvbnN0IGludCBicHAgPSBjb25uZWN0b3ItPmRpc3BsYXlfaW5mby5icGMgKiAz
Ow0KPiArCQkJY29uc3QgaW50IGNsb2NrID0gY3J0Y19zdGF0ZS0+YWRqdXN0ZWRfbW9kZS5jbG9j
azsNCj4gKw0KPiArCQkJYXN5aC0+ZHAucGJuID0gZHJtX2RwX2NhbGNfcGJuX21vZGUoYnBwLCBj
bG9jayk7DQpkcm1fZHBfY2FsY19wYm5fbW9kZShicHAsIGNsb2NrKQ0KPiArCQl9DQo+ICAgDQo+
IC0JaWYgKGNydGNfc3RhdGUtPm1vZGVfY2hhbmdlZCkgew0KPiAgIAkJc2xvdHMgPSBkcm1fZHBf
YXRvbWljX2ZpbmRfdmNwaV9zbG90cyhzdGF0ZSwgJm1zdG0tPm1nciwNCj4gICAJCQkJCQkgICAg
ICBtc3RjLT5wb3J0LA0KPiAgIAkJCQkJCSAgICAgIGFzeWgtPmRwLnBibik7DQpXaGljaCBpcyBj
b3JyZWN0Pw0KX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Tm91dmVhdSBtYWlsaW5nIGxpc3QKTm91dmVhdUBsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6
Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9ub3V2ZWF1
