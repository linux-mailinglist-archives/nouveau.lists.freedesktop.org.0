Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C07ADD210BB
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:57 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 9EBFF10E672;
	Wed, 14 Jan 2026 19:30:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KOzDro3J";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 13BEF44CC9;
	Wed, 14 Jan 2026 19:22:25 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418544;
 b=Fx02bZ+kSlgYrFIgA+L/1VSL8NalftrpK8Pdb0UtklYfIK4KZSvz2KpdTbhj9Aw5/+spF
 wLNc15T/Yi1MnwC6d+C0/+1a8C1tg3MiRE7GC39fl+rU3zxzoJ0brrWSrl6V5lySmV4PEy7
 TayckvCZH77oYRusg1EHQp5oXQJJ9uMRiqj7D4uuDKLTjPCQ1HSZQ99uKEu/YlwaIag1QCn
 2JiZeUozRdyBF4i3Gefj3OVxjnvA4WDWB8bDGrJPQGwGTUIuCnAgAjKbSGfDzPrk81iwbEZ
 ei5RbCDcBx/LYmFFQFhBx9MyQd1+uEI7lJriheH15nJ2/NbmUyCTPMhTHRQw==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418544; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=VOnih5vmFMhAFRGeP2tQLZe6sEhtdE+99KQCtwWJBpc=;
 b=CfceQp0uQ5LbvANx4CWH9NVq13qIitXHqzazpP3hFGKfaHoFR98v8RwvGOlZBSG7ka7lm
 wbZa7O3e4EgcJ2wh68DiV8WnntcfcetbL2KLwkqpKkZ/1NX+Ig3oR57mAAuesud2l8zP6Oc
 4OfLeICPG3Lo1lvbOw4aIpjOwfemZmQT0EMz2i3kGCDsvs8ELxyBfs2S/WmIc3n9YkWlzmW
 RIhpMaqnrTvnEZkxYR2DsaUI5jkXBC0YvE+OII4VRWRFIAMD28fpuEpc4EN8BuCkCu+6SDr
 PDxJmvdxV+2atBIDeww9Q2Hv/klXKlA/wQHgc4/FFn12RQOESkXyn8e3uDBw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 5F89644C87
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:22:22 +0000 (UTC)
Received: from DM5PR21CU001.outbound.protection.outlook.com
 (mail-centralusazon11011060.outbound.protection.outlook.com [52.101.62.60])
	by gabe.freedesktop.org (Postfix) with ESMTPS id A696410E682
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OKQsegzcPUdOn+3C11fsElcpoQQDbP94472Qhct07i/j+BJ+ak6EnIUZu+qtV8wJetZDMHCfwLFu4Icdysq9lAoWLYVZ2FRi8NLRuMn6v+2rK3QjzBD0NbbsHQ/4fHx2K2yv2rOBZtG0JiJV2izuXiuWjYyDDf8keLsx0OeqiFVnP9MgnXz7QMVvZk5JVh/25aprjFRlr0o2ITuXHb3539OhI7fDbtzYxYd0DbUtO2akbOWd+rHjaUYII4q9LjRlqTqQe+m9E+jUVA1AOdOPkZSG/utY4b1ZX87qgAQZIkWppscWsVf/i3Op6R/RH/Dq0unEPDOP0mkVtPB+zkrqfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VOnih5vmFMhAFRGeP2tQLZe6sEhtdE+99KQCtwWJBpc=;
 b=IzVvlZqdkckIt9P1Xp8dCd32IVpI+qoohm4Z/DX2sxnONhjgobQSsqcglp3hqknOUM4MinmOjhqwKQfPOqMzBvBzJ3Dy89XTnBDSdPtD1PUXfAWtejdbCunB/mbI0EUlySTCfjJNBC4VhJdAimRllZzur4GtoETqOoowd+St/rF1bHVga7VrFTv+bQ3ZfljiVJm2ve9ZSztwGBp6hLbDCjbgTCBbxDZAHB98SFxW+mMuQfvwXVPPUlb6S51q0gRZ/4kTcNNghRQwuhXg6fT6G3RiDMCYwzNX/Mz0slFu21UQbi7N8pJzJusb3ijrE63r0PtGnvmIhGtR6screBlaSw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VOnih5vmFMhAFRGeP2tQLZe6sEhtdE+99KQCtwWJBpc=;
 b=KOzDro3JenMKieS2CSCPaNoJuoKsJ1tJFumb5WPxWDylNgFwA9afX1VwyqKxZFtCkA06oo4fdeJEAQdL6m1mqzzNyGmIjJCetL5gegWh4W61B4HJFAoWxZO/24S7RQGPG8dU8YSoq5UHOAUWaYyvZbXXM7AyPSIqQgYCqzlU+kHBrHttlQKvwCeCByjIuFg6Vxe9fgn3wdcZ89JDWkiBv1H18VnOqLV2uxaSS80uXj1ICbZM0MV+y3JpSbfiVFmWoJdnCVXp6LpzkLc38RXW0A94dYCLfReKJA0TwgiDXjsgHw/fBGb+pTumUPBBuvRNOLTPy3A0odRzpB8EzdZWrw==
