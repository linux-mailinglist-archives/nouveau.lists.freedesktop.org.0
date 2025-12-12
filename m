Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81311CB9D02
	for <lists+nouveau@lfdr.de>; Fri, 12 Dec 2025 21:50:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B53F10E95E;
	Fri, 12 Dec 2025 20:50:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sMhIIyoD";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from CH1PR05CU001.outbound.protection.outlook.com
 (mail-northcentralusazon11010006.outbound.protection.outlook.com
 [52.101.193.6])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3D5A210E95E
 for <nouveau@lists.freedesktop.org>; Fri, 12 Dec 2025 20:50:30 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E8r3zTFyUAlYE/Wa/vjNw3AyqUHPi7LxQiSMVB/6yMzY/EJbABOpymlE97uw7LLQBLVuhEbrOqLiKGR5bZ5VCVYahPhWdUrJqSW8WIvz4RHkXZDyDbhfX7dvE+pIvZFDuNpjTZKFa1qe6e1q52c8E8riAqeC7VsfIckHiC3vMGVZLFeQFCy95l36cc/ig45Jv2fdxgr/nrfo34GPNkA0OWZe3ZxtxU8Dk5Wesfl3fn2F6NzHmFeQKMyoY7npHidTBQGQxNA03U/Nx7D+L+lnzFxne7jC3U6PMuW9DkrAPwQJqfl9UABTuuKduyDQkcDlVD7whPel7dPogmZgl9pIqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dY3RmGkwLVgfxWKoNyRVjvfvRW+IPgebl08br6MzSxo=;
 b=cuexCVYkC1j9kAwuNa28Y/cgaAxCSko6gh98Scrb/fGHwDuRrVSvmFiMfZsz2UA4aP7KyNgdk45/2c54uXL6rkaz/yZF0NiHD1aIw6xJYI0hrWUULWYykNWXysCtw5W+NlnBNLjhrkWQsK7HKjCYMliaGZonQoXIc5I4IbTYJV9IzwojuQbTTAUZ0oHu9CqQt7Z+tOVADK9fjNAlKFSNEDecW/mcwTA3q9LWK2npYHRfFGVEvc7aDymopivjzC9lAWhFDzOoHfo5hhFyNrhvvVU7fbGW28sApOwXzX2+5wSAfkgF2DeoeoL00nlqfcoGPe52/Q4xfzSA7YsoFZYnMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dY3RmGkwLVgfxWKoNyRVjvfvRW+IPgebl08br6MzSxo=;
 b=sMhIIyoD4wmFEoiV94FGT2EPJ0As6kHLt8HVodBf0g6msAaGj8MMkn+9YrJh/dhm81n34Sd3OJRZItkX74ctMiFU71RUV3IqPjHUo5VbCgblRWrVwSsmrQaW9W9ixpSuF/fd18B5/x8wAiCEsw36n1IxZu8LxDIJ4FKKncjTr+egevs9bzXGbnlEOy8cFzrGLktg7+m177Bq79jYj4qFSKWyQ10gCl4QIY+gPAeMZOCIxJxVKvJHcDb9hIlZm7urou5weVuFTtDpdC+7Te6kpYmOwn4pT1NwkBlzHTvOm04nf6tgblY217uhqqNDQmtz9sNJgbmw0ZegtTt9UXVUrw==
