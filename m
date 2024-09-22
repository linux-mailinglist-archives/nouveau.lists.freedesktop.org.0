Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F7999897A3
	for <lists+nouveau@lfdr.de>; Sun, 29 Sep 2024 23:29:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AD81110E16D;
	Sun, 29 Sep 2024 21:28:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="B5ZCfmyM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2059.outbound.protection.outlook.com [40.107.237.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BB3110E059
 for <nouveau@lists.freedesktop.org>; Sun, 22 Sep 2024 12:50:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=o6nFPitkvASkpmgXbalfpnmJjW0Ugpo7LlnA5QRHbNcjo//QYkXQbCUCDXJ9BiNo67qirxmoCRv4E+59RzeA3RcfjhSU6mbhKrk6UyQEVGHiGHJFoaccXvInTh2pOeoFqOPwQ3FMbNU3Z6xAdI/yc/hjJk3kZXa7KGhwIHV/RuwTnU52mJLh84tdue47zhe9LMkYzZDZzqb8QYiVYB9lnbZyQhGhFZ/FMg5X46n+mN9nTZdDP4nOYQREjRyYJqfC1HSeIVIUIS71zbd71xLEJ+CaBa2BWVpJoYGA49FIK+ybXzL4jFppEHMskN+fWpiaOcJZM7AH2615zLpYs6+nUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xlx6+VdPSIwokuwXq4IqUDgeLIIF0Xm6nfSOwGBGbMs=;
 b=K6bTXRE25eqACNBjHcMcvLUX0mODPJLzCf9zqWPahvQQIAu/rxzqfE9MrdPR4QoGWkfzCvhgSyZystFauaGSta40TNJhYBlMjr41VKKjJykSsJPyv34dByubJoPDqOgLzTLp+rMuTvIy0zgKAyj/rDkdxRVWAhgHkbq3Bm5hL7602fYNuXf2MVFayZZtadbHPkyhRwyOckqDfOc7nemt0M3WUbPlE5NH5n0cxZ+W7eiXnGjMdFjatWVc6/HyR7TaEh+Upzjvoa/Ga4oslWZ2ynkiZr4SHmKnM4744+sVBo1huVzGlfB8ZifuLu7F+bRt6FtfDfy44Wu/WjveFZTq1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=vger.kernel.org smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xlx6+VdPSIwokuwXq4IqUDgeLIIF0Xm6nfSOwGBGbMs=;
 b=B5ZCfmyM/aj/foX9PRKyu6TeXiUvUyNdyX+I9nt6wPdZLVLJgoUMcODwAGtZIm2sdUc6fNjhsJWK9I7L0tj1fEYOEE64Ua7r42ZFSGZ6r3W/UnTsrt5Jne+vZk9TMzCcgpGGlI2+hha2VJ5P0Uzt4Y/RQqfBRpMIqvl5a2XYTBGx8MWeG5WiRLgGQlTs3oBGjAIpe8TC4EzekziFsTQpU//fX0nv4FKrQ1nDFpcr1EGYoqxvb3PXTcwYSLXZZEw4JPbb7ZxBzVxhtiussGu6ulQaJmoVLMqlWA/abL9h916gmVYN0zFPkA3rj1MaoF5MCME9vWsG87W6gSWAiYknSw==
