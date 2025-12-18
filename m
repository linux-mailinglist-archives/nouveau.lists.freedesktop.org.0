Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C765ACCA2D9
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A0CF510E7B7;
	Thu, 18 Dec 2025 03:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cT+Bv1pM";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id BC14344B1B;
	Thu, 18 Dec 2025 03:23:06 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028186;
 b=ZJIwbObm2No3r07S8tj4H2YmqKRVzDLhu4l5u/FOcX2MbLeLmgUm/YweyyWARVERW3xfa
 YwlLMIe4WkquK9Wzt4IHuY5HnvYhkXoIu/1ijtf0rygtd4K0GGH9K76sPGO8ZAFchT48QKi
 +8SNQc3Bb2aXXa7COptQppOijQEYs65QyLOuevAgmknE4JienTrWv8t8UxBMOckjET2kEKC
 edLuZrbWEsknxeOmYjVxTnu1nolP02LmURMUy/e3YVtsrlcltlvvyjoLGsjkOY/wT3iLGYW
 jWQdcI8wa+p1hddh4hutGKc3o6Vlh7zPy2Pbho1eK4lNFRfbbxGDPqBOyE9A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028186; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=gDHJj3ODMA4o84khoe+xJeG6RO8WxZse3D8tdl0MKMQ=;
 b=whj5YX5Ogi//oP1JYKiGfpUh0D9M5yCE0Lc1uvGfM8QD1IJ6/AXvS2eh96wToeAl7Krt3
 U8IpUdUhJAGiQPIFrIgyimWCrjRuCCs9of7h0ZcIX1Hvtk5j4OeEh9Ep2GSkQ2ZMa/kyJbK
 rOXvsvQE11KrMW56YTB1Ihph82eWItNfq1gNpe/rSXlxrsRnRDo5HQFvzDwLMsyZWYmGVki
 eIM5h3RivXANw1EEn4/5qVBSYz9rXrVj4bM2aMxAZcKyT4Dezs4LAPE4Qjn5sAcNtyFwhjq
 vvdPysPda6q99eZiMG7PCvLxgFUUynr4NVKIOJbXo2zE2r5lKar8g3W9ho9g==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 4ACDF44B0C
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:23:04 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013027.outbound.protection.outlook.com
 [40.93.196.27])
	by gabe.freedesktop.org (Postfix) with ESMTPS id F124110E539
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BdZ4GHlilezdpP/Sb76WYcX3XVp7ey02bgs0hAXtra8gVCpXoKZGlszIFTlMrGuJkOH9hPaqYfwbqb0Rll6tVg2QUJBdBUVHrU8O3HOrmetRTyk5aTzHE0zZTvIP62xWSVg2RBlnAQiJ6ndAGdVistL1L5pC9TacxrkE4Vx1gyHRj9kpMTZkHKVqrP8gt6Lx85f3RBdsGrX8S35vphRFgD1MExpkYn9Tq2jM9/S06Bux1Nk6ESSbIC5yd3xpBwWixZkQG8+OQ0SmDFPjAMSzcBOQrVsxiF79XHRllA4X7ViTnfn6QMBt5u5GermZFzaEtCFB+LuZ9q7Q4zgHyi79bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gDHJj3ODMA4o84khoe+xJeG6RO8WxZse3D8tdl0MKMQ=;
 b=WqxMjaznjWXDog3OOtrVM8jK+ZsKd1GMHzWUZD/RfxMFZR59xp92EaJ1k6M3WsI+fi2N6mOgTEswgr5GF15yBJjY1BgpnutGfTDUlXQ1e60J+l4fAO69W7JG+t67Ddv4m8AXljhf5U1AEFiqdtwtJL7vFuzJhPLVi7kKSwBQPltDZF9af45AN4T3vvJuxr7veYfKa15nA0DH3+bU4bcSm+8VH2B9l5IC30DXoaVrn//JW8ZzxZg4vq4ROVJWPmDcPsFPCw5CmyH9zDIJwnvccmBzVr8z/nbpmGzyK0azr/4u80OOeKdPf5/xGwwMBeDmxNQz8IqnAQR4QHv0WYhT/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gDHJj3ODMA4o84khoe+xJeG6RO8WxZse3D8tdl0MKMQ=;
 b=cT+Bv1pM359irAA9mm59QFmXjX5+snAEP1oSqTfKfCofmTf3/owTSuHYVLPH+we41j37g+fxhxcPvmWqD8ERKU9SihNByJ6m7SiPHPMBSDCjdRXYWXbxmsl6l+XLdEVCqDG9UF0giPj3s3b68iSX9geCzWfUv01JfTcfK5eB8SqQMmBGZljvwHz0Ydsl3UUXXehKWAmSf87LGgh+IezAHGcqMh1SMizINAYyt9Azuxrwp3QFP6nrAxaj3VPxLckw7Vj9zE28zRq7OLnMTBEqbBWgKVIVQx9G18LtIq9WJzZsXNJjVmH0RJNVFiUHfPQUQgCcsiu8kCUqV6DsSDW8hg==
