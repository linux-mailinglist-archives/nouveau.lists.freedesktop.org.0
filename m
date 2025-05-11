Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2AAAB2B70
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0097810E255;
	Sun, 11 May 2025 21:09:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PkU/Au0T";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A89410E252
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UH7E6Ckq+aNXwm010sQqYDxKnPFptAq2EyqvsZWkkWWDjpLJzpcljqThbLNI+1RhQ4sPzgTI85SRbOszdIAFbkRlVa2kVaEt4jb2rla+p/5Ovypl9KVSzGOo2/f6YG8uL0k7r4fdHzxkX3P6Q0y5VVplziVMEjcYZeZYB9qepLAs/NqL4CQPBKd3VlUMWL6WjQDoRWH+9B9OWGgpcXETlBJzsxavTnU/VPuyJHdIChMvh7RygmyxR/6s9bfYmMr/9tiHagr64PV9N6yizFOWKHvLNkBYubTD4hneMHcWFv5LHL3+30J9BDQsABSsUT3UpdBEMd5NGU9kvIe4bxqAKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Bjd66ehadf9/aqR53hfc8Wyy8GXiaJLlJnQ0vYAz61c=;
 b=R1mqc2MKKCGpsIzPqQ+ahhfX8Q87sYsBDU2T++Y3HiiFFtU+LMXrDcamUR6HKqsgmdHnRvy2/q6pxxYRYeLDfEHlV+cBg1pY8tC5f1zDu9hMqT7OU8DoJTC1WhXAmOT0IADPmI16/AH6f7EJRuDTg0kg4CMfDY2b917O5zgCgfYDJCm94zOf8Wk3boGErXDGkpZ13S8Z/mWwhIYSgzaacw0Ixkk5x1ZdgGjFd/gM7ijuhgfQzmEg4BoCCiNHOvj6ZxCVhOZz4Sh5JGvWMSCEnwf6GngUFon4UgI8Dod0TAI+eIziXQPCGt1pOGelmrzvSQCsHBovjuN5p2+hpYxZCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Bjd66ehadf9/aqR53hfc8Wyy8GXiaJLlJnQ0vYAz61c=;
 b=PkU/Au0TRtyD/PLheWoOS12jJuRRV51l9bbn8h7llj0g5FATClCUVNpLXJJmeSAsPae+vlMJ0987oDVVwCmWDLyyt0u5mZ4Nb0gmpYbxH5Svracdd+QFK6kwg+Vd4owWfmeNc88XUvse2s3sK0O4fwHP0OPilUKZRmwcZHFOg2BMGOf0yaYoL9oJhy4gCx2BRUAnwnINb2pS/sVb5pKD8fVjNWDq+TZjVlLRWK0FWre6m6aG8zZaJdAoq7NEmTK8u1mSkapHnCfSslffYVGvyVjbjEN1Okz9tO99KZ4sKQ5b4Uk5rXsKaTydKLSIK5DD5F6G8SUl+Z4ByRdaeUf+qw==
