Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 015C8AA3CA3
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:41:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4289710E5A7;
	Tue, 29 Apr 2025 23:40:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ANtmO94Y";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2078.outbound.protection.outlook.com [40.107.92.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BC210E5A7
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=v+/kZ5EB7qn3Mv74AZeOntNuRVKiT3BPIkYljwK03Pc5ZEyYYDc/08GH28uiu6zjfA71g9V0V7GW0E5WDS/J90368QyD8wPYZou+2a5Lg7/VWJePw1GJSxsnKUDw+17df9k8YpThcVbf/YLCnzs6hQ2YkGlQlZwzZZvVzfFq/jXZdrDvy/li2gxFwd3hzbSQh6uJVT7EZ4bbS8ZqXrR8jWAltyFlvYBpyvx6Wd4JFvkMUPmla3eF/W7R6vIjISK18n7NZ/bpAhz1CTtft5YnaRyc4/RID1GSnqId9cwYfU9F64C8p/yQGcRzpCVHvlo8O+Z8Ea6zaHaMlbnHpksXCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KphK5TpFE+gBEcSkGzeNZw4dMvH35heTUovLXwN0Bu0=;
 b=pYZ/w1Xsk5tSA7pQ1K4oW96imNEkzwHapLF1Yv+OWb2c/k0nxYcCxNbpEDwlJZfvWIiadgvTPFTNtn2Qe/SRt7I9W+jQDJs3Aft4farZDNVihWkp4IYjJzhfGEB/0xnSOMif7gwv8rY4PJ8rGMhExbWNGRNkmHBy1B+TI6CKIinAgMXWUE6Dg+zMcjYj4pde60qpGXi9DSDtavCnY8i1YKMVATbjxdAKr7a1XWQnljaLfTvenmPmoKYbobtpqdy/GzOYy8KY/Rn9VY/cUcXYHANEHtIq3rH3uyYo+Locyk1ZzIVDzTuLWTSWVvwxgUCiXuxucR/d30OouW1u/5iokw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KphK5TpFE+gBEcSkGzeNZw4dMvH35heTUovLXwN0Bu0=;
 b=ANtmO94YEFGV4P24EXvhp0+9bVNz2WmzC1XkNNycvVw+1EIbabWXfRVyxdPDR9aPY6eJxgP8mD6HIAjk8bKSw+nOkMxYIc1qXgjq4ARHdPjitCo5BK2xINzv0QDEWiNIEVIyq1SwPzOGLLfElW+P0xxgrZfGwhVfRgI+I8SAhbLE2aBgCtea05cdOX1BC6maBEeYiJoBVEf20liaREQMg9WRK/jfcJf6NwlUoQ4OIuOlyS31AKM22nXtVdroP7s6lr9QtIxLPmcWtdLofRyEJXiH/JE3xnvAV5PMoYGqFlvp7XsMn7SHv29LdF8hxF1UaAB/tcZyxgvJKdHhTVdtcw==
