Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7DF6C90E27
	for <lists+nouveau@lfdr.de>; Fri, 28 Nov 2025 06:28:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474D010E0E3;
	Fri, 28 Nov 2025 05:27:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="fA8giReE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012006.outbound.protection.outlook.com [52.101.53.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A27B10E0DD;
 Fri, 28 Nov 2025 05:27:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tFdrXZsB1WVs3Veu9mlVlryctmawJSdkS2j0vc3CPiWDGduG2T1rqZi+HqN4WAJNjhuWlOjTzgbP6WH0GqM2vt8R1OM1xflCiBlgavhqx9N2hLNAEiqv3QrWlDK1lyKToTC5/SuSkf5EraoSh1UWdRwCTHtZp0HrF8dE5jNsYtVjkIHM6K7vd5vCKy37RyVoJIS5COUvnX4XMDA5M1Z0Pa4hgBQxpNARNeS0n1WL55fs6/qsCMQbSHUrLl9Dx1/gjwm3kUtEKLBJVWV8tOmGgxALWO7T2uMkmlFI2Z8S5t3bkweACncdrcGSKOlEwNizuce5mfsqtA8kvk5H0KJzbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8pKX2BZcq8U0ETNe+if9HfdW0lfQ3HQbPYYHF52OHJI=;
 b=ixCzplWNp2hyG0QE9O/dxvp4Dz7q9p+2sjUgmQdw3F1lu2U69Oqh5ABkmzN7qV4Zt5pkxFb+9nZxZby2xKY5WxruLr2fRRm3aJcQ5ZiM9BcbudxOsuHWW4kGzDPwm3q6tSzjMNONp922eMuc7t3N7hoUOHaRDHeDqeI7Jiai2Dp3kx0DbtNWqgDiU30A3bqrz1tmBRPPWLRVy744+yOwpBwdtabyRnQT7oirUQilnUJVr33KqxrnPTmHf5X2S/V1si1j5aoC002UN2JxPcPgh4RtZbQb5GxUwT3jLeHH1ihUx7kxY/zzQBQYVrelooOQKD448YihVi46C2wap61aog==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8pKX2BZcq8U0ETNe+if9HfdW0lfQ3HQbPYYHF52OHJI=;
 b=fA8giReEaAU0JB5UQqrLHlRZAbU4mjcKC0a45oV5+2CcvybuGinAG/igIejTkNNxZkefQE96CItHcRr5XxtRIJ3IpqX/Tpbs2b+w7s0Q/KwORy+q7C3q9rnmWH9kM3xR0y5MLK0LtH3q2lLpOMkAQY3IzyvbQX2jpIRtJ5RiOsgvXJPL1ab1qpoRsfs7jMrIt2hAaWAYe4hnj4SnUp0GlXi8H8GcuwTwikfev7DnPm63FigCp0gMFLdT9v+hLHOfKNvJZp5NuBhYwNAasCQCb5mm9QYlpMJ7NQsfrnYsB1dkOF7FlbWieV5AwVZZyQAjZPga9wqHvRouVp/9+IGtTw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CH3PR12MB7524.namprd12.prod.outlook.com (2603:10b6:610:146::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.15; Fri, 28 Nov
 2025 05:27:53 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9366.012; Fri, 28 Nov 2025
 05:27:53 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 28 Nov 2025 14:27:49 +0900
Message-Id: <DEK2VE9DDHUP.SH7LJ2D3TBBG@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/5] gpu: nova-core: add FbRange.len() and use it in
 boot.rs
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Lyude Paul" <lyude@redhat.com>,
 "Danilo Krummrich" <dakr@kernel.org>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251126013936.650678-1-jhubbard@nvidia.com>
 <20251126013936.650678-3-jhubbard@nvidia.com>
 <44b56a133d2bcbb7606d31839bac1ecfab509ae1.camel@redhat.com>
 <49997040-a745-44aa-94d5-517845271094@nvidia.com>
