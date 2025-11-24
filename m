Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 103DEC82DA8
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 00:47:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE5810E277;
	Mon, 24 Nov 2025 23:47:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Qh09dNBA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010012.outbound.protection.outlook.com [52.101.85.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF70910E277;
 Mon, 24 Nov 2025 23:47:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=rcqI3pZ4ls3fet71GiyM1Dul/YK7xbUtF4VdTierA4roKyDAzAOvnX8SZTUh/M5MIEVCS8Wod8Ru1XfZbCV7KVGQFzKRI4aLzwUHvYXf/wrxZ5rBry04sNaIXMhwzaNKZxHmf06gRe5bwn2xw1fDpAR6lu0oFZJsvdnR1wjpxGwOZc5eSOYT/1H56TV4sFZmr9c7rqgQxV+umO7pcC3AN2C2tCcrpKGlBjEJfUjB18PxrfZhwDVJwaHp3FmWfMx3ZWfAFQ652mjpeeHFXclLahBBZTe7Llp88vOhO2OFL2+zgchvOx5ew439w2Syu8lAUDUzGjGI3P+HXRO+5zkHIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=a4XEGzck2pYvmfu9blMf8D/Cqlpu2jhHpFjcAtHkCiE=;
 b=FmfLyo+/SqC20uvm9FtAag0Ki9I8WTX1dSRVJKE78BHbCSsdjFncNqRISGqhapM42gR9auE54bBBA6mGX5BuRbHxt7ch0YsLRMetL5rMSSXAAe2GyszFQgIy1sloTD6rLvv3RpHEs1Lk41j8W1mbx5Z6JlhH3eLhGdlXWfBi9IDESTzvHhXVTkGno0ES4MoU0wSe05DlmoN9N1RK1XVmd1EpFPq/6nScUCJyThm92iIuVmofEE5rR7VvjCY2afRtsGtgX94ZPm83RY6JOpZq5TROgUfPn6xWDiCst3KwVVUo83w+FLgaF0zgUJc1bFUxdYqjI0scDFzLAor6U6R33w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=a4XEGzck2pYvmfu9blMf8D/Cqlpu2jhHpFjcAtHkCiE=;
 b=Qh09dNBA61ce832P5ijdhL2EEDDLGOiObcJCJlazhOxhHCi0bpZaI6yS7x1U+/9n0Phh/lYuaHk3IYWHyVQ5WsWrMtYQ1tHUvbl5Xvfd1ugU6Vm8aYqxJoC1n79YWBk8AIkQxyIq44UcZekVH0MzQfOqk0VxnVRfXk0bWF4753fTJXEX10AMMVrXnVAsHUH4yLNUSY6MHJ3sAXKO/hkl3/2nAk7p5fU5mAABZJpNJQth8+kBordkXHei4VolNnZRY+RIXhbiWvv3otARRn3Lf3McS/pO4nNGupzXIjac20RxFoID0BjlR9K9wVEbuf2bQrVjh14cWO457f7TlSqPZA==
Received: from PH7PR12MB7937.namprd12.prod.outlook.com (2603:10b6:510:270::21)
 by IA1PR12MB9465.namprd12.prod.outlook.com (2603:10b6:208:593::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:47:07 +0000
Received: from PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6]) by PH7PR12MB7937.namprd12.prod.outlook.com
 ([fe80::805e:c531:4f9b:57f6%4]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:47:07 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcVb7G2n7lcTwiZ0ixsrXV3K+7w7T5U1aAgAAocQCAAB4wgIAA25SAgAgYPwA=
Date: Mon, 24 Nov 2025 23:47:07 +0000
Message-ID: <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
 <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
In-Reply-To: <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH7PR12MB7937:EE_|IA1PR12MB9465:EE_
x-ms-office365-filtering-correlation-id: 128757d7-60be-4f77-0d92-08de2bb3c723
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?NVlvS1o5cWZ4YU5NZDRFSTlXY0M4Q1M3NFV1dlhLdWFlSDdsZ1NFeC9YaW5Y?=
 =?utf-8?B?L1d5MSt4WUFrakx4SkVzRjUzZDJ1c0RmM2hkSE9XSlFSWDBpWlFRNTNBZnJq?=
 =?utf-8?B?bEZhTTJsaFZBS1ZFcUYvekZrUHE0V1FOWGxua2svSmg0UVJEMkJOVWZlTUxW?=
 =?utf-8?B?bFArdWpvNjdIdVNDajc0L3V0RWh4TkpsT1lWWEJaUkRwcURrMjFWTlUvNS80?=
 =?utf-8?B?eGIxTkNmU1lOV0EvQVNlcUFPUTh1T242U0ZFR20veTZnU250bllrNDRteDRT?=
 =?utf-8?B?THpoOG5tdUFFQTh5V1JQeUw2Z2dtYk1RSXllVGhGTjhJZmFOQWRNa1dKTzk4?=
 =?utf-8?B?dHp2VXhMWUtVUVMrU0xjVXpaNXpSRlNmTkFUTWxjZ0RCWm9rK3BhN1JmVkRy?=
 =?utf-8?B?S2lPTmgyaEtSaUxkOW9TZEFiemdncUcvM0sxNC9FaW1vTDI4Tkp0WkZxd2xm?=
 =?utf-8?B?ZUZ5SjZDdlpWOVpaR25NSjUreEk3NGtxZ0l0STlCVTBHNzk2R1dTeXhGc1BE?=
 =?utf-8?B?TTVHNDBhYUdVa2pJTmdXdmlRcFF5VHpqVGFwZEFudmNQWUZDNDI3aFVEMExG?=
 =?utf-8?B?ZUhqVUUwSmNlVGY5d0lvNHZRUkkwVXBDanNlWG5hcTZLODJuY0lpQllaaE5z?=
 =?utf-8?B?cDY3ZEI4dFdYMERLSFBSKzlkR3JwbFFjYk95dlpnd2VkRzdpa2hXME1OMmF0?=
 =?utf-8?B?QUtiSUhEckk0UzFvUWl0VUJBYXpyMUtpZlE5bTZjVElmRDZobXlvUGs1Tlo2?=
 =?utf-8?B?N1hrazdiWG1sbGdyZGQ1M3FWazZ6NGFyT0NHb0JoUTN0RHdRL0VHam1tR0tH?=
 =?utf-8?B?VmNRY0lSNzFDbUR6bVE1LzhSRTlVR0d5bDB0RStOaUdQaUh2Vmh2MThlYWJJ?=
 =?utf-8?B?NnIrYVF1U3RFSXZsdTZsL0luRDZ5TVZUUGgyWDFMTVRXdk5MV0pIaUFzdHJL?=
 =?utf-8?B?QXIzajVXNVI4Y1NVQ1NPRkw5QjF2MUlHRGFyS0ZNVXRnOC9KTFB2UEJTbWpO?=
 =?utf-8?B?ZC9nS2pwVnJCT1g0L2k1bk1xZ0s2dDFuWWt4Nmd5Ti9yQmlYODRRYW1wZW0v?=
 =?utf-8?B?MVc3UHl2WmF1MUxBbGF4WjNJK2t4STIzc0IxTFhtc1h1SC95WC9XZnhnalhn?=
 =?utf-8?B?RmVuY2VnMm9qdTdLdUJ6S01ISWM2MWVpdHFBRHRJTkdmdEdQRmJxTkpScVJR?=
 =?utf-8?B?ZGFYRVBpcjJaTENCbi9KZjVQZDVFQnVIcVpNMWNuRy9rMForZCtEWElkeXJ6?=
 =?utf-8?B?RXJkbzdpUmRONjYxRkVZalhPQ2UxaWtPZWhuMC9QNUIzN1B0VmlIcm1LNFlN?=
 =?utf-8?B?RXc4c3MwMDZ4Y3dod1pnaHZpQzkzOHlHdDAvRklTSm1TdEswdk1HM2FXTWwx?=
 =?utf-8?B?Nk1kRHVRTlRJY05pTjVhcGxpZG01ZTArTmJmRU4zN2sxZ2FNZnF5a3l4ZHlv?=
 =?utf-8?B?VkNpTzkzR1d0UWlnQmkxcW9idDZtNG1hcnIyR0FxdnpOcGIxWUF4UmZTSmJr?=
 =?utf-8?B?YVhRL3FsV0JaNzJYam9HbElZZkdRNDM3RDA1UDBCMUx5VTVjdFFXS0lxSTZI?=
 =?utf-8?B?c3hQNmNYbnBXY1N5ZTE5RGlUaVZWT3NPeHQ0SGdDbGxvZ2hTRGtXVTltODBR?=
 =?utf-8?B?UU1ycVBGUVQrN0p3RVJqZTJxWE1EWnBkQ2FFR1h2NTBnQmVqamk3K1IyUkdL?=
 =?utf-8?B?NHQ3akx4SmsxcUZYcEdkN2xFUzhVcS94ZktiVTIxVmJPcGtzWjA4c3R6Slor?=
 =?utf-8?B?VEl2RW5XeXU3UzA5dEE3RFROOU5ud05DRmJxZ0tlMTJoTU5Oak1PVUJFQXBJ?=
 =?utf-8?B?WEdwc2hWSGlHelV2c3hUT0krckVvM3ZQcDVrdkpmdENzVjVjdjZsQnRkWUht?=
 =?utf-8?B?VzFnUHJ3ekRxSmhzS1A2eHI4SnFiS1VERlBJS3BIbk5YWWhXVTNONmEvRjV1?=
 =?utf-8?B?cmh0V1RVVnhwL1BVbndSQ2prSEM5STNRSFZVRUYwTHFhUC9jSGtUeXpuSXRn?=
 =?utf-8?B?Q3g3K2RjUjBWWk12TVppcFA1UFRYSmxQTkFXSEc3Nm5MdHdqcXF5ZmlyaEdy?=
 =?utf-8?Q?wH3cIq?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH7PR12MB7937.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cHJVOFhFMnhQKy9XdllkN0dKT0dwKzUzTlY3SEVsL1VEWm11aWdZTFlwaHFF?=
 =?utf-8?B?RWFuelZFdWtoa08zdkNwL3dDZmY1Y3dZbk9lWkF1Zlp6dC9KSjljZm9BMkRD?=
 =?utf-8?B?N1oxUEh5Uzlhd29BaDRWcXVPN05lQVlWT1crdERleGpUazVVb2lmRjNSSnBH?=
 =?utf-8?B?VFR1RmJudVdWdWphcnYvNldKcGJIK1VVVW9EK05iOG1GeUs1SC9oVkJtdWJs?=
 =?utf-8?B?Q3lndUp1alNkeE5SRi9jbGlIZEZGTXc5MlZiNVFTUHg3YjgzaWgwdk0xYjZG?=
 =?utf-8?B?bW1FUzc5L3ZzaDNuM1FFWXJOVW1POUtkR29nZlRGSVBDcTQybEV3UVpVc0lo?=
 =?utf-8?B?d2RScWRjZ0hwR3VQTEVET0RibUdoZ2JpR3JhS0Z6M3ArLzVhTmgvOEZrYWdM?=
 =?utf-8?B?UTV2UThvZnhJcUV1bzZ6S0xSQUV2akJlbkFQNGt0TlZTM0RYMlJEWUxBSUFG?=
 =?utf-8?B?UGZNckhNQXpXenpRV1RsWGZyalZpU01TSGFKVStwcE1GR2RjSnZSblBDL1Fx?=
 =?utf-8?B?MVNCR1RhdGg5YkxyeE0yTTZZZ3RrbFAwZXQ1QWVack5oaEhNNnpDUFFFUlY4?=
 =?utf-8?B?Y2gxQWdrdkRKWU1YcDFvSHJ5L0NYVjZ2RXBJUWxYcTNBcGEvbk5TbXFVVFpz?=
 =?utf-8?B?dWpTaDJMWDY3aEppU0M0ZFFjNmVFVFZtSW5JQ0czTVFGVWZVYStaMldBSC9E?=
 =?utf-8?B?SnltUllDaktJSXdqSTUzc0t4Q1FiTTRvK3NGL1JkVzJJZTVRWkhVbFlaSVJJ?=
 =?utf-8?B?YjJUSGtUeVh6RjZjQXhGY2ZOZE9NbGhMTTdTT0dCaC9GOGNlVTY0UmcybXVR?=
 =?utf-8?B?REVKcHgycmRQRWloNDZQV1g1clVQR0luUHlIZXpkTHNxRU5jb0E4TCtQUHdj?=
 =?utf-8?B?MHA2ZFVOaEJHWEV5K3dNcndZYlFZRVhrU1VDRXZGVDRKcGRRcHFQYmx0OVc5?=
 =?utf-8?B?eFFNL0NpaHZIcityaXFtQnEzTmU5WCtLOXZmUkg2Tk84b2lrd3EyVmVnSzQ4?=
 =?utf-8?B?TGNoVHorekRpb2lGR2dSbzlabDZKc3VPbmdJencreHlYWEdoay9YS0JMSXFs?=
 =?utf-8?B?dWF4SXc0R3Zzc3g2eTdTRVltRXNXbGQ5Q2R6WHFGaXJGZnpCbXkrdTdwLzhI?=
 =?utf-8?B?cDZxbXR5c3Y4SWJFV05Qa1cxWndoY3Mza1Y1VmRaN1hrOFNRdEprQy9ia2ta?=
 =?utf-8?B?SFhvTURBOS92bnYvMlNUU25uNFJSWHgyOFZmWldkTjNrRzRqZVBtWUp4MzF6?=
 =?utf-8?B?OUs0Qlp0TzlGMnZXdUUrNUpuNW85MmEvTEptRTdDMmJhWXVxSlRQUjAvTWYy?=
 =?utf-8?B?Ry9uNitHVmhiY1BIZVR5cmpGYlhiQlRLVjFPUnNMUWtPOVJUWEx1ZnUwbU5Z?=
 =?utf-8?B?dHFUN2Q4Qkx5dnZFejZ1Y2VPOCtUWXdHbW55VVpGaGViN09Bd1AwK08yNGUr?=
 =?utf-8?B?dXc4dk9jVHBEQmNrRXdOdkN2Si9JVWYrMWhmbm9oSUdVWm14cGk5STM5d05h?=
 =?utf-8?B?K1pZb2dPbXhmYUkzNklQZ1JoVGd0RFJqTHJBTHZXcFhKdUJVcStjZXRuNVdy?=
 =?utf-8?B?T2JQbDhWOEUxNUpCYmdXSkNTYy9sNzJBc2lIb2c1VHFaNWNSNXpMS2RXSSs1?=
 =?utf-8?B?UFlLN29wOWxVck0weGgrVDloMUdHYWxIcTZaVzM0NzlOOUZuOVNnZW5jWHd4?=
 =?utf-8?B?dDAzcHkzS3VmdkM1TTBVRk01OGQrWE90TjNhU0o4dVVxTWZVSXNMenhMb1NN?=
 =?utf-8?B?S1c2cWN0czlzQ3JPdmQ0cnRjcHBUa2lQQmpQTGY4WThTYk9XRFZUNjVwVzI4?=
 =?utf-8?B?NWtEc1ZUZisyOFg3a1cyb3drOHVQeDNhNW10NnMvZmM1ZkZMRlQyVmZtU1p3?=
 =?utf-8?B?VXA0bW80TU1hWWxINFBHcGJXZnpoMFFLcko1QVY1M2FUMW9tRjROWW5oNXVB?=
 =?utf-8?B?QVVrOE5sLzBYNjBYSHZGYXNTdGQwZmpUV1dad1Z1WEQ5dXZKcWdUeDB1c3pC?=
 =?utf-8?B?azBrUXBpVFJvdk1vYXRONGM0SGgzZnN0Z1A1Y2hnQ0NSSklKVjhLK0N6OHpY?=
 =?utf-8?B?SGgxWEN2TXNnMTBqZXdOMVYzczYva29ZUDEzTFFHaVdZZ0ttbTJwT0Zhdmta?=
 =?utf-8?Q?JuSxRCDeyN0uyKK0quzwUaSvA?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <A028E769949D944FAC6A09D8A49BC41B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH7PR12MB7937.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 128757d7-60be-4f77-0d92-08de2bb3c723
X-MS-Exchange-CrossTenant-originalarrivaltime: 24 Nov 2025 23:47:07.2931 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: g26FEa2imgDxmLpTkeJede5g9FgFg77R3k8av5IfD85CHMzP3YU8cHmNhLftKwP3DZfhBokaHDiok+5yi6LqXQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB9465
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDE1OjEwIC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToK
PiDCoMKgwqDCoMKgwqDCoMKgIHNlYzJfZmFsY29uLnJlc2V0KGJhcik/Owo+IC3CoMKgwqDCoMKg
wqDCoCBpZiBjaGlwc2V0ID4gQ2hpcHNldDo6R0ExMDAgewo+ICvCoMKgwqDCoMKgwqDCoCBpZiBi
b290ZXJfbG9hZGVyLmZsYWdzKCkgPT0gQm9vdGVyRmxhZ3M6OlNlY3VyZSB7Cj4gwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgIHNlYzJfZmFsY29uLmRtYV9sb2FkKGJhciwgJmJvb3Rlcl9sb2FkZXIp
PzsKPiDCoMKgwqDCoMKgwqDCoMKgIH0gZWxzZSB7Cj4gwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKg
IHNlYzJfZmFsY29uLnBpb19sb2FkKGJhciwgJmJvb3Rlcl9sb2FkZXIsIE5vbmUpPzsKClRoZSBw
cm9ibGVtIHdpdGggdGhpcyBpcyB0aGF0IGl0IGNvbmZsYXRlcyAoTm9uLSlTZWN1cmUgSU1FTSB3
aXRoIHVzaW5nIFBJTy9ETUEuICBJIGhhdmVuJ3QgbG9va2VkCmF0IEdBMTAwIHlldCwgYnV0IGl0
J3MganVzdCBjb2luY2lkZW5jZSB0aGF0IHBsYXRmb3JtcyB0aGF0IGhhdmUgTm9uLVNlY3VyZSBJ
TUVNIHNlY3Rpb25zIGFsc28gZG9uJ3QKaGF2ZSAoZnVuY3Rpb25pbmcpIERNQSBoYXJkd2FyZS4K
Cg==
