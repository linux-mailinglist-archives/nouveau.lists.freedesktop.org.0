Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 98380CFFFC3
	for <lists+nouveau@lfdr.de>; Wed, 07 Jan 2026 21:20:20 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id EE4F510E2D6;
	Wed,  7 Jan 2026 20:20:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="P6F96FMp";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id B9D8C44CA6;
	Wed,  7 Jan 2026 20:12:02 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1767816722;
 b=RciaHnvAwiuAVANieNsN5Fi2teoQVYQb008LrkOxRHaI42J590xWWdXgVVQuGTW5KFUXh
 YQpfcFMTWUSC7+HZ5P2saNRwJH3wohjG9QmaZLdRg5fEpAbL00oISf4xmMHzOdGG/k+0uD1
 pbQJ/mvBi0hRt+PuHFv2X32H4y+RySyi5Md8thEx8Zss7C2ZEi3yIIIwVW6lhS3F2+OwPdZ
 HpWdAZ8VXx6uqsTZHRD53zEhsHAlp9WxXKeSUVMNYnYHwKmGyjOrPqJrg/+VDzLopOOx/8Z
 2vTS+B+G5d8rMoedJ3uajxFjMO9sLtqDc1IXmIca1T15HLo02MkWxkd5a2SQ==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1767816722; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=fr9bs62BU3r+PlOJ2vj/wG74XwU5Lj7x1XomWRpSuwo=;
 b=BgIxhaEq+VZM1uywPsHD8m7NKQjHEoD1mA8qD0gbFxBGVEfLrSBu056TkbcqEB/VtHrbj
 po1P5yxejXID3HcILuLPvVZGhZn/BARNSLVM9Zt1AxIrmzqScczEzaKlSf2coAak6XfUbiX
 TZxrIvCJJRH3AGxsLRSPcxX65YqTfvwkgFCBl5KBWkn1i01Hes9NPrRGwvN048ewGq7hrX5
 1ExpJQclTTk6oN+z7u0rh9C2KKqvTjxePmB7XcnX2IU8Z46PnKJaSP6SUfmzw69BxUIKr8/
 aYN7dtxzEIhYvGHFWsgYTwNV5RM2wNLklpbKGfJeJL2QorxUSoP+5Qq+6luQ==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id B3EBD44C65
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 20:11:59 +0000 (UTC)
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010023.outbound.protection.outlook.com
 [40.93.198.23])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 87EC110E086
	for <nouveau@lists.freedesktop.org>; Wed,  7 Jan 2026 20:20:15 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fl7xhEgxUvgiHmjpbEYzV4HaZ2yCG94VOApLpUA4YN52qjmt0pm/trfQ3IZ2yvh1GKIi/n8PURyt/kGH8LYbPB1qKy2W5SSNeICsq6EFyiGsl8u6fax7eSmk5IvDMZdOtf8PIRFuIwlBxq297QD801Xu8rkU8OzfgpCcAYQhHazzg0MUrr9inj7VM0By1CZuvcVF7c3sWADv5AkbpcUigmW7tdGwiSbqQe22P++2ZMVRwROcx5rdtVaXqnEDWbvvn+4ApU4n6ix6qUFeq1/pxpusuSj1uc4gk29+0LptuQbELHNISaZ4u59Gvkw/uSC7OU+KjDP8PrqCn01lqjxksQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fr9bs62BU3r+PlOJ2vj/wG74XwU5Lj7x1XomWRpSuwo=;
 b=yVfxrbjUttl3yz6tFMeKif4/HE6WZG58zayhANsD3Qo6iFTONMrJ/z1QOOPEgrv1RzZLmtTszauiCk36WBCsQWv00B6R/ZMNgDagu9KQ8nAhdmf5IFI2vsT1At/sM7x3NtoPVkTA8NZH0wnHWMk9reuNIMYDK1eLsYzD3pSdr0W4GCy0Wo+BiRP7FIvpB87pK2aHrtpCUyxVD54gsM4NdR7nQpBeTXhGRQFZf0F0pMV+i/I3V8TE40zfMDrNh0W6woznBQwBeUJue4ds7mGgKW/gojuRxyzochrg6eKWIetMo5ig7hYSQB6z3m14M9rY3pHx6JAI7xcqCCqyFAak0A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fr9bs62BU3r+PlOJ2vj/wG74XwU5Lj7x1XomWRpSuwo=;
 b=P6F96FMpnLze6Vu2dNeW5BWmDExORugfejThoykfBsBPN7Wnd6zfjxedj+eFtV7SUF6/58I8TbcACHXUYWwsFbqRXogF35Lq1si7OHTTALUQicW0A93irPrT1Bv9pXzngjFQxoac3ZrZr3j5cRWj65bH2OiMo+v8d+WzhfAi+bjvf7Wc4K9IsJSOLuuzCTeOJQinQYAPqzwISZlWi1TOzrKYPJLh+k2nl4k+FaNIy9JwYYoW9pKlw+d9Xj3zzPnCmCB//LwOYZjt13DCvnXWLsYqe5cYflxN6TiovxaRPd9mKY/k+tPPKNr/ajz3ccSy401Wn+7P6J/2Qaz+9NjFvw==
