Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 675AAC59F09
	for <lists+nouveau@lfdr.de>; Thu, 13 Nov 2025 21:17:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1866A10E1FC;
	Thu, 13 Nov 2025 20:17:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dpTBVFB8";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010020.outbound.protection.outlook.com [52.101.61.20])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DCCC10E1FC
 for <nouveau@lists.freedesktop.org>; Thu, 13 Nov 2025 20:17:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FDeWlMUF53kXnqMaw/yQnes99iqQthja97TJeDPKMKyM2IWvlvGY9l4JvgmaoF4yolMNmHILjoRBO3eS6woQTemB5qTwKMiwn3kdX1WyB2uMcGmaYQR8bwtOOJLdA9vDM/mOeKLL/XBuKEROAfhlWmTr8q8Jdk8c1RyEwTbeKGiYGboDWGFcYSXdfptxMY2ZAZSgXHU4qEEXE65rGK+muHtq4cUW2XgAR+UDIlgLL3baxbq9ytkQy7szCs0NWzYoEEqw8JpCvRYQNeULK1DHRlNB5irF6Vl5lSDuH1tPzIObvtoiBQS5mkAAw3tGo2xrHuOK6EEYLirBOj+9xDWQ6g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XeKfS1qtUZNjRlt/yX//CSW7ujJO+mGIuB6c4Tp3ENI=;
 b=ARZkUEgHVHqn/W6e7a2RSEL8wYhG+BER+8RNz0XPGJcYEBzzNzumexUwuxsyiWwkU4Z3EOZHsKfnmbuzI3Z0TBr0i/dyQ+mor6x9pGhJpKzo6+TaYv44LRNfrXz5Ikq6m3D1m18mv6Ki7vZVHxNY1+tQvGsNG1UDWW1OZAiKxEos/zz39VmFC/q8Tx4LevQRuUak5LFz2zqOaLIHLnZRV076vZlQldhBGBRfNnqjpew8KxT+Ljmaxq40nIo1cFOnCYSdVXMvnVpoMBdiqUaY2SSwymQfdLsAbCYnxcaDoH0u/Do2XpQbkatdzjLlnr9HgF4U7TrsLGlFJAQcCyWm6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XeKfS1qtUZNjRlt/yX//CSW7ujJO+mGIuB6c4Tp3ENI=;
 b=dpTBVFB8YrThkhx6j8CQZWmgI+nQgKsxb30OrPo0mWhzeL+lbfO5CYuN+qAJ4aHCp5HnwY2XmBzvsAtXuM8rDj0pnqi/zs8vrou+fHHVhZVd3x752BfXbJA+9qC/Wf6XtPAnnZAFWGtjNaclaOW8i0sYcr5XqlOJR2fyzrIzdC1ldzVxDGnCBGO12cN0TENq/h0rEma4N3xeWfqHrc2/4ycSfF8z/3IU99n33E1OmGWC0u9csNBCg4Sv2Acrb2tkVf/hl98UlwOdFR4eOLkpsOLT0q9j8IduLudBuxYO48ZdADtr5tEU4IC+/H3nnCzEcL8VPYhy/KQTQsfcT4fDig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB5926.namprd12.prod.outlook.com (2603:10b6:510:1d9::8) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.17; Thu, 13 Nov 2025 20:17:27 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Thu, 13 Nov 2025
 20:17:27 +0000
Message-ID: <3c5803cc-eee9-4a1e-ba67-b9470c1d5125@nvidia.com>
Date: Thu, 13 Nov 2025 12:17:18 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 2/4] gpu: nova-core: prepare Spec and Revision types
 for boot0/boot42
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
References: <20251112043000.83071-1-jhubbard@nvidia.com>
 <20251112043000.83071-3-jhubbard@nvidia.com>
 <15ec55ee-1ea8-4879-87c2-2895731c2545@nvidia.com>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <15ec55ee-1ea8-4879-87c2-2895731c2545@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: SJ0PR05CA0063.namprd05.prod.outlook.com
 (2603:10b6:a03:332::8) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB5926:EE_
