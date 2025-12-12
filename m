Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD06CB9CFF
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:50:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8428E10E962;
	Fri, 12 Dec 2025 20:50:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ZYAr9hjP";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from BN1PR04CU002.outbound.protection.outlook.com
 (mail-eastus2azon11010012.outbound.protection.outlook.com [52.101.56.12])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CABB10E962
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:50:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UXiDfYfqcjUFNbYwscCQINq8PckzfMJBcp+1JgNcIWFpspC2aEQnZG91scefyA+jDOBiyZauRckQvHDI6VvxYWnhOpMO5ImH0RA8jQTk4IhosP9JIgEkmVvLIv2i7OtdUUMdsJ3D2UYoyoPkKWRuvsOcg3jfinY2Djo6gq9ryOJM3izdzD6r4YgCrcZXFEBXo3p+Wxy+CWSzrnDEp1oqpkOW0nN1aJX9yxCxa5PKXMENaB+L45976/gKIZ7xOnbC7w0bm2JigDCDQVc3fBCLsPRsM6BMu9oU7AHC25au1/J7n6UcTIOD7rY9qfqGrPnmTnSbY/DuY6tYtJEKQAs8Tw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=U146Rjq77OFWJZgba65Ka7wC9nkK7EmBRvQsz0IUIBE=;
 b=Mrn+C6kDX1EiyUUVBtfUGT0eeW7tP83zj8OWHS1ACqaSLuP9QHDTzSwSfEsh5VszQ7ElnQBlxBnqK04V7eolTrPJ/LXOLfEwk7rjGyrGy2v/mj6AG1imEMfRrnxM+aVWX4NXOqjHJMm3Lb9WgQ0kLsOVc7v4ZOg4U2DAfsg0HTgjGrGTRwekBQQ9TAXSOp6LVIHj0/DE+d0oaHo9sNL7YGDaFJ9HUL+WHm3hdKnzNAmLpJ8sj32fC1oEJbtqcFdp/MUSx+NoKEdT8Jc+7z4/Hyag5mJMFbkVPCja5H5gE2pDIYpFpyjbViHhcPK+qAn+d6hcrB/kMWZQfmWXsbk0vQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=U146Rjq77OFWJZgba65Ka7wC9nkK7EmBRvQsz0IUIBE=;
 b=ZYAr9hjPouvE0ujd7zYisfUm1s1BctzdhMlZPqOzbBIEbheFoPsbzS8gdtz40eKTNTiXFAbYNFRCnmiQIyaD89t8jIRJP5iMgChbzEE5gq/Nvsv+eI60sqpqv3EUxOWYFPUE3sFY5nsnkaEV02NDHdF2SzFPxJh0ZflwB2l95DM5Rz8I8v1A+KXWJ9J/9iqNADlRdkx4JZxmenKk0ttg6YMI4eORJme75HudCigN3OlNd+/Qhzzww5VA6TGfBpAdJB3n1F+3YVQlzpxj1XS1VoStkMpEx/KsHepCj3mKu8qy8Y56p7q25TlwW5AGiz/Pa9Nx86HFtun9tebhOjTDrg==
Received: from SA1P222CA0044.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::9)
 by DM4PR12MB5985.namprd12.prod.outlook.com (2603:10b6:8:68::19) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.11; Fri, 12 Dec
 2025 20:50:23 +0000
Received: from SA2PEPF00003AE5.namprd02.prod.outlook.com
 (2603:10b6:806:2d0:cafe::5e) by SA1P222CA0044.outlook.office365.com
 (2603:10b6:806:2d0::9) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.9 via Frontend Transport; Fri,
 12 Dec 2025 20:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE5.mail.protection.outlook.com (10.167.248.5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:23 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:07 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:06 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 5/7] gpu: nova-core: use pin projection in method boot()
