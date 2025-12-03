Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 382E1C9DD67
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4BB8710E0E4;
	Wed,  3 Dec 2025 05:59:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DwKsMC/4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012022.outbound.protection.outlook.com [52.101.43.22])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DE5E10E0E4
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lc2I5xSyQeC7+IR7mFGOtoiaBtrJbv9/4gSK/Evk9i2F0HaPlOaJwnBWoEPpwrvTQaW2uuNVYARL8UpPV3C1kWZKNv7dDW/36WuOCtz87FWyPvvC3wyWmb1XMt5r6Ea5a84CDTvf2Qg8gSVEdspax4wL9oM90Xndphevui49OlN1KcPE/hq51wKPRAzvVvdCgAbvKhgL1K4BVZ3JqIZvMR5s6VpVWZrmfrFB0vT3N5DiklJdNUrYxovlA/sPLqcWDcTqUYSMIqE3CZSqcHLtpmhbKf3gSALpnMQcx4xg2g37+PVQYta08EKJ31uVLX0K0qDx2QLCFlSwsumhvIumXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AfjdSBO+v/4XLJu5BvlZmcYRvXV8IXBZi9Xh4nYhziM=;
 b=B5GpuJU7m2iExbmO8LxX5IY01QkyehIyRGOeZJCWSnTALPii15e0EueU+Y1IWNmPX08B0+G5YcVWX9EWJO/XAez91+3BsuwSqPKAwWdMlDM3h05USgvmy622RhTYaV3UEvrQl0QqCBaIcyW5j3qbpiFs0h3KbKAKx0WKp/ajUo/mRUh+gszid/gHjp0DkOtBfeBFmQJ6dGahWaMH7Y0cyos1ml1aV/5nA+TZ2+Gv8eWR1uQzjLxWj0FMZYWiiwfw6D6epfUhqoSh0ZHCAhYwFPWnnSkCdqmlDFOBLS8uwf6sOcaH3YkgQ+BoZdTRaVe3e8Mb2nHiUbKctV3HYYgJ8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AfjdSBO+v/4XLJu5BvlZmcYRvXV8IXBZi9Xh4nYhziM=;
 b=DwKsMC/4+FLpGtTXxQZ772nEkD/R+08h7jYvdDjmtwOizILJA3vVwmj7P3FuS/QCwvyhodyK36GZJv68uVUSctXVZdeFEyYM12lC7GJDAcEgDn7MH0VllfP1q5unHdY5wuHGKCHye5Rvi8wHZEqiGpQfXN8pK6WXnlqXLyY+4PRiYioKhX/jNCBzcakaHo+gJFxIW6MygLieRSbkZntsdoHG54niFiC4TSks2Y8BxishicZ3Ag/aMhpedsd8nnztZ705D9vCES6ixyh35h/SnmPIE35pkCAxU6DC7dzNZZ9VchH8X58/geoqRu1M29kxqveSStcHb4CnSdlsyB9Ieg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:29 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:29 +0000
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
Subject: [PATCH 03/31] gpu: nova-core: Hopper/Blackwell: basic GPU
 identification
