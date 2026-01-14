Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6B2CD210A6
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:37 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id BF9E610E68B;
	Wed, 14 Jan 2026 19:30:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="MuXGvhyw";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 3494F44CBA;
	Wed, 14 Jan 2026 19:22:05 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418525;
 b=qakMqJwG6ZqlyZLxV3Wb7pfZizIGoYBen8jTgMMiPLUccYPzW2fAY8HLlWIldSyEUyExO
 wtS5wRKYJqSRtxT+eTUv3USU7zbhNFVTQR3mvVBdnVnmUkarCAiLAJMjjDjE4MQxgvgnu6D
 RP4uht9+wrhYvaLxGiHDz5oN1harATEHx0k5uLj+1hk75WxdEpUP8m8RrwKxa1Yy/cZ+3ja
 e2NHjOvAFrmm5dscnoWUFDfOvG4qe01T6dXpvssQZaDEpoPSwWGhpmMU+MbGQ7d289gLkmN
 4qscLT7q2tW6tv4t/2UclUCukm45j/4iQIJK2NIi6LElL9UqZ+XzGpshoxIA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418525; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=01RR2wHC/BfaBQk5XmdB7MUnzf1roBekq9A6YAzTjpI=;
 b=SxNMUXoZw8RlGD2Q/OxpYpI2FOqVg4XReHeWh4xsKOfVn16r0HCCQQQ16dfaTMiXHS0A1
 u/WW0XSuJ7EsTCtDmvAoHuhkmlwGgbD2gEJ2uPvS0THxMWRdcY17i8lFQYEJhggU/ySL41H
 f36i8m3tSyiIEVkCaKYMjhWxttgIZ04Z/qWnzSnmA+lZ3RkY+P/hfNJ5rDBx/1wBluyvN9z
 QAxNrKcalk4AtBJtYUOmlOWX9LtZx/WDTy36IXi2RKIiDs2YzVJLMw3+ocwwiD9ZfRvDKW/
 RxMuXvwxL9cL/Aot8aWcAOkrzOkzoZteDb/0W7RCKMPxn0+ogt5s8h1nZmcA==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 772D444CAF
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:22:03 +0000 (UTC)
Received: from CY3PR05CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11013034.outbound.protection.outlook.com
 [40.93.201.34])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 0D5FF10E692
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bSakkU5IvqUV4WTwx2+8hh31yvVFZHS/XFBY3p6YTnQhRimDTTmLaoMIjdmzDOxWBU0hXiTxSZj0UgciGk0J5kZ028esDFP5szbVS6foVUpkG7jjZpBtf90k1gqQU/htM4cuCFRncvmsRYghSNnbAQYo3x3UKowGszp+Tri7WR3/NB6EiAOGf2stuFWJ3kw4PSJrvExx0jScHrlndEKiFDvd2i/qs1WtvnPUOj06WLQC89tK5/M3Zo/3GZCJcw08S7rlTG13YY8DovG/3vU/lHfQElwjEA+U/W4ngC1JHpdx5AHwwTKSwnIQLm3CnT24LBRMxciFEgQ4oCnwvWz8ag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=01RR2wHC/BfaBQk5XmdB7MUnzf1roBekq9A6YAzTjpI=;
 b=ZXdW4iTcDKfk0l1x4eB0P/c5jcj9k1RQL3bL7xlD+Ynzs2gltFoS/2pywuN0ES8Tu9sw+JR1M458YlwfRHE2w8Kg/TZmbLDVSKgK6aHFGVzoem7UB+CQ4S92rQV1alWP5aSQowo6yQOHJSB/mioFPAMgpNg4qCkG9YiawDbToB7agd0o/Yfyk1jtCbFzzZoVsgZmOwASLMlLnQgxXgQ6GQD5VWEYBSaJkYK/buMlH8CA1rDx0Rn2/XqX2uvum4mV8LHkaXcbLOJzM3eZowOAUGCDGHoVpBkJBYUmpYp8GAWQAuquQf0cSVjnhV3RwV+8DAQQMdkmWXuCV1kl+L1coQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=01RR2wHC/BfaBQk5XmdB7MUnzf1roBekq9A6YAzTjpI=;
 b=MuXGvhywrrgrujYMwcWbD9SH+12uNVrsPPKgKCluS6SijSRgkSHzvhrMceBWjtHO9SirNwCcKt8XXS2CJHzqUlZUQAqxwkHmmb5RuGxmm8wOFFNsGxSgIOJtDKJ8VmOg/O4rVYvWDpnImV7lb5ov49QApGfDtj1KW915z7+S8KCnFQ2ZkZjthCFR8HuefAuA2whjkWT6FfFG6rCrR35RDslga2NGhBDXgdq5Ox+883mIHL5HWFvFvteNqt/o+/eiQ7i7S7EOidfh3pOp1ktI160i3pTLwLF8J4iu4vOPrYcX1ZGzcemL42Rn/kFXEn8ynFBRuPFMWpcvyM7lYqNT9g==