In-Reply-To: <49997040-a745-44aa-94d5-517845271094@nvidia.com>
X-ClientProxiedBy: TYCP286CA0202.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::10) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CH3PR12MB7524:EE_
X-MS-Office365-Filtering-Correlation-Id: 8306c127-d213-48f1-80fe-08de2e3ee0c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|366016|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K2dqTDV2QWs4bDNKaG8wMDN0NklZU1ZCNkpvWmVqS2h1Z085SmxxYkVXNWha?=
 =?utf-8?B?eXVES3p0dTdZZVNLK2U1STBOSlZZY1ZPQjQ5dVBSS1N4Mlk4eWRWNDJIWnBv?=
 =?utf-8?B?T3VQUkJOM2tScWNKRzk4NVFody8ySEVwejVwdGFqditQbitGWEdRWE5mMU9l?=
 =?utf-8?B?ejVITEZIWTFDT0FlL3F3cmdFR1NNM25NTjhqTThpVFVBNGNvVXI3ZG5EbkNo?=
 =?utf-8?B?aHR1K1dkcG5qczRVK3ZOTWFhNVhsdVh2T0QycG4rWkFFTHJ6SXU4TWovQU9L?=
 =?utf-8?B?azlMRUU1NzB3RlhsZmFFQzBVbzNxYnNkT0RXUlNhVVRJQnB3QmZxUE9Ub1hD?=
 =?utf-8?B?b0h5cjN3V3VSeC91b3dpUUFTSkF3Qm9RTjduRGk4eXdwMHAvdlVYeFkzSE5Z?=
 =?utf-8?B?dktmWU1FK0lUUnB1Q2NCRE0yeitaaTNYOThyMitaWmxRNGhIRmZodjc2Umpq?=
 =?utf-8?B?SU9SalovUmJndE9yQmNkSi9aNXlFUzlTZWlwMkFqcUpNaG9aS2Npa1FyeEQy?=
 =?utf-8?B?UnVucmVJdFRNSkc0dlZrODNSMkc3N3VGQUd2UTVlcXBkZFVtRllRd0Nwd21m?=
 =?utf-8?B?SU1mUjBvYTRrTEt2Zjd4cFpjL2pQZlhxckh0ZjRxNHdGaVQvNGFKeUlmQ25T?=
 =?utf-8?B?b0JFbTdQTjljTHlYVTZrOC9uZGo1MDJ1b21ubGxHeWtWNXpzWGdYWk45ZnhT?=
 =?utf-8?B?OUtuNzErQysvU2xiU000M2UxeWIxWTR5Y0VxMUJWNlluTU4vYWFTWXJmcEp5?=
 =?utf-8?B?eTl4TjFjaTNsclpGaEpYaXBjVHZkc0hVcGFsMGE2eFZlTk92QTkxTCs0eUNM?=
 =?utf-8?B?d3l4TUw3akdJNGErT2dHWlMyR0JESEVLQVBycnNxbXhuV0lzemRyaWxPazEw?=
 =?utf-8?B?MGd5aHFqRXhOdFc2QkpIZWIvemZweHR2TWI4VlBWcHBBdk0vVng0V0ZScUo5?=
 =?utf-8?B?V2M2SmdQcXQ3bTQ2K2VCQ05ZelF0N096amJsOEExNktoR0VudHJjcDFSOVBo?=
 =?utf-8?B?TXNUeXUyWEVnWlR1eWFXUTZaYWRTeTBPdjg2cjhvdE0zVDFlbVY1S1k0bFNz?=
 =?utf-8?B?d2k3UHFHUzJkbVlmaHFoVmUwT3pIeUR3Q0NQUnpQQmk1bzU4NzhaclNPbDlo?=
 =?utf-8?B?L0xNeHBXc1dLSzAvM0FybnBxekwzS0svcFVWamRSRTRTSndWNzMwNVpFOUlQ?=
 =?utf-8?B?RS8vaDFxWWNmN01NclloMXVYZGpkNDNHOUMzYkliN2g2bUwyZlBtZXUzbzBt?=
 =?utf-8?B?V2xUSlR6RHdwSkhHNHVUVC9URlVWR0YvNS8yVEp3TVRUcEprZUsvbTRaV0ly?=
 =?utf-8?B?OTBqVC80RElMZi94V1g3a28rUDU1ZTVwaloyZnpZVjlGeHI0aENmQk1jNkRC?=
 =?utf-8?B?L01XdDU3N1FIelBOQmRtU3QycEFibW9FOCtRbEFtWlEwaDYyUk1sMlZ4aFhR?=
 =?utf-8?B?cjJmVSt1NXZIb0dwUEF4M29KR1NyK1JjK3VwdDgwYlBubWhLUnNEUHZpYUZN?=
 =?utf-8?B?Y0NPK2NUYUVTV2tSQzlYSysxdE8rUFYwNTkyYWNPUGoyTVRyVTRZazVKeENl?=
 =?utf-8?B?RE9ad2oxYkVLVnpIN285ZnhyRk55ZCsvTjFYMkU2SEpXTWZBZExRNWR4Ym9W?=
 =?utf-8?B?b0YxZzNId1lSSFI2azFXQVVVQW5RcWdDUzc0QzBVNndPUmljUXRFMEQzSUJC?=
 =?utf-8?B?aGMzNkFmM21GTWhQcnBZa0k1SWNqOUlyNVBZSGtIVmVlL3QzZ2FQdnY4WTJL?=
 =?utf-8?B?bUtPK3JtQ2Q2OWxJdUlyaWJKbVZnemgyMk15c1BpRnNEWUtQZWRWRXRMMmNI?=
 =?utf-8?B?TlRoVldsMG02TW1Pdyt6MTFvazJPSEN3bHlmQTZLZWdwYnRUVFNYaWM1dXRS?=
 =?utf-8?B?ZGZIajBKdEJ5OW15RXBaS2VaSDd1aFNOTWhMTmxWTnhDTm13cldNQlFobHdr?=
 =?utf-8?Q?iwIBrKqR5x4XlB7tWy6ni4pHgHFMg02z?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(366016)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?VEJFdnFwZlhEVnhWNzNyVCttUDgyS3pBM1laSVJRN1Q1Z0JRTDkybTZwT2tj?=
 =?utf-8?B?eEs2MCt1aUF5M2VKTTJReUJvbUc2aW9MRWUwWGJWa2x0UFVaYVRLNWNhRXhC?=
 =?utf-8?B?SEFYaXE4YmhuemdIenZzUDVnS3hvMHdsQnB6a3VOcEhROHJmTzUxUmI0S3d2?=
 =?utf-8?B?eVFQTWNaTDk2bGRzWThpVmZsb1NIUzFEMW5SRjBZam1mQ1NOTUlqU1pFZ0xU?=
 =?utf-8?B?WWl5c3Y2emdYQ0VaR2hCdW5PbDNFZ2VYOVpJaUJlNUVMNlpzR29RcVAwRnJv?=
 =?utf-8?B?ejJnYmtVb1d0QlFKRkhaRC90Zk9TcFZTajdBME84eDlSRFFSUkszbHRFam9P?=
 =?utf-8?B?MFZ2N1p2c2FUWVJHVUtjYi9uL1FMWm1nTE1iSVVKWGF1K2dmK1Z1anF0ZERv?=
 =?utf-8?B?QjZkNGROU3pyVS9IYlB0SDVYMDZEKzZ4WmxORDNNWkVQV2t1Yk96MTJyaENm?=
 =?utf-8?B?U3k3VTZjWUdOdlZqYlkwQkNFTnp0eDJ6ZlBQclR5ZXk5Z25BRkk1SCtLQ1Fo?=
 =?utf-8?B?alJFNEF2V2x5NFBnTlhWcWdkMUV5d0EzbmNqZU1JZmFhdGdJMzgvMm5UcXlK?=
 =?utf-8?B?dGhHREhqVUljN01oc1BDTzlBWVlIdnREODg4MG50dUZrbDBWK1VibCtlK1or?=
 =?utf-8?B?WnFjMTZab2w1WEJTRFBpTXZwKzBmR3FGWjQ1SXlXN3RwQ0JZNlpBbDNMWFBL?=
 =?utf-8?B?Zmc5MEEzVFJseXN6NFdZbXFGM2RacW9mN1AyV0Q3NGdFeVBpVXdpZ2s2KzFp?=
 =?utf-8?B?UE8xWU5sdmRJUS9vc01NVnRYRXIwSXhJNjRkS0tteVdRbEpUMzlYMnBHZ1VQ?=
 =?utf-8?B?cTN4OFR3bGwxT0sxZ3VUMndmQVZBMUY0U2xOTjU5WXdoU205SEs0WVVybW56?=
 =?utf-8?B?VmVBOWVpL0s3VVZ1YnlkQ1hobmtndGhWdnZtMkhqYkM0R1A0Snl3MVVablkz?=
 =?utf-8?B?ditDWWtwTUdiZDhxK2J3L0o0OWVQWW5ET2k2WVlPaVg4V0huYndVSWNaWXE4?=
 =?utf-8?B?dWplOVdLdzVjZ2xza1VSSXJFMXZuL1dvVWo3MVhndGp2V0VsRXpaQ0xEcXBQ?=
 =?utf-8?B?WndmUlhUK3hNanhoWUliQi9kTUo1YkkzdjVoWGh6Y2xYdU5DK0ZheFdUYXha?=
 =?utf-8?B?K1NwWXBMbFYxMDhWQUxZSk9FSTVmN0RCMXdGRXVDcXBNQkVGZzhSRmo3OUZh?=
 =?utf-8?B?S05BQnRRK3NQdVYrZWlhTlNzRUtaUUo4bWdmTGZXQWJiM3ByV0IxSnRQamlD?=
 =?utf-8?B?dGR4SEpUeEtlUjRWN0YrT3A5UW95SDZ5YWNEamhFUGY1N3ZNNEt4czQzODFO?=
 =?utf-8?B?VTY2UGFQb29PdlFRa043Nk9ab1l1OHhuQjErNzhyVzRNdnFlUG1UUlRmN2t5?=
 =?utf-8?B?OGdwbkFzL0RQT1dxZ1RIb056aWJRdEtEYXpjUDJBR25SNnM4bkd5VmlUanFU?=
 =?utf-8?B?YkdybTJrcTJtVVNqbEF0b0NvbnFuMWZJckYzM0xuY05qcTIxV3pKN3FCa3VR?=
 =?utf-8?B?dDhXSWdYSFFmc2FIYWdaUFVvYzRqL2ZqZms5QXRwUEt0YVJ0UGZIQmVINzVN?=
 =?utf-8?B?L09jeDRGbkk0NVJGa0gwbkY2OVRLMDJ6UzgxYjlETytKTU9LZVUvZFlmRnY2?=
 =?utf-8?B?TW1vZnJyVHp6STN1UVgxOTBrbHhBZVhqNlQ2K2Y0V3hMTG5RVDY3Y1BoZ0l6?=
 =?utf-8?B?cGlDVXZ0MjBKckptTkRjdE0wdTNoaEIxL3ROdHhXQkFPWkdXQVBuSjBKcmZP?=
 =?utf-8?B?WCsvNVBWblVadGI1MzZ0STdKVDloWWU5TjhPczQzaVkyZytTS2tDb1ZTSEVi?=
 =?utf-8?B?d1FuQ2o5ZDZKZDYxSE5ITURKbXhWWlprMEEzaHBMZVVQNFh4L2dWVHRiVlM0?=
 =?utf-8?B?TmdZaVoxSEpVUkFweTVpOGFxNUptUnhWclB5RWMvbXl6T2I2UkkyTWw5VWhO?=
 =?utf-8?B?MzZiaGhtMForNnJlQVNldEdrNW1vUHI1MGxDSU9ia0dldTlpU29jTkNhL2Vo?=
 =?utf-8?B?RW9oekgyblFjTEZOTGZMR2VrNzNXbzNOL1dEZTJRR045U29qUEJNZG90WEk4?=
 =?utf-8?B?U1BYZDVUVUlGSWZJb1RzakFhNTJCWi9IZkhkbkZFMStKb3hXSXFKMDc3ZitO?=
 =?utf-8?B?SVYxV3JwRVZmbHlTWmxOWEtqNFhQWVgxQlhDT0VZTTc1QjYzR040VnY1aVFB?=
 =?utf-8?Q?Z9mwtBA0hu128l+5B4wS0t33IPPEyxdVYLWn0XO7VPXX?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8306c127-d213-48f1-80fe-08de2e3ee0c3
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2025 05:27:52.8909 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 27v0RE+If6oBCUghokDhfr0HHdTLAIuEkMMp1tWZJa1xAIXfvmTCzMBcpYFmfCsL7r/mqt2V+02EBcQ1m3awDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB7524
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

On Thu Nov 27, 2025 at 9:53 AM JST, John Hubbard wrote:
> On 11/26/25 3:43 PM, Lyude Paul wrote:
>> I'm not sure this is necessary - for one, we could just use the .len() m=
ethod
>> on the Range. As well - if we just implement Deref for FbRange (which I =
think
>> would be fine here) we could just use .len() through that.
>
> Hi Lyude!
>
> Good idea about the deref coercion. It has a minor type mismatch as-is,
> though: Range<u64>::len() returns usize, but FbRange::len() returns u64,
> which matches the callers that we have so far.

It's even worse than that, `Range<u64>::len()` simply doesn't exist. :)

`len()` is implemented through `ExactSizeIterator`, which specifies the
return type as `usize`. This obviously cannot provide a reliable result
when the range is u64, so the implementation was simply not done. See
[1] for evidence.

But having our own range type lets us slip our own `fn len(&self) ->
u64` implementation.

[1] https://doc.rust-lang.org/std/ops/struct.Range.html
