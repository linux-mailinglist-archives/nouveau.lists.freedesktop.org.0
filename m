Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E4437B21327
	for <lists+nouveau@lfdr.de>; Mon, 11 Aug 2025 19:29:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFD7610E19E;
	Mon, 11 Aug 2025 17:29:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pOuerUGd";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2049.outbound.protection.outlook.com [40.107.237.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02E7810E19E
 for <nouveau@lists.freedesktop.org>; Mon, 11 Aug 2025 17:29:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tve+NoV4GOHMGm1BDe36CvH6e8+iyQLzu4JUjzLrgGbabeTv1JX2XxbF6U/O19mioV+hmfRdcBdYy4lgOnGuFxyidpuVHSmSQZAtO6Rau1XTnu6HmaAl4ZTjV2Ofkux8qDmY+GsobvS6ow/je4qHGa30YFZygUEL//dfaIY7Dkiv34dmPd243jV/M/x1pcgjfSFsWqYNM28E1dP7Gz5UGL0HAN/+MA8RgNkwwiHclcWkvs3ctCDfYbCHKJ5rzWC8nfz8c0hX9AibrDXOyvROJ0SJrS9eP6uRceB0r2StJsPLdXXD/mr5CZmP+CAbYxZ+dTb7NVqdIDEjCN3Fl7T4xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=adzFe6hUbnKKg3on9JBFgtGeLRg8d7TKy4OA7XIAVRs=;
 b=C7lXfGqZtIv/CIUFFGiGWJEKs3yZrnm6s4Z4zed1j97JZSfwtPQTYmJPl1+Zh10rOQgu5taEkyrPn35uOq+Q2nQ0DD9OFMmS9VB62oQVBQpZCQtK50cEeDddxRyQwTQpt3hIesZORu02dadWvgY8GQTK1tNrnUpFZvydRl54aH0O69yOwOyYFPCKXVWMG5JDaC3RqAsw9T1EiMfoDQ0/ZHsc+Ksie0jhXlFpn4lEjuE6UUKICJkpyRu9TUdLiKCYM8uhl6KcBXgEHaCiY86bEcCxIZzeVCxAH3vY+DWNZRvpxk7a5d5hxrKzZL5/VjtUhZ+Ta2y6+l92hxI4ESZKZw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=adzFe6hUbnKKg3on9JBFgtGeLRg8d7TKy4OA7XIAVRs=;
 b=pOuerUGdsnFMbgTnmybsGLTrvoIpU/UKAoHxeJTgTkRTsVxVPMbmb43ORz5u0ZVOE0XP/gi3iy749ynt9c7J1e2/fZbQ163UNMtW3/P9oLS7aHe4Hjd07GxGd44kC0TlfaumpDqWWSEa3Udif36lo3HCX1ggWgiRlSRu2dl9EX1DVJ5lyEOSpZlYS4/vKy63SiPw5/lWHTibNCSmSK2j1mWq7XkGA2ljjyoXVFGcv5wZtZhiwP0HNFICpVJ2MyYtttfXVas9OZ1WcCMsyZu6TjnHST4l4Ri2vqkMaztXejYOqfcAMU9sXHFbj1ae1G1LQtjzz0S75zLRbccfgVPxtw==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by SA3PR12MB7921.namprd12.prod.outlook.com (2603:10b6:806:320::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Mon, 11 Aug
 2025 17:28:59 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%6]) with mapi id 15.20.9009.018; Mon, 11 Aug 2025
 17:28:59 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "lyude@redhat.com" <lyude@redhat.com>
Subject: Re: [PATCH] drm/nouveau: always set RMDevidCheckIgnore for GSP-RM
Thread-Topic: [PATCH] drm/nouveau: always set RMDevidCheckIgnore for GSP-RM
Thread-Index: AQHcCJjCgBQkoK1ck0W6TMIseAh2WrRaK9eAgAONzgA=
Date: Mon, 11 Aug 2025 17:28:59 +0000
Message-ID: <bddedeefb8adbb37e7bff77f58aee8a0726f6ff0.camel@nvidia.com>
References: <20250808191340.1701983-1-ttabi@nvidia.com>
 <d35654eb-6aee-4b5d-88af-32bfe4eb6b5c@kernel.org>
