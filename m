Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC33C5DBA9
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 16:03:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DF3510EAA2;
	Fri, 14 Nov 2025 15:03:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="prDn/20a";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010010.outbound.protection.outlook.com
 [40.93.198.10])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A559710EAA2;
 Fri, 14 Nov 2025 15:03:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FW/U2e8bwGDfFjvyyoR7lj+6f6XpD5UpVxLWeWFSvoXfuGMLE+dnRJ92UXIgoHCzaHsKj+S3idsUwVhP3gJ20rTlmdzZBlPdLrkNFZATMpdZd71+rB6MfjvkPQ104EBEGUymWQXi7JYLqgijqEFOxFnGTTonBjkEgdLHb1UqesZ9FiXQYuNC7VBW0CcUPXUCsXA5apY/YqZqUTDOD8PDZXKLhWB6cyebhObEjKOSlxab0hpEvR+uGmXSUyQm93pxrr9I0zq5AudAaO/ecQ1cGtc03gDkg7L2kVzfKfu6kHX274DLAZ4mT0HWAQYkt4alQaqgqJuaotdB/A/rNHiXpg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4/q7mslUoHvMIaqoUasiDu4UouSZE+Y7ruUXyuntA3k=;
 b=Nk0iMAZMTxHPzAF2yy6FdNRyp1VochcQ1xaG7KFEOLbDRKgl5XmHKbB4c+Bpl3pKUObgAToRx8+y5d3oAzBEqAIpOhCezLJQokh1ZBVqo6WuGHHDacb+dNVAjB3MgOCgko7L+hBn2FN06mRune0VN1i87wL3yl0H2hEsjREKCXkCMijP10hony8hTGPwMCNSWFbucxanjbg8HIm+78rX6JM3c/LWrkTFLCdHBi8ovP5HwiYghP0miMGGb/riZucZ7R/hrb0oG/p9BsiY9x6Uts9xn/4loT+6Y2/w3RTPd+u+pqHm4Xl34QFjd29h8D59c7g/Hnim4+QqpJ/2Qr21mw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4/q7mslUoHvMIaqoUasiDu4UouSZE+Y7ruUXyuntA3k=;
 b=prDn/20aWllZUPyeEBBMTRWBSLJoXSbvPMZwzv+AWdGrQ6oICzVjK3LGtmCQWBxakjaddz2InzQHcKUpAwDPamoXPnScd4603tRzeGCc3SY+7t+1xycFAmMtGuZ2pi2CKgKjMl9Rt4QJWizi89O/Hhq4vvZsac47FRZ2AJtGjuCpzy7+njBHGZZvjB7YSK7O6Fuh09jl5Eix+fPYTkng7n9KCmfKgVxNcqLQe9QEVBGK35at85oc+fkWz01RRICiH9EYwC8k8WEpqmPLPjoG5hR4eXxt5P1tf4khJzrwwxk4Tyxv0CFOdST2Joiv7ngdtpCfYOmi/kOPA+qE/2JIqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by IA0PR12MB7700.namprd12.prod.outlook.com (2603:10b6:208:430::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.16; Fri, 14 Nov
 2025 15:03:32 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 15:03:26 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Sat, 15 Nov 2025 00:03:23 +0900
Message-Id: <DE8ICG1D8UN0.33C679TUWJDOR@nvidia.com>
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
 <linux-kernel@vger.kernel.org>, "Nouveau"
 <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH v8 4/6] gpu: nova-core: use ENOTSUPP for unsupported
 GPUs, in all cases
From: "Alexandre Courbot" <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20251114024109.465136-1-jhubbard@nvidia.com>
 <20251114024109.465136-5-jhubbard@nvidia.com>
