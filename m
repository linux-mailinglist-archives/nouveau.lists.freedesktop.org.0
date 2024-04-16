Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4BE7A8A78F2
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C5EF1112F6D;
	Tue, 16 Apr 2024 23:42:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="GNiix0Gn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4C4C5112F69
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mrOaeoWG6oobtXIu+Ifx+riECXUd/IF0MpqpKip3opAA4RNctsL+T5V4+uy23BRia++zYZGRNzsY2P1K5BctMPGP4zDZM9NSdD2fWlYcJuye+hM1Zh0lHl949u8YsRpfihwg22BScsALbnp7ubrWvecaWapqBH64f3qF4FO4Y5vlQM4be+DW9SOJ3EvIAFu13JoV3qSlaykWg72BEnMAtDxu35nIrP9y2tMxETbwrOk1F4PVcHa7luTXPsx30AWDyQQhSvca8mQYFMhcAiQzf+EXLXcuVh9VFSUXtR+ubDKiQdAGgP+bU4Z6uFtr7YnCcu7loAxbvGQ4b4chbnqbEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sOIC1gEMiOwmRyEuYmu0yJ8aGtqG/VgjIROWe/B8Wfs=;
 b=BVUAzPDSZl107ztylqbXZZeNnsB+RdgpYI4ZkBgNDvJg4f7skAoPUl8IZdwFL6x+ZC+wDYQ/vJ+a8S7R3ePLGNc6t62jrEa+XomKcBMcEkTRyEaZe6eW+qfPR7h7dxI7LUPBPq4wtKfC9hmgyGirA9deOsrXM7E+I6QCCVv9b0rWVE1CUKpDaXV0+LPvwhr8MsnTvPuEFhC4GSOI/s8OJq/i8zT2yUKNSAyfgKc6SCACj0XB3lpFTU+qyNf5i3Hfyw78I0lwTS1WwYCKh+9o60XekvF5MWqumWCH7JyElDTFf50kzFai7J3IafYDFl4x5HGpB10l8lLYZk8fBcvXEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sOIC1gEMiOwmRyEuYmu0yJ8aGtqG/VgjIROWe/B8Wfs=;
 b=GNiix0Gn1o3C2GBl3JAW/YgeC9QdWMVYPvT21xK7QTGPqeVQNTYhgOL5t09Y5sI3GAoFT0nEkfZ+GuFtC6apwE2WnleTBqubK78MwiIFS+lcxj9zMVRB6zeGlrgeEWfyURR27ncbBz/CbDHSILvT9uVGRoHyxlv1ctf1sv8zOQazRROW6SVNHDAoO6jNos0yutDUlmVb6MqFvLw2zYk0YIUKtsJYElkYEkgPxF3mdscsd64PEbTrLh5Jk7mV8URVuZZu0eXYCoUKIRcPcX7gJzoG5pFzsSu2tkgje79Nn3Q8+irJT4rtbgdgLq9H9r58BiMK3T4Dnt6d6XpfrKQTmw==
Received: from CH0PR13CA0034.namprd13.prod.outlook.com (2603:10b6:610:b2::9)
 by LV3PR12MB9331.namprd12.prod.outlook.com (2603:10b6:408:219::21) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:10 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::77) by CH0PR13CA0034.outlook.office365.com
 (2603:10b6:610:b2::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.17 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:09 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:09 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:52 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:51 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 071/156] drm/nouveau/nvif: rework ctrl "pstate info" api
