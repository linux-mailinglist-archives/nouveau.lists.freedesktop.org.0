Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07AB98D120C
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:24:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1174510FE30;
	Tue, 28 May 2024 02:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rWJRhzch";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2052.outbound.protection.outlook.com [40.107.243.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94C3E10FE33
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:24:00 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Kn+DxBCemCNU0wYWaL/QW3eCj60E6Z8Dzp9m6gwj0/uD6NE48trAdf44LGSZfyAKKot6JDggW7wgpSaEYKNG/h/bKu6lEw0AztDD3U5dNtxfATxmZAb+Xh4bPjAxazMbauQk03Y9/Jf8NGCe1oEoqsEDhi8I13zLWrclksKBarVdkIfAyMZMMPiOJwoQ0xPCdd/XNP8Hq2xMRKZH2ugK7YgISh8rJVR2/bGGcaHPbBp3rgk4hegFGKWGOADreP84HwvUvqKfPGaHIkqei3gmWFOeN4vIMxBz9UKbwtLKTF9QNxoKAmGBK7hTi2HbrvQVZ785c0ltbiOtsXvR1x/5VQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BTbILffnvYRYAV/VwyPpzTYAQIIroriWcDPOaG60faE=;
 b=X72SdwzTrtjCVk1+dG1O/WNYtYODgrgLcTwl9DEIJNUqX03EHaUJZuKG54alsyvmpu67Dfq+wVYNyyU/hM83dKBBeKywHMGWBp2GuasY6qAjP23NbjzIZG8wgMENw82Ihp+MnG6qz2fgrNm46zPjYH2Km1TGo8amjJrlBsgd/zv7DG++z9V78HgLcjij/LPx6cDzU2lqF5gPjh324bj5g83evw8fUXh4hjlwKi2DNLAWZfHgpo9UySzUBLCBtQS801MhpeOUsNyyqI0tyXfn/0eQkZ1/EnIi1VQa7QOWXm6O4KufqGEHHZWN9wjVH242Rf/oqqJsP9R7VQq1VpghTw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BTbILffnvYRYAV/VwyPpzTYAQIIroriWcDPOaG60faE=;
 b=rWJRhzchj8OHxNlmZCjxir89hhKov1UXMdUjUmyrlGdU9XORsAtw+OD+6JGy7zRS+ulXvR0hgIxGIiBNjhiI6tVhk3QPqqv5R565J2qwd2T8QR119BcxucpoT75khPTyokkjSJ6iInHW0Tq1goPuhk7XQZoo7dGLiKuRGkP9o8EWnOwVosUZHuIp21Q6P5lZD17K3d0e/Pn9ws3+U9M1bsQOw7hZngqreLjw5snumgYE0N/PoEJdeqNaFLYuGAcRGX8AHhK4XYab261XOsi15rkYFhN8JuiBEJR8VjWGMKIa9aGm1gBVe0X2pVH2UulUFy+8BzO5b+27LzWB3wp9sA==