Received: from BY1P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:59d::8)
 by CY8PR12MB7585.namprd12.prod.outlook.com (2603:10b6:930:98::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.24; Sun, 22 Sep
 2024 12:50:47 +0000
Received: from CO1PEPF000075F2.namprd03.prod.outlook.com
 (2603:10b6:a03:59d:cafe::52) by BY1P220CA0012.outlook.office365.com
 (2603:10b6:a03:59d::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.23 via Frontend
 Transport; Sun, 22 Sep 2024 12:50:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F2.mail.protection.outlook.com (10.167.249.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7918.13 via Frontend Transport; Sun, 22 Sep 2024 12:50:47 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 22 Sep
 2024 05:50:35 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Sun, 22 Sep 2024 05:50:35 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Sun, 22 Sep 2024 05:50:34 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <kvm@vger.kernel.org>, <nouveau@lists.freedesktop.org>
CC: <alex.williamson@redhat.com>, <kevin.tian@intel.com>, <jgg@nvidia.com>,
 <airlied@gmail.com>, <daniel@ffwll.ch>, <acurrid@nvidia.com>,
 <cjia@nvidia.com>, <smitra@nvidia.com>, <ankita@nvidia.com>,
 <aniketa@nvidia.com>, <kwankhede@nvidia.com>, <targupta@nvidia.com>,
 <zhiw@nvidia.com>, <zhiwang@kernel.org>
Subject: [RFC 24/29] vfio/vgpu_mgr: allocate mgmt heap when creating vGPUs
Date: Sun, 22 Sep 2024 05:49:46 -0700
Message-ID: <20240922124951.1946072-25-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240922124951.1946072-1-zhiw@nvidia.com>
References: <20240922124951.1946072-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F2:EE_|CY8PR12MB7585:EE_
X-MS-Office365-Filtering-Correlation-Id: beeae85f-9860-4ba5-d95c-08dcdb052df6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|82310400026|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?L2ihtOfhlD0d+VgzAZWP1Mb/MVDv07rbEU9iQO+g8FOBbt3iIhHy0NmvLuZ2?=
 =?us-ascii?Q?4MSCwW5NI9ILoyhLhJc094/Ul9c9xRPQxDJm8T5iinFjMUIfW34nILiJMeLh?=
 =?us-ascii?Q?OXpjULqnEIz3M0pZdJ3Ut2hnxxvKzq4bDDNThdM4TF3XxRd/PW7XoQZVulm8?=
 =?us-ascii?Q?4NlwYc+9ReTQwoNbwHKWTpOB719/6LzsrwCmAkmWIfBg8KHK3s00+Wp7nZrp?=
 =?us-ascii?Q?9ujh+WHDyEfle3tNUHq/XlVV9KLMAPVRg5NwES/443+xL61aMgO8oiLVhPuM?=
 =?us-ascii?Q?iVnNWgxShpT+Zo93Zv+oRzVZDGmkn6g8WjPGOSo1ASLUrSa+/kU+3q0TT/vI?=
 =?us-ascii?Q?x/vdJsIJGxZfvTRkR511hnVNcyy6UdHhFXO5f/oCjPAQMQIohGulHiXva4Z8?=
 =?us-ascii?Q?qvRVFnWByLtS4NHQX7WRAdXu0y/h5TdJxx6H6Q6H9i4VjjVswyyL+Ojtz4Sf?=
 =?us-ascii?Q?1p9cndotzRV1he0srbRNKq0gn0OwjAbpbKLwI2xJkeWJlbhQuIUZvk7+Q67w?=
 =?us-ascii?Q?GP0jCFzAmDfJBIBFE7L6X8xTZyoNrOOCK9z5fC3rBukHdhMsthBE1JAgmukG?=
 =?us-ascii?Q?npubeEMv214TL3cyiT73nTQeE1ov8n+2cy1a4ThprHtlc89c8MqGujUqdunw?=
 =?us-ascii?Q?wUN97PuSbS3V0VzSocNDJBSAmbi05Fn1zZmjV4zvOSpL643yZPnrLlEzv1V2?=
 =?us-ascii?Q?sPdPSvaEvcnpfg0HhLMiBwDrbpTf+ml+efCCaQ6AC40R2LwUBxk5qMAYjrzD?=
 =?us-ascii?Q?ogbIhIo2I++QUXFLX/q16x9XCnim6LG73HITQGcZ7sCaWLisOqqzAo1oRGlK?=
 =?us-ascii?Q?dFrZDO2YlMptAGKaaQ6qnBF1MN0CpLRJZr/f10G2DMrcxvy/5Y1tW+eTa9Z8?=
 =?us-ascii?Q?GHzaP2XNsGdko3ytWcR1pXWqyi2WHXS5DcWxnK2d4K9QhOipf8av+j/yGt2n?=
 =?us-ascii?Q?F/+jN3Skg8ga8Caqxp9iDZ4I9T4+spCUf05M+mEDYdBipJfAg8mXIQK0dtgH?=
 =?us-ascii?Q?nbnyYrpFlErtcMGeij6NJFM9rFePyHx4ZnhNF9FpV9QfYhIIpar36ROAA0Ka?=
 =?us-ascii?Q?utd8z/dmJM+NPR7igdClLhDMvOTg8F/iwjSYIU7onacmhqMQEukSrvq8x9m7?=
 =?us-ascii?Q?X0qSEIskFYh+bCWDgJac3tOshEIWM9Z9zJf6F/Gf62JgRpsBLvPE2Cx9QRBv?=
 =?us-ascii?Q?1wULpFknP2gHrZ1yrDrnrzh7FbvADHiyPLyqbBNdzt+j9mqup96SyAAheDXw?=
 =?us-ascii?Q?i/CSWzna0uZsW8Me183eJGwkhUiRXPd2swq6wJe7UyTJN2YEovAuni0F8nOd?=
 =?us-ascii?Q?a4J3Ms3ZFXw7d8Fg8/zOKZJz05wZU+nDz/sMInPwVk/FrZUnfzcDonoUiYFF?=
 =?us-ascii?Q?yo6eQZ+6TuJ9qW3Lt8HjmyIIDbO4MhC8yzVQ5KJurYiGo2DN3h/9x7V10BZt?=
 =?us-ascii?Q?vz2xhORIuVmllDvImweyLdq8LGszydqs?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(82310400026)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Sep 2024 12:50:47.1458 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: beeae85f-9860-4ba5-d95c-08dcdb052df6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F2.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7585
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

The mgmt heap is a block of shared FBMEM between the GSP firmware and
the vGPU host. It is used for supporting vGPU RPCs, vGPU logging.

Creating a vGPU requires allocating a mgmt heap from the FBMEM. The size
of the mgmt heap that a vGPU requires is from the vGPU type.

Acquire the size of mgmt heap from the vGPU type. Allocate the mgmt
heap from nvkm when creating a vGPU.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/vfio/pci/nvidia-vgpu/nvkm.h     |  6 +++++
 drivers/vfio/pci/nvidia-vgpu/vgpu.c     | 32 +++++++++++++++++++++++++
 drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.h |  6 +++++
 3 files changed, 44 insertions(+)

diff --git a/drivers/vfio/pci/nvidia-vgpu/nvkm.h b/drivers/vfio/pci/nvidia-vgpu/nvkm.h
index b95b48edeb03..50b860e7967d 100644
--- a/drivers/vfio/pci/nvidia-vgpu/nvkm.h
+++ b/drivers/vfio/pci/nvidia-vgpu/nvkm.h
@@ -76,4 +76,10 @@ static inline int nvidia_vgpu_mgr_get_handle(struct pci_dev *pdev,
 #define nvidia_vgpu_mgr_free_chids(m, o, s) \
 	m->handle.ops->free_chids(m->handle.pf_drvdata, o, s)
 
+#define nvidia_vgpu_mgr_alloc_fbmem(m, s) \
+	m->handle.ops->alloc_fbmem(m->handle.pf_drvdata, s, false)
+
+#define nvidia_vgpu_mgr_free_fbmem(m, h) \
+	m->handle.ops->free_fbmem(h)
+
 #endif
diff --git a/drivers/vfio/pci/nvidia-vgpu/vgpu.c b/drivers/vfio/pci/nvidia-vgpu/vgpu.c
index c48c22d8fbb4..4b04b13944d5 100644
--- a/drivers/vfio/pci/nvidia-vgpu/vgpu.c
+++ b/drivers/vfio/pci/nvidia-vgpu/vgpu.c
@@ -87,6 +87,31 @@ static int setup_chids(struct nvidia_vgpu *vgpu)
 	return 0;
 }
 
+static void clean_mgmt_heap(struct nvidia_vgpu *vgpu)
+{
+	struct nvidia_vgpu_mgr *vgpu_mgr = vgpu->vgpu_mgr;
+	struct nvidia_vgpu_mgmt *mgmt = &vgpu->mgmt;
+
+	nvidia_vgpu_mgr_free_fbmem(vgpu_mgr, mgmt->heap_mem);
+	mgmt->heap_mem = NULL;
+}
+
+static int setup_mgmt_heap(struct nvidia_vgpu *vgpu)
+{
+	struct nvidia_vgpu_mgr *vgpu_mgr = vgpu->vgpu_mgr;
+	struct nvidia_vgpu_mgmt *mgmt = &vgpu->mgmt;
+	NVA081_CTRL_VGPU_INFO *info =
+		(NVA081_CTRL_VGPU_INFO *)vgpu->vgpu_type;
+	struct nvidia_vgpu_mem *mem;
+
+	mem = nvidia_vgpu_mgr_alloc_fbmem(vgpu_mgr, info->gspHeapSize);
+	if (IS_ERR(mem))
+		return PTR_ERR(mem);
+
+	mgmt->heap_mem = mem;
+	return 0;
+}
+
 /**
  * nvidia_vgpu_mgr_destroy_vgpu - destroy a vGPU instance
  * @vgpu: the vGPU instance going to be destroyed.
@@ -98,6 +123,7 @@ int nvidia_vgpu_mgr_destroy_vgpu(struct nvidia_vgpu *vgpu)
 	if (!atomic_cmpxchg(&vgpu->status, 1, 0))
 		return -ENODEV;
 
+	clean_mgmt_heap(vgpu);
 	clean_chids(vgpu);
 	clean_fbmem_heap(vgpu);
 	unregister_vgpu(vgpu);
@@ -139,10 +165,16 @@ int nvidia_vgpu_mgr_create_vgpu(struct nvidia_vgpu *vgpu, u8 *vgpu_type)
 	if (ret)
 		goto err_setup_chids;
 
+	ret = setup_mgmt_heap(vgpu);
+	if (ret)
+		goto err_setup_mgmt_heap;
+
 	atomic_set(&vgpu->status, 1);
 
 	return 0;
 
+err_setup_mgmt_heap:
+	clean_chids(vgpu);
 err_setup_chids:
 	clean_fbmem_heap(vgpu);
 err_setup_fbmem_heap:
diff --git a/drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.h b/drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.h
index 0918823fdde7..f4ebeadb2b86 100644
--- a/drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.h
+++ b/drivers/vfio/pci/nvidia-vgpu/vgpu_mgr.h
@@ -21,6 +21,11 @@ struct nvidia_vgpu_chid {
 	int num_plugin_channels;
 };
 
+struct nvidia_vgpu_mgmt {
+	struct nvidia_vgpu_mem *heap_mem;
+	/* more to come */
+};
+
 struct nvidia_vgpu {
 	struct mutex lock;
 	atomic_t status;
@@ -32,6 +37,7 @@ struct nvidia_vgpu {
 
 	struct nvidia_vgpu_mem *fbmem_heap;
 	struct nvidia_vgpu_chid chid;
+	struct nvidia_vgpu_mgmt mgmt;
 };
 
 struct nvidia_vgpu_mgr {
-- 
2.34.1