Received: from SN7PR04CA0215.namprd04.prod.outlook.com (2603:10b6:806:127::10)
 by DM4PR12MB6614.namprd12.prod.outlook.com (2603:10b6:8:bb::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:52 +0000
Received: from SN1PEPF000252A1.namprd05.prod.outlook.com
 (2603:10b6:806:127:cafe::18) by SN7PR04CA0215.outlook.office365.com
 (2603:10b6:806:127::10) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:51 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A1.mail.protection.outlook.com (10.167.242.8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:51 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:36 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 47/60] drm/nouveau/mmu: bump up the maximum page table depth
Date: Wed, 30 Apr 2025 09:39:15 +1000
Message-ID: <20250429233929.24363-48-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A1:EE_|DM4PR12MB6614:EE_
X-MS-Office365-Filtering-Correlation-Id: 6638bdf5-f05c-4fc6-c969-08dd877746c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eHOtzD737SI1Ic6wrPvK1IJvnPBIgI0W32Zr1pYuUiAQIbzbNeR1UWPu66/u?=
 =?us-ascii?Q?PUlMS9DOcqlsMgpH7t+7YWyQ1AyKZvz1jEQTrh4xn2SBVW4TNpxuZyyG7KSQ?=
 =?us-ascii?Q?u5rmssFBzciKJgLgZy77r1yKmmgBQ9rOyasu6GPdJaYZiA+ij6wfpu/Nc3sq?=
 =?us-ascii?Q?Js6O8I86EX5/Wg/i13as8ZSkzBZDjlfeLYkfu6P6yesAqGtKilTda8S967bW?=
 =?us-ascii?Q?uRjkBIA8V/ViifP4qNiSgnvEiwfbZdAHKCZCFM2ciMfUTjxZItucywmfdefy?=
 =?us-ascii?Q?6uHDBVF0x0veImprXZ9bP/6dzASEAhc/DIz1NsVDJ0xMgBCH3eHyZ9Ps9+0p?=
 =?us-ascii?Q?ENB7yWnext9Dpo5HlWJ4pci9WvF61w8rhdMVadTXPuwAuiWmAS5Wt9siV6ah?=
 =?us-ascii?Q?QscdN9vO2xWZ99tLJ7tDysVK0Fp8T7wLBzX/n1i9ubFtI2E6eO7g/s/ozi60?=
 =?us-ascii?Q?VZEj0bztUE51k/4bQ8ZBPvtFAPF55CEbJJtCbfPwUHwga8I45C8XQQ/0Ao58?=
 =?us-ascii?Q?Mm+tp1RvDuSv0W4QAbZ61+FGO+0HRFXHMphfcr4ehQJJd4LYo14jhacvlOH8?=
 =?us-ascii?Q?qqJkaEGLA99FiaCqNNbB2J0/oxE3xwMezi7LkSP7i81YzQ21kRSbZD3qSVt2?=
 =?us-ascii?Q?CzDtbF9ALeNQWWl0SkaztAgUFSR5hpuXZTjltVdA4SWQw4qsfZsATSSZbEW1?=
 =?us-ascii?Q?u2fX6Zm0FBcg/eHnnCTXOW/VYBq+A9IO7X6q3wIBa/p9V1LpH/WrhsDn1P18?=
 =?us-ascii?Q?DYwEq2iIQa5jo0QVJ3fj7/HP1lqcU4ZzK6uHT1aK7qS6HvAU22y1k+sd/UqD?=
 =?us-ascii?Q?UPePa7DUkgN0sHPy0Nr0+ABX8BeNGXORAnhN/qxqz8V/Xv3BqPk6Ole7ug0z?=
 =?us-ascii?Q?z/lVcGwZe6mmoK5Stg4lTrLN8MXxx37gGkVrdf/eOcR3M4GO5HTZhwws2fO3?=
 =?us-ascii?Q?on8NJkwEV9a7MketTdIUIypY1k+QAHF6V6TueBbJL/NubRrotYwcCjqPtuun?=
 =?us-ascii?Q?M5i9U9yZHvuEx0tItmNJCWgWUceBRVv2DTX5PoQT6tFg5+k+f0FJw2CrrBLW?=
 =?us-ascii?Q?I4BstKgfRTgVUd3rzLSot6CVSjJ+L2rsIR9KSdpUf12oJm83z9l1SF5Eh+AT?=
 =?us-ascii?Q?n+VCa3NQAUUxFegHtud31rsEP0q4FOQTtVVCAFOzSnIavHX+lBjrwZwLs/T/?=
 =?us-ascii?Q?B1oSrxI/3g1JwkY5L+cZeHxhX29JNqeSCmxC+c1A2ZLPRRevXQtKIZrnhMm3?=
 =?us-ascii?Q?Rpc+IkCVqtQIQctiur0hmZuDMVmZkGFSnumLj9PDIcAIOsNGX9YUTs8pLLyw?=
 =?us-ascii?Q?fJeWL+mj5wL2FDcAimDwLOdila9kwl6nxE8X4CgXKFXoAUITGtyOeuiuHTpv?=
 =?us-ascii?Q?2fRNnuDKsUuIXy3NcClWbz/mDmEYlKDO4Ypki0aqnwJwKhxQzjuUJmlX6zGB?=
 =?us-ascii?Q?k20MyaBM9KGfLvQCD50qG1EVLG/kpZYj+/qGsR6W1FF1cPPo5tw29B/rdTUa?=
 =?us-ascii?Q?m1CxlfgwH2adYsvos5mCkAjuo1VVjGG3vIn9?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:51.2990 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6638bdf5-f05c-4fc6-c969-08dd877746c2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A1.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6614
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
---
 drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c     | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 5320e15f4fc8..1e461d3b53e6 100644
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
index 0768e5c1fad4..b6295423c339 100644
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

