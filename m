Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B8B7793CD5B
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C02C10E918;
	Fri, 26 Jul 2024 04:39:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sCGHTRH6";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B98C810E918
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:54 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PQJQPRL2HPeAkxc9woYLF+sv7sDdj0FSEsaCRbb/sED8t0/1w81IHYAm3v/pBU4hvoJ1P/WP2u2ncQ2qIEvZzvhhiG05u9Mj6toDlh1JKeZe9C2m9AxcOk8iD/EUzgFcH/n96iopfsV3xXtgeu0mHy9T8DwmDAJyM/HpeQvGAeG5vZvzBH7zptL3pLhsgwPZ+y1GjcPjTc9OXq7JvfPmCAiJdhwsYOXuJDoKKCMdWDcbGrwnzVdQHvWj0rYmtlvpiVuQyk8e1rGp0qq70d88KpNDabndLB3wGVAnfEaL8W/ixEqSLVr9PZWreZMZJqvTlw9VIThnjAoG8HzXkuwh9Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KSOyAsCcwFI9JZmII5qhByWhSvqzR/CtRXZfBLLf3ug=;
 b=CneJeLgG7VlFTuH4y7ZHaBFkaPHQ4qXdvPAneWHLJba0uur3pMGacuzP9lbVox3mBIy4nLyqBj3IvhAbt5XAxTb+sLslLfUBcBD3Iq7LQ4/qC8+I99l6CBeuXcmiUj0ZWMtFWbId2B2TLAJ/DREeO53xnQAhvAHg59ihEDFJ1gPkgvxY668DRbiDgymD4gWQv2nLCNUEkaST48WL3G9XbAMcq4x1t2Mfrj3xdDA0qDWIbCqSeuv8JBWHoq6C6Ih8M+W7VFMlDm62TKfbbKEudSPAoX9U4HmuwERSpru0Qgon+FmyIai4JJSjembSbrnh7oekzPJcLAd1CJQs5Lu9vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KSOyAsCcwFI9JZmII5qhByWhSvqzR/CtRXZfBLLf3ug=;
 b=sCGHTRH6EBW8iRr2gQyyKtO8EmBmtz+KSby7fFI8amr12de23ozWajnCS+EQqYnNlp309fK7Rs2r0hBbIEEfyz56BrOE3b5FmY74jRIuCXnU03nchGUQ15C0hew3HYm4+3IXG5tV+zSjQhnh8F2PZ6UxdT3Fd9Y417ZjNvnyIEP0CqBR46jB6/ueE9zS+U2Gs0K5aeySC0KKUPpUpyt06e1NZ77ZAwvhgDsVBZb3AMBYrCkXDvjbXIGVT88A96o0f5DRM2CqIfWdG0VEuL9jUOgFnQ6yFSUzSSFz8Z96fO+e9FLkONfgc9sLF0SFQQSoGMbrcGQnk0tfb1OcLlqYUA==
