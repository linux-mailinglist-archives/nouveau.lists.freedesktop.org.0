Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92D8984AD29
	for <lists+nouveau@lfdr.de>; Tue,  6 Feb 2024 04:56:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBAB31128A6;
	Tue,  6 Feb 2024 03:56:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WGfU7tTJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EFA81128A6
 for <nouveau@lists.freedesktop.org>; Tue,  6 Feb 2024 03:55:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lHRyLluTpWbdDjMQv2HIsu0CaahK29dOH9aYzUYqq0u1WIbpLErHWyHl1A1ceOLZJwnmkvSK8q+HdrquwDg+zM7UQ97nIMs31nBDI7ihnAHh7eXwhN9StE3kU+WECL3WKhdtc6Wlk4FrJTLVbugDe8IlM9b4TqzjdCZ8iF7zXHqU3t+0qDsZqhmc4CS2iRXmsJCl57dfXYYPstuXGt3Pj+BvHLRG0hHO1kkPa282JwR+9SMokfK292afuG/I5l+ZJ+p2L7tQQOIgib0cS/8jJKLQmfHsjFyCy349DsH3M4CAuHyc4QTsalye7GIKHoLIpx/I0aO58lPMBcRphK9kZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vtneK397MozHpKB+Q3YxseKNRCvnCSr76qgV8POAZCg=;
 b=kPchc7p/phB5/+mb4lFVMEHAaIjLmJ2SwoZ1pDj7LClgsakngCZt1V3a+YHsvSYG7Fw+BnsXase6RqiNZZBdKzqoXonrwYUTkO4HNhA9OsQkGprpSI7PwIitF+NQ95jDz/DnT/MqzlchFs5362SrYHzPirQJ9r/pyTFmgakhe5kAMJtQps8fD/IgBozIIvsJUkgvbeezmWO2nfGyQVF2xB9A0j67VN1er6S4Wp9UTPQNf6he6M97Q5QMz1d4MZ3Ca+gtU8zJ9qBr45pegyTVfgBKKOULyXAfwivEgr0EL1onL0c13wyIhuzAOLgdbIUXgP5gEVGVRZezDvA2FUHIvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vtneK397MozHpKB+Q3YxseKNRCvnCSr76qgV8POAZCg=;
 b=WGfU7tTJRVc4c5Kis1/S2nJo0vsghBU7u7y1yzciYxsohDfDP1QQfetHKfSWQ9xmZNzgT9GgDd/UumeRTy+6j2T5WN5QQzVD0YNNu2iEUzOgcXvJ+yb9NQDJ5MxtNyFsI5E8BF6kUMNOIVrp7Cx5SyxsN7aTIwiK5cANMU7sZ7mBSRmOlmF/eMH9s0s6I4EvB2LZglsx0HSMuVg9QaYg41pM0DtS9oNh8c5KeDI0Vjw2iSIYAfXNtAwf2FtR3Ho8r6NC/LQ2pCYyxuuNb2FNziw4MFn601lfQB1zzJkwJyiudBJ2G4q4yz9hhHcY8uYKt/naXarjhH2cY2svVRp+EA==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DS0PR12MB7849.namprd12.prod.outlook.com (2603:10b6:8:141::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.16; Tue, 6 Feb
 2024 03:55:50 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::9f0f:632e:815c:f953%7]) with mapi id 15.20.7270.012; Tue, 6 Feb 2024
 03:55:50 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>, "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] drm/nouveau: expose GSP-RM logging buffers via debugfs
Thread-Topic: [PATCH] drm/nouveau: expose GSP-RM logging buffers via debugfs
Thread-Index: AQHaWHyZxnoBvrangUKwoGIvz0zw/7D8d+qAgAA32oA=
Date: Tue, 6 Feb 2024 03:55:50 +0000
Message-ID: <5b8db6ee34d565a93a9cd15643daa6a8dc17f513.camel@nvidia.com>
References: <20240205214452.2580940-1-ttabi@nvidia.com>
 <CAMwc25r0zr4orsFKRO4rVNMrNNQh5PxWze9b3xG3HvXuM1CpcQ@mail.gmail.com>
