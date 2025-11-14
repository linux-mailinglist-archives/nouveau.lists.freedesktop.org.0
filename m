Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BB5CC5F952
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 818EA10EB41;
	Fri, 14 Nov 2025 23:31:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ha0iQ526";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from PH7PR06CU001.outbound.protection.outlook.com
 (mail-westus3azon11010006.outbound.protection.outlook.com [52.101.201.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C4BED10EB44
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:20 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mFUmXmmiilxuME1HGBPOD0VtcNuUCBP9eF/ILriMykH7lhTtwHsG9zwJ5JnCQehbxZPI99eUFPQ1CwbB6s7juGhisOOuc2NhorEKzI85zcJrUNwgzsMlIuBd5yCEJEmB3uk6TOM4A6sfdPJY1fsjQtmN4D4ZZsG+QD3+AzSF+6hNGk8GJQUrnF6vwSQBaTT1mIocGWhC9CKecd9eTJt3/KDXXSoCw5J+L8Cy3qEh/WuYhiD7T6iazYNx+B0tWrk2AA4M9x2qP41Wt3VaeShJkrzHdYxuJpqio5mLoCTEC4KEUjYaWxJaTThPxY0LZ1BTNKHq/8TC1Z9WfVTXZyqyeQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1+YqOtv7hgFEUpzKpS+6Ue13mUn8TP4P10Invf+cH/0=;
 b=FK2vBCgs614USkJuJrfrKgt5othlu+eBMBLCG2HoxP2hDgdT/BOpZ458SWlgkySnGwLfKbpR+GX++qrz/nKpK4o+vlOFN3qcvRRb6Ap3h3MudQvqtJ6msuYojSiribgcn2s7qxQeZq/7j/tuu6yOpRIF8IpOwrP0Talt8vS7/ZPMU2wzj7VzJNh2hZZkfpC1s2WGHCDqZm46588Telmuh+q67s/PfIhc/j3/Dxfirc4nSGPNJiapryTI30ak9ks3yvBCdfLkmljas4BPD0V4v07t4hJF7PsuwqVkrq/W4NAaodt3HG5avrA1W10pEgZgGgS18ophsQ6PP59EPD3pNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1+YqOtv7hgFEUpzKpS+6Ue13mUn8TP4P10Invf+cH/0=;
 b=Ha0iQ5262ZndSRhweskyoKyXFZt8dnbekhNgxnqyxky3obB42j4MDRe/HIGhVKUWKHA/hk6K07jRYCRC81YbgzDUu9jpJAAt9hvKGuN6gXS8QXbjYvNz2vTdCMKdzkM2kcStCQVcX7nx0kioashyblZ8ObDwTSQY1eJSjlOnMYT1MricXCKHEqD/bfHr8RWPgJtZOb4sbrj8wK4rDaO3yInTqJ9WFQYLs0IgoXcjxSkvDn6CvLw/szzp8FfuioQBpmePK6lq0b4ItzFHaUVLgntrf/WmYTBxIx6HhA+6mRoG9UjubU+XiDdaKgpZCSSFf8Int+8HSkUYBRvwgZro7Q==
Received: from DS7PR03CA0157.namprd03.prod.outlook.com (2603:10b6:5:3b2::12)
 by DS7PR12MB8249.namprd12.prod.outlook.com (2603:10b6:8:ea::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:17 +0000
Received: from DS3PEPF000099D6.namprd04.prod.outlook.com
 (2603:10b6:5:3b2:cafe::93) by DS7PR03CA0157.outlook.office365.com
 (2603:10b6:5:3b2::12) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.16 via Frontend Transport; Fri,
 14 Nov 2025 23:31:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D6.mail.protection.outlook.com (10.167.17.7) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:17 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:59 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:57 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Fri, 14 Nov 2025 17:30:38 -0600
Message-ID: <20251114233045.2512853-6-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114233045.2512853-1-ttabi@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D6:EE_|DS7PR12MB8249:EE_
X-MS-Office365-Filtering-Correlation-Id: 500f56f0-e7cb-4fbe-015b-08de23d5e8b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uEzzV+7l1EVA5WPG+7ctvNYw75gaHtyx3qMZvxOaA6LaUKl5InLrsv+rYR+r?=
 =?us-ascii?Q?yedKLN9E8kIBmPxQYtOoTVunf04IyJStjv/hALqH2l+BGcVX0bTt01hjrUML?=
 =?us-ascii?Q?hILzBDh2BmpCbfxXrRnp5Ox++J7teaMxQxelKNioeP9AfhHoW/Z7VVo6fvCo?=
 =?us-ascii?Q?JSKsqdL+tspRf8IOYo3e8Rtyg+Kn11eP7fQEk5E5CjbdQ76DqSRqlSaJRBIN?=
 =?us-ascii?Q?0lIH958z15w6m4mB3jkWx0xF0pG+DeRA6TU8naLbfcQM/ycu17O/gS1hoj9t?=
 =?us-ascii?Q?FoiD43swM5NiT11K1zKGTtmujOrG4cz0C+GgMYjKp+v6ZEY8hElKeHjmtJ9Y?=
 =?us-ascii?Q?Ozg45x/z3KmV8kcQFGiDNPlBNaWnSvw4APp6O9hy84SRz/K2v7sF8CIgF21y?=
 =?us-ascii?Q?uxxn5bCBfhA8lferLKCzTQKhJQwly3JBl+4gPMrc14CcqcpLwXISaWkGFX4X?=
 =?us-ascii?Q?7dwY18btvv6/QK71GDW+GRLmvurc+hYd1CC7VIwd+y7AQSRfuTdLWP933BSp?=
 =?us-ascii?Q?R5OSuu5xS2upJRRsC28sNNWl/YB1Ocu2L9WGIuhfapExEBDUKiVPXd7hpG9w?=
 =?us-ascii?Q?4Wo37Q3/k+dSnMu93kV0UMiZLV8lRwKNdgqd2ThRNIWUn4lkwQHmgYjHoXS+?=
 =?us-ascii?Q?6p3Z70rPU5PZB17o8BKF7s0rteDeXELnB8Vl5P5qJrpz+D7g4Jz9jdrsF65E?=
 =?us-ascii?Q?paqTtxOiyvTG8BTJ19Kk6tTjzihcxqMIT8k18ScKV/Y9J8UGHX3guKJLRpo7?=
 =?us-ascii?Q?Dklf+HeG8jbm+uSUq8IiP5AAOyT7Mthxn80fnssVw425ahotSQ9MrwyjxrCG?=
 =?us-ascii?Q?9hpQu7iFPX2tx5mH1l0hJxc6cwkOtLocxZbHN5hpzJKCi2/0reEHEugX45vm?=
 =?us-ascii?Q?pOtypL4EIMPIx8RuWOrwPaCeQhUSu8rxe3p+VSSapchwnzmC9VPElFu7zEW7?=
 =?us-ascii?Q?OmotwFmDeLGiB8QWDDUHE1KaUl98ypA3cCYqgiwxct9seML8JpdEG+6fzODu?=
 =?us-ascii?Q?1R9yCxSgERE2MWESuAiFRrSOzPO7EgPZ+0p5ndAgH6RCm/6iegEq3mglBLn1?=
 =?us-ascii?Q?BssYEYbJt+pdJyCIACufwqozu/fhKHF2qJTCN4y5N5psgUOFNR/UC/mSCOOp?=
 =?us-ascii?Q?OJm4Zl/GJpcPQv+m2qqdBBGdGPJrduJmAI0VbYcwCscH6gr1SxAEOBSRSqUG?=
 =?us-ascii?Q?NDdKxMdEpayQOyoBlikLRsvyjBoXXphczjL6mEZwuscurHq+DiCcxHekkuCX?=
 =?us-ascii?Q?r/GyZ+WntQHTmreY1KAWJF67TC5n80wCOTDE16KsXNE/ka1/tV2mLRDCH3ol?=
 =?us-ascii?Q?/acYTBEP9HQwnt7P8X4dUA26t15BazRu7ytPCbQil27JAOxeMwk8yRCpaJyy?=
 =?us-ascii?Q?PtJD7yFKUi7qTBuVrESRq2Xog1uEeYA5IL1O0+mxIpHYR8Ky2/nhzLJMVmpO?=
 =?us-ascii?Q?c5/cIqEFhdYTADv9I0hwQ8+6YQ6lF53z8zpVkXGYeFhxproMH1ZjYeQtpQ/R?=
 =?us-ascii?Q?qV0+gD6X9eLkUbRx+NvD4mG2JGm1277eO5bTvYMTqifIxTiznTyXi6RfNUGp?=
 =?us-ascii?Q?60PfLSK27HigPlR3olc=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:17.0914 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 500f56f0-e7cb-4fbe-015b-08de23d5e8b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D6.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8249
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

The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
the FalconMem type.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 10 ++++------
 drivers/gpu/nova-core/regs.rs   | 10 ++++++++++
 2 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index ece8b92a627e..1867d3727582 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -448,7 +448,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -508,8 +507,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -544,15 +542,15 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::ImemSec, fw.imem_sec_load_params(), true)?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSec, fw.imem_sec_load_params())?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
         if let Some(nmem) = fw.imem_ns_load_params() {
             // This code should never actual get executed, because the ImemNs
             // section only exists on firmware used by Turing and GA100, and
             // those platforms do not use DMA.  But we include this code for
             // consistency.
-            self.dma_wr(bar, fw, FalconMem::ImemNs, nmem, false)?;
+            self.dma_wr(bar, fw, FalconMem::ImemNs, nmem)?;
         }
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 274e53a1a44d..f79c7fdae6d9 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -16,6 +16,7 @@
         FalconCoreRevSubversion,
         FalconFbifMemType,
         FalconFbifTarget,
+        FalconMem,
         FalconModSelAlgo,
         FalconSecurityModel,
         PFalcon2Base,
@@ -290,6 +291,15 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
+impl NV_PFALCON_FALCON_DMATRFCMD {
+    /// Programs the 'imem' and 'sec' fields for the given FalconMem
+    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
+        self
+            .set_imem(mem != FalconMem::Dmem)
+            .set_sec(if mem == FalconMem::ImemSec { 1 } else { 0 })
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
-- 
2.51.2

