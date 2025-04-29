Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9481AA3C89
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7647F10E582;
	Tue, 29 Apr 2025 23:40:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rfyhlCmw";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-SN1-obe.outbound.protection.outlook.com
 (mail-sn1nam02on2040.outbound.protection.outlook.com [40.107.96.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D33B310E583
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p/JV5Rj/vf5UmKztq4NBv61EZrwEH1/h23sZZRxEJNyWYd7o87Mu+bcYjYlIghIBSGbzEmkM6pu8U9K2VqMnlR2MQKcGWyTv2lyKjE9j5J4CVsfK0t0Io6Ubqo5kbLcEWWgJuJ4Ld7Txsd8oKspXQvTbPQQcNQQr9OcPqJsU4PFlZeQ+5vxL6h9XOS2J1NNHAAPKMlxXQ/Jt7vUvzDhj3dnX5ypElPCKc1HMU8ltFsViTBDYasb8EcQvMZ2HUYLI7Ji+nQ7qJZjsVHKqvDU2WFskjua2w6Oj7TDTNIG9zNJ/wEjOE2FDf9nS7AVliqsKsP6by82I6cubqs2F4zERYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mTFchcYoezj33nDpqWJDSDJ8DI7PK4hpjBpshX/3uHA=;
 b=YqD/+LviShHG9wJ17hglEGmLcRoO6qabsB7+6cbAwsgcAeJb9RNrRd9itw7Au/IfjzDpXpm2c9M0IjlK7wg/NFjAClpDQCh35py+7bXdKpGC5bcPA8oZDa9qgvpoKicLPjdSlxTpr6Ae/rP3C3/qPoDnObH2eLYDcsU7WxlfVAqGn4ihe38/mZkS07JDV0y2VjBEHgCQozg4vqYlt9YqoQEaSvuzVi8nZcNKfrJIwXLVgYw5yZdjZlkPFco8pJ01mtqlzo3fnpV0yULRnOIVsD3cVvknHUox+L7ldykIHsIfMQyvwCRZBDP+MR/gRai5QCXlTus9DN4SFsZHrDyCJw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mTFchcYoezj33nDpqWJDSDJ8DI7PK4hpjBpshX/3uHA=;
 b=rfyhlCmwPH96hQy5Dv1NOivOPg6CiscQ3xDCLpsiMyj2BAJCgYBYsf2pojqg6jQnlBHvSZQ+dJK+aY3cTLCS9xPqTEjXTlThadf/u5KuD2NK3xgqozDIob0PA56iLeQbcX0nAhetPahTwB8eq2WQ6Y1haq0Pkmi7/7Ooou41Rr51c+MO0cVpWItzCnd2Z5tloLAdqchVxqb7h/tkGHCYQTXZqodxF8Bjuuwlkf+8GU07oGGt4vWeiKJ6qLITFP7rODairs+el0sgbZOKvapnqdLO5CHZ24pB/kPm1rZjBrykCVPceHPXWtJqeWWoODXVBMOhYiRDxBbjOY90nsI3DA==
Received: from SA0PR11CA0088.namprd11.prod.outlook.com (2603:10b6:806:d2::33)
 by PH7PR12MB5830.namprd12.prod.outlook.com (2603:10b6:510:1d5::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:28 +0000
Received: from SN1PEPF000252A0.namprd05.prod.outlook.com
 (2603:10b6:806:d2:cafe::38) by SA0PR11CA0088.outlook.office365.com
 (2603:10b6:806:d2::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:28 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A0.mail.protection.outlook.com (10.167.242.7) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:12 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:11 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 27/60] drm/nouveau/gsp: add hal for
 disp.dp.set_indexed_link_rates()
Date: Wed, 30 Apr 2025 09:38:55 +1000
Message-ID: <20250429233929.24363-28-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250429233929.24363-1-bskeggs@nvidia.com>
References: <20250429233929.24363-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A0:EE_|PH7PR12MB5830:EE_
X-MS-Office365-Filtering-Correlation-Id: 7e43bee8-77f1-484b-96d5-08dd8777386a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DQsOtmy6TQUDK1I9owDlEfK3wf5W5Gw0fSfoF0HgQRiidqj37XnwZP7cySla?=
 =?us-ascii?Q?i9q0pktRkRx350eFDnvg5IgozZDL4wEuWnvoa74Dqj4KTMYjh8UXHk2V9qF8?=
 =?us-ascii?Q?1P20cYBaBzrOZzICT2HcSWiaQ+OfKlPhHQh/RQql/CnJ5JXdcGroRcSoBifT?=
 =?us-ascii?Q?ZSzpGGMAQ3MOBrIWoDVaRWy8qOEwavJ9EZ9pgBJ+jaFyX3XaGvrAUluFZoBK?=
 =?us-ascii?Q?aBD1K/HiOrJcjQTlCm2PyOKcY0xge9f00BbLGbJoLYJau0nXdHqcOq0tHGVq?=
 =?us-ascii?Q?APuhtLxE6v5vTv+bWCMCGdsZRDQ1P/SG/wKBEmUYPl2dN12A7upYe0ipWdJT?=
 =?us-ascii?Q?byavJ8HY1qmYAnDrGfdpj/rnsq6aNVp6g5vQF1KKyz9gMGsCbDgkuw6WO+XK?=
 =?us-ascii?Q?HjEyh4jn9LyyLaZ4YWGp77lemmbdud9NPo5UFldU5y35s9vwuqwzelnlFdut?=
 =?us-ascii?Q?uSaSOdCr3xS+g/hyLdvGAtstiI837hxXwwCwp28VCgP0vqnBfn19wKCbDa5a?=
 =?us-ascii?Q?2Ec1PmzF6nGoZmI8Ajp2d/GSl+5ZHLpJoNegLn3l6XBA8eTeCaaoLiZJ/OjT?=
 =?us-ascii?Q?25J9RJ+KRr7sCnCaiyYeB05H0Zv9a23DeyBcI96Oy+vBpAs43X5KP2BVkryb?=
 =?us-ascii?Q?k0O9wppCW1rQ+5vU3lMTUBdbeBCN5WCBLgMI3KtTHuVsK8ZqzPG4KSI8Aaid?=
 =?us-ascii?Q?yNHJXv2sk+X8h+/guyOWsqaqmQD+3MPJlYpoOoGlbufNgNBRDfZZixodggkh?=
 =?us-ascii?Q?zDnnZBY4+EwkwYJR/pgmdsjyua7XCICkp+lAy6SqY70bswj1/cGPIpFk37WL?=
 =?us-ascii?Q?z4SamB/4/D4PDq+xD52aVYmmlI9QyZdUgY3evlpbtiqe4pHFQSPzcrYvxlB4?=
 =?us-ascii?Q?h3cYT/qsljXgzc8t2pzNpqEvRdaGQee125kNSF/pEDD3kS694M4dAR+gXbdS?=
 =?us-ascii?Q?iRUdmAELdu58DfvMiV1dhaXEp7rIx5Ckhun1e07IrVwsVxAolAyKL79BKvxi?=
 =?us-ascii?Q?pbElizr8F4CK4bIr7l405QhM4xh1Yy8jvDHMwoU+FzPMrt8falpkyWnj4b5K?=
 =?us-ascii?Q?ojtsaFd5sB63/Y4SoKW8cwQ2cVCCDMdL8WIpcNGFsdbXJH+3y90GTLX17Hiy?=
 =?us-ascii?Q?iE1t1OdwUHSZaOClCDjTPx/5JH3QvoBk0+8VAg7f02pPYXbvgQsQrtboWpon?=
 =?us-ascii?Q?jqyf5vI3ip4B9lNQeyswJxQ89lm+w59Sehz++mI2Aoj4B++MHUDgJrxOIrER?=
 =?us-ascii?Q?cxSuY2vhj8wO9d3ECMAVlDX1INHyKEaj5jA248Zuc2N5DwKACcm0+PsSD0yZ?=
 =?us-ascii?Q?LrJgEZFykHUF+509pSfj39VZu9u1OP8XKxwb2ThnQPa2aZz8DyqpU5IzW2wp?=
 =?us-ascii?Q?rv/Dmrd2bD/Uzu7UEgCKG8acVkuq/sL6Jz30VQVcq5fumDI0/1jR5CtXvsjb?=
 =?us-ascii?Q?rXLQowjcCtTpFRy9jjLJ24uHUXyEHXzvQ7I4mQCOtfpOCjGfMB3mOc57PwP8?=
 =?us-ascii?Q?2LOQnp6DkOKufSEgS8lDzUUP7to+JoXMxZ/j?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:27.2587 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7e43bee8-77f1-484b-96d5-08dd8777386a
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A0.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5830
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

545.23.06 has incompatible changes to
NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 21 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 +++++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index ad79e31e6aac..313aa46356c5 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1021,15 +1021,11 @@ r535_dp_train(struct nvkm_outp *outp, bool retrain)
 }
 
 static int
-r535_dp_rates(struct nvkm_outp *outp)
+r535_dp_set_indexed_link_rates(struct nvkm_outp *outp)
 {
 	NV0073_CTRL_CMD_DP_CONFIG_INDEXED_LINK_RATES_PARAMS *ctrl;
 	struct nvkm_disp *disp = outp->disp;
 
-	if (outp->conn->info.type != DCB_CONNECTOR_eDP ||
-	    !outp->dp.rates || outp->dp.rate[0].dpcd < 0)
-		return 0;
-
 	if (WARN_ON(outp->dp.rates > ARRAY_SIZE(ctrl->linkRateTbl)))
 		return -EINVAL;
 
@@ -1045,6 +1041,18 @@ r535_dp_rates(struct nvkm_outp *outp)
 	return nvkm_gsp_rm_ctrl_wr(&disp->rm.objcom, ctrl);
 }
 
+static int
+r535_dp_rates(struct nvkm_outp *outp)
+{
+	struct nvkm_rm *rm = outp->disp->rm.objcom.client->gsp->rm;
+
+	if (outp->conn->info.type != DCB_CONNECTOR_eDP ||
+	    !outp->dp.rates || outp->dp.rate[0].dpcd < 0)
+		return 0;
+
+	return rm->api->disp->dp.set_indexed_link_rates(outp);
+}
+
 static int
 r535_dp_aux_xfer(struct nvkm_outp *outp, u8 type, u32 addr, u8 *data, u8 *psize)
 {
@@ -1721,4 +1729,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 const struct nvkm_rm_api_disp
 r535_disp = {
 	.bl_ctrl = r535_bl_ctrl,
+	.dp = {
+		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
+	}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index d7233cd34114..1182f48ddb53 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -5,6 +5,7 @@
 #include <subdev/gsp.h>
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
+struct nvkm_outp;
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_wpr *wpr;
@@ -71,6 +72,10 @@ struct nvkm_rm_api {
 
 	const struct nvkm_rm_api_disp {
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
+
+		struct {
+			int (*set_indexed_link_rates)(struct nvkm_outp *);
+		} dp;
 	} *disp;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

