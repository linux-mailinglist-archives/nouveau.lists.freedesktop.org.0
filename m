Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 79E7CC5B043
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:41:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20DCF10E97C;
	Fri, 14 Nov 2025 02:41:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Em+mwl0O";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011055.outbound.protection.outlook.com [40.107.208.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 516EB10E97C
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 02:41:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jLsBFJDMGjyik/5dk7D0u+JfJuII6CXP4GHQXEJQ34qvlDN8b8eGqbWQnCs9tMeOyG6t0EaqKriSk1M9ACzpXu4EwlZgNxO5YukVNDXY4EQlwMzAJi8fQiPVyFqlaItgqT1uEgEh/p+qvxfWcoWRb1Bac+pRshk8z81QJCtaZ8y7nKyFH1N1BYrN2coMchhoghF2RKrStSHzenTo5lP/x4Ugs/2Q+8sHSn9rNDb2QfrR2XgLoKkgQSPk+82wKshWKRhY7kbTylk7FLAejz5oSScAnlA0nMd2P6t1PkKgERkQ0WfKLVCl8DgO6eDO6c0UafBxLQi2PJky7DL5iSxR8w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kUTepm8rkZ4qnwgFZeK4bUWUf3MBitpLQLB7r5pYhlo=;
 b=tMKAa2kmRGG95Nff1TjQp5oP2oHBAVuILivzUxNH1uQhwcL69bebLAx0f9yFvtrGOh8b/Qu25EAWEDDtKqUZsUQjG8CokBoxsTspjREBceQTryZO8n2S17q+KCyWTqiH5Zs6ToEsf6IKwhIwLhU9UCigBMg8u7w+bRrcf0shN9036iDEE8Yf5EdcF1beDlAIpTwo4uZLPpmFH2wCbOqYX30VIPHtBaWd6Z/ObwXyBtXZRiRsicnQIRX3oGt7J+hHoHVT3aQJ0CDkzWyjf+tAKnrCsqx02v66meDnUTiB74P0OVZLFtAX8Fc4A8KzDlf112QIp/4UfimGjJDGyay3EQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kUTepm8rkZ4qnwgFZeK4bUWUf3MBitpLQLB7r5pYhlo=;
 b=Em+mwl0OMd8Pve1kZbemhUDptndZgdAhKcWlRitJNKS8kRFCHgKZ3sMCbIFa+BlOb/R7skCw9tspYJneQTfVhKdjEapUOgrSx+QN+3wEAk2Tew30zQq76TQNFS2CTM/jU7K4ce2zgJMKsNTuEFetxxX5USq03RQPlqWeXpRSHI5x9SXOtZtRqJmJr15AJJcuBNc+iD7Sy9Y2XasxwLjIgW58AqmzFqX2lFsDPwJQ3QidUqV2CTkev7mmet7Isv8pXqxOzRb9KEkmEy0iIBTEBtewG5dskf5FzBiNMCeXV2wlAgcQty6uBkmVyfg2jQs+Pk/ysgAGk9On4Bz7nb2yBA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:11 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:11 +0000
From: John Hubbard <jhubbard@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>,
 Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>,
 Alistair Popple <apopple@nvidia.com>, Edwin Peer <epeer@nvidia.com>,
 Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>,
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>,
 Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
 nouveau@lists.freedesktop.org, rust-for-linux@vger.kernel.org,
 LKML <linux-kernel@vger.kernel.org>, John Hubbard <jhubbard@nvidia.com>
