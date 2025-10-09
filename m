Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 44562BC90DF
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 14:37:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D41F310EA1A;
	Thu,  9 Oct 2025 12:37:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RvjLUsdt";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013043.outbound.protection.outlook.com
 [40.107.201.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1050D10EA1A
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 12:37:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=nZqXoEOSVB8HbvXNcQJwTJPNwa9+LY6jkiAqaybuARSWRQf18aKHlZEo8XGXg8sQknRABChgN99NAIQOiOKJY5AHvXTI83oWPDKSCqxwzdJBENnnaXMEKi433ymuXppnW7NmiXZ9YEmgUOP4hpGmEwe4rw2cka5CrI2nw4Mnb0OOGfoPYes5GAi4nUi40hl2asZUwnszJvT5hNyEV1H0s+nAyU4gfpIdtNGivlbpIm2+CiQ5OcbmJbsrmI+naxeUN10ye+ErkKkHLtyVz6va+iK+I1aIxdMsFiJAEj4bxfw13BpFs2Iho+ks0HiEELCi6FVHzSHSGKSSJKGx/aT0Cg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sYX5cR4zQYQpuAlWZaj+ZDSMXOj5oC6uxW01PAaN8/E=;
 b=KjXu9WlnOFM7BxiYR6h5rqDKYv0pnYBQZXmOygHx8AFeDuSAeQXbQ1fh5NKy9VBdYh4QuYSk47gLUds/8W4QUoLecJja+DR6l1Y8jGdOH7BTPLG36N5VJfChwyngz3MLXpHpmQs23WDSliQqdFKydGxOSx4ALD6j+ZSvlcnM55DlSLhwPTvwCq+6FOWjvU4lPl9t2DpfXZz359J0Q6wI2E0ZLXkmbKKOUK70OIzGtNmtV8TFFDzgZdfyxRnD7jc50xi0EUWCF34e7xFzBbfI5hcLdS6c1MWzFMLYtH1GU9lZBuVvOCYdfth5H706ebkhtX259IRaiot0ZaOvapCDng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sYX5cR4zQYQpuAlWZaj+ZDSMXOj5oC6uxW01PAaN8/E=;
 b=RvjLUsdt1XtYZeLL0Je4H+jBECtTBzPeD3EI15XkCL5li6VxfPZqwI/WRMs9ZglbbFcB9WHiLOZfSp1UZNLvt34pyDH53ShZI0P9SjcwqHrP4KCmYOgz/ZQboUR79u9oYLTfVfjS7oGXWMSPN547T1GuMchmxtwmhCZ90hnpOPl6F4GBoTGmMurhVIDs465HOM99FUY98Z3rxPf3GvvwPqUMtAcj5mZQwC8XgGcvdeOyAeswTwZkSH/otwk5WDbjxS9Ugw3wbLsAkO4Zt6WQEuOIf6ZtpYldL225iU44tuB9Qo36bIVRQpf7WrmNH8hWmz/9+GEYopYr9LZf0cPuEg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 12:37:25 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 12:37:25 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [RFC PATCH v2 0/3] rust: bounded integer types and use in register
 macro
Date: Thu, 09 Oct 2025 21:37:07 +0900
Message-Id: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAHOs52gC/1XMywrCMBCF4VcpszYyCUm9rHwPKRI7UzsLE0lqU
 Erf3Vhw4fI/cL4ZMifhDMdmhsRFssRQw2wa6EcfbqyEaoNB4zSiVtf4DMR0kTBlpQmt29HBs2m
 hXh6JB3mt3LmrPUqeYnqvetHf9QeZf6hohYqoxcHt0bK3p1CExG/7eIduWZYP3avtFKkAAAA=
X-Change-ID: 20251001-bounded_ints-1d0457d9ae26
To: Danilo Krummrich <dakr@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, 
 Edwin Peer <epeer@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TYCP301CA0030.JPNP301.PROD.OUTLOOK.COM
 (2603:1096:400:381::20) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: dd4de3e4-eb87-4e38-e7ed-08de0730995a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?aCtPR21HMTNWSjYwZjVma2VFTHRPZnRkZ0RsSENtcmFLSXRwNzljM09MNGNY?=
 =?utf-8?B?UmQxaWJEdmpXbzM5U2VlZmYzbWFvTTV2NFBqY1RKNGs0a3dvazkxZ1ZpcHVX?=
 =?utf-8?B?dkg3bFNUVk5VMjNqN1N0SE1nZWIzSnUxVkwyQ1VFbWh4VjB5RlFjVm5OK3Q4?=
 =?utf-8?B?QXlPNlFNdHk2MXVoRjNBZVV5WUNMTnl2M1JKMGhoZVB2MnpIcXBFNEhJcVdu?=
 =?utf-8?B?NUJPUW1ySTNJT1FUZXREbVJ5dFRneXNZUTFJd0R2U0pOUGhQd0R3NjJ2NWZC?=
 =?utf-8?B?SS8xOTE2ZjdJaXpabURXSjBEWTY2cG5lOVYyRzZObWx4eUJlWTVLUEkzVVJh?=
 =?utf-8?B?VENVUkdmcE9WL3hlTWMwYlh2d01CUmZYVTJSQkVsZ2tkanpZU05LZEJWK1Mv?=
 =?utf-8?B?b2ErOVpTaG5aTlowY0JVTlQzdU5KeHdZOG43SVFUUytTemlnMkpmN0VwMnZw?=
 =?utf-8?B?d0FPVktJL3FFd2x3SVRmMmtuV21CcUYraDdvQkNiM1F2Z3VPWVBKSHcrb3NJ?=
 =?utf-8?B?RTVScXN4cE1zZVloemp0RFJHdUR6Z3BxNHlOUiszcXZDS2FQbEJiRnZrWXQ2?=
 =?utf-8?B?anVyRWlOKytkekxCTHkwK3ZHZjBUZ1RoWTVQb3BrWTVtQmxCWVBRUlhDa2RB?=
 =?utf-8?B?LzR1SE91cWNTb1lKd0N0eHBGaXN2ZVRiMzUreVpwdzBYSCtwVTFMQXBINy9K?=
 =?utf-8?B?NC9EeHVVRS9Md0N4UGR0V05tNmJtUFpxNU56eHdRWU53UVloZFRQdHdaK0JH?=
 =?utf-8?B?bklZUFp0ZlJqaUVqTHh5Wlk0V05nTnh1NW9zaVN2MjFnTXpLT0dXOEhxT1ZD?=
 =?utf-8?B?MkJJREhYMmxqdFZaeXRLbGVxYlg1SjNwUFRIYkhIZ1c1ZnkxeXZOdy9hYXRr?=
 =?utf-8?B?Zi9xRFBUZysxN0VBR2VsdzBOdVUwUnpQSmVXQkhSUFROblY4Wm1MbUV5NEd1?=
 =?utf-8?B?NVBjZURJUDRIVFV0T0VSd2s0T1BISzhVUnZ4elNLMjdhOXNkVmhwUjlkVU5o?=
 =?utf-8?B?MDdXcmRsZGxtZ254bTlaK3VFQldJeWhOcTJNYnJjVitWWi9BeFl3V3p1NDdl?=
 =?utf-8?B?bVJrbUVERGZQSmk1djJiSzRnUkF5K0tJcVJmRWk4Y1U2UVNsOVhzSXFWUDNV?=
 =?utf-8?B?blYzVTcxK3drUjFvY3o3Zk9XNlhwS25sbXFTdTJ0M0EwNU9vZml0MmN3RVAz?=
 =?utf-8?B?ZExKZ1FKV1RtZXV2KzFKcXdHSWJkVTNTYjFLRmtaSVU4bGxndTBOZnM3ZHpv?=
 =?utf-8?B?Vnd6N0lIckZWbUFJQ1RYd2hEbmxMaTlQU05kNU9CQkVCRkFMN3JWbmlsaTJT?=
 =?utf-8?B?L002VW1xQ2ZQckUzSXBtbE1LQ1dXV2wwd3BZSXB4d0UxVHY2d1RCdGRObTVq?=
 =?utf-8?B?TlFYTlg2bEhNaDRuaThCZjkxZ0hJcmUxZE9yTjdDUTZUQ2U0TFZMU1V1b2tU?=
 =?utf-8?B?cktURzFlVW5Cd3BnNnlZRE45aHhkclEvTk9jUENrNXJib3pEejVBcldhNits?=
 =?utf-8?B?c2ZjZHdzMm5pRXhJVHJWeDlwdFhZU2dEbEFkMGZ0M2RWandRTHpTS1JXekIz?=
 =?utf-8?B?YzVEVkZtQkhvQWhtMzdvZmhPK3Vud0M1akN1RzJPRkZRS1VKK0M3cFVIckxB?=
 =?utf-8?B?QzlnaHUrZHZ1WUM0WGxZWTVaSUhSNmZCRWIzQkQyUFFLdW1iSmxaVEFkVGZq?=
 =?utf-8?B?Y0hMdXBKTlA2aFhYRGtIdXRyTDUxR3pWdHRzV2UwTENVZFpQNGd4WDFQb1Ft?=
 =?utf-8?B?TGFEK1pJdWNNaW8rVG5Bdjk3RlZHMTIwdmt5ckVjS1Y2TXpKSkpDQnpTRWFh?=
 =?utf-8?B?akw1dzNvWnVQUzJML003d3FOTStSNzAvNzF2OWJvcEEyZEVSeUFVdnYyeEJj?=
 =?utf-8?B?VzhmN1VFU1NsOWhvbHFxWWhKNnZiS0lmc0pTdk1VbU5zdFI3bnIySDlUNEFM?=
 =?utf-8?B?MG9jT25ybW5WNThIUVZpTDRrc3licmxCV2tGZ2czTTZrbUZYRE5TRUtUbHlh?=
 =?utf-8?B?MlBLL1U3eW5CaEliWWNIQ2tYVzBkL3ZTN2ZqaTZsN2VzTlZlZHhmQmUvdjN3?=
 =?utf-8?Q?5VDQCd?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?K1N4dyt3T1IyUllyMWFtc0J5b1lNcUV3Tnl6V1gvVUkyV1N2NmVKY2NSU1E1?=
 =?utf-8?B?S09SQzRTaElmNzZVWFZZN0g0RERqQUpaZmZOWHFzZXpQbTUxdTljTytodVo4?=
 =?utf-8?B?aTNFSUhvOWpqT2VNNWt6RUNzR09oOWFzeEg5ZjVmbVZENlIvNFk0N3hFSWxp?=
 =?utf-8?B?VG9xemF6Z29uQmc0d1VqYmpnMG9sb0l6RUxUenRIYWt0RWZPUVZPNm83ZzRO?=
 =?utf-8?B?YmdXV285SElHNUY5UTFMS2dsYmpMeVlvTVRJUFNhbTFVbXBkeUw2bUVBc05q?=
 =?utf-8?B?NVRkemc2L0lMUUNGcVVFWkhVT01BUStMcFdja0Y3d1BTMEtEM0h6emxSSURn?=
 =?utf-8?B?OVEvZVF1R2tWREJlWS9VU1hBZE9XRWNMVk0va0s3Smx3eDh2T2ZacW5rdWxl?=
 =?utf-8?B?TjhkT1k0T1NQWXZxSG5FVmVldzBhaGtmYk03aGpXdVk2STgwR2Z1UnhONlV2?=
 =?utf-8?B?S0lyUkdNYzFlb283cy9memYwVjRGUnljNE9uZXhQWFRTR0ZWM3ZjYng2aFdW?=
 =?utf-8?B?RitLRzVRcTBnVGN1Njdzb3ZUMTZKdVVjTE5NeVMzZEsrb2pJaUxTYW5zYUh3?=
 =?utf-8?B?Zm5tWUlQbC9GVlFYZXJSQS96NXRUNVpCNERJTGZXc2xVVGxJV1Z2M2pWY2dD?=
 =?utf-8?B?Z2kyUmoxbTRIMjJPU3FUTCswcTlMWmh0cmRYNGhUN0hXb2tqQlcrS0Z0cExZ?=
 =?utf-8?B?WVFRZUc5M0ZidURmU0NDUGtlVnlBWHlJTjNaNDhPRmVEVXVTcFg3MGY5MGxH?=
 =?utf-8?B?bWg3QW1BMmdCa2xjdjVIQ1NkRmROUWY3OEFiMXpZYjdkMzcrS1F1VFlIVmZP?=
 =?utf-8?B?UG8wVUxibU9FWG92QkprYk04U01mQnQxSXVLRlB3M3cwVG5WVEIzK0tuZzBM?=
 =?utf-8?B?UGVFWVZrd1ZHdEpIWW9qK1dhWWxvNk5JZmIyeGp6d0N4SUcrWmpOMjEyMjRM?=
 =?utf-8?B?WGlNdXAzdm1xTnJ3WURTdnJ0bVpHNm8yMEZ4cDczVklSMlM5SWVPVEp3dnZk?=
 =?utf-8?B?THRPWEdWTVNDd0Z6bzh6TE1KME03WDdCRG1YZVVsSnNnbjlQTHlnYWRQenFh?=
 =?utf-8?B?T25JblY0eWNxOUVQNUtwMmI0NytCcW92UTA4bnBCQ1pTaHZPSlc5TWVmTUZ5?=
 =?utf-8?B?dTBCODF3blBjY09DZDdQQmFnb3FZOEhyL3htRnJUM1RIZFNYNkJ1VDc0ek0r?=
 =?utf-8?B?ek81NStadG5XUW1mdndWbFRzMXM1VEZId2lOWFZOTnpKUFhGZjlNbnZ2azFt?=
 =?utf-8?B?REl2c2lZaXdTcTJscDNzOFRPdUJ1bFoyb0hyOUZ1WlRjS3oyU0ZHNzk4QU9u?=
 =?utf-8?B?WlV0cEE2MHZ4T1pZZ1psK0M2MFF4NHlPMjZzMFJiSjVoaUVSSTZjVzBLalFo?=
 =?utf-8?B?UVNnV3pCQnYvM3VXQm9tdms0R1FxZ1hxRGF0VEdqZzIzREFmMFUzZzBkdUhl?=
 =?utf-8?B?V2ZHeHlJZ1JFOVh2NEt0QWtIcWl5Qm5FR1hRSHFwN0JYU2xxb2NLNnBkcytr?=
 =?utf-8?B?aVk2ZlZXSTRYaThZRGFlVEQzdlZ4UjRVWkozeDcrVHV6dW05SmJTZmVsYWlO?=
 =?utf-8?B?L1U1dFh2Sy9pZWhOUTJhaWFMcC9GdXowcEVRcHZlWTE1TUtLTW9Nb2VnS2Qv?=
 =?utf-8?B?L3ZGTzA4M2pONCtsUXVGSldlelp0RGRRVmVRZGFwajI5T2JKNTI1TTNSc0c5?=
 =?utf-8?B?ekEyUTRNV29UeGxzd3o4R2U3Q0VsZDU4SlNraXNHRkExTUtISUx4YkJ2QTd4?=
 =?utf-8?B?K1ZpUTl3cU5XcDYwbC92N3hxcWZHb1VDamxHMXpWVFZUeExIc1RDck9oSm9w?=
 =?utf-8?B?dG9ORG9jN1cvcHZnZWNXd2tyMi96Y3R6SWtYRlB4ZWFWamlmb2svVVhoNVRy?=
 =?utf-8?B?eGJkZ09hS0FpZm56MDJBOUk3QXkrWVByK21vOHA2RmY1dU9qSWR2OHMyUVJw?=
 =?utf-8?B?L3IyYTNYQ3k1T2RiaTZ4UGFwbXNsYTRlaUxPdjJ2Nk42WFQwclExT1FCUGRz?=
 =?utf-8?B?Q1ZVZGxGTnVFSXFxQ05sZUZxYWJLTmlwdkVsYWJWbGxFUzlrcTAxZXpxdkFM?=
 =?utf-8?B?RHQrMnNtTDhYci9vVTE0K2ZMZHROaEV4NkRqMlJZMittV0I3aVpMWU5QTDZ0?=
 =?utf-8?B?Vm4vOGlmOXJzRWk3ZWRuQjVVKy95aUpSQlgzaGIzcVJtVEJTd0RoKzhZKyt5?=
 =?utf-8?Q?fCbqRapiXJ1DfDgJizeu67PtmQmaqtrHdSxTW68d2k3E?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dd4de3e4-eb87-4e38-e7ed-08de0730995a
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:37:24.8547 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nJqXvXsQ9FZQ6CD9jU8kJidzRVBxstV0SBMfk7XwcxW5ZiEtHZ0JSOM68os5C5nCTBwAk2NKQiBVGgjtopec1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8315
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

Second revision, much more complete, of the RFC/PoC for an idea I
submitted a bit earlier [1] regarding how to handle truncated bits in
the register/bitfield macro field setters.

Currently, the register macro allows to define fields that are shorter
than the primitive type used to set them. For instance, in the following
register:

  register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
        8:0     base as u16;
  });

