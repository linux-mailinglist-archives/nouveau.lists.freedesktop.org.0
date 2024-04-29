Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C8E8B58BF
	for <lists+nouveau@lfdr.de>; Mon, 29 Apr 2024 14:40:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A9B0F112C23;
	Mon, 29 Apr 2024 12:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fmuj8woV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2055.outbound.protection.outlook.com [40.107.102.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA3DE112C23
 for <nouveau@lists.freedesktop.org>; Mon, 29 Apr 2024 12:40:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XwjCfhzatzr3ttroEbkfQGy66l5Y6f19XKah51wKCJfzsf8FxXZv9p9quyZHojKRY0ju3KrFd6rNbd0e9L8ITNoBUVVmjU83PiYsis6eUklavXB+eYm1V2exHO+MZtLmafEjuzgmnugyr5Ep9LxIuBaeyBmeVei/bCFCgdqp9IJi+FGIcu954kM5OaGGd+ksVTX5flAnAp8YHIKJnWSj7gWCGuEVFbC1KjRCbiA0xFQG7v2qf/CA1XDOnbqOpTilWzFp9AFkqI5F+xWq9ON9T12RrUR4IoRg2OEp7s/UGF/YLcAtGmO49atCliFjWcirNEmsqB2RIPzgh6cTjlrPMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ftWX1x2fAAmJSaouL21OrSb0osJG5GAdG5Eip/xeF6I=;
 b=DwGeaaiUFhlkDoU9Fnv9F++0eZo808ouxiwyV4mMyCwaxn28dmQMp+IvtBS6dgbsz0uQyc2DmOZaOLASnWLRP9SxQzYtRw8eJ5qBZda5eD6c1MnyR9aoYcYduxNtaqpnn20PxzYYD+EVqP2X8Ylc5bsJZzywKJI2mmikOqc7104ICYyA7Q3yiLH+CppOg/hz+IDojtHlERpLt9YGEQkea30d54UZxzjQnV3uy0nwTzHNC+elzvPeRbwQhdEyCxXPWn3bsVznfjLPHDXoqw4YQlXNJ/nzve6TX2sUuYCxcYuLSW+otkeja4M0Aqvv9i1IL2G8SoSw0Fn1iKOHi7ZI7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ftWX1x2fAAmJSaouL21OrSb0osJG5GAdG5Eip/xeF6I=;
 b=fmuj8woVQ/TKD1ont8W8qdH5QMgxRitX9cu8B88bWEFHrdAIG42jTCPvMMmUtApWy/O+EmtCeXlhkKyZuDRhz9sXn9XPtUQkS3Obg2u+hNt7Kh/rnc8w+eKSmy8B4piZQCMm44oY2eCCl7B25l3mAncdMV0aLvcKHRK/wpUm/qG0LqVSgfefQ23ZuIXWAeyTkO5x6v1nZEvA0V64GA0tFQcM3KalhS5W8fpD3L33yEb4UFRyURCakYm87z5yaT+Q527/Ji+jKQM7ygSfo/NiQNWMbR+/o1tl7vgWux3E5UajwzK+SFW6dV6P0s8KnUugqOdM3moGPQ3mmk+oLoYS7g==
Received: from SN7PR12MB8769.namprd12.prod.outlook.com (2603:10b6:806:34b::12)
 by IA0PR12MB7749.namprd12.prod.outlook.com (2603:10b6:208:432::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 12:40:25 +0000
Received: from SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519]) by SN7PR12MB8769.namprd12.prod.outlook.com
 ([fe80::ac4b:38c3:29cd:519%3]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 12:40:25 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "airlied@redhat.com" <airlied@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "lyude@redhat.com" <lyude@redhat.com>, Ben
 Skeggs <bskeggs@nvidia.com>, "dakr@redhat.com" <dakr@redhat.com>,
 "danishanwar@ti.com" <danishanwar@ti.com>
Subject: Re: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Thread-Topic: [PATCH] [v7] nouveau: add command-line GSP-RM registry support
Thread-Index: AQHakRG5UhwazQBxDEyKQ4bLCZjfrLF/CnaAgAA4NQA=
Date: Mon, 29 Apr 2024 12:40:25 +0000
Message-ID: <2775775499487396fbad5c2327dcaf7fb88a524d.camel@nvidia.com>
References: <20240417215317.3490856-1-ttabi@nvidia.com>
 <c5ff8d3e-ecfc-4970-86c0-540b75b4be2e@ti.com>
In-Reply-To: <c5ff8d3e-ecfc-4970-86c0-540b75b4be2e@ti.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SN7PR12MB8769:EE_|IA0PR12MB7749:EE_
x-ms-office365-filtering-correlation-id: 0f4880ba-f306-4c1f-5751-08dc68498ae2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230031|1800799015|366007|376005|38070700009;
x-microsoft-antispam-message-info: =?utf-8?B?bWpEcGQ1dzd0QldVODlUamN1SFpYajNyaUZZd0tleUR2VUlTOFJoVkNDODRa?=
 =?utf-8?B?Qy9qd0JoZTdDd01tSkNxUFdNTHZKWDd2d1dEMGlsaHNEdWpPM21iVmowVnFC?=
 =?utf-8?B?dXdaVnNYOWRrZStpL2xQTzFNSFRYQXl4VVJ2Q3JqM2FpMVkyT1lXTzduQTNh?=
 =?utf-8?B?WDZXYVQrNGIwU2JCK3FsbDR4WldDQ2MxTkU4S2ZUN2RGTmIweUVodVRYY1Bo?=
 =?utf-8?B?NXo0c0xsdUZGUWZZM2FTSHR3Zy83eGRVVVhmSXdRUXlLQU9oYVpGeU5zZVVC?=
 =?utf-8?B?Q05UZkwxSUI1WHVzZXZONk1PU0VqcSt6dVp4a0JPU09jVHdteEdFMFNrQ3Nk?=
 =?utf-8?B?U01TbHlMRWtuZXRxUnBCNjlsTHdLYjdvci9BNk9FTXZYUW9VWHplQXgvNXlF?=
 =?utf-8?B?VUxvNlBzR3NmSUlWdlF4b3dhcUxaZTJMR3k4ODNyVktzWXVKd1cxUVcwNjdD?=
 =?utf-8?B?MzFQdE4yUjd6V1pwWHdvd29aMjA3bGVRenhtckdUZGIvQUphekFTUUtUSDlU?=
 =?utf-8?B?RWpUTisvcVR0d1o5b21wNThLNWo2czN3NktOOFppdWdRcTNpUEo1YzlIM1Rw?=
 =?utf-8?B?ZWVYMFBrSjNmbUFKa1ZaMVlEKzl4T1htL0FOZEV1VXllVFJKU2J6SUhyY2Iw?=
 =?utf-8?B?U2czU3U4RzlFc0tXTE5LSjdISGluZ1BnQ21BTmNBV01lL0I1aVlKY1ZRY0tH?=
 =?utf-8?B?MExIVlZPNUxYWnoxRDY0NXhHaGcySGovMCt2TDBWTUNUa1J5K3Z0dW9zbTFY?=
 =?utf-8?B?aTFRaTY4ZGlIRnNPRWVjRGhrZUlLR05GaDdUZWVvQmxNZXB4dUtrelVDSVlV?=
 =?utf-8?B?OTcvSThoVHdWcnBGbXI4eFZNald5NW1FYWxCQ2pjQ3hJamNiUkV3MklTWEVm?=
 =?utf-8?B?UURXdll1UG1sR09MbVhRMVdrNW5GZFpYVU52OWlDSkhSVXpJV2Q1b2lOeDJi?=
 =?utf-8?B?aHBFZnlBY09ncnU3b0oyYzB0ZkFLVHJzNmIwOE1waWszaktJN1dudHlYL1NC?=
 =?utf-8?B?K1NadkdoeHViTW9Hd2VKaTB2UnFqSGFzeUZaelpDeEF4RGJ3NmduN0dEMXZ5?=
 =?utf-8?B?R2RDUTRXTTBLdzdkOTJTVEY5TWhGRGhybmRyYit4WEtZZDdMQTNwSktNLzUy?=
 =?utf-8?B?U3FmUlVnN3JWUHZSbHRTUlJESU8zQzRMQUhRY25qZWpMZldNU2haSXJSM1RI?=
 =?utf-8?B?SDFKTGtHMjR3ZlpMaytaQ29PN3pXbWNTZStJRkc0T285Y1FvZVF1WVBRenZ2?=
 =?utf-8?B?MTJIMDNrR0Vtc3pkRy9NMm5SNTNrN0NUV01KOUxvU2w5QURBaDNHdldLSGNW?=
 =?utf-8?B?MG5Xb1krZUx4dEdCUlFreTZSRHJkNWR5QS83d2hJZCtYMVJJMHdLSXR1bGdH?=
 =?utf-8?B?ZFIzSjMzNTJjZkhMWDFTQjhMRURPR3I5VnEyV2hmY3g3Zkc3OFFTM21CUitD?=
 =?utf-8?B?aHErbjMvQmdUNXFTaTc3QTlHbkg1eVZVR3VxZmw0VVI5QnI1WE1yV09FQnQx?=
 =?utf-8?B?T1BMUkd3cThiVmFlMzViWmUwVWZENml5RUNxSjZuTHlkOVFCekxKM2haOUxL?=
 =?utf-8?B?STg1SloydUNOZlIrNzNXS0VHN2hRcStnK0lwSUYvSmtPUmpLNVFERWlicEVZ?=
 =?utf-8?B?dWVoYmNaNlNoYUh2N1FjSVh0N3ZVYVpvWjZPL2Z2UEhxYkdpekduSHllU2hG?=
 =?utf-8?B?SWpVOVZDcjZWVUxVV1p3cDNXSk9xY1hycXQxTW1ueFpmNnl5Y2YvMnN6eWpj?=
 =?utf-8?B?RUtHODA1QjlrclRVSjBlcnI1NVBleExiZkdvNUpxcUVQVTRreUhGak40dXhW?=
 =?utf-8?B?SjJyNTh0SVRhZDluV2VLZz09?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SN7PR12MB8769.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(376005)(38070700009); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?RUNlNUFKMmJpY0JvcGViRjBGWGh1YWpOMkdkbXZYMTArV21UMWNwdmFIOHN3?=
 =?utf-8?B?RG1iS0ZPamxSajJjK3JNbkYrT1l6Zm1qamZWM2xsWGlXZnZwTXdpYThVMnRa?=
 =?utf-8?B?alFHMkE2QTU0UWlncDZNamdMRE14T0V2UnA4eEx0WGhuUFlTOUZzWDBrTjM1?=
 =?utf-8?B?V3lIa0xEYVpiR2g1bG9NU0dNcTMwTXdOd2FWR2E4K01kSjVkUGtsV1RVTml6?=
 =?utf-8?B?UmUrNzV1U0hONTZvaVNxVEsvcCtYZ2pkWUlMaTNYL0U5MjA1aEpNSFR1Wk52?=
 =?utf-8?B?YXAxR3poVXBwTnVKRys0dmN0ZTRocmpPN1hPMnBqWlRiczF4VlNlaTJKYTNt?=
 =?utf-8?B?Z2xsWlRKOVVHWXpYWll1bm9NOFF5Yit2Q0VpeXRyMkQ2a3RKOUV4d1Rna1Bj?=
 =?utf-8?B?NExUNTZSVlpGRUo3bHRBSHdRTVIyRnZwa0xNZzZQbGYyL0JkYktWMEtxQmNK?=
 =?utf-8?B?cVJJMmNGS1BWcFFYZEhQdUowQ3A5MXljR2M3QitHcVdiVkFKQzRuYy9HNEtM?=
 =?utf-8?B?SVdHL0YyNEd6TnlSMnEycmVWVmdGd2o3ZlVURFR4RVBwU0ZiOUprekpmeTF4?=
 =?utf-8?B?NGtZZndrNi91MVVtQnFuSkFTcmRqMUo5Y2RnZklWclVzR0xqVllKZ0tYekE0?=
 =?utf-8?B?RjZoTFREa21qQ1JvTGdvdXFlSmpTMFRvQlMvUDVJejNoSlFTM05lbjRyL3Bw?=
 =?utf-8?B?dVB2ZEhKc0hjeFBjSXVqUDNURUh6VnRFUEIzcUR5MWgzaGJCT05oUzlSb1NO?=
 =?utf-8?B?VGxGUmJiTVZBUmZvTVNIYjUyOHJHazNsR2xobklua2tCMytRWWg4emRzZ3Ux?=
 =?utf-8?B?NzI4RWwzRzdqM2psZnNYbVVOUnp0MCtldFZlbVRhVkZUczBmVkdXRnk5N3BF?=
 =?utf-8?B?ME1yT2dMc0lvdGIvK1Z1U3BZWDg5VWtoclQxeHc4aFBwZDJYUFF0UWdnRWgv?=
 =?utf-8?B?YTExdndtRi9EeUpaOWg1UW9XWnZnY3VwdW9EcDJOYlA5OGVnZUVXekhPVjlL?=
 =?utf-8?B?b3BnUDkzWmY5QU5yMS9PenZueUlpWnVEWGFGQjNZTlJSOEVYMEgwbFlaNnYw?=
 =?utf-8?B?bHNyK2hqdDQrN3Y4cXdITitQQ29WbWw5Z1NHYkpHL0FKd0VZdU4wY3lBVzNV?=
 =?utf-8?B?ekNXT2hiUS9Kc05RVEp6SlA4b2kwaUJ5Y3JPSWxTU2JrZ2ZPSTh3eGxTMEJ2?=
 =?utf-8?B?WUx0d0lWT2JFd2NCS01nY0FUOVVxMURUK3pTaW0vZjVEa0hhZjg5MVBMdkhY?=
 =?utf-8?B?WENXdldKL3djQ0dVZWd0cEhjVGZxdldxZXZsNlhnRUFlWmx1Z0xETUs1ZW5L?=
 =?utf-8?B?MzNBaXd3d1dNWnV4MGlFY2RTTWpOVjVCMTFBRFYyQllxMGJ3OU1QcHFGb2Nw?=
 =?utf-8?B?S25SUnhPTGVRZU1vek5seHQvOE9JVmI5S3BZZEdKUVNFWk5hMW5JMGw3VlZG?=
 =?utf-8?B?YUFra2tWaU9CNDBnQ2lUY2RoWGYzeHNTVm9jSXk0Uk5YY3lBTWxZRitCSzR3?=
 =?utf-8?B?bC8vUXhGaUFOVG1NZUk0OFZWRXh5bU5ZaGFqY2EyYytZTFRpVDdNaHlhczEx?=
 =?utf-8?B?cXlOYko2a3pNOUY1bm03d1Bud3dHQU5vQ09XSjB3ZHJ1NHZkbzl3dGxEa0lZ?=
 =?utf-8?B?cHNKUDBXeW9xVEUwTFpjQnJ5OGE1UWFzUUY4T2t6ZU5BY2Q2cWhuNjhrNUJ2?=
 =?utf-8?B?ZWhlN2lXZ1YzU1QvNkQ2ejduUURCL0Y2L01NTHZ2NDFIS3FVTjgzTXhBNHNv?=
 =?utf-8?B?dnhKMkEzTVJxMERyWE9HY1c2ajN2eEVsOG12TWRIQlFEczd4WG1nWWtLZGR2?=
 =?utf-8?B?OUd1a0VpRFBzNElVa0Z1ME5CSHBqNjQwRUJET0VYdzE0dkpaVml0YnhvRWE0?=
 =?utf-8?B?TWFvN3BxY0ZHTE1CTFFMYmJZVTZXTENuTTBweFRWYUJGZW9rcnAxRm1jeTNn?=
 =?utf-8?B?STI3b3o4RG9ldEMrZjJ3UEhBZkw4SWg2VXJ5SXdRbW5ZbnVYZGo0VjFFUlRp?=
 =?utf-8?B?TTJKNWNWNE5pOWU2N0NhUEMrb1lUdFdhNUNQTlRaeFJRQkJsc1U4a2V4WjFJ?=
 =?utf-8?B?QnFBS05DY1QvTERPOFk4emk5UHZnR1dOMGYyS0had2QvcThnbDd4aW1PRG5U?=
 =?utf-8?Q?AOUKJdhS9Mqoms8JPMbXJrd68?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <1D11FE87CFC0D24FA7ED4FA4A521C0EE@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SN7PR12MB8769.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f4880ba-f306-4c1f-5751-08dc68498ae2
X-MS-Exchange-CrossTenant-originalarrivaltime: 29 Apr 2024 12:40:25.1279 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: DqFN2tr2oNQ0CtlQX1o00Vc+/DQ4kD85Xjd8QpJLFdPCtzFsrRdzbr0bZ+IPn1nk79bpX0XCvgAKk+UyqJN1AQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7749
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

T24gTW9uLCAyMDI0LTA0LTI5IGF0IDE0OjQ5ICswNTMwLCBNRCBEYW5pc2ggQW53YXIgd3JvdGU6
DQo+IFRoaXMgcGF0Y2ggc2VlbXMgdG8gYmUgYnJlYWtpbmcgbGF0ZXN0IGxpbnV4LW5leHQgKHRh
ZzogbmV4dC0yMDI0MDQyOSkuDQo+IFdoaWxlIGJ1aWxkaW5nIGtlcm5lbCBmb3IgYXJtNjQgb24g
bGF0ZXN0IGxpbnV4LW5leHQgd2l0aCBkZWZjb25maWcsIEkNCj4gc2VlIGJ1aWxkIGZhaWx1cmUg
d2l0aCBiZWxvdyBlcnJvci4NCj4gDQo+IOKdryBtYWtlIC1qJChucHJvYykgQVJDSD1hcm02NCBD
Uk9TU19DT01QSUxFPWFhcmNoNjQtbm9uZS1saW51eC1nbnUtDQo+IA0KPiDCoCBDQUxMwqDCoMKg
IHNjcmlwdHMvY2hlY2tzeXNjYWxscy5zaA0KPiDCoCBDQyBbTV3CoCBkcml2ZXJzL2dwdS9kcm0v
bm91dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5vDQo+IGRyaXZlcnMvZ3B1L2RybS9ub3V2ZWF1
L252a20vc3ViZGV2L2dzcC9yNTM1LmM6IEluIGZ1bmN0aW9uDQo+IOKAmGJ1aWxkX3JlZ2lzdHJ5
4oCZOg0KPiBkcml2ZXJzL2dwdS9kcm0vbm91dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5jOjEy
NjY6MzogZXJyb3I6IGxhYmVsIGF0DQo+IGVuZCBvZiBjb21wb3VuZCBzdGF0ZW1lbnQNCj4gwqAx
MjY2IHzCoMKgIGRlZmF1bHQ6DQo+IMKgwqDCoMKgwqAgfMKgwqAgXn5+fn5+fg0KPiBtYWtlWzZd
OiAqKiogW3NjcmlwdHMvTWFrZWZpbGUuYnVpbGQ6MjQ0Og0KPiBkcml2ZXJzL2dwdS9kcm0vbm91
dmVhdS9udmttL3N1YmRldi9nc3AvcjUzNS5vXSBFcnJvciAxDQoNCkkndmUgYmVlbiB3cml0aW5n
IEMgY29kZSBmb3IgMzAgeWVhcnMsIGFuZCBJIGNhbid0IHJlbWVtYmVyIGV2ZXIgc2VlaW5nIHRo
aXMNCmNvbXBpbGVyIGNvbXBhaW50Lg0KDQoJZGVmYXVsdDoNCgl9DQoNClNlZW1zIG5vcm1hbCB0
byBtZSwgYW5kIGl0IGRvZXNuJ3QgZmFpbCBvbiB4ODYuICBUcnkgYWRkaW5nIGEgImJyZWFrOyIg
YmV0d2Vlbg0KdGhlIHR3byBsaW5lcy4NCg0K
