Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C4FD93CD41
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0300D10E252;
	Fri, 26 Jul 2024 04:39:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dbahCvIk";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2086.outbound.protection.outlook.com [40.107.243.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 93AFE10E252
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:17 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HcDcWeDMkCE0n+sxNodmS9QERz6JblYqWq7DWLJUnBhsCi+Vdeq8PGVPAj0JRv7917VvatiJMNPucaI6rthKq42udEN+Fr+ifLg8HWw+dz/elMoSGt23OziVWFBoxvVf09M/kBGWe6Xz7i3qjhf82Bm7LAeLQ8CAzdG13+NOmeC7iGldaDRp5wiNYmo1f6ZHi4fmdd0WQKkLr5zIXcUAxXA2ZB2uKDzt5UkI0dpeV7WGca2u5/mJxQ2D6SQ5r+6RRAGbDzFwMQU13l+QVG+05GXp3KGJ0ej506UR79LDs6JjA/R9Xl9/eKrpRpfOSbbIQGUD4TllSa9SdEpGvEJD8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/c1t4XtANiQWhRQ3ASKSECfuaYrVzER9DPmV1L4JDF0=;
 b=j/iuhdP+PdL6LSi8UwvKi1YcdsN2K0u/F/97nBP1fsDpX7ekwNyV40/guq91FtvuC1BIgV96Pnky1tx2FyLiM1qFhbq4a/J/R+R2pLC0h2AOwMrG88y/085AUUIU9qGlG/vAxE8q0zc08T5p96KXDFb2JaXhNKO+TEi2QLidh5KCHfxyJPNlZuDdXfhHGdJSCH4KRwlvBwecGfwc5y2U8fXnOLOjgmss959lfyJUkOKq43COQyQj6rLfcK9SVPsSlXLyqDnqTYp/bIjhV2+s36LYpuz2QtNdyeCevLsHbW74OUVEQYidfhe3trMm00KkchjMDnoQWgM07Gx9Hha1WA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/c1t4XtANiQWhRQ3ASKSECfuaYrVzER9DPmV1L4JDF0=;
 b=dbahCvIk612nWqNshX3FjMtY+Umz8uOeaKCV/IWuE09FO4Lhdu8HwKvqNMSFJ/uMIRfy/anLTNNRweVs7YvxCCl60Ivm+OFrw+Y9HCK0Hh8RZd4oT8Di61Ah4mWfA+AeKEpm2UkJ4eZaRZS1indbkx01Zmb0P0tA1hvJ1o5vTpKgtK0a9r1z4xsWDv5jmrz7fTXoQVFtuy4TyCTJDMVrd5X2ucvIVy4Ql0FPgQMeBJm9IRWvRgEjFWXnTUUfpOlONN7G5A+1L3/hKOmHoa7IjqWGgtBDDa+ni9/rX2ryyEzk26WvjoA1MLfnyZUkmRG7yrWz4hOdf/rTSMvgqKl83Q==
Received: from DS7PR03CA0245.namprd03.prod.outlook.com (2603:10b6:5:3b3::10)
 by DM4PR12MB6040.namprd12.prod.outlook.com (2603:10b6:8:af::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:11 +0000
Received: from DS1PEPF0001708F.namprd03.prod.outlook.com
 (2603:10b6:5:3b3:cafe::10) by DS7PR03CA0245.outlook.office365.com
 (2603:10b6:5:3b3::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001708F.mail.protection.outlook.com (10.167.17.139) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:02 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:01 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 12/37] drm/nouveau/nvkm: remove perfmon
Date: Fri, 26 Jul 2024 14:38:03 +1000
Message-ID: <20240726043828.58966-13-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240726043828.58966-1-bskeggs@nvidia.com>
References: <20240726043828.58966-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS1PEPF0001708F:EE_|DM4PR12MB6040:EE_
X-MS-Office365-Filtering-Correlation-Id: 4c0e8b12-4350-4460-7000-08dcad2ce543
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ozI94F11kzgQh+13PoQzjVFkozt3cDsu0ibJ9wTGRzHIqPhDxE2Dj8MSCE1z?=
 =?us-ascii?Q?62Ci4NmmXup0fakS1mK1kd20c6ZiKXwpR4IXsaspbi/3ywvliNMo/yjsTBj4?=
 =?us-ascii?Q?2hTuEY4YNEJO+HTz3Gr7N84cruHiLHit572aOTi4lMGLgAl2XnunSAdo8tQz?=
 =?us-ascii?Q?iHGpjpNn1TCdirRc+3aVIQy6KyMBZZRl9qpAbfV5iWsD5Bkr1gFEagiQCuXA?=
 =?us-ascii?Q?/jVwHM0xquD/Q9xDB57Q/ItkD9ywWMHm2wjIN4mY7YoFDTNjm3Ph+klCF3YB?=
 =?us-ascii?Q?LyM+JRhMDZtJgP+FJXnAJcE5+WLLZTTSc+JrU9wh7/HJMavShSEN4W+/s4eB?=
 =?us-ascii?Q?Q/xCYd3e0b8kdP/5pzTOledBj6nKlNmndy9RLhETU5OsGEGn2dYslUcgmYzU?=
 =?us-ascii?Q?Rj68tAVwf4+ebatjn70Vr3BjJ+obJFHJsnxBqRKpeYN76e8LWTtWNS5tmfuh?=
 =?us-ascii?Q?N6hknFP1TJGJX7k+8dc2GAd/bGpvpWb9oPK6debugLmqR1A58A6bF9LAbnaC?=
 =?us-ascii?Q?ghJwNz4Td2p8eP7eLM9tW5PjFUuuPIGq+sIMjuzRscLyXV4PlrvuZ5TCqskJ?=
 =?us-ascii?Q?XW+QmJsxVM3saUvtWRNoodAudTqX0SKzlQsZEzRmmeyJ8DYO2M5QjbzNUQFa?=
 =?us-ascii?Q?lAEoCfx1Khr0dSjYP0kLl3r+Z+IsDZgjx22eczj13tzoB6upWmtndpic/xWn?=
 =?us-ascii?Q?pelIJRJA4LKYKnWEu80IyuUKNAFrHWt1kbh5a6SzVdcwQzN+r1Tw0MCa3brF?=
 =?us-ascii?Q?vLzrvWgRcF/PDUU+5wy9E95eROiItrSuFaulMtKIrkiw3FLHh0Vq7JsCptL7?=
 =?us-ascii?Q?ZxMvU+rn5WnNQhojj7RGaS9GEm0ckW7S//jV6+smBmQ43rJuPa8ytSUTmofl?=
 =?us-ascii?Q?LcUoipG5lPmsUPiwBfvBJvlX0VsxCVJG21V/eEJ0YMttkPLel7TwByyGGFh6?=
 =?us-ascii?Q?3h36kgg+h4flXm71DGXQyo7xf76RWl8MZIBx7s7SCDrCGoK0XcvS2Tc8ovKW?=
 =?us-ascii?Q?OhkE0NulMyk/+fkzuXxmvyCKfCTKDiC8x6mh+Ng+KNSIOtz+L+T1Sj+VM4+9?=
 =?us-ascii?Q?sH6KFt4YfmaG0wmthDZoon9PzTSks2Iz3bwlKhuG9J0SE5Krtu7JZBrTfmX1?=
 =?us-ascii?Q?O8K7afcjI/FlPpUE3GmjaIKRBdeynTFLzZV+iV90LSk+t+8+YXxwIhCr8UmW?=
 =?us-ascii?Q?/5KO2dXUJbI3SEQqPHC+bvnir1h85IPBKWBTUjKNfsFRNsih+d4QGtLP6riX?=
 =?us-ascii?Q?hyTOuVvQv1B30gPOJSn6W4/1sf2O/HSzsBPl4wcZSaqt1yc5o+wGMFXKEKeh?=
 =?us-ascii?Q?NpdOCa6+oPz8h7VkTpcoCnBPsqMPu6GK9RAhgcqAFUmVrt0gAuxSkRDKEUCq?=
 =?us-ascii?Q?PK7mIe/Qyc0HFCRUPTr1EaoDrbeTRDGWajVy/OJaHMLGkW0MnTVi2wYoAXDK?=
 =?us-ascii?Q?3NWE7Htt38f6kxuWCFkYAxRXO60q1v0O?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:11.4929 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4c0e8b12-4350-4460-7000-08dcad2ce543
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001708F.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6040
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

This has never really been used for anything, in part due to never
having reclocking stable enough in general to attempt to implement
dynamic clock changes based on load, etc.

To avoid having to rework its interfaces, remove it entirely.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/class.h  |   3 -
 drivers/gpu/drm/nouveau/include/nvif/if0002.h |  39 -
 drivers/gpu/drm/nouveau/include/nvif/if0003.h |  34 -
 .../drm/nouveau/include/nvkm/core/layout.h    |   1 -
 .../gpu/drm/nouveau/include/nvkm/engine/pm.h  |  29 -
 drivers/gpu/drm/nouveau/nvkm/engine/Kbuild    |   1 -
 .../gpu/drm/nouveau/nvkm/engine/device/base.c |  43 -
 .../gpu/drm/nouveau/nvkm/engine/device/priv.h |   1 -
 .../gpu/drm/nouveau/nvkm/engine/device/user.c |   3 +-
 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild |  11 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c | 867 ------------------
 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c  | 165 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gf100.c    | 243 -----
 .../gpu/drm/nouveau/nvkm/engine/pm/gf100.h    |  20 -
 .../gpu/drm/nouveau/nvkm/engine/pm/gf108.c    |  66 --
 .../gpu/drm/nouveau/nvkm/engine/pm/gf117.c    |  80 --
 .../gpu/drm/nouveau/nvkm/engine/pm/gk104.c    | 184 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gt200.c    | 157 ----
 .../gpu/drm/nouveau/nvkm/engine/pm/gt215.c    | 138 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c | 123 ---
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h |  15 -
 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c | 175 ----
 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h | 105 ---
 23 files changed, 1 insertion(+), 2502 deletions(-)
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0002.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvif/if0003.h
 delete mode 100644 drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
 delete mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h

diff --git a/drivers/gpu/drm/nouveau/include/nvif/class.h b/drivers/gpu/drm/nouveau/include/nvif/class.h
index e668ab1664f0..824e052dcc25 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/class.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/class.h
@@ -7,9 +7,6 @@
 
 #define NVIF_CLASS_CONTROL                           /* if0001.h */ -0x00000001
 
-#define NVIF_CLASS_PERFMON                           /* if0002.h */ -0x00000002
-#define NVIF_CLASS_PERFDOM                           /* if0003.h */ -0x00000003
-
 #define NVIF_CLASS_SW_NV04                           /* if0004.h */ -0x00000004
 #define NVIF_CLASS_SW_NV10                           /* if0005.h */ -0x00000005
 #define NVIF_CLASS_SW_NV50                           /* if0005.h */ -0x00000006
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0002.h b/drivers/gpu/drm/nouveau/include/nvif/if0002.h
deleted file mode 100644
index df2915d6a61e..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0002.h
+++ /dev/null
@@ -1,39 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0002_H__
-#define __NVIF_IF0002_H__
-
-#define NVIF_PERFMON_V0_QUERY_DOMAIN                                       0x00
-#define NVIF_PERFMON_V0_QUERY_SIGNAL                                       0x01
-#define NVIF_PERFMON_V0_QUERY_SOURCE                                       0x02
-
-struct nvif_perfmon_query_domain_v0 {
-	__u8  version;
-	__u8  id;
-	__u8  counter_nr;
-	__u8  iter;
-	__u16 signal_nr;
-	__u8  pad05[2];
-	char  name[64];
-};
-
-struct nvif_perfmon_query_signal_v0 {
-	__u8  version;
-	__u8  domain;
-	__u16 iter;
-	__u8  signal;
-	__u8  source_nr;
-	__u8  pad05[2];
-	char  name[64];
-};
-
-struct nvif_perfmon_query_source_v0 {
-	__u8  version;
-	__u8  domain;
-	__u8  signal;
-	__u8  iter;
-	__u8  pad04[4];
-	__u32 source;
-	__u32 mask;
-	char  name[64];
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0003.h b/drivers/gpu/drm/nouveau/include/nvif/if0003.h
deleted file mode 100644
index 78467da07c37..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvif/if0003.h
+++ /dev/null
@@ -1,34 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVIF_IF0003_H__
-#define __NVIF_IF0003_H__
-
-struct nvif_perfdom_v0 {
-	__u8  version;
-	__u8  domain;
-	__u8  mode;
-	__u8  pad03[1];
-	struct {
-		__u8  signal[4];
-		__u64 source[4][8];
-		__u16 logic_op;
-	} ctr[4];
-};
-
-#define NVIF_PERFDOM_V0_INIT                                               0x00
-#define NVIF_PERFDOM_V0_SAMPLE                                             0x01
-#define NVIF_PERFDOM_V0_READ                                               0x02
-
-struct nvif_perfdom_init {
-};
-
-struct nvif_perfdom_sample {
-};
-
-struct nvif_perfdom_read_v0 {
-	__u8  version;
-	__u8  pad01[7];
-	__u32 ctr[4];
-	__u32 clk;
-	__u8  pad04[4];
-};
-#endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
index 30c17db483cb..9d2a1abf64f9 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/layout.h
@@ -46,7 +46,6 @@ NVKM_LAYOUT_INST(NVKM_ENGINE_NVDEC   , struct nvkm_nvdec   ,    nvdec, 8)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVENC   , struct nvkm_nvenc   ,    nvenc, 3)
 NVKM_LAYOUT_INST(NVKM_ENGINE_NVJPG   , struct nvkm_engine  ,    nvjpg, 8)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_OFA     , struct nvkm_engine  ,      ofa)