Date: Fri, 12 Dec 2025 14:49:50 -0600
Message-ID: <20251212204952.3690244-6-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE5:EE_|DM4PR12MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: edfd1489-4407-452c-f129-08de39c0122f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?O118WQ5+T0C/qXNicufRRuWLGUxePzzZr1jzSF4vum/O2rEQh63DrCMxZulA?=
 =?us-ascii?Q?rkbmQUc9dT+oNem4NUiYHbn94xqEtBDOCPv2ClT7ndupbQSsUlkAfu1Pddz2?=
 =?us-ascii?Q?oyfmPCeFMs81Wh34AClRiEWrZDZk7RRG5VJDlSV/0TbudL8Jojj1xOK7b4M2?=
 =?us-ascii?Q?63Yyvfpg+wc9dcODbHmUIGyDmh8P7P7qG9+kgw6knNe6KXC+JyGJoEBMRIJH?=
 =?us-ascii?Q?F2yOeKwLiieUq7CrVvHhB4bDn2GV7H0D6ShoqDasUa5EnOpytZFn0bYVgmbj?=
 =?us-ascii?Q?QdGbHmAvQQQ7TkRcdb+ltXZzGwl94+Q5S9oyP6dKSkLY/Uah5qeZVL+o8NGG?=
 =?us-ascii?Q?oe6Fr71Csr22hLZnLhuxVGTsfyskrYJrt0haEPB9D8Y5BV5u+yCz+PUTeCj3?=
 =?us-ascii?Q?lkB6GuDr/0o9hzVFRc1iRxKf5v9yUTXQHkDpbuS8K9hfnugqdEoOtK2DnYBj?=
 =?us-ascii?Q?PdRCCfIEK1jEOpoSw+UdfMyM7ALtFkFZLaIVoe6+SERHOGjJ2pWl40SOFtVA?=
 =?us-ascii?Q?wgLnOwcKLncH1EFxAl6p7NpPvE/7LAHqGjz9g5BksG5Y56p77IplAuoVxbBe?=
 =?us-ascii?Q?gv3mk5LgfhiBRbx22sMhXT3Ga2/97Gn8h5RsZSWq1DtvYiEBENF0VwVwvMJs?=
 =?us-ascii?Q?41tBNTSjGc1/LS68t7fHhY5q6gWqXs/yNXLM0Hj3RH8RB3DF50yT3L6eH3k0?=
 =?us-ascii?Q?xyZpn+rFhWILIeIkg3J3Sy3jokiuhnqrh+hI8KW875zxpjGUpN82ihGDJ2Hb?=
 =?us-ascii?Q?Bxjspi7hraulRuvI3/opYzbzpzTg20C0Ow45CKx+4P2gw/41KZJByHjFDCY7?=
 =?us-ascii?Q?sKB1+yk6tQy/VfvXHfCrS614VyND40Ng5Val1E0mW25itAWa4BS0D0XbwxiW?=
 =?us-ascii?Q?jFBra+INXJCZhX1omAf45Zvh5lLH9PtrhVNUsXe/+m62ZgotZ/uDgi0dj6jO?=
 =?us-ascii?Q?2+hUE2PasT99QoRIk/8oDYq5IID9mobqUYhIIrAMVxxctJFj+eQzsXWcsATu?=
 =?us-ascii?Q?AxJe75UxtSL9kj5VQWjQG0maDziYkYgDi1vRCSQPM2fkP57E3XA8HJ42AhGW?=
 =?us-ascii?Q?+cUxkcSeaNTmxzJFbv4v2OFhj6LEURzQaJV6WAGdG81VXjXOpDuHxATf3y+B?=
 =?us-ascii?Q?4sr363xdXFwJZcE3pMBlbGVtXuO+NX0o8C+ZjezqFIMsQQ3HVzgg7a7tNVbc?=
 =?us-ascii?Q?agItsOeFLM8cfpNOse/ekvUCF7wGYPI2qld77qW8mI6VYlcoV12492f/GuNF?=
 =?us-ascii?Q?mxVY1psP93DXg3zZJ36Do8CWPHvG2BFatUq4wvyYpstJUGEDTMSIuiLPZNww?=
 =?us-ascii?Q?FsxUsTGNCL7LYM5EY6B1CEh3BvgDcjuXS3qiMuJaCt4ZCPMgDbQv9OjSthoD?=
 =?us-ascii?Q?IlKVHeGh8yJ4cIcuNONfHIK/CE9bxb4+zjZbN+H3LI9OKMaE+th+khGmuC8p?=
 =?us-ascii?Q?0Ia80Z1W0DGnoLXPHv/cI61XjVz3FJVi6QczXei3Q9Zx8whRfEntSBqozfJH?=
 =?us-ascii?Q?ZMe8/rTgsscKd4/es7Vc51p9eSSy4H995FxJAT6jcFWI1X0u9/Lq9qPgUGgW?=
 =?us-ascii?Q?G5L8cBEwe6TQP4sJ444=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:23.3296 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: edfd1489-4407-452c-f129-08de39c0122f
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE5.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5985
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

