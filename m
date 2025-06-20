Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3743AE1BD4
	for <lists+nouveau@lfdr.de>; Fri, 20 Jun 2025 15:15:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2A7E10EB5C;
	Fri, 20 Jun 2025 13:15:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Y083ZR6o";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2059.outbound.protection.outlook.com [40.107.92.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A671C10EB55
 for <nouveau@lists.freedesktop.org>; Fri, 20 Jun 2025 13:15:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gAaeCS5ZpsNmr8BCf+pzu1ftxGBEKKIC4R6LVC9eoGuXaxxeDZnYfI1MLcKyG5YeArUfSgkpr9hZLJi99C5qyUo/GhpSQBf8nRV3uxuskLcVgZ+jEg+75+8vFIQJ0w30gd5dZrX1Bg2FnKwW9/lZv+lGNhfUDf8SWik4PB/MkrQExHF9GNyPfD4fgUcZ1Ab19Z7OvKm0Nh0JLOTBbS6R6HR1xbuCuCXVDZj6YW4UQTKDiSES19x6MjatwW4/1gPD7yaGQ6MIoZ4ztTITo22E1/JQ9+iwIse+x0xAqI+8C11PJps2EikK/I7Y8TCHfU1bbsnb4zU5MkXVkFYgmpFZjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ffdv7mK1aAMEuio0MWBoLIkToaJk28pZf56SqfK5ZKU=;
 b=xufDsPsFV4fK+gx+qFyVfBolXll7tejSXCgcufRoSfO/RUCiS0LGqUxxSPnyidIjoLGOVN/25y+4lHYx/9uXbc4Jl/V6wd/HWVq6pIqkrJ2kgPVvfRf35im28MwK0kXkwtMDnXDcdFR4xuoQKfQ6oGDlWUT2VK6Rf0U4gh5B3vgccYrfXaYFScvQLLXxjmmDtoEH/jgFPwETi+KSJ20uhfFaxuTUBaFXGuJu3j7DJ2H9N8r8dmF5kX1CLzHvNIQGldSaANYQCK1AbANNt9+w00N9Ia/c94cqBQ5lIqf8oyde5iLQt5cigQ31MCu7b8SD5gY5OJ+o/JvVf3zVTlABAA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ffdv7mK1aAMEuio0MWBoLIkToaJk28pZf56SqfK5ZKU=;
 b=Y083ZR6oB0tZuMJjpMUUSICLWW2pXoEjkMjHCObqq9ZfIpuX4Tp7UnczEzvd/wnp2Ccg+NIh0YEhFOLvQSLcoe7iHj5xXcObzHx07hJ8+DH5y4Kf2Mx95VdxM04Is6zZas8AU8kf1in3JIPECAijrdpqRWSsdd2zGe3G7vpJdpcupAmSIe0y7FBBjP6ieAz3iQFXaF31Omu3BO8D1yKc4l74yx9INHr99BYClV3bx+18SOAZKYmpSDKJrBiDlHrChwJSycS0PLqGk123mVWkNIeRsbeSRlmVukWj/euF2NZce0FqllPlsRV5lI+3MuupqBjnq4NKppjvBuQb7Cf8aA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB8426.namprd12.prod.outlook.com (2603:10b6:510:241::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Fri, 20 Jun
 2025 13:15:13 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%4]) with mapi id 15.20.8857.019; Fri, 20 Jun 2025
 13:15:13 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Fri, 20 Jun 2025 22:14:52 +0900
