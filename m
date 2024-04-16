Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4945E8A78FB
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 799BE112F49;
	Tue, 16 Apr 2024 23:42:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="hEUdiz4U";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2062.outbound.protection.outlook.com [40.107.237.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E174C112F76
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TyoeLD2vV/TKuIe3E5Jnmf8d/2+rimtzTVIK23UFtxiHzksmjzI3V3yPE8VYHNiHH6nPBOdGgh5XpMNGYDpamYHnmjZ+JARTXrKGxW/2FeCJdI4wAuC8UivrZbmNgMC90eOqyfDVkqV7qA3Iipuu+x3jgdaUng0sk+TnHbj7ID1+73PND03S1Q2KzDFTl3Uy5ztNvBPEa/aX6fVIozEuk0kxeXgkrPHLilBDc2QmOOVfqKWKWMVNWAP962iH8UwzIGFKabtPXcu8sR9RmESm65yt42ZPTtwW1/8g6zxI/jfURByncjZnt5gUE8DKTl8jMsuI9K7NTn/tKsfVIbQLxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q2NTHqkK9RuCda/nniLmH52OnD1IHA0wDu3AcuoRazI=;
 b=nrnNgfoKajG0RP3KT7I4noNfpseeQ7xFuqQ/ckols/h/XNV4CtRhMLlhc53NzhVAd5LutdftS6gXzcpANQY1ljLTq62gqF00G4yIzqjIxnZAQR28H4dy8nJesdi66umbw5m7XdrlS1lLQlfve2v4eEGMA1bRcLSBBw7z/I5qFsqxC+XZq5USLO2flBloVrbZjYxgkgVMgGOQiiIfBD/FGRiDss9YJsE3qBrXQQ4v0CgdYLp6/hCGaR/Wc2z90Qj00zUT9bmiVpZSfwS2t70pW4k7lP90W+UD7J2DVW7G6fi06mT6QF5kfymFc2/bYbQVkGD0XDUCu/e2dheE7ctnLg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q2NTHqkK9RuCda/nniLmH52OnD1IHA0wDu3AcuoRazI=;
 b=hEUdiz4UVzSqxGu5QQQxFQGddD2LJ3k8ECr9LG+xgjkq66KlncgZ/EP9Nu3TLsdSHKCMwUTwACCaF47GyXd4AToiOY+938XsW3aIDIf5BXkiJXEP3+Aic2zwV3bw1DOXuxXq3CnHAWndWXGnKhLvYp0VzSfu3D/j41Aiziz/NEppJCipY4JySoglaiOkKXM0n5H9bcdtJUYNTaF0QkbkJt82XB8Y83IwYTLYQP0JbvmKiZ0JSQj1lB3QLSCJBPAZkkinURzjsjp72FLLmsEppAcURyCF2U6EEWTUZdU2b0A6mrsG/h8qpNEWwVDmtd9C1ijTqKmWUmodqtsU1Z44OQ==
Received: from DS7PR03CA0071.namprd03.prod.outlook.com (2603:10b6:5:3bb::16)
 by CY8PR12MB7219.namprd12.prod.outlook.com (2603:10b6:930:59::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:16 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::3c) by DS7PR03CA0071.outlook.office365.com
 (2603:10b6:5:3bb::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013C.mail.protection.outlook.com (10.167.244.73) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:54 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:53 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 073/156] drm/nouveau/nvif: rework ctrl "pstate user" api
Date: Wed, 17 Apr 2024 09:38:39 +1000
Message-ID: <20240416234002.19509-74-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|CY8PR12MB7219:EE_
X-MS-Office365-Filtering-Correlation-Id: 8ecc8fb4-d40b-4d1a-94df-08dc5e6ed8a2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P0oXfZzhIJz2bmzNUSeBBmsLOEXePWAsFiHl4StTVZUZh0UdtFcF6eGDeCOCp71Tl0wBw/zcNzcOsEFL5oupbhSfxOgYIxzqTngfUPDRopuAIUaeWOfG1Bop08RdLxmvsPiq/Uw9IfoCFSIYnB2NWTWcpBVTodzYNQOywRO/FBQV4haljUPtgYrqDsyE56I2L8oTmaMKe+jorvvb0g8SDhfbt6VCIxFKV8ZVUcfRhSA+2yNOkROdLXDw5NI2fL6EqYnFfaxYS8NhubMMT5iglOY0g7XlTNKIiswDrNbICHJrMyhiISBmjYKqXG4H62ASJaNsEPQ1vkqIW8TK49A/bbSRnAp3B6Lb5h1DmqlK06ZeCElxx2ocl40+hdE1kyJniOrNAaw7SS8QYmtuP21maQuut8sqY4JjdHNW0VhXZmpeqtPBl3jtv78Gv9WDKu7tCmobnmJwMzCb/DXvioZX1s/uavtqes8vo57k+33Yfjt48BjGzshMOaMajc1YIkRBUuGFOUyx5yW81QTLXmlAD0/AA6PvvzkXE7MjqVHJZZkb6HPKmh1Aw6XluPZpw3MecxQg8r9JiuYte6wgKZUlgPceMjVavtT46twCw5q3AN+Pf2CSPloIMrNiQFs48r1qCQvrcImauNw3gU2E0ifKOzFWHjIeMr+H2YybjRkffh0ZzwtsfExM7EdonLcvz4r+zLVZ0wEbBFPwEVn9KM0WQeT1cwcpMoin7yMcs2I5aF2Ri9bJNBo3RmmdHI43ngmb
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(376005)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:15.2151 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8ecc8fb4-d40b-4d1a-94df-08dc5e6ed8a2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7219
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  9 ++++
 drivers/gpu/drm/nouveau/include/nvif/if0001.h | 15 ------
 drivers/gpu/drm/nouveau/nouveau_debugfs.c     | 10 ++--
 drivers/gpu/drm/nouveau/nvkm/device/ctrl.c    | 51 ++++---------------
 4 files changed, 24 insertions(+), 61 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0001.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index bfa22c977323..e22e0347f623 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -23,6 +23,14 @@ struct nvif_mapinfo {
 	u64 length;
 };
 
+struct nvif_control_pstate_user {
+	u8  version;
+#define NVIF_CONTROL_PSTATE_USER_STATE_UNKNOWN                          (-1)
+#define NVIF_CONTROL_PSTATE_USER_STATE_PERFMON                          (-2)
+	s8  ustate; /*  in: pstate identifier */
+	s8  pwrsrc; /*  in: target power source */
+};
+
 struct nvif_control_pstate_attr {
 	u8  version;
 #define NVIF_CONTROL_PSTATE_ATTR_STATE_CURRENT                          (-1)
@@ -57,6 +65,7 @@ struct nvif_control_impl {
 	struct {
 		void (*info)(struct nvif_control_priv *, struct nvif_control_pstate_info *);
 		int  (*attr)(struct nvif_control_priv *, struct nvif_control_pstate_attr *);
+		int  (*user)(struct nvif_control_priv *, struct nvif_control_pstate_user *);
 	} pstate;
 };
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0001.h b/drivers/gpu/drm/nouveau/include/nvif/if0001.h
deleted file mode 100644
index b84da0b7d079..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0001.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0001_H__
-#define __NVIF_IF0001_H__
-
-#define NVIF_CONTROL_PSTATE_USER                                           0x02
-
-struct nvif_control_pstate_user_v0 {
-	__u8  version;
-#define NVIF_CONTROL_PSTATE_USER_V0_STATE_UNKNOWN                          (-1)
-#define NVIF_CONTROL_PSTATE_USER_V0_STATE_PERFMON                          (-2)
-	__s8  ustate; /*  in: pstate identifier */
-	__s8  pwrsrc; /*  in: target power source */
-	__u8  pad03[5];
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_debugfs.c b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
index 33a64f95f64f..837653ca1753 100644
--- a/drivers/gpu/drm/nouveau/nouveau_debugfs.c
+++ b/drivers/gpu/drm/nouveau/nouveau_debugfs.c
@@ -29,7 +29,6 @@
  */
 
 #include <linux/debugfs.h>
-#include <nvif/if0001.h>
 #include "nouveau_debugfs.h"
 #include "nouveau_drv.h"
 
@@ -138,7 +137,7 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 	struct seq_file *m = file->private_data;
 	struct drm_device *drm = m->private;
 	struct nouveau_debugfs *debugfs = nouveau_debugfs(drm);
-	struct nvif_control_pstate_user_v0 args = { .pwrsrc = -EINVAL };
+	struct nvif_control_pstate_user args = { .pwrsrc = -EINVAL };
 	char buf[32] = {}, *tmp, *cur = buf;
 	long value, ret;
 
@@ -164,10 +163,10 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 	}
 
 	if (!strcasecmp(cur, "none"))
-		args.ustate = NVIF_CONTROL_PSTATE_USER_V0_STATE_UNKNOWN;
+		args.ustate = NVIF_CONTROL_PSTATE_USER_STATE_UNKNOWN;
 	else
 	if (!strcasecmp(cur, "auto"))
-		args.ustate = NVIF_CONTROL_PSTATE_USER_V0_STATE_PERFMON;
+		args.ustate = NVIF_CONTROL_PSTATE_USER_STATE_PERFMON;
 	else {
 		ret = kstrtol(cur, 16, &value);
 		if (ret)
@@ -181,8 +180,7 @@ nouveau_debugfs_pstate_set(struct file *file, const char __user *ubuf,
 		return ret;
 	}
 
-	ret = nvif_mthd(&debugfs->ctrl, NVIF_CONTROL_PSTATE_USER,
-			&args, sizeof(args));
+	ret = debugfs->impl->pstate.user(debugfs->priv, &args);
 	pm_runtime_put_autosuspend(drm->dev);
 	if (ret < 0)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
index 8c279cb797e9..4ba1d5934a87 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/ctrl.c
@@ -26,12 +26,6 @@
 #include <core/client.h>
 #include <subdev/clk.h>
 
-#include <nvif/if0001.h>
-#include <nvif/ioctl.h>
-#include <nvif/unpack.h>
-
-#define nvkm_control nvif_control_priv
-
 struct nvif_control_priv {
 	struct nvkm_object object;
 	struct nvkm_device *device;
@@ -121,50 +115,26 @@ nvkm_control_pstate_attr(struct nvif_control_priv *ctrl, struct nvif_control_pst
 }
 
 static int
-nvkm_control_mthd_pstate_user(struct nvkm_control *ctrl, void *data, u32 size)
+nvkm_control_pstate_user(struct nvif_control_priv *ctrl, struct nvif_control_pstate_user *user)
 {
-	union {
-		struct nvif_control_pstate_user_v0 v0;
-	} *args = data;
 	struct nvkm_clk *clk = ctrl->device->clk;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(&ctrl->object, "control pstate user size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(&ctrl->object,
-			   "control pstate user vers %d ustate %d pwrsrc %d\n",
-			   args->v0.version, args->v0.ustate, args->v0.pwrsrc);
-		if (!clk)
-			return -ENODEV;
-	} else
-		return ret;
-
-	if (args->v0.pwrsrc >= 0) {
-		ret |= nvkm_clk_ustate(clk, args->v0.ustate, args->v0.pwrsrc);
+	int ret = 0;
+
+	if (!clk)
+		return -ENODEV;
+
+	if (user->pwrsrc >= 0) {
+		ret |= nvkm_clk_ustate(clk, user->ustate, user->pwrsrc);
 	} else {
-		ret |= nvkm_clk_ustate(clk, args->v0.ustate, 0);
-		ret |= nvkm_clk_ustate(clk, args->v0.ustate, 1);
+		ret |= nvkm_clk_ustate(clk, user->ustate, 0);
+		ret |= nvkm_clk_ustate(clk, user->ustate, 1);
 	}
 
 	return ret;
 }
 
-static int
-nvkm_control_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
-{
-	struct nvif_control_priv *ctrl = container_of(object, typeof(*ctrl), object);
-	switch (mthd) {
-	case NVIF_CONTROL_PSTATE_USER:
-		return nvkm_control_mthd_pstate_user(ctrl, data, size);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
 static const struct nvkm_object_func
 nvkm_control = {
-	.mthd = nvkm_control_mthd,
 };
 
 static void
@@ -180,6 +150,7 @@ nvkm_control_impl = {
 	.del = nvkm_control_del,
 	.pstate.info = nvkm_control_pstate_info,
 	.pstate.attr = nvkm_control_pstate_attr,
+	.pstate.user = nvkm_control_pstate_user,
 };
 
 int
-- 
2.41.0

