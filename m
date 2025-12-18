Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B85FCCA2E8
	for <lists+nouveau@lfdr.de>; Thu, 18 Dec 2025 04:30:41 +0100 (CET)
Received: from kara.freedesktop.org (unknown [131.252.210.166])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 6062710E64B;
	Thu, 18 Dec 2025 03:30:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="WP3gi+jX";
	dkim-atps=neutral
Received: from kara.freedesktop.org (localhost [127.0.0.1])
	by kara.freedesktop.org (Postfix) with ESMTP id 73DCD44B19;
	Thu, 18 Dec 2025 03:23:10 +0000 (UTC)
ARC-Seal: i=2; cv=pass; a=rsa-sha256; d=lists.freedesktop.org;
 s=20240201; t=1766028190;
 b=g/spCLkF4VDsjkrjHi5hGZWlmznBu9xT9zRmFjh16LiG+sMzZttHV5INdd+nGz7jJv1Wt
 hDanmcXqafQm8ChIpTNT/SXc3s6chJmR7fA3mghZDJxj35K6thfmyiZL5iOyfkac7ry85Ij
 EBcfqpXXzhOosxCZGMwbVBhyl1kZN+bEbVXGK6aOQPnA/lS8xFKt1loy9rbEHGIg/ur4P44
 Q97+FipDRX5e9ftT5FObhVAriuRJYn4oDYf30kSMKNNPDYuRoxJPzt3RhlssqWd1MgFKbVQ
 /BuiBJCclFWErC5R7cgri7J/uBNNc7g5GSDEyeQwKMdaZr/Ro9+ab7cf3uDA==
ARC-Message-Signature: i=2; a=rsa-sha256; c=relaxed/relaxed;
 d=lists.freedesktop.org; s=20240201; t=1766028190; h=from : sender :
 reply-to : subject : date : message-id : to : cc : mime-version :
 content-type : content-transfer-encoding : content-id :
 content-description : resent-date : resent-from : resent-sender :
 resent-to : resent-cc : resent-message-id : in-reply-to : references :
 list-id : list-help : list-unsubscribe : list-subscribe : list-post :
 list-owner : list-archive;
 bh=u76+VMu5X3jiCApFl5FpN2ac2OrubCdvshRouYn+uvw=;
 b=hbpVnv4JIDFU5h5l1PeB6cy2RjNjFabjpGh5zwSVH3l6tupfWyjl802lInwlwRsn98D+W
 9c9hABEo/vp//vp8Q2X+QLULH3Ei2BRcysPPceHKDnGfZTvy3t7wqXRp47OKdcBBM2De4Tx
 2tP0htqJv1wQLSQJ33EvEm7TfTGO4mG67lXsFJRDumPePL/RII+okqbqLthJmXgWPMzTPhZ
 aEwC3hwFUpWC7RPxRnbF75O8QoDGldGYJBdOlelzpjIEGBQe7h91yAeuXsluZ35c0654Ken
 KSVBF3frq53+JOFTMSEXnRaRCX9/pkiI81dlPZIj7wtrEQUi4vLAxmIVzTDg==
ARC-Authentication-Results: i=2; mail.freedesktop.org;
 dkim=pass header.d=Nvidia.com;
  arc=pass;
  dmarc=pass (Used From Domain Record) header.from=nvidia.com
 policy.dmarc=reject
