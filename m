Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99597C6CFBE
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 07:55:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3ADE310E581;
	Wed, 19 Nov 2025 06:55:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fYTZ+lZb";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AB1C10E581;
 Wed, 19 Nov 2025 06:55:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=huzHLBlzjUMTAcGwXQdLnsE4KhZ54pRK5SdV9SuxRKYETLAf78GFIWHFihY1cfDRtFrXe7i7/H2kaRa7ROZw3XzV20wE74pxU8i86AvXRNqK61tpACAyLbstdyR5zpsnRkJe/p8KbNl5dghZdbJPXjOu2jvcJjyzV29DXiEr4sfFFJsI8NQOjhn5y9tqthwlGfAnemsnsQ2LqphGQrkAkY0W2KZxGBV88uepR95qFWJUgMgxaG+Tf4Q54sjGx71RfFDDQQN/CZzpH7aUH1Y0ByoyYs3UtdvtsSJQP2fVRyMQ9nM1p8nLHYmJugFKDFTcrDoXCQ7fx5Hz9nnhD490Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GK2gFFVZyRFR+Iz22Vsasn2k+FGu3Pnjo0PGnHVVLuk=;
 b=vp6yf19ucqLsu7NUNN9GBTo6jtqr9QcBZCpy/uabgHMtFDJqhQ/jo4iRZM0Vzf36QY1HP8U/wX//x98PD4wlHbqfuIm9r2+hsgl9dhGSWm/P9C0ROanP5GXELd17lCY3nkkKsmjChHYn7lc+OD+dpwEoAjYRi52U7WyYfDdvo4IuaYWTdpp3LZd+UXkv2FJdXwlHIchRTZPzv4Bn1CW87B91rWQjljL5FdinhgrTCYvNoDmOQ/lfCmSGPUP/94/3JtLt7CQUXQ1o3dm22WgmzmUMdFbRtn1fB9gaXShkI7CgVSGD3sPemy9jvxQzNqviFZu3nvE4ypGgZSKhKu/IPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GK2gFFVZyRFR+Iz22Vsasn2k+FGu3Pnjo0PGnHVVLuk=;
 b=fYTZ+lZbRPHvrYEbS9cYKkOUT2c0et/SwvdR9Zi9ZGMYH99g8kUvxO7YbOkJtphi1B0Bz0T+5K+CuOSqKuPDFaAwR66aEkBfV8wfGx8z8WANMvSROnoISTuC/8kH8QAcm46MfcfN/cMkcX6lJIhxBIfEZNqj5SR4r/FmiP40jNyfYYr0HHVRSyxB4axbvCpewV9JkRITCUVF4zhsuWtgexK3Pa6v0zEERwg9wazmlj5JZDMfObCmiBypFVmOEmNRQlMg+iABgz5EpCMfabjEDCYszZmg6tQCve1SMuhT6HxM1tAsMVi4G2ZaanIP89ihXF+/AnVVo72j3WCiYl+BNA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by MW3PR12MB4492.namprd12.prod.outlook.com (2603:10b6:303:57::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 06:55:10 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 06:55:10 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 15:55:07 +0900
Message-Id: <DECH3BWOVC5D.URCD7WOS3QJ9@nvidia.com>
Cc: "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 02/11] gpu: nova-core: add ImemNs section infrastructure
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Danilo Krummrich"
 <dakr@kernel.org>, "Lyude Paul" <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-3-ttabi@nvidia.com>
 <DECAP2MZ5DUU.1SLMSVDB3GU1T@nvidia.com>
 <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
In-Reply-To: <637a93fa-fa68-452f-b218-efe17fd58d3f@nvidia.com>
X-ClientProxiedBy: TYCP286CA0219.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3c5::15) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|MW3PR12MB4492:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b1cea5d-5e96-450a-1ba8-08de273894e0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0; ARA:13230040|376014|1800799024|10070799003|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SysyYStFYmhxVy9CQUVPV2dPOWZsQlh2TlZIaG4vaTFTVVNudXo5eFRBcDYw?=
 =?utf-8?B?Mk5pcjlRK2FxcFBoUHUvRWRNT2cxWWw0T2d0akh2Sm8reXlVY1VFb29tTjFF?=
 =?utf-8?B?YXEvMnFsVThBUExtdXZNVFkxTjc3akFtaGRuSERtVFhZQ0NGR3RmeWJkbnFy?=
 =?utf-8?B?a3JSTEYwd1VlVHk5Qm9WVUdQWDZlVGNOdml2bXBIWlh5MW84czBxZ2VqQmJx?=
 =?utf-8?B?NG95ZUd3cXNlTzFYUGpQNkJIT1BxR2pYWjRaMllibzdTa2Z2bXgzMzZ3VThZ?=
 =?utf-8?B?ZWh1WFRRQU5GMGZ4TmFwa2hJNDFNaGNRY2EzT2liRVNWMks4SlNrQUJrT3FP?=
 =?utf-8?B?YkRuU0xaZFBrRWhqZ0lVQ2pOdFhUcGcrU2dRVXVOTnRtSWxKeEdDUXhMbUZp?=
 =?utf-8?B?ZnVjWjFyWk50U1F5V1FrMWc1Y0RxYjEwd2VGS2JEQktFTnlrUFNoVzVxVUdR?=
 =?utf-8?B?ZFlpRG5kR0hxOXFqbkhtaXpFRTlvWHdGREFmbTNtblZZRm5GTXNzLzlMMXVx?=
 =?utf-8?B?Skw3Mm05VFZiUEM4SmY2STdCVzc3UTc2eVZ1TmxGbDdrZ2dvcFV4aGVFQjVv?=
 =?utf-8?B?bmFidUFaTVQzYlZoTmIvYW5PRCtaV0JiUFBpSkROU3RvZUhHSlhLM09oNHFG?=
 =?utf-8?B?eHRwa2w4OVo1aEl5Rk13TUlMQU9hZyt0T2h5YUpTSGlQM0FwRllhZG54M1ls?=
 =?utf-8?B?YXlHQi9JcTFmeUJNWjVEbzYxb0xFUUl1bThUVUtsUnFYbU9OSkVIWTY4ZDM0?=
 =?utf-8?B?OEVQK2FZVjBOclZyeFRDWExBUWU2RjdYRmVJdkRRQm9STWwzNmhkZnZqTVZp?=
 =?utf-8?B?YmJyWFA3Zk1leGlzTzNlMThURlZKcWFvd3VRdVQwbjZzMzRqNmdZaDB4MVRP?=
 =?utf-8?B?T3drK3JKSkNsMWlKeG11T2pYcmo5NWFLc1hJcTU3TVF1NDZ6aG80N3RabU5T?=
 =?utf-8?B?MUk5WGhxQlVXZjFxS2o2LzU3WmE3YmFLNGdtV1BXcVR4dCtzKzJDT05IbG5t?=
 =?utf-8?B?V1BsQ2s4dkJXVElMQUU4Tmh1K09kVVF3NytaRWFiNmJHWmJrUldGWkNBeW9z?=
 =?utf-8?B?eHk2aTAxcUdyaTJBdUVuMnNpWFdjcDgzTXZmQkRranFqbXR6dG5KZzRkbkJu?=
 =?utf-8?B?MDlvcmRxbFdRUkh2L2w3M1pReG10dEdGVHl3aG1QNWUvMGwwcVNHaWhPT0x5?=
 =?utf-8?B?cU4rMkxKK2tEMHdJNWxWQUkxMS9tZStKL2JTZXlOVTlpQXpiZm9EWmVyelpQ?=
 =?utf-8?B?QkVKd3FUb1drN3lQL3NqNE51bFlkelMxRkNoQ3FHRVlsaVNjMlcwYUpHVFoz?=
 =?utf-8?B?NzJSazQ1dUFSSjRaeTdMdVFKUzU0NFg5TjVWR040TjRtb2hyWW9lcHNMNWM4?=
 =?utf-8?B?RnNDMmI2ak0yVVNncWRYRWd6Mkp1RGdhdFh6OHl5Z25aemx6SVhqTEVZeVow?=
 =?utf-8?B?WDlJeTUrNUMzcFFYNDlhbmIvMXZNYjN3bmNnM3Bzc2VYN2V0bnJrcFlobUk0?=
 =?utf-8?B?VnZydkFkMkNwSS9zNlRLT0ZleGJNZDdnYm9NSVNNVVBmazgxWDVabEJUMlpi?=
 =?utf-8?B?S3NlUFVlNUVheHhvRGJUdWFMVWRXZXBLM3UxaUVZeWYxUDJ1U1lEN1ZDL0J5?=
 =?utf-8?B?QkFTM2RaQnVmQ01ZQjBKWFJtdGR5Z0RzOVg3NTc5anEzV2lxcC9VbWJUN21s?=
 =?utf-8?B?NlQyeXNBSStFS0I5Skd2Zm9TYjQvdDJsZkJ2ODlmanFRZDMyL2lrcW12eU1O?=
 =?utf-8?B?cXpEYWdIbFVVRmNpeFBFL0QrbFJtMjZGYnRGZDV0SGlzczlRTjdZczROdmo5?=
 =?utf-8?B?S1M3RzB5SnlTejRqbUJ5dmxaeDFIMit3TnlGSHVrRFp6eE5DMmtUOTVtWDJx?=
 =?utf-8?B?eWRYMnFRcHJNRHplY1ZiRFFuOHNTeGo0QklseXdnOFlzSVFlbzhRU25RSmxX?=
 =?utf-8?Q?VMyONQmTtLD6OHuNQRghf6p81ZIWgJs0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(10070799003)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?L2RuSG1BNFhBTWRlYkdvWnc5VURxU0Q1RmNTM040QWs2Z0hvOTMwL3JDbkVz?=
 =?utf-8?B?YjZwbGhlaWpwMzJTVWU0Szd5SytISlF2Rk9NTWs0ZmplNDMrUmpNQ3ZWaWU1?=
 =?utf-8?B?UjIxblpZODRPd3BrRE9ZeVpiQ0IwTzNuM3AvOHMxb2ZhSzgzZ00wdy9wZTlY?=
 =?utf-8?B?V1FtRk9vdEltOFkrSGV3THlsNWNjd2xVU25RSWEzL1htRms5VmZpTTlyeGNr?=
 =?utf-8?B?MVFRcTYvRVNTUDIxdWN0VzRsaTBKY09PWEdsWTdMYVcxaWJKQm9IU1N1K3My?=
 =?utf-8?B?STRCOVZuRWpCZVVLZ3lFWlZsQkJMK1p6cUdMSllrSmd4R1REMXc3WEZCcU4r?=
 =?utf-8?B?WGJSd0trZ2NuTUpCOGt5S0dDZ05yRG5pN2VEV0cyYjVSbDdhVmttMm5nOHhE?=
 =?utf-8?B?YlRrUU9DdkRTMFhjK083ZDVoYW42bEg0OGxnY0x6cjhPcFMvay9tQ2lvRkt5?=
 =?utf-8?B?aXVqdGt0SU1FTGdwa05EUHRWaGVDZ2JhQytoaXNrSWJ1bE9jOHVNejZBWmpI?=
 =?utf-8?B?b3FWMmhUWThQYzNuVUxJYmJwcUV5RXRMTzhGSW1CRkdvMUZkQVdueVpjS2xI?=
 =?utf-8?B?UXpkaUQyaW9sSjdrTHptZEJyWGtPNFBjZ0J6UzF5NVluS0JwU2UrRmdCSytB?=
 =?utf-8?B?ZVE3UGFUL3F2Y1VONEtkbHNqb3ZNRW1VU3Vqb2JnWVJEVjAvcXF2Szg3YWQ2?=
 =?utf-8?B?WFR3YXJ6cUFYVUdnWFNSay9pbnNwQjV5dHBtMVB2Y2RyWDBrNmZxVi8yLys2?=
 =?utf-8?B?aEZ6Nkt0SzluQmJNUCtGN1JuZjJlYzlQT3lSN0tWcGVBZlE0b1c0VnkvaUF0?=
 =?utf-8?B?Q1hQa1RzQy84NVFIaVJ1OUUzVDRiallXNlRwVkpQVjF1WUUvc1FsOXNmRzNX?=
 =?utf-8?B?V3kxVnZFTjhaN3dNMWNpSUVNK1BuY2R5Y0JrUi9IQkt4S0kya0x0V3ZGR29W?=
 =?utf-8?B?QXNyR2I4Smd5UTVmV3crL250STNkTm5aYlUvRHQ1ZEdTVXYrRlU3UGszai9D?=
 =?utf-8?B?MWd4Vm81WHF0ZUVqRzZvZmpDcnVsN3hIZWdwRXlxUWVuVkVvMGw0cTh4M0d1?=
 =?utf-8?B?NHBZMTUyN1kvU3ExQS9YUGM3UWdGYXlZbzVZS0lZL0NJK1JZUitvcWJJNnBs?=
 =?utf-8?B?cmdjaTRjVHlrZjRMcnNLbFlvUnNER1RNNDg2UTl4bk5KZlJXMnZvZndkRk5n?=
 =?utf-8?B?VTFhQmNQVk5CTGxSRUgvU01yWTU1N3h3MkpVMWxTbTR5NmcrODY5S0diQzlR?=
 =?utf-8?B?cVVnTDdsVVhUTWg5V2hUSGZ5Um8zRFJpbGlWYzBWcnJXYWtWRTZlQTdla2Vz?=
 =?utf-8?B?cW11UG9RMC9WMGxEUEVLSnJ5elhoS0dpZWdhNG9rZ1BKeHdEcmF3OUpvUFVh?=
 =?utf-8?B?czNVaEhFVEdZWGhoajZyWXVIY3dkTTIrUHdVNWdOZUJQNm5sZDJTeE83Zkcy?=
 =?utf-8?B?Skk5Q1orTUdUN1dDbmsrNWU1RG1UR1JEbDBJOGRXdThWa2xqR1VsMmZ1a1RT?=
 =?utf-8?B?UElJUk1hMEFOR3ZpdWFKYWZJcmJyRk9Nam9ZYnFpemxpcmZRZWFrdTBwdWJa?=
 =?utf-8?B?NUZzNUVtQ295SVp3UzQxenl6Wkl1REVjZXpva3V5Sk1JRlhybUpQNkZZUWpN?=
 =?utf-8?B?TE4xdERPZUZERkRGR1NXN0ZMMEpmNU5HMlBIL3hydkdjZmUxQWVab2g0L3RO?=
 =?utf-8?B?R3o4MkYxRnJmMmRveHB6dnpBOW1hL1ZIY1V3LytXUVVTQzZ0ZXZHYWFvam40?=
 =?utf-8?B?RkNyZEJpVEtpOUYzQm1QTUY0dzFCMDVLbmhjK0tydmcwNFdkU25jamlUWStz?=
 =?utf-8?B?Y2RpTWtjTHpybWFKK0VsVDl6TmZneUVON0RLN3dBaHJnb3ZsRnl1c05ZK1A4?=
 =?utf-8?B?RDBOR1M5NGUvTE5DcWpKK0U5RnV2OFdoMGI0MFBOYmg4b0dNeWhmQlhOTnUv?=
 =?utf-8?B?N1RwRjU0MlpFL1NjcDNMZjh6OXQ2VnN2NHRvYjdVUk1qcnRSdWtHQU5WY2h6?=
 =?utf-8?B?UUIzakZHemdpZkM4TThFN2ZnOEFhQUVxV1dnSFVKbjBzWGd4V0d4cndVTHVK?=
 =?utf-8?B?R1h0TzVTRXR0dTFsZGlkTXFZKzVxLzl2M3kvN3djVHVmYlUzNEhQQkZhMVlx?=
 =?utf-8?B?b0I3ZXM5REs0Nm5raTFKZVZBUnA0aUY2YVZtWmxnZWVoYzl5dTd1WXEyRkVz?=
 =?utf-8?Q?7HbEz0DWCmjYkODQkcUhj1sDBVJzkLH7ExKgW2Nul+kR?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b1cea5d-5e96-450a-1ba8-08de273894e0
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 06:55:10.4140 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fGKG6qquTWjVize5BU+5a5Cu7+wGCNsjSE0qi5UZ7GaKj6Nc3/2P9C7DqHwBLAyCr+rNjUT+e9ycX1YxSnj4KQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4492
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

