Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EA2B9897CF
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D170710E375;
	Sun, 29 Sep 2024 21:29:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="mX2CO8vc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2084.outbound.protection.outlook.com [40.107.243.84])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0F9910E059
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 12:50:47 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hS0qOQzu6jBkjB62/70hZURsyJkY/WDnlMC9afTufdMBc9/ZyQ5+w96XLHSfHwhD52Le4ZJg/lqJ9eqfW4Z6S54NGAHtr7nbsAg//UQR8T5q34enC7V2R8VQugv+NIvyq0spcONBdhBNZMRQv97DcJuqceTTXon4tp64qzYHHwg5gwlvZ9tud+nJx3dBoVKmDzy4EvAdfgogaOIE1risG0x5wMey/unqxQSmiM/Ww4jslPaL146GlGyBO1VssRwheXS26Apvf5HX6Tu1WXopmoS8zIxkqTHfJ0uKtG0rmH6hz7s88KcADk4c93RWMxqzW15XnjlJMTiHJcAy1um/uw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x5HwsorBozNLwHCTmg1xs5zMeJsUudr73qdpO0DY4xY=;
 b=gE4NSY+8NGMobnJtQhtQ9USaAqXuqLLgAdmBQctm2t6/+YSg2MF2QCwmXjVpSpqjsWmvunx7DgdioEIqW8pLKey6vxL7rz5Ky13A8HTEV5Efusk9vVzcrkRZrixS47z3rxb72KPYOYvyv0OvlPRWLEuwExTY4DjLhDix/GQOBqFG3Q27ndIf7I9hFaC1ZVB51ZgZmlkk8oJk8828Iqg5hEN3JwZ84XqHQ2uUCmXW9tTav9WbV7qaWI8pug8v0KQSCa+eony/QBLMu2tT+vlaOhHSgNRU+iv7RX8VIDtfojZKZxrdvKcCOMhIePQ+td10g9X7KEvZL55xUglAyVU4hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x5HwsorBozNLwHCTmg1xs5zMeJsUudr73qdpO0DY4xY=;
 b=mX2CO8vcacNG5snVGyyymLFsmGHINbz23rUJc85q6wmgqrGMcClGxyDZAKB02wkOOJK6S/oPst01CJDawrsnRNxs/ovfX4uuzmeLJUCL53QgpA/f2PXwjOMrkVn6kg/oyIgNM8kzdan2gNG0C1YjCQgScfdXe6gd+qouuOw9aGB7JHKARRoQAUHiRZkMpV+HldfY70ggNxPEyM0RR9Q8tR02cnQyO5cLg0zIi6smb4jgKVA/1MnfAk1/NEfp4mkCqyWqqmDguxML9Lv7uz8qeWcBToEmdaMqfmm3zdbt/Xg/Dt/OSzOnNZTfS9nUhBLfdj5aE6j7NTxNV8ufYSlh2w==
Received: from BN8PR04CA0045.namprd04.prod.outlook.com (2603:10b6:408:d4::19)
 by DS0PR12MB6557.namprd12.prod.outlook.com (2603:10b6:8:d3::5) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7982.22; Sun, 22 Sep 2024 12:50:39 +0000
