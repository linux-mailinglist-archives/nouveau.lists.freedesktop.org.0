Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A104C28910
	for <lists+nouveau@lfdr.de>; Sun, 02 Nov 2025 02:37:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3E32B10E021;
	Sun,  2 Nov 2025 01:37:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NWAMyYgH";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011059.outbound.protection.outlook.com
 [40.93.194.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0597F10E021
 for <nouveau@lists.freedesktop.org>; Sun,  2 Nov 2025 01:37:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a9VKxCDnwp7D4+WBycB0E2geHzvMgDKMxd/DqO6yIIC4v44q8Rj+louxpAXmaZMepg+Y9RgXnbE+c1vshE6qCvPaI75Gc6MC98GwstRc4N/OCgfTsFyhB+A+sQGy8Rgqm9sbjjJ8WMypQu2YBYe6ra04ZEGoRbqbN6ulhfcsvYBI147agdoxsh5l1Y0v6OB/34iDi7x6pDQoHPek17Lcy0YuSLtZVDt5Lku11sNq4DMaUZbO4bF4diOjFSE96CQ019hzOxoKaquv8wIgJbTNXM+trCSquwI/QFTiKZNRKbHL3Iu+LNb2gdtDhT/ysrpGol01i/p02sn6r20dNJfUeg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hRkLeH9Y9LRGXzREpAK4ZpC4Dgi7JVWg6rgxSoX9ePM=;
 b=XXRPHUPGlvX/aETsE5Fv3BD6rNbbIK+58/I2y7rhjaw32AatFcw9kX9kT+WSBH35VseyPCoCFwyKHCpMCbKsU6+GlpexC/cpn8FYKb8gs6v+sDhPHpO2qdEEpISkUEovohZ8YpL4guQd0Hu1uuQyy55cvjUu0DmotEfLYWCdSlqv3AJf/zZGcCXPZqOY5EUWIOL7hAkrDzyOGSoYMzyT9BPavES40Vvez/ofRRFT5LJGTGEOMzFjyPK/enAl33ShDGLwtGvXo3hcf3sLWFaXAOpqfGdIaNsWL8x5XSfncLOnMgLY5Lr/EppTfAPTY8ro8qcNPhbrfC/5V58rzEjrTQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hRkLeH9Y9LRGXzREpAK4ZpC4Dgi7JVWg6rgxSoX9ePM=;
 b=NWAMyYgH+1QNuR6QQwwxrWUh+WC6Vc8WJwJVk7lFiOP3wXKJ/2S8tKP1vVPlfhrPY9W2/RY07y9U3wGKD4lj/2xm3/T8XcVwDEdW+T60OK4YeM3myviIyas9+dF+oVFU0KLdCOjWVTQ/qLjvjbSOUOpuLUrGA8NrwV06ElH88JMnO1GU22nS7d2yAXQL+pWdk9JiAyAM1ESmAbt9X+IsIU9OMMohnI/cRlKBCqT0MMmJUf1pqku6S4NO0lzlDtIQJOo2AG08fcIKwab1OmRGB+5csr9/w+3IZeHguPVISvrfmyLGveugTGDc6soJBafGiPpjb72o5z6rhTiOYqUarw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by MW6PR12MB8916.namprd12.prod.outlook.com (2603:10b6:303:24b::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.15; Sun, 2 Nov
 2025 01:36:57 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.013; Sun, 2 Nov 2025
 01:36:57 +0000
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
Subject: [PATCH v4 0/3] gpu: nova: add boot42 support for next-gen GPUs
Date: Sat,  1 Nov 2025 18:36:53 -0700
Message-ID: <20251102013656.423235-1-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0007.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::20) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|MW6PR12MB8916:EE_
X-MS-Office365-Filtering-Correlation-Id: 0e1e83a5-68a3-418e-5506-08de19b04f93
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0MVBHDeEmLPuq2If+RaJVpjXOt3ulThCxphr0QYh0gDUTY8FOIFvVWuOi7sj?=
 =?us-ascii?Q?F8U99mhMlCFwIW5dHcold03HCUM8rRjg2iOlLo2AdV/i4DJn4cTEptFSvaXl?=
 =?us-ascii?Q?APtPxhCdKKsr6x50gWooXt27u/KKlZfKdy5chhQk0YNZG1HVwf1V04VN1AXU?=
 =?us-ascii?Q?f/TrQaHiuJszQtzQy4Kc1AgFsulrX9LjZg5lf4lmXdfagYpuUheqBETx3sQ/?=
 =?us-ascii?Q?fBmcWjj8xvzJQxNdhM8+bcR3Hpm89h9eoZUOL/5ogbXt701awo31SZjPI1c5?=
 =?us-ascii?Q?DGLyk0VADs4Lqcuu1Tldh2KYGzDxLmhukNBtwKEKUHCrwOJZ34HQ53xsBgYT?=
 =?us-ascii?Q?Pa0v9/s3k4dICn9GC93i1ACEyAvySWDGoHtqhlRrLlV2fiH6zujwlIbDzDxA?=
 =?us-ascii?Q?M7z8Yn7NFx6jpMvPxz9NyNt+2Qlz8tnt8/KcbKJOAHuWwxgAAnPrSAw9hDxj?=
 =?us-ascii?Q?QVEiEMuAOoGClUFItg5vP55gQsaI8eZ9pUY9CgJ+sb6HxBoJJRgFrqJsLKi3?=
 =?us-ascii?Q?OpD06m8VO94G48bD3M0djKnbn3LzdTEmUBmJhgPZyHKq2MhAy2hMu2xZkdJC?=
 =?us-ascii?Q?zlB2hU91y4lyT23XdSFN3hEmgADGaud2+NPgCR1pd1Eie+WyKOdsC1CH219M?=
 =?us-ascii?Q?b70j2KPsoal2WNb4chbYBYSc8tFhSfKYdJIkjaN4xOw5zJykGJxO5rmhXlmr?=
 =?us-ascii?Q?RV0wbHbQUbAiusu/bYUDunRoXcjmbq05896I5/PaM6I2G6nUl3OGXd0X4W/H?=
 =?us-ascii?Q?cO/nRcVsyOE4/9dZvsUzLdBmXFU95VZTBgjnhAG5OAjoZTK0pYaeeVtUMmCU?=
 =?us-ascii?Q?5vTrn6U+l6aaGjNvHFi+tBLQOEXJ2e9JFHdi4W6c3XldJtbjXz3IZ/z2c0j7?=
 =?us-ascii?Q?VjYvHQzbJdFxd/rSh5KHjffW9rw5z6VKe87d3CWfRfBuweczLzichhoPUBn2?=
 =?us-ascii?Q?clPB2ElEBZbANgxuSZTIWKYQ4Ei1MQKTDEFuspaZel0ctBibAAqQLwZcLVoQ?=
 =?us-ascii?Q?4Gocf+udrHoF8BfGkWCSmdgZNzdaMfstlrzEoBxQbgGjrv0H/fcRI34FL2sg?=
 =?us-ascii?Q?SUEBdsTOyDXDSY17tiG+8HV06WgXnqYDqOMj2uZLZ1/5L6qLzkC/B4oaz+UO?=
 =?us-ascii?Q?bG4uQ3WGrQ/X9jpy4oBFFF3lM9EA0oDZorF5rntQ6BKqCYG5BEkvypjIH0zL?=
 =?us-ascii?Q?h9JovCzNhvXQJro4WiG65Ig1+y9bseI1sTs/oPgPpXOawFvGU0XM/5uA04Tx?=
 =?us-ascii?Q?c6EOTX3kCSeBzCkcs0xHc8zdNuEbFdt5zPa81QCFGTBDpYhd3d2mU5Mc41H/?=
 =?us-ascii?Q?M9Zjr7pMjLfhrzDhEkMtdj4l3stRryLBIO0yBz4y0b6OY5mNtHocbljY38q1?=
 =?us-ascii?Q?7lSoelZQKrHDNmk0NMja4Qoahp7Nx39+Vu6GmrXlTAU5dRIDgh5mU91cEq5o?=
 =?us-ascii?Q?7f+lT4SAfaloFH2RVBw4f+zKUoB+3hC0?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lyEtr3vfg2nm2HW3Q0JuVQLn9HzGIx21nIzzyyHbK0rHsvMdhAh8bvYzH7Z9?=
 =?us-ascii?Q?J9ug4YM7y70TeM1Y6j+64g6cscyt77cYa3Cqk+OCFREXOXTWAsoVTzTOxQwS?=
 =?us-ascii?Q?08IGmNPQ/ClpPXScKR/8OPeO3i8UtOCPQLKbdVKGgZI0ccrSqPQUX0qgHAwq?=
 =?us-ascii?Q?zrypig2CQGbGWb1ee6CiZ620MMcJwrM+yQ1NaFc9Sn+0ggIZd9Y7S2cLgyzf?=
 =?us-ascii?Q?B9ylvcc/IB72mcK66FJDTsaxWS8VWItMufL6GoqeQi2k5quAIZEZ4eT+lkMK?=
 =?us-ascii?Q?H4b8JhtSrTK0lDmUS5VL4ySJbfsUe3Y40eLCX4kWzr1CqUr21v9OTUXUHqhX?=
 =?us-ascii?Q?Xu2kezh0o+vd5CPDAHaTbGdQ4Q1akz1wwJ82Y72CVAY9HRY1s6pX4G41pirn?=
 =?us-ascii?Q?spEPjEebOIl5cd3rvhHGaFND50rrTOBVsDz1oJMn5AuoF+2Zb80Zp09PiGR2?=
 =?us-ascii?Q?k7DyjaqSfzMbIBzvn25xzzCVfLYyjBJTPUBWePuVqyj8oW4uCC3YYMnnPPoJ?=
 =?us-ascii?Q?A6d8CGNVUjGxwPbnIEGaoTIJwcqHERz7INYNqgcBUknQ6NyTfz54PoUNrIO6?=
 =?us-ascii?Q?6qIVsOEPwZGJSBA1zLrX2qLAylfm/ke2H7Z+UJT4wq93lxwMJJz66pBv2qFL?=
 =?us-ascii?Q?mvkHJUp4t56UbdY0584acRHRS+bK1rCU7YZktFMSQUO3MmJFsIZGqAwx7UhL?=
 =?us-ascii?Q?AHBryY6PmIMsEUIbtgQUCGTk9i7V+AUU/qSu3CFdI6OeJ1dbLQotnOHuBGso?=
 =?us-ascii?Q?9DkR1kqgoh5PLKe8CEyvGeCk2GoM8aqF9bqUmp7olloQpIDg0tNDLIH9x1DN?=
 =?us-ascii?Q?Mdv/i5GucLZk+gVUYVEgqniDxaqvv91O2cNvM6srzwEowF0XJ3EavPJ0lhxT?=
 =?us-ascii?Q?Nl6LemQGg9Qh3rtZkm92vNyjnstmPgicrG9yAz7em0z+mxZz3znnl7r0MmSx?=
 =?us-ascii?Q?K/q68uMNfJkFGZlr2Zce8EZEfTNpjFAdOcGUV5+YXoujWRDR386AYF80bLyc?=
 =?us-ascii?Q?32I13AJvrX0dUQ+h2YxJwe+kKmm+/ux2pq4GSVQh0CLMNS9Dh6HDwkfsvcsO?=
 =?us-ascii?Q?pxnmLt6iUvhq41moUabw0nBfC6KgRERzwKuOokGg9Rlus1MxyjJV2169bM8a?=
 =?us-ascii?Q?MToBukMLI6GJIDuNvHxqTfpKcd4IzhW4CCDU3S9DVk4CoR0mQT6tcynGp67C?=
 =?us-ascii?Q?iGsA/N9JkRFfN9g4dTajDFfEkcBFxcR/TvvbIZHF/ctk40NBEKKvRqO4BDs6?=
 =?us-ascii?Q?AwqVpJe5oBi6Zy2EVzL4TIhT5SJUL3XxSuZTO1+nfU8hittBiSxphHS1Srru?=
 =?us-ascii?Q?2RDlNUeHkYMVBAaDMUFWEjeMkweyKzXGXlKI4Tn9iD0sFXN2uduD95PXRSox?=
 =?us-ascii?Q?tThlfWPikVDgJczBB0v23mf6Gsh5WRZeFmCAK3TrhHzQKGD+cw2a1lTQf2L5?=
 =?us-ascii?Q?KSCcxpaO0IwfiYYRnlJpYOV6YBVI7W+RcQW09PfMPDN+Rarbw/c72xhCY8pQ?=
 =?us-ascii?Q?KC+KUp23xzkDOa2Lb+uRlWHSKgk4YEieDHj9PIeR+E6ABpeTx6+tEDoAZf82?=
 =?us-ascii?Q?9jWcJ20eZ78dKSyCD8Im8bvml9B1dZkHyEGkd0+v?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0e1e83a5-68a3-418e-5506-08de19b04f93
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Nov 2025 01:36:57.4675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: frWi9zhHx9ZfdFcDPO2IeDKOcAWklvJu6BUXOtk7AM+R6HsE0UGlmLOEdIlBmusP/QBdqqr69sFS5iOX5gciSA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR12MB8916
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

v1 cover letter:

NVIDIA GPUs are moving away from using NV_PMC_BOOT_0 to contain
architecture and revision details, and will instead use NV_PMC_BOOT_42
in the future. NV_PMC_BOOT_0 will be zeroed out.

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

John Hubbard (3):
  gpu: nova-core: prepare Spec and Revision types for boot0/boot42
  gpu: nova-core: make Architecture behave as a u8 type
  gpu: nova-core: add boot42 support for next-gen GPUs

 drivers/gpu/nova-core/gpu.rs  | 92 +++++++++++++++++++++++++++--------
 drivers/gpu/nova-core/regs.rs | 41 ++++++++++++++++
 2 files changed, 112 insertions(+), 21 deletions(-)


base-commit: 9a3c2f8a4f84960a48c056d0da88de3d09e6d622
--
2.51.2