On Wed Nov 19, 2025 at 3:30 PM JST, John Hubbard wrote:
> On 11/18/25 5:54 PM, Alexandre Courbot wrote:
>> On Sat Nov 15, 2025 at 8:30 AM JST, Timur Tabi wrote:
>>> The GSP booter firmware in Turing and GA100 includes a third memory
>>> section called ImemNs, which is non-secure IMEM.  This section must
>>> be loaded separately from DMEM and secure IMEM, but only if it
>>> actually exists.
>>>
>>> Signed-off-by: Timur Tabi <ttabi@nvidia.com>
>>> ---
>>>   drivers/gpu/nova-core/falcon.rs          | 18 ++++++++++++++++--
>>>   drivers/gpu/nova-core/firmware/booter.rs |  9 +++++++++
>>>   drivers/gpu/nova-core/firmware/fwsec.rs  |  5 +++++
>>>   3 files changed, 30 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/fa=
lcon.rs
>>> index 0e0935dbb927..ece8b92a627e 100644
>>> --- a/drivers/gpu/nova-core/falcon.rs
>>> +++ b/drivers/gpu/nova-core/falcon.rs
>>> @@ -239,6 +239,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
>>>   pub(crate) enum FalconMem {
>>>       /// Secure Instruction Memory.
>>>       ImemSec,
>>> +    /// Non-Secure Instruction Memory.
>>> +    ImemNs,
>>=20
>> So, seeing how this is taking shape I now think we should just have one
>> Imem variant:
>>=20
>>      Imem { secure: bool },
>
> ohhh, boolean args are usually not a good idea, because they make the
> callsite non-self-documenting.
>
> That's also true even in magical languages such as Rust. :)

I fully agree; that's why I made the field named so its name needs to be
specified every time. :) Maybe `is_secure` would have been better
though.