Date: Tue,  2 Dec 2025 21:58:55 -0800
Message-ID: <20251203055923.1247681-4-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR05CA0017.namprd05.prod.outlook.com
 (2603:10b6:a03:c0::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: f247663f-605c-4e4e-c34a-08de32311f0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?znwcJcbUiEShEhC4OUTW1SN0ylfwv+s64n2Iw2ur2420EN6G0zdDUlogRfPc?=
 =?us-ascii?Q?xV7BBHamXc8K7gWyDzm2apEF+gMv5zNh+aCfGvRLCYlABn4w0/R0jlJB3d4h?=
 =?us-ascii?Q?yCLhqMBBfEgYNCnLolHJH/k+SMxcyUigkkEtK16nS2Oy0gLdGNUNemIxYfpM?=
 =?us-ascii?Q?vU2llVUz+23f/oFPf5T0K/371r5muxPeclzL1teUy7mhI7t72dylnwAdE4ev?=
 =?us-ascii?Q?dJLNpA4keO93RQUunUNVak4L4vQ9yMJbOaKcV9CJ9DvNOHXe4tCT4K2xrUfU?=
 =?us-ascii?Q?ugrbbowON2/ooyGoruA2+5f2NO1hGpCmZs8sEuBcOYzWwAoQqX5zvgOxNuy7?=
 =?us-ascii?Q?5yfGbEgJhhEDgiY10hDk311a+8WAn93Ea9n9PS68lGX5H5U/+MEhyPjm96+j?=
 =?us-ascii?Q?XrxKuyt00XsD5usjEwGEMODjsP8AvrjhEZZzuinXup+oCL631ScLir3L24fy?=
 =?us-ascii?Q?z4vrSMtaPfXQwDJ6lPPMBU2dNKeoJTmUYACP0yGhwAcSQNjAPIZhemqczq2S?=
 =?us-ascii?Q?A0fW+MYsBZD5ZYsFFERIbMBZGkjd757EtU0rojjy9ckFWUdR8ryWABDOCavT?=
 =?us-ascii?Q?6qJL8OWWId6P/3vBmh2ykX2fuuXe5SJJLmkw7aKcHWeyTIU7qAre1xCyFNA3?=
 =?us-ascii?Q?5TCZH4NusI+c2V2EE24VF7++Sa0+y2u8UtcyBk4d2qtY2szpDHEszjKWxUCt?=
 =?us-ascii?Q?OVfZ9Wjyf+jxCyb0QMjhqXlYLQRw5cYmH/DlfaqJcpjRyxEAs66kdcmamqKc?=
 =?us-ascii?Q?lC7swoltknFFe+JkmOLuyJRH5rIHBYjphtmA9tyy87Xx1NwaV1KvxXmm557P?=
 =?us-ascii?Q?y6yBxEloYf1tVim2tAmRAxdd+apbx2RYcNUTqs+Hu4266z9t19uRi2e6NfYV?=
 =?us-ascii?Q?hdRsFMv7FLhM+6P8nUCt8Nr71V2blORFKE/E5VUm5wLwQytTOTeUevFjLSBS?=
 =?us-ascii?Q?G7ch75eDl3PIDBhfiC3wuoAvgPShcKbm47qoxxRJDIC/kCCNAXK3CWuhNXQp?=
 =?us-ascii?Q?0uzt8SvN9kkV0a7U05IW3XZvIqPf+vPOyEIOkfLkZLg/Cn/FQWskm3PlYPdY?=
 =?us-ascii?Q?cQqpepMgEW67oyCfa2Ty1prjDBdvL8Uy5/Krpm0+J9LU2CtFZmto7CZlFjal?=
 =?us-ascii?Q?pckyDNdGp6cLhAUpszOGLgeGYEgVJ7WjzGOjNq/h+QGKkr5xgPH6T5YdPf3L?=
 =?us-ascii?Q?7LLooxvuM0hguzJUrIOC+Pn6KJYftsEMKsgNOKL7EpyjhUZTU1j7IzxP2Hhk?=
 =?us-ascii?Q?v+dI9ouD+K4LsK2PmcHniue18yucMOIGEvp4vlh5Js8JLc7Go5OqnOjE06Y6?=
 =?us-ascii?Q?9AyB+qSAAGPYJ6c9sTSb6XZMFftjyHNUsA5vgW6z9gVBAbcIkKz6laNRzsqk?=
 =?us-ascii?Q?0l1Nykz3vO3rAwQQXr8JTEddOSzBJ3XvZE1fd9xg7URbl3BhGReJ2fLatEbU?=
 =?us-ascii?Q?dh81CKmXkv0OjnENCu5qWo1C5NK/2M21?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X1iemU9QMrLymrppkvgPJsr8mBMY2O9V9yeo4YQ2q7bPfBO9iLPzPR4Nnkei?=
 =?us-ascii?Q?lj6ArI7uvIxqGj/9WR7dKU1D15pzbCMCbtPSe84ssY5eGUqmLzvgICFz7IJg?=
 =?us-ascii?Q?7rUBzQysPFQk+sL1nqTeyaeve+faso5VzAxKJqtqOUli+ss74BfQNJiK+RG/?=
 =?us-ascii?Q?X7kgGny94W741X5ADki1sv05z25csO1xS66c0VPrFw2rZ6Dx0bR1A9mKiKiy?=
 =?us-ascii?Q?pHR+eA3zYs291dv/PQjjHPHiFXOuFEPR4h40Mm5o/sjitmmvwHa/5SWcjPWV?=
 =?us-ascii?Q?FoQ5I9tLjRi0DsmHMH9BOvTTM+qmgU9O3YaIM99gjiZRZviiNrXPHtjqOyk8?=
 =?us-ascii?Q?IGqXRwNQ4PvNlUdQEB8RCxaviJFn5metrKGWdRMzfCI9MD/LQ4jriBjSlWPJ?=
 =?us-ascii?Q?gY1Gg3YomFYmvviJvFczslKJOt+6zSbeZAQk+Xhsh9OfujiUuKxtKPxc68I5?=
 =?us-ascii?Q?Uk0g1NnXChUqWorPGphzgUPUhT3ywbzlpQTkgI+ezW1DGZ0YnuGOYR2UEB8u?=
 =?us-ascii?Q?Ksc/HqksQhfLbKfU1rn15FHzIcIH+NAq9liwRvoTQgOjTUbM/I1PrAJJGpj4?=
 =?us-ascii?Q?sni1vZv5B+Qky3xu3J04HgiuxDsATnZOZKbhiAp7LpjPBNwVhMYjOWUFCSqj?=
 =?us-ascii?Q?4TosMFecznbmxVqz5jGc79UcYsSHPgc6GBY0vRUqlNvtdL8hI+T9QFbtd5Y0?=
 =?us-ascii?Q?1FQxpSMv1CQf/e39qVMB+gECeHVC9tzMJWVFJK5Lfdcx8pFyxwxPA0exNIkn?=
 =?us-ascii?Q?xYgVB+ZS2ucoqSMGb02J/gXKD/XCuTQV8e4/KeKD7pfCIIDRQ7ZdpgWFobQy?=
 =?us-ascii?Q?tst3Ju5pXiQCvUN1/Ul+97ki6NhG+Amm5nKMGHxW06eRqiwrwSTnemfIXz6t?=
 =?us-ascii?Q?VdH052UegxXk1HlW16EWB/H1aB9gSeWmM9Z9LoxUuStivD1vIK3lxL97QDVx?=
 =?us-ascii?Q?vSo4u4dfU66DK5KyRoJWXxI1rY2m6naIxYYvMTMlAYhWMr8bM78MY+Ji1f60?=
 =?us-ascii?Q?W6TIJZjAKI7ZZDgd5GEo0oD3Idk1FaO95oK05m38J2jQmjR4xwqsDVe/ss1X?=
 =?us-ascii?Q?oZeWaAGHwk88LO96oVLKl+G++qUxuDJI5M8fvkuq0vFDY0eJ7zh3aM7wOgV9?=
 =?us-ascii?Q?Skk0napSi/gM8kdUz/d7/mmcUCG5gyA54ls0uvZXbvessQER2QNbWqhdx8C9?=
 =?us-ascii?Q?epoezNdVpvB+KLtDIeZh4chO6V+Eh/8RONngc45PfCXgcElWek7FgX664+u0?=
 =?us-ascii?Q?dLEBqvjHLkoK3E51lHMKds0xEVhC4GxZM9rMXv6iTI54DHpp4eDEu7WqPorO?=
 =?us-ascii?Q?+u7mpUbMLp2HbkVqPH31Y+MI/5O4Ze2hpWF7Sb3J4JepFYe4HuwxRCuB5ros?=
 =?us-ascii?Q?oaTcNoXM9xS+39QZ9mDusn/YpPwfTdkPN/IOxTooV+Xqqnd81u5qkqcjzJb0?=
 =?us-ascii?Q?lNk7mzhLa4r7tUM2CS0Ft4ndMaIbXfAbQ3TL2sy9tMiy19RNR0wmVOXE2snu?=
 =?us-ascii?Q?XLP2PZj1c6yDz3yHtRf6lrsq6/rego7OaYsKcNUUd/DiNJK4TRBxVfYOHlYj?=
 =?us-ascii?Q?+3gsE/CWOrZIfDPIwSAs8Ub453pytXLNIki3PgJv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f247663f-605c-4e4e-c34a-08de32311f0b
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:29.0756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 317H9Xg/r1JpvN0Ds6BSLs7Uxc19whqFKymzEYYwjHIRc/QQAiQc50JyXBrVwSq5gwN0AwCP9uK543RQBQhWOQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8180
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

Hopper (GH100) and Blackwell identification, including ELF
.fwsignature_* items.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   |  3 ++-
 drivers/gpu/nova-core/fb/hal.rs       |  5 ++---
 drivers/gpu/nova-core/firmware/gsp.rs | 17 +++++++++++++++++
 drivers/gpu/nova-core/gpu.rs          | 22 ++++++++++++++++++++++
 4 files changed, 43 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 8dc56a28ad65..82558af1b927 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -50,7 +50,8 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index aba0abd8ee00..71fa92d1b709 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -34,8 +34,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
-            ga102::GA102_HAL
-        }
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
+        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..547f46b6655b 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -164,7 +164,24 @@ pub(crate) fn new<'a, 'b>(
 
         let sigs_section = match chipset.arch() {
             Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Hopper => ".fwsignature_gh10x",
             Architecture::Ada => ".fwsignature_ad10x",
+            Architecture::Blackwell => {
+                // Distinguish between GB10x and GB20x series
+                match chipset {
+                    // GB10x series: GB100, GB102
+                    Chipset::GB100 | Chipset::GB102 => ".fwsignature_gb10x",
+                    // GB20x series: GB202, GB203, GB205, GB206, GB207
+                    Chipset::GB202
+                    | Chipset::GB203
+                    | Chipset::GB205
+                    | Chipset::GB206
+                    | Chipset::GB207 => ".fwsignature_gb20x",
+                    // Non-Blackwell chipsets, which can't happen here, but Rust doesn't know that.
+                    _ => return Err(ENOTSUPP),
+                }
+            }
+
             _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 629c9d2dc994..c21ce91924f5 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -83,12 +83,22 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
     AD104 = 0x194,
     AD106 = 0x196,
     AD107 = 0x197,
+    // Blackwell
+    GB100 = 0x1a0,
+    GB102 = 0x1a2,
+    GB202 = 0x1b2,
+    GB203 = 0x1b3,
+    GB205 = 0x1b5,
+    GB206 = 0x1b6,
+    GB207 = 0x1b7,
 });
 
 impl Chipset {
@@ -100,9 +110,17 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
+            Self::GB100
+            | Self::GB102
+            | Self::GB202
+            | Self::GB203
+            | Self::GB205
+            | Self::GB206
+            | Self::GB207 => Architecture::Blackwell,
         }
     }
 }
@@ -132,7 +150,9 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
+    Blackwell = 0x1b,
 }
 
 impl TryFrom<u8> for Architecture {
@@ -142,7 +162,9 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
+            0x1b => Ok(Self::Blackwell),
             _ => Err(ENODEV),
         }
     }
-- 
2.52.0

