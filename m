Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9AF8C9D8AB1
	for <lists+nouveau@lfdr.de>; Mon, 25 Nov 2024 17:55:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21F3610E6BF;
	Mon, 25 Nov 2024 16:55:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mehyTSYe";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2071.outbound.protection.outlook.com [40.107.93.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 256B010E6BF
 for <nouveau@lists.freedesktop.org>; Mon, 25 Nov 2024 16:55:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOKlj2MM893eifP5ws+ip9JkRLMnYZxRXatBFWL6g8zPQUGBtCq+oo65SCZ5imUhmpTjwa2yViUM3Ak/yxqrjYtZRWLu/9ootp+2ctw7wnkEpEKAVKmT5FY2K2EkdQv5kQUQgsDtZdNdL3IiV52bw3kqpRDWBp0uSzr+Qiq6g26wHxCgDuUVaHNs0EYV9GBr/gqZPYlHCZKN1qXz5ke/t+w9PlUDN3EFSnPYgUGam1EqeAPotHBMmJ/B3v/wq+CvtcflcYgRIZtNy3XpRnaAPlntgOLj2DoxKOEJw/Bcfq1ebtfZMOBmwsn1zGtc6YQWlxM3A6DxRmrRsud4NQ8faA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1bYntGqQ3zJ4O4kilBtwE33tw3MzavMUpSUfz4Q1xsw=;
 b=XBB9BxbnfOH9au5RrPSD17J4ZuZ/ovrDqq8qkmMIx9I/MYPHPe3UhpQuccTfMYTOAXeIYdKZRrm0e8jJ9ZdDQmFq/BD9jm9YLzkla+76K9SdFvj7BhntjBc75UvUc4kXPLX1z1J31IQ7MEcxJkNO+cj8KNTlIh2tzVAW63NemRbmO5oFiV/ojL5neCykQT4NQ+yoim5SQMO5eHRsCssdI8oltFoqHtgIOZ+QM1kwvE8FkEfuNP1v+AwKaraC+kvBl1N8Bqv6HH6/hxocGFcmeLmZQOkj4pcMDaLLeQKcPfl9GyxGKMSYQ9vlu7CgaNN8LsFk1ZXQ6ofMJ4q64w1M3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1bYntGqQ3zJ4O4kilBtwE33tw3MzavMUpSUfz4Q1xsw=;
 b=mehyTSYehnY0w2Lkw68SxvepouRLorft3PJAMRONYeM+YbQTyoQA2IwJMOkWW0Jsymt9o36e1SKxY9+kl+WEDHalZNfE00n5S9tJGe1BlKbsG3AWDThkCdjqnivbdC0q8/c5g9f2O4lswp8Izw4orQ6v3IgjlixTkyiK/VfMbLKbv8ljh6xshXQGm31+LoiWg4ufo+qX1q1mxL6417QKYCq6sXToZA3Kj0Mz9gLv45l4RncyGoojj+XYistGmXjHkV0FNZZjHfsJipX6ftQqe+EXS37q3UovYrBRS6bZHy2HvzW2h4BvNWrIa0QKGRJPNZpnfNqraLoOU6s4Lr4vPg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by DM6PR12MB4153.namprd12.prod.outlook.com (2603:10b6:5:212::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8182.20; Mon, 25 Nov
 2024 16:55:20 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.8182.019; Mon, 25 Nov 2024
 16:55:20 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH] drm/nouveau: create module debugfs root
Thread-Topic: [PATCH] drm/nouveau: create module debugfs root
Thread-Index: AQHbP0YQuwH2BIUSVkK1NZZCrIlp2rLINw+A
Date: Mon, 25 Nov 2024 16:55:20 +0000
Message-ID: <1b289bc781c587de41ea489f9a014ca4c3f58491.camel@nvidia.com>
References: <20241030202952.694055-2-ttabi@nvidia.com>
 <20241125142639.9126-1-dakr@kernel.org>
