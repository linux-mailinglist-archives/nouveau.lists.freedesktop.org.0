Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F9D18D11F6
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32B9B10E1D0;
	Tue, 28 May 2024 02:23:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="lWtkyjGN";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2066.outbound.protection.outlook.com [40.107.223.66])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BCDFB10F684
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:24 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iNvP0MfOaZXW1w3bYVrQuikmmy6eJWObwRDCZw+WggPVpUp0hWOA1PnUzU/mQ0gLHLlmXbO/LvLDRloI3+sV3x7PYhWejldEzAeTsszkPLgaUg1hOW+n45l+NOZSx94JeC0ChtFPw8683iEPtBJDc/zPZnQUPW1wM7FdwGSM3Fn642xahIKK3ayOcjt/P5uFcwaIZ7S6oHPFS2XAUa5KuZNVJmbVzPC8lsoVEwPXQBbfsENqBFmOi89A4ZNhdfEugHKRHGF55ZbAbV8yiMg7WAFnmXWQhTqxqx+wauRNKmAs7dur7mc2iCxZNMZlG25FQ5L5bwf5SiLb+CtGigglag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dFFgTFuG5MIV+tmKdpFA2isEG1+mlgnKPgozfFW38TI=;
 b=dZFr92elvsacgZtBswefFyZxag/vEkxDA+WZ+r4x8urF6hJoZiQsAGfcYkYaFANccXdMXWuPKFXq4NmbWyNsat13sKjLRBtr8FLyUBnLdbpm94jLVjYq+v2aTNQlBnR/MGSHnKV5I81IzRt3o3RQVvWBQOKeFBUO4gzWsjyao0iDcsOTsUPAz+K9RemkoApOurXotlSyJ8uHfCL680FgNWWHuAYkobRoGefAeCib4gUzwjbjHJCvI2Xu/+t/ZfsZ7QUNVcFYsg4BoWfrCRfrtLRYPf9LlCdRd3xuSjtqzJQoctajd5aX7kA4TG4+LKCqPqu22PrHXJ+UB9utRCf75Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dFFgTFuG5MIV+tmKdpFA2isEG1+mlgnKPgozfFW38TI=;
 b=lWtkyjGN3aGw8cOFIlHLwjdOGZnbTjiypo9TB2wbCIGVwo4EDXK0Ysc8+MwqfIZsfYIsRLOHGNy+ClZBj1BQlgZMUTiEvLcTUN+J0r/Q3a/8TI+yBp2vrF1mfnWdokFzoe554DrecmdaXhogDmpihNp0ZOhHSgyRkoZ59u27bynzE7EkG9muSt8q6KWAgZIDMD9LSD1QJM6qlXrWfVGANU8wjXTaVMEyIZJaxBzJ15Tm2iKJ3wRoxOK9OLH30BFJA/IpDpHW7F7li9U+z6xGjscz8eeS8rXhZvkpM5r6VnM4A7rECIG7v3ZnNEYWws0bZ//cknR6sJXJqia19wxv0g==
