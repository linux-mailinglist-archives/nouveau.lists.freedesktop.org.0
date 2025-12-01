Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF020C999CF
	for <lists+nouveau@lfdr.de>; Tue, 02 Dec 2025 00:41:28 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B07B10E4E1;
	Mon,  1 Dec 2025 23:41:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BMZl7pT4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010071.outbound.protection.outlook.com
 [52.101.193.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E71E110E4DE
 for <nouveau@lists.freedesktop.org>; Mon,  1 Dec 2025 23:41:23 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=aQpX1Wt/blUukgJN5AbxuutfS/NuMdmVKIbmThRNzQZSiAXzJ0zoDzyJYzskVyHjS9iRDnospWgkJvzpZCrhjbU12fvbiDgd1jgMFmD+YBhxUhZ5diBHSqvZq4cgBi+69BTT39m7Lepjs5IUdPUsVlpNN9/cjsZtlp8aPs8jkGdYQ9Nonq6Oeq6G60qwCWhDjdu5KE8xI/X1niXqSxQm/uqrd0ZFik+FzHY4Fuqw12cSyj/V0t9UPvkxA+u5im7gc8ZUBRQfFmIoFPGBokFM/IQAFv8BKdZUI25Mbz109wK5DRUFcu9eAiU6rDs+h4HjjAzEFzmwIyTw8Yk80R/m/Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6wkWJF4uR08ee2OfWvONCQJSCPD+LWtYX1e1xPFtu+s=;
 b=MyB5b5UtpAd2lmvE6EaKxrUegmYbeNp/8gOoqlOKLNsXuvHHMGNeuevdQ6s1UupWwLJ5khnZBuguMzS2qm7VYDtgJPTunFuzvVZVUruws1l/K7fhfOb8kywSZ1tmJo5S331BRhn10R9+LrLIqXdX1YStDVBghwVMEuOTI4jm2SHjbgHy5WQQlY5Y2RouvP+PDECKYtv+nSJCf2bfP9MdVvLa1+MGxwgQ9LAwj006Oo/yIYI0aMZWl4ElNXy2rwfgmJ3CupGgIWVnZwRFoARMQJVn5AVNb639bg54rOCh9wht9XNGvNwAtutHe1VVFY8hOpci0ejfhZ3KYkzdChY6gA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6wkWJF4uR08ee2OfWvONCQJSCPD+LWtYX1e1xPFtu+s=;
 b=BMZl7pT4wPpuDdze7cE50XpQxrwDBDU0rnjCca0h/LhqVFfZBhD39iySiNqknsOe8jtYiO8muwlrcq5o7UCRHG9WsIVY0KuUHNHQIP2AFbdEh5uCLeHzzliK1l+AwEc7Aez1dWPp62oELysDMZmyLuMytLIvnC/zORyQAfdvP0ZbuMc2z2/9ZzW2gJmX27x+vP0Y1rBnOdOM+PF9X3nbNt5bzjWlNJLvPzoWv/M0LUBGRDsMtnsZgZKZJwk5dWx6TB3uX6fifFK33lnv6aw99MAks0gLN1uFfv7MqwZ8x3OeN0p881uaORX5qvJ9pf2gMqg+UlbmGaFNO6M+HchnQA==
Received: from SN7PR04CA0193.namprd04.prod.outlook.com (2603:10b6:806:126::18)
 by PH8PR12MB7158.namprd12.prod.outlook.com (2603:10b6:510:22a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.15; Mon, 1 Dec
 2025 23:41:19 +0000
Received: from SN1PEPF0002636B.namprd02.prod.outlook.com
 (2603:10b6:806:126:cafe::d0) by SN7PR04CA0193.outlook.office365.com
 (2603:10b6:806:126::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9366.17 via Frontend Transport; Mon,
 1 Dec 2025 23:41:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF0002636B.mail.protection.outlook.com (10.167.241.136) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9388.8 via Frontend Transport; Mon, 1 Dec 2025 23:41:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:03 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 1 Dec
 2025 15:41:02 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, Lyude Paul <lyude@redhat.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v2 03/13] gpu: nova-core: support header parsing on
 Turing/GA100
Date: Mon, 1 Dec 2025 17:39:12 -0600
Message-ID: <20251201233922.27218-4-ttabi@nvidia.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <20251201233922.27218-1-ttabi@nvidia.com>
References: <20251201233922.27218-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF0002636B:EE_|PH8PR12MB7158:EE_
X-MS-Office365-Filtering-Correlation-Id: 96e353fd-c2c4-471d-adfa-08de31332085
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ukLqIdEYayx/96k9yEU4ymxUXzcGlXRLruHP9UFSyO/EBFf0xBm5Mn7967qO?=
 =?us-ascii?Q?QtAw+IUmYcp9Jx5eCJQQIOvKepBO12ROtK5PxPeSHDL4iqzfxx397LiRQonb?=
 =?us-ascii?Q?gny54YXPMbbEG4EHJT+swGcu05/mZvUY6tkRnQtgXIeVcLYAqpbUJNGrEufe?=
 =?us-ascii?Q?3xjUr/yfdkN0aAfcQT5EQLEP/RcUeycNyuUBp70fYRbsZnU0BvWPEQ/VB7OF?=
 =?us-ascii?Q?T1Mm6eYGfC8Hh2S9A2aZj8MTJICv3vFxXBZIMB8XCZRQmwmBNTiZpcDZXKfW?=
 =?us-ascii?Q?IukFtRIgxSrRUvAXkw+LlK8cPiML4Mu1MwOpvhj9qSfdmHQs0dk7tr85d8hh?=
 =?us-ascii?Q?2R4wak7O6izOmwzLBcsNz2rApVuRNLE2NkZS8I3Bi8fh1poEN1gTFqPDibtA?=
 =?us-ascii?Q?s9paU4CjFr3G4GG2lpIQQw94+kJfTjckMzeYQZ9jaR+7VQS+l0hVNZ683qBd?=
 =?us-ascii?Q?Rdcs/lw3AI2twQw+nowcRJFJs+3Yb+5JNtfgRjHQbsVIIZiFkChQLVqZuK7m?=
 =?us-ascii?Q?k55l8CtvI/IUIptQagdvhIt82UyUgvsyRKlsg9DcFv5INMYbzaoxGylCJYpV?=
 =?us-ascii?Q?NBICv1A1BHsQqwmpfpUq3KsNoC/P12DCUdKM85bDQ4/vyKx8m44U6yylt3CZ?=
 =?us-ascii?Q?/W6Xp3B93p3m9SDtvYC5Ugs8iS3eu+FySV6tKS1VFxYwqhPcF63SG/K6V6Fv?=
 =?us-ascii?Q?Ecj8pTqvr4m1TY7Ww7JfpnAQoH8tknxdXFg0nZk82U75e9hZaARP0TvqnDH9?=
 =?us-ascii?Q?klxu5YceJIomlWeUsA9JKOn5E6NTTj6cPPOX7g/EyBulTISKtgtG8ZkdB/GH?=
 =?us-ascii?Q?iE+l7gZTBEgymg/kR9I+zAppWSgpO6LG6G8MwEmOk8K/DjiopSUkV0B1gaF2?=
 =?us-ascii?Q?KQLrGL2xz0fci0Lvi1x0i5XCxzygDqTTZIb6SpctllrUqdJ+4cUew7JOHDbg?=
 =?us-ascii?Q?C4YSDYgJztzu6zVnHExj43gm6LBTFhPQqTX5YBl+nPOQtXQYxeM+NGwX9kh8?=
 =?us-ascii?Q?M+DeeXcgcywhT8iIDJRFVifbnrMrML67PvX6irw0/woSmASWCsJ1S/A7F1Jd?=
 =?us-ascii?Q?L+k/kiMzg5Dm0nMCS0YfHGAQ4q0B7t26cSBtAr+2yKycfOxwPXV+aZTZoB5q?=
 =?us-ascii?Q?VTqEaT5FYs5JSU+FSrs6B/IJJWT+2Yu1G2B1xwbdvKVU0kb2o9Db9OHC5miA?=
 =?us-ascii?Q?mF9aJXaBo5k2RSheN8lByzd9QZJ+1ZEb3EcR5g9wSAkkZuRPV9r1FkVNNAFh?=
 =?us-ascii?Q?cpnAWIkktjYBt+mEB0Yb74b9qy2wKZWjwoeFnLvu7UGPz5qA1T3KNI2Wa7xW?=
 =?us-ascii?Q?q9+jig0xg26IWFZMFMsapeRI/tend7z2FTAs4S2XZzIqI9qTDeTEnYPCd13+?=
 =?us-ascii?Q?HugibuOmB4GMF+SHLUdg2RBwWZ/jYQjYDLw7Py6tz3T6V1hhqgpgpyQt/Owu?=
 =?us-ascii?Q?17f264RlilQUXK1HzqaxOqGB8FNsn1KuIL/7IeYvSg0xpAqOUVpHdeLz2B02?=
 =?us-ascii?Q?fqmOEnBjyfaDnvEuBWxiu3Te+HtBx/ti6GTcbAqwWt1MBdpI1qRboeg9a/fD?=
 =?us-ascii?Q?4ylNe8zSflAn4L/z1Ss=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Dec 2025 23:41:19.0443 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 96e353fd-c2c4-471d-adfa-08de31332085
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF0002636B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7158
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

