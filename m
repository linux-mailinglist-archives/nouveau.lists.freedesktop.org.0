Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53D9FCAE667
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C2010E41E;
	Mon,  8 Dec 2025 23:18:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="uhRcen/J";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010004.outbound.protection.outlook.com [52.101.61.4])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866B10E3F0
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xBkqQjoaElXteekm5FMFGW2Bu9qVgHRy7PAvUogreRPPVl76bEn+p/mOwToN5qMEvH/W7towwVGeUC/qRtGfA89hbwlekGWrhjvLT2IpwQlDWXYMHe6sEjT5fbItXx5mfxeY21QOufC+VSdVr6suLqTeDMBj+SOZ3sZGv5b5UkDHl9pwRuxlccPx9/Q7Z889pkNGiUjBO25hnGTYzplt7Fmqqpnj5Df7e3r9DPv80zpmIl00dZEg6NvndcbE0RzInz/hPQtMp7y5GB7O8LzY8woqgQBHZqvlw6TimUCzBd/XUeoL4tUi7fbg4wGQaTfqLA4SzwfyLkpWXHjMIASx+g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DXZNTDatgm7NCSuAFEwRfsH3BpusKIzBx+3+e04p6k=;
 b=ZghWobA+rA0w6LTgaHQZlGK9I65me/J+hPQhzzGnNJBtmV3dTCLIoGLulJhJIDG1oXJi1j7Ecx1mpYCXFVqv+tdflODl/4xdxguiSiQ0Hk3Idpf0DbRFgyuMqWep7CeNWVKe+IALlcD4qb4BsyKS+r2/lH8fI8F1G2EgQEkzDb/ijF1bMBQ52ITQmWH7rg35T5hjw4Vw65YMLfUNwA/8JqrY7wMEzibS+6SMmGeIddabJIkMeOpT0H3L+k3/JLxYjSh0SeqjcRMbG6yaMPeffW7Kn9LSITkeeq5okz4kQ7Wh4WGs7WS5n32oDdLYDrqbmErxsFKxUYzQF7cN3iSC0g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DXZNTDatgm7NCSuAFEwRfsH3BpusKIzBx+3+e04p6k=;
 b=uhRcen/JalK4beEvNlNqVSpGqFjUK9WQKSLfC7yr3uQde3gOb6go2UgJDnxusM0cf3cBkIM9cBQ49cpzoPOvF9NTSch0fXg72V0un3uCtumTdLHn4UZeH2+TBnlW3oLCYUZpmHSrI0h/YywbMiVDdr+rB9b+53CXQqDYb1O99h0Sy06xjvTkSQDwJtVbhYLGOfiTT/Zka26wkoNX16v6monDdJD5NTtXGWiZP6m3mBfJWz34tT2A1nSfngZXH4aoliW3VU86olP9WYZEwNSYbQkNLVLrnz67Oe8YyfDkk6YL8yrPtt2RDyWX8WXQkt4l23LCbNCrcYmEnzaA6Xxy1w==