Received: from SJ0PR13CA0057.namprd13.prod.outlook.com (2603:10b6:a03:2c2::32)
 by PH8PR12MB6889.namprd12.prod.outlook.com (2603:10b6:510:1c9::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.36; Tue, 28 May
 2024 02:23:19 +0000
Received: from SJ1PEPF00002311.namprd03.prod.outlook.com
 (2603:10b6:a03:2c2:cafe::e9) by SJ0PR13CA0057.outlook.office365.com
 (2603:10b6:a03:2c2::32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7633.16 via Frontend
 Transport; Tue, 28 May 2024 02:23:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 SJ1PEPF00002311.mail.protection.outlook.com (10.167.242.165) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:07 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 13/34] drm/nouveau/nvif: remove nvxx_object()
Date: Tue, 28 May 2024 00:19:38 +1000
Message-ID: <20240527141959.59193-14-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ1PEPF00002311:EE_|PH8PR12MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 5dfe3a78-29ef-4185-a3eb-08dc7ebd2408
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|36860700004|82310400017|376005|1800799015; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CP4UqBh+Vqyz8Qw0SJIbWTaZRjoL0nfN1Cls/m+Dajldekiki6F1uzaJDPFf?=
 =?us-ascii?Q?HvnNcFT9ASkF76KoEfo1bsS81OchXwp4fBvJgTznfqEuI5EZ7FY/k3VUGXcl?=
 =?us-ascii?Q?NveISDbMDPBVhjtY8yV2/8hPMri2i1woB7cd3DDy0i8v9LRO7uLlaMU9VRs8?=
 =?us-ascii?Q?lz/KqEnzvw8AsMlHNt+ttjAABlkv796RAT2IbLUe0BRRQ7yFws9JMug3Np2A?=
 =?us-ascii?Q?i6LNHrlaigfIslKRiCQjPMt0Ov5lqVPL6FohNiiwqBBUC0NkNuqpAIBIKs6T?=
 =?us-ascii?Q?uiYu4RVfuftzuYi9z1/9cPoDhqcRH321kwy9RjGFOJlDAhgqTh9qJFsDDFkQ?=
 =?us-ascii?Q?JXEmuvme47ab2Kqkm/6WhniKeBNEa/CKkLbd+sPwdrUMYzRYGR7r0tZ3sCr0?=
 =?us-ascii?Q?iBal1n/tG7pL7FNLMRR/TGUu8DWiAaHEyw0l64UC1vWF8YicRGuOozEyZ7K7?=
 =?us-ascii?Q?3KYx3eKYZRn1npHqBQoQJUcop3n2intooYW5g5OMe/Xxf1VD3XE2L99gmqcW?=
 =?us-ascii?Q?wcf8XfiHr+tYPlYoDphJ941Cp1F/Ji4myj5aTa7BOxvDCOcJlsw9hDzNRTEZ?=
 =?us-ascii?Q?YFR0WXvDYx65KKf6Nnf3iMtj37EUDGsTxMFKgTjtoSUt9nGGhxhOUgLS3rcs?=
 =?us-ascii?Q?N//7SPqgV08U5Cn+O7s/JJnNC/5G4TUaGsIkfrUleIQ6l5Oci0Bz/H+GAuFX?=
 =?us-ascii?Q?DjBIDDY90UIdvWwd1DbvCXbvE1NLXtuUOvYKaX55kMhzEqQL1yoJPkw9hPF8?=
 =?us-ascii?Q?gc7Bar2KCCVPEIFWnOOs5HVh2bXLo+0GM7E/sBaGJ1FTXZE3gbLWi1bynWez?=
 =?us-ascii?Q?wtB76cJCNBshssMFSO4EycFr5WMOktgybrf66CxVUBfUk9MtUTOVZN/tjPgf?=
 =?us-ascii?Q?GWE4kdypnRxZKEvJYBOpU6MA3f7xR4jBoQGTUyh5HOrPOm7Eu/mJ5xGyCrkg?=
 =?us-ascii?Q?OJ0Qv5MfpbXsVTL391AeHML0Xkw/p0CLGWt5kCgrOfHd7L0RH6m4y73n/KrS?=
 =?us-ascii?Q?/1CRyyDGn8yp7nKVKHXBfIesxJ5HF3D8GxQFqVgxvL3mCnyZRA0VrkAThCo6?=
 =?us-ascii?Q?0dswxFX5Q5pLCixHiJp/CbabYnyirkw/4mutGzgSCJy8VXQsh1kUXvJ9vU8d?=
 =?us-ascii?Q?RZ7aWF8e5wF5OTy7iwBg4wzfy+hhpQbJFABVGxE2WCk93pVSNFWjNJQkvJdB?=
 =?us-ascii?Q?RDMQNoL7xwL+Eg9WBw5C4ZPXGWKvXmAS46rNxIZ/TwIolYQJw8/KkKhb3tq3?=
 =?us-ascii?Q?j70fGQmVb9Wh6cg6rOSir1ePQRxOGS0dqcJjk2hbdpbnmclXUKLwXCmVo3//?=
 =?us-ascii?Q?65VlDPWkE+76Dicks32NDHCE1lTULdMiqL9z7y/wuPXGaHm+Ak0YbsZlEAVk?=
 =?us-ascii?Q?OAcQdn6NqaGoWQcIt73zsBMG0EL8?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(36860700004)(82310400017)(376005)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:19.6826 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5dfe3a78-29ef-4185-a3eb-08dc7ebd2408
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ1PEPF00002311.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6889
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

This hasn't been used in a while.

Moves some io accessors to another include at the same time to
fix a compile issue that resulted from <nvkm/core/object.h> no
longer being included.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/object.h |  7 -------
 drivers/gpu/drm/nouveau/include/nvif/os.h     | 19 +++++++++++++++++++
 .../gpu/drm/nouveau/include/nvkm/core/os.h    | 19 -------------------
 3 files changed, 19 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/object.h b/drivers/gpu/drm/nouveau/include/nvif/object.h
index f52399caee82..478cbb8f2dfe 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/object.h
@@ -134,11 +134,4 @@ struct nvif_mclass {
 #define NVIF_MR32(p,A...) DRF_MR(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
 #define NVIF_MV32(p,A...) DRF_MV(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
 #define NVIF_MD32(p,A...) DRF_MD(NVIF_RD32_, NVIF_WR32_, u32, (p), 0, ##A)
-
-/*XXX*/
-#include <core/object.h>
-#define nvxx_object(a) ({                                                      \
-	struct nvif_object *_object = (a);                                     \
-	(struct nvkm_object *)_object->priv;                                   \
-})
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvif/os.h b/drivers/gpu/drm/nouveau/include/nvif/os.h
index 429d0106c123..a2eaf3929ac3 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/os.h
@@ -34,4 +34,23 @@
 
 #include <soc/tegra/fuse.h>
 #include <soc/tegra/pmc.h>
