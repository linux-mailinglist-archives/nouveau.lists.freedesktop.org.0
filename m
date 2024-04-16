Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5D8A8A78B8
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 314CB112F30;
	Tue, 16 Apr 2024 23:41:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="iOcRlJgJ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2072.outbound.protection.outlook.com [40.107.96.72])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0F2A0112F2E
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:12 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EswQFOw97uAz5W1jw2ZEhZpqCWD+SuE/haOu/koMC2VYbqNR/UM4fyIqA4V355drBPAgc//0/j1uYkZzieRL7uMUyg2FSbMdMcM/zlZEYr1jo0VhYNMEJsxcuE0Ix066aV9qhISTwjbme8ZhdEXhooxg2Z2n+e0hOn2pjI9XVaVn3Xl3XK03AMU8UfDmcl6aOkNO6t2tqqXtRBwP1hkfcm42b7gte3kp3WOaHsek5nX3aCxzpYSe8P5AJJwPpUqv5+BTWUCk40rB//HGgwS7cGIsboZlKwqRAR3XYDV6ZXdA9W4+VbgqOq8M2unwsiq8bQ+oKdf9G/iogoP9XteeIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sz3MO28cQpv/Jng1aWp3F72QarD8mfSI8NTKbjpNWns=;
 b=kUoYO+0T9HdBPqpOyLEKNVgxe1WCZpTPGA1J7SRoCyDlgpWjgphb8rm8vXDNfwBHWsl5LGnteff9hQf3ECG5JQvKzbb3uN9v8DylamDFAfuZl/MoyC1Ogga5gLdis9JDUQGl1dWJItDFNudwt9hCzYziYNn7F2VQ9MID+2bQ/o639MnU5Imt6DTlVPPqfs31ETPZFVGV6HEAKacUWRGkiOlL4Yd/kzNYby7l484b8h69OLYHrn2iBRxpW2v2ytLGxcxZIqNHGp1l++BRtJ3vrM4tar9wFVIoB3vm3FwF1b3ZqieZoi95WtA4dKq2ALDF2qJ6P3/4Tm78OB20SNHT+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sz3MO28cQpv/Jng1aWp3F72QarD8mfSI8NTKbjpNWns=;
 b=iOcRlJgJO3Om5Ul+OR6DG6jAIntKT1/rgaPNjRa9RoVnZQntvc3ufnw+6yyv3vr03qeeBg23Uktclh8oMKC7O8kP8R1qR8LOQMcFFujwSWSU+PpUO3unGD4uSbGHrZ+OPKB9I0S/4oQGsMPg4QerWqqdrU97gjhCp1IJx+tgwRUYwH61GaIaXeZ1NKZToGd93Wo3MbONJVH/angcrkr6Vjxp2NuJYRHFt6W9hr3/2v/n+NI/07i1Xz8WVyhBtumihuinKw3kK46RMlCKJGnEjHexKGzNAYRVT5/m708yDJi7IiHNXQzHwWcaxRjQ8TOFZeWt6eXwrB39EuE93POTYA==
Received: from CH0PR04CA0011.namprd04.prod.outlook.com (2603:10b6:610:76::16)
 by SA0PR12MB4463.namprd12.prod.outlook.com (2603:10b6:806:92::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:10 +0000
Received: from DS2PEPF0000343D.namprd02.prod.outlook.com
 (2603:10b6:610:76:cafe::21) by CH0PR04CA0011.outlook.office365.com
 (2603:10b6:610:76::16) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:10 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF0000343D.mail.protection.outlook.com (10.167.18.40) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:10 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:40:53 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:40:52 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 020/156] drm/nouveau/kms: move hw ring tracking vars into
 nvif_push