Received: from DM6PR06CA0071.namprd06.prod.outlook.com (2603:10b6:5:54::48) by
 CH3PR12MB8259.namprd12.prod.outlook.com (2603:10b6:610:124::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:33 +0000
Received: from CY4PEPF0000E9D5.namprd05.prod.outlook.com
 (2603:10b6:5:54:cafe::37) by DM6PR06CA0071.outlook.office365.com
 (2603:10b6:5:54::48) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D5.mail.protection.outlook.com (10.167.241.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:18:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:19 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:17 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 08/12] gpu: nova-core: Add basic Turing HAL
Date: Mon, 8 Dec 2025 17:17:57 -0600
Message-ID: <20251208231801.1786803-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208231801.1786803-1-ttabi@nvidia.com>
References: <20251208231801.1786803-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D5:EE_|CH3PR12MB8259:EE_
X-MS-Office365-Filtering-Correlation-Id: 788837b1-20c0-4b1b-182c-08de36b01b4c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+mLeGrYuR9vryEFjHp7MaC9BeDvUc28hayxnLxg/xfEK3fj99s50pODT6TaX?=
 =?us-ascii?Q?Y5M3JHdiwnCWf+mV4EbmWksTNJ1D7DKX0vIBKc5AiMwUoANR1ICduxhXlP2N?=
 =?us-ascii?Q?PHuaGcGZMpn+ueS7TVcQ3KBfWVqouFQ2mtxopFW2F2IM7tmbX8yRyb3fwyIs?=
 =?us-ascii?Q?QZ3nIhTzrUqCr1zZ8BVJhQy8aWgQnYzs2JghO6w+LzvkLBc22tXwzuwUFOEe?=
 =?us-ascii?Q?FUH+8TTdEdfthQfKY6VeEYGzzWVfh6ssldGINQGzq8MaJmvf97AI/vkhzOdw?=
 =?us-ascii?Q?nQ4DeMixoitEKNhtgY6le4LlFGpj1WMyk4MxbXX9LzeYA924Awwd+b7/lr9A?=
 =?us-ascii?Q?UT+qmnn2pajjQmQIXmeU9F6KTSBJOwrX2H8JXH83g7TeVMqES5oUagUn+Vo7?=
 =?us-ascii?Q?vAi8xiVdOOwD6vdyPMAdLY2BUIDSfoNltzAA3oZUwOD6z3m/N5iHtFt5B9eb?=
 =?us-ascii?Q?t3pfzOAh7B5SFfHInllhsKaPhQ7BRTm5ezXlMkkS+saoVOU8wb7AURoTtUtW?=
 =?us-ascii?Q?d1jRAk2IKqcZFheLESi+yZ39nI1kY6SgoOWH7dV95XpM45r2E5iwSBVSdf3j?=
 =?us-ascii?Q?v+ZY2HBuiJdRpT5A+vxgZ4qJ1xqeBfS2CijY/AJToQHU0Crlw2gH39Kye2+n?=
 =?us-ascii?Q?gTE+BH0vcs3W1wY+pomkf9T/qhuDYNZqMFeUCdmstH8y1QFvtFrjXeevLFva?=
 =?us-ascii?Q?2G7kPb7HM46ht8bjZFAPyw6FIdaUDUCcGtXNQtLWo5vJ+y/7b0Fr4oXsefk7?=
 =?us-ascii?Q?iTGE86Ed/1P0DHKl4SQRfYLUAPSrG1fTXCTTvdlaFouXJCiSoxObHdq63A2n?=
 =?us-ascii?Q?5dx/1k8lP3ytAT5z2jo0OyGHlzTDxhg0rDq551T3dAAtAFSqstFYmOc8fn1P?=
 =?us-ascii?Q?Iw37kRaRoGoACcJ6ORnrKnVE7ZOpi4Gha1yb52d/B2yi/0fqUPHoO6VnYy+v?=
 =?us-ascii?Q?oPcL+UfPwOeYXORPK/g+g1Hhg8AFVWHF4ARiXGzFzYxnUXHwd4TgpzPTZT2I?=
 =?us-ascii?Q?XCHwgkTnI9PdUlsurt+vKDoislo22G8aFKRhWPIKYMZ0haff7ShdrhsisQR1?=
 =?us-ascii?Q?tiujwI5bVAghFvQxHBJEJWKMi2y52KPC4Li3zIopargp2SCi/C371M1AZ3UY?=
 =?us-ascii?Q?bjWP8eE48XcJs0M8uXr79brA/+/OopGjR/J37pQvhvdZaqmWKfSdSxMyU59A?=
 =?us-ascii?Q?gQSNUWOUGTZVvVnzXh7dUzntv8JXGxS9tfymsVfyIRJ/epTe15IPsiJJyHRv?=
 =?us-ascii?Q?TaxtijQL7ZS417xHuNK3dZQqhFnjetpomuGZdYEms71KPo6hKJkxEc79bdqN?=
 =?us-ascii?Q?+CcdoOdyyKwzitSNxP6hlsbTEEiyHyZJCGZA1KO1GuA81YD1Uo37kH319Oj4?=
 =?us-ascii?Q?/IVz4YSiLsDh5Mgp01Mdhr+T5Alh1U5k2nbz4aJdc12pP4S4OeW1TQr9UAcP?=
 =?us-ascii?Q?w1bC32Ex87u6PyYOTI946ULhT1k1npicH8eH7J2G+MfbOwWNGp95jvrec2iD?=
 =?us-ascii?Q?x58l3bnGwr2qVXrqQxCF+0rDuQ67TmrS9wQijBlYnD8nBqYfMZvzQUx2r60S?=
 =?us-ascii?Q?6byZ4ilq49bNfb9p/mU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:33.2067 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 788837b1-20c0-4b1b-182c-08de36b01b4c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D5.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8259
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

Add the basic HAL for recognizing Turing GPUs.  This isn't enough
to support booting GSP-RM on Turing, but it's a start.

Note that GA100, which boots using the same method as Turing, is not
supported yet.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       |  6 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 74 +++++++++++++++++++++++
 2 files changed, 79 insertions(+), 1 deletion(-)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c77a1568ea96..7a6610e9d0a8 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,6 +13,7 @@
 };
 
 mod ga102;
