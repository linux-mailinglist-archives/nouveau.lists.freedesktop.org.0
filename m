Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D74ACFBC1C
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 03:39:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0683C10E1EE;
	Wed,  7 Jan 2026 02:39:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fGTXdSvQ";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 78C0444CA0;
	Wed,  7 Jan 2026 02:31:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767753063;
 b=eiNYlCa6nkOHwVMMiKhVh9qKUvnhz+sGPD18kFMEefE+t9V8l1IKma6wOW9JDLfICPxl4
 bsK5W4o9D6/ZdoVzUjC/EkTWKwbLu3pv6fSfc09WC20fmrynPGhPAzyGC5kNlPedSCDhgW7
 RAZd06QxUm/81q+dfzXS3VmKoldxQJq3stf/KUhtzD4iMose3DytxoDp+rn8lHPF1ryBWbC
 JJuawRkMZPtncZc6JglcukJXAsRPYoMSk1+VvAQFhtCxkK/w3UFyiDTvWLBrPNtIDoQ7jO0
 gp16RzMC9DdKICC205OGcEsn3SUtMWVtXj8lfVgmZZqFuR2mcRHy+Tv4qqHQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767753063; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=2GjiE+qb16g+AkbcRqMvAt8hXBl9SMRdz9zMpFZnbcM=;
 b=ST21fThzHwQyJaWO8zEvFD3TE5bz+YwgFghF1DvxK5X5CPEIGXSgyBLYo2KJRp6cB0qQS
 ihvBdxv/1pZz8hh7uaxB1xFjhBrODeX+0mIiQgMwsi5O19GHuwo1jQiUm0aJP+DoCu4nGys
 ypYaa59yaSqB/r+a4BXRMZIm3RvHMW57fSDzmH/nUXlXXtGBajjuVxyWRyj0FyfsckIS7yz
 6nISj7uN4fIjobsLLHrFqKzx1ZmZQEzLGa6CnKxU/0JhJ7cXStrWcVdRhr/M5sJdUjv/kB9
 8lfGSRaHNgd5YBjdSzuuoaRBYr754OZq00ZMgIvpKAsi+mw/8ifIUYbSk5cA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 69A7744BB6
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:31:00 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013047.outbound.protection.outlook.com
 [40.93.196.47])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9213A10E18A
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 02:39:14 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d8ErUdrPsZc4LcLUsPKcOXwB6g+E/j7z24r1GEe6MLl9zWTSuzBw2v5p7zplI/wn50E8/FZ8qWyugekR9DJk6KcvP0251NKM9xj/9vdDrJhAiaf0ZM+0j0KB6nPD8Za04qw0WmbFp041QNcQV4t7ak320uTW6Xe3ctXNE9DnE2LtjTCya4fqczv7dOfQhiRwEz1xbkjlo5y8LwuqXrGmPjg70qREO5BWCe60FjBk94NlRmWs4XMO8/aDxfWF9g4CBzMGG1a6SXd+95tMcnF+LKjOGEtWzuJGirY2ZQyg1LDo8kGVN5LYf5WHuZ8gE6o5m+fJExaOzPHSlafSDSpGrA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2GjiE+qb16g+AkbcRqMvAt8hXBl9SMRdz9zMpFZnbcM=;
 b=K79lX+V8XOdDXC2/o91z2443G5s16i4vnAZhhVVCobYJeofOhsJj8qBIm7hZlILFPpNkTvtzurXY0pKPVqnTAEDm3Byh6ZoK7u+RsjQozKFYybtih39RMY2GGKIG/R19DTjxnGNZJx/WZCVql1JYAE7b4F3ApNz4/n0rYzGPxk/ONcApfqn+kCKmokpi3JE1AoF+jx37wpRRBqdl0wUmuwxR7fHtfd4Lh7Wo0/PSGveRKrwUC8qpyMHk4Es2dU8JZAhRAcmfbA/lxIsFhf6sH0fQIrysRMSXZEDQERVcn9fvMnrN/b7e3XjTotMH4Kpfn4f91x+y3hrNU7m37WGrfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2GjiE+qb16g+AkbcRqMvAt8hXBl9SMRdz9zMpFZnbcM=;
 b=fGTXdSvQ3tioF8G9kfwuCmKNQIY2EwCdExrkzR3/332Exa+yANwWfNs0gnH8A1xO7qf090YPpwkoi8zjtd3wNdSq4/tjIxFkEnIZnZcu8v7J0ZuJcWJCMCLKlfwcHk1rxCVYrSJja/PkHmJfaWVdco1Hp1HlJ2bF6cUK0Dto7k/M4DcdfFJJUx2LkwnkAqY5gUYORym0tTqeYrf78LG/JZLwDyfcSvb2IRLAF4SNtlLNCd1MzCENX62rZQT8gz7DaPnhJ5ZYfNuUjTgF5ZSpOB0pcjgHYLiMisPrJDUvCpXOrFpdWDvi+wHfXo4QEUTyHyeQIuYL1YhzedfkEkcp1A==
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB6881.namprd12.prod.outlook.com (2603:10b6:510:1b7::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 02:39:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9499.002; Wed, 7 Jan 2026
 02:39:10 +0000
Message-ID: <f4d26971-bf10-4370-8994-13ad962becfd@nvidia.com>
Date: Tue, 6 Jan 2026 18:39:05 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpu: nova-core: add missing newlines to several print
 strings
To: Timur Tabi <ttabi@nvidia.com>, "gary@garyguo.net" <gary@garyguo.net>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 Joel Fernandes <joelagnelf@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>,
 "aliceryhl@google.com" <aliceryhl@google.com>,
 Alexandre Courbot <acourbot@nvidia.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>
References: <20260107012414.2429246-1-ttabi@nvidia.com>
 <20260107012414.2429246-2-ttabi@nvidia.com>
 <1d8c517b-1e25-406f-876e-dac4e8b8ae78@nvidia.com>
 <38a599e8cebb7209cd8e86135794f1d8755d7a7b.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <38a599e8cebb7209cd8e86135794f1d8755d7a7b.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR05CA0178.namprd05.prod.outlook.com
 (2603:10b6:a03:339::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB6881:EE_
X-MS-Office365-Filtering-Correlation-Id: c7ee9699-9261-4a9c-79f4-08de4d95efd0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info: 
	=?utf-8?B?cnpUTVl2bXZ3ZDZzQTVoTFhCLy9xeGZGVUV6Rm1aejFnOVUvdWw2S2lxQ0JO?=
 =?utf-8?B?bTFsd2ZoaFdGRHg4blpFN2xEZTEza2E5UlJTMTRYL01WbUZoVEFlY1QvZWxm?=
 =?utf-8?B?ck05M052bnhoMUh6TmhrWEJiWEdWUjhURmdGa3BNVHdqckYweEYyd1FYWmVW?=
 =?utf-8?B?S09GTzN5TnY4SHdEdUFUdTRYU2orL0NMTDVWeGhhUEhreGxRdG95N1NoMzNi?=
 =?utf-8?B?ZmpQTmNvQmtzOGJ5eGNLT1VBc2Fld3lNM0NoaGpQcXhtaXlFQkt0aVprZnJw?=
 =?utf-8?B?SG5MQW83UHF4b1RLOFp5SHM5N2lnZlljUlRkTDVQWks2RVh3MVpnMEwzQUo3?=
 =?utf-8?B?NTRPdlNLbUZtS2cxTExVRXBnRWFBYkU5ZitvbmdxTFBlbU9tNTNoTzZ2RUVm?=
 =?utf-8?B?Z2JINytmRm0rSC9INktHSHBGQi95bWh2cVhsMDFvTWNDSlo0UW9renNyY05E?=
 =?utf-8?B?V1Q4YVVoeHBNenlFbmJ4ejN5amJXNUE0UEJqQ29BT2oyR2ZRSitweDJsWDgv?=
 =?utf-8?B?L1lmUEc4Yzc4VjBRQ0NOK0c0aDl1Smh0S1B3US9uUjEyaXVWdnNYTG80QStG?=
 =?utf-8?B?Y1l4OUhNa3BMVGNTT05RaTlIcW9QaXc0SXc0Z3IyeWNmWDJzTXpyeUJ3SllT?=
 =?utf-8?B?di93QTBqMHhZdzIxblBtQW5aTENQL0Iyc1d6a3UraE16RDVVZTlMbzlZOGNW?=
 =?utf-8?B?TFJGSzlJY0wwdml6YW1YTkhuN29aelRoVnFockRZMGRHck5jbjZVNkhxMDZL?=
 =?utf-8?B?WnpJS2UzUVJwcHQzT09FN1Y1L0FkbUtUSm5MQjJUeXdCeU1qRVhXb2NwR0Vj?=
 =?utf-8?B?dE10K1Ywc0JianVoOUNKbytPRkNIWCtpVklQL2FFZUtpU1B4bVFOMEV0dGpv?=
 =?utf-8?B?dmFOKzVONlBmVmdZM3g5RE5sQU1GSFFKdTVvcjNxOEJpL0s1WFJQNEVXTHVU?=
 =?utf-8?B?NTNqbkdIck1TaFhkQlpqLzVNR3VjSnVyVTFOMzRWdXBXclJSd1hMbHRVcWdj?=
 =?utf-8?B?WEdaNzN1RDcyZnFTN0F3R0hOaVVKaXkwREdUUk1hYTc3MDdhTmE0YURyWkZ3?=
 =?utf-8?B?SytPVDY3ZW81QVlicEFFdG1uZ1pwSFhvelZJTzQ0TGNOWWJUYzIyZkkxRjE1?=
 =?utf-8?B?ZU5lZEtuNlRYbnNOS0ExN1Z1czlxTDliYzd6akt1QmxRTjZXeEEvTHBFT1Q0?=
 =?utf-8?B?T2xOZGVPZlZwb0x4NE4yWHVRMHk4RnBidGQyRDF2V0g4c08wNmoxUDZxMmZ1?=
 =?utf-8?B?ZnExV0RoSjFNQ1RkczJDKzhqRkFYUXF5cVdBMWY2U2ttbkJ1S1A2TnNYcmFh?=
 =?utf-8?B?SHdObXQ5REdxWU4vdFpLYUYwOGEwT0N3aHdzcnNPd2JYaGhHejdXYlVxcjVY?=
 =?utf-8?B?ZDQ5WjZ2TW1YRk1jYXE1U04vTU4zcTZtRXgvR0xHUnlZaTFqTFlXMm5PL0tv?=
 =?utf-8?B?Sk1tdERmaW41VFFMRXNkU3BCdEhpUXpoVldhQloxYlFUb2tuS3poSTROang3?=
 =?utf-8?B?QWUyYW4xc3NIVTlhU0tKSDhGRFZUL3kzdUVMS1hLa0lOcldjVDdObkJ5T0FH?=
 =?utf-8?B?QWtmQ3I0K1RKMlZUdlZ2cVByOFpjSGJxWE5oVW1kdHZPRmJndUNIMkhqQmlI?=
 =?utf-8?B?RWR6Q3B2Rk5jQ3dZaGl3OUNpYU9OanpkZkxTYTM3Y0hrTkZGSG1TTEpHT01x?=
 =?utf-8?B?NU1SeFZjVzZXN3dhS3Y0NlBuVHFsYUhMdTlEMW9xWHdCQUxnTVg4cGVpRm9s?=
 =?utf-8?B?d1FnUVQ5NmlRZDJkT2Q3UWVLS1A4OGZURG9OZzRpaW5uaWNxWmd4bjN5NDQ0?=
 =?utf-8?B?SkpjeTZGNFh6cWlCOG5TNmR6dW91RDl0OFBTbkxweUZOeENMeEJ1eUtYZjBO?=
 =?utf-8?B?aVJiNVB2OHIyVGdFZXlJTkgxRWZXZmdhblMxcEJ0TURXL3FIOGtPYWg5YlAx?=
 =?utf-8?Q?pSl/BtvtHTjDRblNOPAlBGpJw+h+DTOG?=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM3PR12MB9416.namprd12.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?UzVhcWZXQmZkTzVoUVVaV3VZSXBTRjFQNEhmTTU2R09yNyt6aWEzOXRPQ0x3?=
 =?utf-8?B?aTd2RHhlOHpuSVhyMkN2MWJYRkNGdXRrVlREb2JmM1pyVXRVV1RWRXFUZmhG?=
 =?utf-8?B?bW1TaGRPbzloZHhuYXRwQi9lUElXcVJ6dkgrcWhZN3d6cytveXg3bXpsWFdm?=
 =?utf-8?B?d1R5Nkl5b2ZKdmJWWVlwMEFpdmZLcXZudkZiM21IckN4dGhLUXA2NmNmYkZH?=
 =?utf-8?B?ZlNJbW5KV0dnYVVoaHpmV0MwZXNxemJYdlFhSFpaSUFqS2h1L1ZldURnRmFI?=
 =?utf-8?B?K2pDOVBtYjdnTFF2QlJ3eDdTN09GbHhVVHBiS0o5UU1MY1VIaStBYTNnd3BT?=
 =?utf-8?B?TG5Bd2pHZUUzNUIvWnQ1b2JtYkVoVzlJcDI3RVFVQzN5WnBFNm5tRWh3S1ky?=
 =?utf-8?B?dFJPWGxtY1E3VTdjV1psYm14Um1NenE2LzZsQ0Z6TUlvMVpqZGFUOHNNR050?=
 =?utf-8?B?UzFBNTdkYzlQRURXMXpkY0tvNVVWZUVsZTJ3bHErWDE3Y2xWQmhTTkQzWEo2?=
 =?utf-8?B?SDlrZHY1cDNVOHUxQWh3WU9ueXB1Vk8yNjB4dzJsV0RaaEtFaFF1dHBBV0lT?=
 =?utf-8?B?V0hvQVoyMVRHSzBraW5GNE40VlRsY0lXSGU1bG5PeE9QUGZPMFRhMDIrQVpk?=
 =?utf-8?B?U2xmcndCai9XWUZLUFl5UnpVeVBrdCtQWk1ocy9TcTNqbVExTUVuN0UrdklF?=
 =?utf-8?B?VGxtZjVIaVNzQnJjUWQvVUljaE1aTGNnczRZTkI5ejQxUlJRY2RobXJ2dnhV?=
 =?utf-8?B?aTRmUk1OcjVLZG5INXlUMGQrNXNRT21JSUdFRDhCTHB5SjE5QThnMDhmaEQx?=
 =?utf-8?B?cEowWHFOODllTVZHRmdCTkRseFVwVXVoL0VMNVBkRnVYRUM4TEtYL2ZYVC9Y?=
 =?utf-8?B?d3UrRVhZYnA5SGtxT2xBQ2pMM2Z2aUcyOWUvR3d5NlE0VURQVHQ1elRFZWpS?=
 =?utf-8?B?b0VwWk1lU0dGRUphRW5yTWxpYkxmUEpDVmNrUk1vWXpmOG82TVhJQk5vdmFt?=
 =?utf-8?B?MzFIK0NydERTVEwzU2c3bXZtV0xrY2VoaEJXZi9vYjJnYnJreVVyRlpCQXY1?=
 =?utf-8?B?NFh4QkhFS3FwSnFLdnNzVXd4K0lVSkw3ZG4vN0dkbGdWOVZMeldnMjBQK1hQ?=
 =?utf-8?B?ZzJqeGxabXNHVDVjRFNvcDh6UTRuQVM1dU1NdUM5V2NCRHM3YjZRb1pnWU9h?=
 =?utf-8?B?aDRLYk9wQjJvbTFWTkVNajZUdGZSWk9zRDkwamVtWlhGWXE2anMyLzVrZ3Yv?=
 =?utf-8?B?aEgzQkdRTTI5UlBzRW1aK3piUnJPL2lBUnpiSUM1V0RMdVBXd1FUTGN1eThJ?=
 =?utf-8?B?UXU5R0lJd3gzK2lMS3BFVjJaNnhHMmQ4RXExV3I4bEZKR0ZNMG5lRkhTNDQr?=
 =?utf-8?B?TkMyVmxhOG43LzNvMDhQa2RuaFRRRWlwc0ExKzQwaExjRzNFNVdvRmFoeDVG?=
 =?utf-8?B?RlJYMmFDNmdZNXdpY0tBODg3NXZaRjNNK1BlbGJmYUIrRTlwMFpCMWdpb3VR?=
 =?utf-8?B?U1kyMHVWcktuT2pWcklMcDlrenM3U1htcmc2aWF1M1FGeUxWOGtrb1plODZi?=
 =?utf-8?B?Y0l2ZE96TUJvdW93ZUxkN0tMeUpJQUUrOVhvSThZZW0vT05kRW9sVnU0Nm43?=
 =?utf-8?B?WkJtaXlwK0xrVENWQUt5V3RXaGhNUWwzdWNxRVg3NDlMNm5haExsMDJWbkZ4?=
 =?utf-8?B?Y2V6blR4REhITUR2VFdqZk1MREs0bkRYUnZHNGlZeis4dWlPb0pZcmlIM05D?=
 =?utf-8?B?UCs2WCtnRllocUJzL0lIanNTUHhFVjlFakNuZUhnYnhxNFZQR0k4eGN1dEln?=
 =?utf-8?B?d1pOc01tZHNpL216VUxHWmZ1bm44QlE3VjdrU1h2OFRBc1B4TitSWWduODd0?=
 =?utf-8?B?T0dsUjgxSEhiVnZMd3J0cmdzY2VFV2twSWF1L3VIMEY0N0grZ2lZZ3hVclFz?=
 =?utf-8?B?ejdrL1JYZDA1djVnSkdIbjUwdkV5ams5VlZBN1N2NkJrU3p1ZE5CZXlHdE5H?=
 =?utf-8?B?OUpaTStPR0RPWGtKVHZ3cDRrTTB5UUxkSzBKK2FxaWxMR2F1U2c0YXJzRzlw?=
 =?utf-8?B?NTIwYlRLdVdib2ozaWpBTVlKNGp0QTVlRjYyUG1wUmlOM1VTeVJaSTZKMExz?=
 =?utf-8?B?cExNNTVqbkt4ZitrWUx4UHhtemFXU0diZlUzeWhkZkpEZEVFUFpwUGFNdE4y?=
 =?utf-8?B?UUxjSlF0S1pQTDl1WWxnWFNMcGlLY1AzWDBuTXJ6amxUWk80UDNqSEF0Mlo5?=
 =?utf-8?B?TTVIU1I5ODZ2N3ZKMEV1TXVOYXpkeUt2NFpKY0xHY25Ib2c2Nk1uTG1QbGlr?=
 =?utf-8?B?MXlUNmEvNGNNcVNUL3NtMEIrMll3ZUt0NE9sdmxGYzBhZmN1Kzd2dz09?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c7ee9699-9261-4a9c-79f4-08de4d95efd0
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 02:39:10.3427
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 
 s415Cp2BLWCUiGfCbKuhnOKUY6SEUSlyUsedzevshANFuBT/kOVUSjuLWTPw7HFB9R+KMbOP+9L/OjVAyvd5Ig==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB6881
Message-ID-Hash: MSAWFUDJTHBRLHJWUTEPLOYK6UITS3BY
X-Message-ID-Hash: MSAWFUDJTHBRLHJWUTEPLOYK6UITS3BY
X-MailFrom: jhubbard@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/MSAWFUDJTHBRLHJWUTEPLOYK6UITS3BY/>
Archived-At: 
 <https://lore.freedesktop.org/f4d26971-bf10-4370-8994-13ad962becfd@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

On 1/6/26 6:21 PM, Timur Tabi wrote:
> On Tue, 2026-01-06 at 18:10 -0800, John Hubbard wrote:
>> nova-core (dev_*!) [after patch]   39            32          55%
>> nova-core (dev_*!) [before patch]  32            39          45%
> 
> This can't be right, because I checked thoroughly to make sure that my patch fixed ALL dev_xx
> format strings.

Did you? haha :)

drivers/gpu/nova-core/fb.rs:81-85

                dev_warn!(
                    &self.device,
                    "failed to unregister sysmem flush page: {:?}",
                    e
                )

drivers/gpu/nova-core/gsp/boot.rs:83-87

            dev_err!(
                dev,
                "FWSEC-FRTS returned with error code {:#x}",
                frts_status
            );

drivers/gpu/nova-core/gsp/cmdq.rs:616-620

            dev_err!(
                self.dev,
                "GSP RPC: receive: Call {} - bad checksum",
                header.sequence()
            );

drivers/gpu/nova-core/gsp/sequencer.rs:391-395

                    dev_err!(
                        sequencer.dev,
                        "Error running command at index {}",
                        sequencer.seq_info.cmd_index
                    );

drivers/gpu/nova-core/gsp/sequencer.rs:401-404

        dev_dbg!(
            sequencer.dev,
            "CPU Sequencer commands completed successfully"
        );

However, you *are* correct about the "this can't be right". I had a bug
in my search script. Updated numbers do actually lean much more
toward using the \n on screen:

Codebase                      WITH \n    WITHOUT \n    % with \n
----------------------------------------------------------------
samples/rust (dev_*!)              39             1          98%
samples/rust (pr_*!)               29             6          83%
nova-core (dev_*!)                 68             5          93%
nova (dev_*!)                       0             0           --
tyr (dev_*!)                        4             3          57%
pwm (dev_*!)                        7             2          78%
binder (pr_*!)                     22            57          28%



thanks,
-- 
John Hubbard

