Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92C0C9DD82
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 06:59:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BEB610E713;
	Wed,  3 Dec 2025 05:59:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uo8B3x/m";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011014.outbound.protection.outlook.com [52.101.62.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1FBFA10E70A
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 05:59:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NYwQ1YeiznXjb0OROkGQrOtZE6+20zViUWWyY3gCf1ID4/wCRrr2w63R7FVtsCY4rXtYnpmOGX0ZSRKRr9B9mzOr2jlwNdBriM1QUAclHiFklq3IIjAbWoSJF/LMJg/srCH8qsi/xCp5F0LrxmputQ73D5jCgo9f3UAW196bdbJq/4SofBfCI42rrZihXY6qmP892wC5NSBEDhmWg8KlCqSFxUqKTmqgWyZ3i/HTJo3kSkwqUZZ9ISFPhn4eoiuIMrtUyQ+kvbw5gJ6irzH9z3r1qxcHcbgMZHXzq32p7gDlwg04JQADrY9p+Ycvzqku0jQl5ZACALvt60f2dZf+Iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d97c7DCQLklRIH9zlzr3fxq7AnL15SQKze5w9FarKFY=;
 b=v1kFj5hA7DPaV4GeryagCTscx6MW4uaulhO9Hw4mHo6p781UcJEeaRil/1bkLAdeevGof/2r06wigFLz6PXNserQWdBsWmpIcVR2qVxQFUpzTVs0ptcJeLKLpxSxFwH/KL7VfkW40XAoS/mCHZKhgl69V/mdTcbiyisETesX8EzKnLKZdkTdYTZYli/nb7wrdFTUr3+F1GYsKmXeGuTBgWV0zeXYivm88CLQeQprDByqnylc2Y6C+i1vZuqUm/cbDZ5T/V231TmgieJ5H/a6x6ujB0sK1eUPHcsq4KBErtD/JS7yOMbdvh5L7p83FrtZv9PMOURhQhSamS19ZnvZ5A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d97c7DCQLklRIH9zlzr3fxq7AnL15SQKze5w9FarKFY=;
 b=uo8B3x/mBA/BwY0823vgP6RUNNj1GYkthKV9Xla3//28UwHaF6mXOXrG7SLJxlWvVmRRgd3utivs7FkB6kTy/7xkkga3xl0src5RsXnvAh+mtneh55uO5Maoe7kEaRVcsGcxjzybGwao82N5YTD0dXlTO+NUrCHaZ8bFXGe7A/MwmIsCdrsuswJa97aF2wcmg2I3EYVHabnG9048r9vYy0OVh86PzKiRuWogXFMi3dNNcTmPLcaNTxbd1kaCFXA8zrj+9uZeauRlrEEaK50qngfKOftJWMQpFcIafyw+iz6pJt86VEF5Xa9qqW0Hr16mRBm2MaxpyUgbu5jKn1uxLg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8180.namprd12.prod.outlook.com (2603:10b6:510:2b6::7) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.9; Wed, 3 Dec 2025 05:59:40 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:40 +0000
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
Subject: [PATCH 10/31] gpu: nova-core: don't assume 64-bit firmware images
Date: Tue,  2 Dec 2025 21:59:02 -0800
Message-ID: <20251203055923.1247681-11-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0P220CA0026.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:a03:41b::30) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8180:EE_
X-MS-Office365-Filtering-Correlation-Id: 43279a9c-cc64-41a9-41a8-08de323125ec
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|7416014|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?539oiJAW34fgV70GbVmdFwNuPY3REw1WdkTJ5Ya3FqukUSoozM7sEwQsBo1h?=
 =?us-ascii?Q?hXucmUthIGj+lzqSx9pum7Wi2rkFHhKfUw4bL9pCw0IWZyW4D2qWFCmasmPB?=
 =?us-ascii?Q?d/3qyOYU+zzX0fZE7VDVAIYE13h7aDgRpLYh5V5LESQMZded7tzi1QyZ0sLw?=
 =?us-ascii?Q?brMw2xPnD3ESN+rKX0y+Lz8jGjCY95jVQzhu/bT4enlQLh7VmNLE87aVmE9U?=
 =?us-ascii?Q?jFlejUGWgcb0xdv39jHk+i1UIxIbqUBMuwgVo2p9ttki0sYtwFn+jmMtHqvO?=
 =?us-ascii?Q?5tlq6JVo1vp/RIfI+ktza7FVEythRToRVMO+vQbNUd+ruYdgAwEo+MixaNbG?=
 =?us-ascii?Q?JaCR0asUdfOEOz2eFrQjXc3YietN50lW3l2lPfIbfwW1b95BCSxEotxHQXPL?=
 =?us-ascii?Q?DqRe1E2VLZBH61rB+WUfzturszcUn1oGrH0fGeAJhWHp2YzWj4tpwKIhpVjr?=
 =?us-ascii?Q?TeEzMdhBn7XKpbIOyD6umpe0pl1hXu1wRiHh5DOKeXnBVL1cEeGb05N7ScpS?=
 =?us-ascii?Q?PEQlx/29jRhWMa3ww8gJkMZ5/SiTMWoNsF3RTUWQ9SUf92SoBgppz7ekKber?=
 =?us-ascii?Q?GrymQC6N3A2RNcV67xPvMLgLrk9ZFkpMpFg66AmcNDn60ZQ6vZhsROslB7J3?=
 =?us-ascii?Q?Y6IAryHdg9LAvUCov15hX/PnqRG/rajy1jlEXU3wlJob3hkR5vKbCYuSQwpd?=
 =?us-ascii?Q?Wvs6ZG25uY1w7htKcjPFaPrt4vuIHBpmiFBYHRZHOvdt/zVYJ5W5CuXRzpON?=
 =?us-ascii?Q?wFk9FGyAb8dB+l1mQi+H1SM42Oki0b7JMGtxdglHmVx9aoyO8fCwuB+8DfLQ?=
 =?us-ascii?Q?YvGt1IFcNFXoZX8taH7ZcBV50+lAYhcXovIlJzv8i3YfwkvQgymjDugPenB/?=
 =?us-ascii?Q?0ZUTuJ0d4kpiK59mAeQgNu6Tk3Nn9EtyomiozfbCscS3AR3PohODrjkVKcO2?=
 =?us-ascii?Q?/2BylEHZr58/MV9FY9Xnq55aMgjYHZ5rCJvCGg4HsslZKIV4jbj1YrhsPpaB?=
 =?us-ascii?Q?BL6NlwyUbvDvmqxkhKUEawvvsxkIDwGd37RTbnf6nfBUEzypBmcQsfBm8eHx?=
 =?us-ascii?Q?sy+0yhJKIyI4RjJSnOWvo2YiNP1ZgUr3+bE3zWDm36oISIAntoH9MdBDLqco?=
 =?us-ascii?Q?8Ck4lSsrNLdKM/2z8pFvKKCIPoWpcq7an6jjxzarZTyJRDQzT//Qne9eUPfY?=
 =?us-ascii?Q?re+RtKP6msIwIqx3VKqVFfuzkMfN2odqgXBVqr09n8XwzJmiCmuUFmr9g6dL?=
 =?us-ascii?Q?EjRmnXelEJvzhaS7crLfR5ab9HaXfvlFzZkNqyNlkTu/KG5vqeHvYSF0EcMA?=
 =?us-ascii?Q?J7N1TXTc/Jroivmzrr5NeeM+BeVhklUP1kfUj9e35fWuMmtIWw3xAjLB4OX1?=
 =?us-ascii?Q?uUUCXPuHvhVZCwzqW1fGmfzO+wx6VJZzPQ9u/H+9KTdhT/lnIPEXmFf8+LAG?=
 =?us-ascii?Q?hYQ+oyLW+O8abNDq0YtguE6Pqf/UtY+Y?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?yP2/KpVsGOVKyJPnW+6LYegrAcChQA5UZLCwsx6I5+fUyyRY6RJI/yoGP878?=
 =?us-ascii?Q?2V3I0o5TVteo+CuTfjBj5V5Pkt3kAsizy2pBl8UrUNvvWnAxHxNyG0+vxm6i?=
 =?us-ascii?Q?jM2F4ZjBs7tbko+2PHw6f3YvdaCjxDy6VXVetwDyLElSheqkD3ngCNuSt2B7?=
 =?us-ascii?Q?3PCPeIcQYHS/ZCNLIj6sqZi/UTTlXJ+9X2/djixnxu9DsVXmqM8cGsnLdcMR?=
 =?us-ascii?Q?jiM9BVBWFDhsWDyxr5AdfRHSKQCvzO4mMo6GtKNJ8Yyt7PVR2PnzqFF6VrRS?=
 =?us-ascii?Q?L/oQyvSMl+MCcCNLtr5LMR3IREOIRI1LLHyZiK6IODJHCOyk19SHjEbXFTcA?=
 =?us-ascii?Q?V5Vg4VuoBW5vpBFyjIg2QVzCa3PCnLQhSHgWqtwhuSrYvD0FO3Ou4KgswMBR?=
 =?us-ascii?Q?eiSxWUfAEpTy0M8feu1ZM+JIvywbtaANnaPykfgUSJwMmB+nho4LFxy9E++O?=
 =?us-ascii?Q?GGL6Ag35apDNQDMvI48TLhzyIn5mp9HBS2dsCf2Gtvo0XNlb7/WpmiLo+BYF?=
 =?us-ascii?Q?UxxvrgBO08gIZh0qJLapbojUpKIzr8k4OLhYfGKddAH1mk/MnGJky7SMbUde?=
 =?us-ascii?Q?ddbd8tXZcUf9yvMPFxT6jsGCmubhCeBmZ4TgCrDn6N1ywFQn/niZ+XYf+ADG?=
 =?us-ascii?Q?CvjyhRLyeFhwQS+Z87Dtg7xEVWCsiLwWdvdg+6clJ85m7WrqIDxaM0uus194?=
 =?us-ascii?Q?+S4dBf/iKI+snCqwTtjlkHWUwSn+mTHutyvu56hBBfYJSo0ML4AnPuWQt4xp?=
 =?us-ascii?Q?io+kDiORs8OAlRh8Dea149CEOEi0leuChzQascGBvGGZ3ZN8ThahsdCl55tw?=
 =?us-ascii?Q?+Nq1qje2yhg7t3TR/FPtWUMZpbbCIkwHjK5liCpdu53L4iNr1Iga9FqhAfpV?=
 =?us-ascii?Q?1CxAvn8PnCo0fA3szVSPdk4Lq2u319aHkNMgHdTN8Nj2sMhJO18uKpBV7s7T?=
 =?us-ascii?Q?fZZ1DxpCuKSS6VW06GgkEbUsDt4cSy6kkiI+LG1d/ZYr1/j30LTFajP6Of/y?=
 =?us-ascii?Q?W25+Cx4lB2filVAku9Yn9tdA66RMOu1knG8ygiwqJ2X3bmIeOqZfkQrsrpqS?=
 =?us-ascii?Q?R9EsGLlNdU5Z6k6/Vorgiuy8n+EbpEE2FiJzT5eg6jyF1sX5PCPFsiD3OsXJ?=
 =?us-ascii?Q?h7oXuDWKngz+0AqLekTHx657Grgv7oWDGfSp+mr3hCUMRl0xM+9dn8TQ2h8X?=
 =?us-ascii?Q?rlMwAQIKaM0h31cp3X7M1aBU66+OWkm2iq/r+rSUZpDYr+fpeY+MJCgL5X0v?=
 =?us-ascii?Q?mViKSJa4MbZhA6of4d5xp4i9Krn2Xrogktr+7K5HzR/8M8Bh3jZ5ANuRihsF?=
 =?us-ascii?Q?cJ1a+KXaCaFVmC31pFnfSQdJGakt3Y86igApgdOy2JdmyI6CGBvbDwVBTfvr?=
 =?us-ascii?Q?aXv3xOdM8SDoV4wm7QUR9/gwNSn779HyCY6UOFv4gUW7C738zsMCfP1+z8BW?=
 =?us-ascii?Q?BFsLLy0sogHRqfbLH+4SbL6JWoa/B5OqhaXbICP404w2PNyQuOk5elEhri6I?=
 =?us-ascii?Q?c2AA91tfVYiJoVB7ABkj98Vd0m+W3XQ/ZaczFJz2kCcr3g8YfSCyAVlwK4e2?=
 =?us-ascii?Q?CbZnCybNb6O6Z6/c6VVIJKkREUHNbkw7wHjZLvNW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43279a9c-cc64-41a9-41a8-08de323125ec
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:40.6010 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LYisyQCznJy5tUM6b5eeLw0gba8kqx8G+eklsqtmmgBshvnUjeFP9/y4gCwLLtn0Tx+RWllf7s+g3vMLTrEAOg==
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

