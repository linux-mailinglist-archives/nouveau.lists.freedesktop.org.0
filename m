Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF4DA8A791E
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C1B8112FB4;
	Tue, 16 Apr 2024 23:43:05 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FgtFfFU4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2063.outbound.protection.outlook.com [40.107.100.63])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F364B112FB4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZTAmD8MiHHQA7a/aVjp/WMeBXq9S3DbDcCYTU9pTZIVkkWP4z8rGgxwWCe67PH7q0iES/uLZkJGN+NWqLEdE09Vw+a6AXeS9W88h5goByT/IYBeuH5nVi5Kk9t+MMUZRq7A2nffRPzQ329KiLWmafmPLzHTBgCquOE81cyvoVg650kk16TKZTFLUGzQJVoOLvdMMqrHk/ghKViL5A7j5XSkJnIfv273J/SnQww9GbgKm1G+ED79qFYlzAdodflj7Vvu7zy2vzHHGbi4UrxPhfoXxnsYbb2s1pp/d1/kTas+Dedwz1bcE+KPGUFAKROLHX/8VjZJJmyYQw4QhbBg4UQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gGF71ol/HAmxhyjwiI01iq+ZU2LhxctShLaYwP4oFhw=;
 b=EfQQYVVceeFXQGwMsa9XysSKT2+FlhOOPx5T/H94Jpr13k3axXG8hQ2QLsHGYUcf3tm1LZqWj4kwOtL1NldbkeFA2ZCUCVhTGRLTjqWIvVYtxHporx8sASmtqOVOCjVZE5BmLh9+0+Xmzq4gPAiW2jCYbHaNcfcVpzU01pzMgVypIaVW7aKHTqqAMviRZ3tsIWqKehRgeBOPr1b7e/gHhqxLuSQdYh9axnQ3++W6gakB/0QIWUg/srTcx//cKQ9aV8lk/1Ehq3JvEuCzrTdy0NHyC8Ps5twsI5KC6ergrbUkdmnKS/6LhSPRsVfi0FmrhdPHmDksFDy9eT/R/OFoiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gGF71ol/HAmxhyjwiI01iq+ZU2LhxctShLaYwP4oFhw=;
 b=FgtFfFU4V8r66+stPTXB9rg2zZg4owu4YgM5kQeNhBQ8cFmyWvlrmfRBjou8zgA7eMSKm22zOFFuQZtshT8nJ/HClWy1lmP81H0+tuPtAoe/tj0BkP9omOiPh3DhUf1z+Xz37unW0vAACLqFizMrNdnlCYeUvD2q5M2CZgRB5fqAILMbSwMLUD73W0F9FhQblPAa3FDihtmwLLHjPUQHe2F5tpi5sjIZMkgfnWdFrp55z7lNTfCXIZREfNawFW9eHAPcjikEbHDbEXY0J+bdZWJEDD9wMM8oLV1QN7CaN/sgQkEp+tVQYHzm8bV3JwObT/vqvTZunrNtxfGvBHyFjw==
Received: from CH2PR15CA0004.namprd15.prod.outlook.com (2603:10b6:610:51::14)
 by BY5PR12MB4033.namprd12.prod.outlook.com (2603:10b6:a03:213::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:59 +0000
Received: from CH2PEPF00000140.namprd02.prod.outlook.com
 (2603:10b6:610:51:cafe::d0) by CH2PR15CA0004.outlook.office365.com
 (2603:10b6:610:51::14) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:58 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000140.mail.protection.outlook.com (10.167.244.72) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:35 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:34 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 109/156] drm/nouveau/nvif: rework outp "inherit" apis
Date: Wed, 17 Apr 2024 09:39:15 +1000
Message-ID: <20240416234002.19509-110-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000140:EE_|BY5PR12MB4033:EE_
X-MS-Office365-Filtering-Correlation-Id: 035e25e9-e627-4225-2349-08dc5e6ef212
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pcBMITJS+EtNeg++foG4+oPV4eQwOiHyFXfJvfuZT4h+CkuuEdSvYOPfFq6bi/TrPpA5aMn88GFpUq97yp7/SNicyADj9M7RwOhCacqtp6ZZ+ySgRFy1n3EbdboNKH2i/JVfNdVUXZM7u2S5sdDCkJ6erLqP1s/71eKSWztxKweETTXtKeU81Ul5c3QtQ7NFsEFzeXGXwsxOKVB3wamabSw7PUaYsIdC3uFSgb0wjeg86UZmKTnE+9A33aGSlUCh26TKqU6xpN9ZbXpPL11x91/BKTfr9K09L9UxqkHI3kBlkw8sFsMWdulq48nb3+IYLSIol8s6rtHxRtWtM5sTBPPvVYeVAEQg6mnJB2fTxxbHFyxWDF3reMniWSTjCNj9VeODcNNLjSDdpjFiZpytS06LdRCCsrCP+uW9mtX7ioWqBzJkh3ZjdCAAsEPHwG0E5wHl71+9Z/S+sqI5Bu25ejMEmgEOMJ5Alz6W9UbibCS/ZyV4XcSBuxBjZWZuwH3E7dsYkRtT8SMS/sBUlD4tXr/QyTjjhqptXpTHwpQXvcMDkPIUbM52OghzSdLyBuyM/n00kPaCNz6HcE5HQ0RGjux3BxijSYZv+OzGrqBGHDMB1BK7BDvSX7dqlXCoLT03WphWQczWEFxuiq0kxp6wo5mt7zgevObqla+Xt4A/pq0cHnTkGkOf2BWKalGDXJqhcXoj6bRUb32v4p7sOcXiSIZwEZ2p6L8OPsZtheKeMWfTFphqAY7WgcwOsOredoAh
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(36860700004)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:57.8893 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 035e25e9-e627-4225-2349-08dc5e6ef212
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000140.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4033
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

