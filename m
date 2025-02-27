Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5FD63A47169
	for <lists+nouveau@lfdr.de>; Thu, 27 Feb 2025 02:42:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8341110E0D4;
	Thu, 27 Feb 2025 01:42:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ROzSmEoj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2061.outbound.protection.outlook.com [40.107.244.61])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD7910E0D4
 for <nouveau@lists.freedesktop.org>; Thu, 27 Feb 2025 01:42:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HEDgscMqyi+pRMtY6dj/LUTQjvMiYtapNp3ZUdWFc1KDA+J3zhLUH0HNX1jSHux70wHSRZDub9oVOs546QzNmLwEbqvanOg842hVe12wRxM4UkHadPKRysBp1ORQYmG+/6F+qwXSQXn5qqOu8ZK/Co5q1NPpbrY1le2v556I8XhY1woCLyvNHA9k9U8OxI5kn9DGBWWijOKTc/ht5b1vD3S1szcGlk8e5FK+H8x+p2TxFbF/crG2w0fjC7uutIZNBe+/Cq9UvGUOi9rz7es3/3LQN0G1UNicS4WKzOCMx1f+i775EFhokvFI8f/Cb7weVgTj6zhz4DZoxy0CJCNE8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SE5hEIuIVEMOB0To8cqpBsHd279Gc58gxOBikHIaTVA=;
 b=EajyYcZM/KkMmQP6uUyoxXcjlS8hOSSeNa2PocXNoEXMohT6Zmt5pG2s/YDz7U27BTXdKioYry1SqYnFjCoZi8mR3iov3X/UDZC9Wkl5gj2gxaePfKhEpmQEoyr3whIbqBtXhESZVIzQOW9dUtSDt8cKYDCtE8FcxuXCDc9splWlyVnvITCn4w/meBe+4PVrFmp6a79hM0SwtGrjLDb1FqaGSr1HovIFGHBybFONoaCEAXrh76wwlfaAu/IB7nNotmC4xAL+N6KvAExIMZOcQkVSMmtzX3qCtpsBVZOV8uYPuKX16qdfg4PCstBWLvOumeUiimAyVQafBLTsy2Y9sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SE5hEIuIVEMOB0To8cqpBsHd279Gc58gxOBikHIaTVA=;
 b=ROzSmEojLbIP2XziwUKwaPoj+owX/JJMz5SCCfQepU5SNEhnSTjAUtkfEgNqk3gw/x4YiInFmRE96Ak2nJ67hIlMjM7PfHvt0LDnS0IMGM5Z3raWSqC5n0DMOuvaDxUn0Pjx4RPjwCUI0FhM3pBswtaCi77lAOH++HTqs5GD9WKTiZOqyvq9ScJ/DrSa03g67QHIw8GeszHV/WWHDigJ1vPzBQiMb3jq0vXrBxvjox37+bgHwbN9dlq5M4jY9zI78GJAK8tBJro5Vcbq2M6Wrxuxylvwwq4HcyA0WlAFKFvH0DFh3KnBkjsECB9OfhbA/1y9Pn5CCf++4QzKr1G6gA==
Received: from SA1PR12MB6870.namprd12.prod.outlook.com (2603:10b6:806:25e::22)
 by MW6PR12MB8960.namprd12.prod.outlook.com (2603:10b6:303:23e::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8466.20; Thu, 27 Feb
 2025 01:42:29 +0000
Received: from SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a]) by SA1PR12MB6870.namprd12.prod.outlook.com
 ([fe80::8e11:7d4b:f9ae:911a%5]) with mapi id 15.20.8466.020; Thu, 27 Feb 2025
 01:42:28 +0000
From: Zhi Wang <zhiw@nvidia.com>
To: Lyude Paul <lyude@redhat.com>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>
CC: "airlied@gmail.com" <airlied@gmail.com>, "daniel@ffwll.ch"
 <daniel@ffwll.ch>, "dakr@kernel.org" <dakr@kernel.org>, Ben Skeggs
 <bskeggs@nvidia.com>, Andy Currid <ACurrid@nvidia.com>, Neo Jia
 <cjia@nvidia.com>, Surath Mitra <smitra@nvidia.com>, Ankit Agrawal
 <ankita@nvidia.com>, Aniket Agashe <aniketa@nvidia.com>, Kirti Wankhede
 <kwankhede@nvidia.com>, "Tarun Gupta (SW-GPU)" <targupta@nvidia.com>,
 "zhiwang@kernel.org" <zhiwang@kernel.org>