Received: from PH7PR10CA0017.namprd10.prod.outlook.com (2603:10b6:510:23d::10)
 by SA5PPF7D510B798.namprd12.prod.outlook.com (2603:10b6:80f:fc04::8d0) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Wed, 14 Jan
 2026 19:30:42 +0000
Received: from CO1PEPF000044F7.namprd21.prod.outlook.com
 (2603:10b6:510:23d:cafe::80) by PH7PR10CA0017.outlook.office365.com
 (2603:10b6:510:23d::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.6 via Frontend Transport; Wed,
 14 Jan 2026 19:30:41 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CO1PEPF000044F7.mail.protection.outlook.com (10.167.241.197) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9542.0 via Frontend Transport; Wed, 14 Jan 2026 19:30:41 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:09 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:30:08 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 11/11] gpu: nova-core: add PIO support for loading firmware
 images
Date: Wed, 14 Jan 2026 13:29:50 -0600
Message-ID: <20260114192950.1143002-12-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CO1PEPF000044F7:EE_|SA5PPF7D510B798:EE_
X-MS-Office365-Filtering-Correlation-Id: d0e96a70-8383-4f21-f2b3-08de53a3679e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|82310400026|36860700013|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?bX0ornimk2/VqE5NKYAdK/j+GmO07YJxOJiKcV7QzR4QWGGoMTV9XsmSw8SE?=
 =?us-ascii?Q?gkctIAp/chqGa6M/avpBtGUI6X0EWcImg3u40r69w7wmyNPPbhUKSmsr8pDF?=
 =?us-ascii?Q?B8yhUkhukBj9VEn9u95N83MuSWDXQmCXOSUStVzbaJQt9y43rQmFlZJD0uSg?=
 =?us-ascii?Q?CfRPWAo3ezy8hSG8eT1lBW5cgh6VYcdqG6TIaUjIiQlQUlST2gYWjEV1zKC0?=
 =?us-ascii?Q?MgOYUDeWrKqG07EaZWYAxMbe5KQHYOnroj2wW+4Hy7OeGzkQ/sOVlFjYtC9E?=
 =?us-ascii?Q?5DVF2ydVV4zHmIxqAEySgEqliB0rqcc044GWpJ6KPq1tVMVJR+Un42yhycwi?=
 =?us-ascii?Q?D/DEOqiLpllaV9h2xemr8XfLsW6Fox49Oj9XuRAplfb7HRQvVyuaDqXFblyn?=
 =?us-ascii?Q?vDJzZtmKHNR76XP8WfJ2zhMmzyOupdfKIYcdPja1LQPfipwf9lhenQhBI6eV?=
 =?us-ascii?Q?I9WoSWbTceB5ZulqpazAw1N2uLgraXdnqh62wHOUGDGFSN+99GyjiRdCYSGi?=
 =?us-ascii?Q?GR0NSsM6UJFoGaGXpEykO+E70D6uGZ30i2VDvzxuOmOSd4Vj7QumhmuhZU2C?=
 =?us-ascii?Q?eRxEe+se4BTWTagfuhRdqNoUNddi6SHrBk5PPHZYYSDO7Mg2x1CUXRpc2UYW?=
 =?us-ascii?Q?wYHWNyaEO/qSwS6LLx+BGSapjOeFoeKuKoO9eLMCi507pWEVyEIHustLkyj8?=
 =?us-ascii?Q?nz9uZg3YIUHkhxbFsPh3iCAng4ySbhFrB39W1RnZDsZ2XGN1ROc4yxzSCGjh?=
 =?us-ascii?Q?2sVno9RJyG15EGvbszwNsI5aJKdQlhn+ssD9dPYU/Ai/YFosQF5yPr4k2cdH?=
 =?us-ascii?Q?tBIF6iNUQwueWyPIQjQJnDsFT7rYD623jBWMJ8F0jG1wkAKcrc7uWl35XR1b?=
 =?us-ascii?Q?mtSCs4hPo4Z9DVP9MyH+K3YCZ59IxZtf0k+gz14PWBdou63Zj6gMyPU5i3sy?=
 =?us-ascii?Q?cXDPuZiSp5l5UybLis7CvLWjw8p/0C35U1ZzZfHEmURWNCYGG7AovFXKjmZ2?=
 =?us-ascii?Q?S59cxvg98AicWOy0kya7IKfBC6oQ4DJvoy7Q8/O9MyUHfFaIkXriRwwoMN3k?=
 =?us-ascii?Q?sm3c8OHmjW+T/pEKlOUNVNp1M5k/55JIPJmFC7XvfcUqgo2NuiFHVO8IaB6g?=
 =?us-ascii?Q?W90vHjjJojY4cDCoEtiHm92z7HpD9zM1sLk0NLQyZ4f9GdoIHsf30XN0yw9W?=
 =?us-ascii?Q?UArhs/+5v0WRZoRPtcBNWcJ/xHXYcMD/H6w8eWEtywcp8V9n+MWaAMYIQ98W?=
 =?us-ascii?Q?J+ZRf1tbI4xn7yELATMWoV3VljDwEjhRBY2j0Yhz1RBAUBbqJTY1OqKXSAcg?=
 =?us-ascii?Q?qojEB353GgY3fXt+3FBW3l+VQcY/7FZ4iJzReSlL/qztVnAahm/u/IXArTj0?=
 =?us-ascii?Q?kMCphHZRGfiGlE+i97vSKwejSlYizmSW2AvEMQ+uiicT7lntf9pOi0JVCjw7?=
 =?us-ascii?Q?39hO9xSWKOc8paBqlsu8PEYASSoEu20UZrX3j1Ns0lwxCkaLogYGbwu7iNhF?=
 =?us-ascii?Q?QMGQ5sgPTrwz3dkDWJRMur/EvE0wlUXLveYK850Qm4NYsxjd8LmFUOw4rLLn?=
 =?us-ascii?Q?nRBOv7s9yXS7GdAOvKy2PGWNVcHq74RngGZqFs2OWlD6kcOCQthj88l72twj?=
 =?us-ascii?Q?f2OtphlSgOPW1q8j/QBax+PyYujZGIHOY8SAWtrix0SmC1d4EN0x0Jz20GgI?=
 =?us-ascii?Q?wzJnKg=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.161;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge2.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:41.5051
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 d0e96a70-8383-4f21-f2b3-08de53a3679e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.161];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CO1PEPF000044F7.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPF7D510B798
Message-ID-Hash: VVBF7QCG5OGN64MRFVGSJE7HIFQT7NED
X-Message-ID-Hash: VVBF7QCG5OGN64MRFVGSJE7HIFQT7NED
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/VVBF7QCG5OGN64MRFVGSJE7HIFQT7NED/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-12-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Turing and GA100 use programmed I/O (PIO) instead of DMA to upload
firmware images into Falcon memory.