The `base` field is 9 bits long, but is set using the following
setter method:

  fn set_base(self, value: u16) -> Self

which discards bits of `value` higher than 9 without any error or
warning if some happen to be set. And so you happily start a DMA
transfer from the wrong base address...

While this behavior is not UB, this can also be a source of bugs.
Several ideas have been submitted to not let these unnoticed, including
making the register setters fallible, or panicking or printing a warning
whenever extra bits are discarded. These solutions are either too
risky (like panicking), or add extra code and checks on what can be a
critical path as registers are commonly accessed in interrupt handlers.

In pure Rust fashion, we would prefer to guarantee at compile-time,
whenever possible, that no bits are discarded when setting register
fields with a non-round number of bits.

This PoC proposes a possible solution for that. It introduces a new
`BoundedInt` type that wraps a primitive integer type and, using a const
generic parameter, limits the number of bits that can actually be used
within it. This is similar in spirit to `NonZero` or `Alignment` in that
it provides a static guarantee that the value it contains is limited to
a certain subset of the possible values of its primitive type.

Instances of `BoundedInt` can be constructed infallibly when the
compiler is able to guarantee that the passed value fits within the
allowed bounds, or fallibly using `try_new(primitive)`.

This type is then used by the register/bitfield macros to let the fields
getter and (more importantly) setter methods work with the exact number
of bits they can handle. For instance, the above method would become:

  fn set_base(self, value: impl Into<BoundedInt<u32, 9>>) -> Self

