Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 877D3BBF612
	for <lists+nouveau@lfdr.de>; Mon, 06 Oct 2025 22:48:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D91F510E545;
	Mon,  6 Oct 2025 20:47:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PNIOMZ2L";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2050.outbound.protection.outlook.com [40.107.94.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6EBCF10EBF5
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:12:11 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LWt2lguKeuMyYF4mA+D9D1oGYiy9bLXu2NxDisP1rnSwd34ijBTLskHtYfpSD1VmwL2jXjBulafAu20ZhOW34zSVXReV/1u41pGXl9EYp8WT58p7YGYi7430sTNelm9MqP47gDQmTFDbRGCQ9tWDhymn9t0NdgvYTalluWo9hlDVhToqwqcLfvd26AZSQfWY9LKE5seH7vVz9BwIBXdqSm1WCTjWEGpa2iH8WFHbU1xh5djNMHjtOozvPlPRerTY+gOkrFXEceccq/hta/VVqGKQVjflOQDP7PAd7HYZdl2fsLOucH7cQHZnrIJMZxbX7xe7JN3A0mNOAsYv3Mt+gw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FPTT9SsU+Hyci6Ma6w7bPJMSkpZijOr4ZZzocz2I2pU=;
 b=ZVAuOcMfgNuQOGxnvqCGZMfqT+5bdxnJjUpx2vU4QLvCsykUcKjh11/PGbimqMOK411OxVmRw3dqG6s0+F4vUOva4E/hzKsgoWGx02YeXhbioPzrobAT4XsVsgydCqJVswawZeZdYxmV02g2QeA8WPx2+x1BSWtkCZ+jWznrW4CbzNwniPfhqgVM3vOic/kmIftv8jQcxaH5mD+0IgRXgyK06QRX7UDtJCh25zO1wvts0NqA+789dstr3lrT7crw58/f2dJddCSi0WU7hrRXQI7cTvMB+Jc19r3DZQIOAkbmR4yvv2k2wIuGLPtq72gf0eVJJdRrZ6XMYN1h+OwbEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FPTT9SsU+Hyci6Ma6w7bPJMSkpZijOr4ZZzocz2I2pU=;
 b=PNIOMZ2LKp2pW+xyf9iKaxfv5+iXXxkuEufG+CGLJvkyP38Fiq6Dnsp98Mea0UFH+oQaec++63Jt/t6WbNIUZL6Izm3Nih9ewVhPtOQKitsN3zCaak6Rzkx0+Q8+DiNLY88Zp461+yzIsHgCoRVZeccqt9RPp/BK016cAw5OdlusquDAFFsW+f7O+RI4lUAqdKTaxypuwzqJ8Cq9TcS4R8xtC9SgAfBb0lNlh0qMIu03doJdm452bas1YSDnp9ayVOApwOdJ1cwRXjrgdXeM/AIgcDIvyjgWEZfR3ZzZX0npWqlRbfVo/18xytBZ9n1cpeEvYrSIRp+vmuThz0Aq7g==
Received: from CH0PR03CA0100.namprd03.prod.outlook.com (2603:10b6:610:cd::15)
 by DM4PR12MB7669.namprd12.prod.outlook.com (2603:10b6:8:106::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sat, 17 May
 2025 00:11:52 +0000
Received: from CH2PEPF00000144.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::ca) by CH0PR03CA0100.outlook.office365.com
 (2603:10b6:610:cd::15) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:11:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000144.mail.protection.outlook.com (10.167.244.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:39 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:38 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 62/62] drm/nouveau/kms: add support for GB20x
Date: Sat, 17 May 2025 10:09:54 +1000
Message-ID: <20250517000954.35691-63-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH2PEPF00000144:EE_|DM4PR12MB7669:EE_
X-MS-Office365-Filtering-Correlation-Id: 0cf84b46-0d3e-4c4b-c87e-08dd94d76cd8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?fuIutY4m0LHeL5LB+Eh0O1mtf0fqYpR61RVkBpI3ZLmYDte1cgQ82IvLzxh9?=
 =?us-ascii?Q?c/0YjB+Mdxodm9DPlQemDU54K+W6erjA4PSJ6DkPxHwGq0fEbesMfT5snPrZ?=
 =?us-ascii?Q?LHrR4MuiESX7HBojE+o67wqaOm/x5xVLtxV+AVY1B+/5yAVSTX/D6BcFdYHs?=
 =?us-ascii?Q?q/5vSaebVGFycB72VceU9+R8Kyf1ChwCv5B2fxjPYMQrzFEbEJ2i/R73FY2/?=
 =?us-ascii?Q?AWeaNdLWhmT0CNuA0Xy5AeWSa3UpSUKBbeehyjvjzmpOyr80xG26r0LmLRKE?=
 =?us-ascii?Q?IbAsFRzVXyN0wAI4cudoafH3FzwUF2YGzhUCEp6iZc9l0Qeo0YY7LWQnQ2QY?=
 =?us-ascii?Q?iAwxMd/Ir/5MRMGziZlplffwQS5/jQ3HeTv0xOvlX3xaqUVt+D3z6XrgMFUK?=
 =?us-ascii?Q?lDxYYZqWoF2HoDX+NKdzl+q1lE6GNajHfOnDQaLUnjlLQLnDxfe6ginxXEuy?=
 =?us-ascii?Q?4/i5iYcMZB1nVGx7M+EFETq/rwozmTsQ5af4tXEpTLdUdH3S0/WCuQ3FQx3X?=
 =?us-ascii?Q?kxAZaJvukY/RpE/KEJaleAnztQw6AzeyEv2NOyU9PaKUMaHXXSw34LkN6WJ1?=
 =?us-ascii?Q?Y1LokHvuUnTQPObvtxB7EfkV0TNaufYuR/P0UnRM0l0OgX03v2qUW3E6z4Rm?=
 =?us-ascii?Q?z/XhUX4dPBtWKV+Z6w4AFjnSTlwuM109oISFVCuRarUZJXCKhRuWzlN/xDVI?=
 =?us-ascii?Q?mriLoPRnxlOpel/0hrL5UwSQ5yrkUu99GyAifFtxKYfdbURlN1TfzkvB2MyG?=
 =?us-ascii?Q?DrxSFljWR5TL9yMvTvgSi4ZtgwWRjW/WjWGmS8EgwZfoTvQgbYXPYepyO0Um?=
 =?us-ascii?Q?p0XHdhI+oJNd0CE/tbSNurcdT1TlsLtnXQy6zJIwzSGmoyz2rcnP/Z3lXWWB?=
 =?us-ascii?Q?KzkpdRgMlHmTFUFpcdmTuhSBBrFHp+2VxaLv9wkf/5PJ76CXvSCIFs29Ulf6?=
 =?us-ascii?Q?KjSldExd7HkWNeiBJtAjF1P3vMCr6UsXiHTSfbZwO85ACFWy1yNO/aVtnAK1?=
 =?us-ascii?Q?nrPwgQ9x5wkf7e0C2bwVHdKOSdJ/sVMZalVqAGWsGNJ5f6mVCxh0YG+z9tN4?=
 =?us-ascii?Q?bNZ2XRG0Bv/0DutXCjjM8MJh//9ibl2hw7jkhUT7yZvKyN5Jj+Ee5921qNWI?=
 =?us-ascii?Q?32dIaZlEK4iWc4AAwrXxOufcQCD2YylYagTSrOjwoiMxVPjOEsT9AuXARxSE?=
 =?us-ascii?Q?7FUAqbW/M8gJ4uvGDFzM15IzA7+7vaTPh3vfLAFMl6HQlHWSyNQMzkii/K3f?=
 =?us-ascii?Q?n2eXVq0sXpYtGIl+qOa+z59KSTlXC9oMXdb4HZ6nTHzp1yw/zp0YIqhbQj2A?=
 =?us-ascii?Q?6AH48+BmdgjGYYW8I95DaQoJXCE54rPE3hYQVDTmhUzuS6nxhRkuJIdfYd/Q?=
 =?us-ascii?Q?L94dUolbzYDLN5ku0i1EQxaBA4GAHw/8uZ9Upljzvi4ZVFtmAQWCbyJ1OKMp?=
 =?us-ascii?Q?LQlr74gHu896B35+XLvBOY24QziFjfYRHO5Q9TSzpxRwbWiMlZpZq/zOD1fI?=
 =?us-ascii?Q?0OFDsQWKfOLtmzNfObMpYlOhoX/TTEmGVuju?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:52.0011 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0cf84b46-0d3e-4c4b-c87e-08dd94d76cd8
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000144.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7669
X-Mailman-Approved-At: Mon, 06 Oct 2025 20:47:07 +0000
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

Adds basic support for the new display classes available on GB20x GPUs.

Most of the changes here deal with HW method moves, with the only other
change of note being tweaks to skip allocation of CTXDMA objects, which
aren't required on Blackwell display.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/Kbuild       |   4 +
 drivers/gpu/drm/nouveau/dispnv50/core.c       |   1 +
 drivers/gpu/drm/nouveau/dispnv50/core.h       |   6 +
 drivers/gpu/drm/nouveau/dispnv50/core507d.c   |   1 +
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c   |   3 +-
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c   |   2 +
 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c   | 122 +++
 drivers/gpu/drm/nouveau/dispnv50/crc.c        |   4 +
 drivers/gpu/drm/nouveau/dispnv50/crc.h        |   1 +
 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c    |  98 ++
 drivers/gpu/drm/nouveau/dispnv50/curs.c       |   1 +
 drivers/gpu/drm/nouveau/dispnv50/disp.c       |  10 +
 drivers/gpu/drm/nouveau/dispnv50/head.c       |   1 +
 drivers/gpu/drm/nouveau/dispnv50/head.h       |   5 +
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c   |   2 +-
 drivers/gpu/drm/nouveau/dispnv50/headca7d.c   | 297 ++++++
 drivers/gpu/drm/nouveau/dispnv50/wimm.c       |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       |  25 +-
 drivers/gpu/drm/nouveau/dispnv50/wndw.h       |   3 +
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c   |   1 +
 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c   | 209 +++++
 .../drm/nouveau/include/nvhw/class/clc97b.h   |  22 +
 .../drm/nouveau/include/nvhw/class/clca7d.h   | 868 ++++++++++++++++++
 .../drm/nouveau/include/nvhw/class/clca7e.h   | 137 +++
 .../gpu/drm/nouveau/include/nvif/pushc97b.h   |  18 +
 drivers/gpu/drm/nouveau/nouveau_connector.c   |   2 +
 drivers/gpu/drm/nouveau/nvif/disp.c           |   1 +
 27 files changed, 1836 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/coreca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/headca7d.c
 create mode 100644 drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clc97b.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvhw/class/clca7e.h
 create mode 100644 drivers/gpu/drm/nouveau/include/nvif/pushc97b.h

diff --git a/drivers/gpu/drm/nouveau/dispnv50/Kbuild b/drivers/gpu/drm/nouveau/dispnv50/Kbuild
index 28be2912ff74..d5049dee4b8c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/Kbuild
+++ b/drivers/gpu/drm/nouveau/dispnv50/Kbuild
@@ -9,11 +9,13 @@ nouveau-y += dispnv50/core907d.o
 nouveau-y += dispnv50/core917d.o
 nouveau-y += dispnv50/corec37d.o
 nouveau-y += dispnv50/corec57d.o
+nouveau-y += dispnv50/coreca7d.o
 
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crc.o
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crc907d.o
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crcc37d.o
 nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crcc57d.o
+nouveau-$(CONFIG_DEBUG_FS) += dispnv50/crcca7d.o
 
 nouveau-y += dispnv50/dac507d.o
 nouveau-y += dispnv50/dac907d.o
@@ -31,6 +33,7 @@ nouveau-y += dispnv50/head907d.o
 nouveau-y += dispnv50/head917d.o
 nouveau-y += dispnv50/headc37d.o
 nouveau-y += dispnv50/headc57d.o
+nouveau-y += dispnv50/headca7d.o
 
 nouveau-y += dispnv50/wimm.o
 nouveau-y += dispnv50/wimmc37b.o
@@ -39,6 +42,7 @@ nouveau-y += dispnv50/wndw.o
 nouveau-y += dispnv50/wndwc37e.o
 nouveau-y += dispnv50/wndwc57e.o
 nouveau-y += dispnv50/wndwc67e.o
