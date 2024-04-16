Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 850FD8A78F8
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0628C112F75;
	Tue, 16 Apr 2024 23:42:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sq3JSAtV";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2059.outbound.protection.outlook.com [40.107.93.59])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51860112F37
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:18 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kc20DiV2XfGG9YiCbqsUuHXFHWr1QBXdvnCWhCf+HVFXH7Krx2Z6EdBbIzx6MqZe6hVOW33ioAA5kFdVUzqONEKDdSuwX1MeBhqb1Sg/iy+p4rXG2s8PiOAZ7tPqiOSyPaoYPq9DYILjlnVGjLmy7kiwqaqKrF4lFeSZmNHKMBIKvLPwR+mUhLj+jVuJ4Ruk6czDq3UY2Za0XBh3FdpLzepKFOoohwAQdJB6sXCMVx9a4BaMA7dUJDoSjPI6QI5a34XdRdepW4/u4mVrNTAKw0uwk6s3/q4/dW3dByj+TqNCIISo7yxql5Ah+g8JsakOTNr27X7fMj0Zomd7EM7+bQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=78uEFfYZ1zjHgI9cKez2q0VB6IdKBPy0iE38VCBiQec=;
 b=aclDj8wVzUri40XyYPadyawvgOuz/TEgzJ+0bP2yIFYyMi1p9y8RA4O0AXH97lF9OljDdfXYTONFH7P4qVGMTx83FyWSozq2Co23T4IVVd3w3jSoAeUcqj/xWU0HygJKjfx3aOBu+GoVdlAOlggEU3lYccqz9EW/Gs2j3oX9jBjVwJt6gx1jwHdMwNr/AX7Qs0lx9B44I8kul10CrLxpAiHobV7GFQr1S5wAVJF9s4vxGtKX+9V9VxfdrQ6jds/Hhue9EDVUPJUJ2aDA0u9YU69sj2VG5btxoqMmvUtAnxObxJanOuS2eE6YfNAKZzHcoqLPza1zwB52VapoSdtlJQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=78uEFfYZ1zjHgI9cKez2q0VB6IdKBPy0iE38VCBiQec=;
 b=sq3JSAtV2Eg9Fq9HAyUHeuFW/x97MZAONeIPN7QIlna0+Dt1gmaz7W2orks93FzfY9Nwff4OcQGzGDh+g/UJATgMxVmhPrX5ksYcLOjHn6iP8Y+TpMsiUmL1Z9M3IgwHLg5p1sOaThgqtxYzrQkdMMZh9sQh02MRUSm4oc8aPG9bBrvZgrdr1CzS1P4wjQ3dmYFa4lfsXRqFJP8G9jwUKplOUHJBnxeVOhjjjAQ+rsR+WiKzdWcpIqi4u+ioD21iSxc9DtzwQGoNYLF/fB+SlbYC0Nu2L6J2PyWsFjYGesC4/5TeaQx/zuPxB49i2Sv5nvDexkaIt6QtdcIyr+tw0Q==
Received: from CH5P222CA0014.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::6)
 by MN0PR12MB5786.namprd12.prod.outlook.com (2603:10b6:208:375::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:13 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::70) by CH5P222CA0014.outlook.office365.com
 (2603:10b6:610:1ee::6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:13 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:13 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:53 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 072/156] drm/nouveau/nvif: rework ctrl "pstate attr" api
