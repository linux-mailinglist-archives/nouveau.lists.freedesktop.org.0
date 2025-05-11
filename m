Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E4BCAB2B66
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E573A10E1EE;
	Sun, 11 May 2025 21:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="IXQmFMF1";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam12on2077.outbound.protection.outlook.com [40.107.237.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EDA4310E1EE
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:10 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=onhwX0wWG/UYUpAaBB57EX1Dsikk3RErzU4k9e5rzWpRqgjkeQ458X46Ug6G0hgbrDjdz9wIugRa5PtciIcFAlrI8YKK4MVir/mGt+5oIP88wPD8FYV8U7z+D6wUWLzLUUzpzzunjAH9LT12P/3IJSt7dBqvWGsTGjg4//IDrp3KfzfAxpvZ/XWKgLC23NVjfbKAS/uZLLPTdafD4J37rwrSxy85UO2czh9R/j3yektOxYdEYO0n5X6WISvTBxkiammXpKBzUkhzGxEEMUbptggtLhx/1OaGzuN5GUSCOUaH2DnsjSwRsPqkwTwGJBQqbrEWycPVbx648qLFeTaQcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uK74XdqvXTFiwI+ZD4rhTQ7Mz1b9g/6gNYXR/36esfI=;
 b=unl3MA6t2F6uNBWDbtG0tIuMsDa6mkn7TFW7aWcb8/BrfqZwxhfdgYvijxa8N3Z5GWLzWEZY92xAEDlXCKm7vvkc1vhOHt7Tn4TBq5IPTBsnH7+i18tL6AJ7cr5Ec1Flj9sBE8sFGfb76Jub20TnEQW5Utrao7vHDgXGQRQJ42tZl+EUDPRV8Yg8+G9bAYBSwJLXTxmRS9PkpPCiw7Cy4EsULJ/zR5OxBEDvqc06OAblvMgmGj2MTULlyGyHyQzThJOM0qNWJjx8sb+XJyutB9cXr9glF3QTOUMcRRaKzFN/7+QMQDv5+ahXmn07iPlqPOWchseCvzWvAGG+jYNKvw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uK74XdqvXTFiwI+ZD4rhTQ7Mz1b9g/6gNYXR/36esfI=;
 b=IXQmFMF1uUZa8lqQeNFhfzSUc2UdRnLuvmX72D+NuptxMurMHilQhV+FaIbdc7He117o+04BN8rEiI6IFraFR7+XNseDj6QJc+GbPoS4WZgAtpr4TspOJU5yJboTmt2w2Ec7uIvlFcRd8OmTds/4pbesAszV0GB2eBSTYEB9kNuHsVNvJ+d3AijicWIbEltsdJSqRJYi7PA9DgeFP5IbzsGjsu4/NpSG85AKtiyzlnIWE5+iBxO0DjqRng/GPucVDH1GlOiHdc/cHSqWmjZ5br3nnGpa2W+2N7rcaaS8I1G5cw7Jep5krSCh26VtIUH/EdivzOiPZUfM0TNoi29a0g==
Received: from DM6PR07CA0067.namprd07.prod.outlook.com (2603:10b6:5:74::44) by
 MN2PR12MB4189.namprd12.prod.outlook.com (2603:10b6:208:1d8::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:05 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::96) by DM6PR07CA0067.outlook.office365.com
 (2603:10b6:5:74::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.21 via Frontend Transport; Sun,
 11 May 2025 21:09:05 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:05 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:57 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:55 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 32/62] drm/nouveau/gsp: add hal for fifo.ectx_size()
Date: Mon, 12 May 2025 07:06:52 +1000
Message-ID: <20250511210722.80350-33-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|MN2PR12MB4189:EE_
X-MS-Office365-Filtering-Correlation-Id: ebbc9585-3ff0-4cc7-ab33-08dd90d01018
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?thy533fDtU6dorZRWyE4VC12GW8zVg8fiT8v7g6Fztabhm+JXM1Jwb5yAiAC?=
 =?us-ascii?Q?MtIHWJyU34saoSB7Ro9YCLzDbQl0OYXpMaZDwcV98kBs928BTYZ0LCISe8w4?=
 =?us-ascii?Q?A+NM/sMu4ygdaDeKLv9Xu6E4TmeQpJpQ9V2796vRNSsL5gHFaQrBRVPKy1sp?=
 =?us-ascii?Q?YXjDpuUW++Z10VP4q/msOpYHUXnUeNWZKjNwIIUnln9QvnyLsdUbg7H2tJBP?=
 =?us-ascii?Q?DHJXVgCYCJ8P8DG0Iz//8UnU8krvo1V35kX3lghLdHujMnmUbovqdlHpTt+l?=
 =?us-ascii?Q?g321ncumq2a/1kczNDApN4mOvekZ3Jaeu6Dbux3hDM30hJVb9WlzWhDcCmDm?=
 =?us-ascii?Q?O3wkv+XrsoIuEi1jTvY+xNxh01Qc2Po0L+mBF5r7bg8AnPl2RYGMOD/ICxyt?=
 =?us-ascii?Q?9aU4vikuIXxMFog96g+TQIDxdNIsbFbj/Q5aptJNdtLplz4mGZgpfmxbj+lS?=
 =?us-ascii?Q?+yPDOfeq7RyN0+9qbgg0apOQFVn0d8XQMrWXrsyO0E+6kkViLAjveYT87YeD?=
 =?us-ascii?Q?icoamwGtb9mxPN1XiY3pnygBHFW030U/S54v9vUn2TxsAQPno4PAS3gw3NYj?=
 =?us-ascii?Q?FydO0n8g0UXNxTKfVUQEBGNMiJFaPoWOAyRIN4uKY8+/74e9CbJg1OncdYSj?=
 =?us-ascii?Q?a0HnWQN6OcRRovx15M8IP3v0Fg2tcHz3jD8Z7qXJfWvF3Q34HdT97LS8uWb/?=
 =?us-ascii?Q?f/AtnUA7JRhsKUQDen92fOB3zE8EZX8KWJbSiu+pbqfm/7M439o2HouxQkZu?=
 =?us-ascii?Q?p+W2VQDzSsttKjSOUM54I+DXAycvPEJhPMhbSD+eHHwcFf9bifKJnGhnueHP?=
 =?us-ascii?Q?Qitu8MiAF0wesA6J+AgBOMqEjoG77JKArzb1wWE0YADa5/Dx4yL5EwHEvqDm?=
 =?us-ascii?Q?cT+tGtx8J8uHOdQwIa3LV5E9RuMMVeAn4jhvZgPCAR915NO814Kl6MH2qKoH?=
 =?us-ascii?Q?EPfgpZeW0xDrCYIrOO+eNCD+7fwXaWuDLmbiRcWllFvf4QzFX2eWFY1cSTUj?=
 =?us-ascii?Q?aZATJRy95vyHAHbQldNMibgIeesuc5klXou07SQptz4tFjao5B+sSENL+AKD?=
 =?us-ascii?Q?/7K9bdvXqbCvaQmUV/ElMQBEWSPTsztaUhj6zJMpR5MSpK9TbUS09qaIqm4K?=
 =?us-ascii?Q?qgvFy5ARtl/u89PzFLcGotXKRQwQVQy9r0CE52Va8dK5ijgcKeMAL7VYnXBe?=
 =?us-ascii?Q?iRscFAEE8++mXl9rioquo4c3vUpWqvQmMclM9//Dj5IYR14nXVdKJ2n89Py9?=
 =?us-ascii?Q?qaXOpkkcW+cs8p5sh6diF9VWChREOqC7dNp60TrqkCtl09wzej0et2R6jRYa?=
 =?us-ascii?Q?D0ZLiixbDCmmPeXbYpEkdqIZxM/dMF019Y5865QKg6YhwUK9FAX2drsDn+Yu?=
 =?us-ascii?Q?Z52GXoRhiY3rPVEuzun56oEtGtalhFZxPHHWt0MdI+CD6DHxrj/ghg6vyjgj?=
 =?us-ascii?Q?Z1vmqze0OIm+JCq3ZxPTWlulZDIVo5S1k9hH0mqE9aJF1fO5k55o+dCmowcM?=
 =?us-ascii?Q?FTMTlAnglmAQ54C/VvnOYnIZ3wxKcGEWeOAq?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:05.2683 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ebbc9585-3ff0-4cc7-ab33-08dd90d01018
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4189
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

NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO is moved to
NV2080_CTRL_CMD_GPU_GET_CONSTRUCTED_FALCON_INFO in 550.40.07.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 9da7e0fc70ea..125e6faaa94b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -622,7 +622,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
 	}
 
-	return r535_fifo_ectx_size(fifo);
+	return rm->api->fifo->ectx_size(fifo);
 }
 
 static void
@@ -655,4 +655,5 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
+	.ectx_size = r535_fifo_ectx_size,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 23a9a2043d9c..8783c21af0e7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -89,6 +89,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_fifo {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
+		int (*ectx_size)(struct nvkm_fifo *);
 	} *fifo;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