Received: from DM6PR03CA0049.namprd03.prod.outlook.com (2603:10b6:5:100::26)
 by IA1PR12MB7568.namprd12.prod.outlook.com (2603:10b6:208:42c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.29; Fri, 26 Jul
 2024 04:39:48 +0000
Received: from DS2PEPF0000343B.namprd02.prod.outlook.com
 (2603:10b6:5:100:cafe::e3) by DM6PR03CA0049.outlook.office365.com
 (2603:10b6:5:100::26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:47 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343B.mail.protection.outlook.com (10.167.18.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:47 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:36 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:34 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 37/37] drm/nouveau/kms: remove push pointer from nv50_dmac
Date: Fri, 26 Jul 2024 14:38:28 +1000
Message-ID: <20240726043828.58966-38-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343B:EE_|IA1PR12MB7568:EE_
X-MS-Office365-Filtering-Correlation-Id: 7beb0b0c-c82d-4b87-b2f6-08dcad2cfacc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SmwV7zLdgBcG1m6Eg6RXGQOXktODBccZSTE3MgWsXpwvDz/sF2/+xj3ZzwOh?=
 =?us-ascii?Q?5MxjaXlS9VkvMI8tTNeKfRhYHCOAlRCwPWLGuQn25OJno9aTIP8iM48GmjyV?=
 =?us-ascii?Q?fD457v3NpobPfPmTpqRS3OErB8w+/TbVK0KjSnIg4QQEfIwFlrXTsQgUXELd?=
 =?us-ascii?Q?5IVutm0samZFXM8BNLHZI4V3IgYJBowrxq2J9sfeBEfeTl7/gg8XMfy1b5Sd?=
 =?us-ascii?Q?ZDYF3f3mi7MRblDU3V0Ph8LCGroFVQnV5tgc5laTQZE9crCov+mAmt4aJ72E?=
 =?us-ascii?Q?hzJqQG5GCBxfC3catRP6sWl3PR+3L1GO69c4WOSEs3jEBTvnCbhnbUnTKGQ8?=
 =?us-ascii?Q?2ALdkJbAFwAT/fJrOlzX3316RC6ShSwAU4xW569KtfoKE/lyvHORiiNi24Ct?=
 =?us-ascii?Q?lKKmHznHxwH3jJ+nPmegQrhr+h/Rs/TeCmxpyaJx7DJzVx9pUcf9VZgQSHgy?=
 =?us-ascii?Q?AhLycaR61F0OAHCx8ddBDyYpAXdsbVKu4DZN+YhMV0t/lXUm55Fy2aTmXyjD?=
 =?us-ascii?Q?kukyZgJw13zqUmCbbXVxs9k7OTpIHSW0HWphbtM4oUicyVJ0+kGm71wt+dzl?=
 =?us-ascii?Q?WwvSveD9nJ9hGqVRpacsnrgQ5vEQkt9W0sLhQQkROYUzVDI8XzG78h94Fd4M?=
 =?us-ascii?Q?Hr0gOZJ3IEQe4Z3luANVHp1Rleph2WBwYjidq0P1T83axMS7OsD548YJ8u+X?=
 =?us-ascii?Q?XyFkXW7bZ8DIAJiVScXISYVLs4ETVkp85aqnQiJblwZJ67J3UmkBx8QkxmcH?=
 =?us-ascii?Q?ofXn7Ap5YDlP81lc5bymc2xwMxAr5SxZhsintT2JVEgdbNMgOuVEIgzCzAqS?=
 =?us-ascii?Q?qeeypxwp6ZWrzPlyYElL/3yRkjxfVILqljxn+B412Es/eAnp1TU48FP0SY2n?=
 =?us-ascii?Q?6W7G9hCW+BNpOigIavCjXwilzhaqzLWAlK+oJbWY9zeZYwVYhelDynUXybKB?=
 =?us-ascii?Q?xJ/MwliEo+T4rHLFndCw2E3QnkAH2zJdUVD7tVXpy1rQCs6vRoUjk01x1keB?=
 =?us-ascii?Q?kOalYrslJJsI7vzIf11MP+KmLc9KXga7fkMwD/KkEjMGEU9T0E5C2zD6h64h?=
 =?us-ascii?Q?cby+W0zBW5YFlmhKJa0wSmmYYCKJKMgd1ly1kzncmKZV0GLspEUI1QZ4QSHh?=
 =?us-ascii?Q?8F3BinysIVIUogAncvI6fLaig/E7eeFk64TQYcJPRN5rpPu36kAJkVQ5sr7P?=
 =?us-ascii?Q?MnT0gbkT9bNRYAzEh0pp8M1oLe+640OoMqHd0NLM5Xq6D9u3Qbv5OIcY7nFX?=
 =?us-ascii?Q?6d/vCeQxZl+wIOHC4RURWxVbGrr1qNYvrtt/yFpHwYAFIxnFC2orLAeWeTbc?=
 =?us-ascii?Q?FHk9n1W80K2Lyp0cpN0N1/fnGx4soIwLrcBFTWJrYDXkr5C8wgguVSeNgnz+?=
 =?us-ascii?Q?xzN3nrQYhTZSh8rR61jdwCHfk241Vgn4MsqsYJI9f/vXiqopVxMJ2jsXSfmj?=
 =?us-ascii?Q?Oz86vtIuTXOmjCMqSZXthfa4hlRNKF/7?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:47.5934 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7beb0b0c-c82d-4b87-b2f6-08dcad2cfacc
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB7568
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

The struct itself lives in nv50_dmac already, just use that.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/base507c.c | 18 +++++------
 drivers/gpu/drm/nouveau/dispnv50/base827c.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/base907c.c | 10 +++---
 drivers/gpu/drm/nouveau/dispnv50/core507d.c |  6 ++--
 drivers/gpu/drm/nouveau/dispnv50/corec37d.c |  6 ++--
 drivers/gpu/drm/nouveau/dispnv50/corec57d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/crc907d.c  |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/crcc37d.c  |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/crcc57d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac507d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/dac907d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 35 ++++++++++-----------
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  3 +-
 drivers/gpu/drm/nouveau/dispnv50/head507d.c | 24 +++++++-------
 drivers/gpu/drm/nouveau/dispnv50/head827d.c | 10 +++---
 drivers/gpu/drm/nouveau/dispnv50/head907d.c | 26 +++++++--------
 drivers/gpu/drm/nouveau/dispnv50/head917d.c |  6 ++--
 drivers/gpu/drm/nouveau/dispnv50/headc37d.c | 18 +++++------
 drivers/gpu/drm/nouveau/dispnv50/headc57d.c | 12 +++----
 drivers/gpu/drm/nouveau/dispnv50/ovly507e.c |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/ovly827e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/ovly907e.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/pior507d.c |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor507d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/sor907d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/sorc37d.c  |  2 +-
 drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c |  4 +--
 drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c | 22 ++++++-------
 drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c | 10 +++---
 drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c |  2 +-
 30 files changed, 122 insertions(+), 124 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/base507c.c b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
index e36a473f2075..a431f6c5f6fa 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base507c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base507c.c
@@ -35,7 +35,7 @@
 int
 base507c_update(struct nv50_wndw *wndw, u32 *interlock)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -48,7 +48,7 @@ base507c_update(struct nv50_wndw *wndw, u32 *interlock)
 int
 base507c_image_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 4)))
