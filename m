Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 359CAB1B4BB
	for <lists+nouveau@lfdr.de>; Tue,  5 Aug 2025 15:19:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C80310E273;
	Tue,  5 Aug 2025 13:19:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dlw5QLUR";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2059.outbound.protection.outlook.com [40.107.244.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79D6A10E273
 for <nouveau@lists.freedesktop.org>; Tue,  5 Aug 2025 13:19:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fKcrGqjq52Q4goyKhdAbd48vFwwIS4lNlc+WWMfHX3QigGVDZHZMf9axKBZfH4Ck/Ff/nRV0qASs2gUA5EQMBD8FfMZ+1+QhAwGtP9UsRAlseM42ZQvYVdXixvmn97/szZuWQJrQ4j+FxhtLclkUf1rkLw1q53j66igVhjHTy6DVWeR4sI3E3VcDM5EKqDwhdYgXaDtRntWGZNhHgntzvbWeqZO5SW2MIW+ffgh8knwyCLz92ns1HU90qikzc5+B1vanVcYRwKX6m+bQX2NL3v49r9Bs37hLSWY1yQwViX9Bgm6hS6xk9FnXUf6gd7JJy2b3FzBQPlxBrjU6duYLKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Yfm1n+qRLb/OcZkur3B6AFofPBSFgKLFa1DVhlAtpPA=;
 b=x/vBnn9VxFL/sfqJI7qlwVGpV1DKtxlBC/fX7PBwXqI5jKR22wjiuWedhDIRi4dgGsXI/yiAlGP3chS8DpMkSqpZcabfM6uaNfwgzpiRRuJ3i0XKVUX0cteMp14+tvzdPDAdY4h/z8ZAdhKBmyKbxTxq8v7a4CrAtjKlcuHlUq4/PtyPBA//of8Oz4v5a1xHVKFxMEms4tuNDpwKdKU9nPt2NU9r5AUjW8H2+j5Y0OCJ2whsZLiHbSmI8iNET7Gs37fb0oGg/LlWUUjt6Z5kmTgSaY9XTjJiJqrpWAjFFLHfydgxQXsRAVRfzEdA1cDq+16dvEAaBwMXel60Y2Gs9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Yfm1n+qRLb/OcZkur3B6AFofPBSFgKLFa1DVhlAtpPA=;
 b=dlw5QLURV/2B6B46AO+zOxv7ytL4b13Rsr3aJI5G0njmm0FB8/lZ4TOx3TaTh5vi6wdwJZwLKuQ/pw06vy3QVjcmEDC/YF9S7RiMeTO+zYLPB4KXlGPYpOpTBwLd3+sbbMp9IyZ85okOF5KQXbBtMPKCXZ7gcXX66TsZuccVDjRnhb41sCP7zfgjfHyuWsxKJFD2CUjilUkbTgpMilE5L8s09cImQJXMTMyfXvPzCNBFd2ey9TTikA/pHmbPAFog78yHFknPA4XCXyWajoYioleM9H0RQzv2n/o7/NcQClmrt0/fyF6KDQAg78asPIOw1R9Rco+902dheKqQgEOmYw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV8PR12MB9081.namprd12.prod.outlook.com (2603:10b6:408:188::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Tue, 5 Aug
 2025 13:18:59 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.020; Tue, 5 Aug 2025
 13:18:59 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 05 Aug 2025 22:18:56 +0900
Message-Id: <DBUIVGA74QX5.2KDKFG809YZ0A@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Daniel Almeida" <daniel.almeida@collabora.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>, "Alex Gaynor"
 <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>, "Gary Guo"
 <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH v2 2/4] rust: add `Alignment` type
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250804-num-v2-0-a96b9ca6eb02@nvidia.com>
 <20250804-num-v2-2-a96b9ca6eb02@nvidia.com>
 <4A13D612-F5A6-4D7C-A2FC-2FF54646D4E4@collabora.com>
