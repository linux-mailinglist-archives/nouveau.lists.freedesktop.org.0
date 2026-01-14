Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CFC4D2108E
	for <lists+nouveau@lfdr.de>; Wed, 14 Jan 2026 20:30:25 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 799CE10E672;
	Wed, 14 Jan 2026 19:30:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BY8dgTm4";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id D643B44CAD;
	Wed, 14 Jan 2026 19:21:51 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1768418511;
 b=dzPSsvqdsJZJ2TvyNn4H0nF8B6R2vEeZxVLQ1oU2ufe9/b4/Jn40vyTR2dmLGFXlQOdIY
 nDlsh+ZFVoqDoRZMtlsi5hgIePwwLjgMe9vViPbXY97S1cVW+dkuf+rxy215TPlGqTyiNvE
 jiyf4o7LqcnM9q9pBUQnVxcDMXen9fO5Lg+nlS6cyHTOgTMyHXCIOt8AFJc+phwhbBOAw2K
 E2qZRuze0982T8izbC+oIpvqLVqoUOQA4O25cyYcqqHGTOehvvOsKlGvmoRSGmcusvVKe45
 WZ9u6ritEW5/V/mExj4fZEtGITXRyHjYfMed9bdCPIeVEw0j1NrgskxSPTGQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1768418511; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=dk6wHkj3RL/1/nOR+BE02qTWlvOKA46XsLmYw1j+Oc74stAGZXc1PXB2vPYyKs5cp4xBg
 Umr6OG0DJZz19WTqys5xHc25jKyDU97ShsgOW+ECJp9l+93DlXFlc0t1tGEqdUdfDFJK7C8
 Sk/wGgANDrPWiPHct+jcApuo1iHPlBHogM2b//joPmrJCUPtl9eZr7Iac7wfPP76AA+9xF6
 UdXX+hgS0ZhhW6a69yV/BaWzJ/nHspWbU4pCOXUSdlQQ/LWYwW/H0gjSrEQax+0YMYkjdEa
 asLUKrSM4weibpsOOei4vowrDCa0g2cNlMrTPA4IN0gYvhUlIbfIEAXi2XNw==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id AFA6844C87
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:21:48 +0000 (UTC)
Received: from BL2PR02CU003.outbound.protection.outlook.com
 (mail-eastusazon11011052.outbound.protection.outlook.com [52.101.52.52])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EB99110E66D
	for <nouveau@lists.freedesktop.org>; Wed, 14 Jan 2026 19:30:19 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lHkewvyLJM0dgJCOPUloA0Uwd9pYwpQwrZd3IDgvkKsL+MdTNCa2qcuiuuSSZSQG44FhFvj5K+KKq1dFXdtzzAv8rc5oxeqFKC8uuiojp8BbUwHpMxLlymV/HJq97oH9dzo8KJ2Fh9Xtamz4aOToQzQMAcZxGgjzLJshZWMZoSBfVRHk5Hv3ALkajFcL7kQU4XHVhoBOM3RDk+DJLNAizRKg8WL2fAWVbOL3+berpf95eKmwvq8IUEUKIef+ehqrCfIMryKyc9bQSs7eV0JOI152Lub51rHYfisPNNvj9TDr+sACw4g0UlorL+DP3a/MhtjwYWuQ/qmHSqmXH9xZZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=u/OFKoDEXeuc0uBotGS+yMMtX5IVgJ7yCwEt+oG5icyeeW1Cifek5jy61lQ/JoqpxIPMRRLByUYyOopYYUzUvWNjkIqTUWVYCYmtzMzTEicdQz4yOVosnHHF3nGeZkb3szWfY++kbNXcKtdn8gs3bPLjd1KUx12Llc+nVZcI1IFwBwBIctxVPzx61TCpZCwe5deQmRzLv9kEIYGH8X952L0GQRUDxs57l/hA4OqrvLR4jLrhQqmhVOOS+6p4N9zGGnNwaIqKy2FordoYAsqcNgD8bqkrETz56007EPKbukLF1U7uiHEDWvQ3z9MTJBzChAP2JRaJxVkjUgPgiMJ1nQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iUOdI2Om/rtDRyn/+KqLKSotpFY+BGNeJvSdMYD97c8=;
 b=BY8dgTm4lyxO5cl0gdkc0u3zS8d2nciJvXpVLlnFr1fc5i2OH040Qbn3w1Bg0WiZhaBa/FxDyj9hOxmzHVFzD67HqCWNl878YO8YGB07xap9psVMA1T/P8vYYcTr80lGZ3+7U6FtzO0yoktMykGN1qtXwzNQpb3gwTY7644qf1LpsjXdq2rYeLOHYyetF58hDLBNxNsKIQHe8WnWvxJKSBaYB2cq+Un7JpgzY/ATcJdLrf1wVEdSYqtFnSTY6fLohOPToJPYYy05H4zgf/azMejsZlEfB1B992p5k9ilhzfl5q2LII5g6nWzzhIwfVTax0is4Pi9Ay2dWSQy4Qhu+g==