Received: from PH8PR07CA0037.namprd07.prod.outlook.com (2603:10b6:510:2cf::17)
 by PH0PR12MB7079.namprd12.prod.outlook.com (2603:10b6:510:21d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.2; Wed, 7 Jan
 2026 20:20:12 +0000
Received: from CY4PEPF0000E9D3.namprd03.prod.outlook.com
 (2603:10b6:510:2cf:cafe::6) by PH8PR07CA0037.outlook.office365.com
 (2603:10b6:510:2cf::17) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9499.2 via Frontend Transport; Wed, 7
 Jan 2026 20:20:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D3.mail.protection.outlook.com (10.167.241.138) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9499.1 via Frontend Transport; Wed, 7 Jan 2026 20:20:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 12:19:53 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 7 Jan
 2026 12:19:51 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>,
	<nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 1/2] gpu: nova-core: check for overflow to DMATRFBASE1
Date: Wed, 7 Jan 2026 14:16:46 -0600
Message-ID: <20260107201647.2490140-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D3:EE_|PH0PR12MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 8fc9e33e-3043-43e9-28cb-08de4e2a2929
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|36860700013|1800799024|82310400026|376014;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?033CiYA7IlnzJbHgq5osSaQSA3aipHyXr/kFX9QAo/vzg2A0V5qU4EVxJZIg?=
 =?us-ascii?Q?bTrAv7AtxHm2sRrTo2ZkMJfkLWoGCZm6xVCJfZpAh6+g9YBWe0DAACsuQOjA?=
 =?us-ascii?Q?6kz9PRmoj8TaRiH2g+gldFROgRQw6UNRIJPwgGTiZIg7lAP7TJGB1LgD7Q1M?=
 =?us-ascii?Q?sYvtkCFhi0VcldgI6G6m9h1rtOW0RkltUQjVMu5sZswTCOp7ZQKYaYeIAedA?=
 =?us-ascii?Q?UQLjKW5XRVHJZ8vkYgBKjTWIKQ74XNX4p+JAGemiOj/VMKwpbVoQa1kpLyOc?=
 =?us-ascii?Q?0R89WdObR57jWLScXk7G1S9yG70st8Ao4dA6quFpIcxEL1ztVHCLvq4PC/VB?=
 =?us-ascii?Q?IX/ecJMLn+8Li2/UXgzK029Eb6Isa+K8H2JvrNdpfRq4GlGas5dAxqXKvqM3?=
 =?us-ascii?Q?3nF4TogR1vCK2J5nyvEPiXcdbgeZ512hXz7/93DRrQ8f948jxiXIaibmt57E?=
 =?us-ascii?Q?4KxBYloYLWB1qBwF5aXXR43/zfC7RKwR55HFu2j0OSrkE5ao0JoCkJ0O9DtJ?=
 =?us-ascii?Q?WuSBi1SpM1SrBMmVgyLHBUwT1idJJvVQAQU3Oay4rjhNTIZShsUGIkxv6Hpc?=
 =?us-ascii?Q?+wJdOtL9HByFxZ7OmtvXnUcCdUcyN8ix2d5zxdNa3Q4uDj0i9/2gkyZO95Zr?=
 =?us-ascii?Q?GuKPrF6MrSoXqtqn5PEvYBkbvGxc+Ba7PF36pfdUE7+DFs2ePOgcIsZM77Mb?=
 =?us-ascii?Q?78+BTdd1Z1FY2fhZ3MUQA3oJ8jAvyJJecYyc8nsjD+HPtmZcqW16bFk47ksg?=
 =?us-ascii?Q?QYvNnJF3Mg5JEgMVFirn+WXhIO7SEEuyuV/ze9T4k1bpYCtcRPKjp2+kFxeo?=
 =?us-ascii?Q?PjoExE88QB/t6ti7bLkZhYfYivOXjuph3QbHMHY9gcrQGpgLHsDGIyCC9tLe?=
 =?us-ascii?Q?7uMHTgowdK/jWGHh84A2mAIALI15YH6v1g+CBk7TUgizF7I4Eht4uT9Eq0c4?=
 =?us-ascii?Q?IgppybKa2aTThDyrycuAgx291Q/huzK23tVc9i/XSsmoR1y3AH9t2Uk/Abjv?=
 =?us-ascii?Q?qNwXBtB26QCp1IzOVv6xkaL3WII+RW6TsQCyMXxLpBE66aiRdudxX0aGTfeM?=
 =?us-ascii?Q?f8fd5ad7IT8DpA2NSHDeJRkFBBu6uN77gyUcXvW1Y0QlZwbBYmIQvLzvGdkL?=
 =?us-ascii?Q?WXZNP73LUsRFVM/lUlcIEwnwc+2uKofbDhF6ZnrM1LBEdWG8PiZblwlwpfHu?=
 =?us-ascii?Q?thhwipebzzsSvRJ7lmK39zFia4OuX2MS2YjtbCTI77LEr4rVipi2kodphFTS?=
 =?us-ascii?Q?Agn5oiqjXRgc+JNKV3KiuA/4TYjsDUhMsJYEcy10je9n6hv9E12TQBIag+qn?=
 =?us-ascii?Q?9MnHRHgM4xiODnpuewB/ofrcGqH1aTKyasVisaEaOTtSNeJa7Oo5Q1rJlsNp?=
 =?us-ascii?Q?/ywwD9dSZ/ajt0Apwc8KyXUfUgX1UNm4mHUtEN76NgLjKOgYnwdUIeanIhoc?=
 =?us-ascii?Q?AeQYNGgkdWFthhltSmD0sNb4YO83vEEDny+x0IC4iTJYk8l2ZkJkoaY0eBwt?=
 =?us-ascii?Q?9CdioWKR2hqxgrbYo/6jsnQnmhZCIr//F//v8GInzsBCcUDEA6/XNgIL6QS5?=
 =?us-ascii?Q?a4+MKvojoNVRSX6xI1s=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(36860700013)(1800799024)(82310400026)(376014);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Jan 2026 20:20:11.7971
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 8fc9e33e-3043-43e9-28cb-08de4e2a2929
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CY4PEPF0000E9D3.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7079
Message-ID-Hash: P74CSMKV26C5G3HHDGKWKRM3RA47OYBV
X-Message-ID-Hash: P74CSMKV26C5G3HHDGKWKRM3RA47OYBV
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/P74CSMKV26C5G3HHDGKWKRM3RA47OYBV/>
Archived-At: 
 <https://lore.freedesktop.org/20260107201647.2490140-1-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The NV_PFALCON_FALCON_DMATRFBASE/1 register pair supports DMA addresses