A new firmware called the Generic Bootloader (as opposed to the
GSP Bootloader) is used to upload FWSEC.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs           | 185 +++++++++++++++++++++-
 drivers/gpu/nova-core/falcon/hal.rs       |   9 +-
 drivers/gpu/nova-core/falcon/hal/ga102.rs |   5 +-
 drivers/gpu/nova-core/falcon/hal/tu102.rs |   5 +-
 drivers/gpu/nova-core/firmware/fwsec.rs   | 129 ++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs         |   6 +-
 drivers/gpu/nova-core/regs.rs             |  30 ++++
 7 files changed, 354 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 154e0de22c51..e7d0b6e87125 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -18,11 +18,17 @@
     time::{
         Delta, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    falcon::hal::LoadMethod,
+    firmware::fwsec::{
+        BootloaderDmemDescV2,
+        GenericBootloader, //
+    },
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -409,6 +415,169 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
+    /// Write a byte array to Falcon memory using programmed I/O (PIO).
+    ///
+    /// Writes `img` to the specified `target_mem` (IMEM or DMEM) starting at `mem_base`.
+    /// For IMEM writes, tags are set for each 256-byte block starting from `tag`.
+    ///
+    /// Returns `EINVAL` if `img.len()` is not a multiple of 4.
+    fn pio_wr_bytes(
+        &self,
+        bar: &Bar0,
+        img: &[u8],
+        mem_base: u16,
+        target_mem: FalconMem,
+        port: u8,
+        tag: u16,
+    ) -> Result {
+        // Rejecting misaligned images here allows us to avoid checking
+        // inside the loops.
+        if img.len() % 4 != 0 {
+            return Err(EINVAL);
+        }
+
+        let port = usize::from(port);
+
+        match target_mem {
+            FalconMem::ImemSecure | FalconMem::ImemNonSecure => {
+                regs::NV_PFALCON_FALCON_IMEMC::default()
+                    .set_secure(target_mem == FalconMem::ImemSecure)
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port);
+
+                let mut tag = tag;
+                for block in img.chunks(256) {
+                    regs::NV_PFALCON_FALCON_IMEMT::default()
+                        .set_tag(tag)
+                        .write(bar, &E::ID, port);
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_IMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, port);
+                    }
+                    tag += 1;
+                }
+            }
+            FalconMem::Dmem => {
+                regs::NV_PFALCON_FALCON_DMEMC::default()
+                    .set_aincw(true)
+                    .set_offs(mem_base)
+                    .write(bar, &E::ID, port);
+
+                for block in img.chunks(256) {
+                    for word in block.chunks_exact(4) {
+                        let w = [word[0], word[1], word[2], word[3]];
+                        regs::NV_PFALCON_FALCON_DMEMD::default()
+                            .set_data(u32::from_le_bytes(w))
+                            .write(bar, &E::ID, port);
+                    }
+                }
+            }
+        }
+
+        Ok(())
+    }
+
+    fn pio_wr<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        target_mem: FalconMem,
+        load_offsets: &FalconLoadTarget,
+        port: u8,
+        tag: u16,
+    ) -> Result {
+        let start = usize::from_safe_cast(load_offsets.src_start);
+        let len = usize::from_safe_cast(load_offsets.len);
+        let mem_base = u16::try_from(load_offsets.dst_start)?;
+
+        // SAFETY: we are the only user of the firmware image at this stage
+        let data = unsafe { fw.as_slice(start, len).map_err(|_| EINVAL)? };
+
+        self.pio_wr_bytes(bar, data, mem_base, target_mem, port, tag)
+    }
+
+    /// Perform a PIO copy into `IMEM` and `DMEM` of `fw`, and prepare the falcon to run it.
+    pub(crate) fn pio_load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
+        let imem_sec = fw.imem_sec_load_params();
+        let imem_ns = fw.imem_ns_load_params().ok_or(EINVAL)?;
+        let dmem = fw.dmem_load_params();
+
+        regs::NV_PFALCON_FBIF_CTL::read(bar, &E::ID)
+            .set_allow_phys_no_ctx(true)
+            .write(bar, &E::ID);
+
+        regs::NV_PFALCON_FALCON_DMACTL::default().write(bar, &E::ID);
+
+        // If the Generic Bootloader was passed, then use it to boot FRTS
+        if let Some(gbl) = gbl {
+            let dst_start = u16::try_from(0x10000 - gbl.desc.code_size)?;
+            let data = &gbl.ucode[..usize::from_safe_cast(gbl.desc.code_size)];
+            let tag = u16::try_from(gbl.desc.start_tag)?;
+
+            self.pio_wr_bytes(bar, data, dst_start, FalconMem::ImemNonSecure, 0, tag)?;
+
+            // This structure tells the generic bootloader where to find the FWSEC
+            // image.
+            let dmem_desc = BootloaderDmemDescV2 {
+                reserved: [0; 4],
+                signature: [0; 4],
+                ctx_dma: 4, // FALCON_DMAIDX_PHYS_SYS_NCOH
+                code_dma_base: fw.dma_handle(),
+                non_sec_code_off: imem_ns.dst_start,
+                non_sec_code_size: imem_ns.len,
+                sec_code_off: imem_sec.dst_start,
+                sec_code_size: imem_sec.len,
+                code_entry_point: 0,
+                data_dma_base: fw.dma_handle() + u64::from(dmem.src_start),
+                data_size: dmem.len,
+                argc: 0,
+                argv: 0,
+            };
+
+            regs::NV_PFALCON_FBIF_TRANSCFG::update(bar, &E::ID, 4, |v| {
+                v.set_target(FalconFbifTarget::CoherentSysmem)
+                    .set_mem_type(FalconFbifMemType::Physical)
+            });
+
+            self.pio_wr_bytes(bar, dmem_desc.as_bytes(), 0, FalconMem::Dmem, 0, 0)?;
+        } else {
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemNonSecure,
+                &imem_ns,
+                0,
+                u16::try_from(imem_ns.dst_start >> 8)?,
+            )?;
+            self.pio_wr(
+                bar,
+                fw,
+                FalconMem::ImemSecure,
+                &imem_sec,
+                0,
+                u16::try_from(imem_sec.dst_start >> 8)?,
+            )?;
+            self.pio_wr(bar, fw, FalconMem::Dmem, &dmem, 0, 0)?;
+        }
+
+        self.hal.program_brom(self, bar, &fw.brom_params())?;
+
+        // Set `BootVec` to start of non-secure code.
+        regs::NV_PFALCON_FALCON_BOOTVEC::default()
+            .set_value(fw.boot_addr())
+            .write(bar, &E::ID);
+
+        Ok(())
+    }
+
     /// Perform a DMA write according to `load_offsets` from `dma_handle` into the falcon's
     /// `target_mem`.
     ///
