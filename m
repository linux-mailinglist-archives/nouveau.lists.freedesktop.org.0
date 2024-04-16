Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 954FF8A790D
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B407112F8C;
	Tue, 16 Apr 2024 23:42:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="m4MJC17g";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E610E112F89
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:38 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K4dyz+795q2q6u2y4xEkVqRI6u+i74poLjiaqaowHhhqgs1HIA3oWto6Dn6frF34kb1DzMQhtccRGjhpFtIT4q2HNUMImU458MxjMIRhl9gJfQXBUZTNkMaPhLWwVP5WWy/2ew84Kr/0tE1uJa61fnsJlzZe3WO7cWw3zZOoz4o1mSomhaihxNSmwnp6Vm9hnHUztgSDrXlzbce5chs1zB9UNLEyCi6HUZStdL7Ty9TIskRMpuCcprgWIizjwYg+6xEjSrd1MFMrv1KATevTgk9AOsNgbXJMMGESpvh6Fes62erETVA3b5eORjC20dkVb0bV3qHWp6IdQvc6k31TKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Nrc7ZHDSucAP7ky8IJc3VhZgmMVArEPafqBI57MDiBA=;
 b=ADM6ZAWTFP+P1NHbdIzmHTmTiyxZ+mwspgV/gEAK9pnmSA87jWWDm/prLhy8ITur3MgRdKGaq6V2YNA9laNuKbAjfGmuaSATveoxiN+hEOMsnsGgT7BdnwEwh1qk/PjUlIRPsKrowSudK8YK0pbyu33LQr5orixSlJniXOmfZpNe9iZvuYQwCBqbCuD2I+PWXt/8MZ6KK0JpFXqS0qm6gr1vsjve8OcTSDodpvR8lcEsIU0VoPBQZATIw84v5NX7RGJwY5wmLrPLBNxB+4xUyrfgsmeuybs0hyhWLjrhW8NEh+2x4p7k1DSqV63s31BkmIOeljumA7U12fT1nqJAVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Nrc7ZHDSucAP7ky8IJc3VhZgmMVArEPafqBI57MDiBA=;
 b=m4MJC17gBZ96Fx9hvnrPbiBJ2xtpO0saopzNmqAZcTfr66O+9fISQ1AnIZTRqfe/lbNsDjQ2wknkM0OT8S4lcjX6H276ogbrjHBYBApV/zBeTBtf4CUDiAYzAiVQzt/Re4fjyBZ0Y6w1ZBkTqCsyiDj66WTvBsj4Rc5oBA6/Sd1GFwPsR/9iZ21NLdUHoB6REq6awP7mqbpe1qJq8DOA6J/qWjs7daRMcmkvHyrJQ5s2cYAUvPrm42lXiKitcTwOtNYHQfJYMmazjFb4rbtKB1dbWMlCYs6yQful67cvxoH010OpeNOAnS47xOwHW6UA/kE9wdQoETm15St5PUsAyA==