Subject: [PATCH v8 0/6] gpu: nova: add boot42 support for next-gen GPUs
Date: Thu, 13 Nov 2025 18:41:03 -0800
Message-ID: <20251114024109.465136-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0389.namprd03.prod.outlook.com
 (2603:10b6:a03:3a1::34) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: 1b0e41dc-5773-4f90-97e6-08de23274587
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5nei9aMALSN+FAwkHboTvFmdvWeA5cj+BJHng1QCT88W0YaIG0lu8QGCjd35?=
 =?us-ascii?Q?x9Pb3yxAKti37aVl2fhLL3V0qTZvwiQ4CxF3qlIL/7MfHAKRIYVaWaeOMNrA?=
 =?us-ascii?Q?9R15kx843yY/RBHNk5fJUANCS9GA/ZEbRTutUfMNFbKMGxmRXGLW5BVLuopy?=
 =?us-ascii?Q?g4neziqU1AgeOoXXrzqLg3QYpNoeWniyX13NFrthdFbNXrd56WpHht3EhvWk?=
 =?us-ascii?Q?Vt3WhdPJ0ZNdi2xGxZoPsBxZcAue1lbPsNHF4Dq03VbgR3u2FHsTdQyxuRS1?=
 =?us-ascii?Q?Ed4zljJhd0M25aBueOjom1dBBSEtHMu0edLRYYZGUNy+8ItPKZcGprj/LNBY?=
 =?us-ascii?Q?PnRg03hqu8g/dgrtWtGAJ5NDBHidLNVP/fNFw3Ntjm6QajA0nj0IRvbYa76x?=
 =?us-ascii?Q?DMnfiXB+9wjdOc4tN7NRFy6VQmrCMLUBnPBHS4FyW+A7Y33UwteXHULGabjX?=
 =?us-ascii?Q?fNbpkbR+aInyIgiDJaimb0duIfTg00q1iFkb/4p6dyocCtET64PcM7CmGbf1?=
 =?us-ascii?Q?srtNK1sJuaElPp2b+m1qOF+n4oUXOMv3MJ5HQBgbwc5YBZPSfNFXg/kY4dmM?=
 =?us-ascii?Q?J8LM22lQR+k4fj6bpTD4MM3XkdpHtufLnY7zKSoyg7GRhQduNu9d49fk32Ij?=
 =?us-ascii?Q?q2zy6heI6S8tL1QfUma2vvTTIvVlJDCq2G0eUmojT1blVz8BrbKo8fljYt3P?=
 =?us-ascii?Q?NyWQyz9siUtBgkhLuptlaEUeQ6U/2+NX8yTEodzZlLh4iCJt7uWAgVrr5okP?=
 =?us-ascii?Q?yZ8Lip/N3AKqneoDpAUGrODswIEkKv/6Ytouj5LE6qAtHwmRhIh0cm8AHcf3?=
 =?us-ascii?Q?MzY097KOFuHv9xA3Y8X9lMrVIwMjIWrguE2SUTUO3r83579pp6OFz10ZC25D?=
 =?us-ascii?Q?NPWuYeBlblW8QJEmX4zm5IpzSFQsZyL+CtJB+dssqmrdMQ7TxcNd5rwT2lTe?=
 =?us-ascii?Q?R22IadX6Qnt7JWtbAhsh6mqiyvaYmyoFwHff3nDxVhQOYKhhJM78V5wjsujN?=
 =?us-ascii?Q?fYhDC3v021iDf2dJL13AphTBprR/6QeD+K+2+iPzFdL7mmgpQTLJpNmNEsSq?=
 =?us-ascii?Q?pfVXyZJ7oN7Fox1PMBvOiUF+qMJscbhR+yP5vI/pmq4anjDeCpFHnDyoQvky?=
 =?us-ascii?Q?iWz7xHMV+8R7S28KyYzlBYc6uBtzRvHWIZyZFilQgDXoOVcj3t6Ggjk3oZS4?=
 =?us-ascii?Q?HoPx2mY4vcyyiqengv7BsUZs4DR2NEIAzydUnmDWE2Ipqv11Nn1D2axpuqUg?=
 =?us-ascii?Q?tLn8kakt+YHVMrpGmBwvYLaRajCoIYOgCdQnbR6B0hJtzBa1ADA9Jynzk96/?=
 =?us-ascii?Q?gVn1guh+Z5r2PKHhLysoSffgbqzWxpxfWdVQawO0sqT9tFla482dfwQQWkPt?=
 =?us-ascii?Q?S/7ax0hchw+rw1ozXUIy7MCJBxEKIkJxybK2UOW5nvLRVJSQoadT+iyIyw5+?=
 =?us-ascii?Q?6sLPqa3KGwVmIk06Atni7CIGfIiajB1U?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?C1Uz9EWAkiSjAgHSuUPlTTDj8HG+PCMcMR54zcMOUIcm7jUvEfLXl8BUMpxH?=
 =?us-ascii?Q?5P1m4dpCQUo/CkQL8Nak3eXlEN20QMCQN5jiHmSujjzVSuaHbO3DWrJnjuZR?=
 =?us-ascii?Q?gCJUSkZG9J0X/N6hD2Ar/hAWKerrYAAWnoQhUQ9cpcES7fj6nedrx9bXQYwQ?=
 =?us-ascii?Q?O78lu+4o2DmgMUDJKp8kctvl0Uc5/iriy1vqRNMHX+3ZC5ZsTQirYI62tYzN?=
 =?us-ascii?Q?j/vH2pRWe/V5EKcGJD7BoS8u4i1MGL1k9o3frF6/XCzI8iAS2oN+v+DLTMx5?=
 =?us-ascii?Q?PDYLuNXrsXOCZGip5WJA/HAFOKX0htxoCKPXcttdqhKzLq91nxs2IbiWV5pk?=
 =?us-ascii?Q?WIK2HmqN7Ol1Wtwae4NbJ1Ml8WsFC9sR4BFpksuPhFg50VyzIcIO5bxFYPlN?=
 =?us-ascii?Q?G0ZV35WPYTReWqYu1A9FQFUBuJf7we8T+IUUkNk4V5gt7tvskMJA59e+8Ev1?=
 =?us-ascii?Q?1b54VsaY8FS5c8QPn/SKj8c+Yf4lUlvFb3cFQOL45n9RruIX/bxDmv1QkEto?=
 =?us-ascii?Q?QIZ5wi6nc4HQpgezkvP/A5ss6FROd2AZC+4Z+nbp4UVeT7UUUHfwf4rW+Yy3?=
 =?us-ascii?Q?bgh7LnxcGXHeX747vQgGVwmbpQcLUxHH0m/88A1m2yEIh+KQXqQ0KINY/J83?=
 =?us-ascii?Q?x3b11Ed9V+2xAeGrOd4QFfWkLMOuB+deDaruS0rqZhLkL2zXe+w0imR0UBdv?=
 =?us-ascii?Q?1xS6ExFSHB0zz6KFPik+D3TxWDvvg7R5Df6M6TjU8R2fcixX0mza5iJRe2nH?=
 =?us-ascii?Q?ZIi+FIlFgWeLblj0w1Vyg7oCtc7nCCW0EbDht1419r54CrUA0oBLs1h5cdGT?=
 =?us-ascii?Q?fjGSVBsNhRQvVvLdV3g9E1IQ4nhuXwnq0rYPjS6s7K9SUA+A2ls2aCueT8Os?=
 =?us-ascii?Q?hQYDUapGoVfvsRwckcw8/OnElRbIDmbiw6FScpnmWISNDuBRgRDoag+zMEBA?=
 =?us-ascii?Q?WGcUNT9uxVf0VymPIJtR7tBOa77wOVUo74rb+SRxYVJVSeDrBNHVF3P5qDi9?=
 =?us-ascii?Q?9pGkYmfH7Vi5TQz47JKc1qF/dIpUP4BxrQiJz/uFBd+1aUkJrQChYJld/vxr?=
 =?us-ascii?Q?p5em3xUsda8xhkPhfJeL9i0Z2DLQyoTYcQ1QnRlIMzoEoiG4Z86LEB8N+4bA?=
 =?us-ascii?Q?fyu1iINDqzcDemWxZ9lU/yDlGOarRZO3CudTXc3RNM7jDySF29pKMQGuF+US?=
 =?us-ascii?Q?GemAt2JXpbhGzcH5sHNwFDTVx/owX+EESVn0t8ClKY/ZOOzDCwneTB3xboM+?=
 =?us-ascii?Q?WADqScFpXpdSztJoHZHIUHSxnQoFNz7FgtRxkbwfpdoXAtekTmS3oUC++K46?=
 =?us-ascii?Q?nLdxz0RVGzFIf+mv8V6rKmJ9J0ghXmRK9pWXikMW2GOrYcO9bu2SlojPc9dJ?=
 =?us-ascii?Q?8+s3yppQnS5r8/GWh+DKk+2EfCPmH/K0CXXhanf6JOM4GRbb4dymMm5rEZqJ?=
 =?us-ascii?Q?7gSMwkxOmb3SxT3pF3zVAAE8fqq4nx/GEeCmmcfaZ+IBvUJUt7+u6ISOGo/a?=
 =?us-ascii?Q?ryRLQDnXzI616xUbOb68NP35wyFim96RQCckfO5eSEYICvye6J8CpP1N8rrC?=
 =?us-ascii?Q?QL7PcyLj7zbSM19U7exSVWRAjA6VT73lDYEof77L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b0e41dc-5773-4f90-97e6-08de23274587
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:11.1863 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kNB8inoN1by9UWkIVSNm5EFhiJ/I0ru4oAO/Bu939anmvyUadgGIV1eTYJTyfHdETMg/WMnUqgG5lmmUA/k/nA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7986
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

