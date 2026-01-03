Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45AC0CEFB0D
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:17 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 14EAA10E31C;
	Sat,  3 Jan 2026 05:00:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="cw0ZcXbV";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 633FF44C8C;
	Sat,  3 Jan 2026 04:52:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415930;
 b=X0UeU+lkXOEZj73c31FMHT0xTCuVAXRuGRwMf78UXR6SDgHG6ekYIF5YGqy40DZFeWHuy
 kstfUBRQXML/pqKyHCVbyhgSef1a2XYGYEUhm6vGEPoVLMFuQ1/pRxqMU/r2zr6P5NhvqPQ
 UD7NryE8FBsz2ph0z/gFzXg9zIHcx/EfUyNRbHeRs2z5RnEYf6zZNGg0Tvg1zeZz+mZni8A
 S7OEjdvxjDOPq+uZXjhE8pk+CU7B9Can1u05hSs68FebQ7keeSp+BVgInYTdhug5/0iMz6o
 t0/Kj+RfJGm9JMQspqO/5L9fSItHjddV7g3ALkjf/ZhbYx4I51H5x5tBO2Dw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415930; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=SSv7qOWTzAZdUgdbtDdCBv7xEzJyBQK2BCD+u9f5Puw=;
 b=QIC+6R92nEyTmDE2eeUZ+n1RZqy9vrCKZTBkDcTimguPYGnvrf8aVi4EW3EiZvI6m/7pq
 uLOoJVPQk55qttt4mqHBfyV1HPtxCCzRGiOfA5XchlsP8aco2w+jZHyF9J+ufVv6kGmDFST
 nHATHVFpGP6yaB+jbhW0+9Tz9IRZFXIZ212D8RUwXqF78XREcs4FAMmFGa2MbiQ9EiLQL3q
 N9AXQN3HN/veAJ00HXs+5eyub+W6OYL3zFPh2R2yENsB0H1EObMNRtx6JYD1IgXYIxTU//f
 Iayti/02KgxvKSINj9FtmXobQGRhyfiP+XK5Iy/zu59zKdibwktgj+RvyZwQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9CBD944C66
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:52:07 +0000 (UTC)
Received: from SN4PR2101CU001.outbound.protection.outlook.com
 (mail-southcentralusazon11012006.outbound.protection.outlook.com
 [40.93.195.6])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1F2F810E311
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:13 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RyDk11Fmvs4oXnn35nl/A3x8qXmx/HCoBeYPLjLAyc7/cBmd1ASm0wBxfyysyMBSkaZ5xTtDolBEm9CUpGdBlvN6znNK2T7lzGx4CX2lcSh7gtYO1omf4Y2BDzT8gZhwGarjmCjXB+ZAf3/Ra0CYlK/nZm3K+2vUXrQJzxcTc8/m8IsfimH3vL0M6ulugsptlZfHHdyNnlQdU0FlUf5d57IpuynwQjo9258Kvvif7MFkDdN6/x0vfiJX39I/KNajLz2IO0ByoCEXZ3r3jxdSh8qlNntTH25ia9GQ+3L0umae7EBsWlmSSmqm11rGs483+bb5IRmzSIkjwZ5sfqNppw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SSv7qOWTzAZdUgdbtDdCBv7xEzJyBQK2BCD+u9f5Puw=;
 b=Gphb2c+8LaV7hqcd5xk1wurUihjO5UDPIQRg4StOboecramwB/Rgy46wnYyjdrzBsAEUZXnfqqpLbGp1AexETDPznBkvi9hDAKBjO4dcYsrOKPxEwPhcMBGY8dd5VjVGgNV33E3iw1R0oU+DEnZRMc8Q7YE/YQwzT1o5iZn8Kdj2yAMsuiwMtFARzTxmWAlRpCPm9ZZn/kFVKF/J/UK4+2RQ3MogK7EKjcold5ujoCOTuVBlOj0tf/42jVO3UgVs4hj2y1KaoV6vuw4fEbjQ2ySCpEhjYTOFBrQCE9tTwSdwqeiQV+rMJnrw2DsQLT1ROaXqGBi/O20MwHktkWGcVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SSv7qOWTzAZdUgdbtDdCBv7xEzJyBQK2BCD+u9f5Puw=;
 b=cw0ZcXbVk+Y4bxSUEJOcN0ufMZC04+r2MBmbO+yiMIesi0/gMMqdcc/l+ph+jApOVx0u/Rj+v3HyA+pOlZCjetWDz0w4niNYAr4Q98MJG2yA6vSj22pPne24OF5LrAxJQfrytQp25zHz9V+Dd/JC+fpGdhNl8DTusf6f7iUy257NsUxY4EV72/rviAL77hxtgzcsciU82vEXzbHX3S+jAc+aMHmiukYMrURCawQjdc4O0AlSLyK894Ghg1/K4UshKdaUOhaUYR2XzDArDRQUaC5lCPfbWuWh2R/YXAGz+HjurT60WbPk9Kr4Po7o+TNXZRDrgzA/aIL57bNAR4zPAQ==
