Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DA2AA3CA0
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 474C510E5AC;
	Tue, 29 Apr 2025 23:40:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="eHLQUw05";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2047.outbound.protection.outlook.com [40.107.95.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 895B910E5A5
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yq7ueMVmQ41AS+LrY/jZdxMtVIKD6AOwFXCzhnN5QUaa3lyzmJ988uHuF4ylFDNU2TAKwl9YKUG+Cx/MmXzXynkgKGF4hxVIw/I0nVW88akaBVun5WU0RIKbNfZQubJtk5IMYXjvBkdbkVj+qVJPElfuV0Dij1QpT44Vh5UYr98a7x8sfd2AJeTa001YGX6QOfxSgvMRFAQqqlmTeXNsf3RppE+W9BBBYc22A/H+QD9w/PfM4fpjGEjVA1gvoRqvOI8erRjotHXAgIVp8xTQvOuPRwhcd1W0IbgJyAVZGjpmkE0h6NOtndAX6GriNjHodfCV/Z4l67miHzehxk8ruQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j4WoreLGTTwMWwRoqj0HiYiST4x9CNFLqO+62QdHzUM=;
 b=T8oTRi5DbmdLzGPbI/AM4vRXmGl60xpKRUiMv0aRa4uXYs0zmtLYURbI1NvuW8HwGvu6y5PladC67BRGJX9HWJXNOYHG2z1snqGTg/IO8lcIn5IeeqeRyzwAkXqBSN9gz3kUtqiGXgI8YVZJG2qFkKjV/MNAnB7lLedf59N3L/Tu1A8wU44Eg+1ilQlOb4NfFIARKjW4tldw/8o2aWB5DGD8DoCVT99Dl7uswZ4QQeUzclYYnyCxxhy7cogzJbH5/uRAw/XrbvZAnreWiQSeqy8lBcfL6Vi5P2DdCwoxRzNM/qTwOyz6AUJq0qirRiGXHUPumhFfnul2sQXJTRDN/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j4WoreLGTTwMWwRoqj0HiYiST4x9CNFLqO+62QdHzUM=;
 b=eHLQUw05kfHl6BvNZRGu6AFjAJtcNWdrjgTedlrN703ZahnEXVyF+QAiQyJipSxgG7snJsQyBtmdKVuig433bYikPOW6wEe7MTpzkWXp7ervbg+IlqJSdLptVJp3KpFpYbnFsrbtjc1vYYXb6cUbywibCErJ8RxrwWkGC+zX+hLe8qSa1sZddtOuEQ+s1mg1gvlizXvNM0aRIQj0k7zX/ExlGnk87pZKni8cBAncRp/lOaYyZUau6QgM7SHlbmlCjsPDqsBIFoyBjYsp5YDX3Vc8Hfw6kLIFfduy2ulUKAZJZtH6TdDbpZQlHlkTW3bo/KZvk10YWFqZhOzLroJSrw==
Received: from SJ0PR13CA0195.namprd13.prod.outlook.com (2603:10b6:a03:2c3::20)
 by BY5PR12MB4244.namprd12.prod.outlook.com (2603:10b6:a03:204::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:49 +0000
Received: from MWH0EPF000A6735.namprd04.prod.outlook.com
 (2603:10b6:a03:2c3:cafe::99) by SJ0PR13CA0195.outlook.office365.com
 (2603:10b6:a03:2c3::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.18 via Frontend Transport; Tue,
 29 Apr 2025 23:40:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6735.mail.protection.outlook.com (10.167.249.27) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:48 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:30 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 42/60] drm/nouveau/gsp: add hal for disp.chan.dmac_alloc()
Date: Wed, 30 Apr 2025 09:39:10 +1000
Message-ID: <20250429233929.24363-43-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6735:EE_|BY5PR12MB4244:EE_
X-MS-Office365-Filtering-Correlation-Id: eb0fec0b-918d-4e12-14aa-08dd87774518
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|82310400026|376014|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?Jk9VGZzKuT2C/FZHdr9zoDagr/NkBQ+yszBaVxmGQ0xmmbc7NUmA+bWmYItk?=
 =?us-ascii?Q?m84RJf27Ia6QkKg//i2xBWzO3HLyKyfK7mXTwhFFevdWwZnkRlK28PnfdBQz?=
 =?us-ascii?Q?V4dyp8TiIWhvFZx4X96jpVmrfNnvJ3XR1RkwgcJo2slW1AIbCrwaWQEAfpqj?=
 =?us-ascii?Q?z5PSlJNtFvC7tx0QHUqLd8ldHGKC37Qbnn3pHVyAyzI/R2AHYGfkCMm/2gML?=
 =?us-ascii?Q?UIAUM0OVo3l7ZJtQsEyq4G35GZIJsCOHsr7cmjZm9LDswQQ6Iia0NiLcLyn2?=
 =?us-ascii?Q?hBAd/KQz1nBklSA4+B/3ZnoBWYzeyi7DWHHbgoQmHBWbU3jJuzLa/Od7s5O0?=
 =?us-ascii?Q?PmVMvQCgbOdR/Q142MlbqyMyirsOXyqGRR5xYlMGCvTdFkR9+0RC0IjtjDYH?=
 =?us-ascii?Q?BziII8k9pKpb3ZvZNCmNvasCunrtOSuPQ2hEstBfkwn2AyIGhf6pXO2AhMFq?=
 =?us-ascii?Q?anpmgirF4ixWW5HJMmyJ7ECJMV52vjJUEPWxj7BpQCoPVMJzPMwgFTmVKfiB?=
 =?us-ascii?Q?0qOuTGSQs2OhEGGkUWJ2Zn2O2Y/o2XlkIRjZHIdX6DcAFXllhXrRnyfYKOr+?=
 =?us-ascii?Q?HbxZIVohm9Japca3YTpt7wn5POJIgTIyHVP4xPUTZCmwriWAN81aG9AY04Zi?=
 =?us-ascii?Q?3B/qRZZP/e3/SQ4GMW/eGqW+pfKeWtcc40VCAdp7EGLeaxA9ikCBMRaiMIuG?=
 =?us-ascii?Q?yKX0QYd5YxYdWhcRN4biX1MDk9XC+/gyFRszo+RbwpO7tHw5wHy0Yj/WQemd?=
 =?us-ascii?Q?gt/fbFoQRoDSwz0Jj30Px/HHDQwTfRWdKnmTcXC4vDCK5KUB5r/IZ3ohqAFZ?=
 =?us-ascii?Q?5w3tUbRXzIVyebIFTMVplnEZ8hGdW9+ldHbDqrczNa63mIJ+wtreKAoR2mQB?=
 =?us-ascii?Q?NB86iFDyl57NZ7AGD2SJCVJ+JGK+oU2YYSBLFnddlVMLrrYUhuQ1YWJ5W0tV?=
 =?us-ascii?Q?j778G8CbVfxznLeOh9brdXI4OtOXdJq3bg9al+xnj7PuxlCLEQQIBpL/HrzP?=
 =?us-ascii?Q?3tHVfahfZOFq74mn/9aOzKk2QB5jtSd/whwHaOLrNS/4xGR4KNApLj5IKs8h?=
 =?us-ascii?Q?5Ox6Y6C214gYrUKK9vmaJR+puWc/mB5cXf1LKE1pdzmYa07JsO0yPa/tInV6?=
 =?us-ascii?Q?G9t5g1aEWU/wNnQ8ybUZ9T6uq5EfCCkPcHfP6bbESVYMc3pAbSJArCLe5ly2?=
 =?us-ascii?Q?/WwI4Dt5irdfd7KI3w2j2eNvstYzK1XPb6spnOyua03IJdEwuaBCmFvPv0wO?=
 =?us-ascii?Q?llac1rG96HPsbBBSZAx6ZzkOBPQRwLvBHZN27Z/dFwQE2T5waGA+QRYcvKLN?=
 =?us-ascii?Q?3bS8qcNoiPqoCg+ttvAGut5NlCx+aRFGTRWTSwcerLK/1Re5W/7SawRAAOtU?=
 =?us-ascii?Q?sWFpvJ1/vtPUqbi3+MM83HLCXww7Nuww5mJBEOcBnFQVucYrP17CXvLnKm8s?=
 =?us-ascii?Q?E4XNPZUERcQchyTDkWNurFZkpLASCY7JD3sdI/doasSS0ZlB1jX3A+CjhQez?=
 =?us-ascii?Q?lroit72pPoy5ozpXHazeICfoLSL/n9DC1pzQ?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(82310400026)(376014)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:48.5101 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: eb0fec0b-918d-4e12-14aa-08dd87774518
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6735.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BY5PR12MB4244
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
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 31 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 ++
 2 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index ef463a890483..9109beb0766a 100644
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
index 263513a52bae..a115d24f02cf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -93,6 +93,8 @@ struct nvkm_rm_api {
 		struct {
 			int (*set_pushbuf)(struct nvkm_disp *, s32 oclass, int inst,
 					   struct nvkm_memory *);
+			int (*dmac_alloc)(struct nvkm_disp *, u32 oclass, int inst, u32 put_offset,
+					  struct nvkm_gsp_object *);
 		} chan;
 	} *disp;
 
-- 
2.49.0

