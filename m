Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C26EF9897C4
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1935A10E2B8;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oK2L0svn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2073.outbound.protection.outlook.com [40.107.243.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 426C610E059
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 12:50:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cI8vmGWJYcCUG67OvDsO3/TunNth/uGBkFxTRpIttvoeyhl5eFTbiUqZXahUvDsyFoukQCaJ5M91dOPnxRRx7YSaLV6nIZCwYzwiRoEPmJwCgQtS9vHQDR3QvrWK0EYYH2A2gjeY7Y3WY0xCpo2l8ZYa9RKsTdFNWskq/nmd98I9PGx3PJ6yha2uzHaTJB7c9kZ8VNz2gdl1X/itddA3gfsYAEaFmXyRs60SLVlfh2R3wkMmxbp82TsOLl4DCsg88jWX/v6hym9eTaysTp4hrqv6zYclJcjsOERelY1yky4Zj1vPO1NDqHIGF3cXeAU+dvh/yg+55ODcsURbRJnQXA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Duc8HA8IkbkhMF79mEpikrfQ1/QCznCR3/5vRo0Va4A=;
 b=Pg8QRWnPMkduNCuEq4KtZthG/gLzCjjiKBlHZHzXQyPXlXG9RpdJnCnT+a5SuTgopZx3Gce3S3vBjJDTFZyRwRBmk3JCEGnU2Xj+U0HQ+jh9bh5Xq5TNDiRQ9o9MmzN3lnmtBBaQzfqsd2WBFjl3/p2wzEtsL8FRalLSlOr/RxCU8/nx3yC1OVTIXWfRjsWaDeY0IANMqXxAVZiNW5IZT7GkfmrFoIb6dbiXhc3Ap9MtqZ/EKQz7uEo9RtiAl8TpxJRf68B9+oYZjx2yG0+HzKnMmO0X7xZ1YEV9oBXctRlLiW7laoPLvGyci8+S5MxppLVCtmy090Dpilpti4hKaA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Duc8HA8IkbkhMF79mEpikrfQ1/QCznCR3/5vRo0Va4A=;
 b=oK2L0svnEFsGhoBD1/LweD0uBctyQcBAPOxcWlcTl7vWREHN1Jz/EJ6qYv6QwmD951SA4jNUNzLpDIR/87jVEyjMD0+ewhEqohvT9EWbJ0gXtneij7Jgb+LqHKEv+OgDD8NyP4JSMfPNREb9H6kNx4uYeh6BIBHGF1NPKKBeJLLUm2LE2MZrf5eHQbe0mJlGozVXBzbacA+dJaYZafKFylE5ntwErJ7mPZNPVXJqdfvPE74RSXW1JIKSsyBpItaZ14ctLc3Tiab//RzSzbr9nCD4NF0QDL/NPMY6nP6o3ljVVC61AZ73+kdMMcg1TUaxjwmgTc/95y8wUyuCNtmkQg==
Received: from BYAPR02CA0051.namprd02.prod.outlook.com (2603:10b6:a03:54::28)
 by PH7PR12MB8054.namprd12.prod.outlook.com (2603:10b6:510:27f::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23; Sun, 22 Sep
 2024 12:50:34 +0000
Received: from CO1PEPF000075F4.namprd03.prod.outlook.com
 (2603:10b6:a03:54:cafe::e6) by BYAPR02CA0051.outlook.office365.com
 (2603:10b6:a03:54::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.30 via Frontend
 Transport; Sun, 22 Sep 2024 12:50:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F4.mail.protection.outlook.com (10.167.249.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 12:50:34 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 05:50:25 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 22 Sep 2024 05:50:24 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 05:50:24 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <kvm@vger.kernel.org>, <nouveau@lists.freedesktop.org>
CC: <alex.williamson@redhat.com>, <kevin.tian@intel.com>, <jgg@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 08/29] nvkm/vgpu: get the size VMMU segment from GSP firmware
Date: Sun, 22 Sep 2024 05:49:30 -0700
Message-ID: <20240922124951.1946072-9-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922124951.1946072-1-zhiw@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F4:EE_|PH7PR12MB8054:EE_
X-MS-Office365-Filtering-Correlation-Id: ff50ec71-dad8-42c8-107b-08dcdb05266b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uk6pmIclN7MROsrQaKUtkrRmnWbjtN4VencYq4it302uuGKAbQaXwY6oR2er?=
 =?us-ascii?Q?ShGBGfd1KDO6J7uXgqa7tvPggCAvXp/DiXTeyqcIjgJxmcLkftTbj/tyC/Aj?=
 =?us-ascii?Q?cWsE4IU1yxt+yT+QcTLHL1tHe9iu4qR4DYiUSVYgv1R0hNQoWHk1U0ZEV6D3?=
 =?us-ascii?Q?xbIxVvqH/Yl/J569pskavz6irQ29aAyQjYXsoePXj2BCQUK5katkOFIXAjVR?=
 =?us-ascii?Q?pFdK86RwGEs5kYU8CtQJ/PwzhfRv/hyvXuOF1HGqWez9/V9bwNyJ+KBKnUaR?=
 =?us-ascii?Q?XgsSsH+mxzRZLkhCF5Q4bxFNDbs+AgDjHSZztS9eg7ZCdpo9G0QCHit+RwbJ?=
 =?us-ascii?Q?WIzMVVvMXZZB1yVMla04tSV5r+J9EzYKeUQbPHyO0b/LAbXhdeC8bje3zoPh?=
 =?us-ascii?Q?bIL+fqxFONtFhdM3ebio+tix+76kP0l7EzgPFUYwVHmCazg2BBPgZelu76S0?=
 =?us-ascii?Q?oL4i28rBWukG7YjiqrROWujdOiLCBwxkS3fpjoY//2bonvWOuxRSw0tOiF9X?=
 =?us-ascii?Q?fAZ1YYgaGnrfjPAL4ulkyhxlIda05Gjx9Zj+VpghVOIsD5goLPrtszWVKIEa?=
 =?us-ascii?Q?y06B1QFq2ej7amoYKXGr6o5pBs5O8XsBH8lKLVsU2O0/uuksf8kPQmXnxQof?=
 =?us-ascii?Q?LbcEmJj04s8M2PVzEUjCuk+4FGUgg6CXnFwFzyOmXfZnj/CStLYeksWAFHMQ?=
 =?us-ascii?Q?rlGJhA2ilpQ6ay95S/khp+k+Rkm1sFFxxGHBPy1WPGPSNqDAjP0ITQmxTWJC?=
 =?us-ascii?Q?iXBC0z0X4frdo1n4VPJvOuitTVtXyd2EOZzNzIHT5J295kSEp5jLUorqcnEU?=
 =?us-ascii?Q?+e+VNNggu+6UI+fx12TzzxHW54IkSoYriiZs94CxEVcMaPgViuCXIpIg5pLr?=
 =?us-ascii?Q?KPj2807N/FaFnK1gGcvz05sPz9f5YLRIcxeDy4RHaZGNjdWLIKCrQcokzsYE?=
 =?us-ascii?Q?wmx8na1j1sdNqRYNyK+0120IGwLgcYJbscXrVL1zHg0KSMSiYXFBl6j1fwCh?=
 =?us-ascii?Q?Fp0fKrgDblnU73EtdDrzOpWLeizq6G0thu45J+lebS/t08mznTpSvtM73i+S?=
 =?us-ascii?Q?KiK7sUyuaNjIt6kv9HPjTsGEsqKc6EDhA871snITXV0mFgfmduj1NrKBmYch?=
 =?us-ascii?Q?1T2dJAZI1pCKnAzY37JMGzkagaP6+XwCI8dpH7qk9cCinN48hnSObyVJoFLj?=
 =?us-ascii?Q?oAGb8DFuDirMn1KY3StfF8/6IdWn1CUkokGX5Vxr2bYDOIK+0Ao+v1Z+TdG8?=
 =?us-ascii?Q?dIEu8kW87G6Zuez12n277bPpORAgKBNgpKJZngKe9q9A5SXlTm1b5FpKhwTW?=
 =?us-ascii?Q?lAGwQn6Z6iU4krbkE59WDGOq62Z9CvLcSAd7dG67QJNk6DfL4cx+dPQU1/Hy?=
 =?us-ascii?Q?oyXInrJ6XnnY2+7XPG2pXar8BcKbJiYv95PEkmi5CtNEL/94oyEZF3r3ly+U?=
 =?us-ascii?Q?D/kgmnUvitCdpqyHPXOJb9ciP3cYxgJG?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 12:50:34.4700 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff50ec71-dad8-42c8-107b-08dcdb05266b
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB8054
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

The allocation of FBMEM for vGPUs requires to be aligned with the size of
VMMU segment. Before reserving the FBMEM for vGPUs, the size of VMMU
segment must be known.

Send a GSP RM control to get VMMU segment size from GSP firmware in vGPU
support initalization.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h  |  2 ++
 .../nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h    | 12 ++++++++
 .../gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c  | 30 +++++++++++++++++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
index 6bc10fa40cde..aaba6d9a88b4 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/vgpu_mgr/vgpu_mgr.h
@@ -15,6 +15,8 @@ struct nvkm_vgpu_mgr {
 
 	const struct nvif_device_impl *dev_impl;
 	struct nvif_device_priv *dev_priv;
+
+	u64 vmmu_segment_size;
 };
 
 bool nvkm_vgpu_mgr_is_supported(struct nvkm_device *device);
diff --git a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
index 29d7a1052142..4d57d8664ee5 100644
--- a/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
+++ b/drivers/gpu/drm/nouveau/include/nvrm/535.113.01/common/sdk/nvidia/inc/ctrl/ctrl2080/ctrl2080gpu.h
@@ -97,4 +97,16 @@ typedef struct NV2080_CTRL_GPU_GET_GID_INFO_PARAMS {
     NvU8  data[NV2080_GPU_MAX_GID_LENGTH];
 } NV2080_CTRL_GPU_GET_GID_INFO_PARAMS;
 
+#define NV2080_CTRL_CMD_GPU_GET_VMMU_SEGMENT_SIZE (0x2080017e)
+
+typedef struct NV2080_CTRL_GPU_GET_VMMU_SEGMENT_SIZE_PARAMS {
+	NV_DECLARE_ALIGNED(NvU64 vmmuSegmentSize, 8);
+} NV2080_CTRL_GPU_GET_VMMU_SEGMENT_SIZE_PARAMS;
+
+#define NV2080_CTRL_GPU_VMMU_SEGMENT_SIZE_32MB     0x02000000U
+#define NV2080_CTRL_GPU_VMMU_SEGMENT_SIZE_64MB     0x04000000U
+#define NV2080_CTRL_GPU_VMMU_SEGMENT_SIZE_128MB    0x08000000U
+#define NV2080_CTRL_GPU_VMMU_SEGMENT_SIZE_256MB    0x10000000U
+#define NV2080_CTRL_GPU_VMMU_SEGMENT_SIZE_512MB    0x20000000U
+
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
index d6ddb1f02275..d2ea5a07cbfc 100644
--- a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vgpu_mgr.c
@@ -4,6 +4,8 @@
 #include <nvif/driverif.h>
 #include <core/pci.h>
 
+#include <subdev/gsp.h>
+
 #include <nvrm/nvtypes.h>
 #include <nvrm/535.113.01/nvidia/inc/kernel/gpu/gsp/gsp_static_config.h>
 
@@ -86,6 +88,26 @@ static int attach_nvkm(struct nvkm_vgpu_mgr *vgpu_mgr)
 	return ret;
 }
 
+static int get_vmmu_segment_size(struct nvkm_vgpu_mgr *mgr)
+{
+	struct nvkm_device *device = mgr->nvkm_dev;
+	struct nvkm_gsp *gsp = device->gsp;
+	NV2080_CTRL_GPU_GET_VMMU_SEGMENT_SIZE_PARAMS *ctrl;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				    NV2080_CTRL_CMD_GPU_GET_VMMU_SEGMENT_SIZE,
+				    sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	nvdev_debug(device, "VMMU segment size: %llx\n", ctrl->vmmuSegmentSize);
+
+	mgr->vmmu_segment_size = ctrl->vmmuSegmentSize;
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
 /**
  * nvkm_vgpu_mgr_init - Initialize the vGPU manager support
  * @device: the nvkm_device pointer
@@ -106,11 +128,19 @@ int nvkm_vgpu_mgr_init(struct nvkm_device *device)
 	if (ret)
 		return ret;
 
+	ret = get_vmmu_segment_size(vgpu_mgr);
+	if (ret)
+		goto err_get_vmmu_seg_size;
+
 	vgpu_mgr->enabled = true;
 	pci_info(nvkm_to_pdev(device),
 		 "NVIDIA vGPU mananger support is enabled.\n");
 
 	return 0;
+
+err_get_vmmu_seg_size:
+	detach_nvkm(vgpu_mgr);
+	return ret;
 }
 
 /**
-- 
2.34.1

