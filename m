Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB9D8BAB6EF
	for <lists+nouveau@lfdr.de>; Tue, 30 Sep 2025 06:56:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85ADD8825B;
	Tue, 30 Sep 2025 04:56:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PlXVANV0";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012060.outbound.protection.outlook.com
 [40.107.200.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 68BFE10E280
 for <nouveau@lists.freedesktop.org>; Tue, 30 Sep 2025 04:56:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=TIK5yQhjUgANWbr6xN+SyHZIcS+vx2bqroHQVd3ZaJK9vjgOA+J6WqSjXIuIC8Kd50bhZLuoihe88Do4J+/SCVtWWJAe43PXJElLaB3FBKDvnlmG9hfl6ex2WvQT0kvFinnKUBKcUQuVfVNnCdEosyLGcnJw2h3b8Fj5Du78agybXap5MdjBm0+Xv/+y20qEh2IcBy2s0Yg00qi7/y694wBsT7I1SidsVF+jx3XPgL/UZtyA2VgdOrPOMCWyygV/TusYMb4QCuLCK3Jn3Abmig+e/fzIkplhjK9OT0CG4h1dkcf6cG1QUDJm0stChcK7Q3sN0zQxgGRU1JzBTwe8dA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=plkGddtbCje1Ii9oj508AOiFm6BnNweHubGAVKDjzq0=;
 b=WuiDpWM8kO0uWm/zcGLaNuSRNq+42w7YElrS0zH+VKRjg/Y2lXecK6rM49cbywhwcCET9WPx68ys7aic9oJiER7RolA0zZsP+Xxc/oh/eZZeGc9JHMioKmKZwF5jwyEPGtoz8ZTbjU6QYXal7NLi7J4QFCos5IrraglLhXmVaQyrZ8PFtiWrsENk1yHhtwCzEbuoqGW8woqJw78AdmCnhCIvNY4Hb3V1w/E4aDTJnnbT6ODHmfMuugKtBrLFFrD6Oesc0CMEEkVQaXFXqwPvFXVa3JYi/wmDWhNVfv2DhiW44fGyohGIsZaikvo1l9kuSVoYfNCKEJ5c44X4o3QMYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=plkGddtbCje1Ii9oj508AOiFm6BnNweHubGAVKDjzq0=;
 b=PlXVANV0jmT2qX9Srn82VRnzxstIFI3jN8hlT6j6ZdrrBbUA2sOEw/wdTiC6UrvKt+wnN/FQ+rowQgRj05nZ+iJGS0Zhrcpo6tI+I+fNId+mYWkIFx1dRk2a1G/c6Re8uN2f3r8MiZDl+cLJ+lBJdo9lH6LKZz5vWX1MsjTmPfXrceUDwAlBDW4rHqGEX4hKNtmM0ObjOCF1ttto/VaZ0kK6RBm9hN99bNSdb67q4YoiH9yoat+/7Ub/55V28ediQD42dMTPGcDm9Anv5IFyXrJ9NvPX2D993Luf4POrfSx4+0ivbgFnFgMOiEZEYn0fdIHDGcxk9AN0z5rY4A8MyA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9160.17; Tue, 30 Sep
 2025 04:56:45 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::7de1:4fe5:8ead:5989%6]) with mapi id 15.20.9160.015; Tue, 30 Sep 2025
 04:56:45 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 30 Sep 2025 13:56:42 +0900
Message-Id: <DD5V9FB2PXM0.2EN4491KBD6VC@nvidia.com>
Cc: "Jesung Yang" <y.j3ms.n@gmail.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Alice Ryhl" <aliceryhl@google.com>,
 "Trevor Gross" <tmgross@umich.edu>, "Danilo Krummrich" <dakr@kernel.org>,
 <linux-kernel@vger.kernel.org>, <rust-for-linux@vger.kernel.org>,
 <nouveau@lists.freedesktop.org>
Subject: Re: [PATCH 0/4] rust: add `TryFrom` and `Into` derive macros
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>, "Alexandre Courbot"
 <acourbot@nvidia.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <cover.1754228164.git.y.j3ms.n@gmail.com>
 <DBWXJA6XF1VS.3PNHRWH030H0J@nvidia.com>
 <CANiq72na_d6JQdyZ1S22mus3oom_jz93rpY+ubr4yOuvMY_fSA@mail.gmail.com>
