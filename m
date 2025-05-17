Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACDF7ABA715
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53A1C10EBC8;
	Sat, 17 May 2025 00:11:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="KeVsb2oz";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2054.outbound.protection.outlook.com [40.107.95.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A04F10EBC3
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:09 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=q1ebkNWKsYsofwglm36yQ1VrZJpY+DUNrpGxoNkd2TFiZPXz3xsjmhtAqV0ppUkw49xPFKdgkMglxS0DkFo/fULRsb/qb4nfMG4FTqsWn1ayDtbQ9PYCjciw1ZBdfgG6glqTx9o5Tui1rWjuElLIA1NQxiCMsm3iJaov9UKROj9wv3Mf/xwcmcjmT5kOMyMgLERne45SxLhtYtq9xYGzSjwmbhtU7+ceiKsVitLKpZKMkSN3jgxHp06HRnUqc1YAp/ExVBGBoUJQ0LVHG6vSPulq7FewbKlQLn95a8laQurzGRkZVfbTaEiIaYT5v6GNMGhX/B3bBAeXsRENHlfWQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=utkVoiX8yxfONzkFsqFwoHIt81KsbPWYnNbAtmqb1eE=;
 b=sYN5CNMJcwNm30GlrOzZ/NF8vBRth0+rKWyg5lXtKleUxWlYPWC2sf0eArwhy8In/NflkNpxgAx2Z4TJTsgzesIsnHUnApXMIfEXdm+BwoYiL0Xfpha62RnYXQblrV2Ca1IPb261KGMEsVLlRJ8QHXt3Ii2hNFO6BUzYymE6GQluFFPZGCAj4H7lgDX+qH2CHjIevoeJylZXtzqC57SYQOKmJ1z0GC5c2g6UoahcypEVdgwZC2pnN+RLzcAROmCzXvmLwKa4kXK/amPLJcP6WMYrg1F7r999Sg6Rx5z3YgIT110KRQ4LtAB/Oy36wpkJSgG0Dsy9Lm9SuNnR8ZDEUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=utkVoiX8yxfONzkFsqFwoHIt81KsbPWYnNbAtmqb1eE=;
 b=KeVsb2ozTSGZ5LikUgwxKH8amCXXQ/0Vpk9kIgTlEYy5niPUvRFuqotNQ/VT4uII14n3A86PeP1N583w1z7kk38NSJTqFv9eIJabtMpumTgKFH0ZDhKl56L8Pg+upnIsXuOZNWVPujiNLFFONTTiNfIJAHf0vlqFxHo7mK2EPQosygR4K6GF3UAaOc94akjbT9gvQjRrVFBUm/qclMbEv1eAk2c1ryHeJmMqtIpisETEYS/1qlhAR9wYqdaW0MM5XdqWfGTXEaRmqZ1Jf73KJi3Am69xAjqqiwqR1l2uUnGBuR4OVvndbjhc17NwsP2X4cYrac5aMtxGt2A22+2JAQ==
Received: from BYAPR06CA0070.namprd06.prod.outlook.com (2603:10b6:a03:14b::47)
 by DM6PR12MB4353.namprd12.prod.outlook.com (2603:10b6:5:2a6::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.32; Sat, 17 May
 2025 00:11:04 +0000
Received: from CY4PEPF0000FCC4.namprd03.prod.outlook.com
 (2603:10b6:a03:14b:cafe::dc) by BYAPR06CA0070.outlook.office365.com
 (2603:10b6:a03:14b::47) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sat,
 17 May 2025 00:11:04 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC4.mail.protection.outlook.com (10.167.242.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:03 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:51 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 29/62] drm/nouveau/gsp: add hal for disp.chan.set_pushbuf()
Date: Sat, 17 May 2025 10:09:21 +1000
Message-ID: <20250517000954.35691-30-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC4:EE_|DM6PR12MB4353:EE_
X-MS-Office365-Filtering-Correlation-Id: d2ff9732-fbc9-488d-1d22-08dd94d7501c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|36860700013|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?JTVP/hMpe1HmwJ7dEtLRGQIpsVsv2s4fzDnOu0Mo5wvGZ1vxUwxw1wTQAYnB?=
 =?us-ascii?Q?Cc6+edrMBMLmPS9U1cPcsu6d7Esj+vhEpQa2UpAq+CGlQTQ+Sud9WMPeQFlZ?=
 =?us-ascii?Q?Pu3UqevsVp6e3arqV2AE48a3nn4J2U23uidnBstL1F6zMmZ06shnL2Sl5wNw?=
 =?us-ascii?Q?kve1XNbVawKXJG0jvy2nqe02U8+K6JFy27Tj0ZlXDCv/YeqBN8DmxDnNDovp?=
 =?us-ascii?Q?OsRDLQS30zNH2nY3qVqcRd8cOT2NGzoRj791qvZLNJ6t9BqoWEk3R8giSetb?=
 =?us-ascii?Q?eQAa9Q/lOBZRM5kkbPXknO49fcTBS7j74nm1GozAJahAzzo4SEe6qLF5d7vy?=
 =?us-ascii?Q?FW7TP1qvc8hkRHigcCVNX/be3BMeRvlL6EclzoIE47AlAHZPcGRQ+bM7op+L?=
 =?us-ascii?Q?oFnptpKWRj6ilyXMw0KM9OP9I4HFxeXeiMCoT5kDeDErMcmcTBv3MYD3S0vP?=
 =?us-ascii?Q?uQU9W9tJ56dOfUp4NuUplNowEK3muq3t42t05bEdnZ5skZxtFEcOYkkFVSWQ?=
 =?us-ascii?Q?TzY+JLCAuIxJEppAXIlgg4PD8m6cBKCPVBN6FObx11mBZqt0wyMNqDsR6H3N?=
 =?us-ascii?Q?ozSkRl5T5eYGHndRHucQeiheI5YtiNporpS4vPEXKjRf5F0h/PdD9asWxETu?=
 =?us-ascii?Q?5ouTn57Yn70TqGYfXpTnJfkYjKSiDypmDw5uRaygFCvaSbUvmes4xfM/Pg+S?=
 =?us-ascii?Q?0rSiv4TstWa7QKy8+B3pVTZew9hYwixrAABKl/7LmKvMTLz02pJZs1ukczWt?=
 =?us-ascii?Q?dac9ZlV2OlQZwjS+i/Q7kqmiijkRyTjFjB2pJ6eXNIPMsJldkJH2OLwqADC6?=
 =?us-ascii?Q?qCK0WqLCwzOoQIFwfPq1Ng8OC4HqHwH6sKDGSBDHwSPvt6OjflF54w7W+4ZJ?=
 =?us-ascii?Q?OK/PYYTgiRstiF/0hEmQHtEboM7eP1xDXQWYYK2KN9xFmG13obvI9SAeZ1Ag?=
 =?us-ascii?Q?OURlcFJBVhCzfYGPjjoisaYvzMXxCrm7XhPEqurE3DImD6OsIv1ozb0J51fX?=
 =?us-ascii?Q?GJZfQ9WEEgBrWOxtNY6D18IXcbF9DZCw+gS8CiN8Kx/u1nOm2YoX9vM51lIF?=
 =?us-ascii?Q?x3NtSOAs6XJqAYbDeDs7V7SCQNVPeThIAibxgl1u+JrdFn2yCzgiwuHAZbxD?=
 =?us-ascii?Q?rAXnoEl9bgJRc8IOYypVJW2MyCTwCrSxnHfbrtKcHKwg3PrUdYddyoyVQB8w?=
 =?us-ascii?Q?hUw05qWxB5omI1QpBtaXCBS3AFpK0DYDuPaZDaRyjkQqeVj8SgACxs3k0a3t?=
 =?us-ascii?Q?FlLMu1q2p1Z9GpqnDd9q08rv6BuyTBBr36fmrtvGj21Q6xiSfN5vku4BcaKx?=
 =?us-ascii?Q?mYtl12GAcuQbkTrTzhKtNoWTUYodHSue6Gy0u1JZ2HqiqJ5S3/lTVvitiP8s?=
 =?us-ascii?Q?aYW3FscyjUu7sGDpfvZC8OKlydpRVbX9euHmvHZ9URRpqD5Ua8CAKjOqINuu?=
 =?us-ascii?Q?okUXLIpMhnFXVJHaWW3FJbqUbkDf+hGxBwibhR44A39fMiNyid2puL64U5iG?=
 =?us-ascii?Q?U7jRAWNntVXDn8kzc3+uPuFkkdpheys2NLKb?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(36860700013)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:03.8224 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d2ff9732-fbc9-488d-1d22-08dd94d7501c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC4.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4353
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

550.40.07 has incompatible changes to
NV2080_CTRL_CMD_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 27 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  5 ++++
 2 files changed, 21 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 82fc159ec070..389b2738f711 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -70,9 +70,9 @@ r535_chan_fini(struct nvkm_disp_chan *chan)
 }
 
 static int
-r535_chan_push(struct nvkm_disp_chan *chan)
+r535_disp_chan_set_pushbuf(struct nvkm_disp *disp, s32 oclass, int inst, struct nvkm_memory *memory)
 {
-	struct nvkm_gsp *gsp = chan->disp->engine.subdev.device->gsp;
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
 	NV2080_CTRL_INTERNAL_DISPLAY_CHANNEL_PUSHBUFFER_PARAMS *ctrl;
 
 	ctrl = nvkm_gsp_rm_ctrl_get(&gsp->internal.device.subdevice,
@@ -81,8 +81,8 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
 
-	if (chan->memory) {
-		switch (nvkm_memory_target(chan->memory)) {
+	if (memory) {
+		switch (nvkm_memory_target(memory)) {
 		case NVKM_MEM_TARGET_NCOH:
 			ctrl->addressSpace = ADDR_SYSMEM;
 			ctrl->cacheSnoop = 0;
@@ -99,13 +99,13 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 			return -EINVAL;
 		}
 
-		ctrl->physicalAddr = nvkm_memory_addr(chan->memory);
-		ctrl->limit = nvkm_memory_size(chan->memory) - 1;
+		ctrl->physicalAddr = nvkm_memory_addr(memory);
+		ctrl->limit = nvkm_memory_size(memory) - 1;
 	}
 
-	ctrl->hclass = chan->object.oclass;
-	ctrl->channelInstance = chan->head;
-	ctrl->valid = ((chan->object.oclass & 0xff) != 0x7a) ? 1 : 0;
+	ctrl->hclass = oclass;
+	ctrl->channelInstance = inst;
+	ctrl->valid = ((oclass & 0xff) != 0x7a) ? 1 : 0;
 
 	return nvkm_gsp_rm_ctrl_wr(&gsp->internal.device.subdevice, ctrl);
 }
@@ -113,10 +113,11 @@ r535_chan_push(struct nvkm_disp_chan *chan)
 static int
 r535_curs_init(struct nvkm_disp_chan *chan)
 {
+	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
 	NV50VAIO_CHANNELPIO_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = r535_chan_push(chan);
+	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, NULL);
 	if (ret)
 		return ret;
 
@@ -166,10 +167,11 @@ r535_dmac_fini(struct nvkm_disp_chan *chan)
 static int
 r535_dmac_init(struct nvkm_disp_chan *chan)
 {
+	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
 	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
 	int ret;
 
-	ret = r535_chan_push(chan);
+	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, chan->memory);
 	if (ret)
 		return ret;
 
@@ -1747,5 +1749,8 @@ r535_disp = {
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
+	},
+	.chan = {
+		.set_pushbuf = r535_disp_chan_set_pushbuf,
 	}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index b9c775aec58e..a8f070871d80 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -79,6 +79,11 @@ struct nvkm_rm_api {
 		struct {
 			int (*set_indexed_link_rates)(struct nvkm_outp *);
 		} dp;
+
+		struct {
+			int (*set_pushbuf)(struct nvkm_disp *, s32 oclass, int inst,
+					   struct nvkm_memory *);
+		} chan;
 	} *disp;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

