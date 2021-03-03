Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA5E332B671
	for <lists+nouveau@lfdr.de>; Wed,  3 Mar 2021 11:07:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1EE5389CB5;
	Wed,  3 Mar 2021 10:07:45 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from EUR01-DB5-obe.outbound.protection.outlook.com
 (mail-oln040092064105.outbound.protection.outlook.com [40.92.64.105])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 87D3B89C59
 for <nouveau@lists.freedesktop.org>; Wed,  3 Mar 2021 10:07:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eCRT3eNbUCrgBUE6qHgZRTF1bofIFg2ba0QWICFgjQzQR4Ymn84ZZWJuMDnFgxQXV47VbbR1L2Ho84i+6qVu84sPdVXU0LPP7LNAwMqcTPJikGL9W8z92GvGseH8ZUTil9wNDvybm5A5iO3WeAE9xAGrTf3LdesLKEANeDP5hSE+VfeQFTeE10kx/mIPwNtYQykpQP10rKitTrQJlvyrFVhWVozQJy1G9G44KAFVo7rSbvNpIXeCheYblBki3ki8vQK9LsyusRU3KF4bKi1XVu2QRWkdOfpNC09z4mHS96om85Vrv/Lr7QZKwcc4BauX1Z0vus2t8v/iyIIiqFE4rw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BlHgc1eORKxt3/K3RWPQ0pIPwZyrtseYmsAmE8k3tX0=;
 b=eIe0dSP3ZUNjB7vU20ktdmGVwBRmlx7WjDN0M75F0xZTbzIirtqA5NTd1cyCJaMGp3yFR1ZfXFtSy1i45w66M8FlOu92Soo3mxZfggqNe6PIue+nHy0IBY+vBWPixyhLFLzq5/kvJNtyaKfcTfzvfFBPdtHA5TxJ94VHmbYPVjPpGtiKnajcsM49tTGddvbhNwTmjT51igMSayDAIMo/Gy/KKEwMQ00f3ZJ2pNw2em3IlNBOBTrNZBJ678F9pgWB35zmqZ5MOYjZkxjAwQB++foSiV7ead2DFWexqlxi4X1m6QF2Qxj8mi1loabgOurH6qPoG7Htea22NtUZaHjeDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
Received: from DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
 (2a01:111:e400:7e1a::49) by
 DB5EUR01HT241.eop-EUR01.prod.protection.outlook.com (2a01:111:e400:7e1a::435)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19; Wed, 3 Mar
 2021 10:07:41 +0000
Received: from PAXP193MB1232.EURP193.PROD.OUTLOOK.COM (2a01:111:e400:7e1a::42)
 by DB5EUR01FT054.mail.protection.outlook.com
 (2a01:111:e400:7e1a::389) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3890.19 via Frontend
 Transport; Wed, 3 Mar 2021 10:07:41 +0000
Received: from PAXP193MB1232.EURP193.PROD.OUTLOOK.COM
 ([fe80::58dc:e8dd:a7b4:2ada]) by PAXP193MB1232.EURP193.PROD.OUTLOOK.COM
 ([fe80::58dc:e8dd:a7b4:2ada%7]) with mapi id 15.20.3890.029; Wed, 3 Mar 2021
 10:07:41 +0000
From: Tomek LECOCQ <tomek.lecocq@hotmail.fr>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Thread-Topic: How to reverse engineer a PCI-Express driver under Linux ?
Thread-Index: AQHXEBUMA2xkD6iKMUqblBj6Ik0XIQ==
Date: Wed, 3 Mar 2021 10:07:41 +0000
Message-ID: <69E2E06B-90B1-45A6-AC51-144F0DBE7D7E@hotmail.fr>
Accept-Language: fr-FR, en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-incomingtopheadermarker: OriginalChecksum:DCC4453111F8A5B36159784226FD5739291A95BFB61C89915F96991906EEB900;
 UpperCasedChecksum:EBEF43CD2D9E39642D3F26F1E06D4FB59CBB253CBA387B10585C76873D16473F;
 SizeAsReceived:6829; Count:42
