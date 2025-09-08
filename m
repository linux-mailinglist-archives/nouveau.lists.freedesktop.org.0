Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1A0AB48F61
	for <lists+nouveau@lfdr.de>; Mon,  8 Sep 2025 15:26:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032EF10E078;
	Mon,  8 Sep 2025 13:26:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WV577PDa";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B398410E078
 for <nouveau@lists.freedesktop.org>; Mon,  8 Sep 2025 13:26:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=APKmyRIOm1TjG7pK+0Vna2HmrwtLYICbv5cENCz3ldFfki+Z2FHQjNMA+JaVsjW1RtAyDP6DI8Q7mLaaE6gONLV1bruTwh20gAOJfdUNGwfxs7ed1NJixKTrttAe0hiFyNLLTW21CfWD0iTARV4z4kJXIXM8YMCZG/CiymU4/Hb+I9sci4bGgfUD7yZkV3ctBTm78zZmtGmxqlJMaYQZXwSpOOgdLSUH+lkI7yHSPCyiezkLcb5iVfiTR+w/PvINV4KSKHPJx1TuiDsmZysEmUXbK9yPtIIXTS7NxiVrmLRnKu/5wB+bMOf2GSGzR1qTx3qsMKQ2sa/wB/AUO25FYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AkVvvliM7NnbHqgRQtvnMOxmfGo0sB+NNHhPHg3e0NM=;
 b=vmdQHcfmsqs0zT0vvWUgLI1kJ5mD2MJsZWEwqR/u51/90TkYdaZDYlS8miBmCy+bF9Siy71GGZEyaCOgKvejHKb6yRJM99cjG5xYPAK0AncBamiipdgs4MKwkT9XFNafFnKiVaDOP76cWzMg1vDR2hJjhZU2iQIglaOHErJr7bkNuaK1VZXVuCTN/FXJ0JdzLPvtXA4NHkp+FJI/tqltubBG/fcmD0++sLr9G6FVnQW+SvnMr7T5ud1M4fqMquSkoMnzv6kS4NG4GK0Q4CWoF4/tn1XrG6lBihGHymoKgRGWaLkBOrnmMBUSqxLJgGYbdcSbJKWcjzUaWOjssOPwaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AkVvvliM7NnbHqgRQtvnMOxmfGo0sB+NNHhPHg3e0NM=;
 b=WV577PDa97lsRJRpMrPazogbG8Eu3OGtnQ9APgXO1rfI6mH9KkiXDX8r+cn7GJpiO3PjOLUPq6r7WziVnnUckZOtLbvSQf6EbCYpCxE5s2HlpNPzKM+SZrtbDjxxWsnCCgAFWwpKCAFa3ogEaq+2+596Gh6BF4+fB3IY6TtTU3fx+9efFD4j4Kf7gjwsA6ewKUPvNpHrVHRmP+GrbZUG2Q8hOh1Ry05FnqQvP3yaacFKP5SK0V8DRoii2iGoET67lUxAwau+TYNMrvfoJWYqkR0o615r/Tq5D74A93N2i4pW+B868kbP17th2+F303ZLyTpKhMOtrRuV8mOCmP7m7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SJ5PPF3487F9737.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::990) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.19; Mon, 8 Sep
 2025 13:26:04 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9094.018; Mon, 8 Sep 2025
 13:26:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v5 0/2] rust: add `Alignment` type
Date: Mon, 08 Sep 2025 22:25:53 +0900
Message-Id: <20250908-num-v5-0-c0f2f681ea96@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGLZvmgC/2XQ20rEMBAG4FcpuTZLMjm0KSK+h4ikObgB22rSD
 cqy7+60Fdxl6dVf8v3JzJmUkFMopG/OJIeaSponDOqhIe5op/dAk8dMgIFiGhidTiM1EmPHHQP
 XEjz5mUNM31vLyyvmYyrLnH+20srXv7e+cspoG5zwIg5MO/M81eSTPbh5JGtBhX/UMbkjQGSNH
 oyzOgwM7pC4Qhx2JBApbbyOgXfCxDskrxDwHUlEPAorQfkWpLxBl33gHL5OuK1ln5qMoRS7bat
 vHv/e3dFoP9w8+dG+gdLDOjd+KhrOfWdi9FfFT+siB1sCxTCmpW+qPvCWZsfxzssvCJhxTKkBA
 AA=