Changes in v8:

1) Added two new patches: convert the remaining ENODEV cases to ENOTSUPP,
   and add dev_err!() report for some (most) cases of unsupported GPUs.

2) Corrected some comments.

3) Added Joel's Reviewed-by, but not yet to the two new patches.

Changes in v7:

1) Added a TODO to eventually remove the Default trait from Architecture.
2) Further refined the logic and comments for reading boot0, then boot42.

Changes in v6:

1) Split out a separate patch for implementing Display for Spec.
2) Moved Spec implementation code to its proper location.
3) Significantly changed the use_boot42_instead() logic, and updated the
   comments accordingly.
4) Fixed the boot42 register and field values, which were wrong (and
   had not been exercised before).
5) Imported Revision, to save a few ::'s.
6) Rebased to the very latest drm-rust-next, which now includes the new
   "one 'use' item per line" updates.

Changes in v5:

Two fixes, both from Timur's review feedback (thanks!):

1) Updated both the cover letter, and patch 3 commit description, with
the correct description of the future contents of NV_PMC_BOOT_0.
2) Removed a trailing "boot42" typo from a comment in the code.

Changes in v4:

1) Simplified and improved the decision logic: reads both arch_0 and
arch_1 fields in boot0, and skips the unnecessary is_nv04() logic as
well. Thanks to Timur Tabi and Danilo for noticing these issues.
2) Added a patch to represent Architecture as a u8. This simplifies a
few things. (Thanks to Alex Courbot. I added your Suggested-by to that
patch.)
3) Enhanced the Revision type to do more, which simplifies the callers.
(Thanks to Danilo.)