+
+#ifdef __BIG_ENDIAN
+#define ioread16_native ioread16be
+#define iowrite16_native iowrite16be
+#define ioread32_native  ioread32be
+#define iowrite32_native iowrite32be
+#else
+#define ioread16_native ioread16
+#define iowrite16_native iowrite16
+#define ioread32_native  ioread32
+#define iowrite32_native iowrite32
+#endif
+
+#define iowrite64_native(v,p) do {                                             \
+	u32 __iomem *_p = (u32 __iomem *)(p);                                  \
+	u64 _v = (v);                                                          \
+	iowrite32_native(lower_32_bits(_v), &_p[0]);                           \
+	iowrite32_native(upper_32_bits(_v), &_p[1]);                           \
+} while(0)
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
index 3fd5c007a663..9b05612e6490 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
@@ -3,25 +3,6 @@
 #define __NVKM_OS_H__
 #include <nvif/os.h>
 
-#ifdef __BIG_ENDIAN
-#define ioread16_native ioread16be
-#define iowrite16_native iowrite16be
-#define ioread32_native  ioread32be
-#define iowrite32_native iowrite32be
-#else
-#define ioread16_native ioread16
-#define iowrite16_native iowrite16
-#define ioread32_native  ioread32
-#define iowrite32_native iowrite32
-#endif
-
-#define iowrite64_native(v,p) do {                                             \
-	u32 __iomem *_p = (u32 __iomem *)(p);				       \
-	u64 _v = (v);							       \
-	iowrite32_native(lower_32_bits(_v), &_p[0]);			       \
-	iowrite32_native(upper_32_bits(_v), &_p[1]);			       \
-} while(0)
-
 struct nvkm_blob {
 	void *data;
 	u32 size;
-- 
2.44.0