In-Reply-To: <CANiq72na_d6JQdyZ1S22mus3oom_jz93rpY+ubr4yOuvMY_fSA@mail.gmail.com>
X-ClientProxiedBy: TYWPR01CA0025.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::12) To CH2PR12MB3990.namprd12.prod.outlook.com
 (2603:10b6:610:28::18)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: a03b39cc-f594-4739-793c-08ddffddc14c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|7416014|10070799003|1800799024; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?SkJUaHNiSFR5NE9lVWliaDMzaC9aclk3cm5wZ3BoN0Y3NHNSZENsTWhvQmVt?=
 =?utf-8?B?TmlIRlRIdVBaTlQ3OCtDSEdMWllzTURSc3NKby9pbHpXcGhoTVNEMEVMV0R4?=
 =?utf-8?B?ZVhEaERiOHNrT3I1WGRWdWJEd1Q2bUtPRkQyWHA5Q2twbTVXNWNaVGRxakpQ?=
 =?utf-8?B?cE8vblJ4OXE1MXVjYzJGaHp6QjErVFd2dy9rbVFsdm1CNW4yVXhqTmdKeEh5?=
 =?utf-8?B?bmZXNGlSMUYyMU5GdFRBbWVVbnVJWkFsOEZnN3NzTDFMSDhxMFdYeFc4dWdy?=
 =?utf-8?B?d3JjV1M3VUJ4QU9UWHNLMzBqUW1WM3R6UDgrZWZ2Sk9CaTlrREdjTmltdUxu?=
 =?utf-8?B?RFIvdUVsN1Zra3lKbzNvMHdjRytsZGdFRGp5NWc3a2JadUV6K2xTVGtSMGdt?=
 =?utf-8?B?YXh3MUhtUFpRcFVZYkRhVE5xcHFhK0J5bkl0dnBsbXlycVZiZk1sYnBhV1Nk?=
 =?utf-8?B?d3R3dVVrYmJZU2N3NllaM2swSGZ0cjVROUMzYjVZZElxbW10MVRPU2h1M1Mw?=
 =?utf-8?B?SXZJdGlZNzN1eFo2OE4raW1tNGRVNHoyeDI4T0ZnZ0VIQ01DcTI5M2tDVW5G?=
 =?utf-8?B?ZENjZWNiQnNhVVVuaitqaDRqaHpXQThmcFpIQmplWnFReFp2LzVkM2VkMTdo?=
 =?utf-8?B?MGY3WTh0V3BBTUpVK3ZsZkhSZnFJbHZkU0JzS1k1SWxYQ0crbnZHT21iTDFh?=
 =?utf-8?B?ODFIanY3czNTckRFUlBaZzRWQU5rMGRPYlBtZktyb1pNdGR6MnczOGR4NGJO?=
 =?utf-8?B?TzEwVzZOV1lvNXI4VmdhVXBJRXZxdm4vZmlGZ0p4VGtteCt1VkVhcWRZMFNQ?=
 =?utf-8?B?N1llRStrS0U1NWh1KzFDMSt4STRVdmYxdHZ0aWxjZGgvZDNXM1dRNllrdG1l?=
 =?utf-8?B?RWFIeTU1NGlYbFlEeVBNUGk1Qm5OQXJMTWJLRDhjTEkzaVE0dWo1VEN6YlM2?=
 =?utf-8?B?WC96bEMvS0wvSUppendiNDBYNmFESnNDS05Pc0N3TzRaWUhLREFmQ3pDOUtl?=
 =?utf-8?B?NGNQS0lmZDRTVHdVZjh0SXJFZm9Qa0VUOVRVTjAxcW9zWjRadU05V0lyVXdh?=
 =?utf-8?B?NHlJeWJ2S2F2QnJia3REU0pXMTdaTHZSa0lhOXl3V2o3OXZvM0NlczB5S3dl?=
 =?utf-8?B?c05Sb29mb0cyVlRzMWhib0t1Z2N6RktmUXZVUU9namdaWGxDLzBLMnRFZkdN?=
 =?utf-8?B?ME9kSTF3bG5WT2VPOHhDRkNvZjA3UmRSZUhBZmh5UVkwdnhsdGxYSllWWjFw?=
 =?utf-8?B?TnRTMGMzZWdoQ04rRmlocVRXSGc4ZkZkU2RzMjVTRWUrZWFzQ3A1YlkrMnlo?=
 =?utf-8?B?MENYdWxGU2lJS0RSM2x0U2IzeEExVXZ6ZFFQTDRjVXNZMGkyRnhPS0V0TUxH?=
 =?utf-8?B?bEpaaEtMU24xU1pCQk5OYmJIUjNIZng5UFVWZDRERVhsQjBlUVdkZi9rVlZB?=
 =?utf-8?B?Zzl1U3ZNRUM0WjI1b25acEJLNER5Sk1ldERvUzFOQm9GZGV2RDh1ZEcwOXBJ?=
 =?utf-8?B?c1pGQkJORUlaVzNhRmk3MGRoRG40RVJNUFJXRjlYTWZTS3dDeHRXRWJ4V1dj?=
 =?utf-8?B?S2NKdU50enNyU3BnejZrV2xLMlVTb0VWaWM2K3FsY1BHZy81VkdwSDY5cDkz?=
 =?utf-8?B?VVN4ZDU3RXJoOEtWUFJiZGhqazlMV0trbW5mdHU3YlR4Q1hudUREbUNiMUt6?=
 =?utf-8?B?WTNpT0RPU3R3RzBWRGtHNXI2d0UvWFdVYkFKLzNKdkdlckYvQU9KazNJK2ll?=
 =?utf-8?B?MXd3b0duMkhaaDd1U3RLSDZLVjVWdEIySU5HK0Q3dGtwQXNvanlFVWRxSzZk?=
 =?utf-8?B?WjhsN3YrQ09QcTR2TVFUTFdBNDJlTGtWOXdOKzhiRStodXIvbUZsdXlRU1Rm?=
 =?utf-8?B?SndEdllGQmtwa3p0T3hxK0xtK1dZc1FhOE5VbG93d1VUcndCaStRY2NLeEFF?=
 =?utf-8?B?cEpTUlZHNG1qRDdxTVlaZ2hvRkswTytneFVreG5lbzJFd2dzcUx4U1hFVnds?=
 =?utf-8?B?Y0ZZa1BZeVNRPT0=?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(10070799003)(1800799024); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?NFNjM290SzVqS25DZ1VwT1c5YUVmbWRjaVUySlp0SXVycTh4UnRCNi9lWDhs?=
 =?utf-8?B?Sk5zWWFSR3ZCY08veWd1LzNja3h3NHRPV0ZSRVhCUzNPck9Xbnk4aHdFU3NF?=
 =?utf-8?B?MERyck1PakQxZGxOcGpuOFlmNit6U3hoWThkeEJYZkZDZEFjaklXU29EdklG?=
 =?utf-8?B?bjhKWUdaZEYyYXhhQ05iTlAxa3NneU83b2czbFIwOFZUcENkUUE0ZGN5VFZB?=
 =?utf-8?B?VmR3REdEdUJxYVo1SXhRVTVjNytrMG44NXlaVHNvWTZnN0p5RjBqU1RrajdH?=
 =?utf-8?B?K05hWUMvaUdZa2ZwZFNMQ2lnZlVvOFdvYnVJNGRRMVpXTW5CclhPUEcyNWhP?=
 =?utf-8?B?TkdMc3ZmYjVaQ3BmaGd3a0NUSm1HakgvQmRRMUI2YVhHYnk2QVN5dTFUYzli?=
 =?utf-8?B?Y3g5MEo1VU5abmtBcVBkcUE0VWZ0RXZiS1ZZQ0tybm9DY2Fka1oxb0pjdERX?=
 =?utf-8?B?N2lXUjhuUmRiajJ2WWh6U0djSWtDaDdOQWQ1UWd1RkxVM1hYSzg2d2tlVUZZ?=
 =?utf-8?B?SzBpUC9wa1JDT0VBSHNQOUNKaDQ4R0thWmtpYnBBNTJuWEZyeUZsSHc3K2w1?=
 =?utf-8?B?WUZZRUhWcnV5bzdiMFI5bTJTK2NhSENnR0I2cmM1bXY5RGFrU2p1UVFwWjZw?=
 =?utf-8?B?WkJoL2pIN0MyOGE2TGRvT2R6SVo1K01SL0VUSUlKRm9oSkFLd09yRDBNRzU3?=
 =?utf-8?B?S3NReUtFWmtSWDljempEY3I0bXlQQ0JqTnZRazlzeHlXaTVJYkoxNDJXbjly?=
 =?utf-8?B?TGJoRVpLNXNwb2NJUGw0NlB4aVFrNnhoY0lveEJGemVCWmowd1ZXbVJiVkF0?=
 =?utf-8?B?Wm1IeGpKK2oyYjU1WXAvL3hWemRTNjRsMitlYWRjMEtJaVFFS2JZb0llanli?=
 =?utf-8?B?SG5iM2tNWDBmakl3UnRhYjZ5WmxOYjRDWFFTaWNMM29oS1k5ZlZFTUNlTWxL?=
 =?utf-8?B?aEJJWU53VEVNQ2paUm5aa1FNU3BvN0xXS3l1K1czekR6RmhKanNRYkVTRXVh?=
 =?utf-8?B?Y1pCNjN1NzN2SGxpdGdUQm1ta3BXY1crNlJkclFTdExBOGlaZW85TktFWmFu?=
 =?utf-8?B?MjdMMlVzY3ZNSHZ0Y1JsNFkra2dPNGkyekd5eUpVQWxrQlY0TEQxY0t5OEl0?=
 =?utf-8?B?U3JrbFphNitCYVBpMFlIa3RGRDUzUVdYTkZLdDVMWFpPVUt3eVFkQkpBTCtI?=
 =?utf-8?B?bXhKRkp0SjBiU1ZjNVFPbDJnQ0lsRXdjNkVHSDFVRnlOTGJrbWNJN09pbE9F?=
 =?utf-8?B?L2UwQi8xOVhFeFFDS3VNMHRnTngwcExqMThjTzV1WFI3R1plSVJUVDg1cldH?=
 =?utf-8?B?eVZzbVJjZzRsYmdUckt5STJicU5pd1hBRVdyWE00blBXTWIzNmNRa002eG5q?=
 =?utf-8?B?dkpDMmFudVRVWE53RnlOQklzNGhOUXBueHlWRFFiRXZRNVU3ai9LclVXeDlM?=
 =?utf-8?B?anlVRDZ0NXRXOHI2eFE2bGwvQ2hreThpUXNHTGI1bENnamZLNzIzUzZpZDdm?=
 =?utf-8?B?cW9wbzdwbkZqTlNoNWVNa05vdlN3TG9oYmxnZEc0M25qZzU3ZmtTejB0bE85?=
 =?utf-8?B?ZERYNHNhY2p3RXR0MjMvZ2FVVUs3UDNxVDAwZkYwd3M0aFFzQjVsN3FZK0No?=
 =?utf-8?B?VjBvemFYUUFvbTFlMy9MTjB6U2xaTi9jUTFIOUJEYkJZZ0s2eTNjY1l6eW1T?=
 =?utf-8?B?cHV6TkRXYmx5QzI3L3RycTdnNnZtUFh0bisrMW9vNFRvR2VNYWNzdUlnT3lt?=
 =?utf-8?B?ZWZmdTNNbXQ0REh4QlJmcjNZSlcxdkxQRVIrNC9va3NEck5MajBacnRDWk5n?=
 =?utf-8?B?dmNybnE0cnYrQnkwLzFTYTZnU1h4TCtBaGsxNzFDRUFSQWVtR0VIb1l4K1I3?=
 =?utf-8?B?M2lxVEdiUUNyRWdwTldnajVHamhaekx0Y1RMM2s1NktaZURXNGtaam1iRmRl?=
 =?utf-8?B?ckNwRjlReWJJTkQ2QUI2WExQSTl0NTNsR085M3B1RHp2WHFjVDRMSXQ3bFVx?=
 =?utf-8?B?M2ZlSUE1bW1rS0FqYVJCMTM1YUZHUTl1a0JzU2pQMmdZS2UzK2NvcDlxaUtj?=
 =?utf-8?B?R2J2L3FqMkNweWdRN0lLWnBLZFgzRnA2SjR3U0lhYzUvam5idUZYZlR2emcy?=
 =?utf-8?B?NTFEUTJaL0VRS2lZVFMzNEloWUN5R0Q3VkNXUXlQK0F5Ump0bWtUR1UxOGpP?=
 =?utf-8?Q?ZINRfqr46wBV3gKUbB1oSL0pGx6qvN/03qnUYCGf3u2D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a03b39cc-f594-4739-793c-08ddffddc14c
X-MS-Exchange-CrossTenant-AuthSource: CH2PR12MB3990.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Sep 2025 04:56:45.3800 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3yJathYap5HdwzZ693DCFhHWuS7wiU4QqBy1oxhTWlKwmHJji4EfkjBUns2ByMBguUiC/Ygp339DTRKUwdWMag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
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

On Mon Sep 29, 2025 at 11:24 PM JST, Miguel Ojeda wrote:
> On Fri, Aug 8, 2025 at 11:13=E2=80=AFAM Alexandre Courbot <acourbot@nvidi=
a.com> wrote:
>>
>> I have tried this series on nova-core and it allowed me to remove 150
>> lines of boiletplate just like that. As far as nova-core is concerned,
>> this is a perfect fit.
>
> It would be nice to see the (possibly RFC) patch if you have it around!

Posted it here! Hope this can help push the series forward.

https://lore.kernel.org/rust-for-linux/20250930-nova-tryfrom-v1-1-0cc1bb507=
047@nvidia.com/T/#u

