Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FFFC9D5F63
	for <lists+nouveau@lfdr.de>; Fri, 22 Nov 2024 13:57:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FC010EB72;
	Fri, 22 Nov 2024 12:57:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lcI8y5Jq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2042.outbound.protection.outlook.com [40.107.236.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B516610EB81
 for <nouveau@lists.freedesktop.org>; Fri, 22 Nov 2024 12:57:33 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HAdE7JJhyavZSsx0kGsd7JZgQUvtd4lnfdU7PXEJ8B4iZsrX4pE9p3cEUjBOo1FgXA85owaNR31Wq4P/3cZNgYvKjIJWLp5k7mCoEdKWVNLgLQzGJIrvK1X/u3qkjATdSAjGerX2srHOkpQ+K/5FQnZhouhdCOK1mX4jgroSmeKpL0AIrwcHSE88B96eQses54Babei1uoIvZpyTd/edXPI9a6nNjJINu/6TkL6KHqdSU4c+kcdv8aUeCXuZopRwFgf7XRdJQNYJCZQiFu4KuL9U68kNMkxhQgK5Zp6QBLMW+Bb3dXA1zSHL+i6DYm+uNz2cXB1lHWqOz66X1WcETA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QwXBAGbT6PCw1FIuYxAgCSNhW1AQZUFNHS2yBBRA/rI=;
 b=umh0qJ6pXXLjFz59uo2VXla6SKDxG7hdG4i0mnt2j/SU36xWNhI5EVdIsIQk6vU3B2SoXtDzEJht15Qrgez22esDBXvveaGnDphmE3otJa6Gdic993lICnxMHmOpYU4AlHbTpFFg94uMlPAq4D9e8hDJfwWOBFEHzz5ntNeVBWvhfY9yPuIahqxlG/9XfFpAgGRLETtpXbbcO6o8EyK2rczppamfsUBPG5FAsFgoGqdbIUpxby+URGZATbl8kqNBpqwyVrQ/iRRNbfcK0a+LkhkbvDunRpBM7yYz6Pvh7MoNtTfdxhQ0FefC/jnlgdlYNRLrTw6BWJODjbhGk57+nw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QwXBAGbT6PCw1FIuYxAgCSNhW1AQZUFNHS2yBBRA/rI=;
 b=lcI8y5JqFkGSHG4CB8RQ3Tf49dz1ezTFQyl7n0yveDwlhWHUmPNFB+h6i05VHKsel+4ehHvaaVczN2kWKSNyeWBfQg3j8VEsZhjUUgAO+XPbyodAOjvVYYcPRapLSPBbAF1vCHAW7kYufdFseyLiFJzNVstdPOLX2ZrpSai0VDvhrhuvmQ1XEsXOYu3x8qkPrdsBnhTy/H3Jzd685litATKsThzntWNwGPU2r6hvKf+VYTkfEyYbk4zEj/lMkaqp7H3oCNQFM3a+MHrzoI/yCaHNj0DinvCR3VpVyPZmEtAa2yQK5YNddW83hgyC7A41nkigIMmPLfoH0AHoLzxNvA==
Received: from PH8PR15CA0012.namprd15.prod.outlook.com (2603:10b6:510:2d2::18)
 by SN7PR12MB7204.namprd12.prod.outlook.com (2603:10b6:806:2ab::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.22; Fri, 22 Nov
 2024 12:57:29 +0000
Received: from CY4PEPF0000E9D2.namprd03.prod.outlook.com
 (2603:10b6:510:2d2:cafe::59) by PH8PR15CA0012.outlook.office365.com
 (2603:10b6:510:2d2::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.25 via Frontend
 Transport; Fri, 22 Nov 2024 12:57:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CY4PEPF0000E9D2.mail.protection.outlook.com (10.167.241.137) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8182.16 via Frontend Transport; Fri, 22 Nov 2024 12:57:28 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 22 Nov
 2024 04:57:28 -0800
Received: from drhqmail202.nvidia.com (10.126.190.181) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Fri, 22 Nov 2024 04:57:27 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.181) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 22 Nov 2024 04:57:27 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <mtijanic@nvidia.com>, <jgg@nvidia.com>,
 <acurrid@nvidia.com>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 4/8] drm/nouveau: scrub the FB memory when scrubber firmware is
 loaded
Date: Fri, 22 Nov 2024 04:57:08 -0800
Message-ID: <20241122125712.3653406-5-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241122125712.3653406-1-zhiw@nvidia.com>
References: <20241122125712.3653406-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9D2:EE_|SN7PR12MB7204:EE_
X-MS-Office365-Filtering-Correlation-Id: b1a2c99b-5649-4859-f4bc-08dd0af53888
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?7PbElSNT867XI/Iybh/EPtr1lqUB2MelqVwQ3Sxtx5dOOcCWXtsQxdnSsQqA?=
 =?us-ascii?Q?Ok8MZDDmaEYcWp9annDApWoQbtXZOFv/Es8BO701I+KlNXZMzM2ACN6cVhiT?=
 =?us-ascii?Q?LVp/Ot9mob+4USlvvD+hDn2fHPEfkjbO5WBdjXhBBqGSmNjqpjsw1VCMvuEp?=
 =?us-ascii?Q?bVMF5V4nhnIr0w1IsWekQt+xm0vS/xmyWa4tWjg6fOKiXuLDn8tqXWE0wiJ5?=
 =?us-ascii?Q?UpFODLdVAgfaO9MPbKwYNM/j0HEinIMH92w3X1lBeCo2V7fLFVVmmKA4LUSA?=
 =?us-ascii?Q?y1PJRqm6r0S7VNavBYczPcnupmnqYAVVNibnFI2Oq35B9E+B5l9zrjhQYKKp?=
 =?us-ascii?Q?JRxyzTBrehLZveO88AKlPWsEtmaDKK0fEVvUiy71oDSwxfpB9WGL0EPJiwGg?=
 =?us-ascii?Q?dhXnSn1wlpx8zbpobW7tpQFMmgKx79DpsY9mw2klSPJisIzhXllI7UYUAObY?=
 =?us-ascii?Q?8bYNJI6nFO8lAbs0FxPlNoEmPuD4HzkrRYBbEJnJldYNu6FMLUlWlnFD8Lm9?=
 =?us-ascii?Q?mWwnTfONhYO6uyt0kYyiLBBHMb2EAZawtcs0iXpZ+VH6S6qNCNSqhuaWmyrN?=
 =?us-ascii?Q?ifvuLoVGOxd495QvTG6FQvtc4+RUzMC7srN/xjN1V3qEVUecIXpdes2h/mAe?=
 =?us-ascii?Q?SvbS7K1CztOk01+6GN4jfxsFo5e53H/MBE4R4fGxXShhrIPONE7Pgl0Nn5ev?=
 =?us-ascii?Q?NBe5OrclCjrTrHzmh4TczVbzxXxgNVC4LBvx/pY3zV33d/DbCvw46wCvX/YR?=
 =?us-ascii?Q?+/prRxkh/6urUAqqnCbDtQ/NPRHL12YvUZHtWBFiHl6+RKjrXchpB11jDYiY?=
 =?us-ascii?Q?CCE7CMQNZ9MvvWXQdbVfXJCOIj0w1J4WEblhstbwC0V8t+GCDHAYTPBHpNIg?=
 =?us-ascii?Q?moGsgnNQyKr9bJ0mUUF7EXixOM34+atebRKNTbNeeIFyUjZr/db5YtDyTDJH?=
 =?us-ascii?Q?BYOvDG84nxPzXreWt0tZ/4BrAGnUgtMGJfGbUGSr5/+OfFJ9du133yxNtStX?=
 =?us-ascii?Q?z8p3ufOu24sB3tRJR7AswwhYrFLxkGugYQ7WVDE3JkX/fGfK1lq4698x+sI/?=
 =?us-ascii?Q?0hIS01Y2HH8hy/r+PyAK41jjgLq2rP7PJ3wqe8hE+GcyjMAGPEm6ee1tDL99?=
 =?us-ascii?Q?BcH6Ks4yU/ndIj/Hzj2xry1ttIxnhlsj41NSXObu1sqNqQOEtsyBBZaichgi?=
 =?us-ascii?Q?LWCcRouolIOicSGMgzNSLfoD5+zHKCS+ZSc9Z7NjXWpo1YSeI4m8TT09edNy?=
 =?us-ascii?Q?E2ff65ESE1edrqDpCl4AER6gzo3MgFCpaOZoe22qyL6vVt9Fo7kNKVRJnP/2?=
 =?us-ascii?Q?iJ4Hnsk0ot5BbmW2gfojQLflJ6DkG7eX/wwRzUkG+kSZOo9xscVh36IMVkdr?=
 =?us-ascii?Q?J7CA/qRWjUNBmaHWat83xleCB0utu66tVJQmGCP5IZND/sNn0w=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Nov 2024 12:57:28.7305 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b1a2c99b-5649-4859-f4bc-08dd0af53888
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9D2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7204
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

When WPR2 heap size > 256MB, the FB memory needs to be scrubbed
before use.

If not, the GSP firmware hangs when booting.

If the scrubber firmware presents, execute it to scrub the FB memory
before executing any other ucode images.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c   | 35 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/priv.h    |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 12 +++++--
 3 files changed, 45 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index bd8bd37955fa..596ccd758e66 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -19,8 +19,42 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
+
+#include <engine/sec2.h>
 #include "priv.h"
 
+static bool is_scrubber_completed(struct nvkm_gsp *gsp)
+{
+	return ((nvkm_rd32(gsp->subdev.device, 0x001180fc) >> 29) >= 0x3);
+}
+
+static int
+ad102_execute_scrubber(struct nvkm_gsp *gsp)
+{
+	struct nvkm_falcon_fw fw = {0};
+	struct nvkm_subdev *subdev = &gsp->subdev;
+	struct nvkm_device *device = subdev->device;
+	int ret;
+
+	if (!gsp->fws.scrubber || is_scrubber_completed(gsp))
+		return 0;
+
+	ret = gsp->func->booter.ctor(gsp, "scrubber", gsp->fws.scrubber,
+				     &device->sec2->falcon, &fw);
+	if (ret)
+		return ret;
+
+	ret = nvkm_falcon_fw_boot(&fw, subdev, true, NULL, NULL, 0, 0);
+	nvkm_falcon_fw_dtor(&fw);
+	if (ret)
+		return ret;
+
+	if (WARN_ON(!is_scrubber_completed(gsp)))
+		return -ENOSPC;
+
+	return 0;
+}
+
 static int
 ad102_gsp_init_fw_heap(struct nvkm_gsp *gsp)
 {
@@ -51,6 +85,7 @@ ad102_gsp_r535_113_01 = {
 	.wpr_heap.base_size = 8 << 20,
 	.wpr_heap.min_size = 84 << 20,
 	.wpr_heap.init_fw_heap = ad102_gsp_init_fw_heap,
+	.wpr_heap.execute_scrubber = ad102_execute_scrubber,
 
 	.booter.ctor = ga102_gsp_booter_ctor,
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index a89ab7b22263..fe56ced9b369 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -31,6 +31,7 @@ struct nvkm_gsp_func {
 		u32 base_size;
 		u64 min_size;
 		int (*init_fw_heap)(struct nvkm_gsp *gsp);
+		int (*execute_scrubber)(struct nvkm_gsp *gsp);
 	} wpr_heap;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index ef867eb20cff..d5d6d0df863e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2618,13 +2618,19 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (ret)
 		return ret;
 
-	/* Release FW images - we've copied them to DMA buffers now. */
-	r535_gsp_dtor_fws(gsp);
-
 	ret = gsp->func->wpr_heap.init_fw_heap(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
+	if (gsp->func->wpr_heap.execute_scrubber) {
+		ret = gsp->func->wpr_heap.execute_scrubber(gsp);
+		if (ret)
+			return ret;
+	}
+
+	/* Release FW images - we've copied them to DMA buffers now. */
+	r535_gsp_dtor_fws(gsp);
+
 	ret = nvkm_gsp_fwsec_frts(gsp);
 	if (WARN_ON(ret))
 		return ret;
-- 
2.34.1