@@ -65,7 +65,7 @@ base507c_image_clr(struct nv50_wndw *wndw)
 static int
 base507c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 13)))
@@ -118,7 +118,7 @@ base507c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 base507c_xlut_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -132,7 +132,7 @@ base507c_xlut_clr(struct nv50_wndw *wndw)
 int
 base507c_xlut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -158,7 +158,7 @@ base507c_ntfy_wait_begun(struct nouveau_bo *bo, u32 offset,
 int
 base507c_ntfy_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -171,7 +171,7 @@ base507c_ntfy_clr(struct nv50_wndw *wndw)
 int
 base507c_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 3)))
@@ -195,7 +195,7 @@ base507c_ntfy_reset(struct nouveau_bo *bo, u32 offset)
 int
 base507c_sema_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -208,7 +208,7 @@ base507c_sema_clr(struct nv50_wndw *wndw)
 int
 base507c_sema_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 5)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base827c.c b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
index 093d4ba6910e..4545cc5f3a14 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base827c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base827c.c
@@ -28,7 +28,7 @@
 static int
 base827c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 13)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/base907c.c b/drivers/gpu/drm/nouveau/dispnv50/base907c.c
index e6b0417c325b..4a2d5a259e15 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/base907c.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/base907c.c
@@ -28,7 +28,7 @@
 static int
 base907c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 10)))