Received: from MN2PR22CA0008.namprd22.prod.outlook.com (2603:10b6:208:238::13)
 by IA0PR12MB8376.namprd12.prod.outlook.com (2603:10b6:208:40b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9520.5; Wed, 14 Jan
 2026 19:30:15 +0000
Received: from BL6PEPF00020E62.namprd04.prod.outlook.com
 (2603:10b6:208:238:cafe::bc) by MN2PR22CA0008.outlook.office365.com
 (2603:10b6:208:238::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9520.4 via Frontend Transport; Wed,
 14 Jan 2026 19:30:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BL6PEPF00020E62.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9520.1 via Frontend Transport; Wed, 14 Jan 2026 19:30:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:29:59 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 14 Jan
 2026 11:29:58 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, "Danilo
 Krummrich" <dakr@kernel.org>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v6 01/11] gpu: nova-core: rename Imem to ImemSecure
Date: Wed, 14 Jan 2026 13:29:40 -0600
Message-ID: <20260114192950.1143002-2-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E62:EE_|IA0PR12MB8376:EE_
X-MS-Office365-Filtering-Correlation-Id: c708ae79-3a34-4bef-4a44-08de53a357b6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?EW1pbTMroPVeE5BykCIgxmR1vfmjly9iBdwJqCyLSUPBOmGckNI4eRKereMa?=
 =?us-ascii?Q?VFJaGC96ekjLsumEjZu6VGK1YdkzZCNiHYMIBnQ+mFeut5vTuKGdp/wZl5dz?=
 =?us-ascii?Q?Y2aUBuT6smZLwcidrFBKZiyFrq8YR/cEDcGKcoOKbUm2Yzo1UEUClTvDGkOX?=
 =?us-ascii?Q?Qu1h0mONrTYagZeRgJqMEpGC483pkZCL2/xiJkTzxd2cZ4hQ/GmXQ1as4KUy?=
 =?us-ascii?Q?8TUUFsOXHRhdj5SN+1nJ3tixJS8m9nHetlMCFdtExSOAX07d36yKGZqQ/qDi?=
 =?us-ascii?Q?Bo7l2rqhMW3NGC11/HP8zrRfRJziCebStXqMyajC7zCDBxktmnMDuUAV2RZG?=
 =?us-ascii?Q?JhM9DF6/23HKfMfPFlTIVxCJQqTtVPHnH9F2MwgB+95VXmyyVtD+CdwgVWT0?=
 =?us-ascii?Q?Ezk/N8pRDUDfzlDfgYTquAY6QJTUvjZNGM1pG8Jv5AjVUSeOzELCbv4vyGkM?=
 =?us-ascii?Q?CFJE+S7eGfKJs0jzP9twPqDa47IEZjH/CtAv89yFiKe1M2PHgSprs1hV0Dj2?=
 =?us-ascii?Q?AKv/kEMQSJC6XxqTwbWybV0a4N8A8fEgy80nmng/FsZe+/blaQOaAhlC3HT0?=
 =?us-ascii?Q?BlZQh9okwBkDl3jBe3gj5Ddi9udgAAoUSJ1VHz7NrPrmsD8aSmkoevMbaEOa?=
 =?us-ascii?Q?9rqlNC42mdUQ4S9mN0K1GI29in9OSPzkGmZgD5iTsHNVVCrSMKdLbDxPzcAd?=
 =?us-ascii?Q?eJ6ZWmGD1r+4QjRbW3NcynDqx0y/ZjFdEAcz9QDQtpq9qG+mA/GF7dLGYobT?=
 =?us-ascii?Q?ImzIsx4kqnUFtQtXT6zZCj6m2hbWnMSw5BL44BVTxx9Ti1KNsbdwgnrVOsNF?=
 =?us-ascii?Q?y7uvQpNHSfpMepI/TJsLmLD0byxGrH8hYlngVCF4iRk87L2cvAVt2z9Ta6lv?=
 =?us-ascii?Q?b2logIn+NS1YbZ/MkrkckX53PGSX8HyssBo5j5TqaLIplNwN2fVL+qKlEzwx?=
 =?us-ascii?Q?9zU5SClm9ViK9oOO9fSJ+vnXYO4Snwy1/twtI8Th5K3tsZmweabOBw6fZC/p?=
 =?us-ascii?Q?fCYkkYiMn2RvMRNQuqLT+aqNvOzbVC2UlrP1RtQHI79h0d7C4KDPwhMdMBgo?=
 =?us-ascii?Q?ZwCJsuloxwaA/Xgu74zV5ANgZdqWOU7a88oXxQFhCHIZoQtYqNKxSy2dNZfi?=
 =?us-ascii?Q?P/us09Hk4gbUmG87qmRM+KTWJIvoT0KIIzrB39pP/PWJXxImlsuAg8kEHEa8?=
 =?us-ascii?Q?a25BFKck0SyDH/PGoKtIseFLXgVaR/VEc80kI/VKGAeShVOcvQG3tS+Z7FLa?=
 =?us-ascii?Q?mARths9DIC0Ru+W5kl+YjqD4Mf7wqZAuVRXoHKxEM4kwAdfsDlXpgHr5D8hv?=
 =?us-ascii?Q?b31oapwWZ+mnBSToRrZNBr+kblJ7dwY+Z7IDOKD7AvD3T+udZVNUJzCEatD4?=
 =?us-ascii?Q?KDjxRxJsRL2amBTBduCU74gS18VSYub9ijA70QrCpHxfVbUb4AfUHtcAml9s?=
 =?us-ascii?Q?KZmB2hxIgAATVFg3BB/wgUw4yfKubVkxly/rFBcopxQRYX5ya0JizLeS0Pe3?=
 =?us-ascii?Q?j00/uHcISqUXVuJmkQ9YLHhVIA1L2XwqAt2/eKkAxqgNbL5je51sT9mEVuPW?=
 =?us-ascii?Q?xrilrC16aeuPYCZ/UGGDoxM73xwXi6useJTleJNiNJZ1KbUcB8UCTDuqAAEz?=
 =?us-ascii?Q?P+yPRFUY+/n3l2bVjXpZ3dY1TyED6vcId6Qm8EV+lFwd9QqPFny3l5CJ2p/9?=
 =?us-ascii?Q?B3GanQ=3D=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2026 19:30:14.7620
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c708ae79-3a34-4bef-4a44-08de53a357b6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	BL6PEPF00020E62.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR12MB8376
Message-ID-Hash: O6CGSMSGKIH3TXVRWFIQVTCVYNHYGATW
X-Message-ID-Hash: O6CGSMSGKIH3TXVRWFIQVTCVYNHYGATW
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Hits: member-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O6CGSMSGKIH3TXVRWFIQVTCVYNHYGATW/>
Archived-At: 
 <https://lore.freedesktop.org/20260114192950.1143002-2-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

Rename FalconMem::Imem to ImemSecure to indicate that it references
Secure Instruction Memory.  This change has no functional impact.

On Falcon cores, pages in instruction memory can be tagged as Secure
or Non-Secure.  For GA102 and later, only Secure is used, which is why
FalconMem::Imem seems appropriate.  However, Turing firmware images
can also contain non-secure sections, and so FalconMem needs to support
that.  By renaming Imem to ImemSec now, future patches for Turing support
will be simpler.

Nouveau uses the term "IMEM" to refer both to the Instruction Memory
block on Falcon cores as well as to the images of secure firmware
uploaded to part of IMEM.  OpenRM uses the terms "ImemSec" and "ImemNs"
instead, and uses "IMEM" just to refer to the physical memory device.

Renaming these terms allows us to align with OpenRM, avoid confusion
between IMEM and ImemSec, and makes future patches simpler.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 drivers/gpu/nova-core/falcon.rs          | 20 +++++++++++++-------
 drivers/gpu/nova-core/firmware/booter.rs | 12 ++++++------
 drivers/gpu/nova-core/firmware/fwsec.rs  |  2 +-
 3 files changed, 20 insertions(+), 14 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 46b02c8a591e..310d4e75bad3 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -240,8 +240,8 @@ fn from(value: PeregrineCoreSelect) -> Self {
 /// Different types of memory present in a falcon core.
 #[derive(Debug, Clone, Copy, PartialEq, Eq)]
 pub(crate) enum FalconMem {
-    /// Instruction Memory.
-    Imem,
+    /// Secure Instruction Memory.
+    ImemSecure,
     /// Data Memory.
     Dmem,
 }
@@ -348,8 +348,8 @@ pub(crate) struct FalconBromParams {
 
 /// Trait for providing load parameters of falcon firmwares.
 pub(crate) trait FalconLoadParams {
-    /// Returns the load parameters for `IMEM`.
-    fn imem_load_params(&self) -> FalconLoadTarget;
+    /// Returns the load parameters for Secure `IMEM`.
+    fn imem_sec_load_params(&self) -> FalconLoadTarget;
 
     /// Returns the load parameters for `DMEM`.
     fn dmem_load_params(&self) -> FalconLoadTarget;
@@ -460,7 +460,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
         //
         // For DMEM we can fold the start offset into the DMA handle.
         let (src_start, dma_start) = match target_mem {
-            FalconMem::Imem => (load_offsets.src_start, fw.dma_handle()),
+            FalconMem::ImemSecure => (load_offsets.src_start, fw.dma_handle()),
             FalconMem::Dmem => (
                 0,
                 fw.dma_handle_with_offset(load_offsets.src_start.into_safe_cast())?,
@@ -517,7 +517,7 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
 
         let cmd = regs::NV_PFALCON_FALCON_DMATRFCMD::default()
             .set_size(DmaTrfCmdSize::Size256B)
-            .set_imem(target_mem == FalconMem::Imem)
+            .set_imem(target_mem == FalconMem::ImemSecure)
             .set_sec(if sec { 1 } else { 0 });
 
         for pos in (0..num_transfers).map(|i| i * DMA_LEN) {
@@ -552,7 +552,13 @@ pub(crate) fn dma_load<F: FalconFirmware<Target = E>>(&self, bar: &Bar0, fw: &F)
                 .set_mem_type(FalconFbifMemType::Physical)
         });
 
-        self.dma_wr(bar, fw, FalconMem::Imem, fw.imem_load_params(), true)?;
+        self.dma_wr(
+            bar,
+            fw,
+            FalconMem::ImemSecure,
+            fw.imem_sec_load_params(),
+            true,
+        )?;
         self.dma_wr(bar, fw, FalconMem::Dmem, fw.dmem_load_params(), true)?;
 
         self.hal.program_brom(self, bar, &fw.brom_params())?;
diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index f107f753214a..096cd01dbc9d 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -251,8 +251,8 @@ impl<'a> FirmwareSignature<BooterFirmware> for BooterSignature<'a> {}
 
 /// The `Booter` loader firmware, responsible for loading the GSP.
 pub(crate) struct BooterFirmware {
-    // Load parameters for `IMEM` falcon memory.
-    imem_load_target: FalconLoadTarget,
+    // Load parameters for Secure `IMEM` falcon memory.
+    imem_sec_load_target: FalconLoadTarget,
     // Load parameters for `DMEM` falcon memory.
     dmem_load_target: FalconLoadTarget,
     // BROM falcon parameters.
@@ -354,7 +354,7 @@ pub(crate) fn new(
         };
 
         Ok(Self {
-            imem_load_target: FalconLoadTarget {
+            imem_sec_load_target: FalconLoadTarget {
                 src_start: app0.offset,
                 dst_start: 0,
                 len: app0.len,
@@ -371,8 +371,8 @@ pub(crate) fn new(
 }
 
 impl FalconLoadParams for BooterFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
-        self.imem_load_target.clone()
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
+        self.imem_sec_load_target.clone()
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
@@ -384,7 +384,7 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_load_target.src_start
+        self.imem_sec_load_target.src_start
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index b28e34d279f4..6a2f5a0d4b15 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -224,7 +224,7 @@ pub(crate) struct FwsecFirmware {
 }
 
 impl FalconLoadParams for FwsecFirmware {
-    fn imem_load_params(&self) -> FalconLoadTarget {
+    fn imem_sec_load_params(&self) -> FalconLoadTarget {
         FalconLoadTarget {
             src_start: 0,
             dst_start: self.desc.imem_phys_base,
-- 
2.52.0