@@ -637,11 +806,17 @@ pub(crate) fn is_riscv_active(&self, bar: &Bar0) -> bool {
         self.hal.is_riscv_active(bar)
     }
 
-    /// Check if this Falcon supports DMA for loading firmware.
-    ///
-    /// Returns `true` if DMA is supported, `false` if PIO must be used instead.
-    pub(crate) fn supports_dma(&self) -> bool {
-        self.hal.supports_dma()
+    // Load a firmware image into Falcon memory
+    pub(crate) fn load<F: FalconFirmware<Target = E>>(
+        &self,
+        bar: &Bar0,
+        fw: &F,
+        gbl: Option<&GenericBootloader>,
+    ) -> Result {
+        match self.hal.load_method() {
+            LoadMethod::Pio => self.pio_load(bar, fw, gbl),
+            LoadMethod::Dma => self.dma_load(bar, fw),
+        }
     }
 
     /// Write the application version to the OS register.
diff --git a/drivers/gpu/nova-core/falcon/hal.rs b/drivers/gpu/nova-core/falcon/hal.rs
index 49501aa6ff7f..3a882b7d8aa8 100644
--- a/drivers/gpu/nova-core/falcon/hal.rs
+++ b/drivers/gpu/nova-core/falcon/hal.rs
@@ -15,6 +15,11 @@
 mod ga102;
 mod tu102;
 
+pub(crate) enum LoadMethod {
+    Pio,
+    Dma,
+}
+
 /// Hardware Abstraction Layer for Falcon cores.
 ///
 /// Implements chipset-specific low-level operations. The trait is generic against [`FalconEngine`]
@@ -49,8 +54,8 @@ fn signature_reg_fuse_version(
     /// Reset the falcon engine.
     fn reset_eng(&self, bar: &Bar0) -> Result;
 
-    /// Returns true of this Falcon supports DMA transfer from system memory to Falcon memory
-    fn supports_dma(&self) -> bool;
+    /// returns the method needed to load data into Falcon memory
+    fn load_method(&self) -> LoadMethod;
 }
 
 /// Returns a boxed falcon HAL adequate for `chipset`.
diff --git a/drivers/gpu/nova-core/falcon/hal/ga102.rs b/drivers/gpu/nova-core/falcon/hal/ga102.rs
index 6ccbf42ba80c..c94b3fe537c2 100644
--- a/drivers/gpu/nova-core/falcon/hal/ga102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/ga102.rs
@@ -13,6 +13,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        hal::LoadMethod,
         Falcon,
         FalconBromParams,
         FalconEngine,
@@ -159,7 +160,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
-    fn supports_dma(&self) -> bool {
-        true
+    fn load_method(&self) -> LoadMethod {
+        LoadMethod::Dma
     }
 }
diff --git a/drivers/gpu/nova-core/falcon/hal/tu102.rs b/drivers/gpu/nova-core/falcon/hal/tu102.rs
index 28dc03db8240..7bed88511967 100644
--- a/drivers/gpu/nova-core/falcon/hal/tu102.rs
+++ b/drivers/gpu/nova-core/falcon/hal/tu102.rs
@@ -12,6 +12,7 @@
 use crate::{
     driver::Bar0,
     falcon::{
+        hal::LoadMethod,
         Falcon,
         FalconBromParams,
         FalconEngine, //
@@ -77,7 +78,7 @@ fn reset_eng(&self, bar: &Bar0) -> Result {
         Ok(())
     }
 
-    fn supports_dma(&self) -> bool {
-        false
+    fn load_method(&self) -> LoadMethod {
+        LoadMethod::Pio
     }
 }
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index c4fff8b86640..a5678db8f78c 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,12 +40,15 @@
         FalconLoadTarget, //
     },
     firmware::{
+        BinHdr,
         FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
         Unsigned, //
+        FIRMWARE_VERSION,
     },
+    gpu::Chipset,
     num::{
         FromSafeCast,
         IntoSafeCast, //
@@ -213,6 +216,68 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
     T::from_bytes_mut(unsafe { fw.as_slice_mut(offset, size_of::<T>())? }).ok_or(EINVAL)
 }
 
+/// Descriptor used by RM to figure out the requirements of the boot loader.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDesc {
+    /// Starting tag of bootloader.
+    pub start_tag: u32,
+    /// DMEM offset where [`BootloaderDmemDescV2`] is to be loaded.
+    pub dmem_load_off: u32,
+    /// Offset of code section in the image.
+    pub code_off: u32,
+    /// Size of code section in the image.
+    pub code_size: u32,
+    /// Offset of data section in the image.
+    pub data_off: u32,
+    /// Size of data section in the image.
+    pub data_size: u32,
+}
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDesc {}
+
+/// Structure used by the boot-loader to load the rest of the code.
+///
+/// This has to be filled by the GPU driver and copied into DMEM at offset
+/// [`BootloaderDesc.dmem_load_off`].
+#[repr(C, packed)]
+#[derive(Debug, Clone)]
+pub(crate) struct BootloaderDmemDescV2 {
+    /// Reserved, should always be first element.
+    pub reserved: [u32; 4],
+    /// 16B signature for secure code, 0s if no secure code.
+    pub signature: [u32; 4],
+    /// DMA context used by the bootloader while loading code/data.
+    pub ctx_dma: u32,
+    /// 256B-aligned physical FB address where code is located.
+    pub code_dma_base: u64,
+    /// Offset from `code_dma_base` where the non-secure code is located (must be multiple of 256).
+    pub non_sec_code_off: u32,
+    /// Size of the non-secure code part.
+    pub non_sec_code_size: u32,
+    /// Offset from `code_dma_base` where the secure code is located (must be multiple of 256).
+    pub sec_code_off: u32,
+    /// Size of the secure code part.
+    pub sec_code_size: u32,
+    /// Code entry point invoked by the bootloader after code is loaded.
+    pub code_entry_point: u32,
+    /// 256B-aligned physical FB address where data is located.
+    pub data_dma_base: u64,
+    /// Size of data block (should be multiple of 256B).
+    pub data_size: u32,
+    /// Arguments to be passed to the target firmware being loaded.
+    pub argc: u32,
+    /// Number of arguments to be passed to the target firmware being loaded.
+    pub argv: u32,
+}
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDmemDescV2 {}
+
+pub(crate) struct GenericBootloader {
+    pub desc: BootloaderDesc,
+    pub ucode: Vec<u8, kernel::alloc::allocator::Kmalloc>,
+}
+
 /// The FWSEC microcode, extracted from the BIOS and to be run on the GSP falcon.
 ///
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
@@ -221,6 +286,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -275,7 +342,19 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        0
+        match &self.desc {
+            FalconUCodeDesc::V2(_v2) => {
+                // On V2 platforms, the boot address is extracted from the
+                // generic bootloader, because the gbl is what actually copies
+                // FWSEC into memory, so that is what needs to be booted.
+                if let Some(ref gbl) = self.gen_bootloader {
+                    gbl.desc.start_tag << 8
+                } else {
+                    0
+                }
+            }
+            FalconUCodeDesc::V3(_v3) => 0,
+        }
     }
 }
 