Subject: [PATCH 2/3] rust: num: add the `last_set_bit` operation
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250620-num-v1-2-7ec3d3fb06c9@nvidia.com>
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
In-Reply-To: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0115.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::19) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB8426:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a5af15e-39a4-4182-fa32-08ddaffc7d9d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SHI1Rnp5UFdIQXZaa0ZZY2JGakplZ1VRTXJzT1JsWHFJaFYrZ2pwdWJpUStC?=
 =?utf-8?B?QkZHdDhOeWtsbDVmejVYTjZPaWYxMURpUFo0Q3E3enVyRWV1dkJNUzc4L2dw?=
 =?utf-8?B?WXllTk5hOHkxdU1GQzhDNzhaZjVDaGtyend0YzBmcWhGbGd4cFVyMmhUQ0Z6?=
 =?utf-8?B?YW43ZjVEeW9JcENlTlpQUmtMNTdleUNlVThYaXpkaVBIS0JGWVlwejFLYlds?=
 =?utf-8?B?ZzhwRUZ1Y2dCQURWOHRWbmhWRkhwVHNac3NDTEc0Vlh5WWJjR3lVbHBXTUFJ?=
 =?utf-8?B?cGFDTGlzbFBQR0tTUmlWRzdsZU8wOWFXSVljN0VoVTFuM3VtR2VjRDJlbjRj?=
 =?utf-8?B?NlgvUGEwaDdpd1BVTU5CQ08ya2p5QjM0dWZOS0RFTGR1MXNFa3luMWorWnRC?=
 =?utf-8?B?enJJYzducUh0MGhZb3FlMU9SMmk2dUtRankxcHYyczRmaWIxT2N6Tk81ZzZL?=
 =?utf-8?B?RjVoeVdlSzUxV1VibXNtSEhkblNzRmJEeTdRK1VwbnFNYXhjLy9kelZvVWtR?=
 =?utf-8?B?RkxRd0FwSFdIVzk1ODllMzNENjJDV3Jyd29SUGxCNHNyZnlQWDhZUkFva3Rp?=
 =?utf-8?B?dEhIMkpmSk5RS1lYSng2Z3I5ZDFsTzlMZEs1TC9Pa3U1UGRSNjBpTjIyQWdF?=
 =?utf-8?B?ZkNXR3IyMG1jMkR3cllHRy9JWDNXZ3RJOWQxNnhzOWVsTFhDWVdSbmtCOHZ5?=
 =?utf-8?B?ZEFXc2JlaFdPcXc1Y3MwbzQ2NUJSVDFRMWFsbkVCSzNvTmVabThzcXFwWEp4?=
 =?utf-8?B?NUh1SWsvbXNyMjRzdWIvT3BqVWFHd0p1RGVGbHQ2R3lZOHNESWRhOWc0YnNS?=
 =?utf-8?B?bjVZRXNIcDhMNHNEL1pqcGZGbmtEdnh1Mi9GVVVCS2Q4b0lIaS95SU43SjNS?=
 =?utf-8?B?eWM4Y2NMN0FWU1VGRG5DZ1hNSmhLWnY5ZERrcXNKVnVnVmt3RjRNV2VYQUVK?=
 =?utf-8?B?Y3BkeHVhZGJQNFRQWC9aN0JUdFIvRGFNQVBBTFRWZzA3NWJ3RzEvTlY5VmlJ?=
 =?utf-8?B?RUdYRHBOWGVzMlh2TjRhbS9xbzFoRjVlSUdjbkYzbSsxNUIwRzFselRVc3Jw?=
 =?utf-8?B?THlSbURvdlR2bzlUUVBaa3hYQVd6ZnpwTXRWSGtiYzBXSWNYY01YQVd0aVpi?=
 =?utf-8?B?OC9yaXc1MjA3N2djZmRLazJNcWxIcEluSkZuNTE4NytxYWJMOHNrQndibkRa?=
 =?utf-8?B?blFtbU1PeVlXUjREem5tZEtJNkdURTBuT2htQUlSOVIzWmhDS1FnTHZwNVB1?=
 =?utf-8?B?L3VJaFlWTmhaWnZZZ0xoV1ZzRjRBWlVZOVg1b2w3MWF1YmxtS0NRQkYxY1Ir?=
 =?utf-8?B?NW5SUjVsVXVFZnRCNVYxZXdWN2dkUnNRa21iTnFnQ1hPRUtFejFhUGVpT29p?=
 =?utf-8?B?bTdLMXBKR1lOUGlTa3hPcFd6QStMYVBrWEZJVTdIaVhBZDNYSFF1eHpsY0l5?=
 =?utf-8?B?MmNWSjc1b2JUZ0k4M0NHeVBYT0grRDJLblB6ZHhoMkp0R25iVm5uVVN1QVhK?=
 =?utf-8?B?WDZVdlIrbWZvOWNuT3JnNkNvRWhxbEFmY3JlOUpId290U00zZ0d3UW9xbU1Q?=
 =?utf-8?B?YmlTaGF1dTN6SFlkOWx5d3l0NXllYksydjllSmRPM2lqY2RuSHVQaUtuaVlJ?=
 =?utf-8?B?ekU4SVFuS3BoUGVEU2g0cEhJY0JEOWZzQWtzMVdrMklGYjFMamdQa29Gc2JQ?=
 =?utf-8?B?Y0h2R2V0REo2aTdFQWh5aldxRFFIQXhzYXdzd2s5emphb1VaUmFjN3Fhajli?=
 =?utf-8?B?MXVsK3d6TWsxSTZrbk9nRklDakoxMllsYmlTZjVkL09iSlVLUXhRR21Tendu?=
 =?utf-8?B?ZnpyWDRmdGVqRm4yM09XbFlYckdTZE9RMTlmRjJaajZxeTN5NWhZS2hMKzF5?=
 =?utf-8?B?aHFLVU95d3lhZUgyV0czcWltRFNHMHRQNDc5TGtvOFEwWEtNU3RTcjdMOW54?=
 =?utf-8?B?VU9tMDI4RHRldE5KT0RjU2NnZzYvSCsveGtYMU82eXlVRGlKRWJIV0JqNWVQ?=
 =?utf-8?B?VGoyQUJRNW5BPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?c0JNdHIzTVJuQU0yVXE2ZUZLa2RIOWhrWTBRNjQvREhjdEU3S0VROUJPdjV1?=
 =?utf-8?B?WHQ4bFhmWFM2TEdPRGEwTTJNNVY3N24wc3ZFOFRTWmxiUVVsUVlCNlVsK2NS?=
 =?utf-8?B?OHd4RytnOVRtRU9XUDY0eWpNTCtpSU9HcHlQcEgxdGxER1NQbFVBOUpmdmJB?=
 =?utf-8?B?eWhFTUV4ZVMveWRBTmJvTitPS24wSVlRd0dlczNQWWtTUXZBU2kwdGtpQWhS?=
 =?utf-8?B?ZWIrNXFKTDI4OEZJZVE1YzRaQk0vcDhqR1N6KzRTN0pTajlXV1JtM0src25S?=
 =?utf-8?B?T3VUS01OSVVGVFNEd1VDVlNhQVlWSnFaU3dZdFF5cFpXT3hvTTNlbUE1ZXF6?=
 =?utf-8?B?VVlvME9mMDlZOXNrZHVyem9oMXlBRnRPaWhnVjVMTndXU3ZoK0NYMWhPOHJB?=
 =?utf-8?B?SHZOc0xQdERSN3VRTHpOMGpzYWZmc0dLWkJjVjBhT1p3L29IOVBzVVBQeGt2?=
 =?utf-8?B?ZzZBT0lxUndybjU2ZDYzNUE3WkNQYmJTd2RpazFLc09YclFUTnBaOG9BOU9m?=
 =?utf-8?B?VjFXT3RLUnZJMUVCOFBDNlNJRnFIMkY0V0ZvQ1I4ZVVJSXRqMmtYSEgrNGMx?=
 =?utf-8?B?WERIdjZzRXg4VnUvV2hSK3JqeXVxY1RBZ254TCs4aTcyRHV1Zm1YbFU2Tlh3?=
 =?utf-8?B?Vnh0YzFvbTVxTnY1Zm9TOGxFSlVRSVd3NjdJbk1kZldpYTRxZVZBamcyalFx?=
 =?utf-8?B?VmU3NXRja0F6QTZYNlBXK3Z5amY2SHNSc2Uxc2dDOTA1dlIxUDk4WjdjZ3pN?=
 =?utf-8?B?UjBjWE9tUit2Ymlvei9rTk90WmVWL3dzcFdyN1JzL0ljbUw1RUQrL0EyWVJJ?=
 =?utf-8?B?SUc5eGpMekdmRmVTdlJJTDFTM2JrRDE2VHJCaDZueXBZdVVTT1NvV1V3ZFlX?=
 =?utf-8?B?Ymk2QThOZG43dW9oaU15MldRRXAyWS9Ddmg0eEw3dEoyNnp1ejhtR1Z6QWd6?=
 =?utf-8?B?a0NpNGZQSERMRmNZS1h4NW5maExTaUlNZ1RUZnZBRWJGbDlCWmUrY1lKSzVZ?=
 =?utf-8?B?WXNDYkoyY3ZJLzhUTzlVV2xPYXRMa2dESVNpRnVKWWpTYzB0V0N1MnBFbHd1?=
 =?utf-8?B?TEpkR3J0a1prTkh6anhlVHFlMTlzWE1XNXB1alJ4MkNsd0pDdndOS1FDSXox?=
 =?utf-8?B?ZXAzV1lYcGtmZG44Zlc4bWdFQVFKeldCUTg2YXdUNE1mUUtDc2lzRlBUWHI4?=
 =?utf-8?B?d1FBc1VDS1poaGFmODhHRXdOZnVaMXVyZFcyK1pIaGFJSjBXZm5qckN3bUp4?=
 =?utf-8?B?MWZKMkx3TGU4Z3JtVllUaWhZbU5VZXlTcW1zT205YUhJMjRWRmlJeWZtbFBG?=
 =?utf-8?B?QWhXM0lNTFk1a0RhNkxqYkl5NEtZTkhibFphUWg0d0VyUFQ4UjFuOE1YdjZh?=
 =?utf-8?B?enp5Z3hpaDgrZG9TdHJubWU4WEIxc2x1V0lQQk9UbUc3QlEybVJhb2J5N2J4?=
 =?utf-8?B?UEZJVnpxOHM4T2FublNZWjVnblBYODlWbzlPMjdwOFJ2ZEJMTnoxNW1PUjU0?=
 =?utf-8?B?UGhFV1k3V3kwdmpDUDk1cnFabndNczlKcWNXME1wdGw4bU5kZEE0WlBKYUt3?=
 =?utf-8?B?MVQ0RDYvN3MwekEzakJ0SmZPS0ZSdDU4VDNHSFlLbG1uMysyZWZBbXZaT1NZ?=
 =?utf-8?B?dkJDc2pXUWZUcDFrWjVESVpjYlZ3dGRjVjRHaGlKMFdGK2hienNlYUR4dzBz?=
 =?utf-8?B?bmFob2ZnQkFmSzJBOWp3MEdIdnE2NW4yMTJDSzN3clBnM002d0tQQU55QVRO?=
 =?utf-8?B?QTNSY29XWUFhaFNkWEpFZWt0cCtNd3hwSkRMWGdzdmFzQ1VyZ1BHWStaRzFn?=
 =?utf-8?B?MktacHRQZzQ4UkJ4TVdvSzJBOFRPL0pHN2xVMEYxVXRkQVM2Yll3WXVKVnNx?=
 =?utf-8?B?eTFzSy9kVFdBNE01MFBUUVdzRGNOOXdkQnVveHk0eHBETkJINkpHNGhYUHA3?=
 =?utf-8?B?eHFpbDJhaG1WaXR6Y01wWEUveFJxN1RST0Z3NXBLT3d4TSt0aC9lLzlkUVpq?=
 =?utf-8?B?VjBBUXNhSHdIUDdFQ2gyM1AzZ2lUWnNNOVFoV0tHVVpsVDhPVjVPYkZVVFBS?=
 =?utf-8?B?OTFQYXhyVEdZeEpucmdjY1hCUUVqRzJNb1h0a2k1VE1FeXg2d3YxUURuS2g3?=
 =?utf-8?B?Q3BwK0l1NjcxL1hyZkRmekNDbitQWWVzSmlCMTBPL1d1TGVGVEkwQUpDKzBJ?=
 =?utf-8?Q?QW8948RIKPx2CshdOlYqnNsE8rcQOzP5MUD99Ni8xZgl?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a5af15e-39a4-4182-fa32-08ddaffc7d9d
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2025 13:15:13.3031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: k/WZdklxeEO3kICEUqc4oTh6pghfLDgFAcgt4gEM06BRrnZw2MgCCk06Eal29WD9EI6iuNoRvDh1vL6U+8Y9Nw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8426
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

