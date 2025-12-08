Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4696BCAC1BB
	for <lists+nouveau@lfdr.de>; Mon, 08 Dec 2025 07:01:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1A6810E0AD;
	Mon,  8 Dec 2025 06:01:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QBp4qKED";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011044.outbound.protection.outlook.com
 [40.93.194.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DA18510E034
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 06:01:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OvjjgT58XFOG6R29UT6jG32opvNZPemnqS0HVC9n1M8SVxn6FMN5L/LyNjG21JcsqiKHm4FNTb9MCKqF2rYXjqPOQXqtZ6lC0mpKjFXc5sIrwqTJZVjoXKIZ8AdvZhxgxTfxuzJ9wTGmy5HBSmOaGG0hLasJdyG6h9A3zxfjzN8AYrJFobmFuy6v9krWY+tjwNig6N3g5KLeHtuoxShkTxTcLPQGYetnFvMAWA9MF9yLjLAFjPxjKtfo+smPVs6Pq1Zh7D+fONFNnhDZbQ/sWV1c/FmjvyTI8B8UkeFzpvMM/b54R4I5V5AaapmrRT2z4bkw1IQdVMR2lUapw/okZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g4/VvwihYjT8IoIrS9T51lDv94TRcHOjNXwPHodTpNU=;
 b=v7x1JX0MU1OsjR/Pzg+OtnfFuv3pUt2tJDTP9U0cBTOJKfO/gTUWZ4ljnYfeu9xdIIn7SZebiLFnobRNaNRlNDdBKAVbzI05BIKIrqbAReQdxACb9klTOuEhkKFg6R8j8dSwcaHJ92QiMvtFoDWRQoUwjkbKgoEPeatMcrfms5Fa4gTzic+LlrjNVfSVKClR/ekA8OtBlIqYEGyoJAf3U+5idGDLD3d1FZVsH5uz30N6Dk4+hqytJgfMZXiUm+m2bTTi52/vlzkF/NI25jfldXRN2u+RAMX8bYyuSATlD8jk+5H0BO33+49RUQuwquvouWPHgXGgLdyGUfcUuykgeg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g4/VvwihYjT8IoIrS9T51lDv94TRcHOjNXwPHodTpNU=;
 b=QBp4qKEDsN+JLK+SwMHx+DA5N9maYGRz/2E/FfyGwkafKYWDbHPDzWpqluyGixZ2ah4Up8VDxou6jY9tLgnG4CNpQzoknRvSAbEJuguGQ7XWjc/a+nnzVFY3/3RRb7w5awtiitXYrxc2Y8vjgSWIet/jpQEfG3BuodgumHh1PVy+mHejmXLImEyrhhzwRm0/07MYJR3V8z3VB+y+T5V0ePhrXRizUEjOwzdU1boNuDVZWV/4cpH3zHg40mnADd+QiBBVC9EV/QLmOAOMjJ7a8OZ1ALdLfC/bknAHksQUwS7Tm0WYI7cCHY9VCw7PhO3lds+cGBKeAXXi8YqRU5FnHQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 DS0PR12MB6462.namprd12.prod.outlook.com (2603:10b6:8:c6::19) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.14; Mon, 8 Dec 2025 06:01:02 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9388.013; Mon, 8 Dec 2025
 06:01:02 +0000
Message-ID: <2ff114ba-46b5-4a5c-80b8-3bd840dd9f3f@nvidia.com>
Date: Sun, 7 Dec 2025 22:00:55 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 23/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot
To: Joel Fernandes <joelagnelf@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
 <20251203055923.1247681-24-jhubbard@nvidia.com>
 <dcd18bd8-cb7e-4c28-b4c6-95a201710270@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <dcd18bd8-cb7e-4c28-b4c6-95a201710270@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BY5PR20CA0031.namprd20.prod.outlook.com
 (2603:10b6:a03:1f4::44) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|DS0PR12MB6462:EE_
X-MS-Office365-Filtering-Correlation-Id: b2260b67-b46f-450c-df87-08de361f2aae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|7416014|376014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?alN4VVRUZzBjck55d2pUSkljaEJFM1Jqc3IraVk2WEtKVmdPYmt4Z0JaK2dW?=
 =?utf-8?B?MzZqNXRYZThYUTJkbjZldUxIM3FBYmtmVnU4TzFhcW9KZGI0SUtqUXRjTTdN?=
 =?utf-8?B?eFA3RlhVVG1aTTJYRUFPK3g5amREb3RPS2lHYXlhNEVCRzZLYW00VUdnTmVG?=
 =?utf-8?B?RDJxTzNMSkp2MjBLR2ZpRDRDUUQrbHFPbnlxZnI5L1lwYm15eHhUVjhDcUl5?=
 =?utf-8?B?Q3hyOUU3cG1vSDV3bFlqS3loMkNoZG54aTVpWG1XVklRdGs2ZURSZEZnV0N4?=
 =?utf-8?B?NmtWY25NaXVzLzU4dGs4bEMzUlFxQ1NPY0gvQUxWT3VGMU9Kdks0RG95bVhY?=
 =?utf-8?B?K2R0QnFNcUR0Vy84aEgyT0lOeUxUNE05N1Rub3M1ay9iSzAwVmo0V2hOSUZI?=
 =?utf-8?B?UHQ1Wi9LLzB1b1d1cG5QWm9TOE94enp5MWMrTk53bS9nL2pYUms5aHVjMWcy?=
 =?utf-8?B?YWJMb1c5WnpuTXlSbEJJcXhSRnlWTHZqVm9SZ0hGZ2wxemljbThxcjUrdUJX?=
 =?utf-8?B?eUJFRStRTHdNUFUwdjZ3NXprcHpYaHRlVTVpTTg3L2gycHJCaDJSeFdBNGN3?=
 =?utf-8?B?ZU9HYmJmc0NMcGRIZU1nSkRzWEZtRncwbHhLN0JQMFdGUVFMVitDTlNEbWh6?=
 =?utf-8?B?SHJBak9QdUlnU3VEQkluUWRscnNuOU1YY3BGZmFsNVZ0MDZVaXFzb1NlQy9L?=
 =?utf-8?B?K3N3SXZXSkNUZ0VaeGM5SGxRbVl0am5XclRHTkQxMDlLdXl2MFVNL0lZN0xl?=
 =?utf-8?B?dit3QzVSem5zcFBVRDNOWk56T2xVMnRBMkhrNktOZ2M3Rzg5c1FoOUhZVUFw?=
 =?utf-8?B?SFg0Mlk3TDhhN3ZGVmQ4dlc4Uzc5QzFDK0ZNQVZjeUZHY08vY3JaeWc4dEZE?=
 =?utf-8?B?a21HSG5qM2lSWWpTWjFwbzcrRXBOak0ycGFRUy80S3dZWHJnNjBTT2pGM1k1?=
 =?utf-8?B?VW1xVExDYkJYZlJMeWN6VDVCcEpYbW9UNHJ6NXJCVmVFazczUWhsK1orV1RO?=
 =?utf-8?B?UTNYTzRRSFRsa2Nxd0JuVFJ1akdHYm1JNVBFVWQ3N3I3bmFjZmxGTzM2RzBI?=
 =?utf-8?B?Q2M2aE9odGQ0TDJVZytMRDlMVFJQaUtDSTJWQ1NRTXF4S2JwUVZhVXhoMDM3?=
 =?utf-8?B?Z2NoWTVxR2FoTjMzcUFCSDVOaExmL3hjYjR6cVNYYm9wOTJCdlFId25tN282?=
 =?utf-8?B?TE82R1JEcm9kVDk4NjBPR2RKbjRXYzNhd2JlM3JqRWNRMXIrRkRScEJyNWlM?=
 =?utf-8?B?NHRVd0svSm5kOWhTZnNxWkhTQmo4Q1U1ei9LY1lvZ0Ntd3pTWkViNnJ6ZU5Z?=
 =?utf-8?B?RzZrRHl3NWh6VE5iV2dSTG4zUkk2cGNkc09nNUdnWjNNL1YxTUhJT0NCSzNw?=
 =?utf-8?B?bUZ4MjhaZEJhaGVaUHpQVk9qZHFrdStvbTZ6T0dkQkJFZnh6RTRJM3JXQkFM?=
 =?utf-8?B?NjhHOXF4Tk1JQ1FwTlRhOHVFa2pVNUp6dFhKdnRveTErb2Z6bk1jb0pnelZt?=
 =?utf-8?B?a1BFWEJlQVY4VHZORlExUUtjR0dTUnRFV1hpNll2U0RxMlRCSEU3Vmw4aHVP?=
 =?utf-8?B?a3BidnJHOHJQQnE2RGJxQ1k2Q1NTVys3R0sxTUJ6cU1Yc290ZHRKYndGVEpM?=
 =?utf-8?B?NjhvZ0dmQ1NlMElMMSt3dkgxSlRtTCtOYWtWSUcxRktHUDhFWWpjVWtPVVl2?=
 =?utf-8?B?UmMxaUFrUXI1VEtqQ2VYL1JITUQ0MFI2TFFwajBTS0ZGRTdHM3kxSHd1M2Fj?=
 =?utf-8?B?ZkN2N09FUk9zL282c3RNYmpVV0VoUUNhSDZVeDRtcjUrWTRSQUF3NG11OGpM?=
 =?utf-8?B?MWVndkp4K0pnT1RJOFUwRVVJTitVUkRiNVBMNmhjNlJ1VUFvTHlFelgvVlg5?=
 =?utf-8?B?U2YzVWw1eHRwM0JUb215citOMlM1cnl5Y0p6ajBsODNOVU1MS2MwWEQyMmdI?=
 =?utf-8?B?YXMrcUZCMzlTeGd1S1E0eXRNWjBTWmZBUXAvOUdFN3JrRGg0RER2ZTU0UXhl?=
 =?utf-8?B?SlpXRVlVeTFnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(376014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?TCt4TmNPcGg1SS82Nm9BR0RnT1cvTmpYOGlHdkJZMk9iaVFvS0ZCVUxDeVJl?=
 =?utf-8?B?MkNTRzdKelMrSStacTR3d1hnVStNRlBaRnZ4a0NXVmpjeHBKZlR6emV1ZStr?=
 =?utf-8?B?K0dqSlRnYWJyc1pJVHY2UXVRSTBYemhXdzlGcWtqNTNjQXZRZzE4RTN6VHJz?=
 =?utf-8?B?TFVmcFppR2lyV1pMNTdwci8xTG5QeEJVV2FmTW5kV3E1aWRvTGk1b1dKVnFG?=
 =?utf-8?B?aUZPNklKNHl1bFEyYnp1NTA0R0hZQW02NEtlcGI5L0VhdGdFTG5wYXorRUR1?=
 =?utf-8?B?eGNoUTJzWm4wOVBXaXYzN0pzY2RUNmlVK1BIenRGOE5NaUQ3NndDUWtDMTVR?=
 =?utf-8?B?TnZhOVRTbmtlOW9wZFhTOHRQVG5EcnB3cE9aRW04Z1dyblFKcmRkVmNBNFhG?=
 =?utf-8?B?UFpwTWdsdS84cG1TRThWeDNZRTdQZ1dGZjFRVFhOenF2eVJpUEx3NDR4YzND?=
 =?utf-8?B?UTBLN01pdmdFQmdjYzRVNmEvcnR5S3BQcWhjcHZzMmdHUmVycXBOekppKzRz?=
 =?utf-8?B?SEZoZnZFYm5iWTFoQ0U1VmV4d0VSK25KUDBIY0ZPZ0FtaFB4QytXcjNTcm9n?=
 =?utf-8?B?bko3eXFuM25Zc242UExLUmZpRjVOclg5ZkJiREVuamtmREJJa3AwaDRGWSt6?=
 =?utf-8?B?SlZPdW9CV3R1Uzl2eDJZSWkrdFNMRk5OMjlPZXRiRlI3UEkvejJqaVlFWDRt?=
 =?utf-8?B?dVlWYnp5d2lTYys0dzU3S1FrQkpXZURYa0YwM01ROVFLMkExODhKV3Jlb0hK?=
 =?utf-8?B?YlRTRE1LcnZRTEdPWmdJMTQ1WkZmMDBOUkhLellaMXpWa0VxYXdNdXlOeThM?=
 =?utf-8?B?U0w4eVdUQXZxM2tPTXVUUzhrRS94K3R0c0h1TS9vajBSUVloRnRPSDduczBB?=
 =?utf-8?B?WVpIRGNUTW5tY2d5Tjk3emxNbFBWWXpwOWF4dWVNRmRoVmZSbTdpWTRieUxj?=
 =?utf-8?B?SGhpNjV4WXQvdHloUU9rWG4vc1o5RkpoRm5Wd0RxdzRhcmNGRGVlRXJLWE9z?=
 =?utf-8?B?T1psd2VBY0RJOWl6bERHbHNUM2JxQ0NTSnBmSTZhd1FNOStnZHNobmo1d212?=
 =?utf-8?B?Y3AyRFBiUFM0TkNCMVBHRmF2NC8vbnJ3K25oKzVrdER3bXN2Um0xNkhtaUFD?=
 =?utf-8?B?NWhVQzJRV1NpQUhVVnRHTytLZTEyL3Z2ZW1jVXFRSEpFT2tNWmw1V0FIRnNv?=
 =?utf-8?B?THppUHZBRWpwYXNqZHAwaGlHOVdoRStrd0dYcE01YkMxRlBQYkMxSE8wT29v?=
 =?utf-8?B?aFkxVjdhbER1SlV0YkNkWDlsdmJKK2hVd1ZhdmQ2UWdTWUZRZ2pBano1aHZm?=
 =?utf-8?B?amNpNW0xM1YvR2R0c3hEZys1Y3VTOU56eFFEcTg0TDJzWHVjQ0FHUVRhWTZW?=
 =?utf-8?B?NXFlbmZQUUNKOGJJVHpDRFdmQkdKaTdaRTlidmZUSi9Hb2lqYzZaS2R3YkZM?=
 =?utf-8?B?QkUxZmNBRW9hU01MMGRrYkZaWkNNODByYWRCR05ITWFxRHR1Rmt1VVoxTWxj?=
 =?utf-8?B?WkFDOGZqQ0p4cDFPVDNRUWVkVTl2Y1Z1THZ0MmNxQWxuOFZRRjBXakYzejdz?=
 =?utf-8?B?ekRLQ0I5c3JadlozM29aRGtSYy8rOWwwSFJLY2hmZExnZnJKa2E0Mlh5c2Qx?=
 =?utf-8?B?MjlXMjY4UThCMk5mcDk5cjJ1YnNMM2h2djZ5eTRpSFNSWVpxMXdzSnZyL0Fy?=
 =?utf-8?B?cWpMN2RSSWtPTzNCR1NOYWJmQ3grRmlIdnhmVmRNUW9aejBEZUI0WUVpeWl5?=
 =?utf-8?B?eVNqdFllTGRuUnJVSHpGZmtONzFpT3NjMUhmL2xGSDMzdDhwKzkrMmNvYmN5?=
 =?utf-8?B?TnpGZlZoQ0F0a2s5c2h2TnkyOUdXSUZaOUs0SWZBVVNTWnRWamNBczNpRk1G?=
 =?utf-8?B?U3g3cUlyOEY5QWc1R1gwMW9Qa1FRN3J2U24raGRxZFJNeHV2Z1lwQ1hPY1dF?=
 =?utf-8?B?a3F0MkRhSUx3QmhvSS9rRWtxZnRRRTR4RjFYMzhZUXRGWVRJem5YK2NuNldt?=
 =?utf-8?B?SDJyV2FOMUFnc0JGQkhtT0RFcjlVRlUvTHJ5dFlRTWJ3TnNEWlREaC8wY29s?=
 =?utf-8?B?bWU0bW43c2tEWGlXOGxDRXJJbHU5Zll3V01aRWtxZXpSZ1V4UjhJVmZMYXFI?=
 =?utf-8?B?OEZSM0Y4NHdJOHc5NG0rckZ3WkRDNXBxbHNzUkprSUZZRU1UdjRPNEpvaDdB?=
 =?utf-8?B?aUE9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b2260b67-b46f-450c-df87-08de361f2aae
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 06:01:02.2739 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RyXiH/KhW7sNAgASXopJD2UHVrX3Cx9UssulVr3MJmohfmxHM7sfyUidQ7GPylXexmbH+NYcZDAVVinIaVNNVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6462
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

On 12/5/25 9:15 AM, Joel Fernandes wrote:
> Hi John,
> 
> On 12/3/2025 12:59 AM, John Hubbard wrote:
>> +    ///
>> +    /// This version takes pre-extracted signatures and FMC image data.
>> +    /// Used when signatures are extracted separately from the full ELF file.
>> +    #[allow(clippy::too_many_arguments)]
>> +    pub(crate) fn boot_gsp_fmc_with_signatures(
>> +        dev: &device::Device<device::Bound>,
>> +        bar: &crate::driver::Bar0,
>> +        chipset: crate::gpu::Chipset,
>> +        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
>> +        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
>> +        total_reserved_size: u64,
>> +        resume: bool,
>> +        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
>> +        signatures: &FmcSignatures,
>> +    ) -> Result<()> {
>> +        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
> 
> I see lots of dev_dbg left as you also pointed. I guess you will remove these as
> we discussed in the other thread.

Yes. I am thinking of leaving in a very few items (like 1 or 2), as sort of
progress indicators, but even those are up for veto of course.

> 
>> +
>> +        // Build FSP Chain of Trust message
>> +        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
>> +        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
>> +
>> +        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
>> +        let frts_offset = if !resume {
>> +            let mut frts_reserved_size = if chipset.needs_large_reserved_mem() {
>> +                0x220000 // heap_size_non_wpr for Hopper/Blackwell+
> 
> Can we please use constants for the magic numbers? Also with comment headers
> clearly documenting the constants where they are defined.
> 
>> +            } else {
>> +                total_reserved_size
>> +            };
>> +
>> +            // Add PMU reserved size
>> +            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
>> +
>> +            frts_reserved_size
>> +                .align_up(Alignment::new::<0x200000>())
>> +                .unwrap_or(frts_reserved_size)
>> +        } else {
>> +            0
>> +        };
>> +        let frts_size = if !resume { 0x100000 } else { 0 }; // 1MB FRTS size
> 
> 
> Should use SZ_ constants, here and everywhere. Like SZ_1M etc [1].

Yes, I'm still glitching and not always doing that, good catch.

> 
> [1] https://rust.docs.kernel.org/src/kernel/sizes.rs.html
> 
>> +
>> +        // Build the FSP message
>> +        let msg = KBox::new(
>> +            FspMessage {
>> +                mctp_header: (mctp::HEADER_SOM << 31)
>> +                    | (mctp::HEADER_EOM << 30)
>> +                    | (mctp::HEADER_SEID << 16)
>> +                    | (mctp::HEADER_SEQ << 28),
>> +
>> +                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
>> +                    | (mctp::VENDOR_ID_NV << 8)
>> +                    | (mctp::NVDM_TYPE_COT << 24),
>> +
>> +                cot: NvdmPayloadCot {
>> +                    version: FSP_COT_VERSION,
>> +                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
>> +                    gsp_fmc_sysmem_offset: fmc_addr,
>> +                    frts_sysmem_offset: 0,
>> +                    frts_sysmem_size: 0,
>> +                    frts_vidmem_offset: frts_offset,
>> +                    frts_vidmem_size: frts_size,
>> +                    hash384: signatures.hash384,
>> +                    public_key: signatures.public_key,
>> +                    signature: signatures.signature,
>> +                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
>> +                },
>> +            },
>> +            GFP_KERNEL,
>> +        )?;
>> +
>> +        // Convert message to bytes for sending
>> +        let msg_bytes = msg.as_bytes();
>> +
>> +        dev_dbg!(
>> +            dev,
>> +            "FSP COT Message:\n  size={} bytes\n  fmc_addr={:#x}\n  boot_params={:#x}\n  \
>> +             frts_offset={:#x}\n  frts_size={:#x}\n",
>> +            msg_bytes.len(),
>> +            fmc_addr,
>> +            fmc_boot_params_addr,
>> +            frts_offset,
>> +            frts_size
>> +        );
>> +
>> +        // Send COT message to FSP and wait for response
>> +        Self::send_sync_fsp(dev, bar, fsp_falcon, mctp::NVDM_TYPE_COT, msg_bytes)?;
> 
> This seems to diverge from the pattern we use in GSP `cmdq`. Can we keep it
> consistent, like `send_sync_fsp<M>` ?
> 
>      pub(crate) fn send_command<M>(&mut self, bar: &Bar0, command: M) -> Result
>      where
>          M: CommandToGsp,
> 
> Alistair/Alex may have more design suggestions since they came up with this
> pattern. Especially around safety (guarantees that the part of buffer being read
> will not be modified by HW etc).
> 
> Over all, I feel we have 3 different mechanisms now (1 upstream, 2 in the
> works). The GSP cmdq, RM control and then this one. It would be good to get some
> consistency in the API designs for all these different mechanisms (and possibly
> share any common code).
> 

I'll try to catch up with the GSP cmdq approach and apply it.

thanks,
-- 
John Hubbard

