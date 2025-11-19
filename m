Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 99A21C6C498
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 02:46:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DED8910E548;
	Wed, 19 Nov 2025 01:46:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qBkcr4GP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011045.outbound.protection.outlook.com [52.101.52.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BC3510E548
 for <nouveau@lists.freedesktop.org>; Wed, 19 Nov 2025 01:46:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gdgqOoQfVywDIkZJHIluMpzjaNaaeePp9fUiGFZqIu3UdyYMC0WDuz0XgOicRCLgdXgFwVOcfdIHN64d9S8JmaB9cAvB3+OLG7D4lMFOyjVAQGiO6GfvTagw5d3xrlS1zg1jjiHOmYZjv/RP6gtaU9gt+UDAY448pLD63XEUZRvrGw6NN3FJFadZTM0osj+tyFhNsfXLNbAzAYIorShU9rhK29tG5zjSETvEp/aItRVRS1mwoOg+0iBGJZbz3CF98uO8ctN4DAKzXvNvjbq3EckZTa/sOHEY8qkVDycwl59dFZ2dIBhy1bAOggP7sozdlgAl8/2as+TjpkGzdirVDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nhonMwqS2bgQcdfqeLtsvNoMOmuoAFgvm91nQfeJF9Q=;
 b=ZXIS6ptGc9RTPOphFjZbb7kOpZlHXxH5m5TQ4I+vFnKhQ4EqG/LoJpGsynWi/3jQGVDY70Jccq//NscGHFNYTwjH4bZFXcq3oRKGNWfBVyIY5RLxAhnMRqN82xXSCieniAj9UOaDGu7oc28QnN96KMX4ewJLAQUCe2Hrrcqg4K9TgXTzBaT7+6BU1eUhB0QRe6FcuLm11ppm7s0fJ5vxciMgKLcaZqZNM4zr5IMaIl6WDmgv69a7pcu5HDsWFD/p6ZlMDtUl3brMsAHGhIdUA1vNT8mx0V0pUz48DhnUnFAZGD138MtNu9QfOu44qNRj/CH2JynMGRaTTm9V/168Dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nhonMwqS2bgQcdfqeLtsvNoMOmuoAFgvm91nQfeJF9Q=;
 b=qBkcr4GPdE94Dpg4O0p5jwyOl4618bKBnUi3okmYGqHdVtveZ4tQfxB63myM5cJ9sLXfTg8LRT16Dv4YPuSCFHdc0mXE3YMt5G/lxer2PInWMSJC+bukJjhFzjw08JjHl1rRZgjhfixbw/Tq2u3xFf0gFRA6T2SvxFiMh96F2mAwGAPmBW6FWJYbUZfB6U99JmI5vswdG2gxT+eyQ51ET350all2tdjCvKTmFVtgFI5w4bAlXBpaHUbQv7B2NAijScvaUTnge6xw//V3VFEAU9tpLdF0gwJaK9p0rfcowhJGFc15z9ihEVoh9ZC5Jby/KW6EKdqSSiPE/iu/H0E1yQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7212.namprd12.prod.outlook.com (2603:10b6:510:207::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Wed, 19 Nov
 2025 01:46:15 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 01:46:15 +0000
Message-ID: <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
Date: Tue, 18 Nov 2025 17:46:01 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
From: John Hubbard <jhubbard@nvidia.com>
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
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
Content-Language: en-US
In-Reply-To: <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BYAPR01CA0068.prod.exchangelabs.com (2603:10b6:a03:94::45)
 To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7212:EE_
X-MS-Office365-Filtering-Correlation-Id: b43d62ea-1ae9-4970-7714-08de270d6c94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?R2tjbXc4SU9CNFdIYnY2eUdoVzllYzMyYmszVzhmSjEwZ0pyQml5YVhhRkNY?=
 =?utf-8?B?YkNsV3JVV2hjTTAvTW9nOE85WFB4ZGl5MXRVVFJuVi8xRnI0UXlVR0ZzanN6?=
 =?utf-8?B?U0l3REd3TjJNYi8rclpSYXJxaDhQaGtyR3lFUW9tSTdJT0pOSDVDUHk0NkZ5?=
 =?utf-8?B?dVJsZnJ2SThuck9zV3cxL0JLeG9FSml4bXdBdVJUbk10MGdZWDYxYlJORU9J?=
 =?utf-8?B?UlhRY0dWRTVjMWQ5QmdtUVRZaW5ESWJHdEtZQTlBU3FySnpKQ1lVak8zY0JN?=
 =?utf-8?B?L1d1ajJqaWVSUkQzVzR5MU1Nd3RhdGpxNUFNY2VpUThlTjBRUnBzeFhCdUlp?=
 =?utf-8?B?K3dwLzg1aUR4eGFWUkNqMDBzOWtnUE9NM3I5Nms0OHNNQldnaGVWcDZ1VEhC?=
 =?utf-8?B?RllMaCs3OUMwTGY1QlI1S1ZxMVM2bCs5TXk3VEVTcGoyUzE2aDkzT3lQdlVE?=
 =?utf-8?B?K0xsTWYwS2dkM1M1Nzk4ZXlza1FrN1BhQ29QNnpXUW93Umd6bG4rWTdlWEIx?=
 =?utf-8?B?NCtlOGUyVnlKUEMxaGN0U3lGMXhwNGttYy83b1c1WGJha24ybFI0elBPVG9q?=
 =?utf-8?B?cFo4VEJBZ1BBckFaWUJuKzBDdFFJRnRLc0ZINTVrZlQ1dy9QSzZheVhwKzYy?=
 =?utf-8?B?K0ZtYXFSc1Z5SlcxT3hhN1VqeGk0Z29pa0xia0RyekFJb2pEdjZYWkQ4K04w?=
 =?utf-8?B?THBzeWxvVU9HL2lzNHI2TDUyYnBQUXdBZHI2U0hBYWVJdjQ3SFpnSzh3Z1V0?=
 =?utf-8?B?dHRtdnJydXJoeDY3UERqa2l6azlDeGwvYjRXbXZxV3IxaTQrTTcwN2YrSVJ2?=
 =?utf-8?B?QTNrVXZvMUlYQm9tLzdOdzIwQnI5U3pobnhudkJCQ3o1MDdFYnJnZXhLYi82?=
 =?utf-8?B?OTVwb2U3QUdHT1NhNTJ4em9TWjF4dHFBQWswVG1BL3I4dHNLUHk3RGl6M2x3?=
 =?utf-8?B?Y1lJVURyMjJ3OFN3cGN0aVF6VDdHRW1lV1FHYUtEalpFY2dEVWhJYzJzdGFw?=
 =?utf-8?B?TytvMTBZMkUwVlM1MkRTWmYwVlJSREsyelNwUFJaWGc3V05pcUR1WDVyektJ?=
 =?utf-8?B?dExqUFJHd3cwU2pFVU1KWS9YYzVaRGgrK3BjUjdMZGZURFE2RUtjSTVGeDRW?=
 =?utf-8?B?VEpJZmZvZ2MwcHJzQkJidTZSOWlxU2hTSDZNRGxlSE5WdWZFVU1pODR4dktO?=
 =?utf-8?B?aXcxTk5ETEYwMGlRcC9WbVVzMXd0QTNrSmFYSlNIM2ZZdFJZaDB5VGF6ZHcz?=
 =?utf-8?B?VDI1TjQ3MW1PYVVOeW9xMURtWDN1dzNyaVV6M0xTMjZMN05Vc29sWG92WVRO?=
 =?utf-8?B?d0xSZ0UybWZ2Vko5QUhucW1TdUdpaDdaRmc4VXVOQ016WmkvTWtOT1pDSWQ4?=
 =?utf-8?B?djFrQXEzLzhuY29ORjkvbkV1K2hVU0EvaVg4Y25ZRG9RTWZlWm5YdldFZTVG?=
 =?utf-8?B?N25PK1NzR2VnTGxoTTcvN0cxU2R3SzJnZCt0c0RaRlZscE9lTFl2UmluNk1s?=
 =?utf-8?B?MGk2SndtZVBSMjd5bEEvZG1EMG5yZGo3Mlkya3BPVmp1RG1hNlJWMkgyR2sy?=
 =?utf-8?B?UVpHODM5RWptSVV6MHVtblUyajY1RVVsY0FJd3JCYXJEZ2orZHNwRUQ4RUxR?=
 =?utf-8?B?Tmg2bENscHZsM2VtOTFyQ3Z0aDI0dGtmcGkzSm1FZWdBN0tOQ1NNQWFEcnQz?=
 =?utf-8?B?ZVphQnZzenIxdTBvZXgrcjBzQWFOR21RaGJMOUpycVQxOHJtSUZaZWUrc2tu?=
 =?utf-8?B?cjh2ZFZxays3RWxyRjNWNzdFZURTUTN3cDAwY25xWGxhQnhFUzV6RmNkVTVo?=
 =?utf-8?B?TUd1aWdxQkR2cThOM2d4VnNrRDZucFNaM2VlSjVCRVNNOW5NWGJiK2dQaUwr?=
 =?utf-8?B?eWNicDhabG55ZjhhRFlYOXNWNEU1SXBmdmNqSTNhRVRKM2xrdWpmVW9hS2x3?=
 =?utf-8?Q?S5Ta5UFpJy/EHHY+E3kbBFTSecfocWBV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?V2t3SUdFV2ErQVVsTUUyWFBFZERXN2U0TEMyNytvUXlmTVBNRVdleTZDU3NY?=
 =?utf-8?B?QXR1blJsajFzOEJlUHl4UnZVajAyMEVwWk15QUVDTnZXK1pBck1WNkJ6cWJu?=
 =?utf-8?B?RzRwSnBNeVJlbGk5U05EOE5ROE9hT1RIY3lVa0lLcWhuWklld2ZuWEV0ZUdt?=
 =?utf-8?B?bWx0UzhpYlBZYTlWNWJueExrZXZrNjJhSExPZVFVNDVoQjNYNjZHYnBrSmZk?=
 =?utf-8?B?aWt6MjRwU3hoTmk1dVNHOFVKNFlJcUxieVAzem5kMG9IUTFKQ3RFZEx2MUNj?=
 =?utf-8?B?clVzb2pXSWlTNDByM0hKOGZTUUJOSUg1dXFKeGZ1T0dFM29hRGJYY3BoRFdF?=
 =?utf-8?B?dzJ5UnhJY0tBSkN4cys5RXZoZW9YUXN4aE5MUFdyYTBHblRSQVNWK2xkOTh6?=
 =?utf-8?B?L2xFd0Rkd1NZeG5EaUVGNWgyRjUxcXZSOGovelpiRnNNbjZPK0phSEtreE5S?=
 =?utf-8?B?R0FDeHlIYm1XU0kvaGlDbmswVVg1eU9XSytNbTlhMGo0VVEyOFh2ZzdHdi94?=
 =?utf-8?B?Y1NQbC9NRjdib1I2RGhlMzBGMndmeWNTTm82WDU1Um1TSEpKYWFNMURsYUVs?=
 =?utf-8?B?YmpIdG43dXR6cXFJdzFGMG0zL0k2VlV3MllObWx3UXpoNitFdExiSjVPS0Nu?=
 =?utf-8?B?RzRDQ0hhd3lIaWh4NFJLYVFycXVIUkxCQ3NoNlJOZjVsS0c1bzN1YkUrK1Ey?=
 =?utf-8?B?OUFhc3ZaSlZlRkdHcFZqeVErUEZMbUsrRnVxbmorSVFYTzFiSzNJNDlVSGND?=
 =?utf-8?B?SlBWTHJPa1VqWVlMNVdlRlQrdi9ZTkJWblZNTmRxK1FhVDdoeENBTnNoRnBV?=
 =?utf-8?B?U05zY2ZUZ28xUWNpdnBvWmNpdXRSeGhTQWZrSk9SMTNxRDd2V0E4WDRvZUph?=
 =?utf-8?B?UUZYbHFtdUJNb0U4YUdETmlkNTZPci9LazRCMTFJUS80bHRMTUJQckFJWmM2?=
 =?utf-8?B?V2M2WFNrY0x5TkV6c1NIQ25HeXZocER2ejQ1ZnEvcW1HM0d1Wm8weFIrbUtC?=
 =?utf-8?B?SkpjVHFJekJHMXJOTTluTjlMWitGMkR0cnB3bWNPeng5Z0Fyblh4NGluOG4z?=
 =?utf-8?B?VTNzemxEN00xeDBGcVBBQlBJeXlvSGROcWxUOFIyNUNvK2tHVnl1Z0Rsd052?=
 =?utf-8?B?VmN1cmJobWFnVFVLa25lcVBiZEtidWIvK1RJMGRLa3AxU0szS3pnSlFSVWVV?=
 =?utf-8?B?MmRSeUl2M0lxVGZYcVRDZW9UMnVGdnIwY1JXZEVrVXJRKzNKd1FqQ2tJNVRq?=
 =?utf-8?B?RFJvSG9PZjh0cXJ5aTBuSzVJeUZjb2luaFc4aGlyL09DRFIvdjZSYWdFSGtB?=
 =?utf-8?B?UFV5dmQ0UDVrMlExU3p4a0VSZ2lOVEowVS83K05yZzZ5WjhUZEtKN3NjdUhI?=
 =?utf-8?B?U1BlczN1Z3lrYmZ6Sjg5T2dNU1prRlVDR0pSWFI3eDE1ellLT3N2cGZGVnpO?=
 =?utf-8?B?Yjl2K0RIM3J1MGdEY1RNZko4M3lPTTh4L0tsck0vWXhTS09rVUdDeWZpRWNO?=
 =?utf-8?B?QjlxYmloSmtaTGVpOE9aOHZUS1NpL2pML2xya0JzMW9ENDZVWEZ4NTBhRkMz?=
 =?utf-8?B?ZHZCYmFrWVdCNlU0OVFTRFpZUk1reEdna0VnTmtzM3ZyYmlZUjNMV0JrcFBH?=
 =?utf-8?B?Z1pvSjVUc3QrYUgvenJqMjMrN2pRbld5Y2hPcTRGN01IRTVNMUFFYXY0UGZB?=
 =?utf-8?B?ZlZmV2VOQ0FtWjhJRVBwTkJhWDhMak9GajZaUnFyTVBWcXkvNmdBZXNzQXg0?=
 =?utf-8?B?SktxTDQrM0VaOGpYZnp6c2dIUTlWVk1kQU1VMUJ1c25YNkFzSVdyTmNFWWRI?=
 =?utf-8?B?U25MakpXRk5NaGs0aGdhOFVQUnNRcHlscjZqV245cU9hcjlmRGRqRHNuaWVI?=
 =?utf-8?B?L1Y5SjZaRTN5UE5qNHYxTndJUlRGRit1emtaVnF5Mm1iM1gya29WNkhKRW1F?=
 =?utf-8?B?S0NLcWltc3BUN3l1MDcwR2pOTU14bEJuQVZsSko3SzZ4QWg1OHNzV0k4YXFL?=
 =?utf-8?B?SzJrekc2bmVjdExBandQOTk5dzFmMU1pWVJTZS9SRStERWpzTGRsZXJwWlRt?=
 =?utf-8?B?ZEpsYklxaVRPQ2tTRElMMlFZYmdzOHJ0SjRERGtYNmY2UjM0RTZRQXpHbEtm?=
 =?utf-8?Q?0K1V615YPBlf6xD94obMfMVkx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b43d62ea-1ae9-4970-7714-08de270d6c94
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 01:46:14.5688 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yll1RkbArILhZA7+AbD/i0uWBSDllaIckM20RQkYLrLoHmG02A9leTR2EYkcWNlUBlir1veZxMiPPuIXSsglqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7212
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

On 11/6/25 2:24 PM, John Hubbard wrote:
> On 11/6/25 6:44 AM, Timur Tabi wrote:
>> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
>>>       let hal = match chipset {
>>> -        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
>>> => {
>>> +        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
>>> +        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
>>>               KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
>>>           }
>>
>> Maybe combine patches 2 and 3?  Also, maybe this should be a range check, instead of listing
>> every since version?  It seems like everything past GA100 uses the GA102 HAL.
>>
> 
> Sure, I can combine the patches.
> 
> I'm not sure why I've been wary of using ranges for these arch's.
> I'll try it out.

Now I know. :)  Unlike C, Rust does *not* like it when we try to
treat enums as integers. Casting or other (messier) approaches are
required, and in no case is the end result a more readable on-screen
experience. At least not so far.

It is possible to mix in Architecture (Turing, Ampere, etc) checks,
but I'm not sure that is worth the additional clutter.

Maybe let's just do the long lists of chipsets for now...?

thanks,
-- 
John Hubbard

