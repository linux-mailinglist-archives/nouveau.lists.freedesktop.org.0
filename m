Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7306C92AD69
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2742910E475;
	Tue,  9 Jul 2024 00:55:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="j4JgcoHg";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2068.outbound.protection.outlook.com [40.107.236.68])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D675410E472
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=V2mwUTIZ7GlNBA5H4IsonFvTIfjdLOOdCEIeoPZxmqxkt0SA51gDZ8R2VAzAe3QIBcb8dQ7yN+dWQw26J/oTZhf8Rj+AlqGYnazSUeront408po/cPVNt8ajH6mjP7L0N90SVPVylPHCC3F1PQBbYfCXEAqFAfSzeM//z0lERd28tTelGhdzkUxHFTD5qNr93u8pVVYwVyiiogAyQ6oZ+7m5bKhsNIJdxcMTZAeoQYjjkw79kWLSo/7L6dCh8lbgL2Zy1mpzs0nmZaDygc1wC5zZk9wIWZK1Sw9mI50EET3GrptuUJ4fx78yqf8AQNjCLKfpvfoOUlKAVqY03KOFMw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7RUdgr8e1Aisgrkdu7ClO+SWOKOUI1eTHEjdTX3DqKU=;
 b=LzZXWW9uakDAzPMwG4eaUQBS1TPrhGkZaPGWZSeJjMA/DreJbxRQWiTWrzl3mUvlddzQxrqIJ7nwVXIQhSu8lJPle8zYZL2fyD4ZdMeJyC4r5YMa9nSjj0vIL2J/MYOLB9KDRrkWVd2/cx9oA6PdInwWwl+8ilxzIDxzPM/7niR0r7wcWRJelfg0tvkf1fqyk4uPXTeJ1C9zNJ7kJSe+gubS2ohPtYf0pTVvONJl6Hd+4bANXQR+tigVmwDd80BG1EZ0T0xOlEc5LxRZGPOUgviVfae0S0W+V9/Sw0eAfA63z9QUU07Fe9jC6dt4y3wWs3EXZyRL2HslpLqZ8Bvf7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7RUdgr8e1Aisgrkdu7ClO+SWOKOUI1eTHEjdTX3DqKU=;
 b=j4JgcoHgQhGGkoBgqjbyBIhbsu7Qj5penBC1yd+Pql7wht3AGNby9eOR4x6xqUT7THzTTLlSvRisvkbbRR99otmZw9Y72QX/AafqR3A79moLlC88txJ2CL5fl77witqvhj2ohmo1WBWpsjpxYeWknl1MnpZIxd201eH0MlGhnqqb6GMgFYeIx0nAKFdQotptUYoaBTS0Deg5a1pxLDDXvEUjghM81hvaf3R52F6iTWve/hGlAVW148OAqVW9y+NPaQYNRUd7fh0aBudqY1/ABOGL8got5pHNcvwoJUepGQT3sohMLiAhsJtQ3J7JQeV/NNEd94JVUCCJdN3hjkTZbQ==
