Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 722D49B76CB
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21AB410E07A;
	Thu, 31 Oct 2024 08:53:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="UbqaINAQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2064.outbound.protection.outlook.com [40.107.244.64])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D24A10E07A
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:21 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZnBj5Pag4nucHVzeJXmPM1mrlF2yLKfnG83v6vFcvybnCy8B9LY/ABmgS7ph4uznYPrMYhWBUSdIKL2xHhrwIaCveGdfHXKO0/GiQE1RwWg0shMRyKswTzZ3LJDIVpPBXNgrJX2pibBogP+OBxmujJTTQVbtnQQWhXVb/vtBwWUyfeZA+03vnYhIXax4CgT3S5WXKJZT8a2IIYj7r57dEUega5WXatyjHzcTv1AVUGbJBFuEaYOxZQzeG9r3OLNSYmOiu1RuXukNkoR3nHJUWsd8PzSV2GvwcSC87edz5UlMgfvtI1af7gAOdP7roxPWbm7JDtGRhmmEeLzNn6coZA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vGiJNhDt8bEJuPrqoQjoR7D+oFOGlJXsTICuIpdW8wk=;
 b=EN7LJ5guUyP4HDwpm6KUNg0+iDxRyERBrE7lXvdmq3VTKvHvLRkK9p7qRPjb0PB+OvE6l60Rex9Z8GUNUMGkpfeG4D21f3iNPWSUaM4QxSR6n5xAnrb2/wtbnaz42TWdztXGkGgIZuOH3OdoQmXVo3LBdc3jmrRSKa84C6xME7UASjB0SsvGO9miKmpACTv8vq/How0tHK1cpfy0VQ+d6pGKsR58wCLIPwXhi7AMwLbwp4sSgo9IR/aJrJZVOYhdVHrPzZ+BwwbDOH3YlxBPijod5h3j5KFUsoAreHq5chdxQmLz0NWJq3ORtl5UFmFXbrzhs4mBemTst9Sn5nKWOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vGiJNhDt8bEJuPrqoQjoR7D+oFOGlJXsTICuIpdW8wk=;
 b=UbqaINAQfDQaaLLSKe/OR+2QYzkoviqLldHsnfpQ2mPTWsgj4wtZ6ifvnJW5Gkg1sWmVETkE13+puI505jQMjGI50WM5WTE0aolsdU5a6T2HVeGJz84Wu7FZGnpf4SW/5rRNq7B0tZW2fxRBi/YgSoCFlR0Z1Rcq55+Mn3rzNOnm20CNWg2NAHW93ueIIxCRuYXGIn6HSIqWmW+mDR1FFiDpRALD9h0/xexwcFdgHDPCDUPc/YvGMVOhAhd69HieS3OWG6PlOZamAZqwP4N6QUj4oJ0/hfiHUV++5oa7zBHAl63ntkXIU4lc8IKtYSgurdllxjdAh3FPuYsIpv5xoQ==
