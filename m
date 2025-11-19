Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 723B9C6C6CE
	for <lists+nouveau@lfdr.de>; Wed, 19 Nov 2025 03:46:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A03E10E556;
	Wed, 19 Nov 2025 02:46:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UhkDRckp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011045.outbound.protection.outlook.com [40.107.208.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E99B510E556;
 Wed, 19 Nov 2025 02:46:08 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BUnenLgiSNCfA7p8tJt+nlBQC4LRhiEbpPHS+ul5O2hfa/3K4d1+zTnMhuwOAMdE3NO6Gy6GZJHd7MLbR1OS+yknTamqcFN/iyqGe4aQvxtZuYXlAtqjU/rA5iyR60fXxQ39tkJwBJ9upgQ4ia0ORRHFf+0TDJ/JHyOiCPGf4cSdjPy+vHgzvXuoQGmSZH4BIjN/dezfky0D/DOXt2d0hTYURkGZxvCXiFow5G7ZfrVDTYIM0FxccmkHy0EARXHy6LOQOAdwdrUl48WbZqCYBhi6iYPv6hFgLxHN9nFYCMzi7LQNDOgnF1BjftW+ezebUKUqLZsEw2BLjYUXed9DkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=CAFarE0D+aE6WQhUnwTKt7CmXjIvE3g7NuAD1NRDL+4=;
 b=yKin7yC6LWK/tlsbQFAmSPKYrKGKwHgtKrdlDq/fmJy9WY1KnyCtFbCrmDvslPL9xW1cawB7tI0IdgQ8mLJQIl1FWWJLV3gRjkWYZ2Fi9XS/UnTPAlVKspff1H422GtZZ5XV/nPOuAaaHmX+7ZdcIYzRXlk+p5YXVAk+li0CHL7OlR/dd+3rwk/u3yu31xAoJyO6j/ttkvVavJAbGoZdbxRkIdSp5cqXI8Y9nwigkL2qW8lmC5kVxwtdFkT5tWvSD06bJ8toGxpGxaOl/M9J73zVOVbePCU3fBK72O0JiroFPCmlQhwAmjnSviuKvoQw1NEwmrtC5zn7CdDoLQnfQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=CAFarE0D+aE6WQhUnwTKt7CmXjIvE3g7NuAD1NRDL+4=;
 b=UhkDRckpid0t8gGJbIiBx12lH9ylZ8/jbGtG/Or8jmsY/WQiLyFrWkEr143FdXBPfLD9xMxBNGp5VWQRO95qFjtZSzOKcG/lUcmzVSetGoLO2qge9EpJ2y5cpmLtacI2r6kpZ+cvsLZCxqidff5YdWRd83TEpsmmSLbUWxmm05TxE+Ro7do1qNW3hFV8ZEOzvwzV1H5v3opYSzQwzg3QvdJCMDlk6weVOoCMm/2jr7bKP4wfNp/X+2y++ixHSK8bZAPXe2SybP2Hq4UdBGPLDSOjTSpHacZ04upPMAOsZITiJx3ktL9L07hMI27LL5zRE5Gk6f1OOBE/ivs1ux+yZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by DM4PR12MB6327.namprd12.prod.outlook.com (2603:10b6:8:a2::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9343.10; Wed, 19 Nov 2025 02:46:02 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9343.009; Wed, 19 Nov 2025
 02:46:02 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Wed, 19 Nov 2025 11:45:59 +0900
Message-Id: <DECBSKQQ8SZ4.1B1D97HLUESDD@nvidia.com>
To: "John Hubbard" <jhubbard@nvidia.com>, "Timur Tabi" <ttabi@nvidia.com>,
 "dakr@kernel.org" <dakr@kernel.org>
Cc: "Alexandre Courbot" <acourbot@nvidia.com>, "lossin@kernel.org"
 <lossin@kernel.org>, "a.hindborg@kernel.org" <a.hindborg@kernel.org>,
 "boqun.feng@gmail.com" <boqun.feng@gmail.com>, "aliceryhl@google.com"
 <aliceryhl@google.com>, "Zhi Wang" <zhiw@nvidia.com>, "simona@ffwll.ch"
 <simona@ffwll.ch>, "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>,
 "ojeda@kernel.org" <ojeda@kernel.org>, "tmgross@umich.edu"
 <tmgross@umich.edu>, "nouveau@lists.freedesktop.org"
 <nouveau@lists.freedesktop.org>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>, "rust-for-linux@vger.kernel.org"
 <rust-for-linux@vger.kernel.org>, "bjorn3_gh@protonmail.com"
 <bjorn3_gh@protonmail.com>, "Edwin Peer" <epeer@nvidia.com>,
 "airlied@gmail.com" <airlied@gmail.com>, "Joel Fernandes"
 <joelagnelf@nvidia.com>, "bhelgaas@google.com" <bhelgaas@google.com>,
 "gary@garyguo.net" <gary@garyguo.net>, "Alistair Popple"
 <apopple@nvidia.com>, "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 3/6] gpu: nova-core: Blackwell: basic GPU identification
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251106035435.619949-1-jhubbard@nvidia.com>
 <20251106035435.619949-4-jhubbard@nvidia.com>
 <ec49facbd969b1ad00acbaec1c719d3b30e0151d.camel@nvidia.com>
 <7d928fa9-74b3-4790-9e94-10cc56801fb4@nvidia.com>
 <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
In-Reply-To: <4c87b7d6-5ce0-4f08-8f22-578a34ea2bd5@nvidia.com>
X-ClientProxiedBy: OS7PR01CA0232.jpnprd01.prod.outlook.com
 (2603:1096:604:25d::14) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|DM4PR12MB6327:EE_
X-MS-Office365-Filtering-Correlation-Id: df1b83c2-f2b9-461d-a90c-08de2715c737
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|10070799003|1800799024|376014|7416014|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?clRZa2NyVUtuUkVJeGFSamlySHRBbXJZTnVWMlNOQnorUnBvUFFXcXpHWFI2?=
 =?utf-8?B?NXFiZ0dOQkd4WStiaUF2S0c4TFUvZGhQU1hQQWVzenpIVzFTdlk5akpEaGV4?=
 =?utf-8?B?VktBYW9jZ2RzVVFwMnZGL1ZvY2pxbXFjblhQQ3NQUjlGN0x1ZEFMcXNVMDl2?=
 =?utf-8?B?d1BNUllmZ2tEODduanhTSFlyNU1mM2UxNFkrblZDLzY4NENsM1hxOG9vdzlE?=
 =?utf-8?B?ZWttS25kUFBQUXJKSUc3ZnhJSDJ1a05LU3A4NXQ5K0ViUFJPc2YxeEtySFN2?=
 =?utf-8?B?aU5qM2xVSldYbURRdUFCakhvVlRYVm5hZ3BEYlU4bSsrU0JONEYva1N5aVNi?=
 =?utf-8?B?MFRpS0FyZG1DNjBJRnYxUnh3ckl3UncvdE9WSklMV0JYei9USElPS1lISmd5?=
 =?utf-8?B?MFA4L3Y2NG9LcU9KODdOcm9LeGZwZ0hYL0pyamozeEpWYjU3TkFlVUVCYWox?=
 =?utf-8?B?UmVZYThSYzdyUGVCZWRZaFdtVlk4cFpiM0lKVUlWWnBkalJKekJjL3p3OGxt?=
 =?utf-8?B?QS9oM211REZqU0Nxb0pkZEtjV2Y1NzFZYmpRMS9Qak94ZGFjcXRQRkNGYmRv?=
 =?utf-8?B?K2kxdzMrMko0VnBLV0JMNDZwTUdxcG9kVlNubnJKZld4YmVFTUEwY1l0WmhE?=
 =?utf-8?B?aVBhaWxXSGZaNjlLVEtJT21jRHJRMi9RNlRPRERLcWtaQ3NtNTN5V3VzN3Ev?=
 =?utf-8?B?eTFOdUg2NUNiWFNjT21KdmhRVWdGa2hJR2s5UmV5VTUvcUs5N0Z5UFlpZFpB?=
 =?utf-8?B?SkZNN2F5V1A2S3A2TXpxNHlZSmF2cE5vTDNzY3hhM3ZMdmIxMVYwZ3RSRUlT?=
 =?utf-8?B?eGZjQnNMSTBYV0Z0ZVBSZ3NZUk5pTFlDaXVpK3FRSFlnb3Y3L1ZZS045Q3lZ?=
 =?utf-8?B?N1ROak1mbDNsY29QYTMwZXN0aVlDek5xendUZ3FDd3l1TmUyRnM4cVBxcFgz?=
 =?utf-8?B?UHRDV1h5OXBIY2VrZkFkNWNNaGw5eS9VbjZqM0N3M20vejlDcVcwK25KZ2hV?=
 =?utf-8?B?T1VwdVQ5ajFTd2JKQ3ExS2swNXhGbHdhbUVCM3JleTBrNThrQ0FhaGU5cHU1?=
 =?utf-8?B?SDBFQzBwU0RhYVBMRUdWaXJZcWVScVdkWUROWS94QTJWcDNZcnpvdmNHN0pk?=
 =?utf-8?B?VWt0TDlKbXg4c0lnTlo5NmJKaGNRMmpGVmp0WWtUOE42TkZTWkRhMVlPcFpa?=
 =?utf-8?B?TFJ5Q0ROdlN5TmY2QytSV25tOUo1R09IM3JRa2w0UXZzcE5hd3BDTjZqTVNy?=
 =?utf-8?B?SG5RSU9EZjZ2OHRpUWdqSTF5ZVdvR3pkeEFUaXVuVTFpK3pWOXVMVG1tN0Vn?=
 =?utf-8?B?K3k5UUZXVFd2VG41YXZUVkpjeGcrNVl0YzcrQ29mdVJma2ZpME9UdWZ3L1RG?=
 =?utf-8?B?c3FMdjZBdi9rOHFIL3p0bEUwRUxtSWN6SS9ZU25Nd0hUUW1zWG1QeDZTNEhC?=
 =?utf-8?B?dlV6SzBxcXdSZmdjK3pKVmxjcHRNbVNFZFVlL3p0eTBTbldkeVQzejVPYXha?=
 =?utf-8?B?bDNOMU85cjdkRmlNeUFYMTM1Z1dJUSthT2JnekhTZ1I3My9UZEE1NThjWW5o?=
 =?utf-8?B?b01FajBQdmI2S1F3bnloNG1BSzI2WWZnTWorclQ4MHE2a0pya0oyOGdBUTdz?=
 =?utf-8?B?bVJSdk1ISnJHVWJhRHdIdEEwTnJxTlhZdGR0eHF4QTVUVkgySTYrUkhnNlNG?=
 =?utf-8?B?N1pSTGxqMnFxWTYzQkx5WkFXTDRLR2Rmamc5dWt5V2o0eW10b2thaDhrQ2Zt?=
 =?utf-8?B?cWdpQlRLOGNqdkVmejNlcW9zVUVocUlqdnIwL294OWYyWkVhRDkxUUlXT0Qx?=
 =?utf-8?B?d0Nnb2JDUWxDSTh4bmp5QmlWNmFOdzhmRDZyUEhsaFdaekRwU3JwL3dhTXdC?=
 =?utf-8?B?Qk9NTXlodndjNHBuT3VKOTNmRk52ZlJsTVM1TzVLM05zNDFQb0p4VUJ0Nk1h?=
 =?utf-8?Q?TpPpLs1LUlli7yYsZ/Vj6SBOkzn1B1GY?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(10070799003)(1800799024)(376014)(7416014)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aXVLUmtDSUx0dTVPc3REQnJEVFp4Q1BPbnk0Y2FrQlBxa0NhZzNUeFlUMzhk?=
 =?utf-8?B?MlJJdlNoWkhseEtWVUNiNkJmMXZVbUVCYnhEZEZ3dWxjUjlRRmdQeVd1Yldx?=
 =?utf-8?B?NmFaMXJTYUNMM0lqWGdMcHVVWkloMHhwRWNFWFBDWDNoN0ZrRjVqSEdWTGli?=
 =?utf-8?B?dytVZlllNTlLcUZTSkJsRXRFZFRFblVZaEJjMUFzbit6VWQwc3UzUlkyZnFP?=
 =?utf-8?B?U20xZi95NCtvZFVRS0FkaS91RGVQbUZCcE9NQld5UUh2WXdEYkFrdGkxMGlH?=
 =?utf-8?B?aVloUFl4NVROSDBZV3Rja1I4UlNtd2wyYmNGUEk4VDNIajBhZHQveWNMaitH?=
 =?utf-8?B?WnF6bWI3MlpDRVJHUmRDQWVTWElMVElyT1hSazNuS1B2SEgvUTVXVUdZRVJF?=
 =?utf-8?B?U1krTG44WkxvclQ5MklneU9EeWFQdGZRVEZLazZlTWdUWUlTc1FLUDZNampr?=
 =?utf-8?B?dm5YQVZwaC93STkybXZzR2xYeTRETzVzRUJRWGd3Q0N4M1I1Wjk1ZHdMMEly?=
 =?utf-8?B?aURJNGp4QjROKy8rRS9mMzhnMUc0ZmxjMGlLdlpWVEFQVWErZDE5b29XZFJ1?=
 =?utf-8?B?MGJId1J2Nk9xd3RMa05pWDFsZUEzaUFTOHZCS2c5OFRId1dORHFMV0RUdTFz?=
 =?utf-8?B?ckxoQ0J6WnBPR3VKWGt1bXhKM3Z3dWZwRmptaU9manBnTk9rQ3p0M1pmd0Fv?=
 =?utf-8?B?VllNTTVMMTFqSERpVFZEZkJVcHQ2cjlyN3ZZZEV6QXc5Mnlrb21DSXdGSC9h?=
 =?utf-8?B?MGVFeitnUEZQNGlNRkFrRVVUSGdiYXRubk5iWE43cko0VWpzTklFK1JyeVlq?=
 =?utf-8?B?TDJUcGdZanRCcTVzVFk2aCtuNDA3MzMvU0pod2l0M2JrK0NRM2ZrSmEvVExs?=
 =?utf-8?B?YzU4NkJoMC9KOG1aRWd1WERYeGtaTlN4OVl5Y2IvZkZTRFBaOXV6a3NGNGVp?=
 =?utf-8?B?c040d0hzcDQ2dHBXMGFVTWFwQlVrQlphWm1JTVNMS3V5NHJ4UWFmWmZwSTNF?=
 =?utf-8?B?MGN5K3QvOGszUUV3NVRGWGpaZGpSODRHalYzZ3A1cWpFZEhYeG5HYXEyNHNR?=
 =?utf-8?B?SWVTdS9DQnY2dUJhRUFYekpMZmhhbFBpVzAxSkdlUFI5N0h2Q2dRM3ppeXN0?=
 =?utf-8?B?QjVGMkprd05UNWVLYnVKRzlyT2xoYkRMdGRkeUkzK2hiTG81K3BhQ0o0NHBr?=
 =?utf-8?B?REUrdlNuMS8rMDlSNkxnQXJxZG1SQmdEaEsxWDhTcjY3Qm5rMWhmd2xxRUg0?=
 =?utf-8?B?Mi9kZHB0YURPZDd4WjZjRWxDbXdVTUNrNHEvaG5ZbGhQM1NkeklsS1VZZzZj?=
 =?utf-8?B?M2EzSGwvdGdKNUpzL2hXZVBxTUZ6VG5Jd0ZwS0k0ZFE5bUtlL0RQZmxiZFB1?=
 =?utf-8?B?MmZGMWp1NFUxcG81angyUFIxeXFLUE5LMS9hcDEra3Y0NDVlcjc1OUk1R0V2?=
 =?utf-8?B?UjJWN2lzTk5nMitRYnRoZVBIMGw3Qy9kSlY0V0ZneVZqUCtWblQ1U0RJbEdD?=
 =?utf-8?B?dFFWaElMUlB2TVFiUXZ4ZDhDdmhWaFJWRXk5ZU9FMWdxV01Gbjc3U1pNaFI4?=
 =?utf-8?B?MlU2V1F6Wmw2TDVIT05obDAyRTJjS0tES1VTMjB2dnNKTzVCQ3F2OUphakpP?=
 =?utf-8?B?SDdCRERGdlAwMXBVdGNtQWk2V3BOVXRiRUMrV05BMlFlMkNWK21pRU4wUDc5?=
 =?utf-8?B?QXphcExoNytpWjhUbVdOQ3MxcjJ5OTh0Tm1VUWRMQzY0Y1ZpV3VEekdHMjRN?=
 =?utf-8?B?QURNU0U0YmxqaENJMkw5YTBMSU54cUxZT1lycXVRdVJmTlVxTUpxVWxwdnpF?=
 =?utf-8?B?eHV1STZkam9ldGRuVkpIeDNwalJNZGgzZklMdHluRzdWU0RZVCtQc2NORlZW?=
 =?utf-8?B?OWhqUnA1QkdzbGZWYTN4MmRxSHdlMGtLMUVyMmNSTTdDa2VSQ3U4cERhdnNW?=
 =?utf-8?B?NHpjVXNjK3VhR3ZzTStaVlZVbzQ0Nk9lRy93NlhQS2NjYjZrUVU4aVFMNlI5?=
 =?utf-8?B?cC9MTUszRVJoT3Z6U2Vram1VSm4rSytTelQzc2k4Szh6d1pIajh3MXpHblB2?=
 =?utf-8?B?ay9VcUQrTHZvVDBwVWhUVHhCUXNUK0tBSC9WdE5ONzBPRVlGUldNc1I3REtl?=
 =?utf-8?B?QUdJRlJlNDNDRHVWVTlpR2tRSUR5QlROYzJFTEl1cVZ0Vk83MHA2Wk5UbUFh?=
 =?utf-8?Q?qemHB1qZPCAehcOPKUBCAYsMxF7JhwTqTYFeO1hoV5Tv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: df1b83c2-f2b9-461d-a90c-08de2715c737
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Nov 2025 02:46:02.6754 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bB558RzEAmVbl0NmOIULHIa5nH88nAc/tGHOFfHJBZXW/MI7g2wxACp9nQtvmWZk5p07uwBuFverdZHEszHb2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6327
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

On Wed Nov 19, 2025 at 10:46 AM JST, John Hubbard wrote:
> On 11/6/25 2:24 PM, John Hubbard wrote:
>> On 11/6/25 6:44 AM, Timur Tabi wrote:
>>> On Wed, 2025-11-05 at 19:54 -0800, John Hubbard wrote:
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0 let hal =3D match chipset {
>>>> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GA102 | GA103 | GA104 | GA=
106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
>>>> =3D> {
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 GA102 | GA103 | GA104 | GA=
106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
>>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 | GB100 | GB102 | GB202 | =
GB203 | GB205 | GB206 | GB207 =3D> {
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<=
E>>
>>>>  =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>>>
>>> Maybe combine patches 2 and 3?  Also, maybe this should be a range chec=
k, instead of listing
>>> every since version?  It seems like everything past GA100 uses the GA10=
2 HAL.
>>>
>>=20
>> Sure, I can combine the patches.
>>=20
>> I'm not sure why I've been wary of using ranges for these arch's.
>> I'll try it out.
>
> Now I know. :)  Unlike C, Rust does *not* like it when we try to
> treat enums as integers. Casting or other (messier) approaches are
> required, and in no case is the end result a more readable on-screen
> experience. At least not so far.
>
> It is possible to mix in Architecture (Turing, Ampere, etc) checks,
> but I'm not sure that is worth the additional clutter.
>
> Maybe let's just do the long lists of chipsets for now...?

Yeah, I've hit this issue as well. The compiler might remove that
limitation in the future, or maybe we can craft a `chipset_range!()`
macro that hides the messy casting, but this exhaustive listing also has
the benefit of forcing us to consider every critical site whenever we
support a new chipset so I'm actually not too bothered by it.