Received: from SN7P220CA0009.NAMP220.PROD.OUTLOOK.COM (2603:10b6:806:123::14)
 by PH0PR12MB8822.namprd12.prod.outlook.com (2603:10b6:510:28d::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9412.6; Fri, 12 Dec
 2025 20:50:26 +0000
Received: from SA2PEPF00003AE4.namprd02.prod.outlook.com
 (2603:10b6:806:123:cafe::49) by SN7P220CA0009.outlook.office365.com
 (2603:10b6:806:123::14) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9412.10 via Frontend Transport; Fri,
 12 Dec 2025 20:50:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SA2PEPF00003AE4.mail.protection.outlook.com (10.167.248.4) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Fri, 12 Dec 2025 20:50:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:09 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Fri, 12 Dec
 2025 12:50:07 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot
 <acourbot@nvidia.com>, John Hubbard <jhubbard@nvidia.com>,
 <joelagnelf@nvidia.com>, <lyude@redhat.com>, <nouveau@lists.freedesktop.org>, 
 <rust-for-linux@vger.kernel.org>
Subject: [PATCH 6/7] gpu: nova-core: create loginit debugfs entry
Date: Fri, 12 Dec 2025 14:49:51 -0600
Message-ID: <20251212204952.3690244-7-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SA2PEPF00003AE4:EE_|PH0PR12MB8822:EE_
X-MS-Office365-Filtering-Correlation-Id: 51d9d87c-96f9-47da-4ceb-08de39c013ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GQNqgV40KIfRLlYajkKSxbB8c7BAwDZ66wl35z4eyRx5wma201kMkjdNJnDx?=
 =?us-ascii?Q?z7Q2VNgfjChS3ZUG8L+uBMg9gWkLzPczxSGpYEIqAey470QPPntSSUIUXtm2?=
 =?us-ascii?Q?HMtg6dA12frKtocMIqYkV8ODYJbB17lTeHa6Tt4/hWkpHhkEITv0CKDNMWpU?=
 =?us-ascii?Q?/znTnuvHvQW8zUyxNlkBmwRZzsL1M8OEVKheVroLoeO39msYaDSGO+ALq/+R?=
 =?us-ascii?Q?Ibr2tVBGqmIjNjZnJAFo2SA98FZXvgwszRMmKGCwPWLATk4VCL43lbEljGd/?=
 =?us-ascii?Q?2vBRHkwMqAmXkwSWSucRi4m7vsob15J3otUaCv7zDm9rIs4NzK7urBv4+F0q?=
 =?us-ascii?Q?Bs32aGYxUs5JqLW5JvkeHy2gz4FuapLIMFZAHaMwLz1CHvLDhGjT5C+pDSnc?=
 =?us-ascii?Q?0/yyoIJWlKx/GuExurORHHOfFOEOMmxsSwvnHydRoSXbx0uc+GX1kdpNFDU1?=
 =?us-ascii?Q?0g2RI8A+Qxn207xTELesbmH7twSX8SB698JPqfxvAQ4NQ4esWZqwS9z5x3wD?=
 =?us-ascii?Q?IgJZF3S5JWKKaPQBqA1bNCUf6liL98vEkZuS5wOeQQJHXePQ5G3+plKdLu2k?=
 =?us-ascii?Q?j6ye5z5PQcVcJYUZYc6mvZ1RZeY2wUSsca3qNGMJ9jXnMvp/mzSUbdWb8Nuh?=
 =?us-ascii?Q?4p+wv15ggj0o+QN1UrG0pE3Y8kxb4uGTSYFpmdXwDxjrxr1bp0Dyfc59p2Ys?=
 =?us-ascii?Q?9Fm23YuMsNoM2KzhPBZbGCfGUPuVX3clVrctInXD2zIuEln/Sh7cn1yu7lpv?=
 =?us-ascii?Q?5jxcQnNO4RK7wSmeNoRLuEcLSos5MWKoW54OMsQ7SCQmc6DgbuMKYHOThoSE?=
 =?us-ascii?Q?5qdVyfmfo6vtdRL0sCE/tjUf36Z22VuVhjBdnmpZ93P37kzc/Em2N4gJA7q0?=
 =?us-ascii?Q?guy7x/aLjtME3TfToZMZ8w0KgsZE9mlg0vS3ECYb/N+EjtpvQffDJ08LLO8B?=
 =?us-ascii?Q?ACekjuwhZYj6rF8XuWclQrjhKEA4nWLh4gfYDd0zs1KcAWHa6IMnvcU4pp8o?=
 =?us-ascii?Q?NoYRLRjVk8A+Zb2M9nJ2VGjnoUjF4S1x5B+Wu/rczlVxKGPfGbly2RDW0742?=
 =?us-ascii?Q?NOy0zjdsJB//eUajPWGm2Sb6OLad/GxdJ17g6+vD6Arqg0lg3uLWE8iXEXUS?=
 =?us-ascii?Q?L7dESw7sQeNuy8gLyDA7DaDALw7o7c7IE/l5DOBFCs53OncVCUa+sbC91eD3?=
 =?us-ascii?Q?oJucvyMfp7jWclltLEbD3VZolndvu1g6AtTo19Gaf/0lhykZEuYs8DntNhQi?=
 =?us-ascii?Q?PURpblNwmq/iEjPZ3huvTsq7NMOg5IVEpWU969XxqpjkOt1TtKXlc/T/4jOh?=
 =?us-ascii?Q?VTIttBhMSVlMK6BhnUo0m+ITiHpzIll3Luv2bB8M/tS6zHmgirO+y361JX5x?=
 =?us-ascii?Q?iUFjU96Kz3ETgGC8fLRqvllH6TfritroGRXasgsxyrIsEhHNeImxyPO2MG1Z?=
 =?us-ascii?Q?bz8U10j35D7GpbH7z68A08eaWCHjnA54zeDcTai3q19ybLHtZV4AUtGrx/ZO?=
 =?us-ascii?Q?7bBoXRJQYF9Hck0SKMkRH/AhfPql4rFpoKudssaAyNicU8xOk0yAnxORSD7d?=
 =?us-ascii?Q?uZzQ5hVqVgu0CVL5vbg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2025 20:50:25.8334 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 51d9d87c-96f9-47da-4ceb-08de39c013ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SA2PEPF00003AE4.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB8822
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

Use the `pin_init_scope` feature to create the debugfs entry for
loginit.

`pin_init_scope` solves the lifetime issue over the `DEBUGFS_ROOT`
reference by delaying its acquisition until the time the entry is
actually initialized.

Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp.rs | 17 ++++++++++++++---
 1 file changed, 14 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp.rs b/drivers/gpu/nova-core/gsp.rs
index 860674dac31e..ba4f789d8ac1 100644
--- a/drivers/gpu/nova-core/gsp.rs
+++ b/drivers/gpu/nova-core/gsp.rs
@@ -107,7 +107,8 @@ pub(crate) struct Gsp {
     /// Libos arguments.
     pub(crate) libos: CoherentAllocation<LibosMemoryRegionInitArgument>,
     /// Init log buffer.
-    loginit: LogBuffer,
+    #[pin]
+    pub loginit: debugfs::File<LogBuffer>,
     /// Interrupts log buffer.
     logintr: LogBuffer,
     /// RM log buffer.
@@ -143,7 +144,9 @@ unsafe impl Sync for LogBuffer {}
 
 impl Gsp {
     // Creates an in-place initializer for a `Gsp` manager for `pdev`.
-    pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self, Error>> {
+    pub(crate) fn new<'a>(
+        pdev: &'a pci::Device<device::Bound>,
+    ) -> Result<impl PinInit<Self, Error> + 'a> {
         let dev = pdev.as_ref();
         let libos = CoherentAllocation::<LibosMemoryRegionInitArgument>::alloc_coherent(
             dev,
@@ -173,9 +176,17 @@ pub(crate) fn new(pdev: &pci::Device<device::Bound>) -> Result<impl PinInit<Self
         dma_write!(rmargs[0] = fw::GspArgumentsCached::new(&cmdq))?;
         dma_write!(libos[3] = LibosMemoryRegionInitArgument::new("RMARGS", &rmargs))?;
 
+        #[allow(static_mut_refs)]
+        let debugfs_dir =
+            // SAFETY: `DEBUGFS_ROOT` is never modified after initialization, so it is safe to
+            // create a shared reference to it.
+            unsafe { crate::DEBUGFS_ROOT.as_ref() }
+            .map(|root| root.subdir(pdev.name()))
+            .ok_or(ENOENT)?;
+
         Ok(try_pin_init!(Self {
             libos,
-            loginit,
+            loginit <- debugfs_dir.read_binary_file(kernel::c_str!("loginit"), loginit),
             logintr,
             logrm,
             rmargs,
-- 
2.52.0