In-Reply-To: <20251114024109.465136-5-jhubbard@nvidia.com>
X-ClientProxiedBy: TY4P286CA0081.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36d::13) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|IA0PR12MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: 94ae3865-84ff-4af3-f349-08de238ef672
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|7416014|376014|10070799003; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WjQweGdoUkZQQmlxUkQwa2hFRUFIU3BNV0ZTWnU5NEhNSnoyT25JSkdsZ1VK?=
 =?utf-8?B?RllKRkpqbWlWdVdaTGFYb1hjSThHdE5WNmpTVmtBS0JXdXZXMWUxZ2VSTEZY?=
 =?utf-8?B?eGVzcGtBbjdJLzltYm9SZ0s4aXpUVWNpVTZrOXJqc2l3anJ5dVk3aVk2Q2p2?=
 =?utf-8?B?YmM0REt3VFJZRGs1K1hsMk9Xc3hnYW0yOGhyQmxVNWdnMTFhSENFL1VKR3Ba?=
 =?utf-8?B?ZHhkaEJrRHdZMXdoSTRiTVpiTGRkSmVUNXZoemFLR1QyS29UdGNuYy9vMUlv?=
 =?utf-8?B?bXQzMDNIem1BSU5PMzk3Q09KcktUbVYvbGRQaXh5Zm4wNUpQWk1rd0YzeVNa?=
 =?utf-8?B?Z1lYdnVQR3liZjFjZ1J0bEFsU3N0bjFqNnVFRWxaNHZRemkzeDBZa2RBTEJu?=
 =?utf-8?B?VVV4N3NncVZmcWJXQWZkWFFRNFlpNTZ4cWdUQ3RwZ0I2YnJXZWlKTTdwdmRB?=
 =?utf-8?B?dEdkNXVCaTlESHliRnd2cGhrSFREN3F1S0krcTJhMldvTktHeVYyOVVUZnVV?=
 =?utf-8?B?eGM0R0g5UllDMVh4dXU5Um4yRXZSQVRCMGZDdXYzTTgvR0JleFRHMmloT05u?=
 =?utf-8?B?VTJYbXp3MFdyQXRoMXJvN2ppNkNFZElpNHMvT1RGVWI2U3k3WnF0bFBvOFF1?=
 =?utf-8?B?dEJGcm0xajVxQ25EZXpDSlpjZE1aUllnUEQzRDF5SnNhcnppbjR6SEU0Rm9Q?=
 =?utf-8?B?dWdQbnRWWDVad2p4VDhwaFlPaEVGZi9vamVkVWZseXRucUdITlJaalIrM3Fw?=
 =?utf-8?B?QW1PZ0VFZXdOelk1TENXVW9LVFpTRW1VaHRra3Urai9VVnAwZzNzbWZDWkJZ?=
 =?utf-8?B?NHJXTStaaVZoTlNXVEIvSDMwZklyTm5ERVNOcUJtVXZzbUkyVzd0VXJrZnVU?=
 =?utf-8?B?L3pZSFBPbi9oQXNGQ3h4RExRcDJ0bVpmZU9XRDRLRWo2RmZvYjVqS2lLOTMz?=
 =?utf-8?B?S1BtaDBMcDNSOVZmM1Y2ME5HdndVOWV5cEZSa2Q4YzNQL3MraTJFZzRWYjFw?=
 =?utf-8?B?MTk1aVhjQ3BzMzkvUDhIbmdUL0pKbTZka0g3cGtmbkZaUkNOaHpjdnNDSUlu?=
 =?utf-8?B?UDRURlgrRWkwOUxSL3hKMnpQekg5eFh1cnFYdGVxZ01KNVNHRWFXa2Nta0Jk?=
 =?utf-8?B?YVdZa3N4NjZhd1VTd0o1NnNSSU1BZXhyMXUwMlhrSjBFM0NOWDcwMWZ4QVJt?=
 =?utf-8?B?MGhrTkthWFRCOFFFclBnRFc3c0xsRUdDTGRpWWlNUElOMlJEYlh0akozZlYx?=
 =?utf-8?B?M21IaUJGQ0hhMXdQYkhjNlo0WTJ2L3crV1Q2T3hEYVZEK2RaQXR1RkVEZ0hB?=
 =?utf-8?B?cXE5ZGVnWkhLZzVjS1JIQkxwMjBYVmxFQnBFaHpqc2VXQ2VGT0xoR1l6VkhK?=
 =?utf-8?B?VXk3MklUcEVuTGVOYzRBQ2V4ZWJsQmYrd2QxVUNhTWtlekI5cVBva0pQcWVU?=
 =?utf-8?B?T2I3VDhrMEhiUnBZb052ZFVrY0o2S0owK0s3Q0h5QUp1REJpNkVDOStOL0pS?=
 =?utf-8?B?bDFXYTJralk2UU5YYmJFeG1nZSs2eElGbnNYYWxETUx3SzIvSWx2RysrdW51?=
 =?utf-8?B?Q1c3elI5SUV4L1ZZMmNmN0lTblJYemF3LzMzWHpFV0FnL2FqNDZ1a3oxUFMr?=
 =?utf-8?B?alNyelBNMmRhWmx0OC9VSS9LRktNdy9uWCtRVXJlMTN4T09OdytidmZKQXBM?=
 =?utf-8?B?RkR0eFBabk9NdmZpNVpTRHpHai9LclRmRUYzelFqcnZSWTRpeUlOU1Z0R05E?=
 =?utf-8?B?NHFscWJENVM0anJPRkV5bk80bmpVaUk5R1I0OGZPVzQwU1Y3N2UrbXRGdXow?=
 =?utf-8?B?UTl2SG1IWXk1ZjlJT0JjTkdsQ3E0NEUwUWZmdUdVYno0U01GNEhWczd5d3BE?=
 =?utf-8?B?R1EyUEF1UUV4ZzNoNllZN3BEVGpDWlg0NW54aVJ0V3l4UENNS1hKeHNPbklr?=
 =?utf-8?Q?eelZiXvHkUxogoX3jXTIcfBJM+9J0vUC?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014)(10070799003); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?d3htSUVOTEpHYllWTHlob1VRdS9sUnd3c0g3d0h4NVFNYXdHSE5PbWVOaGQx?=
 =?utf-8?B?NjdCSGhvN2t1TTJxdDE3aW4xQlNrb1JpNjh3eUxDYlJoazkrUmw5T1MxeVd4?=
 =?utf-8?B?MzFKZnZWSVFzc0gvVWMwVWpqTGhaT3hPdzNPZlJSeTlhOU13VDBlaXlneGRs?=
 =?utf-8?B?b0ppLzliWUoybGF3b1dYRm11bXVSZ1ZVQ2diTGVTc0lMK0JMNktmZHczY0JJ?=
 =?utf-8?B?V3lOd2VmWEkweW4rOFJiYlJMcjVHanhZSDhESFdSZWpaME9sakJVTDNySDRV?=
 =?utf-8?B?YUNKMng2bE5nTW1XcTZLU3NkM3FxQnhwVmxzL3RTMzExRG0rSEtDTG9RL1Rt?=
 =?utf-8?B?NmkyOFdpUXVabjFsNXFGZVNUNGdyVmhNaDV5eGVsMXpDQU1IV0JVc09PUjcw?=
 =?utf-8?B?ZE45eE01MW42dDdySHY4b09uaXM5ZFNqQ0grdm1MLzFKUDVGODdYa1d3OUI2?=
 =?utf-8?B?NldMaVFsUnRjbDFGMjFzbmNxM2VJVXN0YU5uSENCR3hXUzJqa082Y2JtVHVZ?=
 =?utf-8?B?S09QQ0RnRUMyMThzR0RSK25vOWx3d2ljZjB5MnQwYUZjbEk0WmlwTUdIQkty?=
 =?utf-8?B?U1ZBR1JYNnVmb0h1eDZxZjVpQWpzV2pwNXhyQ29oZk9pOFJqOXhOREhtbnBx?=
 =?utf-8?B?VDNWMzhhaVExNmpsQk1Ja0tTV2k1ZlBka2JRZkpackJIdEpCTXNya1VpNUJX?=
 =?utf-8?B?Yk1NMlFmNEhGNjMvclBHUkVTSlRDWG1LQ2FwNTRESUZzeDlhVGhZL1dHRTJ0?=
 =?utf-8?B?Wko4WnVrVDFBNWpRNG94WldscC9BbDhTbkF4dkhsZzdqcld1dkY5azBMN2pO?=
 =?utf-8?B?MDgwSUpObXVpRkdKMThaejBpdEJzOVVsUk40a0gzc2ZoSktNUGczMGt0TWsw?=
 =?utf-8?B?amwyUTZYNDh3R2g0V3ZZNzZuellTVlE1eWJNZi9VOXpHejRwWmlrbGpLZkY5?=
 =?utf-8?B?anJOSUhFOGIrVnlNQU5FTCtuTU1oeEkxZVJVVTdCcUZiNDA0ajkyZkErZ1JE?=
 =?utf-8?B?VWtYTDIxenl3Wm40Rko2UWU1djV6NmNhVGdSc1hVd04weTJsZDVCWkRyS3NH?=
 =?utf-8?B?S1BKeEttWlVRNGpSUGtqL1E2VzVVUkhsNmpVT2czOThDYWRGMVBZQ2dnWFV6?=
 =?utf-8?B?U1BmRzlCNnJQTndLaS9IYmQ1NFNrR3lmM1BsRzVoTC9PRWl6emZtdTRINHB0?=
 =?utf-8?B?MEljUWF2bjdIaW5HcWhsOGd5b1NESTZOK3l6NmFyTStYNklIdWxUNm9jOW5x?=
 =?utf-8?B?MzhPdGNzbDBOUzFaUmdtVEFnK0ZSVmlyaXpWTnhQcmdkVDBoYnRqM1Z2RHFR?=
 =?utf-8?B?NkNzWGlFUDYvSzJ4NG82dGZyTjRPNlBlR3dRWFRmZHkxN1JXYXlFcVhNYVFB?=
 =?utf-8?B?b1M3K0tpcDBqUlhtRzUxYVZVQ2IxeWZEUnBBYUFicE04VXBVR21DSTlDZU1B?=
 =?utf-8?B?TUoxREtEL0pONzhkMEJxSE82WDlsZjUyU05GbStiamRMcS9UcXVRV0dqdUJF?=
 =?utf-8?B?d2Voa0V1MmtxRmpOY1AwT1ZYbzYwTVVuREY1dkZNODJFZkl5N3ZjRXRORnhG?=
 =?utf-8?B?NzI2Nldud2pVbkUwOFpmT2xvRk4yeERVYUJhaHRtR1NCemI1aElJZXJQR1VR?=
 =?utf-8?B?MFd2SkEvLysvRE81UGxsOVBRVFQvZVl6WW9ubHlHWHVHRUdoMEZQdVRWWGlj?=
 =?utf-8?B?SGFudlluamNKek5nWDVCUzVzYkduczNpZDA2dWNwTHdOS2xKVVdaUVR6dHJQ?=
 =?utf-8?B?bmZZbmFvR1lycldvM1pIelBtakdSbm1mZWduSTFyakFtQXB4SU5qQWF4RFYw?=
 =?utf-8?B?VFFnYnh1SndIYUt4WFNiQTNtbzBuNXRLRHBFRzgva1FQSDU3L0wwbHRwZWRl?=
 =?utf-8?B?Y3JDbXUwb1J3cVZ6ZmRrVkNmV2Q3Mmx4Z2FyUDBzTEo5QmNPYkp6OFFMMTBx?=
 =?utf-8?B?cWdoQ1lyZWI2Slg2SGRPclBmUHNiOHRneUpCSkdaNld6dk9rUzhLKzhZK0xU?=
 =?utf-8?B?dGd3Sk1rREJUYmpndEpjVEI0RkVqaXJaMDdaUkNualROeTR0THQrZGtCSnZQ?=
 =?utf-8?B?UFMrSTN5SEpoK2hyNGJzb3NvYlRkVURjMkNvQ29FNWg4M1dJY3VTemovREFv?=
 =?utf-8?B?Nks1NmEvaE1uTHJOQTRlQWNYMkhwL3NGVVZGVmtvMUo3c0NFZDRsSGpGTmNz?=
 =?utf-8?Q?tyXeAOhwgjnywVFDn9laDBo+3D1ZGTKsa/vkZBJWrukT?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94ae3865-84ff-4af3-f349-08de238ef672
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 15:03:26.2159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r39Fwf9lLHL28mgnLURizyiCGwHIBXAJdZ+Ku7MVToRL/kMuaUE61UEBJeko4ES2ZtauptdtRM31EZQJf+kAPQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB7700
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

On Fri Nov 14, 2025 at 11:41 AM JST, John Hubbard wrote:
> Some places in the driver use ENODEV for unsupported GPUs, while others
> use ENOTSUPP. ENOTSUPP is more accurate, so change the ENODEV instances
> to ENOTSUPP.

Mmm actually I suspect we do want to return `ENODEV` in those cases, for
the driver core to interpret the error as "I reject this particular
device":

https://elixir.bootlin.com/linux/v6.13/source/drivers/base/dd.c#L588

