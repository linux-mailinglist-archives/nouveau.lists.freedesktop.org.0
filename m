Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 770ECC66C7E
	for <lists+nouveau@lfdr.de>; Tue, 18 Nov 2025 02:06:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CDDC10E408;
	Tue, 18 Nov 2025 01:06:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NaQPcBCU";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010013.outbound.protection.outlook.com [52.101.46.13])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48DD310E12A
 for <nouveau@lists.freedesktop.org>; Tue, 18 Nov 2025 01:06:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WdjhzaSreuzGzAPYtUYRSt/ri7WQrCW+1BgC8NSSRGZNOiMDqOeAn16muT2BVV6AEDI2J2k+n0J2uyAOEf30XTjsiqCuAGVqQO/rwTrBXnWUTScrWcxDUqtfCJurk08kFMgSXpSXH5bwORPBzdSeoK4jNoZsYGg5ADuxpSYJBEGhBYaclo2+VZDRiT4aVKZvbynAUW4NPlVeXrpCFVSfP8TrrLhrH9XdyF3/AnmB6Ef9PlE7yKAcrTD/zltiqo/anOQrSesDi/6nQgsmvgX4TmzkbwkroAMenEIFlceCwZagEdYjDMu8H/u1Pz+L3jtrzuXd7J5LX4Sh/VeCtBZAnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Hdir3ShWO8yjXhaPIWn1SWR6fHEuIw9zRpyPGgyBwbY=;
 b=nBAQ94+dv2s9+HOaSbI87PI1e8MJCsqeBrpzCazKpB/ewzTaPPA8AGPkkmEpNTZwCxsKqcdT8z9i+SCXskZn6XxNNNptKjM4yp83Hy2TBaC/bsfA6fpiQ2R0X9njUca1mXtp3jVXFmeRRjZ3SV5hAojzz66YbL1if3hjNPbur5TsggR8NMQE/XeAx5/D0ezaz7+buyS7ndZFLeEpzTIFlE9mTy7aauZHUTs8HIrj9m8Kw1BrehZe5dLmDDXqh+ybxwCKfi2HBDI2oYHWZW7obh6NPZdCD+8oBqdxWwJeLXlyeml4zzDfSQSjlss5CxWR/dVCD1JX6byZNy2nZW7Vdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Hdir3ShWO8yjXhaPIWn1SWR6fHEuIw9zRpyPGgyBwbY=;
 b=NaQPcBCUMi74sbfTYmRcdYKTAeAVnmNxxnR70ca5vXXW+m20ntp4mG+dWin8HjkupBF2RFLBWKmUh5JqcVBpZFyZ10ynhi/N5OB1DVyjPQDMu0pZdJiTQNSmV5a4joP4i/YWRo0826vsgk7O8I3rb3ZxyfdtVTOO6chniReZ91Bu8zSCh6E251VS2LwekjQGcqbPSzqb2ZIdDa+dbiU7oCgsqjnVoI3I8SDOxmMAstgsi7ZTe8YM/ynYDEK+0MVdWSze+P0aRsNG59OxzOJfAc4LSgB+06iuRJ8uA1YoQEBmvOCJZq3gb4wqoE8lJsdpmJmX4HiefSeWo5L5QAwSgg==
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com (2603:10b6:a03:4c8::10)
 by MW4PR12MB7119.namprd12.prod.outlook.com (2603:10b6:303:220::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.12; Tue, 18 Nov
 2025 01:06:17 +0000
Received: from SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50]) by SJ2PR12MB7943.namprd12.prod.outlook.com
 ([fe80::6a18:df97:8d1a:5d50%4]) with mapi id 15.20.9320.021; Tue, 18 Nov 2025
 01:06:17 +0000
From: Timur Tabi <ttabi@nvidia.com>
To: Joel Fernandes <joelagnelf@nvidia.com>
CC: "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>, Alexandre
 Courbot <acourbot@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "lyude@redhat.com" <lyude@redhat.com>, John Hubbard <jhubbard@nvidia.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Topic: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
