Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 947C5869D13
	for <lists+nouveau@lfdr.de>; Tue, 27 Feb 2024 18:04:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85E7210E951;
	Tue, 27 Feb 2024 17:04:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="JAOc9ZUV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2044.outbound.protection.outlook.com [40.107.243.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09F510E951
 for <nouveau@lists.freedesktop.org>; Tue, 27 Feb 2024 17:04:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kOR8B1z+vMHt0uLqaNmHPEN0OCnJPCoaYs2+GYoZuBzRVIsTGLTuqAHwC7uEZcGUcRBm+kVXByDfemoyv6tsu+xd2sXVciDw2NSmuZQ/yf2rNF0waKmHMHPyq/p9ilryv5hETEdgn8nXHP5Xy5+1phXPDpPWqNQexAjMGly7HhSJVlwg/pDxEj/4B85Ab3TwFZjG+k5arvGpKKl/uY+WDwNAIqtQZm52zd54K1lwL1lbZc7kvsTqeUEwToPoSSk9ov3/mHLhSTb90CJOdUjhIr6FqEUVDXPy/iqihyYrKWjDHMtWHvd2F3Wpa5BO8Z9v7IOv3Xu+oowZwByNAKD3uQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y6Fy2pBcLqkjzRjIhAxfc0qyVgxoJr3XvXGKVfP/UUw=;
 b=FMJoNYV1hbOMEq0ioMn47d6w1k8mim/grbiNtTiyE4IeJbO49YXW8hq9kKaTZGq+iWHqSXQi4knE5GrjHIgcUjMp71dY3r7sAQVjfmMZFm/2sd+JLWkQI2BkhxnNJ0fTCKP0I4K4UwkyaLqOhWB3HwuVzBZiQUiB44gGMONFHZ84gXdO1SxorbyiT5n/SRjlZ0QUEmsDtIPe4qM2m+Xt1xVS+l6eU0KeQAx1pBegsj2AuwpcmIFEoC36VeEEHW92vgBsiAQFUXsc753pngjpNlKtbt5Q7q8KKp/KQtuC+vhI0JKjouaEPqrPZ1dngI7PDDgDAdEAL6gugTqGhNanSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y6Fy2pBcLqkjzRjIhAxfc0qyVgxoJr3XvXGKVfP/UUw=;
 b=JAOc9ZUVyDsy8kzcq1vPsqvwEuTM1/9CyrbQWRz2zJ4dUSFA6m/y2tDuccuHs/18QLUhl0Ze7lqeSya7ZrWqPSD1uR3iEwYYHjDJN662iNeDiPw4v5rStTS0aAXYU36BgMiLeuK2IeMQgu9bKDE6ZXmgWalvK7jzAOXycff7Im8nGlTXg2U75hfwhJcWIAz3tniH3CVL4PbLp5xtwWINQ7uxyxh2ST05btsGHGaGOdFFIgtLeuIDlSs70Gj3cy9J6U8aYAlWPHBVp4y4B4WiGAN80kEFQeOMqz4YHcr0CpSO3tGAJNr7uoeciNIFI9MJysFinmlaBYSWCh9oHxtuNA==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by IA1PR12MB9063.namprd12.prod.outlook.com (2603:10b6:208:3a9::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7316.34; Tue, 27 Feb
 2024 17:03:55 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::5971:c817:90dd:4fe6%4]) with mapi id 15.20.7316.034; Tue, 27 Feb 2024
 17:03:55 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH] drm/nouveau: retain device pointer in nvkm_gsp_mem object
Thread-Topic: [PATCH] drm/nouveau: retain device pointer in nvkm_gsp_mem object
Thread-Index: AQHaaPdoUB5ddHUFZ0q0IxKwfW1gIbEePx2AgAAs1wA=
Date: Tue, 27 Feb 2024 17:03:55 +0000
Message-ID: <31d4a0003e1f0d335da3342673189560cb57c097.camel@nvidia.com>
References: <20240226210408.4022992-1-ttabi@nvidia.com>
 <9ede5589-cc59-4bf7-8b53-77f9a2638a70@redhat.com>
