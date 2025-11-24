Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E50AC82E4A
	for <lists+nouveau@lfdr.de>; Tue, 25 Nov 2025 00:56:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1B42E10E328;
	Mon, 24 Nov 2025 23:56:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XBA0x6E1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010033.outbound.protection.outlook.com [52.101.46.33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 38F7910E283;
 Mon, 24 Nov 2025 23:56:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=J9e4DUw0LCxmQAUXAxPMBhawFgv9Yp32+hpAJRoz8rOb2wqTkg1DWkJSfPteB/yukwsp1o7ectioaFIgM120MpQeMcGZhu/zhl3xzFcGkxWZ/eeYEbgVhIRvk0FUF+K1ACAcBUT3rCnTpQY/suJXJq3WLOdoSdIwqXIFOkfRoWUmFv3AFqktb8LSupeArGzzykJIMy58dBX+TwdUG8h9eidZJFTq6MrgeFa5PslbYSKDlli4Bfe5yJ/3S7p6XxdN977lZj/1Dvx8fMYcub0H813Zi2buyVkEnZLf1749igSu1rhMbyuMlJDf4nmdP96bl+e4DXEIJNGQqS2S78TmkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b3tHC32ZqYimZCYwnrrinV3Xc/mpQHlrSug8kFbNbhA=;
 b=i4vtVMxpc5Pi/5ZBIILZoJDHughN+yG3nHQI87DRS8yczX3uoBMdgtVTxJItrQUGCjUPwceqnLQsE+DYIjoW/H3jZDWeRXNWJ+Q+SxBnKSuKKKfYgYEsGgGMe8pvxc7IH26zlNk0QQbGZkoytSCKqLyvo38RGGF765f9OkST4ffnKAQyodmDza4LbJhvkbRjvz75YWYWQg9nrv0t96nb+qc9mfwl1I64D+knDD+5ddJQ65QuyBKTl3C01kCsnllYh48i6tU1wrGjNhm3bjV2zOu8ByIATd2w7ynCBEfCdgiRc7MsJWalDoY0C4dEORfHSOEYUfBhrC+EB1iLFh4utQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b3tHC32ZqYimZCYwnrrinV3Xc/mpQHlrSug8kFbNbhA=;
 b=XBA0x6E1oZh3rDa1LkQW+Pjho6ERHB2ppwrc4FrX3eRF435Oz1+CJe99rEhqqjeiFXuWLKz6PoVmF6JGiKJP409ivK8wBEak3CLsenMny/00bABOHUHwD5EHp+lz4RKwxncrWSUgHHi3BvkM2yiFeDPcsqKQHbsGQ9+Hib8s0gaj715026qXAzKQ0iM1nWI4VNTXbB65busug3Eqwa6+g6Eq0CIyAsMKEhAsovivXRqdWJyU78Qswgcp2mHNiSiIj0MVvh1uQvxB2XZ28NaOimz2THCPdcl0c/mjIjBRbXcNV9J6/sO7PDbtZ08InhlV76FGygNo4XiPWBwIJHKcJg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ0PR12MB7457.namprd12.prod.outlook.com (2603:10b6:a03:48d::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 23:56:09 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 23:56:09 +0000
Message-ID: <569b40c6-c234-437e-a894-fd3dbe9669a7@nvidia.com>
Date: Mon, 24 Nov 2025 15:55:57 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 03/11] gpu: nova-core: support header parsing on
 Turing/GA100
To: Timur Tabi <ttabi@nvidia.com>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 Alexandre Courbot <acourbot@nvidia.com>, "dakr@kernel.org"
 <dakr@kernel.org>, "lyude@redhat.com" <lyude@redhat.com>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Cc: "nouveau-bounces@lists.freedesktop.org"
 <nouveau-bounces@lists.freedesktop.org>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
 <20251114233045.2512853-4-ttabi@nvidia.com>
 <DECBWUFEHV5D.3O0TH2AL775C0@nvidia.com>
 <fb673d50111ed0989ec8ba2a245e89eecaeb1864.camel@nvidia.com>
 <272631b2-77d9-461d-ba24-1df218afdc10@nvidia.com>
 <d900795e-bc56-44f9-9768-c22527e67f0f@nvidia.com>
 <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <4bd83208dad65786b386002e501bdcad36d76da3.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0031.namprd13.prod.outlook.com
 (2603:10b6:a03:2c2::6) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ0PR12MB7457:EE_
X-MS-Office365-Filtering-Correlation-Id: 17d8ad2a-2944-4b9c-5411-08de2bb509ea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?bGJLRjBmSWk3bnhIWmo1S2RuZ1VlUXp1V0VSOTN4ZFh6NzNEQmZCQXV4UStv?=
 =?utf-8?B?WFhsUUxZSzBWNTFJZ0VrcVZpY2dmeU5CeWJvdG9mcDVIWHpSUzlDTGdzWU40?=
 =?utf-8?B?a2Vja0xrTEZ2TUt6WkRRWWcxNWJuU1lRWU4wSzZvajhaRUJNbFdKSTlqb1cx?=
 =?utf-8?B?NldMUUNBREkzb2FmK0pKaFoxYlFyOWZoalZIYTlzT1FJM29SSS90SzVMaXJY?=
 =?utf-8?B?T3dhYlRsdzlKelMvSGo2bmVIQksvOGMwQkJDbFVUekcxVi9ZRUoyUyt1eVVn?=
 =?utf-8?B?VDVJRTVEc2JQY2lRTC85RnpWQVZVcDVNbEpkMTA3MGxURGZ4WEloU0cyZXRZ?=
 =?utf-8?B?bkxRMktFWmp0aVd1dDBYMjlsSDE0OXFrK1IzUllMbFFhZkNSMm1VYkt0Ti8y?=
 =?utf-8?B?ckJQYU9RVWVYN2JLcjdlL0dHZlFiSFF4eEVoeitRcE85QlJjVE9FcCtSWDAx?=
 =?utf-8?B?TVlaa0NVWU8ySVIydWwxbXdrZm95c0M4M3N4TldnV2dadDI1RzJtUE1HaDl3?=
 =?utf-8?B?VmFKejBPTXBRbzM1NFZNbEZpQ3BlZS9pUGFwT3dwaUVOZkxYY1kyeWp5SWxT?=
 =?utf-8?B?Q1RFTTloYUVIdDdCY3JGWXVrN21yZnF5elJIL1A1aXhTMkM5djVBdTlLQzMz?=
 =?utf-8?B?ZjBMM01rV2RGT0R2M1lXVW9xWnZGUnVVMnhUWndQN3FnbDVNbXoxUkhzb0xk?=
 =?utf-8?B?YnRqd2dScHFkOXJiaWRiUVlIQXJFVEZCaEJ2bGpWZ3gyZ3B3OHlTaFVpVW9W?=
 =?utf-8?B?WWtCbGxFUG4xaEVOU0hiemxlcHF2d0RFQWNFVC9xWnkxN0FubzRkQlc4MGk5?=
 =?utf-8?B?anI2MTVLVDkyanJRK2gzSjR3Y1N2QVFtUTVWaGpBZWVkclQvaHZPSXRnbGhX?=
 =?utf-8?B?bXQzRkdIa0VPK3VvaUkzMVZINzU3OXFUWFNoalFMbFlzY3RMSHA2VnJyYkZk?=
 =?utf-8?B?Yy9DL2NrZjJySlRNa20vd253VzNWN3pSSjdiaXNDMEFuTGQxUW9vZVFLNzFv?=
 =?utf-8?B?U0R4LzFka3hFT0dzVzlWaWNGRnhOR04xYkxpYm9kd2xRdkx1c3FqZm8zV3JZ?=
 =?utf-8?B?WWhEVkFXZkJoQTR4V3dUKzBFK0FDS0haV1d5ZDdKU0l0cEUyV2s4TWRzcDQz?=
 =?utf-8?B?blk0NytZcXM5ZEVmRjNubXFBUXlQSTNCMDZUQlBWRy9pcklWaW14OGpmN2JJ?=
 =?utf-8?B?OUxNendMSGh2V0lTc21oamhNNHp2dUJoeW15TnhtcmRQcDdkekpTS2xkNm1y?=
 =?utf-8?B?SVRMSHZiZGRjTXB5WWdjLzFCNXpRNkJYaDFzSit2b2RhQ1VpYnY4WHFRNTUx?=
 =?utf-8?B?blNEWmZEaU5zVzdCblFtNGVHTStQT3VCeVVLWTBYZlJDMUUydlJiZWlnQkhN?=
 =?utf-8?B?YXJsRExCSlNkQXNKNXhPRFFoaGhuYTVYaGtuNncvYmcwVVN5WHYvTkU2VTAx?=
 =?utf-8?B?L2h3V01ORWRjQ0RYZkVzcHo1TUZUdmNQTit6R3VsZkMyRENmWDVYRjYrdG5i?=
 =?utf-8?B?THdxc2JYdE1xRHFrZ3V6UlFHcCtLckxVdGxRL3l5MVNHN3VOSmRvTWViZmt6?=
 =?utf-8?B?cG1vbmxqS0FTd2RtV3VabkdVRXlHRW5BandsUVpKWldkbTMwVVRpV25BVFgr?=
 =?utf-8?B?YTJtNkRTN0sxSjhEMFVDSTdoa3JaZUJmNXZibmdhc2d3NkhDOUR3Zk00b0tw?=
 =?utf-8?B?ck1SeHRWa1JuYnRHVGZQYU90SEM3SFZyLzRPaUVhSlBHK2ZJRTBSbFFiQ1Rp?=
 =?utf-8?B?cHRFUHVJb0d4azJJQktpeGlEK0F1ZGM3RHBTaDFxdnVIWmZLOG1rVWMxZ1FE?=
 =?utf-8?B?STM4M0R3ZU9DREJXSzcvQkJreVdQdnB3VllOcnNlcUxwdHpEVkwybWFjTk9S?=
 =?utf-8?B?VE1PNE53d2poNU9IdUpQWHJ1RHpXZGRHWDQybmhoay9sc1FhZXZvaUJTRmEv?=
 =?utf-8?Q?D+2XG9V0+cV6+hP7K0kQfSJ/ds7ayxS7?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TFYydEUzd3lsWW40TDJCV1RGVVN0VzhSbytqeUxJYWF4R1J2MHoxcnhkS0Yw?=
 =?utf-8?B?c2IwaWxMY09UNzBnaStjS1pTS1NGL2p3V25xQkdIVTBDdmVHOEFCNVMrMU1i?=
 =?utf-8?B?eklDTW9CNlczWm5RQi9QakxuRWVKK2lxbUwvc3hkT0p0Myt3ZlFpUEFxcWZj?=
 =?utf-8?B?ZkNNRUdWSDVYVVNpRXFHVEV6Ni91Q21pdGVEbmpxVjh5czVaVGV6WXVJNE00?=
 =?utf-8?B?cHV0QlNzUUg2enZETzdMSmF3d0lvKy9XclhtUDYwM0V5cUtwcVArbHg2TGVy?=
 =?utf-8?B?anBqYS9DWFpGYmRFc21FZEJodFNCTlZBVE5va3BxSEhCUWs1L2RWN0F3Y0Rv?=
 =?utf-8?B?Y040VWtqd0luUlJvSStsRTJPZHcvL1EyekVOYXVYVTBBNjBDNTFFcndYMi84?=
 =?utf-8?B?a3dIbHRZeHRYbTBHNXBkdC8wYnAzb0pwSGxJOUVNLzlnMWw2WHZNSFZhOHFr?=
 =?utf-8?B?WW92cVhwN0xwUnJxMDY3aGJoSUxudUNzbTJaajVQOGNXd2FTZFNlWlhwWjFs?=
 =?utf-8?B?OVZkSFZkZ0RlODVzZTdqTHRLSlQyY2Q5SjFabXJaZDhsTW5talRPdXNhdHlo?=
 =?utf-8?B?b3dtbmxmbWJubW16bU9KNzQ3ZXZkSlZrMXZNUDNXdnB2TmF2Q1pDYUNjZm00?=
 =?utf-8?B?ZTgrZStocWhwOXFadjF6ZjBDbmFoSy8zZ2FwNTh0MEFjM25vTUt2MTZTdzJX?=
 =?utf-8?B?eHQrdFQ2azBpN0dRWENkdDRKMnNuNCtxcWpyVlplUjRoZFo3Z1NnMmJ2eTJV?=
 =?utf-8?B?QXNva1hleEV4UEQwazdNWEJHbWk1VDFZeWI4dVRscGQxYjAwY2dvTG41dlR3?=
 =?utf-8?B?c2s2TlVuWjJFWkVsOENyakxVMUxZby84S3NpT0JXZHgxRHpyRU1tbURYVkxS?=
 =?utf-8?B?dVZzVmNPclRBNkswSkU3SXZHTXc2ZlBod3J4ci81c3F4Yk1EVDU3UDk0OGQ3?=
 =?utf-8?B?a0FuUXlGN0lzNHBBUGErR0N3Uld0YkV1SG9lRTFEMTYxRFhzemJEYlJOMGdm?=
 =?utf-8?B?K2E2dCthRzdEVkxtTXZnREkva042QzhndXdFTENjS2ZPRWF6bTdPeWVReWZL?=
 =?utf-8?B?akxlSXhNY1N2YzF2ZGU2ZVBUb2E0d2Y0WlF4VmV3LzkrcU9hRnJuVWhZclBo?=
 =?utf-8?B?YUtKYjBUUXR3V1lHYTlZUEJTMHF4akJQUFc2WEJ6ekVqS3pFdkxwc0dNT0tU?=
 =?utf-8?B?KzFhQm5VaEpvQ3VoM2Vma0x0ekFxYmdqbjcvWjB3WCtkNFVhNjJPSzFlZHB4?=
 =?utf-8?B?OHVKNzhqd0lLV1phQWdncklsOEZsZFZyN2dvbHZpay9LdFc2aE0wejVVYzFj?=
 =?utf-8?B?S3VyeXdTVTY1cEp1VFZoTzQ2S2RnSWRqWHdEQnJLKys2bmx3NVI3b1RyNVNl?=
 =?utf-8?B?TWh0QnAxd1RwTHZrcCtPZXMzZVdTdXIxMDlCTDdVNVJOM1BjOWVkaWRHalZG?=
 =?utf-8?B?ekR4S2tqTzdobHF2YWNlS0xwTlQ5dVBKZmo5UEZ3SHd2TWdldjUxZjh5L3Nm?=
 =?utf-8?B?NVVrNDU5YnNuaWxZNXRYaHR3VVIrOFVQV1ZxL094ek1XazY4NVFSVW13ZC9M?=
 =?utf-8?B?eFBFb04xN0hkd2VXYWhuWWRHbWlIQjJIbjVNRUk1N05Qb2VqazJJWXhYa3pE?=
 =?utf-8?B?UnVrc3JEcjlCaFBKMkhKNEtjeDhrblVjVmxsWlhqSGk4N0FrK2l1OHd4QS9F?=
 =?utf-8?B?a0lHTkpaOG1ic0g2eDZ5b0ZmQnhwY25qNXNFRmFUeUx1MFdXMGFqczhtcUpQ?=
 =?utf-8?B?L2JpWXlPYitkMjVkSVUxblU2RENEcUVZdlpHeHVGU2hMVDJHZ2c3dEcxaWw0?=
 =?utf-8?B?VTZvc2JOQTVOTWJrM0RYREN0eTJQWSsyQ1VqUEZTak5INWFib3pMTGhzN1NO?=
 =?utf-8?B?MjhMTk9MQ3lxWUdFT2o4RGxwdHhDcFhJeldMZm8xdTg4aklmeG43TTdqbjNi?=
 =?utf-8?B?b1J6UFh2enRUR0FGVFh6RWVLaGM0N0ZLdkN6TzZhTTN6S3pZcWRRUWZhOFB4?=
 =?utf-8?B?K1RFWStKRzBQT3ZzYk9SbTRlVHFyVXp6RGhaaUNrYjFUb3RzV2cyaUlmNktO?=
 =?utf-8?B?S1pMYTRTekVmeGNLd2N4b0czQTI0QXBhVENnTUlhdGhqSUJXNjBIc0lxMWxU?=
 =?utf-8?Q?B3mpxAEem1UuQgZ82f4ZPkfcA?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 17d8ad2a-2944-4b9c-5411-08de2bb509ea
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 23:56:09.0205 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EKRxKNqLGe5+YLb0AY7QxXmPMLyt0OnULiXdeYtvChcCAFrtUVloTuDjcxlhkG8ZjVg40+TjaNtZ8N2EVCXHkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7457
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

On 11/24/25 3:47 PM, Timur Tabi wrote:
> On Wed, 2025-11-19 at 15:10 -0500, Joel Fernandes wrote:
>>          sec2_falcon.reset(bar)?;
>> -        if chipset > Chipset::GA100 {
>> +        if booter_loader.flags() == BooterFlags::Secure {
>>              sec2_falcon.dma_load(bar, &booter_loader)?;
>>          } else {
>>              sec2_falcon.pio_load(bar, &booter_loader, None)?;
> 
> The problem with this is that it conflates (Non-)Secure IMEM with using PIO/DMA.  I haven't looked
> at GA100 yet, but it's just coincidence that platforms that have Non-Secure IMEM sections also don't
> have (functioning) DMA hardware.
> 

Hopper/Blackwell+ use PIO too. So the conflating could be a real
concern.

thanks,
-- 
John Hubbard