Thread-Index: AQHcVb7G2n7lcTwiZ0ixsrXV3K+7w7T3eOAAgAAm8QCAAANAAIAAAIUA
Date: Tue, 18 Nov 2025 01:06:16 +0000
Message-ID: <3665d524c89605169d5c283b621394158e0f6067.camel@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <20251117223324.GA1094429@joelbox2>
 <57b542d736e22d1bce7143b789e0760c9380aaa3.camel@nvidia.com>
 <20251118010424.GA1131446@joelbox2>
In-Reply-To: <20251118010424.GA1131446@joelbox2>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Evolution 3.52.3-0ubuntu1 
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: SJ2PR12MB7943:EE_|MW4PR12MB7119:EE_
x-ms-office365-filtering-correlation-id: b0d4d99a-5c94-4ff8-21e4-08de263ead57
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0; ARA:13230040|366016|1800799024|376014|38070700021;
x-microsoft-antispam-message-info: =?utf-8?B?cWRxbjEzSE52b1dwcTArL2pZU3dUVGJtMzdyN2FaaXI2MU9VWHliTEZnSG84?=
 =?utf-8?B?aUtYQldlRHFmNmlOS3NFNDE1dWhLVG5VVWpRTFZ0ZUgvSUxwbFBxK0haUXA5?=
 =?utf-8?B?VUNNQ3hjS2p3dVJMVExORnpBenVzcEU2THNNOUJoTmhzcmpDL3hiU3k0SHM5?=
 =?utf-8?B?aURZWGwxTklLcXVMV0Y1ZVJVRnJiUlZIb2RHSDFLb2tFcnFlckRWNlh0TGRr?=
 =?utf-8?B?WkJVNktxamlZTWp5a1JJa21uZ3VOdzAzYUhmSEVha2s5NXlnYjZZYzNqYjFl?=
 =?utf-8?B?WnE4MkFHVXNxUVdEandMempyb0MwYm1kNVpjU1JLQWFjNVAvNFQ2NGcxN1Rk?=
 =?utf-8?B?eDVtNXcxbC9hdExOM1ZFRnhZUHBGNmdiWkNMTG1PWkUvVjdDK1ZiSUh0aWZQ?=
 =?utf-8?B?Z1M1VXdJMWM5aGF0WnJMZEE3bjc4d3J6ckdjSGQ2T3NNYTZETi9MTDliY2E1?=
 =?utf-8?B?d2hZUmNkWGRXU2tySFV0Vjl0Rm1PRnpyZjhselBUUjVrdUp1c2R1NFdOZmVm?=
 =?utf-8?B?Y21aSGIwcEkvY3ozRUJ4TVR0ZkhCckUwcmsxMkFlaUhnT0duN3ZDMzRqeW9H?=
 =?utf-8?B?VlBjZUIrUHVJUFNyUVJpRXYwdU8vdTQ5d08yVEhhT29zK3d1dmF1QU5JamRz?=
 =?utf-8?B?K0JheG4xMytvVTB0Z0NjNkZqTVlNTThpWjNUblcvc3l4U1BUWEkzSE9iUUlv?=
 =?utf-8?B?UzBCOG9wNFhkWDUyR1B5dUUvSmRTZ1BnTnN0cDg4WTZEVlpOSjFSaTV3L3gx?=
 =?utf-8?B?YXBuZyt3UWdYRy9SREpaWWRuWlRJVzRDQ2dva3hndEpCU1NNNnBQeURlTHVq?=
 =?utf-8?B?RjgwdTNnQkw2eklPUGE2aUxheThiT2Q5Ynpybllnc3FSYm85Nkh5OU93SUNw?=
 =?utf-8?B?RUptU0NWV3I3MjlmdkZiQ3FLM056dDZKWjlmb014cHNRNzJkbyttNlRoakhY?=
 =?utf-8?B?UG9UbU54MmF5QVJmcHZ2YTJ3TGhaZTdjU1hpVUZ6OVJqVFBUZkprRzVZUVkw?=
 =?utf-8?B?TjN0bzgvcG01MVUzQm4vNFdCR1ZQTVRJaXBVdU5oUVBVUkFFZDdWUWxiTjFO?=
 =?utf-8?B?R0E2eXJGVFFQV3Y0R2lycE8vUitIS3k2NGdaVVVBRHo0bHM0VTArcTMrMTVE?=
 =?utf-8?B?TU1MRVlSS0s4c1IrUlpwdWxrMUdaM1I4OExGOUc3VVlOdGlDQUsxb2FWZGJo?=
 =?utf-8?B?d3poeko4Y2R2S3ppVjd0N1JjUktMR3pmWk9mUXM3SWFZZVEvcURhZ09GT1ZP?=
 =?utf-8?B?TE4wQUxsYW54NGhZbkFlelhUczhKVGpCcC9zTEVYQjFGVFZWNjdZaDNha2tD?=
 =?utf-8?B?N0xwMEROSEc4bUUzNXI0em9XY3BiUHdQaWd6RG5uTC9wVFdYNExHZWFHeDZG?=
 =?utf-8?B?V3RhM0xTZnduYzV6T2ZJd0lPRTNYTExSVUxEbVV1UGpYT2EvZW1hZDM1Z0dM?=
 =?utf-8?B?MTVyNit1M1JSdlVZWVhjWVd3NUx4OWU2UXE5UWtXY2VjOGhGVVY4MHFzbnRv?=
 =?utf-8?B?c3U3UHNUVUFCQjdGQzMrWVNQSWNYaWhleXhBUEFreHhPRlFCc2ZUcXZiai9T?=
 =?utf-8?B?UDA5bC9jeDdTWHgyZTkwU1NVVHhyVjJrNDYyQzR4R24wVmVlS0E2Nkg1MmR3?=
 =?utf-8?B?TlVmTXQ4YTJVUmIvK0pvSXVuUitBVWdtOWRxcG9wZUVtSm95bDhuakhWaDBw?=
 =?utf-8?B?eTlvNm9oNFFKbFhKZDFPV1A1VDRVT0YvQlVxWHhESmZJV1Zzck9pdHh1Tmt0?=
 =?utf-8?B?TGtqOTRrSFFrZ21tNlJTNG9jNFhXekgzQmM2VjhIOU43Q2x3Rk45dXFVOStW?=
 =?utf-8?B?WFg0RmFZUFB2S0RJQmFiYlZiYk1hVlJ2UG5LR3hpMHU2US9ZWmc2aGZiaXZo?=
 =?utf-8?B?RU90V0xlb2JsM0IwLy9JZ1pYSGxJY2ZmOW5lem9zRWxzMUxrUk5HVFAxZUhM?=
 =?utf-8?B?RFZieitWUXdhelBleGppVkhETi9TOWFxZzZvOFhMWi9uNkZ5ZlpHMTdxYlAy?=
 =?utf-8?B?ZWIxeW9SblVVYm1XSWozVzhGdFhPdFFLdnliNFpoOXpqOU90clRudXAvODNZ?=
 =?utf-8?Q?uhiLhI?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SJ2PR12MB7943.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(38070700021); DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MFg1Z1pRTGpscEpWcjFva2FNM3lJMVZhUXRYbWs1NlAxZ293N2N0RTIxNlFD?=
 =?utf-8?B?aWNySDhCb3NIdUwwV2MzRFJVSlVkSTB3N3BZZTFTWFIrMFlodTVmQ2t5NEVs?=
 =?utf-8?B?a2ozRHpyZmVhUGpKUmNDamRndXgxUUVvMittVWVack1DTTNtRkpFa3pFMXRi?=
 =?utf-8?B?c2xzOXByaEV4WjZmVWR0OVlRUldxYzRMNjErblFvdUI5TC96bWkxMGRRa1p3?=
 =?utf-8?B?OURlR0NWR3hHd2NrZnJpZlJyMy9HRmNtTnh4MGc0QlJ5RGZycC9YWlBHQUtF?=
 =?utf-8?B?ZHQwWUFzemk1aTRHV3ZGaURFRVREUUd1VlU2MVdFckVDdU5sbkhVaEJ4K0Zq?=
 =?utf-8?B?bEM2SGRKMzJLN0kvdmRxajdqYW81emlwT3h4Y0RwVUxvQ1JBbGtCVmdIbGtM?=
 =?utf-8?B?elBaM1RzbDBOaHZPbVFmVkljWDJJNFh0SWR4QkxjQ2NnbnVmMG1hOEEzbmZK?=
 =?utf-8?B?by9OenJvejNHb0ttZjc3RUV1NUVYdUx0Zzl1S3JPRTZGUDNySWZHd3dKdmNx?=
 =?utf-8?B?ekp6eVlERlhOQU4wVVh0N1lSOE0zOUtOYjBlcVNaK0R0NUVoWTZ6K00yTW1U?=
 =?utf-8?B?SGhyci94UHUzeHJoM2Q4aGJMK0Rxa3pQdDU0SkRGMWxtRGJObkttYWlSeFlj?=
 =?utf-8?B?TVNIbHRGYTRveEV0blFsTVUwa0l5K0loLzlRdkVsQmJYQysrY01CRk5WY2Zo?=
 =?utf-8?B?UWs5Z2RCM2pHRUEwTkFqWS8xb0k4bVdWZ3BLWUhGNGlTNUZpaTZTUzB1d1dj?=
 =?utf-8?B?UWlKVE9VT25CYituZ2RVaVdMK1lIQlRJM1VrM0JsSGh4b2NIZkhieVF6Qy8v?=
 =?utf-8?B?TXV3VXRhb0t2YzBOeTBpTmNUajIxdXYwRS9TUjY3blZsaVg0cHZDVGZVWjlk?=
 =?utf-8?B?L2tXdTU4TG1lZUtyYlBlRTNWb1pEcUlDUUdlK0xmK3ZBTm9RTDJ6eEcrUVBP?=
 =?utf-8?B?MXo4VTBEQm1OY2JUVVltcVo5bGkzeHM5RG1yV0EvOTdxYlIzV0pIUkFYOHhE?=
 =?utf-8?B?WW5ad2ZrQ3hmZnhoMURkMjBjWHFCTFFuaE5GT3NlSGxqemdvcjhwUW5sRW5l?=
 =?utf-8?B?cCtUcGQwYytQcTdNNFk4ajBOdHRjRlZxbDBSejVtUEVvbEtrRUxCUVUxOEp6?=
 =?utf-8?B?Y1RGR3FLaExDNllTR0ZwbTI5QzdOKzhxWGRNYXBHRkxZM1RwaUp6QStlQkxZ?=
 =?utf-8?B?RWhrT1NRSytPR3lvNVFyb1NUQXNCQWxQd3ZoaXBUSktrci9yM09QdEtSOVY3?=
 =?utf-8?B?MkIwb2xVSVg1MXNhd3B5d1NJY05MNXNBK0hFVGtIcGpRRjZ1N2lLOHpLMnl3?=
 =?utf-8?B?ZHNKZXE2WEJSL3FTYlR0cjVlOEtyZGlaMzhNV3NOVUxuS1p5TDluN3JyeVhI?=
 =?utf-8?B?ZzN3TGErUnJTciswSFN4YktZWEQrYUJ1MUN5MG5KSEQxa1Q4ZmZUeVpxVkJv?=
 =?utf-8?B?YmN0UlBIYUxid1pJUlRYZDIyQlAxOERWY2pGOHRRSW80QXZJcE9VSURRTWd0?=
 =?utf-8?B?S21SdzE2bWV2d0ZYRGZGNmU4RFhaT2F2UUxkcjdTbVVvZy8xRVA2SDNHNEZ5?=
 =?utf-8?B?YzZxVlo4YkVVTEUxWGlnWC91eWJBVnFZZisxcndQMFcybG5hMHlpdmtSbFJx?=
 =?utf-8?B?NFczcUdPNkw3Tkd4RE4zOUNEQ21NUnd5alhVOGNiZWVCZlBhQVpIYm5LbHFh?=
 =?utf-8?B?Ny9CQVZXOHB5V1hZdWVSdHk4OXZkQ3RCSWUveDRyRWhlRXlaeGp0UkJiRjZj?=
 =?utf-8?B?UXprUng1WFRDTDJ5MUhFQzljWnN0NmZCZFRvUTFNUnhTeWRHSS9wR2xuV0o1?=
 =?utf-8?B?Z1FOaE9ZYTlCVzJ5SjYwQlZVSVBsdlV2SGg1QmJBNFp3SDdsMXF6R0Y0Y2lL?=
 =?utf-8?B?akp1Z2l4ODMwekhHbVpLVEdlLzN1Zis4dEt0QjB3Z1RJYTRndDBpdjFnSXly?=
 =?utf-8?B?ZzNiTE1HS25qZ1pKellQNFAvaHBURTBmTTFhc0tleEhpeVJWT1lWSkZNS2xG?=
 =?utf-8?B?eENwUG9TYU5lQ05VZTlnY1Axc1ZUNy9keFNCeWV4Tllna09qcFlhSW5SNDE0?=
 =?utf-8?B?bWFZREZzQkp1d1FJMlF4YjJOVjdkOW9KTHFudCtSVmI3ZjVpU1BNTFZmc2VU?=
 =?utf-8?Q?0MaZHczh+BFRS+2LyOylZUKQ/?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <405A14D221374641BDAFDDC83D701D68@namprd12.prod.outlook.com>
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: SJ2PR12MB7943.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b0d4d99a-5c94-4ff8-21e4-08de263ead57
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Nov 2025 01:06:16.9916 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: e99GFH1G5MZAdcehLOCZEZgmNloU3WfVQMXePrDed9RLU9a/eeO160POGSp+Qi4ruuXVS5wwF/uUMIS3BPmHMg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7119
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

