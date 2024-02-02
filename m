Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AA548847CE4
	for <lists+nouveau@lfdr.de>; Sat,  3 Feb 2024 00:06:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C335710F166;
	Fri,  2 Feb 2024 23:06:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Fsbl90tE";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2050.outbound.protection.outlook.com [40.107.220.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5386810F168
 for <nouveau@lists.freedesktop.org>; Fri,  2 Feb 2024 23:06:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Go+4CMXb66d/fgV9syisl5UCCbYgEJQLIOqKyp9dfCQdPNi6hwRshUxunOCjfa7CD2oQ4ONJwEEA9tQj4BKTPSTTgT8OMPFyPecjaC66Nle2u/YnoXXsCK2NCThNKny6UXjQKUJI+wSAhcnV9aa4rrdlKf11g18mZKW5QGdqbZDbAhDvOYYOFGlZxiidVE+f7SQdpTQgOLrzc1yMndM/qZPbZ8w5PhT0RJuByGujn4pU1EkkfIll/RlU+9RKU8uKVa/QAIhRv53bn/cFZJMRnoSn9kQOAlWa581RpRJ6gEOwVuc57DQYZ5Z68EKEVviiby7JQWYmP0OojyBu3jlItQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=n/ChPpAG59Jqq46T1CF2X0iEmz3tPFTYhPiHNqC/Mik=;
 b=DWCnupDw+7RgiGev7A6KCSFDeyiwqVkCvZVWJeS3o/zG6cwLr7Xa4es/gZmxU8yJUTi2i8d1e2pzn7ivUVMCEVTKLGfCm2FLuscIeJskFky1EJzjbtNzLdogqTIr8MdsrH/KgqxNnbUPT0SMfGAJcoJnjTJtl4x8b+WHdw+wL5JdEHXuiyT3f9aJ64jWeVsrtmHAUyRXIrcdKNL6vaMRvFF1e91D1nLgB7QDo5F9KdI89n34IpRn49BuDNbR8ru62ywyx7oTxie/Yd0aUj27wXOISC/rJYf8gSd4BiVscICoMG+qfxvEy5x06szQWfRwBECsDRVf0g8qXvBabug21A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=redhat.com smtp.mailfrom=nvidia.com;
 dmarc=pass (p=reject sp=reject pct=100) action=none header.from=nvidia.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=n/ChPpAG59Jqq46T1CF2X0iEmz3tPFTYhPiHNqC/Mik=;
 b=Fsbl90tEZTasFO6fR7YHsi/5qv2NCvrhqp3q3C3VNJhBhL4sSTVQhIVu9+RZ4vGCAFyiNAdZBjc2jRQiHPFdC/yVS5bL8mejUnG2sqMCCPctIsLsXijfCct+zjUlTV6eVN8ebqRlrQ7kvRpI9MT76QQc8k2Pjn6Csa/LJnBjJgrD2/+3RHdBCYoFGUp3dfYCFTl5aN0MsaCVXRJG+c5ip79wYq3ljNwRfwGOiUJY67bwN6s0UZIbT1NebeYmrMnWiPNyDZrfUiv5oE9HnXr2OetzPVASNlcTjgsixRpBHPzE5/p26/tR+7daxTIHAPtUFMfvxxKKh3/uqpvA+w/uLw==