Date: Wed, 17 Apr 2024 09:38:38 +1000
Message-ID: <20240416234002.19509-73-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|MN0PR12MB5786:EE_
X-MS-Office365-Filtering-Correlation-Id: 1504feec-7af2-45d6-f826-08dc5e6ed78a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XNoIzo/xYmeqveJPh9nvBm4eTvzFifbi7e1gC0pzQFdUuR/aW/qKBj36M+2dldZzah3Loc6JPVqGsC+lmtUmucCx3rAvJ3fV13SEPsYSUAjX7hN4HFsOzOJ4csGCsgL1KeHbJdPCNILzH+HkC4CX4nC9/9PFQBoddNATsnjVncAT+/8NZmmdx4+hv4LvM9OgyRiMOB0n6lz9xC8hlgRx4ExwSNf7A9IY+JvgzKgdNZ/sUyREddCXhu+8BfKEnBrHyHCTdrZd0Gua+1HM/Jfg5B04uYEODvVgQewFLj9lM+V1eEJjno7M9wWNHZpRdpLBT7dhllDOBCLkgNgFhtro46fnk0Eum5onlUZZ0e+2whG+3Ovx5MvJF15Osos3HkUx2GBo1UA0JfHz6vOrUevfDJd4M+tNTQxwBuPJOnJJmUhOCY5txMQ+Ki2brZmnm9uWHQAQ67/CWDGux+O0RJ1SOOCKVW2i3Z6DrknOdr+pGgetAQdumDbWMIVbaaJo5EHzcXSSqC+mBRoXh7DBptUzc4X4hyCmiLRfUXLlDnlXZDtJZvbzLp414ipGAxohS1RzNM9uIVpq3HhShJKCRNFowosGvzhzj0gJ9bfVHcODF1Jy33jZi87TBaRpBYthgUn1LqsaIkFeo4/DErhdNC/10yYm7C+oNhlZYogCiI68+qdS8RU1jJYHlIFx4IhaagHNhKo0+73CnRpIZU40fQ4Mq1WO+q7BxlQG4xynGBIL3spc08dog2s4KE03yOpOu1RX
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:13.3827 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1504feec-7af2-45d6-f826-08dc5e6ed78a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB5786
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 16 ++++++
 drivers/gpu/drm/nouveau/include/nvif/if0001.h | 17 -------
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 12 ++---
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c    | 49 +++++++------------
 4 files changed, 39 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index ba8b5ff9fcd6..bfa22c977323 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -23,6 +23,21 @@ struct nvif_mapinfo {
 	u64 length;
 };
 