- transition from "ioctl" interfaces

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  3 ++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 23 ---------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 40 +++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 50 +++++++++----------
 4 files changed, 45 insertions(+), 71 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 39b0e8d002f8..9ab54de43ba3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -276,6 +276,9 @@ struct nvif_outp_impl {
 	int (*detect)(struct nvif_outp_priv *, enum nvif_outp_detect_status *);
 	int (*edid_get)(struct nvif_outp_priv *, u8 *data, u16 *size);
 
+	int (*inherit)(struct nvif_outp_priv *, enum nvif_outp_proto,
+		       u8 *or, u8 *link, u8 *head, u8 *proto_evo);
+
 	int (*load_detect)(struct nvif_outp_priv *, u32 loadval, u8 *load);
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 586b44fa8814..09e2f61673a8 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_INHERIT       0x10
 #define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
@@ -46,28 +45,6 @@ union nvif_outp_acquire_args {
 	} v0;
 };
 
-union nvif_outp_inherit_args {
-	struct nvif_outp_inherit_v0 {
-		__u8 version;
-#define NVIF_OUTP_INHERIT_V0_RGB_CRT 0x00
-#define NVIF_OUTP_INHERIT_V0_TV      0x01
-#define NVIF_OUTP_INHERIT_V0_TMDS    0x02
-#define NVIF_OUTP_INHERIT_V0_LVDS    0x03
-#define NVIF_OUTP_INHERIT_V0_DP      0x04
-		// In/out. Input is one of the above values, output is the actual hw protocol
-		__u8 proto;
-		__u8 or;
-		__u8 link;
-		__u8 head;
-		union {
-			struct {
-				// TODO: Figure out padding, and whether we even want this field
-				__u8 hda;
-			} tmds;
-		};
-	} v0;
-};
-
 union nvif_outp_release_args {
 	struct nvif_outp_release_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 59499eebc5ac..c98af48b4b33 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -354,71 +354,65 @@ nvif_outp_acquire_dac(struct nvif_outp *outp)
 }
 
 static int
-nvif_outp_inherit(struct nvif_outp *outp,
-		  u8 proto,
-		  struct nvif_outp_inherit_v0 *args,
-		  u8 *proto_out)
+nvif_outp_inherit(struct nvif_outp *outp, enum nvif_outp_proto proto, u8 *head, u8 *proto_evo)
 {
+	u8 or, link;
 	int ret;
 
-	args->version = 0;
-	args->proto = proto;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_INHERIT, args, sizeof(*args));
+	ret = outp->impl->inherit(outp->priv, proto, &or, &link, head, proto_evo);
 	if (ret)
 		return ret;
 
-	outp->or.id = args->or;
-	outp->or.link = args->link;
-	*proto_out = args->proto;
+	outp->or.id = or;
+	outp->or.link = link;
 	return 0;
 }
 
 int
 nvif_outp_inherit_lvds(struct nvif_outp *outp, u8 *proto_out)
 {
-	struct nvif_outp_inherit_v0 args;
+	u8 head;
 	int ret;
 
-	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_LVDS, &args, proto_out);
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_LVDS, &head, proto_out);
 	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:LVDS] ret:%d", ret);
-	return ret ?: args.head;
+	return ret ?: head;
 }
 
 int
 nvif_outp_inherit_tmds(struct nvif_outp *outp, u8 *proto_out)
 {
-	struct nvif_outp_inherit_v0 args;
+	u8 head;
 	int ret;
 
-	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_TMDS, &args, proto_out);
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_TMDS, &head, proto_out);
 	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:TMDS] ret:%d", ret);
