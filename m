Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 30AE18A7915
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 79368112FA0;
	Tue, 16 Apr 2024 23:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="HIDt3KEL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2041.outbound.protection.outlook.com [40.107.94.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B73A112F9E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ncEup2i79Fq7uhf7gzMeZ+H9+RY03arnh6cdGb6r2opIgIGJd21ykQqKlzuSGQnnliqQ3XBDoXKaV1qwLvHhDAawNgYnMstMuB9ocGsingKUojT6RQbWUFULQmwoIRlwhzEaDlOpwpUonS1ME61bFUvMv6ITKzXD+NFasDpbpn+sCXrJctIsPKZLLVB6gpvh/TTAjLTbLdiKuoPU88fGjyQv8MzkLJR50xY9hrA98d9o9NVxRPXfUI2c46YTXGggeoDezRZ3C4QNi7dBZfZHrEDOHdT0lYX7waYh8iw00b2NJDDiZnUQBhvU8dF/gzZGV8flaKVg3GVwDGtPu1TEEA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=oi28mYABK7Gx+jei/zhyvKv00mOy8d1hFSgbDK9Tlpg=;
 b=WdsQbdMTa+MY3zvQy/aeP4PcpRNk/bvUHAEUlA7W2tRXm4syDFNRTG6o2+o6wjObxADgtqTdohqnMKb7VmJmC2QlIqOj8NTv/g8fxNt74B/6nbhrR89u3c9dynsBo/bk2q0Qsw5UbpXAX7P4eVWRm8XFEvdyi6QvxSOt1bxbahsJ9d8NnCxCAHiRQgFj9BKsMHUJp81q0Sm1S45YtnXB39zQU91C2zMZhFcNfeNdRRgSfRZlbjGs2uLZvSXIRpIwc98urmvWdBb05wwIXxSSQai195Om1OwDqqIg5KBfTGkpxw2uHAz/89vR5KO9sqRXXbktSx8Y55fCT3KQ5yHsKw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=oi28mYABK7Gx+jei/zhyvKv00mOy8d1hFSgbDK9Tlpg=;
 b=HIDt3KELdyAI4eW9gq03CQyejrLw2U3PIdNouGN3aO4c5zOu6vR3t5Y84cE4IcnSeJ5pojPHPXeTR+rf/HJNIa2roGgGjzYVYSB5E/K+PdxvYh1/qXaEYXXuzw1xu8V8zg69j+ubOM0l261tJ3gxF8TLvdEoDEkooztdjIs5yCORUxDciLoH0Jw1tgHb+lgrRa3ww4fIf4QCAbV7fHYCqzeBkPvfQJTHJGjmfQ/ChK84F4Y+CUcNr09jl/QA8R123/HXALX5saRnLk2n34o4oWfFa3dgGRxihYNOeOqI6EZHpZQA+XJQmNuGe5Bdl/KQEvIUn5dVJVILg9OQTLTHkQ==
