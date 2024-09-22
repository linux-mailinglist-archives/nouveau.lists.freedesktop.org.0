Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D82E69897D9
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94A8110E367;
	Sun, 29 Sep 2024 21:29:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GWU2osbL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2055.outbound.protection.outlook.com [40.107.236.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1DD5810E059
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 12:50:45 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=c8C/l02d/edE1675dx/0nbBSEudUqYjkZ0x5lo5ywHVUBl2KiyNSUSN8KrJcXeiwcs/74b0en6eZ7FDlfipiwdfDHDYXWJy1biRWRoIo3/429DSWhjS1I0xjZc8Zsdw3dbCPuN0PYl4saW+5eTa/FyDQx9uedL1FCdqgvMV7vuzD7Vk6/ilLjhhhZQmxP+sVFszBa7RSODb6hxr9T7D7kBoxOxeIEdTNOudePGdEB+iGyCqmJLDmcrCZMbHQTgaLhhiDtrdC/NxZDcQ+1AYgMqhtaG8COP9jo5OKjiTLjsW+cDM61efWCrHT9apN8jPK0/fg87cCE+scjR+S2kZcHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BFW0UGbSbEJT0csX5FRaUj4dkydgQ376dRX2pBfaXq8=;
 b=DO+4I/gpQQiQFd0BQRRA2vrBJaZwvY3GfxwA/vsbt/Ex3SCwQ3VJ5yIueDoFZCDj9kErSLoO70nYVmO6NIijVOvqpku7fCGr6QcbKIKXAbOdV3YodYGc7y0TGt06drkYtwmG65I52WlI3jOe0WOICZ5kbIp236oiJtTJmAC804qJEkAXJA56Y2btZD/P0XREBU8GLH3VFCrbHoBQeRoU/YcV/1A4qPa5VN+eyqUPnU6WN1+wgekOcsVnJprToA4USSSPCxltiM0e2MuPWK90aOMIZUSRzTEmDf7QVxPFXVR0fRkyn30gSJPr9SV8ebEZYd5Pc6icjr+P+nTyosIv3g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BFW0UGbSbEJT0csX5FRaUj4dkydgQ376dRX2pBfaXq8=;
 b=GWU2osbLA1wA1GocdAq8hG2CQGvdyxyHWMuq1kzPblsg8qkHJgnQx0tFFJ1FEGE06q05XfaJ6xtCvMwDVsBXG9cgCR4HsupNxFYTnf55+u6mMTUcEaox2mJDcW9YVMBU8mIJ0AzZtYGrZ+Bl4jrhCH8JYBjtDsWd9CUiYdMpVSs8KjKdyr2TSdXykzPwlPzeOSv/XuL9zwQZA/g3MSFFTSUDmK1qIqGizDAl+jjjIsiZVM1JcmlGk5eA8zByntzchHR8XHQ9/3HxrNCf00OTCjIM7EbhYZ9lWc7AEEO9BUaPZnJVBukhZ5sHK/d7S6JwRQBOUmLoHJxh1/8hvtuRDQ==
Received: from MW4PR04CA0308.namprd04.prod.outlook.com (2603:10b6:303:82::13)
 by MW4PR12MB5665.namprd12.prod.outlook.com (2603:10b6:303:187::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.21; Sun, 22 Sep
 2024 12:50:40 +0000
Received: from CO1PEPF000075ED.namprd03.prod.outlook.com
 (2603:10b6:303:82:cafe::26) by MW4PR04CA0308.outlook.office365.com
 (2603:10b6:303:82::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24 via Frontend
 Transport; Sun, 22 Sep 2024 12:50:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075ED.mail.protection.outlook.com (10.167.249.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 12:50:40 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 05:50:29 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 22 Sep 2024 05:50:28 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 05:50:28 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <kvm@vger.kernel.org>, <nouveau@lists.freedesktop.org>
CC: <alex.williamson@redhat.com>, <kevin.tian@intel.com>, <jgg@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 14/29] nvkm/vgpu: introduce channel allocation for vGPU
Date: Sun, 22 Sep 2024 05:49:36 -0700
Message-ID: <20240922124951.1946072-15-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922124951.1946072-1-zhiw@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075ED:EE_|MW4PR12MB5665:EE_
X-MS-Office365-Filtering-Correlation-Id: ed54e816-3140-4e03-9074-08dcdb0529c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|82310400026|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WOyc8v8cfO6hJbFxtDuilgs7Nazy4xoGogiIAlLT27IZYD8FRTuN8tOkIR/H?=
 =?us-ascii?Q?/XoMP/lRAoiiqAjUq56H3FZCYvvUw5MtxgT+0+MkDhcA3ko0DXc+4PvnDbbU?=
 =?us-ascii?Q?Jw8YSNA7avGmap86nSI8atd24YVcl9i43LsD1Ma9EhLhWtAARF7YJKCLZmq2?=
 =?us-ascii?Q?abESBujM+CUnWVhvI5FQtxxmLu8Sr2CTHwSThJbAXeUuUcpsfR1LUAHpjE6E?=
 =?us-ascii?Q?TYdUmMBa2pwE1fCCPhPQPZ+kN271zQ0k4/3QVNy1lcNe0uumaXaWmYpxUtns?=
 =?us-ascii?Q?RseygJZAnCcfihQxQ/XiNsIcwjY0PQQLpWrDnYX28Dm24zvAyn5sV4Rk7KLq?=
 =?us-ascii?Q?W0MCQnuBFRVtIRzMLLGpDbimG9Zudj0FQRggMDY48QvyR9CAV97X6iCl8weX?=
 =?us-ascii?Q?7qExzsQXEgebmXnOb/aIc1+bbGX/1qeYGvLIYtF9bfkIf2eS0Vrm031/nyUt?=
 =?us-ascii?Q?ahJw1C3oM3RRx7izO/PkuA5EI/i6YP9iBsti8YGfy6V3v6Pt5o9iy7H4NGXR?=
 =?us-ascii?Q?M7vX6UV4C0IS3/fywmnVZu56ugfOLscixM6Kt+39zufmkdyBBGobNcN1yOju?=
 =?us-ascii?Q?yx+o8g5cBaH+HUDc0BDU2NTXXmUQbm279kG2dvir8papONITqNnzDSI/4Zlm?=
 =?us-ascii?Q?9FJqL357tYpAF0Iy0FeuhISdNilJEiVYVtaBcjyJk0eoXJy665eAfSPfLnWK?=
 =?us-ascii?Q?P4ACo86vjM2gRLam61qppnXnaVK6pnZKOy+GHNzjfaCMb9mI2+pSNmc0Y9AL?=
 =?us-ascii?Q?BG4KjV/d95Ot1Cx3sJuXrXhKeKx1iaRxhODRGYdq64wZk2zE/vIOSlnUMAHK?=
 =?us-ascii?Q?+yIiYN3Kpk2sFQSG+slcU/5bIUSH3bfUOzsCuQgiux1UNmimAtDZ+ju6ojAo?=
 =?us-ascii?Q?VYI6pUgSmHTKvL7juxwPptH/aICYql1lEbjcKoOT3Ge3OC+48sbO6Mn2KGhc?=
 =?us-ascii?Q?ys+xc0JZkbA0+cblhDiEw/XIcQfmc8guXovQB3LVQquDAnySp/mmvxBIXXfd?=
 =?us-ascii?Q?ZM+FnNmJLe+kPbngLu8G52w7Lu7iVQkUdnD5Xs98elBrWxV1CdQubdPXjZz1?=
 =?us-ascii?Q?ZK0qLgmSr9fT8GoCejHFdZvHeans52QjggvTcycsvSmPCVCokhEccLrF8okt?=
 =?us-ascii?Q?AkaqIfAfAT7oX7CsfUz53K10WJpJa0AuNEuxRAxZHOOZFk5NUOsySqaQmqo0?=
 =?us-ascii?Q?ZVNsY90NnzgH4v/BA4uNwok1sIDiXirxjDTEYIziP1tg2XK1L//D5w+sL7pZ?=
 =?us-ascii?Q?T5HrGUh+bkRwwrefIKhCPMKBPmi1ZPk267b0U9UrgYtlLcBQ5zqi8vI2Qvuv?=
 =?us-ascii?Q?pJ8ahsI3Vb8dHyns7hLegeYg7kc2368Lye0Te+GDHnRAhvBui7GYxB5wRvwl?=
 =?us-ascii?Q?toFSQOW9HUxueGkHncPt11+epsVO?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(82310400026)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 12:50:40.1053 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ed54e816-3140-4e03-9074-08dcdb0529c4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075ED.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB5665
X-Mailman-Approved-At: Sun, 29 Sep 2024 21:28:51 +0000
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

Creating a vGPU requires allocating a portion of the CHIDs from the
reserved channel pool.

Expose the routine of allocating the channels from the reserved channel
pool to NVIDIA vGPU VFIO module for creating a vGPU.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h  |  2 ++
 drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c  | 28 +++++++++++++++++++
 .../gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c  |  2 ++
 include/drm/nvkm_vgpu_mgr_vfio.h              |  2 ++
 4 files changed, 34 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
index 5a856fa905f9..a351e8bfc772 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
@@ -22,6 +22,8 @@ struct nvkm_vgpu_mgr {
 
 	void *vfio_ops;
 	struct nvidia_vgpu_vfio_handle_data vfio_handle_data;
+
+	struct mutex chid_alloc_lock;
 };
 
 bool nvkm_vgpu_mgr_is_supported(struct nvkm_device *device);
diff --git a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c
index 9732e43a5d6b..44d901a0474d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c
+++ b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c
@@ -1,6 +1,9 @@
 /* SPDX-License-Identifier: MIT */
 
 #include <core/device.h>
+#include <engine/chid.h>
+#include <engine/fifo.h>
+#include <subdev/fb.h>
 #include <subdev/gsp.h>
 
 #include <vgpu_mgr/vgpu_mgr.h>
@@ -128,6 +131,29 @@ static void rm_ctrl_done(struct nvidia_vgpu_gsp_client *client, void *ctrl)
 	nvkm_gsp_rm_ctrl_done(&device->subdevice, ctrl);
 }
 
+static void free_chids(void *handle, int offset, int count)
+{
+	struct nvkm_device *device = handle;
+	struct nvkm_vgpu_mgr *vgpu_mgr = &device->vgpu_mgr;
+
+	mutex_lock(&vgpu_mgr->chid_alloc_lock);
+	nvkm_chid_reserved_free(device->fifo->chid, offset, count);
+	mutex_unlock(&vgpu_mgr->chid_alloc_lock);
+}
+
+static int alloc_chids(void *handle, int count)
+{
+	struct nvkm_device *device = handle;
+	struct nvkm_vgpu_mgr *vgpu_mgr = &device->vgpu_mgr;
+	int ret;
+
+	mutex_lock(&vgpu_mgr->chid_alloc_lock);
+	ret = nvkm_chid_reserved_alloc(device->fifo->chid, count);
+	mutex_unlock(&vgpu_mgr->chid_alloc_lock);
+
+	return ret;
+}
+
 struct nvkm_vgpu_mgr_vfio_ops nvkm_vgpu_mgr_vfio_ops = {
 	.vgpu_mgr_is_enabled = vgpu_mgr_is_enabled,
 	.get_handle = get_handle,
@@ -140,6 +166,8 @@ struct nvkm_vgpu_mgr_vfio_ops nvkm_vgpu_mgr_vfio_ops = {
 	.rm_ctrl_wr = rm_ctrl_wr,
 	.rm_ctrl_rd = rm_ctrl_rd,
 	.rm_ctrl_done = rm_ctrl_done,
+	.alloc_chids = alloc_chids,
+	.free_chids = free_chids,
 };
 
 /**
diff --git a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
index caeb805cf1c3..3654bd43b68a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
@@ -127,6 +127,8 @@ int nvkm_vgpu_mgr_init(struct nvkm_device *device)
 
 	vgpu_mgr->nvkm_dev = device;
 
+	mutex_init(&vgpu_mgr->chid_alloc_lock);
+
 	ret = attach_nvkm(vgpu_mgr);
 	if (ret)
 		return ret;
diff --git a/include/drm/nvkm_vgpu_mgr_vfio.h b/include/drm/nvkm_vgpu_mgr_vfio.h
index 29ff9b39d0b2..001306fb0b5b 100644
--- a/include/drm/nvkm_vgpu_mgr_vfio.h
+++ b/include/drm/nvkm_vgpu_mgr_vfio.h
@@ -35,6 +35,8 @@ struct nvkm_vgpu_mgr_vfio_ops {
 			    u32 size);
 	void (*rm_ctrl_done)(struct nvidia_vgpu_gsp_client *client,
 			     void *ctrl);
+	int (*alloc_chids)(void *handle, int count);
+	void (*free_chids)(void *handle, int offset, int count);
 };
 
 struct nvkm_vgpu_mgr_vfio_ops *nvkm_vgpu_mgr_get_vfio_ops(void *handle);
-- 
2.34.1

