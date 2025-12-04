Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E0361CA2A17
	for <lists+nouveau@lfdr.de>; Thu, 04 Dec 2025 08:28:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BC7C10E8B2;
	Thu,  4 Dec 2025 07:28:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jH8Lb+c4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011063.outbound.protection.outlook.com
 [40.93.194.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90BD810E8B2
 for <nouveau@lists.freedesktop.org>; Thu,  4 Dec 2025 07:28:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4u5RAVqgj799SyQYyMj8b006U7YixEEFVVs93mVU/k1Z0+FKVupYBkU76XDpnG03YT+v9HaBEDTTvxR01oa9AFLpNoOE4xq2webdEQxiHIoiJLZHIt19rtpY8VUkGVhu17RvY2SL4afKKa479Dg9jBR4tX46ZWKVr9Erg/2/Gerpfw+9ON7qjqFJTLjX1KFCpRI0Cy/lsmHmjopxft27EdSagh1lkLaqkLD+1GzGrxI2A1waAR5HUr63XTiMjg2kstLU6XnaIk+tExbIu7LKH+GuOHpgWk/QgtrmIW3ZykmF/jMDjr/h/nRI7Mxu4wxcoEL9E7NgP7btzZ0Hk6bgw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/MjO442PD9VWStqv+CxQ4/gEyEaA8IM26jvS6VTtACI=;
 b=MueoSAgJ/yb9pDpgMbs4LCDf/SQaQ69MNDWlyQ7/GMQgelYOIyVYMa8Vqwv+wNsR6MILO+6qRI6dIaGKDMgpJSek91gYmZMMCAoD7ys2zsrs1U4TflHw4p3uDMR6IJ5oa5jzJeHhpVk94ucrpdESe6Qi8FNkz8aZFyL8s5fHoU1BX9t0NO1Xjw6bSpPFjzb3tH2OBxmjZB7jzBRA6JSwaArEf/eYoUfYTDhpRMYcsvkCgsst3kVm25pksoEq6scQmJ1uJ6KL4ZBVDrt1KDVpqyld1warjaNv0lynulH7WeW43JEpWZpP5oY2NifjGGMyetEqpa1TOuq7J/HLYVgKEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/MjO442PD9VWStqv+CxQ4/gEyEaA8IM26jvS6VTtACI=;
 b=jH8Lb+c4FpnbaYB6aTp46x5FRNaRIlqvdecjbVh7ZprV0CJLqktfrWcIco3rEGrGWex72gmThlq3LpfEHqJ8FZMiaQ9SGqMon5pyyeR1pTtkaxIOMmXeH00aRoQrgF9nN9hdPAEJLuL9Jra4HZzs4Cf7Ahk+2LJfwtTyQ0PuLFqJGAWyxfCHL8NpU+V3a4zv+wmprI/AIQJQrMJFEjYZBRPp39xT21yzC6y0m5wxqAnCgrlaT7AXsx4BWuecZhOcvVrL+jTWR0NnQCKmiylH3pf88Z6BQiLTSomVR26RTk1+HqObUoKZ6li4vwk4VHtbbwKJEhCy2PW7PV7otW2TeQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 SJ2PR12MB8109.namprd12.prod.outlook.com (2603:10b6:a03:4f5::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Thu, 4 Dec 2025 07:27:56 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Thu, 4 Dec 2025
 07:27:55 +0000
Message-ID: <19c557e5-5428-42a8-8317-62726b980eff@nvidia.com>
Date: Wed, 3 Dec 2025 23:27:15 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/31] gpu: nova-core: print FB sizes, along with ranges
To: Timur Tabi <ttabi@nvidia.com>, "dakr@kernel.org" <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 "lossin@kernel.org" <lossin@kernel.org>,
 "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "aliceryhl@google.com" <aliceryhl@google.com>, Zhi Wang <zhiw@nvidia.com>,
 "simona@ffwll.ch" <simona@ffwll.ch>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>,
 "nouveau@lists.freedesktop.org" <nouveau@lists.freedesktop.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>,
 "bjorn3_gh@protonmail.com" <bjorn3_gh@protonmail.com>,
 Edwin Peer <epeer@nvidia.com>, "airlied@gmail.com" <airlied@gmail.com>,
 Joel Fernandes <joelagnelf@nvidia.com>,
 "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, Alistair Popple <apopple@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-2-jhubbard@nvidia.com>
 <049fe68f61f354236a68580d82dce214f7d927c1.camel@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <049fe68f61f354236a68580d82dce214f7d927c1.camel@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: SJ0PR13CA0173.namprd13.prod.outlook.com
 (2603:10b6:a03:2c7::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|SJ2PR12MB8109:EE_
X-MS-Office365-Filtering-Correlation-Id: e9ef4767-d581-4a08-93fd-08de3306a470
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|366016|376014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?akxWRzF0M0xkVzQ3TmdXaWVtK3VxUW4rQjQ2R2YxY1Z6ZUYySjVKemNyOVI3?=
 =?utf-8?B?YWwwdHFyTmowTGJ5MFBBWU1kdVRWUVp5eTZwZ1JwOTRmZnl1YWF1TnlYbmlE?=
 =?utf-8?B?VG52ekI0WDNMNEVTQ0w4QUhQYjZoQWZhN3daRDAvZzN2SWtCblQ1VUFHcFlZ?=
 =?utf-8?B?RmsyVUJyandKc0RJV1Y4Z053d0NQK2JyVzFPQUo3ays0ZE9FYmp2SjZ5REtl?=
 =?utf-8?B?YjJoZ2M0T3BwTWwwMnFXdTd1R3JwTlZkNFdGNnhwTTUvbUthdGVZZWdvWkNN?=
 =?utf-8?B?V0RWaUFZZTR3MkdoOWZMcTJ3YW1YQTB3MGtKV1ExWVh1ellXVlByUGhXUmpx?=
 =?utf-8?B?VU9ZWDFuNXdLTjJ4WWs0bWJhcmgzL0p0cFFUOUJhQk0rL1RybTRTYjRjaGZK?=
 =?utf-8?B?WC95Y3BEdzdNRWdQSG1pdjRoVWJqV1YrS3FlT0V5djFoY3ZUY2t6NlcrS3Nh?=
 =?utf-8?B?YXlEV09uQTYzVVZFRjdLZ3g4NmJxK2xjNExCN2pBZ05BUXRjSnZvTVVSYmVu?=
 =?utf-8?B?WlhEaTZRUjBqZXJqUGNVZ0VaOGtnR1dlaGlZY3dSKzU5YmcrUEtNR0ZXa3M2?=
 =?utf-8?B?NjJDSmpDL3B2aXpYcmhLSEdmckNmeXdUZVViaDljQnlrQlFqSWZMT1FDK0Jz?=
 =?utf-8?B?ZVg0alY2dyswNWtONXpGZ051U0tzQ3M2N0ZtQTh1UFRtbTlidWQyUVVRYWgr?=
 =?utf-8?B?VTFRQVBZaVprMUxzWkN5RG42WFZMT0duc2t1UHlFc2VRNzdzNW1yT3hIdnVQ?=
 =?utf-8?B?bWY5NERlVTA3Ry9JOEdocWt1T2E5bjlKUEg5dTgybDBPdFJMUDNtZHlXSTdj?=
 =?utf-8?B?YWQ3WHVDQnJPY3dOck5namVSM2NZSmRtZmpoV2RReDcveXRFYllvS2k4Y0xt?=
 =?utf-8?B?ZGZTTk0rUXNvaTZvWElPVjU3cDRzNURLaVZ0RG1aYUkrbVpaM3BHMEJrZW9o?=
 =?utf-8?B?OXhkWkZnUWVKRTR6OTJvQ1FTVm5aY1FSNzNWblVyVjhzaGRMcmdFY1QrM3VL?=
 =?utf-8?B?MmcxTFhvaHo1Mmg1QXV0Znl2SXg1VmF4clNzVC9Qc09qZm5YTE5jOFE2c2tq?=
 =?utf-8?B?RU5UQXUyUTAwUHF1SUFnVWNETGxvYStiaVhmL09ZYm1wNFUzMndiRkVqMHFa?=
 =?utf-8?B?OUkvM3NaQ0hXZXZoT2wwMVBNa2dnd3VEcWtYamVJdHUxR1dyRTF5Y01NS0p1?=
 =?utf-8?B?MHg5N1B5UmNURG1Zb3l4ZXczWFBoOUxtSTdnYkdVQjdpQlI4WHBRZDd6WFpZ?=
 =?utf-8?B?dlFyQUFXVXdjQjRDb0RvckxTdkRHcVpmeW1RRnJIcnpiZFlRNVBVRW93VGxh?=
 =?utf-8?B?bmdQZWtKbGltSFdTMDFVUWVsblRwYW9EWEZVY2dPY1BkNzVDMy91YzJ0UlRm?=
 =?utf-8?B?ZTdwZnJFUWdvYXlHZVAvOHVBSFFNUTFVelljajc3M2tqeWZ6NnZNeTBObFl3?=
 =?utf-8?B?R0lSaXNYQVFMZmJYWlIyK043VmdrajVtMTViZFoxTktWWnZGZHFhbzlLeWRa?=
 =?utf-8?B?RFdsVEtYamlKM25jNE1LdlkxNlI0ekRXMTVqWVFNN3loYjBCbVlCenVQSGN0?=
 =?utf-8?B?Z1BEYzE4VTFDcGN2TEVQdGNxc25iS3pHbVE3RTFkYW1NUS9DWWt0OTN4bmxP?=
 =?utf-8?B?SnA5aHNyaTAxbUNNV28zOVFQT3h0QXYvazRFdEgwbmlzSTdzZDN0VUtISnBX?=
 =?utf-8?B?WHc2aWdXbTRjVTF1RDZCTk9IM0dqaHB1VGM5Mm5qalVUMnBRaE9nZ0R4UTRq?=
 =?utf-8?B?c0tlL2dEQ3BLUHFmTTJnNVhSbFpvbVA5TGZVQXVjd21ia2FmRlVZRklkZjVV?=
 =?utf-8?B?Ylh5ZEVESzFDZXJ5dkFGL1hpdW1GUkJBRE5YbHRBcUZhNzVUSUROcElObE1L?=
 =?utf-8?B?QzY5YitlbHBZcGE2YmJYT3RDMXE0Z21VU1V3bExUY2VUaHZmR3BPMVI1clc1?=
 =?utf-8?Q?KlVc8D3ExDkhs7xmzL0pwhGSJcK85vdR?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(366016)(376014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ZElsU1JJMC9yelE4a3laY3J6VFNyOC9BV1cvSk5BZFFHc3Y1S0ZZS3ZhM0RQ?=
 =?utf-8?B?RXhWSE4zN1hmZDltanBqb2NYdm53bnZzR3FYRmdxRzhUVHBWcnUyaXdFTUZy?=
 =?utf-8?B?Q1BUb2ZrMlJDdEJjV0Zydmt0eTZNMXJrZUlzU2VkcGxhcVVEZ0xNb2tJSzZi?=
 =?utf-8?B?K0grTW9aZ3p6Mkp2TDlpVWhUajhwalZTTmZ5Q2FDSUpyMXV2MWNLVnNTOCts?=
 =?utf-8?B?dWo4TFE3R2JJdmw5QVBkRmpwS3RWK2tieTlwTFhBczhwcm5mV1NTRkNCcEZp?=
 =?utf-8?B?Zy9wLysrL3RuZDJzYlU4KzYzOFNDVWhsbXBKc2pIMXVYYWJGZGp2TldMMVBR?=
 =?utf-8?B?MTZKaDBNcENVK0o2S2cyaWh2ekF0QmMzSTJod2NoaExabFNYa09CTlQzYmlO?=
 =?utf-8?B?UDd5UzBlOXpiTGFkcWk3UTZDZlhaaWllTDVId2dhM3pyN0hVWXBudVM5czZQ?=
 =?utf-8?B?QTFYaUZwSHNhRkhZRlQ4MUlvNHRGVWd3MmQrQWN0Wm1JdHVBMDNOK2E2bkh5?=
 =?utf-8?B?QzBpd3lkSCtpdXVoZzUxUkxKQ1U3MytjL054R3laYjVxTjltMUx4a0VkRndS?=
 =?utf-8?B?dUFCOENxclY1Nk11VVRwMTFLMnRHYXorU29KbC8vdUVsZGJlVExFZ1VLdkV4?=
 =?utf-8?B?a2NkY2NYK1RGSWsrR2pLQ050MmpXNTlscDVUWDdmeTU3RDd4NmR5cm1mVnZU?=
 =?utf-8?B?Q3lqelAwMDdqY2xrREFtelE4eE9FUklYMXNjZ1dibGZ5N3RXS01ZT1dwZUMy?=
 =?utf-8?B?cWhTbk1kenZKeXBtVjJOZzhKUDFTaWl2czZlNDA5L1VMZUNya3EwUmhndkUw?=
 =?utf-8?B?dmRKdVUzRjA3VE5rT2l2am5heDVpcmNjK05aSEt1c1cwN3ZGWE5rYWI1cDlr?=
 =?utf-8?B?dFhLbFRVTFpHNnVKWFZBNGJWTUg3ZnZWcTM1YjRUOW1TaU94MFM5VEYxUmJ3?=
 =?utf-8?B?ckhCK3pKOExGRm0wbnRwSVJrWjRsSUFIS25KeXh3RFJYQSt3VXlyODNncmxI?=
 =?utf-8?B?Z3VEQWZReXhtS2tHSTBqN0FKenBpblczeWsxamVYZldQZHR1eW9ZVnFKcHkw?=
 =?utf-8?B?VFVrQnE2WkJTbXlFc3QzWkw3MDlEbGV6RXQvWGgzUDcyd2FyV3VSWWhkd3pm?=
 =?utf-8?B?SzlpV1dzUHkvZDNzYlNOWTNaUmJUekthS29Kc0xrWjJGZ2tKaEtYeVNtMFh0?=
 =?utf-8?B?NmNpZGw0Z3dBN1NQN2VQcXk2RUM1VzFZbmtTMi8zVDE0Mnk4SmJDYXZNbmNk?=
 =?utf-8?B?bHBreVgyYlBQTFR5QzVYWnBnOGowREJObEVjbytkelJtZ0xhdGZwOHZuSUFj?=
 =?utf-8?B?Z2wxWWpHemlkS3B1RGFkejNPYUQwT1J1ZUtQMjQvRDNZV1pRN3Bxdi9MTnV5?=
 =?utf-8?B?ekZWNVE2bUR3WVNNeFZ2akt3WVBycW8vY0lseG82MFRPNFlRaEt3d3ovbWFX?=
 =?utf-8?B?NkpVWldoRTdseDZ1cGVXY01LOWRIaVF3cGlJRXRIV3JydTNqOHlQUW5VT2dp?=
 =?utf-8?B?T0NIUmxCV21WZXdxV08vK3hncmlvdmdkRjdrRnU0YnNtcmtoMm42QU0wbkRT?=
 =?utf-8?B?QUhKNEcxYWpvamZMUm1kdGRLMWdJY0RNdVNFbC9hZkRtSTAvS3V3VHdvcmIw?=
 =?utf-8?B?NHdTcHdXckdjekovUDVFeHI5b1NZR0hZWDR0SVFNYjBvYmlldzNPR1hEWmJ4?=
 =?utf-8?B?cUdwdGdzL3hsZVlMWHNHclJTNmJNdysrRmEweEdseC9wVEwxaGZnbHdsOXdt?=
 =?utf-8?B?ODUzWm8ydXlmaCtxVkhDYUU5WnRYQ0EzQmt6b0J6VjhsZFA0bitRbGlCeGgw?=
 =?utf-8?B?cVdQTmI4a3ZmMTBVWHYxcFpHaThVQnp4dFhjZHpkTDVQTVg2bDhMbGdnOEFB?=
 =?utf-8?B?UnZmanBDVVRSdDF3WUUxbkZ5RU9UbUVVajlSWldXa1o4RDVnVXlEYmdRMUo0?=
 =?utf-8?B?RnBQcnZoWVJnWmVZekhXQlViV2RPVUlMdXp5Q21nUnlnWWtYeDR3WXR1R0Zq?=
 =?utf-8?B?cFdsVW13em1QNE8yaWZVc2NjL2pMaWliUnI4L293UlBWR0lZQ3ZwSHBMQTR5?=
 =?utf-8?B?ckhHcWZBSEpia01YWDIzR25VRFA3WG1XWC9leXMwWkM2cFAvSUdaZENzWS8x?=
 =?utf-8?B?MDF4akJWMEhQaE14dUJFMDVMdTB3bUgvdTZKem5ocURrUGFEMmQ1ZDNsMzJp?=
 =?utf-8?B?TEE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e9ef4767-d581-4a08-93fd-08de3306a470
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 07:27:55.7328 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dbiiP47ss3Z4bSkZhasQBCL7kACwjtwFjLmvuuFoWeWtB+8TQQv2LHIm1TurIaSS/0Ylh/oK/qD8VJeQ/U9Pvw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8109
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

On 12/3/25 11:35 AM, Timur Tabi wrote:
> On Tue, 2025-12-02 at 21:58 -0800, John Hubbard wrote:
>> +impl fmt::Debug for FbRange {
>> +    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
>> +        let size_mb = (self.0.end - self.0.start) >> 20;
>> +        f.write_fmt(fmt!(
>> +            "{:#x}..{:#x} ({} MB)",
>> +            self.0.start,
>> +            self.0.end,
>> +            size_mb
>> +        ))
>> +    }
>> +}
>> +
> 
> How about printing size_kb if size_mb == 0 or if it's not an even multiple of MB?

Good idea, I'll do that.

> 
> Also, why not just add this function to Range<> instead of creating a new type?

Rust's orphan rules prevent implementing a foreign trait (Debug) on a
foreign type (Range<u64>). Both are defined in core, not in nova-core,
so the compiler won't allow it. The newtype pattern is the standard Rust
workaround for this: by wrapping Range<u64> in a local type FbRange, we
can implement whatever traits we need.

thanks,
-- 
John Hubbard