>
> Let's prefer enum args over bools, generally, please. So for example
> (there are other ways to structure things, and this is just the
> enum aspect of it):
>
>      enum ImemSecurity {
>          Secure,
>          NonSecure,
>      }
>
>     Imem { security: ImemSecurity },

That would change

    FalconMem::Imem { secure: true }

into

    FalconMem::Imem {security: ImemSecurity::Secure }

If we want to use an enum I think we can remove the name:

     Imem(ImemSecurity),

So we can specify `Imem` as

    FalconMem::Imem(ImemSecurity::Secure)

which is as explicit, and a bit shorter.

>
>>=20
>> This makes matching easier for the common case of "we want to do
>> something in case of Imem, regardless of the secure flag". Something
>> like
>>=20
>>      FalconMem::ImemSec | FalconMem::ImemNs =3D> {
>>=20
>> becomes:
>>=20
>>      FalconMem::Imem { .. } =3D> {
>>=20
>> And if you need to use the flag, you can change e.g.:
>>=20
>>      FalconMem::ImemSec | FalconMem::ImemNs =3D> {
>>          regs::NV_PFALCON_FALCON_IMEMC::default()
>>              .set_secure(target_mem =3D=3D FalconMem::ImemSec)
>>=20
>> into
>>=20
>>      FalconMem::Imem { secure } =3D> {
>
> See, this is hard and misleading to read. It reads like "secure
> Imem", until you think at it a bit. Devastating! :)

Renaming into `is_secure` would alleviate that, but the `ImemSecurity`
enum is arguably as good, so I'm fine with it as well.

And an enum can also be used as a type to method arguments, which
carries more semantics than `is_secure: bool`. So agreed, this is
better.