-NVKM_LAYOUT_ONCE(NVKM_ENGINE_PM      , struct nvkm_pm      ,       pm)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC     , struct nvkm_engine  ,      sec)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SEC2    , struct nvkm_sec2    ,     sec2)
 NVKM_LAYOUT_ONCE(NVKM_ENGINE_SW      , struct nvkm_sw      ,       sw)
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
deleted file mode 100644
index af89d46ea360..000000000000
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/pm.h
+++ /dev/null
@@ -1,29 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_PM_H__
-#define __NVKM_PM_H__
-#include <core/engine.h>
-
-struct nvkm_pm {
-	const struct nvkm_pm_func *func;
-	struct nvkm_engine engine;
-
-	struct {
-		spinlock_t lock;
-		struct nvkm_object *object;
-	} client;
-
-	struct list_head domains;
-	struct list_head sources;
-	u32 sequence;
-};
-
-int nv40_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int nv50_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int g84_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int gt200_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int gt215_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int gf100_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int gf108_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int gf117_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-int gk104_pm_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_pm **);
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
index bfaaff645a34..2e48b0816670 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/Kbuild
@@ -19,7 +19,6 @@ include $(src)/nvkm/engine/nvenc/Kbuild
 include $(src)/nvkm/engine/nvdec/Kbuild
 include $(src)/nvkm/engine/nvjpg/Kbuild
 include $(src)/nvkm/engine/ofa/Kbuild