Subject: Re: [PATCH v2 0/2] NVKM GSP RPC message handling policy
Thread-Topic: [PATCH v2 0/2] NVKM GSP RPC message handling policy
Thread-Index: AQHbh9gy2XzdAxeaDkK11ysKSP7B5LNZ+sMAgABnRAA=
Date: Thu, 27 Feb 2025 01:42:28 +0000
Message-ID: <41dd7102-4600-49a3-bf82-bc8e584544e2@nvidia.com>
References: <20250225225353.12642-1-zhiw@nvidia.com>
 <a18ca0098ed5f49d391377e2483b5cd9d44b65df.camel@redhat.com>
In-Reply-To: <a18ca0098ed5f49d391377e2483b5cd9d44b65df.camel@redhat.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SA1PR12MB6870:EE_|MW6PR12MB8960:EE_
x-ms-office365-filtering-correlation-id: 4c82544d-5333-4fb7-61f4-08dd56cffeba
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700018;
x-microsoft-antispam-message-info: =?utf-8?B?WnpDK2R3cnV4RU5jVXk3alV6ZGJZWUwzeFJJNEw1VklpZGpHMFFaZldLYU5t?=
 =?utf-8?B?VUQyaHpjdERVUXlsK1g5R0FjZi9ZRGExeDRsN1JCSGtJYlNNV01rRGJlRzZv?=
 =?utf-8?B?aFZqTkhMbCthdC9ka08yTy8vWGhPbU5FNm9mcjkxSXp3akFCVFROekxXcnJn?=
 =?utf-8?B?cnk0b1F5Vy9BMU1mRy9zTU4rSU1GNHcvZXFBcEFOaE5XWVVJTWg1emxxbmha?=
 =?utf-8?B?SmpQYTlNbzNuSmdqanozZ3Z0S0NzNnd6VCtqbE14blphRlpZanJMcFNMaTI3?=
 =?utf-8?B?SWUrL21zNXdkQS9VeW9KdENpUmMranIxQkhIbHdYT2s2T0l5RDdVQXllT0kx?=
 =?utf-8?B?M21uYU9oWXF2R0lDd2RDNFoxNHc5UlEvb3VhV252KzBaSzNpdDZUUHZzbmw0?=
 =?utf-8?B?TE51VTBvNk5sVm5HYzhoYWhjemxyVzRSZS9tcFpGQ2czYklMcTdtWUlPTEJF?=
 =?utf-8?B?UkNKS0RGR2Nyc3Nnc0hPT1pXTUFXRUpGU2g0SnlHbzFsdm5SVzRCUjMzQXJB?=
 =?utf-8?B?QmFUUTNNb2JkOEJMd25wTGR2dkJjUVUvV2VjZDQ5L1JZTDVuaGlxRU1CbW10?=
 =?utf-8?B?cm9iYjRCRno4TGFOZlN2S1ZwNEk1ZkVNTC92akhvb2JJZXpibXJYbURkRElv?=
 =?utf-8?B?QnJ3dmhjSVZURVFKamppUGtYRjNoTGRIelpBTlUrUXFVUXhkcklManAyeEhH?=
 =?utf-8?B?aC9PVHlpdEVCckFsTFhoNXpHUGVaYTFEVUNFelhwblNQYlZJVWNRMDYvVXJz?=
 =?utf-8?B?aXpzYXJEcG5uN3FhaDI3dkJRQ2FORVdpV1BWaEp5WDBjRUNPYkxWTkdZTnp1?=
 =?utf-8?B?bzdETlZyejBCcmxhdWN4WmtyQ2duamYyWUlyODFOZHpFSGl2RkkyOW1jcmp0?=
 =?utf-8?B?WHFRemZKZE9UTFJVUzEzVThnQUJobHhrRzM3dWxEclhzMzJDSGl0MEF0OFVO?=
 =?utf-8?B?WFNhMGM4QkVSc0FsUlE5NEF6QTRqT2ZFSm9LcnhhQ1Y5ei9vMDd5UGsyTWda?=
 =?utf-8?B?MEk0V2xYdUJKU2FLTEVNdUd3akM3QmdldmdjTm5UYUgvMEhsV2M4TFBrZWhp?=
 =?utf-8?B?MVRyWGZxUWFGMm5mZC9aYUZZQkJERlFqZHkxQVNlYkYzd1JKZXNzRXlTWUpp?=
 =?utf-8?B?czV3eW9ZZit5dnhLa1lhR1dhbDZCZHZORlRiQWVkWG9VcW9ja1BOWWwyeUR5?=
 =?utf-8?B?OGZjeVFUMmJPSDV0d29jUjBpWWxlemc2T0RUVXJySTRCcnh6aUw2QW5xVysr?=
 =?utf-8?B?dDVwZUV4VU5OS3U1MjJBa1V0R0RSMXJza20vZjNSaklnQjdGRVVONno4a0tB?=
 =?utf-8?B?NG5rdUd6cEkxSThkaWRTSzFQbVNubTVDOU94OHdTZG1MVkRWTDI5aTBrdWtu?=
 =?utf-8?B?Snhia2Y5N0NmWDczdCt1SmUyYnptK1N3M1paMUhWZFNCb3RBZ25Oc1k0TC9V?=
 =?utf-8?B?VkpLVW9OYXhGTXp5SG9qc0RIQkxLcGlYS3d2Vi9vdE4wb1N6ZGRXc2huWTlD?=
 =?utf-8?B?dGQ2c1BtWHpLZ0ROOW1BWHM1RCt5N1FzRVBIcUhUdVVDYmlJd2dSTHBWM3RP?=
 =?utf-8?B?QnY5YkNzQkRmaWova1NKc3oxU1hrM0NkV3hzbnZrVzM3UGhlNFFvS2hSOHBH?=
 =?utf-8?B?OHROMlZ3VDd1OXRhYU95UUZReVFoVFFqWStRRnFIV2o1bzVGU2NkMmNZYU5E?=
 =?utf-8?B?MnIxWllNditwRzlNNmtpeEFKdUYyc3l6allDRkNzcGkvSmx0czRCTnhJUy9Y?=
 =?utf-8?B?bTVobmhkY0JOcW15M1l6YjczVDV4V1lzRzhuOCtLNmxDanE4OCtDWmZMUmt1?=
 =?utf-8?B?REJESkh5TWRNbnZvbmIzMytNSXY1VjZIZ29DSGZrbXI2cW54SklrLzY3M0Ex?=
 =?utf-8?B?RG9nb2RMamg0S2ZzcituQWt1UUJiRFEzRDJ5UWhWVTFrVVV2MGtLYmVBZldK?=
 =?utf-8?Q?rammF6Ogqx8FD9BokIF0Q71pCfLoitWB?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SA1PR12MB6870.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700018); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?STBzaDBnQXk3VXVMbXBkcmxHNkcxOXNCWkwwREZmaXMyaGNrcDRwcGcxZHFM?=
 =?utf-8?B?QjBGMThYMHhBcktYcHJYcFVwNmNhZjB3bTFSQ3RaRCtPcG1nNDdhWjdRbWJY?=
 =?utf-8?B?YU1WQjlHLzJZeFZ3aThYb0J6aEc2ZDJuM292TERIMjhFazdKQWR1M0lKRlY5?=
 =?utf-8?B?SFcyQkxrSWdWL2hRNXZGVlo0c0dpZ3JNWmVtaCs0YkJnakdIa1pXWUNVeTlN?=
 =?utf-8?B?eWo5Zjc1MHFucFFkbmlnK2MrdGFuU3FETHVtSTl1RlFjck8wcHBvbkZva1oz?=
 =?utf-8?B?Y1BlZnFMTFZWeThrT0N4RmtYRXh2bDF1cW5JQlFtNE1ldTNGVkdzSXEySCtO?=
 =?utf-8?B?RTZRWk56QlFYbFRJeVFReGc1QUswTXZTQ2p4K3VRVDl5c1AzZDBFUkpNQmlq?=
 =?utf-8?B?YTlSbk9tZmMrTDhDMWlML0wxYVlCMEE4TzQraFRyZFRnR2Z3ZW5IY1N2Mk1Q?=
 =?utf-8?B?TmtrRmE0cEhybWFvblhUUE9uWnF1Ylc2TVYyWGNlMHBJTEdaSWpyV2RhTHhR?=
 =?utf-8?B?K09Hb3ZGbVhUQjFsTVJLelJoZmdNT2tEZTRDRDVERFU5VWpTejkyN0w0UWVJ?=
 =?utf-8?B?NWVMdmU3ejZmbVR2NVAxN0FMcWVxamo2ZGxVQjI5UVZDTUQzdWM3MWNBMWZz?=
 =?utf-8?B?NkZUZE9xK3N5U0pDT2pWR3pEbG1MbU5QcVJWMzVzdlByOU44Z3YzWXp4NVhE?=
 =?utf-8?B?ZWdDTkVPZDl0Zm5WcHVraEt4WWd4TTJpVUM5NS9lRHZPMzBNVlZLb2lUTVhK?=
 =?utf-8?B?bHdFVDB4b0M4UUFTMURzV1JkTjNVdFR1Tjh2RHBxNzQ0QUt2UFJncFcwSkR6?=
 =?utf-8?B?QVFrTkswazB0TE9RRzJrNnVJSzBQL3BMWFJIRU8wc1JvOTFsTE56T0g5QXU5?=
 =?utf-8?B?b1hpZ2lOeFRiQWVxajYyYmdGU080OUFPQ1QvcTV6TUw2eEhOWUVRTXR1QmlC?=
 =?utf-8?B?LzZ5STh5a0VSamtwS0R4UWxtVk9Mcmd4VVBnSkJyMWkyZDBia1YxNDJYeXVa?=
 =?utf-8?B?S0lTak9NeGJoYis4ekNQNWhqYlpVZk1sclp4QXBzLzNEWmE5aEI5STNOQUt3?=
 =?utf-8?B?dVhtd2pnYTNzT052V3AxUkhxakhXNHBWekhyL1gxeWtlUlV2ZUVGbnNxdjdn?=
 =?utf-8?B?QS9QWCtHMC95K0tKcVlHNEovQVE3bXRBcUFhZ0FPT3g4MWFZMG5vVUZCbldJ?=
 =?utf-8?B?ZFRDNzgzNm5GaGhPWDcvRSs5VE1lTWhKWlh6RWhGRVNQY0hRMFlKOVZnY05Y?=
 =?utf-8?B?U2NpZUhQUWVUUzFrbEMxNDQrWmZLYmRoS2hJcWU1QUNvS0xGYXdPSURudG44?=
 =?utf-8?B?WURkeGxQaVpBVFhUemwrODY2WlJKMTlYT0Q2eFAwV3VzdnN1cUxtWWNlS3J5?=
 =?utf-8?B?czJ0UmhORkpIY3E5WU9TR1lXcGIxbEFFSDRvWHQyRlB5d1R5d2l2aCtlQjFS?=
 =?utf-8?B?VlE4VExSVUM4T3NTTzU1L0xpN1pBVisxMTVhYU04R2pxS2krWG1ZUG1CMlRl?=
 =?utf-8?B?L0Eyck01cXE4clAvK2JmR2xkKzJUcE5SWTBGb1BrZG9jWkFYajJ6elp3bXRx?=
 =?utf-8?B?OHFBZFpJV1kxNnd4VGJKVXBMTXV5OU9TOWd6dExDNElnRE43dEUrYXFaeFJO?=
 =?utf-8?B?MWxqV244UFJUNEltMERyV3NuRERNYnNzYkJ0ZTdGdDdRbGNMK0NEb3I4RStr?=
 =?utf-8?B?UklZQUFLNHBBVHV0ZlBlR0FjYnFuK1UrQUhvbG9MQkhaODVEa3hEbWJwZVNz?=
 =?utf-8?B?eE1QbWh4VGRnK245WUx6N3hMT1pCREpkT1RvR2x6ak1rbndXTmczMEc2U3JL?=
 =?utf-8?B?Wjd6cEJvcEQ0ajVpU2gyQ3BtYUFuN25QZ3NPZkZjTU1MMDZjZXkxZ3FrTjRj?=
 =?utf-8?B?R1dGOGZGbHdEMlhzTUlmSHMzTGk2RWVVVHU0bDh3bFY4Z2lScmlnVnk0cldU?=
 =?utf-8?B?RG5HYXRyV09yY2luRjdERzd2QzNWVytJY25rMkplNTdUbmtlZ0tLdmhITGhY?=
 =?utf-8?B?RWJjOHBNVEU0d1Jua3VVaXRYLy9Xek9CMzFVd3dpK3JlcG9EK3NjV2VDdGVt?=
 =?utf-8?B?VDViczFTcWhrVC8weTFuTmxYOUVlbkRvb3dlYlRjWEx5Ri9DNEM5VmI0ZENW?=
 =?utf-8?Q?IA3M=3D?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <482ADA9E73F19E448A071F107656DFDF@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SA1PR12MB6870.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c82544d-5333-4fb7-61f4-08dd56cffeba
