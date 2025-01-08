Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC49FA06A23
	for <lists+nouveau@lfdr.de>; Thu,  9 Jan 2025 02:17:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D56EA10E446;
	Thu,  9 Jan 2025 01:17:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="tLKTn+IM";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2042.outbound.protection.outlook.com [40.107.243.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3353910E446
 for <nouveau@lists.freedesktop.org>; Thu,  9 Jan 2025 01:17:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XGa7rMIafn/FnLsVpSASQgqHiVsSwNuvE2f6aGbZX70oDpurPNQFkQaCPt1NZyxat+s84+QYxLi6mS8bBBRkEp6KttKObPY73V90N6d/mXhQ7AtmYwhqF4SnrkqMPBASjI4jphlhfi6JhE/vURPnbBWVG/aG5eeekDLYTr/x2xNbYGeNP3pygVRAd4ozAu/IsWLpW6dQLuO0VktjXewUsEktfvq7F31HuEbE/K7JUsiNCWSgwAvE2x49V4K6W00k0lxc/0usShg3TAqemnIKUKGQtEGMWIN0XRW1Faxc38RfBE9zk548HnqY7/VC0ZFibuKsYxc0kXLvyfPAFFoXYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=AGFs42CYp0r0TdEurCC0gosa9yrTtF6uGgBqa9hyuh8=;
 b=W412jbqXoGqShUuSSyeUzjR/t8pDBPytFkS5B37iekpNxemvLjvcXFeEsWOMDPLq9E3TRrjFHY0tVY97Atq+2JXEXA3qxTQRM+VZwaCL4PwVjhRcVSynZPbAUcebeEo7T8Dca1JNSw1WcC2MJQfQ6x/jjhEFLyLB8AVPGiQzCglflQDWKkgBIjQp12r83woTiCn6tet6hlJ8ysG8i8gnZRYLUbQQVkADd2ab9P9GV8rOSCfgNo8krL40VK/I7KWQ5i7Xo3KaDYhpU2uF8AW2O7ZXsNoRVVp5r6dxgWaOZGYhelwdfO6IAhvfhbRyUiruB3xsokAdwR4HTtRi6z5nvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=AGFs42CYp0r0TdEurCC0gosa9yrTtF6uGgBqa9hyuh8=;
 b=tLKTn+IMLLmx5MOqau7ol1NLjkegxjbSHGDZjV0ozsubyoXNGLYs6IIkFDJ2od6CezOJb213n/4QK5ebLkRtgb8oSWGorE9eQqWkeegegZBr45nmkQXTZ1zOeM6Z9KubFXVwGhNSKex9eIvLr3bx0IOobgTDLu2gvV3dKYdhH8QbweJI+F/zj7CV7b9c3c0ZvXdYcXks/W2TmxrSqWmIscc31OqWDYfzPLnwg7ZxbDe8z9EMI4F+xSsXOtzu0iTH6n4/oAoMPA4ZO/qSkHGDehMqFraGwVKjVK/RYxZ/x06kPJ5+077eQRuAqfzkx55LPdwixf5EFeft79vBHYnY/g==
Received: from PH0P220CA0012.NAMP220.PROD.OUTLOOK.COM (2603:10b6:510:d3::35)
 by SJ2PR12MB8873.namprd12.prod.outlook.com (2603:10b6:a03:53d::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.11; Wed, 8 Jan
 2025 23:43:56 +0000
Received: from CY4PEPF0000E9DB.namprd05.prod.outlook.com
 (2603:10b6:510:d3:cafe::39) by PH0P220CA0012.outlook.office365.com
 (2603:10b6:510:d3::35) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8335.11 via Frontend Transport; Wed,
 8 Jan 2025 23:43:56 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000E9DB.mail.protection.outlook.com (10.167.241.74) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8335.7 via Frontend Transport; Wed, 8 Jan 2025 23:43:55 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 15:43:39 -0800
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Wed, 8 Jan 2025
 15:43:38 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Danilo Krummrich <dakr@redhat.com>, Dave Airlie <airlied@redhat.com>,
 <nouveau@lists.freedesktop.org>
Subject: [PATCH] [drm-misc-next] drm/nouveau: fix kernel-doc comments
Date: Wed, 8 Jan 2025 17:43:29 -0600
Message-ID: <20250108234329.842256-1-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000E9DB:EE_|SJ2PR12MB8873:EE_
X-MS-Office365-Filtering-Correlation-Id: c0d32b9f-a84a-4037-b147-08dd303e50fd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|1800799024|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Qad+weK+rMGcbh+HkSiGcQy4IzEdLV8tgHyJ5uLKpfzte+LYEoBzSLUZIYRS?=
 =?us-ascii?Q?ptL4vnXrKj2puUkgDlIWITUkl6GpJD901OcAMXdnytuQKDKlF73rHut/lRTQ?=
 =?us-ascii?Q?/G4Ace1KghgcWLaBb91FA5PXJvpL2S97Yrk1ca/s74C1FUZifT3vsbr1JLS5?=
 =?us-ascii?Q?Zka2SU82BtioDPbxAm3GWihkj5jBK7ddbF8UN1jU1d4hd2xgQyldcmA1b2wr?=
 =?us-ascii?Q?y4Pc8t8Ufdmy/A/614hNXjXai9zUZIGjMMxR02yPGkreRTR7FY0+ISXJjafE?=
 =?us-ascii?Q?s/0OkGBDF46yOh4b8h8erWq8GskdHawZbtZ2288WrnDB3C9mpOUsXVNegI/T?=
 =?us-ascii?Q?+XMGIxj6WX3zkYPN4yZrKX1Ab8RSKCrQr9qWGBwHCDTuDTIM7q6VgVY0Evf9?=
 =?us-ascii?Q?pIeIr04za3nm2nmNfjSjjVhYva+zhQZD/MGRpng61SCG/A1TYGz8ShajuqEV?=
 =?us-ascii?Q?RZyQVpwkRqPHxN/SQFMB69UdrLm65kP1l4dAs92NCjUhka7v0VQur8NnAyxX?=
 =?us-ascii?Q?zv+YMMNTyU07HAfVDA6k0YuM58qZyd2HQ2WBAWGd+YcKWCzQ5gUIThwDPkOr?=
 =?us-ascii?Q?uHc2curOq5GFCWEIIzEP1edG1RyZagA/ke2r836qTznuhRoncHPH2RjwtFS8?=
 =?us-ascii?Q?yciuK6F63b9m3GVDBuB85+yePtiT9wLZdOF54HQ+gGUzf+qLzjaDo9RyMTZU?=
 =?us-ascii?Q?I3MATboHQNi6SwAIXR0SkqPw3mAEWOMfoDlku+NOTHv6hhNAMdV9sd7n71Cw?=
 =?us-ascii?Q?MIoQjCLvI0FzEslo/87KzL88ZEtr0nh+Inhcrq6RfMweA2rnzAPwHQQ62ThO?=
 =?us-ascii?Q?e6IDaY1J4xcCymgdL3JkGHm3tSkK5deWyTA6DoPAeV+5bMPqY5KphHhSqSoM?=
 =?us-ascii?Q?68wVc/QpI/3iEfEVcyU0EJOH5oFmplMtcU9o/IIXJrMIM0rp9TCH68vFOWY6?=
 =?us-ascii?Q?SXRkHxjn8ecMCPJZlJtN2ivVA4he2P89zUwTyVXSlby3ipBwJBLG/c58w2fZ?=
 =?us-ascii?Q?lImSju3lh6Xw2z15drxKDeJaRjNLvsgP/BkqCfRBsT+bclNcBQ6Jb393QMmg?=
 =?us-ascii?Q?GtOTsK3XEKL6uR1DK7Fb26SrmOVxUoK7K8vYjQOab4PpTknT7WuOWI0jvazq?=
 =?us-ascii?Q?uvhxg/goH+xIyF389n3iVzC3GxOclcenoKKSx7I65xRzx3pzFfsemgUI7mPX?=
 =?us-ascii?Q?+6XGHWqyjAg5xLeCuRZo8Psvq7fs9qBbFBE02V2QYXhSbax9sJYqjwubDKf/?=
 =?us-ascii?Q?ias2aN+2zm2JTmz/KpIt6lL4+1P5zVULjcPKQ3vKrYGU3NM186H9AdLnUFSy?=
 =?us-ascii?Q?6jPrgSyPw1BEW8v5U7QE3n5+TVg1MlhBzAcQU5lCuF3BBwpQks3Hdaz6qnn5?=
 =?us-ascii?Q?V7htGc6s9b2kabrEgC7rolmSah9KQO1BpbovB+8i/fPMxg3M1czeWJKOZn+l?=
 =?us-ascii?Q?cNezvVlPlNebNT3sfHtrrvAa/n50lCXv/EsEDmWe8M8u43YxH+PgNaXsfgi0?=
 =?us-ascii?Q?UU+ieMbaVv3ulNA=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(1800799024)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Jan 2025 23:43:55.9668 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: c0d32b9f-a84a-4037-b147-08dd303e50fd
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000E9DB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8873
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

Fix some malformed kernel-doc comments that were added in a recent commit.

Also, kernel-doc does not support global variables, so change those
kernel-doc comments into regular comments.

Fixes: 214c9539cf2f ("drm/nouveau: expose GSP-RM logging buffers via debugfs")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202412310834.jtCJj4oz-lkp@intel.com/

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c          |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 12 ++++++++----
 2 files changed, 9 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 21d2d9ca5e85..8c970f018c00 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -118,7 +118,7 @@ static struct drm_driver driver_platform;
 #ifdef CONFIG_DEBUG_FS
 struct dentry *nouveau_debugfs_root;
 
-/**
+/*
  * gsp_logs - list of nvif_log GSP-RM logging buffers
  *
  * Head pointer to a a list of nvif_log buffers that is created for each GPU
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 58502102926b..10fe2d15b5ce 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1111,7 +1111,7 @@ enum registry_type {
 #define REGISTRY_MAX_KEY_LENGTH		64
 
 /**
- * registry_list_entry - linked list member for a registry key/value
+ * struct registry_list_entry - linked list member for a registry key/value
  * @head: list_head struct
  * @type: dword, binary, or string
  * @klen: the length of name of the key
@@ -1327,7 +1327,7 @@ struct nv_gsp_registry_entries {
 	u32 value;
 };
 
-/**
+/*
  * r535_registry_entries - required registry entries for GSP-RM
  *
  * This array lists registry entries that are required for GSP-RM to
@@ -2101,7 +2101,7 @@ MODULE_PARM_DESC(keep_gsp_logging,
 #define NV_GSP_MSG_EVENT_UCODE_LIBOS_CLASS_PMU		0xf3d722
 
 /**
- * rpc_ucode_libos_print_v1E_08 - RPC payload for libos print buffers
+ * struct rpc_ucode_libos_print_v1e_08 - RPC payload for libos print buffers
  * @ucode_eng_desc: the engine descriptor
  * @libos_print_buf_size: the size of the libos_print_buf[]
  * @libos_print_buf: the actual buffer
@@ -2162,7 +2162,7 @@ r535_gsp_msg_libos_print(void *priv, u32 fn, void *repv, u32 repc)
 }
 
 /**
- * create_debufgs - create a blob debugfs entry
+ * create_debugfs - create a blob debugfs entry
  * @gsp: gsp pointer
  * @name: name of this dentry
  * @blob: blob wrapper
@@ -2788,6 +2788,10 @@ static bool is_empty(const struct debugfs_blob_wrapper *b)
 
 /**
  * r535_gsp_copy_log - preserve the logging buffers in a blob
+ * @parent: the top-level dentry for this GPU
+ * @name: name of debugfs entry to create
+ * @s: original wrapper object to copy from
+ * @t: new wrapper object to copy to
  *
  * When GSP shuts down, the nvkm_gsp object and all its memory is deleted.
  * To preserve the logging buffers, the buffers need to be copied, but only

base-commit: 5d40d4fae6f2fb789f48207a9d4772bbee970b5c
prerequisite-patch-id: dbfbf26b276d26be3dbeec57723c6ac0aec4a102
-- 
2.34.1