Received: from CH0PR04CA0031.namprd04.prod.outlook.com (2603:10b6:610:77::6)
 by CY1PR12MB9650.namprd12.prod.outlook.com (2603:10b6:930:105::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.28; Sun, 11 May
 2025 21:09:25 +0000
Received: from DS2PEPF00003444.namprd04.prod.outlook.com
 (2603:10b6:610:77:cafe::10) by CH0PR04CA0031.outlook.office365.com
 (2603:10b6:610:77::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8722.28 via Frontend Transport; Sun,
 11 May 2025 21:09:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003444.mail.protection.outlook.com (10.167.17.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:15 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:14 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 43/62] drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
Date: Mon, 12 May 2025 07:07:03 +1000
Message-ID: <20250511210722.80350-44-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003444:EE_|CY1PR12MB9650:EE_
X-MS-Office365-Filtering-Correlation-Id: 3383cf30-5a8b-427a-35b8-08dd90d01bf2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?mD6B9gSOpTGN2H1al1RL8x0XG+aFYqgp5905xWk+GLzw5bwcP6YGTedadgXo?=
 =?us-ascii?Q?XNZcH59Yr6QvTkbMYoOg2Ky6Vavsx6tbvWZeXek8pIrVPudtOEiWTjtFLI8p?=
 =?us-ascii?Q?PdJRFX6pi4iCbJSEhnZxgAZPQjhtMt0iFvKG4gw/Vrdbte0bdG9ejnhndgZX?=
 =?us-ascii?Q?p8qp0doO8t45jYj+eJU4IGLqQ0k2QZ+i3CgwHXIUfOnZpCP1lRqx55y9bacY?=
 =?us-ascii?Q?eczHzjLar4dIcqnRe0fqWBtEy1sAXnsc5t9aYzqejzmBagQBTt9q3ioji0jF?=
 =?us-ascii?Q?XDBR5WamylkRYtaji4cROFB3LT3GnIaf984hWrpRO+vL3WZ+gZuF6ZCmkmSv?=
 =?us-ascii?Q?JV4QTDasiIGjhTp9FPO06zTvo7Lb+FUuKmDl14CikWBJqbRKhG45oCXdArlu?=
 =?us-ascii?Q?swdmo+9y7w4lQE9SWPE0JdGzuDidfI2Hc62t+4AlAUSvq172SPJ4zzu58o4Q?=
 =?us-ascii?Q?WATngaESPZ+SwTKhQ+uOA9MP7DNp8M53SYfCfwWHg7pJ2w5j93D1ccKvAaP8?=
 =?us-ascii?Q?BlinChvzAatyeU86hMr59svYeXJGTRP2wUYdWABrZ8L+kHp162T1Ks3vbbm/?=
 =?us-ascii?Q?mMU992PUiRuHDdAaNoc6dxdpSvHKuWPpm4C1y4AuksMrCDlfQ158tZACewIU?=
 =?us-ascii?Q?UvkNtxYb1wIqbMlFv1e877XZwnu31uiOLW7cV1le/8qlmGI8qRaGMzoQQ1MJ?=
 =?us-ascii?Q?tCwx+7xzYlxfxtEpt3E1FA7BF/spL3CufbGV3n7fSVih67QO6rRKmeTQjc8/?=
 =?us-ascii?Q?kQO2sXbxCUwLFQbT24LoorZcPl6/Wtui36rm0WzMb6Vsysxi/A7Bz1qTjiWd?=
 =?us-ascii?Q?beYFw6pdXaeSItz0QTov0AFQWLj+91eGoH/r37R3fzKfVExBj/hGT4WT2zHP?=
 =?us-ascii?Q?+FI/8nZC7SR+S0kIpQh8aEAnh9AxsT67jqdiqj5jhQJRPPFm/k+5vGdoLbWi?=
 =?us-ascii?Q?IbJSuQ6nMR0+topblAdNglAWDUczIeO1EdyJI3fasC+Pz54+En/LYQIKnegk?=
 =?us-ascii?Q?4rl16Z8R0HACnLtkfNym++FVwfCiB9x7oOmNxuIQo7BwiVTjWcGVazFKWoZx?=
 =?us-ascii?Q?AkuI0UJeQBimFcGv4ivVyA9Tx4jU4ysjJjIyT8XzMOvi8YN2dQUkCuuxSumD?=
 =?us-ascii?Q?btZsj4WbRN/pcxiizoL1UuieWTYzlpYTWP3oeJ+JYstWxFgOX2OLsxI8ql2i?=
 =?us-ascii?Q?YPWGTNEAjQysLRPjUj41LnW4iJerZ9K6O7Qx7+1ZCg6OdLosRaFmI4leWjdl?=
 =?us-ascii?Q?KNP3ufecBdd8YATyQoleZZR/viAzXiBs0M8X7v7HQxyxkBVdbi+0W6BRMmye?=
 =?us-ascii?Q?iJ9zG0T3URtHK0iIm/8WJ2pw4y2GAyWf5jm3nFSDyTaCvin8vM9kj7/ka+tc?=
 =?us-ascii?Q?azBTJD3HposzW78g6nL665jKzMxGao+H5/fKc2Exrovab923eI+6nq+l7ncj?=
 =?us-ascii?Q?pL6rYJFooJcUsVn2bEtUYX2pz+C767FoNpnfNG3omuYTEpIHhihzsEzdehHT?=
 =?us-ascii?Q?Xj9w5xIVGuzwysr4OVQ5H62eSquGbzVdFhMm?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:25.1440 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3383cf30-5a8b-427a-35b8-08dd90d01bf2
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003444.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY1PR12MB9650
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

565.57.01 has incompatible changes to
NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 31 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 ++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index 195ee1b66dcc..6c1779135a9b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -164,27 +164,35 @@ r535_dmac_fini(struct nvkm_disp_chan *chan)
 	r535_chan_fini(chan);
 }
 
+static int
+r535_dmac_alloc(struct nvkm_disp *disp, u32 oclass, int inst, u32 put_offset,
+		struct nvkm_gsp_object *dmac)
+{
+	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
+
+	args = nvkm_gsp_rm_alloc_get(&disp->rm.object, (oclass << 16) | inst, oclass,
+				     sizeof(*args), dmac);
+	if (IS_ERR(args))
+		return PTR_ERR(args);
+
+	args->channelInstance = inst;
+	args->offset = put_offset;
+
+	return nvkm_gsp_rm_alloc_wr(dmac, args);
+}
+
 static int
 r535_dmac_init(struct nvkm_disp_chan *chan)
 {
 	const struct nvkm_rm_api *rmapi = chan->disp->rm.objcom.client->gsp->rm->api;
-	NV50VAIO_CHANNELDMA_ALLOCATION_PARAMETERS *args;
 	int ret;
 
 	ret = rmapi->disp->chan.set_pushbuf(chan->disp, chan->object.oclass, chan->head, chan->memory);
 	if (ret)
 		return ret;
 
-	args = nvkm_gsp_rm_alloc_get(&chan->disp->rm.object,
-				     (chan->object.oclass << 16) | chan->head,
-				     chan->object.oclass, sizeof(*args), &chan->rm.object);
-	if (IS_ERR(args))
-		return PTR_ERR(args);
-
-	args->channelInstance = chan->head;
-	args->offset = chan->suspend_put;
-
-	return nvkm_gsp_rm_alloc_wr(&chan->rm.object, args);
+	return rmapi->disp->chan.dmac_alloc(chan->disp, chan->object.oclass, chan->head,
+					    chan->suspend_put, &chan->rm.object);
 }
 
 static int
@@ -1775,5 +1783,6 @@ r535_disp = {
 	},
 	.chan = {
 		.set_pushbuf = r535_disp_chan_set_pushbuf,
+		.dmac_alloc = r535_dmac_alloc,
 	}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 1ca5b025eeb4..7aed7cd72e85 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -94,6 +94,8 @@ struct nvkm_rm_api {
 		struct {
 			int (*set_pushbuf)(struct nvkm_disp *, s32 oclass, int inst,
 					   struct nvkm_memory *);
+			int (*dmac_alloc)(struct nvkm_disp *, u32 oclass, int inst, u32 put_offset,
+					  struct nvkm_gsp_object *);
 		} chan;
 	} *disp;
 
-- 
2.49.0