Received: from SJ0PR03CA0244.namprd03.prod.outlook.com (2603:10b6:a03:3a0::9)
 by SN7PR12MB6887.namprd12.prod.outlook.com (2603:10b6:806:261::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.7; Thu, 18 Dec
 2025 03:30:26 +0000
Received: from SJ5PEPF000001ED.namprd05.prod.outlook.com
 (2603:10b6:a03:3a0:cafe::4d) by SJ0PR03CA0244.outlook.office365.com
 (2603:10b6:a03:3a0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 03:30:21 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ5PEPF000001ED.mail.protection.outlook.com (10.167.242.201) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9434.6 via Frontend Transport; Thu, 18 Dec 2025 03:30:26 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:10 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:09 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 07/11] gpu: nova-core: Add basic Turing HAL
Date: Wed, 17 Dec 2025 21:29:51 -0600
Message-ID: <20251218032955.979623-8-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251218032955.979623-1-ttabi@nvidia.com>
References: <20251218032955.979623-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001ED:EE_|SN7PR12MB6887:EE_
X-MS-Office365-Filtering-Correlation-Id: e00ce5d5-e69e-4bfd-cdda-08de3de5c8f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?H8Q5Q6xxHIw/2KGaE5bGuDS4DkNYQSU5mCA3f2KPKW4PTCR7vhGezKuiM7K0?=
 =?us-ascii?Q?xD0xd5RRWrbXggtiowJvkwaBWzRGeYlpeH84bO7SOR//ugzoZv+Ulh7zwDql?=
 =?us-ascii?Q?E4HInuTx8PBcJiiUtrNlO9nnEJ0UWd7QSBHUmdCvNeJK879OK1mKQ96oxBH/?=
 =?us-ascii?Q?GicaUhU8PnKucLCc5O3DcIY1k14af37Y1Pv5dBAwerz/0EmNKjOuQpAtfTtJ?=
 =?us-ascii?Q?gnSWLM+w8HuENhFtfGbterw+88WndvsTEVX0cPeQLWP+XScaUCPafXV5SemG?=
 =?us-ascii?Q?WzDC6AxDQGHWDp2s2Q5dq/5tYuqLhC2avkUw1/LVkJSOzGc/4zKb1WycPLvO?=
 =?us-ascii?Q?394lAkntw0c2hjcjRnB9VdsRFjqygE/1B212j4xG2N/Ua2hlq3B6XuwZYAKx?=
 =?us-ascii?Q?AHMTcdA3/17TgMlh0i7w0IlurBixF8eh3k8ImX5lOsFBK42R28X/uYW0Zjr0?=
 =?us-ascii?Q?uF5DxDj4EQKMQmWxw1TN/zl4zqvUWkzUH0b4h2Jk7axiNa+Ozq83jYsQa1c9?=
 =?us-ascii?Q?JK4JH5WuxuTUlUPfW4IulndMaPEgk/mUvM9xXRCNakPJaLvTACTGkyinNbUR?=
 =?us-ascii?Q?NoSv5yQeE6p5bCOumPn5N3lcHO5+m2ga/tBQnRtAfc7X3jk1NsWmLTNmV0hx?=
 =?us-ascii?Q?a34lKuiAQtejJ2qIYhPiZTgfcHh1YjFPpOKmcMynCSfNi74ca640XUg1NLwk?=
 =?us-ascii?Q?PQBVA/fYgAiaOpljpCya2hCwWWHahG4N5MJe+sSkNKW2UQNrmCkcUkVZAw+I?=
 =?us-ascii?Q?fxuFH29yscHmmCrbb1u7ql20Qw7WCkHUmDpNPz6bKMqXkKSBTgkdAnOoQlam?=
 =?us-ascii?Q?PsJOJEZwjG1cAp8TWt/Sig+Fz+t7hZ8UHnkUkVZfJbAk0/sn/zV3e36GbeWt?=
 =?us-ascii?Q?rbEy+UIg4aw8/7oEqULgxn8jcjOguMR/zQjIMLGBKzfXnt/XGctvH/qD+F5s?=
 =?us-ascii?Q?KVQkN1wGFe1SY5IdERrha/fHBEFXHAyUMPr4kvNfGsv/kj13N7WezoQjFabT?=
 =?us-ascii?Q?uUmb+k+4LW0uHYoUiTyjWWnvOXbdtKVFwf0XOpb2XfEsswyoC1CNLrnAFhw6?=
 =?us-ascii?Q?srDTaWNtN5bACIUN8mHPovUrgCfuSsXRlUfU+fMaLlB/xjIYbOP6LV1CPIxm?=
 =?us-ascii?Q?AZbhyZy8ekZFPef2uVO4Y3V9zCMFwT9FOWbhKZ0u4eT/ikgXk2UnY8smHKBh?=
 =?us-ascii?Q?mYLfQUHpXh7DIURYU+xSIZmoLOuhFbeYQITpctF30bTzMNyVTJYTGuyWAmVa?=
 =?us-ascii?Q?JZaCeUT4yNHOAfyXBd0hkXvogtVoy0OhBfHEt3oe5uPD4xmmaC/dv6IZcW4F?=
 =?us-ascii?Q?NYp753XIBMtSobCiBk2GxCNPe5fxlDyMHm+2Xh5DwakDLiVsqNmzv0rSqgOl?=
 =?us-ascii?Q?WfMf7dYsjVoYPcXCxUB1dzw9jDo4A7cw4l15v2ghn9HAwq9DgNGpN2p7XBoC?=
 =?us-ascii?Q?BH4/RLTkmDm0GtqeNeveCOAcCLdbbqLJrpXeHd/pV0oFOdPh82ZWLfikTIBG?=
 =?us-ascii?Q?Ibqcm7EJK1MvIf+e95bg92gVuEiN6qKGqZiWcIFTDfqyZEIlivfsAHA1lDrw?=
 =?us-ascii?Q?tcmS/kBpgF8+MMKqLgw=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:26.0813
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 e00ce5d5-e69e-4bfd-cdda-08de3de5c8f0
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SJ5PEPF000001ED.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6887
Message-ID-Hash: 66RA45WKYPZWGC2AZNYTGXIY3YACKYDC
X-Message-ID-Hash: 66RA45WKYPZWGC2AZNYTGXIY3YACKYDC
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/66RA45WKYPZWGC2AZNYTGXIY3YACKYDC/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-8-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Add the basic HAL for recognizing Turing GPUs.  This isn't enough
to support booting GSP-RM on Turing, but it's a start.

Note that GA100, which boots using the same method as Turing, is not
supported yet.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       |  4 ++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 73 +++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             | 14 +++++
 3 files changed, 91 insertions(+)
 create mode 100644 drivers/gpu/nova-core/falcon/hal/tu102.rs

diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c77a1568ea96..c886ba03d1f6 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -13,6 +13,7 @@
 };
 
 mod ga102;
