Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8B71C82F85
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 02:03:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 00D5910E332;
	Tue, 25 Nov 2025 01:02:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="p/OdQUq/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010060.outbound.protection.outlook.com [52.101.201.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14BC810E332;
 Tue, 25 Nov 2025 01:02:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G3ELbw8A0pePoUWDbT59Lp6YERxlx4OfSBHc/NKfXJ/cFfCOVuxMzvHH3SBHXxjLJERDT/gONIKMiihlBXgCt5qGDMdVHPbym5VbcqyYEP3M4y2lmNLZ+WgrlTzoAOdM9ZKU6aJfS6BcOi6BaBdbex6khqHeaBMbvXYkLNyBOFv7A+6bXtiks4lSosZKcUhDPsTTkfZT5R6sufCCelIm1uSTETTDJQXMF1fioDXhO8BIA6iJiHnF7XCiPnV4mzom9scIeFmkKHPY1uUor+Lx+6Y9sxgxSMNsGnKv3S/mHdFvsANroZGUEczsHKCQBFPjWo5iWO0iyDoHu0l1jBDmWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=pGCPbSIre9tF4wgFUYHZ42fNKZTPAAryy94PGvhZcsQ=;
 b=Y3VFswt4YtSzAXyZmKQrc6sbGxoF0TkTViCE/sn2c9L3BKTS9qDOOoh9uybO2bFccLB1UydW1Ak+WoEUeZdsa/gxVPcpFGD83lz0obXN9dD5C/d7SRt782ocDl0e1bgI5IdM5wFeANXCPa27A4DMawesGbiu2r1WrrEsdNcx9NjYrVo11GkSb4sI6IjUrGRlMUV6bVzwKaBTlKpnt/9Mzk4x9u8MogfvqDrFm9gnoKAkXBvpTswzTkXojOy/D1lk6UsR44DcNITxVSUUJfm99uYh6d+iP8zw5h9O2mxXr5gzLrGjeK8Lkkv3LzKWJ1qSo4bX+fbDC8K4EtWE7ENZ9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=pGCPbSIre9tF4wgFUYHZ42fNKZTPAAryy94PGvhZcsQ=;
 b=p/OdQUq/DJ1eTftqUr3P5o6ABl8hc5hxT+KZD8Hcyo4s3qkvxg3HI5f9XBuFFCzBabFxdcrJJibK/wwuOdAFDj/Hl2wNHV9hX8PT5tNmeLIhSLg9WbzLlarZYqB8B15+2zuHsvQI0SY6ClA++Eq1W8QhkSWCDpGUTlLP2gSJNoaEfqyGNtm/Iey1ayEwXOqtqD58YXVCTwCvwwTMAj9H8+ZQ1lBxJAUuGHy/TWKCHJTm9I3N50uAcx/S2uS9el403LSMmTyH4/Lm6ATLuqAcBC4ztqp5GGLMXMEy8GoH1wmVWal0Ln79g6PPdRbGKpKiCeXK+o/lkXnKqKAVzkwa9w==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MW4PR12MB7120.namprd12.prod.outlook.com (2603:10b6:303:222::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 25 Nov
 2025 01:02:30 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.016; Tue, 25 Nov 2025
 01:02:29 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcVb7G2n7lcTwiZ0ixsrXV3K+7w7T5U1aAgAAocQCAAB4wgIAA25SAgAgYPwCAAAJ5gIAAESeAgAABbYA=
Date: Tue, 25 Nov 2025 01:02:29 +0000
Message-ID: <02641bc01fd806509221782bec1550e0ae6eacbe.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
 <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
 <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
 <569b40c6-c234-437e-a894-fd3dbe9669a7@nvidia.com>
 <DEHD8O2SS763.2YWSUIA9JICGN@nvidia.com>
In-Reply-To: <DEHD8O2SS763.2YWSUIA9JICGN@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MW4PR12MB7120:EE_
x-ms-office365-filtering-correlation-id: 12ac7a9d-1f79-4154-d604-08de2bbe4ec2
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?WjlBbjZ4bTVaNHhtVHRmWVY0c2t4akJCTytqbWRSZ2J4NmljYmFuTXBMYXBW?=
 =?utf-8?B?SmQyMTJCd0RENDNLLzZMRXFWZkVvaGV3cEdqS0QzL3ByNjA3MmdDNUFvTjIr?=
 =?utf-8?B?VTdrQUpxRDYxK3p4N0hic29uQXk0V0gySTJ6L09ZV24xK2tEZGNHVlp1T1Qy?=
 =?utf-8?B?SVBOWVptZkRpSGNQTTZoa2R2M1BIa1lWQ3NKbGlFdWRaQ1h0dXF4d2FJbTUw?=
 =?utf-8?B?RW5kS01jTTdBRzVDaEgyTjJFRzVjd3FpSXp5NDgzb3RWRTNCcGxkcmF0ZGd5?=
 =?utf-8?B?M2hPQUU1MlRVeTFwVmlzeUM4K24yUE1TdGhoajFvS1BnL2lsc1RSS1NSdTJR?=
 =?utf-8?B?U3FzcWhQWncxV0JpNVRpdU9CRlBxM2I1ajNZS2lCalM3UjJQQUNpeE5sM2RH?=
 =?utf-8?B?aTlDcU4yYXR4aWpKL3JIQktlcld1bHpyN3FwL2kxMkk1YTV4NGxHcTJvV2Fk?=
 =?utf-8?B?TWxKTC9wR0RodkYwL0wyTStqZVNKb2xkYW12bldFeVliZmRtQnlWeVFMOHBt?=
 =?utf-8?B?amJBd0lRLzkrM0Z4VDhQVXRQc2RJU3dNMUpjUk5OaHozRGJhNlgwMzNvU0Z5?=
 =?utf-8?B?dndtazl1enptMTZZdGxKenJoU25iZlJZM3lTTHdvdlZ3bE5WSkFhdkFrbDR5?=
 =?utf-8?B?ZXN5TUFzRHZLZDRIZFhreFFXQTBuWi9JTGoyM3E5akZ2NXE0dW1CR3V4RzE4?=
 =?utf-8?B?bzdwRFhyNndsTDU4N2NWMHZmUkltcTR4ZmdtVTRJQ3hWczVZK2c1OXlJL25G?=
 =?utf-8?B?eFh3Rlo1alBhMXcwK2IrZmlZOHRCbGltUldmaG1FbEtYckw1aFN4SHNWUFJz?=
 =?utf-8?B?WVlmQWFvRTI2OWh3WFRIZGs5YWltRnBiU1A5OU45NHloZ1pIY21paHZnUy9G?=
 =?utf-8?B?elJTS1paWEhEWTI1ck5sdW43dGFCQUlsOHJ3bDBPZ0gyWlhRcXZZM014QjUv?=
 =?utf-8?B?YzZDNzVYSFdtMmFsWW9uQktqNElkV0dTYkprYkJmbnhFcGt1T3NuZ28yeUlY?=
 =?utf-8?B?SHpvR1dUSVRHZGhjcEV5c0NiNHQwMElVQnhwTk5uT3JycndUYWxNL0ZBbTMr?=
 =?utf-8?B?V2wzbytZODUzS2Nyd2ZRcDJFLzhySjZVRkY3S1MvMVZiSUd3YlFINFlvNGhQ?=
 =?utf-8?B?V1NFZklVR3QvUUFMY09ZSjVLY01USW5QdUN3RTNhMThXTEsya0dyb21tYmRI?=
 =?utf-8?B?VnZjaFgyR0tYZWpZUVZoUDkwSGQ2aytWQ3U1SmdXYWR1SlFVNW5MUkFBcXpj?=
 =?utf-8?B?S0tjZ3pMZ0lZQW80M01SbzFmU1VIazRBQ2RET2wzL01Ec0s5YTZpTk94elRV?=
 =?utf-8?B?a2JaTHI5MzV3TjlId1N5eWJjS2dIcTB2Tm5Nb2d5ZXM2Zlh2eVhMaGNUT2Jq?=
 =?utf-8?B?RGkxSFVBbGdpM2R2YStudm9nMHRYWTlEVXBVM0o2bUlodHdRMmJCUjU2Uk50?=
 =?utf-8?B?dE9JbFJFdVN0VThCNzVZRzNxeVplaHZveGZoTHRmZW94QlVsU0dsN2VOeGVU?=
 =?utf-8?B?WDdXM1VoMHpQdDUvazhRZGNHVUZGaVFLdjcvTTBCb2tXVXNaenU0YzFiQmds?=
 =?utf-8?B?NGxHTE5CdHgxbE00VmFiek53Nk1NYWcvaVhrdkxNZ3lLSHNVZ3l1d0p0QmRt?=
 =?utf-8?B?R1cwTnZBNUc3VjBzRHdNc1d1TDQyMjBzU1d4SmFDRGlCeVFLd1NrY3p3MHpM?=
 =?utf-8?B?VUlBN3NFM3lnSmlEZ0hoOGhRWlNzWjU5amhhdFhCTXVFNC9jd0ZKS016ZjZt?=
 =?utf-8?B?NUQ1dW91R3c3ZE9ieVdkSC8wVm5uNFlVd1NHL2tGNE9SR2tjT05EZEJ5SzQy?=
 =?utf-8?B?VUQ0Y0NmVmIwelVzOTNxcDRsT20xQ0RxZmxBUWxnQXd0MHpkcnJzcjdQNUo2?=
 =?utf-8?B?SUR4Z0EwbUxkVGJPei9sRHFpWTBwWDhXQ0Y1cnU3WnVQMXhITkFFYkVYdmtL?=
 =?utf-8?B?WURxOWZRWlFOSjZrVGsySWh5cUI1WFovWk5veFFXYVl4QTRZNklHVTdxWUtv?=
 =?utf-8?B?QS9oSk1YTGloZ1cwVmsrdW1GS0JJM1lpM2g2L2Mrc1BhZG4ycm1ERUkzcVpT?=
 =?utf-8?Q?/sSi82?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?WWIwaFd0SzhYRFlUb2ptRDBNR2JXVGlFanlWc3JMSWhDMEk1bGVQWnJUcUY2?=
 =?utf-8?B?SWVPRHBXT0UxODkvWi9VYU1YeWdpR2tRU1NYMGxxd3ZyUVNSWjVPOXhDNE9m?=
 =?utf-8?B?VVBlQlZzUElNRUJxRlRObGRmUmR3dGQ4ZUIyRDlPK01sT05UWTUyUm1pRUZQ?=
 =?utf-8?B?a0NYZkNtdkhsUHNMby8xQnFIVjZzZ2NSWjNaSUUycTY0TkRQclVhbXB1L09y?=
 =?utf-8?B?TzVqem9pdG1Mb2JqNEsxcXdYQ2JwcDRET2YzUDVoR3FxaCswMC80WXkvVVpY?=
 =?utf-8?B?c3FtR0lJeXN2RTR0eUZ0dVpYV0dNS1RDVWNkREVzU0lBbEVZdURlazlCTmxS?=
 =?utf-8?B?cWdKcmMvcWN3SmdvRWM3K3llVmJ0YU1iVGNoSHJsMFVHbkU3ejgrdWRFYUtZ?=
 =?utf-8?B?WWJ0NVhHU2ExeVVjRUY4TGI2QVo2emR1ZzZLOHl5NnJzblpBNDRXaWxIT3BW?=
 =?utf-8?B?YXBkZHJkVkcwQ1dLWklXVHZsaUFxRXNDWlhCRlBxT2ZqODRLZUQ1ZSs5TTRS?=
 =?utf-8?B?Z1NlbGI2UmJ2RWJTbC9JQitWa3hDOE5ZMGlrN3Y5YUU4Vk0reGtGNkxOYXQ2?=
 =?utf-8?B?SXVGUVdUWE95UnpNcXFOSW5sbHNnR3Avblp5cWFIT2YyOVRvK3lZWmNtWDIv?=
 =?utf-8?B?eU03bjBnT2hjTnpXcHhRR3NhbG03ZGJnSE5DQXJiYTQzSUl4SUdpb25PU0No?=
 =?utf-8?B?aVYzMGd4THVmWmhTbmdJSkxhbzc5dmViYm5GOWZLSHBNaGx6SERjbUdjeUtN?=
 =?utf-8?B?enhRcXZSaGFPS2lBd0ZqMm9BR2xUTUJKZFJlYUxVUWkvYVBFYnpoOStKRWRm?=
 =?utf-8?B?MlIrNjFyL0hLUGI3bUcxR1I4S2NPNTQwODJ2STc1TUJoNmRudzFUanNsUXkv?=
 =?utf-8?B?aVBrOXZqZWMvejlaSlJ2b0lDN2VUZlRNY285emhqbXI2S04zMmZSK3BzL0pP?=
 =?utf-8?B?YTVtZVgwWHM1M1FHZG5wcURLSFJWQmJ1MU5XcVYxKzhaNm9zSU5ib2U0dDV4?=
 =?utf-8?B?N1pqQjlPQlp3dnlmTjQ4TDhaY3lybW9LZ2FpL0FZcS9IYmh0dHpPaDFFZGt1?=
 =?utf-8?B?eGpWcm0wbXV5alJNWUZtOGlKWm1MVVBvWE5lU1BVU2NhTUJkMitURnJiV0sv?=
 =?utf-8?B?cEpDcjlFRDZDZFFwR1lGb0NRM3NiZ0FUSG5pNXRHWlBZWCtQdWVvbHk5OXBi?=
 =?utf-8?B?Z1RMbURXL3ppems5Nkk2NnQvWWFjWWx6VjNTLzJxS1pTRlRXNTdnU0dDUEt2?=
 =?utf-8?B?dDdwbkJHclZJTGNoTHk3cnFReFNXU2hVRVZ2M3JibWVJUzFTc1lUaE9lN01h?=
 =?utf-8?B?YU1nbEZ2UmQvNXk4b2ZUR3FTTUJlM2lJN3JFZzRtNDNldCtZMERpcnRkT2JK?=
 =?utf-8?B?dHFCNmtGVEg5a1d6bEk0RHJvZnpaeEFnejVWcTByVFJHOHJrQkpZNTZ3OERW?=
 =?utf-8?B?YW9tODZoeUo0TDQ1MU1yNnllM2VXTUNnOFM1VmVxaU9BS0hsQUd2bzNrUHNP?=
 =?utf-8?B?M1Qxa3QwWmNuMEV4N3NkcUFGRXY4Y3N0ZzBlblNuam41clZRdFpHZTNMTnZW?=
 =?utf-8?B?OWozUTlncG9KWlA2dUdYS3E1NDhTcDRwbU11WTd2c29ZSWJjQTNWcWlJTjFY?=
 =?utf-8?B?cm5wOEs5OGp4aisvY1VkUlFBcWhsUC9tdVJLZUxuSXB3cXVsdnQvUEM5WHRO?=
 =?utf-8?B?ZWtqeW5ScGVhaC9SeVRKRFB2dUxsL3JSZnBweit3ME5vWWRVNG4wTUM2MCtN?=
 =?utf-8?B?cDg1L3hVN0VSd3phSE5DNXRxVEowTlcvNUZSOCsydDRLbTNLSjFadlZ4dUdX?=
 =?utf-8?B?ZjdxeVRXK051dkNUMUppS3hjc1BzWkFqcG5ZVG1vVVJreTRvUzhiTG96dEkz?=
 =?utf-8?B?bWdBWmdoSFUzSVdZN21KTWp1WWN2QUM2K3VPSjBSU2dJZkRiTUZNaXpUSmlq?=
 =?utf-8?B?YXA0QmduL3VpRGpabU1QTUxmOGdIRkdyY011ckM3dEZKakJUaytuck9lV2Va?=
 =?utf-8?B?azhDNjVpWktYSmRJYzdBb1VEUVhGUnhtdHJTRFlvRnNZb0YwUHVkMFptUmNs?=
 =?utf-8?B?bEljUlp6TkpYRVQzNEtEQjFGRFZzckdFR3NMV3M1bzNrSmFPTGtObVc3UjJZ?=
 =?utf-8?Q?ZQnSaAwqoJj4nJyKrf3KzH0s7?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <74D2FBF8E274DF4E8358EBB3E2FAF04B@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 12ac7a9d-1f79-4154-d604-08de2bbe4ec2
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Nov 2025 01:02:29.7769 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: KGGyzJK8qmUYXvlh5JzARWcefOF3HTjq5J7TSC9HhqzITm+a0bfE0zhlhkGxjic2trU26rKXWAagFLc+i1NXkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7120
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

T24gVHVlLCAyMDI1LTExLTI1IGF0IDA5OjU3ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gPiBIb3BwZXIvQmxhY2t3ZWxsKyB1c2UgUElPIHRvby4gU28gdGhlIGNvbmZsYXRpbmcg
Y291bGQgYmUgYSByZWFsDQo+ID4gY29uY2Vybi4NCj4gDQo+IE9rLCBzbyB3ZSByZWFsbHkgd2Fu
dCB0byBoYXZlIHRoaXMgaGFuZGxlZCBieSB0aGUgZmFsY29uIEhBTCBhcyBUaW11cg0KPiBzdWdn
ZXN0ZWQuDQoNCkkgd2lsbCB0cnkgdG8gaW5jb3Jwb3JhdGUgc29tZSBtb3JlIEhBTCBmdW5jdGlv
bnMgaW4gdjIsIGJ1dCBpdCB3aWxsIHByb2JhYmx5IG5lZWQgYWRkaXRpb25hbCB3b3JrDQpsYXRl
ciB0byBpbmNsdWRlIHRoZSBFTUVNIFBJTyBzdHVmZiBmb3IgSG9wcGVyKy4NCg0K
