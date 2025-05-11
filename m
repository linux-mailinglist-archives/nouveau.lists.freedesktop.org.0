Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECA4AB2B61
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B30A110E1BD;
	Sun, 11 May 2025 21:09:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jN3Fsakj";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2057.outbound.protection.outlook.com [40.107.94.57])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 563F110E1CA
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:02 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=h9Il/PESRyhEsA29fu+Ong94nZI1YX29oPgi5qzydqjuPV9yCakeUM3n2tKlOmqX+OiZ5vkJF8XfQEFDan5/hxk2KQ9enD1Oiq9xMZsl/8OoIbybu6k1jDLOL1SkegAllOV8GG21S3SSYqgbizfmP77D+zAgyscYaRQuBkeeVmdApqLo9GEYcAGSYlQ0BEQG8g3cxT0kz3erKxlfF11U+MUHxtIYMrCvgM8U1crGqdcvErhSWEhZ6C+M2OFGrxW8iusHjB7WyVbBqrzHavlT5m8Cx/2d4TrTHPSkMb91ALZxMMuuK1BCcfHEZyGNloQtX1IkHQd9ArR/uEBV6HEZqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEDzVk6wY+4LXeGpIDKgqkf9eWoyP+SyKFd44qO/0ls=;
 b=ATnMTxoFgLB8X/SZa5aUHxOVc22WV+IhHRa9nrCtnPttL2qhF71dDDdFzIBWZO0TkjQaiKj6yVY9Y+DMb2rl9cO0L6CB++mAapT+EnHFbWOxOzUJIHZ/2umLnmuD1siFvMQesITy4byUCFIG8v4Gt3ZheE+gR7FBqDesfRy88c0VB9lVBqu4nIL0M5yyQ3gSWE62CZYyLrao5Go+BKfnFmg5tBcQWcUR2E83EpcWKStOBiCQLo9ALpnpTmH1Pz21WqJEZZKqzRxuMu8+jMbrCKDHq47sSqEL4rEQ893L4hQ5l5svckrku7eUsvZr4Ok9JwkChhv+k5H64ji2aChRmQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEDzVk6wY+4LXeGpIDKgqkf9eWoyP+SyKFd44qO/0ls=;
 b=jN3FsakjGtc2/r5h6oTNPfnItRkOgV+dL80/POTS5EMihqNjTpUvpEiV/0me0pfkDEXbXrMATmduqyE1fBdasbWZOudPl8uo93NQaUT4OP3Gj6m5LXDSCEHR94Tc5TmRdPQQWIVchl2lVZulhWYUFDhGQwEWNy6HXL3HDxKTzn6NLLY64tjFKuiJwWtz3sND0NzzEdW6QCvbSdP6fYXSKNhuvrvwltbDHshTRXp46/2Qbc0oVkQi/NssHscV8h75MWbmTMNHWUFj5t9paNwZCDhm4VixabdxJlYnXiu0GTSl8uZOxAEhXrKEtYONZwK0oXMrB7sCBobZLBATT5HtWQ==
Received: from DM5PR07CA0073.namprd07.prod.outlook.com (2603:10b6:4:ad::38) by
 DM4PR12MB8475.namprd12.prod.outlook.com (2603:10b6:8:190::6) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.28; Sun, 11 May 2025 21:08:59 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:4:ad:cafe::52) by DM5PR07CA0073.outlook.office365.com
 (2603:10b6:4:ad::38) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.20 via Frontend Transport; Sun,
 11 May 2025 21:08:59 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:58 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:50 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:48 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 28/62] drm/nouveau/gsp: add hal for
 disp.dp.set_indexed_link_rates()
