Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5088F7FCCE7
	for <lists+nouveau@lfdr.de>; Wed, 29 Nov 2023 03:32:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B83F10E5E5;
	Wed, 29 Nov 2023 02:32:03 +0000 (UTC)
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2064.outbound.protection.outlook.com [40.107.96.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 28C1010E5E5
 for <nouveau@lists.freedesktop.org>; Wed, 29 Nov 2023 02:32:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AyrsVsOh+Fhq1Tv4fLT3/PVR0G98928Szh8TF0ai6ivgef0lNGVkNIPNiqR66FBEqHsIZphLVCAD5DvYPXF1GUTEc76egvhX9NcTgk6Y9v+jVpEgs10LYsdhloVj1MiUA0GuJp5IU+wJ//BN6tVS3nh0OKNbl7Fhi4t/CbpWyV3WfRUaOh0wacKFkCQYJQyeRiycasf8uVZYe9WxHEB8mnGOffnBbsjWayByz8jgy6gBlE07IF7CtE3cDnK7k4EQw87xyn31epJGKmmJpv0S/rBPOlbb3xP4r1/zkHroq1zz4SsYxVmXdeLvVfUYFvx13mCvGp119T2BKOuPloqKLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUFPaYFtilIQPvREPE/oWtPxeyU+XZbLf9KVT90Bqmg=;
 b=bOrr+WqSfkhi441T220AQtmZbaQrl12MJSASAuQiWjWeNB88RZIFOsc/rsuYcRBteRniHDV29zMv9JAKP0nMk5EeDilyFTjmZdHGtlbtC6OTd/aV6E55BcbH3Xamr+O6ZXwbWCeo9lBF0/8Nkr0ftNycwJoSDGROlZYYcHa2W0aYpVT0HGw56AM3FhCV46tASHKEMSas2B84HYsYoop5M9GO4OvtdFw5KF8Eih27UpU7eAmuBLAI5DHxaycpA+maE1f5N5T1cGo+9tOu9Ua2wOGn+WNFxrs+hZzW1kuQMwqrdFNvLhtYQM4t/z76wO/7FfoTOCYmMJqX2pv366/7SA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUFPaYFtilIQPvREPE/oWtPxeyU+XZbLf9KVT90Bqmg=;
 b=P4nnpE1SUqvdXTBSy6PaoGBrSQnKKXIA7TM5rndDMd59GdMuaWM8Q+Cf5r+DbotfXznx65r/qQ1OhZ2hdwLYkvR6Mg3t+OtWvNB6+DQ7WhIJ4ikBH3InEmrTYq0E+kPNxxoHgdu+fidbTQQt04oi5cD00rzI3qJz272Zvl3ktbHnMHLW09bn2bbtG1fP95p0ZY5PWh46VcgHSijWIAGvat0h2Xn9qpVJdjqmgpz6MGGdMAM3fSyw8I0Mqz/2sjjLskbCJzaaZt7Oz1j5V6NGBND8+N9CBQhKqtVy36kLzpOK3QqP8FrQU0ZzUakxzHZK8G0qicLxgKZYyCp4EUpcxw==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by DM4PR12MB5200.namprd12.prod.outlook.com (2603:10b6:5:397::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.22; Wed, 29 Nov
 2023 02:31:58 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::6799:dc7a:e121:1af6%7]) with mapi id 15.20.7025.022; Wed, 29 Nov 2023
 02:31:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Thread-Topic: [PATCH] [v2] nouveau/gsp: document some aspects of GSP-RM
Thread-Index: AQHaHYKHYyOBOqqKZk+qbaGbYXy0/bCQkX6AgAAL74A=
Date: Wed, 29 Nov 2023 02:31:58 +0000
Message-ID: <1edd0f9455531b80eee0acf76a49063de66625e9.camel@nvidia.com>
References: <20231122202840.2565153-1-ttabi@nvidia.com>
 <eef22f2a-3c25-4895-9130-5076c85d1a03@redhat.com>