Received: from DM6PR12CA0009.namprd12.prod.outlook.com (2603:10b6:5:1c0::22)
 by MW4PR12MB7029.namprd12.prod.outlook.com (2603:10b6:303:1eb::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:34 +0000
Received: from DS2PEPF0000343E.namprd02.prod.outlook.com
 (2603:10b6:5:1c0:cafe::d3) by DM6PR12CA0009.outlook.office365.com
 (2603:10b6:5:1c0::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:34 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343E.mail.protection.outlook.com (10.167.18.41) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:18 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:17 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 094/156] drm/nouveau/nvif: rework vmm "fault replay"/"fault
 cancel" apis
Date: Wed, 17 Apr 2024 09:39:00 +1000
Message-ID: <20240416234002.19509-95-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343E:EE_|MW4PR12MB7029:EE_
X-MS-Office365-Filtering-Correlation-Id: 0441fb3b-459d-40ea-bb73-08dc5e6ee419
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: IS6fabgW8qC8jb8l90dTf86u90ZLqljgCJMBKiKR5z6L0vxqu4iRNDknBI+39oIeKzjkaNOKOU2Kf/tXLviElXT1T4AvrmfkFl43nO5e4a/wHDpvoX5U1tAhFmKPOm38vIg5WwqxEu3TmWSIU60DHZ4p4oqh0QGOjVDn0TPG9CG1WHTL5nvkM0ZfvI0bLGpRqa7agVMQtNItHu4VuwlgmB/2RwvQEIlwZXToYb5czOSxxLhwJyhhQ7kgFQoJlI2PPNaXoBgSJT45e8Bo5U6qzz2Sks9Vx87Sazotm2TOo1RaHvHOn3U1wQh/T6NBsb1oftcWvjyy8SEELiEGKfjxGokCFs+KxNWGX356dXnJGAdazg/gMoYpDhwOC1sEry+/Ob/fHoGT+zFdnz7e2WBQXk01lkTcpT3rc6oDFnveycV6uuFW/0NMyU/nQ5Ho1euL+Lv8O06bIhafOmnc5BVhLPMq63vTt9kraaehRnZv3AmBEr4StUa5sxcdjxkqGm5e8+84z4Dn+bIUEv3T/xHygtA+HGy01kJyYkSE+Ns6TpF4BvQKLbV/U7MW2xGLPjHu9+1615VgPs2mUbjyGD4VxXVvhSk4QgAI2sJbJhVY1AhTFv2dXJRmT7NYSq8zQ16/hd6vm1ig4m4LPkxZRfOLk78PTEEbKxK871EtQpvC8liatRZJfKK6/cks9QJXkYIEJoue7NCdsb4LGM6tCdeswG27ZtNq7MgKpw0ydNKGyctpEgIPQBixcHhhRDxVXdK1
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400014)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:34.4510 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0441fb3b-459d-40ea-bb73-08dc5e6ee419
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7029
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  5 ++
 drivers/gpu/drm/nouveau/include/nvif/if000c.h |  6 --
 drivers/gpu/drm/nouveau/include/nvif/if000d.h |  1 -
 drivers/gpu/drm/nouveau/include/nvif/if500d.h |  1 -
 drivers/gpu/drm/nouveau/include/nvif/if900d.h |  1 -
 drivers/gpu/drm/nouveau/include/nvif/ifb00d.h |  1 -
 drivers/gpu/drm/nouveau/include/nvif/ifc00d.h |  1 -
 drivers/gpu/drm/nouveau/nouveau_dmem.c        |  1 -
 drivers/gpu/drm/nouveau/nouveau_svm.c         | 18 ++---
 drivers/gpu/drm/nouveau/nouveau_uvmm.c        |  1 -
 drivers/gpu/drm/nouveau/nvif/vmm.c            |  2 -
 .../gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c    | 43 ++++++------
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h |  8 ++-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp100.c    | 68 ++++++-------------
 .../drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmgv100.c    |  2 +-
 .../drm/nouveau/nvkm/subdev/mmu/vmmtu102.c    |  2 +-
 17 files changed, 60 insertions(+), 103 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if000c.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index da5760df9e20..425c3184ff14 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -144,6 +144,11 @@ struct nvif_vmm_impl {
 		int (*unmap)(struct nvif_vmm_priv *, u8 shift, u64 addr, u64 size, bool sparse);
 		int (*sparse)(struct nvif_vmm_priv *, u64 addr, u64 size, bool ref);
 	} raw;
+
+	struct {
+		void (*replay)(struct nvif_vmm_priv *);
+		void (*cancel)(struct nvif_vmm_priv *, u64 inst, u8 hub, u8 gpc, u8 client);
+	} fault;
 };
 
 struct nvif_mmu_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000c.h b/drivers/gpu/drm/nouveau/include/nvif/if000c.h
