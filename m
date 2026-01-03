Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 96844CEFB07
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:10 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6A75C10E383;
	Sat,  3 Jan 2026 05:00:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uMDqwWAt";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B37FE44C4D;
	Sat,  3 Jan 2026 04:52:03 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415923;
 b=vxB9I+Xa9y+W32EkDqQTme0jKTSj0XRkmOORNFFb1lfiI+wsmD+MIKBSiPh0igj3UETLJ
 HzdmJTtFcWR0uQdqbzEixw8/UP2XfxuTOghC5OqsHqcZvlxT/mrd8KZB0JQ0CSwSNJh8iVk
 a0zouYPlK+NGbYkX0o921xQoRHVJ80X4dOyyTpK0Vd197vFPeeKyUnEZCu+KBW0v9JBj24w
 wY4corlcfaZGYq1m5qUAiKRNKMfhnTK8G1k6LFyTdPm3hElPEqaTvU3304K6iPivpL1nu0F
 xR7q/n5QcO9UWt6lhKF88wh4Li4m9INUq7/2noB51Q0HYkDOkORSXSr21SAQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415923; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=PZO0VBL4JtyL3dXXOOppwavh2o9J7FeImQ1z0wVkHI8=;
 b=aUQlnZ66R/1DHh0YFXX8gVjFIe+YBuIph/QQ60NyUivT86c07uRAMFs20Xi6c6lB5x3EM
 Oe87LcG7tbIb9KJqMFLcOR4C9h7xkIoWeqIaVFFLSpdrexLaED9bueTPPk8Awvr2kcxKtRG
 WHKVIAsKcvZHX33FGeWaba6Y11uAnCnCS6bCz0AqKDGvzXOy+sZiVM9SLnfD+zZiIIaE1vt
 yaOuSk/r0oMQUcNYV+CWNRHVT7INX33xKMULGoA8ygeZOTUxrYM/BcnjIBMEDcBwssQVSIj
 829Wttwl63wqppW82MZLb4VsCHk7otsGldnLpz0YGbLEDLAOGlZ0t05AT6/Q==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id D6E7744C45
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:52:00 +0000 (UTC)
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010008.outbound.protection.outlook.com [52.101.56.8])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3BF10E339
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:06 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=V2LCmt1/+pCGTchcgzzRLRYXVFY0DNlLNRvua6T/MDT3m/w4KdXl9j0bfEQ1K60P6qMKNW9/KbSNc51xRKByMCrEDOXt4mqrRwG5kwIdIbzqhg3BdWPuIvqi+b4orGo2JuXTfMOIjbyhDwRifYCsVCYAhonZTzpdet8xNefCVWywL7BrZU4wE4TZnKptx4GF9dFOUTM46ek8tJi5VcEe4rFtt+ptihQPRk37qxVaRl9oOa+ojiYM5NkSKjKBUpvrIStvTZpzhRGUURYfWEsV+hJ7zHFHyapajRYSIWlVLh5iTADhsW7cqGikvUJBdA8T781By7p3LZ6+Dpfvx8JL4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PZO0VBL4JtyL3dXXOOppwavh2o9J7FeImQ1z0wVkHI8=;
 b=nHxwZFzEi0hTc5HuVHrPQKBkXVai7PD7qR3OLVtbx5DOxtwkQCiHfLcGjYClNb+0slR2pB75AG45LgostQCIvh4KmAbsshs3QfLcS4QnG3afv5vVuka59NsVihbv/cvYoJvNoKUqv2q4XOtX/o1UMti63eIXVTT6f0H0yUjvrkF2YDEhgkswNUb5Map4eDzJMpJDMLyTi6WGh2gtY4oZ6zUVBX1xUurgTyH40a8Sech4iL6P+02xtR9muJKZetoecN4I//Nt6i2U6ZyU9doNVGg93HdNH7bjCHdjXNygs+brXZDQzpm1ePgwV9wHLF2S90u+pZW6kx2UscTFGBlJXg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PZO0VBL4JtyL3dXXOOppwavh2o9J7FeImQ1z0wVkHI8=;
 b=uMDqwWAtNa6QvgryvvYMa/x3+OSp5utwMnapq7x9VpRz6NoTal+jKfAK2rTJb4Nm4y/z8yOYmWq3fG5GDD9RQIZJUzgKpBvkwmZr0R/k73/cwpPMdAONzSUHMPpj2JHdPaQdvG0SC17KxGDIkGJwsZfsqyx3oxM9oLNjzN7LJNlCGJ+Y3QmfsZjfuxHTSVZ3MK/erMON7Ariq5C1jOLK06wd9NnKrijf2pmqsPZ9iiZIibpzEw94LiSRXaeVApkGj/HvtsykZfhPOgy13DxpE2vRc7R/ZPAxcpyHWssovvzAYMTMZuerjHmvoPf60hpUzxxxNmw0RfZGDkBC1VDAdw==
Received: from SA1PR04CA0004.namprd04.prod.outlook.com (2603:10b6:806:2ce::9)
 by DS7PR12MB8292.namprd12.prod.outlook.com (2603:10b6:8:e2::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 05:00:00 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::c4) by SA1PR04CA0004.outlook.office365.com
 (2603:10b6:806:2ce::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:55 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 05:00:00 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:51 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:50 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 06/11] gpu: nova-core: move some functions into the HAL