Received: from DS7PR03CA0063.namprd03.prod.outlook.com (2603:10b6:5:3bb::8) by
 BL3PR12MB9051.namprd12.prod.outlook.com (2603:10b6:208:3ba::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.50; Tue, 16 Apr 2024 23:42:47 +0000
Received: from CH2PEPF0000013C.namprd02.prod.outlook.com
 (2603:10b6:5:3bb:cafe::f9) by DS7PR03CA0063.outlook.office365.com
 (2603:10b6:5:3bb::8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:46 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:25 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 100/156] drm/nouveau/nvif: rework disp "sclass" api
Date: Wed, 17 Apr 2024 09:39:06 +1000
Message-ID: <20240416234002.19509-101-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013C:EE_|BL3PR12MB9051:EE_
X-MS-Office365-Filtering-Correlation-Id: 3d739e35-d857-43cd-4304-08dc5e6eeb51
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXKJZQlCV87whhTmbPMTMseoRYVK9bmXS/zojUL5igfAuV4pwXdFqW2Ank0HaEBjYk+jQW0i6nna5zGwbL0tKsow6eqPqxv5p+4NGqqcdR1RmwJDWTTgcuQ1S/K5jk+FkLW/cKULSZw3uE6gO48Ux9VRacscFIioXZJRy0eq+YSBpJ/VAEISVasjMsLjeEV8GSnB3R0/+moV5R7FCAayXnQeOOLP40gKQTvRex7ZfjREQ2I1zTn3+mhhTpTy5NJPAarAscqPuNQp79i2VJSXtSbQVqbqfQX28sJsCmQYzvY8x0PO1w85Z0WpWZtc0B/pZRUiUU53w7ggJ14KTc4SDfGqgGmeXlyHBPNVJ9k3THmBpU/H3fQ8zPfSWMl4mUIvLZNb/L9SOp4xVfOoLgfRYi70WXhUACEWu72Q5B+AFw/3gNhvCpFW9PdD6R6lbi/iwJlFEckvx8opdTAXeO66vUHGkq2MKzdSygMSIxW8mJoXHArWcAgDmidHQbCi7fSGe87RVKF6fh7/omKz53vUrq2uAnSv/2NfYug3W9Dx+36qddEJOTRQlkA+QXGSkqZr4ptUBAY71smlFlBANm0xE2g9LP2pUeBs+cSKA1xgUzr8PtW+RalQW0Ic402L5FfZguoTRDJVpJg6abAN2UALAxpZcOWJrZUxkYF07+XJQgjCXNCeLxV/RRLQPgo0aE33JhNYz7Sj0/CBt4US7i+asHko1tMBTXLvJZy9qXvEaPyJe6+ByeX1tAZzVnrOB8gm
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:46.5590 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3d739e35-d857-43cd-4304-08dc5e6eeb51
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013C.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9051
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
 drivers/gpu/drm/nouveau/dispnv50/base.c       | 33 +++++--------
 drivers/gpu/drm/nouveau/dispnv50/core.c       | 49 ++++++++-----------
 drivers/gpu/drm/nouveau/dispnv50/curs.c       | 35 ++++++-------
 drivers/gpu/drm/nouveau/dispnv50/oimm.c       | 29 +++++------
 drivers/gpu/drm/nouveau/dispnv50/ovly.c       | 32 +++++-------
 drivers/gpu/drm/nouveau/dispnv50/wimm.c       | 25 ++++------
 drivers/gpu/drm/nouveau/dispnv50/wndw.c       | 27 ++++------
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 18 +++++++
 drivers/gpu/drm/nouveau/include/nvif/object.h | 29 -----------
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 20 ++++++++
 10 files changed, 129 insertions(+), 168 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base.c b/drivers/gpu/drm/nouveau/dispnv50/base.c
index 7c752acf2b48..db0b42c6243e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base.c
@@ -26,28 +26,21 @@
 int
 nv50_base_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 {
-	struct {
-		s32 oclass;
-		int version;
-		int (*new)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
-	} bases[] = {
-		{ GK110_DISP_BASE_CHANNEL_DMA, 0, base917c_new },
-		{ GK104_DISP_BASE_CHANNEL_DMA, 0, base917c_new },
-		{ GF110_DISP_BASE_CHANNEL_DMA, 0, base907c_new },
-		{ GT214_DISP_BASE_CHANNEL_DMA, 0, base827c_new },
-		{ GT200_DISP_BASE_CHANNEL_DMA, 0, base827c_new },
-		{   G82_DISP_BASE_CHANNEL_DMA, 0, base827c_new },
-		{  NV50_DISP_BASE_CHANNEL_DMA, 0, base507c_new },
-		{}
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
-	int cid;
+	int (*ctor)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 
-	cid = nvif_mclass(&disp->disp->object, bases);
-	if (cid < 0) {
+	switch (disp->impl->chan.base.oclass) {
+	case GK110_DISP_BASE_CHANNEL_DMA: ctor = base917c_new; break;
+	case GK104_DISP_BASE_CHANNEL_DMA: ctor = base917c_new; break;
+	case GF110_DISP_BASE_CHANNEL_DMA: ctor = base907c_new; break;
+	case GT214_DISP_BASE_CHANNEL_DMA: ctor = base827c_new; break;
+	case GT200_DISP_BASE_CHANNEL_DMA: ctor = base827c_new; break;
+	case   G82_DISP_BASE_CHANNEL_DMA: ctor = base827c_new; break;
+	case  NV50_DISP_BASE_CHANNEL_DMA: ctor = base507c_new; break;
+	default:
 		NV_ERROR(drm, "No supported base class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	return bases[cid].new(drm, head, bases[cid].oclass, pwndw);
+	return ctor(drm, head, disp->impl->chan.base.oclass, pwndw);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core.c b/drivers/gpu/drm/nouveau/dispnv50/core.c
index a9c3e53ef909..7d5438355715 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core.c
@@ -43,41 +43,34 @@ nv50_core_del(struct nv50_core **pcore)
 int
 nv50_core_new(struct nouveau_drm *drm, struct nv50_core **pcore)
 {
-	struct {
-		s32 oclass;
-		int version;
-		int (*new)(struct nouveau_drm *, s32, struct nv50_core **);
-	} cores[] = {
-		{ AD102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
-		{ GA102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
-		{ TU102_DISP_CORE_CHANNEL_DMA, 0, corec57d_new },
-		{ GV100_DISP_CORE_CHANNEL_DMA, 0, corec37d_new },
-		{ GP102_DISP_CORE_CHANNEL_DMA, 0, core917d_new },
-		{ GP100_DISP_CORE_CHANNEL_DMA, 0, core917d_new },
-		{ GM200_DISP_CORE_CHANNEL_DMA, 0, core917d_new },
-		{ GM107_DISP_CORE_CHANNEL_DMA, 0, core917d_new },
-		{ GK110_DISP_CORE_CHANNEL_DMA, 0, core917d_new },
-		{ GK104_DISP_CORE_CHANNEL_DMA, 0, core917d_new },
-		{ GF110_DISP_CORE_CHANNEL_DMA, 0, core907d_new },
-		{ GT214_DISP_CORE_CHANNEL_DMA, 0, core827d_new },
-		{ GT206_DISP_CORE_CHANNEL_DMA, 0, core827d_new },
-		{ GT200_DISP_CORE_CHANNEL_DMA, 0, core827d_new },
-		{   G82_DISP_CORE_CHANNEL_DMA, 0, core827d_new },
-		{  NV50_DISP_CORE_CHANNEL_DMA, 0, core507d_new },
-		{}
-	};
+	int (*ctor)(struct nouveau_drm *, s32, struct nv50_core **);
 	struct nv50_disp *disp = nv50_disp(drm->dev);
 	struct nv50_core *core;
-	int cid;
 	int ret;
 
-	cid = nvif_mclass(&disp->disp->object, cores);
-	if (cid < 0) {
+	switch (disp->disp->impl->chan.core.oclass) {
+	case AD102_DISP_CORE_CHANNEL_DMA: ctor = corec57d_new; break;
+	case GA102_DISP_CORE_CHANNEL_DMA: ctor = corec57d_new; break;
+	case TU102_DISP_CORE_CHANNEL_DMA: ctor = corec57d_new; break;
+	case GV100_DISP_CORE_CHANNEL_DMA: ctor = corec37d_new; break;
+	case GP102_DISP_CORE_CHANNEL_DMA: ctor = core917d_new; break;
+	case GP100_DISP_CORE_CHANNEL_DMA: ctor = core917d_new; break;
+	case GM200_DISP_CORE_CHANNEL_DMA: ctor = core917d_new; break;
+	case GM107_DISP_CORE_CHANNEL_DMA: ctor = core917d_new; break;
+	case GK110_DISP_CORE_CHANNEL_DMA: ctor = core917d_new; break;
+	case GK104_DISP_CORE_CHANNEL_DMA: ctor = core917d_new; break;
+	case GF110_DISP_CORE_CHANNEL_DMA: ctor = core907d_new; break;
+	case GT214_DISP_CORE_CHANNEL_DMA: ctor = core827d_new; break;
+	case GT206_DISP_CORE_CHANNEL_DMA: ctor = core827d_new; break;
+	case GT200_DISP_CORE_CHANNEL_DMA: ctor = core827d_new; break;
+	case   G82_DISP_CORE_CHANNEL_DMA: ctor = core827d_new; break;
+	case  NV50_DISP_CORE_CHANNEL_DMA: ctor = core507d_new; break;
+	default:
 		NV_ERROR(drm, "No supported core channel class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	ret = cores[cid].new(drm, cores[cid].oclass, &core);
+	ret = ctor(drm, disp->disp->impl->chan.core.oclass, &core);
 	*pcore = core;
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/curs.c b/drivers/gpu/drm/nouveau/dispnv50/curs.c
index 31d8b2e4791d..8d1026c6baec 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/curs.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/curs.c
@@ -26,29 +26,22 @@
 int
 nv50_curs_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 {
-	struct {
-		s32 oclass;
-		int version;
-		int (*new)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
-	} curses[] = {
-		{ GA102_DISP_CURSOR, 0, cursc37a_new },
-		{ TU102_DISP_CURSOR, 0, cursc37a_new },
-		{ GV100_DISP_CURSOR, 0, cursc37a_new },
-		{ GK104_DISP_CURSOR, 0, curs907a_new },
-		{ GF110_DISP_CURSOR, 0, curs907a_new },
-		{ GT214_DISP_CURSOR, 0, curs507a_new },
-		{   G82_DISP_CURSOR, 0, curs507a_new },
-		{  NV50_DISP_CURSOR, 0, curs507a_new },
-		{}
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
-	int cid;
+	int (*ctor)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 
-	cid = nvif_mclass(&disp->disp->object, curses);
-	if (cid < 0) {
+	switch (disp->impl->chan.curs.oclass) {
+	case GA102_DISP_CURSOR: ctor = cursc37a_new; break;
+	case TU102_DISP_CURSOR: ctor = cursc37a_new; break;
+	case GV100_DISP_CURSOR: ctor = cursc37a_new; break;
+	case GK104_DISP_CURSOR: ctor = curs907a_new; break;
+	case GF110_DISP_CURSOR: ctor = curs907a_new; break;
+	case GT214_DISP_CURSOR: ctor = curs507a_new; break;
+	case   G82_DISP_CURSOR: ctor = curs507a_new; break;
+	case  NV50_DISP_CURSOR: ctor = curs507a_new; break;
+	default:
 		NV_ERROR(drm, "No supported cursor immediate class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	return curses[cid].new(drm, head, curses[cid].oclass, pwndw);
+	return ctor(drm, head, disp->impl->chan.curs.oclass, pwndw);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/oimm.c b/drivers/gpu/drm/nouveau/dispnv50/oimm.c
index 2a2841d344c8..4a06cd293cb5 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/oimm.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/oimm.c
@@ -26,26 +26,19 @@
 int
 nv50_oimm_init(struct nouveau_drm *drm, struct nv50_wndw *wndw)
 {
-	static const struct {
-		s32 oclass;
-		int version;
-		int (*init)(struct nouveau_drm *, s32, struct nv50_wndw *);
-	} oimms[] = {
-		{ GK104_DISP_OVERLAY, 0, oimm507b_init },
-		{ GF110_DISP_OVERLAY, 0, oimm507b_init },
-		{ GT214_DISP_OVERLAY, 0, oimm507b_init },
-		{   G82_DISP_OVERLAY, 0, oimm507b_init },
-		{  NV50_DISP_OVERLAY, 0, oimm507b_init },
-		{}
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
-	int cid;
+	int (*ctor)(struct nouveau_drm *, s32, struct nv50_wndw *);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 
-	cid = nvif_mclass(&disp->disp->object, oimms);
-	if (cid < 0) {
+	switch (disp->impl->chan.oimm.oclass) {
+	case GK104_DISP_OVERLAY: ctor = oimm507b_init; break;
+	case GF110_DISP_OVERLAY: ctor = oimm507b_init; break;
+	case GT214_DISP_OVERLAY: ctor = oimm507b_init; break;
+	case   G82_DISP_OVERLAY: ctor = oimm507b_init; break;
+	case  NV50_DISP_OVERLAY: ctor = oimm507b_init; break;
+	default:
 		NV_ERROR(drm, "No supported overlay immediate class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	return oimms[cid].init(drm, oimms[cid].oclass, wndw);
+	return ctor(drm, disp->impl->chan.oimm.oclass, wndw);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly.c b/drivers/gpu/drm/nouveau/dispnv50/ovly.c
index 90c246d47604..029c86a53c1f 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly.c
@@ -27,29 +27,23 @@
 int
 nv50_ovly_new(struct nouveau_drm *drm, int head, struct nv50_wndw **pwndw)
 {
-	static const struct {
-		s32 oclass;
-		int version;
-		int (*new)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
-	} ovlys[] = {
-		{ GK104_DISP_OVERLAY_CONTROL_DMA, 0, ovly917e_new },
-		{ GF110_DISP_OVERLAY_CONTROL_DMA, 0, ovly907e_new },
-		{ GT214_DISP_OVERLAY_CHANNEL_DMA, 0, ovly827e_new },
-		{ GT200_DISP_OVERLAY_CHANNEL_DMA, 0, ovly827e_new },
-		{   G82_DISP_OVERLAY_CHANNEL_DMA, 0, ovly827e_new },
-		{  NV50_DISP_OVERLAY_CHANNEL_DMA, 0, ovly507e_new },
-		{}
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
-	int cid, ret;
+	int (*ctor)(struct nouveau_drm *, int, s32, struct nv50_wndw **);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
+	int ret;
 
-	cid = nvif_mclass(&disp->disp->object, ovlys);
-	if (cid < 0) {
+	switch (disp->impl->chan.ovly.oclass) {
+	case GK104_DISP_OVERLAY_CONTROL_DMA: ctor = ovly917e_new; break;
+	case GF110_DISP_OVERLAY_CONTROL_DMA: ctor = ovly907e_new; break;
+	case GT214_DISP_OVERLAY_CHANNEL_DMA: ctor = ovly827e_new; break;
+	case GT200_DISP_OVERLAY_CHANNEL_DMA: ctor = ovly827e_new; break;
+	case   G82_DISP_OVERLAY_CHANNEL_DMA: ctor = ovly827e_new; break;
+	case  NV50_DISP_OVERLAY_CHANNEL_DMA: ctor = ovly507e_new; break;
+	default:
 		NV_ERROR(drm, "No supported overlay class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	ret = ovlys[cid].new(drm, head, ovlys[cid].oclass, pwndw);
+	ret = ctor(drm, head, disp->impl->chan.ovly.oclass, pwndw);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimm.c b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
index 566fbddfc8d7..c94830cf07cb 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimm.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimm.c
@@ -26,24 +26,17 @@
 int
 nv50_wimm_init(struct nouveau_drm *drm, struct nv50_wndw *wndw)
 {
-	struct {
-		s32 oclass;
-		int version;
-		int (*init)(struct nouveau_drm *, s32, struct nv50_wndw *);
-	} wimms[] = {
-		{ GA102_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
-		{ TU102_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
-		{ GV100_DISP_WINDOW_IMM_CHANNEL_DMA, 0, wimmc37b_init },
-		{}
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
-	int cid;
+	int (*ctor)(struct nouveau_drm *, s32, struct nv50_wndw *);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
 
-	cid = nvif_mclass(&disp->disp->object, wimms);
-	if (cid < 0) {
+	switch (disp->impl->chan.wimm.oclass) {
+	case GA102_DISP_WINDOW_IMM_CHANNEL_DMA: ctor = wimmc37b_init; break;
+	case TU102_DISP_WINDOW_IMM_CHANNEL_DMA: ctor = wimmc37b_init; break;
+	case GV100_DISP_WINDOW_IMM_CHANNEL_DMA: ctor = wimmc37b_init; break;
+	default:
 		NV_ERROR(drm, "No supported window immediate class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	return wimms[cid].init(drm, wimms[cid].oclass, wndw);
+	return ctor(drm, disp->impl->chan.wimm.oclass, wndw);
 }
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndw.c b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
index 19606755daf5..6fb6d2252e15 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndw.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndw.c
@@ -810,27 +810,20 @@ int
 nv50_wndw_new(struct nouveau_drm *drm, enum drm_plane_type type, int index,
 	      struct nv50_wndw **pwndw)
 {
-	struct {
-		s32 oclass;
-		int version;
-		int (*new)(struct nouveau_drm *, enum drm_plane_type,
-			   int, s32, struct nv50_wndw **);
-	} wndws[] = {
-		{ GA102_DISP_WINDOW_CHANNEL_DMA, 0, wndwc67e_new },
-		{ TU102_DISP_WINDOW_CHANNEL_DMA, 0, wndwc57e_new },
-		{ GV100_DISP_WINDOW_CHANNEL_DMA, 0, wndwc37e_new },
-		{}
-	};
-	struct nv50_disp *disp = nv50_disp(drm->dev);
-	int cid, ret;
+	int (*ctor)(struct nouveau_drm *, enum drm_plane_type, int, s32, struct nv50_wndw **);
+	struct nvif_disp *disp = nv50_disp(drm->dev)->disp;
+	int ret;
 
-	cid = nvif_mclass(&disp->disp->object, wndws);
-	if (cid < 0) {
+	switch (disp->impl->chan.wndw.oclass) {
+	case GA102_DISP_WINDOW_CHANNEL_DMA: ctor = wndwc67e_new; break;
+	case TU102_DISP_WINDOW_CHANNEL_DMA: ctor = wndwc57e_new; break;
+	case GV100_DISP_WINDOW_CHANNEL_DMA: ctor = wndwc37e_new; break;
+	default:
 		NV_ERROR(drm, "No supported window class\n");
-		return cid;
+		return -ENODEV;
 	}
 
-	ret = wndws[cid].new(drm, type, index, wndws[cid].oclass, pwndw);
+	ret = ctor(drm, type, index, disp->impl->chan.wndw.oclass, pwndw);
 	if (ret)
 		return ret;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index e479e8114605..f96638ce4b12 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -220,6 +220,10 @@ struct nvif_faultbuf_impl {
 struct nvif_disp_impl {
 	void (*del)(struct nvif_disp_priv *);
 
+	struct {
+		u32 oclass;
+	} caps;
+
 	struct {
 		u32 mask;
 	} conn;
@@ -231,6 +235,20 @@ struct nvif_disp_impl {
 	struct {
 		u32 mask;
 	} head;
+
+	struct {
+		struct nvif_disp_impl_core {
+			s32 oclass;
+		} core;
+
+		struct nvif_disp_impl_dmac {
+			s32 oclass;
+		} base, ovly, wndw, wimm;
+
+		struct nvif_disp_impl_pioc {
+			s32 oclass;
+		} curs, oimm;
+	} chan;
 };
 
 struct nvif_device_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index 819ae1c9729d..10a8f3e1ea81 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -82,35 +82,6 @@ void nvif_object_unmap(struct nvif_object *);
 
 #define nvif_mthd(a,b,c,d) nvif_object_mthd((a), (b), (c), (d))
 
-struct nvif_mclass {
-	s32 oclass;
-	int version;
-};
-
-#define nvif_mclass(o,m) ({                                                    \
-	struct nvif_object *object = (o);                                      \
-	struct nvif_sclass *sclass;                                            \
-	typeof(m[0]) *mclass = (m);                                            \
-	int ret = -ENODEV;                                                     \
-	int cnt, i, j;                                                         \
-                                                                               \
-	cnt = nvif_object_sclass_get(object, &sclass);                         \
-	if (cnt >= 0) {                                                        \
-		for (i = 0; ret < 0 && mclass[i].oclass; i++) {                \
-			for (j = 0; j < cnt; j++) {                            \
-				if (mclass[i].oclass  == sclass[j].oclass &&   \
-				    mclass[i].version >= sclass[j].minver &&   \
-				    mclass[i].version <= sclass[j].maxver) {   \
-					ret = i;                               \
-					break;                                 \
-				}                                              \
-			}                                                      \
-		}                                                              \
-		nvif_object_sclass_put(&sclass);                               \
-	}                                                                      \
-	ret;                                                                   \
-})
-
 #define NVIF_RD32_(p,o,dr)   nvif_rd32((p), (o) + (dr))
 #define NVIF_WR32_(p,o,dr,f) nvif_wr32((p), (o) + (dr), (f))
 #define NVIF_RD32(p,A...) DRF_RD(NVIF_RD32_,                  (p), 0, ##A)
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index 06e465edf3e9..fd8590514c7e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -171,6 +171,10 @@ nvkm_udisp_new(struct nvkm_device *device, const struct nvif_disp_impl **pimpl,
 	udisp->disp = disp;
 	udisp->impl = nvkm_udisp_impl;
 
+	if (disp->func->user.caps.oclass) {
+		udisp->impl.caps.oclass = disp->func->user.caps.oclass;
+	}
+
 	list_for_each_entry(conn, &disp->conns, head)
 		udisp->impl.conn.mask |= BIT(conn->index);
 
@@ -180,6 +184,22 @@ nvkm_udisp_new(struct nvkm_device *device, const struct nvif_disp_impl **pimpl,
 	list_for_each_entry(head, &disp->heads, head)
 		udisp->impl.head.mask |= BIT(head->id);
 
+	if (disp->func->user.core.oclass) {
+		udisp->impl.chan.core.oclass = disp->func->user.core.oclass;
+		udisp->impl.chan.curs.oclass = disp->func->user.curs.oclass;
+
+		if (!disp->func->user.wndw.oclass) {
+			/* EVO */
+			udisp->impl.chan.base.oclass = disp->func->user.base.oclass;
+			udisp->impl.chan.ovly.oclass = disp->func->user.ovly.oclass;
+			udisp->impl.chan.oimm.oclass = disp->func->user.oimm.oclass;
+		} else {
+			/* NVDisplay (GV100-) */
+			udisp->impl.chan.wndw.oclass = disp->func->user.wndw.oclass;
+			udisp->impl.chan.wimm.oclass = disp->func->user.wimm.oclass;
+		}
+	}
+
 	*pimpl = &udisp->impl;
 	*ppriv = udisp;
 	*pobject = &udisp->object;
-- 
2.41.0

