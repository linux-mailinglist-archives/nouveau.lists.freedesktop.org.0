Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 17FCDC5F94C
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9176310EB43;
	Fri, 14 Nov 2025 23:31:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Phb57CEo";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010055.outbound.protection.outlook.com
 [52.101.193.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C506010EB40
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=N94jxcJj3ta4S6ZRewWc8ToicHqHQC1pt33wDPdaIDZpbFSiy2aISh6jJhMklxjWph6XQfnG4hTLbj7ixXusl26d9SxipRRSDCyP3AOq8gfVL+YkuvWgvLOD+AVk++HwcB/BgJ0BDZW8h8Ltpkx6AAMznL7HdnE7IN7cHsGjmp32+8hS2ZpDVxCS0Cxlwz3EbVWJfHdP/Cpo1ElhoySf8o3M/FeuANfzHwVT8JO9T5SR/n1Ndnsupwigzqb5/ikN/4iplMcgw6ezwzC3+cbAAXXQQhaV+fONslr0NZnw7986WWq+5Z4YaPIhC7HtxaFKE4hA4RgUgWcwKwJcwOh9aQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U9besM9wXUOiJDDmj1Ru/nSUGsJSBEeZMehHZAixL1w=;
 b=HEovvsU8LQGn+ioC8VdFhO8IeY21ZwmhErJqhIuvTWYqB2xp4t4ecUGSRV0JYDAcmHq9gVPZBFicgzqfoIWGAvI70aM8Zs9lDd8CWMQn1/tWyx2ZpbxUZuoh6hngS2cwEdsz568H9a7kKlBHA9DUIYpMsB7gHe1p5XqXl++rRKzBpw0G2fHU+zr5FzSq+ZsXpg8Src8Cu73QwaGZkI+1fpXAJoVopbuU/dbmdeTEVtsP5qZt+TIAwQli5zv7fdWSlkH5/SXneLswvI7rsPQ0hNkE7dJ4JWii3DZ39ZVhQKgdZBucCEEwfcLx6oa0mn6nv9Q5f6ka5iAAE+mAEUYyxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U9besM9wXUOiJDDmj1Ru/nSUGsJSBEeZMehHZAixL1w=;
 b=Phb57CEoo3lfWjlwNcYf6CFL7d/PxWASl4u/1GpCyUHb50JipCPc+pqp6Tk0TS6GIp5sSg0WRGEHqRBWlj9Llufm3iwPe4MiR0OGOEg5eW5UBunWsjl5Bo4VCso6JAjmFE0TvUhUusC+oJF9Mx78PZ3I2ugBOdeoZE4yGex2dac4NyxpBIsFygBT6KhstvVapKOgjpduwxRqnBr/51sKxzOSjn0Bd9NTRZcBNj8z9BfEYs3FnrwHqsE+75MxmF2d+Dsg6ZT0uB1RC6/XI8+MvZstzrFLfuL1b9e/6ptIKZBYMT9VSLJ5m4cATcX2uzhEo+ESpArAsIsAaAr3n2XPKQ==
Received: from DM6PR04CA0027.namprd04.prod.outlook.com (2603:10b6:5:334::32)
 by MN0PR12MB5740.namprd12.prod.outlook.com (2603:10b6:208:373::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.18; Fri, 14 Nov
 2025 23:31:14 +0000
Received: from DS3PEPF000099D8.namprd04.prod.outlook.com
 (2603:10b6:5:334:cafe::fa) by DM6PR04CA0027.outlook.office365.com
 (2603:10b6:5:334::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:30:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS3PEPF000099D8.mail.protection.outlook.com (10.167.17.9) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:14 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:56 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:55 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 03/11] gpu: nova-core: support header parsing on Turing/GA100
Date: Fri, 14 Nov 2025 17:30:36 -0600
Message-ID: <20251114233045.2512853-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251114233045.2512853-1-ttabi@nvidia.com>
References: <20251114233045.2512853-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D8:EE_|MN0PR12MB5740:EE_
X-MS-Office365-Filtering-Correlation-Id: a590382b-81a6-4114-fb93-08de23d5e6e7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ee44s8gMKnk5lOL946xoyb6K+nD0yA8ORewlqnCxlyMWIL00pbqRX0SduZnB?=
 =?us-ascii?Q?QI6VcgGOd55WMqJf5uQpiiUUVjmPjsU529JTTB9UXp3HDjG63I1CyVJS7yur?=
 =?us-ascii?Q?pX/Ce91HGkPVogmVT+/NV2eJWcNi1FBbN9zIl3T8J1VlOgB897/QJLMofuVt?=
 =?us-ascii?Q?z/x+OoCxb5bRo5wWWKVgrLcCmLzbDCfYDotxiJfAOeeH4QRqlyncfPpP+hC6?=
 =?us-ascii?Q?KYvIAZg8mBr1mmquIEUi9sT6CH+D/rRp12VER4D7x/ydFsUC6lhBjnpKy57B?=
 =?us-ascii?Q?mdJ5MYE78XpTkdmgUdRy82FCfH7nUxfQayJKaYIDZDIOn3VRKYi/M+BKJoON?=
 =?us-ascii?Q?frw5TbNiR8YvwT1ihIdpSXvAPEcyfWwoZBPPr+8NH9P7A6IHMrCzF6Sr5gZh?=
 =?us-ascii?Q?JXbHkP9C1qrK3ZbJXvz+WCg1uWH447S0tsvdxJL8Ca1kGJX7nzoIoq1rWElr?=
 =?us-ascii?Q?xM5cb0SaUZ/THV3HJHReIGtQBs0Mf2hmDSg2iNsTGacPDRoE2wAx8jw08Kd5?=
 =?us-ascii?Q?V4UKqao7Ey+BnhFxr5Ph4vUHKHVojcp+Xetok+BrAHPaINEaxiFAFvlBlpMd?=
 =?us-ascii?Q?N6RwgPVhPdfvInMneDg/n5TaboPEluH1NfXiEC7EHfEVCdodmmvS6Dtu1iNF?=
 =?us-ascii?Q?rZzVOoCek6G2GWUGTk4PwHdPgambh7to9aIyCX4VpahcF7lVwBd/kkTsGF8i?=
 =?us-ascii?Q?U+wMFQ8b5a1LvSGIUb0rYSY9HnaUCeyDg//Y9oww1uj0zEPXTFepuT1ir9nT?=
 =?us-ascii?Q?MEsKuieQRsYUsjOWZodlwXde9hXe+XfTD9aG9cp/ymq3PNnF8vdQVn5n/3xf?=
 =?us-ascii?Q?2c36DJYo6198+AmMWZoOt+qclnmkQWIXxZPN8LAhzH1v/2UFm/4VeJC9barZ?=
 =?us-ascii?Q?yiZJFX44XPiHCDUPV3Ih613vWHELTCm/j9vcmuk0SQTyKTkz/0RGlYAaw4Ui?=
 =?us-ascii?Q?sWMXhDB/S2Fbv1RqtASaIPkJffgntPRM2uDEx8uCvtztpiQtRX0/JTMP7+cd?=
 =?us-ascii?Q?pW67RHr4NMNLI/be0zmALyE4NZ45eLNG3PsCu2u58+cr1QZfFCzyPsntlaPS?=
 =?us-ascii?Q?tFbUrIQD3+CsH3bIb5Ogw66KUVe5RIPQvo4BFMfVqAnPbhPuur6X23VOizsB?=
 =?us-ascii?Q?dZJcfg5QfVeI1Jivrj1D1vnb0vW+QeowaRwEn1U3AJGYZjpsFxu9eSArtkNX?=
 =?us-ascii?Q?jZgdk2MyApGzCpAwxlcDQAN+cxXPEcvXlSS+iF8moK97XOQBf1UCEmSgbc9Y?=
 =?us-ascii?Q?UmtuZxVQOb99/ZKC0p9msI6ciR/LFRWnesGqt00MsxdPazbqcw5dzaUoQN08?=
 =?us-ascii?Q?18ChoO0PjRzV9Mt66/pW3LjrnyJr7tEr6PqP6ayHLpo45/PJMLNOfcZD6SYq?=
 =?us-ascii?Q?xP5yY89J9P842yJLVqr9AuQCOVviY7WD6AsBuRqLcXo3MnfIVQ4z1Fzz+oWd?=
 =?us-ascii?Q?x4rtO+Qmnergzj47PNDY7VaunYzH0DbX8wa6Cj9aSwQhmFdAfvXeDMrDgxvw?=
 =?us-ascii?Q?w+uGNUpYe+pbA9KylcM65Sby2S1J8zE3y64nSdLdjG3nybvFsG/A+FKAhwXe?=
 =?us-ascii?Q?oNJFD7wit2bYsuxRzO0=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:14.0698 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a590382b-81a6-4114-fb93-08de23d5e6e7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D8.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5740
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

The Turing/GA100 version of Booter is slightly different from the
GA102+ version.  The headers are the same, but different fields of
the headers are used to identify the IMEM section.  In addition,
there is an NMEM section on Turing/GA100.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/booter.rs | 40 +++++++++++++++++++-----
 1 file changed, 33 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 1b98bb47424c..6ac9593504db 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -356,14 +356,34 @@ pub(crate) fn new(
             }
         };
 
+        // There are two versions of Booter, one for Turing/GA100, and another for
+        // GA102+.  The extraction of the IMEM sections differs between the two
+        // versions.  Unfortunately, the file names are the same, and the headers
+        // don't indicate the versions.  The only way to differentiate is by the Chipset.
+
         Ok(Self {
-            imem_sec_load_target: FalconLoadTarget {
-                src_start: app0.offset,
-                dst_start: 0,
-                len: app0.len,
+            imem_sec_load_target: if chipset > Chipset::GA100 {
+                FalconLoadTarget {
+                    src_start: app0.offset,
+                    dst_start: 0,
+                    len: app0.len,
+                }
+            } else {
+                FalconLoadTarget {
+                    src_start: load_hdr.os_code_size,
+                    dst_start: app0.offset,
+                    len: app0.len,
+                }
+            },
+            imem_ns_load_target: if chipset > Chipset::GA100 {
+                None
+            } else {
+                Some(FalconLoadTarget {
+                    src_start: 0,
+                    dst_start: load_hdr.os_code_offset,
+                    len: load_hdr.os_code_size,
+                })
             },
-            // Exists only in the booter image for Turing and GA100
-            imem_ns_load_target: None,
             dmem_load_target: FalconLoadTarget {
                 src_start: load_hdr.os_data_offset,
                 dst_start: 0,
@@ -393,7 +413,13 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_sec_load_target.src_start
+        if let Some(ns_target) = &self.imem_ns_load_target {
+            // Turing and GA100 - use non-secure load target
+            ns_target.dst_start
+        } else {
+            // GA102+ (Ampere) - use secure load target
+            self.imem_sec_load_target.src_start
+        }
     }
 }
 
-- 
2.51.2