X-Change-ID: 20250620-num-9420281c02c7
To: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
 Danilo Krummrich <dakr@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
 nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>
X-Mailer: b4 0.14.2
X-ClientProxiedBy: TYCP286CA0014.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:26c::8) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SJ5PPF3487F9737:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b8c54ec-1549-450f-dae2-08ddeedb4253
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|366016|1800799024|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Q3lLckl2QXVRdk40SmhoMjlRY0s2bHR1cVBqZ1E3bjRKK2VVbmxrUEMzMnBu?=
 =?utf-8?B?NVQ2eDdmQTd1OWIzT1laYlJQUTlSNDRnbXJmb3F3L3BmL055QTMrcGJRQnNp?=
 =?utf-8?B?czc3Z04wT2laaE0zaDM3bFRFTnVRSGJadzBSbGIyUW9mbHdEenBDc1R5M0hs?=
 =?utf-8?B?VEMrRnZsYTFSWDFETHRjQXJFNUlNUitNWHl6dnlRRFV0R09LczdzeFM1RWpw?=
 =?utf-8?B?eTNwNWlFamx0T09XVElsTnV3WVBhQURYZnczaHZ1Ykltenk1UHJrUHE0R0FZ?=
 =?utf-8?B?R1JzdllHNzlEK0RIQUtkT0hLb3o0bjZUWm4wSVJ4QWhEVW5KT1NmeGRCdkFJ?=
 =?utf-8?B?aDZQc0dKbFRCUWluTTZuT0FCaWVacWtQeUQ2V3BZUGF0aWdWYWY4R25FZzJO?=
 =?utf-8?B?a2w0bjBEa1BXdnJrSzNhQ2lseDdObjdKdllnSDZLTUlaNWlzTDNmeXV3U2FF?=
 =?utf-8?B?Y0NFamYvQVgvS0tDRzB3MFIwMjBiV2d4TEE4MHQ3M2d5TThIVTVybkR4eFhU?=
 =?utf-8?B?c0FuRWxiL09LOFAzNjhBZm0raEpuc2orVVpldHBoMlJXWU1vWGFkMmhRWERE?=
 =?utf-8?B?UFJLblYxa1poZjdta3gwQzBNV3V1enhQM01lanhvNXl4ZkpvR3FaOGhmaEVx?=
 =?utf-8?B?R3dKL3V1MDRSMTJhQTRFNEdzazlBSWhpOE53RjZ1dFpvWkJNNFBYMWh0aFlU?=
 =?utf-8?B?a0JZckRLNHNaeG9IVUdLNDA2SGcrZU5VQjhpaDNBdGVFLzYwc1U0dGoreDZz?=
 =?utf-8?B?NWhtYS9lS2xPTHdhUGNwKzVTeDhFaCtNbVYzc0tmZUFkb0VzcDdBVksrb0Nk?=
 =?utf-8?B?TjFON250bndnTkxXWUtEQTJXbVhyZ1dkWUNVcnBMWlo4SlFOcFNneXY3WC9L?=
 =?utf-8?B?Q0s4bjMyR0ZZVEVwTGZkQkFYcHlDb1kzYmJORU1rMEt4SVdJeVdvdThDdEw2?=
 =?utf-8?B?MzF1NExDdllSTWViaEg4ek00c05HM2xyQ3k4NktPMzFiS05vZVJtYVZienBJ?=
 =?utf-8?B?MDY1OVJvVXhac1ZMNVNsZUZjQzJ0VlVGeGttWDBZN0F3K1BWY1FhUmdpd2M1?=
 =?utf-8?B?N0laME50cWNRMFJYaGNhVFI4Q2hJalNHZjdQVFZMcHY0QTlNcERKZi8rWE55?=
 =?utf-8?B?NUx5UzRiWSsrUG5UY2J4VWkvK2hEZGIveGdaZ0ZMeTdxbkFYM1ZXcmlwSFlE?=
 =?utf-8?B?THU2Mk9jZnM2MFJkVTZzVG5LaHJ3NmdwUDR6cUhILzhnd0JXdW1MVWFuYjVk?=
 =?utf-8?B?Z201NkRKOVZ0Z2kyR0RKSFR4bWlBeXRBMFk0cWRvMERrT1lMMlJWbEVRUXQ5?=
 =?utf-8?B?SkYvRUNrUHVIeVppQnFINWVFODc1d0R2ak10VkxSOFJCNnkzdDJTV0tzT2dO?=
 =?utf-8?B?aWw3d3NHbTAyQ1BpaFhBcjFjUFJ6Zi9DUGlkaUgrZ3NpaEM0WVRySjRBcTZY?=
 =?utf-8?B?bmVuV0RuWHF4OUdhajFaMGZFZVcwNjk2aTYzWjJxY3BleUZGUzdvZmVSSjVR?=
 =?utf-8?B?TGdvTmtWTDlvLzNWRzJSQ2kyTmNrL2RXeDBKaWZzMGM3Mmo1cHBpTVFIOTBw?=
 =?utf-8?B?YVRZaXVST0J5UUI2UEl3MHlRM0g3cnA3dGw1WmkyNyt1Q3hxNUU0Q1IrK3ls?=
 =?utf-8?B?Z3VzcldpaGtCeWRhTmpnWXpubTMzemU4ejNzTWdVN0dsTy9rK3ZpR3djeWFL?=
 =?utf-8?B?VExuTnlyOFd5NTU2bzhNc0x0UncwNWpRUHE5ZVhXSVVZeUcxRVE0K0tMNk5n?=
 =?utf-8?B?R2ZvalpzZHBNRjdmVkF5Q3Q3czNaUGw2RGk4dStBZmgrbXZjSlhHZWwzSU1l?=
 =?utf-8?B?a1Nnb00zaU5tZG1wQkZBY2JZQjFaQ0NIQlF3bmJ2YzFtT0JETnFSYjQ2c1l5?=
 =?utf-8?B?L0lXNWhROWtrNWRIemRMZ0c4M0lGS0RTR3pYaVRXdEw0bXVuNmZPbllhUVlE?=
 =?utf-8?B?K1BiM29xTkI5M05semRnZ0lIRXowUC8xL3FIWUtEc2pXc2hxeFI0NE9lTXdJ?=
 =?utf-8?B?NU1SK0Jma2tnPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(366016)(1800799024)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NGh3TXA2WUxVd0M3ekprWHY0RmZlaGxHMkdVYWMrc3JWd25adHdjb3lNaWxz?=
 =?utf-8?B?NlNyVkxtS2JZZ3VQSVBQREZNUS9IaE5CL3c0M20vd29DMlQ1RWU3QzhMcVN6?=
 =?utf-8?B?YXg2ZnArLzc3aUxlMi9oNUtwNmVwMDRtWFdJeVJrbkE0V0kwSVZaRm04eEdT?=
 =?utf-8?B?VUJ3ckE5Ylp4dE5MMmRlaTNicExES0RaNUNZdjNBajdTcFJVandwako4OHNR?=
 =?utf-8?B?L2E0KzJUZFB6bE9UUmpIN1ljRmJxWWRHMWphVWhjd1AwTldraHFGZ1ZqcDN0?=
 =?utf-8?B?c2RPOEdNd3BRLzgvYlFzTjhLNEtBaDFaMjhGZk5BLzh2Y2lNUnJOODgxL0F5?=
 =?utf-8?B?WGhOa0tUQVFJWXVmd012a3NpU01EV09TanExblZqM1FvZXIwTS90djFPMUdP?=
 =?utf-8?B?UWtBTUg0ZHJ5UG5tYVA2c2dIYlB2VUJoZW5JNmJrVkFQN0dkc3FqekxNTG5m?=
 =?utf-8?B?ZklCRnR1VkFvWDNOM1RFenkxQUw4QlpRTjFrc01saUF0SkpKT1F3emNSbWJF?=
 =?utf-8?B?aU5JSmsvN0w0SmQ4SnJMQWRlNkJVSEV5RFVZcTdhZ3g4cjR6aXE2Vjhic0xF?=
 =?utf-8?B?QzFzSi9VbU1Xb09ETTU0eHZwWlgrbXcva0ZXM0cvcnQyR3JSbVNTKzd4OGV3?=
 =?utf-8?B?N2N6cTJPUDBxS3JSVWhncXRBL2dmSWNmVzFqYks3WUVBZW9vekFQbUlTYUFH?=
 =?utf-8?B?T3Nwa25sTlNsL0FVR1g4S1ErbWt0NGlNWUFoM2tocW50a3QrcE5RTG11OEtV?=
 =?utf-8?B?bHc5SEZjSmMybVhRRndZeDVBYXRmakV6ODU1dVZpbU9jNXBlYlZDdGlpbGFC?=
 =?utf-8?B?TkF1akVvcXFkdFpnTE1XV3c2UjBQNUtqM3h2c2tyN3RhWVdlaEtVeE8yMXlL?=
 =?utf-8?B?dk9jWDVma0xNVGN5VHNENElUZVdHM0tDM0pZR2JzRERSY2N2WUxQb25DTkxS?=
 =?utf-8?B?aDhPV2RyLzNkbGF2LzBTY3djdHZWWnFJNW84UjdPdWt4T3Q0L2EwaDZYWXAv?=
 =?utf-8?B?Q2Z2c3Y0dDd3b3d2bitJVUordmhxYW9MTmxteElzdE9yNzZnRzBVYmorMnVG?=
 =?utf-8?B?Lzh2WHRxZkhlbElxSTk1M0hUeGhYeGFvU1JjVFVRT0FRZ0ZteGphUENVNkdq?=
 =?utf-8?B?NmJIa1h5bzRlY3NuNkxiQ0NkWFBYdkRUY2FYbjhEdEErRGduUzI2UjZ3OEd3?=
 =?utf-8?B?bm5yMlI3STF5QkhCTnF1K0hGYWEyaFk5bTQxYUNZRmhwYVBTY1RYNCtTREdP?=
 =?utf-8?B?d0Z0RVdDK2tDVFB6YUFIamRqTFdVOUtFNzV5MmdacDEySDlrdW96TERoUVNG?=
 =?utf-8?B?SUg2eXN6b1lIYThuN1l2bDB0VzJZY1JCaFp0VFVIUkg4N2xvWURhOVhvT0pM?=
 =?utf-8?B?dHhzc0Rnd1kzSXRCeGRTVGlnc1BzUkh2NmlLZGpScGhheXhoKysrY0swWTQ1?=
 =?utf-8?B?cEhFWGN3Y2FCZHA0VERPaG5seVMwczB6TUI4MkloOUFYWDZhTDl6emNrTFJr?=
 =?utf-8?B?NTFrWGVrRlZreFlGSmlzVU5aUGRRQVVFajFHUDNpbTZYOHpKelQwT0lrRWJn?=
 =?utf-8?B?YVg1V3ZNbTB4U2hVeE5nRGlSbnp0UmhtcWZSMHFIREFNcVJPSkt2cGZqeUNG?=
 =?utf-8?B?MVVvVjNGUElucVNwL0lQeWhmNjIvM2ZPcXpBaktLeUFWNVhWM3hPeGVOL2lV?=
 =?utf-8?B?K1VhWi95NzlTUDhtUGh0OGtXN05OU0NhQkZFNGJ3RDdwRW1DenptcHZ1Sm5Y?=
 =?utf-8?B?NEt2TFlxaithSGM4RWhObEYyZGdRdi85ekRzaW1wZDc4Z3hHeWkwNnREYzF6?=
 =?utf-8?B?bWhFaGhLb0krZ0RzZFJKaGdmelFnRm04ZnFROUMxQmpFaU05MGdmZ0FOWTBR?=
 =?utf-8?B?V0FyU05mR2l2N0pOWVBDSDRTU0xiVFIxV01xZTlxM29JdnNxdmZiKzNDN0pC?=
 =?utf-8?B?b2QreHRuc1B0dW5IS016cjJRTlFFdmxrL2tqUi9lWlgxUGhXK1psdXZyVDF6?=
 =?utf-8?B?Q0NGMzRpY2h3L0ltTUVncVhjeVFNczR2UmpDR3dISml5dHd0MkZTeVhrTGVr?=
 =?utf-8?B?ZlFZN3dwK2poam45TjZMUHlhT0NXVUt3K2FTOTNzS1N0ZnpDeS8xenVwN1ZQ?=
 =?utf-8?B?RDlyRzdFelJxMFU4Q2xPekdmeFhpdEFDWnNZZzRMNFhpRlhSRXh0dnhGWHBC?=
 =?utf-8?Q?bzoeyXn7eh1mTjRsGX1rAACCceOaQclemq9zJ2Rzi4C6?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b8c54ec-1549-450f-dae2-08ddeedb4253
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Sep 2025 13:26:03.7027 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sauOYKg1IioUt96xW7qyQ8NA+QoGnwsbxANV7ByzmMNBhi8buT3oNlQ9NtWv3kTRjay1VRSdM7D47u803jvPqg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPF3487F9737
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