up to 49 bits only, but the write to DMATRFBASE1 could exceed that.
To mitigate, check first that the DMA address will fit.

Reviewed-by: John Hubbard <jhubbard@nvidia.com>
Reviewed-by: Joel Fernandes <joelagnelf@nvidia.com>
Fixes: 69f5cd67ce41 ("gpu: nova-core: add falcon register definitions and base code")
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---

v2: Improved comment and moved check earlier in function

 drivers/gpu/nova-core/falcon.rs | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/nova-core/falcon.rs b/drivers/gpu/nova-core/falcon.rs
index 82c661aef594..6ae0490caffa 100644
--- a/drivers/gpu/nova-core/falcon.rs
+++ b/drivers/gpu/nova-core/falcon.rs
@@ -472,6 +472,12 @@ fn dma_wr<F: FalconFirmware<Target = E>>(
             return Err(EINVAL);
         }
 
+        // The DMATRFBASE/1 register pair only supports a 49-bit address.
+        if dma_start > kernel::dma::DmaMask::new::<49>().value() {
+            dev_err!(self.dev, "DMA address {:#x} exceeds 49 bits\n", dma_start);
+            return Err(ERANGE);
+        }
+
         // DMA transfers can only be done in units of 256 bytes. Compute how many such transfers we
         // need to perform.
         let num_transfers = load_offsets.len.div_ceil(DMA_LEN);

base-commit: 2d7b4a44fb768e1887e7e4cdd8b86817ccd9c3bf
-- 
2.52.0

