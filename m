Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22A3CBC90F6
	for <lists+nouveau@lfdr.de>; Thu, 09 Oct 2025 14:37:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8913E10EA23;
	Thu,  9 Oct 2025 12:37:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="R3LJIOP/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012041.outbound.protection.outlook.com [52.101.53.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9CF10EA24
 for <nouveau@lists.freedesktop.org>; Thu,  9 Oct 2025 12:37:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RmPb4vIj9kSDmH7DZBoT655F0TaxDi2kDJcsrS7CGmztHpZqabzpQgydIxqoF7R7hpE6eseuPXBmY6tdeHsGRgGhmudW8Zvr5SJp6UP4d9hlvQYg5jE1tfl5ytQHrYfTMOujjzAbQscD17dmgkxI6QLMIkx8HNOuZr+ynbtaG7uY4paJYgNgLlKOYsUj6RGEzuBfOWwLOxwXowYwJkq0OOaSTwkg8+P9sYyltz9XgSE3IzLSL6MjUpGz6H5nzp5m6sy+ekpjU3gF8h2D3TfS+YuSn1vcuR+F9UIkSOb/LWhg1XK5oA9ltdIAx3PWa+kzNH4/oFLuTihK5UDwNM2JkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=352JxOotCkflHo1RmpVMy7UYec4On/TeptZzEK9q52c=;
 b=I9ss9vWldxlAes8IKmoR9X8kahOp3a4AaiHtBElZnOv9K6hTH/b00kXUB831Llvn1dHrdZyjI4G/W5dcrHQdc1tAASs8XVaROH8QaUSVp6igOsKjr92ljzGVMAariEiO+pCVJnBy3QIQRqNYtlnHDLeYFEtHpJO0LM89oLquPI+geN0fgorODni3h66kuLs+d7G5Him7TxkDGIbV9MXflwRHKM4Ork/fYNCcBCJcFn0lo3zSQ9EO8KBniCt/Cn+MOeWJw9CQt5aBHk7XSNlYuyR98Tx7yBoB2RhyT3SdcyUEp7Tq36luI6PpA6qTSTMZKOB1dMZaU5/EnXrOzEMwwg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=352JxOotCkflHo1RmpVMy7UYec4On/TeptZzEK9q52c=;
 b=R3LJIOP/Y/uvSJ2PBMBMkChhLTvywvAAAgkrsnqddQfpdKmRtw255utwip1vzrwIHwaf93/XH3W5y3xMLaWsqntzJpA66xmUoVoa2vv7JzyB8hFTjL66ZwrdNL0je1q1xCZD44PkugwUs1FrmyfEKR+xcdLMu1mvyhqEWX50bfj45eaJKhm555JuAbugbrzCdVfk1rSmmLPYsLdehhgVRo5gNRBe0gLa76y6SGS0kNVYJzRknFbSbww5+POsurEYj7OR0eIPe+Iukxn3zwKS8HIoWJN9NbSGthsv8aRpqGosc+N8J8LByZdZy5vKh776gc5MinY/jvGDzdn8SBH2oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by CY8PR12MB8315.namprd12.prod.outlook.com (2603:10b6:930:7e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9203.9; Thu, 9 Oct
 2025 12:37:36 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9203.009; Thu, 9 Oct 2025
 12:37:36 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Date: Thu, 09 Oct 2025 21:37:10 +0900
Subject: [PATCH RFC v2 3/3] gpu: nova-core: use BoundedInt
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251009-bounded_ints-v2-3-ff3d7fee3ffd@nvidia.com>
References: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
In-Reply-To: <20251009-bounded_ints-v2-0-ff3d7fee3ffd@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
 Jesung Yang <y.j3ms.n@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
 Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
 Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Cc: nouveau@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 rust-for-linux@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.3
X-ClientProxiedBy: TY4P286CA0095.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:369::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|CY8PR12MB8315:EE_
X-MS-Office365-Filtering-Correlation-Id: 27d9c71a-0b2e-4833-1b9d-08de0730a002
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|7416014|366016|10070799003|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UjAyanFhUXFKRVJMMWJyUlZGeXMxZ3JObjdkZkVLWnRqek9na2JSVExGaWRY?=
 =?utf-8?B?dlE3QllORm5FMURiSjBXVVZ2NjQyRy9wNjZCaHlVQXlCOUhnby9kbi9QNXE1?=
 =?utf-8?B?REw0Qkx5Zng5WS8rRktlRURqY1BiRUNoZFB5MHE4WXNqejFxdC9xZ0hIWVh6?=
 =?utf-8?B?RERiaWVoc2xBT0pCNWdSQlN6WkZJZmcwZjF5VEdTRU0wYnlhUFVTRGc5SEVD?=
 =?utf-8?B?bWI0MTc1L3VpN1luVzFVUHBzdVZJdWtmVHhCZGJvZjBYeE13MUVxWTlVclk1?=
 =?utf-8?B?S2NXZ1BFTFZuaFkxQmI2M242V0dkWTQzMmZ4V3JNRVk2TmFpMllGc0s1eWMy?=
 =?utf-8?B?WWdEMkF3RzVrQU9ZOVVTNnBURTVWZHd1K25uL2JSYmJZaHFSUnFaamJEQVhE?=
 =?utf-8?B?ZWNITG5VU25HMWdpdk9xbkR3eGxIM1V5REkwRUNiWjg0UUpKZXFXU2NIMHZR?=
 =?utf-8?B?czhyaE9qK2p2N3dySkI3SEdxMzV4L1l6VUZhWkRhb0s5YmdSMGdBS1NqWWI5?=
 =?utf-8?B?L2tnYURJWVdOYWw3emo4NnJyZW5SbmdTUFZMYmwvdEVieCtrWmg5YnRLOVZ0?=
 =?utf-8?B?NjBQeGJtendMVWJyb3IrT3o1TkFEekppZzNnbE9HRWh5Q0ZZaGdmZ25SaEhq?=
 =?utf-8?B?dHFrVGxXbEh0cTF3RnY5V2IwaFBwRm05cmdsQUdkUG9JUlJOUUlnWkJTVnA1?=
 =?utf-8?B?d1EwQm40VnhKT20xcHU1QlhqN1Jwa0E0c0FOZ0NlSTdJWStVUGVEWklGV202?=
 =?utf-8?B?OFRIUy9YZmp4K0oxU0xOaU1ESDNVdXd3d3V2MHE5UHY4MnBWTXh1Z2s1UzJB?=
 =?utf-8?B?WUFKZ21VRUd0ZDlaTTkvenA4V1pHYkhQQUlsem92V21sL2lVeG1ER0xUWVZD?=
 =?utf-8?B?dGtIdFVRVVRmdlBkbFY5MXBlYVY3b3E5SmpWVU9JTmNHeklHR3FUYVdTNWF2?=
 =?utf-8?B?MyttUDRNbmlHOGdPcVFUdzc3N1d6NGIxQ1BxQkd1OXhGVHZxeWJRaWVyWExw?=
 =?utf-8?B?UFdKWjNSV3RGQ0ZNWk82QjNOVldZRWFkbjg2WTNYb3YrUENXbXdzY3dsYmJs?=
 =?utf-8?B?UVhYODRmQkt4ZjA1R01BRkd0ejdKU0hkOFBWcWs4bUFPeFdHc1dsMmt1TmJ6?=
 =?utf-8?B?allTWC95UmlEakhjemZ0RHhtWTNpaFJramlURFVJQVZYZnR4Q2pDa2VFbGVV?=
 =?utf-8?B?VnBBcmhFM3J4bm1lZmNwTmllL3pzTTU2K0NCa0M3Y0hIRkZpUVNZOUJvczNy?=
 =?utf-8?B?b2tSVEQzR2VjbUorcmtQZGtkUmtQSWg5OWJTdGlXdTBTblVMelRjQ2p0YlA4?=
 =?utf-8?B?M1ZlQm1NMFVqQVpHbDdaN3h4R2ZnQUorTlRPLzJNUlgyaFRFbjFQbEZCVG1Z?=
 =?utf-8?B?VkxmUStpQkVwTEx5L3IxclJHeUVDWnBGRnMyeG5idmNkT05SYXFtOS9VR1Bv?=
 =?utf-8?B?eWpMZ21SRStBYnl6SEJJd0Z0UDR1S05raWI0ZkQrWlZ0MVJjZk9Zc0FuL1V0?=
 =?utf-8?B?T3doRmUydVFxTU03bkhCaG0yRUMyWGpRcVY3SHhyOWV4RWxPbkMzR3R5bklY?=
 =?utf-8?B?YVl2TG1abS9oVkJJRUthM1J4NDh6NEE1R050b0kzNklIYUF6UG5oazV1Visv?=
 =?utf-8?B?N0dpUTEya25ycmlwZFpibnIvRzFtTURJb0c5RkJYUmRjbjJIZ3JJNDdwd3cz?=
 =?utf-8?B?dkJ0eThrR0pOcVkvcndCSlFXaXNzbUlWRmdrSHdCcFU2S1VXbXRHaFlyRG02?=
 =?utf-8?B?eXVrZGpQQ0hCZWljUG1RRjQ1QmxGTXpYNy9OS0JvNGYzSmVxMVNWQzRPZVJ3?=
 =?utf-8?B?KzJtVzJhYVpHb08xYUttQXBKaGRVNVdjNG9UTHZWdHRzbTBIQUludEdyS2dK?=
 =?utf-8?B?SlZPSmNBVW5IWWJPbFg4VTlTT1FYNzJiSEswTWpHYmFCbWJLeXhBeWlVamZS?=
 =?utf-8?B?MDhqQjU3OE9aNWo2a202aDd1KytBeitjSTFSaWx3alZ5akc0YlgzRjNFK3lT?=
 =?utf-8?B?R0xmR2FZUU1LTm9GTkpqV0VHTFg1enVvQTNiNmNhRWQ5alRjZHMveVoxZXo1?=
 =?utf-8?Q?bEkdMV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(7416014)(366016)(10070799003)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eVpmazFZZU15WEZzQXUyZDlOekVzRDJMdjNjSFI4MzRWRXV5NzJvL0lERWlk?=
 =?utf-8?B?NW0xRmJQYnl4SmNHa0NJU2twV3VtRzNSM0Vsdmw0bGhlRXVqcjdJMGlNcGhP?=
 =?utf-8?B?U3dLb1l0am9ZN2dBOTI0SVdYc21LUU5sVWlBQUhGckNxT1BqancvQkpJSHpN?=
 =?utf-8?B?ZS9DRVplYWlDQ1Zpdng5OXoxYU1rQ2dYY1cwL2VCMWVwWjg0dW5sajdTMjlV?=
 =?utf-8?B?RG1ydTBTbVEyQmpCWmZoNnN3VGZhYXlpazhpK0w2ZkdqK2JCNVVaNHlYVXYx?=
 =?utf-8?B?d1hIOTU3SVJyYXJEdWtqK0JMbFpxVEVNNUNIOXduTDN5WElJTkZoQktlZkdZ?=
 =?utf-8?B?K3JyRndGQ0RUTm41VkJCS29OR2ErMWtPQ2FpOVdHZjhVbEcrUE1yMWFDS2xj?=
 =?utf-8?B?T0xzNWtEV3FWWTdJMjkzR1I5NEJ6SnpCQVJLWjg2VEtIa0VIRGx0bnZzY3Y4?=
 =?utf-8?B?WExVVG9HQllicU50UjQ1cmd3SkozWDZzTU40QUo2TGdDUjh1TWdiaEk3cGNP?=
 =?utf-8?B?Sy9PWTZQY09HT29UNXNpaExsZ04yR2JDV0hhSVEyclBuL3Q3ZFMwaGRKM0Qz?=
 =?utf-8?B?V0ZCT1RYRUZ1Y2VlWXpwZ25OM1lYYi9RUWthR2xORmpBVnpqRUhJRHBzS3p1?=
 =?utf-8?B?bnVOV3I1NW1CcGZPVTJ3N2wvM3dIU0pJTWYrZmxlanBzdjR0OVROMkpwbFFI?=
 =?utf-8?B?Qk9WK0ozRTVZTDhlMWZEZDZUdXZhRGFwSzFRQkEzQWRoYnBrYVRtN09FNnVt?=
 =?utf-8?B?R0JNLzE2RCsyZHZ1akRUaThLbFBUZTlVWFFOUnNkZkVUMlR2eVhUQWx6M1hs?=
 =?utf-8?B?NFNmNTRBdndsRDB5UVJYVUxMM2JGRDNaeXJzelZiTHBrMmZKNkc0T1hrT2Jo?=
 =?utf-8?B?dy93ZWZYZGJuRXNGNkljUXhOTHdhcUJnbDQ1U0ZVY01uekQ0alBmUkVqOVJo?=
 =?utf-8?B?ZHR1bHpjeE0vUVJLbEV6ZHF6Wm9zcitIZmsvVTdoZmdzakIwazhIbWVQM09H?=
 =?utf-8?B?ZXJERGFwK3lmUTZWeEVJdCtEaEpjUzdMVVZJZ0V2OTQwa2dDeXlGV0laOVZ4?=
 =?utf-8?B?dDF5TDhBcWhNUFFIRWFjNnMyTlJMQWFLL2tDWDVYbHY0NmZFRlJoUTZzR0U1?=
 =?utf-8?B?bnBJWXM1Q0NwNWhodDl2S2VNUUhoT2pjU0FQek9rMjlLUjZkemliWkdnN3Nr?=
 =?utf-8?B?aVBNYnFvVFdzTjFIZm1HZXBhTXU3NU9sSXQxSVNucjVQY1U3VmJPajRNN0ZI?=
 =?utf-8?B?bkRZM3RPaWFZcE9PUjU2QVk1VTFqSHc1M0lVc3hEWG1iMkhQcnB0cTBYQWhz?=
 =?utf-8?B?dUxneDNFZ3FsdEM1c3FXNXl3b3NTU0owNjlSM1R5Y0FDY0hEeHp5Rldzem0w?=
 =?utf-8?B?R3U1YWxRdHRiOGhIWjRrWDNUWmlCR0c2cmtnU3VKYVJFMGVWSVVBR2gvT0p1?=
 =?utf-8?B?QlZxMmRnMy8yL1JOLzc4b1d5MEV3VUxZY0M1REc4dUxCQzVkcFhTaHBBUWdp?=
 =?utf-8?B?TUhoc21BUlNHQzJQcVZxS2xKVzE4NEhLTjZLc2tnWXpYM2doNC9EZzFXSkNn?=
 =?utf-8?B?bFVza3Zld1prelBQK0FqOTNwY0VXcVhnLytEejk0Syt0aitIVk8wN3d3Qlpp?=
 =?utf-8?B?RHhhL2VvUWxldmtEa0Z4dElMajU1TXpQQUo3SGhPYmlMdzJpRmlSamhTQy9C?=
 =?utf-8?B?L0JJckJMMnZ1TUVINVR3bVhPZi9tTlI2OXJEcXVpQ0NSaHd4VldTZUk1Qjdo?=
 =?utf-8?B?OUpIclN0VW5FU3lRRU90UkgvNENaY3FYODhzaENGb1RlNzBDWVV3NlVvMzlL?=
 =?utf-8?B?SThIajMrKzY3NmdHL2FxYmFzbzNkdTVJb0h1bFVQSXhFeWttMWhSUTAzWWVo?=
 =?utf-8?B?TTdBUTZpUzZKTlhYeFlSSm1jL3FJNCtqYnZYM1phckFBVllEMnI1NzQ5R0Yr?=
 =?utf-8?B?ZnlzZm5LbXlIQjJlL0p4WEhzdDFINFJwQ1RWVHNLTzJDaXlTYU1hVjQ3Umx4?=
 =?utf-8?B?a3pGWFQyc2RjazJTdGEyc3Z0ZkxpblpNamFpQTFJanM0ZTZvMS9LNDZsdEtl?=
 =?utf-8?B?eGxEd21HT05ZejIva3pxMVo5Z2FwOTM2M3JZcmtkVzVVWnRJT1ZwaXRCU2hz?=
 =?utf-8?B?SjNMMkkwV2ZkdHhPNVlzSEFTa0hyY28rdmsyMm4rTk5xYm0yVWNGaTNmRVhy?=
 =?utf-8?Q?Aj7Oy+4uIz32fRwQqV/8y0MlDNVW6kNpkHqMo7dtnOZS?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 27d9c71a-0b2e-4833-1b9d-08de0730a002
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Oct 2025 12:37:36.2091 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SWqtfwojXcP4Q9sDCzKEfq3v9xE8CHDrOxlMzrZu3BHyfQyV1pni+UQq7jLrjWr6Ok4tY24J/aVgcZPBH5uktw==
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

Use BoundedInt with the register!() macro and adapt the nova-core code
accordingly. This makes it impossible to trim values when setting a
register field, because either the value of the field has been inferred
at compile-time to fit within the bounds of the field, or the user has
been forced to check at runtime that it does indeed fit.

The use of BoundedInt actually simplifies register fields definitions,
as they don't need an intermediate storage type (the "as ..." part of
fields definitions). Instead, the internal storage type for each field
is now the bounded integer of its width in bits, which can optionally be
converted to another type that implements `From`` or `TryFrom`` for that
bounded integer type.

