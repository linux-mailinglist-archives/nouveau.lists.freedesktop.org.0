Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1EF8ACEFB04
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:09 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id E9A2510E35A;
	Sat,  3 Jan 2026 05:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EkVk6jV9";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 360E344C66;
	Sat,  3 Jan 2026 04:52:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415922;
 b=w+Hqf0O2DOzwMeSw4ucygSwUdmI1bDuDBI7C/O4qXKLZuTJ7fI9MOi1grlvbmCXW5889M
 5IOtmoJ6f1WWsvor7jimDoeJocYOZr+fBQ5NzqLpmTUlQhxLHf8FGqL0oaawx/g0pxtLVgr
 XEtrFDxFfIr9bCfv9Xt+NMVK0ZLb6mkma9cT1xmxEjPpdDVoaHSbg6GDNIE2petE1V5wImT
 9Btm3PK5YUkGTYH276GEjecJL+iYo+B0wIbjWkw90sbLcwH/h8xHUmtSqBR1TshUNtrsWgr
 PJvznNS6qBSDH2wVJMOU2o0Y7FTswQj0jvFWEMOQvRc5xDOotNYQjshh1Ekw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415922; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=GACGuelBXpvZCI53Z9rrJ2DOQd9czur+hZRIfyRU0zw=;
 b=gmPxxzAN8oMRBgUYN43LtiZBm6Ezocm6FVl3AAGn2eLfBfYurZpQvC5QrfLASbKDxJ4/O
 dGA+1MrJY+PjPm3eI0fnQ3Rzffq7MDqeXSwyDZ+yyNarhyZOmr1WkGX6XAe55xsAlY0vXW/
 z/Wifb+oKoH7o4oBIc5iWrE7sOmDZlRd3QYkV39Zxt8+IPIIVQpKrPTMaJVYdJzSypfkVcP
 1JhmmJkLYJeOd1W1o7dpBdI2Uxu7jeDfQo3UUiSHJtBbO20g56EcrdQzhaw0nO9lAx+kdDy
 5oIC+GMuJgEfjVXcr4/cpRhduhcnFjGrD+sSDRfXNPaxxpo/nQNnkXPKth6w==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5356244C45
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:59 +0000 (UTC)
Received: from SA9PR02CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11013002.outbound.protection.outlook.com
 [40.93.196.2])
	by gabe.freedesktop.org (Postfix) with ESMTPS id C456D10E175
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:04 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YkvwMh33shNHBU0f3Kyr+G20pbgQS1tT19tmjqzDrqrjphg0qffe5qhTHGoy0A7SYMNYbHbuX66RtJU1VzU1tixh6Vgn5gx3xqfqa7Q3/Md2vrtNPEpIN5ZjPhVc3zr6s5hzSRbu2FNjuvXtcfCYF1TJ9CjIp8YppmaFPs7uuXeZUQf6E/8H+A9E3nb3VzpPcW5QU9YirXtpnnduwtv2ZxQNdJVG2zbyv61A0CPCnmNsN0HzYZq2wCO0cSTndBzdYMHa9JHGj8uqlRPaWA7c8vjRJIlxu17TMOrgsL6bKw7ZpYyTkcXDNYRuVvMJ/Xgwq/b678zt+JdMKYf4HfLpRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GACGuelBXpvZCI53Z9rrJ2DOQd9czur+hZRIfyRU0zw=;
 b=Wqs9r8vnA5ZSBgkJl+5uDTqF57wIUTJj6T7oHjQNLllRFtGNzPmoY0+I1MXxFLlpzS4R/7M0hXGOED+J3bKEnZiKHCD1I9ozm8wBZKASGR+uZ0islVjfm7YlPmvGTMZ3t04WcACUh5E1ph5phn13uh9nWE8vb01ZUPhfLjAieJ5WxAgC0oKGIgwbXdYFmoyT+Twlo3n8ZrV+BxgPMU91k1N/nTUW/XxSb7RNPkXYHZGUJxG1ysgZpnZRr9z24KmJFpCbI06tEqOuEybNjveABN2pKvVHicfu0ioqovrbUfnrpRD6jCZmV03TwDYAF42PW7HO8yq07mTrnS5Rg7Y0UA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GACGuelBXpvZCI53Z9rrJ2DOQd9czur+hZRIfyRU0zw=;
 b=EkVk6jV9XcA0SYvjIzdFt4r2XzIeOpH+9m4NIL2Una5Dj++H5tqrMgSxcNNdbRHFc/zx/EwgKgvb8dWcj6IhK0vLja6c8mlxS/60ePbWN8E26i+rtS0pbhHFmztqwKq+umZJPLecMV5i1GvFi01lTo1rbN03jDEhmrscd8tbEkw15yXoiQAvd5Wfp/GOlXPZi4E5UXROZDCgNCVxhyjPIM4qtj96nASk1THiz932+Bs3njbswq3FFC0gb5wPxT4pQIVNqz7bZwPp3PN4V88ugmumYfaehGn1hKsJupi3gf1Zq3pdGFtj8Gduwxfqxe6k4T4sgRqEgd2+Zt8CriV4Dg==
