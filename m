Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4B1FA32B8B1
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 15:44:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03BE889C1A;
	Wed,  3 Mar 2021 14:44:19 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR04-HE1-obe.outbound.protection.outlook.com
 (mail-oln040092073036.outbound.protection.outlook.com [40.92.73.36])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7CA3489C1A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 14:44:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fw5nWfAPBj5jbYBFk3D5p/1eM8gcdxfrQGi7X+EgSiV6dneoJjVuqhhKABwL9Uk/4BiOQHh3g8zVr42tjwBHtsW5BClAeCHJxFIXKwUzL45sla6rf6hpLCBTXyDLBANHaKLABEfZocNJWcHS574WAAIaxgedx3UNXB3t0bl6sDUK4VHHRoRu0XN5cjxoi1P1bLOaTwCDY1luLWtjGg6CNF1aq8Xw9PvH+/NfGhn9+UdAFo82tdujLcPWLznFmwbLAPyh01TnY5GoQ7TpxOA3PIekHeRKfLbTmHPBoCuKjOma3a0DebbW6H7xfS7GNWknEFhBERU+CZBk7pIdAVajrw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=WvrgjMG9C67o94TUQkkuUpJTJtGOSLo+t/JBTVH5wz4=;
 b=H8FhbvJEnHGeD/OytwLT5kCIbcyL7RV8TFjtjtwCZjFrXqhuQi3GqKxh9uOrY08aMD/z1Aq9E7ZSGNYTBIJLH1w6S1fGmWMxdZd541ZrJL5AA6ewPlDjRlcfxeMzm9+TDKNI12F+dVYh/uZCLHDzI2N8T2Ou9kbLWFBF2tqIckEWDnZ9GIzN68U+25sDWMqKUyk+8tN2Ba7HbRBN8DbMLEyYccUds0xXljc4JJGGL+S2h4gdz+aOKP+Gnc5deUKey9NBUogRQ3f/JAfLeo3zdHqD+ovhv6BMxxVwfxHfDbBpZ71OrtVpPGH31nQlVxk8Z7P6l2V31v4OwY+7OAv3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from VI1EUR04FT046.eop-eur04.prod.protection.outlook.com
 (2a01:111:e400:7e0e::41) by
 VI1EUR04HT108.eop-eur04.prod.protection.outlook.com (2a01:111:e400:7e0e::82)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 14:44:06 +0000
Received: from PAXP193MB1232.EURP193.PROD.OUTLOOK.COM (2a01:111:e400:7e0e::43)
 by VI1EUR04FT046.mail.protection.outlook.com
 (2a01:111:e400:7e0e::83) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3912.17 via Frontend
 Transport; Wed, 3 Mar 2021 14:44:06 +0000
