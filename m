Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B3C2CCA2F1
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:46 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 97CBE10E7C8;
	Thu, 18 Dec 2025 03:30:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="DOXH412a";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B64CC44B2B;
	Thu, 18 Dec 2025 03:23:14 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028194;
 b=d44ZRtuMwiRH4PDKIJCo+O3EwHFAGDPy4LFyHbj21IngpBsRof1shK2XunSgJ2E7yj0Sq
 ZUIzLEpLTaFEcTSEngkYOzbrzTRacAD5EvqHtsUtFOkkpYLoLMvIiN3egxbjap1x/dBG8U1
 h+hejnprcXUpv5rl4ezwAA+3hxHDgwxW5oNNEF4WtgdmPNc0jYIlW/F+k/ILhaYGQt9ozkJ
 zXWMFRaDxpSB+fzU8FHYb3of5QZmzHjFyZBkKHVCvx5CC+Ju0XzfgOR5qDMqSMzMX3cUjWV
 GcZlbKeWA6xVLfs+7A6KNclR3J5kO2XsbxSDDLQvfxX2vhJkEBhQcAwU0WtQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028194; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=DJJG4sTd4SntqlPQv5FEb3YkP900WbasECKX6GEIj/c=;
 b=I0OlxhAsI6CX6pzFEQmb1C62FIFKZJGD/kQqzoXuMXUOwYKnmVPDu4WnWTJhTJU9EIfST
 fpNK+RlbWv8ROp37WwcfmOV1EGX/XKGzIcSlWEnSHHU3qXvfM9wYydpcnZJy/T+h02dl7JY
 4Q/1thmVtQglDeuUvnarYuWc89lNO8e2L+i2SwsC9mWvUO6rNp894sMwBmG2UORde0jYosz
 A8UW4l2Zj2DEHXJDfcD5bXMwuFXGLQMFy8aO3WqTdiw0d3edskWDnHT3xCIJRTbs07GQa4H
 9NnTSGkoHeNvCiBxhxORTR+kAio869uoElLuRTrTt6+BE1Dlun7xDVOrHheg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 74D3E44B08
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:23:12 +0000 (UTC)
Received: from DM1PR04CU001.outbound.protection.outlook.com
 (mail-centralusazon11010005.outbound.protection.outlook.com [52.101.61.5])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 1C63710E37A
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:42 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Mt/O8mwJI9K0zjMIwjSx3iqzebEXfPuvuBMC6NXO3XQD0huMpczwXZFsKYIe46V2FDqnUMuQv4QOv1ybPU0q2RLOiaW+BJ7jxpzMYvDcXHlaTqL6lm/Iqi+RoF3K+7j1fKxAWH8/cmNOs6iVGj0/D3PeWtnFtWx/wncgXiGO/78edy0mX/TDkwSzocrvMEvudYD0YWQNQZcA0brhP9GnoZJFZitWVsWGoEe8o561i0bLa9QhwBIlS1DhhVbPbBW6mZiMdzLe6f4800N1U/aBNHf8eBLqZTJ/iy2D9yyFgT2JHvJJfxGtbGDD1wzCp6Ap3pK1vr3LyKpSNuzVLNPzRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJJG4sTd4SntqlPQv5FEb3YkP900WbasECKX6GEIj/c=;
 b=GOxfDQZjN4hM41/NZCFmrNQpZ6m5nyy4nMppHDzWZQOHm8Nf0YBFGYsXectdP36RR/tTusftu9SbuOcSV+ExhMi900wntIxWvm+hF2j8rV3Ex4Qp6wpNA3zRSQYNLNGI1ynUjsIETr2OamXG0Ff/BbzGPrdlv4dTPYdXoxKXaLUKgyLzgFx0+BtJhzbM/fucMIvNqkHDhmRZi8SX/2FUOAbFXqf9J6idSMiJYbmn16ZSafrKB0x7x6oBaI6jFD1FhNx1jGMIsnfJqoyuj+GtXJDT+SUSyXFBeSaSDl0M5kAbwxIVnUsksWgs4bgLOw1oC6XP3gBhiZwxA8QkWwZ0zQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJJG4sTd4SntqlPQv5FEb3YkP900WbasECKX6GEIj/c=;
 b=DOXH412aZpW55PdNwwHZGQzb8sRzNlWhZQAq4nal6wgvy3QgvUi9ll/ZdydyWSgoQPDbm+lE5N3I1OKpbHctpLDRZxjBHXW4ESbCsRbjUpp9wIERzBfoM0aP3yBl1DLSl46NiJBef6gObiVJ3tJIMMbgYByzh4MlZL463VC6rQoylXObwi+2SRfoY9GLVRm6gFavjxFDo+57adXuc4ajDj4/bxd3P+RQq+7A2O04Q42iC3atnCCxJ9yR7r3d8bWTUIESfm8IjYvBGS0XqcNflSZXZCZuyuPjDYgac/2G+ustFn+xVRYsxgY6P1CuW5GtN/kc5UUDVOtsYohuhZNifg==