In-Reply-To: <eef22f2a-3c25-4895-9130-5076c85d1a03@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|DM4PR12MB5200:EE_
x-ms-office365-filtering-correlation-id: 6ef41d5f-c6bb-4400-23af-08dbf0835c3c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: sDZ0Hzm33RWnOeBqC1wWMXhnXmEAFUP8rfX7KEL9ZWpMZxdvRvQnXc8VVhlJp/PSqgzcvzo4CEw5ptpNnuVno0y6dY6eDvonCexrvwAsTzBxmtmv3NxC+XB6cDrIEixOg/CglS0vUjVrjIPWEWkdRcRELgWaXOIMwMlJTw5WShw86aE4H89WaAU9p3mDeZXTNI8Noqjf7gb3OvS6kyiXnJKBWILoTp0jdX/7IVmE2zNIV0aIBIQr89IMQhy6g8/EdxvLkeVBEQYEHHpBNmGcxHXoQ9DdQRrG5Zn9coF5bJE1xWpxXAnR/3GXvW4grw5HsD1/XBofbBWUKhhQhFzQwDGnJSkHoL2yq1jja+pC8mgKmu2ZnZvNx58NgyAhC2cZS0r9najdTmFz3sw9wnLvNtpcn6zHSwEG7qSv71mCymBNyoPvMpZfI4xMlp1JsbHWJV+I+23BGT6SAnywHShReoeHn/QRuB2fllwI205NtgM+mpGIHRXZUYd8B+Io+UWsmm5dSuiyDyLqXWaED6/RjoigqousRgjCYrUHjedDd34+C0vjF6pOe7rQpf0ZZWc8Ao1tw/F0A4Z6D78hisXiTZ3YbizkdkIYsmuFNlKvzMM43Jxf9oC2jiE75Vb2T9VU
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366004)(136003)(396003)(346002)(376002)(39860400002)(230922051799003)(451199024)(186009)(1800799012)(64100799003)(6512007)(2616005)(71200400001)(478600001)(26005)(38100700002)(36756003)(86362001)(122000001)(38070700009)(4744005)(2906002)(41300700001)(4001150100001)(316002)(66556008)(66476007)(66446008)(64756008)(6486002)(5660300002)(76116006)(6506007)(66946007)(8676002)(8936002)(110136005);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MUJhek5taWdsQjJHT1RIdTk1d2wxZFI4dGk2aXdtTFBCaWFrZWVxb2Y4MnpU?=
 =?utf-8?B?c3IzU2dBVVozUDNHTmZCYklpVSsyeEljR1JSYnJzNXMzOS9rdmo4Q0NwY1Fm?=
 =?utf-8?B?d0pFKy84aERWMnZJNlY5UFBGNy80V000MEVMNDdSaUIwRmpWYVZnNEhvR2Jv?=
 =?utf-8?B?am1CRTNlMmtRM1pvU0VsblZKck56ZU1QeDRLRnBOZ3JUTlhndXUyZmRJbmtq?=
 =?utf-8?B?akMxc1FHVGNXZ2grYXh2M2dFRXMyZ3RJYlJUMk9McEVkMHp0S0M3Rm1tbTdh?=
 =?utf-8?B?VzljYU5CL1pGcnNQZ0FZV21PTXNNY3FYaDRhRE1pREhmZDlVQlZiUklwODNC?=
 =?utf-8?B?YkZJbVhuOWtKMHRPVzFqNWJGbmFHWVllWW15c0oxZlp0UkpPRUQ4a3ZmTC9E?=
 =?utf-8?B?UnJ3dkZhNTE2K1FTYVNFbDF4ay9EZWlDVUNYeW50Z3d6NTQyaVJqSUt3VmZI?=
 =?utf-8?B?SHppUndCOXVGVlRsd3h6L2ZNOFlUWjhvbXB0Rk9wZkxIZkhIYTN1b05nSVVK?=
 =?utf-8?B?MElISi9SeTdEY29GY3JuQXRtdXVTbk4wQ1FQQnFiZERHcjZUZmM5ZUw3bFhP?=
 =?utf-8?B?L1E5MzdKVkZ1L0czQjBoS1lZaU1NS001eThxTnlrRmZUNUgrY3BDcmVHNFNG?=
 =?utf-8?B?OEZWTlBETDAvb1BtUnFxVWJzeTJucnVXS25HMjlCT0hBWTQwdUlrdkc4MEtu?=
 =?utf-8?B?VlJaK1liTVc0clpQOXR6bzRoa1hLR1hQeGdTcmhGQVN4ZXR0NXlVaUdLVmRE?=
 =?utf-8?B?TTBSZW03aFBHYXkrNTB1VjFELzk0Y0JyTnpqK2FLQW91NXNUSGlhL0pnYStN?=
 =?utf-8?B?TE9nODZna3IwQW5wV3hUbFdxSlFDVTZ0UndXQkpxNkVWSjBtTmZ2NG01Vi93?=
 =?utf-8?B?TTgxTUxIeXJBczNYQURNKzlTb0l6VlhlSDNpRnhpOTl4dU1Mb3dIRURGT0lt?=
 =?utf-8?B?Y2pYKythb2dzdFdYZGxJa004UE00VGtFVm1mTXdmV0NqM2l0MDBmNXhCSlZG?=
 =?utf-8?B?Y20wckwveGJJVGs4MXNKMjJna3R4R05wbjdhU3pBajRPUVdZeDNVa1dLaTZO?=
 =?utf-8?B?V211K1YxWm5ZRGFqcjYrc0VJR1FtQlRYcjhpYjNtRk15b05MUjJoZE1jT2Zn?=
 =?utf-8?B?NklHMEVqL2hjWlQrNE9YbWozSmhvS09tVFZOWDc2L2pMQzFHcWhyQk9hdnc3?=
 =?utf-8?B?cDlkMlFpcnRqWTRlY3JxQWszNmsvaGtUUHNhQnRBR0pvTlB5NzVHcHAzZTkv?=
 =?utf-8?B?OGRHeFZ6Y1cyVnVranIwNGxwYzZSUDJlSWY4RDVQVTZJT1RtY0ltaXRMTHVB?=
 =?utf-8?B?Mm1FblhwNEpya1VXbEFsWXNCeEFxN1M5Rk8xQ0s2L1MyQ2VBVjYrd1UvdDBK?=
 =?utf-8?B?RXVHOUVsRFJwbWdlMHAyM0J4WG1VM0t3T1FET2d2QWliaDJmRG82bDBuazZB?=
 =?utf-8?B?Z3VoVjQ4emt1YlVvNGE5RFhidTgwWWQ5cU02MzU2V0lRbGZudndFTmxydjFk?=
 =?utf-8?B?REV6djhZaytoS0tIQktQS0RhV2lhakduV043TytJVENXT3orejZzK3Q3UmN6?=
 =?utf-8?B?MjVDckdsUTFPYU11Znd1TjNlTVJENG5ZZVhiK3djQWliWE9yQWgzTHlodDA1?=
 =?utf-8?B?eE42VTBieXNtMDFjWjFFTWpjejdpS0NCUk9Yb1p3bDRuVnQzUmV0OVFJdTB6?=
 =?utf-8?B?WllTK0UrRUYvczJhV2hxWkxVeE9iTGRtNDdEM0libDRSUjNvMjJmNkRWL2ZD?=
 =?utf-8?B?YVlwaUNrcDZ5aEdmS25FN1BRQ1QvQ0haQjBTTTRDdUxiSU5ZMS9KNy8vSFdy?=
 =?utf-8?B?dGRjRXFNd2pHd0swNEYxVlhRcERSTitmYU5RKzdzK3k3MzFhUTlvUG9nNzRq?=
 =?utf-8?B?VjJ1QytwZG9tNHRGQ1VlVVVwLzZaNFA2a3lPTUVSdTRGVnBaNUlUaThON3NN?=
 =?utf-8?B?TjhrUnFQTkdCNk1uM3NGdFFCV2hHY1F3L0ZicUcvWllkMkw2RDN5WVFIREtV?=
 =?utf-8?B?ZThvVzFYc0wyT2ljSWw1L0xkSWI5bGgvcHdKdFFOeERGb0c1TWkrWmx4ZW1k?=
 =?utf-8?B?WlZic1RYNjVhYm5QT0l0Y3UvZVEybGVkdnp6YW9FS3drN2dqNGNoeDZXdlJi?=
 =?utf-8?Q?Ms4DnXDxWr+B73EX2L4U0iyGY?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B48F9E6AF00353488767FE7DBA6C1786@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ef41d5f-c6bb-4400-23af-08dbf0835c3c
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Nov 2023 02:31:58.1297 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: aLEQC1DUTgtZaSxF+9ih/8wQIva0/BMDTf9U0k0wdW5hGCG+JPCMg7uBrdiIWo1q6qu0L9NQ5owlKp7dmG6Odg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5200
Subject: Re: [Nouveau] [PATCH] [v2] nouveau/gsp: document some aspects of
 GSP-RM
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