Date: Wed, 17 Apr 2024 09:37:46 +1000
Message-ID: <20240416234002.19509-21-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF0000343D:EE_|SA0PR12MB4463:EE_
X-MS-Office365-Filtering-Correlation-Id: bc21fc38-903e-487d-8070-08dc5e6eb1d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WfOxMRj20UaxBXJVMoWJd7r6S49/Y/oIRzHtJgWSCdpLTcgfc6KcdIHeAOZwid2LnTgi9YFY2BEFoxLHfgChKy7vHZnBL26+Qs13mLbWyYvNFl51BdZY8OCrsF5/4UTvQatGSbR9vmOQe0ctgr1beQ83A9aXvfHMlukU+fd7mfjBLKNDY7N0U7f0z8/p8SxYXoXls3U6+HJ9G3Rr1SfLccNlmmGEZkXidE3x9XvGrdlXU4XB7MjB2gWxANvQAWVEaLlu/BCVrUVCmDKSDZsTayPpPdpEPJRvt6N/O2vZdSv1lXjI08i94m7i2D1UjbomIYs9V3/qFAeD25edQ4hR8SAswVZAh2GrgqIZY6PiRwDyh2rMdY1qC+pAQb2+MwNap7f7x86EAC4g3IZk4zWyH7f7p8phPi3kM+6lOWtCj+Xb6mU1XZWDx1/R79zEGLwWGOdFupFoCOq+dpYUX6Xeowgu3pe+lQAgWkr1DQ/Qsq70A9sfq+KP5zl8Y0InvyEkvhpgIwXCtz/kz4P1xHNK1BbANr9lRncl1okX0/E88nZH54QVStCPmo8d1C5c/f91ImSYoCjHKvpkVczeYoqriwSxNCtJm58K+nnlE4l6IiUxEeF5eF2PtlDlBnY1yNkqhHtSBBHs1VOQeIwHB+il4Fg1bMh4o5aWYIeQIDsI71aTAxa70EBrncDrCUsaJDZu89Si/NMQeCrMyH3Xfi7hoQy4zVBBl4eS+OUScxSbMIPzY11yj4EcoeBQuqpj+jGY
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(1800799015)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:10.1072 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: bc21fc38-903e-487d-8070-08dc5e6eb1d1
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF0000343D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA0PR12MB4463
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

- will help later in the series where display channel apis are modified

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c     | 35 +++++++++++----------
 drivers/gpu/drm/nouveau/dispnv50/disp.h     |  4 ---
 drivers/gpu/drm/nouveau/include/nvif/push.h | 12 +++++--
 3 files changed, 28 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index b64b283f8e9c..125c33ee251a 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -132,8 +132,8 @@ nv50_dmac_kick(struct nvif_push *push)
 {
 	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
 
-	dmac->cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
-	if (dmac->put != dmac->cur) {
+	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
+	if (push->hw.put != push->hw.cur) {
 		/* Push buffer fetches are not coherent with BAR1, we need to ensure
 		 * writes have been flushed right through to VRAM before writing PUT.
 		 */
@@ -146,8 +146,8 @@ nv50_dmac_kick(struct nvif_push *push)
 			);
 		}
 
-		NVIF_WV32(&dmac->base.user, NV507C, PUT, PTR, dmac->cur);
-		dmac->put = dmac->cur;
+		NVIF_WV32(&dmac->base.user, NV507C, PUT, PTR, push->hw.cur);
+		push->hw.put = push->hw.cur;
 	}
 
 	push->bgn = push->cur;