Received: from PAXP193MB1232.EURP193.PROD.OUTLOOK.COM
 ([fe80::58dc:e8dd:a7b4:2ada]) by PAXP193MB1232.EURP193.PROD.OUTLOOK.COM
 ([fe80::58dc:e8dd:a7b4:2ada%7]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 14:44:06 +0000
From: Tomek LECOCQ <tomek.lecocq@hotmail.fr>
To: Ilia Mirkin <imirkin@alum.mit.edu>
Thread-Topic: [Nouveau] How to reverse engineer a PCI-Express driver under
 Linux ?
Thread-Index: AQHXEBUMPP6iHU5h0kGy15v+B0gAjqpyEEgAgAAsawCAABp0gA==
Date: Wed, 3 Mar 2021 14:44:06 +0000
Message-ID: <B2949E39-3A54-4605-9A56-AF67CCD2813D@hotmail.fr>
References: <69E2E06B-90B1-45A6-AC51-144F0DBE7D7E@hotmail.fr>
 <CACO55tta_jVwHAr3zgE38yJbTUHjcMEmx4kY6cSiRqK8GLe9pQ@mail.gmail.com>
 <CAKb7UvgDGDJdVW_P_-rZCXqPo9b6yhcTAjCSF2FOOrhJ4ek5xA@mail.gmail.com>
In-Reply-To: <CAKb7UvgDGDJdVW_P_-rZCXqPo9b6yhcTAjCSF2FOOrhJ4ek5xA@mail.gmail.com>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:DF1A9A3FFC24DFB12CDBD3EFE25DDAB0944A14424F6AB5C77A3E0B1862EC6235;
 UpperCasedChecksum:8B96F07B0320E835F8012D340E29B6E679FDE11537AD0774D6736D1EAD6F2489;
 SizeAsReceived:7245; Count:45
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [FRMkjtXdTRJNEzRCyl4dfF/LRZml/iDVr9D65GDv9G0FxkzM/yKUt3hEVC2XP8r1]
x-ms-publictraffictype: Email
x-incomingheadercount: 45
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: f933e127-e43a-4338-8b76-08d8de52cc06
x-ms-traffictypediagnostic: VI1EUR04HT108:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: uGdNnjXCLN8KeDiSOjBr0e0kq8mTJXvyzgC60rDR1oj+TX7yNXoqGCUOVYaubsCttnXoe9rGmvytDstDcT0iTx4rawmqwQ1r5Lbf14URt5TOqTObCepLwfmomd9OeHE9dlFzI4tAKWoNJh7KMa4rlpxbLSkLb6mHrPNYcv+t44iO5lK740rWyDIXZmkkxR43r4TWpuxHU24Sw3Z7hiwVhcVKO9Rf6Ji61B6YgWDisqSc5XFHYOZb26H+RPUJY3nuPGeXUZP/FkUJ31fWsu3PCTklFwkO1d6w35VQrEy+0LgbUndutcd8tO49sYuAV7g3NFq4MMH2kQP9Hxi6Emag0TPRm5eIBP8nL+CvYneH2mwQvPWG5hma+qCNsX3TtfROKpICR5rQ/VOh23t90+ygNkrjcelBzxMVdUZTRrJ9/FmKG7uXrIcyel19TkpESy6c
x-ms-exchange-antispam-messagedata: 4j5YAz0S9CXvFG9ZurKDNPTGkt7sxd86xRBl2MVhNPwv6D0nsOMxec3u0/fiI7W+Z6eVJadYHl4fMCITHtkIya5HW+pgsyXHYwQEalKOPqPMTpadmR3qjc60Sof/FS9/k4pI35BE4qj1W4nHbBn1OyBbWUfE+EZTRLCpctN4YmhcbJ03XCjwEVnUhLDbZ+fzjxEP+ltklXuaGRvuAqR45A==
x-ms-exchange-transport-forked: True
Content-ID: <336DF075947A6A478251E846752483D1@EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: VI1EUR04FT046.eop-eur04.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: f933e127-e43a-4338-8b76-08d8de52cc06
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 14:44:06.4142 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: VI1EUR04HT108
Subject: Re: [Nouveau] How to reverse engineer a PCI-Express driver under
 Linux ?
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
Cc: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

DQoNCk9uIDMgTWFyIDIwMjEsIGF0IDE0OjA5LCBJbGlhIE1pcmtpbiA8aW1pcmtpbkBhbHVtLm1p
dC5lZHU+IHdyb3RlOg0KDQo+IE9uIFdlZCwgTWFyIDMsIDIwMjEgYXQgNTozMCBBTSBLYXJvbCBI
ZXJic3QgPGtoZXJic3RAcmVkaGF0LmNvbT4gd3JvdGU6DQo+PiANCj4+IA0KPj4gVXN1YWxseSBk
cml2ZXJzIG1hcCBQQ0llIGJhcnMgaW50byB0aGUgVk0gYW5kIHJlYWQvd3JpdGUgYXQgY2VydGFp
biBvZmZzZXRzIHRvIGRvLi4gc3R1ZmYuIEluIHRoZSBsaW51eCBrZXJuZWwgd2UgaGF2ZSB0aGUg
bW1pb3RyYWNlIHRyYWNlciBpbiBvcmRlciB0byBjYXB0dXJlIHdoYXQgYSBkcml2ZXIgZG9lcyB3
aXRoIHRoZSBoYXJkd2FyZS4gWW91IHN0aWxsIG5lZWQgdG8gaW50ZXJwcmV0IHRoZSB0cmFjZSBm
aWxlLCBidXQgYXQgbGVhc3QgdGhpcyBzaG91bGQgZ2l2ZSB5b3UgdGhlIHJhdyBkYXRhIG9uIHdo
YXQncyBnb2luZyBvbi4gSG9wZSB0aGF0IGhlbHBzLg0KPiANCj4gSGVyZSdzIGEgZ29vZCBndWlk
ZSBvbiBob3cgdG8gdXNlIG1taW90cmFjZS4gSXQncyBudmlkaWEtZm9jdXNlZCwgYnV0DQo+IHRo
ZSBzYW1lIHN0ZXBzIHdvdWxkIGFwcGx5IHRvIGFueSBkcml2ZXI6DQo+IGh0dHBzOi8vd2lraS51
YnVudHUuY29tL1gvTU1JT1RyYWNpbmcNCj4gDQo+IEJhc2ljYWxseSwgc3RhcnQgbW1pb3RyYWNl
LCBsb2FkIHRhcmdldCBkcml2ZXIsIGRvIHNvbWUgc3R1ZmYsIHN0b3ANCj4gbW1pb3RyYWNlLCBh
bmFseXplIHRoZSByZXN1bHRpbmcgdHJhY2UuDQo+IA0KPiBXZSBoYXZlIHNvbWUgdG9vbGluZyB0
byBoZWxwIHdpdGggdGhhdCAtLSBlbnZ5dG9vbHMvcm5uL2RlbW1pbyB3aWxsDQo+IHBhcnNlIHRo
ZSBtbWlvdHJhY2UgYWdhaW5zdCBhIGdpdmVuIHJubmRiIChhbHNvIGluIGVudnl0b29scykuIFlv
dQ0KPiB3b24ndCBiZSBhYmxlIHRvIHJldXNlIG91ciBybm5kYiwgYnV0IHlvdSdkIGJlIGFibGUg
dG8gYnVpbGQgdXAgeW91cg0KPiBvd24uIFlvdSBhbHNvIHdvdWxkbid0IGJlIGFibGUgdG8gdXNl
IGRlbW1pbyBkaXJlY3RseSwgYnV0IHlvdSBjb3VsZA0KPiBzZWUgaG93IGl0IHdvcmtzIGFuZCBt
b2RpZnkgaXQgdG8geW91ciBodydzIG5lZWRzLiAoZS5nLiBpdCB3YWl0cyBmb3INCj4gYSByZWFk
IG9mIHRoZSAiMCIgbW1pbyByZWcgdG8gZGV0ZXJtaW5lIHdoaWNoIGNoaXAgaXMgYmVpbmcgdHJh
Y2VkLA0KPiBhbmQgbG9hZHMgdXAgdGhlIGFwcHJvcHJpYXRlIHJubmRiIHNldHRpbmdzIC0gdGhh
dCB3b24ndCB3b3JrIHdpdGgNCj4geW91ciBodyBvdXQgb2YgdGhlIGJveC4pDQo+IA0KDQpUaGFu
ayB5b3UgdG8gYm90aCBvZiB5b3UgZm9yIHRoZSB2ZXJ5IHVzZWZ1bCB0aXBzIGFuZCB0aGUgbGlu
ayB0byB0aGlzIHR1dG9yaWFsLiBUaGlzIHdhcyBleGFjdGx5IHdoYXQgSSB3YXMgbG9va2luZyBm
b3IuDQoNCj4+PiBBbHNvLCB0aGUgbG9uZyB0ZXJtIGdvYWwgb2YgdGhpcyBwcm9qZWN0IHdvdWxk
IGJlIHRvIGhhdmUgdGhpcyBkcml2ZXIgbWVyZ2VkIGludG8gbWFpbmxpbmUsIHNvIHdoYXQgaXMg
YWxsb3dlZCBvciBub3Qgd2hpbGUgZG9pbmcgdGhpcyB0byBhdm9pZCBwcm9ibGVtYXRpYyBsZWdh
bCByYW1pZmljYXRpb25zID8NCj4gDQo+IFRoaXMgaXNuJ3QgbGVnYWwgYWR2aWNlIChmb3IgdGhh
dCwgY29uc3VsdCBhIGxhd3llciksIGhvd2V2ZXIgYSBmZXcNCj4gdGhpbmdzIHRoYXQgYXJlIGRl
ZmluaXRlbHkgZ29pbmcgdG8gZ2V0IHlvdSBpbnRvIHRyb3VibGU6DQo+IA0KPiAtIHN0ZWFsaW5n
IChvciB1c2luZyBzdG9sZW4pIGRvY3VtZW50YXRpb24NCj4gLSBkZS1jb21waWxpbmcgdGFyZ2V0
IGRyaXZlciBhbmQgY29weWluZyBpdHMgaW1wbGVtZW50YXRpb24gKGFzIHRoYXQNCj4gd291bGQg
YmUgc3ViamVjdCB0byBjb3B5cmlnaHQpDQoNClllcywgSeKAmW0gbm90IHVzaW5nIGFueXRoaW5n
IHN0b2xlbiAoYWxsIHRoZSByZXNvdXJjZXMgSSBoYXZlIGFyZSBwdWJsaWNseSBhdmFpbGFibGUg
b24gdGhlIGNhcmQgcHJvZHVjZXLigJlzIHdlYnNpdGUpLg0KSeKAmXZlIGFsc28gY29udGFjdGVk
IGxvY2FsIG9wZW4tc291cmNlIE5HT3MgYWJvdXQgdGhlIGxlZ2FsIHF1ZXN0aW9ucywgSSBsaXZl
IGluIEZyYW5jZSBhbmQgdGhlIGxhdyBoZXJlIGlzIHF1aXRlIGRpZmZlcmVudCB0byB0aGUgVVMg
Zm9yIHRob3NlIGtpbmQgb2YgdGhpbmdzLg0KDQpSZWdhcmRzLg0KVG9tZWsNCg0KDQpfX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpOb3V2ZWF1IG1haWxpbmcg
bGlzdApOb3V2ZWF1QGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL25vdXZlYXUK