which guarantees that no bits are ever discarded by the setter, since
the type of `value` carries an invariant that only the 9 lowest bits can
ever be set.

It is then the responsibility of the caller to build the adequate
`BoundedInt`, which very often can be done infallibly, but all the cases
that require a fallible operation are cases that the caller should have
checked anyway (lest you beam out the wrong memory region on your DMA
transfer!).

Compared to v1, this version of the RFC is much more complete. It
notably provides many `From` implementations for conversions from/to
bounded types that cannot fail, which removes a lot of the friction one
would expect when introducing new integer types.

Another side effect of this is that the bitfield definitions are
considerably simplified, since their type can now be automatically
inferred. This means that

        8:0     base as u16;

could become simply

        8:0     base;

And the getter/setters would work with a `BoundedInt<u32, 9>` (provided
the bitfield type is backed by a `u32`).

For convenience, this PoC is based on drm-rust-next. If we decide to
proceed with it, we would do it after the patchset extracting and moving
the bitfield logic [2] lands, as the two would conflict heavily.

Patch 1 is a pre-requisite that should be merged to nova-core, but can
be considered external to this series.

Patch 2 is the `BoundedInt` implementation.

Patch 3 makes nova-core use `BoundedInt` for its register macro, and
serves to illustrate how callers of the register field accessors are
affected by the change (rather minimally imho).