@@ -156,22 +156,25 @@ nv50_dmac_kick(struct nvif_push *push)
 static int
 nv50_dmac_free(struct nv50_dmac *dmac)
 {
+	struct nvif_push *push = &dmac->push;
 	u32 get = NVIF_RV32(&dmac->base.user, NV507C, GET, PTR);
-	if (get > dmac->cur) /* NVIDIA stay 5 away from GET, do the same. */
-		return get - dmac->cur - 5;
-	return dmac->max - dmac->cur;
+	if (get > push->hw.cur) /* NVIDIA stay 5 away from GET, do the same. */
+		return get - push->hw.cur - 5;
+	return push->hw.max - push->hw.cur;
 }
 
 static int
 nv50_dmac_wind(struct nv50_dmac *dmac)
 {
+	struct nvif_push *push = &dmac->push;
+
 	/* Wait for GET to depart from the beginning of the push buffer to
 	 * prevent writing PUT == GET, which would be ignored by HW.
 	 */
 	u32 get = NVIF_RV32(&dmac->base.user, NV507C, GET, PTR);
 	if (get == 0) {
 		/* Corner-case, HW idle, but non-committed work pending. */
-		if (dmac->put == 0)
+		if (push->hw.put == 0)
 			nv50_dmac_kick(&dmac->push);
 
 		if (nvif_msec(dmac->base.device, 2000,
@@ -182,7 +185,7 @@ nv50_dmac_wind(struct nv50_dmac *dmac)
 	}
 
 	PUSH_RSVD(&dmac->push, PUSH_JUMP(&dmac->push, 0));
-	dmac->cur = 0;
+	push->hw.cur = 0;
 	return 0;
 }
 
@@ -192,17 +195,17 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 	struct nv50_dmac *dmac = container_of(push, typeof(*dmac), push);
 	int free;
 
-	if (WARN_ON(size > dmac->max))
+	if (WARN_ON(size > push->hw.max))
 		return -EINVAL;
 
-	dmac->cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
-	if (dmac->cur + size >= dmac->max) {
+	push->hw.cur = push->cur - (u32 __iomem *)dmac->push.mem.object.map.ptr;
+	if (push->hw.cur + size >= push->hw.max) {
 		int ret = nv50_dmac_wind(dmac);
 		if (ret)
 			return ret;
 
 		push->cur = dmac->push.mem.object.map.ptr;
-		push->cur = push->cur + dmac->cur;
+		push->cur = push->cur + push->hw.cur;
 		nv50_dmac_kick(push);
 	}
 
@@ -215,7 +218,7 @@ nv50_dmac_wait(struct nvif_push *push, u32 size)
 	}
 
 	push->bgn = dmac->push.mem.object.map.ptr;
-	push->bgn = push->bgn + dmac->cur;
+	push->bgn = push->bgn + push->hw.cur;
 	push->cur = push->bgn;
 	push->end = push->cur + free;
 	return 0;
@@ -259,13 +262,13 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	dmac->push.bgn = dmac->push.mem.object.map.ptr;
 	dmac->push.cur = dmac->push.bgn;
 	dmac->push.end = dmac->push.bgn;
-	dmac->max = 0x1000/4 - 1;
+	dmac->push.hw.max = 0x1000/4 - 1;
 
 	/* EVO channels are affected by a HW bug where the last 12 DWORDs
 	 * of the push buffer aren't able to be used safely.
 	 */
 	if (disp->oclass < GV100_DISP)
-		dmac->max -= 12;
+		dmac->push.hw.max -= 12;
 
 	args->pushbuf = nvif_handle(&dmac->push.mem.object);
 
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index 15f9242b72ac..a7a01ae77ff4 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -66,10 +66,6 @@ struct nv50_dmac {
 
 	struct nvif_object sync;
 	struct nvif_object vram;
-
-	u32 cur;
-	u32 put;
-	u32 max;
 };
 
 struct nv50_outp_atom {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/push.h b/drivers/gpu/drm/nouveau/include/nvif/push.h
index 6d3a8a3d2087..b88024ef6cc0 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/push.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/push.h
@@ -27,15 +27,21 @@
 #include <nvhw/drf.h>
 
 struct nvif_push {
-	int (*wait)(struct nvif_push *push, u32 size);
-	void (*kick)(struct nvif_push *push);
-
 	struct nvif_mem mem;
 
+	struct {
+		u32 cur;
+		u32 put;
+		u32 max;
+	} hw;
+
 	u32 *bgn;
 	u32 *cur;
 	u32 *seg;
 	u32 *end;
+
+	int (*wait)(struct nvif_push *push, u32 size);
+	void (*kick)(struct nvif_push *push);
 };
 
 static inline __must_check int
-- 
2.41.0

