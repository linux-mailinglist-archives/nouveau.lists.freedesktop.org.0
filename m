Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DF0078D120B
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:24:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F99010FE31;
	Tue, 28 May 2024 02:24:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LhV5Xb7V";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2071.outbound.protection.outlook.com [40.107.94.71])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BC16F10FE31
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m2TAgC32HcEDiiBgG9qgD4+tc4aGb7j3+UwDGbHtDGffciLs51iYe8SXOlDojpbHbty+D8iI+17HgBBREEYSJ/bVsBfplgeEKgI3W9nFRRyffJP5I4z6EsXRk5y311obpw4UeD4+lzHOAyMgwQEI7YALDqjzGqbeRk6l5pmxEBG7YKp1XcOqmE6qvcr62BTrt6WjtE+JX6rU2Pd/yzi0m83zI3G8SMfSax3+V+G8SgspfHL/9wELZwtH43cjPtIm5nME5NGPLAVNGtqDRUrzxjBg9XeaOueHOqRTxSrgFqE9p8Q+UCVH4x/ucfL4t8UZIUyviQQucQ7SLt6A9NGOnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RTmWw0HCWirrOYYc2eMDxcgIDZ8AV51tCvATnEWGTE4=;
 b=TOuyMlcguiiwyBCNGhleAXJ9hoRSw6Zzf3mz+gqPwV1RjkBu9E73TAsAxln6FGe0Z6Yv+TkJSJN/BZzy/LgBRuavn784YAtmZ5o63eUEPqLk0djPjUrfBDR5ifgidINHYcAMoUmf3a+3NqMNtG7Ir0SVzCZr4zSSEQAvf0ulY0MO9wOSd6upQKNnZ3VkxiVEl0+1qaiAaXChTnx7P0/k4rYj1G2Uudcucd5415AFhS0UlDC5uAxWBheQv4kOatxeeCza6Z1eA1mP4hyM5pSSIYcNfbqCFE1u/4DnnJ82TFRBZQMxzcddDpauNRGqVsNCM0unN5vyPhnvg/D0qsmjAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RTmWw0HCWirrOYYc2eMDxcgIDZ8AV51tCvATnEWGTE4=;
 b=LhV5Xb7VtHfKoY02ew1sTo0sqWUYbm0iUs6o/DOlcGL/k3cvAcUhkgCT6E1plT19qx4F7BoSBvTa6CiiBPI0W8v6TzfzUuDfy1DnmWu6UyYV7hCe04cvpQf2cR5QxBzwwmaIqR+NHUkOcaxyo/L75TLd3iuwEmqlnCBwsXEop9RPGhRPfizCCqbaR+IZxGMtWCd7nKt88r6JSkwBaPD2FVcagPmMOoMWfppTZnNSHaW1bJ1hCQQwPBkiD9gVPvoBph1+vxqmodR5iQA6/Yhk8+4E3vvh1WmkPYE8rAq0yqnQkRv3LjWi0iDRNrBxY2oETPfqut+9pTfwXeaF6g3F8Q==
Received: from BYAPR06CA0066.namprd06.prod.outlook.com (2603:10b6:a03:14b::43)
 by MW3PR12MB4427.namprd12.prod.outlook.com (2603:10b6:303:52::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:54 +0000
Received: from SJ1PEPF00002310.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::83) by BYAPR06CA0066.outlook.office365.com
 (2603:10b6:a03:14b::43) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:54 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002310.mail.protection.outlook.com (10.167.242.164) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:54 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:36 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 33/34] drm/nouveau/kms: remove a few unused struct members and
 fn decls
