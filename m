Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31B11C9DDAD
	for <lists+nouveau@lfdr.de>; Wed, 03 Dec 2025 07:00:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FB5710E71F;
	Wed,  3 Dec 2025 06:00:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gmbRor5s";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH0PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11011030.outbound.protection.outlook.com [40.107.208.30])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4858B10E71F
 for <nouveau@lists.freedesktop.org>; Wed,  3 Dec 2025 06:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZUwjzKVFXzRdoVEXQwLCd2BO0c8w9JcDu5+UA6ycvGjr1TGgBJXfBuboHE/7+B5B5MTwuOn4ey7/w/bokXJDStvadKdQvqdYGzHqBNKc+Hv7zJQ03tGtgIQJPEXaZxMVF6nXlAIgPHSFjBMV5DaVeyNHPWBaFGHKn8dIuhV6fNBWxi4V6Y+d5AsrM/GmHYzI7lqKw/6pFkFDGrIZpzPzs4i4b9M1VuOgKonYpUzGALsPzdNY3YIt6MWovE7OQxymR14VbnBcCwtWnOLI/PYMhaOXBNqKFLmjPq5X2boPCv+42ZYDiWKZ8YrUBRKCx/mqXLCsWAJXoSZiPgeob47MTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IM4l2z8SoAW5AQ3OC5VmARKelbdIWdjsaJnUaXgAizk=;
 b=ONYORcFDyMKCJh/fjPz027bq0Ertk7nLnWJJWbwgEMapjvPvWQfz0zImcFQPX91llsMJDmh3uh3RMq8oFMXd+cOvPKiwnJrN+w4xz8EG2ciY5UI9khjnyHdSw82Y+alCkcWVxi5fq2K98BT8XSpmAYYGGLS7+LPf9VmWKQCF/2zm2Ibar60UeZ8+YaaXm5/RZTbpSkauFBqqZ5QWTIKIqSmYSHUTtsIr9ZW40mDriOWKUB+Hhu43uFQrDWtFA3r0cwuiLWSQStQW89SjK0JyjwcQG8g60eJ125zBBjHZixgHeUzgYW0rHNX5kQewY42aZOY4TobSx/JTIXRk1VOwtQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IM4l2z8SoAW5AQ3OC5VmARKelbdIWdjsaJnUaXgAizk=;
 b=gmbRor5sQi6ZujJ25hjjEb7crQnx6iUThEPUs3eL/ish/sZHwKShvcoTbi+UKj7uyjNZjRouvpTgXkUIDp3Iq5dGlJo5r/lEA2DMg4bKnHjEkktikknWqYt+JCwmFDsH+byJSkL2aDwfra85PsLCQ8nlVy+0YXADYZLLQSuolnJPeh9W04SuKHESRkg5uV4eg8WdESPflY2fIbXKbZsNF3GcvGq/kx8h8lzrQ0hAdGCfQmOk32OQwfA4Uvj8FBmUml6E2lyk4EWWZbgJctikKNeU6WGn7ouklCfGyw7CYQov6cMqwXyK3ImmuXgURoHpMxttMKKJA0NuXvtGXCTSFg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from DM3PR12MB9416.namprd12.prod.outlook.com (2603:10b6:0:4b::8) by
 PH7PR12MB8013.namprd12.prod.outlook.com (2603:10b6:510:27c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.15; Wed, 3 Dec
 2025 05:59:58 +0000
Received: from DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8]) by DM3PR12MB9416.namprd12.prod.outlook.com
 ([fe80::8cdd:504c:7d2a:59c8%7]) with mapi id 15.20.9366.012; Wed, 3 Dec 2025
 05:59:58 +0000
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
Subject: [PATCH 23/31] gpu: nova-core: Hopper/Blackwell: add FSP Chain of
 Trust boot