Received: from PH0PR07CA0117.namprd07.prod.outlook.com (2603:10b6:510:4::32)
 by DM4PR12MB6541.namprd12.prod.outlook.com (2603:10b6:8:88::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29; Tue, 28 May
 2024 02:23:53 +0000
Received: from SN1PEPF00036F3D.namprd05.prod.outlook.com
 (2603:10b6:510:4:cafe::a9) by PH0PR07CA0117.outlook.office365.com
 (2603:10b6:510:4::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.28 via Frontend
 Transport; Tue, 28 May 2024 02:23:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3D.mail.protection.outlook.com (10.167.248.21) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:38 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:36 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 34/34] drm/nouveau/kms: remove push pointer from nv50_dmac
Date: Tue, 28 May 2024 00:19:59 +1000
Message-ID: <20240527141959.59193-35-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3D:EE_|DM4PR12MB6541:EE_
X-MS-Office365-Filtering-Correlation-Id: 703e968e-7e9a-4540-fa59-08dc7ebd37f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|1800799015|376005|36860700004|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5NUlJjMU00eLeqpvmqmx9cRKCJvswUydsyVCxKK+k+5Z2zfhz6o42pjZUszi?=
 =?us-ascii?Q?xkij5jGymPhSf++rBBD2fLHrbHFRyloW3mGT4VE+fZKNcLXq11kDcAQBSn6u?=
 =?us-ascii?Q?8U/9sDZlgRJMu1kVXL/ONHA/P4OcL/qQXkfLTC7fl9gHFTb/BmSh8xfFUKy0?=
 =?us-ascii?Q?vddy+hm811BTsFEvWlQGaUjsMgg5hbdtkTORK+8bX9P0vpJ2YO8HEtvF3S8f?=
 =?us-ascii?Q?21DuARS91v+qaerobx5VcZMu+md6svjjYp038MMFx0ZCUAnrhSqclDmgG9hj?=
 =?us-ascii?Q?E4ARAH8N2YzeKHqlIgWTPAlu8Er7gtQOWTjaVgXWBXqJXU2p2P0HU5OuMilv?=
 =?us-ascii?Q?Ji4pBtDVsS/HDjebXqRCPvsz0lsdiHboq3VhZmgau+0RzPD7QYzBjSRnAKrX?=
 =?us-ascii?Q?bkXfV7EKp8QBSDL2lax91Zk9Dnz0wY4mJCjeoFvvLPc/ZYMzNIqW3ysw/Ghm?=
 =?us-ascii?Q?LzseU+cC66gtcumpiYpmA2T+Rx29zkYe2xbfLquNPRyWB/BXOZOqu32C/xkk?=
 =?us-ascii?Q?3uqWiQYV7B+iTspDkGrDhiFEgoNpAYSiFOc/vOh4Y5kCWNruq+3mtMuODPEh?=
 =?us-ascii?Q?c9aq9HjKenTcwFO0zUPNVtGHSuvDhzRzm+xVCjRc0hTRohGUFiDEP3qSeqhj?=
 =?us-ascii?Q?7kIZw+zGM0I2UcqIAUanBR13WNOHVXvpixLwdMGpKO/Bxja2rQzWMEvZbsjO?=
 =?us-ascii?Q?ym4pKan+TsZDT+SmoH1btvLov7h5afF1LDeBMGe5oTywF1PkZWL0jIGE0Lu7?=
 =?us-ascii?Q?INgUXL6LuNkY42ReT4dML3+m6vQiOGIyg2MDLlT79y4n1xHfE3yXyUbsD8Nx?=
 =?us-ascii?Q?wyraVPftN7o3hg6uY//ojmYdp8gjbz3IPZlKLa/X9B3149EbD+4YFEz67F2z?=
 =?us-ascii?Q?AlJnTmriNZCBnwPhifL4ubB/AG9nuK5gTw/KkoqiiUNwMxtf0kULwwtgWDBx?=
 =?us-ascii?Q?cVBMZWqjsRkwAjTZx7jlUdRkQiKMBcxCDXN+P9i47kE59KYq+Gr1aahSEQxz?=
 =?us-ascii?Q?Sl/f2CoUaQaotDfqIWn+fzRusyAiCZxifczTrMrgbnpFsM3VF3ll14V6eUF/?=
 =?us-ascii?Q?6uutcXF3kYnOqhoh1fBFKqHJzoZ4UPxgetbSmWSYfoZWWQNFENmkCxnnSgk3?=
 =?us-ascii?Q?8b1XZ7EliUiAl2ZvpF51GDKW8PNro/8r1wEO3ZslI3KFCv38z0qmVxwGy0VK?=
 =?us-ascii?Q?1CoTPlmU7IKNw9NYsdN7Lv0665r1FZNb6kg/xVBisFKXoZm9uNkpmuKPhPSD?=
 =?us-ascii?Q?k1TsLT2umLe17RELi9+Cbh6MQBG7d+7zzE8NKNE53Wsqed5AiMyIxL63nfD9?=
 =?us-ascii?Q?SBNVafmz/E56xD1a+ZNrWkgCTWiloBTg9W8q9wsL5Q+IWfVu37bU8IMpzW48?=
 =?us-ascii?Q?Bof86C8e4aivLCM3JjaiZ6XnAK36?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(36860700004)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:53.1409 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 703e968e-7e9a-4540-fa59-08dc7ebd37f9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB6541
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
index ec1c083c4256..73e320ddcdfd 100644
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
2.44.0

