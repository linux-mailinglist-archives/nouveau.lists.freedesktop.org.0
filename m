Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 71F30B0684E
	for <lists+nouveau@lfdr.de>; Tue, 15 Jul 2025 23:06:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C3D6610E056;
	Tue, 15 Jul 2025 21:06:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QudA1YDu";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2063.outbound.protection.outlook.com [40.107.212.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23CB410E056
 for <nouveau@lists.freedesktop.org>; Tue, 15 Jul 2025 21:06:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wKCUtQt1vZ472LVaoGLcdSx1fXgXOA08K7a20DWoiR9hVVv0kO7TKr8k6B9f1UgbTgmK6VxSEcGBvvptBj1WaGoAZORIbYRRmcAc2Tt+CmVsVxblB16cpXm2ARXx+alJrngxLL5f9iVIQeKmgLk3Qis27iMIT4gjU3pLUheAFoXm83yUDtsq+xb9R/8mKL0Q/4fzy+zVOAYww/mMH5vvWy22xe+2tQOSDqUwBoekQyiGBdF5j7kZXNYAG/nZ17kS6uJgL7dxk2GhCGJSjK1zVkFJL//zYOCl4/A+J6LRUaYnKp6nC7J2plzOGzMV3Ubvwu/mM2KPkV85BAovVFKmNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=brKWNsiiHPD2gHs8tMywVrd4RkY+UHfBQ5FZ9biLrWs=;
 b=SdVvysV5KRFyvfkpfJZwcG2jRd1Z09Fbvo9Rb1AiztGmKBqqWFmxIuTok/qIQj+imJ4H+0XrBsPTBa92Ii7qpXmXJWfxUTZBuW+xN/E82JsskFdvwLulT2Rc4cRKp3COX4HSJYi8qBacE767oVplBSTsVrfVjEBU1jVGGZdXVX+iN2AhW/3IPI22UV/g+EdtJNiaaSfacL7a7TDVrYkQGja87TCd1zZeVY6KgUvPqphp1G2EyRxUuX52wHx2y5lLXIZRUMCSJAqRcBtUSGr0AJeI9IrJkhVCyjJyMlXBCpiwU7NUErN+kGgWwyhy9ZJ/S36+oW532Kw7LBy6oKaXBA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=brKWNsiiHPD2gHs8tMywVrd4RkY+UHfBQ5FZ9biLrWs=;
 b=QudA1YDulABIm1ocLqJPozNS6crfYVyBu/on5puGggX0dYTCL3sb9M7LoRFoaUBmf58HnORQUCurXp2g9AvY75Xdu7O1PDvcBMUuHWxJ4KquKek2mY/x58NmklUux6nO6kds0xNIIEVt9p04/Rqhj5RDWvUrdj6R43/aOIRkhL3H0WnUI8X6yqNv8dysGkG80IDhxr21Bhks2MO9Q5HPTn3rHwz4QJFNvL5XY3P2nTNBv+vW1XdGk46s4bAdmN4RAiwNpk7CpYVD6SjjyBu6vXiIQu6dGQfk/v1k5Hhe9rBRjpJ38wJmXCS35Xk6C8cQBZtmUnf9eOrrEn+HXKdkCg==