Received: from BL6PEPF00020E5F.namprd04.prod.outlook.com
 (2603:10b6:408:d4:cafe::3a) by BN8PR04CA0045.outlook.office365.com
 (2603:10b6:408:d4::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.28 via Frontend
 Transport; Sun, 22 Sep 2024 12:50:39 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BL6PEPF00020E5F.mail.protection.outlook.com (10.167.249.20) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 12:50:39 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 05:50:27 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 22 Sep 2024 05:50:27 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 05:50:27 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <kvm@vger.kernel.org>, <nouveau@lists.freedesktop.org>
CC: <alex.williamson@redhat.com>, <kevin.tian@intel.com>, <jgg@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 12/29] nvkm/vgpu: introduce GSP RM control interface for vGPU
Date: Sun, 22 Sep 2024 05:49:34 -0700
Message-ID: <20240922124951.1946072-13-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922124951.1946072-1-zhiw@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BL6PEPF00020E5F:EE_|DS0PR12MB6557:EE_
X-MS-Office365-Filtering-Correlation-Id: 44283285-a986-4122-cdae-08dcdb052957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cRFZ9Jyf2MaZCKQS+rUTIhUcfuERrZY6HsVThmGIdZp10AQiTivx80bdlFWf?=
 =?us-ascii?Q?x3Ga3L6HXdHQFX50H/FCjeKPGtWrACDr1sn0pQbVo4LH6I/f0NDIml3oN06q?=
 =?us-ascii?Q?7aYFfVbMQlNzuytDUXRwmF//xcQCzb+knv1BvhycKWlt5Vp5U4vQl81AULEQ?=
 =?us-ascii?Q?F5AGyqQpz25qzOFquez0vyjULFTaC0HPvIelURithh877wcCNiYI1UxPeCgc?=
 =?us-ascii?Q?t2nnmqJH/eU+WDkZ1XPwakFge9FywFwT54IZmFkSMUZ4BEfMK71esrbV0QOU?=
 =?us-ascii?Q?rBAWB3JOYkwajwuDimOU1JwlEmEWzYcCAGv1AC1FPV9Pnqln4tiYwLDEWOpy?=
 =?us-ascii?Q?1qDsThDbiN69Ou7Q9R9BiZFUs/HYfB6oQH+adWpC5NtNiuG9oyu81Hh+IejW?=
 =?us-ascii?Q?BP8H1dFC+81zJOIKShmOPrRH6967413DBd2GrXMvea9jlfxhs6mjffOxtV2o?=
 =?us-ascii?Q?5UytqaZRKMJitaNgZlF+A3ynZ0oPIOevnLNHD6sgNXekQutJ0auWqVZHWK+3?=
 =?us-ascii?Q?T25gWL5g5j69SJqagVMcr/c8pRabQaDmiKmu4CdMBWE9FjEho/0xeFXRcw1u?=
 =?us-ascii?Q?J8G/BnAuEfCx8KRoTxLUVML8KdTqWK+vWofxIEjbh5KxwTfk/u+3axkGYvgA?=
 =?us-ascii?Q?+TaUFgBcPxicUjxXSr/YxU2uLgb/K28edTqO69ek8Lrp312Ckt+gStHvl2hk?=
 =?us-ascii?Q?f6zYtgxkUOgS1kL577fvWe9caZk8KYybkI2n+DUJ1bcHDvziqq0l6enQYrVl?=
 =?us-ascii?Q?Abchum57KiQoV/KWtrbjJ0oZSpm7y+5bMr1W38M9+5x8sg5YXwOYJmgE5KNz?=
 =?us-ascii?Q?aJfs/NmLK1/Do384YwUpC3NcKldVZfv0Ngqn4c16oivbkgvT3Wn1Db86Kj19?=
 =?us-ascii?Q?EeIYXOg246OJi4v6s7YYx6pFy3tmVeKtnNJ0V739nIMP3KkKHkAsKvvy6Vup?=
 =?us-ascii?Q?ReEt8GK7McnE6O4uM7xTpjkYz7eK7C8GH5LV8zb1pdXbNvmiPizYHDHc4n96?=
 =?us-ascii?Q?MxAmQwcU51ON8wG1PDsk2f3hx/OhVBQ85ah+c3vINzgyywm4ba03HbmkbjhL?=
 =?us-ascii?Q?6bnas8zuTCEmpodcRogEXRYD089Ka4e9B2niGmO7tQSp7BVs7+lmwuN4IuY+?=
 =?us-ascii?Q?R7HbhVR5X7clxXeU/ekmL2K0vDtBf1gnmfxJvFivyKr3DQG8HgujTYYVjM8C?=
 =?us-ascii?Q?OoDCmjF+59iCNHUsjPngXKHiX8KnAJT7BPJws7MimtH//HptZE7S4eQ8MxXC?=
 =?us-ascii?Q?wa/TFWRIcVjW2q28xZY9uS6ueYsx2g3U5zwCIWGx18Y9+Qo+hqNZ2LLH8GbC?=
 =?us-ascii?Q?/PT+a+/En/yDNjzqGzyHJPC25uZ0xnM0RwqLlGBTApvk7V1ShomEIMh3cI0G?=
 =?us-ascii?Q?90ErMgzJPLk5kDSLH2emHmMTkUqPImCloPO/3kx/PkSyk3F4UcDXjgmjuVRB?=
 =?us-ascii?Q?nVAZvWWw1nWpyFwqQ0kzUfiCxEGQP4a4?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 12:50:39.2832 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 44283285-a986-4122-cdae-08dcdb052957
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BL6PEPF00020E5F.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB6557
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