-	return ret ?: args.head;
+	return ret ?: head;
 }
 
 int
 nvif_outp_inherit_dp(struct nvif_outp *outp, u8 *proto_out)
 {
-	struct nvif_outp_inherit_v0 args;
+	u8 head;
 	int ret;
 
-	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_DP, &args, proto_out);
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_DP, &head, proto_out);
 	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:DP] ret:%d", ret);
 
 	// TODO: Get current link info
 
-	return ret ?: args.head;
+	return ret ?: head;
 }
 
 int
 nvif_outp_inherit_rgb_crt(struct nvif_outp *outp, u8 *proto_out)
 {
-	struct nvif_outp_inherit_v0 args;
+	u8 head;
 	int ret;
 
-	ret = nvif_outp_inherit(outp, NVIF_OUTP_INHERIT_V0_RGB_CRT, &args, proto_out);
+	ret = nvif_outp_inherit(outp, NVIF_OUTP_RGB_CRT, &head, proto_out);
 	NVIF_ERRON(ret && ret != -ENODEV, &outp->object, "[INHERIT proto:RGB_CRT] ret:%d", ret);
-	return ret ?: args.head;
+	return ret ?: head;
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index d3f69d6a10f3..3f242a03f77b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -405,44 +405,40 @@ nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_inherit(struct nvif_outp_priv *uoutp, enum nvif_outp_proto proto,
+		   u8 *or, u8 *link, u8 *head, u8 *proto_evo)
 {
-	union nvif_outp_inherit_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	struct nvkm_ior *ior;
-	int ret = 0;
+	int ret = -ENODEV;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	nvkm_uoutp_lock(uoutp);
 
 	/* Ensure an ior is hooked up to this outp already */
 	ior = outp->func->inherit(outp);
 	if (!ior || !ior->arm.head)
-		return -ENODEV;
+		goto done;
 
 	/* With iors, there will be a separate output path for each type of connector - and all of
 	 * them will appear to be hooked up. Figure out which one is actually the one we're using
 	 * based on the protocol we were given over nvif
 	 */
-	switch (args->v0.proto) {
-	case NVIF_OUTP_INHERIT_V0_TMDS:
+	switch (proto) {
+	case NVIF_OUTP_TMDS:
 		if (ior->arm.proto != TMDS)
-			return -ENODEV;
+			goto done;
 		break;
-	case NVIF_OUTP_INHERIT_V0_DP:
+	case NVIF_OUTP_DP:
 		if (ior->arm.proto != DP)
-			return -ENODEV;
+			goto done;
 		break;
-	case NVIF_OUTP_INHERIT_V0_LVDS:
+	case NVIF_OUTP_LVDS:
 		if (ior->arm.proto != LVDS)
-			return -ENODEV;
+			goto done;
 		break;
-	case NVIF_OUTP_INHERIT_V0_TV:
-		if (ior->arm.proto != TV)
-			return -ENODEV;
-		break;
-	case NVIF_OUTP_INHERIT_V0_RGB_CRT:
+	case NVIF_OUTP_RGB_CRT:
 		if (ior->arm.proto != CRT)
-			return -ENODEV;
+			goto done;
 		break;
 	default:
 		ret = -EINVAL;
@@ -452,18 +448,22 @@ nvkm_uoutp_mthd_inherit(struct nvkm_outp *outp, void *argv, u32 argc)
 	/* Make sure that userspace hasn't already acquired this */
 	if (outp->acquired) {
 		OUTP_ERR(outp, "cannot inherit an already acquired (%02x) outp", outp->acquired);
-		return -EBUSY;
+		ret = -EBUSY;
+		goto done;
 	}
 
 	/* Mark the outp acquired by userspace now that we've confirmed it's already active */
 	OUTP_TRACE(outp, "inherit %02x |= %02x %p", outp->acquired, NVKM_OUTP_USER, ior);
 	nvkm_outp_acquire_ior(outp, NVKM_OUTP_USER, ior);
 
-	args->v0.or = ior->id;
-	args->v0.link = ior->arm.link;
-	args->v0.head = ffs(ior->arm.head) - 1;
-	args->v0.proto = ior->arm.proto_evo;
+	*or = ior->id;
+	*link = ior->arm.link;
+	*head = ffs(ior->arm.head) - 1;
+	*proto_evo = ior->arm.proto_evo;
 
+	ret = 0;
+done:
+	nvkm_uoutp_unlock(uoutp);
 	return ret;
 }
 
@@ -549,7 +549,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
@@ -599,6 +598,7 @@ nvkm_uoutp_del(struct nvif_outp_priv *uoutp)
 static const struct nvif_outp_impl
 nvkm_uoutp_impl = {
 	.del = nvkm_uoutp_del,
+	.inherit = nvkm_uoutp_inherit,
 };
 
 static void *
-- 
2.41.0

