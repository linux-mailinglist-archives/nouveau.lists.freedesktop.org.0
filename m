Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BB5909B76CE
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C78210E840;
	Thu, 31 Oct 2024 08:53:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="NzM/KluQ";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2065.outbound.protection.outlook.com [40.107.223.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B020510E840
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wg53ElPMziJBaSnp/voNFCtbPeW4LUUkeF3ILX5e1pkCucvG6928AxKnk13wJPRAVkxADrRK2P/yFMyyuWDJlia3457Rk/wtoUKVddf7/vzV4OlQsAan/7rMPGkzobY/L5fKtZpKozoCP/zgshUFJSQs6u6NgrbRHbRAFT10C/5zVGu+j6rdl8Oio8kQXic3waC3NzZsd1AT/ujhuCHiLvgjCTovE5JGdNZMGDfLAxnw7hLDWDRbGoZO7BmXaLBJH2QQ5ByRjxPrTugZXiLY9tpzvE8S4RqfyvwyMDA7LS9g1VS0srGLVD4tjyZvDWg4Qp6UV6gt+Xv5vOBPhI9wYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dO92ENBz6flukK905XZWymc7T/pZglZK7Tn2dPuIs1o=;
 b=LZfIuZXqlknaCcawjRPm6p+NMwjfuWyVqvIi2Ir8pHAxs2Y5OyiegmWNKxz8zKhYTGT/LYZLTQWQrBCSo+eVWVUbKmVGPmvvpkCe1r/D31QoWmnQbTkzDFD0acqNE4LfpCRXe3sgV9zLu4oJE96TRFKJBjkVM8EW3ceCULTse4++esYpHPRWPZhob58wlzW7EnT+m/48m7HCIctbASIvRhS6IA7Q0TZwxffVhZ3S2yE1lZb8ClhUPdHLNdVS6ZSn4tlPE/sQ36xFX/t4M1wJouwFi4uLSwqQhOx8Jy/8gjBRKKgSXwhn0DpKdqYpbhLyQZqXdQ3JK11ryeo7QJN8jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dO92ENBz6flukK905XZWymc7T/pZglZK7Tn2dPuIs1o=;
 b=NzM/KluQwpSzAj9umtjUlTiP2T5VkT7MMEmZkfZHvUvdOmyxFSuHDT0Rnt0eI3/K1eSw1OLnGrij3PCy4wODa45+w5Z/IPYKc1fr/1U7b59agJPJUWtmHG2JBn/67ZrJam17sNk/FWHFQo+j2eqlKWXSOSZXQc+mjXNneAsd5ggyNOwaKXPplnFgmTDT8ZJXEoG4pwYK1esbBzdIrloPSudQ7EJJfTJb+z3P2N5fKBgZXWpOS7oVhF4bHfRwntpo4AaXa5ylOhXr1Oo3+8Dv0rDt92mevUkaCDjGBVQLqfDxd0tvwuKwqWbqIK3y3NaZELyifj8n1NTbBiIjN7VFbw==
Received: from BL1PR13CA0314.namprd13.prod.outlook.com (2603:10b6:208:2c1::19)
 by CY5PR12MB6154.namprd12.prod.outlook.com (2603:10b6:930:26::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:23 +0000
Received: from BN2PEPF00004FC1.namprd04.prod.outlook.com
 (2603:10b6:208:2c1:cafe::58) by BL1PR13CA0314.outlook.office365.com
 (2603:10b6:208:2c1::19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.17 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:23 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FC1.mail.protection.outlook.com (10.167.243.187) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:22 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:11 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:10 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:10 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 07/15] nvkm: fix the broken marco GSP_MSG_MAX_SIZE
Date: Thu, 31 Oct 2024 01:52:42 -0700
Message-ID: <20241031085250.2941482-8-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FC1:EE_|CY5PR12MB6154:EE_
X-MS-Office365-Filtering-Correlation-Id: 892461f2-dbd4-4751-79c4-08dcf98979db
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BEQ28hM/LA7htH07M80F0WmolR0skQCoWmiBmtfUNtshNgmRLZMuWnAyrQIk?=
 =?us-ascii?Q?M5t88n/iB9HiE9z6EB5pk6rEgANFvJA6JRR109FHvR+qNr3wxBngKFGSsFb+?=
 =?us-ascii?Q?mH6YrGQzIZtEFWQJ7g8vQXdbvAkmPrfrJ6QuwGpmcRvq/2c4zKoBvI6pTIx4?=
 =?us-ascii?Q?1MRj1WNMppgfUkRljHC9tpmK1i+vnDg7tM59oycQ/MBT+oKYPqqgoEiAM4ts?=
 =?us-ascii?Q?nojl3XUCoOFzJOdoZJxEIh7DUXIEXZogD+8g8SMRGXTB398sM87GJdzD4yMr?=
 =?us-ascii?Q?nIk5+pQqHFPcEc8t+xtYTchlt4zqKx5y6o1GdD6OpIzXrS/Rb0pN12ncsoTx?=
 =?us-ascii?Q?iyHY66oQfACefqjIjOjPpvry/KqM3tDbM04AJnTETN5drYIaxVlXG/tqT7cg?=
 =?us-ascii?Q?LkFXZKrmOdycBkCuQapDr1lEWjOAvkiz/8v3ub+YkLWBac6nDzCl1Ve4D2rI?=
 =?us-ascii?Q?bIBJfeuyVrj7FT3vyIPRuScXZUo5AeyMRt+6PT7atF2QtGsPl2n2y/b9xTNX?=
 =?us-ascii?Q?61XQyWlmZxBGw8wIYcnP+fLsTiv3WzjvoHmYRx6/14rOknxktvseoMA1/XyJ?=
 =?us-ascii?Q?8n2qaimyUlmysPHUKoRxVUicOwqFpzyfMRUcAqJG4K2sve6rKdtayVdj2qLo?=
 =?us-ascii?Q?obG9izfiDBATsF766o2NLtib3+rqfKQhcUY2tXE5bSGAXdUX4j+PBndl8b9g?=
 =?us-ascii?Q?W1XLlFY3QssLpKrO/CiViBwHKhX4d61igKWXxrEWb41xM8QZUIcpCbPr/9BY?=
 =?us-ascii?Q?0JbCW9X5zh/fMrPE35jwCJVITGPrDp2A8f9pjw2VSTYn0LE2QjirCjI/S9kt?=
 =?us-ascii?Q?lkZEyfI7aX1TK0PfzuJqdfqHwaYJbQrOYU+pfM0X/8uOdxH62qKxvKKe3s4D?=
 =?us-ascii?Q?yEN0AR5vga7knpwX47UP2le4apMKZbzSk8mh7zQ9yHo5y5Pyfvg1m+5FQQfQ?=
 =?us-ascii?Q?v4TOTtPFetie2kg66tIUQ0vS2zb4rlkQbubp0EhFwx50MQpsxr7CHVKW5yWi?=
 =?us-ascii?Q?vN8N9/agHmGRrNk09S0YGtJFiMsqAPJAOsbhBiqA+Ta0wePRE/7ma3EofyFW?=
 =?us-ascii?Q?aX/Mmy/anwR3A7EtCqMfc4bwX4kG4curXdnbKoqE0gZTCw5ZsADwc4TUGBbX?=
 =?us-ascii?Q?DdKC13FMv8Db2j7FmRp7afMnutBiAm3pmlHqA5cXpgCRC/MecTX99vRPnsCH?=
 =?us-ascii?Q?of28e6mxSPxp8YTcbJz7lcB8ug1Q7btyekelHCpM7ak6ctXyA8mT43zkChKG?=
 =?us-ascii?Q?LdHVAFGAlql9PwtHjPU/XMQIdg3WYt0j59+g/zlrwtHdNoyiDSAn1Zj1A/X+?=
 =?us-ascii?Q?qmHZhUodTpilO7YBA98Xl9JNE+5/dvlxBZ6e6PWcBY+bptTMpDDcHOiobRK4?=
 =?us-ascii?Q?mnwkDtfE1s0uTSEvSXqv0ow9oRpqoAgnHPEMqAXIMRNLRzFBlA=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:22.8155 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 892461f2-dbd4-4751-79c4-08dcf98979db
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FC1.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6154
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

The macro GSP_MSG_MAX_SIZE refers to another macro that doesn't exist.
It represents the max GSP message element size.

Fix the broken marco so it can be used to replace some magic numbers in
the code.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 3bb6b161c9b7..8d7b884f5adb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -58,7 +58,7 @@
 #include <linux/parser.h>
 
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
-#define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
+#define GSP_MSG_MAX_SIZE (GSP_MSG_MIN_SIZE * 16)
 
 /**
  * DOC: GSP message queue element
-- 
2.34.1