@@ -65,7 +65,7 @@ base907c_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 static int
 base907c_xlut_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 6)))
@@ -84,7 +84,7 @@ base907c_xlut_clr(struct nv50_wndw *wndw)
 static int
 base907c_xlut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 6)))
@@ -156,7 +156,7 @@ base907c_csc(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw,
 static int
 base907c_csc_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -170,7 +170,7 @@ base907c_csc_clr(struct nv50_wndw *wndw)
 static int
 base907c_csc_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 13)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/core507d.c b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
index 85845e3dc7ba..ce2cb78bbdd3 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/core507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/core507d.c
@@ -33,7 +33,7 @@
 int
 core507d_update(struct nv50_core *core, u32 *interlock, bool ntfy)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, (ntfy ? 2 : 0) + 3)))
@@ -80,7 +80,7 @@ core507d_ntfy_init(struct nouveau_bo *bo, u32 offset)
 int
 core507d_read_caps(struct nv50_disp *disp)
 {
-	struct nvif_push *push = disp->core->chan.push;
+	struct nvif_push *push = &disp->core->chan.push;
 	int ret;
 
 	ret = PUSH_WAIT(push, 6);
@@ -130,7 +130,7 @@ core507d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 int
 core507d_init(struct nv50_core *core)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
index 42f877f2ced2..7f637b8830be 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec37d.c
@@ -33,7 +33,7 @@
 int
 corec37d_wndw_owner(struct nv50_core *core)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	const u32 windows = 8; /*XXX*/
 	int ret, i;
 
@@ -51,7 +51,7 @@ corec37d_wndw_owner(struct nv50_core *core)
 int
 corec37d_update(struct nv50_core *core, u32 *interlock, bool ntfy)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, (ntfy ? 2 * 2 : 0) + 5)))
@@ -127,7 +127,7 @@ int corec37d_caps_init(struct nouveau_drm *drm, struct nv50_disp *disp)
 static int
 corec37d_init(struct nv50_core *core)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	const u32 windows = 8; /*XXX*/
 	int ret, i;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
index 53b1e2a569c1..421d0d57e1d8 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/corec57d.c
@@ -29,7 +29,7 @@
 static int
 corec57d_init(struct nv50_core *core)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	const u32 windows = 8; /*XXX*/
 	int ret, i;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
