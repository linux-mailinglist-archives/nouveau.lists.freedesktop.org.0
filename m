Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D616C999DB
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B98410E4E4;
	Mon,  1 Dec 2025 23:41:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="nJB0i/XG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CO1PR03CU002.outbound.protection.outlook.com
 (mail-westus2azon11010019.outbound.protection.outlook.com [52.101.46.19])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D998B10E4E7
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:29 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O5j+yAvmWwU3SusQWXSTqEYn3JFqhxqRWkkxchg+o2aP7IKcjdFHY7KA0PnZ9ovq1BtcFNZN9bGRai7tG/2gBRSnArptwWtNveULWCWt0lHegt74f1mKvGJgM1yuL9uywP2lzW/7HQbZ7Yx47OjO0sqVGS30nsJhE1hQVlwVHSqBU+wvKMHRX/AXgEgaMtvaLRncvGCvmJIFVm5O+FqzK++eMiN1kM9uwfjAz6YH7MBH23jh1uoCjqAwsFvk/IOFw/ymfbaZnohXTiCiWcvwCHfLnttzSEY753K/3RmroUddR3K4KqW7Knf9DE013bAEq5+ELLKkn5YOG23WYDY4pA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+DXZNTDatgm7NCSuAFEwRfsH3BpusKIzBx+3+e04p6k=;
 b=liDMgZPSpDjZR8a+q3lf2c2NurbwHgbPi+Ru/6EBhP9UbqgPaAQAsLEWU9h6hoxjLGHf1wgDAPTAWP+DpjD6kiVaFB1dSdvhhGFQJN5vjYw4Cqhi3AsjnOQIzvUqluR67FypDjPnMi8J61mPwxWno3kYrKwJpoovCRDBHRqJfIyby6pmrfsrQnbZF75P8sNK743nvm8JVZheKoCBZr7vNnJZteOLaEivoemS1HqWx3c2lzarapW388b3D/4P2fbwf+nCjUPl3hDDQTlzpCzKaicx6HtEjZ8BoIXdH++6wbJFmfRpN7WZg/ZzPtKyHhgFoxfvLEueocaWmbjHbWLryA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+DXZNTDatgm7NCSuAFEwRfsH3BpusKIzBx+3+e04p6k=;
 b=nJB0i/XGt2Y7LEbTTQF1Pp9HSVb1/ApwZNw/cU0lRyIdgZmvJmp81gllqJgvsqKTU00ZwQiUY0w/Ywq1YxjLnKfFSh/8FNxu2sschWuLCC422R7aoy8Ui6QLOa+8WgUJHgj0zkF8YSExVIDWKXg/2kCmNBMYaO/dVkGjarnVBj2YnaeF9WYPZXZ54+MsG/LfU0vOS8V9JSA2rHb9e7b8yjUb/NupLh2lyIrGdMhH+lpiz8OsmX1gGsLq9WRKGrx4BJ9GBli2/OwCkZck84Fo/ReKzNBD6rbmJgu0oZcrD5ScjyK85EL6rxO7wu4MTAo3/UxzfZwF2gTowABmiH+ZSw==
Received: from SN6PR16CA0046.namprd16.prod.outlook.com (2603:10b6:805:ca::23)
 by SA1PR12MB7198.namprd12.prod.outlook.com (2603:10b6:806:2bf::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Mon, 1 Dec
 2025 23:41:26 +0000
Received: from SN1PEPF0002636D.namprd02.prod.outlook.com
 (2603:10b6:805:ca:cafe::36) by SN6PR16CA0046.outlook.office365.com
 (2603:10b6:805:ca::23) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636D.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:08 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 08/13] gpu: nova-core: Add basic Turing HAL