This means that something like

  register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
      3:3     status_valid as bool,
      31:8    addr as u32,
  });

Now becomes

  register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
      3:3     status_valid => bool,
      31:8    addr,
  });

(here `status_valid` is infallibly converted to a bool for convenience
and to remain compatible with the previous semantics)

The field setter/getters are also simplified. If a field has no target
type, then its setter expects any type that implements `Into` to the
field's bounded integer type. Due to the many `From` implementations for
primitive types, this means that most calls can be left unchanged. If
the caller passes a value that is potentially larger than the field's
capacity, it must use the `try_` variant of the setter, which returns an
error if the value cannot be converted at runtime.

For fields that use `=>` to convert to another type, both setter and
getter are always infallible.

For fields that use `?=>` to fallibly convert to another type, only the
getter needs to be fallible as the setter always provide valid values by
design.

Outside of the register macro, the biggest changes occur in `falcon.rs`,
which defines many enums for fields - their conversion implementations
need to be changed from the original primitive type of the field to the
new corresponding bounded int type. Hopefully the TryFrom/Into derive
macros [1] can take care of implementing these, but it will need to be
adapted to support bounded integers... :/

But overall, I am rather happy at how simple it was to convert the whole
of nova-core to this.

Note: This RFC uses nova-core's register!() macro for practical
purposes, but the hope is to move this patch on top of the bitfield
macro after it is split out [2].