+mod tu102;
 
 /// Hardware Abstraction Layer for Falcon cores.
 ///
@@ -60,6 +61,9 @@ pub(super) fn falcon_hal<E: FalconEngine + 'static>(
     use Chipset::*;
 
     let hal = match chipset {
+        TU102 | TU104 | TU106 | TU116 | TU117 => {
+            KBox::new(tu102::Tu102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
+        }
         GA102 | GA103 | GA104 | GA106 | GA107 | AD102 | AD103 | AD104 | AD106 | AD107 => {
             KBox::new(ga102::Ga102::<E>::new(), GFP_KERNEL)? as KBox<dyn FalconHal<E>>
         }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
new file mode 100644
index 000000000000..ac8f58ef6789
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -0,0 +1,73 @@
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
+use crate::falcon::{Falcon, FalconBromParams, FalconEngine};
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
+        // TIMEOUT: memory scrubbing should complete in less than 10ms.
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
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index c049f5aaf2f2..8188a566e1ae 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -307,6 +307,13 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     7:7     secure_stat as bool;
 });
 
+impl NV_PFALCON_FALCON_DMACTL {
+    /// Returns `true` if memory scrubbing is completed.
+    pub(crate) fn mem_scrubbing_done(self) -> bool {
+        !self.dmem_scrubbing() && !self.imem_scrubbing()
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFBASE @ PFalconBase[0x00000110] {
     31:0    base as u32;
 });
@@ -389,6 +396,13 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
 
 // PRISCV
 
+// RISC-V status register for debug (Turing and GA100 only).
+// Reflects current RISC-V core status.
+register!(NV_PRISCV_RISCV_CORE_SWITCH_RISCV_STATUS @ PFalcon2Base[0x00000240] {
+    0:0     active_stat as bool, "RISC-V core active/inactive status";
+});
+
+// GA102 and later
 register!(NV_PRISCV_RISCV_CPUCTL @ PFalcon2Base[0x00000388] {
     0:0     halted as bool;
     7:7     active_stat as bool;
-- 
2.52.0

