Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CF34ABA728
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B63AC10EBDD;
	Sat, 17 May 2025 00:11:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="reOAJQYX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam04on2087.outbound.protection.outlook.com [40.107.102.87])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05EA110EBDD
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Q6oOShygVKLkjGzodW9YSazkTNGkUc0rcq11UvVhvXCDXXp5/dkfTsy4c5X+Tp7sQd/Kee8OSACw9Y73WsuwlyPhmT08n5RQz0nwhipy5A/PbeUmmYPpHbFjAqVEH2xQEhSN4/GpzkJuu5GZFb+DDETbo7LhbGbaBnq2f1b//cjzqLF+5lktnIMLLjbtnLzRIAEoXhf8UadwGr+DBiCm29huFffh6mtX7l0ydTSiSQvTjCHNF+zOB332TWXbMS9y6ot5Of7ogdCGATs4s1G2risYXR1ixPc6h4Wj1KLjvGRbLED91tLsylHonWYnWjUj7M0P5iSRa0TQtMHB6sKWVg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ULuoTEtxeWfhnbpU3jXxpT45EXR6XGGICs9M0jh5SQ0=;
 b=Qtg2oNuGcqit6RAya3P1ynYP6LO2Av3e3j/3Wo/Z8mb6GDQJf/Tub2DDOiHZAkoW9vnhITDG7Aqf/kGawAfhnTLGeSds8IAcOzRbJ26so0GI0GB5fTHcch3jiUvEisHX2S8Fjbm3yIIDp2J89FKenOR+6j7vFWIze/kZxKOBauGAyd2PZwpCP7xy2/gCdEmnBIHqeuJszcljgiT0LhELE4K4NZbHpIwc9aHSmIXWqFgtC7FRYzMiOCDFoo5B595X9qadztLuhLwvhQdHBBa7rGks52TDCVWfExYHfhOCJDrTOswUDQP4Dnthf6TJ+haFa733ibaOs6qajBtwShQwVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ULuoTEtxeWfhnbpU3jXxpT45EXR6XGGICs9M0jh5SQ0=;
 b=reOAJQYX2klNWkwEO6+X6yHhNMqRZyL25bC+ZQ4/4Q9lsryNyUTK4vYMVpc3QEDCD4nRJiXxkihFcbVcQOpykWnAzd7LmZw2DFxX/+Jbf5v9HC8NUEOGlDzCvxLkZU2mFoZNKEP0BaKgoftz2dmhmc4u4K9p7Wv1zN/ldAOCdOJY+9BFF5dmmF5XSeU08wCSjpM0sVNjNtywK5J/hsjs26hc01w5gR4LfqYihM2aj/srZUztn45aAdwl28S72mf7I6vfOp8cpZrFzp9lXbL3+UKhFMU+rByLl9fZY8c96j2vSGvtayr7QvSlb7SxAib/uvIU2sr1GaoOkdWUjx8kDQ==
Received: from SJ0PR05CA0178.namprd05.prod.outlook.com (2603:10b6:a03:339::33)
 by DM4PR12MB6009.namprd12.prod.outlook.com (2603:10b6:8:69::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:33 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::cc) by SJ0PR05CA0178.outlook.office365.com
 (2603:10b6:a03:339::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.17 via Frontend Transport; Sat,
 17 May 2025 00:11:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:19 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 48/62] drm/nouveau/mmu: bump up the maximum page table depth