The first patch makes two additions:

- Bring an equivalent of the nightly upstream `Alignment` type [1] with
  an near-identical public interface,
- Add a new `Alignable` extension trait that provides a way to align
  values up or down according to an `Alignment`, and implement it on
  unsigned integer types.

The second patch makes use of these in the Nova driver.

[1] https://doc.rust-lang.org/std/ptr/struct.Alignment.html

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
Changes in v5:
- Update doccomments a bit.
- Use a const generic instead of a regular argument for the const
  constructor.
- Link to v4: https://lore.kernel.org/r/20250821-num-v4-0-1f3a425d7244@nvidia.com

Changes in v4:
- Add the `generic_nonzero` feature (stabilized in Rust 1.79) to fix
  build with Rust 1.78.
- Import `core::mem::align_of` for older Rust versions (as the patch
  adding it to the prelude is not attainable from nova-next yet).
- Link to v3: https://lore.kernel.org/r/20250812-num-v3-0-569d6fe1839f@nvidia.com

Changes in v3:
- Move `align_down` and `align_up` into their own `Alignable` trait.
  (thanks Miguel!)
- Fix `Alignment::mask` implementation to match upstream's.
- Add missing `SAFETY:` comments.
- Improve grammar on a few hard-to-parse comments.
- Link to v2: https://lore.kernel.org/r/20250804-num-v2-0-a96b9ca6eb02@nvidia.com

