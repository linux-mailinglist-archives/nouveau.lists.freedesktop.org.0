Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CFFC2CB9D05
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:50:35 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7879010E963;
	Fri, 12 Dec 2025 20:50:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="s0PL+uFX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH5PR02CU005.outbound.protection.outlook.com
 (mail-northcentralusazon11012042.outbound.protection.outlook.com
 [40.107.200.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B4F10E963
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:50:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tcVntItLo1b+Qjsg/23iVx89Y7aO7JGY0ZqW18bKdgZT58Ofa3rtDi+DM554uwPltXjw2mpUL8vtov1HjI9d5wyyRkh1znxnATSD89w580S52oUYI4c+r+Tiu202NP4IdHIyZNx7+BXKbdKswUMHcyPLBVmQhl7bbldYl9VpV3lsXKbyuac68N2ARyPgvuQ8NrdhHwso/+MlJCiVNHgE4YMVy3tya+eES9tjFC8fvhobIzvELgDRnj79MYcYD1YPmA0X+xBLc2tmU6ePzeDUGxydkcryN5YK5D9H7I2VZcg+7lY1hg86AcEXSD21IFNUyWnLwVIrfYxEL5Wkx3dPKw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HLV01b18XKFs7fcmA97WvoLrjEG5gG3pxBjJtfgS4jo=;
 b=tkl8Z4fPRJimI9mkLnJAIYizgKpXzyRZ/VWFT2LPFGdEjOrWrdB4urZANb0c84lFYTh4Sp/MwhUUUcLGi/02IO6mrkaOZUcvkLgKVXQSAFrNKvbtgxHK4Vfl5GwZ5jOo0eEEnpFCCAAcXnynz3yN/P/R5hqJGxh+2ZF7xH+jWM5XWaN7F68sVUOjZ9DjThB+kCveNyTXxnYA0CHTvk7LSalNAWtXbnCFFs/TxMrrEQTJeLHghRdFsld5ITlt4k9xcmxvfqoPs+3jgm6wvbD/lx2w82zGijTSYYFkkKyi8t+g2QhP5L5Gxq9CJ/rpL1TiyUkBHHy+SkUoHpqVpo05sA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HLV01b18XKFs7fcmA97WvoLrjEG5gG3pxBjJtfgS4jo=;
 b=s0PL+uFX3QMkCDJCckC14HGP2FDh/7fDy3ToV2G5oW1bSLdfdpJ0az7RmlHn9GTmPc/Jp6tdTd+HyHKQzRZH63xYKEAxyGBUMRgJxHeC8wxtRuCxJ8qu9T+c6Ixy8UNIBxTuBs1Fhr7TLa70GCv5zCcT1NiAMC8ihgm9YL+8yC6J7DGBP68F+ShyCZOc3mTj4dO2Rx0+7e26fQ3dgoKOBPKf5iF4v2F0k1jAoKxNgSdxmsrBsEWb0a/dzHkjOl0rnb/f6ycjyia47iSgj2g8OULxl8b9yLEY0Ns8KeS10EyChtC35zzUG9JbfeVHk33Xai/fQTrVAU6659ZSnzzYRQ==
Received: from BY5PR16CA0018.namprd16.prod.outlook.com (2603:10b6:a03:1a0::31)
 by SJ5PPFEB07C8E34.namprd12.prod.outlook.com
 (2603:10b6:a0f:fc02::9a8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.8; Fri, 12 Dec
 2025 20:50:29 +0000
Received: from MWH0EPF000A672E.namprd04.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::d5) by BY5PR16CA0018.outlook.office365.com
 (2603:10b6:a03:1a0::31) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 20:50:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A672E.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:29 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:06 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:05 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 4/7] gpu: nova-core: implement BinaryWriter for LogBuffer
Date: Fri, 12 Dec 2025 14:49:49 -0600
Message-ID: <20251212204952.3690244-5-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251212204952.3690244-1-ttabi@nvidia.com>
References: <20251212204952.3690244-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MWH0EPF000A672E:EE_|SJ5PPFEB07C8E34:EE_
X-MS-Office365-Filtering-Correlation-Id: 4530a528-f70d-4aa1-fd96-08de39c015a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XJcw8EMfc1S3yo/242fwhl5pbCWatp047KCIOvmI4GgP9quaEekLbw80Jk6Y?=
 =?us-ascii?Q?4Ag/qrMbUIfooHO4rTTaScJHZeWagRtBs0yPXxDS383TioeR/k9kefOy+v/F?=
 =?us-ascii?Q?w7N3LzGX5YHhEKLkLh3OfrEreD2w3q01lSCLEJStDnSkHfrhW8XSL7TOvZQA?=
 =?us-ascii?Q?JtxumyxLzCBdhZSWgjSvR6HM8oyBWV0y8zuYdwcyVIGUx2H3L7As8IlOgaHo?=
 =?us-ascii?Q?jlrzlkE1inV1Qvtz8vNEmTiC4NGAlj4H4h7Q+IlFR7/NW3T7TYyadwpTvmg3?=
 =?us-ascii?Q?rwj8sQWlegWCIqMmMKYSWILGGt5nimqUGSD5JOCpZlY796i8Dr1ZVM6cFWSF?=
 =?us-ascii?Q?ZojVvhsOYBduFlunlAUge3qp1ocgMjV1X7vcB2aPvYcxhf1kYznSXfVeNXiZ?=
 =?us-ascii?Q?Ls0wgryRjV32U1IN8FSeeLdl9N6pM6Kk91NrhQPelPsGQXI3Tn+1SDbdIggx?=
 =?us-ascii?Q?XBSBeWZZTCy84xTVD6jt1sEs+vjo9QJaxkjaWbB6LSlbw17Jrf9XFFbn4G94?=
 =?us-ascii?Q?dMM6kCToEwMslS0V1Vh75LFWzVyPU0cj30MqW+dsYtuID/hPgDOF9Ab8GpYD?=
 =?us-ascii?Q?FNhsgeTpnJFaySwvnsNGIeOt357xDkAU5uFmrX+kF2rYtq4UVp4G9sbTgBOt?=
 =?us-ascii?Q?J9n3RYMhbN+ZzBjK06qXcdOQZGKOTCX3PrZbHKgrrRpNGHp+1ZVc0Ke3MPxO?=
 =?us-ascii?Q?CFcZa8K4e0ZgXVRY9jS8SCZAhiD7M/L3Il/cTRv33AbAG1Cg2zlbGalTFA+Y?=
 =?us-ascii?Q?cjJts8Wyjcfv07S4960kHcr35ySby8gA2rDXsGVYxDcVI3/Ig1sfyWbF2Sal?=
 =?us-ascii?Q?l3+IJnmLVVrxn+AZMb8moHIXrQn/u2uKfKEywkpiUizWnuDZeSHsz+MGXcqp?=
 =?us-ascii?Q?vhVV6JcI58l6H/pT04KoOC9cynFzTIBnESmLxWSJO9IBE5+d5Vr5fsIRP57W?=
 =?us-ascii?Q?NokKyHvyQSuJVBr4h3h3tOMRcaD+4KDd2LRb/dkiREerwXbfPzftinEoVf+8?=
 =?us-ascii?Q?u5opHsztwGqaLf6d284P9vYl+JmpFL9zcZ/IrB+M54MgxGN9/MWktp+jLACA?=
 =?us-ascii?Q?MAxrfeXPGeR+15HIozcy7Q6MdOPXTgZHsb/PaRzOHKMwQbGfQBPeWlS0dFZT?=
 =?us-ascii?Q?FzriZLntlEcEeLdJpZguxrILNmtTd7x73broFjLhCl2IONrm0hlPqAVcwZ0k?=
 =?us-ascii?Q?rHo9/uA008u72oHLSataXkSyq8WJ9ozGZIBKd0as/HKekgIS9VqhnwMkHqa6?=
 =?us-ascii?Q?6FDE6p82dLrEu/JvicA/ueqfEB/EtKs68dBKaL1MaF6fdevD8KF+dasFQ8r6?=
 =?us-ascii?Q?Gmjj2+6uiGUzASNQQrwYoR9LjlyY7LlTh2OJzfZAPeFIDCkeptG/te4UDwir?=
 =?us-ascii?Q?G+5p6RcbkUdkddpqp5/O5dpdSstdRUpXFnal0Q4BxyeFsVSx8Ej8UBDzkgai?=
 =?us-ascii?Q?CL5OPpPvfn3JTOlOkxUGU5fPNRH3dpoC3oPeHiLXtxVpKEYy8IZS/iYNgPVP?=
 =?us-ascii?Q?LTDmPEl5RNP4WpOufNLfXP4oBZqHO9kPvephI3VBi1CmLFkiGz78jVW8PLYT?=
 =?us-ascii?Q?xSVb7U0jk/dMI5TBKsA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:29.1733 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4530a528-f70d-4aa1-fd96-08de39c015a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A672E.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFEB07C8E34
X-BeenThere: nouveau@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Nouveau development list <nouveau.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/nouveau>
List-Post: <mailto:nouveau@lists.freedesktop.org>
List-Help: <mailto:nouveau-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/nouveau>,
 <mailto:nouveau-request@lists.freedesktop.org?subject=subscribe>
Errors-To: nouveau-bounces@lists.freedesktop.org
Sender: "Nouveau" <nouveau-bounces@lists.freedesktop.org>

From: Alexandre Courbot <acourbot@nvidia.com>

`LogBuffer` is the entity we ultimately want to dump through debugfs.
Provide a simple implementation of `BinaryWriter` for it, albeit it
might not cut the safety requirements.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index fb6f74797178..860674dac31e 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -3,6 +3,7 @@
 mod boot;
 
 use kernel::{
+    debugfs,
     device,
     dma::{
         CoherentAllocation,
@@ -117,6 +118,29 @@ pub(crate) struct Gsp {
     rmargs: CoherentAllocation<GspArgumentsCached>,
 }
 
+impl debugfs::BinaryWriter for LogBuffer {
+    fn write_to_slice(
+        &self,
+        writer: &mut kernel::uaccess::UserSliceWriter,
+        offset: &mut kernel::fs::file::Offset,
+    ) -> Result<usize> {
+        // SAFETY: This is a debug log buffer. GSP may write concurrently, so the
+        // snapshot may contain partially-written entries. This is acceptable for
+        // debugging purposes - users should be aware logs may be slightly garbled
+        // if read while GSP is actively logging.
+        let slice = unsafe { self.0.as_slice(0, self.0.count()) }?;
+
+        writer.write_slice_file(slice, offset)
+    }
+}
+
+// SAFETY: `LogBuffer` only provides shared access to the underlying `CoherentAllocation`.
+// GSP may write to the buffer concurrently regardless of CPU access, so concurrent reads
+// from multiple CPU threads do not introduce any additional races beyond what already
+// exists with the device. Reads may observe partially-written log entries, which is
+// acceptable for debug logging purposes.
+unsafe impl Sync for LogBuffer {}
+
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
     pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
-- 
2.52.0