Received: from MN2PR05CA0003.namprd05.prod.outlook.com (2603:10b6:208:c0::16)
 by CY8PR12MB7657.namprd12.prod.outlook.com (2603:10b6:930:9d::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:18 +0000
Received: from BN2PEPF00004FBD.namprd04.prod.outlook.com
 (2603:10b6:208:c0:cafe::d9) by MN2PR05CA0003.outlook.office365.com
 (2603:10b6:208:c0::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8137.7 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:17 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBD.mail.protection.outlook.com (10.167.243.183) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:17 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:07 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:07 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:06 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 03/15] nvkm: rename "argv" to what it represnts on the GSP
 message send path
Date: Thu, 31 Oct 2024 01:52:38 -0700
Message-ID: <20241031085250.2941482-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBD:EE_|CY8PR12MB7657:EE_
X-MS-Office365-Filtering-Correlation-Id: 50f3e660-c51f-45be-52b3-08dcf98976a4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NuYU1VOcx/FIAG7O1NDTb0Gbvdrom+3gfVPrUd3ROoIl7p2CDlZyaUbXyWMh?=
 =?us-ascii?Q?MByfcC3c+zyHkeOC4sMxp/NT6RKNgZN7GYiv+16F5VQDdCwiy3YbpIwdcyJl?=
 =?us-ascii?Q?PqJafYW6sC41URikx2tGSrJH3nfYKiHX9T/FKWaKVG9xXM5QOGiTltI2R7d9?=
 =?us-ascii?Q?AzCQ+GLzPNkJo1tUPQanJDV9famJbP1Wq5u6DksfsH00boNz5qaRDPhuX+8D?=
 =?us-ascii?Q?qOwDnYGBqCU5w9FRND5PLQY5Tr+dMPV8JOpMDQ0Cwzj9iD8S4DEOAHS0KU3K?=
 =?us-ascii?Q?ivHP2FEkxYNo/hbh7Swzj+T6bhUPyojjgcLZIJ+91iy6+8lP5QEZB+QHIq4r?=
 =?us-ascii?Q?Ifp5Ps3IianQCMFVKk02ct+7ZaYIWdFpSm9sU0M1xSpqtqz4p8dQO6TtzOCu?=
 =?us-ascii?Q?XDh7v0+ZZukTSA4zteB4nKflRC5MFGSxe19VxKkMwKzSn4zpmynBNUa/iTeT?=
 =?us-ascii?Q?MQzHI9j3km333bqRwmtIDBvuTZsMpRmQXKG1FlDAwIQqZHDm73L4OVz0OYFD?=
 =?us-ascii?Q?Etb1pytPxJ/p1YLzMqNYzN8IfjBx2T7oDEUuBeQYWWsGgqTQdj5vofPFvPHu?=
 =?us-ascii?Q?fBTDzANM4jgRLEm6LBdCFw5Jhtp9WtEg4Gl1zUQPQMq2eBStcxUWkuhb/FbQ?=
 =?us-ascii?Q?ADMaLITmsdFnuM/u54yY1LjFIjxR9Nw+9qulgZ++SfiHY8zsu6x1c/hMsqz0?=
 =?us-ascii?Q?+FypkcF1YNFvvb9GNf5ejXHQ8VtRQUwOx93nKVIQpJN+pDEiMsW6V7aQoCEU?=
 =?us-ascii?Q?fcYFxfV9FkG5M2MVTG0uATXhojVwYEXGDYnEAw8jSqSGvw6gYaJgeZugDe5j?=
 =?us-ascii?Q?Kve5mV1xpV6GGEAqckD9aZlBb37vfY+h319FkAGYkXLyuxKxiM3ZpydefU/Y?=
 =?us-ascii?Q?6yMgqIozy66DJYtInYIXnuuo69V23PZGAw6GADNMCI2w00DLTioObhUh/MDH?=
 =?us-ascii?Q?YBVhSq6s2X0YOS9MburK+jW6z4bZIQOxr5ni2diVGcFqGvbRCllou7mU+ssm?=
 =?us-ascii?Q?NSV+sVrqg3bhlXAgFXVTA23ZfcAUfuDa1XELQovbOq+mhNYWhJRXzJ/OOocJ?=
 =?us-ascii?Q?/+6DldEJsx+ZeB1g9P+YOtrHzhQg3xEskbRGqHh8X88ZiagTJ9Xgtt2A72XZ?=
 =?us-ascii?Q?GZ/+nCbJqNnpvH93poijIjiXgKQaI3GBiE7QbYjlI5FR334Bu7XK3Amv5XWM?=
 =?us-ascii?Q?Nqyb5jWTcQ4CnsGm+7rnCjgNkhQiZ9Ayys0lLrSxNv2mNxsYpgozvi2+cJ2d?=
 =?us-ascii?Q?/HMxY1DdYQ88MXXW5eODTV9zsSFe76Ni548KL5RqMViSrTjw5Jp1aQz39FsX?=
 =?us-ascii?Q?yc1z+vI7Hh5PJ5uazKwSHbgoN1Z+gJKaz+IOpoKPOg83EfYBRVeaYzEyqXZ7?=
 =?us-ascii?Q?oUIOkEf0ByIEZ0gvGrAlDs6IJnKVZIOwxFYA99DritSB5CIGGg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:17.4209 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 50f3e660-c51f-45be-52b3-08dcf98976a4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBD.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB7657
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

The name "argv" has different meanings in different functions.

To improve the readability, it's better to refine it to a name that
reflects what it represents.

Rename "repc" to what it represents in the GSP message send path.
Wrap the long container_of() into to_gsp_hdr() to make checkpatch.pl
happy.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index f6ed51921e50..6a9315addacb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -121,6 +121,9 @@ struct r535_gsp_msg {
 
 #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
 
+#define to_gsp_hdr(p, header) \
+	container_of((void *)p, typeof(*header), data)
+
 static int
 r535_rpc_status_to_errno(uint32_t rpc_status)
 {
@@ -203,9 +206,9 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
 }
 
 static int
-r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
+r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 {
-	struct r535_gsp_msg *cmd = container_of(argv, typeof(*cmd), data);
+	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
 	struct r535_gsp_msg *cqe;
 	u32 argc = cmd->checksum;
 	u64 *ptr = (void *)cmd;
@@ -420,10 +423,10 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 }
 
 static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait,
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
 		  u32 gsp_rpc_len)
 {
-	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
 	struct nvfw_gsp_rpc *msg;
 	u32 fn = rpc->function;
 	void *repv = NULL;
@@ -777,11 +780,11 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 }
 
 static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		  u32 gsp_rpc_len)
 {
-	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
-	struct r535_gsp_msg *cmd = container_of((void *)rpc, typeof(*cmd), data);
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
+	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
 	const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
 	const u32 max_rpc_size = max_msg_size - sizeof(*rpc);
 	u32 rpc_size = rpc->length - sizeof(*rpc);
@@ -795,11 +798,11 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
 		rpc->length = sizeof(*rpc) + max_rpc_size;
 		cmd->checksum = rpc->length;
 
-		repv = r535_gsp_rpc_send(gsp, argv, false, 0);
+		repv = r535_gsp_rpc_send(gsp, payload, false, 0);
 		if (IS_ERR(repv))
 			goto done;
 
-		argv += max_rpc_size;
+		payload += max_rpc_size;
 		rpc_size -= max_rpc_size;
 
 		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
@@ -813,13 +816,13 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
 				goto done;
 			}
 
-			memcpy(next, argv, size);
+			memcpy(next, payload, size);
 
 			repv = r535_gsp_rpc_send(gsp, next, false, 0);
 			if (IS_ERR(repv))
 				goto done;
 
-			argv += size;
+			payload += size;
 			rpc_size -= size;
 		}
 
@@ -834,7 +837,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
 			repv = NULL;
 		}
 	} else {
-		repv = r535_gsp_rpc_send(gsp, argv, wait, gsp_rpc_len);
+		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
 	}
 
 done:
-- 
2.34.1

