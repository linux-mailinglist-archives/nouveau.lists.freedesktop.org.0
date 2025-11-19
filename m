Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66D8AC6D2A2
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 08:36:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AEB410E599;
	Wed, 19 Nov 2025 07:36:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="g40aU/1o";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010027.outbound.protection.outlook.com [52.101.46.27])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B37710E599;
 Wed, 19 Nov 2025 07:36:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMXesqA786K+52gFLPU4qGlmzdYi1qAgb3Cjuh+GAPZycF/l1nhE7jY8Z6zqVMjX1zd/J3uDnZsi3P7Ck7tUNvC8ojczoGLOYFYsUFpA0KNj7lCS7BnQ59V3S3OJgeC+IdUJ0tf3bEiJBEOR1KFOQLruF8QgvBOqnJYnEOsWpgyCxtLR8xiy0ZkvhY/YGz0AOogGn96oHUKegT/XHxFvHCMsa5gRjEfrwYboq0bQUakaNsZa8w13rWEjcNzZ625bnnPsNz+XJ/PnjoYL7RHUgSU+BOr/LmSvEDnsgv9kPjdy8yUKM9Jxv6lLJjGHmSzBzSBg5/QwszJktl0DbHEcTg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZtBcsO7kmgen9suJReL+deqAyN/Ql3rtSonEYjyCLBM=;
 b=sWh5ms0yr9Nsomzp47jMV8zH8RF7ZmxdKlq+hcImdtLwthH8hBZaH0X7FHIcudRuA8Z3UX1h+FFpUOjp95PJT2aVoHKwnF+UuZ5d0UvwhH+zJUSd1GLzJdOn8219YWLJvUqrHYS8GCx+naaMrVV5m+yx6VuCgwRtNZIcPonEk6/WQu1raS4O7H8FzttCcZ+TyX7XSBckzRVcjUg/lYexctCpRodUlymHHE8VxGkJfwsQ8vY3xhNSjUdWjLP9RgouM5GTVcdLM9piHNO72l2YPBIzRKjSar1z95QlY+C3nj3tHqu7OXAMZo18Z6+VftMQBJi0zIB/j1cVFgLR5SuEqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZtBcsO7kmgen9suJReL+deqAyN/Ql3rtSonEYjyCLBM=;
 b=g40aU/1o/2F37MZOdSZ/GRzSVgkVYAnnkEHhnTw25ehnG5qcgYMuqkh00foCB00QFc4q6g7d7EdBqlU8bQ3lHdYnLvtynwBaXZFgQBkKAGvNU9tjy15Cz5pDithoiHfBZZTssCj9VEr1z8ufrsvlIcz7Xfz5isWcSH45L46LoztSv+QYiZ/UKH9m7amxD0RpIcgXU6dr6HCiu8eFXvAVGycdgLyYESoAHYpim108bhNtDTumx0p4looTFr3Rw+WHQpRKri3EkO/OELcdJDLRoXDsQaM81E3w0ihVe7X6Lv6FkozZVKu05QxPDMKExVlhcF75ropP/bXXuSGdQfmrlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 BN7PPFEE0F400A9.namprd12.prod.outlook.com (2603:10b6:40f:fc02::6e9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.10; Wed, 19 Nov
 2025 07:36:43 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 07:36:43 +0000
Message-ID: <03562a7e-bbf0-4e85-a562-33cdedea0b1f@nvidia.com>
Date: Tue, 18 Nov 2025 23:36:38 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/6] gpu: nova-core: print FB sizes, along with ranges
To: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>
Cc: Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>,
 Nouveau <nouveau-bounces@lists.freedesktop.org>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-2-jhubbard@nvidia.com>
 <DECHWCRE819D.QVXCHPH23WTK@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DECHWCRE819D.QVXCHPH23WTK@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR13CA0233.namprd13.prod.outlook.com
 (2603:10b6:a03:2c1::28) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|BN7PPFEE0F400A9:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a51ec5a-056b-4e5a-47ff-08de273e627a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|10070799003|366016|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?OEQ2dW5YTm5aY0pVY2dMS3VOaDUyNEkwUnhpdGVGTWIyYmViS01LaU5jLzJh?=
 =?utf-8?B?VWp6OVAvdkRRYkd1TkpqTVVDa3QwYWRzQXJXNDgwemhsMVlaV3RpSVNSWmlY?=
 =?utf-8?B?L2I3MFFNM0dQa3NRZWdWckV1cFZ0VXNPc0x0a3VqU3B3cUZaL1k0ZmVGOFZY?=
 =?utf-8?B?cFZHeTZoZjduajlGMWpoUUJWaThUeWVucnk0dUQrWkQ1YzJvdldyeWJjL3RF?=
 =?utf-8?B?L3JvWjkxOGFFazVXMmFIczJJYXJ0Mlk0T2ZJMFc5RE4zR2RGNE51NFlsK2lY?=
 =?utf-8?B?Mi9nSnA4cXp2cm5nVmFQamFnd0o5SjVKc0xlK3luRW1FRDBjYWlTbkpJVWpz?=
 =?utf-8?B?MXpDMUZ5dHM1anp3UEs2VmNRY24vL3hTVUdCY21RYVkzeFNlUmI3elNGWUwr?=
 =?utf-8?B?anZkWDFmbDFSYXF4Ny9DeGF2Skh4cS9DeGxseHFpQzNZTldub2VndVhrUEFI?=
 =?utf-8?B?OHJpVHJ2Qm1BcTg3d0YxcDZzU2JsYTk3SU1iZFhVbDJ3bXBrTnl0bzJwSnJR?=
 =?utf-8?B?YVljN0VsbGRheWFpaFRmSll6dGp4eVJiM3cxZFVMUkcwVWtSUnRKVllhck5l?=
 =?utf-8?B?UGlDc2gwczhjNDlwVC8zd3RCMk1RWTRDaG5LQ0JaanBLeG5GdkdFUk4vVnlD?=
 =?utf-8?B?VnlJeTdDZEdtSmhXRysrcGh5Y2tnQVcyZmxyVER0Yk9yUmlWS1diLzNvSjRH?=
 =?utf-8?B?OFQ1d243K256OTRpdWM1ZU14SlovRnZXalRzUVZQclRxSFB4YVhZNnRmSXE5?=
 =?utf-8?B?dVZEZndsSm96NkRRenc0REtBbDJUOHY0Z0d6S0dSMldzVEd6SEQ4aWJncHg1?=
 =?utf-8?B?QnNWb3hpOGkxMHYzNHlQOHB6dld6RWVSblhYQUo2Wm50akhrNUNhZ1pLTlpQ?=
 =?utf-8?B?RzFtZ3Zzd1ZyelV2YWRDczIyTXF4aG5uMkdSbnlLVlZDaWtGVnN1b1owYWlI?=
 =?utf-8?B?NmNiM0FxQmd3RFlxZElvUG5oRkVQV0hJeGxNOC9TUXF0YS9FUE1ndlhCbGVB?=
 =?utf-8?B?VmRMeE1lL3BiRURoYnZJUHFENHZidUpXeGJPY0hjTlRSK1FRWHMrbXJGSTdE?=
 =?utf-8?B?SS81a3M0ZTlCT2pYMk1hVXhaS2ZRa1A5SjBRUmlaZ0xZSEM4YWRMU1NWL2di?=
 =?utf-8?B?NWI3WDRrdjVpN3JGemJ6UGU3NWNwQ0ttRGV0NzB2T2Q0NmE2OE52WVd2L3F4?=
 =?utf-8?B?MXplS2dmQXY0YkJObW03c1VQSHgzSzE0d0pCY0p5UDROdjBqU0prdThIQlRE?=
 =?utf-8?B?ZHBoUW5ZMDB4WGRwT2hhaU90NWxYOU50MnQrTWZ0eDFjOTlEUlpIRHozT1N3?=
 =?utf-8?B?b0MzeS9Icm1BS3hDeCtaQnNWbUdCUjJoU1k1SUdUT3ZOa3FDOTNCV1hObTdW?=
 =?utf-8?B?b0pQVDAvZHhjNzNzRmtyYm5WRTZCUDhYMmxCYUFFUUkwS2JUMXdLeDRSYUdI?=
 =?utf-8?B?L0NzeFpEZHVvZ0Ivd0tlclpNektnSTdTNjBJZVZEUWY2enFmaG85TGV5eEpo?=
 =?utf-8?B?c2QvQ2YzWXBONXZROHRacWNxZjUwZFVENVJTKzM1Y1NYRlBvRW0zZDVDNGVH?=
 =?utf-8?B?TVI3SmJHbGlVcXBOWTdBeTBoMDJ2SDhGd2U1Y2taeWxLOCtXZ29wMUJiK3Bp?=
 =?utf-8?B?OUdnSVd0cWE4bHd5SXZaM1lVZDR3SkgyR1JsRjA1M3dCNG5jdDAyL2cySnV2?=
 =?utf-8?B?MDVHZ3cvZ0pacEZ3eE5jQ1hvYmVSS3VVZkc4QTNjNFE3MzJVV2VXRXpuaFJm?=
 =?utf-8?B?VGFaSERLTHNhUXQwZzZLd2NoUVlDME1oOElBWnZHSGVxQlV1eGs2ZTVPSHEz?=
 =?utf-8?B?MHdvcEZpbE10WVJoMzRZNjlhWjdsTzNvRGxqMXRqb2tWSFJOUkZwanY5Vlhs?=
 =?utf-8?B?cSt3ajRJNW5zMUQ5RVVKbDErb2dySDJLT2F0Qy90ZGRLK3VScW0zMXB0WUN0?=
 =?utf-8?Q?kUuwhS6QuT9/ULeDJGkMu/NBFfmMXw7R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(10070799003)(366016)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eSt6WUtjc0dQazIzNk9lbUNnWHJBRS9tbndoT2Y4K25DV1RjaS8xQ21ldFF4?=
 =?utf-8?B?WmdnUHozS3NFalBka0ZkYnJsaGdvazF3OFBBV09nL1Q0TDFiWEgySk9qWHRG?=
 =?utf-8?B?WjAvNU5EaVo5VElpdXQ2d1JqOU5DV3huVjdIN3lmL21WQ0dWdkduUHozTTNa?=
 =?utf-8?B?cnVmeUVZc3JLOFMwSnI4ckQ4K1NjcW5kMWRHd3NCTGNISEVlYnZRWEh3UWN5?=
 =?utf-8?B?SzRneHI2QU5HY1d3ODV0QzBiQjd6ZFdjaXhFQmlxaVFleDRaeEZ1VHpaRkYx?=
 =?utf-8?B?RVVoVUpQNWtKWFM0cjFTRjhhMkNzRm91QVYzOG05TWQvbUxnb1RTMm1iQ3Vy?=
 =?utf-8?B?T0xrREJuNHdNNzgvbDFJZFM4Mk80UWhnNERqajlWbUpLSFJvcFdYQVRWVFJz?=
 =?utf-8?B?KzFCYTBvRDJrRWlFamsvcjBESEswM25PNkJwMWRxc2pZN0ZwT29JeFRRcDZK?=
 =?utf-8?B?TGlJcVNhaCsrbHozSkM1QnJ3UHZwdXQvaS9LSHVscnZmZnB3ZXhxTGJUL3B2?=
 =?utf-8?B?ZDZKYUVMMkUyN0hwc3pTYStyNjRVM2ExaXE1MFRQaGd1WUFVUWNsdWFrb3BB?=
 =?utf-8?B?a3d3UTltSnZTZHJmMUNQakRUSmFmMXo3K1RORUtzRThnME5hUHNlaTc5eXVW?=
 =?utf-8?B?dXYybFVKdUVPbHVyUURSdDd1V0xoOW5DR1ZPZzNSaWFYTWxVTWJLdkFLZWhR?=
 =?utf-8?B?N24zQ252aktoeUN3UnJ6cGs4QXVxeGpsbUpOWElKSWtVUXJNanNuK1dSUFN3?=
 =?utf-8?B?dHlJc0Q3U0s1aks1L1UvWUhJVFFyUUMrQlYzbTBkdllsTmVnR2FMU242bUYz?=
 =?utf-8?B?d3VlQk1vTUlBUzZzVlhHOXh6a0RwZi90aXRYM2lzWW4xWnR1ZDV4dGViRzUw?=
 =?utf-8?B?MXp6dGphSXA5SUIvREpHOG9WRkJ4MmFWYVgzK09sM2FERG9sbTJuTzFuZzFQ?=
 =?utf-8?B?b1ROYXpLMTVjdzF1TVhUMGptVlhNNDQrYXZqTUp4VGJSbzQwM094b1BsSUdG?=
 =?utf-8?B?RG80SHgvc0Mxd1FLOVA1eFIyYkllRGEvQ1lTNzdHRkZXaTdFU21nSXE5dlJI?=
 =?utf-8?B?ZFpkc0hiQkVoWDR3SWt4dTZOWEdmcExRMWY2M0xjMldxeTd1VnlBNEVSVmJH?=
 =?utf-8?B?bUNYcG9iMGgvcGN6Syt6YlpqbVI1NTg2MVpNVFJIODkyTGhGYTBZa0pxbFNo?=
 =?utf-8?B?OTNndFRXallDSWZweFVabS9XckVRL2lpL1MyT2sydlNYMjEzN1pGZklEUkJq?=
 =?utf-8?B?Yko0RC9QajU4aEk2ZlNicE4vUSt2aG1aR1FwVHlFM2hVczFnSmlCUi8wai83?=
 =?utf-8?B?SkR6NDRveVFoRlVHWXVVSVp3Y1J3elV1WmhkWTdHZUV5S2pNWXZxWFBSU0Rz?=
 =?utf-8?B?dFVZcks4UUNpQUZhWEdJSVM2SG81MGhXZTBuR0JmSlkzLzhmeUI1SnVIb1Za?=
 =?utf-8?B?SkFPNGNVR2hWU3Bpb2JuWnhSejFCVXJlVytaUUV6VHpBYlkrRWFMWGtCVTd3?=
 =?utf-8?B?K05BQXk0Zm1qbit2TGVFaEU5eG9uOWlWcHEvaEV5TE1XNkpHZnZFeWFpeGZT?=
 =?utf-8?B?S3pSVzgvOXM5WkttZlN6ekQzQUpGOHBYT3ZCUXE1cWZBS0JNUVhyWEVQdE5h?=
 =?utf-8?B?U1hmWlVLRC9teW4rU3VQSStTVFFlS0ZBUGpDYkdIMHUvL3NUZXBYNno1WWY1?=
 =?utf-8?B?eHBMZkRvaTRvVENwMGEyWXFaOUdXUmpxaVpMRGxvbE4xOEdiVGwvOWUrN2dF?=
 =?utf-8?B?T0tjSlUyQzgrcUc3bVkvTWRzcklVSEZ2R1ppRHRrZ1NXbzRzM2ZRQzdPQXRJ?=
 =?utf-8?B?bWFGR0FiaUlmNFlaRGNtaWxyR2tGTGhIemRJQklIbkpjbC8vUE13d3dtRHV6?=
 =?utf-8?B?dTEwNmR1dm56Sm1vUU56Wi85c3dVU1RCRHNoTzduNW92MW5RYmxGVkY5ekFP?=
 =?utf-8?B?V04wU1lwSm9OaDRyS01kK3RtTHdHTktiNGE4RFJlYWl5dXlsY2VrTDlnQUlt?=
 =?utf-8?B?ZlhydTg5ZFNDQ3RhRXlQNktUeVJpdmR6aHc4M09KL0JHODVYbC9LZnNtUGFV?=
 =?utf-8?B?Z2F0dElWSXh0RzJFcmk4T1d0WE85eTFTVHhreTdhME9YeWwzY1JldEEyM3Jh?=
 =?utf-8?B?bXNhWUFaQTN5YzJoL2Zack91aEYzWTg0ejBRbGEyNS9qN01wQVB5VFV5OVNR?=
 =?utf-8?Q?eHj1m7vmAPM9huZizT6jty4=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a51ec5a-056b-4e5a-47ff-08de273e627a
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 07:36:42.8947 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f/VxgPiE8bhfJvtPTDP0PzFngBGjx6pmr4rjKDnrq73MP2FsF+2jxabKxwcYtq+8YWq8joQ1ZIj1luw6WbdbpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN7PPFEE0F400A9
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

On 11/18/25 11:33 PM, Alexandre Courbot wrote:
> On Thu Nov 6, 2025 at 12:54 PM JST, John Hubbard wrote:
...
> And with this new type, we can also address one another shortcoming that
> was bugging me! In e.g. `boot.rs` we have this ugly bit:
> 
>          frts_size: fb_layout.frts.end - fb_layout.frts.start,
> 
> What we want is a `len` method, but since our range uses u64, and `len`
> returns a `usize`, standard Rust doesn't provide one for us. But thanks
> to this dedicated type we can now implement our own! :)
> 
> Not saying this has to be done in this patch though, but it's a nice
> side-effect.

This all sounds good, I'll do it, thanks for the ideas and most of
the implementation too. :)

thanks,
-- 
John Hubbard

