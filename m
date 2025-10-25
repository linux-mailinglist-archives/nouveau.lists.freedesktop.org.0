Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7356C09DEE
	for <lists+nouveau@lfdr.de>; Sat, 25 Oct 2025 19:32:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA7EB10E0ED;
	Sat, 25 Oct 2025 17:32:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZfcJqVSM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010047.outbound.protection.outlook.com
 [52.101.193.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E5E210E0ED
 for <nouveau@lists.freedesktop.org>; Sat, 25 Oct 2025 17:32:55 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QOG98BQ8qewx7eUNFuI/+MTtWSgK+khY1Djt7lyBs1PQeAlhrJDsytwp+tt/WRl20GNNhQlLUjcpCLbMAxa2p5LM3PaWOMOr4UVSkf9Wf16W24j+RRxPe9CR1HEpvqHAENlkQvsVqsw4Dcc1arhtT7V96h+zpRGm6fejNtUDpDGddrz+reSnEswtHHPNvSxhbZPZC1hw+C077snXsLlOEo4BBMJhewFxXWn5ST7T7GdCX8xBevyy64/QdszuG62dn2I1pk+wZ9f/NfbM7m1uteFIfHvy+qCC1qi64LBLn4ldlmo5qEFYl/P62QgKSDUbCJt2YoKdzFOH4P9ftTcKqg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PafbYCm4p7IAJf71nAqWg7QpgyFrZ1TjQokC7tT+5e0=;
 b=MUAkGl8uUbar/e1l1xdOc0GvLzy2LNZC8tZYFMGidEIjR0VxbGkB8vDtVhB9HUVuRSv01E8qIz7r+O3UlD8epZYfylnot8aV5fRN8gGzbl0MfCaow0bL2Hil5KDiNn7Xz+2Af4tj95cILOOd731dNpyBYvMjHAZVKwr5AC2k8+5LW6NVRJXLpipS0t+m7U+Eg3v+4qUNd1F4OpyYuRgvyPKgqmjm403SZFijZULg5Wk8HTBeEc9840WOzBeM6A5iADMd6yy5dgfPH3QSBBzR5XOfGkKrIfoAcwJQQKmWWIvjKEpR1xTddbi/HMiivxjBAuQN/IxhN9weQoZGA8o4UQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PafbYCm4p7IAJf71nAqWg7QpgyFrZ1TjQokC7tT+5e0=;
 b=ZfcJqVSMdzO4QrqQ1xpz5aeSMENuoMmmB7h8S0onpS5NTr6z2WzQMYYJymvQl6UPSIeXzhg2ehtfYN4C1hpbb8h1RRDWsRTgfczLVAzzOV+ycu5Bisy7fRFDLsusubYumiNZvE31TeyMUdL3aTZwKRk2kPCYjFgAH1kU2VCG4oWDOJ2SoDhGKp/ZspbKp2usrBD2WRzqM6vzP4T7C7Wu+oQR5715bhIhIKhqLjFXb2hwfF24CWQPHYWiLl9aOPDjc97LnvR2JxmSyjm4AKRqFV7fFQ+G++lF/729l9HKZa5VjUOVlM2fE97jVoNs6BmGm9Uk5rljTxy+SWOba+38PA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by DM4PR12MB6229.namprd12.prod.outlook.com (2603:10b6:8:a8::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.15; Sat, 25 Oct
 2025 17:32:51 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9253.013; Sat, 25 Oct 2025
 17:32:50 +0000
Message-ID: <50acc826-dbe7-42bf-9645-ad5aa47a3d17@nvidia.com>
Date: Sat, 25 Oct 2025 10:32:35 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] gpu: nova: add boot42 support for next-gen GPUs
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
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
References: <20251025001459.491983-1-jhubbard@nvidia.com>
 <20251025001459.491983-3-jhubbard@nvidia.com>
 <DDRBEHGSMDFM.X7RQC8XCC7C8@kernel.org>
Content-Language: en-US
From: John Hubbard <jhubbard@nvidia.com>
In-Reply-To: <DDRBEHGSMDFM.X7RQC8XCC7C8@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH8PR02CA0020.namprd02.prod.outlook.com
 (2603:10b6:510:2d0::9) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|DM4PR12MB6229:EE_
X-MS-Office365-Filtering-Correlation-Id: 628330a6-abe6-4f0d-6e48-08de13ec8593
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Y1Vaa0ljaTBDVzQwVUdoeWUwTno0THlUV3k5ZXhvUWthZTJtc3dtejl1NFln?=
 =?utf-8?B?eW1nL2w2QjlLVXZaV0JIa3VIR3E4TWdpY3pEbGZXbS93bWQzU1BWMC9KWmRz?=
 =?utf-8?B?UDdXaWV6TkdpeEp5Ly80TnVSUUcyYk94MHN5Sld0S0FyK2dJcUl1ditpRkd2?=
 =?utf-8?B?Q1ZOU2hXdEs4Ym50dGVjOEp5UnRRV3h6bit1VitTVnJvWC9HMFN2N1psTkk1?=
 =?utf-8?B?bWlENkpzUkN5eVZHMnQzT28zWGQ3Q1FwaU1rRWhjNUQ0MS8zSE43QVBGSUsw?=
 =?utf-8?B?R3FBTWZhbnNQRk1hTkJZeC9RUXlSak11WDhubEI5TjN2WWdPMXc5MFJnZUk5?=
 =?utf-8?B?cFNFOGUwREp5SlJIaGlIYXVHclltRGh4RHNvWHp5bkF4NjU3OTdPMUdPcVNN?=
 =?utf-8?B?NVpmL3VhNUplaGkwVjQ3dGtKWmR1WmtvYTN1MHpUa0ZKKzF1SkZKcS9JZXNX?=
 =?utf-8?B?OU53ZzZWR2UzQW91STVxZHRiN0w0VGZEVW5nanZIQ3hxNE1YK0dFcy9SemMx?=
 =?utf-8?B?R3JFYUxZLzB2TnRIanorN3k3Wmc1N2RuRVNjV0EwemdiallUQlNDOHdLWHhS?=
 =?utf-8?B?KzVKNDNUR2ZzajlwYjRiS0hNQ2FwbVBQV1pUTFJ3STF0WG5DQWhDSFlHM1I0?=
 =?utf-8?B?OHRtbkVSZkhDdzZ0d05UdFM2aEpIUWZnc3kwRThUenViZGFHdFlEcE5LMnI5?=
 =?utf-8?B?SU5wOGVRT2FYY1BUc0VsSTZENWtZaXZzZW1PVDNwTVdUZVpaTkc2SjZTTVBF?=
 =?utf-8?B?YmRwZXR3elBmWThobEo1NkN6SytMVUNmcmRnQjlOU05WSmdWUWlpV0tQYXgv?=
 =?utf-8?B?TU1ZdVBSY2hKSzN0QzdYMUQ5dm8vWUxWU2lNMXE3aERJejE1dFZDYkNVaUdM?=
 =?utf-8?B?aEZWQmZWL3RTcm4ySVBxakRmb09YZWxGcjh2Qm8vMUkvYjJXNEZHR0dFNVFB?=
 =?utf-8?B?TElJUHI4bE1RSWVoUFZuM0tJNXdSdmJDSyt6VXp3Um5kRXlXakMxdTc4RjFQ?=
 =?utf-8?B?MVFpOStidWlVdzRnUHJ1ZmVXKzQ0SGtxMisvTndqd1JEeHM0ZDZXMmRMTXFR?=
 =?utf-8?B?dTdlZ21yR1llZWNkS3RhdjRKQUVYcldkR2dxVzJOMXJxQ05pYlJ5YU91TUFi?=
 =?utf-8?B?MDRyWkV5Tk81M2cwTC9wM3VzSEYyN0hINTViM1BER1d6MG5PVTBlRXhqWUdW?=
 =?utf-8?B?QjFoRXE2dHhMb3BNV3hiMmxpUklvRjN6dE5NUE5SYzRZWEdiQ0VKSDlYSTIx?=
 =?utf-8?B?enlMdkFIN25JeTdSMG04TzFZLytMTVIyL0pQYnU4bVZpbFJSWW56emR4Sk1I?=
 =?utf-8?B?M1pZUG9PYXc4SWJEUVVUSzNrNWJrb0xlQ25ra1lHcDJyVkFGRm10c0pGREUw?=
 =?utf-8?B?SGxZdFlJamlWcGZyMG9aUWZ0a2dJNmxOK1Nka2w3bWtTYnVXdkF3b1R1SS8v?=
 =?utf-8?B?QnJUYTVpaFNvUldLQVd2TFRCVWZRZFAvdEppNFU5UzNnK2grdEcybkRiOHgy?=
 =?utf-8?B?emVzdjQvT2pQVXlNVEoycDdxb1I2MGp0Y3Z3cjB6RU4vWXAwL25hMFNSeVNV?=
 =?utf-8?B?TkpIZU0wQWtReTM0bkphMDJpT1ZSWlNvNjFMamEybkxOWkVrNHNkdk5qSWV6?=
 =?utf-8?B?b3BWb1dIL3hhZjBXcFFRQ3diS3h4cUZXd1JRTnFkQXVPN0ZLVzVDT0tjcUpt?=
 =?utf-8?B?cEhNV2ZqTFZxTVZ0QmpuNnFsbHR4V2l3RCsweDk2b1FsVkVxdExpMEE2TTZU?=
 =?utf-8?B?czRFTXJZRTdPVXBYcWkvallndTYxR0RjSm1kWnpBSnFlbFBnS1NsaXorYm9x?=
 =?utf-8?B?RU0vaXpweFpORGRJa2h0L2lsWHNPREJYanRwZVYwL0tMRFJ1L0JhdkcyWVo2?=
 =?utf-8?B?cGFxOHJrUngybFN1NTdkSDNFY0g2Yk5uRFl3UUx0dGZ3RUhheE40RTRwWTBF?=
 =?utf-8?Q?Mi6KYa7NTuNF0zpOi1CJkRk6tJFHXXKx?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YjZ6NThET1AzSEJJeFdhR0FXa08zTFFQUHBqdXIyVFluK09DWFB1bHRlcGNJ?=
 =?utf-8?B?eW1OOGJqS3hzdERybzFNc1NrcFM5VmxmYlRueDEwemlQS25pSnhnZ1pPTy9z?=
 =?utf-8?B?MlpXNzNJcVdLeTQ0RVp1dE5xckd3NldxVThTT1A0QUFYak9PdHFYajgxeUd1?=
 =?utf-8?B?OE9GV0VuSXhFRDVDUVZreW5ab0srVTNxb2VCenVBYWljT3BxZ0JIQ2ZaQWE2?=
 =?utf-8?B?OXRBZzBrRm1yM21EcTBXSHVwbmdoMFh2VEgwaFMyWU54bWE2ei9wQ0ltaGV2?=
 =?utf-8?B?OGVvMitLMTVlUzZHb1V3K25ySFJ1WGNjajFmNzJ2bzlHcTA1QnlqeWFKcEdD?=
 =?utf-8?B?Lyt1ZHFmQllsNU91cWlod205TWgzcFZ2UTRvTkt6S08rT2J4N0NRbHBQaVY3?=
 =?utf-8?B?dzN6OEdpL2JhNUhWQ3orQlJURjg0NHEvamVtcllaMGhNc3ZwcURYdHVWQkhw?=
 =?utf-8?B?ZVN1UE5FS3A2N3hNZWtPMkFraWpLaUxaOHArUmtmYmlCaVZPeXlldFJ3eUs0?=
 =?utf-8?B?aDl4WXhQZXhjMEZLV3V6TVpHL0VFK0VWMVM3SEdTNyt1a09QVlQ4K1VkMHJk?=
 =?utf-8?B?WnJ4eUtxSmR4WGxobTJwUWszc1FkTkliYWxqTmhrdndKS3U1ZW52c1ZPN3lW?=
 =?utf-8?B?Z2ZIOUFDaHZTa1UzMHFMLzVQeUdZTjFGM2RKK3k5TnN0TmU3NXlCY0RBQTRx?=
 =?utf-8?B?T1VXckk0aG1xc1o3UlhDN2RLaDBWVDlGVDRwZUpWWkw1VFFBOEhqa3o2R3pT?=
 =?utf-8?B?VjRma3Bjb2x1TiswNEFqSnBRdW52amczRk83NmxCYURGdW5HNlFiSW83Q0Uy?=
 =?utf-8?B?eDN4WUIvajAvK2ZZNXFWMmlGOUFiY3ZzVGFieENsUWlyVzM3TWdjcHFmLzA0?=
 =?utf-8?B?NFg4QUdFOU1ib0UySFozS2M4eVJEdmgzUi9lR1BweGZ2WjVmT2h6TGNnSXlr?=
 =?utf-8?B?TFpQQStkc1hQMFo4ODQ2SzlncXRzdjYvcmNmV21OUDFNVEJGMXh0TFBkclNK?=
 =?utf-8?B?TFpkSE03bllEVHZxbndWU05ZNjFIbkI5am0xMzRwZ0c5SDMveGNDTmNzWjY3?=
 =?utf-8?B?QjNlU2tTV0FOSjFFazl2MUJqRXVZUCtRb3hsRC9Zc0lDNTdZWDExYnFzOUYx?=
 =?utf-8?B?cEwwL2ZwWmFJbVIxWnk5aU4rQ01NRjlhN0JHY1ROOWtzTzkvbnQxcC9JTnJr?=
 =?utf-8?B?Y0dBMFA0V09Cck1BVmJJb0QzU2NPWThsaTFGRG16V3plMFVMZ3VtWHdERkt3?=
 =?utf-8?B?VVRSRzBIeEhwTzJwTk9ZRjlZZGxpRTNnNnlUZzN3emFNb0VrWURua05XSTFN?=
 =?utf-8?B?T25oUTJLRmNSY1E1bmpvMnBiQXZteFJQUGNOWTBZNnZBOEJaZ2VaRzRMcUZF?=
 =?utf-8?B?b3Z3R3d0eVNCNGJKRXhuaEt6MlRXTWFpSzkwVitPdzV2VXZIMHlZaVAyU3U0?=
 =?utf-8?B?ZFZXMDA2VHRSL0sycHlPRmRvRTQ4dGR1NElGcmtuL3B3d3FlTWcreFZKVE4x?=
 =?utf-8?B?aDJYVlZsQnhQS3pUTTBldE1DekpRTWlENVYrdWo1T0x0Tk9zRG8vanI5Z0Y2?=
 =?utf-8?B?bzRkNFBWdGtxSzl1Qkw5QmVNdUhJVDJyaW14U284aXFVV2pDejJFZGh0ZzNT?=
 =?utf-8?B?S0U4WnJEVWpxNHhyWGRBZDFjQWJkUHNVYzNROFRGSjJLcnJweHBIMDhwNEo3?=
 =?utf-8?B?MFczZlhEbGdjVWp4ZXJ2YlFPMEVJemNIVjcxT25nZlFXMHlWb2tVTGtTYTZR?=
 =?utf-8?B?WGJxZUMxT0ZJcWo1c0FjTkZndHhHTk1HLzkzNjd2R3JpVk5HV09jSGZNc2Z4?=
 =?utf-8?B?bHduVExPZE1odnhHM3RURWQrOEgvZUNVczRFajdSc2FyM20rQjlRcGp5TFl6?=
 =?utf-8?B?Ym13NDErZFBsZzREOUJ6eVNTZzhuTUJhVXVEa2g3ZTZxY2hheUJTUlNjWDdO?=
 =?utf-8?B?RHgvSi9RUmlCd3k0VVQ5OU9ya21SZlhNK0cyRFFKcElrYVo0YzdzaHBhOG4z?=
 =?utf-8?B?QWZSZXJGcy9tSWxaeHhLQk8xc0lUSXVsdkNtb3lVRjQrM1RwL3FOcjh4SzdV?=
 =?utf-8?B?enRucTRzZkdoUnIxdmZWTjQ2MWo5UStuNnVYMkxZT1dkaTNESFVNdWF2WFlC?=
 =?utf-8?B?WHRjVW4zdmpQVzhlOG00L2VKMWUzazg2eVpYK2puZVhEcVdac0czRmFGR2Mz?=
 =?utf-8?B?U0E9PQ==?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 628330a6-abe6-4f0d-6e48-08de13ec8593
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2025 17:32:50.9000 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BovSPmxkwS3QDFEOpc7OCNLbdx7Fnf24RXWCIY/lk8OggIw7iX7JAZN4aFHTWtA9pBW35UVSmlJsVWh4nU6Ixg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6229
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

On 10/25/25 3:01 AM, Danilo Krummrich wrote:
> On Sat Oct 25, 2025 at 2:14 AM CEST, John Hubbard wrote:
...> Why open code all of the above in the struct Gpu constructor? This 
could all
> happen within Spec::new().
> 

OK, yes, that does help avoid cluttering up Gpu::new().

> If we *really* don't want to store the Spec, but only the Chipset, you can also
> do:
> 
> 	try_pin_init!(Self {
> 	    chipset: {
> 	        let spec = Spec::new(bar);
> 
> 	        dev_info!(pdev.as_ref(), "{}\n", spec);
> 
> 	        spec.chipset

Right.


thanks,
-- 
John Hubbard

