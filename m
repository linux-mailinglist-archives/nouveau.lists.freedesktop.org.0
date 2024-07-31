Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 27EEB94340F
	for <lists+nouveau@lfdr.de>; Wed, 31 Jul 2024 18:22:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 663B310E1E9;
	Wed, 31 Jul 2024 16:22:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ftwo0eCH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B23A610E1E9
 for <nouveau@lists.freedesktop.org>; Wed, 31 Jul 2024 16:22:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k2RJQWkFCeNWqXVS461cvB5OGUAqmgs4udD8MRjYRddM4sUtLPB2D72qjhPR2WXZhRrrqDs5ChBUaa01h6qt/pptJPUtrJzkid3OTNgH+24Nq2YUa36V0X8hgosSEpQbaSfjC5u+NoY024GCiyIvlwWpkkd0EmtiB+NFApbX3Ck9Isj0M7YNNQtvXgGrz1Ic7BB9hGl8ggQIAfS+/8QhG31EuEK8OSR3zoxmtbdRSBIbl7s2Jf1Fyz3HLqXzSN6a+mW3Q2AfKhKbaHrWEcYIS/hrhlbbOwNfDURY0FzNEkOBlYRzCvKiDqUG9sWaofik1EU/lpf0X9JlHQETVp9rYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nxFjlGZ7fyDahLwkK3B5i+xLFQTU1kFO3Z5fA3AOW8Y=;
 b=SvKcCeYzSn4tZtDxpQlcbUSJNK+3BNGTcH8NzKCIIBW9S1hh7hO1yWNhQ/aIB6T71ofrwIq3nKNsEC2MsZ1lKmMRAHLfwumJDOUU7+N7qQAkVYm9vRFNLGHN6iAsaHLbrvFGiu8F8AqEvOqiHaeCWrYKsVSluJTYXGixDR2lsB/hfC2V/+xWP2ASJh5Ufy3X4dSJO5kplNGBXRP/0q5Gj3ICe8dOP+pDzja4WPmr8sNUqAqqSW7M/XZPnb0Jq/Z/TxVDOrfdQe8cCVha1WWD3mJY2ygF1ZxcY9FjeMzOF4GIe9hwPjimeV9K3BEK1c9Ykyu7NLPyMIluVHCAQyG7fQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nxFjlGZ7fyDahLwkK3B5i+xLFQTU1kFO3Z5fA3AOW8Y=;
 b=Ftwo0eCHtNbHnPLqTvupTF1/a1aSIEEpsG2Gd4OmGkPMW5/44/9SLQLhlnBt0p8gN4O4wr0IYHdSCmffvNS9Peg0pb8Qgo4/LQEGliNS0adqO74qRuAJRLZ8pJ0v/WvG3RSfSsH/k7/u87CxpaCxqagNnUQ+++lKM4aIEIRYOYAPl9rIjeKxyOHEteWve9tA58sxP28ziA1352cxHUnZrvbvaZG5jbI8lz9kY3u7oWe0wqbDoUr8pRUgFSEMpTf59pAzFDW4jbBdQBc9u2GlLh0iRCS9VOeCXBU0iYBpd3qifMWg2DsUeJ/zaO1UmFmFh42gvwnRSPx3jeiAxrVjKg==
Received: from CY5PR12MB6526.namprd12.prod.outlook.com (2603:10b6:930:31::20)
 by CY5PR12MB6081.namprd12.prod.outlook.com (2603:10b6:930:2b::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7828.21; Wed, 31 Jul
 2024 16:22:10 +0000
Received: from CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56]) by CY5PR12MB6526.namprd12.prod.outlook.com
 ([fe80::e420:4e37:166:9c56%5]) with mapi id 15.20.7807.026; Wed, 31 Jul 2024
 16:22:10 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "dakr@kernel.org" <dakr@kernel.org>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Ben
 Skeggs <bskeggs@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 "dakr@redhat.com" <dakr@redhat.com>
Subject: Re: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Topic: [PATCH 2/2] [v6] drm/nouveau: expose GSP-RM logging buffers via
 debugfs