@@ -376,6 +455,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -432,9 +512,54 @@ pub(crate) fn new(
             ucode_dma.no_patch_signature()
         };
 
+        // The Generic Bootloader exists only on Turing and GA100.  To avoid a bogus
+        // console error message on other platforms, only try to load it if it's
+        // supposed to be there.
+        let gbl_fw = if chipset < Chipset::GA102 {
+            Some(super::request_firmware(
+                dev,
+                chipset,
+                "gen_bootloader",
+                FIRMWARE_VERSION,
+            )?)
+        } else {
+            None
+        };
+
+        let gbl = match gbl_fw {
+            Some(fw) => {
+                let hdr = fw
+                    .data()
+                    .get(0..size_of::<BinHdr>())
+                    .and_then(BinHdr::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let desc_offset = usize::from_safe_cast(hdr.header_offset);
+                let desc = fw
+                    .data()
+                    .get(desc_offset..desc_offset + size_of::<BootloaderDesc>())
+                    .and_then(BootloaderDesc::from_bytes_copy)
+                    .ok_or(EINVAL)?;
+
+                let ucode_start = usize::from_safe_cast(hdr.data_offset);
+                let ucode_size = usize::from_safe_cast(hdr.data_size);
+                let ucode_data = fw
+                    .data()
+                    .get(ucode_start..ucode_start + ucode_size)
+                    .ok_or(EINVAL)?;
+
+                let mut ucode = KVec::new();
+                ucode.extend_from_slice(ucode_data, GFP_KERNEL)?;
+
+                Some(GenericBootloader { desc, ucode })
+            }
+            None => None,
+        };
+
         Ok(FwsecFirmware {
             desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -450,7 +575,7 @@ pub(crate) fn run(
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
         falcon
-            .dma_load(bar, self)
+            .load(bar, self, self.gen_bootloader.as_ref())
             .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 581b412554dc..f253d5f12252 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -48,6 +48,7 @@ impl super::Gsp {
     /// created the WPR2 region.
     fn run_fwsec_frts(
         dev: &device::Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -65,6 +66,7 @@ fn run_fwsec_frts(
 
         let fwsec_frts = FwsecFirmware::new(
             dev,
+            chipset,
             falcon,
             bar,
             bios,
@@ -144,7 +146,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -183,7 +185,7 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        sec2_falcon.load(bar, &booter_loader, None)?;
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index cd7b7aa6fc2a..f0129a5f7a7e 100644
--- a/drivers/gpu/nova-core/regs.rs
+++ b/drivers/gpu/nova-core/regs.rs
@@ -359,6 +359,36 @@ pub(crate) fn with_falcon_mem(self, mem: FalconMem) -> Self {
     1:1     startcpu as bool;
 });
 
+// IMEM access control register. Up to 4 ports are available for IMEM access.
+register!(NV_PFALCON_FALCON_IMEMC @ PFalconBase[0x00000180[4; 16]] {
+    15:0      offs as u16, "IMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+    28:28     secure as bool, "Access secure IMEM";
+});
+
+// IMEM data register. Reading/writing this register accesses IMEM at the address
+// specified by the corresponding IMEMC register.
+register!(NV_PFALCON_FALCON_IMEMD @ PFalconBase[0x00000184[4; 16]] {
+    31:0      data as u32;
+});
+
+// IMEM tag register. Used to set the tag for the current IMEM block.
+register!(NV_PFALCON_FALCON_IMEMT @ PFalconBase[0x00000188[4; 16]] {
+    15:0      tag as u16;
+});
+
+// DMEM access control register. Up to 8 ports are available for DMEM access.
+register!(NV_PFALCON_FALCON_DMEMC @ PFalconBase[0x000001c0[8; 8]] {
+    15:0      offs as u16, "DMEM block and word offset";
+    24:24     aincw as bool, "Auto-increment on write";
+});
+
+// DMEM data register. Reading/writing this register accesses DMEM at the address
+// specified by the corresponding DMEMC register.
+register!(NV_PFALCON_FALCON_DMEMD @ PFalconBase[0x000001c4[8; 8]] {
+    31:0      data as u32;
+});
+
 // Actually known as `NV_PSEC_FALCON_ENGINE` and `NV_PGSP_FALCON_ENGINE` depending on the falcon
 // instance.
 register!(NV_PFALCON_FALCON_ENGINE @ PFalconBase[0x000003c0] {
-- 
2.52.0

