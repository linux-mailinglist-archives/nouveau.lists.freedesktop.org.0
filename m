Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DE9ACCB9D1A
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FBFE10E35A;
	Fri, 12 Dec 2025 20:51:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Tuv4bLpJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BL0PR03CU003.outbound.protection.outlook.com
 (mail-eastusazon11012051.outbound.protection.outlook.com [52.101.53.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70C3010E35A
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:51:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B6/Zp2M1K7Iptxr4axvGnmvXjLt4kQLuxuVtmJrdEcP/tBLYXoOdLb+Gqw6uZVAyBXMEn+wlsQwTRpvh+UadQHX8QKlvAAW+Fda6tPzF52RHZABYAxCNbVeSlafHA0nKCuQ67as5E+nkmZBEbsvWp1c7o57LXI7tFp4yq+54n916v6sCXGQHq39zi4PFAO2ECVexoAWKEbplGtbwAt2WqnKzX0xXbUXt43cWxMgb0zpOUJ+PvLam5BQ24MZ11tT5tWrAuqffxPB3/EKC1Kxcx0UPaCkZPWtGm3qh2ZQ8q2R9pXJQUvH5DjJcD2G3Mf5lEDLpEJ6aQ6+HGarLoX6ECA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ajq7QgF33CeTK2W0byS/u7LhpqHOB/OY+d75q1tqfW8=;
 b=xNmdYetJqRk0y7Kgr7VHQJCzpZ1AOH9SmpSVOotaLdxy2Ia7J6cMf8eY8HVmRr0AnWiWeyNC3HOT4jyGRD1Vog9p4g2zdiJ8+bT3YWB3RDvzAXPLLOyI2y8E/qq+vbucAJYUvY2hs3j3OlVMcv7AjZFEPwcgmou4J2+F9QAENgfMsGtQEYGyw2mCYjEoys0tqHZmEOvZpPIuvHsZnxSOQEtR8FyWgL7uQAVWddaAskqDwVPvM9VWhtNhilgmrNAgIP6BGK4by4c1auLabwgb9+pCcsPkEbgXJpa1hdzSqQupw8j8Nr3A93nlS/ZcqJ6NbbolNH7nb5OB6tPHNKldSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ajq7QgF33CeTK2W0byS/u7LhpqHOB/OY+d75q1tqfW8=;
 b=Tuv4bLpJ8Y/bTMNfAiSmq2KkHIZ8Q37lFkx8c0mRWNfnz/JqRpJWTAeqCWGAr019Ffzry6dbnofbq+9da2AZia0McvsAU7iODUSx2j3z0aO49jvzPIWPpCZX0Cxj0EEfSiM8Vh1nlUAUBHenrHmRhrU0i4Ym9znAsGHBWQLZAbyJPCCEvpAqCxlgsZfr+KfsDENyksq20nVVX0z4JQkzj+/mtl9+rdf2tc144x/RkH3dVKaS6uOpYQkMscUTeSiyKfJnYUAu8rzp9XsLMxsga3cdKxxDRriDAzO+IjDULLcyyp4ygNw+RUkLS+iYIBsxmi+fOM08bMRI11rSdOOPTQ==
Received: from BYAPR08CA0014.namprd08.prod.outlook.com (2603:10b6:a03:100::27)
 by SJ1PR12MB6363.namprd12.prod.outlook.com (2603:10b6:a03:453::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.9; Fri, 12 Dec
 2025 20:50:33 +0000
Received: from MWH0EPF000A6731.namprd04.prod.outlook.com
 (2603:10b6:a03:100:cafe::2e) by BYAPR08CA0014.outlook.office365.com
 (2603:10b6:a03:100::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 20:50:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MWH0EPF000A6731.mail.protection.outlook.com (10.167.249.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:10 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:08 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 7/7] gpu: nova-core: create GSP-RM logging buffers debugfs
 entries
Date: Fri, 12 Dec 2025 14:49:52 -0600
Message-ID: <20251212204952.3690244-8-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6731:EE_|SJ1PR12MB6363:EE_
X-MS-Office365-Filtering-Correlation-Id: d4ea8d6b-f73e-4524-8af7-08de39c0180e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7e7BymhDHe+bMnKwbjhWJR/vUyhS3y/N5sFgGq+wV2hr4MwCHMle25L/LGGp?=
 =?us-ascii?Q?BB0OTgGIR66B6r0dnfo6T6eEY8tkgT6sYJ/JE9fQaLt55LcWX+dVU1qzfXMu?=
 =?us-ascii?Q?aGTt4tZry/4931EIQt7ps+Fq/33Z29V9LP6Fu1wHSlE0bzIG8xMugKGjYYkP?=
 =?us-ascii?Q?FI6APZF5Jduskl3sgSqzNoESBt4T7Ci9bwuFfZQhhN0YkxXR9kuudEF5jxbC?=
 =?us-ascii?Q?Ni61UwS0ZnhvwJc2hy4ArJ1zIXP65UMGI7Pje7V09KKeU7EP7zYtwOPz+CMo?=
 =?us-ascii?Q?C11Dw1zsiUzxP/DmPTD+Tt/7yW4JVaLbpNLuevlupXqYadOZgE9FEuRl8Nai?=
 =?us-ascii?Q?m9MeM0JWUKVloQStKpBGk+U0K7QECmsBLoIy5e81wkvb2gYuxlOpWN2NYEpR?=
 =?us-ascii?Q?/OUF5NGC6/Sz388yTFYzWq96xLlHT0e7jHCc5vQ8yl++vgwu9p8OkcqzVOPs?=
 =?us-ascii?Q?0Vx/6VdI8QOS+h3BG0LsnLZ4mJuVtgN7U/ClWNWM/teJZZv2vK7V2v38A/rI?=
 =?us-ascii?Q?dz3/yNlhtmLp6UR37o8q5HVsFViKQcsCkFzTg2Bu5JQm5z66gnj6hJBMZyMT?=
 =?us-ascii?Q?SDRLT2xS6B1+/CRrypnRTdHps/bPooG+q+/6GFscNnwshR195mdTAK7YQ4TR?=
 =?us-ascii?Q?Fbj5dZCfHi87dxC+tJuiuX+s7Q5LPdLbDCYI+zGBHVHofxGMtsoW1uf1xWD8?=
 =?us-ascii?Q?vPnUr+9WRLAf8H3wYPiZTBXtF0KHxkvOxaxXjfJwsOiMUBeb5awqz75sFBNJ?=
 =?us-ascii?Q?lHvTlvsDrZCHLFJeM/4Li4Uqrylau0LGtRAR7eLwgC3TErbP5j5cZu1PTRD2?=
 =?us-ascii?Q?U7yCFfHqGwHOCGXvus/nf2EGqY/AsV5eOhf2JTtRj8QsnQOSmlyTEA21Ldcp?=
 =?us-ascii?Q?XnvAqjnmPnKrNCyU7TAsGA26THcuo7sbj48v/V+zdzTdogX4pNugE9U/leTs?=
 =?us-ascii?Q?urfY2cJr7SwMu0kcOq9dWlpDhD//ivQUdnx6avHhUAHTWXp4RKz879Hr6a/8?=
 =?us-ascii?Q?c03aNkLndFb4ywd8vLNrm3zquZTWwR6yxmwwey6L59sxJYaHOHcQr34xAv55?=
 =?us-ascii?Q?S9pBVtIYXiJyXHeOg1xE76fVtpX+H/8dhYgKWHACOl3bsJFeJIj8RbtFmtHe?=
 =?us-ascii?Q?WmgBNFvC1fdskDF5+gG7xgXgqjamNJ4IZDSacrAZATo7h23MEMzJ3gMmsLpn?=
 =?us-ascii?Q?zqf2RGqqgscMUgB837AcMt+iyCpkJOnzToHK/Zl35o+DGW37uSI3RzvDR9xb?=
 =?us-ascii?Q?8koqziwWFZ6MMqLFGd2Jb4G8vqBpLfuzkQpfSdAdVw5M8Obtf7aO5AS55I41?=
 =?us-ascii?Q?cMhHeYAdsQUIcHd+RXvu52rOj9Hsz367FT3PaDVtt9aa4nF396BtzRLaY4bh?=
 =?us-ascii?Q?ZI4HCkCUfqFAKno6OqhuLIo2A5H7mArASOjU3Z6qIWC9khMgQ4KToLrTTyRU?=
 =?us-ascii?Q?CH5rOmb+19msaRJh7gwxo3Axyu77ldDtjRcGFI3P3h2ftN/qhprN1lmpZme2?=
 =?us-ascii?Q?KnD0lb2z47jBYZeiA9mYviD9lmsaaKsvgzVoLggEkgM1RvpDC+nYvGT7VjFQ?=
 =?us-ascii?Q?ZB8FXUTrDkRiNAzK7PI=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:33.2348 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4ea8d6b-f73e-4524-8af7-08de39c0180e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6731.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6363
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

Create read-only debugfs entries for LOGINIT, LOGRM, and LOGINTR, which
are the three primary printf logging buffers from GSP-RM.  LOGPMU will
be added at a later date, as it requires it support for its RPC message
first.

This patch uses the `pin_init_scope` feature to create the entries.
`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Co-developed-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 25 +++++++++++++------------
 1 file changed, 13 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index ba4f789d8ac1..2267ec3391dd 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -108,11 +108,13 @@ pub(crate) struct Gsp {
     pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
     /// Init log buffer.
     #[pin]
-    pub loginit: debugfs::File<LogBuffer>,
+    loginit: debugfs::File<LogBuffer>,
     /// Interrupts log buffer.
-    logintr: LogBuffer,
+    #[pin]
+    logintr: debugfs::File<LogBuffer>,
     /// RM log buffer.
-    logrm: LogBuffer,
+    #[pin]
+    logrm: debugfs::File<LogBuffer>,
     /// Command queue.
     pub(crate) cmdq: Cmdq,
     /// RM arguments.
@@ -177,18 +179,17 @@ pub(crate) fn new<'a>(
         dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
 
         #[allow(static_mut_refs)]
-        let debugfs_dir =
-            // SAFETY: `DEBUGFS_ROOT` is never modified after initialization, so it is safe to
-            // create a shared reference to it.
-            unsafe { crate::DEBUGFS_ROOT.as_ref() }
-            .map(|root| root.subdir(pdev.name()))
-            .ok_or(ENOENT)?;
+        // SAFETY: `DEBUGFS_ROOT` is never modified after initialization, so it is safe to
+        // create a shared reference to it.
+        let novacore_dir = unsafe { crate::DEBUGFS_ROOT.as_ref() }.ok_or(ENOENT)?;
+
+        let root = novacore_dir.subdir(pdev.name());
 
         Ok(try_pin_init!(Self {
             libos,
-            loginit <- debugfs_dir.read_binary_file(kernel::c_str!("loginit"), loginit),
-            logintr,
-            logrm,
+            loginit <- root.read_binary_file(kernel::c_str!("loginit"), loginit),
+            logintr <- root.read_binary_file(kernel::c_str!("logintr"), logintr),
+            logrm <- root.read_binary_file(kernel::c_str!("logrm"), logrm),
             rmargs,
             cmdq,
         }))
-- 
2.52.0

