Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB86CEFAFE
	for <lists+nouveau@lfdr.de>; Sat, 03 Jan 2026 06:00:07 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 237B610E338;
	Sat,  3 Jan 2026 05:00:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Dw24v31I";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 720B844C83;
	Sat,  3 Jan 2026 04:52:00 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767415920;
 b=RAJSf0MxXDT2lHCvQxD9ZdV0abMKXiwXLvS2V2Wj4vh4cLg5CslIUzFHQZTAY2GZi0HAY
 YW4++Zwp5UHjqJpjHia8nVeQUrs5sdw7GVNKuF2ppHyl0Fldp7g4yWzFjs6/9CNSfPmZxnT
 nNQQ39dIbCQeBhBwHLFlRyJa5yAwjnTiv0APu0OhkKoYJZm9PX+j0tnmgm+cny+eOO3Fypa
 Pn3O+vO0dKvBoxdQJkW2fnHkJW8YzWNdB/LmaQYOPpUPY6LX+Yli30NEQt8YyvBVug9Wlzf
 sMfAlmxem6dx4NTauza9yoCKrcAguHkjiWpPEY22VPxQ6GZZGUEbDCcdPc2A==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767415920; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=5jF3FWsb0wBTDatJ2Q6r7XpVY7o3Alj4ghGZG0HNzSk=;
 b=tjp+MvFoddsneGKnyAhhg5WDVl+OjjOZcVfnP/BsRROaWHTkeMBRJglRuspU6si/8Tjlh
 kd2n5xL7XEKFw6RP9dTxV/eCLsqX28eYGKF+n1nTDT8EspK0k2B+VcT6uFdzEkPLQVvTJAO
 3/hnWsh0kMeXuNnokwo9Klb9Ct0qsGfB4UFtYgntjPT8z8VDOtdycTH69iTfuthd1JqZhUc
 gT7zgQKVCzWz/4FHpQmfJZfc6DssA6CYKUb9OdzbkIEV5PDDFk8uGZfyTIZxQu5i5ys6dME
 0aLJP662VZ++cyz8sQP9VN14AXrZ2Ldii/vfoOV/k9YKNsg92lqqlk5FmjaQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AB93444C4D
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 04:51:57 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011046.outbound.protection.outlook.com [52.101.62.46])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 27DC910E314
	for <nouveau@lists.freedesktop.org>; Sat,  3 Jan 2026 05:00:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=I69i334+Sb3IK3wPikTCnPYQVva7XGr8wXzDuk6SWlPmapK4JWOyHXRbIfayATcGFBXJTc4nxpLMIjJTuhO72AypdDKrcXjLSXWSMY3kFVrgPzLMYoR9BX4sjNEfU3hyQkJq4kTIUdK7+44woCXRRU9Sa5MU+58zYHcGAYo0gXNLf1/yTl4AtWQFguV+ECiBxMWyTcpafhSpTrIdDatxXovhLjSzrgQXuhytBPscFfTcRrwv+bomwZiVXTjDcbfNoFjidntQr5hpP7hU1hOmXiJDHrql1/wZO9UIoAY7RgZIsZ/keMI3EgNAHqGbYfUm9w1hbHmGdsiTxC4srRwh5g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5jF3FWsb0wBTDatJ2Q6r7XpVY7o3Alj4ghGZG0HNzSk=;
 b=RjfQekGdJUh87Tw6yZicgt52Z1q4I7cc023/rMTpqYtvG+PIEycN1ztKcEpZUl84NqXmHcpY21CDEqWnn/cmvw/v9kQQPDgFQam9sEaW46GKp6xgn9+rnms/aWLzZLNYXRH32+1HtE6WAXn23l312BjSjP8LskvVhy0A2mDgALIpiFdrgLrk3+T9DV0EZ8bke927GTHzUpDovutr5oOOGvDF7alDJZs/vRLYnjPbXOUF/Abw78fF/OndO//YhGNi9VTcZLr/Aa4UO/JBLN2w5PtBIbbHx6Oycppm/b+sqUABq8kXjiN0JgkO6J7MxjEPqcRnsvcHMxwmRf+FfTgPqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5jF3FWsb0wBTDatJ2Q6r7XpVY7o3Alj4ghGZG0HNzSk=;
 b=Dw24v31Iyyg+LuyHQbpafR19KNQklf1T/khfkXezd6QTjHRGlu3T8FGowsdB4+SRYXPUScsBg0nh5fKYuiiXDN5oKnDy9VOvT84iJZVnu6xoSZ/mY503KGsK1kf+qjI2LhI3g4+6ku/jP6j2O/4VvAVyzic2wrGeRMajEaw5IhhmbGX2zZ8/QnBBuhDNHFm0qLrLe1EO6yW0EqPN+jKH47FYUr1V8ZSJhrPqQjetUpj6O4Sa0sHYuGScE2qO0FkA2XnAPUAqPY+pELbAkqGS1FdLMpFvN44rJBANCQPYBbjeCpiUiuHwZrLYmpTx+TCDnlq0ov77JIgcLyDgd6hrLw==