Date: Fri, 2 Jan 2026 22:59:29 -0600
Message-ID: <20260103045934.64521-7-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260103045934.64521-1-ttabi@nvidia.com>
References: <20260103045934.64521-1-ttabi@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DS7PR12MB8292:EE_
X-MS-Office365-Filtering-Correlation-Id: 602b3770-6779-4fc7-71da-08de4a84f2e1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?XOxzkYYEC7XhlDuyY3NoqQfmDcLSXO1W3a2w4+kIM8QnhFwjDmzMeySVECbY?=
 =?us-ascii?Q?sxS6CZlpkYF/rTX82GMnw1kdE0XQJUcPa76OKaadO1IlXFz0NcWPCLuFd4cL?=
 =?us-ascii?Q?yIPEUizTGH6ZPNdwm2HFgzfHIgjocFRAHscV2CijZqNcGxyadJZqnCOBUCn2?=
 =?us-ascii?Q?ihhmsBr1omhA6K0M6lkqjetqtUlKm11eTh6zovjsXr/P/q7KaxhDJlr0A7Dj?=
 =?us-ascii?Q?olC0bCmUF4TMjyaSCzwdVRGdspw9CZast5Ybo0rl9TZJpK6twu7JfsfOepvU?=
 =?us-ascii?Q?eeWCu0APPJMAViEy9y+aDkkMvJiwYpGMf3xh7Y19DvrXLjmIaDsGpy7AP77y?=
 =?us-ascii?Q?Pi97onEajBlEhq7lnD7k4FBD4lanvZhsZ3ssRHPo/XDJpAn/H2+z5SfImlbT?=
 =?us-ascii?Q?YYaj7WcStG4mGlh1Jr213AdI4/Vu/5ujr5W9fn/3Qqg3FbndhkW+ZwZhga2y?=
 =?us-ascii?Q?K0w/FQN2MAPRlBSpGNR5cIHoNVOosYMKFWcdiOiNurWR/uNwaL6o4HGy8QWS?=
 =?us-ascii?Q?aCHQ5m1FhAfvcsHpcZfA6bQ6sbHJd0GEq0CJvmKTgXKs8oB0HuL7Fpzvpa4u?=
 =?us-ascii?Q?mGF52NH7uMKfysSCJ05OiupJlhihbi3+kmJRkuU8zRm+ecX3SzxRTNF5Xgup?=
 =?us-ascii?Q?KizAVzvgJmj+gRKNAMnBzHrzU8iEQhm83+vLk++uaqZkWAAbH+sZXhir0RXA?=
 =?us-ascii?Q?pntCdNCRe2dk89Tl6LAqGhyf0VDw4rzDh7sWNJJhd5X/jURiTMfMio2RJ54d?=
 =?us-ascii?Q?bU3alhEeFCijYFFFGejs4KSJCPZ0MO77w4g6eBO9Sqm8FyIEqqrZOTuaUF7S?=
 =?us-ascii?Q?xDA4mpZ0oLLcwpgF2SxXCQtTZ6rI2Ft82IbEaNl54rfi9Nh39LFlb4Q1nFo+?=
 =?us-ascii?Q?Y0MG+uJ2rSJHU/Yriq2orJ5Ulnrn6n7+G84pnuTAwhYiUKODmY3PVvEqOXwo?=
 =?us-ascii?Q?f7Tx+2bbGInLGvbn5GiZ2R3Je/fbKg9Ant02ySEwpbtp2qZnjK4VrYWYjJIY?=
 =?us-ascii?Q?CPMLiFRIWtog9XpQQaXqKc9/46Ql7yxWajytcTqAYXYgr4qFQ/N0RROaRu0d?=
 =?us-ascii?Q?pMoqQVjHOssil/TdsMWEzcFGDhKL+mUj/UeRposo6dq7s1Fi42gKQtYGZJhX?=
 =?us-ascii?Q?d03sBoG2HzjW+sKWHM0U1WrG9MiGtmTpmQpGToiUR4ofdgU0Z8PuZD6CQvcE?=
 =?us-ascii?Q?FsAauCC6swPijcNPZdEo7wPdX5DwsHlS8gK5nlQdo0gbpf88XiplwzhPLYL/?=
 =?us-ascii?Q?7mm0pWEzRlZ0KV54kFq+bQ/ttPhkQS6da9TRzN8ErEsD6Hw6YrJ9gmr2ump7?=
 =?us-ascii?Q?OFUz0MMGxsPj6PxTfhQsWzf70ZBOy5J9HGJ4VpUP8vPnG6GEZeAUeJFjzpEC?=
 =?us-ascii?Q?s0FBh8Z4RXKHl6ql3rW06tdYgPfs6Vegty6IKfbB0Loe/fqt2IckZ18GKUUY?=
 =?us-ascii?Q?wsGidulqhu2gpPKEUyvQpU2XOPtEe+Cy3hiNPkM3UzUAVO3uIjgIA5zc/7ql?=
 =?us-ascii?Q?geJ10veb28bqEWu98Se5EnxC5Re1PqJ4bTc6LiZKCTWVSIJou1X+iSNzgee0?=
 =?us-ascii?Q?Ad4w1KnXk1HtjbAPtTU=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 05:00:00.2823
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 602b3770-6779-4fc7-71da-08de4a84f2e1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR12MB8292
Message-ID-Hash: W4CTNFVKRKBREVD7HFHJLRB45MTV4MFA
X-Message-ID-Hash: W4CTNFVKRKBREVD7HFHJLRB45MTV4MFA
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/W4CTNFVKRKBREVD7HFHJLRB45MTV4MFA/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-7-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