Received: from CH5P222CA0002.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::22)
 by CH3PR12MB8401.namprd12.prod.outlook.com (2603:10b6:610:130::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 03:30:31 +0000
Received: from CH3PEPF00000017.namprd21.prod.outlook.com
 (2603:10b6:610:1ee:cafe::54) by CH5P222CA0002.outlook.office365.com
 (2603:10b6:610:1ee::22) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.8 via Frontend Transport; Thu,
 18 Dec 2025 03:30:29 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000017.mail.protection.outlook.com (10.167.244.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:14 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:13 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 11/11] gpu: nova-core: add PIO support for loading firmware
 images
Date: Wed, 17 Dec 2025 21:29:55 -0600
Message-ID: <20251218032955.979623-12-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000017:EE_|CH3PR12MB8401:EE_
X-MS-Office365-Filtering-Correlation-Id: c02f6bd6-b946-48ec-1f4c-08de3de5cc17
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|376014|82310400026|36860700013|1800799024;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?wC4MsJ6QPRXUoKrGBhmlHyYVVS2CeG/MIyGCDT960Wc5QM2wonaAC72hMoFl?=
 =?us-ascii?Q?GF086xfQYj2WUHt5FZc/yNkVfSGw6W5TTymqIqe/qLWoKrdJxrN9jXVByMPw?=
 =?us-ascii?Q?RqmDbnvYlDgQfihmC62iVhTFa0X9o4BKGVEV2uKQEUFN6jzWb1OdQmS3Lkrj?=
 =?us-ascii?Q?DPYcGtAg8NEoqsWAb6aCgg9nmJny+mr7JpxL2Osd6TPZYqffe+OgYnXfrv9h?=
 =?us-ascii?Q?MZ0Ly2nD35cFIFMalJ1aJPV/H0ikg4HNkp8a14kN+5w13l656ET8b+AN17N9?=
 =?us-ascii?Q?Sd9KEnK0HNvt4ON+Nmc5/7Yr2OcmnyImutdJ8Z6lL7R2fb5lWD3ozAhpRsab?=
 =?us-ascii?Q?LqpCU5eulsxMeR0hJoSThwhNPRnYAgkfFlCTkjXYBJUNWUJlc5FE7GJPU5f5?=
 =?us-ascii?Q?c69l/2Wj4P5z4FYslNFVivfIrz68sdU059vLdM3Eg0Z8XpZrhe1TVd+tH6qM?=
 =?us-ascii?Q?zBZd8aEM2ePY1EXIgRL1L1w5KmZCtjdBEDGAynPPepvUAfXhi99YcWvHLNc/?=
 =?us-ascii?Q?peSgYi/JTGzbBuRzAfSblBoaJA6rRIrs6/V3WZ+NdZNphDwTVsSS1mH2lpZy?=
 =?us-ascii?Q?P8WXDxj4oxAHfsEyYptC6NtWzZOMJ3ha3/e/Wix7nzAfw3Q4qdN2lJTJmeMS?=
 =?us-ascii?Q?cGg+qNDnEBicle13liqBS7Iwlye0TqpE06oJL4OA+9Z7t7OFO733lADBJDb1?=
 =?us-ascii?Q?ODIn04TPipiKhCLNkt/bh18iGOEQud2yTWIyIEWVyMj5ICzOorjz4DCRsT7R?=
 =?us-ascii?Q?A24NB3ZAszoec87VVW+UAqb47xS8fVd2hyfab5wmD/x4fwdHM4ETcKGF9Y45?=
 =?us-ascii?Q?nauIfwnNMFARjX+nhKJ1tHHD6vgCUaLcW0OYc/eremj71dFbt0WxB9z7zDGq?=
 =?us-ascii?Q?VatCIQDs/x9FLKEsMOBuEXnpI9/tlaxYnc37qJoAuhiyYcEe4j/F7RBli//e?=
 =?us-ascii?Q?XsIoxKrKUiAlD4J9jqCAqmTZXgQ6vXWRAP7p2I42u7kLkDETkSPSddqUruAv?=
 =?us-ascii?Q?KW5rCc84P+kxezyYL4ws94VRcijFZPeeQ4V2TXASGWwM0WTQZEfioRWnRbza?=
 =?us-ascii?Q?YVOKjAFROZ21MCtKEqNOWKf8AMEc1L8tuwCDEwZW84NNIWUMFN7QeJKP9iuq?=
 =?us-ascii?Q?RNA0nFtnbtD/7eA+j1b7iAZoeBOHoD4Im8tvGqRma8RzfwTht6lyQD2c86ax?=
 =?us-ascii?Q?OsP9ww2bZya8oZlmZLOY+5EFZodIPnlmstDEA0F93TBehaHdSAY2rPaxud8A?=
 =?us-ascii?Q?Va/XpCxy8T8hECq2yfWm+yVGpKTDwJX7atDep9hSDEVGitsEWpj+BYEfO36K?=
 =?us-ascii?Q?uS3NHvHqQhWrAkBr9EquhhxZBDc6Mj+AABEURBMUjzsc4Tqt8aXGVtWe/6M3?=
 =?us-ascii?Q?GYJ+7ShIkop3/TJhdfiF5fv1fUVNPyZSu/uaXUGswx5DjeIpWYMfZgKoFH6X?=
 =?us-ascii?Q?bl61kUJQxK9KhAAbA+M7ce3b7Qna46YiAI1lJwiyEiLDzpcEZUW7Cw/x7gVy?=
 =?us-ascii?Q?6gGJXmEKzas94ua2ZUIoV8Z+u4251kSZxXJllUbf7QsMWWGf7hayIrmEhYC0?=
 =?us-ascii?Q?iV2/ROnuhA8kqoWjCDA=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:31.2540
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 c02f6bd6-b946-48ec-1f4c-08de3de5cc17
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000017.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB8401
Message-ID-Hash: O2ATNOG3MO4Z754MJ5ZIZSIIC4NBOWKS
X-Message-ID-Hash: O2ATNOG3MO4Z754MJ5ZIZSIIC4NBOWKS
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/O2ATNOG3MO4Z754MJ5ZIZSIIC4NBOWKS/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-12-ttabi@nvidia.com/>
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
 drivers/gpu/nova-core/falcon.rs         | 168 ++++++++++++++++++++++++
 drivers/gpu/nova-core/firmware.rs       |   4 +-
 drivers/gpu/nova-core/firmware/fwsec.rs | 142 +++++++++++++++++++-
 drivers/gpu/nova-core/gsp/boot.rs       |  10 +-
 drivers/gpu/nova-core/regs.rs           |  30 +++++
 5 files changed, 345 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 50c87dadf2ea..35d0e5e2ff9e 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -15,11 +15,16 @@
     time::{
         Delta, //
     },
+    transmute::AsBytes, //
 };
 
 use crate::{
     dma::DmaObject,
     driver::Bar0,
+    firmware::fwsec::{
+        BootloaderDmemDescV2,
+        GenericBootloader, //
+    },
     gpu::Chipset,
     num::{
         FromSafeCast,
@@ -406,6 +411,169 @@ pub(crate) fn reset(&self, bar: &Bar0) -> Result {
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
+        // SAFETY: as_slice() ensures that start+len is within range
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
diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 44897feb82a4..26efbf4f6760 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -31,7 +31,7 @@
 pub(crate) const FIRMWARE_VERSION: &str = "570.144";
 
 /// Requests the GPU firmware `name` suitable for `chipset`, with version `ver`.
-fn request_firmware(
+pub(crate) fn request_firmware(
     dev: &device::Device,
     chipset: gpu::Chipset,
     name: &str,
@@ -321,7 +321,7 @@ fn no_patch_signature(self) -> FirmwareDmaObject<F, Signed> {
 /// Header common to most firmware files.
 #[repr(C)]
 #[derive(Debug, Clone)]
-struct BinHdr {
+pub(crate) struct BinHdr {
     /// Magic number, must be `0x10de`.
     bin_magic: u32,
     /// Version of the header.
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index 1c1dcdacf5f5..4c26257bbfe0 100644
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
@@ -213,6 +216,72 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
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
+// SAFETY: This struct doesn't contain uninitialized bytes and doesn't have interior mutability.
+unsafe impl AsBytes for BootloaderDesc {}
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
+// SAFETY: any byte sequence is valid for this struct.
+unsafe impl FromBytes for BootloaderDmemDescV2 {}
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
@@ -221,6 +290,8 @@ pub(crate) struct FwsecFirmware {
     desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
+    /// Generic bootloader
+    gen_bootloader: Option<GenericBootloader>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
@@ -275,7 +346,19 @@ fn brom_params(&self) -> FalconBromParams {
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
 
@@ -376,6 +459,7 @@ impl FwsecFirmware {
     /// command.
     pub(crate) fn new(
         dev: &Device<device::Bound>,
+        chipset: Chipset,
         falcon: &Falcon<Gsp>,
         bar: &Bar0,
         bios: &Vbios,
@@ -432,9 +516,49 @@ pub(crate) fn new(
             ucode_dma.no_patch_signature()
         };
 
+        // The Generic Bootloader exists only on Turing and GA100.  To avoid a bogus
+        // console error message on other platforms, only try to load it if it's
+        // supposed to be there.
+        let gbl_fw = if chipset < Chipset::GA102 {
+            super::request_firmware(dev, chipset, "gen_bootloader", FIRMWARE_VERSION)
+        } else {
+            Err(ENOENT)
+        };
+
+        let gbl = match gbl_fw {
+            Ok(fw) => {
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
+            Err(_) => None,
+        };
+
         Ok(FwsecFirmware {
-            desc: desc,
+            desc,
             ucode: ucode_signed,
+            gen_bootloader: gbl,
         })
     }
 
@@ -449,9 +573,17 @@ pub(crate) fn run(
         falcon
             .reset(bar)
             .inspect_err(|e| dev_err!(dev, "Failed to reset GSP falcon: {:?}\n", e))?;
-        falcon
-            .dma_load(bar, self)
-            .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+
+        // If the Generic Bootloader was found, then upload it via PIO , otherwise
+        if let Some(ref gbl) = self.gen_bootloader {
+            falcon
+                .pio_load(bar, self, Some(gbl))
+                .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+        } else {
+            falcon
+                .dma_load(bar, self)
+                .inspect_err(|e| dev_err!(dev, "Failed to load FWSEC firmware: {:?}\n", e))?;
+        }
         let (mbox0, _) = falcon
             .boot(bar, Some(0), None)
             .inspect_err(|e| dev_err!(dev, "Failed to boot FWSEC firmware: {:?}\n", e))?;
diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..fda01afda9ed 100644
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
@@ -147,7 +149,7 @@ pub(crate) fn boot(
         let fb_layout = FbLayout::new(chipset, bar, &gsp_fw)?;
         dev_dbg!(dev, "{:#x?}\n", fb_layout);
 
-        Self::run_fwsec_frts(dev, gsp_falcon, bar, &bios, &fb_layout)?;
+        Self::run_fwsec_frts(dev, chipset, gsp_falcon, bar, &bios, &fb_layout)?;
 
         let booter_loader = BooterFirmware::new(
             dev,
@@ -186,7 +188,11 @@ pub(crate) fn boot(
         );
 
         sec2_falcon.reset(bar)?;
-        sec2_falcon.dma_load(bar, &booter_loader)?;
+        if sec2_falcon.supports_dma() {
+            sec2_falcon.dma_load(bar, &booter_loader)?;
+        } else {
+            sec2_falcon.pio_load(bar, &booter_loader, None)?;
+        }
         let wpr_handle = wpr_meta.dma_handle();
         let (mbox0, mbox1) = sec2_falcon.boot(
             bar,
diff --git a/drivers/gpu/nova-core/regs.rs b/drivers/gpu/nova-core/regs.rs
index 8188a566e1ae..c2fbb0299200 100644
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