In-Reply-To: <d35654eb-6aee-4b5d-88af-32bfe4eb6b5c@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|SA3PR12MB7921:EE_
x-ms-office365-filtering-correlation-id: d6c6a678-efb2-49e7-d5d1-08ddd8fc8ed4
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?aXZ0L1k3NHpUTkNaamlqVHFQclRWeGxOcmNoc01PelVSVlF2OXdvTDhUTXlJ?=
 =?utf-8?B?LzRnTGdZb3BKVFBjV3Q0V2owNTlHQ2NobGdPajY2SFowRmNZWllOZi9BMkhO?=
 =?utf-8?B?SjdNSVZISXIyek1IaGordExlS0FYZS9xdVQ4eHk4ckt4S29mWHdwaVB2TWpJ?=
 =?utf-8?B?M2lhalNoRGRGWWhOS0d4c2ZsUXN2bGdTMDVjR0gyOVJ6U3BjV3BsL0FmWkxZ?=
 =?utf-8?B?cDNvSzFLNGJ2NzBsTi9aSjdWVnNZckVxMTNqL2RWMFYwdTBsbGRpcEd4K1B6?=
 =?utf-8?B?OXowdTg4L0RJbjh2N3dFOEJRN3R3eElqVEhlRis4V2lWc2xiVjVmMXkydVZW?=
 =?utf-8?B?dlZyT1pQdEJaNEcyZi9nb3pDUDE4TzNHeEgxeWFtZXZZN2ZNdFh2UWVDcCtG?=
 =?utf-8?B?SkZ1WVBrd2kvMFpQZ2JkVGREaTUxcDdKQ1EzcTdnTms4YnUvZmw1aHFPcmMr?=
 =?utf-8?B?Z2pzTThyanRGeVZYZDNTWUt4YjVvdWRVQURwekVwcVNHNkFBcGh4Qng5VWxq?=
 =?utf-8?B?MERET2g5WnkxT2JUZXBFT20vU3NMZzRHRi9WRDV3UHE5V2ZzZWdWejZ0Wkdr?=
 =?utf-8?B?ZU8ydTNCR2l5M05TT0ZTTHRNajJYcVpjSHJoSEZkTlRtWi9QR1p1WFhiRk5h?=
 =?utf-8?B?dy90T0p2bDhjME9jeU0xYzY2bFhZbGtJVjdTRlZyNHZLUVNmNE9rTGhvdnll?=
 =?utf-8?B?WnNOeXk4LzJsU2FLSEtSbWp6emtPRzR4SUNlTE1JN1BJNWRIZ0NVMDA4Y1Y3?=
 =?utf-8?B?Mm00QTNSQTZCTzN2bThMQTFFb2JnakU3TGlaNDIwdE1qajBoalhUVnZzSU9E?=
 =?utf-8?B?MzF3TWhRcXR1LzB2R3dNZ3BlMGcvNS8xWnIydE0rMTkzYjlLRGNXdEFpbVI5?=
 =?utf-8?B?WlNBdU44bDlrWjgvZVFyYW1jU09Hcm9pQU1HUEZUQWtFc1pkR1RBYmFGY01E?=
 =?utf-8?B?NVRXMWk3TXRSNnhuY3BzbzFsRU8rNG5tVlRlNFhVVndZMGgyaTI4MjJLb3pi?=
 =?utf-8?B?dTdiYm83RGZkdm8xanhQNXZza3hUTFpJelJYc2VKY3ZiNVAwNDJjUFpDUndN?=
 =?utf-8?B?Y0NRNUFIT2MwWDd4ZDZ5d2FpZ21RTEwvSGY0VWlHLzZCdEdMTnBTWm1ySEFN?=
 =?utf-8?B?c3BtQ3VxTE9VUHoxYnRZVjhxejdwR0kxM3o2b09LZE5vY2FlMXNJUjFub1Ru?=
 =?utf-8?B?U1A5Y1UvR0NFbHE2R2RmWmZsYy9KWmFvQnkwTzUzaWdyaGI4dzFwNXFXZTQv?=
 =?utf-8?B?V1hhUGRNaHorZEJPZzFLdUFnTFA4c2cyZitXOHRrNWJRbWRCZjBqZS9QSmpI?=
 =?utf-8?B?Y0g1M3BzMzFpRWczMTRjdmNPRGl6NzMzMmU3VUxMRk1Xb3EvaEJWbVV0V3lW?=
 =?utf-8?B?cVcrajROQ2VyZkRxcGcrYkxhZ1drNzczTjBZczcwakRJMHloc0hsaXM0SGxC?=
 =?utf-8?B?SzhSTVRBQTJNYXpiazkxVDdDdlB4aXlaMkM2NjlySFVMblRhN0laTklMM1FX?=
 =?utf-8?B?TnpvamNXbkJxWjJrbjBEZlcvNWh3WlJaeDIxSm1XMkozMVRDeGh5TGNLay85?=
 =?utf-8?B?UHM4TkxxcVJpMUtEVGFKQjVWRHBaZWJMZ0Ezb1FOU3c3YXUxUzdPeXBtL0Ez?=
 =?utf-8?B?dS9rblF5cU9WeXRmTnhIK0RvZkNtcFI0YTVCeTRubWdIc2NzSzJ5Y004czBj?=
 =?utf-8?B?clJlRVVEamtpU21MZVB4MnNyQzZrVVBSdzlDVUVCVWpGYU0yUWx5TUl0T244?=
 =?utf-8?B?QmhJVkZZc0p2ZnJ5UjI2WUQyc2Z4enMrZDJiTUdLQmpzaHpTUVVtSk9lbzFH?=
 =?utf-8?B?TkJyTEdqWXZycVg1NTI0Z1RkbU91TU94aXN5TWlGMk9NZ2E2eTFVbkF3Y04z?=
 =?utf-8?B?c2t6SEU3QThCNXVDZ0ZJNUovbTJwNzcrdlZjN3pjNXByU1M5dy9td0xEV1RG?=
 =?utf-8?B?OE8vb3JTMm1nc0hoNi93QlNFUnRmSVh5Yk56WEZYbE1LNXpCM1JxNzNSaUVV?=
 =?utf-8?B?VUcrU09yM1FnPT0=?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?aUZPUkRrZTRlNlNqWTFiYmNId2hjdmxIQnpIaXY3SlNueStYTDBtZTVFTWxT?=
 =?utf-8?B?MU9PQm1pbERLcmNJdU1rR2hYZE9GM3BSaHdxR0RhZjlTT0I0OG1KaGVBMktP?=
 =?utf-8?B?dUdNZ1JFcnZ4M1RlVlhpWHppZGNVSkhxV2haL1ZBdXhjWUcydWQrOXpaVDdo?=
 =?utf-8?B?SmVYN3Q3bmh4Z0N3VGFLKzZIWkprMTRHd3ozRkVkeEF2NDNWT0NvRTA3ME1E?=
 =?utf-8?B?SFNLVG5DU3hRalhBcHQ2ZUVibW9aS3NiVUZscE5vdG1iM01wTHlPMlgza2xB?=
 =?utf-8?B?Nm11c1U5REZWM05WdTFoZHVaZ2RBQndDd1VZL1lzcmJQdjl5TDR3OFdaNitp?=
 =?utf-8?B?UWx1U3Z0OWo2U21CejB3dENqQzNyMEt4MVd4Y2FFVHh3aHgwT3FCcVFZSUZR?=
 =?utf-8?B?ZjJQbm1GR3ZNYXNZVEY0YnZ6WWVpeXZtMzdWWWdQbFIvNjlmOHdxa3lJaWxw?=
 =?utf-8?B?SkFmRElMbW9mTFNqNGNZZDFUT0llbXppNjh5R0hJUGpUTHdOVG5PS0RSb2VX?=
 =?utf-8?B?NzFxNkYwVHFQd01DcEZJRTZUeVFJUmxNVVdaYXNyOTc2V2ovM0Z0SEo3UDV4?=
 =?utf-8?B?bjI0V1hoZXFnNTFqZW4xbWxqRFhtSzJYUEUyS3NUUFV4RU5oU3V3N1N0d2pT?=
 =?utf-8?B?eXNWV0UwVnNacmRXTW1YQk1FazY0bkpnZHQrWFRMMFNwK2FhSGhTYkZJM3pq?=
 =?utf-8?B?YThWcUZ2ZjBiYTZyVHVlbjk2cTZjYUpmcDlaVVZUNFBWcDlSa1h4Q3dmc09V?=
 =?utf-8?B?U1lieFNkeUcycTRJUnNXWXFzMUtiemFCMjlId0p5WmZtZVhWbFBiSjVkNnJp?=
 =?utf-8?B?L0NIQ3RoRTVkS1RmTkpNR0x3WnFwQ2dVRlhCa29hUlVKeE5lU3I1U0c1WVJL?=
 =?utf-8?B?aGZneEw0OFE2VTRJdjgxeXdQVEZyVkxsOHo5cVBCZHdUS1g0R3pURlZsdE13?=
 =?utf-8?B?M2c4SHNyUm9CWkRyb1dRdE1pdEZqNFcwY3p6UXFiMjdqb09Jbk5DUVpaT1Jv?=
 =?utf-8?B?alJKNnA5aWhzcDJCQVh6cmhoZC9oMU5wNmNieHhWMERpaWlabTF0bGk0R3Vv?=
 =?utf-8?B?cXc4NUxxSWNoMDlvVmtzZzJkZ3B0a0l0ZGtOUmN6eCs5cmJlWjRod090dllk?=
 =?utf-8?B?dzJXeGRRR1REUU5GR3F1eVUvbjk3Zk4yRUtIUHJidGpOenpFenU4bVdwUWZT?=
 =?utf-8?B?R1JDdnhXNmpJdkh6bXZYbmVENGZLdlJRSDhJTEh6aFJLbjRXKzQrcVI2N1Ax?=
 =?utf-8?B?TWZPZmlBM002TytOUVVTV1g3NlFTc0w5d2U4S3JNRDVoakNPdkdqc2pCeDNo?=
 =?utf-8?B?ZmJxa2NEV0tlM05HSVR5clFCUlJRdk9ISURmM011SWlsQVRsc3hNOWlyK2Ns?=
 =?utf-8?B?K0pPdkFpRVNSaytEdXZORXpzUnhCbGhURFZHWUpDbG52NUlPRnhoSytkSEM5?=
 =?utf-8?B?cEVHVG8vVGE3b3E5U1lvc1EwY0YzWFNuNlMxU3NhcitndDZmelJxUmdhZXd3?=
 =?utf-8?B?bTRMemJFbkd3d3VlemZJNkRHL3MwTmdnZFZDMVRQZyswMjk2RlRjTzd2Y2w5?=
 =?utf-8?B?ODhGUllqT3dNeGtYU01pTXFGVnQ5K0tQWVZrM2V0V29WYUp2ZFcvUkpyUVl0?=
 =?utf-8?B?bUl5Zk9oaEZ2TkNTakpleURYcWVDWkpFQnIwK1p1NDJMVjNDamRReW8zekhV?=
 =?utf-8?B?YmR2eFB2UzAxN3RwU1cweUZnR3plK1JLZjFKZ3lXK3M4dm1OUmlRZ1hWVE9M?=
 =?utf-8?B?Yk9TUGdIWFUwbExCR3QyYXBZK24vYlNxWUsyOE9saTVvek1MeVJCTSt6STRo?=
 =?utf-8?B?V2I1RGhBM055a2tneTVtUm5sandMd05vL0RoblBXMjB0ZDUvcTY0dDcwNWtL?=
 =?utf-8?B?UEhLT3dieFhZa3ZJTFpRVDlyeHRiNkJhMmY5dkxqL0hsR2dXUE04REtWckw2?=
 =?utf-8?B?T25ZcHkrV2RBbm5ZVzc3S2NsKzlvbHB4N2dXL0pFUVJNWTBIUllLLzh1eUht?=
 =?utf-8?B?aGpSQTdyYXVJa2ZRZXVCeno3RFp6NnErSzlMSW5wcy8zTDRBc1NlRDlpVlUx?=
 =?utf-8?B?UzhxY2J0ZVdHVTVya0U5dlZDeVRDRFZVR2lOQ0tUZnhhd3ArV04wM0I0S25y?=
 =?utf-8?Q?X1h9O8oBYmoEfV0dd7ESdXYPU?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <88907A7C280D84479E690FFADDE02BE1@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d6c6a678-efb2-49e7-d5d1-08ddd8fc8ed4