In-Reply-To: <4A13D612-F5A6-4D7C-A2FC-2FF54646D4E4@collabora.com>
X-ClientProxiedBy: TYCP286CA0027.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::18) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV8PR12MB9081:EE_
X-MS-Office365-Filtering-Correlation-Id: 69e8db95-c656-4379-7787-08ddd422a392
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?eFdFc1FpWDVDbGN0aENxVlUrTjFVcmpJSXduWmFSaFVzMGFxcVRnd0I5cFZm?=
 =?utf-8?B?Q2NWbjQxZXhEbWpmbWs5bGpTV1JvNU5kSFZUQ0xFMk5ERHYyS1FzQzJkeURu?=
 =?utf-8?B?UXlQdG9iRDJjc29FbkVYeXprVWQvRWxQeFljZ29MbU1EcHNXM0JYV1hyay9l?=
 =?utf-8?B?dUhJL3YzUXJGOXd4emFPY05JQ3phc2U3eUNJaGhjWXlzRS9GdnM0UUpRVzZw?=
 =?utf-8?B?b0tGYzl1c2ZMcGQ2OUx3UVhKQlpFdDlHSHZlZkw3M21ONXBNQ3VUekZkZ256?=
 =?utf-8?B?RHg5cUtJeXFpM2Z2R2h1L3lCVm1YYnpGZ054RVpsUXZtTkJocnc2cEc3WUQ2?=
 =?utf-8?B?NlpaTWxMaU9QTFgwS3ZsY2RkUStXN0l5VHJwMWxtUmppSHo5Z0JFM09jemNl?=
 =?utf-8?B?T2MydjJTNStZTk5YbVQwOGdrTlgxS2N0Z3h3QkpSMHJmUThiRFNPNXM5bHEw?=
 =?utf-8?B?eDdsZzQ5UDdJSHIwb2VhQUo2SVJOZ0t5ZzhjaUQzTDJlQ0tkWnNRYVhsZFAy?=
 =?utf-8?B?c2lSMjdrdkVNYWxmQndnME5oNEJ1Rjd5WWRuRGx5eGg0czgwS3kzRUkxSGZJ?=
 =?utf-8?B?SlFaNTQrOFM5dnd2K21KeSs5WnVPdm5NaGxhVUo4ZFQ4TE9IVEpmazNPZ1Za?=
 =?utf-8?B?MDgrUnBIU2NialVSRWw4dXZkV3h5SURFYWFxaHFpekdKSzZBNVZ3ZG1MdzZu?=
 =?utf-8?B?V3Jwam80SFYwSGxiTnNUNHNydTR5eUowditQL2htZGgxNHdyVWxjS0NLY2NT?=
 =?utf-8?B?cHBpczA3K29xcms4dWN6ZlZUaUgrbGlJWk9pVGFISEVxN3drY3BEK3NXWnh3?=
 =?utf-8?B?NWtaN3Q3SGtNTWN3akQ5YnZXbVNWMDBMTlNFT01CNWw1Z1MrVG5Fdjg0R3lR?=
 =?utf-8?B?NkM2bG5TMUNpdktOb0dCck5lOURTVm9PRVNuaFcwVmV1amZlVGM4eFQyRllN?=
 =?utf-8?B?Q2xUNFJzUjB3Y2F5STZTTS9TckdmY2NqdGQ0aUh1SEJ5cFJJOTZMT2lGWVF4?=
 =?utf-8?B?dHRQQ2w0NlNNcFgxRlpUSEtQeWxxWVEvakFQRkZLSXdZejdKVEZlWG04Q0Q5?=
 =?utf-8?B?SlZDWWJVS0hETG11a205WHJRNG4wNExrNEhiVzBwUzlyZ3hQNHo0YklnSWtP?=
 =?utf-8?B?azFsWXFMbFd0Z3FMMGp6bmpNZ1hiN0paT1ZLNVZPWWQ3dVBUcmhxbG1FVUlw?=
 =?utf-8?B?dWM4TTl2RkI1SFJ6REQzUG9BWmk4UGt1U1h3UG51NDRPTHdLNlhuSkQyem40?=
 =?utf-8?B?ZlZEOXJBcmRjQjdMTVZ1QzM0cDlvaXR1RVVpY0JkbmRLUDV4U0pPOFAzVHR3?=
 =?utf-8?B?WGZIWnZONE9nOHp1K1JNWmlZSGpzUkd0V2ZFcUxwd1BlVlY5ZFN6UC9NV3JG?=
 =?utf-8?B?bjR3Qk9YdUJvd0RnVXdndlFJTkZ0bk5vWDhzcWYxV1g2L1oxQWNZc1o5aVEy?=
 =?utf-8?B?UTNpdm44MWhkZm9mcFZWRTNtOUV1ZEQ2YnduRDRFQmZNM2ozOWxwTU92UHdH?=
 =?utf-8?B?Nnc4SXQ5THJxVFBPbHQ4czlDUDZSdFBqWS9MS2FnVTNxN2FvUys5eHZvQmIv?=
 =?utf-8?B?RlRlT2xtWk5Pa2k2VG9ORCsvalJJZ1JNWEdhUHZRbGlZZW9GV0VIYnhGVVpn?=
 =?utf-8?B?MWxEc1RCdTJSYlhnVUErRmY2T1VvZXBPTXdCR1pZNGR1d09EOVo3SzhOZUdq?=
 =?utf-8?B?aTdVOHFGam1MWWgzYS9POWVCamsyNm1jd1N2UVI4a3prQzlacmxRbHlWbnBZ?=
 =?utf-8?B?bFVVb2VvQzBRVzZ5SEgyS0xzUlhWRXNscDQyTGR3VG9CWHIxVXEwd0grSXhv?=
 =?utf-8?B?T01uUDkwUTE4N0xzZ0p1TFhjL0tqWDNYc2lWVG1TelhKY2FTZGFhR0hnZnN1?=
 =?utf-8?B?WEFiSDJhSlk5cFRlZjFZcHQ0RG5hemtobW1ibFpMc2hjWXVBcXJLR0Y2U2N5?=
 =?utf-8?Q?8l4LcoQST0w=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UmhucmdpanBFMXkzMk1YOEJaY1Z6enRPcnB6RHpib2JWN3kyVVRrZ3pFUWFJ?=
 =?utf-8?B?WUtQYzZrV1BnRTZ3bGNoUFBKRmlvcktWeGVCZnVxVCtnQ2hhUVB6MFNBZ3Bu?=
 =?utf-8?B?MTF1Nnd3WG1ZN2pENWlMUGdHL0xSSnhHNG9zK1krZTZmZkFvdm1iTmRjYXVj?=
 =?utf-8?B?K0kyREV5UjBYb2lZNTcvVEVmVjFWZndGb2taTGdsUzRQZE1FWU1vaWZuNmNa?=
 =?utf-8?B?MGpMclNyK0QvaU5QaTA5VHp0VE11a284eDQyWnUxeVBaRTBJNVlHclloWjJL?=
 =?utf-8?B?UENnK29xVjdpbW1qb0l1SGd4SUl4YTRFdmJNUjVyWnpKZURJeFlOMGNEdkp0?=
 =?utf-8?B?YVpNRjlSOWlOQXZENVNLNHF0eUlSOGkwblBxMGVsK3diVysrL1c2cU1oa0ht?=
 =?utf-8?B?NFE0U3pER25BR0RwQ1JzTUJQcWlHNE9lb1dhOTdJZ0xiQytucE95aGZONUFZ?=
 =?utf-8?B?S2EwS08zeTdaNjBOblJVQ25hV0NscEpsbnNORXFXcnhWL2xnb01Ib3g1eDg1?=
 =?utf-8?B?VXo3VWdDVXdENFZrVWtFM2hNUEh0Q3ljRWFsa1ozdGlYYVZaYXBsUE8xNU9s?=
 =?utf-8?B?THBIVjBOMFVmd3UrcFdCVUd3dVJOOFJ0c2UweHBxRzNXdWhOazhzeENjYjhU?=
 =?utf-8?B?OUY3VG0vYkRRRXNwdlNGM0N3VUtiYUp5Qmh4cGVKcVp5eTBNemVrSVRhdDh2?=
 =?utf-8?B?SlZGcGIvZGpKWDcySWlLTXpjNXFsbitTeUxtVEpnNzdmWGluY2ZSbjhlNGFK?=
 =?utf-8?B?RWFSczhzRlNuNlRkZWZIWkIxVThHY3lUQVAreHJ3YTJiTHAwUE56MEZHMHQv?=
 =?utf-8?B?alU4eEViM0IxdVV2aWd2b2hqMGZWRTRPUjBNSEoxUlhXWGc3WXh0cFNDb1Z1?=
 =?utf-8?B?dUk2WCsxdHcwbGwvWVdXeXVtY201OUpNSktQNG1KMDVHUzY0dW9DSUxLbzB0?=
 =?utf-8?B?WGNRNENWcEh0dTQrZDB4cmJxaG9TdWliQ2dVWWVGZGRkdVROdFlISGNmUTg3?=
 =?utf-8?B?V2lqS0tBVDRXT3lDVEpHVnlhT0dIRnF3YXVLWURiN3Y5TGl3QU9aamhnN3Fh?=
 =?utf-8?B?VURYZE5yV0NUamNmME1LT012VVVTbHlqMTR1alZzckVLelA5SFpoWWRNQXlQ?=
 =?utf-8?B?SjJTWDg5bzhQSVdHZmNrMEVyWVc0Y1AzSEVSVEZldUE5WTZvdzBsUVlXL1hz?=
 =?utf-8?B?UzQ0SnBCaHp1SVA3UTI3UXlRRXp1dmhSdW1KdVFXUVcwL3pOMlRadHlwNVRs?=
 =?utf-8?B?Ny9SMGoraTdVaXowVGNHN1J3NEo2TFFCa1htYWtMb2tjQ0l1T05ReFNBaVFG?=
 =?utf-8?B?ZkFTYVpwYlhRMUx4SDJQVjJod0JCanFGZmpqM3Qyb2NzZzMzaWtCa0Y0ZGFR?=
 =?utf-8?B?bkVwdjA2QnZoN0c0MEo5ZkliVnk5MEo0bktnVEh6a1pEK0lIYklGeSs5ZjIw?=
 =?utf-8?B?L2ZaSW1xOW9MTU9HQzhZdEc2UVZ3WUtoVzRQTy81bFl6WlZQcmp6NG5hQm1m?=
 =?utf-8?B?cm0wbmsyeFVWaUxrRWU1ekRSVzFrZzFHTlJMNnRuZlcyK0FTTDhYb2ZqTEN5?=
 =?utf-8?B?WEsxbWV5T20rQ3BXMVdLRzNnOHU4VTZBTExWdlpvWENRYXFiMVNuaVk4T1hk?=
 =?utf-8?B?MTVrT1FsNHNVYm83WUFST3hjdmdHQ0JBTXdTaElhT0s5LzA2YXRlYm4rTWdJ?=
 =?utf-8?B?K1NiUkRhWkdWYlhWSFA3YVhjallXR1QzdXk4QkVZakhFTXJPeUgvdnJUT1hL?=
 =?utf-8?B?WWVPNnFKK04rMzdSVEkvRVU0WElYUjZuWDlKUTlhWGNNZXNUaWNTZGFVc24x?=
 =?utf-8?B?a2NjWk1kS1BxYWMwN05ZSUpEZCtBc1ZiWG5jQW9TekY4MEQ1ZmtDdlRsRm5p?=
 =?utf-8?B?YzhrbVFmQTN4dFpndFM5SDE5dUpYaHRZVFZXeWJLZE80Z1VxdGF6WUR1ZjI4?=
 =?utf-8?B?TVZ5aG5mdTRjTWNOamEvZ3dhZVVpY0FLSmZCWFdkVldJUzZDYjBKMU9SVTFR?=
 =?utf-8?B?SEQwSFJLQkw5d0VyQUUwK002NWFld0JrS1hCM2c4T0VwNTJXZEl6L0QwZUwy?=
 =?utf-8?B?WXFmMDNaVWhhS1Rmang4VG5qbURGUUQ5QnlzRU5JRGVXSVNSR2xVbzhobkxN?=
 =?utf-8?B?OUh6NS8xcmZmVG5xOW93VHpRQTBodzhSZHVIalY1aklveklQaTl3QVhoZVVz?=
 =?utf-8?Q?c94APKspUt4whoCk80gaAtqXxPOlm7A9EhslfLegq3JZ?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 69e8db95-c656-4379-7787-08ddd422a392
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Aug 2025 13:18:59.6309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y1TY1cvqCDiHioet9/gV7RaRNJ4ITWjn5VgR1skLhckWkcUTqh2pcR0xZbseHBgmB9IMnfPyf/6g9X3sbzrOdA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV8PR12MB9081
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