In-Reply-To: <20241125142639.9126-1-dakr@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|DM6PR12MB4153:EE_
x-ms-office365-filtering-correlation-id: 3a24d77d-af9e-40f9-0d9d-08dd0d71f23c
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?R28vVEZYWEw5Mlo4SzBHMElKWmJ5TWRsRjVkZ3VDclloSm9qQjRnQTdiQTcx?=
 =?utf-8?B?U2xLMWV5c0tVdEd4UkpIQ29Td0R3K1pHeG1UVHRIZjgxblp0VERmd2FSM2dC?=
 =?utf-8?B?UFVFdlVqRjVYalJGNjRlQWdrOFFKOE9zenBBRWFGbVNRQkxlYi82b3Q2eTdB?=
 =?utf-8?B?R1hZN0FQZ2VkbHRKUkUvTkIvSjZTU2twZGxDMlVVbGF2NDlERlNkYjRvb0Vm?=
 =?utf-8?B?UW9pSmJFZDZjaENTRnBpODUrVktseXd1VXBrc0M3VlA4dTZ4TnduUktRSFpH?=
 =?utf-8?B?TlFxck9CM1hiMDh5K0pvbmcvY2lvVU91NUxEbklRZmlMUHRxN0V3ak0reGNk?=
 =?utf-8?B?cHlPWkt6WEFwcXp4UGpsNmxCdzhybGErdkNhMmRYKzZQd0hCUkhoR2pSMXUz?=
 =?utf-8?B?SGk4SWpxeVVUMUp5TTRQdjBMZURHZE1SMkMvL0FNN0JPZFJ3N1kvRlF4TnRm?=
 =?utf-8?B?L095SkdMVXBZMFR0Q1hXSWYwUnk0aHJ1SlBYcWZPbldhcFhJR2FhQ1M1UVV1?=
 =?utf-8?B?R1UyYmFoM1k1cDRHc3VtcW5GYTZIZXM0ckV3Y0l4dFNSN1NQOUlSZGdTNzkv?=
 =?utf-8?B?WDNubFN3VGN6M2xaY3JOdHpFY0pmb2YwYUdvVFBoaWJxWlY1MWNmbVh0REcy?=
 =?utf-8?B?WGRaSFlyQm5DWlAvS25Ta1lTS2RKcU9BNDJnRnpDbVR5YmtuNDdPVHNoTE1U?=
 =?utf-8?B?dmJNc085MXh4cTYzeStIelpXa29hQzFsdUtDVVlGWXpvd0VYd1grUHV4NnBH?=
 =?utf-8?B?UGZESmxJdzRwdU95eGRXT1ZqL0pxM25CN09CTU5oOE1zYjhweVBvak12ZWgw?=
 =?utf-8?B?YWE2UUlQQjNHQXZjSUtHT3RCQkgwZ3lBV2JDMWh5Z0dYblRJdnNGci9jYXBq?=
 =?utf-8?B?U3FibTA4UDRDaWYrekJtMnBvVmlvZUJPMTl5dDF6TmhySWZ3OVV3bDFMakZW?=
 =?utf-8?B?SjB0cDlOU0NEcHZ0YUJoQ1RXTXFJMmJOTnkrVVhacXI5YTZFWXh3eGpqT2ls?=
 =?utf-8?B?WlRhSlJxRUZWc0dKckF0SWN2aDNneGxmUzZiTUtyajhEWjRLbXM2ZTNvd09v?=
 =?utf-8?B?ZWFxR1R6aXB5NVFiZVFOUG5mdlJFSXp6SVBaSUZzUER1eGZxK3oxd3RvMWlv?=
 =?utf-8?B?ZnpPaDVaZDQ2ZFR4N0UzUHhod0FsS0VkbFVPb0dxbnlET0lyVHdnODlnT3JW?=
 =?utf-8?B?MThKTTJnVCtLd21FR0NpVjZoZEE0SlU2VUNVRXV2Y3JEclNSTGF5RzJRaDdN?=
 =?utf-8?B?OWRLdWFCTWczRmpwbU1VY2xBR3BOcFNYa3JNQkc1MG4vRVZRSHNCUVdtRStD?=
 =?utf-8?B?bmRmM2o5SmpLRG5MR3RRaitNK2svZitEMXE5djZsbmk3UjJVbTFUK05pUTZ2?=
 =?utf-8?B?c0N2czlMb2lFWVo1N2tnSWY4ZXczK0tGWW5BOUI3K3F2UnYrZnhPVGo3Mm9z?=
 =?utf-8?B?b0JKMDJ5eVpoajZ2N01LWWt2dkxXbHlHWkc4Sy9sb3Z3djlYTHdRcDhGSnpn?=
 =?utf-8?B?ZjV2bGE5L2FSbG9NYlZoQXVsV0twN20wZm9yeTlnRDM4WDIrVHE3em54UGRG?=
 =?utf-8?B?bUptZmxidXRVSzI3ZkFIL2wzbEMvRHFtei9JRlk1aVd2S1hTNGtFaEZFbWpx?=
 =?utf-8?B?Y0RiWmhZdDA5VGc4MzZMNGJBazhLT0Z1Z1JWa0RiNGN0NVNuejJIdUtDUHdx?=
 =?utf-8?B?UmpKRnZWVDlZSTBIVEd4ZHdaOHZJS3Exc09BYlRWSGNTcUIwODBsNzNRVThK?=
 =?utf-8?B?MnBBNGJ3K0ZvRnk4d0NvZ28zZWhHdzVzQXpXV01ERFJkTzhsNnNzSXpybjVU?=
 =?utf-8?B?YmRIYmdVcUl4WmhveVZLQlN3aUVWQitBV1BXMTM4VWVKeEZmNUVCc2F4NTcr?=
 =?utf-8?B?dzdDOGF0OVFYQTBYa2hNUTBNeE5PT3NDSlAxMmVJSmlQK3c9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?NUlWeVpXSXoxVm11UDJObi9iOFp0Vk1pQk94OVVoQjVhblNQSDhOYWs4S0Q0?=
 =?utf-8?B?cWo4NFRzQ3czUHExZTE0azVBaVR6UDloRURGNnBBaVN1OS91Lzc1czE2NTF6?=
 =?utf-8?B?RTA0bWFYQVhDQVUvbFhoWW8wbWRWSlk5YVRURmdLakhuUXB0cW5yOE45RVU0?=
 =?utf-8?B?WVVXektxR0FYYm5YSkwyZW9PUkxSSzl6R0txcW5GeXFFZ1E1aGVDcHppdkJt?=
 =?utf-8?B?Q0w5bGM5Qk9ZN1BCeE1uRTRDdUtSaGFvZVlURFFRUGJFaXFEa3dwQVFGc3JV?=
 =?utf-8?B?MW5OeUFUSlFYSzl3NEt1bm9wWW9OU1dhZkY1QmNoWkJSc0VxNWxBZ1JsNU5H?=
 =?utf-8?B?RlV4K0MvZTRlQnZMamxrSEoweXlNeXRmek4vbk5CeXcwV3Rzdk1PTUYxRkhW?=
 =?utf-8?B?bGxib0hqN012dzhUYjVmdzZsSWl6MnlxeVdxY0x3ZjhMczB2enJFVUpJVEFo?=
 =?utf-8?B?N0EyUmI5c1JrRlgwTksrNldxNnduWktaQWtKcG9IcjJ0VTc5dyt2cGFnNkp2?=
 =?utf-8?B?Snhzbjl5c0xnaHB4Nk5KTU9mSGp6dDdhM2JoemllRUhaSU1JVGZYY0tUVkoy?=
 =?utf-8?B?ZmZNcWRyYnpwVW1FQVpsV1BNMXpwNWJ4TGhEV0JackxxMXFnMUNXaUF1WWVP?=
 =?utf-8?B?LzhrMm5OU0h0d3Z5d2lzMFZMT3hYVmhUdmpUZlk2UWFhU3JEWDFqQms0VzZL?=
 =?utf-8?B?Z3g4YzdzazU4YVFhUVVDVkNHbTF6TjNKYUN3NjZ6TFJ0WEJuS2MzYW4zcC82?=
 =?utf-8?B?bHk2MTBXdlJXc0RRUmg1TFQ2NnlwZGdaY2JHcGlxdEpMdW9RcHBCMlZxZ0N2?=
 =?utf-8?B?eTFGTmpJNXo1MFJQVEszWnlNWksybVNLeFZBRVB5bXE4djVHZERYOTBMbzlF?=
 =?utf-8?B?b2ptZjAvZ1NTT1RZaVlJWXQxVmxTMUZsc1l4MkwxNUJ2S01yaGZFdEhmWUhw?=
 =?utf-8?B?SXdLblpkK1VRV0ErOW5WeTBjYm5VQmZ0QkJwdWFNR3BrVmdQM3VwelRnbXY1?=
 =?utf-8?B?YXZDcGFlYjFEQkNqMDVBZTUzQ01iaGw5aG8vcHgrd2FxcWx1emMyK0Y5dzBU?=
 =?utf-8?B?bjdxUkFNSGdmRW1kOUk2cUMwTyt0S3MybXF5UHZtYmE0RjVuS3hqbEtKd0Z1?=
 =?utf-8?B?ekpxdWxmR1hhcUQyNS9QMFJCdzVzdEFWMkdVU0ticjFBYUZYdkc3dXFocE9s?=
 =?utf-8?B?SWxiMnNhMGRlc1NKZW5JVzFITjhDckpHVE8yNlkzTlVzb3QzV0FhdkJkODZL?=
 =?utf-8?B?d29JVzBGMDAydHhzUHJVOFdzRWN5U1lkOGxxTHY2K2hreVdYU3hYWkZZdlBE?=
 =?utf-8?B?YnVsSnZXL0xIQUthVDVDV3gxVzB3VE54RGduQjd6cjZsc1N0RCs0aVBicXlV?=
 =?utf-8?B?VCtSSW9uWjBKeFNMd0tmaWo5akNMSTQvdkpReURWSDRYNXhqVlJTTUFtREFW?=
 =?utf-8?B?WEhhZmxWUG5OOUkyeERhcTh2L2ZVLzJRam5nWElydmZoWVRvRGdHWVVXNVdS?=
 =?utf-8?B?ODZxNm5wTHRMSmc5VS9SYmJNbUhodWt6bVBWRzZlNENRZHFaTlpTWFc1Mmk5?=
 =?utf-8?B?cW0zTXBORVlSZ200ekJYWjU2cXZaa2k2YXFIWlJISVorYWcySzdrYkxPNzdL?=
 =?utf-8?B?dXhqSmpiaEV5a3JsOU1Cb0JWeG9JT1NIbmVvSU9ZdVI2UExnU2MwaHZHYkFl?=
 =?utf-8?B?SUMwYzdTRERxWlhVbTJ2ZkI2U1pxNVlPM29TL1M5dE1lUjRJVmYxODhQT2VJ?=
 =?utf-8?B?Vk5md01BTEpqcmI4ckVKQkhjWlVRVWlxV0JXSUtuWVdYY3V5M3VRa29aUU80?=
 =?utf-8?B?SzBvcHR4ZjBhSEdQYTlRUit3V01Od2dyL28rUDc5eG1YaitMWGJGRTdKclZu?=
 =?utf-8?B?allIS3VwSW1jamMyOTlPRmhJUHJnZDZLRENZRXk0QWFvZjNFRWZiak5PdDJB?=
 =?utf-8?B?Q2FqZVBJMCtWV0dLNXR4cUt3R0kxcmdMYzE3c2daVW1lRUFTYmJBbGZqTitG?=
 =?utf-8?B?WjB1QmZPazFVVUU5UG5QazZNVnpoTkUyMXoxWXpjc3dQMjlia0hkTHFBendu?=
 =?utf-8?B?VnAydnUwOSt4dCtNOWIvYVRqMWNZVFJKU2NRRVNKTHYvc1N3c2RidEptbm55?=
 =?utf-8?Q?DpC3ynjMPqVhTgwZpZqNLURR7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B0376E6AB8EC7949B9684F23E73E3575@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a24d77d-af9e-40f9-0d9d-08dd0d71f23c
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2024 16:55:20.2449 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IHm2FYOCyXjZuSKF8LKUAIBTWBfP+wtXb6VBenuHmsOiaqSiVk7rczagJuc/6fd5ld+EYlvVgTV4/0NyeTRu8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4153
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