Changes in v2:
- Remove `last_checked_bit` (use Rust's `checked_ilog2` instead).
- Port Rust nightly `Alignment` type and extend it with `align_down` and
  `align_up` methods.
- Link to v1: https://lore.kernel.org/r/20250620-num-v1-0-7ec3d3fb06c9@nvidia.com

Changes since split from the nova-core series:
- Rename `fls` to `last_set_bit`,
- Generate per-type doctests,
- Add invariants section to `PowerOfTwo`.
- Do not use reference to `self` in `PowerOfTwo` methods since it
  implements `Copy`,
  - Use #[derive] where possible instead of implementing traits
    manually,
    - Remove `Deref` and `Borrow` implementations.

---
Alexandre Courbot (2):
      rust: add `Alignment` type
      gpu: nova-core: use Alignment for alignment-related operations

 Documentation/gpu/nova/core/todo.rst |   1 -
 drivers/gpu/nova-core/fb.rs          |   6 +-
 drivers/gpu/nova-core/vbios.rs       |   4 +-
 rust/kernel/lib.rs                   |   2 +
 rust/kernel/ptr.rs                   | 226 +++++++++++++++++++++++++++++++++++
 5 files changed, 233 insertions(+), 6 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250620-num-9420281c02c7
prerequisite-message-id: <20250808-falcondma_256b-v1-1-15f911d89ffd@nvidia.com>
prerequisite-patch-id: 2439f5f9b560ee4867716f0018b5326dcd72cda3

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