On Tue Aug 5, 2025 at 12:47 AM JST, Daniel Almeida wrote:
<snip>
>> +/// [`align_down!`] macros.
>> +///
>> +/// Heavily inspired by the [`Alignment`] nightly feature from the Rust=
 standard library, and
>> +/// hopefully to be eventually replaced by it.
>
> It=E2=80=99s a bit hard to parse this.
>
> Also, I wonder if we should standardize some syntax for TODOs so we can p=
arse
> them using a script? This way we can actually keep track and perhaps pipe=
 them
> to our GitHub page as =E2=80=9Cgood first issues=E2=80=9D or just regular=
 issues.
>
> I guess a simple "// TODO: =E2=80=9C here will do, for example.

FWIW, in Nova we tag each TODO items with a 4-letter identifier (i.e.
`TODO[ABCD]:` that is defined in our `todo.rst` file. This makes
grepping all the sites relevant to a given item easy.

>
>> +///
>> +/// [`Alignment`]: https://github.com/rust-lang/rust/issues/102070
>> +///
>> +/// # Invariants
>> +///
>> +/// An alignment is always a power of two.
>> +#[repr(transparent)]
>> +#[derive(Debug, Clone, Copy, PartialEq, Eq, PartialOrd, Ord, Hash)]
>> +pub struct Alignment(NonZero<usize>);
>> +
>> +impl Alignment {
>> +    /// Validates that `align` is a power of two at build-time, and ret=
urns an [`Alignment`] of the
>> +    /// same value.
>> +    ///
>> +    /// A build error is triggered if `align` cannot be asserted to be =
a power of two.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// let v =3D Alignment::new(16);
>> +    /// assert_eq!(v.as_usize(), 16);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn new(align: usize) -> Self {
>> +        build_assert!(align.is_power_of_two());
>> +
>> +        // INVARIANT: `align` is a power of two.
>> +        // SAFETY: `align` is a power of two, and thus non-zero.
>> +        Self(unsafe { NonZero::new_unchecked(align) })
>> +    }
>> +
>> +    /// Validates that `align` is a power of two at runtime, and return=
s an
>> +    /// [`Alignment`] of the same value.
>> +    ///
>> +    /// [`None`] is returned if `align` was not a power of two.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// assert_eq!(Alignment::new_checked(16), Some(Alignment::new(16))=
);
>> +    /// assert_eq!(Alignment::new_checked(15), None);
>> +    /// assert_eq!(Alignment::new_checked(1), Some(Alignment::new(1)));
>> +    /// assert_eq!(Alignment::new_checked(0), None);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn new_checked(align: usize) -> Option<Self> {
>> +        if align.is_power_of_two() {
>> +            // INVARIANT: `align` is a power of two.
>> +            // SAFETY: `align` is a power of two, and thus non-zero.
>> +            Some(Self(unsafe { NonZero::new_unchecked(align) }))
>> +        } else {
>> +            None
>> +        }
>> +    }
>> +
>> +    /// Returns the alignment of `T`.
>> +    #[inline(always)]
>> +    pub const fn of<T>() -> Self {
>> +        // INVARIANT: `align_of` always returns a power of 2.
>> +        Self(unsafe { NonZero::new_unchecked(align_of::<T>()) })
>> +    }
>
>> +
>> +    /// Returns the base-2 logarithm of the alignment.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// assert_eq!(Alignment::of::<u8>().log2(), 0);
>> +    /// assert_eq!(Alignment::new(16).log2(), 4);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn log2(self) -> u32 {
>> +        self.0.ilog2()
>> +    }
>> +
>> +    /// Returns this alignment as a [`NonZero`].
>> +    ///
>> +    /// It is guaranteed to be a power of two.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// assert_eq!(Alignment::new(16).as_nonzero().get(), 16);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn as_nonzero(self) -> NonZero<usize> {
>> +        if !self.0.is_power_of_two() {
>> +            // SAFETY: per the invariants, `self.0` is always a power o=
f two so this block will
>> +            // never be reached.
>> +            unsafe { core::hint::unreachable_unchecked() }
>> +        }
>> +        self.0
>> +    }
>> +
>> +    /// Returns this alignment as a `usize`.
>> +    ///
>> +    /// It is guaranteed to be a power of two.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// assert_eq!(Alignment::new(16).as_usize(), 16);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn as_usize(self) -> usize {
>> +        self.as_nonzero().get()
>> +    }
>> +
>> +    /// Returns the mask corresponding to `self.as_usize() - 1`.
>> +    ///
>> +    /// # Examples
>> +    ///
>> +    /// ```
>> +    /// use kernel::ptr::Alignment;
>> +    ///
>> +    /// assert_eq!(Alignment::new(0x10).mask(), 0xf);
>> +    /// ```
>> +    #[inline(always)]
>> +    pub const fn mask(self) -> usize {
>> +        // INVARIANT: `self.as_usize()` is guaranteed to be a power of =
two (i.e. non-zero), thus
>> +        // `1` can safely be substracted from it.
>> +        self.as_usize() - 1
>> +    }
>> +
>> +    /// Aligns `value` down to this alignment.
>> +    ///
>> +    /// If the alignment contained in `self` is too large for `T`, then=
 `0` is returned, which
>> +    /// is correct as it is also the result that would have been return=
ed if it did.
>
> I half get this, but still: If it did what?

I also stumbled while re-reading this sentence. :) Fixed.

