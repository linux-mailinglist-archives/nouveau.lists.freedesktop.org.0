Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F485C5B04C
	for <lists+nouveau@lfdr.de>; Fri, 14 Nov 2025 03:41:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46A3810E987;
	Fri, 14 Nov 2025 02:41:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hl/3gP/5";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SN4PR0501CU005.outbound.protection.outlook.com
 (mail-southcentralusazon11011003.outbound.protection.outlook.com
 [40.93.194.3])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8415810E987
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 02:41:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Vri8nZRc5NTxrA3+Gixet5fpv/ltxg2sP19480HjnQFewVXUX+n0YOlKz9deWhkEWVm/an/3MJWypOVp+QGX/4+oJvYvpA/UmuJFCckl99WRO4FoTc27OQwjCVpM+yNuL75w99pB9V/iZAuSWXk7EYd8KJUZp3Tkf7VORUH3tjs5D7UhCNFYHUTDAsRh6k7PWee3qZE4uvC1RIoocHpd555KgwOVhudd2dvmPzbgun6ZeSjcl/0/vt+fGf1w+f1jzC98YSRxaGhULc8pJbKSMFKZuwAsZC9k9P8td0jQeLnLn9qxC51YzlWbuV8sdcEAh6vjTeOJBaf2m1ZyhuYfhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kFda0fFtbqTo4RxYvmb8vlXr7Yx0lXXAfUNHsKL+RTU=;
 b=E3kAl2TeO0cwRMp2xN7qjSsEO59FXaNXPaa1RJIm/C5VtrFodQXq7T4dAtrx0LtNKl53E6tQenI/ghCX+SY9UxTaaE+2Umuq9arV0kUBDrK89JAaRqFOupo3bnnjGwJbOzNxOVxsgKdvTXmR8GevqNgK+B3e5OT0sHSMYrL50qcEheu1TxsHQMkMv4QvEPn79LvI4gaLqs6Hp0cVMxjLCvPDi+r5aNX1ErPKQ70XV0Q5uDjZZE+sLccN73uh9dLXVKWQ0sqYvtJX7PHdCGr54C+kSjEyge/75VNgTMMTD+PTeEGGluXaM9zFIZZk8xPScIcSTay0TylXgA+r3tprKA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kFda0fFtbqTo4RxYvmb8vlXr7Yx0lXXAfUNHsKL+RTU=;
 b=hl/3gP/52GejysjCyPdhl+oWY+/OSLMnoTv8g+jXB+w5A1oKRujnDFq92wkTjbDHAnGU/LK6icqQpEolk+YmeS1nFw+T/dVQiLg5sdvcUqc1gf2Gk4TwNW8ZZG+vhhLBzmDBJqvadrm/RBliYWFXKYwd2+gHZKIxT8vu8jqEOBfojfFW6hwXahLlMADx1o3iJ8PNOos+2e09gc26twaT3buF4ED19CrYQZTERZJeZ3BBRCUWZFbMkIF3jxJXc0IyF3yWQv8X/gCRvum6EQGaeoWAuDyWW4xckC6OhGBP0tM6SIAJyBIaDelzjP9dilkflMhCSRWHNTRZAikz52UhxA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB7986.namprd12.prod.outlook.com (2603:10b6:510:27d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 02:41:16 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::d622:b3e9:bfe1:26bb%7]) with mapi id 15.20.9320.013; Fri, 14 Nov 2025
 02:41:16 +0000
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
Subject: [PATCH v8 4/6] gpu: nova-core: use ENOTSUPP for unsupported GPUs,
 in all cases
Date: Thu, 13 Nov 2025 18:41:07 -0800
Message-ID: <20251114024109.465136-5-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114024109.465136-1-jhubbard@nvidia.com>
References: <20251114024109.465136-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0190.namprd05.prod.outlook.com
 (2603:10b6:a03:330::15) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB7986:EE_