Add ElfHeader and ElfSectionHeader traits to abstract out differences
between ELF32 and ELF64. Implement these for ELF64.

This is in preparation for upcoming ELF32 section support, and for
auto-selecting ELF32 or ELF64.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs | 118 ++++++++++++++++++++----------
 1 file changed, 80 insertions(+), 38 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 5ed079a45ec2..1cb5897778f8 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -256,17 +256,60 @@ mod elf {
     use kernel::str::CStr;
     use kernel::transmute::FromBytes;
 
-    /// Newtype to provide a [`FromBytes`] implementation.
+    /// Trait to abstract over ELF header differences (32-bit vs 64-bit).
+    trait ElfHeader: FromBytes {
+        fn shnum(&self) -> u16;
+        fn shoff(&self) -> u64;
+        fn shstrndx(&self) -> u16;
+    }
+
+    /// Trait to abstract over ELF section header differences (32-bit vs 64-bit).
+    trait ElfSectionHeader: FromBytes {
+        fn name(&self) -> u32;
+        fn offset(&self) -> u64;
+        fn size(&self) -> u64;
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfHeader`] implementations.
     #[repr(transparent)]
     struct Elf64Hdr(bindings::elf64_hdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64Hdr {}
 
+    impl ElfHeader for Elf64Hdr {
+        fn shnum(&self) -> u16 {
+            self.0.e_shnum
+        }
+
+        fn shoff(&self) -> u64 {
+            self.0.e_shoff
+        }
+
+        fn shstrndx(&self) -> u16 {
+            self.0.e_shstrndx
+        }
+    }
+
+    /// Newtype to provide [`FromBytes`] and [`ElfSectionHeader`] implementations.
     #[repr(transparent)]
     struct Elf64SHdr(bindings::elf64_shdr);
     // SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
     unsafe impl FromBytes for Elf64SHdr {}
 
+    impl ElfSectionHeader for Elf64SHdr {
+        fn name(&self) -> u32 {
+            self.0.sh_name
+        }
+
+        fn offset(&self) -> u64 {
+            self.0.sh_offset
+        }
+
+        fn size(&self) -> u64 {
+            self.0.sh_size
+        }
+    }
+
     /// Check if the section name at `strtab_offset + name_offset` equals `target`.
     fn section_name_eq(elf: &[u8], strtab_offset: u64, name_offset: u32, target: &str) -> bool {
         strtab_offset
@@ -285,48 +328,47 @@ fn section_name_eq(elf: &[u8], strtab_offset: u64, name_offset: u32, target: &st
             .is_some_and(|s| s == target)
     }
 
-    /// Tries to extract section with name `name` from the ELF64 image `elf`, and returns it.
-    pub(super) fn elf64_section<'a, 'b>(elf: &'a [u8], name: &'b str) -> Option<&'a [u8]> {
-        let hdr = &elf
-            .get(0..size_of::<bindings::elf64_hdr>())
-            .and_then(Elf64Hdr::from_bytes)?
-            .0;
-
-        // Get all the section headers.
-        let mut shdr = {
-            let shdr_num = usize::from(hdr.e_shnum);
-            let shdr_start = usize::try_from(hdr.e_shoff).ok()?;
-            let shdr_end = shdr_num
-                .checked_mul(size_of::<Elf64SHdr>())
-                .and_then(|v| v.checked_add(shdr_start))?;
-
-            elf.get(shdr_start..shdr_end)
-                .map(|slice| slice.chunks_exact(size_of::<Elf64SHdr>()))?
-        };
+    fn elf_section_generic<'a, H, S>(elf: &'a [u8], name: &str) -> Option<&'a [u8]>
+    where
+        H: ElfHeader,
+        S: ElfSectionHeader,
+    {
+        let hdr = H::from_bytes(elf.get(0..size_of::<H>())?)?;
+
+        let shdr_num = usize::from(hdr.shnum());
+        let shdr_start = usize::try_from(hdr.shoff()).ok()?;
+        let shdr_end = shdr_num
+            .checked_mul(size_of::<S>())
+            .and_then(|v| v.checked_add(shdr_start))?;
+
+        // Get all the section headers as an iterator over byte chunks.
+        let shdr_bytes = elf.get(shdr_start..shdr_end)?;
+        let mut shdr_iter = shdr_bytes.chunks_exact(size_of::<S>());
 
         // Get the strings table.
-        let strhdr = shdr
+        let strhdr = shdr_iter
             .clone()
-            .nth(usize::from(hdr.e_shstrndx))
-            .and_then(Elf64SHdr::from_bytes)?;
+            .nth(usize::from(hdr.shstrndx()))
+            .and_then(S::from_bytes)?;
 
         // Find the section which name matches `name` and return it.
-        shdr.find(|&sh| {
-            let Some(hdr) = Elf64SHdr::from_bytes(sh) else {
-                return false;
-            };
-
-            section_name_eq(elf, strhdr.0.sh_offset, hdr.0.sh_name, name)
-        })
-        // Return the slice containing the section.
-        .and_then(|sh| {
-            let hdr = Elf64SHdr::from_bytes(sh)?;
-            let start = usize::try_from(hdr.0.sh_offset).ok()?;
-            let end = usize::try_from(hdr.0.sh_size)
-                .ok()
-                .and_then(|sh_size| start.checked_add(sh_size))?;
-
-            elf.get(start..end)
+        shdr_iter.find_map(|sh_bytes| {
+            let sh = S::from_bytes(sh_bytes)?;
+
+            if section_name_eq(elf, strhdr.offset(), sh.name(), name) {
+                let start = usize::try_from(sh.offset()).ok()?;
+                let end = usize::try_from(sh.size())
+                    .ok()
+                    .and_then(|sz| start.checked_add(sz))?;
+                elf.get(start..end)
+            } else {
+                None
+            }
         })
     }
+
+    /// Extract the section with name `name` from the ELF64 image `elf`.
+    pub(super) fn elf64_section<'a>(elf: &'a [u8], name: &str) -> Option<&'a [u8]> {
+        elf_section_generic::<Elf64Hdr, Elf64SHdr>(elf, name)
+    }
 }
-- 
2.52.0

