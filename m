Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E649ABA718
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A37710EBCD;
	Sat, 17 May 2025 00:11:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="msfd5r5K";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2082.outbound.protection.outlook.com [40.107.244.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3F2B710EBCC
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:11:16 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RN/ps+wF+BR7UI0ekSWpixatWZ+fRFdTei8poIwM611RvCWi2c/NSfTN97kQJnCs2zbCbiJvMFPZoTtgxG1uh9HADOEdEROw0AhlXES+ICo8u+fUZE3+Y5GAvF3UefiOBIY1M92azBOQIcTEgO/zSNg9v0MnC5vse4xxcmaZb9o2n7O/6AzulaQ5bLCgLJKhYA7P5J1bn47eGbZlmTYvawQJg+k8seXdcIHi+7zCP75TS+fXaYHSlgti2/GC53VeJeoXTZs1c8Q4a5swZbux3bS0rn73vWjMqHgsLNihsAKNRjdjaa3HbFvvHPZ+YBVTINBImA7gTH58txsph2gjPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0jvsT6SUIi63IxAoH9RA0WYkC1eNreJDyMr8DY38z5w=;
 b=PcOd3nX1kIE6sPimL/1QVYjslC0UmdOYU1DSxQYpV1EKtuDSMRTqSNIqGOSAtz1kV3W5Gr5+kHFZD5DhJwjLZxIsAPmbVsjJjLdn7zCm4DQy0yHHYyB3Bp+Jvy8j+qAHOO5uJ5jostvIUH8vWgvzU3xDTIBP4v2kGGn0bjjBz+pPbBlwagE1otlvoJlEUaIBiE5CdXRxCuMA31ISVujU4qfsK9LWU1gzzMVYKPe2SRIaI6oHn/5vqrIaCDPHR76NRQ5Jv/Qs2oGSkJG2o8Zpp1ay/3Kw/SJqfPphEnhKWmw+KJdUpqrnppxFAeBNIwhapobVEd1uuFMAfEAl9ikM/Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0jvsT6SUIi63IxAoH9RA0WYkC1eNreJDyMr8DY38z5w=;
 b=msfd5r5KrVJK8NfoDHHpyvqSFPsLPVqZiHZwhKhfin0kMYV/665NsVbQDWApkM0G8MjHjEnAKcb6gIuexB/WmpTCRC9p85nNURgLczX+pyvX6jM2ThKiFCG/LfvcnJtXpJmMstNjYAoBtGcKuhxdyeZM7Iq2b5xQ72eoDpAayFPtILi/E8+d4Q+rMjIzZZuMBaARTzcE/YcJ0NofV922rTGmpR5tV841CeBj9DToquNRBt8KWOuE6VY2ZzjlOKtWinkoAgp6/ID61wcUxr0cD0W0MfgTpgTgNCv9hogQoGXCiUAcsTRoTARZ3TqPeMnM31wA9dSv4ioJv2Ky6R/tTw==
Received: from CH0PR03CA0118.namprd03.prod.outlook.com (2603:10b6:610:cd::33)
 by CY8PR12MB8337.namprd12.prod.outlook.com (2603:10b6:930:7d::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:11:11 +0000
Received: from CH2PEPF00000149.namprd02.prod.outlook.com
 (2603:10b6:610:cd:cafe::a9) by CH0PR03CA0118.outlook.office365.com
 (2603:10b6:610:cd::33) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.17 via Frontend Transport; Sat,
 17 May 2025 00:11:11 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF00000149.mail.protection.outlook.com (10.167.244.106) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:11:11 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:58 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:57 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 34/62] drm/nouveau/gsp: add hals for fbsr.suspend/resume()
Date: Sat, 17 May 2025 10:09:26 +1000
Message-ID: <20250517000954.35691-35-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF00000149:EE_|CY8PR12MB8337:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fbbeaac-5996-4841-5334-08dd94d754ba
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t0XEgA6daZN4yMJ6wHOvcrdzn7lYDKeSna1kKCSZQJVt/iCYOnj/t/H7oxXN?=
 =?us-ascii?Q?9MHIlYnAO6HC9HkKBrC+Bo+ofvrjBX1WNbjpQa66InHBIHwAoS0BMrKZnKv/?=
 =?us-ascii?Q?wUTkIVTM2+74xRQsH5S0QMPDW8O3XrejuSqgzVrUX6Jnw6Ky8udmchqBZvzQ?=
 =?us-ascii?Q?Hrp/SizS0/67T02T7t9oKKIbwEAcDhIwgLpVEb+TUfypzvf08m5PlWFCzqwi?=
 =?us-ascii?Q?tzUtLcjuJyzh0HLBtSDaleu1BvQoyU1p00pKUR9Ok6RSyuv5CX+2oMHd5jk9?=
 =?us-ascii?Q?vY4AzjJGGj43OH0W83v604EPbASmIqf9jTahGIM5U3HYvPRDzlER5XsgQmrf?=
 =?us-ascii?Q?Aiv60ZC7B5kmhPbm3mgOXUnl6Tvrhw7lkRInUXQALddXdbJ5E5VbbWa3y+wK?=
 =?us-ascii?Q?m/x3q0lGQrozbCKsxNTKnYAmSvbxNJwP2dFB0MR0vw6yYcXttTOZC+l2vE9i?=
 =?us-ascii?Q?pMMP4gCyWteAkFS2SvM1KRVOJWqe+zyRcFHgd0qkzzOuOp5gSmo3zsKMR70I?=
 =?us-ascii?Q?kiRly31QhG2wFIxKQ0SkEf9CiaPocSoTDwPmJs7aquw94Ytg6G3ySc8ECmiP?=
 =?us-ascii?Q?ra6nmNQieGnJRnMB6W0LiGaW56d0e5/0u38+UqpEuTmvhTP67m3bVpmeyv2Q?=
 =?us-ascii?Q?f+pO7AobyfU9tD40oYiogA9sSzdErun1UPdZ1w0q95VGu+pCFgPSkjK+e25I?=
 =?us-ascii?Q?LQNI8UGC6ZpKc5JTCttq//RoVcYSCrD2gi7sUlaJEd7AjOVwmafwQZavu+HO?=
 =?us-ascii?Q?IBcw/B++i3MeQQpfJ1KM7qhaaprqMTLU+aJSMjv1N/zEiRVr5pnqVuXSlcx3?=
 =?us-ascii?Q?ira2BrdANz3wlBbzzoK/VKs+lReWwLnEVruiKuWQjQjDVN1gVu/GRJMljBP9?=
 =?us-ascii?Q?yVWcV/hBTdnIFsY6GIlBuXEY6NC6MYFFPcNi1LYI+X6yDJNO1FKpbHFPjVlQ?=
 =?us-ascii?Q?alzLKDJJUTX0VgHvrijceQ0Qyo6lbCIyNYEnXc/hWa17DciMXGBmP1pEHlsV?=
 =?us-ascii?Q?423GNmeRILgeXpZmfdsiqymR3CLbaz2q6LQn0xPM2otdBWUVzANoNPdnrIx6?=
 =?us-ascii?Q?8YgzrV15XWle7M3xFcY8EfRNFoUnfhH6+xM4R9kotTLR28om0BeN9B06TCni?=
 =?us-ascii?Q?TghUkuDQR3IKhekYt5IKMIMKQx3ui5HqjaW25ojsx+gnGI7V+/btQ9aALh1b?=
 =?us-ascii?Q?RxA9jAO0wSLMO8GKo9NI5SIaI0y8gzjd/gGsBEzakz7CQdbtdQmxTPd1Yloy?=
 =?us-ascii?Q?QQGapyH+9spMTdimdprVnWvyC4u7RwY53lVDzX0FsnEV8TQx9eMU9GGLSMWf?=
 =?us-ascii?Q?ZaLTT+d4P2REaq1rSsKEPjlr03+ob2sxKHxH1RAMs3dgcfckLoFD3iRYajou?=
 =?us-ascii?Q?lp2icHY0HK4IBs9/deXO2sF/GzRRDYglelBVu+q1M+sJxW7S8vRlUOEDJtDZ?=
 =?us-ascii?Q?chRbsysYM7tE2xEEmlTm2dvEJ6SBUcfqaFtWO34g+fUiqQu+A3a1Uw8ns2UI?=
 =?us-ascii?Q?MIXHqXjdRefB7ki0mGRv1doXkKVZhPraevSB?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:11:11.5321 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fbbeaac-5996-4841-5334-08dd94d754ba
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF00000149.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR12MB8337
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

555.42.02 has incompatible changes to FBSR.

At the same time, move the calling of FBSR functions from the instmem
subdev's suspend/resume paths, to GSP's.  This is needed to fix ordering
issues that arise from changes to FBSR in newer RM versions.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h |  1 +
 .../drm/nouveau/include/nvkm/subdev/instmem.h |  5 ----
 .../nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c    | 29 +++++++++----------
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 11 +++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  6 ++++
 .../drm/nouveau/nvkm/subdev/instmem/base.c    |  8 +++--
 7 files changed, 38 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index ef781c4ca11f..40e1b5300dff 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -133,6 +133,7 @@ struct nvkm_gsp {
 		struct sg_table sgt;
 		struct nvkm_gsp_radix3 radix3;
 		struct nvkm_gsp_mem meta;
+		struct sg_table fbsr;
 	} sr;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
index e10cbd9203ec..7d93c742ee59 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/instmem.h
@@ -24,11 +24,6 @@ struct nvkm_instmem {
 	struct nvkm_ramht  *ramht;
 	struct nvkm_memory *ramro;
 	struct nvkm_memory *ramfc;
-
-	struct {
-		struct sg_table fbsr;
-		bool fbsr_valid;
-	} rm;
 };
 
 u32 nvkm_instmem_rd32(struct nvkm_instmem *, u32 addr);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
index b2f22bd93f4e..0e436c4fb4e0 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fbsr.c
@@ -201,21 +201,18 @@ fbsr_inst(struct fbsr *fbsr, const char *type, struct nvkm_memory *memory)
 }
 
 static void