In-Reply-To: <9ede5589-cc59-4bf7-8b53-77f9a2638a70@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|IA1PR12MB9063:EE_
x-ms-office365-filtering-correlation-id: 7702f1da-2358-4793-6f7b-08dc37b614f6
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: XBgim3X0j2u94UC87JDf/ExhhkiOZdrZ0vhOJ9i1ENtgGlTMA8r2ADoH47CI2J/kLweBkiGs4B/1ixlVHBY3mcx/frl8DHj/xECTbAZ8gHYpnd63WrO82wPcgNJWod6RaAjj9p/MmeMMmdKaYUdfTLVSeX7F4YahE/MqpxObejky2lSv+u9t8Y7tY5q1/6pfqMC1lsiSN73pjsHu34qjFRLzW9T6XBPwp873N5wJ83DEu0AuhnWZwGQ4HD7NP7CcF2gGd5jggk5gMD+XIE7/xa2UhZg55dLoQ/Q5GcF9Y6ucwxBcNpkontgIkjYlqLXPlucmdux3ZOYDFNvJ/9I6/8IZZdAi+n9dHpCvGeU7pjuqHi0lnrVODjaQjoNZBUVKMPuzlrBuHnwGMW3Lc6e+cl4V/vlouXWd28dbMceq0MUS+uYKbp6PBuJw7jlfJRgEJSXZjkCo6GKFBhjFoZ/BJpf/3ZzUhjQPFjtvoXn783fs8NbGfox1zx0DSifCwv8HtHp6KF0M8oNDbjp0u/4gALl87nOeH63Tn5svOiz2igcYXq32VvEb2oOCskJOEl9/aiy/Kq1Oau71/3Na1eGEVMcUO3P8Lz5MBGmJqoGsLcfE+mhVGosPSi/83V8m8oz9hF0/DWUuVK4ULkBX3BQBYlH4sAtxV+9p9UgHUww7mSfbjAKyThunJHClh9v24mLU1VYsRUb3NppPB4ShAuViz9E8DrX3tqPLxVFshqvMWuM=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MnQvbjluc1BZVDc2WW8zQmF6bDg5V2JyRlhXbUhHR1F2ZVVIZWNnd2tzSDZn?=
 =?utf-8?B?QVNVMXo3TG5QQlh0TU95NE9KN0E5dUNYWmJoaVJpL21tNnBOZmhKckdTdlpl?=
 =?utf-8?B?NHZrVmN6UlpUL2Q0ZXdPT1h0R25ESTdVd25JT1h1TUg3S1B5WGY2eTg2cURt?=
 =?utf-8?B?bFlVNW4wNHhJSmlrUVJGMjRqU0VpQTRJSytmOFhOZmk4VWdLeWlPbDhMQ0Y1?=
 =?utf-8?B?QnZZVVNEYzRra013S3BWMXFhSXY1T3pJYkJYbTk3ZmJidmdFUzJ6SE1mV2Jo?=
 =?utf-8?B?N3FpVDNxWW44aHNvYjI3ektrenJraDJpODVVWUg5c0xieTVPRTd0Njh5MDYx?=
 =?utf-8?B?MEVnQ3F5bG0zem9MZG5zZTc2Q2p4bCtGZDIzNGplZTlOdFdzZkMvRURlSlRk?=
 =?utf-8?B?c1ZNN1JiOG8zQm03QmdQbVB1VEFJQTZSZDZLaXdaWDBMWmNYM1QyU0NhcENr?=
 =?utf-8?B?NHpGdW12azVVUjNDdlFuN0pBODRnTzhOVVlnNm1OOVpqSFZTUHNXT3pHTzdl?=
 =?utf-8?B?S01xQjIxR3NoN0NXQzNxYXJKVU5ZZGNUZkRpQkVIazNpSzY5VEJHZlRFdjRy?=
 =?utf-8?B?bE02R1VpS3B4REpRcGdNc1lwbFVjT2VIcjU1WXRiNldqS1hIV1k1RG5EOURk?=
 =?utf-8?B?c0ovZlBzNzRXZTRsOFZuK2EwM2JQU1kxeTJhRVJqN08rc25XQ0crQ211VENP?=
 =?utf-8?B?R1FmcHhaS1ZManEwUVJxWlRwV1c3TU1wZWJyQ2tibHlxcXZ4a09BN3RvSFNI?=
 =?utf-8?B?Rm1vdFdTUkhNd3JXZUJTODRObTluN2VrendzSndnd2lWM2RRRUZWcW5CMG85?=
 =?utf-8?B?dHZmcHpaazFnQlBqMG51NW5vUDFTekk0ZE1kaWJLWWQxYllXaFZPMmRhQVBy?=
 =?utf-8?B?OFNJaEJ3aTJKbEVzOEN2eXBTYUhteFpGZkNuQzBScm1GZ1IzRHpqaDBzTnFq?=
 =?utf-8?B?MENOMDRpbVdrSmcrTGJDcEpES3FlTGpIOFhFNEUraG5PYktTQ2lUZFZlcnhj?=
 =?utf-8?B?a0N2NkU2WU5iQ1RBOG1wVlJUY3U0M2pUMk16TTU3QVVDaFpyOWt5dGp2QmdF?=
 =?utf-8?B?UGwvTE5pSDVtL3Joc3FhLzFTMGMwZnhpVjJOTVdWTVU2RFhNQm80YTNlRFFP?=
 =?utf-8?B?OTZmM2tXKzN1eU50MG1hd2xUSFAzNTJ3WWNWVWVsZTJGVE1xT2h5K0F2eEIw?=
 =?utf-8?B?TjY4V0tRSEUwSHM3cjRkQjd4cjA0bjZpYmhHb0N3bEY2RjF1VkcrRCtITWtZ?=
 =?utf-8?B?WU43a2RnN0U3a21lMnNGQzZsRnNWeTNzRUJyV0FLa21uQWtFZU9WQVNmNVdn?=
 =?utf-8?B?dzRyQXNnYkRhdkxBeU9yQ3BMbXBySm9BTWNKeWhKWGRudFVVcTlzSklDWjJG?=
 =?utf-8?B?aGIyaE8vajIrU1VWVXlzRnhFaU9rU0tWTWs5MzJBeVhkemZQT2lMLzFObWh6?=
 =?utf-8?B?Z3ptd2NWQ3NXblNBN05vOXl0QVB4SmVZZy9QcTNEY0hHbUxNUFdwbDVhZVRk?=
 =?utf-8?B?SkkrckpjSUhvMTBGUVJTUHVsQnBRN3V0YS90Y0xIUlRpM3pSMm1aeFRkTUIw?=
 =?utf-8?B?bVZuNC9Vc0NEekxoc0tZMFV5cldTcGdGeUh5T3M5MjN0TGVsSndDdXdtM2xu?=
 =?utf-8?B?YjFJdjFsM05GWE5xTU1wUHU4ZWN2L1YrclNHdnptYWpiNFY2eHVicmtCMFdw?=
 =?utf-8?B?MkE3MW5qQU00ZXIyM3cvUW9TbFh4ZHRnSHVINVF6cHNEZUhDdFdDQmM0TFh6?=
 =?utf-8?B?SUtobmhDelR4dnAwL0tHbzVRUlRzMnJ4azFSOCtFQTNkZkhyaHRxalNGbW9W?=
 =?utf-8?B?c2dyOXNjMjRxOW9ua0xDM3BUU3VUaXpwbnpHSXIzbDEwSmJjaCtaQzRKY2lt?=
 =?utf-8?B?aUdGWmNXSDhRNGo3eU9CWXl0N0ZqUFB4Q1VIWkI5MS9CUERnellhQkV0bllu?=
 =?utf-8?B?T0w5NUpRWHhneEtrZDdENjR5VCtnNFN4aCtwTGYzbkM3aWVwVHJLVHA5WUhT?=
 =?utf-8?B?Sk0weHRTN21HNmFDSjRoeGFQTXBHcVFEdTQwakxqbkxUdjVsL0c2VzlvMTc2?=
 =?utf-8?B?UHl3eDB5U2RzUkFrNWtNbmNvakN3SkJUN20yU3QxdmZEbDg0Rnhna3kyOW5w?=
 =?utf-8?Q?QU1h/tH65NY7+bIvfKHJocSle?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <DA9F2CBB8186EF429159F724CF9F864D@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7702f1da-2358-4793-6f7b-08dc37b614f6
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2024 17:03:55.4855 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: Do7qqfQ9CasXnRJUsQtBit6gM8lzPgvjuuzXOlSULVkeieftTQbWs/ukHR1oLHNIl4bcZUUGQ8l1k3IHTQZhQw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9063
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

