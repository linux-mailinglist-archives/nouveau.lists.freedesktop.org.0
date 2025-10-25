Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2F34C08A02
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 05:35:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0218810E23D;
	Sat, 25 Oct 2025 03:35:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="aBK4bQoW";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011006.outbound.protection.outlook.com
 [40.93.194.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C1D410E23D
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 03:35:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dAuM4oiRfY/uDYJauAJwx6V/7BwM97ocdtBbeIwmf5CwCN+0hoa48DaiAA6G5hVGiqJq5KvUXtlVAyitxiv6163CJ5Rv4TEIfwPL9sdtwU3kAN91GmH0cQMTTWCOImALLGU15iQ9/slZqkGFQBhxVbu+e1iZzP/Oh/DL6P2cNB4QMeXOu5WKJH0wsKi+YQNzfqO8Y8Vo6naEq/A4HGSu8Xk0So/4PX8lFyOkkTAvqmpA4cedQExkYWDNof3LvlW4Io0KGNRCpgV1QZc9gzaYITObg8eHaI2aTA40+eFRm7Djh1+GmeXX/D2SP5YfkKb1tM51MRsuz6P+Mn8uJB3OqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EBhofpdYphqgGJxwtkXmcGePH/VQijYdUNUkqFsKhZY=;
 b=ECG24D4z6SsEaqi+4vq7IrAy7+MJ8pdw9H3wpRoNlR0VeLFbtCnMadNe5kjWqyYMZWQvQvDJD8/kkrjHlSXTsT4iJOG28yCf3f0RYx848SpYk3qRVRQbe5DGH2a4vp1KdlnzpRDySegTxxjm6laD+5EGf9nUpkW+rWM0nja4RbkzdEjNCb1fVBOh5SqG9NDn12nAy754kO4m2n/+oeu1fU1j1f1L+HpGhU2FW/zKwN7CY4pYe33cTPu1DOfKFkkUfyQN9iQWLMUGPiuIQ+BBg0stx7Llb+w2nanj17TbevuF5ONiSunvMnfxRDi81wYLcBQs98kImov923r+y4AG8Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EBhofpdYphqgGJxwtkXmcGePH/VQijYdUNUkqFsKhZY=;
 b=aBK4bQoWwAcU6fFL9lOG0tETqIN2nica5vzujGlqomZe8pwdqq5OO1Ey4onHjT3Y3N0v5oLLQsSYIyiLEPcLGj33VfF58qhj8uFJpIvX+t7DBZ+6fGAoIKn2wDoauUisdl7aX3AfLlMF9tVv7vJ4J/WIMIkwtXHr1ykNLw60IdZKNq9HgcEEOfEVYWjZmd8YCCNOygxaAfOoeaUnAnkYS180JSSnhq0EG8oDP93qUO3AiLykIs9BYJM4eqy1WmZFOKoKuKWzv2Fn8hmlZbY8V9mc5sj6hZiGs8ZWSloHb8VqbdetZISPrXLP6WV2b43fOdsjiwF4ACky89NPY+pyzg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH0PR12MB8551.namprd12.prod.outlook.com (2603:10b6:610:186::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 03:35:42 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9253.011; Sat, 25 Oct 2025
 03:35:42 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 25 Oct 2025 12:35:39 +0900
Message-Id: <DDR36ZDIVQR1.1W43G99PEGVQS@nvidia.com>
Subject: Re: [PATCH 1/1] nova-core: regs: rename .alter() --> .update()
From: "Alexandre Courbot" <acourbot@nvidia.com>
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
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251025010815.566909-1-jhubbard@nvidia.com>
 <20251025010815.566909-2-jhubbard@nvidia.com>
In-Reply-To: <20251025010815.566909-2-jhubbard@nvidia.com>
X-ClientProxiedBy: TYCP286CA0303.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:38b::11) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH0PR12MB8551:EE_
X-MS-Office365-Filtering-Correlation-Id: df5dc119-30df-45db-b052-08de137792dd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkdTcVRWYnFKSnBPaU1zS1g2V2pGeDlPZXVxL0xsTUlXb0Z2NGozMGFpa3R5?=
 =?utf-8?B?WFoydGtFdDV1YXRpUG9xN0NyVnpSWUVBSW1qZXIzVERTdy9KYWNuU3hyTjQr?=
 =?utf-8?B?MWtvYmo1bm5Cd1ZUUHh1eUY1ZktRVVU4dnN4OFJ5MXM0dTQzaTYyamhXanJB?=
 =?utf-8?B?Yndnb3hxMDFWdE5FeW4zemRNcGxwVjFZcDdzdExBMUlQejRMb3lQbjBKNFBN?=
 =?utf-8?B?M1orSVhYVU5vTzI1OG9hQjRKZlNlRmJwYUNhSHNtcUx3bUxVR0s4cG5tR1FJ?=
 =?utf-8?B?eTZaaDQ2ZCtkT2U3Ui83MXJyYlRncUpwQ00vSEc5K0NyTy9zbDd5M0lleWhY?=
 =?utf-8?B?OFM5dDhYYW1YY1ZuYS9SNXNPT1llaGd2ZFZaQ0NGWmpKSjliN0JGVnZzd1Ev?=
 =?utf-8?B?L3J3QTdXdDZoSEpHNVNSZ2NGZjh1SVhkVGJzNU9TMlI0T0NpVktWWGdGR3Jh?=
 =?utf-8?B?eEJYRFZWRGZmMVdTQnorQ29QRDdjVVYzRW5BazhPZytIL3pJUTZ5Z2NCYm1W?=
 =?utf-8?B?U1NYblRGL0ZUMkgxWUU2MHd2ZFBRMzRXT2FqV3RMSGNZZGJ3d1NkUndTRWxN?=
 =?utf-8?B?T04xcnhkc0ppUUQ3N2J5K1U2d00vSTZDWHhpWWFmT2NFRm1xVkt1dGliNWx5?=
 =?utf-8?B?bDNGYmY4Z3lSdmxJS29IWUl2bHFQTUQ0eGpKTS9HTmlMdzBvcUpHSkN0STh1?=
 =?utf-8?B?N0w5VFEwY2JTMlk1NFZFVWZnQnFFSkxiakZaR1pob29kUXBTeGQ0WWIzNWRo?=
 =?utf-8?B?RHYwWElNTlNyMmZaWldodDRaTGpXZ1pUMXN4ZEs5T0w2a2pIR3ZMV0dDTm50?=
 =?utf-8?B?NEVEQXgwRXE2YmpUY0FyOEZ2UlRkdWlNMTNjcVdGUU80aC8yWTFRMGRuSExq?=
 =?utf-8?B?d1J5d3k5Ni9meHJZYjREU2FLakpFSHNGRGxWVzFiMG4xSmNEZnY1cUVJeEFT?=
 =?utf-8?B?VUdHa0JySkkzUVd1MnhPQ1BYL3VaSjY4dVZzeUVuMkJ1T25GT3I0VUFZZVBS?=
 =?utf-8?B?OFF1TG5MUW1kUGw2cGttbDFzUlFwbVpOUjRzQmQ3R2JtSXpta0psWTVVdGly?=
 =?utf-8?B?OUVUYXJJY1VmdjJKakxOenRwNk14WExUYWg4Y0g0d01ndFBuemRHZVlaeUhX?=
 =?utf-8?B?YnlhemtHK2VmVG5rQWhCdHV2aHc4TUw5Mm1qeitMdVEvV3lkWFo5allmV1Vl?=
 =?utf-8?B?QysrMHdJNkl5Tk00Y2U3bFVnSHBmMEZ4RUJYcVc2b0hvUXVjQ005LzZrK1lZ?=
 =?utf-8?B?cktYcDNaVk1KKy90ZnpQZzBxSkVIWHhCaTZib1NZNWY2T3Nzenk3OFY0MVNE?=
 =?utf-8?B?R3c2d1crTFNBdlpjWDlIKy9oeUZzYkROSzl0WFFnazVUMSszQWZPby9FYTZ3?=
 =?utf-8?B?Y25IZk1xOTRiVWo5NXFWNDl6Z2hQUzdtK2xvUy9MdUxhM1IzUmVaNGhkNUl4?=
 =?utf-8?B?Sm1JSkkzYnFIK3NMenJJSGJ3L1REV2YyakpDK3RGTWhsd1d4NG02L1VZcnZa?=
 =?utf-8?B?Y2xtanI1a0VRL1RyUnRuVnB2aUpBb3RhRnZGSmsyMGE4dFVHSWIycW8zdEs1?=
 =?utf-8?B?NE50WUFpRWxXQ2FQekRpRGJyQ1RWejlIUGxsdHpQRmkyOFJXMVJkYU5uSG82?=
 =?utf-8?B?N0hCMG1NZmx0MFpLRCtHb2FaUmd2bHhDTlcwdFo3WjhDS0V1Z05rUVZxS0Rt?=
 =?utf-8?B?a1duQy9nZ2R0RlZqVnNoclVTdnJlaWxWQmJ5SWEvc1NyT1d5TDNXYjl2OGVw?=
 =?utf-8?B?ZEUwMEg5SVdlcGJkNlIvczQvVUZSakJGV3VPb3ZFRDNLWWdkMTQ2YkE4YlZD?=
 =?utf-8?B?ZTJKejJ2VkRWWmRZNjJaR3VJamdheWRLZnFJOXlqUVVlS2Q3b2hZdWpGS3Np?=
 =?utf-8?B?bHdrS2dUbWNvRjgwMTl6VktZbXkyUXRTdHBvWmxDTURPdCs5TzJOUWNWMzd2?=
 =?utf-8?B?NWMrZFZIUDYrMjZTK3g4NXRIN2t1ZU00VlFQaTE0dkJKVHJLek9rYVpQUTNG?=
 =?utf-8?B?eGlnaHlEcDl3PT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?QWY4dk5yc0puak9DcXM5Mi9vbXUyOXZlNjQySUNzYzlBM2R5Lytic2JXT2s0?=
 =?utf-8?B?b2pRU0trTGNDM0FzUkNJVDRic1k3d1JhazgvQmgreGJaWWhFRTdGR2N4VTNE?=
 =?utf-8?B?c3lBOTFqMEIrZ2Q5aFNqSnlyN2FoVVE5QjVySUVUV09FajdKK2NSOGpVQjBu?=
 =?utf-8?B?SVRDdnF3aUlRblI5VWw0aUxKQ1duUnlsNXZmWmNQSGNGUE5lZU5zb0dEYytW?=
 =?utf-8?B?aWxqcVBOczhjemwwWTJaZCs1WXhwL3FEZWpadlVDNHRkSVh1SVBvRmRMS1ZH?=
 =?utf-8?B?c1dCRWxNNzdMazhyY0U0dGthK0o4dkw4SWltSVVGL21EVUg1blZjYVZNa2FR?=
 =?utf-8?B?ekdZSUN0NXV5SjYzS0V5QmQ1LysxeXJkOVduUGlRWnFtWng0RTNRaVMzSjNq?=
 =?utf-8?B?U0F5YkYwRHE2bHZ3QzdlWUNibnNmbzZyakFXWGc1WXR2M0NLMWJEclgvMkZr?=
 =?utf-8?B?SkNQbldnMGh5Q1dYZnpMM3kycGlZWStySnNEZnEzNTZaS1NaNmZqT21WZW9D?=
 =?utf-8?B?TDV1OUhIUnRLbyttZm9lNTRaWHdtdlorUndad0JXbU1MbU9tazVWYkthS1Fi?=
 =?utf-8?B?S2g5UndENjUrbTRjRFNZdGViY1d3L3BFcE5RdmRTMFpFVDExMDdIamdUS3FY?=
 =?utf-8?B?emVYWkw5RmpBdHV3Nmdod1NEK2c1Z1FGVlo1RzFOVWhIWmlJNVVkcEhMYkR3?=
 =?utf-8?B?aS9WeGV5K09ySUZBUDdDc0dpMUlUYkx2Zk50N0VlZ3pmaE1ydkpWbWFRM3NN?=
 =?utf-8?B?WlBMVkhLQUh1VHhrbnBpVW8xcWtraE5Ra25UVnVSY2ZBZy9QN3dCc1UrMmwz?=
 =?utf-8?B?RHRkc1Y4clFLK1VsSE5XSVFXczVrWXpTZmJzODBtMUo1MllrS2tmMGM3eFh4?=
 =?utf-8?B?MDJQcmM3bVR1WmdXOWJMN3o2TTEydm5tUDdPWGtjdElRbGZBeXBCeG1Gc3hY?=
 =?utf-8?B?K0pVNG5vQ29vKzlsTzdLMld0cCt5QU1uN1lMcjNMaGJqbWxZb1NBQUhMSnhO?=
 =?utf-8?B?aW1SNmpaSEVVcUthM2dTekM4S25yRm50dWxZQnNENWZ3R0dsUE5Xa0xCTFgr?=
 =?utf-8?B?YVg0UU13TEsyc3FLanB2a3ZLV2lOUE5MVGVXYUwvV0RQNExwWWdrc3M5cWtG?=
 =?utf-8?B?RGdnK1RvNkF0NWhPMk84N1VjalZJaVp2ZE9NSkY5YWh6NzFYNEEzUkp3NUhC?=
 =?utf-8?B?R1VCSlhSQ24weE1ZWGI2Smx6U0VPcVVTYkpacjM4a0labSthRnZNWFN6NjNG?=
 =?utf-8?B?ajBtNTZKeDQ2SG1HWGo0aGpRSHMrVW94YTVjbGJBZ2ZHdVVUaW9iUXdvWXpi?=
 =?utf-8?B?TEw2cWRKL0hIbCtVZlFSZGZSMEpKVUs0a094RE9Dc2ZBNStER2R1QTcyT1Nx?=
 =?utf-8?B?anVhUFY3bEZuSWFhQTBpaTcxOVprMFA2Wlk3c2pPNnoyd0ZCaTJjWUlwTlFi?=
 =?utf-8?B?SlYyQ2RCYk9HWFd2eHVzZ3RZR09OLzJ4cmNhc2JRYkxmOHVZZDV6bXZuL2t4?=
 =?utf-8?B?MmtQZi9idVgxZFkrYmh4RkNOdjdWU1pwdGV6aE8wWnJKMUd5Q0YwYkptWE02?=
 =?utf-8?B?WG9nYjlzK1pPVVFyT3g5UEJZSk9HSVpLb0hJWlhDV25MaDNpemw1bXpnVk5W?=
 =?utf-8?B?T2djNlRXYzNJRGlCRHZMSjk4OXpuMWtVT1ZyYmYzS2IzdkplY0xubENVSTdP?=
 =?utf-8?B?ZURTZmtTQm8za3Q4YnJwQ3IvYzk3TGVkWWlJa3M3Slg4dnMwaXVWaXNvZkRu?=
 =?utf-8?B?WkRUdzdQNm1PRkRVckkxdXRTcU5qM0pFL09BSnlFTmY2RHdRdEVpVUlMbEIz?=
 =?utf-8?B?L1ArdVpiaEhlRGtVL1dYbkZwaXhya2dwWEpWcjM4Y014QUtJTjVlemVXWEpY?=
 =?utf-8?B?V1JiSHVDWVpyZ2J4SDBPZDVaY3VHQW8zUnErbVk1RGdqaENGTll5MG0ydTRs?=
 =?utf-8?B?QVhvdDNoeERwNnptVFdCY1BKbDgzRmNzaXJYZDNxMlh0TGI5TVdpNHdmMzdn?=
 =?utf-8?B?VCswRVQzQ05mS0YrRnZXRnVwZXZsZlR1TE1NN3JOejlSSVBFcXpXYStpaC82?=
 =?utf-8?B?eDRFV1B6Wk9heEZHclBtRzdjWXpCWXQ0VjNjTkdUT0VGNm53WmU3Wmd0bDcz?=
 =?utf-8?B?ZlRHeEZFTVdMZ21rTUVHNythNmJ3Z3k3Sysrb2tlcURTQTcrOEh5bVd0MEJH?=
 =?utf-8?Q?dznJiSD7F1MVKuvTnX8iotvb7+CxUtdiAgl+JtkSVJsZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df5dc119-30df-45db-b052-08de137792dd
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 03:35:42.2315 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vHp7X46mw9in5G2uz8GWX9KtJ4q9Yu55bHIKED+hGr03TE7cUbewqnK4SHowMBYvgr7bszwmvQSbuzWuuzBjKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR12MB8551
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

Hi John,

On Sat Oct 25, 2025 at 10:08 AM JST, John Hubbard wrote:
> This also changes .try_alter() to try_update().
>
> After this commit, instead of "read, write and alter", the methods
> available for registers are now "read, write and update".
>
> This reads a lot easier for people who are used to working with
> registers.

I plan to apply this quickly as this was already discussed and agreed
on, and to avoid conflicts with future patches.

If that's ok with you I will add that this also aligns with what regmap
does when applying.

Also planning to add a `Link:` tag to
https://lore.kernel.org/2c5d90c8-e73a-4f04-9c1d-30adbd0fef07@nvidia.com
for context.

