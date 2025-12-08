Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C096CAE67C
	for <lists+nouveau@lfdr.de>; Tue, 09 Dec 2025 00:18:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2410C10E449;
	Mon,  8 Dec 2025 23:18:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ayx7SXYp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from SJ2PR03CU001.outbound.protection.outlook.com
 (mail-westusazon11012014.outbound.protection.outlook.com [52.101.43.14])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4FF910E43E
 for <nouveau@lists.freedesktop.org>; Mon,  8 Dec 2025 23:18:43 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PkDOrUpb3CLmR0RFAX8cCFASPsUx7PO0I9cBRc0MSGL5sQ/NIMYZxuqFrbSeO53lwAg0hwvIQlFimYeFr+8+6InTKhtcVaC61zh/KXONgRttdPx81nkGNDerbqMKhKg+4wo7xrLIUPr1JxtasaNLz3taSSfRgBIPbaKAThywujhSXJNzyD3/n7OcdUlaUzV9lHiZCpzBa46VHbNRTxzs9ptX67C3Z4uGYLI2Uj+DoarvRrLUS8ZI3uosAlfjTd2ujHw9FJ52BagqBw3oXXEs0Bhl61EKkJYN+xiuRCpvUYiVogiMXBxanK9rWk00rEnBuxLZX53qAfApwpUmVvElGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2NipSCuSfqGvJm3V4sKnG1fCHMnMVSiT+H/XOLXlI5k=;
 b=EHl2xWwZ6LSrsGgMiUI+6jeWddhUrjcssvCrOwTIIj5UNFpjXHZ9ZJILIyVG82sH2jp9DIUJfxCTQ9bvl708mEwr/yEPoVwbMA8+rSbrFfI2TX8M/k2Ma2Hs8xWEyBI/z/a6FDzKj+8tGXFkqPhYa8vLiqojQIWukt/HW89aGmSGpXK28TzU86wqqBA/QWXozFlmjYPXq2cA9Y1PP8CrB/Fk1OHodqEkwfzZyThVQ76D/QTVuf7p/NuWsCAmbBoHbomHFz6Kjo6dYBSntoT234/4Ox4da1Cu2IRW3P0m68N/TNsVrZszLxzv+q74Evx1oC3nQfe0NGMETyv4zEhyrQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2NipSCuSfqGvJm3V4sKnG1fCHMnMVSiT+H/XOLXlI5k=;
 b=Ayx7SXYpQ8b7N4DaEHQPo8+4Y+/AqrsS+I+rnsfwM6jx//ZlcU76chJHToDtvlYwwuUGkMaEO1iXIRDGyP2T6lkfKnCaAFkdoY9hTObkloanIxN6DVWyA7vUm8AJ24zijqEdDYBi+uSTA3lLtMs4lYJpuvw5KMYHeE+DTUTI+jTLe+tw0ZyfKJGf3yEi4UtQ/HLa9k/qWxSmgyuFpExrcJSv8i0Jy4BxnGoxBsUeb8t3xJDlRj+GWl7rTQ2RueKxrO1ogCp6lCpuam3w4/iYW/li3zdcmyBrB0+jMKt0hPUsHQD4RiM4p/b7J36SgAeBDmHyMQhfd4kNUsVWxsYYvQ==
