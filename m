Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BD69C8789E
	for <lists+nouveau@lfdr.de>; Wed, 26 Nov 2025 00:59:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA02510E0A8;
	Tue, 25 Nov 2025 23:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fXtFcPG/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010045.outbound.protection.outlook.com [52.101.56.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EBACC10E0A8
 for <nouveau@lists.freedesktop.org>; Tue, 25 Nov 2025 23:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TwcdKxGY/U0lN8oNvHnGx1TLchcKhNxmNJewEaelQtV3whPMb+mp19TQnKmF2jdCFHHgpsnFMKJvpAtFYxHbsVaXLLbG93S2sm6YZjrkyt5QuN7f4K03Vj1FKVlF1sU9y6iO1NrFAHqaxrmIDc0DS/IPl1AnQArZqV68jmEgc9eogoXMYAwEU2k0zVpnpsxawJ1L7XB0Dd5yey5o5qqhAvGO0nm9yp8Z4lzV5woH3EyuJ2OeDKyzVZiJaulzbz9Fwkp6NtY0unWs+HBrBUPMAUPRwOJAUNTDHkinv+7lHiVeSB9E3y273SyqXbfKU7uZA8BFHfqqHBHOY1YvUe9rfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CyYpLHS3bM9fzdFlC0evJgmADFNNZMLx1To3V/1qr5Y=;
 b=gXRph6StrevrxaMbXz06rGRra5Dz0EtbHEDPJqz28d6hPx9BEGvGPS57CCGRTSW8/WgFN6OGSV16sf6WNe3b8/47mhjbYS8ek0pGCh56Ck+w9lnK6dGfOkDheegF6CISjnHtGlndDtQeOT2F2X+Mo0nssRV6dZH1j6aG+rr8eVS2VmkGDHFvqe4SF0/5i2DlqTeZPsyDgPkcJkhpey69nbFXckajPSzri2xULoVjD5CgHUA0V9rYbwSYDBYqN7eimLHLQvT+WWSTjjSSyETku8gCEQOTlNSlHnaKbhW4OgBh9RSpvAhp2k41150tly03mgt807kluoxEJ2GCcEaDxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CyYpLHS3bM9fzdFlC0evJgmADFNNZMLx1To3V/1qr5Y=;
 b=fXtFcPG/Y7RSo1LcCfI/25Vu2HgK46eYa6S4qVVfsXDfy759JnIc/1DBUps5uTZEFOsOlbvAHzSavtPsEfOrDGvg9Cz6y3n9cQFoJJg6prg+vzc1cZ9baomQ9ynNGhHN7M1KxWnqWf4+rH6zUMGv1373A3XnZHCJ8FoMnrlKHrNvaa54p1qTei7lGnaX0+lvn0+KN1Q+MgiEUxwLe5nLw5QQbBU+/JSGcur9CQbia5RwIi7B0JO6Tj8k1ct4kKtWifyUfhEyBr6yhwUQRqITMEUnnzom9xjK8/mW/NGT9O3b69IG+uihx7sE3I7SF7KeQOJ8cSCp6yryGysOiJPHCQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CH2PR12MB4183.namprd12.prod.outlook.com (2603:10b6:610:7a::24)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.12; Tue, 25 Nov
 2025 23:59:39 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 23:59:39 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Topic: [PATCH 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Thread-Index: AQHcVb7LsaijBVjUPUaIfyiPONlf3rT3gzwAgAygYoA=
Date: Tue, 25 Nov 2025 23:59:38 +0000
Message-ID: <0808b509a969458003accdc3be7c262500b305f7.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-10-ttabi@nvidia.com>
 <20251117231028.GA1095236@joelbox2>
In-Reply-To: <20251117231028.GA1095236@joelbox2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CH2PR12MB4183:EE_
x-ms-office365-filtering-correlation-id: c6a909d3-55d2-41be-b5c4-08de2c7eb198
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?Mkg3QUExUW1FQXRLOVRMaVR4QVg2b2kxVzFQSUFlTUpLNjVnbkpLWDg0R1Av?=
 =?utf-8?B?bndTWm5qTXVyVndyaGhlRThVSFRCd1JDTEdUSi9mR25XR2ZtTW8vNWp1U0V0?=
 =?utf-8?B?elRsV1hPN1pjRWlFTjRIdE9RdXdSUUw3ZWZnbWJKUFlmWmdCNVhSM3JkMkhT?=
 =?utf-8?B?OXBxN3I2SW5JRlRXM1VKN0ZDVnVZR0RSbU1Xd2tlRGZXNkNTM0haLzVrdFdq?=
 =?utf-8?B?a3d0QWdjaVphYWJLK2hzRXR4SnpwcDgwbklIQlB5VURiMnNZK3dkTytaTjVp?=
 =?utf-8?B?WlMyRWZ5eXM5NmY3V1NlUkE3WFFOZzRqYkQ1cFBHU0JTZWpuckZkRE1haVIx?=
 =?utf-8?B?UDFTOXlBOWwrLzQvTnVwejlVSjBWVkZKVjJxQVJDcVNGY3JTRUNFa1JKcEpm?=
 =?utf-8?B?QlAyRC9uWnQ1OWJhYlB0bjU1SUtaanQvQTA2eVo2eUdwN0IvaDZtcUhaYnJN?=
 =?utf-8?B?NkJyT3NhVHdkM2NsMkY3c0RoY29WN0dCcytJR0VGYjIrMFFYWUpHdXZJcG5C?=
 =?utf-8?B?NFlrQW5VRXJZOWpnaUtNOGZ3THJyRmVocXA4aHB5aHRidUNwMTRsam1VSmpm?=
 =?utf-8?B?S3BPM29jV3BEOXlRdXc1TFVXcTdUSWFiVFRVdEM5WE8rVkdXZ0ZXZmFLdVpa?=
 =?utf-8?B?WkpNT0V0SWxFNVY2czVESDBSZVd2UlExZlBvcmhIcW4zWlgyNmZpS2ZISXBv?=
 =?utf-8?B?RWJKSlhlQkdvcE5kT3U0dFM4aUdNRDZyUFl5RzFKWXNnZXNoQXN5Z3JZb3Ni?=
 =?utf-8?B?RWR4d28vZE9tM1BTSDF6U2l4UngyeHlMdFVEVVpFVjQ0SHZBRWUySFY1NHlS?=
 =?utf-8?B?NXFJOVdaUTczOERJckk2aEhyZTVHWEpaZWRkUFJ4S1B6T1hpbjZOeEZERHUw?=
 =?utf-8?B?aDdEVjZpMDJMK24wOHF2c3hWZU83TERmUkx5MXQ4RU9kcHYwN1h0NTJkOW5p?=
 =?utf-8?B?ZC9ibWlIYjRQNFVma0Z5VWllZ3ZQaUF0a1RtUi84MmdiTndKaDArdkdqdUQ3?=
 =?utf-8?B?QlIzb21DVlFuSkdZbEtXbVRydHlubFBsZDgyNUtuRVhhZnUvNXFUVG96c281?=
 =?utf-8?B?KzFENDN1dUJ3ejRsQjlVWDY4WDBrdG5xdFRwOHllRWdKNWoyRzdDUDYwZVZC?=
 =?utf-8?B?WHpsTGxlUVNjZWkvN0EwT1AzRm9PTlZlZnprSHJkbExUOVNTTkozVXJwb0Z0?=
 =?utf-8?B?cHFVOVIxM3EwNXluaUFwVFJOWUxmSS8vNlp5L3pES2duWngvU0xMZHFzMGU2?=
 =?utf-8?B?K3VCTk1IUHhSdkVHZWZOMW02bllKOXhNYU1lYVNKWFRGWjZWeVZ2cEJrQVll?=
 =?utf-8?B?UzdvVFRNUTAyY2h2NCt2RFdJaUYwVExaWU9YektUWkVGYXNCT21rZUJPU0Vq?=
 =?utf-8?B?RVhrMlhEaGVnZmRnS05Hb0Qvc2JpSHVSS0RmbkUwSXREaTVaVmp0dWlyc1BC?=
 =?utf-8?B?ajluUzZLZ0FGaVU4NXFnMTZGZHpNQ1B2MTk4eU1BMEVDM0JpdmI2b1FiZTdj?=
 =?utf-8?B?YWtIVTVrMGlEOFFiVUZBNll5RFgzNjhLYzJJQmRFUnltemNNQWRDUkUydzRP?=
 =?utf-8?B?WVZSWE4zNlRGZXNIQXJ2b3p3ejcrTm9TSDNra2FwMlFrK3ZNZGlPUWoyNkNC?=
 =?utf-8?B?dUhPRHFZMzQ0N0FDaVUzZjMzU3lSUCtXK3RydE9yUUo4T2FpZ2k5ZVhNSTlq?=
 =?utf-8?B?Z0RJTE4xYnpNV3Z5UDYvajZUVWQ2aDMwaGp5eGxLTXRCUkVnUTQyd2tldTkv?=
 =?utf-8?B?Wm5nbW5WWi9sR2ZpUDBSL1g3TGg2NHZkRmViNGVuckdjY1ltNXBqRTZBS01q?=
 =?utf-8?B?Uno5c1ZTM2NjYlJpNzlyS1YrUm9xc0FQenE3SnhRaFIwSTdocitjSWxjc2FK?=
 =?utf-8?B?R3BIdldXdHNPUFNpcmc5ZngweWlRUUpwc2MxaTYwb2xZZHJNMzc5bDAvN0ZP?=
 =?utf-8?B?dk5IYklWQVVqdmZFZ09ZT2g0K2JvbFRNcE9tWDROSFZTY1RvVEZuZEVQTkRw?=
 =?utf-8?B?S3RYTjU2QXowUmhTemt3WEdFRWtwV2NWS3UrWTYvQ09lWEpGZ0VuUWd0Y3pS?=
 =?utf-8?Q?HcI2M0?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?TGxnMmhteFpwUWo1TVJKcXVKS01ROFFmUU1rVC9oT1NGOE40bi9Wdi9sYXlp?=
 =?utf-8?B?YzlMcHlabm84ZFl4c0dXeUtWR2EyNHZVM1Z5Tm95N2xPak9mSlNIM1Z4djVF?=
 =?utf-8?B?VEN3cU9BMjZ2YkpSRXhWN1c3SzdRb09mbHJweHBTQlFrbWpjMmh5dXNyNkFx?=
 =?utf-8?B?V3lwVkM5UnM2NmlwWjdPVVVlRmFLQ2NCTmtTd2RJSGw3Nkd0aFUwMkJhVnpH?=
 =?utf-8?B?N3FaQjBXeW5SSitySkE3RUlPN1BHLytUZWFHVHhmaUpwcE0zdUlucFFmbmxx?=
 =?utf-8?B?alR3WXNhT2d5c21mOW1SYzFPSXRBQWtQei9xTlU3MTh2ME1hRjN1MlJ5RVh5?=
 =?utf-8?B?STd2eTBDdm1BUHpPdWhiNmRnYzdBOEx0Q1Q2QmZURXY0elRMbThYQXVIemUr?=
 =?utf-8?B?UnBURXhoZSt4WDVPQk5aTDZ6akVUZlo3UVFoQ09JU1hsWDI3TkozbHIyWFFu?=
 =?utf-8?B?b0RDOVk4bnZhYm9wVkF6eFJLallvNXNiSmxXZ1FEWWtTUXNxYzd6bXdPYWN6?=
 =?utf-8?B?QUJ5a3ZqeEpUb2xjclFmU0pHMlFJY2dUMThwbGpPK3VDUGJSWXpTVTJhV3ZH?=
 =?utf-8?B?aWl3WW51U09hRG1ZZkFVU1huMFBIY3dMSGpWUmdJYVhFTG1GYmQxSlE2UnZi?=
 =?utf-8?B?aEsvTGlWSElYUlkwVkRYNk5ZU3UwUUdVaUpoLzZHclVCTFZXcXJjWWhDSThE?=
 =?utf-8?B?UXF5SE5Tak11anJlOHc2TStvdXFpTnlHeGFVRi91VUpSTVBRL2cxd20xNGFN?=
 =?utf-8?B?eTVUVFhvaGFtYzl0U3RkSGEyWW1icjlVcFUvRVdsc09jaWcydnVRSGRZUXYr?=
 =?utf-8?B?WVY4QUxqRUxSR2ZLcFFyR3FzMWs4SElhTm5kOEYwdHFVRU83OW1wUVR5akJh?=
 =?utf-8?B?eGZmYnlKYncxZlpXTklvQ3JDQ01tUkt2Z2I5UHhGVjdESVNyS3U5TCthVzZ5?=
 =?utf-8?B?Mm84UGJpbWtyZ0N5Z0ZCdlh2dDFzK21GdXl4Wm1LV2poaTd4RjhOUk9rT0lr?=
 =?utf-8?B?RWQzSHRuS3h5K2RUNnNxbE1RYWx5OXFkNDRYYWlCaWlYdDdFSnYxZXBNWHRZ?=
 =?utf-8?B?cXEyN3ZOMmlicmJPQWt5LzU1NnpxNmdwSWloUWdxbk11L2FwTHoyYVNoU0RP?=
 =?utf-8?B?VHAzbjBGc2piclJWdEtYcHBTclNZNEpnUnZtYWljQUlaUlF5QmJJR2pKY1hz?=
 =?utf-8?B?akZneVlQbS9MTFdEYkkydTdFK1FDazNpeDVZSjk0a1dOS3VDdDNnSSswWE9z?=
 =?utf-8?B?UDBwczVocjBWVy9ZNG4vdCtualFtVzJIWHZ1aVpHbllIRlhBL1AxY1h5dUJj?=
 =?utf-8?B?WDUvUXpQY2VRSlpwRjZlRk5IVk9pcHZJQVZXTTgvSzc5ZTloZmVsaHNEdkpJ?=
 =?utf-8?B?RUFlc3ZwVEdOc1FoaFI1aDkyUWtaemRMbGZ4K3Z4WnpWc0M3Q0E2MUEzRFdS?=
 =?utf-8?B?TkZKK2l4Q0lrVHIvTkFKWk9JMW9PZVRKU2ErRFdrRUZWWGdYYmRIQmQvUHNX?=
 =?utf-8?B?Ykw2SnM0VGhCY2YxbGdmV3llQWtiTW9aa3kxWnI2VGM0dUVOT1ZvVVhWeERy?=
 =?utf-8?B?UGNTakp1eWlmZ0d5SXo2MWNJSUh0N3ZSdXM3cXBjamJMRWwxcW9Td1BBakdw?=
 =?utf-8?B?ek5lbXF0Sll4Nkwva3NzYzdWQ2J2N0JRZlFvMk1KaHJGL0JFTGw2NlFLR1l0?=
 =?utf-8?B?cmhRUDF4VnZod1ZxcGI0R0U1TzhvMzVjWnpBWm15TTYwUFdOT3pwOFUxSFlQ?=
 =?utf-8?B?ZWhieWZXZzI5cUtraFBUZERCdFYvaC9PTlQrK0tPZXgra0JUOFJBdnhnZHpP?=
 =?utf-8?B?RTgwbVRWZUtyS1N4MU5KNGp2dTF2bm96N0lhWmdNWG9tOU5EczhQTWVTMG1j?=
 =?utf-8?B?Y2NQN0R0REY1WVZ4bWNBTnhTcWh2OTFYYVRhMEcxTURkWnVBanZPNG44NXpw?=
 =?utf-8?B?ait3OU9peDRmeVdYTVRMWk1XUW9tVklLMS93Yk80aVVFamtmd0dMb0I1SHhM?=
 =?utf-8?B?WklRSExzU2VkS3BIM1dDN25BMWFBS05Jb2dmSUN4djBBbHQ4L0ZTMFFPT3o5?=
 =?utf-8?B?MEtnYVRJeGt5aGF2QXV0SXF2U1hDSHdsUi8zT3FyOUZ2amczc01sNU1qcE1y?=
 =?utf-8?Q?J6EG46xaqGUwHo4XkqjvFr7RE?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B65F5D21367AD14C9C4498871CEB1DB5@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c6a909d3-55d2-41be-b5c4-08de2c7eb198
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 23:59:38.9681 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: kJ9pSEOZTNEb3Z2IguM+hNp1MTvp9837WY2BPnH9x6Oj13Ur3Q2kQuqqyMBN4ZvxOoSLu7mx3q29qU1TWgXb/g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4183
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDE4OjEwIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gLy8gRmlyc3QgZGVmaW5lIHRyYWl0DQo+IHB1YihjcmF0ZSkgdHJhaXQgRmFsY29uVUNvZGVE
ZXNjcmlwdG9yIHsNCj4gwqDCoMKgIGZuIGltZW1fbG9hZF9zaXplKCZzZWxmKSAtPiB1MzI7DQo+
IMKgwqDCoCBmbiBkbWVtX2xvYWRfc2l6ZSgmc2VsZikgLT4gdTMyOw0KPiDCoMKgwqAgZm4gZW5n
aW5lX2lkX21hc2soJnNlbGYpIC0+IHUxNjsgLy8gVjMtb25seSBmaWVsZCwgVjIgcmV0dXJucyAw
DQo+IMKgwqDCoCAuLi4NCj4gfQ0KDQpJc24ndCBpdCBtb3JlIGlkaW9tYXRpYyBmb3IgZW5naW5l
X2lkX21hc2soKSAoYW5kIGFueSBvdGhlciBmaWVsZCB0aGF0IGV4aXN0cyBvbmx5IG9uIG9uZSB2
ZXJzaW9uKQ0KdG8gcmV0dXJuIGFuIE9wdGlvbjx1MTY+Pw0K