Date: Sat, 17 May 2025 10:09:40 +1000
Message-ID: <20250517000954.35691-49-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|DM4PR12MB6009:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cd9414a-5b11-4fe7-8167-08dd94d761b7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XqSBz6MOXu27UeJ2skuYwcONJSc6H9uD4FjtwASBGxDf/tpCL6DGlD670uNq?=
 =?us-ascii?Q?SUaE2TS6Qx/zIrEW3yC1vPeJ2X4d7AXiFp8otgU65R716hS8l9QZRsST9wST?=
 =?us-ascii?Q?n3GerPknBu1B9DgP1noyJjBNE2ycSEd8sXpqZ7baiWZZJ7cVxvmLlOr1RL/D?=
 =?us-ascii?Q?k2AUss1FCPGGKqCPC76Si++qg4tVzqygMPXbZ2tqw46UdIuryTNT6/kow+53?=
 =?us-ascii?Q?KrjZBJhCBdQ8DtoDF/Oh0P9Nm8quUDcA/ozasqydtS4hE0qqqmSQf7gZH3Se?=
 =?us-ascii?Q?KHL4tmXvKQurdHxLDMcA7ybVB559Pzk2qTvOt3LVMDLoYhQZrLYYLt3d/Yp4?=
 =?us-ascii?Q?b0nVBZo6l8R5KKnTDPmWavKzjdSiqUQ6NpMEYR1/xKobbkh5dd2Uvyg+1PDK?=
 =?us-ascii?Q?q6tZMNI3AAy6hmKqMK+Z4f2X9WQA+e5mgJA1dghj45kdtK4nUBNvaEvDi7Vm?=
 =?us-ascii?Q?axt0lvN/w8CsFBbE2atv+1LAmogbOERFTIBr6K2xXSEYDDVFPwTr5iyndjrc?=
 =?us-ascii?Q?glx1hE7QCgjQoizUlfL4aNJFHSBUfBSjkyr42mfH+eyWhopnOKjFyGURTe+W?=
 =?us-ascii?Q?SjDWLR3604x/M+ct9cdjISHh69ItX1jz02gp2URTt4OMqgqN30y2ovHWwKt3?=
 =?us-ascii?Q?1iJvzTovkMT+q1GFViU07E2pAj/1Mir9l18Iei6GLgAm5BdTM3Du3OCs1ZiH?=
 =?us-ascii?Q?9VrIkjJpz05+vbm1/xETg6BBTplXLCo8KYYxIiLIbOEt0vmbcqu4msudUSIP?=
 =?us-ascii?Q?mNPF1rIqSs7+bYzSIErzSHjDBhCZiCiHJk2kFggra6GRJMW1NuRSyJ/06hlt?=
 =?us-ascii?Q?2lCxrPEm75ffiJkGIbzvmy7hITe5PE0TkNDoAHAJ2x6eKy/qU5zN87FdYdkE?=
 =?us-ascii?Q?/Cv2D+kI7LW6cYP+JP/WTxhPC4fmlQPdiILrv5WtoOTL/0lEJFs+to0lwA4w?=
 =?us-ascii?Q?jKiDwX++bKY5o2r3+Ce9jyEAYt5uwsSGPkwVTzb8gB7/MWx5t5IEnisfp46G?=
 =?us-ascii?Q?4dVPojvUUfRNWMIZG8tuiIhfMizy59RWVylISeaj3uFA8KQIzaQkwGN6J0sc?=
 =?us-ascii?Q?9pjS5W6FF8j3DMKhQ4wOYQJXuf37Ls4LFfMOT/ANEeCXH6cQZz+WzKeD5QWw?=
 =?us-ascii?Q?7z2K6ne+bvfBFq7PmzA5SzQhFpE/N4aD8t7OpMueElJWZV8G0hYf06pUdtGU?=
 =?us-ascii?Q?a3I8Clj81j8K9/eo+AMBwPRyLHoX00ROxDU9UfN4Vm2acpWztZJLR8lRNFIb?=
 =?us-ascii?Q?v17Uq84D7KsMs0UTZpmb/hU4yMmQYIHAs03M4ri3UHdPixKF66WOhfl+TS7c?=
 =?us-ascii?Q?8opZY+jGkLKznY6XIkbLTPEjyP0pzqGeSVBE8JBAHsunY4ADr0XVkdcG0v+t?=
 =?us-ascii?Q?T+V05j8IyacGybf3hkfOKVejPu1DEokx3hYvUvPrRJidBRyrx09x5iwZ56BY?=
 =?us-ascii?Q?dVaJfM8sCBL+M6QKgJ4GpIAbfz/GlmlJ069gd7lTyqRY/fyILf4yYd+6sFCh?=
 =?us-ascii?Q?tWzvTnCPwaGubh+q0U3DN88AhkCTymkuBl7h?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:33.3589 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cd9414a-5b11-4fe7-8167-08dd94d761b7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6009
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

GH100/GBxxx have 6-level page tables.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 935b1cacd528..7188e3eb2d07 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -8,7 +8,7 @@ struct nvkm_vma {
 	struct list_head head;
 	struct rb_node tree;
 	u64 addr;
-	u64 size:50;
+	u64 size;
 	bool mapref:1; /* PTs (de)referenced on (un)map (vs pre-allocated). */
 	bool sparse:1; /* Unmapped PDEs/PTEs will not trigger MMU faults. */
 #define NVKM_VMA_PAGE_NONE 7
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 9c97800fe037..b54397e5364c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -19,7 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define NVKM_VMM_LEVELS_MAX 5
+#define NVKM_VMM_LEVELS_MAX 6
 #include "vmm.h"
 
 #include <subdev/fb.h>
-- 
2.49.0

