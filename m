Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 16856C7118F
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 21:56:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0159C10E68B;
	Wed, 19 Nov 2025 20:56:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="M3SPeP1j";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011004.outbound.protection.outlook.com [52.101.62.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AA9E10E68B;
 Wed, 19 Nov 2025 20:56:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tqGqtlaoQb2TCczjHLWMgCgtyqayuwkbjHXcUPSe5aShdng837QLTbXtU43dE5J/KsxZFIXWKCCp7CUuSZgT1JqyoqKbZLaKTh5vutz/L8ss9wAtYUtxSgKaNnaITgYum+9jrWYLcjsArtHX77VAQDH3qsZeLc1G//X73dlWIcPiwHtNdSngt2a0uaMAWLUbQbWxsbBq6IS4zqG+DMe2VJp3Yz+outqXiifJ7BrDVHTc23Hn7D9CG0u0gPt9j9M/6BlAtSn+1NTcreHjdciEN39ps+f+oyYu5xUWNx/NwWn0HRU7hfagf2rofkDw0iDHLPFyJxuK6f3jXlvAEdAq2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qt21jws+XKjKUFL1BilYe3bXWhoGFggEOUBA8f2vMt4=;
 b=BjpxGlcHPRhcJZFGIN7HrsZ82+mjoxODKcz6oQlV+TE+9DsOxrCgMq74bAWZ9hadcSkhGj3YaBA2fUWFaN2qOCR6HnhCl9Jxl+xVXEtZgpkIX/40LJsGBK3Gi/cVRLx8Ilp5EuP8PrWhvhw53nFvdsNVZYZpeRLAk+HA9eOcbbed1VbVmuAe8ER20qVr9iHuv+XkONT0LdMR3NsFM+5urAJgLJSmR7rsJDYL7jaC1fBCuU+h6+XTeQRU8438RB10juFuc+LuIZtOEzkYiCKTAbbJoNzC94vBXHDayHm3S0fdcc/5moIM/2BFlnTNJBg+dYuqhco/xUZhLxfgHtYQEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qt21jws+XKjKUFL1BilYe3bXWhoGFggEOUBA8f2vMt4=;
 b=M3SPeP1jOGSs3lb/byTymx/bqxX3zylEk5gFLuSLd/KGgxRZXjHQ55rZS52yrviZITHDJlGvslxHhauXVnUUSBvJHwvxWBXsdxptUOtKLHWP5WOdUC9qJAShdn0p/sLgWfrgXvyj9KEp9bsteCeN+a11vJ5hxJ0YTQRmNn9lw+dkRWis2s6Na1yDLGnqsqkLnc1m0ig4cNHpBiBBxBAr9PMC0qk26xkgv5AJ2wV5feseiLLGAyRYc2SPuVyv/DW/NMfaN7bnwEjJRW02bUNt8JbFUbcxwItnz+nZ8MLiNNBEwXrbB5RhWelUREQsfgOgdK+HSHTPvGt7nEufRqFJgA==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by CY5PR12MB6549.namprd12.prod.outlook.com (2603:10b6:930:43::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 20:56:48 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 20:56:47 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Joel
 Fernandes <joelagnelf@nvidia.com>, Alexandre Courbot <acourbot@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 John Hubbard <jhubbard@nvidia.com>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>
CC: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Topic: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
Thread-Index: AQHcVb7HnZgTrM6ka0OpQ9aSKtoZE7T5Q12AgABNAQCAAAcFgIAA2aSAgAALaYCAAAMEgIAAAn4AgAAAmoA=
Date: Wed, 19 Nov 2025 20:56:47 +0000
Message-ID: <20d7ca3a5d709ca577c53d806add1939b876a0f6.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
 <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
 <38438d5538939ecc0841a09869a2e168ec2246c2.camel@nvidia.com>
 <81dc8ea0-3cd9-438c-a74f-e5805211fa38@nvidia.com>
 <3ea243f63f0e0efabfc5d306797883b0196399e7.camel@nvidia.com>
 <65db2753-6c1d-49d5-a9a9-9c99e5b8da49@nvidia.com>
In-Reply-To: <65db2753-6c1d-49d5-a9a9-9c99e5b8da49@nvidia.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|CY5PR12MB6549:EE_
x-ms-office365-filtering-correlation-id: 68012546-a65a-43f7-029b-08de27ae27d5
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|376014|1800799024|366016|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?L2pabnptWDdwWnZEWDJlQmthbnVlaGdKKzliOVY2UE1OU3Vxc2RxSG5reHh6?=
 =?utf-8?B?REg2Z3MrMDZZOG9jd2lZWXdLcURpeG5TeDZwc1UvZFFWVVRkS05CTWlCTXJu?=
 =?utf-8?B?dFhLZUhabmxNRnI4eTVLNW10R3dadmxDdHpmSVgrTDdjQnJpZTBGNlluWHI5?=
 =?utf-8?B?QUVFN1AyUisrMURJeUFBREJrdWNQL2xzYXZBVm80anJyTDdxNHdZR2dHU29i?=
 =?utf-8?B?dlpZeVJWYWN5OThsY2tnQ3plaW83NXJ2cE1VZlppUFpTS1VuU2wybERwMGMr?=
 =?utf-8?B?bENXMms2dnBUckp1bGUydGNITndWY3hWMkg5Z3FVRk5MN3RDUGdWYzBnWUF1?=
 =?utf-8?B?WTRVTmFRa2hldlIxWEgwNnlLL2paRzRxa2JrNFNBRFRCb1o5ODNobnNVNDl1?=
 =?utf-8?B?b3paU2ZkakhDRVN5eWRKWXlOYzlnOG9EcGxCUVpUamdQNDhOb282YUpHT0VK?=
 =?utf-8?B?MjB4ZmxvN3A5UTNzNGhMUkNabTdaRlpVWnRmSUk2b1FnRXFQbktQS2lLbENL?=
 =?utf-8?B?NU5yRzdZV0RLY0hZR28wTTVzQzFqR3ZpVmllWHZZaUN1QTBHU0xPeGxkV3lk?=
 =?utf-8?B?bFE5MGZzWDdPSkx2WmZTZkpIa3JlMVNtVVQybi9lTjR6bHZZTTM1OUlhT1F3?=
 =?utf-8?B?QnBpdlJRYW1qV21FOHNPby95Q3M0MWg1R3EreWRwTkFVdzBqWVJseW5CNU9t?=
 =?utf-8?B?Y2Y3cUNHZUJKUTlNZE5ZRnppZ1FZWklFcnJiZTJnWGpuOTgrV2drY0JPVVNZ?=
 =?utf-8?B?alY3SmlZL21SQjVDNjkzNHhCbHhKQkpwZk1OMzJySHcyQmFneHA4NzlGcnZV?=
 =?utf-8?B?cW5uNjYvVnBEL3g3d1pUcUVOWFNpU0J5Yk9CZm1CZHR3ZDhjRVQvT1RxSlJQ?=
 =?utf-8?B?MWRjTnRnSlFKREpPcnUvQ3Q4ZHRtKzJSM1JjMWN5cUtmNEl5OXYyRUlzWlZl?=
 =?utf-8?B?bEtLQlJXSGRteXQ3SjhJRWhPdEhpSkY4c1BkWC9NMUp5YUdlWGJYT0pOY2pL?=
 =?utf-8?B?L3p1TGxqTThESWZLY0p3NWhCWjBMNmVqaW5ZNmNmRWowaGxXWVdzODhWYXJ1?=
 =?utf-8?B?bFl0L29OOGNyMW5JWDFzaytENmNLMHV3aUZXK3NTOEdUVDhPQy96UEZtZEhS?=
 =?utf-8?B?NEl3RW5xaUNqUkZlT1krbUJpc0dzTEhFejRkNTdlR2ZJRlRsekFvQjkrUERJ?=
 =?utf-8?B?VlNEUkhZU0IrZi9TZ1B5TkRncGN2eWFINFkrMTdvU2gwQ0RMbVRVdW9pWXN3?=
 =?utf-8?B?VzlqejRuaDlIRk94SStVTk5QbytGeEU3VUhBU1RiWlJuTWZOUXYyU1BLQXN5?=
 =?utf-8?B?UDJuNmhlQnNKK1VKRDljdzM1aGRVRks0My9oSVVJU1VpSkM0WGFqM29qZ2I4?=
 =?utf-8?B?d0JXWS9KaCtJNEdpd1U0YzVXRjVjQlZuRzNEREo1dVBNeXU1SVdNK2FnL0dO?=
 =?utf-8?B?TkRTbkhNbTA4OEJkakpRd0NVdWNvQWw4RkpIbG16eXo2STBwNUlaeXVRRVZp?=
 =?utf-8?B?ZDEvUklYOUxmOXJLZmtGSGF3K3VwdVdmZStnWFRMaU9HZXN4QXNrNUx1c2VT?=
 =?utf-8?B?dll5blhnRmRTTlYrWjFuUmFIckdyWGR2b0RiOFRtSDV2ak1OMWdLbTNVaVRo?=
 =?utf-8?B?b3VRa2c5bkkxellVcUY4STdwVkEwVzhvcm84Yy8zK1l5aXd1UjhndU40d1hx?=
 =?utf-8?B?QThLOCtoc01zcGQxTVM3NERuQVBZN0wxVEhRWVN3Z2tGMFBTOWd3c3Evc1Iw?=
 =?utf-8?B?T2t3V0RINGRsQTBoZzRITHdmdklGbXFmRmV5cS9qQmVsVnZTaDNrUUF2Qk5a?=
 =?utf-8?B?MGF5dThleVlBVis1S0wzTGhuc0k0K2t2ajIvbmlHTVVmV2lkQ2tveHd0SGUw?=
 =?utf-8?B?RUtzVmtmTDFwN0x6OVovbVZBR21RTWtXOERzT0JzdVpkNUFXNmszMWY1a1ZS?=
 =?utf-8?B?OU1PbFBFeG9PVjhtQUlhY2M1L3IwbmtkZDVHQnpnSUhDS1FHdW1iN3VyN0Vn?=
 =?utf-8?B?R1VVenA2dDZhQmkvWFdtSHFRL0hvcXFlSHRRUEdqWlFwd0pkNisxWFp6MHM5?=
 =?utf-8?Q?871dMP?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?YWcrdVJXblBCdWtVR21iU1hoR3hXcE92Z1hFVTVORkU1TjRQb05DbWJoZ3JG?=
 =?utf-8?B?SDlHZFR1djBvNkNKK29DajVDYUt0c1dycWhYYzc3emZ0RHYzNk5iUWFFZlVr?=
 =?utf-8?B?dXNiUzRQOTlqL0h6LzhkeUFyK29ZQWM4SkhpWEU1T01XZCtDRWtCeWRVcjBi?=
 =?utf-8?B?eTBkRFRtc2F1akpKZlhCcVEvUlJzdXh5L3Azemh2SmZjL2FPWm1FZXFDN3gr?=
 =?utf-8?B?RTRjT1Zrc0lDQ2xLaENPT2NaZEh0THZaNGdRaVlKUkpHakZ0dm1XTi83VGZU?=
 =?utf-8?B?QUZVc3RxbWZZSFAyYmdlZVFUK0haOG1lZld3bHNtdDFOdCt6K3VJcmRNb0Yy?=
 =?utf-8?B?MUhEcmUzZEhsSmZtek1aUkJsd09kZlhaTWo1aWpHM0hMZXE5ZGEyYVJkK25i?=
 =?utf-8?B?ckM0Tmg4YXlWWHdhQWFrRDZQMWxHaTFYVnV1RThmWnhLdk9JdmVwUDdOQURo?=
 =?utf-8?B?Wnd1eDhuNGJUME9EdjNWSTFjNnYwMFgzbCtpajBmeHlKS2V2dVFVNE15RUhR?=
 =?utf-8?B?ZUYyb01BMDVmNlM2bnB0RUxRL2JrTFA2U3NBcE1mUTc3d1h4aXJiVE5lSkpZ?=
 =?utf-8?B?aWR3L0FHRXlDTEVaRlMvQUNDWWRpdnZPcnpMSTFSSGZ3TlZCSzlZdEV5TnJE?=
 =?utf-8?B?TXlxZDJGdVFqSHk1UHZOcGNZOStZQkVaSW1CSzk5WXJZUFNadGx2NWJaNjRr?=
 =?utf-8?B?MVBtRytCS2lmckQxU3Z5OWhjNDB6N0gvc3NjSXVSMGRrSjlSckZoUlUzT3pv?=
 =?utf-8?B?WExLSTEvblVmNmJvb1dTRjdsanQvOEplemo4MGVOOVViM2x6OTlOT3Y1NHp4?=
 =?utf-8?B?WnZiMEFXSnFzSHBRZ1Ewbk1SRy9uZ2VEa3dVT3J2WVhuYVJ1NDh1ZUd6dWds?=
 =?utf-8?B?R3pQZCtwTjhyU1djMlYvQ1djM2NONU0yblEzR01XZ1Z5ZjlVS2FPVHg4VkZ2?=
 =?utf-8?B?Z29nNlpxYkJmRW1IMXRHcmx5eDJZL0VDWmlUZi9LY3Q2ZExMdlZ5N05QcE0z?=
 =?utf-8?B?TUR3dTNoMHVIeU51dlZ1ZFhFVXR0WWlQZjdjVklRNDE4SHExWndSckxNaVpI?=
 =?utf-8?B?eGNubEMvZGpCZlgwZHdWZkI1RXpjNzVhY1FKTW1kMGNSOTN2K1FhS292Uk8r?=
 =?utf-8?B?YzNQUkFYN2xIQk54ZmlHOWV0M3lmQ1I1V2kxSUdmeDhGdkZDNUtQQTVKY2Zv?=
 =?utf-8?B?QTdaN3lKTnkzVGZpVitVSmZ0SVo1VzFSaFF3bHpZbTJKRUxNcm9vSjVwenJM?=
 =?utf-8?B?R1FwNFRsZXQxempBcDhxdS9yZVpOc1Fqa1hNZTNuWHI1bzB4SmRXdll6ZDhO?=
 =?utf-8?B?OFlqZTkwek1EY2hXNDhMR1pqdmVOTlh3cStVMXRId3FXcTN4WW5paW5pMlhC?=
 =?utf-8?B?Z1Z2Q0dsWXBETWRQb2NOQ3k2Wis1UjZxMDU4UCtJQ0xIaU1yM0ttYnJUckFX?=
 =?utf-8?B?OHhZdGozeXFxWCtsN2hKeXJxWXh2MkpiZHQvaU9saVJyWDB4UjdDbEhvKzFY?=
 =?utf-8?B?eXNxV045bkZ2TDV0WVpURjlWbk4vRmdvMDd1QkZYcnc4UjVJOGl6c2lMQVJQ?=
 =?utf-8?B?L0lOWXE2OE9vbUlsTnRXMmRiNS9udFd0bmN0UVNrRWxFUGNodXM2aWYvUVdi?=
 =?utf-8?B?Qk9Ucm4wT3p6S2x4NzMwOHVBaHNqNmY2YzZRZXJabWlKcDh2aXNDaTFBWFQy?=
 =?utf-8?B?aFJ4OVpPNjFqUjhuYkpFdm5sZmN5TFRyaDdsSG4yRDJrNWplamtjYmVkazBM?=
 =?utf-8?B?Q052dzYycGhvcUdkS0xDYSszN3hQa2tWeDg4V1RRalkzUDNRaWlpZVlDNVpG?=
 =?utf-8?B?NVNJWDM0S1BoUUtlalRQMzRpZWVLc2ZjVENFdTdwVTl5dzlrT2tMT1RocHA5?=
 =?utf-8?B?UDVHMEVsajMvN2drUUo0YkFQRFBSa2tiZVZTR3RLWFFGNHFXSngwU0N2Z2tN?=
 =?utf-8?B?STRCZ2UraDVheGpmUjIzeXF3T1NLVVBnSSt0U1dZTCsySzdhVkkwVlYxanJM?=
 =?utf-8?B?RzllZjg1b3M0TG0xa3hXK2dub2xUYUpOZjB5QW93YUdQV2lETmZPMGlERzZ1?=
 =?utf-8?B?Rm1aVndXYjMrWFNMNmc2QllzY3ZqSXI3QTJGWXA2dW1lYTR0YXUyQm4yb2tC?=
 =?utf-8?Q?1E18CF2f92uBxPVUQM7rp08yl?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <B95AB441F8F5C246A45B3D7EA67090BD@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68012546-a65a-43f7-029b-08de27ae27d5
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 20:56:47.8887 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: NGO5SfBcocpjMSZhKZOR1URxo5Mmr84RvQwMRsFraQrZxmeEwZqMdE6BX/pLJ9nGngBEtOt3+LoLjEA+8qayhA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6549
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

T24gV2VkLCAyMDI1LTExLTE5IGF0IDEyOjU0IC0wODAwLCBKb2huIEh1YmJhcmQgd3JvdGU6DQo+
IEhhdmUgd2UgY29tZSBmdWxsIGNpcmNsZSwgYmFjayB0byB0aGUgb3JpZ2luYWwgcGF0Y2gsIGJ1
dCB3aXRoIHNsaWdodGx5DQo+IGxvbmdlciBuYW1lcyAocGxlYXNlKT8gKFNwZWxsIG91dCBTZWN1
cmUgYW5kIE5vblNlY3VyZSwgcmF0aGVyIHRoYW4NCj4gdHlwaW5nIFNlYyBhbmQgTnMuKQ0KDQpJ
IGNhbiB0b3RhbGx5IGRvIHRoYXQuICANCg==
