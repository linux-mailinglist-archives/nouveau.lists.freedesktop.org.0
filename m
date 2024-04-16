Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04C9A8A791C
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83E5C112FAB;
	Tue, 16 Apr 2024 23:43:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="d9ppt5oX";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E321112FAE
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hBTwFJoLf1cRY4/HjOdUQ7MXyYYypvtai6d9wIhccYidm0MhLiLJBF9VamxYK05sXnk+ZmBZy1r+YKTsSN56j9IDzH/5ISOYrfNFGRrI+f/+GG2LO3/vKLwz5+QqmxLq/J3hr+MrK48/kF8yjSAsouzpM1kzKuL4hrq+S6PQYKI9kQMnC9Le6d6qwOwvJMrRElmYMezQ2sFoZ/7tkjEUY8qautmDDcsQ6Yuy80yfsOdzAtM1yLgYiE2d2eEYIv394omho1vVyZ2P2eExY37f2/78QlBm/VkUNpClv8h3N1+biJd+YO7TBYaYN9olcoT7hpe4B8rBAYiCEgmesXPaaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uAsKgdTvbFC7N/W5hNL+VLgZ5xSWxikM2adLjv0XzFE=;
 b=H8QIh7lxY2Zavd9lkKiu+MK71ttHp0AxWDq4cg2oW9sTlDC3POPygO/BXBkzlDx4L7r41GquUwHzymMmMjdMvWIztv1noAnBuYDs46SJg+i8wZAdAi+XFbubAY/cfT8jytAjc8AJiYQKqLZdeoH3bNtmKVNKvybYc3mSpdhRpTqg3S7MyPW+2BYImzdXW8Qh9z1odKT9vylGmTcDoBnAZPaVPMRDvLWvCM9jLi067jZRj4gp/cKD3sADeemciB+t59fuMbbNE6wAXv0yaJKs11LZWAfFl/Uyoqjyz07He5T2VAemSReQwhZu+IjSU2Y8jRj98juMz8IhRzQogqIDdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uAsKgdTvbFC7N/W5hNL+VLgZ5xSWxikM2adLjv0XzFE=;
 b=d9ppt5oXzOc8UYbBGZqrqKh6zvnalxRmbYaG9TtoAwmXEK0wfx5Dd+TNlfqjLHPWaY9SDAV2BtDwTnBjwmFRm/wdIJn0E46EwAIISxQIvB17l8AyA0SJgQRjFrFTUcP4HhmYwvha7kNx9y5nEXl15eQo6i7VbGKEjn6XrqxpVun2j1NlBvCotNJqCDvkauxZYadLNBNvBUJfM4be89BAr8wnD7j96MS73+7jSpSTjV1MXSmfwNTW+uvhsPuyJ2CESLSNwFt9o9mL9YozYshFsDfUHDD2pc+SuPqRBTqffLTc12w9EhfgS6mvqS5zdzxb9S4o33rO6n8sBjBeL0maag==