X-MS-Exchange-CrossTenant-originalarrivaltime: 27 Feb 2025 01:42:28.8091 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: XPR7YLTkR4MJfh/00bKwoqryJElYj0irJNOk3OHFLeAkwDdRBTFbdwg0UFJ8TFN4
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8960
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

T24gMjYvMDIvMjAyNSAxMS4zMiwgTHl1ZGUgUGF1bCB3cm90ZToNCj4gRm9yIHRoZSB3aG9sZSBz
ZXJpZXM6DQo+IA0KPiBSZXZpZXdlZC1ieTogTHl1ZGUgUGF1bCA8bHl1ZGVAcmVkaGF0LmNvbT4N
Cj4gDQoNCkhpIEx5dWRlOg0KDQpUaGFua3Mgc28gbXVjaCBmb3IgdGhlIFJCLiBCZW4gZm91bmQg
YSBoaWRkZW4gdXNlLWFmdGVyLWZyZWUgYWZ0ZXIgDQplbmFibGluZyB0aGUgS0ZFTkNFIGluIHYz
LkkgcmUtc3BpbmVkIGl0IHdpdGggYSBtaW5vciBmaXhlcy4gUGxlYXNlIA0KcmV2aWV3LiBTb3Jy
eSBmb3IgdGhhdC4NCg0KWi4NCg0KPiBPbiBUdWUsIDIwMjUtMDItMjUgYXQgMjI6NTMgKzAwMDAs
IFpoaSBXYW5nIHdyb3RlOg0KPj4gSGkgZm9sa3M6DQo+Pg0KPj4gSGVyZSBhcmUgdGhlIHYyIHZl
cnNpb24gb2YgTlZLTSBHU1AgUlBDIG1lc3NhZ2UgaGFuZGxpbmcgcG9saWN5IHdoaWNoDQo+PiBz
b2x2ZXMgdGhlIGlzc3VlIHJlcG9ydGVkIGJ5IEJlbi4gTW9yZSBkZXRhaWxzIGNhbiBiZSBmb3Vu
ZCBpbiB2MSBbMV0uDQo+Pg0KPj4gdjI6DQo+Pg0KPj4gLSBBZGQgRml4ZXM6IHRhZy4gKERhbmls
bykNCj4+IC0gTWVyZ2Ugc29tZSBwYXRjaGVzIGludG8gb25lLiAoRGFuaWxvLCBBbGV4KQ0KPj4g
LSBJbXBsZW1lbnQgdGhlIHBvbGljeSB0eXBlIGFzIGFuIGV4cGxpY2l0IGVudW0gdHlwZSB0byBs
ZXZlcmFnZSB0aGUNCj4+ICAgIGNvbXBpbGVyIGNoZWNrLiAoQWxleCkNCj4+IC0gSW50cm9kdWNl
IHRoZSBOVktNX0dTUF9SUENfTk9XQUlUIGZvciAiY2FsbGVyIGRvbid0IGNhcmUiIHBvbGljeS4N
Cj4+ICAgIChBbGV4KQ0KPj4gLSBJbnRyb2R1Y2UgdGhlIGtlcm5lbCBkb2MgYXQgdGhlIHNhbWUg
dGltZSB3aXRoIHRoZSBjaGFuZ2VzLiAoQWxleCkNCj4+DQo+PiBaaGkgV2FuZyAoMik6DQo+PiAg
ICBkcm0vbm91dmVhdS9udmttOiBmYWN0b3Igb3V0IGN1cnJlbnQgR1NQIFJQQyBjb21tYW5kIHBv
bGljaWVzDQo+PiAgICBkcm0vbm91dmVhdS9udmttOiBpbnRyb2R1Y2UgbmV3IEdTUCByZXBseSBw
b2xpY3kNCj4+ICAgICAgTlZLTV9HU1BfUlBDX1JFUExZX1BPTEwNCj4+DQo+PiAgIERvY3VtZW50
YXRpb24vZ3B1L25vdXZlYXUucnN0ICAgICAgICAgICAgICAgICB8ICAzICsNCj4+ICAgLi4uL2dw
dS9kcm0vbm91dmVhdS9pbmNsdWRlL252a20vc3ViZGV2L2dzcC5oIHwgMzggKysrKysrKy0tDQo+
PiAgIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvYmFyL3I1MzUuYyAgICB8ICAyICst
DQo+PiAgIC4uLi9ncHUvZHJtL25vdXZlYXUvbnZrbS9zdWJkZXYvZ3NwL3I1MzUuYyAgICB8IDc5
ICsrKysrKysrKystLS0tLS0tLS0NCj4+ICAgLi4uL2RybS9ub3V2ZWF1L252a20vc3ViZGV2L2lu
c3RtZW0vcjUzNS5jICAgIHwgIDIgKy0NCj4+ICAgNSBmaWxlcyBjaGFuZ2VkLCA3OSBpbnNlcnRp
b25zKCspLCA0NSBkZWxldGlvbnMoLSkNCj4+DQo+IA0KDQo=