+nouveau-y += dispnv50/wndwca7e.o
 
 nouveau-y += dispnv50/base.o
 nouveau-y += dispnv50/base507c.o
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index f045515696cb..c6331bf97582 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -42,6 +42,7 @@ nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 		int version;
 		int (*new)(struct nouveau_drm *, s32, struct nv50_core **);
 	} cores[] = {
+		{ GB202_DISP_CORE_CHANNEL_DMA, 0, coreca7d_new },
 		{ AD102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
 		{ GA102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
 		{ TU102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.h b/drivers/gpu/drm/nouveau/dispnv50/core.h
index f75088186fba..aa07a3ad5dfd 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.h
@@ -7,7 +7,10 @@
 
 struct nv50_core {
 	const struct nv50_core_func *func;
+	struct nv50_disp *disp;
+
 	struct nv50_dmac chan;
+
 	bool assign_windows;
 };
 
@@ -18,6 +21,7 @@ struct nv50_core_func {
 	int (*init)(struct nv50_core *);
 	void (*ntfy_init)(struct nouveau_bo *, u32 offset);
 	int (*caps_init)(struct nouveau_drm *, struct nv50_disp *);
+	u32 caps_class;
 	int (*ntfy_wait_done)(struct nouveau_bo *, u32 offset,
 			      struct nvif_device *);
 	int (*update)(struct nv50_core *, u32 *interlock, bool ntfy);
@@ -70,4 +74,6 @@ int corec37d_wndw_owner(struct nv50_core *);
 extern const struct nv50_outp_func sorc37d;
 
 int corec57d_new(struct nouveau_drm *, s32, struct nv50_core **);
+
+int coreca7d_new(struct nouveau_drm *, s32, struct nv50_core **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index ce2cb78bbdd3..4b947b67a844 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -165,6 +165,7 @@ core507d_new_(const struct nv50_core_func *func, struct nouveau_drm *drm,
 	if (!(core = *pcore = kzalloc(sizeof(*core), GFP_KERNEL)))
 		return -ENOMEM;
 	core->func = func;
+	core->disp = disp;
 
 	ret = nv50_dmac_create(drm,
 			       &oclass, 0, &args, sizeof(args),
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index 7f637b8830be..83eec2f091f0 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -105,7 +105,7 @@ int corec37d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 	int ret;
 
 	ret = nvif_object_ctor(&disp->disp->object, "dispCaps", 0,
-			       GV100_DISP_CAPS, NULL, 0, &disp->caps);
+			       disp->core->func->caps_class, NULL, 0, &disp->caps);
 	if (ret) {
 		NV_ERROR(drm,
 			 "Failed to init notifier caps region: %d\n",
@@ -162,6 +162,7 @@ corec37d = {
 	.init = corec37d_init,
 	.ntfy_init = corec37d_ntfy_init,
 	.caps_init = corec37d_caps_init,
+	.caps_class = GV100_DISP_CAPS,
 	.ntfy_wait_done = corec37d_ntfy_wait_done,
 	.update = corec37d_update,
 	.wndw.owner = corec37d_wndw_owner,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 421d0d57e1d8..39be576eadcb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -22,6 +22,7 @@
 #include "core.h"
 #include "head.h"
 
+#include <nvif/class.h>
 #include <nvif/pushc37b.h>
 
 #include <nvhw/class/clc57d.h>
@@ -63,6 +64,7 @@ corec57d = {
 	.init = corec57d_init,
 	.ntfy_init = corec37d_ntfy_init,
 	.caps_init = corec37d_caps_init,
+	.caps_class = GV100_DISP_CAPS,
 	.ntfy_wait_done = corec37d_ntfy_wait_done,
 	.update = corec37d_update,
 	.wndw.owner = corec37d_wndw_owner,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/coreca7d.c b/drivers/gpu/drm/nouveau/dispnv50/coreca7d.c
new file mode 100644
index 000000000000..171727be400e
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/coreca7d.c
@@ -0,0 +1,122 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "core.h"
+#include "head.h"
+
+#include <nvif/class.h>
+#include <nvif/pushc97b.h>
+
+#include <nvhw/class/clca7d.h>
+
+#include <nouveau_bo.h>
+
+static int
+coreca7d_update(struct nv50_core *core, u32 *interlock, bool ntfy)
+{
+	const u64 ntfy_addr = core->disp->sync->offset + NV50_DISP_CORE_NTFY;
+	const u32 ntfy_hi = upper_32_bits(ntfy_addr);
+	const u32 ntfy_lo = lower_32_bits(ntfy_addr);
+	struct nvif_push *push = &core->chan.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 5 + (ntfy ? 5 + 2 : 0));
+	if (ret)
+		return ret;
+
+	if (ntfy) {
+		PUSH_MTHD(push, NVCA7D, SET_SURFACE_ADDRESS_HI_NOTIFIER, ntfy_hi,
+
+					SET_SURFACE_ADDRESS_LO_NOTIFIER,
+			  NVVAL(NVCA7D, SET_SURFACE_ADDRESS_LO_NOTIFIER, ADDRESS_LO, ntfy_lo >> 4) |
+			  NVDEF(NVCA7D, SET_SURFACE_ADDRESS_LO_NOTIFIER, TARGET, PHYSICAL_NVM) |
+			  NVDEF(NVCA7D, SET_SURFACE_ADDRESS_LO_NOTIFIER, ENABLE, ENABLE));
+
+		PUSH_MTHD(push, NVCA7D, SET_NOTIFIER_CONTROL,
+			  NVDEF(NVCA7D, SET_NOTIFIER_CONTROL, MODE, WRITE) |
+			  NVDEF(NVCA7D, SET_NOTIFIER_CONTROL, NOTIFY, ENABLE));
+	}
+
+	PUSH_MTHD(push, NVCA7D, SET_INTERLOCK_FLAGS, interlock[NV50_DISP_INTERLOCK_CURS],
+				SET_WINDOW_INTERLOCK_FLAGS, interlock[NV50_DISP_INTERLOCK_WNDW]);
+
+	PUSH_MTHD(push, NVCA7D, UPDATE,
+		  NVDEF(NVCA7D, UPDATE, RELEASE_ELV, TRUE) |
+		  NVDEF(NVCA7D, UPDATE, SPECIAL_HANDLING, NONE) |
+		  NVDEF(NVCA7D, UPDATE, INHIBIT_INTERRUPTS, FALSE));
+
+	if (ntfy) {
+		PUSH_MTHD(push, NVCA7D, SET_NOTIFIER_CONTROL,
+			  NVDEF(NVCA7D, SET_NOTIFIER_CONTROL, NOTIFY, DISABLE));
+	}
+
+	return PUSH_KICK(push);
+}
+
+static int
+coreca7d_init(struct nv50_core *core)
+{
+	struct nvif_push *push = &core->chan.push;
+	const u32 windows = 8, heads = 4;
+	int ret, i;
+
+	ret = PUSH_WAIT(push, windows * 6 + heads * 6);
+	if (ret)
+		return ret;
+
+	for (i = 0; i < windows; i++) {
+		PUSH_MTHD(push, NVCA7D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS(i),
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS, RGB_PACKED1BPP, TRUE) |
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS, RGB_PACKED2BPP, TRUE) |
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS, RGB_PACKED4BPP, TRUE) |
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS, RGB_PACKED8BPP, TRUE),
+
+					WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS(i), 0x00000000);
+
+		PUSH_MTHD(push, NVCA7D, WINDOW_SET_WINDOW_USAGE_BOUNDS(i),
+			  NVVAL(NVCA7D, WINDOW_SET_WINDOW_USAGE_BOUNDS, MAX_PIXELS_FETCHED_PER_LINE, 0x7fff) |
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_USAGE_BOUNDS, ILUT_ALLOWED, TRUE) |
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_USAGE_BOUNDS, INPUT_SCALER_TAPS, TAPS_2) |
+			  NVDEF(NVCA7D, WINDOW_SET_WINDOW_USAGE_BOUNDS, UPSCALING_ALLOWED, FALSE),
+
+					WINDOW_SET_PHYSICAL(i), BIT(i));
+	}
+
+	for (i = 0; i < heads; i++) {
+		PUSH_MTHD(push, NVCA7D, HEAD_SET_HEAD_USAGE_BOUNDS(i),
+			  NVDEF(NVCA7D, HEAD_SET_HEAD_USAGE_BOUNDS, CURSOR, USAGE_W256_H256) |
+			  NVDEF(NVCA7D, HEAD_SET_HEAD_USAGE_BOUNDS, OLUT_ALLOWED, TRUE) |
+			  NVDEF(NVCA7D, HEAD_SET_HEAD_USAGE_BOUNDS, OUTPUT_SCALER_TAPS, TAPS_2) |
+			  NVDEF(NVCA7D, HEAD_SET_HEAD_USAGE_BOUNDS, UPSCALING_ALLOWED, TRUE));
+
+		PUSH_MTHD(push, NVCA7D, HEAD_SET_TILE_MASK(i), BIT(i));
+
+		PUSH_MTHD(push, NVCA7D, TILE_SET_TILE_SIZE(i), 0);
+	}
+
+	core->assign_windows = true;
+	return PUSH_KICK(push);
+}
+
+static const struct nv50_core_func
+coreca7d = {
+	.init = coreca7d_init,
+	.ntfy_init = corec37d_ntfy_init,
+	.caps_init = corec37d_caps_init,
+	.caps_class = GB202_DISP_CAPS,
+	.ntfy_wait_done = corec37d_ntfy_wait_done,
+	.update = coreca7d_update,
+	.wndw.owner = corec37d_wndw_owner,
+	.head = &headca7d,
+	.sor = &sorc37d,
+#if IS_ENABLED(CONFIG_DEBUG_FS)
+	.crc = &crcca7d,
+#endif
+};
+
+int
+coreca7d_new(struct nouveau_drm *drm, s32 oclass, struct nv50_core **pcore)
+{
+	return core507d_new_(&coreca7d, drm, oclass, pcore);
+}
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.c b/drivers/gpu/drm/nouveau/dispnv50/crc.c
index 5936b6b3b15d..deb6af40ef32 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.c
@@ -509,6 +509,10 @@ nv50_crc_ctx_init(struct nv50_head *head, struct nvif_mmu *mmu,
 	if (ret)
 		return ret;
 
+	/* No CTXDMAs on Blackwell. */
+	if (core->chan.base.user.oclass >= GB202_DISP_CORE_CHANNEL_DMA)
+		return 0;
+
 	ret = nvif_object_ctor(&core->chan.base.user, "kmsCrcNtfyCtxDma",
 			       NV50_DISP_HANDLE_CRC_CTX(head, idx),
 			       NV_DMA_IN_MEMORY,
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc.h b/drivers/gpu/drm/nouveau/dispnv50/crc.h
index 4823f1fde2dd..75a2009e8193 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc.h
@@ -94,6 +94,7 @@ void nv50_crc_atomic_clr(struct nv50_head *);
 extern const struct nv50_crc_func crc907d;
 extern const struct nv50_crc_func crcc37d;
 extern const struct nv50_crc_func crcc57d;
+extern const struct nv50_crc_func crcca7d;
 
 #else /* IS_ENABLED(CONFIG_DEBUG_FS) */
 struct nv50_crc {};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
new file mode 100644
index 000000000000..912f59aebe87
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcca7d.c
@@ -0,0 +1,98 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "crcc37d.h"
+#include "core.h"
+#include "head.h"
+
+#include <nvif/pushc97b.h>
+
+#include <nvhw/class/clca7d.h>
+
+static int
+crcca7d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, ctx ? 3 : 2);
+	if (ret)
+		return ret;
+
+	if (ctx) {
+		const u32 crc_hi = upper_32_bits(ctx->mem.addr);
+		const u32 crc_lo = lower_32_bits(ctx->mem.addr);
+
+		PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_HI_CRC(i), crc_hi,
+
+					HEAD_SET_SURFACE_ADDRESS_LO_CRC(i),
+			  NVVAL(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, ADDRESS_LO, crc_lo >> 4) |
+			  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, TARGET, PHYSICAL_NVM) |
+			  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, ENABLE, ENABLE));
+	} else {
+		PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC(i),
+			  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CRC, ENABLE, DISABLE));
+	}
+
+	return 0;
+}
+
+static int
+crcca7d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
+		struct nv50_crc_notifier_ctx *ctx)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int primary_crc, ret;
+
+	if (!source) {
+		ret = PUSH_WAIT(push, 1);
+		if (ret)
+			return ret;
+
+		PUSH_MTHD(push, NVCA7D, HEAD_SET_CRC_CONTROL(i), 0);
+
+		return crcca7d_set_ctx(head, NULL);
+	}
+
+	switch (source) {
+	case NV50_CRC_SOURCE_TYPE_SOR:
+		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR(or);
+		break;
+	case NV50_CRC_SOURCE_TYPE_SF:
+		primary_crc = NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF;
+		break;
+	default:
+		break;
+	}
+
+	ret = crcca7d_set_ctx(head, ctx);
+	if (ret)
+		return ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_CRC_CONTROL(i),
+		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
+		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
+		  NVVAL(NVCA7D, HEAD_SET_CRC_CONTROL, PRIMARY_CRC, primary_crc) |
+		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, SECONDARY_CRC, NONE) |
+		  NVDEF(NVCA7D, HEAD_SET_CRC_CONTROL, CRC_DURING_SNOOZE, DISABLE));
+
+	return 0;
+}
+
+const struct nv50_crc_func
+crcca7d = {
+	.set_src = crcca7d_set_src,
+	.set_ctx = crcca7d_set_ctx,
+	.get_entry = crcc37d_get_entry,
+	.ctx_finished = crcc37d_ctx_finished,
+	.flip_threshold = CRCC37D_FLIP_THRESHOLD,
+	.num_entries = CRCC37D_MAX_ENTRIES,
+	.notifier_len = sizeof(struct crcc37d_notifier),
+};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs.c b/drivers/gpu/drm/nouveau/dispnv50/curs.c
index 31d8b2e4791d..557bd05240fa 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs.c
@@ -31,6 +31,7 @@ nv50_curs_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 		int version;
 		int (*new)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
 	} curses[] = {
+		{ GB202_DISP_CURSOR, 0, cursc37a_new },
 		{ GA102_DISP_CURSOR, 0, cursc37a_new },
 		{ TU102_DISP_CURSOR, 0, cursc37a_new },
 		{ GV100_DISP_CURSOR, 0, cursc37a_new },
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 10485510b539..e5d37eee4301 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -279,6 +279,16 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (syncbuf < 0)
 		return 0;
 
+	/* No CTXDMAs on Blackwell. */
+	if (disp->oclass >= GB202_DISP) {
+		/* "handle != NULL_HANDLE" is used to determine enable status
+		 * in a number of places, so fill in some fake object handles.
+		 */
+		dmac->sync.handle = NV50_DISP_HANDLE_SYNCBUF;
+		dmac->vram.handle = NV50_DISP_HANDLE_VRAM;
+		return 0;
+	}
+
 	ret = nvif_object_ctor(&dmac->base.user, "kmsSyncCtxDma", NV50_DISP_HANDLE_SYNCBUF,
 			       NV_DMA_IN_MEMORY,
 			       &(struct nv_dma_v0) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.c b/drivers/gpu/drm/nouveau/dispnv50/head.c
index d7c74cc43ba5..3dd742b4f823 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.c
@@ -577,6 +577,7 @@ nv50_head_create(struct drm_device *dev, int index)
 		return ERR_PTR(-ENOMEM);
 
 	head->func = disp->core->func->head;
+	head->disp = disp;
 	head->base.index = index;
 
 	if (disp->disp->object.oclass < GF110_DISP)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head.h b/drivers/gpu/drm/nouveau/dispnv50/head.h
index e9d17037ffcf..8bd2fcb1eff5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/head.h
@@ -13,6 +13,8 @@
 
 struct nv50_head {
 	const struct nv50_head_func *func;
+	struct nv50_disp *disp;
+
 	struct nouveau_crtc base;
 	struct nv50_crc crc;
 	struct nv50_lut olut;
@@ -98,4 +100,7 @@ int headc37d_dither(struct nv50_head *, struct nv50_head_atom *);
 void headc37d_static_wndw_map(struct nv50_head *, struct nv50_head_atom *);
 
 extern const struct nv50_head_func headc57d;
+bool headc57d_olut(struct nv50_head *, struct nv50_head_atom *, int size);
+
+extern const struct nv50_head_func headca7d;
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index fde4087e7691..3f8ba495de8f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -182,7 +182,7 @@ headc57d_olut_load(struct drm_color_lut *in, int size, void __iomem *mem)
 	writew(readw(mem - 4), mem + 4);
 }
 
-static bool
+bool
 headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 {
 	if (size != 0 && size != 256 && size != 1024)
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headca7d.c b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
new file mode 100644
index 000000000000..eeaeb15aa664
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/headca7d.c
@@ -0,0 +1,297 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "head.h"
+#include "atom.h"
+#include "core.h"
+
+#include <nvif/pushc97b.h>
+
+#include <nvhw/class/clca7d.h>
+
+static int
+headca7d_display_id(struct nv50_head *head, u32 display_id)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_DISPLAY_ID(i, 0), display_id);
+
+	return 0;
+}
+
+static int
+headca7d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	u8 depth;
+	int ret;
+
+	switch (asyh->or.depth) {
+	case 6:
+		depth = NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_30_444;
+		break;
+	case 5:
+		depth = NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_24_444;
+		break;
+	case 2:
+		depth = NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_18_444;
+		break;
+	case 0:
+		depth = NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_24_444;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE(i),
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE, CRC_MODE, asyh->or.crc_raster) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE, HSYNC_POLARITY, asyh->or.nhsync) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE, VSYNC_POLARITY, asyh->or.nvsync) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE, PIXEL_DEPTH, depth) |
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE, COLOR_SPACE_OVERRIDE, DISABLE) |
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_OUTPUT_RESOURCE, EXT_PACKET_WIN, NONE));
+
+	return 0;
+}
+
+static int
+headca7d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_PROCAMP(i),
+		  NVDEF(NVCA7D, HEAD_SET_PROCAMP, COLOR_SPACE, RGB) |
+		  NVDEF(NVCA7D, HEAD_SET_PROCAMP, CHROMA_LPF, DISABLE) |
+		  NVDEF(NVCA7D, HEAD_SET_PROCAMP, DYNAMIC_RANGE, VESA));
+
+	return 0;
+}
+
+static int
+headca7d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_DITHER_CONTROL(i),
+		  NVVAL(NVCA7D, HEAD_SET_DITHER_CONTROL, ENABLE, asyh->dither.enable) |
+		  NVVAL(NVCA7D, HEAD_SET_DITHER_CONTROL, BITS, asyh->dither.bits) |
+		  NVDEF(NVCA7D, HEAD_SET_DITHER_CONTROL, OFFSET_ENABLE, DISABLE) |
+		  NVVAL(NVCA7D, HEAD_SET_DITHER_CONTROL, MODE, asyh->dither.mode) |
+		  NVVAL(NVCA7D, HEAD_SET_DITHER_CONTROL, PHASE, 0));
+
+	return 0;
+}
+
+static int
+headca7d_curs_clr(struct nv50_head *head)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 4);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL_CURSOR(i),
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_CURSOR, ENABLE, DISABLE) |
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_CURSOR, FORMAT, A8R8G8B8));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CURSOR(i, 0),
+		  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CURSOR, ENABLE, DISABLE));
+
+	return 0;
+}
+
+static int
+headca7d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const u32 curs_hi = upper_32_bits(asyh->curs.offset);
+	const u32 curs_lo = lower_32_bits(asyh->curs.offset);
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 7);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_HI_CURSOR(i, 0), curs_hi);
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CURSOR(i, 0),
+		  NVVAL(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CURSOR, ADDRESS_LO, curs_lo >> 4) |
+		  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CURSOR, TARGET, PHYSICAL_NVM) |
+		  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_CURSOR, ENABLE, ENABLE));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL_CURSOR(i),
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_CURSOR, ENABLE, ENABLE) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_CURSOR, FORMAT, asyh->curs.format) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_CURSOR, SIZE, asyh->curs.layout) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_CURSOR, HOT_SPOT_X, 0) |
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_CURSOR, HOT_SPOT_Y, 0),
+
+				HEAD_SET_CONTROL_CURSOR_COMPOSITION(i),
+		  NVVAL(NVCA7D, HEAD_SET_CONTROL_CURSOR_COMPOSITION, K1, 0xff) |
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_CURSOR_COMPOSITION, CURSOR_COLOR_FACTOR_SELECT,
+								     K1) |
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_CURSOR_COMPOSITION, VIEWPORT_COLOR_FACTOR_SELECT,
+								     NEG_K1_TIMES_SRC) |
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL_CURSOR_COMPOSITION, MODE, BLEND));
+
+	return 0;
+}
+
+static int
+headca7d_olut_clr(struct nv50_head *head)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_OLUT(i),
+		  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_OLUT, ENABLE, DISABLE));
+
+	return 0;
+}
+
+static int
+headca7d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const u32 olut_hi = upper_32_bits(asyh->olut.offset);
+	const u32 olut_lo = lower_32_bits(asyh->olut.offset);
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 6);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_SURFACE_ADDRESS_HI_OLUT(i), olut_hi,
+
+				HEAD_SET_SURFACE_ADDRESS_LO_OLUT(i),
+		  NVVAL(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_OLUT, ADDRESS_LO, olut_lo >> 4) |
+		  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_OLUT, TARGET, PHYSICAL_NVM) |
+		  NVDEF(NVCA7D, HEAD_SET_SURFACE_ADDRESS_LO_OLUT, ENABLE, ENABLE));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_OLUT_CONTROL(i),
+		  NVVAL(NVCA7D, HEAD_SET_OLUT_CONTROL, INTERPOLATE, asyh->olut.output_mode) |
+		  NVDEF(NVCA7D, HEAD_SET_OLUT_CONTROL, MIRROR, DISABLE) |
+		  NVVAL(NVCA7D, HEAD_SET_OLUT_CONTROL, MODE, asyh->olut.mode) |
+		  NVVAL(NVCA7D, HEAD_SET_OLUT_CONTROL, SIZE, asyh->olut.size),
+
+				HEAD_SET_OLUT_FP_NORM_SCALE(i), 0xffffffff);
+
+	return 0;
+}
+
+static int
+headca7d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	struct nv50_head_mode *m = &asyh->mode;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 11);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_RASTER_SIZE(i),
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_SIZE, WIDTH, m->h.active) |
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_SIZE, HEIGHT, m->v.active),
+
+				HEAD_SET_RASTER_SYNC_END(i),
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_SYNC_END, X, m->h.synce) |
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_SYNC_END, Y, m->v.synce),
+
+				HEAD_SET_RASTER_BLANK_END(i),
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_BLANK_END, X, m->h.blanke) |
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_BLANK_END, Y, m->v.blanke),
+
+				HEAD_SET_RASTER_BLANK_START(i),
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_BLANK_START, X, m->h.blanks) |
+		  NVVAL(NVCA7D, HEAD_SET_RASTER_BLANK_START, Y, m->v.blanks));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_CONTROL(i),
+		  NVDEF(NVCA7D, HEAD_SET_CONTROL, STRUCTURE, PROGRESSIVE));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY(i),
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY, HERTZ, m->clock * 1000));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX(i),
+		  NVVAL(NVCA7D, HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX, HERTZ, m->clock * 1000));
+
+	return 0;
+}
+
+static int
+headca7d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
+{
+	struct nvif_push *push = &head->disp->core->chan.push;
+	const int i = head->base.index;
+	int ret;
+
+	ret = PUSH_WAIT(push, 4);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_VIEWPORT_SIZE_IN(i),
+		  NVVAL(NVCA7D, HEAD_SET_VIEWPORT_SIZE_IN, WIDTH, asyh->view.iW) |
+		  NVVAL(NVCA7D, HEAD_SET_VIEWPORT_SIZE_IN, HEIGHT, asyh->view.iH));
+
+	PUSH_MTHD(push, NVCA7D, HEAD_SET_VIEWPORT_SIZE_OUT(i),
+		  NVVAL(NVCA7D, HEAD_SET_VIEWPORT_SIZE_OUT, WIDTH, asyh->view.oW) |
+		  NVVAL(NVCA7D, HEAD_SET_VIEWPORT_SIZE_OUT, HEIGHT, asyh->view.oH));
+	return 0;
+}
+
+const struct nv50_head_func
+headca7d = {
+	.view = headca7d_view,
+	.mode = headca7d_mode,
+	.olut = headc57d_olut,
+	.ilut_check = head907d_ilut_check,
+	.olut_identity = true,
+	.olut_size = 1024,
+	.olut_set = headca7d_olut_set,
+	.olut_clr = headca7d_olut_clr,
+	.curs_layout = head917d_curs_layout,
+	.curs_format = headc37d_curs_format,
+	.curs_set = headca7d_curs_set,
+	.curs_clr = headca7d_curs_clr,
+	.dither = headca7d_dither,
+	.procamp = headca7d_procamp,
+	.or = headca7d_or,
+	.static_wndw_map = headc37d_static_wndw_map,
+	.display_id = headca7d_display_id,
+};
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimm.c b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
index 566fbddfc8d7..53c9ab6c138b 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimm.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
@@ -31,6 +31,7 @@ nv50_wimm_init(struct nouveau_drm *drm, struct nv50_wndw *wndw)
 		int version;
 		int (*init)(struct nouveau_drm *, s32, struct nv50_wndw *);
 	} wimms[] = {
+		{ GB202_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
 		{ GA102_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
 		{ TU102_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
 		{ GV100_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index f6be426dd525..11d5b923d6e7 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -556,14 +556,24 @@ nv50_wndw_prepare_fb(struct drm_plane *plane, struct drm_plane_state *state)
 		return ret;
 
 	if (wndw->ctxdma.parent) {
-		ctxdma = nv50_wndw_ctxdma_new(wndw, fb);
-		if (IS_ERR(ctxdma)) {
-			nouveau_bo_unpin(nvbo);
-			return PTR_ERR(ctxdma);
+		if (wndw->wndw.base.user.oclass < GB202_DISP_WINDOW_CHANNEL_DMA) {
+			ctxdma = nv50_wndw_ctxdma_new(wndw, fb);
+			if (IS_ERR(ctxdma)) {
+				nouveau_bo_unpin(nvbo);
+				return PTR_ERR(ctxdma);
+			}
+
+			if (asyw->visible)
+				asyw->image.handle[0] = ctxdma->object.handle;
+		} else {
+			/* No CTXDMAs on Blackwell. */
+			if (asyw->visible) {
+				/* "handle != NULL_HANDLE" is used to determine enable status
+				 * in a number of places, so fill in a fake object handle.
+				 */
+				asyw->image.handle[0] = NV50_DISP_HANDLE_WNDW_CTX(0);
+			}
 		}
-
-		if (asyw->visible)
-			asyw->image.handle[0] = ctxdma->object.handle;
 	}
 
 	ret = drm_gem_plane_helper_prepare_fb(plane, state);
@@ -901,6 +911,7 @@ nv50_wndw_new(struct nouveau_drm *drm, enum drm_plane_type type, int index,
 		int (*new)(struct nouveau_drm *, enum drm_plane_type,
 			   int, s32, struct nv50_wndw **);
 	} wndws[] = {
+		{ GB202_DISP_WINDOW_CHANNEL_DMA, 0, wndwca7e_new },
 		{ GA102_DISP_WINDOW_CHANNEL_DMA, 0, wndwc67e_new },
 		{ TU102_DISP_WINDOW_CHANNEL_DMA, 0, wndwc57e_new },
 		{ GV100_DISP_WINDOW_CHANNEL_DMA, 0, wndwc37e_new },
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.h b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
index 76a6ae5d5652..90d100514bef 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.h
@@ -134,6 +134,9 @@ int wndwc57e_csc_clr(struct nv50_wndw *);
 int wndwc67e_new(struct nouveau_drm *, enum drm_plane_type, int, s32,
 		 struct nv50_wndw **);
 
+int wndwca7e_new(struct nouveau_drm *, enum drm_plane_type, int, s32,
+		 struct nv50_wndw **);
+
 int nv50_wndw_new(struct nouveau_drm *, enum drm_plane_type, int index,
 		  struct nv50_wndw **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index 50a7b97d37a2..554c4f91f8be 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -25,6 +25,7 @@
 #include <drm/drm_atomic_helper.h>
 #include <nouveau_bo.h>
 
+#include <nvif/class.h>
 #include <nvif/if0014.h>
 #include <nvif/pushc37b.h>
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
new file mode 100644
index 000000000000..0d8e9a9d1a57
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwca7e.c
@@ -0,0 +1,209 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "wndw.h"
+#include "atom.h"
+
+#include <nvif/pushc97b.h>
+
+#include <nvhw/class/clca7e.h>
+
+#include <nouveau_bo.h>
+
+static int
+wndwca7e_image_clr(struct nv50_wndw *wndw)
+{
+	struct nvif_push *push = &wndw->wndw.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 4);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7E, SET_PRESENT_CONTROL,
+		  NVVAL(NVCA7E, SET_PRESENT_CONTROL, MIN_PRESENT_INTERVAL, 0) |
+		  NVDEF(NVCA7E, SET_PRESENT_CONTROL, BEGIN_MODE, NON_TEARING));
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_LO_ISO(0),
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_ISO, ENABLE, DISABLE));
+
+	return 0;
+}
+
+static int
+wndwca7e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
+{
+	const u32 iso0_hi = upper_32_bits(asyw->image.offset[0]);
+	const u32 iso0_lo = lower_32_bits(asyw->image.offset[0]);
+	struct nvif_push *push = &wndw->wndw.push;
+	int ret, kind;
+
+	if (asyw->image.kind)
+		kind = NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_KIND_BLOCKLINEAR;
+	else
+		kind = NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_KIND_PITCH;
+
+	ret = PUSH_WAIT(push, 17);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_HI_ISO(0), iso0_hi);
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_LO_ISO(0),
+		  NVVAL(NVCA7E, SET_SURFACE_ADDRESS_LO_ISO, ADDRESS_LO, iso0_lo >> 4) |
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_ISO, TARGET, PHYSICAL_NVM) |
+		  NVVAL(NVCA7E, SET_SURFACE_ADDRESS_LO_ISO, KIND, kind) |
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_ISO, ENABLE, ENABLE));
+
+	PUSH_MTHD(push, NVCA7E, SET_PRESENT_CONTROL,
+		  NVVAL(NVCA7E, SET_PRESENT_CONTROL, MIN_PRESENT_INTERVAL, asyw->image.interval) |
+		  NVVAL(NVCA7E, SET_PRESENT_CONTROL, BEGIN_MODE, asyw->image.mode) |
+		  NVDEF(NVCA7E, SET_PRESENT_CONTROL, TIMESTAMP_MODE, DISABLE));
+
+	PUSH_MTHD(push, NVCA7E, SET_SIZE,
+		  NVVAL(NVCA7E, SET_SIZE, WIDTH, asyw->image.w) |
+		  NVVAL(NVCA7E, SET_SIZE, HEIGHT, asyw->image.h),
+
+				SET_STORAGE,
+		  NVVAL(NVCA7E, SET_STORAGE, BLOCK_HEIGHT, asyw->image.blockh),
+
+				SET_PARAMS,
+		  NVVAL(NVCA7E, SET_PARAMS, FORMAT, asyw->image.format) |
+		  NVDEF(NVCA7E, SET_PARAMS, CLAMP_BEFORE_BLEND, DISABLE) |
+		  NVDEF(NVCA7E, SET_PARAMS, SWAP_UV, DISABLE) |
+		  NVDEF(NVCA7E, SET_PARAMS, FMT_ROUNDING_MODE, ROUND_TO_NEAREST),
+
+				SET_PLANAR_STORAGE(0),
+		  NVVAL(NVCA7E, SET_PLANAR_STORAGE, PITCH, asyw->image.blocks[0]) |
+		  NVVAL(NVCA7E, SET_PLANAR_STORAGE, PITCH, asyw->image.pitch[0] >> 6));
+
+	PUSH_MTHD(push, NVCA7E, SET_POINT_IN(0),
+		  NVVAL(NVCA7E, SET_POINT_IN, X, asyw->state.src_x >> 16) |
+		  NVVAL(NVCA7E, SET_POINT_IN, Y, asyw->state.src_y >> 16));
+
+	PUSH_MTHD(push, NVCA7E, SET_SIZE_IN,
+		  NVVAL(NVCA7E, SET_SIZE_IN, WIDTH, asyw->state.src_w >> 16) |
+		  NVVAL(NVCA7E, SET_SIZE_IN, HEIGHT, asyw->state.src_h >> 16));
+
+	PUSH_MTHD(push, NVCA7E, SET_SIZE_OUT,
+		  NVVAL(NVCA7E, SET_SIZE_OUT, WIDTH, asyw->state.crtc_w) |
+		  NVVAL(NVCA7E, SET_SIZE_OUT, HEIGHT, asyw->state.crtc_h));
+
+	return 0;
+}
+
+static int
+wndwca7e_ilut_clr(struct nv50_wndw *wndw)
+{
+	struct nvif_push *push = &wndw->wndw.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_LO_ILUT,
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_ILUT, ENABLE, DISABLE));
+
+	return 0;
+}
+
+static int
+wndwca7e_ilut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
+{
+	const u32 ilut_hi = upper_32_bits(asyw->xlut.i.offset);
+	const u32 ilut_lo = lower_32_bits(asyw->xlut.i.offset);
+	struct nvif_push *push = &wndw->wndw.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 5);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_HI_ILUT, ilut_hi,
+
+				SET_SURFACE_ADDRESS_LO_ILUT,
+		  NVVAL(NVCA7E, SET_SURFACE_ADDRESS_LO_ILUT, ADDRESS_LO, ilut_lo >> 4) |
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_ILUT, TARGET, PHYSICAL_NVM) |
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_ILUT, ENABLE, ENABLE));
+
+	PUSH_MTHD(push, NVCA7E, SET_ILUT_CONTROL,
+		  NVVAL(NVCA7E, SET_ILUT_CONTROL, SIZE, asyw->xlut.i.size) |
+		  NVVAL(NVCA7E, SET_ILUT_CONTROL, MODE, asyw->xlut.i.mode) |
+		  NVVAL(NVCA7E, SET_ILUT_CONTROL, INTERPOLATE, asyw->xlut.i.output_mode));
+
+	return 0;
+}
+
+static int
+wndwca7e_ntfy_clr(struct nv50_wndw *wndw)
+{
+	struct nvif_push *push = &wndw->wndw.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 2);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_LO_NOTIFIER,
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_NOTIFIER, ENABLE, DISABLE));
+
+	return 0;
+}
+
+static int
+wndwca7e_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
+{
+	struct nv50_disp *disp = nv50_disp(wndw->plane.dev);
+	const u64 ntfy_addr = disp->sync->offset + asyw->ntfy.offset;
+	const u32 ntfy_hi = upper_32_bits(ntfy_addr);
+	const u32 ntfy_lo = lower_32_bits(ntfy_addr);
+	struct nvif_push *push = &wndw->wndw.push;
+	int ret;
+
+	ret = PUSH_WAIT(push, 5);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVCA7E, SET_SURFACE_ADDRESS_HI_NOTIFIER, ntfy_hi,
+
+				SET_SURFACE_ADDRESS_LO_NOTIFIER,
+		  NVVAL(NVCA7E, SET_SURFACE_ADDRESS_LO_NOTIFIER, ADDRESS_LO, ntfy_lo >> 4) |
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_NOTIFIER, TARGET, PHYSICAL_NVM) |
+		  NVDEF(NVCA7E, SET_SURFACE_ADDRESS_LO_NOTIFIER, ENABLE, ENABLE));
+
+	PUSH_MTHD(push, NVCA7E, SET_NOTIFIER_CONTROL,
+		  NVVAL(NVCA7E, SET_NOTIFIER_CONTROL, MODE, asyw->ntfy.awaken));
+
+	return 0;
+}
+
+static const struct nv50_wndw_func
+wndwca7e = {
+	.acquire = wndwc37e_acquire,
+	.release = wndwc37e_release,
+	.ntfy_set = wndwca7e_ntfy_set,
+	.ntfy_clr = wndwca7e_ntfy_clr,
+	.ntfy_reset = corec37d_ntfy_init,
+	.ntfy_wait_begun = base507c_ntfy_wait_begun,
+	.ilut = wndwc57e_ilut,
+	.ilut_identity = true,
+	.ilut_size = 1024,
+	.xlut_set = wndwca7e_ilut_set,
+	.xlut_clr = wndwca7e_ilut_clr,
+	.csc = base907c_csc,
+	.csc_set = wndwc57e_csc_set,
+	.csc_clr = wndwc57e_csc_clr,
+	.image_set = wndwca7e_image_set,
+	.image_clr = wndwca7e_image_clr,
+	.blend_set = wndwc37e_blend_set,
+	.update = wndwc37e_update,
+};
+
+int
+wndwca7e_new(struct nouveau_drm *drm, enum drm_plane_type type, int index,
+	     s32 oclass, struct nv50_wndw **pwndw)
+{
+	return wndwc37e_new_(&wndwca7e, drm, type, index, oclass, BIT(index >> 1), pwndw);
+}
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clc97b.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clc97b.h
new file mode 100644
index 000000000000..092aebe9551c
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clc97b.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef _clc97b_h_
+#define _clc97b_h_
+
+// dma opcode instructions
+#define NVC97B_DMA
+#define NVC97B_DMA_OPCODE                                                        31:29
+#define NVC97B_DMA_OPCODE_METHOD                                            0x00000000
+#define NVC97B_DMA_OPCODE_JUMP                                              0x00000001
+#define NVC97B_DMA_OPCODE_NONINC_METHOD                                     0x00000002
+#define NVC97B_DMA_OPCODE_SET_SUBDEVICE_MASK                                0x00000003
+#define NVC97B_DMA_METHOD_COUNT                                                  27:18
+#define NVC97B_DMA_METHOD_OFFSET                                                  15:2
+#define NVC97B_DMA_DATA                                                           31:0
+#define NVC97B_DMA_DATA_NOP                                                 0x00000000
+#define NVC97B_DMA_JUMP_OFFSET                                                    15:2
+#define NVC97B_DMA_SET_SUBDEVICE_MASK_VALUE                                       11:0
+
+#endif // _clc97b_h
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
new file mode 100644
index 000000000000..0fec6fc21d44
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7d.h
@@ -0,0 +1,868 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef _clca7d_h_
+#define _clca7d_h_
+
+// class methods
+#define NVCA7D_UPDATE                                                           (0x00000200)
+#define NVCA7D_UPDATE_SPECIAL_HANDLING                                          21:20
+#define NVCA7D_UPDATE_SPECIAL_HANDLING_NONE                                     (0x00000000)
+#define NVCA7D_UPDATE_SPECIAL_HANDLING_INTERRUPT_RM                             (0x00000001)
+#define NVCA7D_UPDATE_SPECIAL_HANDLING_MODE_SWITCH                              (0x00000002)
+#define NVCA7D_UPDATE_SPECIAL_HANDLING_REASON                                   19:12
+#define NVCA7D_UPDATE_INHIBIT_INTERRUPTS                                        24:24
+#define NVCA7D_UPDATE_INHIBIT_INTERRUPTS_FALSE                                  (0x00000000)
+#define NVCA7D_UPDATE_INHIBIT_INTERRUPTS_TRUE                                   (0x00000001)
+#define NVCA7D_UPDATE_RELEASE_ELV                                               0:0
+#define NVCA7D_UPDATE_RELEASE_ELV_FALSE                                         (0x00000000)
+#define NVCA7D_UPDATE_RELEASE_ELV_TRUE                                          (0x00000001)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN                                             8:4
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_NONE                               (0x00000000)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN(i)                                 (0x00000001 +(i))
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN__SIZE_1                            16
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_0                                  (0x00000001)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_1                                  (0x00000002)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_2                                  (0x00000003)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_3                                  (0x00000004)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_4                                  (0x00000005)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_5                                  (0x00000006)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_6                                  (0x00000007)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_7                                  (0x00000008)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_8                                  (0x00000009)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_9                                  (0x0000000A)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_A                                  (0x0000000B)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_B                                  (0x0000000C)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_C                                  (0x0000000D)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_D                                  (0x0000000E)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_E                                  (0x0000000F)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_LOCK_PIN_F                                  (0x00000010)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_FLIP_LOCK_0                        (0x00000014)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_FLIP_LOCK_1                        (0x00000015)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_FLIP_LOCK_2                        (0x00000016)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_FLIP_LOCK_3                        (0x00000017)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK(i)                       (0x00000018 +(i))
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK__SIZE_1                  8
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_0                        (0x00000018)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_1                        (0x00000019)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_2                        (0x0000001A)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_3                        (0x0000001B)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_4                        (0x0000001C)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_5                        (0x0000001D)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_6                        (0x0000001E)
+#define NVCA7D_UPDATE_FLIP_LOCK_PIN_INTERNAL_SCAN_LOCK_7                        (0x0000001F)
+#define NVCA7D_UPDATE_FORCE_FULLSCREEN                                          28:28
+#define NVCA7D_UPDATE_FORCE_FULLSCREEN_FALSE                                    (0x00000000)
+#define NVCA7D_UPDATE_FORCE_FULLSCREEN_TRUE                                     (0x00000001)
+#define NVCA7D_SET_NOTIFIER_CONTROL                                             (0x0000020C)
+#define NVCA7D_SET_NOTIFIER_CONTROL_MODE                                        0:0
+#define NVCA7D_SET_NOTIFIER_CONTROL_MODE_WRITE                                  (0x00000000)
+#define NVCA7D_SET_NOTIFIER_CONTROL_MODE_WRITE_AWAKEN                           (0x00000001)
+#define NVCA7D_SET_NOTIFIER_CONTROL_NOTIFY                                      12:12
+#define NVCA7D_SET_NOTIFIER_CONTROL_NOTIFY_DISABLE                              (0x00000000)
+#define NVCA7D_SET_NOTIFIER_CONTROL_NOTIFY_ENABLE                               (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS                                              (0x00000218)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR(i)                     ((i)+0):((i)+0)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR__SIZE_1                8
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR_DISABLE                (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR_ENABLE                 (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR0                       0:0
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR0_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR0_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR1                       1:1
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR1_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR1_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR2                       2:2
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR2_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR2_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR3                       3:3
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR3_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR3_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR4                       4:4
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR4_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR4_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR5                       5:5
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR5_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR5_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR6                       6:6
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR6_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR6_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR7                       7:7
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR7_DISABLE               (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CURSOR7_ENABLE                (0x00000001)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CORE                          16:16
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CORE_DISABLE                  (0x00000000)
+#define NVCA7D_SET_INTERLOCK_FLAGS_INTERLOCK_WITH_CORE_ENABLE                   (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS                                       (0x0000021C)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW(i)              ((i)+0):((i)+0)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW__SIZE_1         32
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW_DISABLE         (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW_ENABLE          (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW0                0:0
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW0_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW0_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW1                1:1
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW1_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW1_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW2                2:2
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW2_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW2_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW3                3:3
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW3_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW3_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW4                4:4
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW4_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW4_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW5                5:5
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW5_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW5_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW6                6:6
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW6_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW6_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW7                7:7
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW7_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW7_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW8                8:8
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW8_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW8_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW9                9:9
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW9_DISABLE        (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW9_ENABLE         (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW10               10:10
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW10_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW10_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW11               11:11
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW11_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW11_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW12               12:12
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW12_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW12_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW13               13:13
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW13_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW13_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW14               14:14
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW14_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW14_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW15               15:15
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW15_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW15_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW16               16:16
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW16_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW16_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW17               17:17
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW17_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW17_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW18               18:18
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW18_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW18_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW19               19:19
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW19_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW19_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW20               20:20
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW20_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW20_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW21               21:21
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW21_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW21_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW22               22:22
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW22_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW22_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW23               23:23
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW23_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW23_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW24               24:24
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW24_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW24_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW25               25:25
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW25_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW25_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW26               26:26
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW26_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW26_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW27               27:27
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW27_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW27_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW28               28:28
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW28_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW28_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW29               29:29
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW29_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW29_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW30               30:30
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW30_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW30_ENABLE        (0x00000001)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW31               31:31
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW31_DISABLE       (0x00000000)
+#define NVCA7D_SET_WINDOW_INTERLOCK_FLAGS_INTERLOCK_WITH_WINDOW31_ENABLE        (0x00000001)
+#define NVCA7D_SET_SURFACE_ADDRESS_HI_NOTIFIER                                  (0x00000260)
+#define NVCA7D_SET_SURFACE_ADDRESS_HI_NOTIFIER_ADDRESS_HI                       31:0
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER                                  (0x00000264)
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_ADDRESS_LO                       31:4
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET                           3:2
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_IOVA                      (0x00000000)
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_PHYSICAL_NVM              (0x00000001)
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_PHYSICAL_PCI              (0x00000002)
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_PHYSICAL_PCI_COHERENT     (0x00000003)
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_ENABLE                           0:0
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_ENABLE_DISABLE                   (0x00000000)
+#define NVCA7D_SET_SURFACE_ADDRESS_LO_NOTIFIER_ENABLE_ENABLE                    (0x00000001)
+
+#define NVCA7D_SOR_SET_CONTROL(a)                                               (0x00000300 + (a)*0x00000020)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK                                       7:0
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_NONE                                  (0x00000000)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD0                                 (0x00000001)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD1                                 (0x00000002)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD2                                 (0x00000004)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD3                                 (0x00000008)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD4                                 (0x00000010)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD5                                 (0x00000020)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD6                                 (0x00000040)
+#define NVCA7D_SOR_SET_CONTROL_OWNER_MASK_HEAD7                                 (0x00000080)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL                                         11:8
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_LVDS_CUSTOM                             (0x00000000)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_A                           (0x00000001)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_SINGLE_TMDS_B                           (0x00000002)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_DUAL_TMDS                               (0x00000005)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_DP_A                                    (0x00000008)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_DP_B                                    (0x00000009)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_HDMI_FRL                                (0x0000000C)
+#define NVCA7D_SOR_SET_CONTROL_PROTOCOL_CUSTOM                                  (0x0000000F)
+#define NVCA7D_SOR_SET_CONTROL_DE_SYNC_POLARITY                                 16:16
+#define NVCA7D_SOR_SET_CONTROL_DE_SYNC_POLARITY_POSITIVE_TRUE                   (0x00000000)
+#define NVCA7D_SOR_SET_CONTROL_DE_SYNC_POLARITY_NEGATIVE_TRUE                   (0x00000001)
+#define NVCA7D_SOR_SET_CONTROL_PIXEL_REPLICATE_MODE                             21:20
+#define NVCA7D_SOR_SET_CONTROL_PIXEL_REPLICATE_MODE_OFF                         (0x00000000)
+#define NVCA7D_SOR_SET_CONTROL_PIXEL_REPLICATE_MODE_X2                          (0x00000001)
+#define NVCA7D_SOR_SET_CONTROL_PIXEL_REPLICATE_MODE_X4                          (0x00000002)
+
+#define NVCA7D_WINDOW_SET_CONTROL(a)                                            (0x00001000 + (a)*0x00000080)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER                                         3:0
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD(i)                                 (0x00000000 +(i))
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD__SIZE_1                            8
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD0                                   (0x00000000)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD1                                   (0x00000001)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD2                                   (0x00000002)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD3                                   (0x00000003)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD4                                   (0x00000004)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD5                                   (0x00000005)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD6                                   (0x00000006)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_HEAD7                                   (0x00000007)
+#define NVCA7D_WINDOW_SET_CONTROL_OWNER_NONE                                    (0x0000000F)
+#define NVCA7D_WINDOW_SET_CONTROL_HIDE                                          8:8
+#define NVCA7D_WINDOW_SET_CONTROL_HIDE_FALSE                                    (0x00000000)
+#define NVCA7D_WINDOW_SET_CONTROL_HIDE_TRUE                                     (0x00000001)
+#define NVCA7D_WINDOW_SET_CONTROL_DISABLE_PHYSICAL_FLIPS                        9:9
+#define NVCA7D_WINDOW_SET_CONTROL_DISABLE_PHYSICAL_FLIPS_FALSE                  (0x00000000)
+#define NVCA7D_WINDOW_SET_CONTROL_DISABLE_PHYSICAL_FLIPS_TRUE                   (0x00000001)
+#define NVCA7D_WINDOW_SET_CONTROL_ALLOW_SUPERFRAME                              10:10
+#define NVCA7D_WINDOW_SET_CONTROL_ALLOW_SUPERFRAME_FALSE                        (0x00000000)
+#define NVCA7D_WINDOW_SET_CONTROL_ALLOW_SUPERFRAME_TRUE                         (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS(a)                         (0x00001004 + (a)*0x00000080)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED1BPP             0:0
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED1BPP_FALSE       (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED1BPP_TRUE        (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED2BPP             1:1
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED2BPP_FALSE       (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED2BPP_TRUE        (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED4BPP             2:2
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED4BPP_FALSE       (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED4BPP_TRUE        (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED8BPP             3:3
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED8BPP_FALSE       (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_RGB_PACKED8BPP_TRUE        (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PACKED422              4:4
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PACKED422_FALSE        (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PACKED422_TRUE         (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PLANAR420              5:5
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PLANAR420_FALSE        (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PLANAR420_TRUE         (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PLANAR444              6:6
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PLANAR444_FALSE        (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_PLANAR444_TRUE         (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR420         7:7
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR420_FALSE   (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR420_TRUE    (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422         8:8
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422_FALSE   (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422_TRUE    (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422R        9:9
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422R_FALSE  (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422R_TRUE   (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR444         10:10
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR444_FALSE   (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR444_TRUE    (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR420          11:11
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR420_FALSE    (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR420_TRUE     (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR444          12:12
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR444_FALSE    (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR444_TRUE     (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR420     13:13
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR420_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR420_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422     14:14
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422R    15:15
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422R_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422R_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR444     16:16
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR444_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR444_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS(a)                 (0x00001008 + (a)*0x00000080)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED1BPP     0:0
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED1BPP_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED1BPP_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED2BPP     1:1
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED2BPP_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED2BPP_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED4BPP     2:2
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED4BPP_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED4BPP_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED8BPP     3:3
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED8BPP_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_RGB_PACKED8BPP_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PACKED422      4:4
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PACKED422_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PACKED422_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PLANAR420      5:5
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PLANAR420_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PLANAR420_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PLANAR444      6:6
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PLANAR444_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_PLANAR444_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR420 7:7
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR420_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR420_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422 8:8
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422R 9:9
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422R_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR422R_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR444 10:10
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR444_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_YUV_SEMI_PLANAR444_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR420  11:11
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR420_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR420_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR444  12:12
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR444_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_PLANAR444_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR420 13:13
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR420_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR420_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422 14:14
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422R 15:15
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422R_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR422R_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR444 16:16
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR444_FALSE (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_ROTATED_FORMAT_USAGE_BOUNDS_EXT_YUV_SEMI_PLANAR444_TRUE (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS(a)                                (0x00001010 + (a)*0x00000080)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_MAX_PIXELS_FETCHED_PER_LINE       14:0
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_ILUT_ALLOWED                      16:16
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_ILUT_ALLOWED_FALSE                (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_ILUT_ALLOWED_TRUE                 (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_TMO_LUT_ALLOWED                   28:28
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_TMO_LUT_ALLOWED_FALSE             (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_TMO_LUT_ALLOWED_TRUE              (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_INPUT_SCALER_TAPS                 22:20
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_INPUT_SCALER_TAPS_TAPS_2          (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_INPUT_SCALER_TAPS_TAPS_5          (0x00000004)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_UPSCALING_ALLOWED                 24:24
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_UPSCALING_ALLOWED_FALSE           (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_UPSCALING_ALLOWED_TRUE            (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_OVERFETCH_ENABLED                 30:30
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_OVERFETCH_ENABLED_FALSE           (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_OVERFETCH_ENABLED_TRUE            (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_LAYOUT                            26:25
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_LAYOUT_PITCH_BLOCKLINEAR          (0x00000000)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_LAYOUT_PITCH                      (0x00000001)
+#define NVCA7D_WINDOW_SET_WINDOW_USAGE_BOUNDS_LAYOUT_BLOCKLINEAR                (0x00000002)
+#define NVCA7D_WINDOW_SET_PHYSICAL(a)                                           (0x00001014 + (a)*0x00000080)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW                                       31:0
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_NONE                                  (0x00000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW0                               (0x00000001)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW1                               (0x00000002)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW2                               (0x00000004)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW3                               (0x00000008)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW4                               (0x00000010)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW5                               (0x00000020)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW6                               (0x00000040)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW7                               (0x00000080)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW8                               (0x00000100)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW9                               (0x00000200)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW10                              (0x00000400)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW11                              (0x00000800)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW12                              (0x00001000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW13                              (0x00002000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW14                              (0x00004000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW15                              (0x00008000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW16                              (0x00010000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW17                              (0x00020000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW18                              (0x00040000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW19                              (0x00080000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW20                              (0x00100000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW21                              (0x00200000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW22                              (0x00400000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW23                              (0x00800000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW24                              (0x01000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW25                              (0x02000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW26                              (0x04000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW27                              (0x08000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW28                              (0x10000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW29                              (0x20000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW30                              (0x40000000)
+#define NVCA7D_WINDOW_SET_PHYSICAL_WINDOW_WINDOW31                              (0x80000000)
+
+#define NVCA7D_HEAD_SET_PROCAMP(a)                                              (0x00002000 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PROCAMP_COLOR_SPACE                                     1:0
+#define NVCA7D_HEAD_SET_PROCAMP_COLOR_SPACE_RGB                                 (0x00000000)
+#define NVCA7D_HEAD_SET_PROCAMP_COLOR_SPACE_YUV_601                             (0x00000001)
+#define NVCA7D_HEAD_SET_PROCAMP_COLOR_SPACE_YUV_709                             (0x00000002)
+#define NVCA7D_HEAD_SET_PROCAMP_COLOR_SPACE_YUV_2020                            (0x00000003)
+#define NVCA7D_HEAD_SET_PROCAMP_CHROMA_LPF                                      3:3
+#define NVCA7D_HEAD_SET_PROCAMP_CHROMA_LPF_DISABLE                              (0x00000000)
+#define NVCA7D_HEAD_SET_PROCAMP_CHROMA_LPF_ENABLE                               (0x00000001)
+#define NVCA7D_HEAD_SET_PROCAMP_CHROMA_DOWN_V                                   4:4
+#define NVCA7D_HEAD_SET_PROCAMP_CHROMA_DOWN_V_DISABLE                           (0x00000000)
+#define NVCA7D_HEAD_SET_PROCAMP_CHROMA_DOWN_V_ENABLE                            (0x00000001)
+#define NVCA7D_HEAD_SET_PROCAMP_DYNAMIC_RANGE                                   28:28
+#define NVCA7D_HEAD_SET_PROCAMP_DYNAMIC_RANGE_VESA                              (0x00000000)
+#define NVCA7D_HEAD_SET_PROCAMP_DYNAMIC_RANGE_CEA                               (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE(a)                              (0x00002004 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_CRC_MODE                        1:0
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_CRC_MODE_ACTIVE_RASTER          (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_CRC_MODE_COMPLETE_RASTER        (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_CRC_MODE_NON_ACTIVE_RASTER      (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_HSYNC_POLARITY                  2:2
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_HSYNC_POLARITY_POSITIVE_TRUE    (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_HSYNC_POLARITY_NEGATIVE_TRUE    (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_VSYNC_POLARITY                  3:3
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_VSYNC_POLARITY_POSITIVE_TRUE    (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_VSYNC_POLARITY_NEGATIVE_TRUE    (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH                     7:4
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_16_422          (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_18_444          (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_20_422          (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_24_422          (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_24_444          (0x00000004)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_30_444          (0x00000005)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_32_422          (0x00000006)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_36_444          (0x00000007)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_48_444          (0x00000008)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_16_444          (0x00000009)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_PIXEL_DEPTH_BPP_18_444NP        (0x0000000A)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_COLOR_SPACE_OVERRIDE            24:24
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_COLOR_SPACE_OVERRIDE_DISABLE    (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_COLOR_SPACE_OVERRIDE_ENABLE     (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_COLOR_SPACE_FLAG                23:12
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN                  31:26
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN0             (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN1             (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN2             (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN3             (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN4             (0x00000004)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN5             (0x00000005)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN6             (0x00000006)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN7             (0x00000007)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN8             (0x00000008)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN9             (0x00000009)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN10            (0x0000000A)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN11            (0x0000000B)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN12            (0x0000000C)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN13            (0x0000000D)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN14            (0x0000000E)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN15            (0x0000000F)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN16            (0x00000010)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN17            (0x00000011)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN18            (0x00000012)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN19            (0x00000013)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN20            (0x00000014)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN21            (0x00000015)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN22            (0x00000016)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN23            (0x00000017)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN24            (0x00000018)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN25            (0x00000019)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN26            (0x0000001A)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN27            (0x0000001B)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN28            (0x0000001C)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN29            (0x0000001D)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN30            (0x0000001E)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_WIN31            (0x0000001F)
+#define NVCA7D_HEAD_SET_CONTROL_OUTPUT_RESOURCE_EXT_PACKET_WIN_NONE             (0x0000003F)
+#define NVCA7D_HEAD_SET_CONTROL(a)                                              (0x00002008 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_CONTROL_STRUCTURE                                       1:0
+#define NVCA7D_HEAD_SET_CONTROL_STRUCTURE_PROGRESSIVE                           (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO3D_STRUCTURE                              2:2
+#define NVCA7D_HEAD_SET_CONTROL_STEREO3D_STRUCTURE_NORMAL                       (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO3D_STRUCTURE_FRAME_PACKED                 (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_YUV420PACKER                                    3:3
+#define NVCA7D_HEAD_SET_CONTROL_YUV420PACKER_DISABLE                            (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_YUV420PACKER_ENABLE                             (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_MODE                                  11:10
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_MODE_NO_LOCK                          (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_MODE_FRAME_LOCK                       (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_MODE_RASTER_LOCK                      (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN                                   8:4
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_NONE                     (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN(i)                       (0x00000001 +(i))
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN__SIZE_1                  16
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_0                        (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_1                        (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_2                        (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_3                        (0x00000004)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_4                        (0x00000005)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_5                        (0x00000006)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_6                        (0x00000007)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_7                        (0x00000008)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_8                        (0x00000009)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_9                        (0x0000000A)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_A                        (0x0000000B)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_B                        (0x0000000C)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_C                        (0x0000000D)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_D                        (0x0000000E)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_E                        (0x0000000F)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_LOCK_PIN_F                        (0x00000010)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_FLIP_LOCK_0              (0x00000014)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_FLIP_LOCK_1              (0x00000015)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_FLIP_LOCK_2              (0x00000016)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_FLIP_LOCK_3              (0x00000017)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK(i)             (0x00000018 +(i))
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK__SIZE_1        8
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_0              (0x00000018)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_1              (0x00000019)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_2              (0x0000001A)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_3              (0x0000001B)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_4              (0x0000001C)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_5              (0x0000001D)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_6              (0x0000001E)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCK_PIN_INTERNAL_SCAN_LOCK_7              (0x0000001F)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_LOCKOUT_WINDOW                             15:12
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_MODE                                23:22
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_MODE_NO_LOCK                        (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_MODE_FRAME_LOCK                     (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_MODE_RASTER_LOCK                    (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN                                 20:16
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_NONE                   (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN(i)                     (0x00000001 +(i))
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN__SIZE_1                16
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_0                      (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_1                      (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_2                      (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_3                      (0x00000004)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_4                      (0x00000005)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_5                      (0x00000006)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_6                      (0x00000007)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_7                      (0x00000008)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_8                      (0x00000009)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_9                      (0x0000000A)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_A                      (0x0000000B)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_B                      (0x0000000C)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_C                      (0x0000000D)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_D                      (0x0000000E)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_E                      (0x0000000F)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_LOCK_PIN_F                      (0x00000010)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_FLIP_LOCK_0            (0x00000014)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_FLIP_LOCK_1            (0x00000015)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_FLIP_LOCK_2            (0x00000016)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_FLIP_LOCK_3            (0x00000017)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK(i)           (0x00000018 +(i))
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK__SIZE_1      8
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_0            (0x00000018)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_1            (0x00000019)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_2            (0x0000001A)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_3            (0x0000001B)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_4            (0x0000001C)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_5            (0x0000001D)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_6            (0x0000001E)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_LOCK_PIN_INTERNAL_SCAN_LOCK_7            (0x0000001F)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN                                      28:24
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_NONE                        (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN(i)                          (0x00000001 +(i))
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN__SIZE_1                     16
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_0                           (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_1                           (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_2                           (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_3                           (0x00000004)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_4                           (0x00000005)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_5                           (0x00000006)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_6                           (0x00000007)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_7                           (0x00000008)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_8                           (0x00000009)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_9                           (0x0000000A)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_A                           (0x0000000B)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_B                           (0x0000000C)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_C                           (0x0000000D)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_D                           (0x0000000E)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_E                           (0x0000000F)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_LOCK_PIN_F                           (0x00000010)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_FLIP_LOCK_0                 (0x00000014)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_FLIP_LOCK_1                 (0x00000015)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_FLIP_LOCK_2                 (0x00000016)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_FLIP_LOCK_3                 (0x00000017)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK(i)                (0x00000018 +(i))
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK__SIZE_1           8
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_0                 (0x00000018)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_1                 (0x00000019)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_2                 (0x0000001A)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_3                 (0x0000001B)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_4                 (0x0000001C)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_5                 (0x0000001D)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_6                 (0x0000001E)
+#define NVCA7D_HEAD_SET_CONTROL_STEREO_PIN_INTERNAL_SCAN_LOCK_7                 (0x0000001F)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_STEREO_LOCK_MODE                           30:30
+#define NVCA7D_HEAD_SET_CONTROL_SINK_STEREO_LOCK_MODE_DISABLE                   (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_SINK_STEREO_LOCK_MODE_ENABLE                    (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_STEREO_LOCK_MODE                         31:31
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_STEREO_LOCK_MODE_DISABLE                 (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_SOURCE_STEREO_LOCK_MODE_ENABLE                  (0x00000001)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY(a)                                (0x0000200C + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_HERTZ                             30:0
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_ADJ1000DIV1001                    31:31
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_ADJ1000DIV1001_FALSE              (0x00000000)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_ADJ1000DIV1001_TRUE               (0x00000001)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL(a)                                       (0x00002018 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_ENABLE                                   0:0
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_ENABLE_DISABLE                           (0x00000000)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_ENABLE_ENABLE                            (0x00000001)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_BITS                                     5:4
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_BITS_TO_6_BITS                           (0x00000000)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_BITS_TO_8_BITS                           (0x00000001)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_BITS_TO_10_BITS                          (0x00000002)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_BITS_TO_12_BITS                          (0x00000003)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_OFFSET_ENABLE                            2:2
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_OFFSET_ENABLE_DISABLE                    (0x00000000)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_OFFSET_ENABLE_ENABLE                     (0x00000001)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE                                     10:8
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE_DYNAMIC_ERR_ACC                     (0x00000000)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE_STATIC_ERR_ACC                      (0x00000001)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE_DYNAMIC_2X2                         (0x00000002)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE_STATIC_2X2                          (0x00000003)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE_TEMPORAL                            (0x00000004)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_MODE_ROUND                               (0x00000005)
+#define NVCA7D_HEAD_SET_DITHER_CONTROL_PHASE                                    13:12
+#define NVCA7D_HEAD_SET_DISPLAY_ID(a,b)                                         (0x00002020 + (a)*0x00000800 + (b)*0x00000004)
+#define NVCA7D_HEAD_SET_DISPLAY_ID_CODE                                         31:0
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX(a)                            (0x00002028 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_HERTZ                         30:0
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001                31:31
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001_FALSE          (0x00000000)
+#define NVCA7D_HEAD_SET_PIXEL_CLOCK_FREQUENCY_MAX_ADJ1000DIV1001_TRUE           (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS(a)                                    (0x00002030 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR                                2:0
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_NONE                     (0x00000000)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_W32_H32                  (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_W64_H64                  (0x00000002)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_W128_H128                (0x00000003)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_CURSOR_USAGE_W256_H256                (0x00000004)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OLUT_ALLOWED                          4:4
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OLUT_ALLOWED_FALSE                    (0x00000000)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OLUT_ALLOWED_TRUE                     (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_LTM_ALLOWED                           5:5
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_LTM_ALLOWED_FALSE                     (0x00000000)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_LTM_ALLOWED_TRUE                      (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OUTPUT_SCALER_TAPS                    14:12
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OUTPUT_SCALER_TAPS_TAPS_2             (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OUTPUT_SCALER_TAPS_TAPS_5             (0x00000004)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_UPSCALING_ALLOWED                     8:8
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_UPSCALING_ALLOWED_FALSE               (0x00000000)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_UPSCALING_ALLOWED_TRUE                (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OVERFETCH_ENABLED                     16:16
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OVERFETCH_ENABLED_FALSE               (0x00000000)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_OVERFETCH_ENABLED_TRUE                (0x00000001)
+#define NVCA7D_HEAD_SET_HEAD_USAGE_BOUNDS_ELV_START                             31:17
+#define NVCA7D_HEAD_SET_VIEWPORT_SIZE_IN(a)                                     (0x0000204C + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_VIEWPORT_SIZE_IN_WIDTH                                  14:0
+#define NVCA7D_HEAD_SET_VIEWPORT_SIZE_IN_HEIGHT                                 30:16
+#define NVCA7D_HEAD_SET_VIEWPORT_SIZE_OUT(a)                                    (0x00002058 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_VIEWPORT_SIZE_OUT_WIDTH                                 14:0
+#define NVCA7D_HEAD_SET_VIEWPORT_SIZE_OUT_HEIGHT                                30:16
+#define NVCA7D_HEAD_SET_TILE_MASK(a)                                            (0x00002060 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE                                          7:0
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_NONE                                     (0x00000000)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE0                                    (0x00000001)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE1                                    (0x00000002)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE2                                    (0x00000004)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE3                                    (0x00000008)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE4                                    (0x00000010)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE5                                    (0x00000020)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE6                                    (0x00000040)
+#define NVCA7D_HEAD_SET_TILE_MASK_TILE_TILE7                                    (0x00000080)
+#define NVCA7D_HEAD_SET_RASTER_SIZE(a)                                          (0x00002064 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_RASTER_SIZE_WIDTH                                       15:0
+#define NVCA7D_HEAD_SET_RASTER_SIZE_HEIGHT                                      31:16
+#define NVCA7D_HEAD_SET_RASTER_SYNC_END(a)                                      (0x00002068 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_RASTER_SYNC_END_X                                       14:0
+#define NVCA7D_HEAD_SET_RASTER_SYNC_END_Y                                       30:16
+#define NVCA7D_HEAD_SET_RASTER_BLANK_END(a)                                     (0x0000206C + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_RASTER_BLANK_END_X                                      14:0
+#define NVCA7D_HEAD_SET_RASTER_BLANK_END_Y                                      30:16
+#define NVCA7D_HEAD_SET_RASTER_BLANK_START(a)                                   (0x00002070 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_RASTER_BLANK_START_X                                    14:0
+#define NVCA7D_HEAD_SET_RASTER_BLANK_START_Y                                    30:16
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR(a)                                       (0x0000209C + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_ENABLE                                   31:31
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_ENABLE_DISABLE                           (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_ENABLE_ENABLE                            (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_FORMAT                                   7:0
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_FORMAT_A1R5G5B5                          (0x000000E9)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_FORMAT_A8R8G8B8                          (0x000000CF)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_SIZE                                     9:8
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_SIZE_W32_H32                             (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_SIZE_W64_H64                             (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_SIZE_W128_H128                           (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_SIZE_W256_H256                           (0x00000003)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_HOT_SPOT_X                               19:12
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_HOT_SPOT_Y                               27:20
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION(a)                           (0x000020A0 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_K1                           7:0
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_CURSOR_COLOR_FACTOR_SELECT   11:8
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_CURSOR_COLOR_FACTOR_SELECT_K1 (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_CURSOR_COLOR_FACTOR_SELECT_K1_TIMES_SRC (0x00000005)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_VIEWPORT_COLOR_FACTOR_SELECT 15:12
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_VIEWPORT_COLOR_FACTOR_SELECT_ZERO (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_VIEWPORT_COLOR_FACTOR_SELECT_K1 (0x00000002)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_VIEWPORT_COLOR_FACTOR_SELECT_NEG_K1_TIMES_SRC (0x00000007)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_MODE                         16:16
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_MODE_BLEND                   (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_MODE_XOR                     (0x00000001)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS                       20:20
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS_DISABLE               (0x00000000)
+#define NVCA7D_HEAD_SET_CONTROL_CURSOR_COMPOSITION_BYPASS_ENABLE                (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CRC(a)                               (0x00002150 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CRC_ADDRESS_HI                       31:0
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC(a)                               (0x00002154 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_ADDRESS_LO                       31:4
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_TARGET                           3:2
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_TARGET_IOVA                      (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_TARGET_PHYSICAL_NVM              (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_TARGET_PHYSICAL_PCI              (0x00000002)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_TARGET_PHYSICAL_PCI_COHERENT     (0x00000003)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_ENABLE                           0:0
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_ENABLE_DISABLE                   (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CRC_ENABLE_ENABLE                    (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_OLUT(a)                              (0x00002158 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_OLUT_ADDRESS_HI                      31:0
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT(a)                              (0x0000215C + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_ADDRESS_LO                      31:4
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_TARGET                          3:2
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_TARGET_IOVA                     (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_TARGET_PHYSICAL_NVM             (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_TARGET_PHYSICAL_PCI             (0x00000002)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_TARGET_PHYSICAL_PCI_COHERENT    (0x00000003)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_ENABLE                          0:0
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_ENABLE_DISABLE                  (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_OLUT_ENABLE_ENABLE                   (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CURSOR(a,b)                          (0x00002170 + (a)*0x00000800 + (b)*0x00000004)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_HI_CURSOR_ADDRESS_HI                    31:0
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR(a,b)                          (0x00002178 + (a)*0x00000800 + (b)*0x00000004)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_ADDRESS_LO                    31:4
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_TARGET                        3:2
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_TARGET_IOVA                   (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_TARGET_PHYSICAL_NVM           (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_TARGET_PHYSICAL_PCI           (0x00000002)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_TARGET_PHYSICAL_PCI_COHERENT  (0x00000003)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_KIND                          1:1
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_KIND_PITCH                    (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_KIND_BLOCKLINEAR              (0x00000001)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_ENABLE                        0:0
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_ENABLE_DISABLE                (0x00000000)
+#define NVCA7D_HEAD_SET_SURFACE_ADDRESS_LO_CURSOR_ENABLE_ENABLE                 (0x00000001)
+#define NVCA7D_HEAD_SET_CRC_CONTROL(a)                                          (0x00002184 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL                         5:0
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_0                   (0x00000000)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_1                   (0x00000001)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_2                   (0x00000002)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_3                   (0x00000003)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_4                   (0x00000004)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_5                   (0x00000005)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_6                   (0x00000006)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_7                   (0x00000007)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_8                   (0x00000008)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_9                   (0x00000009)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_10                  (0x0000000A)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_11                  (0x0000000B)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_12                  (0x0000000C)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_13                  (0x0000000D)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_14                  (0x0000000E)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_15                  (0x0000000F)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_16                  (0x00000010)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_17                  (0x00000011)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_18                  (0x00000012)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_19                  (0x00000013)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_20                  (0x00000014)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_21                  (0x00000015)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_22                  (0x00000016)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_23                  (0x00000017)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_24                  (0x00000018)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_25                  (0x00000019)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_26                  (0x0000001A)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_27                  (0x0000001B)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_28                  (0x0000001C)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_29                  (0x0000001D)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_30                  (0x0000001E)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_WIN_31                  (0x0000001F)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CONTROLLING_CHANNEL_CORE                    (0x00000020)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_EXPECT_BUFFER_COLLAPSE                      8:8
+#define NVCA7D_HEAD_SET_CRC_CONTROL_EXPECT_BUFFER_COLLAPSE_FALSE                (0x00000000)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_EXPECT_BUFFER_COLLAPSE_TRUE                 (0x00000001)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC                                 19:12
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_NONE                            (0x00000000)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SF                              (0x00000030)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR(i)                          (0x00000050 +(i))
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR__SIZE_1                     8
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR0                            (0x00000050)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR1                            (0x00000051)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR2                            (0x00000052)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR3                            (0x00000053)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR4                            (0x00000054)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR5                            (0x00000055)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR6                            (0x00000056)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_PRIMARY_CRC_SOR7                            (0x00000057)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC                               27:20
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_NONE                          (0x00000000)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SF                            (0x00000030)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR(i)                        (0x00000050 +(i))
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR__SIZE_1                   8
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR0                          (0x00000050)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR1                          (0x00000051)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR2                          (0x00000052)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR3                          (0x00000053)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR4                          (0x00000054)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR5                          (0x00000055)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR6                          (0x00000056)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_SECONDARY_CRC_SOR7                          (0x00000057)
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CRC_DURING_SNOOZE                           9:9
+#define NVCA7D_HEAD_SET_CRC_CONTROL_CRC_DURING_SNOOZE_DISABLE                   (0x00000000)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL(a)                                         (0x00002280 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_INTERPOLATE                                0:0
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_INTERPOLATE_DISABLE                        (0x00000000)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_INTERPOLATE_ENABLE                         (0x00000001)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MIRROR                                     1:1
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MIRROR_DISABLE                             (0x00000000)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MIRROR_ENABLE                              (0x00000001)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MODE                                       3:2
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MODE_SEGMENTED                             (0x00000000)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MODE_DIRECT8                               (0x00000001)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_MODE_DIRECT10                              (0x00000002)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_SIZE                                       18:8
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_DIRECT_ROUND                               4:4
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_DIRECT_ROUND_DISABLE                       (0x00000000)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_DIRECT_ROUND_ENABLE                        (0x00000001)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_LEVEL                                      25:20
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_SEGMENT_SIZE_BITS                          5:5
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_SEGMENT_SIZE_BITS_SIZE_3BITS               (0x00000000)
+#define NVCA7D_HEAD_SET_OLUT_CONTROL_SEGMENT_SIZE_BITS_SIZE_4BITS               (0x00000001)
+#define NVCA7D_HEAD_SET_OLUT_FP_NORM_SCALE(a)                                   (0x00002284 + (a)*0x00000800)
+#define NVCA7D_HEAD_SET_OLUT_FP_NORM_SCALE_VALUE                                31:0
+
+#define NVCA7D_TILE_SET_TILE_SIZE(a)                                            (0x00006000 + (a)*0x00000200)
+#define NVCA7D_TILE_SET_TILE_SIZE_START                                         14:0
+#define NVCA7D_TILE_SET_TILE_SIZE_WIDTH                                         30:16
+
+#endif // _clca7d_h
diff --git a/drivers/gpu/drm/nouveau/include/nvhw/class/clca7e.h b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7e.h
new file mode 100644
index 000000000000..ebfb2e48a4f4
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvhw/class/clca7e.h
@@ -0,0 +1,137 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef _clca7e_h_
+#define _clca7e_h_
+
+// class methods
+#define NVCA7E_SET_NOTIFIER_CONTROL                                             (0x00000220)
+#define NVCA7E_SET_NOTIFIER_CONTROL_MODE                                        0:0
+#define NVCA7E_SET_NOTIFIER_CONTROL_MODE_WRITE                                  (0x00000000)
+#define NVCA7E_SET_NOTIFIER_CONTROL_MODE_WRITE_AWAKEN                           (0x00000001)
+#define NVCA7E_SET_SIZE                                                         (0x00000224)
+#define NVCA7E_SET_SIZE_WIDTH                                                   15:0
+#define NVCA7E_SET_SIZE_HEIGHT                                                  31:16
+#define NVCA7E_SET_STORAGE                                                      (0x00000228)
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT                                         3:0
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT_NVD_BLOCK_HEIGHT_ONE_GOB                (0x00000000)
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT_NVD_BLOCK_HEIGHT_TWO_GOBS               (0x00000001)
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT_NVD_BLOCK_HEIGHT_FOUR_GOBS              (0x00000002)
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT_NVD_BLOCK_HEIGHT_EIGHT_GOBS             (0x00000003)
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT_NVD_BLOCK_HEIGHT_SIXTEEN_GOBS           (0x00000004)
+#define NVCA7E_SET_STORAGE_BLOCK_HEIGHT_NVD_BLOCK_HEIGHT_THIRTYTWO_GOBS         (0x00000005)
+#define NVCA7E_SET_PARAMS                                                       (0x0000022C)
+#define NVCA7E_SET_PARAMS_FORMAT                                                7:0
+#define NVCA7E_SET_PARAMS_FORMAT_I8                                             (0x0000001E)
+#define NVCA7E_SET_PARAMS_FORMAT_R4G4B4A4                                       (0x0000002F)
+#define NVCA7E_SET_PARAMS_FORMAT_R5G6B5                                         (0x000000E8)
+#define NVCA7E_SET_PARAMS_FORMAT_A1R5G5B5                                       (0x000000E9)
+#define NVCA7E_SET_PARAMS_FORMAT_R5G5B5A1                                       (0x0000002E)
+#define NVCA7E_SET_PARAMS_FORMAT_A8R8G8B8                                       (0x000000CF)
+#define NVCA7E_SET_PARAMS_FORMAT_X8R8G8B8                                       (0x000000E6)
+#define NVCA7E_SET_PARAMS_FORMAT_A8B8G8R8                                       (0x000000D5)
+#define NVCA7E_SET_PARAMS_FORMAT_X8B8G8R8                                       (0x000000F9)
+#define NVCA7E_SET_PARAMS_FORMAT_A2R10G10B10                                    (0x000000DF)
+#define NVCA7E_SET_PARAMS_FORMAT_A2B10G10R10                                    (0x000000D1)
+#define NVCA7E_SET_PARAMS_FORMAT_R16_G16_B16_A16_NVBIAS                         (0x00000023)
+#define NVCA7E_SET_PARAMS_FORMAT_R16_G16_B16_A16                                (0x000000C6)
+#define NVCA7E_SET_PARAMS_FORMAT_RF16_GF16_BF16_AF16                            (0x000000CA)
+#define NVCA7E_SET_PARAMS_FORMAT_Y8_U8__Y8_V8_N422                              (0x00000028)
+#define NVCA7E_SET_PARAMS_FORMAT_U8_Y8__V8_Y8_N422                              (0x00000029)
+#define NVCA7E_SET_PARAMS_FORMAT_Y8___U8V8_N444                                 (0x00000035)
+#define NVCA7E_SET_PARAMS_FORMAT_Y8___U8V8_N422                                 (0x00000036)
+#define NVCA7E_SET_PARAMS_FORMAT_Y8___V8U8_N420                                 (0x00000038)
+#define NVCA7E_SET_PARAMS_FORMAT_Y8___U8___V8_N444                              (0x0000003A)
+#define NVCA7E_SET_PARAMS_FORMAT_Y8___U8___V8_N420                              (0x0000003B)
+#define NVCA7E_SET_PARAMS_FORMAT_Y10___U10V10_N444                              (0x00000055)
+#define NVCA7E_SET_PARAMS_FORMAT_Y10___U10V10_N422                              (0x00000056)
+#define NVCA7E_SET_PARAMS_FORMAT_Y10___V10U10_N420                              (0x00000058)
+#define NVCA7E_SET_PARAMS_FORMAT_Y12___U12V12_N444                              (0x00000075)
+#define NVCA7E_SET_PARAMS_FORMAT_Y12___U12V12_N422                              (0x00000076)
+#define NVCA7E_SET_PARAMS_FORMAT_Y12___V12U12_N420                              (0x00000078)
+#define NVCA7E_SET_PARAMS_CLAMP_BEFORE_BLEND                                    18:18
+#define NVCA7E_SET_PARAMS_CLAMP_BEFORE_BLEND_DISABLE                            (0x00000000)
+#define NVCA7E_SET_PARAMS_CLAMP_BEFORE_BLEND_ENABLE                             (0x00000001)
+#define NVCA7E_SET_PARAMS_SWAP_UV                                               19:19
+#define NVCA7E_SET_PARAMS_SWAP_UV_DISABLE                                       (0x00000000)
+#define NVCA7E_SET_PARAMS_SWAP_UV_ENABLE                                        (0x00000001)
+#define NVCA7E_SET_PARAMS_FMT_ROUNDING_MODE                                     22:22
+#define NVCA7E_SET_PARAMS_FMT_ROUNDING_MODE_ROUND_TO_NEAREST                    (0x00000000)
+#define NVCA7E_SET_PARAMS_FMT_ROUNDING_MODE_ROUND_DOWN                          (0x00000001)
+#define NVCA7E_SET_PLANAR_STORAGE(b)                                            (0x00000230 + (b)*0x00000004)
+#define NVCA7E_SET_PLANAR_STORAGE_PITCH                                         12:0
+#define NVCA7E_SET_POINT_IN(b)                                                  (0x00000290 + (b)*0x00000004)
+#define NVCA7E_SET_POINT_IN_X                                                   15:0
+#define NVCA7E_SET_POINT_IN_Y                                                   31:16
+#define NVCA7E_SET_SIZE_IN                                                      (0x00000298)
+#define NVCA7E_SET_SIZE_IN_WIDTH                                                15:0
+#define NVCA7E_SET_SIZE_IN_HEIGHT                                               31:16
+#define NVCA7E_SET_SIZE_OUT                                                     (0x000002A4)
+#define NVCA7E_SET_SIZE_OUT_WIDTH                                               15:0
+#define NVCA7E_SET_SIZE_OUT_HEIGHT                                              31:16
+#define NVCA7E_SET_PRESENT_CONTROL                                              (0x00000308)
+#define NVCA7E_SET_PRESENT_CONTROL_MIN_PRESENT_INTERVAL                         3:0
+#define NVCA7E_SET_PRESENT_CONTROL_BEGIN_MODE                                   6:4
+#define NVCA7E_SET_PRESENT_CONTROL_BEGIN_MODE_NON_TEARING                       (0x00000000)
+#define NVCA7E_SET_PRESENT_CONTROL_BEGIN_MODE_IMMEDIATE                         (0x00000001)
+#define NVCA7E_SET_PRESENT_CONTROL_TIMESTAMP_MODE                               8:8
+#define NVCA7E_SET_PRESENT_CONTROL_TIMESTAMP_MODE_DISABLE                       (0x00000000)
+#define NVCA7E_SET_PRESENT_CONTROL_TIMESTAMP_MODE_ENABLE                        (0x00000001)
+#define NVCA7E_SET_PRESENT_CONTROL_STEREO_MODE                                  13:12
+#define NVCA7E_SET_PRESENT_CONTROL_STEREO_MODE_MONO                             (0x00000000)
+#define NVCA7E_SET_PRESENT_CONTROL_STEREO_MODE_PAIR_FLIP                        (0x00000001)
+#define NVCA7E_SET_PRESENT_CONTROL_STEREO_MODE_AT_ANY_FRAME                     (0x00000002)
+#define NVCA7E_SET_ILUT_CONTROL                                                 (0x00000440)
+#define NVCA7E_SET_ILUT_CONTROL_INTERPOLATE                                     0:0
+#define NVCA7E_SET_ILUT_CONTROL_INTERPOLATE_DISABLE                             (0x00000000)
+#define NVCA7E_SET_ILUT_CONTROL_INTERPOLATE_ENABLE                              (0x00000001)
+#define NVCA7E_SET_ILUT_CONTROL_MIRROR                                          1:1
+#define NVCA7E_SET_ILUT_CONTROL_MIRROR_DISABLE                                  (0x00000000)
+#define NVCA7E_SET_ILUT_CONTROL_MIRROR_ENABLE                                   (0x00000001)
+#define NVCA7E_SET_ILUT_CONTROL_MODE                                            3:2
+#define NVCA7E_SET_ILUT_CONTROL_MODE_SEGMENTED                                  (0x00000000)
+#define NVCA7E_SET_ILUT_CONTROL_MODE_DIRECT8                                    (0x00000001)
+#define NVCA7E_SET_ILUT_CONTROL_MODE_DIRECT10                                   (0x00000002)
+#define NVCA7E_SET_ILUT_CONTROL_SIZE                                            18:8
+#define NVCA7E_SET_SURFACE_ADDRESS_HI_NOTIFIER                                  (0x00000650)
+#define NVCA7E_SET_SURFACE_ADDRESS_HI_NOTIFIER_ADDRESS_HI                       31:0
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER                                  (0x00000654)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_ADDRESS_LO                       31:4
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET                           3:2
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_IOVA                      (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_PHYSICAL_NVM              (0x00000001)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_PHYSICAL_PCI              (0x00000002)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_TARGET_PHYSICAL_PCI_COHERENT     (0x00000003)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_ENABLE                           0:0
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_ENABLE_DISABLE                   (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_NOTIFIER_ENABLE_ENABLE                    (0x00000001)
+#define NVCA7E_SET_SURFACE_ADDRESS_HI_ISO(b)                                    (0x00000658 + (b)*0x00000004)
+#define NVCA7E_SET_SURFACE_ADDRESS_HI_ISO_ADDRESS_HI                            31:0
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO(b)                                    (0x00000670 + (b)*0x00000004)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_ADDRESS_LO                            31:4
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_TARGET                                3:2
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_TARGET_IOVA                           (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_TARGET_PHYSICAL_NVM                   (0x00000001)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_TARGET_PHYSICAL_PCI                   (0x00000002)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_TARGET_PHYSICAL_PCI_COHERENT          (0x00000003)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_KIND                                  1:1
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_KIND_PITCH                            (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_KIND_BLOCKLINEAR                      (0x00000001)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_ENABLE                                0:0
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_ENABLE_DISABLE                        (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ISO_ENABLE_ENABLE                         (0x00000001)
+#define NVCA7E_SET_SURFACE_ADDRESS_HI_ILUT                                      (0x00000688)
+#define NVCA7E_SET_SURFACE_ADDRESS_HI_ILUT_ADDRESS_HI                           31:0
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT                                      (0x0000068C)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_ADDRESS_LO                           31:4
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_TARGET                               3:2
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_TARGET_IOVA                          (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_TARGET_PHYSICAL_NVM                  (0x00000001)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_TARGET_PHYSICAL_PCI                  (0x00000002)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_TARGET_PHYSICAL_PCI_COHERENT         (0x00000003)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_ENABLE                               0:0
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_ENABLE_DISABLE                       (0x00000000)
+#define NVCA7E_SET_SURFACE_ADDRESS_LO_ILUT_ENABLE_ENABLE                        (0x00000001)
+
+#endif // _clca7e_h
diff --git a/drivers/gpu/drm/nouveau/include/nvif/pushc97b.h b/drivers/gpu/drm/nouveau/include/nvif/pushc97b.h
new file mode 100644
index 000000000000..c8d6b6319134
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/include/nvif/pushc97b.h
@@ -0,0 +1,18 @@
+#ifndef __NVIF_PUSHC97B_H__
+#define __NVIF_PUSHC97B_H__
+#include <nvif/push.h>
+
+#include <nvhw/class/clc97b.h>
+
+#define PUSH_HDR(p,m,c) do {                                                    \
+        PUSH_ASSERT(!((m) & ~DRF_SMASK(NVC97B_DMA_METHOD_OFFSET)), "mthd");     \
+        PUSH_ASSERT(!((c) & ~DRF_MASK(NVC97B_DMA_METHOD_COUNT)), "size");       \
+        PUSH_DATA__((p), NVDEF(NVC97B, DMA, OPCODE, METHOD) |                   \
+			 NVVAL(NVC97B, DMA, METHOD_COUNT, (c)) |                \
+			 NVVAL(NVC97B, DMA, METHOD_OFFSET, (m) >> 2),           \
+		    " mthd 0x%04x size %d - %s", (u32)(m), (u32)(c), __func__); \
+} while(0)
+
+#define PUSH_MTHD_HDR(p,s,m,c) PUSH_HDR(p,m,c)
+#define PUSH_MTHD_INC 4:4
+#endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 1b10c6c12f46..63621b1510f6 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1401,6 +1401,8 @@ nouveau_connector_create(struct drm_device *dev, int index)
 		nv_connector->aux.drm_dev = dev;
 		nv_connector->aux.transfer = nouveau_connector_aux_xfer;
 		nv_connector->aux.name = connector->name;
+		if (disp->disp.object.oclass >= GB202_DISP)
+			nv_connector->aux.no_zero_sized = true;
 		drm_dp_aux_init(&nv_connector->aux);
 		break;
 	default:
diff --git a/drivers/gpu/drm/nouveau/nvif/disp.c b/drivers/gpu/drm/nouveau/nvif/disp.c
index 14da22fa3b5b..fa42146252da 100644
--- a/drivers/gpu/drm/nouveau/nvif/disp.c
+++ b/drivers/gpu/drm/nouveau/nvif/disp.c
@@ -36,6 +36,7 @@ int
 nvif_disp_ctor(struct nvif_device *device, const char *name, s32 oclass, struct nvif_disp *disp)
 {
 	static const struct nvif_mclass disps[] = {
+		{ GB202_DISP, 0 },
 		{ AD102_DISP, 0 },
 		{ GA102_DISP, 0 },
 		{ TU102_DISP, 0 },
-- 
2.49.0