Received: from BN9PR03CA0875.namprd03.prod.outlook.com (2603:10b6:408:13c::10)
 by CH2PR12MB9459.namprd12.prod.outlook.com (2603:10b6:610:27d::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 19:30:28 +0000
Received: from BL6PEPF00020E64.namprd04.prod.outlook.com
 (2603:10b6:408:13c:cafe::d) by BN9PR03CA0875.outlook.office365.com
 (2603:10b6:408:13c::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.5 via Frontend Transport; Wed,
 14 Jan 2026 19:30:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E64.mail.protection.outlook.com (10.167.249.25) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 19:30:28 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:07 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 08/11] gpu: nova-core: add Falcon HAL method supports_dma()
Date: Wed, 14 Jan 2026 13:29:47 -0600
Message-ID: <20260114192950.1143002-9-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20260114192950.1143002-1-ttabi@nvidia.com>
References: <20260114192950.1143002-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E64:EE_|CH2PR12MB9459:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d060e56-2e53-4387-bffb-08de53a35fe6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?5ED5i6GO7+TiNdglpMfOL2xmhGpKh0SuiBmwtHBU5/GtT2hgcWSUCFTt54xx?=
 =?us-ascii?Q?LE0+88Uhd3RIPJwUcTdSRxtLzrpZ2D8OfX8qAG5Edsx2Cyx3tz3xiX93Walc?=
 =?us-ascii?Q?nEGdgOUAdD/5SHgcoXurnvBOqpGTScG5c5tIuVejhdlCAuKeZyZAmCtaNRnr?=
 =?us-ascii?Q?FElHHZ0cENbhdHVLzbhbQE5ZytwM6QfS1XxLhQTtNDSFk7sfW+5k4KeQ9/9q?=
 =?us-ascii?Q?k7fMpLsILRykJH/HOKVaKhQ9RTV0R/d5H7XGmJGRsWk5BM9dILIFzOVJ7Ohm?=
 =?us-ascii?Q?HY6s8aSawYDwgmr/7k5LNknztDgNLBE4k4y8PuTgzc+qJ2B8HxIM838UPZU0?=
 =?us-ascii?Q?eXiACVXVEj9cmsY5K69X+zY99a2+Toguztzuzm7JK+oKQwK6cDALyY3kQ7Kz?=
 =?us-ascii?Q?cTMR0GDJNLzvPs/N0Tz610u9oqpSlFDihA9SN50MBx4r+ZOYtdifz4eEo30U?=
 =?us-ascii?Q?f0avDeJ64kR1MVMAzqrdMk5BDjHP5zjeacxJGLZTip7dJfHMouiP5kIhQitQ?=
 =?us-ascii?Q?mYpCY9Qg6lQ7ITl+4ND0N7P7rXXkj/gsV2LJL4JCUuwoXGqhQ+oSOQMX4cXU?=
 =?us-ascii?Q?BNh29TAeIBJw64mbMKg9S3pr9zEQd9/zz6XQvbDw0++OhyeePuCMs3haYXB+?=
 =?us-ascii?Q?Hf9pCKQlN24dCgxn6AYHANT1+CWSxoq2t+LCEbbZFCg5VWnbLl9lWElVUZ08?=
 =?us-ascii?Q?ifnkdkYr/fyRzm6lANX5TiCvC31dVpyL5sAW39SFC+7qoC+dkjKlyx0hSYzB?=
 =?us-ascii?Q?8qsemHiCKHysWDIfP12+oN5wpRUjhNMwVYDQ4FZyqes/2lIkT6qo6NbUCVN0?=
 =?us-ascii?Q?EJiVlNkrkxg+JVhBrjz39LYxqI3AIW6ROp/2O1pSZ0I9W9VL2tSBMp8h7jid?=
 =?us-ascii?Q?x8QXkSJdTxwAK/OYR4oZeV8SCh5Kwi/lQaHwYiqQaruxfmkdRCct3yP3Lruf?=
 =?us-ascii?Q?yBGN/PlCRs8lIqpD7EHfX+uE3S4zCqp+FG5eiaaHAju4WRFwVRmqMiJ5Ei76?=
 =?us-ascii?Q?J8eB1sH/ma/ZeX+YLSx4XZypGWXQhsxAYzwDiScDtIM2fMgI1H336ziPVMJr?=
 =?us-ascii?Q?0N8gZcKbyGYIkMbSPpyqyczqP5X+4rBdMn2vbxf6PARKJ7jy/cV7k7GzbqVh?=
 =?us-ascii?Q?4j3vMKPjwh/cbPZ9zoD74rmnPyMC28XrpMfUEdlWEa3PWnAvF8Yj9KiagEL+?=
 =?us-ascii?Q?QoxWtWbWqt8FQe1t/xEPiYJzjA4js9LZqzrEkUECuBmK0QXE0I2dljIJWx4e?=
 =?us-ascii?Q?NXiTo3T4WTAffMtaHtvemBwXxWjIEsl+wpruYeHgeTMXA2+HEXcgtzCkn0Oo?=
 =?us-ascii?Q?Yyy6RvXSrY/UIDXChW5hD6blAG5LG62lda00iFU5D/CjYzPabu5OqLhcgkAe?=
 =?us-ascii?Q?ATp2BKc43yiZvMOhk9VY9SdM2vo8SsjDV2wXjj34vuIiFAyK/h5CxSIMoK5l?=
 =?us-ascii?Q?Z5BWr2Anwhx0HTAhU1kdnTrMwZWqnj4+esszj5aAK0U0D6TzVm7tfdPwV4n1?=
 =?us-ascii?Q?TN5PjPwBrdR0N3ayP8d1i9sNvKWXAVhunjr3jqDGjbivSkJgxjbaHrITIpqH?=
 =?us-ascii?Q?IewPXCtepmva9RbAfoBppa0U/MibVMRdReOlcf0d0rJLo1dYGwYZ+SJeA5rl?=
 =?us-ascii?Q?yUSj8wpvRYsykG4QsuJ0WpyR5PVRHRHJzcJ7k5kJ//+0G82umsa+wz4/TfkG?=
 =?us-ascii?Q?6x83Bg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:28.5059
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8d060e56-2e53-4387-bffb-08de53a35fe6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E64.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR12MB9459
Message-ID-Hash: VNGDPR7DVV6UCLF4NHLRZU7RNCNTDKJ6
X-Message-ID-Hash: VNGDPR7DVV6UCLF4NHLRZU7RNCNTDKJ6
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VNGDPR7DVV6UCLF4NHLRZU7RNCNTDKJ6/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-9-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Some GPUs do not support using DMA to transfer code/data from system
memory to Falcon memory, and instead must use programmed I/O (PIO).
Add a function to the Falcon HAL to indicate whether a given GPU's
Falcons support DMA for this purpose.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 7 +++++++
 drivers/gpu/nova-core/falcon/hal.rs       | 3 +++
 drivers/gpu/nova-core/falcon/hal/ga102.rs | 4 ++++
 drivers/gpu/nova-core/falcon/hal/tu102.rs | 4 ++++
 4 files changed, 18 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index d779fcda0e2a..154e0de22c51 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -637,6 +637,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
+    /// Check if this Falcon supports DMA for loading firmware.
+    ///
+    /// Returns `true` if DMA is supported, `false` if PIO must be used instead.
+    pub(crate) fn supports_dma(&self) -> bool {
+        self.hal.supports_dma()
+    }
+
     /// Write the application version to the OS register.
     pub(crate) fn write_os_version(&self, bar: &Bar0, app_version: u32) {
         regs::NV_PFALCON_FALCON_OS::default()
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index c886ba03d1f6..49501aa6ff7f 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -48,6 +48,9 @@ fn signature_reg_fuse_version(
 
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
+
+    /// Returns true of this Falcon supports DMA transfer from system memory to Falcon memory
+    fn supports_dma(&self) -> bool;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 61cc3d261196..6ccbf42ba80c 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -158,4 +158,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        true
+    }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 586d5dc6b417..28dc03db8240 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -76,4 +76,8 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
 
         Ok(())
     }
+
+    fn supports_dma(&self) -> bool {
+        false
+    }
 }
-- 
2.52.0