Feedback is welcome! If there is no pushback I will remove the RFC tag
for the next revision as I think the `BoundedInt` implementation is
already rather exhaustive.

[1] https://lore.kernel.org/rust-for-linux/DD5D59FH4JTT.2G5WEXF3RBCQJ@nvidia.com/
[2] https://lore.kernel.org/rust-for-linux/DD68A3TZD9CV.2CL7R7K4UAICU@kernel.org/T/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v2:
- Thorough implementation of `BoundedInt`.
- nova-core fully adapted to use `BoundedInt`.
- Link to v1: https://lore.kernel.org/r/20251002-bounded_ints-v1-0-dd60f5804ea4@nvidia.com

---
Alexandre Courbot (3):
      gpu: nova-core: register: use field type for Into implementation
      rust: kernel: add bounded integer types
      gpu: nova-core: use BoundedInt

 drivers/gpu/nova-core/falcon.rs           | 118 ++++---
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   5 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   3 +-
 drivers/gpu/nova-core/gpu.rs              |   9 +-
 drivers/gpu/nova-core/regs.rs             | 139 ++++-----
 drivers/gpu/nova-core/regs/macros.rs      | 264 ++++++++--------
 rust/kernel/lib.rs                        |   1 +
 rust/kernel/num.rs                        | 499 ++++++++++++++++++++++++++++++
 8 files changed, 783 insertions(+), 255 deletions(-)
---
base-commit: 299eb32863e584cfff7c6b667c3e92ae7d4d2bf9
change-id: 20251001-bounded_ints-1d0457d9ae26

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

