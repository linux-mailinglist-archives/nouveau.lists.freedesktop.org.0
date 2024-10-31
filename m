Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FA9F9B76D5
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:43 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4997D10E846;
	Thu, 31 Oct 2024 08:53:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="AtUDSPbp";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2045.outbound.protection.outlook.com [40.107.243.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBE5E10E853
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:40 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pjN3nOFahrwtr5PS2LqljLx66Yi00hOTNTgaD2jSmhe3PlaW8UoC2Q87gTNZpnWI/uUFdx0H0XOsSaoDCDXzz55TVkuHKqf43OKSnXqvcULw/RAiwk7iEtbb2Z2AogDxsHXslBf1yw1uomZ5TCxRpi45jjw+GKn2BVJFGYdQvxM5dbEOwKJf2bxwJV2tHZY7y0EuVNuKsnL6/N5+8l/ZEKgwsac7yY1NyNKF2FeC2qZ7tBUSoZYwPnNchK4wqNh4V8SEYCBhzUcf05IIQI0ZAf25X9dvQgSADSSO9xaYGx4JWHEUbxgO0zm4Fe75MV8vFTOqHvDQDDNCSAim1nE8Zg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2tqbWXxUZYS02od6Ds5KxU0/4sHgCPJCthPDS87NuHg=;
 b=qsgVx+HeTv5ErkVK3u/1df3Zvavdq71d2AE5IOKh1VxUOXIy01FOZHnjNijpeCXVJvKymVh7KbewaQ4bNs+qfKBADhd5gW1ojPyhSuPRgpt63HRtrn/IJMXKqgPxT3pRmdpdMbnYB+Pat6oCQuHUjW0JS4HZBNLuupweNXigr037vynBDSauqlTOE3Pz7KD1SwgOnoWRk7IwTpACnfPaCahFhKmuguhM4WojkfVwXFkHcTYJd87OJ3QV02peH4ZwaHTkAxMCqRAKStXRGXYhZlbBJRImz+IwSv7Vd1FNxoGmqfNeTIrwF8rMRoV3hlBEWC1uyzHp9HT6Y5ZW8m92WQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2tqbWXxUZYS02od6Ds5KxU0/4sHgCPJCthPDS87NuHg=;
 b=AtUDSPbpHr9YjExT2cbZmjzHumsPTWimOO5YGP18/pxBys2orbw0R1RlppSy+G28EMSxK1utlBg0hZG0LEUHI1FEHx+NyJi4X587YJbNJ8YYPaoCjHkaeIX7YC9oGOPZcH47PjLFDttjSBT6DI+CWqOBtutSpOPD6WvMMaAYEDNwtNnXYyRxTKVoLnoHSobKDxHcDFvUV3hV2oAAQsdvFOP3SpUTywCmuFfOAHuoevYwMsE7mDj5tf/g2WBxxKfx01frjR0Ia0x6ECOBXle4ob7QaeyGo7nwn/TWNPC9Fxnv4wwmKCUM+LsyHy/oHYXbUUzWh/qDmH3hUUaKIAJrBg==
Received: from MW4PR04CA0075.namprd04.prod.outlook.com (2603:10b6:303:6b::20)
 by SN7PR12MB7131.namprd12.prod.outlook.com (2603:10b6:806:2a3::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.28; Thu, 31 Oct
 2024 08:53:36 +0000
Received: from CO1PEPF000075F0.namprd03.prod.outlook.com
 (2603:10b6:303:6b:cafe::1c) by MW4PR04CA0075.outlook.office365.com
 (2603:10b6:303:6b::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075F0.mail.protection.outlook.com (10.167.249.39) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:35 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:09 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:09 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:08 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 05/15] nvkm: rename "argv" to what it represents in
 *rm_{alloc, ctrl}_*()
Date: Thu, 31 Oct 2024 01:52:40 -0700
Message-ID: <20241031085250.2941482-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075F0:EE_|SN7PR12MB7131:EE_
X-MS-Office365-Filtering-Correlation-Id: 6b080866-d2da-45b0-ebac-08dcf989815e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?6XL1thdxaRdEXKPjSf5UnuSu8oC34xnIxqkg371IddGhVD9ln0MrMxZimzDN?=
 =?us-ascii?Q?qhrWcEjTvTxh8Yde5I146ii7tfWN0WglmqeAbYVq4gVA0dIVx2QhRU0iLOIY?=
 =?us-ascii?Q?3wJGzSAh4DTJJhUhdRhtKN3IJ8Ou+rk/STTN3i9bRLeztMu3ACZp/ar17Rah?=
 =?us-ascii?Q?gjoIV2Hh+KhRaj666sJRFQsDvRuJNXtav2rO4a2TwzKmHgig45BRAyuxMYMk?=
 =?us-ascii?Q?nRAycV8Q115U1VzZX4Ii5pYKwTaDUdpNDNkXD+NkNFq8sZwMIWJfAxkk+2r4?=
 =?us-ascii?Q?QNkKIZnf/xqVitmF/xTBM+UmIo1nOwwpDg6Puq/LP52EmBjW8pHLxO4qDOzD?=
 =?us-ascii?Q?RAj3c29rc5rWn3lc+nsBQPyONWEZWWKGpP/fSECMfwT2DlqM2VTjWUFRYfaZ?=
 =?us-ascii?Q?bkq3zVH44CLLRUYEyjLegsw06MRJrV8AwQkLICf9Xf89NECRcKNNvWeaZbgT?=
 =?us-ascii?Q?eCTZNINaufFDOwf8FIh2KfW8WyJS+42AU61HGb7yOCctE4BoL7MAEGEdHcaJ?=
 =?us-ascii?Q?GQrc48g7TUiGe9Tri+Qmodpb8Lb0Hk0BEJ8dX31OolgbAF5z2MBgMP2OufxC?=
 =?us-ascii?Q?m+SknCTUYXTZjfBOJhtGc8Vfw+TyTHRdq/AEENVoqI4DviW4WLsNc6aRitz0?=
 =?us-ascii?Q?EyDmsflUYYymDMJdG0KlcSIH8i3VBxrH7tKbq3312FOlqZprfOKYLN0kB8ti?=
 =?us-ascii?Q?XMQPvmqoUu23yzaM5Q0ZGhUtSmCAgRSEWB2KU+3AyBFfI/dL/rA/6GA+DXm3?=
 =?us-ascii?Q?A7/DslMRCnToJ8ygbdiG1QbmnJUY5USpMe95sYeOJfYAKFm+VaxidlTFAnQ0?=
 =?us-ascii?Q?teNzRvhlai/ytQkSLazVyhD8rJPVTSxN9hrL/mKpX2DYIqpWh5CJdrYTmNYy?=
 =?us-ascii?Q?Jh7Y2ZescpnjXZaMN9B5A4sMv2D9FoZCJAnILCgJ9b6qysDYUSSkIPQne+AH?=
 =?us-ascii?Q?vRgBqxbH160Wcz3HQDYvqFTkY3RyEELWQRWLk+hHGx6omNRIJn4h+aKvbirY?=
 =?us-ascii?Q?RUR53xIRSquHU8aald42mbf6Bi4RiUCPlbK6DcSB2etsqtEiWNVC3YE+tNIh?=
 =?us-ascii?Q?DyNG+TyB6G1urWhTsmBLgM9FW2t/md/1Hph/sLBy6mCWzyKr1uz+6ChpDUJu?=
 =?us-ascii?Q?mJHNBXSO6P+V3N//00T847hqS11v99pvPMSOtDy29ZAzyrEZP7CA0b48xLwc?=
 =?us-ascii?Q?asK+zor6thpX2j8zEyAVHykQVf5Pcn7Jk+rfPXRsimxqFALzT+Wr+8VVxoET?=
 =?us-ascii?Q?YM8DEzMQvPK+/qzCttPyXYj+DQZT7+1bc89fiUI1+/bqwgRFphUwTww8hCHc?=
 =?us-ascii?Q?OA0X1rQAFzxAu78zAizLa1w9QXO8iHUTyZ6ScjabU5nQk4I0i9OFA46qqXA8?=
 =?us-ascii?Q?7zDSkJ+xS6sx53FEeoFfXj/SO9t5HhTiWTFz46QT2BbAxAf/4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:35.4991 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 6b080866-d2da-45b0-ebac-08dcf989815e
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075F0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB7131
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

The name "argv" has different meanings in different functions.

To improve the readability, it's better to refine it to a name that
reflects what it represents.

Rename "argv" to what it represents. Wrap the long container_of() into
to_payload_header() to denote a clear meaning and make checkpatch.pl
happy.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 881e6da9987a..d00c446e2bf9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -124,6 +124,9 @@ struct r535_gsp_msg {
 #define to_gsp_hdr(p, header) \
 	container_of((void *)p, typeof(*header), data)
 
+#define to_payload_hdr(p, header) \
+	container_of((void *)p, typeof(*header), params)
+
 static int
 r535_rpc_status_to_errno(uint32_t rpc_status)
 {
@@ -639,17 +642,17 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 }
 
 static void
-r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *repv)
+r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *params)
 {
-	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(repv, typeof(*rpc), params);
+	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
 
 	nvkm_gsp_rpc_done(object->client->gsp, rpc);
 }
 
 static void *
-r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv)
+r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 {
-	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(argv, typeof(*rpc), params);
+	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
 	struct nvkm_gsp *gsp = object->client->gsp;
 	void *ret = NULL;
 
@@ -692,25 +695,25 @@ r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass, u32 argc)
 }
 
 static void
-r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
+r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
 {
-	rpc_gsp_rm_control_v03_00 *rpc = container_of(repv, typeof(*rpc), params);
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr(params, rpc);
 
-	if (!repv)
+	if (!params)
 		return;
 	nvkm_gsp_rpc_done(object->client->gsp, rpc);
 }
 
 static int
-r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
+r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
 {
-	rpc_gsp_rm_control_v03_00 *rpc = container_of((*argv), typeof(*rpc), params);
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
 	struct nvkm_gsp *gsp = object->client->gsp;
 	int ret = 0;
 
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
 	if (IS_ERR_OR_NULL(rpc)) {
-		*argv = NULL;
+		*params = NULL;
 		return PTR_ERR(rpc);
 	}
 
@@ -722,7 +725,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
 	}
 
 	if (repc)
-		*argv = rpc->params;
+		*params = rpc->params;
 	else
 		nvkm_gsp_rpc_done(gsp, rpc);
 
-- 
2.34.1