-r535_instmem_resume(struct nvkm_instmem *imem)
+r535_fbsr_resume(struct nvkm_gsp *gsp)
 {
 	/* RM has restored VRAM contents already, so just need to free the sysmem buffer. */
-	if (imem->rm.fbsr_valid) {
-		nvkm_gsp_sg_free(imem->subdev.device, &imem->rm.fbsr);
-		imem->rm.fbsr_valid = false;
-	}
+	nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.fbsr);
 }
 
 static int
-r535_instmem_suspend(struct nvkm_instmem *imem)
+r535_fbsr_suspend(struct nvkm_gsp *gsp)
 {
-	struct nvkm_subdev *subdev = &imem->subdev;
+	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvkm_device *device = subdev->device;
-	struct nvkm_gsp *gsp = device->gsp;
+	struct nvkm_instmem *imem = device->imem;
 	struct nvkm_instobj *iobj;
 	struct fbsr fbsr = {};
 	struct fbsr_item *item, *temp;
@@ -256,7 +253,7 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 	fbsr.size += gsp->fb.bios.vga_workspace.size;
 	nvkm_debug(subdev, "fbsr: size: 0x%llx bytes\n", fbsr.size);
 
-	ret = nvkm_gsp_sg(gsp->subdev.device, fbsr.size, &imem->rm.fbsr);
+	ret = nvkm_gsp_sg(gsp->subdev.device, fbsr.size, &gsp->sr.fbsr);
 	if (ret)
 		goto done;
 
@@ -265,7 +262,7 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 	if (ret)
 		goto done_sgt;
 
-	ret = fbsr_init(&fbsr, &imem->rm.fbsr, items_size);
+	ret = fbsr_init(&fbsr, &gsp->sr.fbsr, items_size);
 	if (WARN_ON(ret))
 		goto done_sgt;
 
@@ -276,12 +273,10 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 			goto done_sgt;
 	}
 
