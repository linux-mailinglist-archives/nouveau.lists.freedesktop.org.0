Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A1DBB19CB3
	for <lists+nouveau@lfdr.de>; Mon,  4 Aug 2025 09:32:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBCFD10E405;
	Mon,  4 Aug 2025 07:32:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hL7Ejwm+";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2056.outbound.protection.outlook.com [40.107.94.56])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 481B510E405;
 Mon,  4 Aug 2025 07:32:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MxWAE/1xWGz+r9zgM9oB3Cgucyo22i9tIZpiQ3J5l9121EyhSiM9e8UhURNyMDXOfLRldQJD17CQHO2cPjRbysLEngCkFyPriPLY6gL6YxZstLf/BZkwssujCCndbRB3f2kUwUCQrJluAHZMvpFhcLKjmvG5BiLZbWt3z1mdoXU65p+xefzpAEwa98GEYSrkm7OruBnQ+L9zD0EdVg11RiI0t77EIhey1G5X2i+rv/Hkf3AcUD1Kw+DH9jcG/FZ18fCVbsRn1zTZxuFXYYoTJhcVk9x0DGrQQ41PE9r9euxmuE5TsqgI5UKxv+1mf6sDIe8NEmvhI0l0KThloxwHLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=C0eVhdcEpYyNZdtsXifLjr5StB++nxCXKdIwuCaVu/Q=;
 b=oQXX2XOp0lo1QJVt3GmJcfkqHG1Rmqkp/eIu/Ltk4a+Ip9vNquMa67Y1rRcaUByIkAE3nat3BmQNSUzVHeZRmL1abQBkOA5e9tirFvZV8lcU+Co9+TFCCSObA8ePOuHJJQq+WCBjKGccX11ke/fc7OVK8B4DtBIpNOgoT8e2HVrkDjV5sOaDDwf4wFKYNdVTpZcncymv32IgfRf70f4O79JWGR6oouei8fClDAwKLvcI8+s+C02d4JCRt6wz/O/tYTqL4Wmem0k8aZk/Xqpw2JKCCj2+3HujuWIoU3nd8wBMASRWEx1Z8+yUl47N5uXq/5TiUwCvSunZBoXKdapspQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=C0eVhdcEpYyNZdtsXifLjr5StB++nxCXKdIwuCaVu/Q=;
 b=hL7Ejwm+7oaxz38ifxP7X3rp9We6N0ZZ+jBYZY3s7rUoRloYVJiuxGPBgwUMgH46kK0upy/DUtRcruAInxvPHciqn0dbzNjzIQHIX1Kk28fTf5JymjqOTLnucip+Kpk2HC6KgMm7BGxKIGypWQ9kbMCzrsqqvzV0fXHUJ2yMbiiH8azn9YkGQWwwtvIy8kVDqgN5qelnDwY0s7rD9PtsH8hekhlYLCAJDNYI2M5t1SBjNIXjtZz4oVTzJ0Rk2Ga15zB/a7dEsWiLClPw/zIZGn52Eu8PXGua3ZAuabVc88Kp4LwfpfP7mYjgMmnwv4p93vOQ/NVIuKpT2MfP2xXnIQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH2PR12MB3990.namprd12.prod.outlook.com (2603:10b6:610:28::18)
 by SA1PR12MB9491.namprd12.prod.outlook.com (2603:10b6:806:458::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.17; Mon, 4 Aug
 2025 07:32:16 +0000
Received: from CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99]) by CH2PR12MB3990.namprd12.prod.outlook.com
 ([fe80::6e37:569f:82ee:3f99%3]) with mapi id 15.20.8989.018; Mon, 4 Aug 2025
 07:32:16 +0000
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 04 Aug 2025 16:32:10 +0900
Message-Id: <DBTGVEJQOUDM.OTGZ6PXLB9JV@nvidia.com>
From: "Alexandre Courbot" <acourbot@nvidia.com>
To: "Miguel Ojeda" <miguel.ojeda.sandonis@gmail.com>
Cc: "Alice Ryhl" <aliceryhl@google.com>, "Miguel Ojeda" <ojeda@kernel.org>,
 "Alex Gaynor" <alex.gaynor@gmail.com>, "Boqun Feng" <boqun.feng@gmail.com>,
 "Gary Guo" <gary@garyguo.net>, =?utf-8?q?Bj=C3=B6rn_Roy_Baron?=
 <bjorn3_gh@protonmail.com>, "Benno Lossin" <lossin@kernel.org>, "Andreas
 Hindborg" <a.hindborg@kernel.org>, "Trevor Gross" <tmgross@umich.edu>,
 "Danilo Krummrich" <dakr@kernel.org>, <linux-kernel@vger.kernel.org>,
 <rust-for-linux@vger.kernel.org>, <nouveau@lists.freedesktop.org>,
 "Nouveau" <nouveau-bounces@lists.freedesktop.org>