Received: from BN9PR03CA0156.namprd03.prod.outlook.com (2603:10b6:408:f4::11)
 by MN0PR12MB6224.namprd12.prod.outlook.com (2603:10b6:208:3c0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8901.25; Tue, 15 Jul
 2025 21:06:32 +0000
Received: from BN3PEPF0000B06C.namprd21.prod.outlook.com
 (2603:10b6:408:f4:cafe::8e) by BN9PR03CA0156.outlook.office365.com
 (2603:10b6:408:f4::11) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8943.17 via Frontend Transport; Tue,
 15 Jul 2025 21:06:32 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 BN3PEPF0000B06C.mail.protection.outlook.com (10.167.243.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8964.1 via Frontend Transport; Tue, 15 Jul 2025 21:06:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 15 Jul
 2025 14:06:14 -0700
Received: from ttabi.nvidia.com (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.14; Tue, 15 Jul
 2025 14:06:13 -0700
From: Timur Tabi <ttabi@nvidia.com>
To: Ben Skeggs <bskeggs@nvidia.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH] drm/nouveau: remove unused memory target test
Date: Tue, 15 Jul 2025 16:05:59 -0500
Message-ID: <20250715210559.1188776-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250715210559.1188776-1-ttabi@nvidia.com>
References: <20250715210559.1188776-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B06C:EE_|MN0PR12MB6224:EE_
X-MS-Office365-Filtering-Correlation-Id: 55e92615-d7fc-41c6-c867-08ddc3e37957
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?wqsupBw6sTJq64NZGPCx8rZrgapsdc54QHBPUDk/4lUUNGWu6KiXVFXAYy3t?=
 =?us-ascii?Q?MmVarFxwKjPdedKijCi/FUKbnDyE8rprz6k8mMmPdtx9agIIoumdYh2BjFUY?=
 =?us-ascii?Q?++UTCQKuJNp5w3WbLR7reWbVM6hCghBXbvJHPvLjSGCz+yoO6TTZVriIW20N?=
 =?us-ascii?Q?9jgB5g8LvYIJaaWFUiyO9go0lTWe16nRTQBjahmJgRmN+jM6Hq27wiNHtath?=
 =?us-ascii?Q?FrFL7zMpQTkrEo7J23s0bs20NrHc2H+K707hYVNY6rHMD9Ov58WFR0Gq9N/y?=
 =?us-ascii?Q?f6mKQgnOdNkfG8t7aaadAN4pJ9+CZElLeEti18CZvYa9iNd8NRSngpBzVe9u?=
 =?us-ascii?Q?N8h+YmPE/PAqTfQzxOKh4CWOssvWQwJ1z6/Q0h9lJ8J+elhNu4P2i3g2yRo8?=
 =?us-ascii?Q?63VLOb4mrUpTfKe3BEvlDR9/r+4b3gOLZDsPu25cO5qrnimR93ukRx4k0/ue?=
 =?us-ascii?Q?epgsNyae2yu6+ZxxCpAyByP+95KosxX+QFstfBW++MLOhkTE+JSVQ8ihBb3U?=
 =?us-ascii?Q?3M+s88RLCCXw6PLrFdCEeYm58GfdtRMnkLMIYOH3EPJmHZrxnMlrobeQYA5G?=
 =?us-ascii?Q?gv/SrrMQV5l7vnRHQzpe3Pme153j5BPDvK9vAAm2pq+2ZukR1rKv3salv7f0?=
 =?us-ascii?Q?dq9IUA7M5qsfqbEbUBsUR95tm69QdYVh4ZczMmeDeO1xuwqkthUbR75Hgqu3?=
 =?us-ascii?Q?SAz4YLW+Krm2EerAqLNQDjNv26tWrexPb11QJxEETtSKZhM0MCIlO6oOYAGO?=
 =?us-ascii?Q?JbFTuo5cfGWqhvvFntk0bYRuA1Kwcb7ovOUc427HlF1At0C4YCUKe8XK+Lh+?=
 =?us-ascii?Q?F9vVI89dPW3W3TQi3GBCgYDEiiJPeBqs6G/aSdeamQoAmIa35j+5WcL76Ys2?=
 =?us-ascii?Q?fkCRiqhl3xd7LqqrfGz2OGkfqpHTe2sdpDEERvUfVxPpTDrGrgXJGuXW7sIG?=
 =?us-ascii?Q?uJW3mPys48FPLd595vUpA1ppqRrLPzFvwrtuQe5C23PeTnQLOjbCTuNiO0qn?=
 =?us-ascii?Q?SOvOcTacBVG9+dncn7ADUdjchmyfp3TjLlRL5UyJSK5J0ybeKKX90J28yEru?=
 =?us-ascii?Q?ynUfHxrsclcbichV69BPKf1iCF8jQMGFH9/MMo/fv2DpiQgZPGX2TJ3hULu9?=
 =?us-ascii?Q?41j17htI2R2w2ID1GrnqCSNRCwZV++RJgu+UI5joREbLaRwYeVRejEgZjkCI?=
 =?us-ascii?Q?fVNuqEMDeW472be04j3WRoMJk7Vh/I+VMnKmNZNCAf9gq0Jvh2cYz5QgGvtz?=
 =?us-ascii?Q?UYY/yXkZaZN8mwqKyAMby0zJL70jGJAH4Cpxn205fuCFvHnBcVC7Pfto9EwS?=
 =?us-ascii?Q?uarnn5L/JTSk2QYVttJDkx74Y9/wYZoJqzEW1wZBbAV+DYdL8am610R43sUk?=
 =?us-ascii?Q?lgX2dCW1kJW+saNoVlLu8ao/lJm28qO/76EThFpRx7mbdQU7rPmP3/I6tLj+?=
 =?us-ascii?Q?/pYqZLcZIH7/jPHRk9JPgWsmm/+3KE1jdNJesWRgwY6xuF6/coxdgq+IuexK?=
 =?us-ascii?Q?AY5nZzlLc9eE/R4=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jul 2025 21:06:31.5323 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 55e92615-d7fc-41c6-c867-08ddc3e37957
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B06C.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6224
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

The memory target check is a hold-over from a refactor.  It's harmless
but distracting, so just remove it.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c | 13 +++----------
 1 file changed, 3 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
index b7da3ab44c27..f0acfaa153d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
+++ b/drivers/gpu/drm/nouveau/nvkm/falcon/gm200.c
@@ -249,9 +249,11 @@ int
 gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
 {
 	struct nvkm_falcon *falcon = fw->falcon;
-	int target, ret;
+	int ret;
 
 	if (fw->inst) {
+		int target;
+
 		nvkm_falcon_mask(falcon, 0x048, 0x00000001, 0x00000001);
 
 		switch (nvkm_memory_target(fw->inst)) {
@@ -285,15 +287,6 @@ gm200_flcn_fw_load(struct nvkm_falcon_fw *fw)
 	}
 
 	if (fw->boot) {
-		switch (nvkm_memory_target(&fw->fw.mem.memory)) {
-		case NVKM_MEM_TARGET_VRAM: target = 4; break;
-		case NVKM_MEM_TARGET_HOST: target = 5; break;
-		case NVKM_MEM_TARGET_NCOH: target = 6; break;
-		default:
-			WARN_ON(1);
-			return -EINVAL;
-		}
-
 		ret = nvkm_falcon_pio_wr(falcon, fw->boot, 0, 0,
 					 IMEM, falcon->code.limit - fw->boot_size, fw->boot_size,
 					 fw->boot_addr >> 8, false);

base-commit: 155a3c003e555a7300d156a5252c004c392ec6b0
-- 
2.43.0