Date: Wed, 17 Apr 2024 09:38:37 +1000
Message-ID: <20240416234002.19509-72-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|LV3PR12MB9331:EE_
X-MS-Office365-Filtering-Correlation-Id: 77c1f299-bb5b-48d4-e8a9-08dc5e6ed55a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XdOXjhFyGEA9zoDiWYwL/yKKWnat8sQ/pLicOsmbp9XWe5tr9lL5XXtHHE5qrcCYO6KrxuRtEaXBZ7EbI+2oCQHnFYiXUo5INzmGUyF5Sdj7zT2XpB0hObEmhGtdthCa1H9coRgd7z7slf+tdQPrWkq8blNA5noSzcVnt0ZnUpXhD1Pu0pXqkZO/ul6dZwb2yPDXg0jcOjg/8J1WnrSU8V/GVvwx12PWgfuE9BROEUMAj6QIEEtVfoe0TsaMFCGZiiAC0Osz6vctFTqrQWVQJ7eG6TCjeG9RucqgiBYgKSXoGIhpmWsFhulrwWC4fGkT+LTJz4G5+eK27+naj+0+VE/nJsJbQXrQNIF8gGAvovUUhlUQtv4FNQXJldntNjNNYzN7p4qDCcnUSiEgKpAX9osqGrmyNdtBApF7rpExtHDm1IWTyfkpXWn4mWzGHs8YFwU1vuNF576YKNOwl0N1y2WrIFyWC7sgI+vDkmNzBeFoM1zVIwK30odPkn5vAGrdDykZQCvQ8e88LPD0WfAaxlPUhpNp25BSmyY5bG+OCA3xgS0pyHT8XVG0rAsHDmyzAF/F1Vl8/G+jHBjxVqmsoi6U8dhbEE+ZHj4YH3q/NFiXAA/c+Qt0JqQe+WDvPw2UYbmO9bGSbq0Vs/81W3KxCEXB/2OgUxbIcauzIAyR96acBM+7Wgcd8hURePpDGEWomCeTI7BplhLuPxtoaZM+fVrU72Qu7TYneA9UBmfyAeC4nkbmi04l96/RZ34GkTY4
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:09.7123 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 77c1f299-bb5b-48d4-e8a9-08dc5e6ed55a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9331
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 17 ++++++++
 drivers/gpu/drm/nouveau/include/nvif/if0001.h | 15 -------
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     |  6 +--
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c    | 40 ++++++-------------
 4 files changed, 32 insertions(+), 46 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index aa1061266557..ba8b5ff9fcd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -23,8 +23,25 @@ struct nvif_mapinfo {
 	u64 length;
 };
 
+struct nvif_control_pstate_info {
+	u8  version;
+	u8  count; /* out: number of power states */
+#define NVIF_CONTROL_PSTATE_INFO_USTATE_DISABLE                         (-1)
+#define NVIF_CONTROL_PSTATE_INFO_USTATE_PERFMON                         (-2)
+	s8  ustate_ac; /* out: target pstate index */
+	s8  ustate_dc; /* out: target pstate index */
+	s8  pwrsrc; /* out: current power source */
+#define NVIF_CONTROL_PSTATE_INFO_PSTATE_UNKNOWN                         (-1)
+#define NVIF_CONTROL_PSTATE_INFO_PSTATE_PERFMON                         (-2)
+	s8  pstate; /* out: current pstate index */
+};
+
 struct nvif_control_impl {
 	void (*del)(struct nvif_control_priv *);
+
+	struct {
+		void (*info)(struct nvif_control_priv *, struct nvif_control_pstate_info *);
+	} pstate;
 };
 
 struct nvif_device_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0001.h b/drivers/gpu/drm/nouveau/include/nvif/if0001.h
index 4ced50e98ced..9bb955500934 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0001.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0001.h
@@ -2,24 +2,9 @@
 #ifndef __NVIF_IF0001_H__
 #define __NVIF_IF0001_H__
 
-#define NVIF_CONTROL_PSTATE_INFO                                           0x00
 #define NVIF_CONTROL_PSTATE_ATTR                                           0x01
 #define NVIF_CONTROL_PSTATE_USER                                           0x02
 