Authentication-Results: mail.freedesktop.org; dkim=pass header.d=Nvidia.com;
 arc=pass;
 dmarc=pass (Used From Domain Record) header.from=nvidia.com policy.dmarc=reject
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by kara.freedesktop.org (Postfix) with ESMTPS id 9E11844B0F
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:23:05 +0000 (UTC)
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010021.outbound.protection.outlook.com
 [52.101.193.21])
	by gabe.freedesktop.org (Postfix) with ESMTPS id 413D210E37A
	for <nouveau@lists.freedesktop.org>; Thu, 18 Dec 2025 03:30:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SlveIuHCEgzcoa6iiYSyujxZWGRAYVIyDs4Dgiunt405EuKwG4gpIZrp/hO3k3eYn8uV9Kh2o1U7EkHxDrF9woCWOQ1nGtuVbXKAfin+oOWSMGjT9W02AH/8Y8fI4zL80pA5fy4k2GiAUxJVtsh1KULHB6aCt1UchPUQMk4bZULd1A2krvfDlE9ma2/TMQ8yvnILFkPIDLAQP5KPZgSCwJgfbuGjpZOJ50paZR6QbDZOAKyz6KUdZXprzEa0VP6x0Z94zMzw7Qo/Xh5diG6rww9t2nHRuriRKUPKnJotS0mT+JysuLFGAW8GieoCzcHqCDtAdEGUUaK44jWoKXxASA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=u76+VMu5X3jiCApFl5FpN2ac2OrubCdvshRouYn+uvw=;
 b=HDAwimf2zqSq30qFiHhyNxtn00lhdKcYKKxsS++k1OTMwiS77o9nKHXzpMTTRWncUeWZgbORd3qfFdQ3imgXFO9AkH2HDSqfle1uUSbaZTReVzpNgiF37I2lDl5WTSFqTJFMDtAFlTGZ+HBvhVg5ksEZy5B7rHsd54QO2vFTxC+yy8P2uB9eR3ryeZg7i7XoHuqMgz2hzFD+HSbRAe5FqQkO4pSAYSFsYjeNRhwJ95Jga9sfusxHYAQNGz0HbtppQEvB4tVmh/kJ6iIgZHj6oRLwXfQK0OkBVNoFSUYSXOvqXY8gXNOQlCfLMjdSzO5CXAbFtXi9HtPqHDuMQhVUbw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=u76+VMu5X3jiCApFl5FpN2ac2OrubCdvshRouYn+uvw=;
 b=WP3gi+jXCrrIMYirhYKROVqxsht3i5Z7kysFlRwkJki/M2VdhZuh2pzE5YYyO2PnMrOnD8DggtsZbEX5mH9+eel9X43tbaNwdBJkCQpqMmy5i2RwZzXpqJ1ghGVytnfHwBV2Bj+WZcogStw2UkLpGWS/+RHtU/Wu+BEnO6Nre+ys32yholU3oy9Y0vvxjpLyjSNNdgpsjrj7WZr2rBCx6hYQg/nrzzyVLEiTg0s3chIiD1PeIf2Vn49BY5TzKSqVHQ9g5WW1fWjntxCS0++81lNPKKSx48tyYbuRhLmGC+ZO5eSliSzy9CMyi59PLakMSz/+l1uZ0k8JYMyqoHnV9g==