+struct nvif_control_pstate_attr {
+	u8  version;
+#define NVIF_CONTROL_PSTATE_ATTR_STATE_CURRENT                          (-1)
+	s8  state; /*  in: index of pstate to query
+		    * out: pstate identifier
+		    */
+	u8  index; /*  in: index of attribute to query
+		    * out: index of next attribute, or 0 if no more
+		    */
+	u32 min;
+	u32 max;
+	char  name[32];
+	char  unit[16];
+};
+
 struct nvif_control_pstate_info {
 	u8  version;
 	u8  count; /* out: number of power states */
@@ -41,6 +56,7 @@ struct nvif_control_impl {
 
 	struct {
 		void (*info)(struct nvif_control_priv *, struct nvif_control_pstate_info *);
+		int  (*attr)(struct nvif_control_priv *, struct nvif_control_pstate_attr *);
 	} pstate;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0001.h b/drivers/gpu/drm/nouveau/include/nvif/if0001.h
index 9bb955500934..b84da0b7d079 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0001.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0001.h
@@ -2,25 +2,8 @@
 #ifndef __NVIF_IF0001_H__
 #define __NVIF_IF0001_H__
 
-#define NVIF_CONTROL_PSTATE_ATTR                                           0x01
 #define NVIF_CONTROL_PSTATE_USER                                           0x02
 
-struct nvif_control_pstate_attr_v0 {
-	__u8  version;
-#define NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT                          (-1)
-	__s8  state; /*  in: index of pstate to query
-		      * out: pstate identifier
-		      */
-	__u8  index; /*  in: index of attribute to query
-		      * out: index of next attribute, or 0 if no more
-		      */
-	__u8  pad03[5];
-	__u32 min;
-	__u32 max;
-	char  name[32];
-	char  unit[16];
-};
-
 struct nvif_control_pstate_user_v0 {
 	__u8  version;
 #define NVIF_CONTROL_PSTATE_USER_V0_STATE_UNKNOWN                          (-1)
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index caccf99f1d8a..33a64f95f64f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -72,26 +72,23 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *data)
 {
 	struct drm_device *drm = m->private;
 	struct nouveau_debugfs *debugfs = nouveau_debugfs(drm);
-	struct nvif_object *ctrl;
 	struct nvif_control_pstate_info info = {};
 	int ret, i;
 
 	if (!debugfs)
 		return -ENODEV;
 
-	ctrl = &debugfs->ctrl;
 	debugfs->impl->pstate.info(debugfs->priv, &info);
 
 	for (i = 0; i < info.count + 1; i++) {
 		const s32 state = i < info.count ? i :
-			NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT;
-		struct nvif_control_pstate_attr_v0 attr = {
+			NVIF_CONTROL_PSTATE_ATTR_STATE_CURRENT;
+		struct nvif_control_pstate_attr attr = {
 			.state = state,
 			.index = 0,
 		};
 
-		ret = nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_ATTR,
-				&attr, sizeof(attr));
+		ret = debugfs->impl->pstate.attr(debugfs->priv, &attr);
 		if (ret)
 			return ret;
 
@@ -104,8 +101,7 @@ nouveau_debugfs_pstate_get(struct seq_file *m, void *data)
 		attr.index = 0;
 		do {
 			attr.state = state;
-			ret = nvif_mthd(ctrl, NVIF_CONTROL_PSTATE_ATTR,
-					&attr, sizeof(attr));
+			ret = debugfs->impl->pstate.attr(debugfs->priv, &attr);
 			if (ret)
 				return ret;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
index ea38592f5557..8c279cb797e9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
@@ -58,36 +58,26 @@ nvkm_control_pstate_info(struct nvif_control_priv *ctrl, struct nvif_control_pst
 }
 
 static int
-nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
+nvkm_control_pstate_attr(struct nvif_control_priv *ctrl, struct nvif_control_pstate_attr *attr)
 {
-	union {
-		struct nvif_control_pstate_attr_v0 v0;
-	} *args = data;
 	struct nvkm_clk *clk = ctrl->device->clk;
 	const struct nvkm_domain *domain;
 	struct nvkm_pstate *pstate;
 	struct nvkm_cstate *cstate;
 	int i = 0, j = -1;
 	u32 lo, hi;
-	int ret = -ENOSYS;
 
-	nvif_ioctl(&ctrl->object, "control pstate attr size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(&ctrl->object,
-			   "control pstate attr vers %d state %d index %d\n",
-			   args->v0.version, args->v0.state, args->v0.index);
-		if (!clk)
-			return -ENODEV;
-		if (args->v0.state < NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT)
-			return -EINVAL;
-		if (args->v0.state >= clk->state_nr)
-			return -EINVAL;
-	} else
-		return ret;
+	if (!clk)
+		return -ENODEV;
+	if (attr->state < NVIF_CONTROL_PSTATE_ATTR_STATE_CURRENT)
+		return -EINVAL;
+	if (attr->state >= clk->state_nr)
+		return -EINVAL;
+
 	domain = clk->domains;
 
 	while (domain->name != nv_clk_src_max) {
-		if (domain->mname && ++j == args->v0.index)
+		if (domain->mname && ++j == attr->index)
 			break;
 		domain++;
 	}
@@ -95,9 +85,9 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 	if (domain->name == nv_clk_src_max)
 		return -EINVAL;
 
-	if (args->v0.state != NVIF_CONTROL_PSTATE_ATTR_V0_STATE_CURRENT) {
+	if (attr->state != NVIF_CONTROL_PSTATE_ATTR_STATE_CURRENT) {
 		list_for_each_entry(pstate, &clk->states, head) {
-			if (i++ == args->v0.state)
+			if (i++ == attr->state)
 				break;
 		}
 
@@ -108,21 +98,21 @@ nvkm_control_mthd_pstate_attr(struct nvkm_control *ctrl, void *data, u32 size)
 			hi = max(hi, cstate->domain[domain->name]);
 		}
 
-		args->v0.state = pstate->pstate;
+		attr->state = pstate->pstate;
 	} else {
 		lo = max(nvkm_clk_read(clk, domain->name), 0);
 		hi = lo;
 	}
 
-	snprintf(args->v0.name, sizeof(args->v0.name), "%s", domain->mname);
-	snprintf(args->v0.unit, sizeof(args->v0.unit), "MHz");
-	args->v0.min = lo / domain->mdiv;
-	args->v0.max = hi / domain->mdiv;
+	snprintf(attr->name, sizeof(attr->name), "%s", domain->mname);
+	snprintf(attr->unit, sizeof(attr->unit), "MHz");
+	attr->min = lo / domain->mdiv;
+	attr->max = hi / domain->mdiv;
 
-	args->v0.index = 0;
+	attr->index = 0;
 	while ((++domain)->name != nv_clk_src_max) {
 		if (domain->mname) {
-			args->v0.index = ++j;
+			attr->index = ++j;
 			break;
 		}
 	}
@@ -164,8 +154,6 @@ nvkm_control_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 {
 	struct nvif_control_priv *ctrl = container_of(object, typeof(*ctrl), object);
 	switch (mthd) {
-	case NVIF_CONTROL_PSTATE_ATTR:
-		return nvkm_control_mthd_pstate_attr(ctrl, data, size);
 	case NVIF_CONTROL_PSTATE_USER:
 		return nvkm_control_mthd_pstate_user(ctrl, data, size);
 	default:
@@ -191,6 +179,7 @@ static const struct nvif_control_impl
 nvkm_control_impl = {
 	.del = nvkm_control_del,
 	.pstate.info = nvkm_control_pstate_info,
+	.pstate.attr = nvkm_control_pstate_attr,
 };
 
 int
-- 
2.41.0