A few Falcon methods are actually GPU-specific, so move them
into the HAL.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 45 ++---------------------
 drivers/gpu/nova-core/falcon/hal.rs       | 10 +++++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 41 +++++++++++++++++++++
 3 files changed, 54 insertions(+), 42 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index fd972ec19a67..1669a7d19b1b 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -13,7 +13,6 @@
     prelude::*,
     sync::aref::ARef,
     time::{
-        delay::fsleep,
         Delta, //
     },
 };
@@ -394,48 +393,11 @@ pub(crate) fn dma_reset(&self, bar: &Bar0) {
         regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
     }
 
-    /// Wait for memory scrubbing to complete.
-    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
-        // TIMEOUT: memory scrubbing should complete in less than 20ms.
-        read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.mem_scrubbing_done(),
-            Delta::ZERO,
-            Delta::from_millis(20),
-        )
-        .map(|_| ())
-    }
-
-    /// Reset the falcon engine.
-    fn reset_eng(&self, bar: &Bar0) -> Result {
-        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
-
-        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
-        // RESET_READY so a non-failing timeout is used.
-        let _ = read_poll_timeout(
-            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
-            |r| r.reset_ready(),
-            Delta::ZERO,
-            Delta::from_micros(150),
-        );
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
-
-        // TIMEOUT: falcon engine should not take more than 10us to reset.
-        fsleep(Delta::from_micros(10));
-
-        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
-
-        self.reset_wait_mem_scrubbing(bar)?;
-
-        Ok(())
-    }
-
     /// Reset the controller, select the falcon core, and wait for memory scrubbing to complete.
     pub(crate) fn reset(&self, bar: &Bar0) -> Result {
-        self.reset_eng(bar)?;
+        self.hal.reset_eng(bar)?;
         self.hal.select_core(self, bar)?;
-        self.reset_wait_mem_scrubbing(bar)?;
+        self.hal.reset_wait_mem_scrubbing(bar)?;
 
         regs::NV_PFALCON_FALCON_RM::default()
             .set_value(regs::NV_PMC_BOOT_0::read(bar).into())
@@ -664,8 +626,7 @@ pub(crate) fn signature_reg_fuse_version(
     ///
     /// Returns `true` if the RISC-V core is active, `false` otherwise.
     pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
-        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
-        cpuctl.active_stat()
+        self.hal.is_riscv_active(bar)
     }
 
     /// Write the application version to the OS register.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 8dc56a28ad65..c77a1568ea96 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -37,6 +37,16 @@ fn signature_reg_fuse_version(
 
     /// Program the boot ROM registers prior to starting a secure firmware.
     fn program_brom(&self, falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result;
+
+    /// Check if the RISC-V core is active.
+    /// Returns `true` if the RISC-V core is active, `false` otherwise.
+    fn is_riscv_active(&self, bar: &Bar0) -> bool;
+
+    /// Wait for memory scrubbing to complete.
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result;
+
+    /// Reset the falcon engine.
+    fn reset_eng(&self, bar: &Bar0) -> Result;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 69a7a95cac16..5a263dc37d63 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -6,6 +6,7 @@
     device,
     io::poll::read_poll_timeout,
     prelude::*,
+    time::delay::fsleep,
     time::Delta, //
 };
 
@@ -117,4 +118,44 @@ fn signature_reg_fuse_version(
     fn program_brom(&self, _falcon: &Falcon<E>, bar: &Bar0, params: &FalconBromParams) -> Result {
         program_brom_ga102::<E>(bar, params)
     }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CPUCTL::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        // TIMEOUT: memory scrubbing should complete in less than 20ms.
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(20),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
+        let _ = regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID);
+
+        // According to OpenRM's `kflcnPreResetWait_GA102` documentation, HW sometimes does not set
+        // RESET_READY so a non-failing timeout is used.
+        let _ = read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_HWCFG2::read(bar, &E::ID)),
+            |r| r.reset_ready(),
+            Delta::ZERO,
+            Delta::from_micros(150),
+        );
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(true));
+
+        // TIMEOUT: falcon engine should not take more than 10us to reset.
+        fsleep(Delta::from_micros(10));
+
+        regs::NV_PFALCON_FALCON_ENGINE::update(bar, &E::ID, |v| v.set_reset(false));
+
+        self.reset_wait_mem_scrubbing(bar)?;
+
+        Ok(())
+    }
 }
-- 
2.51.0

