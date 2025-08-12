Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5F84B21C11
	for <lists+nouveau@lfdr.de>; Tue, 12 Aug 2025 06:24:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 61B1210E2AC;
	Tue, 12 Aug 2025 04:24:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gRUC23G/";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2085.outbound.protection.outlook.com [40.107.102.85])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 814C210E2AC
 for <nouveau@lists.freedesktop.org>; Tue, 12 Aug 2025 04:24:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ua4N8hOHIdiqpgebG9flwLu/5N74IktjrSL5brdq96GYUhQCPSKKUKQ9OWdG/ODzxUK7YSdp1ZgGbwRguHSk37wQ98STt2AbiwtIoAf61P+TXuhos+KM/GdZ5VhKHS9JQBMdvM+tahVyeFdpSSRsHkcWZQvBtytxdFtC+PWca8vekja5U+HH6EIJrzoakSfiwJo3Pw0I70XXmsl2Pq2sevEjbHlvjiEzFp8NOUuo2SZ+SOrAr+8BVqqNqG8susHIZN0VpfL3X8r63HEw79PuZ914pfHgCQlln6q+SG0AqBeVpNRGU10QYTN2B2XXxRvS70Gx5gpVlRsdVQfi8d1v4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I+FC9Ube5vYPOFH/q5SlKMSleOoBV4B7Er4i480kkYA=;
 b=tCNsoiPHebELpeEKg4kIaJFMkXbxuNEbU25E3h0pvTYyo8/8XZCM0DPBl6S1iaBDaWu0/lwKsPAVaLpKxhnKvJX8h9rk66OIJR+/c4RxAly2RyrV/9VhOlMgun2kHO2MpFLG+CuxG4I2jY95Ns6HKCfrwAkFWPAPnA9tZC68RRYwHXOX+LdS6r56REVp6c0EALC5n1gjSnpwnUb8229DsMYL3UFaCE187zukgqYydu+HR9KKvwyX18gZl0VP8USd3I+OoiZzb7G2ZRVzhCnKWeh53r7Ku/wn6BsdsANBjao4woLN9bdtSOtOiqTM4vPh12+p0dSTe94jTsF2/PwWlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I+FC9Ube5vYPOFH/q5SlKMSleOoBV4B7Er4i480kkYA=;
 b=gRUC23G/B0RlmHqD6PfDRLCAvEqHC3rM07Ok8VCieRS+VCQe5gFQe7RTUsZJ0MxlbaGyE9Ye1XylLmnwegI2BwRVbHcyOpWS0WkBjlyDklmeCqDwLxoIyN/6Tb8LPTzk4xz40XPfqacEHpkx/zMomRSUxOOcooxJN6GIod7Kx9X5nRDsPXxHpVti7i+P27qghuHQRbl/VZ2ogCfG5TaoMsluIdgOz084zLb84ELbd/YfLCoUXzus7dNwIIU3ppiAwNLXnI7S/QJHjw55X3WNSSHAIAZDzBsHHyrsl8Pcoc1kSikvj/HYZOHgdDKu6xW7/jKPnO9/E5/WQkDvwUV8DA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DS0PR12MB7677.namprd12.prod.outlook.com (2603:10b6:8:136::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.21; Tue, 12 Aug
 2025 04:24:03 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.9009.018; Tue, 12 Aug 2025
 04:24:03 +0000
From: Alexandre Courbot <acourbot@nvidia.com>
Subject: [PATCH v3 0/2] rust: add `Alignment` type
Date: Tue, 12 Aug 2025 13:23:54 +0900
Message-Id: <20250812-num-v3-0-569d6fe1839f@nvidia.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIANrBmmgC/1WP7WrDIBiFbyX4exY1jYmhjN3HGMWP11WoptNUV
 krvfW+SwVb8dcTn8Zw7KZADFDI2d5KhhhKmhKF9aYg96fQJNDjMRDDRMSkYTddI1R7jwC0Ttif
 48pLBh+/V8v6B+RTKPOXbKq18uX3mK6eM9mBb13rDpFVvqQYX9M5OkSyCKv6gge03SCCklTTKa
 gmGiSfosdXI8HXFDfPWhUQoRa8bxubwaxuo12c7JRf1UXTSLG3wdF5x7gblvfsnfl3mGV2AYoh
 hHpsqd7yn2XL88/EDOR/q+D8BAAA=
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
X-ClientProxiedBy: TYXPR01CA0060.jpnprd01.prod.outlook.com
 (2603:1096:403:a::30) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DS0PR12MB7677:EE_
X-MS-Office365-Filtering-Correlation-Id: f00729dd-7176-4535-d5c3-08ddd958116e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|10070799003|7416014|376014|921020; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?dUVneWJtUzdVa0RpVVMwNFhCZmFZbFJvdUF1d1BlMUNUYm1ZT3hrYUFzVjZN?=
 =?utf-8?B?M0xYY243ZkZEb0ZWV1FpRW40WEdKbVZtM21TSUp1VjMxbDVtdW41VitMb0Zi?=
 =?utf-8?B?TkRlOTdqaTI5ZkNIS29LcHlPSzdJc09YWTJPT2VXNU1qL2x1RjY5UDEzQjRT?=
 =?utf-8?B?dlFlK1ExNzN4TndHUVoyeW95blJnOXJaWVFmWnRzY2JyY0ZsczlzZnJlTDV3?=
 =?utf-8?B?WGQ2a1BUOXhhL3ppcGtBSjA1Vkd4T2JpUUgxYi9HcTlCa1RIc1M3NDJPeXV1?=
 =?utf-8?B?WGUwK29XSEVxQmtSVWNlLzJ1NllpbGx1S0k4OTN2dllMRFB3SjhoNkc1dXRz?=
 =?utf-8?B?Vjg1azljSlFNNEIrZ3VYQ1B5dzY0YlptODUyVHlVK0FKbjB6VzAyT0thZHVt?=
 =?utf-8?B?bFpTTDVzN0lRc1pZZzY5T0ZOUHFKZVRJRm1iYStZY1JEZzJmZWpXRjZwWWxO?=
 =?utf-8?B?U2s4bndWYlRrcXhha2NqSEJaRG42aDM1N0dHUmNxblpLQjlRMU1rQnJORWFn?=
 =?utf-8?B?TW9oZURncEJ6QWhRamlPQmZpOXNIRDA3RUpJTlJjamFtYUtTTFNIWTFkaUR0?=
 =?utf-8?B?RUJBRmQwQVIvMTFEUlgrekkxV21Wci9naW52ZlV6MDNtWGptblp2NG80QTdx?=
 =?utf-8?B?aFNVTVU1dVZFSzlzOUd0VmpPbHU1dXEwaDFGcGd4MERJZ2x1a3Y0UHpENStq?=
 =?utf-8?B?WC9nSjlQQ0J5UXF6Yzl1dVJrSWRiVlZoeTVVYWtUeWYzcWlhZmYrUkRlSXVi?=
 =?utf-8?B?WkVKWmZNdFdWV2d0NlViRlQ1WjhGWWgvemxEM0JxcVYxZUhzdUZ2ZlE4Tkhm?=
 =?utf-8?B?UVJRdlFUWWNhYmhrQmVWRHVVc1NHQ0Q3d01HNFdNVjc5dzY4ZHNDN3dxUlMr?=
 =?utf-8?B?VFY4ajRLbVM1L21sQlFjQitTWTFTYzJ1WThuMEd1c2FZdUEraEw0TUtBVnFp?=
 =?utf-8?B?b1RKVUk5NlFlMGt6Vmtsc3dTSkVNdEp3aWk0SEFPNjRrV3ZUZnp6MUpJRlUw?=
 =?utf-8?B?ZFdtVzlHSitTZXc3dVBoWm9JR2k4c1N6WFFsYjF0OXVEL2NhaEhNNkw3bzJi?=
 =?utf-8?B?dHpqY3hJVEF3UmV1SW1oU1YzbVExZ3lkWXdaVG16VHE2Rktka1prc2h0TXVB?=
 =?utf-8?B?VlRXOHlXZjIveWo2eW1vZisxY0MyT0VXRTZrcFdzcGVuS2dGb3JpQzFmbVJ4?=
 =?utf-8?B?SC9LZTFnZXNITXR3ZnBsZW00ck1PSHZvYmZWTklQclNhZW54QVpRaWU3a0Qz?=
 =?utf-8?B?eFFLWnhKVFFVc3IxdW10Vk9HYWxJcUx5d1ZmQzY0OXF2elNpbU9PUUszUW1r?=
 =?utf-8?B?UUhwd3EyMnIxeXZkZHk5SkVBdkxuSGZOQmtZQW9qb2FzSGVzdytqSm1KTXV2?=
 =?utf-8?B?RFU2ZEY0cWpyM25oTzFUKy9mUXZKdytCODFKMU53NncyRG5FdXY5aWZrM3VC?=
 =?utf-8?B?czgvWkE4QmFDR0FqSDVVRmZmc25aMDQ5M0lnL0lqQ1VkL3pSZFZ5bHYwNXF3?=
 =?utf-8?B?cU1QWVI3Sys5eWdUUGl1QitRdGdaY015SENLWnRtdUZUa2FJOW5PYk1tbTB5?=
 =?utf-8?B?bXYwSHJOYTdmVWVLTzNQNkx4b2V1VkNGQ0FhbGFpVVMvUTVoeDc0dWtMZy9G?=
 =?utf-8?B?dFRKL3VPT2Jpb0xwcVlYdmNvWkxTeXpYdDB2Y0hpdmRjNjZJWE5LU3oybmRj?=
 =?utf-8?B?d1FhNjcrVk4rR2pjL09Obk9GU3Y0NUVUSXhJK2EyK1dYcTdKWUluRHNPZVlU?=
 =?utf-8?B?ZUdwRjloUXVoVzlMUlVNcCtoNzYydjVmRys2NXBzSUd4RWV1UHVpUDBSV0VU?=
 =?utf-8?B?TFNWbnBzZXBHam9XREZON1cyR29lUU1pcXdZbWIvTkt1SEFLOTFVVDhwOHl2?=
 =?utf-8?B?eWtaNlhIVHlaRXBDOGdNQzFyOGVydnhabjZDZDVzLytVTjJYbVVVNFVBM3cv?=
 =?utf-8?B?VXFnZ0dvQndrNkVNOXZiWFRFT1JVS3VlWjBiN0hKaGJSSHEyUE44ZWVjNGV2?=
 =?utf-8?Q?QEtsW8GsqJQAGmW8HREOGwSQPMYJWQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(10070799003)(7416014)(376014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aGdtREo5Y1NRek14eDEyVlN3R204STB0SXRNUjlwRFBVSkFlS1lkUGhyVVFX?=
 =?utf-8?B?c1JldFc0dEUrTUJTV1pHWUxJOUw0aUJUQXdBa0h1TnJoN01QZXQ2dERLWWcx?=
 =?utf-8?B?dnJ1WVZkcEcrSTZtSmw2NXBjcGRPRzJhcnk2U1NQc0wyeXlwNzMzUDJSeU5I?=
 =?utf-8?B?L2RSUE16dmFXbUpKTjZlZjhMUzdDVERpcE1qZCt3dVN0R0ZiSU53eGF2RXor?=
 =?utf-8?B?UndvOWdiYWliZnNpQmxTcVV1TURrVURlMTdhOXBsQWs4RkMwTWkycnBXSDhS?=
 =?utf-8?B?N3l3U2phRU5xNUxhM0N5eDE2VnM3cmFuTWg3SFJ0SGhsVS9SbjU5QWQrcG12?=
 =?utf-8?B?eElSUDIwY3NKcnU4enBoMWdwZUJEZXh0bDJZaXZBQVBXSnFlQ1JORkduWGFO?=
 =?utf-8?B?dDNwRjBMeU9yYXdtdjZCR2JBaDNROFJNNWhtNy9iZnZwdmljLzd6R0lVNkFD?=
 =?utf-8?B?dDFVK1NtcDFpVi82VVQwa2JnaTBUSFhXNjRiSVI0MkR0L3V1K09uY2k2cThv?=
 =?utf-8?B?L3VCZW9FRXhJclJqVHhEbjNtajQ4Mi9DcDlJcE9Wcy9SOWRHc1dKclJFaGVS?=
 =?utf-8?B?OWhPb3dZTzVwUVE1VTVzREtsOFJsK250VUMyeWNndHk1eUtzK1FiVE1zUFE2?=
 =?utf-8?B?NzUwSW9QWXQveWNsNDMzcmtZVDc1Y3pYd2RQVisrQXNidktZZGpCUHFhMk85?=
 =?utf-8?B?eEtja0pyUjY4WU5IRDYyWk0yYTliQXZlVVl4ckNLcDc5ekVkenZGS3g1dE91?=
 =?utf-8?B?TzAzRkFraDJDYlIwWWJ2UitsMjl2Y1NMVUYxZVlZc2s2V3VScmdPazljTFdt?=
 =?utf-8?B?WkZ2bUU3Z01uNVlvWVRaM2dOdHA0a2NiTWRxbFdXUlQ3b0wwNHpVMTJtZ2tF?=
 =?utf-8?B?bDJha3BDZHpoejdhQkoydUNWd1BwMHAyaTYwUnFrK3JQUk5qajNGTFdrQk8w?=
 =?utf-8?B?QWFBWURQZFRVWjhTK3J0Y2UwVmpOMHlMK0s2Rk1CcnZ4T0FvKzRNR21lcmhX?=
 =?utf-8?B?a3FjZ1ZUM0kwWGZ2ZnZONHlnb3ZhZFYyQzN4bVd0SFRHS3Q5MTkwR002cVYw?=
 =?utf-8?B?QngrYTIyVkt3c3ZHaENCanczSVlDQTk2aTE4bnlWOXViQ3JhTTN6c25TWFAy?=
 =?utf-8?B?MHNZd3pEK1NWNkdqNTZ4YkhzbWFHa2JyeEQ0TUs3Y0ZvZW5IblJiUk1VVm1G?=
 =?utf-8?B?TFZEVUczc21uQlN0cUI1UlRTWkVLZ0hGMG9oTDZkOGczSENhYjJvb1RJVU5t?=
 =?utf-8?B?TmgwZ3VseW5NT3FORmFjZk43WVVDdWY0RTlPSVNHekFhZGhuZ3V2MmZFWDhT?=
 =?utf-8?B?Yk9NOCtCZ2dUcmN2dWdCSGVnMTdnMDh3dlArdGlkZlFTVU4rYlExWkhKM3RD?=
 =?utf-8?B?RElUVWJqWTgxTWFtb2hNOXZ5dUtLdTNDWnZOakcraTBEOWZhd2RFbU1rSHow?=
 =?utf-8?B?anRTbjBGQnlWZFlvNk4raDBsNnV4SHZYdFhKU2tDUXNQeXpHQUY0TVFMUVcr?=
 =?utf-8?B?MzhhMXdlUHdSTzJxSk5wb3R1T1BIVUYySUtNY2M5Ty9SSTlNTnQ0TVBVUzBZ?=
 =?utf-8?B?UVVBTmwzb2tHYllzclZKUUVvbC9YVVJVTlZQU3pYT2lKN1Z0R1IwZ3NUU2pU?=
 =?utf-8?B?dGxmWUFMcml3ZnovSjVGektsMDVvd1ZsQklzQnIvYzZ0c1hoSFUxM2FQcTEr?=
 =?utf-8?B?aDhSYjVldWhNVmFjS0VKVjNQTFRPcTBIS2pMM3FaeWs1Nmk5SHdaVVFkMHpz?=
 =?utf-8?B?WmNyUlV5RUZoNEZ3dnE3eVdBdWlKNFVQT0VVUzFHUmxNbmYxSWJQWCs2a2lV?=
 =?utf-8?B?S1FodkVtd3ZGb0JFRmNQKzh5WWt0N2VQNllZK0tUZVVCOFJPeStkNTNEbjMz?=
 =?utf-8?B?MWk5ZDlEZ0lXWUgydWJ3S0FkeFdoeVNUYjRhN0ltaU5MMEVmc1J1QVM1SzRa?=
 =?utf-8?B?cXRRRlFrZ01Tbldoc25qOWhuWmVIUTMvQyt1TXlPK0VYeG9EYjM5VFZpcmEr?=
 =?utf-8?B?ZXEyT0F6ZjZMTU5sbTFJMFA2RUdaQmg3bS9xZ3FzMjZ1KzBBbmVLRngvTVpS?=
 =?utf-8?B?aVloT01GMXZyV0hJZU5hT3VyYVl5ZWpqRlBhVE81MFVVd1NkdmsycXkxSUw4?=
 =?utf-8?B?Z1hPN25ZcmhJdSs0SVhFSjR3c295Y0dtV3g0d0thSHJjZ2hZalNIU2Voa09m?=
 =?utf-8?Q?v/z0+M/FC4yb3nJ1O3G9mfUdQsMUFhH5ZaLCARX2ud5e?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f00729dd-7176-4535-d5c3-08ddd958116e
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Aug 2025 04:24:03.0992 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u+2VH/a5Eww/SOzCmecIKuEb+Gc4JpS7RKyn/14i42Th5YhwwPpDezhixa89rVlpLp8gU2IKH8Rz6aLvnlcXZQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7677
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

Thanks to the feedback received on the last revision, I feel like we are
converging.

The ACP for `ffs`/`fls` equivalents having been accepted [1], I am
dropping any work related to them from this patchset which is now
exclusively focused on alignment features.

The first patch makes two additions:

- Bring an equivalent of the nightly upstream `Alignment` type [2] with
  an identical public interface,
- Add a new `Alignable` extension trait that provides a way to align
  values up or down according to an `Alignment`, and implement it on
  unsigned integer types.

The second patch makes use of these in the Nova driver.

[3] is recommended as a dependency, a small cleanup preventing an unwrap
upon applying this series.

[1] https://github.com/rust-lang/libs-team/issues/631
[2] https://doc.rust-lang.org/std/ptr/struct.Alignment.html
[3] https://lore.kernel.org/rust-for-linux/20250808-falcondma_256b-v1-1-15f911d89ffd@nvidia.com/

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
---
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
 rust/kernel/lib.rs                   |   1 +
 rust/kernel/ptr.rs                   | 218 +++++++++++++++++++++++++++++++++++
 5 files changed, 224 insertions(+), 6 deletions(-)
---
base-commit: 062b3e4a1f880f104a8d4b90b767788786aa7b78
change-id: 20250620-num-9420281c02c7
prerequisite-message-id: <20250808-falcondma_256b-v1-1-15f911d89ffd@nvidia.com>
prerequisite-patch-id: 2439f5f9b560ee4867716f0018b5326dcd72cda3

Best regards,
-- 
Alexandre Courbot <acourbot@nvidia.com>