Date: Mon, 12 May 2025 07:06:48 +1000
Message-ID: <20250511210722.80350-29-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250511210722.80350-1-bskeggs@nvidia.com>
References: <20250511210722.80350-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|DM4PR12MB8475:EE_
X-MS-Office365-Filtering-Correlation-Id: 03075e6f-8182-468d-125b-08dd90d00c39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FZJzoHk6yVoiwwjfShvCNw8wPV6ZQA+6wxSSQqK8N+sqeS6B3qHDJITtpwFk?=
 =?us-ascii?Q?D2KIiRP5KryC3Rx4gh5qnmQlbD6ONP44QT47nmeWrypK+a4s63QOMqG2lMvl?=
 =?us-ascii?Q?7xg7ynFQlAfI22SeAIsGVENy/wlZV5clXqbHxSwSu1MJkrkiX5jgOeSJFSSO?=
 =?us-ascii?Q?Pc4yjvkreSi2oqKeHfHHzLx8LmNNTrHT8LOeXr9gIUVXRY/qsHjEGVegJLrH?=
 =?us-ascii?Q?GQkFSbMFMFsDYJl+9fRlsbsUrTwX0iYSCbyHlqEQOHKpUmb1wAXHuyN//YuV?=
 =?us-ascii?Q?MPaGAeF44+dEUn1wrcSDYULR4f61K89pqdM6EI/MWNgCemrI2KqU3+CxjOXS?=
 =?us-ascii?Q?KOOH1nZ7v1kFSN4gQU8weRc1zXtDBvwN9bs7gTKknOV7yFOWWjKZqUOi+KPc?=
 =?us-ascii?Q?Yx8ZXcYvxR31QxFMsTFbOOVucmDnkLMBMNIWOD6Jaj0Zj2Lpl/A8dOXF59LL?=
 =?us-ascii?Q?R8S+pUV4fneFpVnJ60ZloSnk6MfqhtNmKys4UEoHzNaqONcXja1kQKP8RDWv?=
 =?us-ascii?Q?CLOUeWPPhSyd/zUGrMinYKBpEfKsV/7GtxGyFgjBD9gvvPsoyg7/IeuNgjo/?=
 =?us-ascii?Q?WW2j5gSjtoJkh2F4QQ/aiGz8gONbgRdnJ0VejwQPq7gqzy9JgblBvlVDNJ5U?=
 =?us-ascii?Q?B0dqak+M6SPQCZuQLwaICnNiBk8gSeZiAgQ2XeTf0TReZq/cugDvFCbMAOc8?=
 =?us-ascii?Q?3ufvwT+cKHjIWl5st/lIJBEssOx4i7lALT6Z4YizdRJ94MxBuUEUCCCFq1Eq?=
 =?us-ascii?Q?IM72suMpCo7QKsGIodFZZmBv1BcFzOxzvgZwYr2INZ3XLB2DD3BHQwwqL3T3?=
 =?us-ascii?Q?cV+A8lukVraKYeada3jSMWBrUncElkzpqjv4f0N8JJiPvskHJznl+4Q8W1Ix?=
 =?us-ascii?Q?yKI+806wyHbmSPrGZMPkpYpOSWZ7fFohMV7O47hL3/dQc40iRw4M7IJZhpQR?=
 =?us-ascii?Q?RRINh3EUTJtKMBKW6e26utru/rmNuwlewgRxy+NWJ7ZZG5/Uy/5Me8MQHd9M?=
 =?us-ascii?Q?F9Ldc1V3/DiVJwz60197IbuWDFQ+UEn1ox7WDt+9WhVt8p5BZK032G/W6YFJ?=
 =?us-ascii?Q?I+7x+aiQp2J6R2MN1QLSnZ2rM/StLiVKi99VW4A4NP5v6cnhqYf7u8YPPaWv?=
 =?us-ascii?Q?LPfrGT4xmNkuGOOoy/R4FPYmCOxFWNLUbDWexeaxgAtobwX3eVSvfq4BrirX?=
 =?us-ascii?Q?DKK3ZdKq+fXSm9i4Y02PrQf6Ra22ILRKI5SY0MexsaZhPQcbdTdH40I3ILXs?=
 =?us-ascii?Q?8Ehk6X0ckMY+CHtfdtiEsx/VlzvEFi6jC4zDjOcY4/x9mxRt16DL5qjBFaF+?=
 =?us-ascii?Q?VRqAWZ8WdorD8RFkXrVUUkJBtC9LDo6EhDFHYEUAbISVe/n61P6DSIAXg9zQ?=
 =?us-ascii?Q?IrHy2ECVnQZW4MsM69Gwj7bODxv8fs5IRKoaVjPh7rNkLOR2Img8jWh01RUx?=
 =?us-ascii?Q?9Cm3Lz62Ghs1fJxthC0Udu3ief9ph8iHO4SNJZ2dYGqGhxpdulrDGUUkFZU/?=
 =?us-ascii?Q?1IVf0qzhA8TNUUEU6yYm4B9u02F16QpJsKBZ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:58.8087 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 03075e6f-8182-468d-125b-08dd90d00c39
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB8475
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
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 21 ++++++++++++++-----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 +++++
 2 files changed, 21 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 25079029f8c9..aa7df43e8a12 100644
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
index 2386e419be62..9df95c5b9961 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,7 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 #include "handles.h"
+struct nvkm_outp;
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_wpr *wpr;
@@ -72,6 +73,10 @@ struct nvkm_rm_api {
 
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