Subject: Re: [PATCH 1/3] rust: add `num` module with `PowerOfTwo` type
X-Mailer: aerc 0.20.1-0-g2ecb8770224a-dirty
References: <20250620-num-v1-0-7ec3d3fb06c9@nvidia.com>
 <20250620-num-v1-1-7ec3d3fb06c9@nvidia.com>
 <CANiq72=BSnom-nQgzLvv-cqwSknK1uJ=CXGP51r0WRj1Y553Ew@mail.gmail.com>
 <DAREXAUV51B6.7X7TPOJKK249@nvidia.com>
 <CAH5fLghRJ7QqGKJdUq5Nic542cJsHKX_C+EL+xma_rFJrHd2QQ@mail.gmail.com>
 <DBRZX7EAK13R.LTIJJPA9CCSO@nvidia.com>
 <CANiq72mjT5jJiRG2J4KAL7pupv5WoCb-T+hXJ=H5NG_4n0HLOQ@mail.gmail.com>
 <DBSTIFXLOTMQ.3TTS2O1PDIR95@nvidia.com>
 <CANiq72=AtpG=B+VcyWoX+qL_tk-uUtgiLXYJD0epOfnwYfPD7Q@mail.gmail.com>
In-Reply-To: <CANiq72=AtpG=B+VcyWoX+qL_tk-uUtgiLXYJD0epOfnwYfPD7Q@mail.gmail.com>
X-ClientProxiedBy: TY4P286CA0049.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:405:36e::6) To MN2PR12MB3997.namprd12.prod.outlook.com
 (2603:10b6:208:161::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PR12MB3990:EE_|SA1PR12MB9491:EE_
X-MS-Office365-Filtering-Correlation-Id: 82a3fa5a-c7c5-4808-89f7-08ddd3290846
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|7416014|10070799003|366016; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?Z3VGWHpkeU55RnpmN2xMWkNzMkpseWV6emN2RS9XM0FrUnl4TTZlZG9SSGJ0?=
 =?utf-8?B?Z2c1S3JLS1Q3bVBhNGl4SlhmV0ZoRysydWdaMVQ4cS9MNzRrNjNJWEpJMFpK?=
 =?utf-8?B?enI5dHJlaVdPKzdzNndjTnRibU5sbVlwVnFHVWcwQWZCVXFTWmVLSmdLdTV6?=
 =?utf-8?B?dHV1MTc0MitoOERJQitST0Z6Y1pqUWczZXJjWkZTc1FSTkppL2VxeThZOWl0?=
 =?utf-8?B?UDJ4UnNEeEJyNXRSZkVqckoxOWxuOFdoVFpqWnc1RmRFT0R2bHdSejZrWlV0?=
 =?utf-8?B?Zk16NDVpVHZjUU41eVRrMzFyMWZyK3ViSGlnUUk3dWt5akxLaHpESEd3SGJF?=
 =?utf-8?B?Yk1CZDU0aDAxM0U5aVljYnBOY2l6Tm02QkxLRVE4aDNhNHNBUTlZNlJ3SWUv?=
 =?utf-8?B?ZUpFaktRVEZXRlYxSWxIaWJmNFVxTThxRDJpYkVndHVubm9NaTBsSkJaZGlL?=
 =?utf-8?B?S3FHZVZGNmRxL1BKTUx2THZoeEo0UGRFb3Roc1dxZmxCSHYxNlFXTVd0UG1w?=
 =?utf-8?B?Z2M1SUFhaDEvYWhBbU9iTDNMYUNLZzlmanFqRTRndmhaWVIzSlNqUWp2UVVm?=
 =?utf-8?B?ZUtWU3IzUkNXRlFKUjBuNDh2WVcrcFcwV3Z0VVh2UGxZdDNoL243UnNIbDdj?=
 =?utf-8?B?bEZJZEEybCtvUUp3SnJmSDYxZ1YvdmpzNXFNc01vWnZXamJHWjVBY1lmK2JJ?=
 =?utf-8?B?bTgxeGlYRVFDa2Z1QVJGRUV2ZzF1bTBFSEVPakhuckFnVmVtTzVUbjJ6eDdR?=
 =?utf-8?B?bWRzMitsaUkyMERTZTFvVEZBOFJtbGNSWXhydlJGaGNJLzQrc1BsekhhUWJn?=
 =?utf-8?B?Q25KbnZnQmJHU2ZXc0U0NDVmY0NvVU9wUVhRYUZ1R0hoRFFocFNRRzNsZE1G?=
 =?utf-8?B?N0F0RmsxZy9TeFI0USswQ3J1WkI5Y0NEMVA0RkhUNmVnM1NSYTZicXhHTkpy?=
 =?utf-8?B?L3NVaVlVWDB5SEpCOGNlenF4Tk5PazNqaEJRM2pZd0l6Ykswd3libFhoSnBK?=
 =?utf-8?B?SEQ2TU9tUDBvTjNmUlNqeG9rN09nZHEyczlHUkdob1FrNG14TzV2b3hia25n?=
 =?utf-8?B?ZDA5ZklHNi9IaGxwSjFtc2Zmemd1RzZraHpVYlkzRGtyVG8xa0VXUHloL3FZ?=
 =?utf-8?B?THZmMWExSjVZbUlndjIvRnl6Z2NOUzVZMGhRK1J1Z3BjSnFRdmlMSEp2TXRn?=
 =?utf-8?B?U2JDWDVnb1pteWtaTlBJQU1malZtSCtPRmxmRjlRZ1lBYTJBeWNjYWVvanJL?=
 =?utf-8?B?cjBMVkRKVjluWXAxd0tLSnlVaWYvMzZNeEtaSW1UUXIvaHRBYjgyY2U0VUFM?=
 =?utf-8?B?dVppL1pjWGgrVzl5YlBvMnRFYlVrNTluSWZPWEp2cnRYRlhPQkdySXVCUStu?=
 =?utf-8?B?ZmgvSE5VY3JzOHJFcDhza3pCTnFQNmN4WVA5MnZqbncvNkt2djZzb1hFN0I1?=
 =?utf-8?B?ZHdoZnVyZ0VESXA4SWJjRHF0clQ4VTVkTXBhOEpzNG5SVExGb2JEVVNIalIv?=
 =?utf-8?B?ZDJITlMrZXBla0wxOGhWbjBYVnkwRmRlSnpLVE1oUmxzREIzWGdrRmZWclVm?=
 =?utf-8?B?Z21kb0h5YnZNbEdvdUhlT053UHdyc3RqeGw3ZHoya1cwVjE4Q09WQmxTNTRa?=
 =?utf-8?B?MzFLTktnTWt1NnZZUm1KQzduNUZpNkI1ckl0RDl6Q0xBMDB0K2E3YytxazJx?=
 =?utf-8?B?aGQ2WVZEdDhqZkJ1eU1oN0cvVm14eUFuYlFXS3FJRy9va2l0K3hLTS9za0RL?=
 =?utf-8?B?eVhSRUZzd1lnZFJ3TW9Mb0cyeGtSN092TWFzTmowajJSTENHbHRiZVI2N1Zi?=
 =?utf-8?B?ZnNrS2ZMbjVSWCtoaG1MU1RMSGVwem0xRzIzcHNOdDQvZmNtNGJvSmlrVExz?=
 =?utf-8?B?a3ZqU0JQSTdiRnNleTNVUFI2R0RSNklSTTE2aGZOMnhhckhNUkhIM2g3Mytv?=
 =?utf-8?Q?n+k6JKERcvU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH2PR12MB3990.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(7416014)(10070799003)(366016); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2RFcStzWHF0SXlhRUswYzV6L2RPOFhrUHJwVVFzSlBSWUlJMXFnSGRHVnVN?=
 =?utf-8?B?NmlOczFVLzRkaFhmWG83OC9zaktneEdGOCtVSitSK0ZPUUFJWDVwOWJQck1j?=
 =?utf-8?B?NmFZVnNRSndyaTA1SVZRRnFtT25zdHVYSWw2MGJKZWl0R1VHOFdUM3dzcUFr?=
 =?utf-8?B?Mm1selRBNTRYMnpwdk9Oc2t5QVhVeHV2L3U1R0tkNTV2K21VMFJjL2lydkVG?=
 =?utf-8?B?NnJGWFBBL2lIV3pKRHRCVm9VRGNDZzkxeEsvbk1aKzc2aTBZcSthK09sa0Fi?=
 =?utf-8?B?SE1HekJFbjVMTjlPRE1zZ1VJTnN2VHpvcnEyRjUya0VRa3lPZCtmTGRwdmFW?=
 =?utf-8?B?L1h2eThZVGRWTklPdGl0Yit1ZzZXcVpLY2t0am95Q2RKZnEvVHB2MHZpdVdy?=
 =?utf-8?B?WlVvZm5sSFdJOFJSY2ViaCtpMGJHS2llR29NaGR4SlJPbXRyWnBqci9sWjFF?=
 =?utf-8?B?ZWJpRnRUTXE4YXpGRmVIWXZ3Nlo1aElEMjNUc1NQODRYRFVJOUxXbjNaQlpr?=
 =?utf-8?B?REFMU2R1aU9QWWhtMWVLbEJhdlMrNXp0SDIxd0ZPZERPdHUrZlQvc3VGdHdH?=
 =?utf-8?B?R1hYRXhuZDQvTzdTUUlpWUx6UXhhYUI2VkRKV3VVZm9XQVNKN2RqeTdieFRJ?=
 =?utf-8?B?aysrbnkvbFNRUzR2MGkvMVc2enR6bDZOUUt6YzE2MVdEWjVMSVRNTmd4OStm?=
 =?utf-8?B?YmNkNVlDMnJ6cll6dzlDOW8xZjBLOE9WMGVzaVN3RllrM1piL1N4SFhqbFRp?=
 =?utf-8?B?Qzl1Y2Z0dU9FQSs3RitZNTNMeEpMVnd3SGdVK2JhSTJkbFRlbUloVnlFOXNu?=
 =?utf-8?B?OVFESHZXS3l1OXZZbjhiTDBzUG9GaERLOVBwdTZQd3NpeWlRNmlqTFBsWTJZ?=
 =?utf-8?B?OEhjRVRYZDJ1a0lhTk1yRWJuMzc0b0JQMGdUS1FmUUo1U1lINXVmZm0wQXZs?=
 =?utf-8?B?Ukd2SzdLMFcyR0tCajk3Z042RHIxYWRyYVpySEI4TVhySldGeU51U2JyNVdI?=
 =?utf-8?B?V3Zlbmc2SUM2RndRVnFtQ201SDAzUGgwekRtSVJJNk9oUktxa0NyQWxlUjRF?=
 =?utf-8?B?NzhRNkR1ZytYOXMzcDRNaUNOdjI2bFlGLytaRXloZXI2TkxsMTliZnJYcWJ6?=
 =?utf-8?B?VkdXUm9IQ1c5OGJINzJZNnB3UUluNTkrZlRTNEdyVm5EQTNqcXlnbkFzQWlm?=
 =?utf-8?B?U1hLZlN0YlBWcXF2ZmNGbUp3bjJFOWI0Mm9ucVNjSTRMRVN6Y1dLby9mbkYr?=
 =?utf-8?B?MW9qZ3pKalZJbW5KcXZDbUFQRGxldFRvRFdWOWVLSlZJN1BDUmtXKzhtS3ZI?=
 =?utf-8?B?TnNqM0dXaE5HKzFuRDMydm10ZDZ6Yy9RQXRLVlFsbVlteVFKSkNlWG1pakpa?=
 =?utf-8?B?UXA3b0tnVW1oYklsV0RCQlJPTmVPSWdQdFJZbDBWNEpDNGd6ejR4dlJDbktK?=
 =?utf-8?B?QUJpNU1IYlEzWjEydHA0SDdQanBOTEIxOE5SK2paNStNc0hucGFOZExTNzI0?=
 =?utf-8?B?KzVzaWs1eWMvaVpXWVVsNVlIZnVYcUpkZTlzMkVab2s1djlLQU5TT1d1eWJI?=
 =?utf-8?B?a3FScEdyM0NNOFAzYWg0VElxWWdaR0lpM2tHNko2ZlMxb296Z29BSEZWb3Jz?=
 =?utf-8?B?ejdHOW8vaE1zZnJGWkRTZDk2VDE3aTJvb0pScS9XdiszS1JhYlptbXVYWjly?=
 =?utf-8?B?ZTJFVlYvUUhERmVlZ2pqU0JGV1hoT1NudmtkVXRsYW5tQUFoUTAwT29xMG5O?=
 =?utf-8?B?QUNxbHpEZDFtclA1b3pMKzhSa0Q3ODRjazlOOEhMbVR5U2hUL21EUW40S0N6?=
 =?utf-8?B?T05hNURWanhnbzFlZnFlYjVXM3QvUXJFS1hFMzNvM1VOeEpJTVc4YkVGemQ0?=
 =?utf-8?B?YmRsRWpEQjdXcmM0SXlacEFEeUZ4NTBoK00rN1Vqa1lDM1kxdXhuMWhJd0dK?=
 =?utf-8?B?UmhYcnlUTlg0VklzclhtQWpCa01vTkxBcGc1Y3htU2lQZ0FQT0V4QTlsZ2kz?=
 =?utf-8?B?QnpwaXR1bWxWS0NFeFQ2YUJjbkkzaTdValFrNDVPMjJybSthbjRxTURLM25n?=
 =?utf-8?B?ejRmWHpTQWFwd0NBTnNoY0tuZTJHYkNRU3pxelAxbjJOMERBMUJJN1JPN1BX?=
 =?utf-8?B?clR3RE1RMWdyREF3OFQwdzRFWFBoMktTenRUQ08vYnRFak9KSG9xVVgxUURv?=
 =?utf-8?Q?GM0rMV+76huVzkSe1rglrAYe7mn1fEs71DOAlKrr3m/J?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82a3fa5a-c7c5-4808-89f7-08ddd3290846
X-MS-Exchange-CrossTenant-AuthSource: MN2PR12MB3997.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Aug 2025 07:32:15.9159 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lP7f2YjADRdkAgUQz+WPkLxpZn4zTUZ1h5iAmQyoiEU/e5abDKfpzG5OzVxLR/gZ+p7g1+UFTHTdRjI2jrQ8zg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB9491
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

On Mon Aug 4, 2025 at 12:15 AM JST, Miguel Ojeda wrote:
> On Sun, Aug 3, 2025 at 3:13=E2=80=AFPM Alexandre Courbot <acourbot@nvidia=
.com> wrote:
>>
>> We got some interesting feedback on the ACP already. I have been pointed
>> to `checked_ilog2` as an equivalent of `last_set_bit`, and it *does*
>> indeed work well as a replacement - with the caveat that the name is
>> not very natural to me (or anyone familiar with the C interface). Is
>> this something we can live with? If we decide to go with the existing
>> standard library method, how can we make sure that folks looking for an
>> equivalent of `fls` find `checked_ilog2`?
>
> One option is using the `doc(alias =3D ...)` attribute, which makes it
> appear in the search in the rendered docs, and would show easily in
> greps too.
>
> Another option is simply wrapping it in an `inline(always)`, I guess,
> but I think we can just use the upstream ones, unless we want slightly
> different semantics.

That would be useful - let's see what the Rust lib folks say, as you
brought up that question on the ACP as well.

In any case, since we have reasonable alternatives for both `fls`
(`checked_ilog2`) and `ffs` (`NonZero::trailing_zeros`), I guess this
means we want to use these directly in the kernel and can drop patch
2 of this series?