Date: Tue,  2 Dec 2025 21:59:15 -0800
Message-ID: <20251203055923.1247681-24-jhubbard@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251203055923.1247681-1-jhubbard@nvidia.com>
References: <20251203055923.1247681-1-jhubbard@nvidia.com>
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR05CA0028.namprd05.prod.outlook.com
 (2603:10b6:a03:33b::33) To DM3PR12MB9416.namprd12.prod.outlook.com
 (2603:10b6:0:4b::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PR12MB9416:EE_|PH7PR12MB8013:EE_
X-MS-Office365-Filtering-Correlation-Id: 58273fda-40c3-461b-6e01-08de323130b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|7416014|1800799024;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?HVw+GwZjfH2zAJXpelVBnUrjjyXAlLONXFEsKb+g/ABMLygSkAXhFrerztEc?=
 =?us-ascii?Q?JHlm++qLk3W5HxbX5BBt2pUGPN6aGVpkOwd8QjXhFy2AWuwZp7figf8/XgpC?=
 =?us-ascii?Q?FBNqSxy9mA4UVnFyRN9bhteGJVZR31mujPTbW0mYpl/vMDIUmS5KNGfBumDH?=
 =?us-ascii?Q?rzEvC91zNa80Ifj1LB05hZcZGdAXNFPSser0z5Ar5XAoDYB/wD97UfTd0MSs?=
 =?us-ascii?Q?AIbzgiczjvIlXZV26E40xP6DYAdT9tPoYqq4zAUFszfCO4o2UA7JMLrDEln1?=
 =?us-ascii?Q?CryrVSEB0q8jukF1nrhLdqCYDew37VAQI1PJadZI+a73zfyyd4wAkPXx8cRc?=
 =?us-ascii?Q?TP17dwiakyyGLffDLbNn94rG4vpVsBFv3dylx1lvzCWUrqNZ7H0iIeMvKWyT?=
 =?us-ascii?Q?bW3dlytw+cTemq7QdhxJSWpzmqh3SHr1rb3iJvrdJL8NryHelrIvZ5X/wfWR?=
 =?us-ascii?Q?bqjDMaRNT0oZ5hgay34gSnE4zdhXMk5e+DyCWn+V+1xn/AOkEg5eu1VEpEQZ?=
 =?us-ascii?Q?0FnaqAxvg1D6rdw2LVTQjL1H6PcWQiPZGwFAsKV6LJy2S8NWkrvYc30odCKd?=
 =?us-ascii?Q?9bfPeTbl2/ep8ZH3yyrM+UZoDpJJPJCcZ5Rzo6XZycdILfuG8HthzoAU01+i?=
 =?us-ascii?Q?QrI1goxJg6XFwgvjwEjNVcXh5Q9BuBBDu5fCBUNgAAZaN2fa7uFRg0B7VZOi?=
 =?us-ascii?Q?IMTrdJzbDKFOzGBRvp7asvRaEBUDhYyftxWoT8vQ35ZiIdTJ3TejGMcuwjLU?=
 =?us-ascii?Q?9IbxXju1rPV5ebLvRQ27JBTFEwEHz+bKV3uW6XuDqoXdq6/9/765QoPfUlJi?=
 =?us-ascii?Q?sm6GX0v9Rhsnsx0Q6B70rmpdUICMuQ1KfDewO6WCWKFSo604SUuLGEmaXu4Q?=
 =?us-ascii?Q?5jsS6tECG/u5d1bkq3KdSfY2lA72fl1xMmz9T9CX50Xv3/ojCrBJSV5/4ug1?=
 =?us-ascii?Q?v7/la69SyZBfAErFfI7tMMF9fCPcnzqWq8P5AkuWaZaw6osf2pMmNBoCoHwk?=
 =?us-ascii?Q?Qp+ReD+TqyA+9V54RJ1OhtEmEaknwryThGhnwZ7wOc1JAucdrBPesnWx+lIE?=
 =?us-ascii?Q?ZOyRT2WdR+HJYBnSKvTLKMBK8zvpIBLd1u0CbC9KcI0MBQiri9dh3sinKmTv?=
 =?us-ascii?Q?XDPd+tJjL8Iuinu3GiD70e5zklIswkg0s2I0wsKJm6jrV+gX9gr60+5zTEkG?=
 =?us-ascii?Q?URRd5+DdKhrLnhQXttDAYwA9Cy/7wiIMsUWs52meTgZdtXD1ehYZRkZhdX5S?=
 =?us-ascii?Q?eVBWKwwZlVJr0WUhLYv61/74kciMcG817h0PTzXlxbaUNjIaSQkzVYHuvvuh?=
 =?us-ascii?Q?KXeSd52BzN0Y4Tenl41Ah3OLCwNa9BQFkF7rIAN0P/i6IeNcOPPDOPSPQ24v?=
 =?us-ascii?Q?vORh/uqZI75uycTktXp7sxzhUvWMFLs8WC0rzOA6GKWa+KR3Upkp/rzhVpJW?=
 =?us-ascii?Q?VMbJljEW4+ItTRYNZjgb7eNMf03O829R?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PR12MB9416.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(7416014)(1800799024); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ZaF8A/Ex3yfAYdHoa1iRQElYlAgkDQb1RGGC/aXWIZsFLzCgoPDeVY3W6+pi?=
 =?us-ascii?Q?ROFqa2FRqZw7tgXigY8SySiA0dn8CP5/ExSOcUYIza/06rtDz7IimObBTDBH?=
 =?us-ascii?Q?DliwJdl84eh7Tk5aciYEkJgnEkP5o6ONMyxyN7hRDqrREE1/NrQxbUFSc8uR?=
 =?us-ascii?Q?S1viXWf6T+YTmXvGQ0Gh0vxwA9IYHaheeDsw1rhispjIi3CEmI+m2vZOQQhY?=
 =?us-ascii?Q?S8CCLhrvVt105lpwJXN3sHDufXE8viZsUdjD2o+Ghef6yhyWTjPi497eKp1G?=
 =?us-ascii?Q?kRCdafRQ1Fs0lrA6S7OusDg7wCHnBt7GhbxKBoYh/e9j+FV0Mm2jfV7Vn+cg?=
 =?us-ascii?Q?Nb4Vp7DSxf091gZDYhNpo+Mg85HW6XMULbayGeA2FusRKSvK5a+NAXhkt187?=
 =?us-ascii?Q?3zYfdjfyLp3EBiiihA825wtnAiybnDOv9DSkMEnVRSz8fydZmZ9U5LtLrDyc?=
 =?us-ascii?Q?l2c0mUCEgCm+fr8fI1DymOke8Jss5nHCR+Jagxjya0JgADoyA39SjX8wuaLz?=
 =?us-ascii?Q?NgHYd+e6YGQJqL0AfQbVeXasimwz0pV5hETtio+wqh42jVqnosNBN2gW5hm+?=
 =?us-ascii?Q?zMHOmPEuuxcZcAq46U3DuWLQnhKw1FvYW9xeJD/BYdCxlqTypC4xN2sAjsNB?=
 =?us-ascii?Q?8f5NfYb/GNYlKUK1YYKH89vNwV0iV8aGttSf1nhB1lO8HUkmnzXrp3078bgj?=
 =?us-ascii?Q?SztEH4HJjOBVsto3FKs5yzDO62pxah7BjLhHnAoCEnMWksxjnK51JjQwLcM2?=
 =?us-ascii?Q?WSoKy/bbdAT/4l+Ru5h9QRpzfFZOIbe5mikQ4dRWweiMSu4+VUzn4Ja7PpYB?=
 =?us-ascii?Q?/scvnGyyxccStvtQ/ZG55/8RHfh02jlsMRuTPlM9OO2Q2GI4rmptDoLLJ4HP?=
 =?us-ascii?Q?RvmLyIx9K/zDIBkFzAIuNPj5HI1G8a1ssA/Z+uIeOivmzNTpETVzMW3Vkrv0?=
 =?us-ascii?Q?seK4G7ojV4pRXG1PBRjfZXyx8akZAsed1ML09yjBkyLeSTFmaNuC8QKs4yLk?=
 =?us-ascii?Q?ee/YxDnnfcLsbMPU/iKLfoGbmMSo2pfoPKQnM7aJmq0bp9md5XZcUMVVM8JI?=
 =?us-ascii?Q?hJX74+GKmmjdu5BA/jB689POUiqLz2O+3vszBCHd5eeEnNevkm3ZHaeEsUwF?=
 =?us-ascii?Q?7Qy0CtZCLED9JG8l/A6xHColmHwEw6frXew15ttDigmhQBLxaPE5gCh5hA8m?=
 =?us-ascii?Q?WG5y74ZgSa3WpdGOvkl0N0x4073JBIdqFcby8HtVAoNw9BHWfKiHFkFwiZwo?=
 =?us-ascii?Q?+Otx1qPKyQOeIaAUL2WWIOoJzQwBtyFqlginNi/xWDGD0gOjatSExS1jGJ4X?=
 =?us-ascii?Q?ng2cCg5Zn71+w+GzH4KlNPKcbCT+5PUXOuiKdp9v4S1woVp0tGDnRaDe/8M2?=
 =?us-ascii?Q?w9kkYcG9FrS1PJrk1YFgUeJZ+lJspABQzwHT3DcHxZqiL0QduMnIUzkAC56W?=
 =?us-ascii?Q?AaPw31i262I81CsmXc0B9X8PIkvpS0JBpuNThPYhf+zQwkCQIXx0Ug3vKKh5?=
 =?us-ascii?Q?E9AbPArjnBy8isMXFhMee8hnRMgDX3F1A4TJHMZN7749b+rayXMLji85NJGQ?=
 =?us-ascii?Q?ZBYe4IJSaH5B3XXEx40LjNcNZuHxJKlAbKXnKbpB?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 58273fda-40c3-461b-6e01-08de323130b1
X-MS-Exchange-CrossTenant-AuthSource: DM3PR12MB9416.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Dec 2025 05:59:58.6209 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mFJjENjozGi561m/0LOPpl+RrrEEPKKfjBDMIWWkDTYhkQN5sf48yvmf219boMlwKuwf3/WQ9Ewu261qv79D/Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8013
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

Add the boot functions that construct FMC boot parameters and send the
Chain of Trust message to FSP. This completes the FSP communication
infrastructure needed to boot GSP firmware on Hopper/Blackwell GPUs.

Signed-off-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/fsp.rs | 156 +++++++++++++++++++++++++++++++++++
 drivers/gpu/nova-core/gpu.rs |   1 -
 2 files changed, 156 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/nova-core/fsp.rs b/drivers/gpu/nova-core/fsp.rs
index bb1e19c03c30..5840ab78e79f 100644
--- a/drivers/gpu/nova-core/fsp.rs
+++ b/drivers/gpu/nova-core/fsp.rs
@@ -13,6 +13,10 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    ptr::{
+        Alignable,
+        Alignment, //
+    },
     time::Delta,
     transmute::{
         AsBytes,
@@ -22,6 +26,10 @@
 
 use crate::regs::FSP_BOOT_COMPLETE_SUCCESS;
 
+/// FSP Chain of Trust (COT) version for Blackwell.
+/// GB202 uses version 2 (not 1 like GH100)
+const FSP_COT_VERSION: u16 = 2;
+
 /// FSP message timeout in milliseconds.
 const FSP_MSG_TIMEOUT_MS: i64 = 2000;
 
@@ -364,6 +372,154 @@ pub(crate) fn extract_fmc_signatures_static(
         Ok(signatures)
     }
 
+    /// Creates FMC boot parameters structure for FSP.
+    ///
+    /// This structure tells FSP how to boot GSP-RM with the correct memory layout.
+    pub(crate) fn create_fmc_boot_params(
+        dev: &device::Device<device::Bound>,
+        wpr_meta_addr: u64,
+        wpr_meta_size: u32,
+        libos_addr: u64,
+    ) -> Result<kernel::dma::CoherentAllocation<GspFmcBootParams>> {
+        use kernel::dma::CoherentAllocation;
+
+        const GSP_DMA_TARGET_COHERENT_SYSTEM: u32 = 1;
+        const GSP_DMA_TARGET_NONCOHERENT_SYSTEM: u32 = 2;
+
+        let fmc_boot_params = CoherentAllocation::<GspFmcBootParams>::alloc_coherent(
+            dev,
+            1,
+            GFP_KERNEL | __GFP_ZERO,
+        )?;
+
+        // Configure ACR boot parameters (WPR metadata location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.target = GSP_DMA_TARGET_COHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(
+            fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_offset = wpr_meta_addr
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.gsp_rm_desc_size = wpr_meta_size)?;
+
+        // Blackwell FSP expects wpr_carveout_offset and wpr_carveout_size to be zero;
+        // it obtains WPR info from other sources.
+
+        kernel::dma_write!(fmc_boot_params[0].boot_gsp_rm_params.b_is_gsp_rm_boot = 1)?;
+
+        // Configure RM parameters (libos location) using dma_write! macro
+        kernel::dma_write!(
+            fmc_boot_params[0].gsp_rm_params.target = GSP_DMA_TARGET_NONCOHERENT_SYSTEM
+        )?;
+        kernel::dma_write!(fmc_boot_params[0].gsp_rm_params.boot_args_offset = libos_addr)?;
+
+        dev_dbg!(
+            dev,
+            "FMC Boot Params (addr={:#x}):\n  target={}\n  desc_size={:#x}\n  \
+             desc_offset={:#x}\n  rm_target={}\n  boot_args_offset={:#x} \
+             (libos_addr passed in: {:#x})\n",
+            fmc_boot_params.dma_handle(),
+            GSP_DMA_TARGET_COHERENT_SYSTEM,
+            wpr_meta_size,
+            wpr_meta_addr,
+            GSP_DMA_TARGET_NONCOHERENT_SYSTEM,
+            libos_addr,
+            libos_addr
+        );
+
+        Ok(fmc_boot_params)
+    }
+
+    /// Boot GSP FMC with pre-extracted signatures.
+    ///
+    /// This version takes pre-extracted signatures and FMC image data.
+    /// Used when signatures are extracted separately from the full ELF file.
+    #[allow(clippy::too_many_arguments)]
+    pub(crate) fn boot_gsp_fmc_with_signatures(
+        dev: &device::Device<device::Bound>,
+        bar: &crate::driver::Bar0,
+        chipset: crate::gpu::Chipset,
+        fmc_image_fw: &crate::dma::DmaObject, // Contains only the image section
+        fmc_boot_params: &kernel::dma::CoherentAllocation<GspFmcBootParams>,
+        total_reserved_size: u64,
+        resume: bool,
+        fsp_falcon: &crate::falcon::Falcon<crate::falcon::fsp::Fsp>,
+        signatures: &FmcSignatures,
+    ) -> Result<()> {
+        dev_dbg!(dev, "Starting FSP boot sequence for {}\n", chipset);
+
+        // Build FSP Chain of Trust message
+        let fmc_addr = fmc_image_fw.dma_handle(); // Now points to image data only
+        let fmc_boot_params_addr = fmc_boot_params.dma_handle();
+
+        // frts_offset is relative to FB end: FRTS_location = FB_END - frts_offset
+        let frts_offset = if !resume {
+            let mut frts_reserved_size = if chipset.needs_large_reserved_mem() {
+                0x220000 // heap_size_non_wpr for Hopper/Blackwell+
+            } else {
+                total_reserved_size
+            };
+
+            // Add PMU reserved size
+            frts_reserved_size += u64::from(crate::fb::PMU_RESERVED_SIZE);
+
+            frts_reserved_size
+                .align_up(Alignment::new::<0x200000>())
+                .unwrap_or(frts_reserved_size)
+        } else {
+            0
+        };
+        let frts_size = if !resume { 0x100000 } else { 0 }; // 1MB FRTS size
+
+        // Build the FSP message
+        let msg = KBox::new(
+            FspMessage {
+                mctp_header: (mctp::HEADER_SOM << 31)
+                    | (mctp::HEADER_EOM << 30)
+                    | (mctp::HEADER_SEID << 16)
+                    | (mctp::HEADER_SEQ << 28),
+
+                nvdm_header: (mctp::MSG_TYPE_VENDOR_PCI)
+                    | (mctp::VENDOR_ID_NV << 8)
+                    | (mctp::NVDM_TYPE_COT << 24),
+
+                cot: NvdmPayloadCot {
+                    version: FSP_COT_VERSION,
+                    size: core::mem::size_of::<NvdmPayloadCot>() as u16,
+                    gsp_fmc_sysmem_offset: fmc_addr,
+                    frts_sysmem_offset: 0,
+                    frts_sysmem_size: 0,
+                    frts_vidmem_offset: frts_offset,
+                    frts_vidmem_size: frts_size,
+                    hash384: signatures.hash384,
+                    public_key: signatures.public_key,
+                    signature: signatures.signature,
+                    gsp_boot_args_sysmem_offset: fmc_boot_params_addr,
+                },
+            },
+            GFP_KERNEL,
+        )?;
+
+        // Convert message to bytes for sending
+        let msg_bytes = msg.as_bytes();
+
+        dev_dbg!(
+            dev,
+            "FSP COT Message:\n  size={} bytes\n  fmc_addr={:#x}\n  boot_params={:#x}\n  \
+             frts_offset={:#x}\n  frts_size={:#x}\n",
+            msg_bytes.len(),
+            fmc_addr,
+            fmc_boot_params_addr,
+            frts_offset,
+            frts_size
+        );
+
+        // Send COT message to FSP and wait for response
+        Self::send_sync_fsp(dev, bar, fsp_falcon, mctp::NVDM_TYPE_COT, msg_bytes)?;
+
+        dev_dbg!(dev, "FSP Chain of Trust completed successfully\n");
+        Ok(())
+    }
+
     /// Send message to FSP and wait for response.
     fn send_sync_fsp(
         dev: &device::Device<device::Bound>,
diff --git a/drivers/gpu/nova-core/gpu.rs b/drivers/gpu/nova-core/gpu.rs
index c0473ef8ac47..8fdce488612a 100644
--- a/drivers/gpu/nova-core/gpu.rs
+++ b/drivers/gpu/nova-core/gpu.rs
@@ -124,7 +124,6 @@ pub(crate) const fn arch(&self) -> Architecture {
         }
     }
 
-    #[expect(dead_code)]
     pub(crate) fn needs_large_reserved_mem(&self) -> bool {
         matches!(self.arch(), Architecture::Hopper | Architecture::Blackwell)
     }
-- 
2.52.0

