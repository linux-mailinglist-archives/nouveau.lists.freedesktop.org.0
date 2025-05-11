Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58C68AB2B75
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC7CE10E26C;
	Sun, 11 May 2025 21:09:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="OOUaY+Ow";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2062.outbound.protection.outlook.com [40.107.92.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F19D210E267
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:39 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mGMYiVXWV5oKNooB7XLsKdNTjxBVfYGEuNswl3alyIGDtDH+FAiv5K9j+Knj8irY+rK90w1c6lYkk41/DSUg6CyyMgN/7XFe2voDjmd5Uy3yHdlYkTeUGmiY32XxyEQcRsUBpzPRpo87mLqh+xmCTFKdJANP87dzfq0JVFRM9AUNHYFzpRmGcqvNkr9XYhH4jaTg1QEm06dM3yrccAKqz1xHkWr1SDXz+lunZqSd9uu2gKKVboMfEWwHBCpZzuA9bD10k9GjXiD+JexIfOOZE2ep657c7r3GpYtAGUUB3LMBNw8jdfMFnZ6Ma9popuQoVIY+DUdFgadjjIvdS/IMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GOCWE9+FaakHunjkHDJ00VW4h/R+nX1GJFSgTdKW0Kw=;
 b=cqIbR6ThMLiUfpRMfLZysvOyKrtKLbZIshkw7T8tio7YtPKOtdsvbWbqYWNmjk7VZtjyJvkUiEFN1gNgZsHrtqNkHenPnGKBi7IVcS1t9dGi+6c4JBbQ1VJwgWiSf6ptfP07cyz17qpKdpPCnHkK5sA9eZKSLYE/TsPVehH0DcGsQP6MmBWNwVnYzUZJ4ovWv5cq92C82j6J1gxzp3W5VQeQKjsnJ0zlY1Hf1jsN2zCpirDKIjNjoZGQxGBdEsfSya0fwzkzKI8ncI/JEtHODiRPm+jTdOd9wlBndA2T4k2hoEYRomEl9IslOBaDahodMa8l+pK5xLLqjeh24WDZEQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GOCWE9+FaakHunjkHDJ00VW4h/R+nX1GJFSgTdKW0Kw=;
 b=OOUaY+OwWOGflw8kbMgmqcOpfJClvaiWjTLtuEn76wUrOkZ78MHGqR5UCSUnMKwxAGGBhUoUNYoxrOWqYqiK642xBO8vcrJtnY4bTcfWuN0x5u+3CnJKIlt0ZBBFwddNCHtg33SpDbQYlKOB7AvjvH1VYYxSAmpYVFxA3ZiU24JuxkhziCEekccf7C033IIJpks3POr2fJ8p4z4W6/bDTUMTBLo12aDnvGPPbt+TMx6R4kATyO2R6ml6iakI1cvKcHrfrueviddjQfCs3flRBPwYYmQKiJgEIFjK0dqABmFVS3khVpIlx7VzOOgtKZP8/EHPS24DUmOtHRlg3zRo7Q==
Received: from DS0PR17CA0024.namprd17.prod.outlook.com (2603:10b6:8:191::29)
 by MW4PR12MB7214.namprd12.prod.outlook.com (2603:10b6:303:229::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.23; Sun, 11 May
 2025 21:09:34 +0000
Received: from DS2PEPF00003447.namprd04.prod.outlook.com
 (2603:10b6:8:191:cafe::7) by DS0PR17CA0024.outlook.office365.com
 (2603:10b6:8:191::29) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:09:33 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003447.mail.protection.outlook.com (10.167.17.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:33 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:24 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:23 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 48/62] drm/nouveau/mmu: bump up the maximum page table depth
Date: Mon, 12 May 2025 07:07:08 +1000
Message-ID: <20250511210722.80350-49-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003447:EE_|MW4PR12MB7214:EE_
X-MS-Office365-Filtering-Correlation-Id: 73725cbd-a623-4ca7-0f6f-08dd90d02117
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|1800799024|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BrHA+/sDZih18tysUJ/ZMYkgQx8FrRC0SFJc558F3HlsISB0Ek/mMSGbvVBh?=
 =?us-ascii?Q?LF7Y3Dhvn5K92pKIZoAqOetHLiyTPKC734O/pSVs77eiP03VSkK0Q8Fn9phe?=
 =?us-ascii?Q?FPAOHFi+SYMTLgaCc7CqdDhzU7Iqeg+ElRVGPsnYfMepp0U7SnUO55GEt/mO?=
 =?us-ascii?Q?rO6f2A1bRQ9KiD/NGMuMqLI7dVgrTCFBXPxn6A1c1QpD45qeNxvHH3mgGUCA?=
 =?us-ascii?Q?z30Y2f7dwnkl7fm/JgyJ5SRH2G7b2QzoWrt8tsyhDIxCdXQt9t8+1rlEiKm9?=
 =?us-ascii?Q?MBgzg00WUQfc+a1bo9AkZkCsQcgF5qYC4USKK44crrPe9mk9PxXuG5S1a9bY?=
 =?us-ascii?Q?+qptsJQilvm/hph2+HPSq3IPytUv0uwtgYrZU5B0t60qy0OS3DEgUNxcb2gw?=
 =?us-ascii?Q?GJeeM0EEou6ixV1Jhr4qeUcO/qC5Pq1L8dyAcIk16yEZ/FXSJiEcDsj84Dbq?=
 =?us-ascii?Q?co/aYcHoEcC78c63f4rLKB0OAyxslscRAtpVlzoO9nHbNRLSKN95ieyBvn7b?=
 =?us-ascii?Q?ckleDkri1aa2SEfT92vUQTUbO03zXRGDoBkYU7AIsaL6DlCl2KsPl9WzN5YE?=
 =?us-ascii?Q?D7wuzXGKX+K8j+5XMj50ege5R3A8g0IvQ5k8apFZBn3XqRqt6O07BDtWB/gX?=
 =?us-ascii?Q?pilVQ+wyUYWKJWr5qFnwwKdr1mPnTE9iHH/d4cdZ1/c7TVUwz7khUqJ0lyaw?=
 =?us-ascii?Q?cpIBK/fo+sRYD6wH5Ul+GE1TfdO/JFHEjz4yIkdNgC5itHWNuKUqkZJa6B6a?=
 =?us-ascii?Q?1+n3GJO7YlCOmuA3K3D3PoSeZl3LPurYVi0La3DNtozSH/4dYTzcEJxioizn?=
 =?us-ascii?Q?Kjwdnd1UDe8cmwgUrflYplTThhfgN9+wjLVoQTPVJf0uTvgOpcMj4k3a3qO3?=
 =?us-ascii?Q?UrQI55v1Yu/kukNoDCembgfr/Nz4K04t99uFZFyWakbkjdrMNS8/j/uXOscB?=
 =?us-ascii?Q?oTLtbWLjqu9VJ4m98Nowip9/+na1W953QZbGsY7MZ/mzSynX+o+RqHzdLQ8v?=
 =?us-ascii?Q?JIrFDjJKKt9nzHfyo+6zbY4JSMwdN9+T+zrWGt6BUc1+RMy0B3fuOYymUf3M?=
 =?us-ascii?Q?XJMcc1voxgtBL5hv4PtVRSUqawpGJNh8c3N+vcnQ1lJi1V3k9eyacVd3Leyl?=
 =?us-ascii?Q?PFmXDI8MpKRAPdCm+vxDkq4gfSOM/llzzGdQU+DT8uWnqLGYX3dIF6ucagq+?=
 =?us-ascii?Q?ufSO+JtbRTyQv8va5RyBaACLAZNBK0F+8jL4XNDvcQvh/JYoqr54iqmXZQpU?=
 =?us-ascii?Q?w/aUo6mkLeJmRLMIWl7uM+IPbsma4DyzmiR8up6+QCBFs9nq0xGKUToOkIfp?=
 =?us-ascii?Q?YI3hKcmjhjpQ2/VsRGg+tVST42IBrkBqguM+RXu5EOWUvzzCJ/lI9lJsiW7+?=
 =?us-ascii?Q?gsRNDM3dysb3pn2EpsMuVn//1wHzDlvzVGab8K1p0nZheb9/FQcF7yEXYSju?=
 =?us-ascii?Q?7Te4+Ra+t91AawiBTK/eHgHPgv0+na2LIzmely9W+gb9ztor7ZomuYMqYYKR?=
 =?us-ascii?Q?BPuX/FQYcgM4nehkF3WwLa+d0/zJIS14JwqX?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(1800799024)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:33.8182 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 73725cbd-a623-4ca7-0f6f-08dd90d02117
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003447.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7214
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
index ba9b277fc1cb..7c89c2e80345 100644
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

