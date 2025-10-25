Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A41C08A9D
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 06:04:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0020B10E23E;
	Sat, 25 Oct 2025 04:04:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="S7l8Yxk9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010049.outbound.protection.outlook.com [52.101.46.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0711210E23E
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 04:04:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=InkdnaOoaYBT7rN0naF+8yLAla+EZ/+RImwPrQFEckz0Z5Uic03S8KXeCbhonTFxbQrCsD0AhqKC2b+tdv8LtnZdz4y0Pg/H+ju3ToXLPsp6/279wB8+ft7R8VnD0hI8PSHITDyfox3hMx3j+vaU4Vi0W50AkTbd6w2jeHiOzTcVKDVfnFGtyhDINVWdgLmYxBjcMWWZ6ojcSMwwYX3dOXuuIhg6dGB0EPO5tdiq4t3wCcfahnaWCydA2gtdvtJE6nC7LCHPZPLwW+SxqMlTYFNFyFsEVcYNK1TeHh1g1XjhqXFpp+qSUn37lNmoi09cpKbaVmxgGNAOJ0JueumkxQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CE3A9GV92eHztp1qZ5NP28qj61GqT0XT+Nrk166xuNY=;
 b=J5e6PSKD0kCoaGgwE6bAfXMAESqm8KdijJqR+b/zM85gEko19SPF2uP2Po+a/ZrL+yBR8KTo5gBtv4kza1cW0gP1aKDn5lHHwKnicrxMiJvlzIlhbiVubhAYXcgb/H5dAq8oQt0UwMiLH8sJt3FhhDeREb7xpoWKatnfzZAMPbaMHgLVbuPAB0Ts3IQhV/qn119BwZfdIoWG/mrA1oVs+k105yZqHqk8aYJmv2/DTzyFA/Q0wPvZD2uv1dVGVgYtnKVBx9Bd6oW+8xsFdI/5pa9TlR3RpDd51SzKXEiX3ZGWjpI2qDtFGhypeAH6eRlz6QyEk1IvDKK7vK+dumpNYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CE3A9GV92eHztp1qZ5NP28qj61GqT0XT+Nrk166xuNY=;
 b=S7l8Yxk9c1NXuAvYsCgMRrBr4jPPyc4XznfsK9Zaui7xSTy+xGUjwyZGeIFiM8GIawOpho1kVkgPNJC+077MDTPcDq7aaw3F0fUMU5lhZNh+U1PCVCvN6oSWXoIwsFwrUo0OzYMdcUhiDQU0KQIN4Zf8/zDG/e2V2ygIiKX4skXTdo/NLt9kXqeWJjd1VcTwx3EWODitwyftCd1w6hBmcf4HIbJia4N8HU8NmL5pSu8kA9ciQb/dXb41gI3EbYSsuCgP09kbEAMRwe5SJfQ1kDpkjDjutIIwZl8Oawc4wWB9yQS1l7gkQW+fHYGSQ3PBNXRN3QfC/HGeghzpfE+IgQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by PH7PR12MB5855.namprd12.prod.outlook.com (2603:10b6:510:1d6::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.13; Sat, 25 Oct
 2025 04:04:23 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 04:04:22 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 13:04:19 +0900
Message-Id: <DDR3SXMHQE0Q.RRCAKETKT5EW@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Danilo Krummrich" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>, "Alistair Popple"
 <apopple@nvidia.com>, "Edwin Peer" <epeer@nvidia.com>, "Zhi Wang"
 <zhiw@nvidia.com>, "David Airlie" <airlied@gmail.com>, "Simona Vetter"
 <simona@ffwll.ch>, "Bjorn Helgaas" <bhelgaas@google.com>, "Miguel Ojeda"
 <ojeda@kernel.org>, "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng"
 <boqun.feng@gmail.com>, "Gary Guo" <gary@garyguo.net>,
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, "Benno Lossin"
 <lossin@kernel.org>, "Andreas Hindborg" <a.hindborg@kernel.org>, "Alice
 Ryhl" <aliceryhl@google.com>, "Trevor Gross" <tmgross@umich.edu>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "LKML"
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 0/2] nova-core: remove HWCFG1 and need_riscv
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251025014050.585153-1-jhubbard@nvidia.com>
In-Reply-To: <20251025014050.585153-1-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0356.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:7c::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|PH7PR12MB5855:EE_
X-MS-Office365-Filtering-Correlation-Id: 1f843c19-cc3c-43c3-69ea-08de137b947c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|10070799003|1800799024|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K1JTcVRRUVdZQXVDMjlRckFKNURrc25pd0kzWWVZOStJVktqMmdMcjF2ZW01?=
 =?utf-8?B?OVpycjZuWUxzMEpQNGtSRTJxdUNnUDdUazFBbDZWUHd0cjhBSStKdEs5MFNH?=
 =?utf-8?B?N1o1K1djOE9jS0IzSVJOdnhmcnJxZncvZE5NL0FWam80SEVmR3JSYnpreS91?=
 =?utf-8?B?RmRycmZOSHRmeEtjOHo3b0xRYVlEQUhzS1dqNDU0Q25qV1ZueDBUcWZpVGhE?=
 =?utf-8?B?ZHlyYWNlMmtrRUhsb000T2ZqR1pGeVJkVGd6M2V1MzNXLzc0SnFFT1ZRVUVL?=
 =?utf-8?B?UUF2NXllQ3Z6WTVHb085TzNaS2FvMUJjR3g4THRvZjZmcW1OcW1CZHZHbThJ?=
 =?utf-8?B?OXVUcXdNc05oY3g1cDBXUEd0UDBQNWtSeTEvMlF5THRtUldYN25FVFRLNHQ1?=
 =?utf-8?B?WW5LckhwWFkxYXg3Um93bHFZOURtUDN1VGl4a3ZWK2VueGFtc29NM2NwS2ZX?=
 =?utf-8?B?UW0yMUxnNkU4V0ZvbEF3TXhZZXJtaC8vaHpSOUhsbk0wcVc4RUJZRHB6SCt1?=
 =?utf-8?B?cU5aVC9jNnV3MXM0MTVTRWNtcVhXMjV6dW01ZTNldDZvc1Btd0NNWk9VU0gz?=
 =?utf-8?B?d09NLzYyZkk0dnJPT2N5bGhuTjRuY1pkQXZNdFJMRnZzSEdUVmRTOUwxdlZa?=
 =?utf-8?B?dDAyNU9jOUJVTVh3akJ2Y1c4bkFNcUJOdFlVS1NwWXFKZ3JLRDVCZTIxdzE1?=
 =?utf-8?B?Q1RrNERpelJYekV2b2V4ZFN4L0lxT2RtOURyTFVhR0cvNVk4eGtzZzBUdDFB?=
 =?utf-8?B?NU5BeVhGbHJHcDY5cFZNclZqRVJ5MStzSTMwZzU1dUR1SS80N1pIcFBYaTE0?=
 =?utf-8?B?VUdWUTAyRjhUWCtJTmxiWEFPaWtSd1ZqNXN6R1QyU2U0aEJCaUFKS2FveCtS?=
 =?utf-8?B?WDhrdUg0TlByallyQzdST21pVityNVpNSUhHcEd1cVRlVkRPSDBLZWFjNy8y?=
 =?utf-8?B?NEZuczJ6YWdpL3JkL2JLQ1F6VURjVStlNU5EVHpvZ3ozQ3RQUVY2QnRUNWpQ?=
 =?utf-8?B?dG9UdFpibzBKUEY1ZWQwVU1wZllBZE9oeWdWazhwdXhUNkdwcWN0S0xiU0o5?=
 =?utf-8?B?akovL3M0RFVNWUd0b0NjY1hiWk9FUGRCeEh1Z2RKVXhqNHhneHlmRUxNdE5Q?=
 =?utf-8?B?TVpLaHA0NURnWlB3MEtaMUp6M3Nzc1E1T0xJSTYyRDh2TWszekpOK3l0bU9s?=
 =?utf-8?B?b2pCd0xCV1BNZU14VUp4azViWjlYaXI5MFRNM1oxYXYxL2FrUmk4bE5kSmYw?=
 =?utf-8?B?UURDQXFTTHJDU0dqUnZmTXUyalZiMys5UWp1cFlGTDJKSmZOMW02V0QrUWt1?=
 =?utf-8?B?S1h0OHlUSElSYnc2amVjdWQwN01VSVMxRTJ6Y3NWblMyY1QyWGFSMVFPeDB5?=
 =?utf-8?B?ZlJqUDBBYXgvRXhidUFlUURiM2QrNGNaY1M0ZDVyV0FmQW01cXlmOFduOU1W?=
 =?utf-8?B?a0ZNTGU2WnpWaThtdXlwUHYrZHpkTzh1Mnh0S1NmblZLb3N3QlZWSWhMU0Vk?=
 =?utf-8?B?dVIwNytmNmhlM0VFd3B5MG5IQ21hbGZYbnVPMU01WGxTK3poTlIwWUoyTkgv?=
 =?utf-8?B?ZmlMTDQrR1N2T0U5VGE0b3RCdndwYnlTNW1zd1ZES2Y2dE0yK2ZQNjR3YWVP?=
 =?utf-8?B?aGtwZHpFeGd1NThzL0RxcHgzd1UyOUVKWkxqaDBjZU5iT2hVRFhnOEVxN2NW?=
 =?utf-8?B?YUcrNFplS1c2REhqRmFyb0k1WHh2MlJxZUNkV1FSY2tPWmQrY1BtWGlrSnEr?=
 =?utf-8?B?M0JnRldNamdGTHNZbmE1bXNBK2FZYzhIalZkTlZWZmdkNXM2N1drdzhTSGts?=
 =?utf-8?B?aElzMlU4a2xrZElhaUJNaGpzaGV6b1hOdzdUcm16d0ZaelhjNnR1MUFBVEQr?=
 =?utf-8?B?aVVRRHU0dEpibHQ4WE5xVUIvRHhDSGdHaDFUczBlSFYxdnV2WFhCWVM5WVZu?=
 =?utf-8?B?VkgxOWtuVnk4b05EZXExNHpPbGxDRFhxVDFBSVg5Z000Q2FrbGF1SVA3QUVn?=
 =?utf-8?B?Nll2dkM3QlR3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(10070799003)(1800799024)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bDFPaVcvNklXdVpmWFdrRzZkZlY1dXAxNG9hWklxMy9GYU1HbmNHeVJMQmpY?=
 =?utf-8?B?WThzVUNPdEhOdkxyd3VkN3B0akhPdS9hSmtOVlBSb2FmTkJ2TlhjN3dqeDdp?=
 =?utf-8?B?NlpENGU0TmlFMys5T3ZPOXVkL25YRUF1ZE9PTnR2cDVlc3hLdWo4RFJHTjBs?=
 =?utf-8?B?c1NjTWVIUVFLSEFsa2xwMS90MW5CTXpaN2tJMWxpRmU2S3lMV1NYU0JIS1FQ?=
 =?utf-8?B?QVRPRWVBQVU5dHhyTjlCcnRjNW9WODNwenkyREFscU9wdVIvOXY1eG9pUDEr?=
 =?utf-8?B?dUJOcHo4NDUxVDNWYW55Wjl4U2p3dVZFeFVzOERDN3VjNjlMWDBzaXVOU1pi?=
 =?utf-8?B?ZjdudHphMVR3M2dLWi9kY2FtTzdqUEpzekV2Sm5DWjd5M1BUYlZGWW10NFFu?=
 =?utf-8?B?VlVLZHY1ZVhWdFU2bE5NaWN0VmsxYWMxQTZNVWtNR0N6SEI2OWo4THZHYm5h?=
 =?utf-8?B?bGcrNndXUzYwcFZYSmVVOE1mMWhqT0xPUEtMeERQYWs3eFZHQ0UzTVJKQnl4?=
 =?utf-8?B?MGVBblBKak5xMDh1dVMwYXRkWlRpNFhobzlBTEcrM3EybTVnVWhuK05JK1B6?=
 =?utf-8?B?ajg5ZXFqdFVzUmFsaWdhc1U0OTh6RnlYZmxUV2gwOHova0NTbUJOSXhxd2NJ?=
 =?utf-8?B?SzZrSEYrTzg0bzZna3VRYzF2Y3lMbXFUYVlhK0RGZ2FKUWU4QjNoOW1kclJG?=
 =?utf-8?B?VGc1clc0MjRWSkpkRmkyd3pYUHA1Q09pWUs2dzdOWWcvU3dKaVZCZ0VtVU01?=
 =?utf-8?B?WXA3RGRadU5JTmVKZ1RHM3RVLzMxUGsydFpHY2FxeGF5emxJaGp3dUJ2WlhF?=
 =?utf-8?B?T2hFZm9zU2owcS9ZcHd2TUQzRXV0UXU0MHRmb29QY2tWUzhZcHJLelVUeTZj?=
 =?utf-8?B?RndxNXdCeW1nd1dZNHhEOG5mUG5XYm03SWtyNDJ6cE9qRXVLdzNhMGNuakkz?=
 =?utf-8?B?UGUwWTlVeGJGOURKaEZTOU1zbHNudzh1akhzMlRSRnI1LzAwUGNOWnB3bnFu?=
 =?utf-8?B?U3JWT29IZDh6dXJsenpIVlZkZjhaVDVYamxicWx5UkFOTjRnZnI2U3FJcGJ1?=
 =?utf-8?B?YlZoa3JvSG8vTVBRVklVNXQ3WEYwWmwvalpzaXVUbUNJQ1hxZk9aYTg1NFBC?=
 =?utf-8?B?ZlJBc2QzZXY2KzNQQm0rbEZoTTFTbUkrWHNXZy80WFZMVkR6dHEyY3pyV3Fu?=
 =?utf-8?B?ci9HMjM1OElwZGJrK0pZV2Rqdkc5NWRYU1BvV0NacnJwbTNDMjllQWFrUzJR?=
 =?utf-8?B?d3NLSGVqSWJPZUo5WExXRC9WeWo1Wk1XV3Vibk9xYkV2dUw5cndTcnJJQkdD?=
 =?utf-8?B?LzFoeFp0bXNYUkUxWnpYMG9ISmJwQlB1a1BHeEJLdWlINnNBREo2M3Rnb3NI?=
 =?utf-8?B?Q3dVdVlJV1VDMWFxKzJvaUE4Ym52ZGNNZXNRTFo1ZzloODRtTWt3UDdxbXNO?=
 =?utf-8?B?Vk9oRDlpMWR2dXQrRy94Q1hGRnlpdlpLbmRIMG52a3dtSHNMeHN2Sjhlem5a?=
 =?utf-8?B?R2xCaVNhemsxa3FNRE95cFFDN3QyWDZzK0xjRmJLUEJKUEhMM0R5emNNV0Iz?=
 =?utf-8?B?V0Y1T3JOaDZVa3B3Q1R4MFJLbnFybUZhU0RGdk42bklEUkFLVUpOTThsVlpk?=
 =?utf-8?B?WEJwYmlqcWZkQ25qYm14RTVCMWZyZnJnQ1hiTW5LMXV2OGFKSkNEd01RM0lL?=
 =?utf-8?B?RzJuUG5KZUUwWngxRlFvamdyWDUyOU9wbit3NC80TG9UTXRRSlYzdUt2ZjRu?=
 =?utf-8?B?UnR0SldXV29FUk8zQjdtM1p0dkNLUi9ydjhGcHUrZStpQ2RuTTY2U2crWFZs?=
 =?utf-8?B?L3ZFeis0MGpWUlZuTDVuVzFkRTFPZEt1RDVYcjZsZWVpc2RPUlFBdWh3bits?=
 =?utf-8?B?WTEvbElGY2g2TzVJS0MyZStIN0xLOWpvZ0h5ZkVEaEl1UUdLbllVT3hwZmIy?=
 =?utf-8?B?bFIrc3BWK0c5eDl6ejNZMFBWY2huYjJXQTUzUFg5eTZIUkVORURGSzlXbVZ5?=
 =?utf-8?B?VkVVdWxib0JxM2gxTlhZczdrcjhySTEzRU1oVjhjMHVmUzcrTHVFQ1djc2VJ?=
 =?utf-8?B?NWYrTjlZNTJBcXpKVVF6aFdNNlppbEl6cTJ2Uk41NVVsc2RCTFJ5cjE1MVg0?=
 =?utf-8?B?cDJXNTUzTkZhdTcwWWRXb0VHMC9ZRmdseFk0cEtWeUpQTXlBWUIvVjlQbHVj?=
 =?utf-8?Q?cbkl8IBagGTOrp/IEZWDINjTnN3Nk+k2IOmwZCqxVMdx?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1f843c19-cc3c-43c3-69ea-08de137b947c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 04:04:22.7847 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IXXaekF+XsqXGluvxP6VZx6mSkcyir8kAqU2SOvjv38PKoxfWQuG1ewtNjb7Kn4M35szxQ+6CvAXfpda4+r2ew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5855
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

On Sat Oct 25, 2025 at 10:40 AM JST, John Hubbard wrote:
> The second patch builds upon the first one. The series applies cleanly
> to today's drm-rust-next.
>
> The first patch is identical to what I sent out as a single patch just
> now in [1], because I forgot at the time that they should go together as =
a
> tiny patchset.
>
> [1] https://lore.kernel.org/20251025012409.577596-1-jhubbard@nvidia.com

Thanks! This is pretty uncontroversial, so planning to merge this
quickly.