x-ms-exchange-messagesentrepresentingtype: 1
x-tmn: [xGvhHIXPDfdO2Eng8OeNfvqLxPVF5VMUd27FNbpdk08PoxWiT8FIF+C/lhM93gTZ]
x-ms-publictraffictype: Email
x-incomingheadercount: 42
x-eopattributedmessage: 0
x-ms-office365-filtering-correlation-id: 2e2f53a8-120d-412a-2209-08d8de2c2ee1
x-ms-traffictypediagnostic: DB5EUR01HT241:
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: YNRYv530QHOYMlG/SBM2WlHHKC87HaLIh8vjBsofKqUOcBdJ/K0sjTZwWhaXBpz8DsSjTwDoWBoyJFm3RfCZVLdmqyqS2kdvVlaHm4uVoEMHDJOw2DxKNxgZMSPeSpwrzyC/kY5VokNDYGet2MnCn+wl4KP3WpAntbUiPoQhmH27SaxtO/PWj1k7qLfB8AE4x7vn8D84EwqKcfUHLVEgtZ90U8W3+uFnAP6NBGYA8ku4mc8c+OSBf+EY3+cFt2UombAF+ccW/Sjb0iZkfzIO6Jf112pU61imPN+GDoD3N4pmiucNvuuPAv3vXlB/U8jG1lnst7Dxs3nWKF6XXju8aVvecCxqwkxxnnJY0yVMdZ6hZoiV6TjdfP7fbFfC3t9BvIkAphUcC7/iDolYAZWBYg==
x-ms-exchange-antispam-messagedata: 3pBNa0R+EbFmQQavf0m4LkvHnpqUaVgG3kkbJkyrljQWoGS7rFXVj1OBZnAlwszYQjvkNKSJ5bL+eI1miweRtWEvPDGeQ6t+zFGSd0hPosjNqvPyh3EBDps8QlSNcs7CRHkNCbXYV9QXxKOmeYzH6rk5fY38717e3Mm5/PtIIjqVJv8ywasrbF4nAwjJJHr+1tQPeOHafEwetRNo9kqG6A==
x-ms-exchange-transport-forked: True
Content-ID: <E3DDE162C8711243A39F08923B6F5FF3@EURP193.PROD.OUTLOOK.COM>
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-AuthSource: DB5EUR01FT054.eop-EUR01.prod.protection.outlook.com
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 2e2f53a8-120d-412a-2209-08d8de2c2ee1
X-MS-Exchange-CrossTenant-originalarrivaltime: 03 Mar 2021 10:07:41.8333 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Internet
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DB5EUR01HT241
Subject: [Nouveau] How to reverse engineer a PCI-Express driver under Linux ?
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

SGVsbG8sDQoNCknigJl2ZSBhbHJlYWR5IGFza2VkIHRoaXMgb24gdGhlIEtlcm5lbCBOZXdiaWVz
IG1haWwgbGlzdCwgYnV0IGFzIGRldmVsb3Bpbmcgbm91dmVhdSBzZWVtcyB0byBiZSBraW5kIG9m
IHNpbWlsYXIgdG8gd2hhdCBJIHdhbnQgdG8gYWNoaWV2ZSwgSSB0aG91Z2h0IGl0IHdvdWxkIGJl
IGEgZ29vZCBpZGVhIHRvIGFzayBpdCBoZXJlIGFzIHdlbGwuDQoNCkkgaGF2ZSBhIFBDSS1FeHBy
ZXNzIHZpZGVvIGNhcHR1cmUgY2FyZCB0aGF0IGhhcyBhIHByb3ByaWV0YXJ5IGRyaXZlciBmb3Ig
TGludXguDQpJIGhhdmUgc29tZSBleHBlcmllbmNlIHdpdGggcHJvZ3JhbW1pbmcgaW4gQywgYW5k
IHNvIEkgd291bGQgbGlrZSB0byBzdGFydCBhIGhvYmJ5IHByb2plY3QgdG8gZGV2ZWxvcCBhIGZy
ZWUvbGlicmUgZHJpdmVyIGZvciB0aGlzIGRldmljZSBmb3IgTGludXguDQpPZiBjb3Vyc2UgSSBk
b27igJl0IGhhdmUgYWNjZXNzIHRvIGFueSBkb2N1bWVudGF0aW9uIGFib3V0IGhvdyB0byBjb21t
dW5pY2F0ZSB3aXRoIHRoaXMgZGV2aWNlIChJ4oCZdmUgdHJpZWQgdG8gY29udGFjdCB0aGUgY29t
cGFueSBtYWtpbmcgdGhlc2UsIGJ1dCBteSBob3BlcyBhcmUgbm90IGhpZ2gpLCBzbyBJIHRoaW5r
IEkgd2lsbCBuZWVkIHRvIHJldmVyc2UtZW5naW5lZXIgdGhlIHdheSB0aGUgZXhpc3RpbmcgZHJp
dmVyIGNvbW11bmljYXRlcyB3aXRoIHRoZSBoYXJkd2FyZS4gSG93IGNvdWxkIEkgYWNoaWV2ZSB0
aGlzID8NCg0KQWxzbywgdGhlIGxvbmcgdGVybSBnb2FsIG9mIHRoaXMgcHJvamVjdCB3b3VsZCBi
ZSB0byBoYXZlIHRoaXMgZHJpdmVyIG1lcmdlZCBpbnRvIG1haW5saW5lLCBzbyB3aGF0IGlzIGFs
bG93ZWQgb3Igbm90IHdoaWxlIGRvaW5nIHRoaXMgdG8gYXZvaWQgcHJvYmxlbWF0aWMgbGVnYWwg
cmFtaWZpY2F0aW9ucyA/DQpUaGFuayB5b3UgZm9yIHlvdXIgaGVscC4NCg0KQmVzdCByZWdhcmRz
Lg0KVG9tZWsgTGVjb2NxCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fCk5vdXZlYXUgbWFpbGluZyBsaXN0Ck5vdXZlYXVAbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
Cmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vbm91dmVhdQo=