Received: from MN2PR20CA0064.namprd20.prod.outlook.com (2603:10b6:208:235::33)
 by SJ2PR12MB8874.namprd12.prod.outlook.com (2603:10b6:a03:540::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 05:00:00 +0000
Received: from BL6PEPF00022572.namprd02.prod.outlook.com
 (2603:10b6:208:235:cafe::10) by MN2PR20CA0064.outlook.office365.com
 (2603:10b6:208:235::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00022572.mail.protection.outlook.com (10.167.249.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:52 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:51 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 07/11] gpu: nova-core: Add basic Turing HAL
Date: Fri, 2 Jan 2026 22:59:30 -0600
Message-ID: <20260103045934.64521-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00022572:EE_|SJ2PR12MB8874:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a17e98-1c31-41dc-ea1c-08de4a84f267
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|36860700013|1800799024|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?uun587ncHRrtXaw4f6HNdgoJ97amRtwU7H34AmTTBDUKnJTQwyzM/tAGYG9h?=
 =?us-ascii?Q?Azp7gpWVfPddBQijXZDcLVtSG4869Ed9WBT/bP4lTFDQzs1mWN1KrgT1OmsP?=
 =?us-ascii?Q?N6Zq9bMWZlPcNxGR5Dj/5Id+D0ez/oZTy3SjAdZfYCI8egBn7gM2ULup68jr?=
 =?us-ascii?Q?mcyBpTfsp+udGerHLHHqj0EdUwXBN1aOYAjInPmU7/SOQGEnEiP2DDO+FwGP?=
 =?us-ascii?Q?xtrBq+KnU1Pvf+AxkN5h1g0zo/Pj27nOwfyZJXE/MtdGBcSgsbpoNkmuM7QE?=
 =?us-ascii?Q?QewD4n6v2/vUq0tORrR0CAeG+bDaq3GFumxFrhlSvxkvtE8AA9dRnEzleYSf?=
 =?us-ascii?Q?jubJ+NitCBQOdbeN0B/ATqE4Dl05/ejJ/DlCBu8jiorjHou4V/b8cWKku5yo?=
 =?us-ascii?Q?nwt+r7o4F86UkYdLMAlooCEVc23i4w5vZkmNRYzSf99WooYwaEsHHUGSqH1j?=
 =?us-ascii?Q?z/X4X4C+GqvpF1ii0DnL4U8hrwuhC9KDYCmOBOBsvfETrNRIYUhkle78h9ZT?=
 =?us-ascii?Q?yTzeajTSWJhuYMtgsZeHurZyAQSUue/1n7D8+zY2bg0C9tMtvC4PTKSg2eRD?=
 =?us-ascii?Q?roN0JfR8NtwruSyfCFfukkHdHr+PLKDTLlHG+AfxrbFwJgB0b1m9M9i7z/9p?=
 =?us-ascii?Q?Rk/zbLj+j7V+q9gF9D3CcANQn/GfaeKAbAxrDt6AWPGARvVI71M2Etp6CozZ?=
 =?us-ascii?Q?P2TVkpe43KNLATiKbnrRATMn2N+RpbTdKhwavNa6szOAO0M0CEWVLc9e59K8?=
 =?us-ascii?Q?Un1mWonN7w0LIdjXSFUG9uFQzneaGwOvo9FPMd57f/Cj50ksSnXG7vUXBlZW?=
 =?us-ascii?Q?JFkmItBu3ZrW4btI3FYHpV00+qg5ezZnre+1NBYssgnIH9T3LU44UfLJ7oP0?=
 =?us-ascii?Q?RvANjD554HhxIJUtAWM+HK51PT+xjTmfyzjQVQN7ddkb9jqD9N4jv5G/eKh7?=
 =?us-ascii?Q?luU0qqAQGhFli9Pxi+o2ff3sECzXqfCH5AReIWhq3hf6ZZG4AGCXnRzj+jHr?=
 =?us-ascii?Q?L55ow/HnhRqFhWyjWBNNarB+gfQlhdrLAGQBHE6asbFGQbrnto2V0M+urBJB?=
 =?us-ascii?Q?Xn8ti/EkkcbM1pprWEHoVanqO1VCwYdf2AyZ1RjMyZSxG4dl0SVZ+FAtJrXR?=
 =?us-ascii?Q?EO0xqmwVFIfIKpEoVdFyhT0FPB6v1zKUwqBJymkErJybteXTQsB7esyg+xPH?=
 =?us-ascii?Q?3hN/pEOg73VXWx+Os25WLQpJnI2TuDcWq9Kt82b7SI0wyBjFvRtcvhYagnfm?=
 =?us-ascii?Q?/gUU4v2MOjSIF1t1TTvo6YHD5ILl2jAqhzT1u4ETYvYF5Z34wm35bHxS3BrN?=
 =?us-ascii?Q?QpDxRFODmF0x9pwJt0/pe0Mng8JZ2ZdNsl1uLJEV0KHSFNGcW84sk3kpod/3?=
 =?us-ascii?Q?RvNbnzjmipmZKORSQYm17XpsT2RLKhjARZldVcPMYunM4R+oqpbFBGVC6gmF?=
 =?us-ascii?Q?De3O0TtcqKEvlpy7FH8N+ew0USJxXRQfPMG1wspjEtIwrUf34GenMdGufeM3?=
 =?us-ascii?Q?KEOCBw/Zpopo/1SU3dlcrPlxeW0fdmGqcWstmP080UHvxiKD8IBwnAfkgjtQ?=
 =?us-ascii?Q?IIJ74S+M/Vr/7b54ffE=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:59.4467
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 98a17e98-1c31-41dc-ea1c-08de4a84f267
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00022572.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8874
Message-ID-Hash: 6MSTHE7DRXK2CZC3IDYTUW2VSVRDHH4U
X-Message-ID-Hash: 6MSTHE7DRXK2CZC3IDYTUW2VSVRDHH4U
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/6MSTHE7DRXK2CZC3IDYTUW2VSVRDHH4U/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-8-ttabi@nvidia.com/>
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
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon/hal.rs       |  4 ++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 79 +++++++++++++++++++++++
 drivers/gpu/nova-core/regs.rs             | 14 ++++
 3 files changed, 97 insertions(+)
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
index 000000000000..586d5dc6b417
--- /dev/null
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -0,0 +1,79 @@
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
+use crate::{
+    driver::Bar0,
+    falcon::{
+        Falcon,
+        FalconBromParams,
+        FalconEngine, //
+    },
+    regs, //
+};
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
index b8ddfe2e5ae7..cd7b7aa6fc2a 100644
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
2.51.0

