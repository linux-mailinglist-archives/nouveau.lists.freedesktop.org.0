Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3DAA0C3906F
	for <lists+nouveau@lfdr.de>; Thu, 06 Nov 2025 04:54:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C9D1010E7F3;
	Thu,  6 Nov 2025 03:54:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gvYPZjVC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010039.outbound.protection.outlook.com [52.101.201.39])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EFE610E312
 for <nouveau@lists.freedesktop.org>; Thu,  6 Nov 2025 03:54:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UqbMBuXBqoAv2Lg7mYbX+LCzHGeCVTWZ20jtNp7tctwsbKO2vuTyxJYKHdpgfhjq5EuY52yIkGKAe0SsQ4K0/tPf32Asr+SqfV40LhY/LNGRopS8F7f4h2WLbejFDUk7VfbXLPAWLy7dHODskSwED/M9JynoZUiHM1Oq0f+Wc3dIRANFi8kN+gs1GB2IKQD3ti9NxxlAoGQsKCpmiYEbhq3EGQ0R5aAc9viEIXRNeqCkh8zvV6+791OojYVZ8AOLsNcqWNOxY18CUITocu+zkE8AGXAkhxzsuHJ5/6iIAUbA97R9oWkO2IlOIciTimAvGbIxJISFY77rIxNpzT0zzg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GWlauDYnO6N3vCQpDUFHIZ4W6oW6nBs9NIe5m4Cuyq8=;
 b=hyDuzXyNykAFPbB0H8caEbtAriX70u1K+vkiXH72mevHHtkjtRmO2nik9k98EAs6qYZ7mBShMHdtNsr5b2UWNKKtJFJNVFtHviOHZIiMHOc6DEzzRDKBinbmUgj64jkRI8HTihpeDGXgWXQ4+2tjkdxBbe3ie8yj7Uyl78i9hzH4yoQ5GPQWqpBQF+fJx563jPgHwIK5Duc8rzWYOc6x47wjfjECH+6+No424Fm7qG7KgOoJzcikM2OaFxSWtGfwg3+QmrGoxZ/bO9cqPZH82wjgc3CM0OWMErQhnZdOQ2o6irl4YkBi2ic/w7JCJ40PTTktTRoJR9FVN3crcIaj8A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GWlauDYnO6N3vCQpDUFHIZ4W6oW6nBs9NIe5m4Cuyq8=;
 b=gvYPZjVCvqT8KNJqauo+fFt9xvh/J3ZgynW7c7Bphw6Uoy9dHcnqMxk0l3iV094W9ygbgOSPc5czP0M5yvH+y5n1l4nPO5AyP+5+GWBwJltsMGXQKE9QvQVW0n+tSLN/5QNQFB0TrUCF4/6OhUmrswaqQkWcNp+iQB3tWKMSZmKhsDLMkWso/5DxnVp0k5BUp826PV8x9IV92R8lnyPPQDSjTzZFvRIGDoxyV3IP+DZYY+1ngYxKA3BCsicwo92UUfbu1yDavlO+a7junA0Pb2Yt3TyPVWJnpgoDG9iv9fblFn2Sfm8gvdbGA5GpGRLR6qEGttEBozlpaYRrOht/bw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from BY5PR12MB4116.namprd12.prod.outlook.com (2603:10b6:a03:210::13)
 by CY5PR12MB6622.namprd12.prod.outlook.com (2603:10b6:930:42::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9298.7; Thu, 6 Nov
 2025 03:54:39 +0000
Received: from BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4]) by BY5PR12MB4116.namprd12.prod.outlook.com
 ([fe80::81b6:1af8:921b:3fb4%4]) with mapi id 15.20.9298.006; Thu, 6 Nov 2025
 03:54:39 +0000
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
Subject: [PATCH 2/6] gpu: nova-core: Hopper: basic GPU identification
Date: Wed,  5 Nov 2025 19:54:31 -0800
Message-ID: <20251106035435.619949-3-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251106035435.619949-1-jhubbard@nvidia.com>
References: <20251106035435.619949-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0020.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::25) To BY5PR12MB4116.namprd12.prod.outlook.com
 (2603:10b6:a03:210::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BY5PR12MB4116:EE_|CY5PR12MB6622:EE_
X-MS-Office365-Filtering-Correlation-Id: e1568903-2bd3-484a-1e6c-08de1ce835d5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?iCw79bPPdl3AJiZsVFqqAGEGuPcPd4ISVnCmbCu2w71aQwbqMqazR2v0WZxg?=
 =?us-ascii?Q?IaPISQErCoCJQN+C8QEYBeqevlAemRaqX2BTdpiYjgnP7g0YQ21aXmgR2YLs?=
 =?us-ascii?Q?AHIyoweqlmbkxl+F4zCtfm3einbjE1+9FghfCjNiKZcjs2Ty9bPSUhNj4JpV?=
 =?us-ascii?Q?s45uJVc/8274fnLu6M1m3KnIcy71cjqZecmmc+HaRLRVyhRErB6vdgulrWsi?=
 =?us-ascii?Q?x3ewIh0XmTt1Txw7tZFnV5I5uhGscHVEUYwQ+Fo18oMoGKM48Faiep4qkoz1?=
 =?us-ascii?Q?3Ddt0T7t5MAUdlIFhYczyORM6wVSGbFvKB5aeHFGHYzGXoVJjH6w+aqBPiwt?=
 =?us-ascii?Q?2He/1lslDxss0J683iPi/Om7rD4u6nw13QIpCaCafmtlD8oKE2Po/JlBxgjT?=
 =?us-ascii?Q?3qNYUJnA7KkpuYPonqHAatFfM3CRSlAEscbnmrlUNuhkmCCGeJwSrIwbshv7?=
 =?us-ascii?Q?lAVUi5Lh0SAWdMnJ/aWrA3885cbv3EvW1L/vukO8EJ3u3ARWv+/iqeUECNTA?=
 =?us-ascii?Q?gnI8pVeitCPzbpDwkaarSrx4dfneoBFmp4tu7WItUcKODrNtKZwer1Wn5Ttu?=
 =?us-ascii?Q?toalvdbp1wD38c9R9MIRfsqJBz+SuieeM7K+3hfKJzsCRVCzGMn3yGBGvSDz?=
 =?us-ascii?Q?BVP/0PTJp7b9zQ1ZjHPeByd+t0JemWXxDwyew14nGE5OMzb/ri0G5BBGsG8P?=
 =?us-ascii?Q?pYkDhKx5UeerFJPNZGNXs+sgRSjuBYYXeA09m1ARd/U5PepxTwBfrb7cNssn?=
 =?us-ascii?Q?AWqWCusQaABIlD1J+QDK6JI2qD1eG4yeiw4Yr5cruMbjDZtYQLUtBhKO4jbB?=
 =?us-ascii?Q?mxkXHOf80S7fMP8wk97eBFV86sHcnfkhY8k/NyyJQTkw5BOCVXeQL1bg+FN/?=
 =?us-ascii?Q?2N6F9q22d/0O6bl7oAZYoPG8TGb3WJXRAlNzxyJdUx1e46zl/6hAVwR9mNg+?=
 =?us-ascii?Q?lzzxVEvsuKmHw++VOkt6T9nwiBtLyJN9epjErDmf5n23m7py1YhT+7WnLV/1?=
 =?us-ascii?Q?zGyToh5Lb//TM+q0q/9pbD+BXQb8iAJqL5zWogyhSU8MZKrt2bTM7nb1Xz/e?=
 =?us-ascii?Q?AMhk6oKQ8nZkD13agd/bninzqbeLDBAfEd+qn/vaAjN+K80de/iuPiKWSaJi?=
 =?us-ascii?Q?IjWzwIcDmerhzZM7NOE85/9O9/e/Okv3xK9bu4H1LDD4NvSydJzjxMwxktBu?=
 =?us-ascii?Q?5YvpgOS6bQVOZF2tqwBTysuEbZyxz2g/ZYxes302/ZP1WfDCCSnURAroGiLb?=
 =?us-ascii?Q?h8lcnA3ZyRTgMahfRvHwGtNSXIUheod+dhaUolTuuULyMYFfyr5+2tycDF8S?=
 =?us-ascii?Q?riciFRRWqHidXBKiXmkhv8q8oUwo8IrdHqOPXguEb6sDaEShpl43WiBYNdrZ?=
 =?us-ascii?Q?gkC5pgY0xVv5QqgVysqLIST5SuMWQ+Oh36Y8J9IbYdE9pNU0Yhhe4lO3vs4+?=
 =?us-ascii?Q?eCuanh7PIUes2k4Cfki+Wd+Md9H/LdHZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BY5PR12MB4116.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ScQtgT+6VHtIUS5L65UcVc+wFAIgYUzQk9qv3vlRb6RVqWUKC1AJik7S15JL?=
 =?us-ascii?Q?cTm1bx8HOUhoBK2hfM5EIRQZ045tL0XaBe3cfZnUKwvSoI1ioBvjaV+o/GfG?=
 =?us-ascii?Q?M3vHMAxGeAPzUYw8gbtSRFAOIgZSOnBANAPsEdKeIFEX5WF+DpS3qlYgMIZT?=
 =?us-ascii?Q?KW6KE2BOI4dJTFtN+AWttLyMnIa4bhueGAb+ecc7MhMr/0pq2vJANarmJiML?=
 =?us-ascii?Q?ZTc8+HzsXSAquiyBEmJpCLQznn2HxI8nztXIdROrgM0jqDdlIV+62pfdmvQk?=
 =?us-ascii?Q?7a0VtUMj2004fu/3Fo9AeYKh95qEh7wuMAH+faNMu/KZIziRUSJt/xZsMoI3?=
 =?us-ascii?Q?4pW2f2meh7fayn4D54gQuBal+yRzxUlz2eJK/LacoDXsugZuhmt67q3pvLIn?=
 =?us-ascii?Q?0WmMur1ihyWtKglH4LR4YiWklFeKkzpOTloOgxJzS+JEQqHmq67Ehi9CURjE?=
 =?us-ascii?Q?3VZZV87VRgqrCFEDPtQ/v3xLzol/iJ6OT81IlmVy4M6pmm7fvaoo6yXD/BLY?=
 =?us-ascii?Q?kC5wiE4ymZR11PoM/UuRfD35iomQGF1xlvBadcmgiGRpqQJ9c0AxPcTUZGKw?=
 =?us-ascii?Q?OiUb9sONlEFIlnUA3oZxDQzGWAOiCcqVqnBgFqovxSLfr9CM6P3Ge6juqgZu?=
 =?us-ascii?Q?bY1JYHHvurhr4DoKKYXo8bkzqJgQ11AKyRbltpLpwFAIgrRajmg5LzE+VEbE?=
 =?us-ascii?Q?zjWXmQXCJ8O/TjkCPNgfTDd3DvA0hcitT9X0oKbVHks5iLWYUWFJa2sHdpHC?=
 =?us-ascii?Q?8/Yu8z/Z+ZCiaknHY1Ps+dJ/dvIYa6jcRc/QhEm8D4zGkLtPso02HdW++fwr?=
 =?us-ascii?Q?wqhdkSewp+DqXf61mUxnKsszd8B7ytc7Ssctvia7iMHpmj0tUQT+yNAzRirc?=
 =?us-ascii?Q?Q8nFRMBbCV2avz/ZjM+SlclGE3VttdKWgmP4t9CNTD+aFWGo7sZD13TpX7I7?=
 =?us-ascii?Q?c1YRYNWdCUmWSFfSxFqj6cKDMEowziZHRLf+2GLtrOz36fYa1cndYMwZmfPe?=
 =?us-ascii?Q?ycprfmKYllTLVykgG9Vw5tt9CPNEQMrtSpcn2Mf33k44KdH281Tg+YlL9llL?=
 =?us-ascii?Q?fqPJw9CQozRgaugmrPcan4Ul74CMV8JL9eXE5rdC5Ga8apui3H1JloA/qt+M?=
 =?us-ascii?Q?t9mgWOO5w3xz0FvKAa9aSRFjasi81/j/2tWH3PXB30GAtcUuBwbyp/Wfp3eZ?=
 =?us-ascii?Q?3f78g30lwcpgKBAEZuc+t5Nm7750+swM6c47VXHSmBCO2Y+kStn6cOo5Fs8V?=
 =?us-ascii?Q?fafYdpIyx3SZmdUYRJKIBjkqB0jrVReaYEC8uT/2Kpfs00Zim2oj7DLLk58o?=
 =?us-ascii?Q?1QmTZlchxeHHu/NebeCn4aRGCMU8fjGuGXrclatm1ifcA7/DFgIqKMJNEBAS?=
 =?us-ascii?Q?Zu2bKyMXSBNaD3/fsV25xVjZFIurG5jGYaVKy74F0MXWxju5RCpVPNMdQ0j8?=
 =?us-ascii?Q?McAeeIniXm1kg1Is1MmURy2Hxx+L4aQX6Zveqrb1pG/qDf01i2qV90Ya3xET?=
 =?us-ascii?Q?6L3T2Bb2c9ReCC71pL0/x8Mwmtt933oDRAPWEHj2/RCQd8jTh/L6+ZgJjxew?=
 =?us-ascii?Q?hf4Uw1kVfpjhsqR9f4XxjICZqu4Mvwq7+3EVAKEW?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e1568903-2bd3-484a-1e6c-08de1ce835d5
X-MS-Exchange-CrossTenant-AuthSource: BY5PR12MB4116.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Nov 2025 03:54:39.5528 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aAMR2+yhHFIY5btVuLyzo755omKSpDWrOkdayIVbfTUMbfcWkgxCfHtbRIZ+5u1/9Bg4R+xS4itq6oNuizlANg==
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

GH100 identification, including the ELF .fwsignature_gh10x.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs   | 2 +-
 drivers/gpu/nova-core/fb/hal.rs       | 2 +-
 drivers/gpu/nova-core/firmware/gsp.rs | 1 +
 drivers/gpu/nova-core/gpu.rs          | 5 +++++
 4 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c6c71db1bb70..2e1fcd7ac813 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -44,7 +44,7 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
         _ => return Err(ENOTSUPP),
diff --git a/drivers/gpu/nova-core/fb/hal.rs b/drivers/gpu/nova-core/fb/hal.rs
index 2f914948bb9a..c8e86193317d 100644
--- a/drivers/gpu/nova-core/fb/hal.rs
+++ b/drivers/gpu/nova-core/fb/hal.rs
@@ -32,7 +32,7 @@ pub(super) fn fb_hal(chipset: Chipset) -> &'static dyn FbHal {
     match chipset {
         TU102 | TU104 | TU106 | TU117 | TU116 => tu102::TU102_HAL,
         GA100 => ga100::GA100_HAL,
-        GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
+        GA102 | GA103 | GA104 | GA106 | GA107 | GH100 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             ga102::GA102_HAL
         }
     }
diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index e3d76a300851..f824863ad551 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -151,6 +151,7 @@ pub(crate) fn new<'a, 'b>(
 
         let sigs_section = match chipset.arch() {
             Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Hopper => ".fwsignature_gh10x",
             Architecture::Ada => ".fwsignature_ad10x",
             _ => return Err(ENOTSUPP),
         };
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index 9025bab1726b..678577cd8c9c 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -70,6 +70,8 @@ fn try_from(value: u32) -> Result<Self, Self::Error> {
     GA104 = 0x174,
     GA106 = 0x176,
     GA107 = 0x177,
+    // Hopper
+    GH100 = 0x180,
     // Ada
     AD102 = 0x192,
     AD103 = 0x193,
@@ -87,6 +89,7 @@ pub(crate) fn arch(&self) -> Architecture {
             Self::GA100 | Self::GA102 | Self::GA103 | Self::GA104 | Self::GA106 | Self::GA107 => {
                 Architecture::Ampere
             }
+            Self::GH100 => Architecture::Hopper,
             Self::AD102 | Self::AD103 | Self::AD104 | Self::AD106 | Self::AD107 => {
                 Architecture::Ada
             }
@@ -115,6 +118,7 @@ pub(crate) enum Architecture {
     #[default]
     Turing = 0x16,
     Ampere = 0x17,
+    Hopper = 0x18,
     Ada = 0x19,
 }
 
@@ -125,6 +129,7 @@ fn try_from(value: u8) -> Result<Self> {
         match value {
             0x16 => Ok(Self::Turing),
             0x17 => Ok(Self::Ampere),
+            0x18 => Ok(Self::Hopper),
             0x19 => Ok(Self::Ada),
             _ => Err(ENODEV),
         }
-- 
2.51.2