Received: from SN7PR04CA0099.namprd04.prod.outlook.com (2603:10b6:806:122::14)
 by CY8PR12MB7195.namprd12.prod.outlook.com (2603:10b6:930:59::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9478.4; Sat, 3 Jan
 2026 05:00:06 +0000
Received: from SN1PEPF00026369.namprd02.prod.outlook.com
 (2603:10b6:806:122:cafe::8f) by SN7PR04CA0099.outlook.office365.com
 (2603:10b6:806:122::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 05:00:03 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026369.mail.protection.outlook.com (10.167.241.134) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 05:00:06 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:53 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:52 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 08/11] gpu: nova-core: add Falcon HAL method supports_dma()
Date: Fri, 2 Jan 2026 22:59:31 -0600
Message-ID: <20260103045934.64521-9-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026369:EE_|CY8PR12MB7195:EE_
X-MS-Office365-Filtering-Correlation-Id: a24f8a1e-2d14-487d-a12d-08de4a84f69e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|82310400026|376014|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?F1fa85fMN1DfPchcbFyhg7A/Hk3969rN+RXD1vQTe6UeHf/kOJzJO5eqICZC?=
 =?us-ascii?Q?SKVzb8uAg6W+1tTp9IBYBqe34yTEslGhrbbiDpdWQgDlKmQDnTJll4sNmLVr?=
 =?us-ascii?Q?Nh0AvfiNQFSuLD8rteEhkslGethsbJosXFUokFrOkdtRCpd5rkaGwj7O0wSt?=
 =?us-ascii?Q?Cod0HP+hk+ia3vzJW2ovLlny6fZu7+FNcrlNVvGXkjQPyG9QiNtMfWAVtvqc?=
 =?us-ascii?Q?N8Nvu6qH5GlBQPpzXlhZttlmSENgtuyOgyt9qyWojdp45ZRpm43Qv1xUYlmG?=
 =?us-ascii?Q?QultNOTiI8HDNxvMYjaGY15twF3HMDaZRr1rHKpnhMhPGpqNcrTRVT1e2oha?=
 =?us-ascii?Q?bDFZhtGAa6MGe20Ch7j/JPZV89w9yM4ZAmlkLts9sz1UWYOpYHXH/u8ZyGDv?=
 =?us-ascii?Q?CpO/RcIu68f2RKoIfMX9xSKbVFhEVqNCeyyJ/VpH5vcBM7msB2XI7WBYCUxo?=
 =?us-ascii?Q?rtmMD+0MD0Jbtaal6eptCyX1Ah8aumyDQEe3fYCy0w6TtQx9rOEmHzuLinY8?=
 =?us-ascii?Q?+B+vWahfAcsjKSb4M+j0yot9JDLuWLr8HMHKBZwKncgy4KNEoU5HQz8EEwst?=
 =?us-ascii?Q?ogBuN3fuDxhctwioFmSyrkBebxDAoyCeFt1ChQlWXnjLoQ0PWpl29j4QkjKS?=
 =?us-ascii?Q?I3xMrEJfQ6/jixcfHFX8TbBRqZNBfuLDTGf9LXFdWd7LhwAnUzPxV+YbsE9W?=
 =?us-ascii?Q?ky0KUa2YY4qhpE/EWzWVKpEQNuOsjtk0oFmHLQHhIyWD5eiATuGE/CnOprwj?=
 =?us-ascii?Q?OXIcyEeE/LSJ45CPSmNjJquszLiunXD/+sXISGVrg1A8Zs858f4M+Gs5fOBO?=
 =?us-ascii?Q?zPg++bUZwPmWVlHKIONZ8QH64XikS3BZcb3eanvJigfwwznifgUgpvzLapZz?=
 =?us-ascii?Q?+lXFsuwLhiWl9rUWeIZK/k+yaSQxO7DdjXwtU1yIMQz6nZo3TeRH0qFjUzH1?=
 =?us-ascii?Q?i1461/wr8ZKmbZaPJSY3zGofEByk6R21OSRcUZmf4VI7R7rN72ti7BIpxZlt?=
 =?us-ascii?Q?X/zyiXWLDZjs3zsTQq50MLI6N6FUAK24lxJvEz1jd15EEr435Ai5XflBy7wd?=
 =?us-ascii?Q?1WWcQUrzVbzBb7LWn14+7G0/aYrib/cSw4OzNlYgPFk2hNhGmT2IhkD4ABMN?=
 =?us-ascii?Q?7zzEOUtAXkZW2c/WkH5JOilhPUv0wNgI6QTqDEV8TX3SgGda50XWBf7waB2d?=
 =?us-ascii?Q?mIrOJHS1G/sfVnqMrJgaqI6fLoQn7+Iil22DkL01lfDSfFDxrVXWMrSMLbUI?=
 =?us-ascii?Q?cmPM1hekpRLcmpR9E87BsgLLx7hOr44cUnDBpGnKT6V0ff7gD0uGYdRsFGMy?=
 =?us-ascii?Q?+8SB2eLjVodQor1Eq549Atgyv1UNyEtWyBaMpWPznvmgZ3uHtBcbOFddstio?=
 =?us-ascii?Q?IANO0sh/HsByrCSpOQ9dcF1Cjsj8rLK0AW07yWc7S6ix79bLgTuv4F6PbSKt?=
 =?us-ascii?Q?tb3S6Tyd1AU7MTPT13khSydrcq/P7xBA75Xz47lSQch6RBiXCRuLw+tCYqOj?=
 =?us-ascii?Q?7rLaZHMe9mhPRa/jvUkyrtNz5UcHGoBuBrtqf79xF401cnukeysq+mTFc38m?=
 =?us-ascii?Q?bTa0WQ+VYMt3XdsnIpw=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 05:00:06.5454
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 a24f8a1e-2d14-487d-a12d-08de4a84f69e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026369.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7195
Message-ID-Hash: 674U3Q4BFKV5LPQLFYJUPNXGNCGEP45D
X-Message-ID-Hash: 674U3Q4BFKV5LPQLFYJUPNXGNCGEP45D
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/674U3Q4BFKV5LPQLFYJUPNXGNCGEP45D/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-9-ttabi@nvidia.com/>
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
index 1669a7d19b1b..744f513da9cd 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -629,6 +629,13 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
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
index 5a263dc37d63..b2857293e653 100644
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
2.51.0