X-MS-Office365-Filtering-Correlation-Id: dec4be70-78e6-4e75-b02c-08de22f1aa4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?MDFZQjZ2VGhScWtkdmk0ZFFyMFphaGpackRHbzVWWk1aVW85bTlMSXR2YSth?=
 =?utf-8?B?aGRyWjI5UkRIVG8wSjZOVFZSbXNDcjRXaFlRc3dueis5VUdEZWg5cEJmSlc0?=
 =?utf-8?B?RGRmT3UxWFQ5WDRmd2xkSk5FakJvVFBhdEdqMTZrY0o0WVU2SnhIM0FFOWxR?=
 =?utf-8?B?TmxNdzdwVUZPSzdTNXpVeWJQdUg4akp5MWpDYkFjL1doeDQ5anUzZDhReFhj?=
 =?utf-8?B?K0o4czljU1U2WHJoRHNQSElscTJ4K3VXRjZnTExYNzFZQzRTVDRya2xpSHVG?=
 =?utf-8?B?Rk9RZVFTbnNBSmxESWw2MnhBN29TNDNYcHZYUGFmTnZNSlozZjQ3b0ptYXFx?=
 =?utf-8?B?bkhMQWdDbFpONmNsUWQzMm9qY3lQWUxnQ1BjZ3ArZ0dXNkVNdnJ4aEtwMllO?=
 =?utf-8?B?WHkrSFBxYy9tM1M0UFRaWUdXVmNNL3VtbHUxajFQeFF6WXNZZk9zbjF2U2xZ?=
 =?utf-8?B?ekNERVFSaS9JanFhbEUyaTF3aEhlS1U2eXl6ZUZlZ0VlaFNzQ01XdFF2TlB4?=
 =?utf-8?B?c0VwMngwZEt4OG40eHJxVlFKR1QxRmE3bU91QS9CSWRFSGlyMi8zOWZUWGdO?=
 =?utf-8?B?dHFmUGt1Z3JQa21taG1IZkZoQmg5MmNnUFhjN2pJclR4b2J6WVZFNkJObE04?=
 =?utf-8?B?bG83MjdLR0owQWJta0RxWVJZL1RGaFFTN2NBRHRadGFuNWYybEVRc1hiQVB4?=
 =?utf-8?B?M0hJd241Wlo5b2ZVM0c1QzlYVkI0bzJRY3M5TUdRU09LVmJOVGlxVHpEWWF6?=
 =?utf-8?B?N1dDanpFUzV2SEgxZHNBQzdUaG5MUnFwZHZqTDI3dDRhVE5hdkNhUXZONWFi?=
 =?utf-8?B?K1B5MWxQWGdycFJPaDQveklrSGRpZlhmS0QvRzh6QWZrRkdRMDRTbGp1dlBD?=
 =?utf-8?B?T1UrMFFFa2JRaGRMSXVvSFFPUFJObXovR3drL2oyZzNOUmwrNlNWTkR0S2t0?=
 =?utf-8?B?b2ZFNEl2cXU5VWZKTXJmbVRjRjBmamc4NXUzQ2ducyt1Wlh4Q25LQ3hzbzcx?=
 =?utf-8?B?TmZvZzd0SWJ4RllHTDdIOG8zUFVSQU1ZMEsxaG1TMnNDMWRYblZMb2lhMUd5?=
 =?utf-8?B?Wk5NMXNVVG4yT0V2S2ZJc2o4TlRrTG5BdUJieFNMZ29tcUl6Q1RBZHJQQlh1?=
 =?utf-8?B?MlVMUElLTGJybHJNOU43MCtKdEIwQ29aRHpSQiswbnd0YncvTWpHNzkvT01Z?=
 =?utf-8?B?bmg2TEpXbWJ5Y2dSOGpMaHoweWZ1TUIwYXdtS2tTMXYzTm1sa3VEMXpkb1lY?=
 =?utf-8?B?VkVtTFRRdWRTNXRpbmdFaVF6QmJIemFjM0FOZDFwa3R5VVZmejNSaHBlZU1m?=
 =?utf-8?B?RkFMRDhYZVVnUmg2dDJhVHNmSU9Ec3JiVnR6NXIxdDUveDJ6ZVBnRzVkUHBm?=
 =?utf-8?B?dkc4c2RYQ1lOZ2pFbHlqODFYUjQ4VTg1cFhBSTFieWlHbExrVmN6SjU3TnBm?=
 =?utf-8?B?ZWF2bThPV2dIRG90UEtWZDdUS3oyMWh6T2RtWUp5dEE4UTJrWERiUW91RVdO?=
 =?utf-8?B?OGl6L1Q5d2JkWnRQbzZJd0hMNVRpaGR4a1hISjZWUnhLVnlkRlJNUjBvSDJE?=
 =?utf-8?B?ZlVJQU9EbkVEQzIyVXJkb05CajlHUUxVdlM0V1FPQzJZYVNmL0ptL29mL3oz?=
 =?utf-8?B?NDFONVhkNWk3ZnZGREZhaE42Ris4YXpibGdGTEFWM2pjYm5HS0UxR3o2SXlY?=
 =?utf-8?B?VEYxd05ZTm9sSE5mSTFQajlacFI2ZzBDMFpRVE9wVElYc2tpWnZMZGFCMWVB?=
 =?utf-8?B?by8rb3YzN2lmSW5pQ2xZZ3k3QlR3cVc2N20xQXNjOGNtMVY0NUxFa0lWTE1V?=
 =?utf-8?B?cy9CUGxjWlBvMnpkWmNMR1BNdXMzdHkzVXdhM29tZVJxYTVWR2dwU1ByaVcy?=
 =?utf-8?B?Mk9vaUlKS3lOU3F0QmRJdHkvOUp4YStLa0liRVoxWkZzS05pMEMyL2JnYXdv?=
 =?utf-8?Q?1Azpy1UN14x9h5Jeel0sbXBEz0INvp4N?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?ODE1RnQwTkNsU0RibmM5YnM1ZDJpWVVqS3lSTU5mWWhUM2U3VVRxR2FMbjB4?=
 =?utf-8?B?OTJQRVZURjJybE1pZGJqVW41VU91Uk9DS1JER01Sb2w0TWtuY2hGWSt0aWp6?=
 =?utf-8?B?d0dtb1l0OGkvQUpEeFRiazZNRXZGVEJQRkxrQXNUZE9naW9xVlNHT0gxNkpC?=
 =?utf-8?B?b3BnQXBBU0J4VXpjTE1yZTkrU2wycWNHdE9NTUhrRGFGNi9ORkUrWlVYV0pz?=
 =?utf-8?B?cnBUdGNaUXI0amJYRzhIdFRodnVRWndCeFM3UUJqdkFjVUpjYndCdGRoTTB2?=
 =?utf-8?B?UUdxL1dtUmN3Qk13QkFacU11WkZ4UkJZMWtJUlM4NnhtMWxQNnpHd1lkcFVP?=
 =?utf-8?B?eGZSdWw1SzAzMHFuYWk5aFJzb2ZRZmwxbnFOOHFsTlVMZ2o2aWpzb1I0Q3Bl?=
 =?utf-8?B?eFV2TzZ5bU5NeWxyVkdzVk5zOWsyUVBUMG90Rkl2QTRaN0NpVmtiSjN2a3Qr?=
 =?utf-8?B?ZEJrOWZLVVdjWlU4Q0Nkays1Y1BndlJPanlKZm1QdkFMRTdnb0MwU3Z2bTdH?=
 =?utf-8?B?UVlaQ3pSQjlEK1B1ZDVWRDZqTEdmSzJhVEtIMVhhZmZIR3NuanR5dHVJdVpR?=
 =?utf-8?B?aWRneHhNSms5SjR2NDZlSEdkQjBIakxYck9sZkZ5TUxBdTZFT3dtQUFwVHJu?=
 =?utf-8?B?ZWxGUHREM28yVWdJRW1hTk0veFJEbFRWREZyL0l3ZXU3L2VBSE9yQmw1STdZ?=
 =?utf-8?B?SUdUN1JDOFFZWFdoL3hqNTN2eXdMT1VQSjhKbmwxV0RnU2ZMbVFYaDFyWEEr?=
 =?utf-8?B?dTAxWFZqc3ZUVW9UTU5oK3NxYzZTamVnSjdVMGpabHZiUmFLazdJeTQwcHk1?=
 =?utf-8?B?VUxxK2xqRzVtYnF5cUlOeG8zRjJzWXpVaDhIdVNkRzdJMzZSN1FiSVN2QzBM?=
 =?utf-8?B?bS91Yk5UL0NkMGxrYUNkWHBEdkdkZFB6citSMVRibjZ2cUpRb0U2eTJCZGcv?=
 =?utf-8?B?Q1pjTEU3dE15ZHNnd0FybnJOMEo4dGdTVzVXT2RWS2N4RkdyTVU5blBOTTJh?=
 =?utf-8?B?OVNVMVRST1U2Z290STRtM296R2lkdURicEF0bnJIdGhvSTQxTW1GZEl2WjJa?=
 =?utf-8?B?ZkxMYm9ybzg5dXRJcDJkYVFBSnZEd0hEUFdYaHcyMmJOUXZiSTZ5S1BxUDBu?=
 =?utf-8?B?dlBidXRBUGVaQ2pLbjh4TzJxSGRlUC8vN2lPSkZLRmY0RHBTOGgwL2V4TDkv?=
 =?utf-8?B?Slp1ZlM5V2pNU3VXTTJLN3ArS0FqYTVFS0UyY2tLZ2kyd0EzZDBJZks3SXM5?=
 =?utf-8?B?ODJwZVpiYmRhQ0dQVTBud3drZVJBUE9WbVgrUTJWWGJqcTl0VDkwcHlHN1hF?=
 =?utf-8?B?ZVdJanovS0owcldQaVFweklBa29SZ052ZXhXU2hFeU9URFpmZXBtRnIwZWdh?=
 =?utf-8?B?SmZuZVFUUWIzcjMyOHozdkdKMGxOTVVNZk5PZkM1UzlaU1EyZHBBNWJONlhZ?=
 =?utf-8?B?aHlPejBEOE9VYld5cUQ1bHk0TmdJcEJUQ2pSWm0zTXo0VGxSRTVvRDdTaElu?=
 =?utf-8?B?aEg0S3Nka0llVU9Va1lIWko2UGxYcTlhSGlPbVhvQjM1MkV6QWtRclJvc04r?=
 =?utf-8?B?UU00TlQ4K0dSb2ltWmRtaHFUUWRRWVh2Wjg3bmNQTUZCUkMxbnRIR0tUdDBG?=
 =?utf-8?B?VWJyYVhjeVBYZ0FFRkFyQUJGVDJnYkdmaU96TFR0bEV4TVY4aHRyL0U0T2tZ?=
 =?utf-8?B?dzdsdXVUQUU1Ui9ZRm13VmVDTVMyNmpFM3gyNThSQ04ybG1MZlpTNXdnZjZK?=
 =?utf-8?B?cXBmNzFUNlpPT1JVZU9qdmp0WWREcTdIeEM4TGtUSnVIYkR4S1pCWnFmRk9V?=
 =?utf-8?B?ZDZveGdFS3NSVEc1TXNGUDdjOGhtMHBhTUxxUW5UVTR5SU9FRk9mQmNHaXp0?=
 =?utf-8?B?UDR1NlZFMlRmKzBVczFvbklrVkxBdG1XNVA1YVUyYnRoemZXOWZUVjRTWEMy?=
 =?utf-8?B?Mkw5WUdFc0Z6TDJ1V3BPR1JZTmltSkxrM3BtTlBqZ0pFbExLSVp0OUMxQ0pi?=
 =?utf-8?B?RmpPb0UzMWVtZUhLeUFHQXN3UmFzeU9zYS81d1kxMkcyZzB2aGRuRFRxY25h?=
 =?utf-8?B?dWJYWHQ3bTVBbURLTnFWVHhrYW9IMGREYk4wZ0dZT0doeG1zUXlBQjZ1Qy9q?=
 =?utf-8?Q?DBmfNADSuh9h4icl2lvhSHWzO?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dec4be70-78e6-4e75-b02c-08de22f1aa4d
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Nov 2025 20:17:27.4900 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZybLKhsTDm0BiErUV+T2lW5giz7SwYP9VmTtZ0tKWZinmf9e2y3O0tDh/c9pWmvNINWfurTrdz8x3HG/I42ZKw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5926
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

On 11/13/25 12:00 PM, Joel Fernandes wrote:
... 
>> -/// Structure holding the metadata of the GPU.
>> +/// Structure holding a basic description of the GPU: Architecture, Chipset and Revision.
> 
> nit: Can befixed on apply, but the types in the comment need backticks:
> `Architecture`, `Chipset` and `Revision`.
> 

Will do.

thanks,
-- 
John Hubbard

