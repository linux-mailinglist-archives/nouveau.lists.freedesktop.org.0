Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4FE5E8A7922
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4F8B112F2D;
	Tue, 16 Apr 2024 23:43:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PaPtwkXC";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 822FF112FB4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:03 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bwwgu9bEa7JrGQChHcyFiRsdCNf009RHX/RlIzywbTyN/BLQHWhFem6PPyIINNboj7jNH06eIxSU8avmB6ca32v0RwbWmpfPLqY+FJrxc/lD8/QM/ubgjW+RYxZ6EARm1GNdXVp4z5Kw+n2cRanXmh/ZK1T4pS/5CJo7xt5hkiTk0mpA11wIOl3Ag0eeXqb1C8cLoieuyT+U7lpwDn3gY1phqakxFlzP29SrK0WQJrxt9lJsQ5+9gww+CPtxz1b3b05Eay64H/VQQ70v62PUY4Xj3USCuqu7jEk+O+9O6ah06Mfe/uyPHeXh+B4yH1lucPAzwDukvobW6sm5ckCR8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9pO2roLpovQXXA6P54VlIezgRHKY0p9P4EcKhLaify4=;
 b=ZaOAeNdH5qHKYQKy0ca5EMTTbr/g3Ht+pi0wPcZ9E1zA4eX4/hMzMExcQ2yY7xQKSaOgsklU4BERk6STzWVBwm2FHetnHS8uY8zaH57hqJlN8xeUPIyjU/QYHPktrGuhJgEKjfWcVcMAFy69T0/lTEjOGx0DFWBUGGOvietc9c4Dx3LzlsX0hFiCGO2BYCHyuqYtfwjMpeTon1PFnu7n4Wv6SJoabyl7W9Df1wuk/gICilPrAcctiongwl1PVFpXcyRDoW9RCOkSnLtxVHBxuRVHHGSyjoQhX7dAFzzmRKb7A4QHkurqk+mmDiMWGu/0vYWRKDEwrkqNG0WoaIprvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9pO2roLpovQXXA6P54VlIezgRHKY0p9P4EcKhLaify4=;
 b=PaPtwkXCNy/dXg7OSGZq5oQ+uByJ4aMx68OOloQZ5FvTbuefkPLElVYsxnhIdRVZS55ESR+cjrXUYm6p3p688FHwqJWIemxbJbsXNSB/DHc+sZvpsAKoxstHbJytnalJPlwDGA9eIxhpQ5RG6r6SXyLNaglXnBc6f5f4dr/3wI7NOU/UwMeJHrqMl5F6GK6xYvKgUUxybwVNAzEWKUhzm+dBN+eOEsAfiCMsoaN/fxLELS/lpD15IZXFBL+O+SBSP/IM0ErkwYmvrDXQYnPl5jrAPDV+c4vB9jpKmfKKJNQusYNcXGH3nlQo4jjzpuLAwFnbsK2cR5lED4R59MzadA==
Received: from CH0PR13CA0044.namprd13.prod.outlook.com (2603:10b6:610:b2::19)
 by PH7PR12MB5976.namprd12.prod.outlook.com (2603:10b6:510:1db::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:57 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::20) by CH0PR13CA0044.outlook.office365.com
 (2603:10b6:610:b2::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7292.11 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:57 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:57 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:40 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:38 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 113/156] drm/nouveau/nvif: rework outp "lvds config" api