[1] https://lore.kernel.org/rust-for-linux/cover.1755235180.git.y.j3ms.n@gmail.com/
[2] https://lore.kernel.org/rust-for-linux/20251003154748.1687160-1-joelagnelf@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 134 ++++++++-------
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   5 +-
 drivers/gpu/nova-core/fb/hal/ga100.rs     |   3 +-
 drivers/gpu/nova-core/gpu.rs              |   9 +-
 drivers/gpu/nova-core/regs.rs             | 139 ++++++++--------
 drivers/gpu/nova-core/regs/macros.rs      | 264 +++++++++++++++---------------
 6 files changed, 283 insertions(+), 271 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 3f505b870601..71cb09cf7d67 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -6,6 +6,7 @@
 use hal::FalconHal;
 use kernel::device;
 use kernel::dma::DmaAddress;
+use kernel::num::{Boundable, BoundedInt};
 use kernel::prelude::*;
 use kernel::sync::aref::ARef;
 use kernel::time::Delta;
@@ -22,11 +23,14 @@
 pub(crate) mod sec2;
 
 // TODO[FPRI]: Replace with `ToPrimitive`.
-macro_rules! impl_from_enum_to_u8 {
-    ($enum_type:ty) => {
-        impl From<$enum_type> for u8 {
+macro_rules! impl_from_enum_to_bounded {
+    ($enum_type:ty, $length:literal) => {
+        impl<T> From<$enum_type> for BoundedInt<T, $length>
+        where
+            T: From<u8> + Boundable<$length>,
+        {
             fn from(value: $enum_type) -> Self {
-                value as u8
+                BoundedInt::new(T::from(value as u8))
             }
         }
     };
@@ -46,16 +50,19 @@ pub(crate) enum FalconCoreRev {
     Rev6 = 6,
     Rev7 = 7,
 }
-impl_from_enum_to_u8!(FalconCoreRev);
+impl_from_enum_to_bounded!(FalconCoreRev, 4);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRev {
+impl<T> TryFrom<BoundedInt<T, 4>> for FalconCoreRev
+where
+    T: Boundable<4>,
+{
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: BoundedInt<T, 4>) -> Result<Self> {
         use FalconCoreRev::*;
 
-        let rev = match value {
+        let rev = match u8::from(value) {
             1 => Rev1,
             2 => Rev2,
             3 => Rev3,
@@ -81,24 +88,25 @@ pub(crate) enum FalconCoreRevSubversion {
     Subversion2 = 2,
     Subversion3 = 3,
 }
-impl_from_enum_to_u8!(FalconCoreRevSubversion);
+impl_from_enum_to_bounded!(FalconCoreRevSubversion, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconCoreRevSubversion {
-    type Error = Error;
-
-    fn try_from(value: u8) -> Result<Self> {
+impl<T> From<BoundedInt<T, 2>> for FalconCoreRevSubversion
+where
+    T: Boundable<2>,
+{
+    fn from(value: BoundedInt<T, 2>) -> Self {
         use FalconCoreRevSubversion::*;
 
-        let sub_version = match value & 0b11 {
+        match u8::from(value) {
             0 => Subversion0,
             1 => Subversion1,
             2 => Subversion2,
             3 => Subversion3,
-            _ => return Err(EINVAL),
-        };
-
-        Ok(sub_version)
+            // TODO: somehow the compiler cannot infer that `value` cannot be > 3. Find a way to
+            // handle this gracefully, or switch back to fallible ops.
+            _ => panic!(),
+        }
     }
 }
 
@@ -125,16 +133,19 @@ pub(crate) enum FalconSecurityModel {
     /// Also known as High-Secure, Privilege Level 3 or PL3.
     Heavy = 3,
 }
-impl_from_enum_to_u8!(FalconSecurityModel);
+impl_from_enum_to_bounded!(FalconSecurityModel, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconSecurityModel {
+impl<T> TryFrom<BoundedInt<T, 2>> for FalconSecurityModel
+where
+    T: Boundable<2>,
+{
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
+    fn try_from(value: BoundedInt<T, 2>) -> Result<Self> {
         use FalconSecurityModel::*;
 
-        let sec_model = match value {
+        let sec_model = match u8::from(value) {
             0 => None,
             2 => Light,
             3 => Heavy,
@@ -157,14 +168,17 @@ pub(crate) enum FalconModSelAlgo {
     #[default]
     Rsa3k = 1,
 }
-impl_from_enum_to_u8!(FalconModSelAlgo);
+impl_from_enum_to_bounded!(FalconModSelAlgo, 8);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconModSelAlgo {
+impl<T> TryFrom<BoundedInt<T, 8>> for FalconModSelAlgo
+where
+    T: Boundable<8>,
+{
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: BoundedInt<T, 8>) -> Result<Self> {
+        match u8::from(value) {
             1 => Ok(FalconModSelAlgo::Rsa3k),
             _ => Err(EINVAL),
         }
@@ -179,14 +193,17 @@ pub(crate) enum DmaTrfCmdSize {
     #[default]
     Size256B = 0x6,
 }
-impl_from_enum_to_u8!(DmaTrfCmdSize);
+impl_from_enum_to_bounded!(DmaTrfCmdSize, 3);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for DmaTrfCmdSize {
+impl<T> TryFrom<BoundedInt<T, 3>> for DmaTrfCmdSize
+where
+    T: Boundable<3>,
+{
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        match value {
+    fn try_from(value: BoundedInt<T, 3>) -> Result<Self> {
+        match u8::from(value) {
             0x6 => Ok(Self::Size256B),
             _ => Err(EINVAL),
         }
@@ -202,25 +219,20 @@ pub(crate) enum PeregrineCoreSelect {
     /// RISC-V core is active.
     Riscv = 1,
 }
+impl_from_enum_to_bounded!(PeregrineCoreSelect, 1);
 
-impl From<bool> for PeregrineCoreSelect {
-    fn from(value: bool) -> Self {
-        match value {
+impl<T> From<BoundedInt<T, 1>> for PeregrineCoreSelect
+where
+    T: Boundable<1> + Zeroable,
+{
+    fn from(value: BoundedInt<T, 1>) -> Self {
+        match bool::from(value) {
             false => PeregrineCoreSelect::Falcon,
             true => PeregrineCoreSelect::Riscv,
         }
     }
 }
 
-impl From<PeregrineCoreSelect> for bool {
-    fn from(value: PeregrineCoreSelect) -> Self {
-        match value {
-            PeregrineCoreSelect::Falcon => false,
-            PeregrineCoreSelect::Riscv => true,
-        }
-    }
-}
-
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
@@ -244,14 +256,17 @@ pub(crate) enum FalconFbifTarget {
     /// Non-coherent system memory (System DRAM).
     NoncoherentSysmem = 2,
 }
-impl_from_enum_to_u8!(FalconFbifTarget);
+impl_from_enum_to_bounded!(FalconFbifTarget, 2);
 
 // TODO[FPRI]: replace with `FromPrimitive`.
-impl TryFrom<u8> for FalconFbifTarget {
+impl<T> TryFrom<BoundedInt<T, 2>> for FalconFbifTarget
+where
+    T: Boundable<2>,
+{
     type Error = Error;
 
-    fn try_from(value: u8) -> Result<Self> {
-        let res = match value {
+    fn try_from(value: BoundedInt<T, 2>) -> Result<Self> {
+        let res = match u8::from(value) {
             0 => Self::LocalFb,
             1 => Self::CoherentSysmem,
             2 => Self::NoncoherentSysmem,
@@ -271,26 +286,21 @@ pub(crate) enum FalconFbifMemType {
     /// Physical memory addresses.
     Physical = 1,
 }
+impl_from_enum_to_bounded!(FalconFbifMemType, 1);
 
 /// Conversion from a single-bit register field.
-impl From<bool> for FalconFbifMemType {
-    fn from(value: bool) -> Self {
-        match value {
+impl<T> From<BoundedInt<T, 1>> for FalconFbifMemType
+where
+    T: Boundable<1> + Zeroable,
+{
+    fn from(value: BoundedInt<T, 1>) -> Self {
+        match bool::from(value) {
             false => Self::Virtual,
             true => Self::Physical,
         }
     }
 }
 
-impl From<FalconFbifMemType> for bool {
-    fn from(value: FalconFbifMemType) -> Self {
-        match value {
-            FalconFbifMemType::Virtual => false,
-            FalconFbifMemType::Physical => true,
-        }
-    }
-}
-
 /// Type used to represent the `PFALCON` registers address base for a given falcon engine.
 pub(crate) struct PFalconBase(());
 
@@ -440,7 +450,7 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         self.reset_wait_mem_scrubbing(bar)?;
 
         regs::NV_PFALCON_FALCON_RM::default()
-            .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
+            .set_value(u32::from(regs::NV_PMC_BOOT_0::read(bar)))
             .write(bar, &E::ID);
 
         Ok(())
@@ -507,18 +517,18 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             .set_base((dma_start >> 8) as u32)
             .write(bar, &E::ID);
         regs::NV_PFALCON_FALCON_DMATRFBASE1::default()
-            .set_base((dma_start >> 40) as u16)
+            .try_set_base(dma_start >> 40)?
             .write(bar, &E::ID);
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
             .set_imem(target_mem == FalconMem::Imem)
-            .set_sec(if sec { 1 } else { 0 });
+            .set_sec(BoundedInt::new(if sec { 1 } else { 0 }));
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
             regs::NV_PFALCON_FALCON_DMATRFMOFFS::default()
-                .set_offs(load_offsets.dst_start + pos)
+                .try_set_offs(load_offsets.dst_start + pos)?
                 .write(bar, &E::ID);
             regs::NV_PFALCON_FALCON_DMATRFFBOFFS::default()
                 .set_offs(src_start + pos)
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 0b1cbe7853b3..08c8b4123ce8 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -55,7 +55,7 @@ fn signature_reg_fuse_version_ga102(
 
     // `ucode_idx` is guaranteed to be in the range [0..15], making the `read` calls provable valid
     // at build-time.
-    let reg_fuse_version = if engine_id_mask & 0x0001 != 0 {
+    let reg_fuse_version: u16 = if engine_id_mask & 0x0001 != 0 {
         regs::NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION::read(bar, ucode_idx).data()
     } else if engine_id_mask & 0x0004 != 0 {
         regs::NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION::read(bar, ucode_idx).data()
@@ -64,7 +64,8 @@ fn signature_reg_fuse_version_ga102(
     } else {
         dev_err!(dev, "unexpected engine_id_mask {:#x}", engine_id_mask);
         return Err(EINVAL);
-    };
+    }
+    .into();
 
     // TODO[NUMM]: replace with `last_set_bit` once it lands.
     Ok(u16::BITS - reg_fuse_version.leading_zeros())
diff --git a/drivers/gpu/nova-core/fb/hal/ga100.rs b/drivers/gpu/nova-core/fb/hal/ga100.rs
index 871c42bf033a..5449902f2489 100644
--- a/drivers/gpu/nova-core/fb/hal/ga100.rs
+++ b/drivers/gpu/nova-core/fb/hal/ga100.rs
@@ -2,6 +2,7 @@
 
 struct Ga100;
 
+use kernel::num::BoundedInt;
 use kernel::prelude::*;
 
 use crate::driver::Bar0;
@@ -18,7 +19,7 @@ pub(super) fn read_sysmem_flush_page_ga100(bar: &Bar0) -> u64 {
 
 pub(super) fn write_sysmem_flush_page_ga100(bar: &Bar0, addr: u64) {
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI::default()
-        .set_adr_63_40((addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI) as u32)
+        .set_adr_63_40(BoundedInt::new(addr >> FLUSH_SYSMEM_ADDR_SHIFT_HI).cast())
         .write(bar);
     regs::NV_PFB_NISO_FLUSH_SYSMEM_ADDR::default()
         .set_adr_39_08((addr >> FLUSH_SYSMEM_ADDR_SHIFT) as u32)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 5da9ad726483..7ed382d82fc7 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 
+use kernel::num::BoundedInt;
 use kernel::{device, devres::Devres, error::code::*, pci, prelude::*, sync::Arc};
 
 use crate::driver::Bar0;
@@ -131,15 +132,15 @@ fn try_from(value: u8) -> Result<Self> {
 }
 
 pub(crate) struct Revision {
-    major: u8,
-    minor: u8,
+    major: BoundedInt<u8, 4>,
+    minor: BoundedInt<u8, 4>,
 }
 
 impl Revision {
     fn from_boot0(boot0: regs::NV_PMC_BOOT_0) -> Self {
         Self {
-            major: boot0.major_revision(),
-            minor: boot0.minor_revision(),
+            major: boot0.major_revision().cast(),
+            minor: boot0.minor_revision().cast(),
         }
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..1542d72e4a65 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -17,18 +17,19 @@
 // PMC
 
 register!(NV_PMC_BOOT_0 @ 0x00000000, "Basic revision information about the GPU" {
-    3:0     minor_revision as u8, "Minor revision of the chip";
-    7:4     major_revision as u8, "Major revision of the chip";
-    8:8     architecture_1 as u8, "MSB of the architecture";
-    23:20   implementation as u8, "Implementation version of the architecture";
-    28:24   architecture_0 as u8, "Lower bits of the architecture";
+    3:0     minor_revision, "Minor revision of the chip";
+    7:4     major_revision, "Major revision of the chip";
+    8:8     architecture_1, "MSB of the architecture";
+    23:20   implementation, "Implementation version of the architecture";
+    28:24   architecture_0, "Lower bits of the architecture";
 });
 
 impl NV_PMC_BOOT_0 {
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
-            self.architecture_0() | (self.architecture_1() << Self::ARCHITECTURE_0_RANGE.len()),
+            u8::from(self.architecture_0())
+                | (u8::from(self.architecture_1()) << Self::ARCHITECTURE_0_RANGE.len()),
         )
     }
 
@@ -49,7 +50,7 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 
 register!(NV_PBUS_SW_SCRATCH_0E_FRTS_ERR => NV_PBUS_SW_SCRATCH[0xe],
     "scratch register 0xe used as FRTS firmware error code" {
-    31:16   frts_err_code as u16;
+    31:16   frts_err_code;
 });
 
 // PFB
@@ -58,17 +59,17 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
 // GPU to perform sysmembar operations (see `fb::SysmemFlush`).
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR @ 0x00100c10 {
-    31:0    adr_39_08 as u32;
+    31:0    adr_39_08;
 });
 
 register!(NV_PFB_NISO_FLUSH_SYSMEM_ADDR_HI @ 0x00100c40 {
-    23:0    adr_63_40 as u32;
+    23:0    adr_63_40;
 });
 
 register!(NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE @ 0x00100ce0 {
-    3:0     lower_scale as u8;
-    9:4     lower_mag as u8;
-    30:30   ecc_mode_enabled as bool;
+    3:0     lower_scale;
+    9:4     lower_mag;
+    30:30   ecc_mode_enabled => bool;
 });
 
 impl NV_PFB_PRI_MMU_LOCAL_MEMORY_RANGE {
@@ -87,7 +88,7 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 }
 
 register!(NV_PFB_PRI_MMU_WPR2_ADDR_LO@0x001fa824  {
-    31:4    lo_val as u32, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
+    31:4    lo_val, "Bits 12..40 of the lower (inclusive) bound of the WPR2 region";
 });
 
 impl NV_PFB_PRI_MMU_WPR2_ADDR_LO {
@@ -98,7 +99,7 @@ pub(crate) fn lower_bound(self) -> u64 {
 }
 
 register!(NV_PFB_PRI_MMU_WPR2_ADDR_HI@0x001fa828  {
-    31:4    hi_val as u32, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
+    31:4    hi_val, "Bits 12..40 of the higher (exclusive) bound of the WPR2 region";
 });
 
 impl NV_PFB_PRI_MMU_WPR2_ADDR_HI {
@@ -123,7 +124,7 @@ pub(crate) fn higher_bound(self) -> u64 {
 // `PGC6_AON_SECURE_SCRATCH_GROUP_05` register (which it needs to read GFW_BOOT).
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_PRIV_LEVEL_MASK @ 0x00118128,
           "Privilege level mask register" {
-    0:0     read_protection_level0 as bool, "Set after FWSEC lowers its protection level";
+    0:0     read_protection_level0 => bool, "Set after FWSEC lowers its protection level";
 });
 
 // OpenRM defines this as a register array, but doesn't specify its size and only uses its first
@@ -133,7 +134,7 @@ pub(crate) fn higher_bound(self) -> u64 {
 register!(
     NV_PGC6_AON_SECURE_SCRATCH_GROUP_05_0_GFW_BOOT => NV_PGC6_AON_SECURE_SCRATCH_GROUP_05[0],
     "Scratch group 05 register 0 used as GFW boot progress indicator" {
-        7:0    progress as u8, "Progress of GFW boot (0xff means completed)";
+        7:0    progress, "Progress of GFW boot (0xff means completed)";
     }
 );
 
@@ -145,13 +146,13 @@ pub(crate) fn completed(self) -> bool {
 }
 
 register!(NV_PGC6_AON_SECURE_SCRATCH_GROUP_42 @ 0x001183a4 {
-    31:0    value as u32;
+    31:0    value;
 });
 
 register!(
     NV_USABLE_FB_SIZE_IN_MB => NV_PGC6_AON_SECURE_SCRATCH_GROUP_42,
     "Scratch group 42 register used as framebuffer size" {
-        31:0    value as u32, "Usable framebuffer size, in megabytes";
+        31:0    value, "Usable framebuffer size, in megabytes";
     }
 );
 
@@ -165,8 +166,8 @@ pub(crate) fn usable_fb_size(self) -> u64 {
 // PDISP
 
 register!(NV_PDISP_VGA_WORKSPACE_BASE @ 0x00625f04 {
-    3:3     status_valid as bool, "Set if the `addr` field is valid";
-    31:8    addr as u32, "VGA workspace base address divided by 0x10000";
+    3:3     status_valid => bool, "Set if the `addr` field is valid";
+    31:8    addr, "VGA workspace base address divided by 0x10000";
 });
 
 impl NV_PDISP_VGA_WORKSPACE_BASE {
@@ -185,40 +186,40 @@ pub(crate) fn vga_workspace_addr(self) -> Option<u64> {
 pub(crate) const NV_FUSE_OPT_FPF_SIZE: usize = 16;
 
 register!(NV_FUSE_OPT_FPF_NVDEC_UCODE1_VERSION @ 0x00824100[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
+    15:0    data;
 });
 
 register!(NV_FUSE_OPT_FPF_SEC2_UCODE1_VERSION @ 0x00824140[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
+    15:0    data;
 });
 
 register!(NV_FUSE_OPT_FPF_GSP_UCODE1_VERSION @ 0x008241c0[NV_FUSE_OPT_FPF_SIZE] {
-    15:0    data as u16;
+    15:0    data;
 });
 
 // PFALCON
 
 register!(NV_PFALCON_FALCON_IRQSCLR @ PFalconBase[0x00000004] {
-    4:4     halt as bool;
-    6:6     swgen0 as bool;
+    4:4     halt => bool;
+    6:6     swgen0 => bool;
 });
 
 register!(NV_PFALCON_FALCON_MAILBOX0 @ PFalconBase[0x00000040] {
-    31:0    value as u32;
+    31:0    value => u32;
 });
 
 register!(NV_PFALCON_FALCON_MAILBOX1 @ PFalconBase[0x00000044] {
-    31:0    value as u32;
+    31:0    value => u32;
 });
 
 register!(NV_PFALCON_FALCON_RM @ PFalconBase[0x00000084] {
-    31:0    value as u32;
+    31:0    value => u32;
 });
 
 register!(NV_PFALCON_FALCON_HWCFG2 @ PFalconBase[0x000000f4] {
-    10:10   riscv as bool;
-    12:12   mem_scrubbing as bool, "Set to 0 after memory scrubbing is completed";
-    31:31   reset_ready as bool, "Signal indicating that reset is completed (GA102+)";
+    10:10   riscv => bool;
+    12:12   mem_scrubbing => bool, "Set to 0 after memory scrubbing is completed";
+    31:31   reset_ready => bool, "Signal indicating that reset is completed (GA102+)";
 });
 
 impl NV_PFALCON_FALCON_HWCFG2 {
@@ -229,101 +230,101 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
 }
 
 register!(NV_PFALCON_FALCON_CPUCTL @ PFalconBase[0x00000100] {
-    1:1     startcpu as bool;
-    4:4     halted as bool;
-    6:6     alias_en as bool;
+    1:1     startcpu => bool;
+    4:4     halted => bool;
+    6:6     alias_en => bool;
 });
 
 register!(NV_PFALCON_FALCON_BOOTVEC @ PFalconBase[0x00000104] {
-    31:0    value as u32;
+    31:0    value => u32;
 });
 
 register!(NV_PFALCON_FALCON_DMACTL @ PFalconBase[0x0000010c] {
-    0:0     require_ctx as bool;
-    1:1     dmem_scrubbing as bool;
-    2:2     imem_scrubbing as bool;
-    6:3     dmaq_num as u8;
-    7:7     secure_stat as bool;
+    0:0     require_ctx => bool;
+    1:1     dmem_scrubbing => bool;
+    2:2     imem_scrubbing => bool;
+    6:3     dmaq_num;
+    7:7     secure_stat => bool;
 });
 
 register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
-    31:0    base as u32;
+    31:0    base => u32;
 });
 
 register!(NV_PFALCON_FALCON_DMATRFMOFFS @ PFalconBase[0x00000114] {
-    23:0    offs as u32;
+    23:0    offs;
 });
 
 register!(NV_PFALCON_FALCON_DMATRFCMD @ PFalconBase[0x00000118] {
-    0:0     full as bool;
-    1:1     idle as bool;
-    3:2     sec as u8;
-    4:4     imem as bool;
-    5:5     is_write as bool;
-    10:8    size as u8 ?=> DmaTrfCmdSize;
-    14:12   ctxdma as u8;
-    16:16   set_dmtag as u8;
+    0:0     full => bool;
+    1:1     idle => bool;
+    3:2     sec;
+    4:4     imem => bool;
+    5:5     is_write => bool;
+    10:8    size ?=> DmaTrfCmdSize;
+    14:12   ctxdma;
+    16:16   set_dmtag;
 });
 
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
-    31:0    offs as u32;
+    31:0    offs => u32;
 });
 
 register!(NV_PFALCON_FALCON_DMATRFBASE1 @ PFalconBase[0x00000128] {
-    8:0     base as u16;
+    8:0     base;
 });
 
 register!(NV_PFALCON_FALCON_HWCFG1 @ PFalconBase[0x0000012c] {
-    3:0     core_rev as u8 ?=> FalconCoreRev, "Core revision";
-    5:4     security_model as u8 ?=> FalconSecurityModel, "Security model";
-    7:6     core_rev_subversion as u8 ?=> FalconCoreRevSubversion, "Core revision subversion";
+    3:0     core_rev ?=> FalconCoreRev, "Core revision";
+    5:4     security_model ?=> FalconSecurityModel, "Security model";
+    7:6     core_rev_subversion => FalconCoreRevSubversion, "Core revision subversion";
 });
 
 register!(NV_PFALCON_FALCON_CPUCTL_ALIAS @ PFalconBase[0x00000130] {
-    1:1     startcpu as bool;
+    1:1     startcpu => bool;
 });
 
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
-    0:0     reset as bool;
+    0:0     reset => bool;
 });
 
 register!(NV_PFALCON_FBIF_TRANSCFG @ PFalconBase[0x00000600[8]] {
-    1:0     target as u8 ?=> FalconFbifTarget;
-    2:2     mem_type as bool => FalconFbifMemType;
+    1:0     target ?=> FalconFbifTarget;
+    2:2     mem_type => FalconFbifMemType;
 });
 
 register!(NV_PFALCON_FBIF_CTL @ PFalconBase[0x00000624] {
-    7:7     allow_phys_no_ctx as bool;
+    7:7     allow_phys_no_ctx => bool;
 });
 
 /* PFALCON2 */
 
 register!(NV_PFALCON2_FALCON_MOD_SEL @ PFalcon2Base[0x00000180] {
-    7:0     algo as u8 ?=> FalconModSelAlgo;
+    7:0     algo ?=> FalconModSelAlgo;
 });
 
 register!(NV_PFALCON2_FALCON_BROM_CURR_UCODE_ID @ PFalcon2Base[0x00000198] {
-    7:0    ucode_id as u8;
+    7:0    ucode_id => u8;
 });
 
 register!(NV_PFALCON2_FALCON_BROM_ENGIDMASK @ PFalcon2Base[0x0000019c] {
-    31:0    value as u32;
+    31:0    value => u32;
 });
 
 // OpenRM defines this as a register array, but doesn't specify its size and only uses its first
 // element. Be conservative until we know the actual size or need to use more registers.
 register!(NV_PFALCON2_FALCON_BROM_PARAADDR @ PFalcon2Base[0x00000210[1]] {
-    31:0    value as u32;
+    31:0    value => u32;
 });
 
 // PRISCV
 
 register!(NV_PRISCV_RISCV_BCR_CTRL @ PFalconBase[0x00001668] {
-    0:0     valid as bool;
-    4:4     core_select as bool => PeregrineCoreSelect;
-    8:8     br_fetch as bool;
+    0:0     valid => bool;
+    4:4     core_select => PeregrineCoreSelect;
+    8:8     br_fetch => bool;
 });
 
 // The modules below provide registers that are not identical on all supported chips. They should
@@ -333,7 +334,7 @@ pub(crate) mod gm107 {
     // FUSE
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00021c04 {
-        0:0     display_disabled as bool;
+        0:0     display_disabled => bool;
     });
 }
 
@@ -341,6 +342,6 @@ pub(crate) mod ga100 {
     // FUSE
 
     register!(NV_FUSE_STATUS_OPT_DISPLAY @ 0x00820c04 {
-        0:0     display_disabled as bool;
+        0:0     display_disabled => bool;
     });
 }
diff --git a/drivers/gpu/nova-core/regs/macros.rs b/drivers/gpu/nova-core/regs/macros.rs
index 73811a115762..54c7f6fc746b 100644
--- a/drivers/gpu/nova-core/regs/macros.rs
+++ b/drivers/gpu/nova-core/regs/macros.rs
@@ -398,12 +398,9 @@ fn from(reg: $name) -> u32 {
         register!(@fields_dispatcher $name { $($fields)* });
     };
 
-    // Captures the fields and passes them to all the implementers that require field information.
-    //
-    // Used to simplify the matching rules for implementers, so they don't need to match the entire
-    // complex fields rule even though they only make use of part of it.
+    // Dispatch fields for the bounded integers syntax.
     (@fields_dispatcher $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
+        $($hi:tt:$lo:tt $field:ident
             $(?=> $try_into_type:ty)?
             $(=> $into_type:ty)?
             $(, $comment:literal)?
@@ -411,123 +408,25 @@ fn from(reg: $name) -> u32 {
         )*
     }
     ) => {
-        register!(@field_accessors $name {
-            $(
-                $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-            ;
-            )*
-        });
-        register!(@debug $name { $($field;)* });
-        register!(@default $name { $($field;)* });
-    };
-
-    // Defines all the field getter/methods methods for `$name`.
-    (
-        @field_accessors $name:ident {
-        $($hi:tt:$lo:tt $field:ident as $type:tt
-            $(?=> $try_into_type:ty)?
-            $(=> $into_type:ty)?
-            $(, $comment:literal)?
-        ;
-        )*
-        }
-    ) => {
-        $(
-            register!(@check_field_bounds $hi:$lo $field as $type);
-        )*
-
         #[allow(dead_code)]
         impl $name {
-            $(
-            register!(@field_accessor $name $hi:$lo $field as $type
-                $(?=> $try_into_type)?
-                $(=> $into_type)?
-                $(, $comment)?
-                ;
-            );
-            )*
-        }
-    };
-
-    // Boolean fields must have `$hi == $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as bool) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi == $lo,
-                concat!("boolean field `", stringify!($field), "` covers more than one bit")
-            );
-        };
-    };
-
-    // Non-boolean fields must have `$hi >= $lo`.
-    (@check_field_bounds $hi:tt:$lo:tt $field:ident as $type:tt) => {
-        #[allow(clippy::eq_op)]
-        const _: () = {
-            ::kernel::build_assert!(
-                $hi >= $lo,
-                concat!("field `", stringify!($field), "`'s MSB is smaller than its LSB")
-            );
-        };
-    };
-
-    // Catches fields defined as `bool` and convert them into a boolean value.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(
-            @leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(if f != 0 { true } else { false }) }
-            bool $into_type => $into_type $(, $comment)?;
+        $(
+        register!(@private_field_accessors $name $hi:$lo $field);
+        register!(@public_field_accessors $name $hi:$lo $field
+            $(?=> $try_into_type)?
+            $(=> $into_type)?
+            $(, $comment)?
         );
+        )*
+        }
+
+        register!(@debug $name { $($field;)* });
+        register!(@default $name { $($field;)* });
+
     };
 
-    // Shortcut for fields defined as `bool` without the `=>` syntax.
     (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as bool $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as bool => bool $(, $comment)?;);
-    };
-
-    // Catches the `?=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt ?=> $try_into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$try_into_type>::try_from(f as $type) } $type $try_into_type =>
-            ::core::result::Result<
-                $try_into_type,
-                <$try_into_type as ::core::convert::TryFrom<$type>>::Error
-            >
-            $(, $comment)?;);
-    };
-
-    // Catches the `=>` syntax for non-boolean fields.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt => $into_type:ty
-            $(, $comment:literal)?;
-    ) => {
-        register!(@leaf_accessor $name $hi:$lo $field
-            { |f| <$into_type>::from(f as $type) } $type $into_type => $into_type $(, $comment)?;);
-    };
-
-    // Shortcut for non-boolean fields defined without the `=>` or `?=>` syntax.
-    (
-        @field_accessor $name:ident $hi:tt:$lo:tt $field:ident as $type:tt
-            $(, $comment:literal)?;
-    ) => {
-        register!(@field_accessor $name $hi:$lo $field as $type => $type $(, $comment)?;);
-    };
-
-    // Generates the accessor methods for a single field.
-    (
-        @leaf_accessor $name:ident $hi:tt:$lo:tt $field:ident
-            { $process:expr } $prim_type:tt $to_type:ty => $res_type:ty $(, $comment:literal)?;
+        @private_field_accessors $name:ident $hi:tt:$lo:tt $field:ident
     ) => {
         ::kernel::macros::paste!(
         const [<$field:upper _RANGE>]: ::core::ops::RangeInclusive<u8> = $lo..=$hi;
@@ -535,38 +434,135 @@ impl $name {
         const [<$field:upper _SHIFT>]: u32 = Self::[<$field:upper _MASK>].trailing_zeros();
         );
 
-        $(
-        #[doc="Returns the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn $field(self) -> $res_type {
-            ::kernel::macros::paste!(
+        ::kernel::macros::paste!(
+        fn [<$field _internal>](self) ->
+            ::kernel::num::BoundedInt<u32, { $hi + 1 - $lo }> {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            // Ensure the returned type has the same width as the field.
+            ::kernel::static_assert!(
+                MASK >> SHIFT == <u32 as ::kernel::num::Boundable<{ $hi + 1 - $lo }>>::MASK
             );
+
             let field = ((self.0 & MASK) >> SHIFT);
 
-            $process(field)
+            ::kernel::num::BoundedInt::<u32, { $hi + 1 - $lo }>::new(field)
         }
 
-        ::kernel::macros::paste!(
-        $(
-        #[doc="Sets the value of this field:"]
-        #[doc=$comment]
-        )?
-        #[inline(always)]
-        pub(crate) fn [<set_ $field>](mut self, value: $to_type) -> Self {
+        fn [<set_ $field _internal>](
+            mut self,
+            value: ::kernel::num::BoundedInt<u32, { $hi + 1 - $lo }>,
+        ) -> Self
+        {
             const MASK: u32 = $name::[<$field:upper _MASK>];
             const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
-            let value = (u32::from($prim_type::from(value)) << SHIFT) & MASK;
+            // Ensure the returned type has the same width as the field.
+            ::kernel::static_assert!(
+                MASK >> SHIFT == <u32 as ::kernel::num::Boundable<{ $hi + 1 - $lo }>>::MASK
+            );
+
+            let value = (value.get() << SHIFT) & MASK;
             self.0 = (self.0 & !MASK) | value;
 
             self
         }
+
+        fn [<try_set_ $field _internal>]<T>(
+            mut self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<u32, { $hi + 1 - $lo }>,
+        {
+            const MASK: u32 = $name::[<$field:upper _MASK>];
+            const SHIFT: u32 = $name::[<$field:upper _SHIFT>];
+            // Ensure the returned type has the same width as the field.
+            ::kernel::static_assert!(
+                MASK >> SHIFT == <u32 as ::kernel::num::Boundable<{ $hi + 1 - $lo }>>::MASK
+            );
+            let value = value.try_into()?;
+
+            let value = (value.get() << SHIFT) & MASK;
+            self.0 = (self.0 & !MASK) | value;
+
+            Ok(self)
+        }
         );
     };
 
+    // Generates the public accessors for fields infallibly (`=>`) converted to a type.
+    (
+        @public_field_accessors $name:ident $hi:tt:$lo:tt $field:ident => $into_type:ty
+            $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+        pub(crate) fn $field(self) -> $into_type
+        {
+            self.[<$field _internal>]().into()
+        }
+
+        pub(crate) fn [<set_ $field>](self, value: $into_type) -> Self
+        {
+            self.[<set_ $field _internal>](value.into())
+        }
+        );
+    };
+
+    // Generates the public accessors for fields fallibly (`?=>`) converted to a type.
+    (
+        @public_field_accessors $name:ident $hi:tt:$lo:tt $field:ident ?=> $try_into_type:ty
+            $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+        pub(crate) fn $field(self) ->
+            Result<
+                $try_into_type,
+                <$try_into_type as ::core::convert::TryFrom<
+                    ::kernel::num::BoundedInt<u32, { $hi + 1 - $lo }>
+                >>::Error
+            >
+        {
+            self.[<$field _internal>]().try_into()
+        }
+
+        pub(crate) fn [<set_ $field>](self, value: $try_into_type) -> Self
+        {
+            self.[<set_ $field _internal>](value.into())
+        }
+        );
+    };
+
+    // Generates the public accessors for fields not converted to a type.
+    (
+        @public_field_accessors $name:ident $hi:tt:$lo:tt $field:ident $(, $comment:literal)?
+    ) => {
+        ::kernel::macros::paste!(
+        pub(crate) fn $field(self) ->
+            ::kernel::num::BoundedInt<u32, { $hi + 1 - $lo }>
+        {
+            self.[<$field _internal>]()
+        }
+
+        pub(crate) fn [<set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> Self
+            where T: Into<::kernel::num::BoundedInt<u32, { $hi + 1 - $lo }>>,
+        {
+            self.[<set_ $field _internal>](value.into())
+        }
+
+        pub(crate) fn [<try_set_ $field>]<T>(
+            self,
+            value: T,
+        ) -> ::kernel::error::Result<Self>
+            where T: ::kernel::num::TryIntoBounded<u32, { $hi + 1 - $lo }>,
+        {
+            Ok(self.[<set_ $field _internal>](value.try_into()?))
+        }
+        );
+    };
+
+
     // Generates the `Debug` implementation for `$name`.
     (@debug $name:ident { $($field:ident;)* }) => {
         impl ::core::fmt::Debug for $name {
@@ -582,6 +578,8 @@ fn fmt(&self, f: &mut ::core::fmt::Formatter<'_>) -> ::core::fmt::Result {
     };
 
     // Generates the `Default` implementation for `$name`.
+    // TODO: hack - we should not use the internal method. Maybe add private methods returning the
+    // defaults value for each field?
     (@default $name:ident { $($field:ident;)* }) => {
         /// Returns a value for the register where all fields are set to their default value.
         impl ::core::default::Default for $name {
@@ -591,7 +589,7 @@ fn default() -> Self {
 
                 ::kernel::macros::paste!(
                 $(
-                value.[<set_ $field>](Default::default());
+                value.[<set_ $field _internal>](Default::default());
                 )*
                 );
 

-- 
2.51.0