Received: from DM6PR18CA0029.namprd18.prod.outlook.com (2603:10b6:5:15b::42)
 by DS0PR12MB7654.namprd12.prod.outlook.com (2603:10b6:8:11d::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.14; Mon, 8 Dec
 2025 23:18:37 +0000
Received: from CY4PEPF0000E9D8.namprd05.prod.outlook.com
 (2603:10b6:5:15b:cafe::94) by DM6PR18CA0029.outlook.office365.com
 (2603:10b6:5:15b::42) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9388.14 via Frontend Transport; Mon,
 8 Dec 2025 23:18:37 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CY4PEPF0000E9D8.mail.protection.outlook.com (10.167.241.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9412.4 via Frontend Transport; Mon, 8 Dec 2025 23:18:36 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:22 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Mon, 8 Dec
 2025 15:18:20 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Alexandre Courbot <acourbot@nvidia.com>, Joel Fernandes
 <joelagnelf@nvidia.com>, John Hubbard <jhubbard@nvidia.com>, Danilo Krummrich
 <dakr@kernel.org>, Lyude Paul <lyude@redhat.com>,
 <nouveau@lists.freedesktop.org>, <rust-for-linux@vger.kernel.org>
Subject: [PATCH v3 11/12] gpu: nova-core: align LibosMemoryRegionInitArgument
 size to page size
Date: Mon, 8 Dec 2025 17:18:00 -0600
Message-ID: <20251208231801.1786803-12-ttabi@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D8:EE_|DS0PR12MB7654:EE_
X-MS-Office365-Filtering-Correlation-Id: eb20fa8e-d13e-44bc-2c27-08de36b01d88
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UYHEFSrYVOKae01QrjiwtAIvNJEZqQJKTjTr1o4+WJtCcQeSIoGVbLK0k03d?=
 =?us-ascii?Q?5VeFMc5Y0reFbVU5awdfDgdHSEfJdY6Mt6cYq9tkVrFC7Ja4vGvUz+SNpl/O?=
 =?us-ascii?Q?5+OKn593Se5VsixNpjlS5zSC3NAb3ac7Bve8GavrzIpQP2ILmdUWnF1YPmAE?=
 =?us-ascii?Q?/SghFxH3LZlmHKlfEfHNIsTpdxdgFdyBQvNXORf6gEaZUp+7HWPC/aSIuL+9?=
 =?us-ascii?Q?lT9IJeg3SAi98Zmiahkbl2Y5GKJQMuMJX3xkM9Iwz2CEn7cbMafnrOnUAjdH?=
 =?us-ascii?Q?WJQjN35WJApOMtF8B40y4sO28URUCmpKc91/xxj44x2dU094xmUBW3X6ODLX?=
 =?us-ascii?Q?Yu7iHbo8U6t3Ab+AKU1s0PpjvcWZMTuNC/8mTPYt9bgHVWHDSzCe+WdM2ZUP?=
 =?us-ascii?Q?fukI8nXJpWONs/MviJY0eal9MItK/WnGTVeCXDHDiNCWxKKv4JXe/0xKS3FU?=
 =?us-ascii?Q?g2Y7cFfHXFQygC4cKP0wow+0z1lJl6wodnLdbrLkMQCoAP2C1lWxuaJJuXQH?=
 =?us-ascii?Q?JuEdX0PWX22g+WjHXKAkYpEz/3SlmF7zeGXL44ufRA699YrrOwmpMzcKLEch?=
 =?us-ascii?Q?5p5J44WZdYjrjJxVWpDJC3shRis1IWs8EWAnGPsFuo6nm5Aa6jqKO4u4tg3m?=
 =?us-ascii?Q?JseDNeKAXELQEetZEMj9ScHB4ynPaINOsrr+4RAdFdC7IaI63z2MD+08ScZJ?=
 =?us-ascii?Q?9HVbY2QZBss5P8iuFL5/btXCr1Ruwo8ax2kwGeK7T1nLL+SQRlwRppQ6nOCe?=
 =?us-ascii?Q?atVgCTvvVWO0FUbS9UyWVK/9lnCWbMTX8pz1l4qqWMT3r5l9Yp+uvqKrdqVQ?=
 =?us-ascii?Q?aqmUEIlN2K0dKR/ufl7U/jMlkgu3qjEEZnyWXPwlDOk3qyXuZtyDLqNZF3IT?=
 =?us-ascii?Q?SoGTcUi3X5361/IxlQ2l1kFnkGuiR5p/qJhqoGFYQgC8G4P7MYkPW4/Rt4Ur?=
 =?us-ascii?Q?uHMSNhxwSAn8ivtKiDcE+TQyI1VqYiJVFGi2YcMAAD99cdVO/COY4qPa9/pC?=
 =?us-ascii?Q?C6x3hoGpJ8ScHvux1Cj1QK89PLCY3Xw8JqkoLIz3luN9NVmVVq4+421Mcg+9?=
 =?us-ascii?Q?r+ywCEhvOKwMCu0bt1nWVA9r98JB0Z+5j7uQ3x/kAX5rl1c4SNce9JFQNQHm?=
 =?us-ascii?Q?OsfZeDpeC2ecyLfhmpeNDoj9yE/Rh02WdSxRgr33uxQEXDGU7Toflh7Rpiyy?=
 =?us-ascii?Q?MciXwgzHDC/VY2S8kpxNuXfg01Ii74FXPnbr8f5YD263IiPFxOb8fnrknkGD?=
 =?us-ascii?Q?HZPE29e6QSfNEYAZtqrsXm2A22NMNRN8GiJUbrTX7QRfKYnl30xuj3E1YcZY?=
 =?us-ascii?Q?zFomhktWvBC3QkBIzi+4V6WWaFdmCdgdzGTu7fZtxC/KihJx9utaTv917xY/?=
 =?us-ascii?Q?AjTxUCYy6eC5i5K+UhA+vRY5UK1FQ3FGvOFLBOB2prS7lCNWn6VF90ASGh0h?=
 =?us-ascii?Q?ByCLta/9QR2O8QGWFEw0MerdAF01NBoLLkliQEjGwigPR/y3RET22RTsaAgr?=
 =?us-ascii?Q?9iMaYYAUyHJ5aINrZE4r6YhZLVqigVVNACAr9grFX4jU96BQkLhl6DTjr9u8?=
 =?us-ascii?Q?awbW87RV6doo3XljBD4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Dec 2025 23:18:36.9671 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb20fa8e-d13e-44bc-2c27-08de36b01d88
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D8.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7654
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

On Turing and GA100 (i.e. the versions that use Libos v2), GSP-RM insists
that the 'size' parameter of the LibosMemoryRegionInitArgument struct be
aligned to 4KB.  The logging buffers are already aligned to that size, so
only the GSP_ARGUMENTS_CACHED struct needs to be adjusted.  Make that
adjustment by adding padding to the end of the struct.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/nova-core/gsp/fw.rs | 24 +++++++++++++++++-------
 1 file changed, 17 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/nova-core/gsp/fw.rs b/drivers/gpu/nova-core/gsp/fw.rs
index abffd6beec65..6f53df0f6f3d 100644
--- a/drivers/gpu/nova-core/gsp/fw.rs
+++ b/drivers/gpu/nova-core/gsp/fw.rs
@@ -889,17 +889,27 @@ unsafe impl AsBytes for GspMsgElement {}
 unsafe impl FromBytes for GspMsgElement {}
 
 /// Arguments for GSP startup.
-#[repr(transparent)]
-pub(crate) struct GspArgumentsCached(bindings::GSP_ARGUMENTS_CACHED);
+///
+/// On Turing and GA100, the entries in the `LibosMemoryRegionInitArgument`
+/// must all be a multiple of GSP_PAGE_SIZE in size, so add padding to force it
+/// to that size.
+#[repr(C)]
+pub(crate) struct GspArgumentsCached(
+    bindings::GSP_ARGUMENTS_CACHED,
+    [u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()],
+);
 
 impl GspArgumentsCached {
     /// Creates the arguments for starting the GSP up using `cmdq` as its command queue.
     pub(crate) fn new(cmdq: &Cmdq) -> Self {
-        Self(bindings::GSP_ARGUMENTS_CACHED {
-            messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
-            bDmemStack: 1,
-            ..Default::default()
-        })
+        Self(
+            bindings::GSP_ARGUMENTS_CACHED {
+                messageQueueInitArguments: MessageQueueInitArguments::new(cmdq).0,
+                bDmemStack: 1,
+                ..Default::default()
+            },
+            [0u8; GSP_PAGE_SIZE - core::mem::size_of::<bindings::GSP_ARGUMENTS_CACHED>()]
+        )
     }
 }
 
-- 
2.52.0