Date: Wed, 17 Apr 2024 09:39:19 +1000
Message-ID: <20240416234002.19509-114-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|PH7PR12MB5976:EE_
X-MS-Office365-Filtering-Correlation-Id: a6524d8c-099a-4ff2-67b5-08dc5e6ef1c7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MBfAKrJIPjBjocUIAV7veaq2HptM1FT/B4KPPWqGO4JP+Ru0owTSihI9fV6V+9F1zc8SxRmyL7h9FKmAXVUNzWQmB8886oSf5TeuMzr144GGrMMPGZLqaTHVeVZFzG2nq5RfiQ7Tnt1b5vWigdhUlLss6suNOhwxlNgX2t5jlHE3lRR4ccgq4slCZKcFJ153mARw69celx0cEHBhtVWJYs2+GXPYDjiq2ircgBSPl1RG/BBDoy1fXNGIz45tqimqiCk0dsg7aXxf50B/09q4IyJ2CeZWWNQxQ6BtO2zNExc/vOzYuH89GYhjRqWFNlMaPLb6iE/17tkktmj2s83JiTEhUbExedK87M8/emETN7T7NCV+RA2hQLYna6Ny0PXTtUpfrFoKu1CPAvawZ6B5ybwt8wqxoGel66DFaR4ZX1lEmBnX6xy2k5xULYYqrBRrEIjHU5Mp25159EhbvrUGs8VLkxOzEYTAFyAQkIP1GBNZq6UiUK9VJE8/gMLdw62lfgPveB6MoXxQgVYTgPYB2uuKeAcwW3VdqU+9kKPR+kw6IN/K69rWX5hqKQfrCHZgNf9XO67PhW5JWOd5izygHqrm/bMBuaBLjW+IcdMO+xaWG3b9AecxCNzCWMG2IqfEwiiRqXsZSsdzDNjdkn/m6ehbQWXz+9ysoQfRd8hgqyU04ul+ehvAbiLNvOJ58BIceKNUlmeCURBef6RBGwKByCI9qAWen+wgha+hATsGjyE9KYYbQVAdbNi4c0L1vMfu
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(36860700004)(82310400014)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:57.4152 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a6524d8c-099a-4ff2-67b5-08dc5e6ef1c7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5976
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  2 ++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 10 ----------
 drivers/gpu/drm/nouveau/nvif/outp.c           |  9 ++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 19 ++++++++++---------
 4 files changed, 14 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 7c4e3df12a8e..1eec40976a70 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -293,6 +293,8 @@ struct nvif_outp_impl {
 
 	struct {
 		u8 acpi_edid;
+
+		int (*config)(struct nvif_outp_priv *, bool dual, bool bpc8);
 	} lvds;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index 0bdd8ddc65d3..d8c6e84cf5ae 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,8 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_LVDS          0x40
-
 #define NVIF_OUTP_V0_HDMI          0x50
 
 #define NVIF_OUTP_V0_INFOFRAME     0x60
@@ -21,14 +19,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_lvds_args {
-	struct nvif_outp_lvds_v0 {
-		__u8  version;
-		__u8  dual;
-		__u8  bpc8;
-	} v0;
-};
-
 union nvif_outp_hdmi_args {
 	struct nvif_outp_hdmi_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index 7929dc896b6b..edcb5598efac 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -254,15 +254,10 @@ nvif_outp_hdmi(struct nvif_outp *outp, int head, bool enable, u8 max_ac_packet,
 int
 nvif_outp_lvds(struct nvif_outp *outp, bool dual, bool bpc8)
 {
-	struct nvif_outp_lvds_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.dual = dual;
-	args.bpc8 = bpc8;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_LVDS, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[LVDS dual:%d 8bpc:%d]", args.dual, args.bpc8);
+	ret = outp->impl->lvds.config(outp->priv, dual, bpc8);
+	NVIF_ERRON(ret, &outp->object, "[LVDS dual:%d 8bpc:%d]", dual, bpc8);
 	return ret;
 }
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 5483ca37ca0e..93de3990554e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -305,17 +305,18 @@ nvkm_uoutp_mthd_hdmi(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_lvds(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_lvds(struct nvif_outp_priv *uoutp, bool dual, bool bpc8)
 {
-	union nvif_outp_lvds_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
+	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (outp->info.type != DCB_OUTPUT_LVDS)
-		return -EINVAL;
+	ret = nvkm_uoutp_lock_acquired(uoutp);
+	if (ret)
+		return ret;
 
-	outp->lvds.dual = !!args->v0.dual;
-	outp->lvds.bpc8 = !!args->v0.bpc8;
+	outp->lvds.dual = dual;
+	outp->lvds.bpc8 = bpc8;
+	nvkm_uoutp_unlock(uoutp);
 	return 0;
 }
 
@@ -521,7 +522,6 @@ static int
 nvkm_uoutp_mthd_acquired(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_LVDS         : return nvkm_uoutp_mthd_lvds         (outp, argv, argc);
 	case NVIF_OUTP_V0_HDMI         : return nvkm_uoutp_mthd_hdmi         (outp, argv, argc);
 	case NVIF_OUTP_V0_INFOFRAME    : return nvkm_uoutp_mthd_infoframe    (outp, argv, argc);
 	case NVIF_OUTP_V0_HDA_ELD      : return nvkm_uoutp_mthd_hda_eld      (outp, argv, argc);
@@ -664,6 +664,7 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 		uoutp->impl.type = NVIF_OUTP_SOR;
 		uoutp->impl.proto = NVIF_OUTP_LVDS;
 		uoutp->impl.lvds.acpi_edid = outp->info.lvdsconf.use_acpi_for_edid;
+		uoutp->impl.lvds.config = nvkm_uoutp_lvds;
 		break;
 	case DCB_OUTPUT_DP:
 		if (!outp->info.location) {
-- 
2.41.0