-	imem->rm.fbsr_valid = true;
-
 	/* Cleanup everything except the sysmem backup, which will be removed after resume. */
 done_sgt:
 	if (ret) /* ... unless we failed already. */
-		nvkm_gsp_sg_free(device, &imem->rm.fbsr);
+		nvkm_gsp_sg_free(device, &gsp->sr.fbsr);
 done:
 	list_for_each_entry_safe(item, temp, &fbsr.items, head) {
 		list_del(&item->head);
@@ -293,6 +288,12 @@ r535_instmem_suspend(struct nvkm_instmem *imem)
 	return ret;
 }
 
+const struct nvkm_rm_api_fbsr
+r535_fbsr = {
+	.suspend = r535_fbsr_suspend,
+	.resume = r535_fbsr_resume,
+};
+
 static void *
 r535_instmem_dtor(struct nvkm_instmem *imem)
 {
@@ -313,8 +314,6 @@ r535_instmem_new(const struct nvkm_instmem_func *hw,
 
 	rm->dtor = r535_instmem_dtor;
 	rm->fini = hw->fini;
-	rm->suspend = r535_instmem_suspend;
-	rm->resume  = r535_instmem_resume;
 	rm->memory_new = hw->memory_new;
 	rm->memory_wrap = hw->memory_wrap;
 	rm->zero = false;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 0c05a0448766..64e9ecf93441 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1730,6 +1730,7 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
+	struct nvkm_rm *rm = gsp->rm;
 	int ret;
 
 	if (suspend) {
@@ -1754,6 +1755,14 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 		sr->revision = GSP_FW_SR_META_REVISION;
 		sr->sysmemAddrOfSuspendResumeData = gsp->sr.radix3.lvl0.addr;
 		sr->sizeOfSuspendResumeData = len;
+
+		ret = rm->api->fbsr->suspend(gsp);
+		if (ret) {
+			nvkm_gsp_mem_dtor(&gsp->sr.meta);
+			nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
+			nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
+			return ret;
+		}
 	}
 
 	ret = r535_gsp_rpc_unloading_guest_driver(gsp, suspend);
@@ -1787,6 +1796,8 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 
 done:
 	if (gsp->sr.meta.data) {
+		gsp->rm->api->fbsr->resume(gsp);
+
 		nvkm_gsp_mem_dtor(&gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 43cf44bf3abb..a4190676e1ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -28,6 +28,7 @@ r535_api = {
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
+	.fbsr = &r535_fbsr,
 	.disp = &r535_disp,
 	.fifo = &r535_fifo,
 	.ce = &r535_ce,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 3d677e5bdd2c..ce04ed9e3c27 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -73,6 +73,11 @@ struct nvkm_rm_api {
 		} event;
 	} *device;
 
+	const struct nvkm_rm_api_fbsr {
+		int (*suspend)(struct nvkm_gsp *);
+		void (*resume)(struct nvkm_gsp *);
+	} *fbsr;
+
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
 
@@ -113,6 +118,7 @@ extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
 extern const struct nvkm_rm_api_client r535_client;
 extern const struct nvkm_rm_api_device r535_device;
+extern const struct nvkm_rm_api_fbsr r535_fbsr;
 extern const struct nvkm_rm_api_disp r535_disp;
 extern const struct nvkm_rm_api_fifo r535_fifo;
 extern const struct nvkm_rm_api_engine r535_ce;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
index a2cd3330efc6..2f55bab8e132 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/instmem/base.c
@@ -182,9 +182,11 @@ nvkm_instmem_fini(struct nvkm_subdev *subdev, bool suspend)
 	int ret;
 
 	if (suspend) {
-		ret = imem->func->suspend(imem);
-		if (ret)
-			return ret;
+		if (imem->func->suspend) {
+			ret = imem->func->suspend(imem);
+			if (ret)
+				return ret;
+		}
 
 		imem->suspend = true;
 	}
-- 
2.49.0