To talk to the GSP firmware, the first step is allocating a GSP RM client.
The second step is issuing GSP RM controls to access the functions
provided by GSP firmware.

The NVIDIA vGPU VFIO module requires a GSP RM control interface to obtain
the system information, create and configure vGPUs.

Implement the GSP RM control interface based on nvkm routines.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c | 34 ++++++++++++++++++++
 include/drm/nvkm_vgpu_mgr_vfio.h             |  8 +++++
 2 files changed, 42 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c
index a0b4be2e1085..9732e43a5d6b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c
+++ b/drivers/gpu/drm/nouveau/nvkm/vgpu_mgr/vfio.c
@@ -98,6 +98,36 @@ static u32 get_gsp_client_handle(struct nvidia_vgpu_gsp_client *client)
 	return c->object.handle;
 }
 
+static void *rm_ctrl_get(struct nvidia_vgpu_gsp_client *client, u32 cmd,
+			 u32 size)
+{
+	struct nvkm_gsp_device *device = client->gsp_device;
+
+	return nvkm_gsp_rm_ctrl_get(&device->subdevice, cmd, size);
+}
+
+static int rm_ctrl_wr(struct nvidia_vgpu_gsp_client *client, void *ctrl)
+{
+	struct nvkm_gsp_device *device = client->gsp_device;
+
+	return nvkm_gsp_rm_ctrl_wr(&device->subdevice, ctrl);
+}
+
+static void *rm_ctrl_rd(struct nvidia_vgpu_gsp_client *client, u32 cmd,
+			u32 size)
+{
+	struct nvkm_gsp_device *device = client->gsp_device;
+
+	return nvkm_gsp_rm_ctrl_rd(&device->subdevice, cmd, size);
+}
+
+static void rm_ctrl_done(struct nvidia_vgpu_gsp_client *client, void *ctrl)
+{
+	struct nvkm_gsp_device *device = client->gsp_device;
+
+	nvkm_gsp_rm_ctrl_done(&device->subdevice, ctrl);
+}
+
 struct nvkm_vgpu_mgr_vfio_ops nvkm_vgpu_mgr_vfio_ops = {
 	.vgpu_mgr_is_enabled = vgpu_mgr_is_enabled,
 	.get_handle = get_handle,
@@ -106,6 +136,10 @@ struct nvkm_vgpu_mgr_vfio_ops nvkm_vgpu_mgr_vfio_ops = {
 	.alloc_gsp_client = alloc_gsp_client,
 	.free_gsp_client = free_gsp_client,
 	.get_gsp_client_handle = get_gsp_client_handle,
+	.rm_ctrl_get = rm_ctrl_get,
+	.rm_ctrl_wr = rm_ctrl_wr,
+	.rm_ctrl_rd = rm_ctrl_rd,
+	.rm_ctrl_done = rm_ctrl_done,
 };
 
 /**
diff --git a/include/drm/nvkm_vgpu_mgr_vfio.h b/include/drm/nvkm_vgpu_mgr_vfio.h
index 79920cc27055..29ff9b39d0b2 100644
--- a/include/drm/nvkm_vgpu_mgr_vfio.h
+++ b/include/drm/nvkm_vgpu_mgr_vfio.h
@@ -27,6 +27,14 @@ struct nvkm_vgpu_mgr_vfio_ops {
 				struct nvidia_vgpu_gsp_client *client);
 	void (*free_gsp_client)(struct nvidia_vgpu_gsp_client *client);
 	u32 (*get_gsp_client_handle)(struct nvidia_vgpu_gsp_client *client);
+	void *(*rm_ctrl_get)(struct nvidia_vgpu_gsp_client *client,
+			     u32 cmd, u32 size);
+	int (*rm_ctrl_wr)(struct nvidia_vgpu_gsp_client *client,
+			  void *ctrl);
+	void *(*rm_ctrl_rd)(struct nvidia_vgpu_gsp_client *client, u32 cmd,
+			    u32 size);
+	void (*rm_ctrl_done)(struct nvidia_vgpu_gsp_client *client,
+			     void *ctrl);
 };
 
 struct nvkm_vgpu_mgr_vfio_ops *nvkm_vgpu_mgr_get_vfio_ops(void *handle);
-- 
2.34.1