T24gTW9uLCAyMDI1LTExLTE3IGF0IDIwOjA0IC0wNTAwLCBKb2VsIEZlcm5hbmRlcyB3cm90ZToN
Cj4gSSBkb24ndCBjYXJlIGFib3V0IHRoZSBpZi9lbHNlIGFzIG11Y2ggYXMgSSBjYXJlIGFib3V0
IHRoZSBvcHBvcnR1bml0eSB0bw0KPiBqdXN0IHNwZWNpZnkgRmFsY29uTG9hZFRhcmdldCBvbmNl
IGluc3RlYWQgdHdpY2UuIEkgdGhpbmsgdGhlIG1hdGNoIGhlcmUgaXMgY2xlYW5lciBmb3IgdGhp
cw0KPiBzbmlwcGV0LCBidXQgSSBhbSBPayB3aXRoIHRoZSBpZi9lbHNlIGFzIHdlbGwuDQo+IA0K
PiBTb21ldGhpbmcgbGlrZToNCj4gwqDCoCBpbWVtX3NlY19sb2FkX3RhcmdldDogRmFsY29uTG9h
ZFRhcmdldCB7DQo+IMKgwqDCoMKgwqDCoCBzcmNfc3RhcnQ6IGlmIGNoaXBzZXQgPiBDaGlwc2V0
OjpHQTEwMMKgIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgIGFwcDAub2Zmc2V0DQo+IMKgwqDCoMKg
wqAgfSBlbHNlIHsNCj4gwqDCoMKgwqDCoMKgwqDCoMKgwqAgbG9hZF9oZHIub3NfY29kZV9zaXpl
DQo+IMKgwqDCoMKgwqAgfSwNCj4gDQo+IFRoYXQgd291bGQgYmUgb25lIG1vcmUgbGluZSBvZiBj
b2RlLCBidXQgcHJldHR5IG11Y2ggdGhlIHNhbWUuDQoNCkludGVyZXN0aW5nLiAgSSB3b3VsZCBo
YXZlIHRob3VnaHQgdGhhdCBkdXBsaWNhdGluZyB0aGUgaWYtc3RhdGVtZW50IGlzIHRoZSBoaWdo
ZXIgb2ZmZW5zZS4NCg==
