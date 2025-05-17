Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A031BABA723
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46D9210EBD8;
	Sat, 17 May 2025 00:11:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="pdg0icef";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2053.outbound.protection.outlook.com [40.107.244.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 58A3810EBD8
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WP13zKojg4AfbVytfom9wrfhpDrRUvsA/FzZPu9uZY67HU+iBonIeTD0sJz0AK0d5MnuFXUa9qy4SwxAxDK2yXrkH/E4gKtUtdtLnjz6QwJ2bDDGlDZuLw+4d545t101db+6lhudZ/GEW36NL/dKHql9JMJAJcxbsWsmlGwdR+NHrs/COL/cC6ddL6LcuAMvS0QZ0cNDpF0STM6QbtAgD3QqVCDlwHR5C6HbyrNvQhzIIbte9giZf6IgyUzA9UPRevbI3zLCLi1fyWqQs7lfCwdghZ5fy3jCsAYMehkU1gkqpOkXWZfDo26tH5Xxjp1qMfh9Z70dPYUZMADkhGDOqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PTZTt/bOGfGMqHLZTrWFLaEtw4T+FRTGOd8eJRnkY0s=;
 b=ijoB5Vf4Sl5SwyFIHg2ayozmGrrHXd8Trs/hUtIdMbd36briTe5QP06Aqh5E+lh0miNMs8Ad+nQG6KdUDv4xaGXukDcHQYQux40dMwr0NKfmxu7nic2f2EtVWVyipVp7KobWD4jZJcYhZiwahlYPrIwSBUOfw8Tp4KwTQNGTLSZy+f+NM4WHarfbqJqsfsxoN27oVx/XtQLflccvK2i5UWVE8LLsLx4DatL9hhVhhn6V+upDqqCo/77IgaxwQOv5fvqH0zguealyHz9Y0ZJ+U9xEkMEoHs0pUoZUVBHpDJZxk5c165q101xvZrzTWTX7QZSX8WFztQ1j0wenet0svg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PTZTt/bOGfGMqHLZTrWFLaEtw4T+FRTGOd8eJRnkY0s=;
 b=pdg0icefu3ukG8R1QjDATgrFrcI+mCa0PCERE5d1jzxaXAjG5sWQgTTCvQYv6f77wK9Q+u+nMaX3RfMSlz23Obi7FQKT0PbO1Zv08FbwFqbkr9nVHjYzfCTskl8epRRy1FF1srIl/SM9kZ0kbnADOd8NFHYQe0ZpR7RUFObezrrnfErmv1mjGeUBCG0i5U6rjPht62PdF3bTjaDE7/VenH5n9uboAv0CsiMXZ3f/yXq6T5+5hYMrTU54wEwZfZFO9C01MFrbSKx48I0EAcMn6aOHBCK0FOMC1ZxauvmYcVN0HCJMrfIgVcxhU75Tf8KJtqKuaaUkncU24uTdd+Uy6A==
Received: from SJ0PR05CA0175.namprd05.prod.outlook.com (2603:10b6:a03:339::30)
 by PH8PR12MB6673.namprd12.prod.outlook.com (2603:10b6:510:1c0::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:26 +0000
Received: from CY4PEPF0000FCBF.namprd03.prod.outlook.com
 (2603:10b6:a03:339:cafe::bf) by SJ0PR05CA0175.outlook.office365.com
 (2603:10b6:a03:339::30) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.18 via Frontend Transport; Sat,
 17 May 2025 00:11:26 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBF.mail.protection.outlook.com (10.167.242.101) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:11:10 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:11:08 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 42/62] drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
Date: Sat, 17 May 2025 10:09:34 +1000
Message-ID: <20250517000954.35691-43-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBF:EE_|PH8PR12MB6673:EE_
X-MS-Office365-Filtering-Correlation-Id: e7b1e9b1-26c7-4d01-f128-08dd94d75d46
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|82310400026|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?UElmOH+UtKA/IBC64W37b/aM7fylA/k78Y8wQkynL3XUBQPH5sjQyP9aIsk7?=
 =?us-ascii?Q?iCFjX6dDzCuFDrg/Qb8wJ3GLdCZoA7gIuRH0alB7j2l+tkF5ZEwgbN/8VrFm?=
 =?us-ascii?Q?13G5oVmRyAFZlwlehze1RM/JvdcDxUzUIuRTtj5D+f+aMeozQDJvcmeqdYQR?=
 =?us-ascii?Q?ObDLiRQVZf62WXpq9Pw74qRWpqbBPqbkQ5SvrE9vk/sd598ORKu7gu5VoP6N?=
 =?us-ascii?Q?OTG5yJFHzil4gPTsCbnbpY8uS7YcncEJs/Cou/dIT4q1dOVImg6u7myRdTwg?=
 =?us-ascii?Q?Zg93N+jJygm0SnbusayFgTKx588/mNM7GT2TXl9ieLRBXeD3LymYzYmZQW7P?=
 =?us-ascii?Q?ciWdWAWmAlej2P/WGCAx18F95RbUXbP1svzPgqTy/XXu9vJgN6kl3RalWhwC?=
 =?us-ascii?Q?SRKBzmJ4KOjvLfPoEdisqQKbAiNTQfUoyZIby5ZvpQ1IRmm0LaKtb1qcx/K9?=
 =?us-ascii?Q?OOyuJzg78PUmW/fnsEi5bRiIeUWTE/8yQuELm/KU4Rr4aq1OFmdAkxlNodpV?=
 =?us-ascii?Q?iy7KI8YyYyULyDcs9gy3NeI2C+2Pq3L7rYL5cXOKYuylRK8mRqC6ShZn0wEn?=
 =?us-ascii?Q?rBJsFqjirJn/mtLhruwbGEpLbLkyGcdSMzt9fItYeCfWmh/gGlgksrYVH1Uc?=
 =?us-ascii?Q?V5GPRjDtBhMy9Imrs5LR1KLbleUXBzFXF/MlZeghccGdQciRIT2eFL96ta21?=
 =?us-ascii?Q?qlMQBNI4WjUI1CMCNBZzhWfjgM5c3YTyRLSj9/Da+KtvyvWWCa5Fu9/BJcJS?=
 =?us-ascii?Q?fFL1XfC6xrTuS2m6KEKmEDj+wwRa/d8bbXRmYwwnHDQIkr+AC/cGSTJXbqb3?=
 =?us-ascii?Q?4Mhz1iywVXuPG2XXly40pHv/vMc5EtthQaOHIk1ZRdBsllKSM0c6n9Y6w88A?=
 =?us-ascii?Q?rqgAFTDNoMce24FTANq8go4bhda/ayA0abajld4yvMFwYOwNyixgW6CqHFpW?=
 =?us-ascii?Q?uyHd9q31olWGpFEnvzBnHkmBr+xD9TCZHSuBZyuW031YrekDj6XSyOhTSsx3?=
 =?us-ascii?Q?saVIIjB0/cdpVgU07QWfecoHmMq2fTGYziMdZhpqCTua+UYDDMg6d0Zir3a4?=
 =?us-ascii?Q?awWa1NH6rWRMdTNccLLzJClAJq5Zk6CXld6Cv30YEJeBpHKntee/2DW9+71J?=
 =?us-ascii?Q?C1ipNnFlrAi4pA2+y9yK9kr6STR67ABwlKrgv2Ul1g+KWMt3J6UY9USHz1p5?=
 =?us-ascii?Q?iNerIfAUowyYP0GRQz+wCOSCHumU/EqlFqfz8wdLM4zONrNrKScPs9I+i3VC?=
 =?us-ascii?Q?XJ/jAPkDLPpAHMaL7njIJSh6c7amoffoZTFol1h81bhLH7elvmDwcVN3b+kw?=
 =?us-ascii?Q?tVsUxnTuk9DQ/E9hxFjnScJVt0mDIauBrMk8tu9Qe0ROYN2kHCQIW8xJbP36?=
 =?us-ascii?Q?zudxzIOH42XLpcSVqyaGXgQl98EYgNbeSC9eKMDlUM//Pr2bYYao4b+bHQ9D?=
 =?us-ascii?Q?GMW9eAS8EP3jO9QRO5i7F7GRHd1VGdV6NtKRSegpmPDUlsXTzt0fVPuiVtre?=
 =?us-ascii?Q?Eo1LIzU4ROzwI495cj5SKVjTq4/gPl66mpOo?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(82310400026)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:25.9223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: e7b1e9b1-26c7-4d01-f128-08dd94d75d46
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB6673
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
index 14187e1618b8..7e9e2d3564da 100644
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
@@ -1780,5 +1788,6 @@ r535_disp = {
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