Struct Gsp in gsp.rs is tagged with #[pin_data], which allows any of its
fields to be pinned (i.e. with #[pin]).  When #[pin] is added to any
field in a #[pin_data] struct, fields can no longer be directly accessed
via normal field access.  Instead, pin projection must be used to access
those fields.

Currently, no fields are pinned, but that will change.  The boot() method
receives self: Pin<&mut Self>. When struct Gsp contains any pinned
fields, direct field access like self.cmdq is not allowed through
Pin<&mut Self>, as Pin prevents obtaining &mut Self to protect pinned
data from being moved.

Use pin projection via self.as_mut().project() to access struct fields.
The project() method, generated by #[pin_data], returns a projection
struct providing &mut references to non-pinned fields, enabling mutable
access while preserving pin invariants.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/boot.rs | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/boot.rs b/drivers/gpu/nova-core/gsp/boot.rs
index 54937606b5b0..1db1099bd344 100644
--- a/drivers/gpu/nova-core/gsp/boot.rs
+++ b/drivers/gpu/nova-core/gsp/boot.rs
@@ -162,12 +162,13 @@ pub(crate) fn boot(
             CoherentAllocation::<GspFwWprMeta>::alloc_coherent(dev, 1, GFP_KERNEL | __GFP_ZERO)?;
         dma_write!(wpr_meta[0] = GspFwWprMeta::new(&gsp_fw, &fb_layout))?;
 
-        self.cmdq
-            .send_command(bar, commands::SetSystemInfo::new(pdev))?;
-        self.cmdq.send_command(bar, commands::SetRegistry::new())?;
+        let this = self.as_mut().project();
+
+        this.cmdq.send_command(bar, commands::SetSystemInfo::new(pdev))?;
+        this.cmdq.send_command(bar, commands::SetRegistry::new())?;
 
         gsp_falcon.reset(bar)?;
-        let libos_handle = self.libos.dma_handle();
+        let libos_handle = this.libos.dma_handle();
         let (mbox0, mbox1) = gsp_falcon.boot(
             bar,
             Some(libos_handle as u32),
@@ -234,13 +235,13 @@ pub(crate) fn boot(
             dev: pdev.as_ref().into(),
             bar,
         };
-        GspSequencer::run(&mut self.cmdq, seq_params)?;
+        GspSequencer::run(this.cmdq, seq_params)?;
 
         // Wait until GSP is fully initialized.
-        commands::wait_gsp_init_done(&mut self.cmdq)?;
+        commands::wait_gsp_init_done(this.cmdq)?;
 
         // Obtain and display basic GPU information.
-        let info = commands::get_gsp_info(&mut self.cmdq, bar)?;
+        let info = commands::get_gsp_info(this.cmdq, bar)?;
         dev_info!(
             pdev.as_ref(),
             "GPU name: {}\n",
-- 
2.52.0