X-MS-Office365-Filtering-Correlation-Id: a283d6b9-991d-4d8f-5b4c-08de232748a5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|7053199007; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1X8s8T4CRc40KJJqRFW9ei1aPElnZcVjz4dTOUD43JHB3R+KnNU7P+McjNCU?=
 =?us-ascii?Q?uXW4htAioKSGD5yXk1qG+qsIW4D8DEkeS7dcEBMlIWW52rDAqnZx3Kzl89Bx?=
 =?us-ascii?Q?lgGYewUa6np6n6sCBQeBeC5ZLQdNG0SyDAUtBBzAPu1mOiB9N920SavrRQJ3?=
 =?us-ascii?Q?U3Xqk9cwl9EEZHGGE3o2BzcuPz5RluFke7MjyARc0VJzZX/6BE3UZCxdUWB6?=
 =?us-ascii?Q?uasIVE/CTKT61OZ0TztP1N8ENG16pDmoN96ePfPTDpogXUfmYQM+g+nwY49N?=
 =?us-ascii?Q?1EkPy4lcowECw7Ok3BJkLS2kO82x0Nesoc13VroyQXtfozS9WHn1fz2KoN1U?=
 =?us-ascii?Q?QJJny4HcuZoqhllqyS6N5rHLNSbk1eopkJYjmeGHy1EeYIfcRRPHDpZ34OXl?=
 =?us-ascii?Q?zp+nJmauRzUMQIPVfOA7NkiDPcnmTzat5NB1NNfvhIb5E/cm2xBwDdsDSyH5?=
 =?us-ascii?Q?yv+8kDHDvzRd/DJHbWgGZrUPEWVVqDAOM0LumUoGzu/yEFxrLEG2PUeNrfB2?=
 =?us-ascii?Q?84Z1zKx+ZVSwlvifjM9Ux2mGjb5viIDA6pXd3z26j8A4UKyrCPsGGLeVC3Tg?=
 =?us-ascii?Q?7oY0SO/5gB4BXVMHZZo72fAO/pBBwII3/tQt8vyUKDS/JEgfHHnJhU4ZYrOr?=
 =?us-ascii?Q?lROAbjSy673VQ9X5FihzOp84YfgyIpuFV7dB+extnRQJdfcMA8CFDHUvD03B?=
 =?us-ascii?Q?JpJpeoZexSWOkG4B1sSb4aJFNCIEDdQB7fvny41t6nxOCAC5n5T6VYhv0z4E?=
 =?us-ascii?Q?ioeaLsRWGWvXZp98apzrqEhEFEk28cqzmGldxz1fzVQJmcgX3Q1NVs5pLC7C?=
 =?us-ascii?Q?PtyXLGQuc8O6RAlWZlL8p5/jR1XBD626TzuFmby6hplmDFCfGMh8TG9gwaxZ?=
 =?us-ascii?Q?X5dimB8x6OIyfB1hC2EwrNSHVxqux1X3Aoyfx5o2oLeKR3dh1QwMNrIkcubF?=
 =?us-ascii?Q?8P6OLpEgg4qKECQFhosretES/R3VvUOttveecRyF4yi9m2zUZa6zyNs+63CL?=
 =?us-ascii?Q?In2WRtEkY9+P1mESFFkBnwsfT84jDdIVjWlT2UVsUW8zNVODHWGQEknSkJnP?=
 =?us-ascii?Q?D7GC9UoVEkkAIb1vV0DsWP+OTEwujXrFOa0TQgC5fAw2aVecsmYP3aFlukeJ?=
 =?us-ascii?Q?hDlKTdEq/TBkA2xW7ltOEa1QwaDL+AMdV853JT9lSPoZ2K7Vf+c7/7S4A3Nv?=
 =?us-ascii?Q?0Nel5iaPRIKtmxEXQNYDB7//NZj5/SoKD0Nt4N/H1Q25cIKfUjOWgXRy0Mh8?=
 =?us-ascii?Q?zYDEZuACqRdtQsa0Ms+CA+9m+8GNuHd2xHYOIbOrsJKd/Wv0yy6JV9x4IVAw?=
 =?us-ascii?Q?NZY68MikxwOGUM4CC0VmJkj+OxqaKqSc5POw0G98C3pfhfxzcE97KzcQtfui?=
 =?us-ascii?Q?XDfR0wxN89B6AeeSGfFgmj2YPLmsX4wdgZ89QgH6bKCxaXuPZrvVq3ful8tN?=
 =?us-ascii?Q?R/DTPobLvnZeDHSRjbO8Mr3SBwjhGOA1?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(7053199007); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I8cX+RaCelZMcPjdYPjTmKeXmen6Wzshi6ltZ8cFx4aPkTF7mMs3F8lLcuhx?=
 =?us-ascii?Q?T0Ha4+RnvIV4DcpkgCl9O4CJk3jByUfA6iJ7NhiWfO7Xl2Wj2eB39emzsyQT?=
 =?us-ascii?Q?5acNkHPTDLsLRarL4Ewam+SXDIaPN3qKvE2o2JTl1AMQSbt59bHFOY4YWVc2?=
 =?us-ascii?Q?rwglt+ZPjfUGNjjDhEX/btw5xmVt6lWVgAx174sgWXS4FTfbiKRTYhzV5P6R?=
 =?us-ascii?Q?7KA9eDy0W5nmMiPs1Xn6DyHVIbFhFyZZ/UPmYeLPFHn0x0bwHYCNEnLcMrDi?=
 =?us-ascii?Q?a0KoKv82PsTS2nrOzf/4WbN150DHnTqAfBcjefMMPHRNi6+t6o0WLWf1zp9g?=
 =?us-ascii?Q?3GeZ6l8xnAxlZK8Hp2nY2DNZANr2duP9tkVQ98EzJ44VnBa/jhKL4jZjdDss?=
 =?us-ascii?Q?Dj2PbyNppPFXNQ5NlV1/1pBa47DOBnFIUWSmdaxAj4RO4YhPohuaBvn5QfxM?=
 =?us-ascii?Q?7bU38M+5+C8hTpCB6rPduSg+2SzNYmbFsIHRPMxZt+9Xc5mo7v+SSXbQa/3l?=
 =?us-ascii?Q?rGxBB7Dil7g6kE3K3Tn/9IysHqCMPfuA0QRxdQt052JB8ojYyqliJbNUK9e0?=
 =?us-ascii?Q?9kKLhl7/Jwb3sx2to27zfWBYdvp8XJien7n4f8+gvbxJqDEuUWsqXRGeLLL3?=
 =?us-ascii?Q?6V/0qPXYiMSXFhPYk5E3gh3fVLGoj5JN7Z3MbgqSpsWVUHgP9EVhD/sRlJcf?=
 =?us-ascii?Q?wH0Dg1/rKXE3CiwgC4ZkJ6t/mA6MxaxXgClDI+CKgLfze0O9x11a98FBejPf?=
 =?us-ascii?Q?jGrfjNmS+9HpveEptsdjmoDpcV+HsgqWNtb0Pxrfw0iICpzXNrnojqJAOKDD?=
 =?us-ascii?Q?w+5dDq2xdARkBHW7IYZwPYJ0ez6tTCtoAvliwmtVG8uscBCfv0LHtQoroRiL?=
 =?us-ascii?Q?QVu7u50gOdxHrv00XvwhLK+ux95+Q97VUDtq+Gr3NruTHWA9in602/7zd8iJ?=
 =?us-ascii?Q?7FkPDc5NqP0LSYTtqysenafuaHfv1UCYooLcs/GSti9ojDxDub2r5HHwChoP?=
 =?us-ascii?Q?ZHYeGPAykUWDSD9gfkcepPab6URntVzHUJNpg4hdGipDw4GygYcCU7zmdxLQ?=
 =?us-ascii?Q?+y3cHoRwysIc0H+WVDs3iwJD6facxkHg/VM0Jfa7i5iUnsfZDwebSdKAwa4E?=
 =?us-ascii?Q?D5R7Ny5YEqz+xa7PLNfF8MYGXv95VptmzzIe0w4+QGAgdLGypSg07Ww/NVsA?=
 =?us-ascii?Q?4anGIFmKKAOIeRUHqjuUFgpXsD0SvXLjeE4uxbC85tC1irhM9H09QmEPBk/1?=
 =?us-ascii?Q?Evg9H5VQ5FbNeK5b1HvFTS+C05h8mGZBM9egxrcSO6GoFl6f+KCF8gxcHk7F?=
 =?us-ascii?Q?qvFOYDNPYcLcBieS9TES1rawPyT2nXCBY+Aldk/mPM/6NkUOtrLk0ZSneNRD?=
 =?us-ascii?Q?B0pfh688dqLG/3JNtxU5l+wzxpj/Cim1RJhOYiYq1wBWNfVyD7j5rBQ92YvX?=
 =?us-ascii?Q?P0DB+WXRGeG9orxsv37QGrJvzw1SFg1bxprSpvGOFC4os9X+3CujeyUzNuWk?=
 =?us-ascii?Q?JdyuYj2KpkL/ZVYF7OgtXYt612dBWEaxEAig4DmD+NCH4uUO16e/CH266SyT?=
 =?us-ascii?Q?+PZsDFZX53Sx+BLI8ArM4xXOp9EQ6IcPnRpxeEhy?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a283d6b9-991d-4d8f-5b4c-08de232748a5
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 02:41:16.4134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WvPy4bFn1l/ZL3mejiZH7QJa/tGfgOrN65TNpzjenYnS7gOzafa9GUY4IeFjxc/wfDrHTqZsJIVJLLmJaHLdOw==
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

Some places in the driver use ENODEV for unsupported GPUs, while others
use ENOTSUPP. ENOTSUPP is more accurate, so change the ENODEV instances
to ENOTSUPP.

Cc: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>
Cc: Timur Tabi <ttabi@nvidia.com>
Cc: Joel Fernandes <joelagnelf@nvidia.com>
Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c1eca052968b..aa8e881dd474 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -62,7 +62,7 @@ impl TryFrom<u32> for Chipset {
             fn try_from(value: u32) -> Result<Self, Self::Error> {
                 match value {
                     $( $value => Ok(Chipset::$variant), )*
-                    _ => Err(ENODEV),
+                    _ => Err(ENOTSUPP),
                 }
             }
         }
@@ -143,7 +143,7 @@ fn try_from(value: u8) -> Result<Self> {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
             0x19 => Ok(Self::Ada),
-            _ => Err(ENODEV),
+            _ => Err(ENOTSUPP),
         }
     }
 }
-- 
2.51.2