T24gTW9uLCAyMDI0LTExLTI1IGF0IDE1OjI1ICswMTAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBUeXBpY2FsbHkgRFJNIGRyaXZlcnMgdXNlIHRoZSBEUk0gZGVidWdmcyByb290IGVudHJ5
LiBIb3dldmVyLCBzaW5jZQ0KPiBOb3V2ZWF1IGlzIGhlYWRpbmcgdG93YXJkcyBhIHNwbGl0IGlu
dG8gYSBjb3JlIGFuZCBhIERSTSBkcml2ZXIsIGNyZWF0ZQ0KPiBhIG1vZHVsZSBzcGVjaWZpYyBk
ZWJ1Z2ZzIHJvb3QgZGlyZWN0b3J5Lg0KPiANCj4gU3Vic2VxdWVudCBwYXRjaGVzIG1ha2UgdXNl
IG9mIHRoaXMgbmV3IGRlYnVnZnMgcm9vdCBpbiBvcmRlciB0byBzdG9yZQ0KPiBHU1AtUk0gbG9n
IGJ1ZmZlcmVzIChvcHRpb25hbGx5IGJleW9uZCBhIGRldmljZSBkcml2ZXIgYmluZGluZykuDQoN
CiJidWZmZXJzIg0KDQo+IA0KPiBTaWduZWQtb2ZmLWJ5OiBEYW5pbG8gS3J1bW1yaWNoIDxkYWty
QGtlcm5lbC5vcmc+DQo+IC0tLQ0KPiBVbmxlc3MgdGhlcmUgYXJlIGFueSBjb25jZXJucywgSSds
bCBwaWNrIHRoaXMgcGF0Y2ggYW5kIHJlYmFzZSBUaW11cidzIHBhdGNoZXMNCj4gb24gdG9wIG9m
IGl0Lg0KDQpXZWxsLCBteSBvbmx5IGNvbmNlcm4gaXMgdGhhdCBteSBjb2RlIGFzc3VtZXMgdGhh
dCBpdCBpcyB0aGUgY3JlYXRvciBhbmQNCmRlc3Ryb3llciBvZiAvc3lzL2tlcm5lbC9kZWJ1Zy9u
b3V2ZWF1LCBzbyBJIGRvbid0IHRoaW5rIGl0J3MgZ29pbmcgdG8gYmUgYQ0Kc2ltcGxlIHJlYmFz
ZS4NCg0KDQo=
