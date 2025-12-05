Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E8DFCCA9415
	for <lists+nouveau@lfdr.de>; Fri, 05 Dec 2025 21:23:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64E8910EBAC;
	Fri,  5 Dec 2025 20:23:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ojvIxs9N";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011070.outbound.protection.outlook.com [52.101.52.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A043510EBAC;
 Fri,  5 Dec 2025 20:23:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TT3yYIUiOM/p1Kfv2iVvR+Q0GeoP25wRyBEB4QpHwlFqJLOsh0a/KwC2vEJjC9iRl8/N0/dhWdbGTccqlO2QQa8k/y44ifrwcVkY3QvmR1PEAkY+dvUrrdlb3WqXfgt9ZzyAH55snvlnq6HmN3OJWqgS7cVsN8Pp6f64AJ/xeA8sp7y8+C5DRaFngK7zGy6xfHVAuj/jXlVqbZBRR8ptX4doMDfxZMQcJwkBqaeHiJPMTljBswEXpW843YOrK+ICsJM202l8RSZRVPCd3kUxEWl7ZoEThGCVDgjZVkUUQ1j3EMLlS6xdgrUVbtjLlQn6GG/xnj9bDrBzAhvS0rPzvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ls4OURzATAzSNZqYp99G1+Zqin77t04GPczRPOvdOFw=;
 b=XQjL77mQUcTpGfKGnEY+dCudnLJX4F9ibg3YHvbs2PwDqeVGj1F3WWjgqFC7ZLQKlKQQHCwAtJSlZgFLghJ2cg/1KiVuuQhFRnEk34G626U2Nh4iKbovvTczaHtO8lcl4HNTHAdrHPYCKiQweOV/3OigjjP1r+WxFuSrl/RCLL2uUJ5k9loxSymvPZWc2Tc+Cs/yjMp5chuDByny4B/ZEbJIoM/79g6q2p+DmFIdUij0mpNc1nLnsWoGHyD1LTn+ncTB+tLiki0ArnmWOmaYCj6e2pQI0iueKvk2CasMS6H/CwL4+KOZw1qeskgaVo9V4I/PLRrPup3BfbrlYPl84A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ls4OURzATAzSNZqYp99G1+Zqin77t04GPczRPOvdOFw=;
 b=ojvIxs9NAAtmU/x5Zbxco46+PDhPNF11Zayp7BMHNgx4xPlUXKVQag7WHx4bwjSDuxR0cT+RGIC8Rf+99bBQhjzcKbJEX/isRrDa44BotfWCroPNc6Uo8vAYhVj6dQwu250ifam64Xhfn1ARohJ3fVbLc3b2tePxXX9VL6qwqkiCDm1x+18RqYqvu65Ik7gDNjQIuaBq3Vj+vGu7LYqU0OIGdi/D3vFuu+iTGls5rqScUga2/vWdopmYlEYxVuMPQkgbexAbpLQR0TuLPJQ51XI/CcHK6UbGdryFtxCo6qWWnortab6FJ7enwrMrCWgvngPXA7q48hEr8Bu+jDZCwQ==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MN2PR12MB4061.namprd12.prod.outlook.com (2603:10b6:208:19a::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 20:22:59 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 20:22:58 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Topic: [PATCH 10/11] gpu: nova-core: LibosMemoryRegionInitArgument size
 must be page aligned
Thread-Index: AQHcVb7O8BOTeMMK20yX23bEM4/ssbT5X+OAgBQoLwCAAmObgIAAbumAgAFSlYCAAG55AIAAB2+AgAAvoACAAUuzAA==
Date: Fri, 5 Dec 2025 20:22:58 +0000
Message-ID: <658210754254b59e0a7efeaa1e0efee1c3fb5c41.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-11-ttabi@nvidia.com>
 <DECCV8XB5U56.1NBFD1KFJ59LU@nvidia.com>
 <b28cff274d79de78496c7f0fcc3627b2f816d3dc.camel@nvidia.com>
 <DEOK871CSNZB.W94R3SDUDZ22@nvidia.com>
 <df975795b0dbe58214ad302d7182ce6fe92e5fd8.camel@nvidia.com>
 <DEPIFZFMH34K.31NETCKSPOIEL@nvidia.com>
 <3c6219f90ca9e1d548c98ab1c54857a63a5d94cb.camel@nvidia.com>
 <ae07b871896b79e3d6180874dfb07d4d3aed4bdc.camel@nvidia.com>
 <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
In-Reply-To: <DEPV1LDH9K7I.2GGJ4YQ6UMGMS@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1.1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MN2PR12MB4061:EE_
x-ms-office365-filtering-correlation-id: b242061a-1a1b-4cbe-25b0-08de343c14ff
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?SnozUk1NMGhlVTkzcTJ1Tk8zTmxoVVZ2Tk5LNXp0MWkxdVl0RzVFT2g5NXhn?=
 =?utf-8?B?aW55ZVhLRWJia0NoNGRCVFJaV0hWOFcvdTRMV29CSXkvZ25pdEFSRzI3MW1j?=
 =?utf-8?B?U1RNT2tNaks0WTk0NHJrMDdEY3RBM2RFUko4M0JtblBMVm1rejJXOTV6MFpC?=
 =?utf-8?B?MFZWR3dzQ01nZ3pkNEtVRFUxK2ZFZ216a1N0QUJsbi9zNHhEU29VNDR2OVBU?=
 =?utf-8?B?dlJDYlo1U1hMYkhXRlJ3QVp1OFB3aG9RS2NhM0d0OWhaM3JwUmRyOHVWWWtZ?=
 =?utf-8?B?UzByb2xUY2JZTHlzeGdONzhuZlcvVk5ZUWFzb3ltV2tMVlErNjFhRXBvbWtq?=
 =?utf-8?B?SWJ2WnpFN0NkSzUvSzNrWFQ1RW8zZE5oK2s1amtTUWlJRWFZa3ZrWTl2ci9F?=
 =?utf-8?B?OC9jMWdjZjhEc2VXaUkxTWtvQko3YnlmdzFYWFUzRzUyMlg1M09iaWhYTXVm?=
 =?utf-8?B?anVLaWNTWWpGMzMyT2lEbXRPYjVxMWprRExHeVV1aFIxOW5lSlJRVWo0NFBu?=
 =?utf-8?B?MFhvWXJta2JpY3FBWFJWem55ZDhQdCtqSm5wbEdHeDFNY2VBbC8vOWFCUlpt?=
 =?utf-8?B?UWpORXFza011Y1h4dU4yeXE0L3IvRFJWNG9WVysyUTRGYlk2RlA5U1dIMW8v?=
 =?utf-8?B?MUdQT1JVcWZsak9TZ3BOMmRiY3NqTGxML2FzUmpNMHhta215U1hWSTZneUxz?=
 =?utf-8?B?Sy8yWi81bUZnWGs5RWJxeVhmNTJqUit4VjEvSkl4QmZFTVpaMHoxYXVWbXph?=
 =?utf-8?B?TC92RGFWQVM2Rm9VRGozWmNVRVI5ZjRCVEFzLy9uSVd5QzA4ckNwalhpNVVS?=
 =?utf-8?B?QXBPZ0N1bkpqNXVpWTBKSVM0eXllSExxNXZmeTl3WlNwNmFrMERla0pLSFBG?=
 =?utf-8?B?LytCOFlyOVlxNTVNeTBFSC9zQUtTL3pRSC9IeFl4ampvZ1EyNG10cTduYk9X?=
 =?utf-8?B?cklVN3l4emFlaGhmM3J4RWtINU8vVFIwZXJkZTdGbUU0Y2ttYTVVTDNxbFhs?=
 =?utf-8?B?MWU2RlVuNXNqaXZrUlVxWjZJWGI1ZEcvMHY2RmgzTlBqNXdzNUZMOXZjN3R0?=
 =?utf-8?B?UkUrS3dpNURrVWVNbVB5blZEMVlZR1dxQ3Z4WGVFUllBcDFpUG8vTHlXU290?=
 =?utf-8?B?SnVRTmZIaHp1aE5OTUc5VlVoWXJLcjYySVNGUmxxYUk2ZWdLZm5hRFRqZUxs?=
 =?utf-8?B?bVgzZUM3V2xram1TcldzQWEwQ1l1TGk1UXhheDU2bG52TjdPMUorVmd5Q2lK?=
 =?utf-8?B?L3dSU3Y0K0NhMk8zeXlNUElGSzdqL2VNblhFdXdoMDA5OURWZEFVZjN1OHph?=
 =?utf-8?B?TEhMMnpFSGxzeDhoNHY1bitQSkpHZ1d2REtPMVoyTHdoWlZnMTZWYUZlc3pS?=
 =?utf-8?B?dmRvNFBidExaTitZUThVekJSVllkcG43a3NPL2hMSHkxNHp5UEg1blEyeWRm?=
 =?utf-8?B?bXpUR1FrZG1kWk04VnpDd1VZZzh3S0RTclpVVGFXbjhIdzVJYU9CVVFqQ0JN?=
 =?utf-8?B?MERuSitxY2ZSY1FWanpDcEtSZVYrYnZRS0R3RG1IWXc4NHNZSUtXRWRaZHlF?=
 =?utf-8?B?cS93Rmh4VnhEUThKZ29MRWUzK0V1aTdPRm1DejRhUVNhRmZxK0VhQ0ZQb2pa?=
 =?utf-8?B?anp3WVIvL2dUNVA4N0ZubTI3ZzdHMVBIS3VENzNGejBkRFRQZUlodnZtTkdE?=
 =?utf-8?B?dG9oaUF6cHNZUkFzTkhDanpsTHpvQW03djc0anNPUmx4YUR6VW9ta2JWN2Fr?=
 =?utf-8?B?RkJJc0Y1UzJRcVQ2R3FDWlVOMXVoa3VQcEFGU1A1THcrSjlCM1hCUVh5MWg0?=
 =?utf-8?B?RzZ1RlFiZkwxQkJPQ0NsTDduY3gyUXp3cWE5N1NORE1kYzdqc3B1VkZNeUUx?=
 =?utf-8?B?aTdCWlVhbXpLYzAzclM5dHVWKzliTjFJZHpUWDBSTkk2VmhFeUlIbm0zYnRv?=
 =?utf-8?B?blFwY0hQTEJ3TXhUemhiak9qQWNOZDF5akNnSlVmdUIydW5IVVZYK3ZPNFdN?=
 =?utf-8?B?YW8vVk9ReTBCcnNqa2FZZG9LNkxablJrMnZGVWo0MFdXVy9sS0piQXZFbzIw?=
 =?utf-8?Q?0jdvo1?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?cmppQzVlVmJ1bnlyOUo5enByR1NScmU3WUZCUFNlOEx1V3ZsOU4xUEZoalg1?=
 =?utf-8?B?Q2d2dXVVbXh5TyswRk5WZWhqQWtycmZwL3piRXZ2MHI3Z2hCVjdQOU9Mdk5W?=
 =?utf-8?B?aXIwNGJFdmsyeWkyMHNLR216bnczNGVnSXdBTXNyM1JNbDhTZDQvTFk5M1Rh?=
 =?utf-8?B?ZU5TalVaSmthMXo5OEVOTjdnSlRVa3J5Z3JzZFNqSzdjdkhLeld5SnM5YWFl?=
 =?utf-8?B?YWxLSHRBS3JmVXNEQlVHODhLN3VhWVQ2NFlBNFpZeTNESmtYL1ozMXF6TnFX?=
 =?utf-8?B?SXgySk5uYUMrcUlQTENCaGlCbm92bUt5WlpFMkJ2NUdISElzRDJOQzVYbFNK?=
 =?utf-8?B?VkhtZXpVSHRCdVNMWXhWRENIYklodS8yRmZ1MFpsbVJ4UGR1SllOMG5UaWta?=
 =?utf-8?B?NEhzZnNyRGV5dy9PNmhyblZ0eVFHNDdHTy96bE51RWEwRnVndFZxV3JJeHA2?=
 =?utf-8?B?Y05iVnFveVJKeWRSemRnWjBxUlArQkQxbXowdk1ZakxJZFpaUmNRKzZ0MHRV?=
 =?utf-8?B?Z1ZKSnJ4MFlwOU1SLzBVQjQ3cGRwbHVNdU1JYXQxUEhkWUl2Tmw3ejdQWFhj?=
 =?utf-8?B?OTBaZXlwRkNsWmVFMTMxSkRHeThpdGJWMGhFQUhKM2RpMWxZd250VU5qb1BX?=
 =?utf-8?B?eE14UVhQeXVudzE4SUMxTlZUYTIyWVRTR0NkUVR3SG9XcFRoMzVoY3grR21U?=
 =?utf-8?B?cC94UjlzdEl0cStkeU9leHNNTElwUFQxSmJvWkNrNmhPY25welJIY3d0ZG15?=
 =?utf-8?B?RjZYWDNQd3RqbSt0ZHU1UmZFR1ZQVHVCOEhiRUpYM2hONkhjbUI4a0xCSVRO?=
 =?utf-8?B?Um5WSWgzem13Yk4wdm0zdmdYMmNqREtubzIyRVQxOFlqY3QxZUVtcW81bzcz?=
 =?utf-8?B?aUY1YmkrdDVXdHZNVjQ3THJmWVRBd1BHa2wvaXVaT2t0cUFES04wdmVlc0tN?=
 =?utf-8?B?Ni91MWd4UUlvWFNWZThyc2tDK2d1OEJjc0VKK3A4ZXVaNlVtQjB6VlBsY2hO?=
 =?utf-8?B?Y1JBclZVQ0lIVS9vdEpjc09vdGJxRGNUY0lmaXpBeTJIUlVxWlhkM1B5WDVv?=
 =?utf-8?B?eGVJNDlaOXJ5VlQ3Qmk5emZxNFNiZjUzbE1GR092K3JMb0NrSS9VN2FTL2M3?=
 =?utf-8?B?Z0ZkV1M0Z0c0K1h6c3NWbXNIcDBXbGplR2JzM0VhanM2eko5bnUyZ0RFQytC?=
 =?utf-8?B?Nkxhdk9zMmFhNEhSQWk2c3g3a3BlTnBvbnNJcG1LTjlvTVRnVDk3cmpJMG90?=
 =?utf-8?B?dEVNRGx4TEF4Ni9vVEZvZmNoYmFLTVdGM2ZYOG5KUHk4bk93LzhaZ1ZPYi8w?=
 =?utf-8?B?bjlaOGd6N01zSndwOHJuUGd3SzY2K1haNmhpL2NIT1hhOFlTZE82Q2lOTjdj?=
 =?utf-8?B?SGFoUURRSHViUitWWHNGMy9XV0tpM04vNEJ5V2RDa1B1dFVkZGpUWE1BRzcz?=
 =?utf-8?B?REZaeFRUUmNSM1NlbUpkcVdQb2ZGWEt5R3k2VitkZTU3UC9za0NBYzI3aXYx?=
 =?utf-8?B?ZnRUS1ljOHFka3BGMG9McEhwQW1zVVc2bGF5MXZibFdTNk9CTi9IRGJzUW1p?=
 =?utf-8?B?aXZzQzJRamhNUk4xZHFTcmFwSVhLWHhDbkViMGp5MXY5OWhDS1hmSHhHUFZr?=
 =?utf-8?B?azBuWkRHcko0VVdXb2RBbXZwajE3L3hTVDhSUDNPWlB2QkNBS0dJVHFzQVd2?=
 =?utf-8?B?T2JmSmFaRFphS21wWWwxdlV5M0h1bGdGNW9HMWhuNTM4Q1ZSZHhzWUpRci9q?=
 =?utf-8?B?aGRFUUMybm9nSFg5ODB6RitHRUVuRC93Y2FpNXg4R0l1VEcraG1zUHVTdENN?=
 =?utf-8?B?M3J2WUVCNFJaTGpCRU1hRXhuNmVpeWt4eFBhY0VFK3lvWTBTalNYTGtrSnc2?=
 =?utf-8?B?dDFBeFpOR29Fek9IOXZ5MzNDczJvRjFUZ2xSL05Hc2V3YlhhdmIrbDNIK052?=
 =?utf-8?B?ZDMyenMwZ0oyMTdqdDNUMzZzSkZFd1Q2SEJjUlI0UVlxekkyMHZvYmFTbVNY?=
 =?utf-8?B?OXZIVGJ5K3BBakhSb2h0VzZ1OHBkZG5ZYkFLbnF4aEhRdDNCZU9ZQktnU1Y4?=
 =?utf-8?B?ekpua2pBSGRWOE56ZlVYdjZoYkp1Zk5sR1hOSUhNQ3k5Y25XcHFqL2tOVzR3?=
 =?utf-8?Q?L5/YTywiu90p6mZ4sRzH/HeeJ?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <C5FF407F140B16449E1E8B3D969E1A92@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b242061a-1a1b-4cbe-25b0-08de343c14ff
X-MS-Exchange-CrossTenant-originalarrivaltime: 05 Dec 2025 20:22:58.7902 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: lgF0Rtj8b0yAfS8LaIOB1vm3M660dubEArxzQwE4vPnzyY8nNGAsg2Opjj7KeL5J3S58vSnGy0MgEExnseSpNQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4061
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

T24gRnJpLCAyMDI1LTEyLTA1IGF0IDA5OjM1ICswOTAwLCBBbGV4YW5kcmUgQ291cmJvdCB3cm90
ZToNCj4gDQo+IFdpdGggb25lIGNhdmVhdDogYG5ld2Agbm93IHJldHVybnMgYSA0SyBvYmplY3Qg
b24gdGhlIHN0YWNrLCB3aGljaCB3ZQ0KPiBkZWZpbml0ZWx5IHdhbnQgdG8gYXZvaWQuIFNvIG1h
eWJlIHdlIGNhbiBoYXZlIGEgd3JhcHBlciBmb3IgdGhpbmdzIHdlDQo+IHdhbnQgdG8gYWxpZ24g
dGhlIDRLOg0KPiANCj4gwqAgI1tyZXByKEMpXQ0KPiDCoCBwdWIoY3JhdGUpIHN0cnVjdCBHc3BQ
YWdlQWxpZ25lZDxUPiB7DQo+IMKgwqDCoCBwdWIoY3JhdGUpIGlubmVyOiBULA0KPiDCoMKgwqAg
cGFkZGluZzogW3U4OyBHU1BfUEFHRV9TSVpFIC0gY29yZTo6bWVtOjpzaXplX29mOjo8VD4oKV0s
DQo+IMKgIH0NCj4gDQo+IFdlIHdvdWxkIHRoZW4gYWxsb2NhdGUgdGhlIENvaGVyZW50QWxsb2Nh
dGlvbiB1c2luZyBhDQo+IGBHc3BQYWdlQWxpZ25lZDxHc3BBcmd1bWVudHNDYWNoZWQ+YCwgYW5k
IGluaXRpYWxpemUgaXRzIHVzZWZ1bCBkYXRhDQo+IHdpdGg6DQo+IA0KPiDCoCBkbWFfd3JpdGUh
KHJtYXJnc1swXS5pbm5lciA9IGZ3OjpHc3BBcmd1bWVudHNDYWNoZWQ6Om5ldygmY21kcSkpPzsN
Cg0KSSdtIGNvbmZ1c2VkLiAgQXJlbid0IHdlIGFscmVhZHkgYXZvaWRpbmcgdGhlIHN0YWNrPyAg
VGhpcyBpcyB0aGUgY29kZSB0b2RheToNCg0KICAgICAgICBsZXQgcm1hcmdzID0gQ29oZXJlbnRB
bGxvY2F0aW9uOjo8R3NwQXJndW1lbnRzQ2FjaGVkPjo6YWxsb2NfY29oZXJlbnQoDQogICAgICAg
ICAgICBkZXYsDQogICAgICAgICAgICAxLA0KICAgICAgICAgICAgR0ZQX0tFUk5FTCB8IF9fR0ZQ
X1pFUk8sDQogICAgICAgICk/Ow0KICAgICAgICBkbWFfd3JpdGUhKHJtYXJnc1swXSA9IGZ3OjpH
c3BBcmd1bWVudHNDYWNoZWQ6Om5ldygmY21kcSkpPzsNCg0KVGhlIG9ubHkgZGlmZmVyZW5jZSB3
aXRoIHdoYXQncyB0aGVyZSB0b2RheSB2cyB3aGF0IHlvdSBzdWdnZXN0IGlzIHRoZSAiLmlubmVy
IiwgYW5kIEkgdGhpbmsgSSBjYW4NCmF2b2lkIGV2ZW4gdGhhdCBpZiBJIG1ha2UgR3NwUGFnZUFs
aWduZWQgYSB0dXBsZSBpbnN0ZWFkIG9mIGEgbmFtZWQgc3RydWN0Lg0KDQo+IA0KPiA+IEkgaGFk
IHRvIHJlbW92ZSB0aGUgI1tyZXByKHRyYW5zcGFyZW50KV0uwqAgSXMgdGhhdA0KPiA+IG9rYXk/
wqAgVGhlIGNvZGUgY29tcGlsZXMgYW5kIHNlZW1zIHRvIHdvcmsuDQo+IA0KPiBBcyBsb25nIGFz
IHRoZSBzdHJ1Y3QgaXMgYHJlcHIoQylgLCB0aGUgbGF5b3V0IHdpbGwgYmUgd2hhdCB3ZSBleHBl
Y3QuDQo+IEFjdHVhbGx5IHRoaXMgbWFkZSBtZSByZWFsaXplIHRoYXQgYHJlcHIoQylgIGlzIHRl
Y2huaWNhbGx5IHdoYXQgd2Ugd2FudCBmb3Igb3VyDQo+IGJpbmRpbmdzIGFic3RyYWN0aW9ucywg
bm90IGByZXByKHRyYW5zcGFyZW50KWAgLSBib3RoIGhhcHBlbiB0byBoYXZlIHRoZQ0KPiBzYW1l
IGVmZmVjdCBzaW5jZSB0aGUgd3JhcHBlciBzdHJ1Y3QgaXMgYHJlcHIoQylgIGFueXdheSwgYnV0
IHRoZSBsYXR0ZXINCj4gaXMgbW9yZSByZXN0cmljdGl2ZSB0aGFuIHdlIG5lZWQuDQo+IA0KPiBH
bGFkIHdlIGZvdW5kIGFuIGVsZWdhbnQgd2F5IHRvIGFkZHJlc3MgdGhpcyENCg0KQWN0dWFsbHks
IEkgdGhpbmsgYSBtb3JlIGVsZWdhbnQgc29sdXRpb24gd291bGQgYmUgYSBuZXcgdmFyaWFudCBv
Zg0KQ29oZXJlbnRBbGxvY2F0aW9uOjphbGxvY19jb2hlcmVudCgpIHRoYXQgdGFrZXMgYSBzaXpl
IHRvIGFsbG9jYXRlIGluc3RlYWQgb2YgdXNpbmcgc2l6ZV9vZjo6PFQ+LiAgDQoNCkluIGZhY3Qs
IEkgd29uZGVyIGlmIGl0IG1ha2VzIHNlbnNlIHRvIGFsd2F5cyBncm93IHRoZSBzaXplIG9mIHRo
ZSBhbGxvY2F0aW9uIHRvIHRoZSBuZWFyZXN0IHBhZ2UsDQpzaW5jZSBkbWFfYWxsb2NfYXR0cnMo
KSBhbHdheXMgYWxsb2NhdGVzIHdob2xlIHBhZ2VzIGFueXdheS4gIFBlcmhhcHMgQ29oZXJlbnRB
bGxvY2F0aW9uPFQ+IG5lZWRzIGFuDQphbGxvY2F0ZWQoKSBtZXRob2QgaW4gYWRkaXRpb24gdG8g
YSBzaXplKCkgbWV0aG9kLiAgc2l6ZSgpIHJldHVybnMgY291bnQqc2l6ZW9mIGFzIHRvZGF5LCBh
bmQNCmFsbG9jYXRlZCgpIHJldHVybnMgdGhhdCB2YWx1ZSByb3VuZGVkIHVwIHRvIHRoZSBuZWFy
ZXN0IFBBR0VfU0laRS4NCg0KDQo=