T24gV2VkLCAyMDIzLTExLTI5IGF0IDAyOjQ5ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBNYXliZSB3ZSBzaG91bGQganVzdCBsZWF2ZSB0aG9zZSBhbmQgdGhlIG9uZXMgYmVsb3cg
YWxvbmUuIFRoZSBsZXNzIHdlDQo+IGNoYW5nZSwgdGhlDQo+IGxlc3Mgd2UgY2FuIG1lc3MgdXAg
YXBwbHlpbmcgdGhvc2UgcGF0Y2hlcyB0byBuZXcgaGVhZGVyIGZpbGVzLCBpbiBjYXNlIHdlDQo+
IGV2ZXINCj4gbmVlZCB0by4gSW4gdGhpcyBjYXNlIEkgY291bGQgdGhpbmsgb2YgbWlzc2luZyBh
IG5ld2x5IGludHJvZHVjZWQgcGFkZGluZyBvcg0KPiBzb21ldGhpbmcuIE1heWJlIGEgYml0IHBh
cmFub2lkIHRob3VnaC4gOi0pDQo+IA0KPiBMZXQgbWUga25vdyB3aGF0IHlvdSB0aGluaywgSSBj
YW4gYWxzbyBjaGFuZ2UgaXQgd2hlbiBhcHBseWluZyB0aGUgcGF0Y2guDQoNCldoYXRldmVyIHlv
dSB3YW50IHRvIGRvIGlzIGZpbmUgd2l0aCBtZS4gIFRoaXMgcGF0Y2ggaXMgbW9zdGx5IGZvciBu
b24tDQpOdmlkaWFucy4NCg0KT24gYSBzaWRlIG5vdGUsIGlmIHRoZXJlIGlzIGFueXRoaW5nIGVs
c2UgeW91IHdhbnQgZG9jdW1lbnRlZCwganVzdCBsZXQgbWUNCmtub3cuICBUaGlzIHBhdGNoIGp1
c3QgY29udGFpbnMgdGhlIG5vdGVzIHRoYXQgSSBtYWRlIHllYXJzIGFnbyB0aGF0IGFyZSBzdGls
bA0KcmVsZXZhbnQgdG9kYXkuICBBIGxvdCBjaGFuZ2VkIHNpbmNlIEkgZmlyc3QgZ2F2ZSBCZW4g
bXkgcHJvdG90eXBlIGNvZGUsIHNvDQpoYWxmIG9mIG15IGNvbW1lbnRzIGZyb20gYmFjayB0aGVu
IG5vIGxvbmdlciBhcHBseS4NCg==