-struct nvif_control_pstate_info_v0 {
-	__u8  version;
-	__u8  count; /* out: number of power states */
-#define NVIF_CONTROL_PSTATE_INFO_V0_USTATE_DISABLE                         (-1)
-#define NVIF_CONTROL_PSTATE_INFO_V0_USTATE_PERFMON                         (-2)
-	__s8  ustate_ac; /* out: target pstate index */
-	__s8  ustate_dc; /* out: target pstate index */
-	__s8  pwrsrc; /* out: current power source */
-#define NVIF_CONTROL_PSTATE_INFO_V0_PSTATE_UNKNOWN                         (-1)
-#define NVIF_CONTROL_PSTATE_INFO_V0_PSTATE_PERFMON                         (-2)
-	__s8  pstate; /* out: current pstate index */
-	__u8  pad06[2];
-};
-
 struct nvif_control_pstate_attr_v0 {
 	__u8  version;
 #define NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT                          (-1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index e061ef7a1707..caccf99f1d8a 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -73,16 +73,14 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *data)
 	struct drm_device *drm = m->private;
 	struct nouveau_debugfs *debugfs = nouveau_debugfs(drm);
 	struct nvif_object *ctrl;
-	struct nvif_control_pstate_info_v0 info = {};
+	struct nvif_control_pstate_info info = {};
 	int ret, i;
 
 	if (!debugfs)
 		return -ENODEV;
 
 	ctrl = &debugfs->ctrl;
-	ret = nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_INFO, &info, sizeof(info));
-	if (ret)
-		return ret;
+	debugfs->impl->pstate.info(debugfs->priv, &info);
 
 	for (i = 0; i < info.count + 1; i++) {
 		const s32 state = i < info.count ? i :
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
index 5caa93665cc9..ea38592f5557 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
@@ -37,37 +37,24 @@ struct nvif_control_priv {
 	struct nvkm_device *device;
 };
 
-static int
-nvkm_control_mthd_pstate_info(struct nvkm_control *ctrl, void *data, u32 size)
+static void
+nvkm_control_pstate_info(struct nvif_control_priv *ctrl, struct nvif_control_pstate_info *info)
 {
-	union {
-		struct nvif_control_pstate_info_v0 v0;
-	} *args = data;
 	struct nvkm_clk *clk = ctrl->device->clk;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(&ctrl->object, "control pstate info size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(&ctrl->object, "control pstate info vers %d\n",
-			   args->v0.version);
-	} else
-		return ret;
 
 	if (clk) {
-		args->v0.count = clk->state_nr;
-		args->v0.ustate_ac = clk->ustate_ac;
-		args->v0.ustate_dc = clk->ustate_dc;
-		args->v0.pwrsrc = clk->pwrsrc;
-		args->v0.pstate = clk->pstate;
+		info->count = clk->state_nr;
+		info->ustate_ac = clk->ustate_ac;
+		info->ustate_dc = clk->ustate_dc;
+		info->pwrsrc = clk->pwrsrc;
+		info->pstate = clk->pstate;
 	} else {
-		args->v0.count = 0;
-		args->v0.ustate_ac = NVIF_CONTROL_PSTATE_INFO_V0_USTATE_DISABLE;
-		args->v0.ustate_dc = NVIF_CONTROL_PSTATE_INFO_V0_USTATE_DISABLE;
-		args->v0.pwrsrc = -ENODEV;
-		args->v0.pstate = NVIF_CONTROL_PSTATE_INFO_V0_PSTATE_UNKNOWN;
+		info->count = 0;
+		info->ustate_ac = NVIF_CONTROL_PSTATE_INFO_USTATE_DISABLE;
+		info->ustate_dc = NVIF_CONTROL_PSTATE_INFO_USTATE_DISABLE;
+		info->pwrsrc = -ENODEV;
+		info->pstate = NVIF_CONTROL_PSTATE_INFO_PSTATE_UNKNOWN;
 	}
-
-	return 0;
 }
 
 static int
@@ -177,8 +164,6 @@ nvkm_control_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
 	struct nvif_control_priv *ctrl = container_of(object, typeof(*ctrl), object);
 	switch (mthd) {
-	case NVIF_CONTROL_PSTATE_INFO:
-		return nvkm_control_mthd_pstate_info(ctrl, data, size);
 	case NVIF_CONTROL_PSTATE_ATTR:
 		return nvkm_control_mthd_pstate_attr(ctrl, data, size);
 	case NVIF_CONTROL_PSTATE_USER:
@@ -205,6 +190,7 @@ nvkm_control_del(struct nvif_control_priv *ctrl)
 static const struct nvif_control_impl
 nvkm_control_impl = {
 	.del = nvkm_control_del,
+	.pstate.info = nvkm_control_pstate_info,
 };
 
 int
-- 
2.41.0