Date: Tue, 28 May 2024 00:19:58 +1000
Message-ID: <20240527141959.59193-34-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002310:EE_|MW3PR12MB4427:EE_
X-MS-Office365-Filtering-Correlation-Id: b7a97680-fe44-4895-7993-08dc7ebd3885
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TWjNEa31HMI6UmzllSx8JyT/eDQ4ONAERCmootWfZY+fxBMwoNMLSoPMp2/C?=
 =?us-ascii?Q?imLylKc5Gn0fJ1+rPHt0OgMC07zOibo/9WV+1OSYEdIb8GYfUNZXkSFEqfqY?=
 =?us-ascii?Q?GP7sWot8CPUTrcFX4KNuxx80SJtmcpKzvrKlCPU6EuNUxUhnvN7SAgZc4zvY?=
 =?us-ascii?Q?7WRyBC1z0JoGJ8WcUjtUi4doVi8xAPf2AnUvecMnpRbG94VpWQVz2J6moi01?=
 =?us-ascii?Q?XcSA0u9wRkFqjSsL93IGok6AFhnxCWUa2SLDHr/k/gLhRLMUtWcLZZKv9PzP?=
 =?us-ascii?Q?LqOphK5Hfl/kzFhbFl91XWeEyfQOWTMOMNNXM0uOoobSNcvTWIPTl8LupDRV?=
 =?us-ascii?Q?xy70i1Dbm9ObEyu3Sp/5K2K5MuiJfh/HiCyHabSql5uMEs42o8ONcWVNM1rf?=
 =?us-ascii?Q?sazX2tNxP+upYuVGyfgn3wWkOkVDxY2CdeuerUWi1LNzlUR+FR4aVpkkK9RC?=
 =?us-ascii?Q?EziIBn8KqQpyU3/HNLfJs/+cczCdyAkWJdtKawwJNKgJClCsdxb3T5oIZ5yS?=
 =?us-ascii?Q?BsAsg4QzdOcYF2OlR7BGdsGGsb1mdFROQFZGjtCJ5KoJegKf8owEqaTJk8oU?=
 =?us-ascii?Q?573o1d4Mep6hhSOfmHXfTUqD/ddFruxUaHStccFdFz3PuVSYboqUhJdtstJG?=
 =?us-ascii?Q?Db28HPQ95qBpuvaVHvkD2YjzenaEYMBvgRNYamWwVQmmHu36rKraajlvKAHB?=
 =?us-ascii?Q?pMzo0TvLBIsTVlodn6QtKkWpWxnokF55dX2Yeo03mSYCqaUIdqp1pl0etnmG?=
 =?us-ascii?Q?V9YDr3u/vp/3PaCTjkKXvTIaVixzUJ3HAatzo+awbMr9liVyVtWBahQ3VN6L?=
 =?us-ascii?Q?uRFo1MZxgsLn1T/8rvL18MHCASyiOyVhoSALQqE1WGAq3yPCGr8Gc3Grzkjz?=
 =?us-ascii?Q?hOoe+jr/mhoXfTFN1t7hHLoyMADWcNGqvFjY2r/WwUpT5s/mto9CEE+Ud4gJ?=
 =?us-ascii?Q?FpEAkueRwsCP0CwuqOM/kr4IfSGADEiVfKyUdCDm5hCHALw802cpuB7uUXdG?=
 =?us-ascii?Q?AGtXELD1PxZK/+2Lanh8I8BIT7AQkgcXnEnX/5ZBtSiL//X5P53tsjVyxGMZ?=
 =?us-ascii?Q?FYZf3JWszkiqoD7PCXNtMsv05ZD3HWQtcmRrAiATobCpP7r2Yn2u6tYq7r3V?=
 =?us-ascii?Q?/cDu61VsFR0OHMN+OQbqWULMLXr4hLvMRFUU8fQGC3p2CM12UYKVwRBdw2b7?=
 =?us-ascii?Q?KPP0GxTjv9VTJu+pRoRiOWD0+o136mSUyQqFs2j7cnfKodtBYXYykdP8+R/+?=
 =?us-ascii?Q?KRO+cAtOhJ7dfcem7XOooBcOp5o4zxsEl4gkHNoK8RlA4+ex+NDnRCV5lHE1?=
 =?us-ascii?Q?FedDl9A1cjP2jypPAkf3lNz2Qr/FV0JSYkTKPiXPG5oE4frKuWI59HWs8eZd?=
 =?us-ascii?Q?I7CDmXu0UbFSvw1PKGNGNnD1lQA+?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:54.0551 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b7a97680-fe44-4895-7993-08dc7ebd3885
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002310.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4427
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

Left-overs from the past that are completely unused now.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/dispnv50/disp.c | 3 ---
 drivers/gpu/drm/nouveau/dispnv50/disp.h | 9 ---------
 2 files changed, 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.c b/drivers/gpu/drm/nouveau/dispnv50/disp.c
index 796f9c423259..ec1c083c4256 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.c
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.c
@@ -239,8 +239,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	u8 type = NVIF_MEM_COHERENT;
 	int ret;
 
-	mutex_init(&dmac->lock);
-
 	/* Pascal added support for 47-bit physical addresses, but some
 	 * parts of EVO still only accept 40-bit PAs.
 	 *
@@ -258,7 +256,6 @@ nv50_dmac_create(struct nouveau_drm *drm,
 	if (ret)
 		return ret;
 
-	dmac->ptr = dmac->_push.mem.object.map.ptr;
 	dmac->_push.wait = nv50_dmac_wait;
 	dmac->_push.kick = nv50_dmac_kick;
 	dmac->push = &dmac->_push;
diff --git a/drivers/gpu/drm/nouveau/dispnv50/disp.h b/drivers/gpu/drm/nouveau/dispnv50/disp.h
index da3add95f354..b66a30915af2 100644
--- a/drivers/gpu/drm/nouveau/dispnv50/disp.h
+++ b/drivers/gpu/drm/nouveau/dispnv50/disp.h
@@ -64,16 +64,10 @@ struct nv50_dmac {
 
 	struct nvif_push _push;
 	struct nvif_push *push;
-	u32 *ptr;
 
 	struct nvif_object sync;
 	struct nvif_object vram;
 
-	/* Protects against concurrent pushbuf access to this channel, lock is
-	 * grabbed by evo_wait (if the pushbuf reservation is successful) and
-	 * dropped again by evo_kick. */
-	struct mutex lock;
-
 	u32 cur;
 	u32 put;
 	u32 max;
@@ -108,9 +102,6 @@ void nv50_dmac_destroy(struct nv50_dmac *);
  */
 struct nouveau_encoder *nv50_real_outp(struct drm_encoder *encoder);
 
-u32 *evo_wait(struct nv50_dmac *, int nr);
-void evo_kick(u32 *, struct nv50_dmac *);
-
 extern const u64 disp50xx_modifiers[];
 extern const u64 disp90xx_modifiers[];
 extern const u64 wndwc57e_modifiers[];
-- 
2.44.0

