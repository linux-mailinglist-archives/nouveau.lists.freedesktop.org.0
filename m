Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18C3BC3907B
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8296510E7FB;
	Thu,  6 Nov 2025 03:54:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G/GOHRUQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011064.outbound.protection.outlook.com [52.101.62.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6323710E7FA
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uSovYzppfF3u4VOuean/zKFUCmYkVwEujwXLFwgHzzvUKC5HyBwK/0jv4fDQv4898oDie76jHwnUbmV/KFRf4uI3d+IC4XvqiE6x/TVpTPrWO4i/1DRLqjttZ2SGzhjR5Zh21r1aFuYyTKLKFFv9nD0yx0PkVnRTiNJCHbVm1oB0OX6O7qidgHWuOTZ+bv6jVll+CAtMpsF+0hq2MesX/eUXWibCbIc/pcmED8vVSNFvjiRB5SVZ5VJlgQNmp4br2b8u4BJ5ONad7VvZG1w0hB2Jl+tjLL4Sy6Bnibu1MVqfLNYjv8D0S3sW8wnA2iwZFSd30Km/evZtK3RS9wJ2IQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fMB6k69rifFSOH2Fy7JdiRrzvThq2aLwm12QU5ZcaIY=;
 b=EF99U7FGpL1d272CEbewokjPNPL+Oe5sIwH4Oedg2HXF0OD+OF7JeA2S5NAIUHEMcvdrqctlEbD9feBIUuj124p+z/i36inM3oxbVmbuXqrewxSsgRaiLvEZBouHd64gR+YLn8/Zk7euDQbXQvrTqPz63IWe5eLFg8smUiDpR6dX8HcedRjMqRXT02eWX6K/2NeISBmnG6twYmgFxuNO1ZS/QIPaCyT93LC93DFQVoQKei25BwPtAAofX46JU8iliqUX3zfA4FMADuox2MT8owoBM7B/NMQUlncm+M3miZmeQlPRog9zXMM7sVBeDBhaPw0wLPQmMHrntAJU/Fl8MA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fMB6k69rifFSOH2Fy7JdiRrzvThq2aLwm12QU5ZcaIY=;
 b=G/GOHRUQSx1I9VtnjvvtUTKgYaq+IhfOiMazl613kAY2QgPUB2OTIPO0wuiDBn9W8ilUmyJ+szZEGRCzlJOkZYP6otjYrUvPYhTLGYwz0mYxF4ImxCgfRAu/5Pj87KonLn46GYtGiEsnm6/L7s9Mv2+WPUWDRGUEdKqJvIfOJkNzSsJrvsQDeBYhSvJuSS8OujrW1W+Mz93dn5TEATq3FsSO4SG3vxktK3OojvRzc4xBcuaSCJQfNE6BDA4CrKw3FiLApFJIkQio+Rvxk7oEL8Nd72DRYWRPkOi/1J35bQpCk/j7/BQgoLbUI2Pzu5Aq+opDkJANLYrHYl3GpNOq+g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:43 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:43 +0000
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
Subject: [PATCH 6/6] gpu: nova-core: use gpu::Architecture instead of long
 lists of GPUs
Date: Wed,  5 Nov 2025 19:54:35 -0800
Message-ID: <20251106035435.619949-7-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106035435.619949-1-jhubbard@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY3PR05CA0022.namprd05.prod.outlook.com
 (2603:10b6:a03:254::27) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: 5d0ab569-fad2-4fe0-82b1-08de1ce837d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rGA7qodWVik9sQP28dAELiuSys66lK185iC2NP30A1hvzGtR9u/HBNCf55NW?=
 =?us-ascii?Q?H5P86WcDjPEPUgap6RyYb7MrEAxgMuVa/y8xNLC3S0ORZ5s7W+YLOObToUWf?=
 =?us-ascii?Q?pv0/gkinez4rxHHY40Ud6F7BnUHc2yvoJgYk7nfiCpMAizuuZ3ML/r/ndklP?=
 =?us-ascii?Q?kGff3Hd3fg5lLlOgmIZ9A1VD9LUheTbykOb3hDg/9aiufbDp7okDGxhIFdPT?=
 =?us-ascii?Q?HaNtHn5dvFo0ENOjs6e7A90mrBSbRcv764Mb16w6mTg1TNddbmuoQF678M6V?=
 =?us-ascii?Q?q3YvWStEbGB9u88vRwyrCJDWuYDNL7nVmKYR2370EZKJRAKN2chANFgppfLN?=
 =?us-ascii?Q?JHxRHNy9AbWLbDHNDd8xJYwPEZLwM9S5Sm/JhkXnpAQTk9krvRyxHOUKsF0P?=
 =?us-ascii?Q?fLnNqgtkMD2dNA53G2ae3vdEzWQL3nwxsTFn3CqjNkkvywNnMM6Wqf77kNTe?=
 =?us-ascii?Q?3oPcaNVYGzBEm4cTSeJFuOHgWCMtCZRKbGGuHMA7YcluZc4xIeOmVq4L0X9F?=
 =?us-ascii?Q?7mFfZLYbeTuKJQjiWvLwl3MH37vFYeXW8k0doOZSrQxnV2zVIde5uU/FjI1w?=
 =?us-ascii?Q?ifN2DCSB587PMXdsfPOqaPZb8J5F1k4/plj6zvPe2hN4YBERGU5ONFpoUI7z?=
 =?us-ascii?Q?3T63MKmeiZhBwn/335NOpmZAEeBkrpjiTH2Vq3BZtPUdnZ4wTj6aHOxzQci8?=
 =?us-ascii?Q?JodXofk0YfrKUt4CyjCN9uNH7Yuh+dxagCwdB0bs+18GAQHuOAx2NXWoVyoN?=
 =?us-ascii?Q?fXRuChapHcDhXVtAh9peI6laE/nt+jqlxkjd5q1lm36DMchae7503qy2Z75H?=
 =?us-ascii?Q?assAVA+VSSAoyZQmaSR34xWcqo1wEsDaCmtkyV9SfT+joRseplRqFHKLPwyd?=
 =?us-ascii?Q?DRSUc3bJH55/RdrWjqh9C4C0iLQ98AT1Ka3/yZCQU8df8c78xaDBHGUDEdgd?=
 =?us-ascii?Q?Dk+VaK16uQ8PNWuBLMM0940hdWui2odqeHmZbLigDDnMRfmho2DkkYisHHJ1?=
 =?us-ascii?Q?bnQxDyRXa7e+B4jW9QOFgCadhzwtL3wLMJmz6fh3LdZGgwhDG2u6YIzqwD/K?=
 =?us-ascii?Q?hipn3zWQL9/zRp+jSX+mYpHqojLGimQdTZatWZ+tBUUWcgrRQYzUQVlI2558?=
 =?us-ascii?Q?SRRu2xOk3HdNEoVdEPG7iS20+hHQX9NokDMELoJ7gC2QZxW1CRzM9yTUXMUc?=
 =?us-ascii?Q?BVubl9s5Mji53d8mACfu2JPmICL/eAntqzezL5CwxBIsSmG/EqFsXUnbWGC4?=
 =?us-ascii?Q?WZLelqa1edoGSr6haaKrqVXJPcigSzqtNcG0F1xIOYYENYPaVnwi7feKCH0Y?=
 =?us-ascii?Q?QFb3fYu4Kkh8K9kBnGEnUr0PHs3zYuH2EY8NQD26ixEkk5kcrrSexmMu5508?=
 =?us-ascii?Q?VncbQcOU1oNhMzfgOAEkP95XcMCyRwB+QbqlhI0/ghH7xiwQ9gjWs0ybN4nn?=
 =?us-ascii?Q?jig5a/ZTHd/HzzUJfGMrclnFPLivUBMQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WkfMncrGyQ26Rl7tkLMHG+zwQW6V6itEyIc1xMJaRGsk8zEDxJbEmh1y4IKD?=
 =?us-ascii?Q?vvajD6iiSodlhdG6KC8rv5D/3wJB9TAma/RM6QW/QSB32yhlroATJ+2rOTM0?=
 =?us-ascii?Q?mrlIevJL9MYN9HzhZYVZb8Gsimoyh+YGd1ywaH2JuHJGcSY7HUruxklK3IrE?=
 =?us-ascii?Q?n8vnPHxwQ8FCHOC3iZkfah7IwkttoGoKXmxkYqeBAGhq7UJNQ8LGvsfVH3Tw?=
 =?us-ascii?Q?UZYjMBaOybOAcH5Y0b5hyngDUqt1wX4519vp7IPyBBdNaaWtnmzS2dJUFHgO?=
 =?us-ascii?Q?V2EaCelEksvkTuJTDHaIYbcd8p4ORaG9GXu3XyLwq1SLpSPo5HPZjo9bcZjX?=
 =?us-ascii?Q?H0PWhimZPTxJpLJftrYEb97YLu14vnpdVOsow9qX7xY/H8d6l2ZY+kkHl/7/?=
 =?us-ascii?Q?QcK/ZiKCrw1f8OmruSLurmjSp90o4MrFia6uv5YbLNm7yhnVPPSFW/TQdoC4?=
 =?us-ascii?Q?zVIuY8scDw+sHoxGzcfjjd3pWQ6NDWh75YiLvTwqdI3zZNR9OKv+nDi8wgmY?=
 =?us-ascii?Q?IDcrITmswwtI2eARGzsOLr+u+K7Hn3LrkeMp2s1qCHTrIxBKS/Z77dJPBCdd?=
 =?us-ascii?Q?rcw0aWUOM0pOaedXaye/YecvZUf1iYE4Ek+MFzsAga3TM74kA1vzQI5jjtc/?=
 =?us-ascii?Q?vUPlC/W2dCk27TlG+0/bEf41MYzNxzCGCWJ1VNdngY4HlD1jQCZsX2+OgkM7?=
 =?us-ascii?Q?igs1UOaOxicbnk/q1g3tcP3f3Tg9vDu3JN4zPo4euI6HFkueGjfZCIrFOB+D?=
 =?us-ascii?Q?8JTY1oE5Ero8QGyKz/tBLnVPkDwyNoRhU6RnzwJFAClToTFM40GyMYmUauOm?=
 =?us-ascii?Q?peC5ZWs708jfwtdrL6itTWqLh5U7O35vF064lQ2J/TCfXB+MFAXBhJ/hzBr6?=
 =?us-ascii?Q?6DcHBET641sZ85rCOGnpMbCFIBDDn76y44Dgu8UmxSDpZtyC4sc1dyMfK+W0?=
 =?us-ascii?Q?hECb7AogcjRXOOz87dUB6kU4wo/ne9uar7NDFfrrIL7RYGnavxeL4eG6LEVa?=
 =?us-ascii?Q?w3iXcWEX8FRKm09uSkPM7M0sh8HZUOWZTOxlG8y6eGx8pq31NaMUOhYLQ5rF?=
 =?us-ascii?Q?3ox4wP3qP/6d6ErrKI6WzSWRDUbE6IVj/XuTSLEm/veVYDzEpKMzNpKdfCYM?=
 =?us-ascii?Q?nLGWBsR2MNH8uaYhBSpICqzWLvwWH/Qsb2PZiKIvPHK03cTaHrGLBDZI8eqv?=
 =?us-ascii?Q?YyNFDosdF74pIxTPH2npnxT6PAaSgRmhfRqxi4MTsnlXR+yeGf4OMTF/zzss?=
 =?us-ascii?Q?I6jMYidd+9KvujqKtq1bR8JZjkBUCspneUOiV4a3lheNZGfqtE7/katuXcBa?=
 =?us-ascii?Q?Vcb26V+uEuzEPtuHt6InQR2+NoFTMYik8j3XKGw75XdyEOObEotjHTUpX8DA?=
 =?us-ascii?Q?KCfS7w/vdtzjFYfsA1Jv2Aarw4KNy0Nv0vBuQHch2T+mYXjw3rXrNgIGe2Lp?=
 =?us-ascii?Q?zb1GGLUhbgfUA+5wiR4ypy9hkQGGph8+s0gGwFMCeUmLQb8xmpJyIoyozVK7?=
 =?us-ascii?Q?XeFC0uywQJlnoLowrCcB1KV5Iiyo6bchi33CFr/b6xdtOtjjWh1x7jUN9fPl?=
 =?us-ascii?Q?r714bVpHgdx1jk6zz6NaF9tGsBPQNfdJhvOLWolj?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5d0ab569-fad2-4fe0-82b1-08de1ce837d7
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:42.9165 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8Tm0w+oO9gLQrgODovSkrdDRliHcwt12f8LpNuZYrUIcw9FN7zH5/1pA6NPV9yv0b5cAung2ymDgUJ8qZR8LVg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6622
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

Use Architecture::Ampere, for example, instead of checking for
membership inside an exhaustive list of GPUs of that architecture.

Also, apply the new "use" multi-line format.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs | 15 ++++++++++-----
 drivers/gpu/nova-core/fb/hal.rs     | 20 +++++++++++++-------
 drivers/gpu/nova-core/regs.rs       |  5 ++++-
 3 files changed, 27 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 7ba8ba856c72..08b97f593a8f 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -41,14 +41,19 @@ fn signature_reg_fuse_version(
 pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     chipset: Chipset,
 ) -> Result<KBox<dyn FalconHal<E>>> {
-    use Chipset::*;
+    use crate::gpu::Architecture;
 
-    let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => {
+    let hal = match chipset.arch() {
+        Architecture::Ampere
+        | Architecture::Hopper
+        | Architecture::Ada
+        | Architecture::Blackwell => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
-        _ => return Err(ENOTSUPP),
+        Architecture::Turing => {
+            // TODO: Add Turing falcon HAL support
+            return Err(ENOTSUPP);
+        }
     };
 
     Ok(hal)
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 30fde2487d8b..dfa896dc8acf 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -27,12 +27,18 @@ pub(crate) trait FbHal {
 
 /// Returns the HAL corresponding to `chipset`.
 pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
-    use Chipset::*;
-
-    match chipset {
-        TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
-        GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107
-        | GB100 | GB102 | GB202 | GB203 | GB205 | GB206 | GB207 => ga102::GA102_HAL,
+    use crate::gpu::Architecture;
+
+    match chipset.arch() {
+        Architecture::Turing => tu102::TU102_HAL,
+        Architecture::Ampere => {
+            // GA100 has its own HAL, all other Ampere chips use GA102 HAL
+            if chipset == Chipset::GA100 {
+                ga100::GA100_HAL
+            } else {
+                ga102::GA102_HAL
+            }
+        }
+        Architecture::Hopper | Architecture::Ada | Architecture::Blackwell => ga102::GA102_HAL,
     }
 }
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index fcb319806391..deb9219ea126 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -11,7 +11,10 @@
     DmaTrfCmdSize, FalconCoreRev, FalconCoreRevSubversion, FalconFbifMemType, FalconFbifTarget,
     FalconModSelAlgo, FalconSecurityModel, PFalcon2Base, PFalconBase, PeregrineCoreSelect,
 };
-use crate::gpu::{Architecture, Chipset};
+use crate::gpu::{
+    Architecture,
+    Chipset, //
+};
 use crate::num::FromSafeCast;
 use kernel::prelude::*;
 
-- 
2.51.2