Received: from CH2PR14CA0026.namprd14.prod.outlook.com (2603:10b6:610:60::36)
 by SA3PR12MB9178.namprd12.prod.outlook.com (2603:10b6:806:396::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Tue, 9 Jul
 2024 00:55:46 +0000
Received: from CH1PEPF0000AD82.namprd04.prod.outlook.com
 (2603:10b6:610:60:cafe::b1) by CH2PR14CA0026.outlook.office365.com
 (2603:10b6:610:60::36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:46 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD82.mail.protection.outlook.com (10.167.244.91) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:36 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 36/37] drm/nouveau/kms: remove a few unused struct members
 and fn decls
Date: Fri, 5 Jul 2024 04:37:20 +1000
Message-ID: <20240704183721.25778-37-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD82:EE_|SA3PR12MB9178:EE_
X-MS-Office365-Filtering-Correlation-Id: e4994046-0cde-4ff3-af06-08dc9fb1de39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?sHr8ogdDfTCk6LNbw7XVR2n8GvlkhizYzKvi0mAk6ke9raYa28DkkH4QjX3a?=
 =?us-ascii?Q?eWcEIba8ddzrSJC/mHxiFJSYAAeO7QGV2R3r4I+m3hHVTGnO1ARC1L7dpWrC?=
 =?us-ascii?Q?AsBWJQgZ8/wJYYLeapbJoyrsiN5+D1sFMcUOV5KFMFUHToHJXZNQ3GuFeAjQ?=
 =?us-ascii?Q?f6Ub0RDRBcFsBqAbnWynQtM71x/LkVN5LM7Are4nURwKB0jDy71KYmiIDcsi?=
 =?us-ascii?Q?COD+QdMujZh4hFfxmfPyyeDrkaTLRFjU6BRvdICK3ukqN0QUibIOGG8RVXYt?=
 =?us-ascii?Q?0WGbzAJLGsvuHZdiEuEE3GgeubRIOm6U487aDLxv2igfj91QGfizNT6rk7im?=
 =?us-ascii?Q?D/e8b3EYPbUqgMZ9dd3h9Bqn8ppo5Ha9pvLUY4d/gjB0PovS3U7/P0nIf5+a?=
 =?us-ascii?Q?JUj7H/140of2ObykYm2Y2LfJum7OzSqSMAIBXU8o4Ep0Dw2dbOLDZyTz3fnn?=
 =?us-ascii?Q?8fk1SnRJwswTtqRdouaZi4sizkagyDPcvCKMUtggazPvnKSHYVBtp2EQF6JP?=
 =?us-ascii?Q?Bnrs+a/tTeMOc6uVBgfKuBn2rWq2Y63xsLAEchzmTR3Oft3713UybEhaSdns?=
 =?us-ascii?Q?bBurWimbaqYFVnIe5lojWZXmAGcKd32FLwzrpzSf/vRC82EQjjfuipSku9BZ?=
 =?us-ascii?Q?0aCgB4KAZYzpdYLuZgbfCpyCaOTh7GQUeMsTFVRYds3hzORR34KSLvFi2H4l?=
 =?us-ascii?Q?tazZAo4Z6Ymm5drLVuxrtScJ4x6P7ttMAdVrPrXKtvFi1sCgrAbwDmgMizQt?=
 =?us-ascii?Q?AdtK6F8p3JkWODkwr5egNIRupwMs7va0TIVImQQJWjAMXfl/kPnblRfddFjD?=
 =?us-ascii?Q?WWaYmxxtKEACdP6C+z9NRwLXJGgJ+sH1lWcPxVuN/xvmCGy8b14+8uffoyJ6?=
 =?us-ascii?Q?BYP3P47nElO/0iIsEcrBLV773yyfIAgzh1yXsklw59yhIIE+6vxg7qPJmWGP?=
 =?us-ascii?Q?zGI2EsEF9W/UZVUoMuAP5ikh5fow9GyM4Gmk52kfFjeYm5fna32vwrtbkvSL?=
 =?us-ascii?Q?9TmQPEl7SG2FreNddmSK7JEwHQcPvtbE4XCCptEzoa9sqQ5P476+eFSmlVtE?=
 =?us-ascii?Q?9Hd08aMTfKXMPKyvKdkGpiVaVYzBKRVrCWs1QOIdw6ZGgJkQ/ym+1XY7aMd1?=
 =?us-ascii?Q?H2OYKPC1JmCbB3uQDRVjzmKd7CPCyX/7H7SKXDPdhSKwEReOQw0A2Z0MrYtR?=
 =?us-ascii?Q?X9CqxIJVNT8xpL2S3qDJRe0fcTnHCdGYBJb2pjKK33ivmPUewC6nRXKa2uCs?=
 =?us-ascii?Q?5f6w61hWvrxegTEtxHgBaiBirYtn2KfDP04Qu805FShRVFGHEFFa451FygUi?=
 =?us-ascii?Q?Z/kBFegmyfzHDHyRD5G0cwLTEm5C5SSMP6Fjht8Miio1/13igpR6NmYGQobO?=
 =?us-ascii?Q?IiXlMtVrbV5BuPj6IaPlfHUe4Ajy/HWwg3Wm4HQEuh8y6Gf3+i1yZxfo74mu?=
 =?us-ascii?Q?3OCIKFA/mJYVuOGZRkZN6nf1sEOaPrOX?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:46.4555 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e4994046-0cde-4ff3-af06-08dc9fb1de39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD82.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9178
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
index deed18876c7d..7cb79da24ca5 100644
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
2.45.1