Thread-Index: AQHa4gwhumoUirve7kybvFxJvluwnrIOaOIAgAFnqYCAAR5QAIAAGKGA
Date: Wed, 31 Jul 2024 16:22:10 +0000
Message-ID: <31f5d860a72e9c237d6b9cc0f4e51b6f49196042.camel@nvidia.com>
References: <20240729230720.1305760-1-ttabi@nvidia.com>
 <20240729230720.1305760-2-ttabi@nvidia.com> <ZqgyJlXclrP19bNe@cassiopeiae>
 <80882b5b7726af1a7a861dccb437e9cb0c84370e.camel@nvidia.com>
 <ZqpQCI75gFZ315r6@pollux>
In-Reply-To: <ZqpQCI75gFZ315r6@pollux>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.44.4-0ubuntu2 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: CY5PR12MB6526:EE_|CY5PR12MB6081:EE_
x-ms-office365-filtering-correlation-id: 080599f3-0080-4b1b-cc8f-08dcb17cee15
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|1800799024|366016|376014|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?YURFRVpiSVM1T0ZxVnNTQjdzam1uQjZLSXkrUTl6L2Z2NWo4TGJNbUNRanlx?=
 =?utf-8?B?TmRieE1hV0JXUnFpdnAwY1l2MFV6SnpoeS9yK3BBRGQ1WnJSQkRlb251dkVR?=
 =?utf-8?B?ckVvaVNXNEV6N2NOTjI2S251bGsyRE5pYXVhaXlHdUgvbUVoVGdiNmdDQTBr?=
 =?utf-8?B?MnZVd1pJaHYxOHMvOEZZNE9DNlVxODQrRE93U2tXTE9HNzRVRmpZc0JSVEpa?=
 =?utf-8?B?TG1uQksybG1xOFlDOEIzTXFSMXRSQmZaUDhFaExHRzBzSC9NZ21zWWpFSnR3?=
 =?utf-8?B?VEVNWVFnUFl5UHF4V29WYXovNTB4NHpQaVl0RFFzdjViQVd2MytKMWdSVnYv?=
 =?utf-8?B?eXdwc1N2c0l3eHlMbUduQkFEeUlIRjAwZjJIZFRDSjB2ZDR0L1huUzVJaHRY?=
 =?utf-8?B?aUR5bWRMMm5GZ1lOcTV1QXhKbzZpT1ZXMGhPbU9JTy9qWExvUk1xa2pkM0V3?=
 =?utf-8?B?MmczSldkOVp3ZmNFbDMyemhLZVcxbjBQSTIrd1c4d3VGU0F5dUExdml3L2lt?=
 =?utf-8?B?RENaUlRZUE1STUxrNE9wOFR6aFR1M3FTZHI3cFFla0lFeHFlQlhoQ3RwYkcz?=
 =?utf-8?B?eUJFdEpwMnhsd00yajRnYjNGMWZ6akpEVFM5MXlYS0xGVDdCWUdyZGlaVzVV?=
 =?utf-8?B?ZU56endIZlVkaEsxZURKSEdKOTI3eXdiTzY4M0lDdkREZGFuTnJTRDcyTFM5?=
 =?utf-8?B?QmVCRnMxb2xkVXVoR3gzczhZRHEyV1gvMVJrSXhOdWk5T0RDbDBLb2VtTmFX?=
 =?utf-8?B?K2VRN3M2SmZNY3U2dnFhMEw4U20rWHZsQkpYUlVkalF2Y2dyY0hLUUE1MGhZ?=
 =?utf-8?B?bVc2aHR1RFB0U3dXTTV6a3Q0VzQ0L21PL2YyV3RmSlhiQ1JRWlBMUUZVT01P?=
 =?utf-8?B?U1pNVlFTVFhYeXAvdzVPTkM2TWZkK1gyZnF5Q05HamNZVGdFV2hXY1Vycmgz?=
 =?utf-8?B?U3p0ZzQxUVNXNnNvc1JJSkt3RTZWalVDejl3cUhBMG91dnIvNmo2QzN1OTN6?=
 =?utf-8?B?bVdNZmMvZjh6bUtKeXlZVHVWd2lmY1VwQVZldUtmSE1CcnFXeDlpUThwUWhG?=
 =?utf-8?B?L2NQSHM3dlF3eGl1WHRhRDVPNGo5MkcvYS9yd3MrUEZwMTJtc3Q5YTFWSkls?=
 =?utf-8?B?TGNCeTRjZk9uVnJXbHVQOUF1WWtzQWhRMllHdlVULzhRT01sZDRuRnJzRkcw?=
 =?utf-8?B?ZDByOTVpRnNiY1hsZld6S2NLT3FYWWlsZTJEeERQb0JyMEZLYWZxcy9qZnYy?=
 =?utf-8?B?UU5PWStYdzBoT2VQNFVXUnV3d2ltVCswWWlDMlNmOHprSnFIeTFXcTFybS9u?=
 =?utf-8?B?eXdsWk1uVFlxUUY2MTU4T1FCc2hvYnczbHdOaEU4YVlxZFdnVWtIdjVqZ216?=
 =?utf-8?B?UUlqMXEyMjFCNDQ1Ukd5T1Z5d2p0RFF3aml1dDBIdktXcEluZzdUT0RZVFhU?=
 =?utf-8?B?d1lreE5Sa0hJOVFHRFVLVFExUmprUjQ1aWc1R1FHREVCNWJQOTFscFpXYVp4?=
 =?utf-8?B?YnAyamIybktSa1Vsc0NwWjVqQk1KWGM3K0lqeDZYeGJpdXZEVUR3MXZXWlVL?=
 =?utf-8?B?Njc5THY3UlJZbzBnVjVORURNVVpwNEJZUCsrUGJ0NHVmV0cwOHkyNlBrWVZF?=
 =?utf-8?B?T3RBT1FFbWtwc2Y1MlBnZGZWY2o0MVpsdGJLU2N1NHR1NXVPRjJ2alp3RkdP?=
 =?utf-8?B?TmpHMXdmN01aZ2NYT3JGNXg4WHFhQ08wekgwaVpHZUc1QTZ6VlBLS1lJcUEz?=
 =?utf-8?B?UDEvaEVIT0xsQVExbVRQZnFoVC9tYUdpYUxzR2FuK0tpWWV0MnNUK3VHVVdZ?=
 =?utf-8?B?OUU3clo0NzVxejFzMk1mbUYyeWJ0bExsU3I1dDFuZkVMTDd2TXlIbiswUVpF?=
 =?utf-8?B?Q0tFSUkrbVJpNzdZK3owSm03cU16UkpOZU5UMXdueUsyRnc9PQ==?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CY5PR12MB6526.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFhPaEx2OVJYTS9kRzE5YzZsaFpMaHZSUStydld2MmNXWGJLdlFnbklHTmU0?=
 =?utf-8?B?N2pjd1E3SjMwUWMxZFJsM0FibVYvbWU5bHU1cVF3SGpLQytSb3BYa3Z4MmZX?=
 =?utf-8?B?OVg1R3dVdXp1dEtLcWozY1p0TjBQdy9oSjNCdnJZSUVmUkUwZGpkcWgxRDBY?=
 =?utf-8?B?RGhMWkY1cGJuUi8vQmxlZDFRM1UvZDMzTGQ0TXlWdXlSV0dtQ3NGc2JXRkhH?=
 =?utf-8?B?RjFuWThaRzBteDBNcUtoTDA1TG01Skt2SWtITjhtWkNqaW54MGtsN2h5aFV3?=
 =?utf-8?B?Yi9oN3ZuMHFhdHNuNkkxTGpXdnFWREppekRJK0lWSEpxSkl5bVhlcHVQUmdk?=
 =?utf-8?B?eHdIL01qcHB4bUpUbWc3ZlRoUktHbWJjRmdEbkE0S3h2M3g2SlRBS2VadVND?=
 =?utf-8?B?bXJBZjhuSDNpZDJSakQvN2tiYmh2Y2lsazhtV1gwaC9CeVZ6TVpsRllwMkYr?=
 =?utf-8?B?TzZZQ2dhQmt5TUlYTTVZLzROK05hcmtLeGVJbTdXZFJTVW5MTlhiVW83WlFY?=
 =?utf-8?B?cTdLRkh0QlJFWDRwdVBtbUoxb3EwRitLMHpIR3R6MG9rNWlxTnpFT3prS1Nr?=
 =?utf-8?B?LzlHUEtjWk9HT0o3Y3BwSllyRyt2dTJJWEcveE9LcVFId2tyeXdPeGtHYTI2?=
 =?utf-8?B?YzZzdTkxTzZTNGxockJMWHBvbUFzeHE4amxFOFFLaHhFV3FGcVdWM2JobGxY?=
 =?utf-8?B?L202bkFBR2c2R0NTbnZWSDZMTGhmeFYzbVYvRXNwSmV0UGYvNm80OEY0d1Rw?=
 =?utf-8?B?K0IvcEZldk1RbXd2dXVORDlmZXlKZk5iSDNDOEtpejNuYm02NlhydU9Va05Z?=
 =?utf-8?B?NGQxSGhXQm9iQlBxTWhralRiTFJJRmM3ZkMzN2RRRGhYZHBoMnN2K0Z3cEhK?=
 =?utf-8?B?ZVhlQ3JKLzNqYUd0WHFHMnpsWlk0R0NaVUlGZmwvS2t0RGx1ekxwL24xeHBa?=
 =?utf-8?B?RTNESlhUeUVOVVVnSXFnTWZ4Sk5tZHVmdjhrRjZUWThpUnNoUFY3THFHMllv?=
 =?utf-8?B?Zml6RU93ZWVXVk5zczhQWE5kalRxNm5GRk1nWTQzMW9FVUN2N1c3NUdldzY3?=
 =?utf-8?B?aFR2NlRleVRBWDk3SzQ1Ny9ObENmYisrcW5yTXVwdHpGaWprRlkxOExlQ3lR?=
 =?utf-8?B?VG5JTUppTGZlNytZcHB3cGwwd3ZwV3JrV0wvcjBFM0VaRWRWSlVJRndnNVhR?=
 =?utf-8?B?TXBBQUJKVHE0ckt5YWRORUFwbGFiVjVKTU4wR2Q2WVBpZVRQSVB2aGxtVVhR?=
 =?utf-8?B?SlFKVmVzUlEzODdQTFdmQXZyakx0bmFZL0ozejF2R0xUZHNOWFo4T3FCSUJL?=
 =?utf-8?B?NjlKdm5iNTNiVmliUjgxd3owTi9oUk95c20yYUxscUJVUWNiSzRtcFRsRE5N?=
 =?utf-8?B?WXBJam5JM0U2cWZnZlhGUkk0c0hzeHZhck1IMlBTcFE1aXY1ODNqb3VWZDBn?=
 =?utf-8?B?YUN2aHpJdmJCM1ZhRkJOeHNJQjlYYjVTbjZ4Z3ArUGlYbzVicE1zVkpHRXhm?=
 =?utf-8?B?c3dydS85OEM3Z1AvMDV4Q0JnSVcyMmtkQlJ2VldBNko4dDFYSHpSNTVjQVVV?=
 =?utf-8?B?aUIxdFYzUmdTSmVzRXpxSmZKNE5obDJLdStyZENmK1lxY1B2MlNhbzRnRGpJ?=
 =?utf-8?B?ZlRUSzArRXY0UVptZUc2Wm1JbmVkQXFNQjVodWV1ZDZtaEozdUNZbGpUZERw?=
 =?utf-8?B?WXp4ZFNxTzJ0azdPR2ZzTGRZQXBuZEVxVy81RVJRT0N2SE9lVTR0WGl2VWRB?=
 =?utf-8?B?c0tmMFE2b3VNNHJ6VGtXZ0k1WGVvNkF3NStLdmR4U21iVmh0ODVSR0xtR1FF?=
 =?utf-8?B?cTNpc3JjL1NyN1h6R2FVTllaOTZLZURCNE12TldHWUVnZkZ2ZDdpVGQ3a21r?=
 =?utf-8?B?VWVibm1zZ1R5Ky9FcWtBdnhuaFFQYSt3a0tMQk9tUjFMdkV0emY0Y3E1M2dX?=
 =?utf-8?B?ZElpcFJiZEZrNm1XeVJQRUlZMytGSE1nUUZwWXFqVVlWeWdPdThmN0VUMnRV?=
 =?utf-8?B?N3dIaTFGTmFtb2pWU21qSlR1YnJwNTFqbXdINU5yQ3Mxb2NHbjBHWmZKNTI4?=
 =?utf-8?B?RjRwZENsdTVYRUl2Mktld20vY040WnBId2t6bDZnc0s0emdnTW95cURSN3A5?=
 =?utf-8?Q?U8bJx5XIRFHm+etX2bnqR40tI?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <AE98E354224EDC48B4B1835E138AF6BF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: CY5PR12MB6526.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 080599f3-0080-4b1b-cc8f-08dcb17cee15
