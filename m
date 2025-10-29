Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B9AAC181CE
	for <lists+nouveau@lfdr.de>; Wed, 29 Oct 2025 04:03:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1882C10E6DB;
	Wed, 29 Oct 2025 03:03:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jFcI9027";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BYAPR05CU005.outbound.protection.outlook.com
 (mail-westusazon11010066.outbound.protection.outlook.com [52.101.85.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A91C110E0D3
 for <nouveau@lists.freedesktop.org>; Wed, 29 Oct 2025 03:03:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RRbFyacQbi3TG3VAeFrZxG2FJAgXxttdjEgUC5G/RGMiv3eVUejirEHDVsIdGtN5NJA8ulxcdngMHr8+eAQcU5tvPG5zqOyIQdYsXgHWA5pwJnAslk6+jLAo7UEpmNk/Ji+CPkAuQ9LT+t2x5f/YCo3yKu+yz5xBa+RNAC5zGYRSjTozFoEzohvD02o1eAOncWIkaypmQGmJ6SWCzigHZoi1uFulkZUY7sEVe4Z15wwC2Up7cyTwO1u3gSzOgbROZ/rhq/BZ+lo4e0+DNrhl7qDKEGyRHXGd2PJY+sbRoNda0Af83HYP0wXd0kinoplNTnmMkuUApigfxzSfq1ijjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4JuyjEvWygAvsvjMgfFdAI6kVWxfLxZHSn2Ljau6Atw=;
 b=KuNyLGHa/t/iEFoyZpxlD00SyjCk46v79PH9gp4lkrdi7IPzQz5wbnN5ZUJ+3nIlAmXh3rKxxPRAI8oMECY87oRKdNJ+DgvhPuAWHYw/MJ2FwGjbph8lWl73jsuqL8FTqsfiVO5o2nMwxVYnr+Iu+CWVXX/zUTVUI49IqHAolItTWHBWKNyuDlOeNPhvJo3PeQXK9lWD+ZDNSU/EG4yEdHQv0+lUt36UooyA8yY430IgyrkkBdh4lmTh2p9mIu6zc5mepH+rLwTaOc3Hiv9WEyBxgPDjEn3IwEiL1+1iKT2P59W3fUwfpknsU0PQK7wui2EGlAjAb43zKGTnZt4ELA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4JuyjEvWygAvsvjMgfFdAI6kVWxfLxZHSn2Ljau6Atw=;
 b=jFcI9027UlVfp2AfdWlwhF6/BvP31ZUhNiSvg/BWHaNVjlaXIdQF5AktV5kOUmlzRBlIxfGCm/iYW3AcWSwqvTzqgWs8mw23w1oHjCYj4lk1Xlnn7cO53Vxp/JqaGc9jUycv9ntMpcYyRtEFKEz5OjqKZ4IJhKWDnkbmn5cmSFmUkhCJeABW8HJydi7Aod+fQj97sBRQ0uDaKizjp9l7+Uoz7+94RM4lE+0InSMCE0d87K8K9o74LBIkYzrms3c3aKmYkgzTMX8ykb3PL/TGDaNE5XgWWOTjI2SweUNDosIeY0yyxQyKKukjehf6sAdCjnhbrQ7qfECGXN6V1G1jEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CH2PR12MB4263.namprd12.prod.outlook.com (2603:10b6:610:a6::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9275.13; Wed, 29 Oct
 2025 03:03:35 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9275.011; Wed, 29 Oct 2025
 03:03:35 +0000
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
Subject: [PATCH v3 2/2] gpu: nova-core: add boot42 support for next-gen GPUs
Date: Tue, 28 Oct 2025 20:03:32 -0700
Message-ID: <20251029030332.514358-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251029030332.514358-1-jhubbard@nvidia.com>
References: <20251029030332.514358-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0029.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::39) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CH2PR12MB4263:EE_
X-MS-Office365-Filtering-Correlation-Id: 19e64fff-a2ec-4350-33db-08de1697c040
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ceShknxy2t+/QKh0kM1rH0Xvctiyeqyiom7ER+I1JWWW9SHJeiz5Q3cKqZJL?=
 =?us-ascii?Q?xuicz8Jlz8Aoz66TxdFdR8Qr7ezYr0THWYgWvZNL7xaTPUqgfwg3hL+4K0dR?=
 =?us-ascii?Q?u+bkxzJ60j68FPLuyuhsHx7E20uw1Xb3FsKEd/O8TaBP7d9UDV+gKGeTGWTO?=
 =?us-ascii?Q?It2eBuhBWWWDEuZvoQlXn1yjEZT6AViS6KIcJAtWSGQZOiQAZzj/igYElL19?=
 =?us-ascii?Q?sXWiy1x1dI2y55fK/NbmCkXensvlYKkWC3cQDnY9fvfra3hP/bEQnb0g4x/b?=
 =?us-ascii?Q?k0hvxemLitHc/2BOhHJ8I9mqMTPP0htlAjiHPpajzhpENleOyJ5LjLw3mP3L?=
 =?us-ascii?Q?dlMzkOKUVbDw9GauEl1igD3X0qcaLu6BPm0/dAnLsbuAqXsh5YctWsN+J3/D?=
 =?us-ascii?Q?0OBmIZW/TB1dlbcsuUfNuxLgwgtcHYaIq/ZRiv1yoP6I0G7EBSydYy0sFfQz?=
 =?us-ascii?Q?APn20bjWz3OED1cvpe9R4sBsJbs/sSesezSKFPqRKHliUkxivJrtcNZbru1Q?=
 =?us-ascii?Q?wUMtqsm6XTOCuSyzZ+xpmFGXvN1wVbBeDDzC9p0DBd1jA6PdfaPqpbH70HrZ?=
 =?us-ascii?Q?r8wmGthZR28zSrVnTvbb1732HHAVtMtq2CiFfIhZ9pD/mI46Wf7rwKoFHH2d?=
 =?us-ascii?Q?rSepxrBrjaWQzKdz+F6kT/gN//fPYGfSvy+BKD2L2e03cSvVCs5jKDz+Qi5Q?=
 =?us-ascii?Q?0Zpt/7VwrrQAwoGMezA/9Kp3uF4FcMld8nrJy218+hLLmVk5LQObhniBDY7R?=
 =?us-ascii?Q?MVxSECjhaxPObk1NebSz4rW+8HxHidfsmc93Df3lDt/VtLfdrymqKvvs4bkV?=
 =?us-ascii?Q?hq8vrQJWIqETpm9wqrkcKSQ6EdLoKrd+oCDIfkX2BWoAIFQXme0Ij13CG/xK?=
 =?us-ascii?Q?/DkjE34uuNRha0BmFirHXpgjTouboaqyjWa/EXrOIQ0wntC1o2jL9rLhgD2e?=
 =?us-ascii?Q?taLWdQhfiKtRqiF7GOc+p8GCl5SjrOGHuFr/5euQKEviyb+FOtwf+ie2Boik?=
 =?us-ascii?Q?WMsWErwJhZGmfP5Rky/jdV/tys7HZGrhSUv55EyGjfXDXa1RIbm7EXBP3BZd?=
 =?us-ascii?Q?G9D2mCxmELdSz9HfjoQk8QXEqIq1uTEr4MZk3sG6xrOahg2qlRfpymdSDDo4?=
 =?us-ascii?Q?odPAXHJ3Nbuzz3jD/74yt2q1FpjupSBTlcRUtMxYPqG/KaygNqNxrKWHIiwR?=
 =?us-ascii?Q?mHfoMGOxODQ04wajnzOYQ/Aa0JHlif49mwvOIbmvKz0f6ZJ4hhgzIorD7EfH?=
 =?us-ascii?Q?YuzCBah+4F+o66woDbQGh4WWM1QnyFIu7QIrbnM76zAORiXK1KiARZh+Y3DE?=
 =?us-ascii?Q?dB5SYC1G65P0Pt2Xc43lxPTT7EJBH4sIv+U5MA0DxszgGTgPswvd97PPaaL/?=
 =?us-ascii?Q?zcoLJG5KWQs4x6u0GsFrEIV/pWLybKcRBRhgreQpVSEN81eh5+e/xtHasX7p?=
 =?us-ascii?Q?8eDRR+crU3RzdclFW2G8sLpFHYx8eRe4?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?njiEj1eAL10J/zBoQtPZSDrZMWc49PLqCFrJ1I9EA7SESsXijgWKFkKTEhFG?=
 =?us-ascii?Q?f0RdnEpri1ZVs85r7Mn+2YmGg2SeRTxqMBsR3SMFtZOqaL8+OVVO/WOFrGue?=
 =?us-ascii?Q?GfvcUlJDlqye61Olboicgp1EeLKbl9nJigde61nIGGs2q+c/B5Xv9sitILW7?=
 =?us-ascii?Q?DsADpV3MwT4GRWOiQssMHLhwyhPxHBnxybmrOFMfdTGhFt+QStrm4X8+wlSE?=
 =?us-ascii?Q?YZfwJK4uAbk5IgK6wx+5t5gEH5ePCjlsyh0MpS1xGSDMmbWaahhK77bK7MBw?=
 =?us-ascii?Q?h6g3EH8yjwIkgeXhzju1lAltBmnt7rOC0gv3nw1lZqfuplrBCB0e52xnEvvn?=
 =?us-ascii?Q?C3bFwvbCXsMgxu3bHRPaCB8mweGTze7W0N0XaULON1o3vEuReTrgq9R5O1OR?=
 =?us-ascii?Q?N/nAepzZ/7OU+9qvU3Iwp5N8G1Bnsq2RMKjopXEr22Kv/mMXla2mpwhCn57r?=
 =?us-ascii?Q?IlnDq/IrW0+arM/IEcDlB2p3a8TigPzvouuyJYC8yA+fSal2Xy9iS4cOze+K?=
 =?us-ascii?Q?2IfoJS4hrCosD4j+uPKxHxj4ItZP8KzQpOk1wDFN/ChnZC+7MKW+9uz6Z5FW?=
 =?us-ascii?Q?rwFydXXHPEjaU6VhXJCg8iDsj2fQ2+Lvnv4NPwR1AIhXc3wZ8hAGyN37rjEB?=
 =?us-ascii?Q?hRjmPOCV74JrQwNPdwEqF2er8CQBUCR8jur/BWQEjk2aU3j8Z9ii/fDE2oLt?=
 =?us-ascii?Q?k3lsI3nhhiID6941KgIMeNhQREyIDk3vGYOPEfvKegA3zzDtzLQtP2MmYTLK?=
 =?us-ascii?Q?eTB1uJbPFGxNA+fnJ/zgS9ESMwzShLNcsQY21xxYoqUe9DdSC/es2QnFcCVZ?=
 =?us-ascii?Q?Gi2Smi88jfL36jat+5F1mBqQN32V8wNdrLPYBwKF0yrCYieFNhILOyiVY4nt?=
 =?us-ascii?Q?Eoi7/HJ+egtH1nPCYubSkyl11FutrYNSNmhNWU84H7dRUjZhqJQgxdYLyzV0?=
 =?us-ascii?Q?LMhrv3ZFbPfz+lXCxIghdflrZm4hS9npNBAh6XQbby9N+VXf8jqgib9bFAd5?=
 =?us-ascii?Q?m3xYE2nyqXQgFL71YIfhMS/HMnuOtHAIiGamHRtmp4Khtf1eCEIocXPFLebv?=
 =?us-ascii?Q?E0SYS2pwQLZE9WyWg79lM668jeKsTruuhb5XqbWAXYL7OcFY47al5WvEPuXi?=
 =?us-ascii?Q?1vDN0Wr+kP1DFPVk+NU+nBmV+tisoncuDmbQJPLUBREuyGWk77wDafpiQGYj?=
 =?us-ascii?Q?C6IOHutbPJTO1wuNluecqSJAM2th1XIyLd88SSSnrSc1JJhctJgVwZ602qbS?=
 =?us-ascii?Q?b/0hQVZaYU0GbwRB3/xQsD9N0ObU5Rj/lOjMaPPH5p0W/dX1ZjAlL6lIzhku?=
 =?us-ascii?Q?0cyOgk/j8FQ1obeKQJ7yyjAUDT2n3ddQ3lhbUBR1dFhgY05uBmCxfbmPrX/3?=
 =?us-ascii?Q?17wTKhWhfAUElxiSGgEyUKK//Sn2ueXwOYXepDYkjdTrwrdz9wgMGpVYoACa?=
 =?us-ascii?Q?PoQPEZvGJ/pwLbKYwORiNdOlR21ltEtbveeq1iJqHq+lUJdf67tl9agEQiaa?=
 =?us-ascii?Q?3NtHqcfMbvOBecp095kyIQNcEmi3LhYraCW1izS42UH4Zxb/mucbUbVKhwnx?=
 =?us-ascii?Q?QP6rCsv4Um8L5Q0oiHKzuh++Lcfq0lmVbcUZ/Upv?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19e64fff-a2ec-4350-33db-08de1697c040
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2025 03:03:35.5685 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BeXNUfz0gspju9fyIs9/YwLhuFf7VYomTclMSBfbK1eNSA+jWA3zrJMnbaCrd1vDqShQiXrvE2P8WtQ7U/giLw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB4263
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

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/gpu.rs  | 72 +++++++++++++++++++++++++++++++----
 drivers/gpu/nova-core/regs.rs | 27 +++++++++++++
 2 files changed, 92 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 6f1486d4e9c6..6762493206ec 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -134,6 +134,34 @@ pub(crate) struct Revision {
     minor: u8,
 }
 
+impl TryFrom<regs::NV_PMC_BOOT_0> for Spec {
+    type Error = Error;
+
+    fn try_from(boot0: regs::NV_PMC_BOOT_0) -> Result<Self> {
+        Ok(Self {
+            chipset: boot0.chipset()?,
+            revision: Revision {
+                major: boot0.major_revision(),
+                minor: boot0.minor_revision(),
+            },
+        })
+    }
+}
+
+impl TryFrom<regs::NV_PMC_BOOT_42> for Spec {
+    type Error = Error;
+
+    fn try_from(boot42: regs::NV_PMC_BOOT_42) -> Result<Self> {
+        Ok(Self {
+            chipset: boot42.chipset()?,
+            revision: Revision {
+                major: boot42.major_revision(),
+                minor: boot42.minor_revision(),
+            },
+        })
+    }
+}
+
 impl fmt::Display for Revision {
     fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
         write!(f, "{:x}.{:x}", self.major, self.minor)
@@ -151,13 +179,43 @@ impl Spec {
     fn new(bar: &Bar0) -> Result<Spec> {
         let boot0 = regs::NV_PMC_BOOT_0::read(bar);
 
-        Ok(Self {
-            chipset: boot0.chipset()?,
-            revision: Revision {
-                major: boot0.major_revision(),
-                minor: boot0.minor_revision(),
-            },
-        })
+        // "next-gen" GPUs (some time after Blackwell) will zero out boot0, and put the architecture
+        // details in boot42 instead. Avoid reading boot42 unless we are in that case.
+        let boot42 = if boot0.is_next_gen() {
+            Some(regs::NV_PMC_BOOT_42::read(bar))
+        } else {
+            None
+        };
+
+        // Some brief notes about boot0 and boot42, in chronological order:
+        //
+        // NV04 through Volta:
+        //
+        //    Not supported by Nova. boot0 is necessary and sufficient to identify these GPUs.
+        //    boot42 may not even exist on some of these GPUs.boot42
+        //
+        // Turing through Blackwell:
+        //
+        //     Supported by both Nouveau and Nova. boot0 is still necessary and sufficient to
+        //     identify these GPUs. boot42 exists on these GPUs but we don't need to use it.
+        //
+        // Future "next-gen" GPUs:
+        //
+        //    Only supported by Nova. boot42 has the architecture details, boot0 is zeroed out.
+
+        // NV04, the very first NVIDIA GPU to be supported on Linux, is identified by a specific bit
+        // pattern in boot0. Although Nova does not support NV04 (see above), it is possible to
+        // confuse NV04 with a "next-gen" GPU. Therefore, return early if we specifically detect
+        // NV04, thus simplifying the remaining selection logic.
+        if boot0.is_nv04() {
+            Err(ENODEV)?
+        }
+
+        // Now that we know it is something more recent than NV04, use boot42 if we previously
+        // determined that boot42 was both valid and relevant, and boot0 otherwise.
+        boot42
+            .map(Spec::try_from)
+            .unwrap_or_else(|| Spec::try_from(boot0))
     }
 }
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 206dab2e1335..ed3a2c39edbc 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -25,6 +25,18 @@
 });
 
 impl NV_PMC_BOOT_0 {
+    pub(crate) fn is_nv04(self) -> bool {
+        // The very first supported GPU was NV04, and it is identified by a specific bit pattern in
+        // boot0. This provides a way to check for that, which in turn is required in order to avoid
+        // confusing future "next-gen" GPUs with NV04.
+        self.architecture_0() == 0 && (self.0 & 0xff00fff0) == 0x20004000
+    }
+
+    pub(crate) fn is_next_gen(self) -> bool {
+        // "next-gen" GPUs (some time after Blackwell) will set `architecture_0` to 0, and put the
+        // architecture details in boot42 instead.
+        self.architecture_0() == 0 && !self.is_nv04()
+    }
     /// Combines `architecture_0` and `architecture_1` to obtain the architecture of the chip.
     pub(crate) fn architecture(self) -> Result<Architecture> {
         Architecture::try_from(
@@ -43,6 +55,21 @@ pub(crate) fn chipset(self) -> Result<Chipset> {
     }
 }
 
+register!(NV_PMC_BOOT_42 @ 0x00000108, "Extended architecture information" {
+    7:0     implementation as u8, "Implementation version of the architecture";
+    15:8    architecture as u8, "Architecture value";
+    19:16   minor_revision as u8, "Minor revision of the chip";
+    23:20   major_revision as u8, "Major revision of the chip";
+});
+
+impl NV_PMC_BOOT_42 {
+    pub(crate) fn chipset(self) -> Result<Chipset> {
+        let arch = Architecture::try_from(self.architecture())?;
+        let chipset_value = ((arch as u32) << 8) | u32::from(self.implementation());
+        Chipset::try_from(chipset_value)
+    }
+}
+
 // PBUS
 
 register!(NV_PBUS_SW_SCRATCH @ 0x00001400[64]  {});
-- 
2.51.2