T24gVHVlLCAyMDI0LTAyLTI3IGF0IDE1OjIzICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IFN0b3JlIHRoZSBzdHJ1Y3QgZGV2aWNlIHBvaW50ZXIgdXNlZCB0byBhbGxvY2F0ZSB0
aGUgRE1BIGJ1ZmZlciBpbg0KPiA+IHRoZSBudmttX2dzcF9tZW0gb2JqZWN0LsKgIFRoaXMgYWxs
b3dzIG52a21fZ3NwX21lbV9kdG9yKCkgdG8gcmVsZWFzZQ0KPiA+IHRoZSBidWZmZXIgd2l0aG91
dCBuZWVkaW5nIHRoZSBudmttX2dzcC7CoCBUaGlzIGlzIG5lZWRlZCBzbyB0aGF0DQo+ID4gd2Ug
Y2FuIHJldGFpbiBETUEgYnVmZmVycyBldmVuIGFmdGVyIHRoZSBudmttX2dzcCBvYmplY3QgaXMg
ZGVsZXRlZC4NCj4gDQo+IENvbnNpZGVyaW5nICJbdjRdW1JGQ10gZHJtL25vdXZlYXU6IGV4cG9z
ZSBHU1AtUk0gbG9nZ2luZyBidWZmZXJzIHZpYQ0KPiBkZWJ1Z2ZzIiwgSSBkb24ndCBzZWUgd2hl
cmUgdGhpcyBvbmUgaXMgbmVlZGVkLg0KPiANCj4gRG8gSSBtaXNzIGFueXRoaW5nPw0KDQpObywg
SSBzaG91bGQgaGF2ZSBkZWxldGVkIHRoYXQgbGFzdCBzZW50ZW5jZSBiZWZvcmUgc2VuZGluZyBp
dCBvdXQuICBJIHdyb3RlDQp0aGlzIHBhdGNoIGZvciBhbiBlYXJsaWVyIHZlcnNpb24gb2YgbXkg
ZGVidWdmcyBwYXRjaCwgYnV0IHRoZW4gSSBjaGFuZ2VkDQp0aGUgZGVzaWduIHRvIG5vdCBuZWVk
IGl0LiAgSG93ZXZlciwgSSBzdGlsbCB0aGluayB0aGlzIGlzIGEgZ29vZCBwYXRjaCB0bw0KaW5j
bHVkZS4gIA0KDQpJIHdpbGwgcmV2aXNlIHRoZSBjb21taXQgbWVzc2FnZSBhbmQgcG9zdCBhIHYy
IHdoZW4gSSBwb3N0IHRoZSBuZXh0IHZlcnNpb24NCm9mIG15IGRlYnVnZnMgcGF0Y2guDQoNCg==