X-MS-Exchange-CrossTenant-originalarrivaltime: 11 Aug 2025 17:28:59.5930 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: fSV+ikFhCYlrSQVs0PyXJrmfx/1Mh5+Z+OeIAoMpqG2sSNNGZJne9jEEOXry435irQkj4TvZgcDQkljNUC+ZkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB7921
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

T24gU2F0LCAyMDI1LTA4LTA5IGF0IDEzOjEyICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiBBcmUgdGhlcmUgYW55IEdQVXMgaW4gdGhlIGZpZWxkIHRvZGF5IHdoaWNoIHRlY2huaWNh
bGx5IGFyZSBzdXBwb3J0ZWQsIGJ1dCB5ZXQNCj4gcmVmdXNlZCBieSBHU1AgZHVlIHRvIHRoaXM/
DQoNCkkgZG9uJ3QgdGhpbmsgc28uICBUaGlzIGlzc3VlIHdhcyBkaXNjb3ZlcmVkIHRocm91Z2gg
YSBjb21iaW5hdGlvbiBvZiBhbiBpbnRlcm5hbCBib2FyZCB3aXRoIGEgbmV3DQpQQ0kgSUQgYXMg
d2VsbCBhcyBjb2RlIGluc3BlY3Rpb24uICBUaGUgY29uc2Vuc3VzIGlzIHRoYXQgR1NQLVJNIHNo
b3VsZCBub3QgYmUgcmVqZWN0aW5nIGJvYXJkcyBieQ0KZGVmYXVsdC4gIFRoYXQgaXMsIFJNRGV2
aWRDaGVja0lnbm9yZT0xIHNob3VsZCBiZSB0aGUgZGVmYXVsdCBiZWhhdmlvciBvZiBHU1AtUk0u
DQoNCj4gPiBGb3J0dW5hdGVseSwgR1NQLVJNIHN1cHBvcnRzIGFuIHVuZG9jdW1lbnRlZCByZWdp
c3RyeSBrZXkgdGhhdCB0ZWxscyBpdA0KPiA+IHRvIGlnbm9yZSB0aGUgbWlzbWF0Y2guwqAgSW4g
c3VjaCBjYXNlcywgdGhlIHByb2R1Y3QgbmFtZSByZXR1cm5lZCB3aWxsDQo+ID4gYmUgYSBibGFu
ayBzdHJpbmcsIGJ1dCBvdGhlcndpc2UgR1NQLVJNIHdpbGwgY29udGludWUuDQo+IA0KPiBJIGFz
c3VtZSB5b3UgcmVmZXIgdG8gaW50ZXJuYWwgZG9jdW1lbnRhdGlvbiB3aGVuIHlvdSBzYXkgInVu
ZG9jdW1lbnRlZCI/DQoNCk5vLCBJJ20gcmVmZXJyaW5nIHRvIHB1YmxpYyBkb2N1bWVudGF0aW9u
LiAgDQoNCg0K