X-MS-Exchange-CrossTenant-originalarrivaltime: 31 Jul 2024 16:22:10.8016 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CDUcqz7L9CTw+c46jqZbKpSNoi/BAslTL/7gsDchexIuRr6RFp9/uj7/+mpEn3FbKj5UDg/YKHOg1YhJzEDY8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6081
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

T24gV2VkLCAyMDI0LTA3LTMxIGF0IDE2OjU0ICswMjAwLCBEYW5pbG8gS3J1bW1yaWNoIHdyb3Rl
Og0KPiA+IA0KPiA+IGdzcF9sb2dzLnNodXRkb3duKCZnc3BfbG9ncykgLS0gYXJlIHlvdSBzdXJl
IHlvdSB3YW50IHRoaXM/IMKgVGhpcyBpcyBzb21lDQo+ID4gd2VpcmQgQysrIHdhbm5hLWJlIGNv
ZGUsIElNSE8uIMKgSSBkb24ndCB0aGluayB0aGlzIGlzIGFuIGltcHJvdmVtZW50LiAgSSdkDQo+
ID4gcmF0aGVyIGtlZXAgaXQgYXMtaXMuDQo+IA0KPiBUaGF0J3Mgd2h5IEkgd3JvdGUgIm1heWJl
IGEgYml0IHRvbyBzbmVha3kiLiA6KQ0KPiANCj4gSSB0aGluayB3aGF0IEkgYXNrZWQgZm9yIG9y
aWdpbmFsbHkgaW4gb25lIG9mIHRoZSBsYXN0IHZlcnNpb25zIG9mIHRoaXMgcGF0Y2gNCj4gaXMg
aGF2aW5nIGJvdGgsIHN0cnVjdCBudmlmX2xvZyAoZXhhY3RseSB0aGUgd2F5IHlvdSBoYXZlIGl0
KSBhbmQgYSBzZXBhcmF0ZQ0KPiBzdHJ1Y3QgbnZpZl9sb2dzOg0KPiANCj4gCXN0cnVjdCBudmlm
X2xvZ3Mgew0KPiAJCXN0cnVjdCBsaXN0X2hlYWQgaGVhZDsNCj4gCX07DQo+IA0KPiBUaGVuIHlv
dSB1c2UgdGhpcyBpbiBOVklGX0xPR1NfREVDTEFSRSgpIGFuZCBudmlmX2xvZ19zaHV0ZG93bigp
DQo+IA0KPiAJc3RhdGljIGlubGluZSB2b2lkIG52aWZfbG9nX3NodXRkb3duKHN0cnVjdCBudmlm
X2xvZ3MgKmxvZ3MpDQo+IA0KPiBhbmQgaW4gbm91dmVhdV9kcm1fZXhpdCgpIHlvdSBqdXN0IHBh
c3MgJmdzcF9sb2dzLg0KPiANCj4gCW52aWZfbG9nX3NodXRkb3duKCZnc3BfbG9ncyk7DQo+IA0K
PiBUaGlzIHdheSB0aGluZ3MgYXJlIG1vcmUgdHlwZSBzYWZlLCBpLmUuIG52aWZfbG9nX3NodXRk
b3duKCkgY2FuJ3QgYmUgY2FsbGVkDQo+IHdpdGggYSByYW5kb20gbGlzdF9oZWFkIGFuZCBzdHJ1
Y3QgbnZpZl9sb2c6OnNodXRkb3duIGNhbid0IGJlIGNhbGxlZCB3aXRoIHRoZQ0KPiAiaGVhZCBp
bnN0YW5jZSIgb2Ygc3RydWN0IHN0cnVjdCBudmlmX2xvZy4NCg0KT2ssIEkgdGhpbmsgSSBnb3Qg
aXQgdGhpcyB0aW1lLiAgSSdsbCBwb3N0IGEgdjcgc29vbi4NCg0KPiA+IEhvd2V2ZXIsIEkgdGhp
bmsgaXQgY2FuIGhhcHBlbi4gIGRybV9jb3JlX2luaXQoKSBkb2VzIG5vdCBmYWlsIGlmDQo+ID4g
ZGVidWdmc19jcmVhdGVfZGlyKCkgZmFpbHM6DQo+ID4gDQo+ID4gCWRybV9kZWJ1Z2ZzX3Jvb3Qg
PSBkZWJ1Z2ZzX2NyZWF0ZV9kaXIoImRyaSIsIE5VTEwpOw0KPiA+IA0KPiA+IEl0IGRvZXNuJ3Qg
ZXZlbiBwcmludCBhIHdhcm5pbmcgbWVzc2FnZS4gIEl0IGp1c3Qga2VlcHMgZ29pbmcuICBTbyBJ
IHRoaW5rDQo+ID4gdGhlcmUgc2hvdWxkIGJlIHNvbWUgZXJyb3IgY2hlY2tpbmcgc29tZXdoZXJl
Lg0KPiANCj4gRm9yIERSTSBwcm9iYWJseSBub3QsIHNpbmNlIHRoZSBFUlJfUFRSIGlzIGhvbm9y
ZWQgYnkgb3RoZXIgZGVidWdmcyBmdW5jdGlvbnMNCj4gYXMgZGVzY3JpYmVkIGluIFsxXS4NCg0K
RnJvbSB0aGF0IGNvbW1lbnQ6DQoNCiAqIERyaXZlcnMgc2hvdWxkIGdlbmVyYWxseSB3b3JrIGZp
bmUgZXZlbiBpZiBkZWJ1Z2ZzIGZhaWxzIHRvIGluaXQgYW55d2F5Lg0KDQpTbyB0ZWNobmljYWxs
eSB5b3UgYXJlIGNvcnJlY3QsIHRoYXQgTm91dmVhdSB3aWxsIHN0aWxsICJ3b3JrIiBpZiBkZWJ1
Z2ZzDQpmYWlscyB0byBpbml0LCBidXQgc2luY2UgdGhpcyBjb2RlIGlzIGFsbCBhYm91dCBkZWJ1
Z2ZzLCBhbmQgc2luY2UgSSBkb24ndA0Kd2FudCB0byBibGluZGx5IGFsbG9jYXRlIGJ1ZmZlcnMg
YW5kIGxpbmtlZCBsaXN0cyB0aGF0IHdvbid0IGFjdHVhbGx5IGRvDQphbnl0aGluZywgSSB3b3Vs
ZCBwcmVmZXIgdGhhdCB0aGUgY29kZSBiYWlscyBlYXJseSBpZiB0aGUgaW5mcmFzdHJ1Y3R1cmUg
aXMNCm5vdCB0aGVyZS4NCg0KPiA+IEkgdGVzdGVkIHRoaXMsIGFuZCBpZiBkcm1fY29yZV9pbml0
KCkgZmFpbHMgdG8gY3JlYXRlIHRoZSBkZW50cnksIHRoZW4NCj4gPiByNTM1X2dzcF9yZXRhaW5f
bG9nZ2luZygpIHdpbGwganVzdCBrZWVwIGdvaW5nIHRyeWluZyB0byBjcmVhdGUgZGVidWdmcw0K
PiA+IGVudHJpZXMsIGJlY2F1c2UgYSByb290IG9mIE5VTEwgaXMgYWN0dWFsbHkgdmFsaWQsIGFu
ZCB0aGUgZW50cmllcyBhcmUNCj4gPiBjcmVhdGVkIGluIC9zeXMva2VybmVsL2RlYnVnLzAwMDA6
NjU6MDAuMC8gaW5zdGVhZCBvZg0KPiA+IC9zeXMva2VybmVsL2RlYnVnL2RyaS8wMDAwOjY1OjAw
LjAvDQo+IA0KPiBUaGlzIGlzIGJlY2F1c2UgZGVidWdmc19sb29rdXAoKSBkb2Vzbid0IHJldHVy
biBhbiBFUlJfUFRSLCBidXQgTlVMTC4gSXQnZA0KPiBwcm9iYWJseSBiZXR0ZXIgZ28gYWxvbmcg
d2l0aCB3aGF0IGlzIGRvY3VtZW50ZWQgaW4gWzFdIGlmIGRlYnVnZnNfbG9va3VwKCkNCj4gd291
bGQgcmV0dXJuIEVSUl9QVFIoLUVOT0VOVCkgaWYgbm8gZW50cnkgd2FzIGZvdW5kLg0KPiANCj4g
KFRoaXMgaXMgd2hlcmUgSSB3YXMgaGVhZGluZyB0byBpbiBteSBwcmV2aW91cyByZXBseS4pDQoN
ClNvIEknbSBub3Qgc3VyZSB3aGF0IHlvdSdyZSBhc2tpbmcgbm93LiAgSSBkZWZpbml0ZWx5IHRo
aW5rIHRoYXQgdGhlICJpZg0KKCFyb290KSIgY2hlY2sgaXMgbmVjZXNzYXJ5LCBiZWNhdXNlIHdl
IGRvbid0IHdhbnQgdG8gYWNjaWRlbnRhbGx5IGNyZWF0ZQ0KdGhlc2UgZGVidWdmcyBlbnRyaWVz
IGluIC9zeXMva2VybmVsL2RlYnVnLzAwMDA6NjU6MDAuMC8uDQoNClNvIHRoYXQgbGVhdmVzIHRo
ZSBlcnJvciBjaGVja3MgZm9yIGRlYnVnZnNfY3JlYXRlX2RpcigpIGFuZA0KZGVidWdmc19jcmVh
dGVfYmxvYigpIGluIHI1MzVfZ3NwX2NvcHlfbG9nKCkuICBCb3RoIG9mIHRoZXNlIGZ1bmN0aW9u
cyBjb3VsZA0KZmFpbC4gDQoNCklmIEkgaWdub3JlIHRoZSBlcnJvciBmcm9tIGRlYnVnZnNfY3Jl
YXRlX2RpcigpLCB0aGVuIHRoZSBjb2RlIHdpbGwgYWxsb2NhdGUNCmJ1ZmZlcnMgdGhhdCBhcmUg
bmV2ZXIgdXNlZCwgYW5kIG1ha2UgZmFsc2Ugc3RhdGVtZW50cyBhYm91dCB0aGUgZXhpc3RlbmNl
DQpvZiB0aGVtLg0KDQpTYW1lIHRoaW5nIGlzIHRydWUgd2l0aCBkZWJ1Z2ZzX2NyZWF0ZV9ibG9i
KCkuDQoNCglkaXIgPSBkZWJ1Z2ZzX2NyZWF0ZV9ibG9iKG5hbWUsIDA0NDQsIHBhcmVudCwgZCk7
DQoJaWYgKElTX0VSUihkaXIpKSB7DQoJCWtmcmVlKGQtPmRhdGEpOw0KCQltZW1zZXQoZCwgMCwg
c2l6ZW9mKCpkKSk7DQoJCXJldHVybiBQVFJfRVJSKGRpcik7DQoJfQ0KDQpUaGUgb25lIHRoaW5n
IEkgY291bGQgZG8gaXMgdGhhdCBpcyBpZ25vcmUgZXJyb3JzIGZyb20gcjUzNV9nc3BfY29weV9s
b2coKSwNCmFuZCBqdXN0IGJsaW5kbHkgdHJ5IHRvIGNyZWF0ZSBhbGwgbG9ncyBldmVuIGlmIHNv
bWUgb2YgdGhlbSBmYWlsLiAgSSBjYW4ndA0KaW1hZ2luZSBhIHNpdHVhdGlvbiB3aGVyZSBjcmVh
dGUgdGhlIGxvZ2luaXQgZGVidWdmcyBlbnRyeSBjb3VsZCBmYWlsLCBidXQNCnRoZW4gY3JlYXRp
bmcgbG9naW50ciBzdWNjZWVkcy4NCj4gDQoNCj4gPiBJbiBmYWN0LCBJIHRoaW5rIEkgZm91bmQg
YSBzbWFsbCBidWcgaW4gZHB1dCgpOg0KPiA+IA0KPiA+IHZvaWQgZHB1dChzdHJ1Y3QgZGVudHJ5
ICpkZW50cnkpDQo+ID4gew0KPiA+IAlpZiAoIWRlbnRyeSkNCj4gPiAJCXJldHVybjsNCj4gPiAN
Cj4gPiBUaGlzIHNob3VsZCBwcm9iYWJseSBiZSAiaWYgKElTX0VSUl9PUl9OVUxMKGRlbnRyeSkp
Ii4NCj4gDQo+IFllcywgSSBhZ3JlZSwgZ29vZCBjYXRjaC4NCg0KSSB3aWxsIHN1Ym1pdCBhIHNl
cGFyYXRlIHBhdGNoIGZvciB0aGF0Lg0KDQoNCg==
