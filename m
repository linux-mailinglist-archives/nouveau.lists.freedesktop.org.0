Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0E193CD4F
	for <lists+nouveau@lfdr.de>; Fri, 26 Jul 2024 06:39:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F2AF10E913;
	Fri, 26 Jul 2024 04:39:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eIo83YT3";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2054.outbound.protection.outlook.com [40.107.94.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94A6910E2AB
 for <nouveau@lists.freedesktop.org>; Fri, 26 Jul 2024 04:39:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=dmQpUUZyVAglfc0oBgms57aHwYgD2AgYnX9u7aMdTDUExNCJk5nOhqdbPLx766ns5d4egUw8sdwIYkS/8AFSZJoXOc1/ZPtQOiYIVdEWKJyqIt3ZDsDbbXOfx7idSbB1dnbe6hVjgFyZwXaPcEIJFd53aDMITekYs0c9U9Y9T5dsNjLutVGt/VwLKZlmnUgh10D7uB1C53zzj0M2rAzEBR4vFS4jkAz9wyS1yMKXHzC2ue3QkRs9/weQk27MSdyvCr6aTsCj/fvLm2W+9yXBa2MsA2H58uVIyl9dVeW4xKzBC2JAtmZm/NoRXM/VhpiDWwFYBELmUe1PWtBrmJSwSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ppUv6NJaMQjErC4IeiG4kx1aXcwYcHMqfThXX2z5uEM=;
 b=yzB+IkP8eQ4CsN1Axj47NFI6NlOf2k0rCRB9QLjEZ44pgQGqjwSdNPlNoQWt7ovrKL5rDK/o5r4khAwxZaP9AAGQ6059Xbqc5fPLMUHakR6c7SdqvuNTHHtxq/B6hBSwsI0aJVvfr6nPKuAvOe2Bhko9fW8CTphM/0bVNp0PkVVLSpSYtboHQt4HVXEVZi6xNfPSnAW+C5HKqB078DaR+AGTtcjQPvZwhjfqalhiBlgwgqDX5oFMf53ULUPsxmSuNHjJ64rgf5MoDccHX0BGvggCO6LlK6sU0qfXLqg7aQdJmWh+FHFR2moA6tLhoISFFnrIymroDWmsirMGPdKffg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ppUv6NJaMQjErC4IeiG4kx1aXcwYcHMqfThXX2z5uEM=;
 b=eIo83YT3bmxYRoBS+6NJvDxx0hwj5FIRfPuFvxuIU9kTci0iy2QU9d/PksYU65S+fphflLi/IoeqQE297JtqwegaSrC7Lnk6Tc/RbncpA2qcRat2BJCRTODc+lv++PyIRmWtp3AfeLYwmpopc13J6+6SGlqEqHRGAlaQYAyRbQvMzmfgvmZChgzofpQ8TqdEOq5QQz87CoMtAkz2AFQm3NVf8Une+4azOF0R99G3t1ByMJNS089okNVeDkg9KtFJFLzv8a5CVEslzFGf7LTN3YTHMzPKA1bNWExLfmrsq0SV2Cthlz+jwK1jpxurcHp9eEXLbqLhrsizYDiBcykj/Q==
