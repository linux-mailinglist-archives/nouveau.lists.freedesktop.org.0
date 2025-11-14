Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C907C5F949
	for <lists+nouveau@lfdr.de>; Sat, 15 Nov 2025 00:31:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9098A10EB3F;
	Fri, 14 Nov 2025 23:31:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZA7A29+U";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CY7PR03CU001.outbound.protection.outlook.com
 (mail-westcentralusazon11010007.outbound.protection.outlook.com
 [40.93.198.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BB3B610EB3D
 for <nouveau@lists.freedesktop.org>; Fri, 14 Nov 2025 23:31:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=G2RaTIl/p1vpbni7iHXDs9a/uA3lveTB5DixhUeXvx6+fEqOxiyV+L1qeiUKva/xP/IpZGiCpXj6XuXAeYd2VIBvNOAu+2l5lUkpldk6hSLYTf+b5iR7mwf5CjGMz/yo8BmjviGNtUN3/QW9uJTpwbVcR7rCjXDb9Xt+MPZ7gY81elHxxD01Rc4a3KbboijBY/NmLKywb3vdSFZIZa2+oA4K/uc2p1Kz3X4Ug+UaphUYDxdLEV6q7gtIju17jx/56hhyGG5zbou0rxi8EsDKMTFAg71ysGo+UeY3wGehIoP4vYsn9da5FkXAisoW0k+G5v3nCHSroU7ut6HMHO56hA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KJfPwFyc+6T9zV7ZGIZ+/ZBr7HAB1gm7n7oeemKe8jw=;
 b=EE+2wAdoY2pcgufL+E9adRAo0L8ijlfq2ITPc8hY1l3DwKi/DCvfXGVtvJ7W9ZeHM5qunBwEnILt8cwAEC40aSOLnDNqAYq2TauuUp6kGRAjb63UX3qC8gbPxhbVL4lWtwp8gBTwxw8Lx/FfJy8HRG/FPP7ADZOzvnChjO054HTR2N05/XuXLUl2L0waYulYZYp2zeAcsSkb4k8iA4IrYjl4BdWOi4PMh6va1yoe0fQ7xuKV6+zjP5vCxFICvmesJb9A7kMXnn/z4kSa7IfqmEe4XpB6vY9kYUsxR50OqzhkgxGh29MKhL5tFLqtPQ9ebNce+mJdDLf0fc90GojvrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KJfPwFyc+6T9zV7ZGIZ+/ZBr7HAB1gm7n7oeemKe8jw=;
 b=ZA7A29+Uk4gsIEMjfq2B5ieeCF14dBMF7tDbNuUWyZYvF1nsimqaOkGCwQitCvRaO2t2ZTzN0h/cZD/iNWl+y15Yj6y+OTGgBlzo0tlNSWUXxxxt9Gp/CsUtxXWRIz3v/ETo+YI1LfpB7vCixDToMX7jNccyvK+x/aQSJYJu01BF8B7NVhTh7XK4kisuMGt/K9KMP5HVbJoCLDFtB64QJx6ZWOgLc6vf8otF6rheqxezNb8pI9NvTVqe/Eo/T5wvsNNWyM05qgpLqolK8uD4Eb68VGcPJ7TKF6oGtVsvui2kpkjDu2IKOphJJbx4lRJYvYJaPysxQaV1OtYGqU3bDw==
Received: from CH3P221CA0006.NAMP221.PROD.OUTLOOK.COM (2603:10b6:610:1e7::32)
 by SA3PR12MB9091.namprd12.prod.outlook.com (2603:10b6:806:395::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.17; Fri, 14 Nov
 2025 23:31:13 +0000
Received: from CH1PEPF0000A346.namprd04.prod.outlook.com
 (2603:10b6:610:1e7:cafe::ea) by CH3P221CA0006.outlook.office365.com
 (2603:10b6:610:1e7::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9320.18 via Frontend Transport; Fri,
 14 Nov 2025 23:31:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000A346.mail.protection.outlook.com (10.167.244.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9320.13 via Frontend Transport; Fri, 14 Nov 2025 23:31:12 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:57 -0800
Received: from ttabi.nvidia.com (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 14 Nov
 2025 15:30:56 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 Alexandre Courbot <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>, "Joel
 Fernandes" <joelagnelf@nvidia.com>
Subject: [PATCH 04/11] gpu: nova-core: add support for Turing/GA100 fwsignature
Date: Fri, 14 Nov 2025 17:30:37 -0600
Message-ID: <20251114233045.2512853-5-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH1PEPF0000A346:EE_|SA3PR12MB9091:EE_
X-MS-Office365-Filtering-Correlation-Id: 097c345f-b23e-4047-acdd-08de23d5e619
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UpGpnSumqouZaoUkHtvmRJNtwavS3O+CJ+o7uyr6wvltp05/ddsRe9VYefdd?=
 =?us-ascii?Q?fNpdMciCR88/zqkiXDO3mGjfGcd48LfiwtFPNuRmW2vbsqSj0maa/PtD8iV2?=
 =?us-ascii?Q?2RTPBqM449DJ4ol7xDqr+6ugx8NnzQKy6LfqXcmtgGTcYO4oj+69SY5zdvpf?=
 =?us-ascii?Q?dLCWgzC7VHltA6L5giQyYRAbojVrrXa/U44rUP5Ap0pZSMw2wX4ThTzvnex7?=
 =?us-ascii?Q?jwUxXDDq4wxmEq3UX20S2aPnSaIe6J2RzhzzPVozlXobgq8xtLl39r6zuvFE?=
 =?us-ascii?Q?i2mLuaEcj/SYO5xnKO7k0T1dbeHxHmcAe3ijnWLaXHBBbcAAW2iO8o60OUFV?=
 =?us-ascii?Q?+dQnBT9jDSTsMPxd2No0fWAD/UcVQEzyehjFJbQ0vzFEUsYTsCSppyxO1f7w?=
 =?us-ascii?Q?t9xwkcpOD/DDfmVFO/TjUd3JsAOAruZV4TO0qqTCz7sZ6Mz35BTsKB3o7esQ?=
 =?us-ascii?Q?8h3enEXaYVB3SfgdrTgtz/mOiTKEKJQR6wresZM4M2bKsAbJTqaD6g0BUfQ5?=
 =?us-ascii?Q?MxECZRzpY69D9uh8LrNImpMcGBbHAtZQnlxNPPreF4jvInOIfMMOA1ijqYdh?=
 =?us-ascii?Q?itP4gT6pC61JMfNv8REVvF4wxCzrpR/hpe1OKt7RwFpMLaVBnVatOJVbv16E?=
 =?us-ascii?Q?OqFStH+wH7+Glpi5xgeP/LmRpOAjRoHKDP2OFcwXwozq+SMRMD6UHZRma4KY?=
 =?us-ascii?Q?5810EqlUIe+3cZju/bvgXl1x1OgaeCRy9uYgWU1tcxvqo+xHtm3Vhp88YjSK?=
 =?us-ascii?Q?SAhFECeXqNnawFz+Kd3E4ZkYe4NpJ30ICUjnItNPkfh+D1jKQw1HDRKLhWb4?=
 =?us-ascii?Q?59zaMCbbmp98Dl56rSgZEzlSS9YtUxDyvCsYnn1TijdwrImiQI/pmGm2784U?=
 =?us-ascii?Q?+KFp6YNpHo87GMfC8ZOR/Y+L8XscVREW23ixy57k0Ac2O6wrSEXXxLm3wPzS?=
 =?us-ascii?Q?NIB1ExaxUNQBfTjEKtJo2vbhA7wFqnvaKozypDv3KADnNqtfuzwyPxw9fjDG?=
 =?us-ascii?Q?FFaK+d6ajWL/xjlw9djnNYNYrEfzHuohPx69yectxkLiVAjIUXbRfg9tHeYv?=
 =?us-ascii?Q?+P6BWJFL6z4pgsbS470giJmU1hLsvmKTBAWAJJ8iWocqKAIAva0LFhQCErC5?=
 =?us-ascii?Q?eMzpmh7DiUqjcuTM48H5q+VMr7zGNJ0lPZf1EvsXKFaJgzATcPdeabUK3PQW?=
 =?us-ascii?Q?n0G9su4JEKKDiGmo0lndHmIH97uW9I8HAag/3c0x9Cj4vfwP0ah8iSG35eHa?=
 =?us-ascii?Q?UsBlNkRdsqx10Hh5U5uXkQ5+1RdpFu2fzxrg5DI+DjzpUc4T3A3Hmp923FSb?=
 =?us-ascii?Q?iCQ5V1NEVTvf8kE/L8kz3VLYEx6wpPjkxlOr9uBdq3Yga/jbHnLO7m2nTv9t?=
 =?us-ascii?Q?NmKY0kovfxEpMP4IdJi7vKYY1YdbPUVCHweUdtzWwklCy17S/vEAWooqR8yT?=
 =?us-ascii?Q?nCPa0dcYpTo128vWLA7ge6sDoxEDlMSCi2xsldE1tff2G/hvY+rGuIY/3Pm4?=
 =?us-ascii?Q?VcTCc1ekYJ8qqLMrFrTjvrXC2qyP/1ilRPCtiqS30MtNNk+Du8xzHn5ygRB9?=
 =?us-ascii?Q?Dn+UTHO3SnespGhCAjM=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Nov 2025 23:31:12.7110 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 097c345f-b23e-4047-acdd-08de23d5e619
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000A346.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9091
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

Turing and GA100 share the same GSP-RM firmware binary, and the
signature ELF section is labeled ".fwsignature_tu10x".

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/firmware/gsp.rs | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/nova-core/firmware/gsp.rs b/drivers/gpu/nova-core/firmware/gsp.rs
index 0549805282ab..aa5a6433c377 100644
--- a/drivers/gpu/nova-core/firmware/gsp.rs
+++ b/drivers/gpu/nova-core/firmware/gsp.rs
@@ -163,9 +163,14 @@ pub(crate) fn new<'a, 'b>(
         let fw_section = elf::elf64_section(fw.data(), ".fwimage").ok_or(EINVAL)?;
 
         let sigs_section = match chipset.arch() {
-            Architecture::Ampere => ".fwsignature_ga10x",
+            Architecture::Turing | Architecture::Ampere =>
+                if chipset > Chipset::GA100 {
+                    ".fwsignature_ga10x"
+                } else {
+                    // GA100 uses the same firmware as Turing
+                    ".fwsignature_tu10x"
+                },
             Architecture::Ada => ".fwsignature_ad10x",
-            _ => return Err(ENOTSUPP),
         };
         let signatures = elf::elf64_section(fw.data(), sigs_section)
             .ok_or(EINVAL)
-- 
2.51.2