In-Reply-To: <CAMwc25r0zr4orsFKRO4rVNMrNNQh5PxWze9b3xG3HvXuM1CpcQ@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DS0PR12MB7849:EE_
x-ms-office365-filtering-correlation-id: 45374fe8-075d-49d1-e03d-08dc26c7821a
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: qJGcDTPzf0tEcbvQAjZjmmzPOxXGNfpewYPgU++YncxFQkpaoAz4z3FvjP4Lz9leazOzrsd5B/qwelA0+o3uFxNj4/ZV/zvU0m3k9NMnyIcOsyyzxRkj/XKoo5+sxaU6XefTeKGG5Ypj9q8Irx1cOF9h/oaDXBxxdY/0QkYt05G1GNZXD34JPPGDjhiznRM1AkDR8hBDGxCrcqg6hPjjUq2k7/nAtt+75rX1gPsGSFkFpDc7e0rgdw5+5Tll2NqtGnST+f/ZRi5BA/qZCTZw8dU/2VRvifDX4dbZ9jsMam+dvyOhDZYN63Ov8lxRMit4ojg6GTdTwID6fRwOkJu9Gie0Ee461muHDjqurhZCgE6Mm2jEob+2U6uFizKw7nzBAhLmCmEcjRuguZczdkmMnES6/fr7oijMHBGAUMjIja4C1BrX7BU4oZpgtOeppss7S0hvdvyg8Tl9j3zfgx3354GIXFxGzxjPG2VmHUelJ7Yrlflzzg5KMAUyqbL1+clRMzpJQN1Qrej2ggw4gT1F7A+054sXSGuurfrWjuZ3uE5Q2a3X1xRfbonTd12x7OYcZxwhK86Hh2xju9T+AXYF5Wm8rWhhwfVhPB42DRs9jZJ1I7aUuG76q4nA+NmvXQEo
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(39860400002)(376002)(396003)(346002)(230922051799003)(186009)(451199024)(1800799012)(64100799003)(36756003)(5660300002)(4744005)(2906002)(41300700001)(38070700009)(6486002)(86362001)(6512007)(26005)(2616005)(83380400001)(478600001)(6506007)(38100700002)(71200400001)(122000001)(76116006)(66476007)(66556008)(66446008)(66946007)(8676002)(4326008)(6916009)(54906003)(64756008)(316002)(8936002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WkkvVWc0bFNqSVZtWlNjeC82Z2J5dFFiV3F3WE9zd0ZNc2h1MDVrZmEzZmNG?=
 =?utf-8?B?aXh3UUUvalZpTXEzeTVvWVRzeW5lbDRTN0ttUU1VaEt1bEEzWUEvOXhROVRF?=
 =?utf-8?B?WVFjR2tsbUdLdFpQQ3paWnFTemJMZitjbVZyWWw5ZjkzalllR0hTUGpVK2No?=
 =?utf-8?B?TEFzN0Q0NmRJZWcwcWZLLzh6dkVmTmVVM092QzRzM0doVm9aNFRudnd5THlK?=
 =?utf-8?B?ME41dzIyeXdPempEV3FYSm9peTM1YlQ2RjlvcjZmeWllYW82L3lsdDdPWW1s?=
 =?utf-8?B?MW15Y3Z1VWh2WUNVV2Y0TXpsSjBHOXZROHppQXZzaEVtQlpMY2JmR3hyaFR6?=
 =?utf-8?B?QlpaMDVaS1poN3RvRktONysrZ0Nac3pXamJSc3ZNb09RcVBmbXcyUXNrVk5J?=
 =?utf-8?B?OGpXcTRQSFFZQkVPM3BlcEFTL0lGU3I2bVJBcG9TaVFVb1ViNXMycFNpOThq?=
 =?utf-8?B?Zkt5dUdHQjRKTUpocDhBYUwzdXlGUnpHM0FVUm5McllEVU5sU1poYldmclQr?=
 =?utf-8?B?WVAzN2RSQi9HQm1iVkJ5SUdDNWw3RGFzNTZLSSs3b0RMUHQ5ZUJ4aHJVb3VB?=
 =?utf-8?B?akJxeXB0VXU4YVdJdUpCNUkra1Y2SGRwSkJuaDFuUmUzV3lxQXlCV0FMZGs0?=
 =?utf-8?B?RDF1VnhvczFWWlZIbTdPbUJSMFNjN1lVdnNOaTBtb2FNYXltOVArR055L2VY?=
 =?utf-8?B?OWt6ckhBM2NQTGZhS1ZkcnZyaDlSc3RKa3hJTERVM0FIYUZCMktLSE5qMjRB?=
 =?utf-8?B?UlRVYWk0bm5iRjlqdFFWRVc3YThxRzl4d0tVT1NqMFRpN3VjcGR6VlhOZUN3?=
 =?utf-8?B?NUtIYUxPWXQrNURuVjNZVERtK0ZaNmNPZFV0QTAzK3MweUFlU0haa3g2UDJO?=
 =?utf-8?B?NVhjSm5nbnlmRkIxRjljTUd4Z3M3c3lWbGtPR1Q3MUpUSW9vWlpQb1Z0N0dm?=
 =?utf-8?B?RlNRNXdFQktZQmtNdUx3NGFTTTVVTTIrdHZHUFhKZ3FNbXU2VDZyYk8vWTBp?=
 =?utf-8?B?NS9xUVBqTHJlK1hIcENPL1BPUmx4QVNyNXF5SXRBTXgvcXdaWHEzNnJRZlRk?=
 =?utf-8?B?VWFsYS9FWStHRzQrbHJwZThldzM3anlOZ2tzNnNnN3ZFakc3R0w2eStHZWsx?=
 =?utf-8?B?S2xpUVZUWTdOV0xzdmtiR3dmNUlIdmNPNzNIeVc1a0owV2dpQldpeWxuNGs1?=
 =?utf-8?B?OFdaZzJRZHc3ajBPKzVON2ZqK2NkKzliaVpzNEpSeHRmSUl0SEcrWGhtTFpO?=
 =?utf-8?B?bXFtSXkxWWhaRlNhYUlJZDhvR0o3VG9iWFljbzkyemtUWk92UWdIWURGUkRQ?=
 =?utf-8?B?UkFBRXFJdzA1Zk9HYU5GWXVMcVhQNGdtTG9kRXViMGpVYlVaWWJNYlN4Rnlq?=
 =?utf-8?B?UWFRNTl2cDlxUU5DY1l3R2pUa3JWZ3lqSXBZeVR0WGhBWWtWTURwa1VzTHNC?=
 =?utf-8?B?d3NlZGovdnRwcC9zT0xBeUN4ZWJzVzFEODU3OTA0S0hyaEc5dy9WY3NYOHJk?=
 =?utf-8?B?eDNxOC9wODBjajRlNmJaU0xXdkVTbFROaXBPeCsvZ2ttcFdDaThtTVJoVTBV?=
 =?utf-8?B?TjR3Y1hUS1RhcG0xdTc0dGRlQ2pHTTJJZGk5ZUtLTFArSit0OFl5cHZkWkJL?=
 =?utf-8?B?QUdoaE5nNVh2cUNubEgzSU1FOTVGbXkyaEg0TzBPSzlpMDkzWW1odjg2RnZW?=
 =?utf-8?B?UTVJR0Iza05HdWsyWVRzZ2RheXd2MTJCUkJISmRBMUEybmMzNlpvVitjZHhh?=
 =?utf-8?B?MDZNc2t4bzYweU5iYktndVFzU2NkNE1wZEVTVFlTTU5ZMkVGbWhscC9QVWlB?=
 =?utf-8?B?TDdoQVBRRkFiY0xZSW9sTVppM3NDVE8xaVN6WUZTT3pvS2doSGtCelY1OEgv?=
 =?utf-8?B?UGtmd3V5OGlBU2ZzNEE4WFcyUEVzUjltU09tVWR1bWlWemtxMDR3L2JPWlN0?=
 =?utf-8?B?Y1F4bkJLU1o4Tmt1SFA2c2QyS3lkeGVpNzdhcUhZTVA2TXBaeWdBWU9YZFVB?=
 =?utf-8?B?aEtyR0NjeS80T0ZCYS9YMkQ2WUxSMUVDSDgvVEtLWnF6NkNHMFhGWHpjRndl?=
 =?utf-8?B?cDR0dXQrakFyVXZySkRHTXh6OEFQTmcvalFtaENZQzJRRVNJZnRnUHVDcXZq?=
 =?utf-8?Q?nPoUkPogqfacFk4e/toDrVmTQ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <D29811AEAA6B6547A3CE5FC45E3CF77E@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45374fe8-075d-49d1-e03d-08dc26c7821a
X-MS-Exchange-CrossTenant-originalarrivaltime: 06 Feb 2024 03:55:50.2320 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NTsTT3K5T19PwIzEHJyIn1JZG0UJSJFAcjKvRkicDXJMZTgP8RWP2I4SHFNnjK2wYjyRtH3Ef/g4/sib9Zi/jw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7849
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
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

T24gVHVlLCAyMDI0LTAyLTA2IGF0IDEwOjM1ICsxMDAwLCBEYXZpZCBBaXJsaWUgd3JvdGU6DQo+
ID4gDQo+ID4gQW4gZW5kLXVzZXIgY2FuIGNhcHR1cmUgdGhlIGxvZ3MgdXNpbmcgdGhlIGZvbGxv
d2luZyBjb21tYW5kczoNCj4gPiANCj4gPiDCoMKgwqAgY3AgL3N5cy9rZXJuZWwvZGVidWcvbm91
dmVhdS9sb2dpbml0IGxvZ2luaXQNCj4gPiDCoMKgwqAgY3AgL3N5cy9rZXJuZWwvZGVidWcvbm91
dmVhdS9sb2dybSBsb2dybQ0KPiA+IMKgwqDCoCBjcCAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3V2ZWF1
L2xvZ2ludHIgbG9naW50cg0KPiA+IMKgwqDCoCBjcCAvc3lzL2tlcm5lbC9kZWJ1Zy9ub3V2ZWF1
L2xvZ3BtdSBsb2dwbXUNCj4gDQo+IElmIHdlIGhhdmUgMiBHUFVzIHdvbid0IHRoaXMgY29uZmxp
Y3Qgb24gZHJpdmVyIGxvYWQ/DQo+IA0KPiBEbyB3ZSBuZWVkIHRvIGF0IGxlYXN0IG1ha2Ugc3Vi
ZGlycyBvciBpZiB0d28gZWFybHkgaW4gYm9vdCB0byBoYXZlDQo+IGlkcywgdXNlIHRoZSBwY2kg
cGF0aD8NCg0KSSBrbmV3IEkgd2FzIGZvcmdldHRpbmcgc29tZXRoaW5nLiAgSSB3aWxsIGZpeCB0
aGlzIHRvIHVzZSBwZXItR1BVIHBhdGhzLiAgQW55DQpzdWdnZXN0aW9uIGFzIHRvIHdoYXQgdG8g
dXNlIHRvIGRpZmZlcmVudGlhdGU/ICBQQ0kgSUQ/ICBJcyB0aGVyZSBzb21lIG90aGVyDQppZGVu
dGlmaWVyPw0KDQoNCg==