Received: from CH5P222CA0009.NAMP222.PROD.OUTLOOK.COM (2603:10b6:610:1ee::25)
 by PH8PR12MB7374.namprd12.prod.outlook.com (2603:10b6:510:216::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:59 +0000
Received: from CH2PEPF0000013D.namprd02.prod.outlook.com
 (2603:10b6:610:1ee:cafe::1) by CH5P222CA0009.outlook.office365.com
 (2603:10b6:610:1ee::25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013D.mail.protection.outlook.com (10.167.244.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:59 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:36 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:35 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 110/156] drm/nouveau/nvif: rework outp "acquire" api
Date: Wed, 17 Apr 2024 09:39:16 +1000
Message-ID: <20240416234002.19509-111-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013D:EE_|PH8PR12MB7374:EE_
X-MS-Office365-Filtering-Correlation-Id: dea8a0d0-be46-4c8c-3a90-08dc5e6ef2d2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7KmuH2m4g2axZU2OUVufsSxW0WsvjSYb1suREgsPCAOtrBBm3sij5oi3NycVp+CWcQYQqCNqjYvJMgZtBCYQH/gjf3arLA/3aWIIB8yRGs6og0vIDlSMEgriC20zpMibrcgI8VmKnq4a0O3/h/KQFmM/7ji/9XJ4r9Y4dCP+W0/dofkiW6iR7VTgXUN+ZvFdo5V0j1HQBWtqEsL6R2+hgQpWnhqNcBj1Zn4Hb5wJM7bLEp4HJ+G5lkjm0VHwA8F9m805U+IlQuD++giqZX/qz3f8BJUQYIgStrg8BzQi6FuYmKOgqYnUsjKDrniw5+lSgw9AioDKpamEzYFFAtKDzUIsm5kj2jPKqKhjYDNrHd+2/i1XmW/UY78FRCr1pTMMmzukrfIXjuR3plG2ksx8nloMor01cRmdpYWvshQqU2QEcT/a1xYRwTKdTYLU0OU2bfm5Y8nCiqKXH0iraaK948EkTFl4mN1PcVwiGN4ElY4942Rphb0rj7ry5mb1+AUJ9iFd2klb3OkJgeDZeCQSvZu4W98L5mOewJIKrGBYd2w1FBZalrAvBMZWO+6x8a+ykSlGj6FtC7olW/SigB6Y+ZoHeD3/XP4Udr4kbInRkBYnvyZVt4M/tz5zeAFP5/5Yi9Vg4FrsG/8j7PLzkGyBezDdt0Ma1UxSBf3hK0O9B40/58BWYTP/3zUQT2mlZuCPNLzpCHW++senExucBmiJNmYEA+ABV5dL8P8hwkaDZgQtwFEocKT6TlEX1RzX+SsT
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:59.1482 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: dea8a0d0-be46-4c8c-3a90-08dc5e6ef2d2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013D.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7374
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  1 +
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 19 ----------
 drivers/gpu/drm/nouveau/nvif/outp.c           | 29 ++++++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 35 ++++++++++---------
 4 files changed, 31 insertions(+), 53 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 9ab54de43ba3..a2e0423f76c2 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -278,6 +278,7 @@ struct nvif_outp_impl {
 
 	int (*inherit)(struct nvif_outp_priv *, enum nvif_outp_proto,
 		       u8 *or, u8 *link, u8 *head, u8 *proto_evo);
+	int (*acquire)(struct nvif_outp_priv *, enum nvif_outp_type, bool hda, u8 *or, u8 *link);
 
 	int (*load_detect)(struct nvif_outp_priv *, u32 loadval, u8 *load);
 
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 09e2f61673a8..3cbdb5fc4757 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_ACQUIRE       0x11
 #define NVIF_OUTP_V0_RELEASE       0x12
 
 #define NVIF_OUTP_V0_BL_GET        0x30
@@ -27,24 +26,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_acquire_args {
-	struct nvif_outp_acquire_v0 {
-		__u8 version;
-#define NVIF_OUTP_ACQUIRE_V0_DAC  0x00
-#define NVIF_OUTP_ACQUIRE_V0_SOR  0x01
-#define NVIF_OUTP_ACQUIRE_V0_PIOR 0x02
-		__u8 type;
-		__u8 or;
-		__u8 link;
-		__u8 pad04[4];
-		union {
-			struct {
-				__u8 hda;
-			} sor;
-		};
-	} v0;
-};
-
 union nvif_outp_release_args {
 	struct nvif_outp_release_vn {
 	} vn;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index c98af48b4b33..ddcd2b9d69f3 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -302,54 +302,47 @@ nvif_outp_release(struct nvif_outp *outp)
 }
 
 static inline int
-nvif_outp_acquire(struct nvif_outp *outp, u8 type, struct nvif_outp_acquire_v0 *args)
+nvif_outp_acquire(struct nvif_outp *outp, enum nvif_outp_type type, bool hda)
 {
+	u8 or, link;
 	int ret;
 
-	args->version = 0;
-	args->type = type;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_ACQUIRE, args, sizeof(*args));
+	ret = outp->impl->acquire(outp->priv, type, hda, &or, &link);
 	if (ret)
 		return ret;
 
-	outp->or.id = args->or;
-	outp->or.link = args->link;
+	outp->or.id = or;
+	outp->or.link = link;
 	return 0;
 }
 
 int
 nvif_outp_acquire_pior(struct nvif_outp *outp)
 {
-	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_PIOR, &args);
-	NVIF_ERRON(ret, &outp->object, "[ACQUIRE PIOR] or:%d", args.or);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_PIOR, false);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE PIOR] or:%d", outp->or.id);
 	return ret;
 }
 
 int
 nvif_outp_acquire_sor(struct nvif_outp *outp, bool hda)
 {
-	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	args.sor.hda = hda;
-
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_SOR, &args);
-	NVIF_ERRON(ret, &outp->object, "[ACQUIRE SOR] or:%d link:%d", args.or, args.link);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_SOR, hda);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE SOR] or:%d link:%d", outp->or.id, outp->or.link);
 	return ret;
 }
 
 int
 nvif_outp_acquire_dac(struct nvif_outp *outp)
 {
-	struct nvif_outp_acquire_v0 args;
 	int ret;
 
-	ret = nvif_outp_acquire(outp, NVIF_OUTP_ACQUIRE_V0_DAC, &args);
-	NVIF_ERRON(ret, &outp->object, "[ACQUIRE DAC] or:%d", args.or);
+	ret = nvif_outp_acquire(outp, NVIF_OUTP_DAC, false);
+	NVIF_ERRON(ret, &outp->object, "[ACQUIRE DAC] or:%d", outp->or.id);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 3f242a03f77b..46ca915f0206 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -373,35 +373,38 @@ nvkm_uoutp_mthd_release(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_acquire(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_acquire(struct nvif_outp_priv *uoutp, enum nvif_outp_type type, bool hda,
+		   u8 *or, u8 *link)
 {
-	union nvif_outp_acquire_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (outp->ior && args->v0.type <= NVIF_OUTP_ACQUIRE_V0_PIOR)
+	nvkm_uoutp_lock(uoutp);
+	if (outp->ior) {
+		nvkm_uoutp_unlock(uoutp);
 		return -EBUSY;
+	}
 
-	switch (args->v0.type) {
-	case NVIF_OUTP_ACQUIRE_V0_DAC:
-	case NVIF_OUTP_ACQUIRE_V0_PIOR:
+	switch (type) {
+	case NVIF_OUTP_DAC:
+	case NVIF_OUTP_PIOR:
 		ret = outp->func->acquire(outp, false);
 		break;
-	case NVIF_OUTP_ACQUIRE_V0_SOR:
-		ret = outp->func->acquire(outp, args->v0.sor.hda);
+	case NVIF_OUTP_SOR:
+		ret = outp->func->acquire(outp, hda);
 		break;
 	default:
 		ret = -EINVAL;
 		break;
 	}
 
-	if (ret)
-		return ret;
+	if (ret == 0) {
+		*or = outp->ior->id;
+		*link = outp->ior->asy.link;
+	}
 
-	args->v0.or = outp->ior->id;
-	args->v0.link = outp->ior->asy.link;
-	return 0;
+	nvkm_uoutp_unlock(uoutp);
+	return ret;
 }
 
 static int
@@ -549,7 +552,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_GET     : return nvkm_uoutp_mthd_bl_get     (outp, argv, argc);
 	case NVIF_OUTP_V0_BL_SET     : return nvkm_uoutp_mthd_bl_set     (outp, argv, argc);
 	case NVIF_OUTP_V0_DP_AUX_PWR : return nvkm_uoutp_mthd_dp_aux_pwr (outp, argv, argc);
@@ -599,6 +601,7 @@ static const struct nvif_outp_impl
 nvkm_uoutp_impl = {
 	.del = nvkm_uoutp_del,
 	.inherit = nvkm_uoutp_inherit,
+	.acquire = nvkm_uoutp_acquire,
 };
 
 static void *
-- 
2.41.0