deleted file mode 100644
index 61a12396e996..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if000c.h
+++ /dev/null
@@ -1,6 +0,0 @@
-#ifndef __NVIF_IF000C_H__
-#define __NVIF_IF000C_H__
-
-#define NVIF_VMM_V0_MTHD(i)                                         ((i) + 0x80)
-
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if000d.h b/drivers/gpu/drm/nouveau/include/nvif/if000d.h
index 516ec9401401..dff2d0f838e7 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if000d.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if000d.h
@@ -1,6 +1,5 @@
 #ifndef __NVIF_IF000D_H__
 #define __NVIF_IF000D_H__
-#include "if000c.h"
 
 struct nv04_vmm_vn {
 	/* nvif_vmm_vX ... */
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if500d.h b/drivers/gpu/drm/nouveau/include/nvif/if500d.h
index c29a7822b363..c76433af0489 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if500d.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if500d.h
@@ -1,6 +1,5 @@
 #ifndef __NVIF_IF500D_H__
 #define __NVIF_IF500D_H__
-#include "if000c.h"
 
 struct nv50_vmm_vn {
 	/* nvif_vmm_vX ... */
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if900d.h b/drivers/gpu/drm/nouveau/include/nvif/if900d.h
index 49aa50583c3d..5a9d798b5619 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if900d.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if900d.h
@@ -1,6 +1,5 @@
 #ifndef __NVIF_IF900D_H__
 #define __NVIF_IF900D_H__
-#include "if000c.h"
 
 struct gf100_vmm_vn {
 	/* nvif_vmm_vX ... */
diff --git a/drivers/gpu/drm/nouveau/include/nvif/ifb00d.h b/drivers/gpu/drm/nouveau/include/nvif/ifb00d.h
index a0e419830595..a0aedf37e91d 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/ifb00d.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/ifb00d.h
@@ -1,6 +1,5 @@
 #ifndef __NVIF_IFB00D_H__
 #define __NVIF_IFB00D_H__
-#include "if000c.h"
 
 struct gm200_vmm_vn {
 	/* nvif_vmm_vX ... */
diff --git a/drivers/gpu/drm/nouveau/include/nvif/ifc00d.h b/drivers/gpu/drm/nouveau/include/nvif/ifc00d.h
index 4cabd613a280..700d4ab4369f 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/ifc00d.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/ifc00d.h
@@ -1,6 +1,5 @@
 #ifndef __NVIF_IFC00D_H__
 #define __NVIF_IFC00D_H__
-#include "if000c.h"
 
 struct gp100_vmm_vn {
 	/* nvif_vmm_vX ... */
diff --git a/drivers/gpu/drm/nouveau/nouveau_dmem.c b/drivers/gpu/drm/nouveau/nouveau_dmem.c
index a2369841353d..fed91756846f 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dmem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dmem.c
@@ -30,7 +30,6 @@
 #include <nvif/class.h>
 #include <nvif/object.h>
 #include <nvif/push906f.h>
-#include <nvif/if000c.h>
 #include <nvif/if500b.h>
 #include <nvif/if900b.h>
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_svm.c b/drivers/gpu/drm/nouveau/nouveau_svm.c
index ab02bcc034fb..07fa00afe5b8 100644
--- a/drivers/gpu/drm/nouveau/nouveau_svm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_svm.c
@@ -379,11 +379,10 @@ nouveau_svmm_init(struct drm_device *dev, void *data,
 static void
 nouveau_svm_fault_replay(struct nouveau_svm *svm)
 {
+	struct nvif_vmm *vmm = &svm->drm->cli.vmm.vmm;
+
 	SVM_DBG(svm, "replay");
-	WARN_ON(nvif_object_mthd(&svm->drm->client.vmm.vmm.object,
-				 GP100_VMM_VN_FAULT_REPLAY,
-				 &(struct gp100_vmm_fault_replay_vn) {},
-				 sizeof(struct gp100_vmm_fault_replay_vn)));
+	vmm->impl->fault.replay(vmm->priv);
 }
 
 /* Cancel a replayable fault that could not be handled.
@@ -395,15 +394,10 @@ static void
 nouveau_svm_fault_cancel(struct nouveau_svm *svm,
 			 u64 inst, u8 hub, u8 gpc, u8 client)
 {
+	struct nvif_vmm *vmm = &svm->drm->cli.vmm.vmm;
+
 	SVM_DBG(svm, "cancel %016llx %d %02x %02x", inst, hub, gpc, client);
-	WARN_ON(nvif_object_mthd(&svm->drm->client.vmm.vmm.object,
-				 GP100_VMM_VN_FAULT_CANCEL,
-				 &(struct gp100_vmm_fault_cancel_v0) {
-					.hub = hub,
-					.gpc = gpc,
-					.client = client,
-					.inst = inst,
-				 }, sizeof(struct gp100_vmm_fault_cancel_v0)));
+	vmm->impl->fault.cancel(vmm->priv, inst, hub, gpc, client);
 }
 
 static void
diff --git a/drivers/gpu/drm/nouveau/nouveau_uvmm.c b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
index 1340138bbc13..9589fdd09e22 100644
--- a/drivers/gpu/drm/nouveau/nouveau_uvmm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_uvmm.c
@@ -29,7 +29,6 @@
 #include <nvif/mem.h>
 
 #include <nvif/class.h>
-#include <nvif/if000c.h>
 #include <nvif/if900d.h>
 
 #define NOUVEAU_VA_SPACE_BITS		47 /* FIXME */
diff --git a/drivers/gpu/drm/nouveau/nvif/vmm.c b/drivers/gpu/drm/nouveau/nvif/vmm.c
index c3005f16a32e..fe342828ce8c 100644
--- a/drivers/gpu/drm/nouveau/nvif/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvif/vmm.c
@@ -24,8 +24,6 @@
 #include <nvif/mem.h>
 #include <nvif/printf.h>
 
-#include <nvif/if000c.h>
-
 int
 nvif_vmm_unmap(struct nvif_vmm *vmm, u64 addr)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
index 079ebaa64668..d8e7888410c3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/uvmm.c
@@ -26,9 +26,6 @@
 #include <core/client.h>
 #include <core/memory.h>
 
-#include <nvif/if000c.h>
-#include <nvif/unpack.h>
-
 struct nvif_vmm_priv {
 	struct nvkm_object object;
 	struct nvkm_vmm *vmm;
@@ -49,6 +46,22 @@ nvkm_uvmm_search(struct nvkm_client *client, u64 handle)
 	return nvkm_vmm_ref(container_of(object, struct nvif_vmm_priv, object)->vmm);
 }
 
+static void
+nvkm_uvmm_fault_cancel(struct nvif_vmm_priv *uvmm, u64 inst, u8 hub, u8 gpc, u8 client)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+
+	vmm->func->fault->cancel(vmm, inst, hub, gpc, client);
+}
+
+static void
+nvkm_uvmm_fault_replay(struct nvif_vmm_priv *uvmm)
+{
+	struct nvkm_vmm *vmm = uvmm->vmm;
+
+	vmm->func->fault->replay(vmm);
+}
+
 static int
 nvkm_uvmm_pfnclr(struct nvif_vmm_priv *uvmm, u64 addr, u64 size)
 {
@@ -356,24 +369,6 @@ nvkm_uvmm_raw_sparse(struct nvif_vmm_priv *uvmm, u64 addr, u64 size, bool ref)
 	return nvkm_vmm_raw_sparse(vmm, addr, size, ref);
 }
 
-static int
-nvkm_uvmm_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvif_vmm_priv *uvmm = container_of(object, typeof(*uvmm), object);
-	switch (mthd) {
-	case NVIF_VMM_V0_MTHD(0x00) ... NVIF_VMM_V0_MTHD(0x7f):
-		if (uvmm->vmm->func->mthd) {
-			return uvmm->vmm->func->mthd(uvmm->vmm,
-						     uvmm->object.client,
-						     mthd, argv, argc);
-		}
-		break;
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
 static void
 nvkm_uvmm_del(struct nvif_vmm_priv *uvmm)
 {
@@ -410,7 +405,6 @@ nvkm_uvmm_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uvmm = {
 	.dtor = nvkm_uvmm_dtor,
-	.mthd = nvkm_uvmm_mthd,
 };
 
 int
@@ -469,6 +463,11 @@ nvkm_uvmm_new(struct nvkm_mmu *mmu, u8 type, u64 addr, u64 size, void *argv, u32
 		uvmm->impl.page_nr++;
 	}
 
+	if (uvmm->vmm->replay) {
+		uvmm->impl.fault.replay = nvkm_uvmm_fault_replay;
+		uvmm->impl.fault.cancel = nvkm_uvmm_fault_cancel;
+	}
+
 	*pimpl = &uvmm->impl;
 	*ppriv = uvmm;
 	*pobject = &uvmm->object;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
index f9bc30cdb2b3..a48ba1c95847 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.h
@@ -145,8 +145,10 @@ struct nvkm_vmm_func {
 		     struct nvkm_vmm_map *);
 	void (*flush)(struct nvkm_vmm *, int depth);
 
-	int (*mthd)(struct nvkm_vmm *, struct nvkm_client *,
-		    u32 mthd, void *argv, u32 argc);
+	const struct nvkm_vmm_func_fault {
+		void (*replay)(struct nvkm_vmm *);
+		void (*cancel)(struct nvkm_vmm *, u64 inst, u8 hub, u8 gpc, u8 client);
+	} *fault;
 
 	void (*invalidate_pdb)(struct nvkm_vmm *, u64 addr);
 
@@ -249,7 +251,7 @@ int gp100_vmm_new_(const struct nvkm_vmm_func *,
 int gp100_vmm_join(struct nvkm_vmm *, struct nvkm_memory *);
 int gp100_vmm_valid(struct nvkm_vmm *, void *, u32, struct nvkm_vmm_map *);
 void gp100_vmm_flush(struct nvkm_vmm *, int);
-int gp100_vmm_mthd(struct nvkm_vmm *, struct nvkm_client *, u32, void *, u32);
+extern const struct nvkm_vmm_func_fault gp100_vmm_fault;
 void gp100_vmm_invalidate_pdb(struct nvkm_vmm *, u64 addr);
 
 int gv100_vmm_join(struct nvkm_vmm *, struct nvkm_memory *);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
index bddac77f48f0..36441ffe2e01 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp100.c
@@ -482,70 +482,42 @@ gp100_vmm_valid(struct nvkm_vmm *vmm, void *argv, u32 argc,
 	return 0;
 }
 
-static int
-gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, void *argv, u32 argc)
+static void
+gp100_vmm_fault_cancel(struct nvkm_vmm *vmm, u64 inst, u8 hub, u8 gpc, u8 client)
 {
 	struct nvkm_device *device = vmm->mmu->subdev.device;
-	union {
-		struct gp100_vmm_fault_cancel_v0 v0;
-	} *args = argv;
-	int ret = -ENOSYS;
 	u32 aper;
 
-	if ((ret = nvif_unpack(ret, &argv, &argc, args->v0, 0, 0, false)))
-		return ret;
-
 	/* Translate MaxwellFaultBufferA instance pointer to the same
 	 * format as the NV_GR_FECS_CURRENT_CTX register.
 	 */
-	aper = (args->v0.inst >> 8) & 3;
-	args->v0.inst >>= 12;
-	args->v0.inst |= aper << 28;
-	args->v0.inst |= 0x80000000;
+	aper = (inst >> 8) & 3;
+	inst >>= 12;
+	inst |= aper << 28;
+	inst |= 0x80000000;
 
 	if (!WARN_ON(nvkm_gr_ctxsw_pause(device))) {
-		if (nvkm_gr_ctxsw_inst(device) == args->v0.inst) {
-			gf100_vmm_invalidate(vmm, 0x0000001b
-					     /* CANCEL_TARGETED. */ |
-					     (args->v0.hub    << 20) |
-					     (args->v0.gpc    << 15) |
-					     (args->v0.client << 9));
+		if (nvkm_gr_ctxsw_inst(device) == inst) {
+			gf100_vmm_invalidate(vmm, 0x0000001b /* CANCEL_TARGETED. */ |
+					     (hub    << 20) |
+					     (gpc    << 15) |
+					     (client << 9));
 		}
 		WARN_ON(nvkm_gr_ctxsw_resume(device));
 	}
-
-	return 0;
 }
 
-static int
-gp100_vmm_fault_replay(struct nvkm_vmm *vmm, void *argv, u32 argc)
+static void
+gp100_vmm_fault_replay(struct nvkm_vmm *vmm)
 {
-	union {
-		struct gp100_vmm_fault_replay_vn vn;
-	} *args = argv;
-	int ret = -ENOSYS;
-
-	if (!(ret = nvif_unvers(ret, &argv, &argc, args->vn))) {
-		gf100_vmm_invalidate(vmm, 0x0000000b); /* REPLAY_GLOBAL. */
-	}
-
-	return ret;
+	gf100_vmm_invalidate(vmm, 0x0000000b); /* REPLAY_GLOBAL. */
 }
 
-int
-gp100_vmm_mthd(struct nvkm_vmm *vmm,
-	       struct nvkm_client *client, u32 mthd, void *argv, u32 argc)
-{
-	switch (mthd) {
-	case GP100_VMM_VN_FAULT_REPLAY:
-		return gp100_vmm_fault_replay(vmm, argv, argc);
-	case GP100_VMM_VN_FAULT_CANCEL:
-		return gp100_vmm_fault_cancel(vmm, argv, argc);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
+const struct nvkm_vmm_func_fault
+gp100_vmm_fault = {
+	.replay = gp100_vmm_fault_replay,
+	.cancel = gp100_vmm_fault_cancel,
+};
 
 void
 gp100_vmm_invalidate_pdb(struct nvkm_vmm *vmm, u64 addr)
@@ -583,7 +555,7 @@ gp100_vmm = {
 	.aper = gf100_vmm_aper,
 	.valid = gp100_vmm_valid,
 	.flush = gp100_vmm_flush,
-	.mthd = gp100_vmm_mthd,
+	.fault = &gp100_vmm_fault,
 	.invalidate_pdb = gp100_vmm_invalidate_pdb,
 	.page = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
index e081239afe58..d03f3761cb3f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgp10b.c
@@ -28,7 +28,7 @@ gp10b_vmm = {
 	.aper = gk20a_vmm_aper,
 	.valid = gp100_vmm_valid,
 	.flush = gp100_vmm_flush,
-	.mthd = gp100_vmm_mthd,
+	.fault = &gp100_vmm_fault,
 	.invalidate_pdb = gp100_vmm_invalidate_pdb,
 	.page = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.c
index f0e21f63253a..a68b7dbe8613 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmgv100.c
@@ -66,7 +66,7 @@ gv100_vmm = {
 	.aper = gf100_vmm_aper,
 	.valid = gp100_vmm_valid,
 	.flush = gp100_vmm_flush,
-	.mthd = gp100_vmm_mthd,
+	.fault = &gp100_vmm_fault,
 	.invalidate_pdb = gp100_vmm_invalidate_pdb,
 	.page = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
index 8379e72d77ab..21cd1fe999da 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmmtu102.c
@@ -57,7 +57,7 @@ tu102_vmm = {
 	.aper = gf100_vmm_aper,
 	.valid = gp100_vmm_valid,
 	.flush = tu102_vmm_flush,
-	.mthd = gp100_vmm_mthd,
+	.fault = &gp100_vmm_fault,
 	.page = {
 		{ 47, &gp100_vmm_desc_16[4], NVKM_VMM_PAGE_Sxxx },
 		{ 38, &gp100_vmm_desc_16[3], NVKM_VMM_PAGE_Sxxx },
-- 
2.41.0

