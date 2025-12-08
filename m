Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CB3BCAE676
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EAF10E43B;
	Mon,  8 Dec 2025 23:18:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="D39ffGRG";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH4PR04CU002.outbound.protection.outlook.com
 (mail-northcentralusazon11013044.outbound.protection.outlook.com
 [40.107.201.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DE6310E3F0
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yzAf/N/TsW8vOfJ5wGFOOANusP2o5AvWjKXILezPfPc1mLQkVeMfHJbclRhvZQCPIVX/RZm+43WAhSZcMAJAaj9OGex/pqT14VUYuT0/2ok7BflPwonuCI1FTg6849cmiVXA2k8AQ/TKJAp6FgYNXX+XZE045bfqqZDXLyfPwtxLgBc54PPENwxYw+W971wErs4HwvY5TtQy/NoQlKNcM6lRXiIB2tgjYpOquj2hAkTykR3UWTNPfQqovbFMlnHF8eyQXwwYaLxnDLcKhLV8jDQGLSQLy0jTU/bSkrfXVME4k40qldD/FSGlPZ0h6dpO+cLELeJGEN+O/408k7CdHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wkWJF4uR08ee2OfWvONCQJSCPD+LWtYX1e1xPFtu+s=;
 b=MYjITEiiOKYM890ykWO9VLmLJz5EZMsRfI+9UchFWlFt7GC7ZIi2/TvC+VZpZC4maE2nCET/q+dSa11CQLu4sPGHOLoJUh04mf3nbW5pCcyWzF4b52qBhSgQecTanD3cCqwEVAzVFKmjHaCgcQ8iyYTJF5K3Jpy8K7ZnZHDqbMqz2g6Z5z0gKMslMVgY30jokFa9R+UL7xMaApWPd/zWmKJRhNjL20hqjuzqVzzPMa6NBZeBVdn9JblqqZoerNCi/qE4karvZ4R4z8etThw4lLLK/JWbH47xAygmBoa63EGGKwaiL9Tl6BVBsY7lT+5/6V25wGoJ8UVLnUug4u1+Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wkWJF4uR08ee2OfWvONCQJSCPD+LWtYX1e1xPFtu+s=;
 b=D39ffGRGpwWHzBKieZO+yCXzHnuNwGpbM1XOFjJVHbTlHUCdfl8qvOtGEYLS/FbEXOd0ypwO1qR/qmEPGvtdhDhinaISjIDh6zhP4dCCdanMUosIsmCdhNucuFwSf0oBaP077NiLySma8D1SMnF/7mHTieiC5URty4P+pz4RHJzeHYI3/WFWJ/DcE0ozNeSyiyp3QZX854rFHX5uVQBs0VAv3t5Rv+JSW9LGKwaj6Xoli9pnXD5B6BxEqg6j3BclfJc0AnZDG2UX0FpIpPDB7OmjChPcRQ5ylYYAmK9pRcklI9BtzABXMLHog19zb2bCD5Nq2cpPB4Ig6s099sDr+w==
Received: from CY5PR15CA0211.namprd15.prod.outlook.com (2603:10b6:930:88::13)
 by DM6PR12MB4108.namprd12.prod.outlook.com (2603:10b6:5:220::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:34 +0000
Received: from CY4PEPF0000EDD4.namprd03.prod.outlook.com
 (2603:10b6:930:88:cafe::c0) by CY5PR15CA0211.outlook.office365.com
 (2603:10b6:930:88::13) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000EDD4.mail.protection.outlook.com (10.167.241.200) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 8 Dec 2025 23:18:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:13 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:12 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 03/12] gpu: nova-core: support header parsing on
 Turing/GA100
Date: Mon, 8 Dec 2025 17:17:52 -0600
Message-ID: <20251208231801.1786803-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251208231801.1786803-1-ttabi@nvidia.com>
References: <20251208231801.1786803-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000EDD4:EE_|DM6PR12MB4108:EE_
X-MS-Office365-Filtering-Correlation-Id: 678fdd6a-4fb8-46ff-de87-08de36b01b55
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PpQoAgzLn6NB00vqgFE1THXuC5stnfMrAZZM4oUV//PlqnfsONbguhAmxUsS?=
 =?us-ascii?Q?6uKUwQBNBMxJhhjgKNShHdivqwUlTKZ5/eJjJ0VWIvgGfKlLitLB71sjioY6?=
 =?us-ascii?Q?HCZCL7xNQ4OrfOA4w2sZoGBrl2Ph4k99iY8PdwoJJNbQDg5+3IZz+cEWS/CI?=
 =?us-ascii?Q?x5WdSnFMQF11dfPrW5UDPkUEUbN3B7qoRsDIsSV/p75Z2yZQqyJr8/82WOJt?=
 =?us-ascii?Q?ZnpBy7l68iiAhktrO1IHYJcSmDKEOmxvUrArENyHdrVNmJRjAPLRUIZfSZL5?=
 =?us-ascii?Q?qytXwtG+3+hsG/iPrMXHEP/yf248wy8YBghaJCTZqA3nsd+b5H5ttDO/Bgsk?=
 =?us-ascii?Q?scyMp3zEe3dGnoQ7LYfUX01AS0Jw7HYypAOGx47OzekWOlDJKjwJ3i8rbar3?=
 =?us-ascii?Q?23ZpfFlPHt5L/ht/x79bd32lABKSfEsUqTZrHhbzO4KDtfT7W49qoWRV2m7P?=
 =?us-ascii?Q?S9Y0GRs2TDnyv5SytjwwzB2dbJ0DnHBdDmZYjDs8FUbLQ2O3GYoqKYzOnXml?=
 =?us-ascii?Q?rzbnas4vYXaNBOA6sZ2t7A8ITvMXOUna+M9cX9urwB45iD4VMLrE9kEDizGf?=
 =?us-ascii?Q?VCcVwEYC8YLaOINX3yf8PihqCeKBLumW35MlZcyyRw3eBwyW3Figu2XlLg1J?=
 =?us-ascii?Q?vHExtuVSsV+BqqdztOCrxEWaMsI1OSOon9mD8/UY5OI4PaYbGqaxexWCfkz8?=
 =?us-ascii?Q?qBEEXVVKahNtLpjNb9cS9sx27M/nsjjsbPm4yauivhv5rintcliH+sev6a/6?=
 =?us-ascii?Q?Fi56huW3HLSKJBFpoMlL/DRJ30lWzAlR7VzTpJvSs3t3kp6MPqLXMI+LrwGO?=
 =?us-ascii?Q?p9+CTRMxQO6d2jMKmmE+QiRH1Lb2sVW/pDeXg6A2xoB02+6U8OI0enOFJxkV?=
 =?us-ascii?Q?jJxoMwcW7AewAIoH9z6g2JPcAU0kzC7urEzhkYdUKB3sAyhL1OuiR3njM+Dz?=
 =?us-ascii?Q?JP7/eKtxmvn56HKS6U6Ps8/xrOIbRPncYDAgjD0fgBfzthlet7qiPjcL7Auf?=
 =?us-ascii?Q?3xCtRkH261sF0zkW/t4gY7AshcrsuNWurLMq407GNWz9NUIw4Tg3w7lG5oQC?=
 =?us-ascii?Q?bBH7Eg7vSjW3YfRcuEX7duqZCQ/bMvIVEcnvnTQKJNsLlunEybnD92CEXHrf?=
 =?us-ascii?Q?6dGqqZVLUqB/HK7Ebj9PSb6IVNopeaoNO5jMUcWRtTktWv/NZqLUW/BXC9Vr?=
 =?us-ascii?Q?jqlyuB177kszLW7UDhYd/aam7UsXWxR/d194imGC2Uyv9wsOlPTI3V1uD70Y?=
 =?us-ascii?Q?lOCXep3+iOyvEhHAggXgKj4eT7nYVUUnzz5z6oDcsojNL5FRP9fFrocE3Hbh?=
 =?us-ascii?Q?w0AzbZnPxhRsMH1jr7+YG/IbBipwZTa4ODZ3RsZpDg/e/CCQYYRtISArIHxN?=
 =?us-ascii?Q?T1QWh8mOE8WJiAAUzkLbpI2FCZkZD0TJEaBoZsUE6QAJCmwG/Q8n5iHpvfwO?=
 =?us-ascii?Q?TjtiVbOOZbLFqpFs6CWoaWgkXCpqP+ov92qc+ic0tlgiiCRubWztLOQIfp0+?=
 =?us-ascii?Q?hkBFRGd0begPBKJQFD7V+aiGWxGInS8tTKaxncsqcEt4WBjURUTrEK/hZ0H8?=
 =?us-ascii?Q?n+SrNlFHq3XR7zPitIU=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:33.2586 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 678fdd6a-4fb8-46ff-de87-08de36b01b55
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000EDD4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4108
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
 drivers/gpu/nova-core/firmware/booter.rs | 33 +++++++++++++++++++-----
 1 file changed, 26 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/booter.rs b/drivers/gpu/nova-core/firmware/booter.rs
index 1b98bb47424c..7ceea7cc9a87 100644
--- a/drivers/gpu/nova-core/firmware/booter.rs
+++ b/drivers/gpu/nova-core/firmware/booter.rs
@@ -356,14 +356,27 @@ pub(crate) fn new(
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
+            imem_sec_load_target:
+                FalconLoadTarget {
+                    src_start: app0.offset,
+                    dst_start: if chipset > Chipset::GA100 { 0 } else { app0.offset },
+                    len: app0.len,
+                },
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
@@ -393,7 +406,13 @@ fn brom_params(&self) -> FalconBromParams {
     }
 
     fn boot_addr(&self) -> u32 {
-        self.imem_sec_load_target.src_start
+        if let Some(ns_target) = &self.imem_ns_load_target {
+            // Turing and GA100 - use non-secure load target
+            ns_target.dst_start
+        } else {
+            // GA102 and later - use secure load target
+            self.imem_sec_load_target.src_start
+        }
     }
 }
 
-- 
2.52.0