Add an equivalent to the `fls` (Find Last Set bit) C function to Rust
unsigned types.

It is to be first used by the nova-core driver.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 rust/kernel/num.rs | 38 ++++++++++++++++++++++++++++++++++++++
 1 file changed, 38 insertions(+)

diff --git a/rust/kernel/num.rs b/rust/kernel/num.rs
index 6ecff037893dd25420a6369ea0cd6adbe3460b29..95766201a7cf208989f37ecbc6d54d264385a754 100644
--- a/rust/kernel/num.rs
+++ b/rust/kernel/num.rs
@@ -161,3 +161,41 @@ pub const fn align_up(self, value: $t) -> $t {
 }
 
 power_of_two_impl!(usize, u8, u16, u32, u64, u128);
+
+macro_rules! impl_last_set_bit {
+    ($($t:ty),+) => {
+        $(
+            ::kernel::macros::paste! {
+            /// Last Set Bit: return the 1-based index of the last (i.e. most significant) set bit
+            /// in `v`.
+            ///
+            /// Equivalent to the C `fls` function.
+            ///
+            /// # Examples
+            ///
+            /// ```
+            #[doc = concat!("use kernel::num::last_set_bit_", stringify!($t), ";")]
+            ///
+            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x0), 0);")]
+            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x1), 1);")]
+            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x10), 5);")]
+            #[doc = concat!("assert_eq!(last_set_bit_", stringify!($t), "(0x1f), 5);")]
+            #[doc = concat!(
+                "assert_eq!(last_set_bit_",
+                stringify!($t),
+                "(",
+                stringify!($t),
+                "::MAX), ",
+                stringify!($t), "::BITS);"
+            )]
+            /// ```
+            #[inline(always)]
+            pub const fn [<last_set_bit_ $t>](v: $t) -> u32 {
+                $t::BITS - v.leading_zeros()
+            }
+            }
+        )+
+    };
+}
+
+impl_last_set_bit!(usize, u8, u16, u32, u64, u128);

-- 
2.49.0