Received: from MN2PR16CA0005.namprd16.prod.outlook.com (2603:10b6:208:134::18)
 by MN0PR12MB6102.namprd12.prod.outlook.com (2603:10b6:208:3ca::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7270.13; Fri, 2 Feb
 2024 23:06:26 +0000
Received: from MN1PEPF0000ECD6.namprd02.prod.outlook.com
 (2603:10b6:208:134:cafe::4c) by MN2PR16CA0005.outlook.office365.com
 (2603:10b6:208:134::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7249.24 via Frontend
 Transport; Fri, 2 Feb 2024 23:06:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 MN1PEPF0000ECD6.mail.protection.outlook.com (10.167.242.135) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7249.19 via Frontend Transport; Fri, 2 Feb 2024 23:06:26 +0000
Received: from rnnvmail202.nvidia.com (10.129.68.7) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 2 Feb 2024
 15:06:11 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail202.nvidia.com
 (10.129.68.7) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Fri, 2 Feb 2024
 15:06:11 -0800
Received: from ttabi.nvidia.com (10.127.8.13) by mail.nvidia.com (10.129.68.6)
 with Microsoft SMTP Server id 15.2.986.41 via Frontend Transport;
 Fri, 2 Feb 2024 15:06:10 -0800
From: Timur Tabi <ttabi@nvidia.com>
To: Dave Airlie <airlied@redhat.com>, <nouveau@lists.freedesktop.org>
Subject: [PATCH 2/2] drm/nouveau: nvkm_gsp_radix3_sg() should use
 nvkm_gsp_mem_ctor()
Date: Fri, 2 Feb 2024 17:06:08 -0600
Message-ID: <20240202230608.1981026-2-ttabi@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240202230608.1981026-1-ttabi@nvidia.com>
References: <20240202230608.1981026-1-ttabi@nvidia.com>
MIME-Version: 1.0
X-NVConfidentiality: public
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: MN1PEPF0000ECD6:EE_|MN0PR12MB6102:EE_
X-MS-Office365-Filtering-Correlation-Id: 2664c646-2588-4c95-f2a1-08dc2443957c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: hAA37c4sbFZu1v1XB8ZzAtvwNCQbiK7biFPogLbmLqGBvPHYmKID90S1rVM2mL3k+b3gZRHOgyBs1VmnBH51NjRl3Sbm1sKYqssU88P/mc19K9vSGHOKYg0e0HjM8A8n5/f6bJNjvIIxlWXLh36wNvSYQuACeCeqirryOoE8HwPGD83lKdSkEhcwhF7xi1NYldQXduEGg6dsvIyemHYIdd2lI5nR4Wz1AqpSnubuLXiJqgiXo23eSmSVViPqpDlzBNt503Ny3VtBnAzt5TJOoQUyuG/UZ4e1mP2bEQq/8Y/9v61AZwb+Pf7L5M6caIFgfBWjhTtNvr2+mqqJrzbWDB8fCWcDPa4isIEphfNr5WIJC90D8R8O0/edQWEWxsM+9vOXN4I5JDGbpB2HwG4E42oiYcJB2WFyuv/UT2LcJS1OghJkRt9mtpd8vZdcQOCNPAB3M+LPwgoUVGT7gGMuKzMbBZYQp3Gqa0V7Vh9vW8Ynzqjdmylhis2EFstiMDsPjzHxBSU3vmEskHQH9vh7YmrDSd7RkE4G90vB0FD/G7gmPVjnUnrkj3/tTMuPo5yyDIt0aH6xRpikEDPrvnSLfmIYYtBq1JqElRxLJUNsl6wLWnsweGyL1eAlIlMVFg3I7HpLwrjw4SFzRLESJphVyklyigiukwFj+jDTaz1ERqPF/CfwCGffk9tADv3F1OAC/J8cV56qp7H1uI0p5vD+ttazHvkd3d5mHqYFRhFXDnK+YMR/cN2DWefpUNKmxh5t
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(4636009)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(64100799003)(82310400011)(186009)(1800799012)(451199024)(46966006)(40470700004)(36840700001)(40460700003)(40480700001)(2906002)(478600001)(5660300002)(83380400001)(86362001)(8936002)(336012)(70586007)(36756003)(26005)(19627235002)(110136005)(8676002)(356005)(47076005)(7696005)(316002)(426003)(1076003)(41300700001)(7636003)(2616005)(82740400003)(70206006)(36860700001);
 DIR:OUT; SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Feb 2024 23:06:26.7295 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 2664c646-2588-4c95-f2a1-08dc2443957c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MN1PEPF0000ECD6.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN0PR12MB6102
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

Function nvkm_gsp_radix3_sg() uses nvkm_gsp_mem objects to allocate the
radix3 tables, but it unnecessarily creates those objects manually
instead of using the standard nvkm_gsp_mem_ctor() function like the
rest of the code does.

Signed-off-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 18 +++++++++---------
 1 file changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index a9030eb83b4d..d065389e3618 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -2178,20 +2178,20 @@ nvkm_gsp_radix3_dtor(struct nvkm_gsp *gsp, struct nvkm_gsp_radix3 *rx3)
  * See kgspCreateRadix3_IMPL
  */
 static int
-nvkm_gsp_radix3_sg(struct nvkm_device *device, struct sg_table *sgt, u64 size,
+nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 		   struct nvkm_gsp_radix3 *rx3)
 {
 	u64 addr;
 
 	for (int i = ARRAY_SIZE(rx3->mem) - 1; i >= 0; i--) {
 		u64 *ptes;
-		int idx;
+		size_t bufsize;
+		int ret, idx;
 
-		rx3->mem[i].size = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
-		rx3->mem[i].data = dma_alloc_coherent(device->dev, rx3->mem[i].size,
-						      &rx3->mem[i].addr, GFP_KERNEL);
-		if (WARN_ON(!rx3->mem[i].data))
-			return -ENOMEM;
+		bufsize = ALIGN((size / GSP_PAGE_SIZE) * sizeof(u64), GSP_PAGE_SIZE);
+		ret = nvkm_gsp_mem_ctor(gsp, bufsize, &rx3->mem[i]);
+		if (ret)
+			return ret;
 
 		ptes = rx3->mem[i].data;
 		if (i == 2) {
@@ -2231,7 +2231,7 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		if (ret)
 			return ret;
 
-		ret = nvkm_gsp_radix3_sg(gsp->subdev.device, &gsp->sr.sgt, len, &gsp->sr.radix3);
+		ret = nvkm_gsp_radix3_sg(gsp, &gsp->sr.sgt, len, &gsp->sr.radix3);
 		if (ret)
 			return ret;
 
@@ -2439,7 +2439,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	memcpy(gsp->sig.data, data, size);
 
 	/* Build radix3 page table for ELF image. */
-	ret = nvkm_gsp_radix3_sg(device, &gsp->fw.mem.sgt, gsp->fw.len, &gsp->radix3);
+	ret = nvkm_gsp_radix3_sg(gsp, &gsp->fw.mem.sgt, gsp->fw.len, &gsp->radix3);
 	if (ret)
 		return ret;
 
-- 
2.34.1