-include $(src)/nvkm/engine/pm/Kbuild
 include $(src)/nvkm/engine/sec/Kbuild
 include $(src)/nvkm/engine/sec2/Kbuild
 include $(src)/nvkm/engine/sw/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 006f01e93b9b..6ca1a4cb9cee 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -484,7 +484,6 @@ nv40_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv40_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -510,7 +509,6 @@ nv41_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv40_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -536,7 +534,6 @@ nv42_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv40_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -562,7 +559,6 @@ nv43_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv40_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -588,7 +584,6 @@ nv44_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -614,7 +609,6 @@ nv45_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -640,7 +634,6 @@ nv46_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -666,7 +659,6 @@ nv47_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -692,7 +684,6 @@ nv49_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -718,7 +709,6 @@ nv4a_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -744,7 +734,6 @@ nv4b_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv40_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -770,7 +759,6 @@ nv4c_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -796,7 +784,6 @@ nv4e_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -825,7 +812,6 @@ nv50_chipset = {
 	.fifo     = { 0x00000001, nv50_fifo_new },
 	.gr       = { 0x00000001, nv50_gr_new },
 	.mpeg     = { 0x00000001, nv50_mpeg_new },
-	.pm       = { 0x00000001, nv50_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
 
@@ -851,7 +837,6 @@ nv63_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -877,7 +862,6 @@ nv67_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -903,7 +887,6 @@ nv68_chipset = {
 	.fifo     = { 0x00000001, nv40_fifo_new },
 	.gr       = { 0x00000001, nv44_gr_new },
 	.mpeg     = { 0x00000001, nv44_mpeg_new },
-	.pm       = { 0x00000001, nv40_pm_new },
 	.sw       = { 0x00000001, nv10_sw_new },
 };
 
@@ -934,7 +917,6 @@ nv84_chipset = {
 	.fifo     = { 0x00000001, g84_fifo_new },
 	.gr       = { 0x00000001, g84_gr_new },
 	.mpeg     = { 0x00000001, g84_mpeg_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 	.vp       = { 0x00000001, g84_vp_new },
 };
@@ -966,7 +948,6 @@ nv86_chipset = {
 	.fifo     = { 0x00000001, g84_fifo_new },
 	.gr       = { 0x00000001, g84_gr_new },
 	.mpeg     = { 0x00000001, g84_mpeg_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 	.vp       = { 0x00000001, g84_vp_new },
 };
@@ -998,7 +979,6 @@ nv92_chipset = {
 	.fifo     = { 0x00000001, g84_fifo_new },
 	.gr       = { 0x00000001, g84_gr_new },
 	.mpeg     = { 0x00000001, g84_mpeg_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 	.vp       = { 0x00000001, g84_vp_new },
 };
@@ -1030,7 +1010,6 @@ nv94_chipset = {
 	.fifo     = { 0x00000001, g84_fifo_new },
 	.gr       = { 0x00000001, g84_gr_new },
 	.mpeg     = { 0x00000001, g84_mpeg_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 	.vp       = { 0x00000001, g84_vp_new },
 };
@@ -1062,7 +1041,6 @@ nv96_chipset = {
 	.fifo     = { 0x00000001, g84_fifo_new },
 	.gr       = { 0x00000001, g84_gr_new },
 	.mpeg     = { 0x00000001, g84_mpeg_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 	.vp       = { 0x00000001, g84_vp_new },
 };
@@ -1094,7 +1072,6 @@ nv98_chipset = {
 	.mspdec   = { 0x00000001, g98_mspdec_new },
 	.msppp    = { 0x00000001, g98_msppp_new },
 	.msvld    = { 0x00000001, g98_msvld_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sec      = { 0x00000001, g98_sec_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
@@ -1126,7 +1103,6 @@ nva0_chipset = {
 	.fifo     = { 0x00000001, g84_fifo_new },
 	.gr       = { 0x00000001, gt200_gr_new },
 	.mpeg     = { 0x00000001, g84_mpeg_new },
-	.pm       = { 0x00000001, gt200_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 	.vp       = { 0x00000001, g84_vp_new },
 };
@@ -1161,7 +1137,6 @@ nva3_chipset = {
 	.mspdec   = { 0x00000001, gt215_mspdec_new },
 	.msppp    = { 0x00000001, gt215_msppp_new },
 	.msvld    = { 0x00000001, gt215_msvld_new },
-	.pm       = { 0x00000001, gt215_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
 
@@ -1194,7 +1169,6 @@ nva5_chipset = {
 	.mspdec   = { 0x00000001, gt215_mspdec_new },
 	.msppp    = { 0x00000001, gt215_msppp_new },
 	.msvld    = { 0x00000001, gt215_msvld_new },
-	.pm       = { 0x00000001, gt215_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
 
@@ -1227,7 +1201,6 @@ nva8_chipset = {
 	.mspdec   = { 0x00000001, gt215_mspdec_new },
 	.msppp    = { 0x00000001, gt215_msppp_new },
 	.msvld    = { 0x00000001, gt215_msvld_new },
-	.pm       = { 0x00000001, gt215_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
 
@@ -1258,7 +1231,6 @@ nvaa_chipset = {
 	.mspdec   = { 0x00000001, g98_mspdec_new },
 	.msppp    = { 0x00000001, g98_msppp_new },
 	.msvld    = { 0x00000001, g98_msvld_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sec      = { 0x00000001, g98_sec_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
@@ -1290,7 +1262,6 @@ nvac_chipset = {
 	.mspdec   = { 0x00000001, g98_mspdec_new },
 	.msppp    = { 0x00000001, g98_msppp_new },
 	.msvld    = { 0x00000001, g98_msvld_new },
-	.pm       = { 0x00000001, g84_pm_new },
 	.sec      = { 0x00000001, g98_sec_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
@@ -1324,7 +1295,6 @@ nvaf_chipset = {
 	.mspdec   = { 0x00000001, gt215_mspdec_new },
 	.msppp    = { 0x00000001, gt215_msppp_new },
 	.msvld    = { 0x00000001, mcp89_msvld_new },
-	.pm       = { 0x00000001, gt215_pm_new },
 	.sw       = { 0x00000001, nv50_sw_new },
 };
 
@@ -1360,7 +1330,6 @@ nvc0_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf100_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1396,7 +1365,6 @@ nvc1_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf108_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1432,7 +1400,6 @@ nvc3_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf100_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1468,7 +1435,6 @@ nvc4_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf100_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1504,7 +1470,6 @@ nvc8_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf100_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1540,7 +1505,6 @@ nvce_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf100_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1576,7 +1540,6 @@ nvcf_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf100_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1611,7 +1574,6 @@ nvd7_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf117_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1647,7 +1609,6 @@ nvd9_chipset = {
 	.mspdec   = { 0x00000001, gf100_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gf100_msvld_new },
-	.pm       = { 0x00000001, gf117_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1684,7 +1645,6 @@ nve4_chipset = {
 	.mspdec   = { 0x00000001, gk104_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gk104_msvld_new },
-	.pm       = { 0x00000001, gk104_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1721,7 +1681,6 @@ nve6_chipset = {
 	.mspdec   = { 0x00000001, gk104_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gk104_msvld_new },
-	.pm       = { 0x00000001, gk104_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1758,7 +1717,6 @@ nve7_chipset = {
 	.mspdec   = { 0x00000001, gk104_mspdec_new },
 	.msppp    = { 0x00000001, gf100_msppp_new },
 	.msvld    = { 0x00000001, gk104_msvld_new },
-	.pm       = { 0x00000001, gk104_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
@@ -1783,7 +1741,6 @@ nvea_chipset = {
 	.dma      = { 0x00000001, gf119_dma_new },
 	.fifo     = { 0x00000001, gk20a_fifo_new },
 	.gr       = { 0x00000001, gk20a_gr_new },
-	.pm       = { 0x00000001, gk104_pm_new },
 	.sw       = { 0x00000001, gf100_sw_new },
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
index c182d9c3e4fa..e42b18820a95 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/priv.h
@@ -45,7 +45,6 @@
 #include <engine/nvdec.h>
 #include <engine/nvjpg.h>
 #include <engine/ofa.h>
-#include <engine/pm.h>
 #include <engine/sec.h>
 #include <engine/sec2.h>
 #include <engine/sw.h>
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 7fd4800a876a..d937c54e8dfa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -322,8 +322,7 @@ nvkm_udevice_child_get(struct nvkm_object *object, int index,
 	struct nvkm_engine *engine;
 	u64 mask = (1ULL << NVKM_ENGINE_DMAOBJ) |
 		   (1ULL << NVKM_ENGINE_FIFO) |
-		   (1ULL << NVKM_ENGINE_DISP) |
-		   (1ULL << NVKM_ENGINE_PM);
+		   (1ULL << NVKM_ENGINE_DISP);
 	const struct nvkm_device_oclass *sclass = NULL;
 	int i;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
deleted file mode 100644
index 2cc8a5f6fe0c..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/Kbuild
+++ /dev/null
@@ -1,11 +0,0 @@
-# SPDX-License-Identifier: MIT
-nvkm-y += nvkm/engine/pm/base.o
-nvkm-y += nvkm/engine/pm/nv40.o
-nvkm-y += nvkm/engine/pm/nv50.o
-nvkm-y += nvkm/engine/pm/g84.o
-nvkm-y += nvkm/engine/pm/gt200.o
-nvkm-y += nvkm/engine/pm/gt215.o
-nvkm-y += nvkm/engine/pm/gf100.o
-nvkm-y += nvkm/engine/pm/gf108.o
-nvkm-y += nvkm/engine/pm/gf117.o
-nvkm-y += nvkm/engine/pm/gk104.o
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
deleted file mode 100644
index 131db2645f84..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/base.c
+++ /dev/null
@@ -1,867 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "priv.h"
-
-#include <core/client.h>
-#include <core/option.h>
-
-#include <nvif/class.h>
-#include <nvif/if0002.h>
-#include <nvif/if0003.h>
-#include <nvif/ioctl.h>
-#include <nvif/unpack.h>
-
-static u8
-nvkm_pm_count_perfdom(struct nvkm_pm *pm)
-{
-	struct nvkm_perfdom *dom;
-	u8 domain_nr = 0;
-
-	list_for_each_entry(dom, &pm->domains, head)
-		domain_nr++;
-	return domain_nr;
-}
-
-static u16
-nvkm_perfdom_count_perfsig(struct nvkm_perfdom *dom)
-{
-	u16 signal_nr = 0;
-	int i;
-
-	if (dom) {
-		for (i = 0; i < dom->signal_nr; i++) {
-			if (dom->signal[i].name)
-				signal_nr++;
-		}
-	}
-	return signal_nr;
-}
-
-static struct nvkm_perfdom *
-nvkm_perfdom_find(struct nvkm_pm *pm, int di)
-{
-	struct nvkm_perfdom *dom;
-	int tmp = 0;
-
-	list_for_each_entry(dom, &pm->domains, head) {
-		if (tmp++ == di)
-			return dom;
-	}
-	return NULL;
-}
-
-static struct nvkm_perfsig *
-nvkm_perfsig_find(struct nvkm_pm *pm, u8 di, u8 si, struct nvkm_perfdom **pdom)
-{
-	struct nvkm_perfdom *dom = *pdom;
-
-	if (dom == NULL) {
-		dom = nvkm_perfdom_find(pm, di);
-		if (dom == NULL)
-			return NULL;
-		*pdom = dom;
-	}
-
-	if (!dom->signal[si].name)
-		return NULL;
-	return &dom->signal[si];
-}
-
-static u8
-nvkm_perfsig_count_perfsrc(struct nvkm_perfsig *sig)
-{
-	u8 source_nr = 0, i;
-
-	for (i = 0; i < ARRAY_SIZE(sig->source); i++) {
-		if (sig->source[i])
-			source_nr++;
-	}
-	return source_nr;
-}
-
-static struct nvkm_perfsrc *
-nvkm_perfsrc_find(struct nvkm_pm *pm, struct nvkm_perfsig *sig, int si)
-{
-	struct nvkm_perfsrc *src;
-	bool found = false;
-	int tmp = 1; /* Sources ID start from 1 */
-	u8 i;
-
-	for (i = 0; i < ARRAY_SIZE(sig->source) && sig->source[i]; i++) {
-		if (sig->source[i] == si) {
-			found = true;
-			break;
-		}
-	}
-
-	if (found) {
-		list_for_each_entry(src, &pm->sources, head) {
-			if (tmp++ == si)
-				return src;
-		}
-	}
-
-	return NULL;
-}
-
-static int
-nvkm_perfsrc_enable(struct nvkm_pm *pm, struct nvkm_perfctr *ctr)
-{
-	struct nvkm_subdev *subdev = &pm->engine.subdev;
-	struct nvkm_device *device = subdev->device;
-	struct nvkm_perfdom *dom = NULL;
-	struct nvkm_perfsig *sig;
-	struct nvkm_perfsrc *src;
-	u32 mask, value;
-	int i, j;
-
-	for (i = 0; i < 4; i++) {
-		for (j = 0; j < 8 && ctr->source[i][j]; j++) {
-			sig = nvkm_perfsig_find(pm, ctr->domain,
-						ctr->signal[i], &dom);
-			if (!sig)
-				return -EINVAL;
-
-			src = nvkm_perfsrc_find(pm, sig, ctr->source[i][j]);
-			if (!src)
-				return -EINVAL;
-
-			/* set enable bit if needed */
-			mask = value = 0x00000000;
-			if (src->enable)
-				mask = value = 0x80000000;
-			mask  |= (src->mask << src->shift);
-			value |= ((ctr->source[i][j] >> 32) << src->shift);
-
-			/* enable the source */
-			nvkm_mask(device, src->addr, mask, value);
-			nvkm_debug(subdev,
-				   "enabled source %08x %08x %08x\n",
-				   src->addr, mask, value);
-		}
-	}
-	return 0;
-}
-
-static int
-nvkm_perfsrc_disable(struct nvkm_pm *pm, struct nvkm_perfctr *ctr)
-{
-	struct nvkm_subdev *subdev = &pm->engine.subdev;
-	struct nvkm_device *device = subdev->device;
-	struct nvkm_perfdom *dom = NULL;
-	struct nvkm_perfsig *sig;
-	struct nvkm_perfsrc *src;
-	u32 mask;
-	int i, j;
-
-	for (i = 0; i < 4; i++) {
-		for (j = 0; j < 8 && ctr->source[i][j]; j++) {
-			sig = nvkm_perfsig_find(pm, ctr->domain,
-						ctr->signal[i], &dom);
-			if (!sig)
-				return -EINVAL;
-
-			src = nvkm_perfsrc_find(pm, sig, ctr->source[i][j]);
-			if (!src)
-				return -EINVAL;
-
-			/* unset enable bit if needed */
-			mask = 0x00000000;
-			if (src->enable)
-				mask = 0x80000000;
-			mask |= (src->mask << src->shift);
-
-			/* disable the source */
-			nvkm_mask(device, src->addr, mask, 0);
-			nvkm_debug(subdev, "disabled source %08x %08x\n",
-				   src->addr, mask);
-		}
-	}
-	return 0;
-}
-
-/*******************************************************************************
- * Perfdom object classes
- ******************************************************************************/
-static int
-nvkm_perfdom_init(struct nvkm_perfdom *dom, void *data, u32 size)
-{
-	union {
-		struct nvif_perfdom_init none;
-	} *args = data;
-	struct nvkm_object *object = &dom->object;
-	struct nvkm_pm *pm = dom->perfmon->pm;
-	int ret = -ENOSYS, i;
-
-	nvif_ioctl(object, "perfdom init size %d\n", size);
-	if (!(ret = nvif_unvers(ret, &data, &size, args->none))) {
-		nvif_ioctl(object, "perfdom init\n");
-	} else
-		return ret;
-
-	for (i = 0; i < 4; i++) {
-		if (dom->ctr[i]) {
-			dom->func->init(pm, dom, dom->ctr[i]);
-
-			/* enable sources */
-			nvkm_perfsrc_enable(pm, dom->ctr[i]);
-		}
-	}
-
-	/* start next batch of counters for sampling */
-	dom->func->next(pm, dom);
-	return 0;
-}
-
-static int
-nvkm_perfdom_sample(struct nvkm_perfdom *dom, void *data, u32 size)
-{
-	union {
-		struct nvif_perfdom_sample none;
-	} *args = data;
-	struct nvkm_object *object = &dom->object;
-	struct nvkm_pm *pm = dom->perfmon->pm;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(object, "perfdom sample size %d\n", size);
-	if (!(ret = nvif_unvers(ret, &data, &size, args->none))) {
-		nvif_ioctl(object, "perfdom sample\n");
-	} else
-		return ret;
-	pm->sequence++;
-
-	/* sample previous batch of counters */
-	list_for_each_entry(dom, &pm->domains, head)
-		dom->func->next(pm, dom);
-
-	return 0;
-}
-
-static int
-nvkm_perfdom_read(struct nvkm_perfdom *dom, void *data, u32 size)
-{
-	union {
-		struct nvif_perfdom_read_v0 v0;
-	} *args = data;
-	struct nvkm_object *object = &dom->object;
-	struct nvkm_pm *pm = dom->perfmon->pm;
-	int ret = -ENOSYS, i;
-
-	nvif_ioctl(object, "perfdom read size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object, "perfdom read vers %d\n", args->v0.version);
-	} else
-		return ret;
-
-	for (i = 0; i < 4; i++) {
-		if (dom->ctr[i])
-			dom->func->read(pm, dom, dom->ctr[i]);
-	}
-
-	if (!dom->clk)
-		return -EAGAIN;
-
-	for (i = 0; i < 4; i++)
-		if (dom->ctr[i])
-			args->v0.ctr[i] = dom->ctr[i]->ctr;
-	args->v0.clk = dom->clk;
-	return 0;
-}
-
-static int
-nvkm_perfdom_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
-{
-	struct nvkm_perfdom *dom = nvkm_perfdom(object);
-	switch (mthd) {
-	case NVIF_PERFDOM_V0_INIT:
-		return nvkm_perfdom_init(dom, data, size);
-	case NVIF_PERFDOM_V0_SAMPLE:
-		return nvkm_perfdom_sample(dom, data, size);
-	case NVIF_PERFDOM_V0_READ:
-		return nvkm_perfdom_read(dom, data, size);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
-static void *
-nvkm_perfdom_dtor(struct nvkm_object *object)
-{
-	struct nvkm_perfdom *dom = nvkm_perfdom(object);
-	struct nvkm_pm *pm = dom->perfmon->pm;
-	int i;
-
-	for (i = 0; i < 4; i++) {
-		struct nvkm_perfctr *ctr = dom->ctr[i];
-		if (ctr) {
-			nvkm_perfsrc_disable(pm, ctr);
-			if (ctr->head.next)
-				list_del(&ctr->head);
-		}
-		kfree(ctr);
-	}
-
-	return dom;
-}
-
-static int
-nvkm_perfctr_new(struct nvkm_perfdom *dom, int slot, u8 domain,
-		 struct nvkm_perfsig *signal[4], u64 source[4][8],
-		 u16 logic_op, struct nvkm_perfctr **pctr)
-{
-	struct nvkm_perfctr *ctr;
-	int i, j;
-
-	if (!dom)
-		return -EINVAL;
-
-	ctr = *pctr = kzalloc(sizeof(*ctr), GFP_KERNEL);
-	if (!ctr)
-		return -ENOMEM;
-
-	ctr->domain   = domain;
-	ctr->logic_op = logic_op;
-	ctr->slot     = slot;
-	for (i = 0; i < 4; i++) {
-		if (signal[i]) {
-			ctr->signal[i] = signal[i] - dom->signal;
-			for (j = 0; j < 8; j++)
-				ctr->source[i][j] = source[i][j];
-		}
-	}
-	list_add_tail(&ctr->head, &dom->list);
-
-	return 0;
-}
-
-static const struct nvkm_object_func
-nvkm_perfdom = {
-	.dtor = nvkm_perfdom_dtor,
-	.mthd = nvkm_perfdom_mthd,
-};
-
-static int
-nvkm_perfdom_new_(struct nvkm_perfmon *perfmon,
-		  const struct nvkm_oclass *oclass, void *data, u32 size,
-		  struct nvkm_object **pobject)
-{
-	union {
-		struct nvif_perfdom_v0 v0;
-	} *args = data;
-	struct nvkm_pm *pm = perfmon->pm;
-	struct nvkm_object *parent = oclass->parent;
-	struct nvkm_perfdom *sdom = NULL;
-	struct nvkm_perfctr *ctr[4] = {};
-	struct nvkm_perfdom *dom;
-	int c, s, m;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(parent, "create perfdom size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(parent, "create perfdom vers %d dom %d mode %02x\n",
-			   args->v0.version, args->v0.domain, args->v0.mode);
-	} else
-		return ret;
-
-	for (c = 0; c < ARRAY_SIZE(args->v0.ctr); c++) {
-		struct nvkm_perfsig *sig[4] = {};
-		u64 src[4][8] = {};
-
-		for (s = 0; s < ARRAY_SIZE(args->v0.ctr[c].signal); s++) {
-			sig[s] = nvkm_perfsig_find(pm, args->v0.domain,
-						   args->v0.ctr[c].signal[s],
-						   &sdom);
-			if (args->v0.ctr[c].signal[s] && !sig[s])
-				return -EINVAL;
-
-			for (m = 0; m < 8; m++) {
-				src[s][m] = args->v0.ctr[c].source[s][m];
-				if (src[s][m] && !nvkm_perfsrc_find(pm, sig[s],
-							            src[s][m]))
-					return -EINVAL;
-			}
-		}
-
-		ret = nvkm_perfctr_new(sdom, c, args->v0.domain, sig, src,
-				       args->v0.ctr[c].logic_op, &ctr[c]);
-		if (ret)
-			return ret;
-	}
-
-	if (!sdom)
-		return -EINVAL;
-
-	if (!(dom = kzalloc(sizeof(*dom), GFP_KERNEL)))
-		return -ENOMEM;
-	nvkm_object_ctor(&nvkm_perfdom, oclass, &dom->object);
-	dom->perfmon = perfmon;
-	*pobject = &dom->object;
-
-	dom->func = sdom->func;
-	dom->addr = sdom->addr;
-	dom->mode = args->v0.mode;
-	for (c = 0; c < ARRAY_SIZE(ctr); c++)
-		dom->ctr[c] = ctr[c];
-	return 0;
-}
-
-/*******************************************************************************
- * Perfmon object classes
- ******************************************************************************/
-static int
-nvkm_perfmon_mthd_query_domain(struct nvkm_perfmon *perfmon,
-			       void *data, u32 size)
-{
-	union {
-		struct nvif_perfmon_query_domain_v0 v0;
-	} *args = data;
-	struct nvkm_object *object = &perfmon->object;
-	struct nvkm_pm *pm = perfmon->pm;
-	struct nvkm_perfdom *dom;
-	u8 domain_nr;
-	int di, ret = -ENOSYS;
-
-	nvif_ioctl(object, "perfmon query domain size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object, "perfmon domain vers %d iter %02x\n",
-			   args->v0.version, args->v0.iter);
-		di = (args->v0.iter & 0xff) - 1;
-	} else
-		return ret;
-
-	domain_nr = nvkm_pm_count_perfdom(pm);
-	if (di >= (int)domain_nr)
-		return -EINVAL;
-
-	if (di >= 0) {
-		dom = nvkm_perfdom_find(pm, di);
-		if (dom == NULL)
-			return -EINVAL;
-
-		args->v0.id         = di;
-		args->v0.signal_nr  = nvkm_perfdom_count_perfsig(dom);
-		strscpy(args->v0.name, dom->name, sizeof(args->v0.name));
-
-		/* Currently only global counters (PCOUNTER) are implemented
-		 * but this will be different for local counters (MP). */
-		args->v0.counter_nr = 4;
-	}
-
-	if (++di < domain_nr) {
-		args->v0.iter = ++di;
-		return 0;
-	}
-
-	args->v0.iter = 0xff;
-	return 0;
-}
-
-static int
-nvkm_perfmon_mthd_query_signal(struct nvkm_perfmon *perfmon,
-			       void *data, u32 size)
-{
-	union {
-		struct nvif_perfmon_query_signal_v0 v0;
-	} *args = data;
-	struct nvkm_object *object = &perfmon->object;
-	struct nvkm_pm *pm = perfmon->pm;
-	struct nvkm_device *device = pm->engine.subdev.device;
-	struct nvkm_perfdom *dom;
-	struct nvkm_perfsig *sig;
-	const bool all = nvkm_boolopt(device->cfgopt, "NvPmShowAll", false);
-	const bool raw = nvkm_boolopt(device->cfgopt, "NvPmUnnamed", all);
-	int ret = -ENOSYS, si;
-
-	nvif_ioctl(object, "perfmon query signal size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object,
-			   "perfmon query signal vers %d dom %d iter %04x\n",
-			   args->v0.version, args->v0.domain, args->v0.iter);
-		si = (args->v0.iter & 0xffff) - 1;
-	} else
-		return ret;
-
-	dom = nvkm_perfdom_find(pm, args->v0.domain);
-	if (dom == NULL || si >= (int)dom->signal_nr)
-		return -EINVAL;
-
-	if (si >= 0) {
-		sig = &dom->signal[si];
-		if (raw || !sig->name) {
-			snprintf(args->v0.name, sizeof(args->v0.name),
-				 "/%s/%02x", dom->name, si);
-		} else {
-			strscpy(args->v0.name, sig->name, sizeof(args->v0.name));
-		}
-
-		args->v0.signal = si;
-		args->v0.source_nr = nvkm_perfsig_count_perfsrc(sig);
-	}
-
-	while (++si < dom->signal_nr) {
-		if (all || dom->signal[si].name) {
-			args->v0.iter = ++si;
-			return 0;
-		}
-	}
-
-	args->v0.iter = 0xffff;
-	return 0;
-}
-
-static int
-nvkm_perfmon_mthd_query_source(struct nvkm_perfmon *perfmon,
-			       void *data, u32 size)
-{
-	union {
-		struct nvif_perfmon_query_source_v0 v0;
-	} *args = data;
-	struct nvkm_object *object = &perfmon->object;
-	struct nvkm_pm *pm = perfmon->pm;
-	struct nvkm_perfdom *dom = NULL;
-	struct nvkm_perfsig *sig;
-	struct nvkm_perfsrc *src;
-	u8 source_nr = 0;
-	int si, ret = -ENOSYS;
-
-	nvif_ioctl(object, "perfmon query source size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, false))) {
-		nvif_ioctl(object,
-			   "perfmon source vers %d dom %d sig %02x iter %02x\n",
-			   args->v0.version, args->v0.domain, args->v0.signal,
-			   args->v0.iter);
-		si = (args->v0.iter & 0xff) - 1;
-	} else
-		return ret;
-
-	sig = nvkm_perfsig_find(pm, args->v0.domain, args->v0.signal, &dom);
-	if (!sig)
-		return -EINVAL;
-
-	source_nr = nvkm_perfsig_count_perfsrc(sig);
-	if (si >= (int)source_nr)
-		return -EINVAL;
-
-	if (si >= 0) {
-		src = nvkm_perfsrc_find(pm, sig, sig->source[si]);
-		if (!src)
-			return -EINVAL;
-
-		args->v0.source = sig->source[si];
-		args->v0.mask   = src->mask;
-		strscpy(args->v0.name, src->name, sizeof(args->v0.name));
-	}
-
-	if (++si < source_nr) {
-		args->v0.iter = ++si;
-		return 0;
-	}
-
-	args->v0.iter = 0xff;
-	return 0;
-}
-
-static int
-nvkm_perfmon_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
-{
-	struct nvkm_perfmon *perfmon = nvkm_perfmon(object);
-	switch (mthd) {
-	case NVIF_PERFMON_V0_QUERY_DOMAIN:
-		return nvkm_perfmon_mthd_query_domain(perfmon, data, size);
-	case NVIF_PERFMON_V0_QUERY_SIGNAL:
-		return nvkm_perfmon_mthd_query_signal(perfmon, data, size);
-	case NVIF_PERFMON_V0_QUERY_SOURCE:
-		return nvkm_perfmon_mthd_query_source(perfmon, data, size);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
-static int
-nvkm_perfmon_child_new(const struct nvkm_oclass *oclass, void *data, u32 size,
-		       struct nvkm_object **pobject)
-{
-	struct nvkm_perfmon *perfmon = nvkm_perfmon(oclass->parent);
-	return nvkm_perfdom_new_(perfmon, oclass, data, size, pobject);
-}
-
-static int
-nvkm_perfmon_child_get(struct nvkm_object *object, int index,
-		       struct nvkm_oclass *oclass)
-{
-	if (index == 0) {
-		oclass->base.oclass = NVIF_CLASS_PERFDOM;
-		oclass->base.minver = 0;
-		oclass->base.maxver = 0;
-		oclass->ctor = nvkm_perfmon_child_new;
-		return 0;
-	}
-	return -EINVAL;
-}
-
-static void *
-nvkm_perfmon_dtor(struct nvkm_object *object)
-{
-	struct nvkm_perfmon *perfmon = nvkm_perfmon(object);
-	struct nvkm_pm *pm = perfmon->pm;
-	spin_lock(&pm->client.lock);
-	if (pm->client.object == &perfmon->object)
-		pm->client.object = NULL;
-	spin_unlock(&pm->client.lock);
-	return perfmon;
-}
-
-static const struct nvkm_object_func
-nvkm_perfmon = {
-	.dtor = nvkm_perfmon_dtor,
-	.mthd = nvkm_perfmon_mthd,
-	.sclass = nvkm_perfmon_child_get,
-};
-
-static int
-nvkm_perfmon_new(struct nvkm_pm *pm, const struct nvkm_oclass *oclass,
-		 void *data, u32 size, struct nvkm_object **pobject)
-{
-	struct nvkm_perfmon *perfmon;
-
-	if (!(perfmon = kzalloc(sizeof(*perfmon), GFP_KERNEL)))
-		return -ENOMEM;
-	nvkm_object_ctor(&nvkm_perfmon, oclass, &perfmon->object);
-	perfmon->pm = pm;
-	*pobject = &perfmon->object;
-	return 0;
-}
-
-/*******************************************************************************
- * PPM engine/subdev functions
- ******************************************************************************/
-
-static int
-nvkm_pm_oclass_new(struct nvkm_device *device, const struct nvkm_oclass *oclass,
-		   void *data, u32 size, struct nvkm_object **pobject)
-{
-	struct nvkm_pm *pm = nvkm_pm(oclass->engine);
-	int ret;
-
-	ret = nvkm_perfmon_new(pm, oclass, data, size, pobject);
-	if (ret)
-		return ret;
-
-	spin_lock(&pm->client.lock);
-	if (pm->client.object == NULL)
-		pm->client.object = *pobject;
-	ret = (pm->client.object == *pobject) ? 0 : -EBUSY;
-	spin_unlock(&pm->client.lock);
-	return ret;
-}
-
-static const struct nvkm_device_oclass
-nvkm_pm_oclass = {
-	.base.oclass = NVIF_CLASS_PERFMON,
-	.base.minver = -1,
-	.base.maxver = -1,
-	.ctor = nvkm_pm_oclass_new,
-};
-
-static int
-nvkm_pm_oclass_get(struct nvkm_oclass *oclass, int index,
-		   const struct nvkm_device_oclass **class)
-{
-	if (index == 0) {
-		oclass->base = nvkm_pm_oclass.base;
-		*class = &nvkm_pm_oclass;
-		return index;
-	}
-	return 1;
-}
-
-static int
-nvkm_perfsrc_new(struct nvkm_pm *pm, struct nvkm_perfsig *sig,
-		 const struct nvkm_specsrc *spec)
-{
-	const struct nvkm_specsrc *ssrc;
-	const struct nvkm_specmux *smux;
-	struct nvkm_perfsrc *src;
-	u8 source_nr = 0;
-
-	if (!spec) {
-		/* No sources are defined for this signal. */
-		return 0;
-	}
-
-	ssrc = spec;
-	while (ssrc->name) {
-		smux = ssrc->mux;
-		while (smux->name) {
-			bool found = false;
-			u8 source_id = 0;
-			u32 len;
-
-			list_for_each_entry(src, &pm->sources, head) {
-				if (src->addr == ssrc->addr &&
-				    src->shift == smux->shift) {
-					found = true;
-					break;
-				}
-				source_id++;
-			}
-
-			if (!found) {
-				src = kzalloc(sizeof(*src), GFP_KERNEL);
-				if (!src)
-					return -ENOMEM;
-
-				src->addr   = ssrc->addr;
-				src->mask   = smux->mask;
-				src->shift  = smux->shift;
-				src->enable = smux->enable;
-
-				len = strlen(ssrc->name) +
-				      strlen(smux->name) + 2;
-				src->name = kzalloc(len, GFP_KERNEL);
-				if (!src->name) {
-					kfree(src);
-					return -ENOMEM;
-				}
-				snprintf(src->name, len, "%s_%s", ssrc->name,
-					 smux->name);
-
-				list_add_tail(&src->head, &pm->sources);
-			}
-
-			sig->source[source_nr++] = source_id + 1;
-			smux++;
-		}
-		ssrc++;
-	}
-
-	return 0;
-}
-
-int
-nvkm_perfdom_new(struct nvkm_pm *pm, const char *name, u32 mask,
-		 u32 base, u32 size_unit, u32 size_domain,
-		 const struct nvkm_specdom *spec)
-{
-	const struct nvkm_specdom *sdom;
-	const struct nvkm_specsig *ssig;
-	struct nvkm_perfdom *dom;
-	int ret, i;
-
-	for (i = 0; i == 0 || mask; i++) {
-		u32 addr = base + (i * size_unit);
-		if (i && !(mask & (1 << i)))
-			continue;
-
-		sdom = spec;
-		while (sdom->signal_nr) {
-			dom = kzalloc(struct_size(dom, signal, sdom->signal_nr),
-				      GFP_KERNEL);
-			if (!dom)
-				return -ENOMEM;
-
-			if (mask) {
-				snprintf(dom->name, sizeof(dom->name),
-					 "%s/%02x/%02x", name, i,
-					 (int)(sdom - spec));
-			} else {
-				snprintf(dom->name, sizeof(dom->name),
-					 "%s/%02x", name, (int)(sdom - spec));
-			}
-
-			list_add_tail(&dom->head, &pm->domains);
-			INIT_LIST_HEAD(&dom->list);
-			dom->func = sdom->func;
-			dom->addr = addr;
-			dom->signal_nr = sdom->signal_nr;
-
-			ssig = (sdom++)->signal;
-			while (ssig->name) {
-				struct nvkm_perfsig *sig =
-					&dom->signal[ssig->signal];
-				sig->name = ssig->name;
-				ret = nvkm_perfsrc_new(pm, sig, ssig->source);
-				if (ret)
-					return ret;
-				ssig++;
-			}
-
-			addr += size_domain;
-		}
-
-		mask &= ~(1 << i);
-	}
-
-	return 0;
-}
-
-static int
-nvkm_pm_fini(struct nvkm_engine *engine, bool suspend)
-{
-	struct nvkm_pm *pm = nvkm_pm(engine);
-	if (pm->func->fini)
-		pm->func->fini(pm);
-	return 0;
-}
-
-static void *
-nvkm_pm_dtor(struct nvkm_engine *engine)
-{
-	struct nvkm_pm *pm = nvkm_pm(engine);
-	struct nvkm_perfdom *dom, *next_dom;
-	struct nvkm_perfsrc *src, *next_src;
-
-	list_for_each_entry_safe(dom, next_dom, &pm->domains, head) {
-		list_del(&dom->head);
-		kfree(dom);
-	}
-
-	list_for_each_entry_safe(src, next_src, &pm->sources, head) {
-		list_del(&src->head);
-		kfree(src->name);
-		kfree(src);
-	}
-
-	return pm;
-}
-
-static const struct nvkm_engine_func
-nvkm_pm = {
-	.dtor = nvkm_pm_dtor,
-	.fini = nvkm_pm_fini,
-	.base.sclass = nvkm_pm_oclass_get,
-};
-
-int
-nvkm_pm_ctor(const struct nvkm_pm_func *func, struct nvkm_device *device,
-	     enum nvkm_subdev_type type, int inst, struct nvkm_pm *pm)
-{
-	pm->func = func;
-	INIT_LIST_HEAD(&pm->domains);
-	INIT_LIST_HEAD(&pm->sources);
-	spin_lock_init(&pm->client.lock);
-	return nvkm_engine_ctor(&nvkm_pm, device, type, inst, true, &pm->engine);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
deleted file mode 100644
index 0086d00eb162..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/g84.c
+++ /dev/null
@@ -1,165 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "nv40.h"
-
-const struct nvkm_specsrc
-g84_vfetch_sources[] = {
-	{ 0x400c0c, (const struct nvkm_specmux[]) {
-			{ 0x3, 0, "unk0" },
-			{}
-		}, "pgraph_vfetch_unk0c" },
-	{}
-};
-
-static const struct nvkm_specsrc
-g84_prop_sources[] = {
-	{ 0x408e50, (const struct nvkm_specmux[]) {
-			{ 0x1f, 0, "sel", true },
-			{}
-		}, "pgraph_tpc0_prop_pm_mux" },
-	{}
-};
-
-static const struct nvkm_specsrc
-g84_crop_sources[] = {
-	{ 0x407008, (const struct nvkm_specmux[]) {
-			{ 0xf, 0, "sel0", true },
-			{ 0x7, 16, "sel1", true },
-			{}
-		}, "pgraph_rop0_crop_pm_mux" },
-	{}
-};
-
-static const struct nvkm_specsrc
-g84_tex_sources[] = {
-	{ 0x408808, (const struct nvkm_specmux[]) {
-			{ 0xfffff, 0, "unk0" },
-			{}
-		}, "pgraph_tpc0_tex_unk08" },
-	{}
-};
-
-static const struct nvkm_specdom
-g84_pm[] = {
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xf0, (const struct nvkm_specsig[]) {
-			{ 0xbd, "pc01_gr_idle" },
-			{ 0x5e, "pc01_strmout_00" },
-			{ 0x5f, "pc01_strmout_01" },
-			{ 0xd2, "pc01_trast_00" },
-			{ 0xd3, "pc01_trast_01" },
-			{ 0xd4, "pc01_trast_02" },
-			{ 0xd5, "pc01_trast_03" },
-			{ 0xd8, "pc01_trast_04" },
-			{ 0xd9, "pc01_trast_05" },
-			{ 0x5c, "pc01_vattr_00" },
-			{ 0x5d, "pc01_vattr_01" },
-			{ 0x66, "pc01_vfetch_00", g84_vfetch_sources },
-			{ 0x67, "pc01_vfetch_01", g84_vfetch_sources },
-			{ 0x68, "pc01_vfetch_02", g84_vfetch_sources },
-			{ 0x69, "pc01_vfetch_03", g84_vfetch_sources },
-			{ 0x6a, "pc01_vfetch_04", g84_vfetch_sources },
-			{ 0x6b, "pc01_vfetch_05", g84_vfetch_sources },
-			{ 0x6c, "pc01_vfetch_06", g84_vfetch_sources },
-			{ 0x6d, "pc01_vfetch_07", g84_vfetch_sources },
-			{ 0x6e, "pc01_vfetch_08", g84_vfetch_sources },
-			{ 0x6f, "pc01_vfetch_09", g84_vfetch_sources },
-			{ 0x70, "pc01_vfetch_0a", g84_vfetch_sources },
-			{ 0x71, "pc01_vfetch_0b", g84_vfetch_sources },
-			{ 0x72, "pc01_vfetch_0c", g84_vfetch_sources },
-			{ 0x73, "pc01_vfetch_0d", g84_vfetch_sources },
-			{ 0x74, "pc01_vfetch_0e", g84_vfetch_sources },
-			{ 0x75, "pc01_vfetch_0f", g84_vfetch_sources },
-			{ 0x76, "pc01_vfetch_10", g84_vfetch_sources },
-			{ 0x77, "pc01_vfetch_11", g84_vfetch_sources },
-			{ 0x78, "pc01_vfetch_12", g84_vfetch_sources },
-			{ 0x79, "pc01_vfetch_13", g84_vfetch_sources },
-			{ 0x7a, "pc01_vfetch_14", g84_vfetch_sources },
-			{ 0x7b, "pc01_vfetch_15", g84_vfetch_sources },
-			{ 0x7c, "pc01_vfetch_16", g84_vfetch_sources },
-			{ 0x7d, "pc01_vfetch_17", g84_vfetch_sources },
-			{ 0x7e, "pc01_vfetch_18", g84_vfetch_sources },
-			{ 0x7f, "pc01_vfetch_19", g84_vfetch_sources },
-			{ 0x07, "pc01_zcull_00", nv50_zcull_sources },
-			{ 0x08, "pc01_zcull_01", nv50_zcull_sources },
-			{ 0x09, "pc01_zcull_02", nv50_zcull_sources },
-			{ 0x0a, "pc01_zcull_03", nv50_zcull_sources },
-			{ 0x0b, "pc01_zcull_04", nv50_zcull_sources },
-			{ 0x0c, "pc01_zcull_05", nv50_zcull_sources },
-			{ 0xa4, "pc01_unk00" },
-			{ 0xec, "pc01_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xa0, (const struct nvkm_specsig[]) {
-			{ 0x30, "pc02_crop_00", g84_crop_sources },
-			{ 0x31, "pc02_crop_01", g84_crop_sources },
-			{ 0x32, "pc02_crop_02", g84_crop_sources },
-			{ 0x33, "pc02_crop_03", g84_crop_sources },
-			{ 0x00, "pc02_prop_00", g84_prop_sources },
-			{ 0x01, "pc02_prop_01", g84_prop_sources },
-			{ 0x02, "pc02_prop_02", g84_prop_sources },
-			{ 0x03, "pc02_prop_03", g84_prop_sources },
-			{ 0x04, "pc02_prop_04", g84_prop_sources },
-			{ 0x05, "pc02_prop_05", g84_prop_sources },
-			{ 0x06, "pc02_prop_06", g84_prop_sources },
-			{ 0x07, "pc02_prop_07", g84_prop_sources },
-			{ 0x48, "pc02_tex_00", g84_tex_sources },
-			{ 0x49, "pc02_tex_01", g84_tex_sources },
-			{ 0x4a, "pc02_tex_02", g84_tex_sources },
-			{ 0x4b, "pc02_tex_03", g84_tex_sources },
-			{ 0x1a, "pc02_tex_04", g84_tex_sources },
-			{ 0x1b, "pc02_tex_05", g84_tex_sources },
-			{ 0x1c, "pc02_tex_06", g84_tex_sources },
-			{ 0x44, "pc02_zrop_00", nv50_zrop_sources },
-			{ 0x45, "pc02_zrop_01", nv50_zrop_sources },
-			{ 0x46, "pc02_zrop_02", nv50_zrop_sources },
-			{ 0x47, "pc02_zrop_03", nv50_zrop_sources },
-			{ 0x8c, "pc02_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{}
-};
-
-int
-g84_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return nv40_pm_new_(g84_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
deleted file mode 100644
index 8e02701def8e..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.c
+++ /dev/null
@@ -1,243 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "gf100.h"
-
-const struct nvkm_specsrc
-gf100_pbfb_sources[] = {
-	{ 0x10f100, (const struct nvkm_specmux[]) {
-			{ 0x1, 0, "unk0" },
-			{ 0x3f, 4, "unk4" },
-			{}
-		}, "pbfb_broadcast_pm_unk100" },
-	{}
-};
-
-const struct nvkm_specsrc
-gf100_pmfb_sources[] = {
-	{ 0x140028, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{ 0x7, 16, "unk16" },
-			{ 0x3, 24, "unk24" },
-			{ 0x2, 29, "unk29" },
-			{}
-		}, "pmfb0_pm_unk28" },
-	{}
-};
-
-static const struct nvkm_specsrc
-gf100_l1_sources[] = {
-	{ 0x5044a8, (const struct nvkm_specmux[]) {
-			{ 0x3f, 0, "sel", true },
-			{}
-		}, "pgraph_gpc0_tpc0_l1_pm_mux" },
-	{}
-};
-
-static const struct nvkm_specsrc
-gf100_tex_sources[] = {
-	{ 0x5042c0, (const struct nvkm_specmux[]) {
-			{ 0xf, 0, "sel0", true },
-			{ 0x7, 8, "sel1", true },
-			{}
-		}, "pgraph_gpc0_tpc0_tex_pm_mux_c_d" },
-	{}
-};
-
-static const struct nvkm_specsrc
-gf100_unk400_sources[] = {
-	{ 0x50440c, (const struct nvkm_specmux[]) {
-			{ 0x3f, 0, "sel", true },
-			{}
-		}, "pgraph_gpc0_tpc0_unk400_pm_mux" },
-	{}
-};
-
-static const struct nvkm_specdom
-gf100_pm_hub[] = {
-	{}
-};
-
-const struct nvkm_specdom
-gf100_pm_gpc[] = {
-	{ 0xe0, (const struct nvkm_specsig[]) {
-			{ 0x00, "gpc00_l1_00", gf100_l1_sources },
-			{ 0x01, "gpc00_l1_01", gf100_l1_sources },
-			{ 0x02, "gpc00_l1_02", gf100_l1_sources },
-			{ 0x03, "gpc00_l1_03", gf100_l1_sources },
-			{ 0x05, "gpc00_l1_04", gf100_l1_sources },
-			{ 0x06, "gpc00_l1_05", gf100_l1_sources },
-			{ 0x0a, "gpc00_tex_00", gf100_tex_sources },
-			{ 0x0b, "gpc00_tex_01", gf100_tex_sources },
-			{ 0x0c, "gpc00_tex_02", gf100_tex_sources },
-			{ 0x0d, "gpc00_tex_03", gf100_tex_sources },
-			{ 0x0e, "gpc00_tex_04", gf100_tex_sources },
-			{ 0x0f, "gpc00_tex_05", gf100_tex_sources },
-			{ 0x10, "gpc00_tex_06", gf100_tex_sources },
-			{ 0x11, "gpc00_tex_07", gf100_tex_sources },
-			{ 0x12, "gpc00_tex_08", gf100_tex_sources },
-			{ 0x26, "gpc00_unk400_00", gf100_unk400_sources },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static const struct nvkm_specdom
-gf100_pm_part[] = {
-	{ 0xe0, (const struct nvkm_specsig[]) {
-			{ 0x0f, "part00_pbfb_00", gf100_pbfb_sources },
-			{ 0x10, "part00_pbfb_01", gf100_pbfb_sources },
-			{ 0x21, "part00_pmfb_00", gf100_pmfb_sources },
-			{ 0x04, "part00_pmfb_01", gf100_pmfb_sources },
-			{ 0x00, "part00_pmfb_02", gf100_pmfb_sources },
-			{ 0x02, "part00_pmfb_03", gf100_pmfb_sources },
-			{ 0x01, "part00_pmfb_04", gf100_pmfb_sources },
-			{ 0x2e, "part00_pmfb_05", gf100_pmfb_sources },
-			{ 0x2f, "part00_pmfb_06", gf100_pmfb_sources },
-			{ 0x1b, "part00_pmfb_07", gf100_pmfb_sources },
-			{ 0x1c, "part00_pmfb_08", gf100_pmfb_sources },
-			{ 0x1d, "part00_pmfb_09", gf100_pmfb_sources },
-			{ 0x1e, "part00_pmfb_0a", gf100_pmfb_sources },
-			{ 0x1f, "part00_pmfb_0b", gf100_pmfb_sources },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static void
-gf100_perfctr_init(struct nvkm_pm *pm, struct nvkm_perfdom *dom,
-		   struct nvkm_perfctr *ctr)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-	u32 log = ctr->logic_op;
-	u32 src = 0x00000000;
-	int i;
-
-	for (i = 0; i < 4; i++)
-		src |= ctr->signal[i] << (i * 8);
-
-	nvkm_wr32(device, dom->addr + 0x09c, 0x00040002 | (dom->mode << 3));
-	nvkm_wr32(device, dom->addr + 0x100, 0x00000000);
-	nvkm_wr32(device, dom->addr + 0x040 + (ctr->slot * 0x08), src);
-	nvkm_wr32(device, dom->addr + 0x044 + (ctr->slot * 0x08), log);
-}
-
-static void
-gf100_perfctr_read(struct nvkm_pm *pm, struct nvkm_perfdom *dom,
-		   struct nvkm_perfctr *ctr)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-
-	switch (ctr->slot) {
-	case 0: ctr->ctr = nvkm_rd32(device, dom->addr + 0x08c); break;
-	case 1: ctr->ctr = nvkm_rd32(device, dom->addr + 0x088); break;
-	case 2: ctr->ctr = nvkm_rd32(device, dom->addr + 0x080); break;
-	case 3: ctr->ctr = nvkm_rd32(device, dom->addr + 0x090); break;
-	}
-	dom->clk = nvkm_rd32(device, dom->addr + 0x070);
-}
-
-static void
-gf100_perfctr_next(struct nvkm_pm *pm, struct nvkm_perfdom *dom)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-	nvkm_wr32(device, dom->addr + 0x06c, dom->signal_nr - 0x40 + 0x27);
-	nvkm_wr32(device, dom->addr + 0x0ec, 0x00000011);
-}
-
-const struct nvkm_funcdom
-gf100_perfctr_func = {
-	.init = gf100_perfctr_init,
-	.read = gf100_perfctr_read,
-	.next = gf100_perfctr_next,
-};
-
-static void
-gf100_pm_fini(struct nvkm_pm *pm)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-	nvkm_mask(device, 0x000200, 0x10000000, 0x00000000);
-	nvkm_mask(device, 0x000200, 0x10000000, 0x10000000);
-}
-
-static const struct nvkm_pm_func
-gf100_pm_ = {
-	.fini = gf100_pm_fini,
-};
-
-int
-gf100_pm_new_(const struct gf100_pm_func *func, struct nvkm_device *device,
-	      enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	struct nvkm_pm *pm;
-	u32 mask;
-	int ret;
-
-	if (!(pm = *ppm = kzalloc(sizeof(*pm), GFP_KERNEL)))
-		return -ENOMEM;
-
-	ret = nvkm_pm_ctor(&gf100_pm_, device, type, inst, pm);
-	if (ret)
-		return ret;
-
-	/* HUB */
-	ret = nvkm_perfdom_new(pm, "hub", 0, 0x1b0000, 0, 0x200,
-			       func->doms_hub);
-	if (ret)
-		return ret;
-
-	/* GPC */
-	mask  = (1 << nvkm_rd32(device, 0x022430)) - 1;
-	mask &= ~nvkm_rd32(device, 0x022504);
-	mask &= ~nvkm_rd32(device, 0x022584);
-
-	ret = nvkm_perfdom_new(pm, "gpc", mask, 0x180000,
-			       0x1000, 0x200, func->doms_gpc);
-	if (ret)
-		return ret;
-
-	/* PART */
-	mask  = (1 << nvkm_rd32(device, 0x022438)) - 1;
-	mask &= ~nvkm_rd32(device, 0x022548);
-	mask &= ~nvkm_rd32(device, 0x0225c8);
-
-	ret = nvkm_perfdom_new(pm, "part", mask, 0x1a0000,
-			       0x1000, 0x200, func->doms_part);
-	if (ret)
-		return ret;
-
-	return 0;
-}
-
-static const struct gf100_pm_func
-gf100_pm = {
-	.doms_gpc = gf100_pm_gpc,
-	.doms_hub = gf100_pm_hub,
-	.doms_part = gf100_pm_part,
-};
-
-int
-gf100_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return gf100_pm_new_(&gf100_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
deleted file mode 100644
index bc4b014c4e8e..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf100.h
+++ /dev/null
@@ -1,20 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_PM_NVC0_H__
-#define __NVKM_PM_NVC0_H__
-#include "priv.h"
-
-struct gf100_pm_func {
-	const struct nvkm_specdom *doms_hub;
-	const struct nvkm_specdom *doms_gpc;
-	const struct nvkm_specdom *doms_part;
-};
-
-int gf100_pm_new_(const struct gf100_pm_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
-		  struct nvkm_pm **);
-
-extern const struct nvkm_funcdom gf100_perfctr_func;
-extern const struct nvkm_specdom gf100_pm_gpc[];
-
-extern const struct nvkm_specsrc gf100_pbfb_sources[];
-extern const struct nvkm_specsrc gf100_pmfb_sources[];
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
deleted file mode 100644
index 505565866b59..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf108.c
+++ /dev/null
@@ -1,66 +0,0 @@
-/*
- * Copyright 2015 Samuel Pitoiset
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Samuel Pitoiset
- */
-#include "gf100.h"
-
-static const struct nvkm_specdom
-gf108_pm_hub[] = {
-	{}
-};
-
-static const struct nvkm_specdom
-gf108_pm_part[] = {
-	{ 0xe0, (const struct nvkm_specsig[]) {
-			{ 0x14, "part00_pbfb_00", gf100_pbfb_sources },
-			{ 0x15, "part00_pbfb_01", gf100_pbfb_sources },
-			{ 0x20, "part00_pbfb_02", gf100_pbfb_sources },
-			{ 0x21, "part00_pbfb_03", gf100_pbfb_sources },
-			{ 0x01, "part00_pmfb_00", gf100_pmfb_sources },
-			{ 0x04, "part00_pmfb_01", gf100_pmfb_sources },
-			{ 0x05, "part00_pmfb_02", gf100_pmfb_sources},
-			{ 0x07, "part00_pmfb_03", gf100_pmfb_sources },
-			{ 0x0d, "part00_pmfb_04", gf100_pmfb_sources },
-			{ 0x12, "part00_pmfb_05", gf100_pmfb_sources },
-			{ 0x13, "part00_pmfb_06", gf100_pmfb_sources },
-			{ 0x2c, "part00_pmfb_07", gf100_pmfb_sources },
-			{ 0x2d, "part00_pmfb_08", gf100_pmfb_sources },
-			{ 0x2e, "part00_pmfb_09", gf100_pmfb_sources },
-			{ 0x2f, "part00_pmfb_0a", gf100_pmfb_sources },
-			{ 0x30, "part00_pmfb_0b", gf100_pmfb_sources },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static const struct gf100_pm_func
-gf108_pm = {
-	.doms_gpc = gf100_pm_gpc,
-	.doms_hub = gf108_pm_hub,
-	.doms_part = gf108_pm_part,
-};
-
-int
-gf108_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return gf100_pm_new_(&gf108_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
deleted file mode 100644
index c61e8c010bb3..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gf117.c
+++ /dev/null
@@ -1,80 +0,0 @@
-/*
- * Copyright 2015 Samuel Pitoiset
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Samuel Pitoiset
- */
-#include "gf100.h"
-
-static const struct nvkm_specsrc
-gf117_pmfb_sources[] = {
-	{ 0x140028, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{ 0x7, 16, "unk16" },
-			{ 0x3, 24, "unk24" },
-			{ 0x2, 28, "unk28" },
-			{}
-		}, "pmfb0_pm_unk28" },
-	{ 0x14125c, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{}
-		}, "pmfb0_subp0_pm_unk25c" },
-	{}
-};
-
-static const struct nvkm_specdom
-gf117_pm_hub[] = {
-	{}
-};
-
-static const struct nvkm_specdom
-gf117_pm_part[] = {
-	{ 0xe0, (const struct nvkm_specsig[]) {
-			{ 0x00, "part00_pbfb_00", gf100_pbfb_sources },
-			{ 0x01, "part00_pbfb_01", gf100_pbfb_sources },
-			{ 0x12, "part00_pmfb_00", gf117_pmfb_sources },
-			{ 0x15, "part00_pmfb_01", gf117_pmfb_sources },
-			{ 0x16, "part00_pmfb_02", gf117_pmfb_sources },
-			{ 0x18, "part00_pmfb_03", gf117_pmfb_sources },
-			{ 0x1e, "part00_pmfb_04", gf117_pmfb_sources },
-			{ 0x23, "part00_pmfb_05", gf117_pmfb_sources },
-			{ 0x24, "part00_pmfb_06", gf117_pmfb_sources },
-			{ 0x0c, "part00_pmfb_07", gf117_pmfb_sources },
-			{ 0x0d, "part00_pmfb_08", gf117_pmfb_sources },
-			{ 0x0e, "part00_pmfb_09", gf117_pmfb_sources },
-			{ 0x0f, "part00_pmfb_0a", gf117_pmfb_sources },
-			{ 0x10, "part00_pmfb_0b", gf117_pmfb_sources },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static const struct gf100_pm_func
-gf117_pm = {
-	.doms_gpc = gf100_pm_gpc,
-	.doms_hub = gf117_pm_hub,
-	.doms_part = gf117_pm_part,
-};
-
-int
-gf117_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return gf100_pm_new_(&gf117_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
deleted file mode 100644
index 75bf3df1cb18..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gk104.c
+++ /dev/null
@@ -1,184 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "gf100.h"
-
-static const struct nvkm_specsrc
-gk104_pmfb_sources[] = {
-	{ 0x140028, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{ 0x7, 16, "unk16" },
-			{ 0x3, 24, "unk24" },
-			{ 0x2, 28, "unk28" },
-			{}
-		}, "pmfb0_pm_unk28" },
-	{ 0x14125c, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{}
-		}, "pmfb0_subp0_pm_unk25c" },
-	{ 0x14165c, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{}
-		}, "pmfb0_subp1_pm_unk25c" },
-	{ 0x141a5c, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{}
-		}, "pmfb0_subp2_pm_unk25c" },
-	{ 0x141e5c, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{}
-		}, "pmfb0_subp3_pm_unk25c" },
-	{}
-};
-
-static const struct nvkm_specsrc
-gk104_tex_sources[] = {
-	{ 0x5042c0, (const struct nvkm_specmux[]) {
-			{ 0xf, 0, "sel0", true },
-			{ 0x7, 8, "sel1", true },
-			{}
-		}, "pgraph_gpc0_tpc0_tex_pm_mux_c_d" },
-	{ 0x5042c8, (const struct nvkm_specmux[]) {
-			{ 0x1f, 0, "sel", true },
-			{}
-		}, "pgraph_gpc0_tpc0_tex_pm_unkc8" },
-	{ 0x5042b8, (const struct nvkm_specmux[]) {
-			{ 0xff, 0, "sel", true },
-			{}
-		}, "pgraph_gpc0_tpc0_tex_pm_unkb8" },
-	{}
-};
-
-static const struct nvkm_specdom
-gk104_pm_hub[] = {
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x47, "hub00_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x40, (const struct nvkm_specsig[]) {
-			{ 0x27, "hub01_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x47, "hub02_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x47, "hub03_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x40, (const struct nvkm_specsig[]) {
-			{ 0x03, "host_mmio_rd" },
-			{ 0x27, "hub04_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x47, "hub05_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0xc0, (const struct nvkm_specsig[]) {
-			{ 0x74, "host_fb_rd3x" },
-			{ 0x75, "host_fb_rd3x_2" },
-			{ 0xa7, "hub06_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x47, "hub07_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static const struct nvkm_specdom
-gk104_pm_gpc[] = {
-	{ 0xe0, (const struct nvkm_specsig[]) {
-			{ 0xc7, "gpc00_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{ 0x00, "gpc02_tex_00", gk104_tex_sources },
-			{ 0x01, "gpc02_tex_01", gk104_tex_sources },
-			{ 0x02, "gpc02_tex_02", gk104_tex_sources },
-			{ 0x03, "gpc02_tex_03", gk104_tex_sources },
-			{ 0x04, "gpc02_tex_04", gk104_tex_sources },
-			{ 0x05, "gpc02_tex_05", gk104_tex_sources },
-			{ 0x06, "gpc02_tex_06", gk104_tex_sources },
-			{ 0x07, "gpc02_tex_07", gk104_tex_sources },
-			{ 0x08, "gpc02_tex_08", gk104_tex_sources },
-			{ 0x0a, "gpc02_tex_0a", gk104_tex_sources },
-			{ 0x0b, "gpc02_tex_0b", gk104_tex_sources },
-			{ 0x0d, "gpc02_tex_0c", gk104_tex_sources },
-			{ 0x0c, "gpc02_tex_0d", gk104_tex_sources },
-			{ 0x0e, "gpc02_tex_0e", gk104_tex_sources },
-			{ 0x0f, "gpc02_tex_0f", gk104_tex_sources },
-			{ 0x10, "gpc02_tex_10", gk104_tex_sources },
-			{ 0x11, "gpc02_tex_11", gk104_tex_sources },
-			{ 0x12, "gpc02_tex_12", gk104_tex_sources },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static const struct nvkm_specdom
-gk104_pm_part[] = {
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x00, "part00_pbfb_00", gf100_pbfb_sources },
-			{ 0x01, "part00_pbfb_01", gf100_pbfb_sources },
-			{ 0x0c, "part00_pmfb_00", gk104_pmfb_sources },
-			{ 0x0d, "part00_pmfb_01", gk104_pmfb_sources },
-			{ 0x0e, "part00_pmfb_02", gk104_pmfb_sources },
-			{ 0x0f, "part00_pmfb_03", gk104_pmfb_sources },
-			{ 0x10, "part00_pmfb_04", gk104_pmfb_sources },
-			{ 0x12, "part00_pmfb_05", gk104_pmfb_sources },
-			{ 0x15, "part00_pmfb_06", gk104_pmfb_sources },
-			{ 0x16, "part00_pmfb_07", gk104_pmfb_sources },
-			{ 0x18, "part00_pmfb_08", gk104_pmfb_sources },
-			{ 0x21, "part00_pmfb_09", gk104_pmfb_sources },
-			{ 0x25, "part00_pmfb_0a", gk104_pmfb_sources },
-			{ 0x26, "part00_pmfb_0b", gk104_pmfb_sources },
-			{ 0x27, "part00_pmfb_0c", gk104_pmfb_sources },
-			{ 0x47, "part00_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{ 0x60, (const struct nvkm_specsig[]) {
-			{ 0x47, "part01_user_0" },
-			{}
-		}, &gf100_perfctr_func },
-	{}
-};
-
-static const struct gf100_pm_func
-gk104_pm = {
-	.doms_gpc = gk104_pm_gpc,
-	.doms_hub = gk104_pm_hub,
-	.doms_part = gk104_pm_part,
-};
-
-int
-gk104_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return gf100_pm_new_(&gk104_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
deleted file mode 100644
index 25874c541486..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gt200.c
+++ /dev/null
@@ -1,157 +0,0 @@
-/*
- * Copyright 2015 Nouveau project
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Samuel Pitoiset
- */
-#include "nv40.h"
-
-const struct nvkm_specsrc
-gt200_crop_sources[] = {
-	{ 0x407008, (const struct nvkm_specmux[]) {
-			{ 0xf, 0, "sel0", true },
-			{ 0x1f, 16, "sel1", true },
-			{}
-		}, "pgraph_rop0_crop_pm_mux" },
-	{}
-};
-
-const struct nvkm_specsrc
-gt200_prop_sources[] = {
-	{ 0x408750, (const struct nvkm_specmux[]) {
-			{ 0x3f, 0, "sel", true },
-			{}
-		}, "pgraph_tpc0_prop_pm_mux" },
-	{}
-};
-
-const struct nvkm_specsrc
-gt200_tex_sources[] = {
-	{ 0x408508, (const struct nvkm_specmux[]) {
-			{ 0xfffff, 0, "unk0" },
-			{}
-		}, "pgraph_tpc0_tex_unk08" },
-	{}
-};
-
-static const struct nvkm_specdom
-gt200_pm[] = {
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xf0, (const struct nvkm_specsig[]) {
-			{ 0xc9, "pc01_gr_idle" },
-			{ 0x84, "pc01_strmout_00" },
-			{ 0x85, "pc01_strmout_01" },
-			{ 0xde, "pc01_trast_00" },
-			{ 0xdf, "pc01_trast_01" },
-			{ 0xe0, "pc01_trast_02" },
-			{ 0xe1, "pc01_trast_03" },
-			{ 0xe4, "pc01_trast_04" },
-			{ 0xe5, "pc01_trast_05" },
-			{ 0x82, "pc01_vattr_00" },
-			{ 0x83, "pc01_vattr_01" },
-			{ 0x46, "pc01_vfetch_00", g84_vfetch_sources },
-			{ 0x47, "pc01_vfetch_01", g84_vfetch_sources },
-			{ 0x48, "pc01_vfetch_02", g84_vfetch_sources },
-			{ 0x49, "pc01_vfetch_03", g84_vfetch_sources },
-			{ 0x4a, "pc01_vfetch_04", g84_vfetch_sources },
-			{ 0x4b, "pc01_vfetch_05", g84_vfetch_sources },
-			{ 0x4c, "pc01_vfetch_06", g84_vfetch_sources },
-			{ 0x4d, "pc01_vfetch_07", g84_vfetch_sources },
-			{ 0x4e, "pc01_vfetch_08", g84_vfetch_sources },
-			{ 0x4f, "pc01_vfetch_09", g84_vfetch_sources },
-			{ 0x50, "pc01_vfetch_0a", g84_vfetch_sources },
-			{ 0x51, "pc01_vfetch_0b", g84_vfetch_sources },
-			{ 0x52, "pc01_vfetch_0c", g84_vfetch_sources },
-			{ 0x53, "pc01_vfetch_0d", g84_vfetch_sources },
-			{ 0x54, "pc01_vfetch_0e", g84_vfetch_sources },
-			{ 0x55, "pc01_vfetch_0f", g84_vfetch_sources },
-			{ 0x56, "pc01_vfetch_10", g84_vfetch_sources },
-			{ 0x57, "pc01_vfetch_11", g84_vfetch_sources },
-			{ 0x58, "pc01_vfetch_12", g84_vfetch_sources },
-			{ 0x59, "pc01_vfetch_13", g84_vfetch_sources },
-			{ 0x5a, "pc01_vfetch_14", g84_vfetch_sources },
-			{ 0x5b, "pc01_vfetch_15", g84_vfetch_sources },
-			{ 0x5c, "pc01_vfetch_16", g84_vfetch_sources },
-			{ 0x5d, "pc01_vfetch_17", g84_vfetch_sources },
-			{ 0x5e, "pc01_vfetch_18", g84_vfetch_sources },
-			{ 0x5f, "pc01_vfetch_19", g84_vfetch_sources },
-			{ 0x07, "pc01_zcull_00", nv50_zcull_sources },
-			{ 0x08, "pc01_zcull_01", nv50_zcull_sources },
-			{ 0x09, "pc01_zcull_02", nv50_zcull_sources },
-			{ 0x0a, "pc01_zcull_03", nv50_zcull_sources },
-			{ 0x0b, "pc01_zcull_04", nv50_zcull_sources },
-			{ 0x0c, "pc01_zcull_05", nv50_zcull_sources },
-
-			{ 0xb0, "pc01_unk00" },
-			{ 0xec, "pc01_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xf0, (const struct nvkm_specsig[]) {
-			{ 0x55, "pc02_crop_00", gt200_crop_sources },
-			{ 0x56, "pc02_crop_01", gt200_crop_sources },
-			{ 0x57, "pc02_crop_02", gt200_crop_sources },
-			{ 0x58, "pc02_crop_03", gt200_crop_sources },
-			{ 0x00, "pc02_prop_00", gt200_prop_sources },
-			{ 0x01, "pc02_prop_01", gt200_prop_sources },
-			{ 0x02, "pc02_prop_02", gt200_prop_sources },
-			{ 0x03, "pc02_prop_03", gt200_prop_sources },
-			{ 0x04, "pc02_prop_04", gt200_prop_sources },
-			{ 0x05, "pc02_prop_05", gt200_prop_sources },
-			{ 0x06, "pc02_prop_06", gt200_prop_sources },
-			{ 0x07, "pc02_prop_07", gt200_prop_sources },
-			{ 0x78, "pc02_tex_00", gt200_tex_sources },
-			{ 0x79, "pc02_tex_01", gt200_tex_sources },
-			{ 0x7a, "pc02_tex_02", gt200_tex_sources },
-			{ 0x7b, "pc02_tex_03", gt200_tex_sources },
-			{ 0x32, "pc02_tex_04", gt200_tex_sources },
-			{ 0x33, "pc02_tex_05", gt200_tex_sources },
-			{ 0x34, "pc02_tex_06", gt200_tex_sources },
-			{ 0x74, "pc02_zrop_00", nv50_zrop_sources },
-			{ 0x75, "pc02_zrop_01", nv50_zrop_sources },
-			{ 0x76, "pc02_zrop_02", nv50_zrop_sources },
-			{ 0x77, "pc02_zrop_03", nv50_zrop_sources },
-			{ 0xec, "pc02_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{}
-};
-
-int
-gt200_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return nv40_pm_new_(gt200_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
deleted file mode 100644
index 54c23e2b6645..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/gt215.c
+++ /dev/null
@@ -1,138 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "nv40.h"
-
-static const struct nvkm_specsrc
-gt215_zcull_sources[] = {
-	{ 0x402ca4, (const struct nvkm_specmux[]) {
-			{ 0x7fff, 0, "unk0" },
-			{ 0xff, 24, "unk24" },
-			{}
-		}, "pgraph_zcull_pm_unka4" },
-	{}
-};
-
-static const struct nvkm_specdom
-gt215_pm[] = {
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xf0, (const struct nvkm_specsig[]) {
-			{ 0xcb, "pc01_gr_idle" },
-			{ 0x86, "pc01_strmout_00" },
-			{ 0x87, "pc01_strmout_01" },
-			{ 0xe0, "pc01_trast_00" },
-			{ 0xe1, "pc01_trast_01" },
-			{ 0xe2, "pc01_trast_02" },
-			{ 0xe3, "pc01_trast_03" },
-			{ 0xe6, "pc01_trast_04" },
-			{ 0xe7, "pc01_trast_05" },
-			{ 0x84, "pc01_vattr_00" },
-			{ 0x85, "pc01_vattr_01" },
-			{ 0x46, "pc01_vfetch_00", g84_vfetch_sources },
-			{ 0x47, "pc01_vfetch_01", g84_vfetch_sources },
-			{ 0x48, "pc01_vfetch_02", g84_vfetch_sources },
-			{ 0x49, "pc01_vfetch_03", g84_vfetch_sources },
-			{ 0x4a, "pc01_vfetch_04", g84_vfetch_sources },
-			{ 0x4b, "pc01_vfetch_05", g84_vfetch_sources },
-			{ 0x4c, "pc01_vfetch_06", g84_vfetch_sources },
-			{ 0x4d, "pc01_vfetch_07", g84_vfetch_sources },
-			{ 0x4e, "pc01_vfetch_08", g84_vfetch_sources },
-			{ 0x4f, "pc01_vfetch_09", g84_vfetch_sources },
-			{ 0x50, "pc01_vfetch_0a", g84_vfetch_sources },
-			{ 0x51, "pc01_vfetch_0b", g84_vfetch_sources },
-			{ 0x52, "pc01_vfetch_0c", g84_vfetch_sources },
-			{ 0x53, "pc01_vfetch_0d", g84_vfetch_sources },
-			{ 0x54, "pc01_vfetch_0e", g84_vfetch_sources },
-			{ 0x55, "pc01_vfetch_0f", g84_vfetch_sources },
-			{ 0x56, "pc01_vfetch_10", g84_vfetch_sources },
-			{ 0x57, "pc01_vfetch_11", g84_vfetch_sources },
-			{ 0x58, "pc01_vfetch_12", g84_vfetch_sources },
-			{ 0x59, "pc01_vfetch_13", g84_vfetch_sources },
-			{ 0x5a, "pc01_vfetch_14", g84_vfetch_sources },
-			{ 0x5b, "pc01_vfetch_15", g84_vfetch_sources },
-			{ 0x5c, "pc01_vfetch_16", g84_vfetch_sources },
-			{ 0x5d, "pc01_vfetch_17", g84_vfetch_sources },
-			{ 0x5e, "pc01_vfetch_18", g84_vfetch_sources },
-			{ 0x5f, "pc01_vfetch_19", g84_vfetch_sources },
-			{ 0x07, "pc01_zcull_00", gt215_zcull_sources },
-			{ 0x08, "pc01_zcull_01", gt215_zcull_sources },
-			{ 0x09, "pc01_zcull_02", gt215_zcull_sources },
-			{ 0x0a, "pc01_zcull_03", gt215_zcull_sources },
-			{ 0x0b, "pc01_zcull_04", gt215_zcull_sources },
-			{ 0x0c, "pc01_zcull_05", gt215_zcull_sources },
-			{ 0xb2, "pc01_unk00" },
-			{ 0xec, "pc01_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xe0, (const struct nvkm_specsig[]) {
-			{ 0x64, "pc02_crop_00", gt200_crop_sources },
-			{ 0x65, "pc02_crop_01", gt200_crop_sources },
-			{ 0x66, "pc02_crop_02", gt200_crop_sources },
-			{ 0x67, "pc02_crop_03", gt200_crop_sources },
-			{ 0x00, "pc02_prop_00", gt200_prop_sources },
-			{ 0x01, "pc02_prop_01", gt200_prop_sources },
-			{ 0x02, "pc02_prop_02", gt200_prop_sources },
-			{ 0x03, "pc02_prop_03", gt200_prop_sources },
-			{ 0x04, "pc02_prop_04", gt200_prop_sources },
-			{ 0x05, "pc02_prop_05", gt200_prop_sources },
-			{ 0x06, "pc02_prop_06", gt200_prop_sources },
-			{ 0x07, "pc02_prop_07", gt200_prop_sources },
-			{ 0x80, "pc02_tex_00", gt200_tex_sources },
-			{ 0x81, "pc02_tex_01", gt200_tex_sources },
-			{ 0x82, "pc02_tex_02", gt200_tex_sources },
-			{ 0x83, "pc02_tex_03", gt200_tex_sources },
-			{ 0x3a, "pc02_tex_04", gt200_tex_sources },
-			{ 0x3b, "pc02_tex_05", gt200_tex_sources },
-			{ 0x3c, "pc02_tex_06", gt200_tex_sources },
-			{ 0x7c, "pc02_zrop_00", nv50_zrop_sources },
-			{ 0x7d, "pc02_zrop_01", nv50_zrop_sources },
-			{ 0x7e, "pc02_zrop_02", nv50_zrop_sources },
-			{ 0x7f, "pc02_zrop_03", nv50_zrop_sources },
-			{ 0xcc, "pc02_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{}
-};
-
-int
-gt215_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return nv40_pm_new_(gt215_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
deleted file mode 100644
index eba5b3b79340..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.c
+++ /dev/null
@@ -1,123 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "nv40.h"
-
-static void
-nv40_perfctr_init(struct nvkm_pm *pm, struct nvkm_perfdom *dom,
-		  struct nvkm_perfctr *ctr)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-	u32 log = ctr->logic_op;
-	u32 src = 0x00000000;
-	int i;
-
-	for (i = 0; i < 4; i++)
-		src |= ctr->signal[i] << (i * 8);
-
-	nvkm_wr32(device, 0x00a7c0 + dom->addr, 0x00000001 | (dom->mode << 4));
-	nvkm_wr32(device, 0x00a400 + dom->addr + (ctr->slot * 0x40), src);
-	nvkm_wr32(device, 0x00a420 + dom->addr + (ctr->slot * 0x40), log);
-}
-
-static void
-nv40_perfctr_read(struct nvkm_pm *pm, struct nvkm_perfdom *dom,
-		  struct nvkm_perfctr *ctr)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-
-	switch (ctr->slot) {
-	case 0: ctr->ctr = nvkm_rd32(device, 0x00a700 + dom->addr); break;
-	case 1: ctr->ctr = nvkm_rd32(device, 0x00a6c0 + dom->addr); break;
-	case 2: ctr->ctr = nvkm_rd32(device, 0x00a680 + dom->addr); break;
-	case 3: ctr->ctr = nvkm_rd32(device, 0x00a740 + dom->addr); break;
-	}
-	dom->clk = nvkm_rd32(device, 0x00a600 + dom->addr);
-}
-
-static void
-nv40_perfctr_next(struct nvkm_pm *pm, struct nvkm_perfdom *dom)
-{
-	struct nvkm_device *device = pm->engine.subdev.device;
-	struct nv40_pm *nv40pm = container_of(pm, struct nv40_pm, base);
-
-	if (nv40pm->sequence != pm->sequence) {
-		nvkm_wr32(device, 0x400084, 0x00000020);
-		nv40pm->sequence = pm->sequence;
-	}
-}
-
-const struct nvkm_funcdom
-nv40_perfctr_func = {
-	.init = nv40_perfctr_init,
-	.read = nv40_perfctr_read,
-	.next = nv40_perfctr_next,
-};
-
-static const struct nvkm_pm_func
-nv40_pm_ = {
-};
-
-int
-nv40_pm_new_(const struct nvkm_specdom *doms, struct nvkm_device *device,
-	     enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	struct nv40_pm *pm;
-	int ret;
-
-	if (!(pm = kzalloc(sizeof(*pm), GFP_KERNEL)))
-		return -ENOMEM;
-	*ppm = &pm->base;
-
-	ret = nvkm_pm_ctor(&nv40_pm_, device, type, inst, &pm->base);
-	if (ret)
-		return ret;
-
-	return nvkm_perfdom_new(&pm->base, "pc", 0, 0, 0, 4, doms);
-}
-
-static const struct nvkm_specdom
-nv40_pm[] = {
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{}
-};
-
-int
-nv40_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return nv40_pm_new_(nv40_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h b/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
deleted file mode 100644
index afb79843723d..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv40.h
+++ /dev/null
@@ -1,15 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_PM_NV40_H__
-#define __NVKM_PM_NV40_H__
-#define nv40_pm(p) container_of((p), struct nv40_pm, base)
-#include "priv.h"
-
-struct nv40_pm {
-	struct nvkm_pm base;
-	u32 sequence;
-};
-
-int nv40_pm_new_(const struct nvkm_specdom *, struct nvkm_device *, enum nvkm_subdev_type, int,
-		 struct nvkm_pm **);
-extern const struct nvkm_funcdom nv40_perfctr_func;
-#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c b/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
deleted file mode 100644
index bbd3404901f9..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/nv50.c
+++ /dev/null
@@ -1,175 +0,0 @@
-/*
- * Copyright 2013 Red Hat Inc.
- *
- * Permission is hereby granted, free of charge, to any person obtaining a
- * copy of this software and associated documentation files (the "Software"),
- * to deal in the Software without restriction, including without limitation
- * the rights to use, copy, modify, merge, publish, distribute, sublicense,
- * and/or sell copies of the Software, and to permit persons to whom the
- * Software is furnished to do so, subject to the following conditions:
- *
- * The above copyright notice and this permission notice shall be included in
- * all copies or substantial portions of the Software.
- *
- * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
- * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
- * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
- * THE COPYRIGHT HOLDER(S) OR AUTHOR(S) BE LIABLE FOR ANY CLAIM, DAMAGES OR
- * OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
- * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
- * OTHER DEALINGS IN THE SOFTWARE.
- *
- * Authors: Ben Skeggs
- */
-#include "nv40.h"
-
-const struct nvkm_specsrc
-nv50_zcull_sources[] = {
-	{ 0x402ca4, (const struct nvkm_specmux[]) {
-			{ 0x7fff, 0, "unk0" },
-			{}
-		}, "pgraph_zcull_pm_unka4" },
-	{}
-};
-
-const struct nvkm_specsrc
-nv50_zrop_sources[] = {
-	{ 0x40708c, (const struct nvkm_specmux[]) {
-			{ 0xf, 0, "sel0", true },
-			{ 0xf, 16, "sel1", true },
-			{}
-		}, "pgraph_rop0_zrop_pm_mux" },
-	{}
-};
-
-static const struct nvkm_specsrc
-nv50_prop_sources[] = {
-	{ 0x40be50, (const struct nvkm_specmux[]) {
-			{ 0x1f, 0, "sel", true },
-			{}
-		}, "pgraph_tpc3_prop_pm_mux" },
-	{}
-};
-
-static const struct nvkm_specsrc
-nv50_crop_sources[] = {
-        { 0x407008, (const struct nvkm_specmux[]) {
-                        { 0x7, 0, "sel0", true },
-                        { 0x7, 16, "sel1", true },
-                        {}
-                }, "pgraph_rop0_crop_pm_mux" },
-        {}
-};
-
-static const struct nvkm_specsrc
-nv50_tex_sources[] = {
-	{ 0x40b808, (const struct nvkm_specmux[]) {
-			{ 0x3fff, 0, "unk0" },
-			{}
-		}, "pgraph_tpc3_tex_unk08" },
-	{}
-};
-
-static const struct nvkm_specsrc
-nv50_vfetch_sources[] = {
-	{ 0x400c0c, (const struct nvkm_specmux[]) {
-			{ 0x1, 0, "unk0" },
-			{}
-		}, "pgraph_vfetch_unk0c" },
-	{}
-};
-
-static const struct nvkm_specdom
-nv50_pm[] = {
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xf0, (const struct nvkm_specsig[]) {
-			{ 0xc8, "pc01_gr_idle" },
-			{ 0x7f, "pc01_strmout_00" },
-			{ 0x80, "pc01_strmout_01" },
-			{ 0xdc, "pc01_trast_00" },
-			{ 0xdd, "pc01_trast_01" },
-			{ 0xde, "pc01_trast_02" },
-			{ 0xdf, "pc01_trast_03" },
-			{ 0xe2, "pc01_trast_04" },
-			{ 0xe3, "pc01_trast_05" },
-			{ 0x7c, "pc01_vattr_00" },
-			{ 0x7d, "pc01_vattr_01" },
-			{ 0x26, "pc01_vfetch_00", nv50_vfetch_sources },
-			{ 0x27, "pc01_vfetch_01", nv50_vfetch_sources },
-			{ 0x28, "pc01_vfetch_02", nv50_vfetch_sources },
-			{ 0x29, "pc01_vfetch_03", nv50_vfetch_sources },
-			{ 0x2a, "pc01_vfetch_04", nv50_vfetch_sources },
-			{ 0x2b, "pc01_vfetch_05", nv50_vfetch_sources },
-			{ 0x2c, "pc01_vfetch_06", nv50_vfetch_sources },
-			{ 0x2d, "pc01_vfetch_07", nv50_vfetch_sources },
-			{ 0x2e, "pc01_vfetch_08", nv50_vfetch_sources },
-			{ 0x2f, "pc01_vfetch_09", nv50_vfetch_sources },
-			{ 0x30, "pc01_vfetch_0a", nv50_vfetch_sources },
-			{ 0x31, "pc01_vfetch_0b", nv50_vfetch_sources },
-			{ 0x32, "pc01_vfetch_0c", nv50_vfetch_sources },
-			{ 0x33, "pc01_vfetch_0d", nv50_vfetch_sources },
-			{ 0x34, "pc01_vfetch_0e", nv50_vfetch_sources },
-			{ 0x35, "pc01_vfetch_0f", nv50_vfetch_sources },
-			{ 0x36, "pc01_vfetch_10", nv50_vfetch_sources },
-			{ 0x37, "pc01_vfetch_11", nv50_vfetch_sources },
-			{ 0x38, "pc01_vfetch_12", nv50_vfetch_sources },
-			{ 0x39, "pc01_vfetch_13", nv50_vfetch_sources },
-			{ 0x3a, "pc01_vfetch_14", nv50_vfetch_sources },
-			{ 0x3b, "pc01_vfetch_15", nv50_vfetch_sources },
-			{ 0x3c, "pc01_vfetch_16", nv50_vfetch_sources },
-			{ 0x3d, "pc01_vfetch_17", nv50_vfetch_sources },
-			{ 0x3e, "pc01_vfetch_18", nv50_vfetch_sources },
-			{ 0x3f, "pc01_vfetch_19", nv50_vfetch_sources },
-			{ 0x20, "pc01_zcull_00", nv50_zcull_sources },
-			{ 0x21, "pc01_zcull_01", nv50_zcull_sources },
-			{ 0x22, "pc01_zcull_02", nv50_zcull_sources },
-			{ 0x23, "pc01_zcull_03", nv50_zcull_sources },
-			{ 0x24, "pc01_zcull_04", nv50_zcull_sources },
-			{ 0x25, "pc01_zcull_05", nv50_zcull_sources },
-			{ 0xae, "pc01_unk00" },
-			{ 0xee, "pc01_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0xf0, (const struct nvkm_specsig[]) {
-			{ 0x52, "pc02_crop_00", nv50_crop_sources },
-			{ 0x53, "pc02_crop_01", nv50_crop_sources },
-			{ 0x54, "pc02_crop_02", nv50_crop_sources },
-			{ 0x55, "pc02_crop_03", nv50_crop_sources },
-			{ 0x00, "pc02_prop_00", nv50_prop_sources },
-			{ 0x01, "pc02_prop_01", nv50_prop_sources },
-			{ 0x02, "pc02_prop_02", nv50_prop_sources },
-			{ 0x03, "pc02_prop_03", nv50_prop_sources },
-			{ 0x04, "pc02_prop_04", nv50_prop_sources },
-			{ 0x05, "pc02_prop_05", nv50_prop_sources },
-			{ 0x06, "pc02_prop_06", nv50_prop_sources },
-			{ 0x07, "pc02_prop_07", nv50_prop_sources },
-			{ 0x70, "pc02_tex_00", nv50_tex_sources },
-			{ 0x71, "pc02_tex_01", nv50_tex_sources },
-			{ 0x72, "pc02_tex_02", nv50_tex_sources },
-			{ 0x73, "pc02_tex_03", nv50_tex_sources },
-			{ 0x40, "pc02_tex_04", nv50_tex_sources },
-			{ 0x41, "pc02_tex_05", nv50_tex_sources },
-			{ 0x42, "pc02_tex_06", nv50_tex_sources },
-			{ 0x6c, "pc02_zrop_00", nv50_zrop_sources },
-			{ 0x6d, "pc02_zrop_01", nv50_zrop_sources },
-			{ 0x6e, "pc02_zrop_02", nv50_zrop_sources },
-			{ 0x6f, "pc02_zrop_03", nv50_zrop_sources },
-			{ 0xee, "pc02_trailer" },
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{ 0x20, (const struct nvkm_specsig[]) {
-			{}
-		}, &nv40_perfctr_func },
-	{}
-};
-
-int
-nv50_pm_new(struct nvkm_device *device, enum nvkm_subdev_type type, int inst, struct nvkm_pm **ppm)
-{
-	return nv40_pm_new_(nv50_pm, device, type, inst, ppm);
-}
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
deleted file mode 100644
index c011227f7052..000000000000
--- a/drivers/gpu/drm/nouveau/nvkm/engine/pm/priv.h
+++ /dev/null
@@ -1,105 +0,0 @@
-/* SPDX-License-Identifier: MIT */
-#ifndef __NVKM_PM_PRIV_H__
-#define __NVKM_PM_PRIV_H__
-#define nvkm_pm(p) container_of((p), struct nvkm_pm, engine)
-#include <engine/pm.h>
-
-int nvkm_pm_ctor(const struct nvkm_pm_func *, struct nvkm_device *, enum nvkm_subdev_type, int,
-		 struct nvkm_pm *);
-
-struct nvkm_pm_func {
-	void (*fini)(struct nvkm_pm *);
-};
-
-struct nvkm_perfctr {
-	struct list_head head;
-	u8 domain;
-	u8  signal[4];
-	u64 source[4][8];
-	int slot;
-	u32 logic_op;
-	u32 ctr;
-};
-
-struct nvkm_specmux {
-	u32 mask;
-	u8 shift;
-	const char *name;
-	bool enable;
-};
-
-struct nvkm_specsrc {
-	u32 addr;
-	const struct nvkm_specmux *mux;
-	const char *name;
-};
-
-struct nvkm_perfsrc {
-	struct list_head head;
-	char *name;
-	u32 addr;
-	u32 mask;
-	u8 shift;
-	bool enable;
-};
-
-extern const struct nvkm_specsrc nv50_zcull_sources[];
-extern const struct nvkm_specsrc nv50_zrop_sources[];
-extern const struct nvkm_specsrc g84_vfetch_sources[];
-extern const struct nvkm_specsrc gt200_crop_sources[];
-extern const struct nvkm_specsrc gt200_prop_sources[];
-extern const struct nvkm_specsrc gt200_tex_sources[];
-
-struct nvkm_specsig {
-	u8 signal;
-	const char *name;
-	const struct nvkm_specsrc *source;
-};
-
-struct nvkm_perfsig {
-	const char *name;
-	u8 source[8];
-};
-
-struct nvkm_specdom {
-	u16 signal_nr;
-	const struct nvkm_specsig *signal;
-	const struct nvkm_funcdom *func;
-};
-
-#define nvkm_perfdom(p) container_of((p), struct nvkm_perfdom, object)
-#include <core/object.h>
-
-struct nvkm_perfdom {
-	struct nvkm_object object;
-	struct nvkm_perfmon *perfmon;
-	struct list_head head;
-	struct list_head list;
-	const struct nvkm_funcdom *func;
-	struct nvkm_perfctr *ctr[4];
-	char name[32];
-	u32 addr;
-	u8  mode;
-	u32 clk;
-	u16 signal_nr;
-	struct nvkm_perfsig signal[] __counted_by(signal_nr);
-};
-
-struct nvkm_funcdom {
-	void (*init)(struct nvkm_pm *, struct nvkm_perfdom *,
-		     struct nvkm_perfctr *);
-	void (*read)(struct nvkm_pm *, struct nvkm_perfdom *,
-		     struct nvkm_perfctr *);
-	void (*next)(struct nvkm_pm *, struct nvkm_perfdom *);
-};
-
-int nvkm_perfdom_new(struct nvkm_pm *, const char *, u32, u32, u32, u32,
-		     const struct nvkm_specdom *);
-
-#define nvkm_perfmon(p) container_of((p), struct nvkm_perfmon, object)
-
-struct nvkm_perfmon {
-	struct nvkm_object object;
-	struct nvkm_pm *pm;
-};
-#endif
-- 
2.45.1