Received: from CH0PR03CA0213.namprd03.prod.outlook.com (2603:10b6:610:e7::8)
 by DS2PR12MB9710.namprd12.prod.outlook.com (2603:10b6:8:276::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.6; Thu, 18 Dec
 2025 03:30:30 +0000
Received: from CH3PEPF00000012.namprd21.prod.outlook.com
 (2603:10b6:610:e7:cafe::d3) by CH0PR03CA0213.outlook.office365.com
 (2603:10b6:610:e7::8) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9434.7 via Frontend Transport; Thu,
 18 Dec 2025 03:30:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH3PEPF00000012.mail.protection.outlook.com (10.167.244.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9456.0 via Frontend Transport; Thu, 18 Dec 2025 03:30:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:13 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Wed, 17 Dec
 2025 19:30:11 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
	<acourbot@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, John Hubbard
	<jhubbard@nvidia.com>, <nouveau@lists.freedesktop.org>,
	<rust-for-linux@vger.kernel.org>
Subject: [PATCH v4 09/11] gpu: nova-core: add FalconUCodeDescV2 support
Date: Wed, 17 Dec 2025 21:29:53 -0600
Message-ID: <20251218032955.979623-10-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH3PEPF00000012:EE_|DS2PR12MB9710:EE_
X-MS-Office365-Filtering-Correlation-Id: f928f684-0b1c-4f9a-591e-08de3de5cb2d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: 
	BCL:0;ARA:13230040|1800799024|36860700013|376014|82310400026;
X-Microsoft-Antispam-Message-Info: 
	=?us-ascii?Q?zbSbi20JCJhmo3VqU/He+93N2z+IlS2HFYKVib1tG5VRHr3U3GyaT/9avnIT?=
 =?us-ascii?Q?eguU1hhLVrNEqhhpjv+95ZD8gjh0sGw12yuFCD1/DmuekvHrPhnYCnk0tgiA?=
 =?us-ascii?Q?mJXgDwslsd+aJ+fPCe/ulNuJbSJ1yYaZsMrJyotmGmKSrloVhlFjr/FI/nrN?=
 =?us-ascii?Q?JcPJG/lHQ01S9CVY/dBCn91ykki3KH1gFAXxP3FwBBO4VWVbrpbUYt+Gy3Qe?=
 =?us-ascii?Q?Vc8wumrzBCBFQ+2+ot/NIdp0witx5SsTa1Sxl3l9x8bl0IVFdUaLVy/m1SCR?=
 =?us-ascii?Q?RgO7dUoWg3cqWmEGy4R1QjL1F+crXIiwuatTgeRvTZ8sszMhVDggt+WmBsI4?=
 =?us-ascii?Q?6aoV/6V4zvkdCand7NxNb3Jes5LagOPdRJllsedmUuK1bfFR57L9hBtEWbIj?=
 =?us-ascii?Q?uUESDvMq6oPh/+yFwQLvsHXi6CimSfBLa9goMk5QDzLjnySWvwDejfjxHG0O?=
 =?us-ascii?Q?3EasLhOvl1RNmid84gA+qmXnWNXq9DS/Hob6Q+UqiTsh44GcRQ0tZpD7vwAO?=
 =?us-ascii?Q?aGt9wxw8D3lqD2aUvw+fIr7LTs8/ZrGAa/WN36WdvlZxlw5mJE9aofuzjkGh?=
 =?us-ascii?Q?Y1qPJeLWdxbMMezeTcsG6cpMT4yVNaK1biGqOIg+Ko22PEf4sE5wthSLR24P?=
 =?us-ascii?Q?33tvcvlaSzFk6wx1TKgLiw72RPi0xYJYxGmwYIL+FTFhO9OshotL0rPxcptI?=
 =?us-ascii?Q?F/3h2kY5vW6O2sVNGkfHV/o+jVV1Y79Ogwpj3nQXnpucSPvUbRENr4WdtOTW?=
 =?us-ascii?Q?F30DMdJC3iJLIu30kdDUxQ5Q9HnHeEekyGtjSnf+5gypqxm7N3GQe2OGHgi7?=
 =?us-ascii?Q?coJyw+3p+01VL/4c2L1STulVM/AGjSUrsvSITCkVZn5tXuMyfpezELwyJ/+J?=
 =?us-ascii?Q?XnOSEbOVq4zNfwqBksRyZBxrAUCfR+qkvb0Z00c9zcoY5mxj+/iZy1yGrlG1?=
 =?us-ascii?Q?XVtUMaIX+LQpRED4HgVOVWXd7LW5UpO41hIJpaRjstIKhZEQPjbwe+7a11MN?=
 =?us-ascii?Q?VMdLu8KYj9VP86RYoujOteCOx2j7a/GLw9bOR0vlvp+QMZvciN2xNt3olRLt?=
 =?us-ascii?Q?PSA9dj7rvuPRWiXrlSNothwNnD2PwpP6+WYgTzs9hmm17r7Y6N0PIPkRhE3O?=
 =?us-ascii?Q?PrnvBxfddD8ox2dmldz3YMvLGlXPw8STa2I4C0TJ8YmOcjDs0+SeR5TP4me4?=
 =?us-ascii?Q?mD6AlgeW9tdB1W4Q/cm1T+hdfl7TC9vdShudL+WtUwElrdeDrU/PX9u2lzhQ?=
 =?us-ascii?Q?zDwNmrXy1QmhsN9ces//tkKKpzsme9fjdEkc7ZBWQmnLGsmZy4aUusFRRDsW?=
 =?us-ascii?Q?YkCVR/eD2MGqFztLOBH0oQwo6PodMwW+7pAChtLxvWzxg3UCPtcgwu11Vohc?=
 =?us-ascii?Q?oPcPi9h+xH8oxRKLfA5Y5Fn2hd8ciem+Xob+IQuC7L22bLs+D33kP8Rcw/ix?=
 =?us-ascii?Q?EmOH5jTA7tKrpSkultrVRx7ptU8JigpH5EVxW+kPkB3cg+ytTkvjp3eRyEDK?=
 =?us-ascii?Q?4aghqpBedaGkNSnJ+ScU6C++QgsQ4TevNAjGIHrZJn5YjFFZOGez2uDi+Zsq?=
 =?us-ascii?Q?2ogW/IusWdTM9zNuNGg=3D?=
X-Forefront-Antispam-Report: 
	CIP:216.228.117.160;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:mail.nvidia.com;PTR:dc6edge1.nvidia.com;CAT:NONE;SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026);DIR:OUT;SFP:1101;
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Dec 2025 03:30:29.7341
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 
 f928f684-0b1c-4f9a-591e-08de3de5cb2d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: 
 TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a;Ip=[216.228.117.160];Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: 
	CH3PEPF00000012.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS2PR12MB9710
Message-ID-Hash: S5PG5WBEVGC6FPWJN6SJZQZPXPUKI4ER
X-Message-ID-Hash: S5PG5WBEVGC6FPWJN6SJZQZPXPUKI4ER
X-MailFrom: ttabi@nvidia.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency;
 loop; banned-address; member-moderation; nonmember-moderation; administrivia;
 implicit-dest; max-recipients; max-size; news-moderation; no-subject;
 digests; suspicious-header
X-Mailman-Version: 3.3.8
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
Archived-At: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/message/S5PG5WBEVGC6FPWJN6SJZQZPXPUKI4ER/>
Archived-At: 
 <https://lore.freedesktop.org/20251218032955.979623-10-ttabi@nvidia.com/>
List-Archive: 
 <https://lists.freedesktop.org/hyperkitty/list/nouveau@lists.freedesktop.org/>
List-Archive: <https://lore.freedesktop.org/nouveau>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Owner: <mailto:nouveau-owner@lists.freedesktop.org>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Subscribe: <mailto:nouveau-join@lists.freedesktop.org>
List-Unsubscribe: <mailto:nouveau-leave@lists.freedesktop.org>

The FRTS firmware in Turing and GA100 VBIOS has an older header
format (v2 instead of v3).  To support both v2 and v3 at runtime,
add the FalconUCodeDescV2 struct, and update code that references
the FalconUCodeDescV3 directly with a FalconUCodeDesc enum that
encapsulates both.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware.rs       | 177 +++++++++++++++++++++++-
 drivers/gpu/nova-core/firmware/fwsec.rs |  72 ++++++----
 drivers/gpu/nova-core/vbios.rs          |  75 +++++-----
 3 files changed, 266 insertions(+), 58 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware.rs b/drivers/gpu/nova-core/firmware.rs
index 2d2008b33fb4..44897feb82a4 100644
--- a/drivers/gpu/nova-core/firmware.rs
+++ b/drivers/gpu/nova-core/firmware.rs
@@ -43,6 +43,46 @@ fn request_firmware(
         .and_then(|path| firmware::Firmware::request(&path, dev))
 }
 
+/// Structure used to describe some firmwares, notably FWSEC-FRTS.
+#[repr(C)]
+#[derive(Debug, Clone)]
+pub(crate) struct FalconUCodeDescV2 {
+    /// Header defined by 'NV_BIT_FALCON_UCODE_DESC_HEADER_VDESC*' in OpenRM.
+    hdr: u32,
+    /// Stored size of the ucode after the header, compressed or uncompressed
+    stored_size: u32,
+    /// Uncompressed size of the ucode.  If store_size == uncompressed_size, then the ucode
+    /// is not compressed.
+    pub(crate) uncompressed_size: u32,
+    /// Code entry point
+    pub(crate) virtual_entry: u32,
+    /// Offset after the code segment at which the Application Interface Table headers are located.
+    pub(crate) interface_offset: u32,
+    /// Base address at which to load the code segment into 'IMEM'.
+    pub(crate) imem_phys_base: u32,
+    /// Size in bytes of the code to copy into 'IMEM'.
+    pub(crate) imem_load_size: u32,
+    /// Virtual 'IMEM' address (i.e. 'tag') at which the code should start.
+    pub(crate) imem_virt_base: u32,
+    /// Virtual address of secure IMEM segment.
+    pub(crate) imem_sec_base: u32,
+    /// Size of secure IMEM segment.
+    pub(crate) imem_sec_size: u32,
+    /// Offset into stored (uncompressed) image at which DMEM begins.
+    pub(crate) dmem_offset: u32,
+    /// Base address at which to load the data segment into 'DMEM'.
+    pub(crate) dmem_phys_base: u32,
+    /// Size in bytes of the data to copy into 'DMEM'.
+    pub(crate) dmem_load_size: u32,
+    /// "Alternate" Size of data to load into IMEM.
+    pub(crate) alt_imem_load_size: u32,
+    /// "Alternate" Size of data to load into DMEM.
+    pub(crate) alt_dmem_load_size: u32,
+}
+
+// SAFETY: all bit patterns are valid for this type, and it doesn't use interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV2 {}
+
 /// Structure used to describe some firmwares, notably FWSEC-FRTS.
 #[repr(C)]
 #[derive(Debug, Clone)]
@@ -76,13 +116,146 @@ pub(crate) struct FalconUCodeDescV3 {
     _reserved: u16,
 }
 
-impl FalconUCodeDescV3 {
+// SAFETY: all bit patterns are valid for this type, and it doesn't use
+// interior mutability.
+unsafe impl FromBytes for FalconUCodeDescV3 {}
+
+/// Enum wrapping the different versions of Falcon microcode descriptors.
+///
+/// This allows handling both V2 and V3 descriptor formats through a
+/// unified type, providing version-agnostic access to firmware metadata
+/// via the [`FalconUCodeDescriptor`] trait.
+#[derive(Debug, Clone)]
+pub(crate) enum FalconUCodeDesc {
+    V2(FalconUCodeDescV2),
+    V3(FalconUCodeDescV3),
+}
+
+/// Trait providing a common interface for accessing Falcon microcode descriptor fields.
+///
+/// This trait abstracts over the different descriptor versions ([`FalconUCodeDescV2`] and
+/// [`FalconUCodeDescV3`]), allowing code to work with firmware metadata without needing to
+/// know the specific descriptor version. Fields not present return zero.
+pub(crate) trait FalconUCodeDescriptor {
+    fn hdr(&self) -> u32;
+    fn imem_load_size(&self) -> u32;
+    fn interface_offset(&self) -> u32;
+    fn dmem_load_size(&self) -> u32;
+    fn pkc_data_offset(&self) -> u32;
+    fn engine_id_mask(&self) -> u16;
+    fn ucode_id(&self) -> u8;
+    fn signature_count(&self) -> u8;
+    fn signature_versions(&self) -> u16;
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV2 {
+    fn hdr(&self) -> u32 {
+        self.hdr
+    }
+    fn imem_load_size(&self) -> u32 {
+        self.imem_load_size
+    }
+    fn interface_offset(&self) -> u32 {
+        self.interface_offset
+    }
+    fn dmem_load_size(&self) -> u32 {
+        self.dmem_load_size
+    }
+    fn pkc_data_offset(&self) -> u32 {
+        0
+    }
+    fn engine_id_mask(&self) -> u16 {
+        0
+    }
+    fn ucode_id(&self) -> u8 {
+        0
+    }
+    fn signature_count(&self) -> u8 {
+        0
+    }
+    fn signature_versions(&self) -> u16 {
+        0
+    }
+}
+
+impl FalconUCodeDescriptor for FalconUCodeDescV3 {
+    fn hdr(&self) -> u32 {
+        self.hdr
+    }
+    fn imem_load_size(&self) -> u32 {
+        self.imem_load_size
+    }
+    fn interface_offset(&self) -> u32 {
+        self.interface_offset
+    }
+    fn dmem_load_size(&self) -> u32 {
+        self.dmem_load_size
+    }
+    fn pkc_data_offset(&self) -> u32 {
+        self.pkc_data_offset
+    }
+    fn engine_id_mask(&self) -> u16 {
+        self.engine_id_mask
+    }
+    fn ucode_id(&self) -> u8 {
+        self.ucode_id
+    }
+    fn signature_count(&self) -> u8 {
+        self.signature_count
+    }
+    fn signature_versions(&self) -> u16 {
+        self.signature_versions
+    }
+}
+
+impl FalconUCodeDesc {
+    // Return trait object, the only match needed.
+    pub(crate) fn as_descriptor(&self) -> &dyn FalconUCodeDescriptor {
+        match self {
+            FalconUCodeDesc::V2(v2) => v2,
+            FalconUCodeDesc::V3(v3) => v3,
+        }
+    }
+
     /// Returns the size in bytes of the header.
     pub(crate) fn size(&self) -> usize {
+        let hdr = self.as_descriptor().hdr();
+
         const HDR_SIZE_SHIFT: u32 = 16;
         const HDR_SIZE_MASK: u32 = 0xffff0000;
+        ((hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    }
+
+    pub(crate) fn imem_load_size(&self) -> u32 {
+        self.as_descriptor().imem_load_size()
+    }
+
+    pub(crate) fn interface_offset(&self) -> u32 {
+        self.as_descriptor().interface_offset()
+    }
+
+    pub(crate) fn dmem_load_size(&self) -> u32 {
+        self.as_descriptor().dmem_load_size()
+    }
+
+    pub(crate) fn pkc_data_offset(&self) -> u32 {
+        self.as_descriptor().pkc_data_offset()
+    }
+
+    pub(crate) fn engine_id_mask(&self) -> u16 {
+        self.as_descriptor().engine_id_mask()
+    }
+
+    pub(crate) fn ucode_id(&self) -> u8 {
+        self.as_descriptor().ucode_id()
+    }
+
+    pub(crate) fn signature_count(&self) -> u8 {
+        self.as_descriptor().signature_count()
+    }
 
-        ((self.hdr & HDR_SIZE_MASK) >> HDR_SIZE_SHIFT).into_safe_cast()
+    pub(crate) fn signature_versions(&self) -> u16 {
+        self.as_descriptor().signature_versions()
     }
 }
 
diff --git a/drivers/gpu/nova-core/firmware/fwsec.rs b/drivers/gpu/nova-core/firmware/fwsec.rs
index e4009faba6c5..1c1dcdacf5f5 100644
--- a/drivers/gpu/nova-core/firmware/fwsec.rs
+++ b/drivers/gpu/nova-core/firmware/fwsec.rs
@@ -40,7 +40,7 @@
         FalconLoadTarget, //
     },
     firmware::{
-        FalconUCodeDescV3,
+        FalconUCodeDesc,
         FirmwareDmaObject,
         FirmwareSignature,
         Signed,
@@ -218,38 +218,59 @@ unsafe fn transmute_mut<T: Sized + FromBytes + AsBytes>(
 /// It is responsible for e.g. carving out the WPR2 region as the first step of the GSP bootflow.
 pub(crate) struct FwsecFirmware {
     /// Descriptor of the firmware.
-    desc: FalconUCodeDescV3,
+    desc: FalconUCodeDesc,
     /// GPU-accessible DMA object containing the firmware.
     ucode: FirmwareDmaObject<Self, Signed>,
 }
 
 impl FalconLoadParams for FwsecFirmware {
     fn imem_sec_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: 0,
-            dst_start: self.desc.imem_phys_base,
-            len: self.desc.imem_load_size,
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
+                src_start: 0,
+                dst_start: v2.imem_sec_base,
+                len: v2.imem_sec_size,
+            },
+            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
+                src_start: 0,
+                dst_start: v3.imem_phys_base,
+                len: v3.imem_load_size,
+            },
         }
     }
 
     fn imem_ns_load_params(&self) -> Option<FalconLoadTarget> {
-        // Only used on Turing and GA100, so return None for now
-        None
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => Some(FalconLoadTarget {
+                src_start: 0,
+                dst_start: v2.imem_phys_base,
+                len: v2.imem_load_size - v2.imem_sec_size,
+            }),
+            // Not used on V3 platforms
+            FalconUCodeDesc::V3(_v3) => None,
+        }
     }
 
     fn dmem_load_params(&self) -> FalconLoadTarget {
-        FalconLoadTarget {
-            src_start: self.desc.imem_load_size,
-            dst_start: self.desc.dmem_phys_base,
-            len: self.desc.dmem_load_size,
+        match &self.desc {
+            FalconUCodeDesc::V2(v2) => FalconLoadTarget {
+                src_start: v2.dmem_offset,
+                dst_start: v2.dmem_phys_base,
+                len: v2.dmem_load_size,
+            },
+            FalconUCodeDesc::V3(v3) => FalconLoadTarget {
+                src_start: v3.imem_load_size,
+                dst_start: v3.dmem_phys_base,
+                len: v3.dmem_load_size,
+            },
         }
     }
 
     fn brom_params(&self) -> FalconBromParams {
         FalconBromParams {
-            pkc_data_offset: self.desc.pkc_data_offset,
-            engine_id_mask: self.desc.engine_id_mask,
-            ucode_id: self.desc.ucode_id,
+            pkc_data_offset: self.desc.pkc_data_offset(),
+            engine_id_mask: self.desc.engine_id_mask(),
+            ucode_id: self.desc.ucode_id(),
         }
     }
 
@@ -273,10 +294,10 @@ impl FalconFirmware for FwsecFirmware {
 impl FirmwareDmaObject<FwsecFirmware, Unsigned> {
     fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Result<Self> {
         let desc = bios.fwsec_image().header()?;
-        let ucode = bios.fwsec_image().ucode(desc)?;
+        let ucode = bios.fwsec_image().ucode(&desc)?;
         let mut dma_object = DmaObject::from_data(dev, ucode)?;
 
-        let hdr_offset = usize::from_safe_cast(desc.imem_load_size + desc.interface_offset);
+        let hdr_offset = usize::from_safe_cast(desc.imem_load_size() + desc.interface_offset());
         // SAFETY: we have exclusive access to `dma_object`.
         let hdr: &FalconAppifHdrV1 = unsafe { transmute(&dma_object, hdr_offset) }?;
 
@@ -303,7 +324,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let dmem_mapper: &mut FalconAppifDmemmapperV3 = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + dmem_base).into_safe_cast(),
+                    (desc.imem_load_size() + dmem_base).into_safe_cast(),
                 )
             }?;
 
@@ -317,7 +338,7 @@ fn new_fwsec(dev: &Device<device::Bound>, bios: &Vbios, cmd: FwsecCommand) -> Re
             let frts_cmd: &mut FrtsCmd = unsafe {
                 transmute_mut(
                     &mut dma_object,
-                    (desc.imem_load_size + cmd_in_buffer_offset).into_safe_cast(),
+                    (desc.imem_load_size() + cmd_in_buffer_offset).into_safe_cast(),
                 )
             }?;
 
@@ -364,11 +385,12 @@ pub(crate) fn new(
 
         // Patch signature if needed.
         let desc = bios.fwsec_image().header()?;
-        let ucode_signed = if desc.signature_count != 0 {
-            let sig_base_img = usize::from_safe_cast(desc.imem_load_size + desc.pkc_data_offset);
-            let desc_sig_versions = u32::from(desc.signature_versions);
+        let ucode_signed = if desc.signature_count() != 0 {
+            let sig_base_img =
+                usize::from_safe_cast(desc.imem_load_size() + desc.pkc_data_offset());
+            let desc_sig_versions = u32::from(desc.signature_versions());
             let reg_fuse_version =
-                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask, desc.ucode_id)?;
+                falcon.signature_reg_fuse_version(bar, desc.engine_id_mask(), desc.ucode_id())?;
             dev_dbg!(
                 dev,
                 "desc_sig_versions: {:#x}, reg_fuse_version: {}\n",
@@ -402,7 +424,7 @@ pub(crate) fn new(
             dev_dbg!(dev, "patching signature with index {}\n", signature_idx);
             let signature = bios
                 .fwsec_image()
-                .sigs(desc)
+                .sigs(&desc)
                 .and_then(|sigs| sigs.get(signature_idx).ok_or(EINVAL))?;
 
             ucode_dma.patch_signature(signature, sig_base_img)?
@@ -411,7 +433,7 @@ pub(crate) fn new(
         };
 
         Ok(FwsecFirmware {
-            desc: desc.clone(),
+            desc: desc,
             ucode: ucode_signed,
         })
     }
diff --git a/drivers/gpu/nova-core/vbios.rs b/drivers/gpu/nova-core/vbios.rs
index abf423560ff4..11469bb1f352 100644
--- a/drivers/gpu/nova-core/vbios.rs
+++ b/drivers/gpu/nova-core/vbios.rs
@@ -19,6 +19,8 @@
     driver::Bar0,
     firmware::{
         fwsec::Bcrt30Rsa3kSignature,
+        FalconUCodeDesc,
+        FalconUCodeDescV2,
         FalconUCodeDescV3, //
     },
     num::FromSafeCast,
@@ -1004,19 +1006,10 @@ fn build(self) -> Result<FwSecBiosImage> {
 
 impl FwSecBiosImage {
     /// Get the FwSec header ([`FalconUCodeDescV3`]).
-    pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
+    pub(crate) fn header(&self) -> Result<FalconUCodeDesc> {
         // Get the falcon ucode offset that was found in setup_falcon_data.
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
-        // Make sure the offset is within the data bounds.
-        if falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>() > self.base.data.len() {
-            dev_err!(
-                self.base.dev,
-                "fwsec-frts header not contained within BIOS bounds\n"
-            );
-            return Err(ERANGE);
-        }
-
         // Read the first 4 bytes to get the version.
         let hdr_bytes: [u8; 4] = self.base.data[falcon_ucode_offset..falcon_ucode_offset + 4]
             .try_into()
@@ -1024,33 +1017,49 @@ pub(crate) fn header(&self) -> Result<&FalconUCodeDescV3> {
         let hdr = u32::from_le_bytes(hdr_bytes);
         let ver = (hdr & 0xff00) >> 8;
 
-        if ver != 3 {
-            dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
-            return Err(EINVAL);
+        let hdr_size = match ver {
+            2 => core::mem::size_of::<FalconUCodeDescV2>(),
+            3 => core::mem::size_of::<FalconUCodeDescV3>(),
+            _ => {
+                dev_err!(self.base.dev, "invalid fwsec firmware version: {:?}\n", ver);
+                return Err(EINVAL);
+            }
+        };
+        // Make sure the offset is within the data bounds
+        if falcon_ucode_offset + hdr_size > self.base.data.len() {
+            dev_err!(
+                self.base.dev,
+                "fwsec-frts header not contained within BIOS bounds\n"
+            );
+            return Err(ERANGE);
         }
 
-        // Return a reference to the FalconUCodeDescV3 structure.
-        //
-        // SAFETY: We have checked that `falcon_ucode_offset + size_of::<FalconUCodeDescV3>` is
-        // within the bounds of `data`. Also, this data vector is from ROM, and the `data` field
-        // in `BiosImageBase` is immutable after construction.
-        Ok(unsafe {
-            &*(self
-                .base
-                .data
-                .as_ptr()
-                .add(falcon_ucode_offset)
-                .cast::<FalconUCodeDescV3>())
-        })
+        let data = self
+            .base
+            .data
+            .get(falcon_ucode_offset..falcon_ucode_offset + hdr_size)
+            .ok_or(EINVAL)?;
+
+        match ver {
+            2 => {
+                let v2 = FalconUCodeDescV2::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V2(v2.clone()))
+            }
+            3 => {
+                let v3 = FalconUCodeDescV3::from_bytes(data).ok_or(EINVAL)?;
+                Ok(FalconUCodeDesc::V3(v3.clone()))
+            }
+            _ => Err(EINVAL),
+        }
     }
 
     /// Get the ucode data as a byte slice
-    pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
+    pub(crate) fn ucode(&self, desc: &FalconUCodeDesc) -> Result<&[u8]> {
         let falcon_ucode_offset = self.falcon_ucode_offset;
 
         // The ucode data follows the descriptor.
         let ucode_data_offset = falcon_ucode_offset + desc.size();
-        let size = usize::from_safe_cast(desc.imem_load_size + desc.dmem_load_size);
+        let size = usize::from_safe_cast(desc.imem_load_size() + desc.dmem_load_size());
 
         // Get the data slice, checking bounds in a single operation.
         self.base
@@ -1066,10 +1075,14 @@ pub(crate) fn ucode(&self, desc: &FalconUCodeDescV3) -> Result<&[u8]> {
     }
 
     /// Get the signatures as a byte slice
-    pub(crate) fn sigs(&self, desc: &FalconUCodeDescV3) -> Result<&[Bcrt30Rsa3kSignature]> {
+    pub(crate) fn sigs(&self, desc: &FalconUCodeDesc) -> Result<&[Bcrt30Rsa3kSignature]> {
+        let hdr_size = match desc {
+            FalconUCodeDesc::V2(_v2) => core::mem::size_of::<FalconUCodeDescV2>(),
+            FalconUCodeDesc::V3(_v3) => core::mem::size_of::<FalconUCodeDescV3>(),
+        };
         // The signatures data follows the descriptor.
-        let sigs_data_offset = self.falcon_ucode_offset + core::mem::size_of::<FalconUCodeDescV3>();
-        let sigs_count = usize::from(desc.signature_count);
+        let sigs_data_offset = self.falcon_ucode_offset + hdr_size;
+        let sigs_count = usize::from(desc.signature_count());
         let sigs_size = sigs_count * core::mem::size_of::<Bcrt30Rsa3kSignature>();
 
         // Make sure the data is within bounds.
-- 
2.52.0

