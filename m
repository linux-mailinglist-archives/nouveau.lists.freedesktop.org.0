Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1700BC70E8C
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 20:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEBA910E276;
	Wed, 19 Nov 2025 19:54:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hOCVgPI7";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010009.outbound.protection.outlook.com [52.101.46.9])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 515D510E276;
 Wed, 19 Nov 2025 19:54:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=y7HcN1CktbJYQPXqXfxnG3G1p6ZmWaP0ds8o0FPOG60tsaoz+LrGqrwBuBqIFvYvXTqqKqv6MKbfaPM3CP7WjW2qsKLLsmhKHQPfLYN9P2/6akgO/+Py4vJBB+w+o1B1B0HAxqzT/WVGVuxIo2xCN7rlyGcf/pXC6Z6a2Vo0F7NkBRJvy20vddjPsO51OjcXpzAjYnCJfF+ASjVTtdpxZ/uq2VfsmqExz5Dt0jjfZ8aZ/e3eKagIEgS/qjoNRuAKNF2KAGnCAqn74wxjsDXvQSJdewdLxsDgECBNuuZEObH6asn0NHCGJLRL90kbxHXu8u0LbjsM+ny+NaM9yxoT8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+v/sgTEKT2Iu3oidOhBL72uqTptvmaIB5LIZQ2s/XSI=;
 b=o0LKkfoscQCZU2P7UIbEDH+/ccFpXi+jiDKCCzZdEqt4Ty0hR7kn5APJpiiWgnuIUf/FNhyREpWvoMNk/xYqjpJ8oPmtR+sebZsRAUohS0+KDAEb6dmkfLIhBtGOIuGr84sHq+BKzIXkjiEv5Up+TbRvD0gyx7bG39GFcAIOmWzmZe3afzBD/u27Fe4NgvvhjClaZ0+BacO3Wsqma5HLhJKxAa7w27zDd4avIDA5PUn5qwRgEoH7CPt12yptXlXkUxQP8SEg7CSiWe4dkUimJoa8S1YmsZ7YZgGjqwI3oeUVMLqDUPFvjFPoB6UVPyKVndXtIOOaARBjQwPN3sNNeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+v/sgTEKT2Iu3oidOhBL72uqTptvmaIB5LIZQ2s/XSI=;
 b=hOCVgPI7j+qae+q9D+PsbZFFS0FVeZh2R/2NXdNfuvWxV9CPOFQG7MTtqHZKnKnTfnW/w33mcuW5SQ8MeOksN169wcxyD03fXwZmvVL513RQ28clvUmU8wOKOTjMJiUV1i3HRIyfjeUY/wtAmr59vV+0S9QdH5+67G/z0QgGvd9NCtu2vTofkt2ljnkw9UNKaCYrKYDBwFtBoWhtyzvGviNFM+jTV8cE2zY33n2tcnpUivJpdi5Pn5QbhZ9K9IXaWaHAwQV/+Z/49PDXQme8Xa8FOesuHLSQXzfBCyjix+P89qnL0ZDJG+qsr2z5PWg+o+DvfqWG/+bGWDGTtNf0RA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by DS0PR12MB7701.namprd12.prod.outlook.com (2603:10b6:8:133::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.21; Wed, 19 Nov
 2025 19:54:06 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 19:54:06 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Topic: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Index: AQHcVb7HnZgTrM6ka0OpQ9aSKtoZE7T5Q12AgABNAQCAAAcFgIAA2aSA
Date: Wed, 19 Nov 2025 19:54:06 +0000
Message-ID: <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
In-Reply-To: <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|DS0PR12MB7701:EE_
x-ms-office365-filtering-correlation-id: 5bacbc2d-993d-4213-49f3-08de27a56594
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?U0dwZktURE9wK2RvcW02WnZxYWc2aFJYMjFNSkZxSW4rMW9IQys1QU9JejZD?=
 =?utf-8?B?SWtlblNsVDAzZjE2RVJsNTRBdTJ6b1hkcEczQUZiWHZPUGVreXkyQU9CcWVW?=
 =?utf-8?B?OHZaTkdYVHVwdmFuRnoySHFTWFFNaDhwQ0Nhcmc2SlhPUDZwZk4rTHFzdDNL?=
 =?utf-8?B?VFcvTFF1VXFFV3VoZFMzb2tHM01Vc0tKeXY4UERwb01Ic3VUWlFmSHF4TmI0?=
 =?utf-8?B?Nm1BMG5ydWkvN1MzREcycE9PSDF6Zm52R0gydjZKdWZ0YkhkbVhycG9KT2kr?=
 =?utf-8?B?d0ZmcW5kblJGZUpraWZmd0tVSkpkQmdYTjYyb0cxQkVzZFpMNUswYTFFem4y?=
 =?utf-8?B?UTVIMFU0YkJnUWhCUVpLemtnaUJPNk5rdDh6NE02ZlJKSDVBdkdNOWxURzhC?=
 =?utf-8?B?RXJLc0puMXJPOUJxL3FpMUgzcWl3aWl1UzkycjVMQitsOGZValk3Z2FBYlV1?=
 =?utf-8?B?OHZVZTZzL0hvYUdBN0l5S3AwSGdlbU4reVVKZktZZVdXRzZZUXhVT3Z1cmJJ?=
 =?utf-8?B?YmowYzJ2dXhNMUkxcW1VYXlmVWRnMG9BRGNlaFNKTWk3d1I1OUdFQmRwbTJh?=
 =?utf-8?B?WWVyMGRGckY3ZTRuWk4ydUFlRnp2SWlqc29nNjJGTVJuSG5UcVhpcUlDTFZG?=
 =?utf-8?B?cXM0SnNqYnRrdkt5b0dFVnBkUFFBUW1naVRsSlBMNWhzQWNSVnlmMHFRUFZt?=
 =?utf-8?B?ZWxsN1RYQnd6dmc0OE05VEhETTNtYVZObmk1eDM4dWlHNi9iZUZXaDFtR04x?=
 =?utf-8?B?Qk93T3hscG1pbEJNYTZEVEZUdnZyQjJFbFpKMnFqTG53cFJQOExiZlljb0Uw?=
 =?utf-8?B?OUxmUHp5ZHNmM2VDTW8xZE1FdjcxeWl6aGFkQUpWVGowV3ZKQVc2VTNyTXVm?=
 =?utf-8?B?T2JremsrQ1A4eGN5U2owa2lJR0NlWVBYMEJ6S2tkRkwzL0x6dWVUekJWOWho?=
 =?utf-8?B?ZDJIdFhzVjNGQ2ZySGxMMVFNV2d2TE5lV1pVWkZxZm5tRHBsd1ArancwZmtp?=
 =?utf-8?B?NFFwYWFFU3hQNmlxNitlM2VtS1ZvR2lJQTdiaXNZakxMRFFyTjJQUndqUVZU?=
 =?utf-8?B?MHBZZnRhV0N1Ky91MS95VDhDczVnQkprRHdqdytEdlFQb09IQUZCWk83QkU2?=
 =?utf-8?B?OU1HNlhLenpwdFdlbGJkbWRaTW40dis5UVZvOWJKMXg0WnByT2ZzSmhxZEhY?=
 =?utf-8?B?Sm1Oenpib2FVb01jNTdUNm9RYjVLQ3JwSC9JQjBQRUNzbmI0QjIwaHR5UW5T?=
 =?utf-8?B?andtWGRXcmhZVmhiMEVoQjBwVzl5Z3V2S1MzNldwTGxXU3VnRmhKdStiRldC?=
 =?utf-8?B?aTFuZlhRSGpUeUcwRHlxMGxkYTFTNGtucjBnTE0ySGhVQ3Z0ZHd2LzBoSzlT?=
 =?utf-8?B?VU9OMVpxK3FERVhUOUNHUFJDZEFXUWVlZkhTaGh6YTVSOG0vMTBaWmE2dy9X?=
 =?utf-8?B?WEFzUWYzYks1NW1rK2lBdUVTSTZBMWZwVHppY0VQRWFMaGp6eUVMREpobXFP?=
 =?utf-8?B?Mlg1YVNpMTVIa1k1WWhkazFwYVp4MTRtTHEvRmw1MkhrKzNSLzlLb1ZzN2hY?=
 =?utf-8?B?WVMzT29admFSOS9VOUNSbGUzOXFjR0xoL2JZa2VFUVR6TTNheDEySjZ0NURm?=
 =?utf-8?B?NlUzOGFoUXZENlNRNzdpVjIva0dMOTN3NWV1b05DMHk3WFkvaFB2dmFBVFZ2?=
 =?utf-8?B?UTFUeU51ZHVKTmNlVUJTaS91SDZuVmE5WExMam0zUFFQajVoOFQwMTFVMCtm?=
 =?utf-8?B?MU5wbHdGdXlDRGs5UXJFNlJ3WFpzMmZLYjJjUzk3TWtYQksxcThOUVh0VEl1?=
 =?utf-8?B?a2tDV0V4NmNHTExwVHZuWWZXdTRSVmtBK0pORXlkTEtWbklxYVJ3S3Q1U0Vo?=
 =?utf-8?B?MFltR2QrOU0wamZDQXV0NVNwM3ZvZ0Z4ckg0VVFmbWFPL2NrS1VJNXM1SXYx?=
 =?utf-8?B?bEU3N1Izd0lBcWsvVXNiWVAwb1ZXU012ZXk4ZzBQUy9iZnlSUjFTYlVwYUNQ?=
 =?utf-8?B?UTYydGNwL2FFY0pyV1dCanhmazRXeXZBUEsxcEk4K3FSN0V0cGFBTEtIVHB3?=
 =?utf-8?Q?FPvCrQ?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?eGllcHNXNEF2NUk5TmQwU1F6Y2Q4MEVCb3JzaDNyMmtrMENyMDFIZ0swOFhu?=
 =?utf-8?B?cDFTb3B5d29ZdDhuOWRwdW9aM293QTBEaDE5M2tncDdpdjBhb1gzYjBqUG85?=
 =?utf-8?B?VWM3Z3VzNCtFa2lZNG00TG1RSU1zc1FIdVNuKzljemc5SUlUL3NvZmk3Mm9O?=
 =?utf-8?B?elBJM01nNGRFaHlwNXdhZlF3bTRnaDJ0UEU1V2F0U2hWY3pDNDJiN0h4TXFq?=
 =?utf-8?B?SEo5RVVPTmtYSkhPYXIvNEhjRkNFaXRsN1kyWml6UDdELzVuNDZ4MWUzNTlu?=
 =?utf-8?B?SUFYQ09lS3ZwRXpVSDVlYXVTSEdzbHdYWG40Rk8xelVsZ2tQVXYyL1RWblZQ?=
 =?utf-8?B?VnIwaFFhUkVrYzNOdlpGRmZPZjZhd2RpbWlKaEF0UnBxTVJuYkNTbElCN2hK?=
 =?utf-8?B?Z3o2bFlyc2pZVXBGZ3l3QkNPWWZXbzQ2d3d5TEFuemoyQjliOU93OHVoRGhW?=
 =?utf-8?B?RUtYbWpFcFBQL21lcEM0Y0ZGbHltVC84ZGlXM3BIMjJ2cGw5NUd2ZmxiZUp2?=
 =?utf-8?B?SC8wUVFCb1d5UzU2ajNDbTBNWjFaTnFac1VhOEFDd2RSQjJxMmRiSmZmUDgy?=
 =?utf-8?B?bW8zQjhTbVA1OVhiM0ZNeXVNVEszMFVFUGlsclpSdlFMR09lbWxtRXNYMmNz?=
 =?utf-8?B?anVnc1dIRjMyNGFYQWxFZXJESkxWREUzQmhYRnAzWnNOQkJ1bTNJR2VNVjlS?=
 =?utf-8?B?OFM2TVJoYXhrdDFZLzRzd0dIN1NMcmRTbkhhYTBFbFBTa2Q2MVptQnpVdHhD?=
 =?utf-8?B?dnFuNzVlelVReFBjbUlBajNCT3VTV0E1azdNeW92c1lrRzBlMTZ1aWpnMjQz?=
 =?utf-8?B?c1ZvZVdhMFhKRi9KK3UwVHBSbXVHMEpJYXhXNWI0YXc5RWhvMTNMNjVYVlVD?=
 =?utf-8?B?RERiaWtWd2F0clhra0t6ZERiUHR6WnhBWVZpeVJNKzVSWGJxZk1GQ3Y2dlp3?=
 =?utf-8?B?N2tsMkZ0dnNKTXlnU0p3Q2tXKzcwYjJuOFFiVVN6Q3Byd1pnNW41bUwyTmc1?=
 =?utf-8?B?RnQyeUxNTHkvUzdSSGFXYXNSdnVTbVBiQnhod0NnRGloZXE2T1NFWUZDQ3RS?=
 =?utf-8?B?eFMzL3h0U3NDU3F0M0xIdFp6aFBYekJvMjV4VmpFZzBVNE9IdGVDTU5ndllW?=
 =?utf-8?B?OXRibkdHWW9SSmtUNDMxNjNsaWtNSHk5SWJmOWZSZXFmU0FtaWJ1NE5jLzFC?=
 =?utf-8?B?RTZnVSsxL0M5OW10QlQzcG1SbUNaTk11Sm1zSWdYa2FyU0h5Q1VaM200cGNz?=
 =?utf-8?B?MXlibEpUUWdOOHljLzNUWUxVb2FRMkU5R2dPU1Z5K0NjVGFIdThnSmIzNHRB?=
 =?utf-8?B?MExYS0ZHejJpOW14eHRicHRwQmQySnJSMGNObmhRSHIwT3QyUEhMVFhvL3B5?=
 =?utf-8?B?ci96TStYSkk5cDliNHJLWEdDeklSNjcrMWRGbnFFbHFOU3VOLytzcFh0RXpp?=
 =?utf-8?B?eklBRXhiUkdmQWVGNlpjZ2pRbVNDbDE5Z3pLQmlRMjl5U0hyK3ozTGxHS2dL?=
 =?utf-8?B?VjBaWWVuSWNpK3FFUndoNTY2blE0Y1dxNFUrSysxelMvRkI4dEdkZ2xKSlRp?=
 =?utf-8?B?MzNodWVDbVdlNkRSRXY4K2lwbVFxUmovS2lmL2ZMYlhwaHlhczdYak9VNW8v?=
 =?utf-8?B?V3Z4R0VDWmI4VG1qUWV0MjM1ZzArTmlYZDVHUnE0WkhJbDNxZXFTVkFZaERD?=
 =?utf-8?B?U0VWeC9BcWVDM1pRa3hlWDlsaVlTNHpmT25LcHNLeE1tMVNuK0xWTDZGMXE4?=
 =?utf-8?B?K2RSRU1wOFVFZ0pSbU00azN5S09peUI3OVQ2OFlzaSticE9KbmlDUWpZTmUz?=
 =?utf-8?B?Tyt2aFZoYjJ6Q2pFcUYyaExVbTNldnJTbUpPeDRRaklpcGZNcHM5bjJhMGFF?=
 =?utf-8?B?TjlWV21MV1NqejhSNUJ2djNaYmJudkJNcEF3YUlBNklWeVdGak9QV2RSS2tR?=
 =?utf-8?B?U1RxVzVucUgyOW5aUzJ1eWVjVDNubHVOWHhwRXVSelZ2V2RkNGhMbVFyK29w?=
 =?utf-8?B?Q1h4UVhuQUloOEFjYXJyaDhiSnZOWE5IRU5hcGFjRXdoVXBYVWdrWlpxZFZX?=
 =?utf-8?B?amdDS2k0THNaT2paZkMzUjlROTVRcWdmZWsvK1hHcWgwRTJaQjBXczBoZFFW?=
 =?utf-8?Q?dAb9qx/s2XeL0rhJrZoaNqf0G?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <82A67376504E2042985637477D24879A@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5bacbc2d-993d-4213-49f3-08de27a56594
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 19:54:06.0424 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 6Z7EFYsSsThBisqAt/ydha/QyBfcprxdXESUE+DNiXGuH+smKEB4n77xm6quY0AOLPlpok+knExdmBe6PgQ9zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7701
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDE1OjU1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gT24gV2VkIE5vdiAxOSwgMjAyNSBhdCAzOjMwIFBNIEpTVCwgSm9obiBIdWJiYXJkIHdy
b3RlOg0KPiA+IE9uIDExLzE4LzI1IDU6NTQgUE0sIEFsZXhhbmRyZSBDb3VyYm90IHdyb3RlOg0K
PiA+ID4gT24gU2F0IE5vdiAxNSwgMjAyNSBhdCA4OjMwIEFNIEpTVCwgVGltdXIgVGFiaSB3cm90
ZToNCj4gPiA+ID4gVGhlIEdTUCBib290ZXIgZmlybXdhcmUgaW4gVHVyaW5nIGFuZCBHQTEwMCBp
bmNsdWRlcyBhIHRoaXJkIG1lbW9yeQ0KPiA+ID4gPiBzZWN0aW9uIGNhbGxlZCBJbWVtTnMsIHdo
aWNoIGlzIG5vbi1zZWN1cmUgSU1FTS7CoCBUaGlzIHNlY3Rpb24gbXVzdA0KPiA+ID4gPiBiZSBs
b2FkZWQgc2VwYXJhdGVseSBmcm9tIERNRU0gYW5kIHNlY3VyZSBJTUVNLCBidXQgb25seSBpZiBp
dA0KPiA+ID4gPiBhY3R1YWxseSBleGlzdHMuDQo+ID4gPiA+IA0KPiA+ID4gPiBTaWduZWQtb2Zm
LWJ5OiBUaW11ciBUYWJpIDx0dGFiaUBudmlkaWEuY29tPg0KPiA+ID4gPiAtLS0NCj4gPiA+ID4g
wqAgZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZhbGNvbi5yc8KgwqDCoMKgwqDCoMKgwqDCoCB8IDE4
ICsrKysrKysrKysrKysrKystLQ0KPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9ub3ZhLWNvcmUvZmly
bXdhcmUvYm9vdGVyLnJzIHzCoCA5ICsrKysrKysrKw0KPiA+ID4gPiDCoCBkcml2ZXJzL2dwdS9u
b3ZhLWNvcmUvZmlybXdhcmUvZndzZWMucnPCoCB8wqAgNSArKysrKw0KPiA+ID4gPiDCoCAzIGZp
bGVzIGNoYW5nZWQsIDMwIGluc2VydGlvbnMoKyksIDIgZGVsZXRpb25zKC0pDQo+ID4gPiA+IA0K
PiA+ID4gPiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZhbGNvbi5ycyBiL2Ry
aXZlcnMvZ3B1L25vdmEtY29yZS9mYWxjb24ucnMNCj4gPiA+ID4gaW5kZXggMGUwOTM1ZGJiOTI3
Li5lY2U4YjkyYTYyN2UgMTAwNjQ0DQo+ID4gPiA+IC0tLSBhL2RyaXZlcnMvZ3B1L25vdmEtY29y
ZS9mYWxjb24ucnMNCj4gPiA+ID4gKysrIGIvZHJpdmVycy9ncHUvbm92YS1jb3JlL2ZhbGNvbi5y
cw0KPiA+ID4gPiBAQCAtMjM5LDYgKzIzOSw4IEBAIGZuIGZyb20odmFsdWU6IFBlcmVncmluZUNv
cmVTZWxlY3QpIC0+IFNlbGYgew0KPiA+ID4gPiDCoCBwdWIoY3JhdGUpIGVudW0gRmFsY29uTWVt
IHsNCj4gPiA+ID4gwqDCoMKgwqDCoCAvLy8gU2VjdXJlIEluc3RydWN0aW9uIE1lbW9yeS4NCj4g
PiA+ID4gwqDCoMKgwqDCoCBJbWVtU2VjLA0KPiA+ID4gPiArwqDCoMKgIC8vLyBOb24tU2VjdXJl
IEluc3RydWN0aW9uIE1lbW9yeS4NCj4gPiA+ID4gK8KgwqDCoCBJbWVtTnMsDQo+ID4gPiANCj4g
PiA+IFNvLCBzZWVpbmcgaG93IHRoaXMgaXMgdGFraW5nIHNoYXBlIEkgbm93IHRoaW5rIHdlIHNo
b3VsZCBqdXN0IGhhdmUgb25lDQo+ID4gPiBJbWVtIHZhcmlhbnQ6DQo+ID4gPiANCj4gPiA+IMKg
wqDCoMKgIEltZW0geyBzZWN1cmU6IGJvb2wgfSwNCj4gPiANCj4gPiBvaGhoLCBib29sZWFuIGFy
Z3MgYXJlIHVzdWFsbHkgbm90IGEgZ29vZCBpZGVhLCBiZWNhdXNlIHRoZXkgbWFrZSB0aGUNCj4g
PiBjYWxsc2l0ZSBub24tc2VsZi1kb2N1bWVudGluZy4NCj4gPiANCj4gPiBUaGF0J3MgYWxzbyB0
cnVlIGV2ZW4gaW4gbWFnaWNhbCBsYW5ndWFnZXMgc3VjaCBhcyBSdXN0LiA6KQ0KPiANCj4gSSBm
dWxseSBhZ3JlZTsgdGhhdCdzIHdoeSBJIG1hZGUgdGhlIGZpZWxkIG5hbWVkIHNvIGl0cyBuYW1l
IG5lZWRzIHRvIGJlDQo+IHNwZWNpZmllZCBldmVyeSB0aW1lLiA6KSBNYXliZSBgaXNfc2VjdXJl
YCB3b3VsZCBoYXZlIGJlZW4gYmV0dGVyDQo+IHRob3VnaC4NCj4gDQo+ID4gDQo+ID4gTGV0J3Mg
cHJlZmVyIGVudW0gYXJncyBvdmVyIGJvb2xzLCBnZW5lcmFsbHksIHBsZWFzZS4gU28gZm9yIGV4
YW1wbGUNCj4gPiAodGhlcmUgYXJlIG90aGVyIHdheXMgdG8gc3RydWN0dXJlIHRoaW5ncywgYW5k
IHRoaXMgaXMganVzdCB0aGUNCj4gPiBlbnVtIGFzcGVjdCBvZiBpdCk6DQo+ID4gDQo+ID4gwqDC
oMKgwqAgZW51bSBJbWVtU2VjdXJpdHkgew0KPiA+IMKgwqDCoMKgwqDCoMKgwqAgU2VjdXJlLA0K
PiA+IMKgwqDCoMKgwqDCoMKgwqAgTm9uU2VjdXJlLA0KPiA+IMKgwqDCoMKgIH0NCj4gPiANCj4g
PiDCoMKgwqAgSW1lbSB7IHNlY3VyaXR5OiBJbWVtU2VjdXJpdHkgfSwNCj4gDQo+IFRoYXQgd291
bGQgY2hhbmdlDQo+IA0KPiDCoMKgwqAgRmFsY29uTWVtOjpJbWVtIHsgc2VjdXJlOiB0cnVlIH0N
Cj4gDQo+IGludG8NCj4gDQo+IMKgwqDCoCBGYWxjb25NZW06OkltZW0ge3NlY3VyaXR5OiBJbWVt
U2VjdXJpdHk6OlNlY3VyZSB9DQo+IA0KPiBJZiB3ZSB3YW50IHRvIHVzZSBhbiBlbnVtIEkgdGhp
bmsgd2UgY2FuIHJlbW92ZSB0aGUgbmFtZToNCj4gDQo+IMKgwqDCoMKgIEltZW0oSW1lbVNlY3Vy
aXR5KSwNCj4gDQo+IFNvIHdlIGNhbiBzcGVjaWZ5IGBJbWVtYCBhcw0KPiANCj4gwqDCoMKgIEZh
bGNvbk1lbTo6SW1lbShJbWVtU2VjdXJpdHk6OlNlY3VyZSkNCj4gDQo+IHdoaWNoIGlzIGFzIGV4
cGxpY2l0LCBhbmQgYSBiaXQgc2hvcnRlci4NCg0KSSBmYWlsIHRvIHNlZSBob3cgYW55IG9mIHRo
aXMgaXMgYW4gaW1wcm92ZW1lbnQuDQoNCj4gDQo+ID4gDQo+ID4gPiANCj4gPiA+IFRoaXMgbWFr
ZXMgbWF0Y2hpbmcgZWFzaWVyIGZvciB0aGUgY29tbW9uIGNhc2Ugb2YgIndlIHdhbnQgdG8gZG8N
Cj4gPiA+IHNvbWV0aGluZyBpbiBjYXNlIG9mIEltZW0sIHJlZ2FyZGxlc3Mgb2YgdGhlIHNlY3Vy
ZSBmbGFnIi4gU29tZXRoaW5nDQo+ID4gPiBsaWtlDQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgIEZh
bGNvbk1lbTo6SW1lbVNlYyB8IEZhbGNvbk1lbTo6SW1lbU5zID0+IHsNCj4gPiA+IA0KPiA+ID4g
YmVjb21lczoNCj4gPiA+IA0KPiA+ID4gwqDCoMKgwqAgRmFsY29uTWVtOjpJbWVtIHsgLi4gfSA9
PiB7DQo+ID4gPiANCj4gPiA+IEFuZCBpZiB5b3UgbmVlZCB0byB1c2UgdGhlIGZsYWcsIHlvdSBj
YW4gY2hhbmdlIGUuZy46DQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgIEZhbGNvbk1lbTo6SW1lbVNl
YyB8IEZhbGNvbk1lbTo6SW1lbU5zID0+IHsNCj4gPiA+IMKgwqDCoMKgwqDCoMKgwqAgcmVnczo6
TlZfUEZBTENPTl9GQUxDT05fSU1FTUM6OmRlZmF1bHQoKQ0KPiA+ID4gwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgIC5zZXRfc2VjdXJlKHRhcmdldF9tZW0gPT0gRmFsY29uTWVtOjpJbWVtU2VjKQ0K
PiA+ID4gDQo+ID4gPiBpbnRvDQo+ID4gPiANCj4gPiA+IMKgwqDCoMKgIEZhbGNvbk1lbTo6SW1l
bSB7IHNlY3VyZSB9ID0+IHsNCj4gPiANCj4gPiBTZWUsIHRoaXMgaXMgaGFyZCBhbmQgbWlzbGVh
ZGluZyB0byByZWFkLiBJdCByZWFkcyBsaWtlICJzZWN1cmUNCj4gPiBJbWVtIiwgdW50aWwgeW91
IHRoaW5rIGF0IGl0IGEgYml0LiBEZXZhc3RhdGluZyEgOikNCg0KQnV0IGl0IGlzIHNlY3VyZSBJ
bWVtLiAgVGhhdCdzIHdoeSBJIGNhbGxlZCBpdCBJbWVtU2VjLg0KDQo+IA0KPiBSZW5hbWluZyBp
bnRvIGBpc19zZWN1cmVgIHdvdWxkIGFsbGV2aWF0ZSB0aGF0LCBidXQgdGhlIGBJbWVtU2VjdXJp
dHlgDQo+IGVudW0gaXMgYXJndWFibHkgYXMgZ29vZCwgc28gSSdtIGZpbmUgd2l0aCBpdCBhcyB3
ZWxsLg0KPiANCj4gQW5kIGFuIGVudW0gY2FuIGFsc28gYmUgdXNlZCBhcyBhIHR5cGUgdG8gbWV0
aG9kIGFyZ3VtZW50cywgd2hpY2gNCj4gY2FycmllcyBtb3JlIHNlbWFudGljcyB0aGFuIGBpc19z
ZWN1cmU6IGJvb2xgLiBTbyBhZ3JlZWQsIHRoaXMgaXMNCj4gYmV0dGVyLg0KDQpJcyBpdCB0aGUg
Z29hbCBvZiBSdXN0IHRvIGNob3NlIHRoZSBtb3N0IGNvbnZvbHV0ZWQgd2F5IHRvIGRvIHNvbWV0
aGluZz8gIEkgZG9uJ3Qgc2VlIGhvdyBhbnkgb2YNCnRoZXNlIGlzIGJldHRlciB0aGFuIHdoYXQg
SSBoYWQgaW5pdGlhbGx5LiAgVGhlcmUgYXJlIHRocmVlIHR5cGVzIG9mIG1lbW9yeSByZWdpb25z
LCBEbWVtLCBOb24tDQpTZWN1cmUgSW1lbSwgYW5kIFNlY3VyZSBJbWVtLiAgSnVzdCBleHBhbmQg
dGhlIGVudW0gdG8gaW5jbHVkZSBhbGwgdGhyZWUsIGFuZCBldmVyeXRoaW5nIGVsc2UganVzdA0K
Zml0cy4NCg==