Received: from CH0PR03CA0406.namprd03.prod.outlook.com (2603:10b6:610:11b::14)
 by MN2PR12MB4408.namprd12.prod.outlook.com (2603:10b6:208:26c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.20; Fri, 26 Jul
 2024 04:39:30 +0000
Received: from DS1PEPF00017090.namprd03.prod.outlook.com
 (2603:10b6:610:11b:cafe::d7) by CH0PR03CA0406.outlook.office365.com
 (2603:10b6:610:11b::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7784.28 via Frontend
 Transport; Fri, 26 Jul 2024 04:39:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF00017090.mail.protection.outlook.com (10.167.17.132) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7784.11 via Frontend Transport; Fri, 26 Jul 2024 04:39:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:19 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 25 Jul
 2024 21:39:18 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 25/37] drm/nouveau/nvif: remove device rd/wr
Date: Fri, 26 Jul 2024 14:38:16 +1000
Message-ID: <20240726043828.58966-26-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF00017090:EE_|MN2PR12MB4408:EE_
X-MS-Office365-Filtering-Correlation-Id: a5f95595-57e9-4d71-db5d-08dcad2cf057
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Xr92E50zBNwHOLyl0wZuZ43k+bsQJNe8LXgEcoo93qe6IvOoGS9FUA0qeBET?=
 =?us-ascii?Q?O4EEu3yMxeNgJ3/5VGx3wec1PpC2PlnmnkQhtUJDsQ7HHZ08g0ABY2RJS5cB?=
 =?us-ascii?Q?ZXfvXa/dllCehijsVBwT6vVAVlO0MwSIzeJszu+kxPaztHouGgyPSAxMzgH+?=
 =?us-ascii?Q?Ik1zVUj2da0FSNl0fvY89jyU60mK9L3Wyj26dRYqLPNSFE/SmB/CDNe1nbvH?=
 =?us-ascii?Q?L+GlpxgJpB8q5ssjpd/vAug0QapH8OlspnNH43DI2QRdSwe2nGtJlMPIKusz?=
 =?us-ascii?Q?PAVxfpsDVnOXSUwA1h8wTGQgSa4VcmyZm/G63qTLKyP4PwJyX2VICpEoAICl?=
 =?us-ascii?Q?B+mjuX2IT5MG97bZQTjb6KFh2XUa6OECm0v5LpaoJaBEIOhDwENo60GOfgtI?=
 =?us-ascii?Q?N7HkyeGXwv/2c/QKouVXKnFQb3OEDYPMQEIcdUKvI54xKIII5hDWYpga3gr7?=
 =?us-ascii?Q?A9ZdkbQO3KMLNMDyMU+N9pYydWh6AXDRvyYcGgq3xCJTbavizigM75KtQbJA?=
 =?us-ascii?Q?z25c+X1aTBk3OkImqUY1EZUjxcdab7jVXB99fHIRZaW4EM+yev20yQ4CtU/U?=
 =?us-ascii?Q?P+Ql6R9JZ+dWZZzueykjVHyVdugDF427ykEFJ3yFE9K4GWv6bCBlNOQf9YDY?=
 =?us-ascii?Q?eCh8DTg+vX428rflhjKNOQZGG1Lu6asHsmYgMaM8YdaLvVKH6H6YJCddZhhJ?=
 =?us-ascii?Q?0ASTnp/HFgJ5Y8M9ASEmaz8nLTV4D9Za69n+DHuyAidTUooFZVrjgLNmbKHt?=
 =?us-ascii?Q?54eB9EmwTTsIfr1/o48lmAe11J+gWvrL00x1KopWm2Gs9aaHpuy7YBZvaPPb?=
 =?us-ascii?Q?fZTGc4X3MIP5TvJ3QfdbBhlctlUkdzaisLxy5G+TFCY2RhrAHho6dovmEzpO?=
 =?us-ascii?Q?ZDZukZNmNWXyJV5j964KXJcUbp/PmyGTmQjikTcmS1IXeRlth76061j1Rc03?=
 =?us-ascii?Q?Z9n0Bi3ZehTD7RCjjj1sIiuoCHQPuC7P3NroCApCbyyFhGKNbAkGbxpiOMKV?=
 =?us-ascii?Q?ttd75+lE4w2Fu85lIZDM3Z1rRX2ORSAjVAJ9GvKZEEbteCINBidXtxa4k6tO?=
 =?us-ascii?Q?s7FukWCgx0hwV1I0u5IX5H07vvRZetmHCOLhoBdFwsah9+kNL9uMoqzaHOit?=
 =?us-ascii?Q?Tq52Pi3zcDtB78AF9HFNeVCsXtno89IGvmk/+d39jNW4L7WuejtAzUF0aFb4?=
 =?us-ascii?Q?ikqzTEjMLcqYZpIrdQQp6F7fY3nycuQeCMwUjZue1aZQAypSPoP2UJuEebKR?=
 =?us-ascii?Q?g2J8cALvawpRO7yqjtiIosm0ssM+6gh5Xq+ZnKu+mT5/oW7AzJyJ9gYUGGTH?=
 =?us-ascii?Q?dZGxuI8zwmupLepzHew62kcasYwN97xsJ5lFoXB51UbQpZKQgl3gGm53TLwn?=
 =?us-ascii?Q?mEWLETL5rjJcTaCUHiF4AXetUXBX0akcmFYiDxX7knaPfEzuDfUw5LnTFkC4?=
 =?us-ascii?Q?lMOZ0rexlc8DSKbR9y0IXppLaQTqW0vJ?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jul 2024 04:39:30.0817 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a5f95595-57e9-4d71-db5d-08dcad2cf057
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF00017090.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4408
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

The previous commit ensures the device is always mapped, so these
are unneeded.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/object.h    |  8 ---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 10 ----
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 32 -----------
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 28 ----------
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 54 -------------------
 5 files changed, 132 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index d4f1c964ba31..c91abac44bd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -33,11 +33,7 @@ struct nvkm_object_func {
 	int (*map)(struct nvkm_object *, void *argv, u32 argc,
 		   enum nvkm_object_map *, u64 *addr, u64 *size);
 	int (*unmap)(struct nvkm_object *);
-	int (*rd08)(struct nvkm_object *, u64 addr, u8 *data);
-	int (*rd16)(struct nvkm_object *, u64 addr, u16 *data);
 	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
-	int (*wr08)(struct nvkm_object *, u64 addr, u8 data);
-	int (*wr16)(struct nvkm_object *, u64 addr, u16 data);
 	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
@@ -61,11 +57,7 @@ int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
 int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
 		    enum nvkm_object_map *, u64 *addr, u64 *size);
 int nvkm_object_unmap(struct nvkm_object *);
-int nvkm_object_rd08(struct nvkm_object *, u64 addr, u8  *data);
-int nvkm_object_rd16(struct nvkm_object *, u64 addr, u16 *data);
 int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
-int nvkm_object_wr08(struct nvkm_object *, u64 addr, u8   data);
-int nvkm_object_wr16(struct nvkm_object *, u64 addr, u16  data);
 int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 584fc43c0d75..95e9537e1d7c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -206,14 +206,6 @@ nvkm_ioctl_rd(struct nvkm_client *client,
 		nvif_ioctl(object, "rd vers %d size %d addr %016llx\n",
 			   args->v0.version, args->v0.size, args->v0.addr);
 		switch (args->v0.size) {
-		case 1:
-			ret = nvkm_object_rd08(object, args->v0.addr, &v.b08);
-			args->v0.data = v.b08;
-			break;
-		case 2:
-			ret = nvkm_object_rd16(object, args->v0.addr, &v.b16);
-			args->v0.data = v.b16;
-			break;
 		case 4:
 			ret = nvkm_object_rd32(object, args->v0.addr, &v.b32);
 			args->v0.data = v.b32;
@@ -246,8 +238,6 @@ nvkm_ioctl_wr(struct nvkm_client *client,
 		return ret;
 
 	switch (args->v0.size) {
-	case 1: return nvkm_object_wr08(object, args->v0.addr, args->v0.data);
-	case 2: return nvkm_object_wr16(object, args->v0.addr, args->v0.data);
 	case 4: return nvkm_object_wr32(object, args->v0.addr, args->v0.data);
 	default:
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 580b8c7f25af..913c3bae51f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -132,22 +132,6 @@ nvkm_object_unmap(struct nvkm_object *object)
 	return -ENODEV;
 }
 
-int
-nvkm_object_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	if (likely(object->func->rd08))
-		return object->func->rd08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	if (likely(object->func->rd16))
-		return object->func->rd16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
@@ -156,22 +140,6 @@ nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 	return -ENODEV;
 }
 
-int
-nvkm_object_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	if (likely(object->func->wr08))
-		return object->func->wr08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	if (likely(object->func->wr16))
-		return object->func->wr16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index 3385528da650..afc10ec256a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -55,36 +55,12 @@ nvkm_oproxy_unmap(struct nvkm_object *object)
 	return nvkm_object_unmap(oproxy->object);
 }
 
-static int
-nvkm_oproxy_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	return nvkm_object_rd08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	return nvkm_object_rd16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
 	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr, data);
 }
 