Received: from SA1PR04CA0023.namprd04.prod.outlook.com (2603:10b6:806:2ce::27)
 by DS0PR12MB6439.namprd12.prod.outlook.com (2603:10b6:8:c9::7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9478.4; Sat, 3 Jan 2026 04:59:58 +0000
Received: from SN1PEPF00026367.namprd02.prod.outlook.com
 (2603:10b6:806:2ce:cafe::8b) by SA1PR04CA0023.outlook.office365.com
 (2603:10b6:806:2ce::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9478.4 via Frontend Transport; Sat, 3
 Jan 2026 04:59:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SN1PEPF00026367.mail.protection.outlook.com (10.167.241.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Sat, 3 Jan 2026 04:59:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:50 -0800
Received: from ubuntu (10.126.231.35) by rnnvmail201.nvidia.com (10.129.68.8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 2 Jan
 2026 20:59:48 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v5 05/11] gpu: nova-core: add
 NV_PFALCON_FALCON_DMATRFCMD::with_falcon_mem()
Date: Fri, 2 Jan 2026 22:59:28 -0600
Message-ID: <20260103045934.64521-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF00026367:EE_|DS0PR12MB6439:EE_
X-MS-Office365-Filtering-Correlation-Id: 6dc44a11-81e2-42aa-29d1-08de4a84f1b8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?lOKdq6DNQsieKCSwFT1rvSDmkqnEVbegd9x6NDJQlsUT34c4OSR4xUcu5BrP?=
 =?us-ascii?Q?dvKTq+4L5TouVrAirW6fPMJ0nnMhSAc24Z9NOPXVUgQ8gVPIMGcefMb1LhF0?=
 =?us-ascii?Q?3uMqGwHN3OvTeNzGP9Y1RbFbzUy1WOdhpYxOLqjfMdKLDc5skU5jmXwBnWx4?=
 =?us-ascii?Q?iEpBCD947vT7zXgysAQoZ39UEmPMOhNggzRRR4GDunrupLZkVh12E3aiM4Im?=
 =?us-ascii?Q?1q2StzFSw6PDwqzEnrKw3tnwj0HRurk6ZDJxSPP40sExf3Ys3mtC+UkV5pIC?=
 =?us-ascii?Q?38epsd2R19w1y7UxGPb2QmUED4zErTsYqAFC96T12AoHlqqgrgkDvWV160jz?=
 =?us-ascii?Q?KhLpNt5NKT0vXclS9B3z9jyA9ADpFpWjZ7dkx5rmhB8IYto3YarKioW480jW?=
 =?us-ascii?Q?Ev4E8TXyq6WaOl12eupxo6UkLW/PAlW2XH75m3EPXb0ZXRL2RrkAsZ+rrakk?=
 =?us-ascii?Q?NE/A3Fcxj4qUtEy2ds2/0qhILLI9F9ouNXbMD6IU7EWZtibuSA1ZWxHDRKbA?=
 =?us-ascii?Q?D167V3XhsT9IQWXPBRHRQDqTk605X/NtZ/v41JAl/oBLN2vFJ9J9MHIl72vV?=
 =?us-ascii?Q?pPEtM5x+iZm2JOw6OVC3fTStqg7Pf1F5UtelvZUOIkdWOWmgKPrrKq9wthKi?=
 =?us-ascii?Q?c4BHHo4aWzzAmqdkSRQhhXzMkBsZbrVPQv2SUVg5VnAr0OK26tTStZgrwBcz?=
 =?us-ascii?Q?vJedOUdqO4I9PqyhptDfhDonVMVWuhgCzm1ugx/PEfTM60s/uTWSWNfhtQYU?=
 =?us-ascii?Q?+qRCChHdBaAjC0AK6T1kERsMH7tpSWSRkm43x4hu8vdrOcFGfSxRw50kLMSg?=
 =?us-ascii?Q?1T3mmmtCbsvdWdpI5uAuSv2I6scJQm5B3bXJi/NwdJRpoHcI+eI8P8VTpQlE?=
 =?us-ascii?Q?SY6WTjRml+aThvLniO3T6O0gM/iUu3atXy73bfLvOTcW+6WCGXyanM9VMo0N?=
 =?us-ascii?Q?4uS2d54o8zPvdZL8uau6pWZ0dzu9gpwBhiDsKfG+Lsc8Feh1FRskMxWBn/v5?=
 =?us-ascii?Q?br6AkgKvI3t9MMyLE+qSpQsGHrcqCxx/uFE0Ie15prYCg9UgDDaEwKdLjURA?=
 =?us-ascii?Q?yrKc26Clo1YVtCEn7PPXtXpb+vFv5Wkwh44hb/jER18SRicKuN1NKqV++swj?=
 =?us-ascii?Q?S70x0OYVdFn5rgkQyM9JZsJp1Oig2wuE0ZCeXISfkjhFuVRsqGi3lAXqm4WV?=
 =?us-ascii?Q?5eVJWALh48Yr7m2m9bMHjEwsqH0L6p1yFCK42qCJ2Fgw8mGe2aN8dfGQdCjF?=
 =?us-ascii?Q?z+abY/mOZAQcZr41vM7eq62SmT1ohM7CzmHWzjUmTeBXjtb+w/JqAK+CjJkO?=
 =?us-ascii?Q?U3zMqfJjM9LRiz5c91z9bo5xYXBYu08md3DQUsCvWyz4owAe9gOAxKydgdZl?=
 =?us-ascii?Q?904c2JeDc0XyqH4/i6lJJcN16ffXittilJJJp+y97MkCuW1qSqegTPj3eKjE?=
 =?us-ascii?Q?n0/p7uz+GRubj8c6kLQaW8GHDgGTp0CtnRlqFjgMqcVeV5u1jMT0EGV6mQC5?=
 =?us-ascii?Q?AIOuzMpxq/sUN6QDN8OOurbAPThLWY6veF3mN0ZDyzclxanlOO9Ot55o5tev?=
 =?us-ascii?Q?TsoF74TqEENVjZS29UQ=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Jan 2026 04:59:58.3382
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 6dc44a11-81e2-42aa-29d1-08de4a84f1b8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	SN1PEPF00026367.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6439
Message-ID-Hash: QCNWPPPCVDJNU2IVTCVKQFA56YAMAXEU
X-Message-ID-Hash: QCNWPPPCVDJNU2IVTCVKQFA56YAMAXEU
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/QCNWPPPCVDJNU2IVTCVKQFA56YAMAXEU/>
Archived-At: 
 <https://lore.freedesktop.org/20260103045934.64521-6-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The with_falcon_mem() method initializes the 'imem' and 'sec' fields of
the NV_PFALCON_FALCON_DMATRFCMD register based on the value of
the FalconMem type.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs | 14 +++-----------
 drivers/gpu/nova-core/regs.rs   |  9 +++++++++
 2 files changed, 12 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 974abc2de649..fd972ec19a67 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -454,7 +454,6 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         fw: &F,
         target_mem: FalconMem,
         load_offsets: FalconLoadTarget,
-        sec: bool,
     ) -> Result {
         const DMA_LEN: u32 = 256;
 
@@ -516,8 +515,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem != FalconMem::Dmem)
-            .set_sec(if sec { 1 } else { 0 });
+            .with_falcon_mem(target_mem);
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
             // Perform a transfer of size `DMA_LEN`.
@@ -558,14 +556,8 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(
-            bar,
-            fw,
-            FalconMem::ImemSecure,
-            fw.imem_sec_load_params(),
-            true,
-        )?;
-        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
+        self.dma_wr(bar, fw, FalconMem::ImemSecure, fw.imem_sec_load_params())?;
+        self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params())?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
 
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 82cc6c0790e5..b8ddfe2e5ae7 100644
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
@@ -325,6 +326,14 @@ pub(crate) fn mem_scrubbing_done(self) -> bool {
     16:16   set_dmtag as u8;
 });
 
+impl NV_PFALCON_FALCON_DMATRFCMD {
+    /// Programs the `imem` and `sec` fields for the given FalconMem
+    pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
+        self.set_imem(mem != FalconMem::Dmem)
+            .set_sec(if mem == FalconMem::ImemSecure { 1 } else { 0 })
+    }
+}
+
 register!(NV_PFALCON_FALCON_DMATRFFBOFFS @ PFalconBase[0x0000011c] {
     31:0    offs as u32;
 });
-- 
2.51.0