+mod tu102;
 
 /// Hardware Abstraction Layer for Falcon cores.
 ///
@@ -60,9 +61,12 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        TU102 | TU104 | TU106 | TU116 | TU117 => {
+            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+        },
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
-        }
+        },
         _ => return Err(ENOTSUPP),
     };
 
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
new file mode 100644
index 000000000000..19a8b49ca2cd
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: GPL-2.0
+
+use core::marker::PhantomData;
+
+use kernel::{
+    io::poll::read_poll_timeout,
+    prelude::*,
+    time::delay::fsleep,
+    time::Delta, //
+};
+
+use crate::driver::Bar0;
+use crate::falcon::{
+    Falcon, FalconBromParams, FalconEngine
+};
+use crate::regs;
+
+use super::FalconHal;
+
+pub(super) struct Tu102<E: FalconEngine>(PhantomData<E>);
+
+impl<E: FalconEngine> Tu102<E> {
+    pub(super) fn new() -> Self {
+        Self(PhantomData)
+    }
+}
+
+impl<E: FalconEngine> FalconHal<E> for Tu102<E> {
+    fn select_core(&self, _falcon: &Falcon<E>, _bar: &Bar0) -> Result {
+        Ok(())
+    }
+
+    fn signature_reg_fuse_version(
+        &self,
+        _falcon: &Falcon<E>,
+        _bar: &Bar0,
+        _engine_id_mask: u16,
+        _ucode_id: u8,
+    ) -> Result<u32> {
+        Ok(0)
+    }
+
+    fn program_brom(&self, _falcon: &Falcon<E>, _bar: &Bar0, _params: &FalconBromParams) -> Result {
+        Ok(())
+    }
+
+    fn is_riscv_active(&self, bar: &Bar0) -> bool {
+        let cpuctl = regs::NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS::read(bar, &E::ID);
+        cpuctl.active_stat()
+    }
+
+    fn reset_wait_mem_scrubbing(&self, bar: &Bar0) -> Result {
+        read_poll_timeout(
+            || Ok(regs::NV_PFALCON_FALCON_DMACTL::read(bar, &E::ID)),
+            |r| r.mem_scrubbing_done(),
+            Delta::ZERO,
+            Delta::from_millis(10),
+        )
+        .map(|_| ())
+    }
+
+    fn reset_eng(&self, bar: &Bar0) -> Result {
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
+}
-- 
2.52.0