-static int
-nvkm_oproxy_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	return nvkm_object_wr08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	return nvkm_object_wr16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
@@ -197,11 +173,7 @@ nvkm_oproxy_func = {
 	.ntfy = nvkm_oproxy_ntfy,
 	.map = nvkm_oproxy_map,
 	.unmap = nvkm_oproxy_unmap,
-	.rd08 = nvkm_oproxy_rd08,
-	.rd16 = nvkm_oproxy_rd16,
 	.rd32 = nvkm_oproxy_rd32,
-	.wr08 = nvkm_oproxy_wr08,
-	.wr16 = nvkm_oproxy_wr16,
 	.wr32 = nvkm_oproxy_wr32,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 65bd6712bce2..d7f75b3a43c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -202,54 +202,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	return -EINVAL;
 }
 
-static int
-nvkm_udevice_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd08(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd16(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd32(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr08(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr16(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr32(udev->device, addr, data);
-	return 0;
-}
-
 static int
 nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 		 enum nvkm_object_map *type, u64 *addr, u64 *size)
@@ -362,12 +314,6 @@ nvkm_udevice = {
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
 	.map = nvkm_udevice_map,
-	.rd08 = nvkm_udevice_rd08,
-	.rd16 = nvkm_udevice_rd16,
-	.rd32 = nvkm_udevice_rd32,
-	.wr08 = nvkm_udevice_wr08,
-	.wr16 = nvkm_udevice_wr16,
-	.wr32 = nvkm_udevice_wr32,
 	.sclass = nvkm_udevice_child_get,
 };
 
-- 
2.45.1