index f9ad641555b7..a674ba435b05 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crc907d.c
@@ -26,7 +26,7 @@ static int
 crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 		struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVDEF(NV907D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
 		       NVDEF(NV907D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
@@ -74,7 +74,7 @@ crc907d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 static int
 crc907d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
index f10f6c484408..4821ce32f9ed 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc37d.c
@@ -15,7 +15,7 @@ static int
 crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 		struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVVAL(NVC37D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, i * 4) |
 		       NVDEF(NVC37D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
@@ -53,7 +53,7 @@ crcc37d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source
 
 int crcc37d_set_ctx(struct nv50_head *head, struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
index cc0130e3d496..ad591dcb0bc9 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/crcc57d.c
@@ -13,7 +13,7 @@
 static int crcc57d_set_src(struct nv50_head *head, int or, enum nv50_crc_source_type source,
 			   struct nv50_crc_notifier_ctx *ctx)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 crc_args = NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, CONTROLLING_CHANNEL, CORE) |
 		       NVDEF(NVC57D, HEAD_SET_CRC_CONTROL, EXPECT_BUFFER_COLLAPSE, FALSE) |
diff --git a/drivers/gpu/drm/nouveau/dispnv50/dac507d.c b/drivers/gpu/drm/nouveau/dispnv50/dac507d.c
index 09de78d96679..99ae692f219e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/dac507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/dac507d.c
@@ -29,7 +29,7 @@ static int
 dac507d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	     struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	u32 sync = 0;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/dac907d.c b/drivers/gpu/drm/nouveau/dispnv50/dac907d.c
index 95efa625b691..74bc9f81e3f1 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/dac907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/dac907d.c
@@ -29,7 +29,7 @@ static int
 dac907d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	     struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 22ecda545550..d4b62461e379 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -127,20 +127,20 @@ nv50_dmac_destroy(struct nv50_dmac *dmac)
 
 	nv50_chan_destroy(&dmac->base);
 
-	nvif_mem_dtor(&dmac->_push.mem);
+	nvif_mem_dtor(&dmac->push.mem);
 }
 
 static void
 nv50_dmac_kick(struct nvif_push *push)
 {
-	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
+	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
 
-	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
+	dmac->cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
 	if (dmac->put != dmac->cur) {
 		/* Push buffer fetches are not coherent with BAR1, we need to ensure
 		 * writes have been flushed right through to VRAM before writing PUT.
 		 */
-		if (dmac->push->mem.type & NVIF_MEM_VRAM) {
+		if (dmac->push.mem.type & NVIF_MEM_VRAM) {
 			struct nvif_device *device = dmac->base.device;
 			nvif_wr32(&device->object, 0x070000, 0x00000001);
 			nvif_msec(device, 2000,
@@ -175,7 +175,7 @@ nv50_dmac_wind(struct nv50_dmac *dmac)
 	if (get == 0) {
 		/* Corner-case, HW idle, but non-committed work pending. */
 		if (dmac->put == 0)
-			nv50_dmac_kick(dmac->push);
+			nv50_dmac_kick(&dmac->push);
 
 		if (nvif_msec(dmac->base.device, 2000,
 			if (NVIF_TV32(&dmac->base.user, NV507C, GET, PTR, >, 0))
@@ -184,7 +184,7 @@ nv50_dmac_wind(struct nv50_dmac *dmac)
 			return -ETIMEDOUT;
 	}
 
-	PUSH_RSVD(dmac->push, PUSH_JUMP(dmac->push, 0));
+	PUSH_RSVD(&dmac->push, PUSH_JUMP(&dmac->push, 0));
 	dmac->cur = 0;
 	return 0;
 }
@@ -192,19 +192,19 @@ nv50_dmac_wind(struct nv50_dmac *dmac)
 static int
 nv50_dmac_wait(struct nvif_push *push, u32 size)
 {
-	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), _push);
+	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
 	int free;
 
 	if (WARN_ON(size > dmac->max))
 		return -EINVAL;
 
-	dmac->cur = push->cur - (u32 __iomem *)dmac->_push.mem.object.map.ptr;
+	dmac->cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
 	if (dmac->cur + size >= dmac->max) {
 		int ret = nv50_dmac_wind(dmac);
 		if (ret)
 			return ret;
 
-		push->cur = dmac->_push.mem.object.map.ptr;
+		push->cur = dmac->push.mem.object.map.ptr;
 		push->cur = push->cur + dmac->cur;
 		nv50_dmac_kick(push);
 	}
@@ -217,7 +217,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 		return -ETIMEDOUT;
 	}
 
-	push->bgn = dmac->_push.mem.object.map.ptr;
+	push->bgn = dmac->push.mem.object.map.ptr;
 	push->bgn = push->bgn + dmac->cur;
 	push->cur = push->bgn;
 	push->end = push->cur + free;
@@ -252,16 +252,15 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	    (nv50_dmac_vram_pushbuf < 0 && device->info.family == NV_DEVICE_INFO_V0_PASCAL))
 		type |= NVIF_MEM_VRAM;
 
-	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000, &dmac->_push.mem);
+	ret = nvif_mem_ctor_map(&drm->mmu, "kmsChanPush", type, 0x1000, &dmac->push.mem);
 	if (ret)
 		return ret;
 
-	dmac->_push.wait = nv50_dmac_wait;
-	dmac->_push.kick = nv50_dmac_kick;
-	dmac->push = &dmac->_push;
-	dmac->push->bgn = dmac->_push.mem.object.map.ptr;
-	dmac->push->cur = dmac->push->bgn;
-	dmac->push->end = dmac->push->bgn;
+	dmac->push.wait = nv50_dmac_wait;
+	dmac->push.kick = nv50_dmac_kick;
+	dmac->push.bgn = dmac->push.mem.object.map.ptr;
+	dmac->push.cur = dmac->push.bgn;
+	dmac->push.end = dmac->push.bgn;
 	dmac->max = 0x1000/4 - 1;
 
 	/* EVO channels are affected by a HW bug where the last 12 DWORDs
@@ -270,7 +269,7 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (disp->oclass < GV100_DISP)
 		dmac->max -= 12;
 
-	args->pushbuf = nvif_handle(&dmac->_push.mem.object);
+	args->pushbuf = nvif_handle(&dmac->push.mem.object);
 
 	ret = nv50_chan_create(device, disp, oclass, head, data, size,
 			       &dmac->base);
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index b66a30915af2..15f9242b72ac 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -62,8 +62,7 @@ struct nv50_chan {
 struct nv50_dmac {
 	struct nv50_chan base;
 
-	struct nvif_push _push;
-	struct nvif_push *push;
+	struct nvif_push push;
 
 	struct nvif_object sync;
 	struct nvif_object vram;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head507d.c b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
index 0edd4e520c8e..7fa1e0279d7d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head507d.c
@@ -29,7 +29,7 @@
 int
 head507d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head507d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -66,7 +66,7 @@ head507d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -94,7 +94,7 @@ head507d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -122,7 +122,7 @@ head507d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head507d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -139,7 +139,7 @@ head507d_curs_clr(struct nv50_head *head)
 static int
 head507d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -188,7 +188,7 @@ head507d_curs_layout(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 int
 head507d_core_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -202,7 +202,7 @@ head507d_core_clr(struct nv50_head *head)
 static int
 head507d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -278,7 +278,7 @@ head507d_core_calc(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head507d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -293,7 +293,7 @@ head507d_olut_clr(struct nv50_head *head)
 static int
 head507d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -345,7 +345,7 @@ head507d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 int
 head507d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -400,7 +400,7 @@ head507d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head507d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head827d.c b/drivers/gpu/drm/nouveau/dispnv50/head827d.c
index 194d1771c481..1545d576fe9c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head827d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head827d.c
@@ -29,7 +29,7 @@
 static int
 head827d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head827d_curs_clr(struct nv50_head *head)
 static int
 head827d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -73,7 +73,7 @@ head827d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head827d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -110,7 +110,7 @@ head827d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head827d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -127,7 +127,7 @@ head827d_olut_clr(struct nv50_head *head)
 static int
 head827d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head907d.c b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
index 18fe4c1e2d6a..6c9e0438e55c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head907d.c
@@ -36,7 +36,7 @@
 int
 head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -57,7 +57,7 @@ head907d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -77,7 +77,7 @@ head907d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head907d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -95,7 +95,7 @@ head907d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -124,7 +124,7 @@ head907d_ovly(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head907d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -152,7 +152,7 @@ head907d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -171,7 +171,7 @@ head907d_curs_clr(struct nv50_head *head)
 int
 head907d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -195,7 +195,7 @@ head907d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_core_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -209,7 +209,7 @@ head907d_core_clr(struct nv50_head *head)
 int
 head907d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -246,7 +246,7 @@ head907d_core_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -263,7 +263,7 @@ head907d_olut_clr(struct nv50_head *head)
 int
 head907d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -322,7 +322,7 @@ bool head907d_ilut_check(int size)
 int
 head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -378,7 +378,7 @@ head907d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 head907d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/head917d.c b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
index 4ce47b55f72c..2d9aee050510 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/head917d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/head917d.c
@@ -30,7 +30,7 @@
 static int
 head917d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -48,7 +48,7 @@ head917d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u32 bounds = 0;
 	int ret;
@@ -77,7 +77,7 @@ head917d_base(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 head917d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
index a4a3b78ea42c..2bcb3790fc10 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc37d.c
@@ -30,7 +30,7 @@
 static int
 headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u8 depth;
 	int ret;
@@ -64,7 +64,7 @@ headc37d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc37d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -85,7 +85,7 @@ headc37d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -104,7 +104,7 @@ headc37d_dither(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_curs_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -122,7 +122,7 @@ headc37d_curs_clr(struct nv50_head *head)
 int
 headc37d_curs_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -161,7 +161,7 @@ headc37d_curs_format(struct nv50_head *head, struct nv50_wndw_atom *asyw,
 static int
 headc37d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -175,7 +175,7 @@ headc37d_olut_clr(struct nv50_head *head)
 static int
 headc37d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -209,7 +209,7 @@ headc37d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 static int
 headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
@@ -254,7 +254,7 @@ headc37d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 int
 headc37d_view(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
index 53b1248c40ec..fde4087e7691 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/headc57d.c
@@ -30,7 +30,7 @@
 static int
 headc57d_display_id(struct nv50_head *head, u32 display_id)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -43,7 +43,7 @@ headc57d_display_id(struct nv50_head *head, u32 display_id)
 static int
 headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	u8 depth;
 	int ret;
@@ -78,7 +78,7 @@ headc57d_or(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -96,7 +96,7 @@ headc57d_procamp(struct nv50_head *head, struct nv50_head_atom *asyh)
 static int
 headc57d_olut_clr(struct nv50_head *head)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -110,7 +110,7 @@ headc57d_olut_clr(struct nv50_head *head)
 static int
 headc57d_olut_set(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	const int i = head->base.index;
 	int ret;
 
@@ -201,7 +201,7 @@ headc57d_olut(struct nv50_head *head, struct nv50_head_atom *asyh, int size)
 static int
 headc57d_mode(struct nv50_head *head, struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = nv50_disp(head->base.base.dev)->core->chan.push;
+	struct nvif_push *push = &nv50_disp(head->base.base.dev)->core->chan.push;
 	struct nv50_head_mode *m = &asyh->mode;
 	const int i = head->base.index;
 	int ret;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
index 73fcfb27c32c..654e506f8431 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly507e.c
@@ -33,7 +33,7 @@
 int
 ovly507e_scale_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 4)))
@@ -55,7 +55,7 @@ ovly507e_scale_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 static int
 ovly507e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 12)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly827e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly827e.c
index 02dc02d9260f..a5ae22ed663d 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly827e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly827e.c
@@ -32,7 +32,7 @@
 static int
 ovly827e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 12)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/ovly907e.c b/drivers/gpu/drm/nouveau/dispnv50/ovly907e.c
index 645130d18a99..8cf0e18fa596 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/ovly907e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/ovly907e.c
@@ -29,7 +29,7 @@
 static int
 ovly907e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 12)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/pior507d.c b/drivers/gpu/drm/nouveau/dispnv50/pior507d.c
index 17d230256bdd..79507d169778 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/pior507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/pior507d.c
@@ -30,7 +30,7 @@ static int
 pior507d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	      struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if (asyh) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/sor507d.c b/drivers/gpu/drm/nouveau/dispnv50/sor507d.c
index ca73d7710885..08cc9845322e 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/sor507d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/sor507d.c
@@ -30,7 +30,7 @@ static int
 sor507d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	     struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if (asyh) {
diff --git a/drivers/gpu/drm/nouveau/dispnv50/sor907d.c b/drivers/gpu/drm/nouveau/dispnv50/sor907d.c
index c86cd8fa61d6..23957cc8f326 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/sor907d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/sor907d.c
@@ -32,7 +32,7 @@ static int
 sor907d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	     struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c b/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c
index 9eaef34816da..da05d4614e00 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/sorc37d.c
@@ -29,7 +29,7 @@ static int
 sorc37d_ctrl(struct nv50_core *core, int or, u32 ctrl,
 	     struct nv50_head_atom *asyh)
 {
-	struct nvif_push *push = core->chan.push;
+	struct nvif_push *push = &core->chan.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
index 8cb5b79bacbf..7985da61aaac 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wimmc37b.c
@@ -31,7 +31,7 @@
 static int
 wimmc37b_update(struct nv50_wndw *wndw, u32 *interlock)
 {
-	struct nvif_push *push = wndw->wimm.push;
+	struct nvif_push *push = &wndw->wimm.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -46,7 +46,7 @@ wimmc37b_update(struct nv50_wndw *wndw, u32 *interlock)
 static int
 wimmc37b_point(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wimm.push;
+	struct nvif_push *push = &wndw->wimm.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
index caf40977f455..50a7b97d37a2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc37e.c
@@ -39,7 +39,7 @@ wndwc37e_csc_clr(struct nv50_wndw *wndw)
 static int
 wndwc37e_csc_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 13)))
@@ -52,7 +52,7 @@ wndwc37e_csc_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 static int
 wndwc37e_ilut_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -65,7 +65,7 @@ wndwc37e_ilut_clr(struct nv50_wndw *wndw)
 static int
 wndwc37e_ilut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 4)))
@@ -94,7 +94,7 @@ wndwc37e_ilut(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw, int size)
 int
 wndwc37e_blend_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 8)))
@@ -139,7 +139,7 @@ wndwc37e_blend_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 wndwc37e_image_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 4)))
@@ -156,7 +156,7 @@ wndwc37e_image_clr(struct nv50_wndw *wndw)
 static int
 wndwc37e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 17)))
@@ -209,7 +209,7 @@ wndwc37e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 wndwc37e_ntfy_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -222,7 +222,7 @@ wndwc37e_ntfy_clr(struct nv50_wndw *wndw)
 int
 wndwc37e_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 3)))
@@ -239,7 +239,7 @@ wndwc37e_ntfy_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 wndwc37e_sema_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -252,7 +252,7 @@ wndwc37e_sema_clr(struct nv50_wndw *wndw)
 int
 wndwc37e_sema_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 5)))
@@ -268,7 +268,7 @@ wndwc37e_sema_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 wndwc37e_update(struct nv50_wndw *wndw, u32 *interlock)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 5)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
index 1d214a4b960a..d1ca51aae58c 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc57e.c
@@ -32,7 +32,7 @@
 static int
 wndwc57e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 17)))
@@ -81,7 +81,7 @@ wndwc57e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 wndwc57e_csc_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	const u32 identity[12] = {
 		0x00010000, 0x00000000, 0x00000000, 0x00000000,
 		0x00000000, 0x00010000, 0x00000000, 0x00000000,
@@ -99,7 +99,7 @@ wndwc57e_csc_clr(struct nv50_wndw *wndw)
 int
 wndwc57e_csc_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 13)))
@@ -112,7 +112,7 @@ wndwc57e_csc_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 int
 wndwc57e_ilut_clr(struct nv50_wndw *wndw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 2)))
@@ -125,7 +125,7 @@ wndwc57e_ilut_clr(struct nv50_wndw *wndw)
 int
 wndwc57e_ilut_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 4)))
diff --git a/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c b/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
index 7a370fa1df20..52af293c98f4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/wndwc67e.c
@@ -29,7 +29,7 @@
 static int
 wndwc67e_image_set(struct nv50_wndw *wndw, struct nv50_wndw_atom *asyw)
 {
-	struct nvif_push *push = wndw->wndw.push;
+	struct nvif_push *push = &wndw->wndw.push;
 	int ret;
 
 	if ((ret = PUSH_WAIT(push, 17)))
-- 
2.45.1