Changes in v3:

1) Restored the Revision type as recommended by Danilo, but decoupled it
from boot0.
2) Applied Alex Courbot's suggestion to use TryFrom<NV_PMC_BOOT_0/42>
for Spec.
3) Reflowed the new comment documentation to 100 cols, to avoid wasting
a few vertical lines.

Changes in v2:

1) Restored the Spec type, and used that to encapsulate the subsequent
   boot42 enhancements. Thanks to Danilo Krummrich's feedback for that
   improvement.

v1 cover letter (with typos fixed)

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will contain a specific set of values that
will mean "go read NV_PMC_BOOT_42 instead".

Change the selection logic in Nova so that it will claim Turing and
later GPUs. This will work for the foreseeable future, without any
further code changes here, because all NVIDIA GPUs are considered, from
the oldest supported on Linux (NV04), through the future GPUs.

Add some comment documentation to explain, chronologically, how boot0
and boot42 change with the GPU eras, and how that affects the selection
logic.

Also, remove the Revision type, because Revision is no longer valuable
as a stand-alone type, because we only ever want the full information
that Spec provides.

This is based on today's drm-rust-next, which in turn is based on
Linux 6.18-rc2.


John Hubbard (6):
  gpu: nova-core: implement Display for Spec
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: make Architecture behave as a u8 type
  gpu: nova-core: use ENOTSUPP for unsupported GPUs, in all cases
  gpu: nova-core: add boot42 support for next-gen GPUs
  gpu: nova-core: provide a clear error report for unsupported GPUs

 drivers/gpu/nova-core/gpu.rs  | 94 +++++++++++++++++++++++++----------
 drivers/gpu/nova-core/regs.rs | 51 ++++++++++++++++---
 2 files changed, 112 insertions(+), 33 deletions(-)


base-commit: e54ad0cd3673c93cdafda58505eaa81610fe3aef
-- 
2.51.2