Date: Mon, 1 Dec 2025 17:39:17 -0600
Message-ID: <20251201233922.27218-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636D:EE_|SA1PR12MB7198:EE_
X-MS-Office365-Filtering-Correlation-Id: db506103-56e1-4aba-2159-08de313324c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?38egro/Q4GlhMYz3hlCOAh+/J4YADXDzNGnHvSfNRu9vMq/HW7kai6yLECdQ?=
 =?us-ascii?Q?GUIX1nuQaeGbPwFUz+2nc3VFhFs22YMjJPB/1Dd3L0yIGb9wNmrh720B1cIT?=
 =?us-ascii?Q?qyFj5aaM/CZr9y9Y3guiQ7OqvH9s3YOesI3DvWhgJnPgcHvzV93nj415OR9e?=
 =?us-ascii?Q?oEH/kOUGFtEYMn8nI6ireCJi52goY2yA37X1f0Pvyqz60utetz47slBuLa95?=
 =?us-ascii?Q?zA4zC0Ty8zKpFmMLzCqbjltLTKHGn/Wshc6C5LeqgyLyzQBNv3gCFV9qWstM?=
 =?us-ascii?Q?80CLWBzWnZVbNJXQHv++2dCGB5HAJhqMAynvo+UgMB/eMbqFhVtajrwpOg3l?=
 =?us-ascii?Q?3DYr03zSol9KpLtBdXqqV/+beBQoqRDj4bKabdqvX6p1pifvvLpbnHDZ8hXb?=
 =?us-ascii?Q?r1fQo+LXnEv90ifPpi/vS4HRrEmbk7P8Mk8x7HFVU1oh2KQ+2o79PlxFS/zg?=
 =?us-ascii?Q?91B9DAbzt6Bzb9AXn6E0TK2ES50sD/YUyxjFTtQKC1nxw+zJ6m/e5wdv2TWt?=
 =?us-ascii?Q?PxHl4NO5Kly3AspDkE9oMe3mW7v2Z/fHncNUK/nlcNMD8uX2uPHgO2iBkA5Q?=
 =?us-ascii?Q?BWMBkW8XFZFG8JDAXgQ2S8bSn3cilQRs1t3w9Oh7lGWJLQiubQC0rJ2sZHlG?=
 =?us-ascii?Q?19TY5csFGKCoVY/YHcZmC02xjNwDxByF+qW/XV9pZRKnza/XaQtCyKPbx04w?=
 =?us-ascii?Q?mJ9+CWui6h7Bs5lvd2VyfFXzMIKgkv7wf07JvTCGvugVXvagc+KaQyCrbpet?=
 =?us-ascii?Q?KVwPBlf6ZJdecPUeJjpFqHTZlLMK6h85YroQt6Rcys7hbs727s167XofYjED?=
 =?us-ascii?Q?geoYY2gyNepwcc2Aa/I/4CiSRsVh7czCM2mjrjNE37gLuXUlX6rZYSZwLCJY?=
 =?us-ascii?Q?dD1L2KFFAKrIOIxPu7IcBZgzrbfDXUAaGheq5y8CL0zll8YlCbCJNcOvSqAZ?=
 =?us-ascii?Q?/wNlvnfTUeStd1w5PDqwI7etMgXw12V2nrdlGMUFAfx3NRgYUNLJoD7FqR9Z?=
 =?us-ascii?Q?DzWiEC/8NnJvi5OZuvvXKZH3h7i/aP+zIHIPIYYyguofpPHRwEQe0Xf3Oadm?=
 =?us-ascii?Q?gKcDptCTAQe3dfmJsrX6orehvmGQ1IauWR4LNKkHKiaPjTyCNwRPBpefnmBs?=
 =?us-ascii?Q?CdgaHbm4rxFGkeNXp0edeSyIYBvl3uvgmcx7KwyLJeWfyzkUC7swM5j8Nvnr?=
 =?us-ascii?Q?NJuEh20qQPlDqFrUbYLlRIRS+wPerUr3Qzs4voCeGbT9KVyJIexxG0rbZpVB?=
 =?us-ascii?Q?0fDKW64XpJBdpYcb9mA+9X/MgzpSQPzqgni8Wu1iupdRHTXGlOl0iUWfSMGR?=
 =?us-ascii?Q?ohpkDU2ltV9l/8tjoVmgNdYniIVonKkE7+S3W+TERAp7Gl+Gc3YR7zoSlYPE?=
 =?us-ascii?Q?xiJ7i0iJAyp4d07AzKH+XYX/YA9xa5rUfB7EjFjh6oXWsmcA9U/3F5QogwWM?=
 =?us-ascii?Q?zazjHyP/huCrUuupUmyzMWOxKjPv6Kvesc+o/czlMqHyhy8CusARlBfIzxYL?=
 =?us-ascii?Q?0Zc01wISINv4YXj7G9L9Ive5ev+fXgrcntEl9uubupKAV9pPPV82Vi8J/MWN?=
 =?us-ascii?Q?FYi9fftxfF7W3KlNALU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:26.1528 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: db506103-56e1-4aba-2159-08de313324c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB7198
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

