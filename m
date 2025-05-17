Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10EEAABA70C
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:11:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF83310EBB9;
	Sat, 17 May 2025 00:11:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rg6L8QuL";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-BN1-obe.outbound.protection.outlook.com
 (mail-bn1nam02on2074.outbound.protection.outlook.com [40.107.212.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6351210EBB9
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:59 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=SwXgRlueoF2AMRXnA/Jk19Inlpa1RQQipbfnGmCAEK1YtzgjncGb1x+x74K3cif4X91TvKXPwQCKUF3NE9+TUTGwnjuv+dj7lRgi42W/4E3ylnLpGR0JwoGAz+iihVoROl89sf7VxyMGQUlE3NHtdgJ4IMyB+5CkuoOGJNU18zQOw0IniBQnK8VW06EuhsKkCX/Sfr3fBc8G1QyVawuvorKyUHcgyN33kpESvgW3XIyF5e6JZGI7TOZMubQR/fZYbYLYYkQgyziLu+ezXPqnrUjkCb3m8D8lugQwMY6hkfyE0COeay6XDGaqVcoPcX2Jh2Kz83bBR/LeoJYuZd+Kjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jzMNcFxtX0CcWAirAaypg2UysiQJgFZRDRGtsSYkV04=;
 b=Hv+AkyHmgm6cU4gY0MUll0EZ12p0Hcm7cDpbKqQrXA25rZe9eIB2+YPQP9wmPm7HqctxnYCWM3JPTw+hiOorcETOQPzwmYfTHXWWkYmxTCJ0VGHiWa1kOcc0IdWI/GYkMuZAACqtLE6xjYSLc9JGRxE+wTr70pSrSs1Yf5Map9CxUqSRNLMyb8kwiU4o5u/rDOHHhVEWgdoaPtteJbNxSyGSLIifmEIGk5IYDtRuQgUyaCbB39OM6oDSPPwWwJQQFi6UqfQHTG58kJEJO2siquAHmiCh9WX1ubtgYF6SzW0YKBFTeN+4AZS1OK7vEEOn8Pa7JDfqLo6Lnhfh4k+4Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jzMNcFxtX0CcWAirAaypg2UysiQJgFZRDRGtsSYkV04=;
 b=rg6L8QuLwJxBxqcilZvtFs6V0IqPe8HgZDcAMvlaenes5s2lXLfU+RWL3crkq+7235qQ+lhlnOIHmAcPy/ibk/gRhdbrjUXAmvPFJiecXkRAq7FxLyoMq63qOUS4OPlU3tvjm9hrJnKZUXHKTEsRB/5gKJAU6MtcOpygMsS2RJWQmCQO6KhURY2IVhWNemtvCQ/eeLSKzep7xDLoxeXE938Cf4NRUi4gRIRosf8J1UFS4hdw8gDE0JenuPrhsaYDTodtVakVeDP+AWZZiNntwzP8Mu7r+YRMYZ+leH0OAAy3wG+yfk7yaj0Za3COHb1U6USR6mjjCWd8qOkctL0faQ==
Received: from PH7PR10CA0003.namprd10.prod.outlook.com (2603:10b6:510:23d::24)
 by MW4PR12MB7312.namprd12.prod.outlook.com (2603:10b6:303:21a::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:54 +0000
Received: from CY4PEPF0000FCBE.namprd03.prod.outlook.com
 (2603:10b6:510:23d:cafe::2b) by PH7PR10CA0003.outlook.office365.com
 (2603:10b6:510:23d::24) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8746.20 via Frontend Transport; Sat,
 17 May 2025 00:10:52 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCBE.mail.protection.outlook.com (10.167.242.100) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:39 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:37 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v3 20/62] drm/nouveau/gsp: add defines for rmapi object handles
Date: Sat, 17 May 2025 10:09:12 +1000
Message-ID: <20250517000954.35691-21-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCBE:EE_|MW4PR12MB7312:EE_
X-MS-Office365-Filtering-Correlation-Id: ff1e3f08-41e0-4523-9b09-08dd94d74960
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?v1XIvzT580wKkZ638s5lxhgDCjFwKXuGNHIWLRcS7anskGC6qmV3HSJeT7pd?=
 =?us-ascii?Q?MczOjsHLmuuay8/d6ARz4tgPf5S+E40/I/iIIZa8UgqKVHkshLcIr9LAeZnH?=
 =?us-ascii?Q?xaq17NVS+vSfz9TJTHReFg0KutJvSE45nWw3qgngTLvWpzsZT4BOJKChZ78Y?=
 =?us-ascii?Q?TS1A7D2yPGfiJtOv4Up1VYwr7bcb5M8IjChQn0ceenvZzFOfZCBvsQJHfVQp?=
 =?us-ascii?Q?5CcaKk0bjCnUmrqPRnVBEYNTzS0Z9zt1Fse+XRLC+LEKFy74A2o27+8exV37?=
 =?us-ascii?Q?hqiLXmnOpaLjc2f37K/2XhZw79C9P8geqc1GQs34e8FUe3+WGDC4sdII1OQz?=
 =?us-ascii?Q?7o2CslGKjwzRsrXiVENWS1zhYSF/37ZbpSjaPYO1bVSEY+ybsPzAiCHP3L0G?=
 =?us-ascii?Q?Psv9Olbpn5FM8ar0u9lwT5x1NUhjLpUQbeKOPtNKeIt1NgvaZfEVB6aARtlK?=
 =?us-ascii?Q?RQ9ve4EyuzBXAfDo0NEHsuSg2inmF1dvRSWPwmOL7QkGTWKLH75Rgd/VjPd9?=
 =?us-ascii?Q?X6Hpxssgtv8AD2AFqf8Cjap740wyTkOrCgDm57HHMlHMhJbHqDV5GAdLa5uR?=
 =?us-ascii?Q?5tBkhzwhDnf0mrYDkJ+/dNGvQR0t2ByhlCSI8wk63tOBqe6Zvi30lxQDpwaF?=
 =?us-ascii?Q?tKGI+tXQmJts8hHmcCmYHESidav7/wXoFVZuCW4R6Y8eceoiDRLdYRBoUV5n?=
 =?us-ascii?Q?wgaCEm95e9YaVItdV3YpDv/Y7i6cD5sSCDYJFUtWKS9Lr0gjzyBq0e/sfjfm?=
 =?us-ascii?Q?bjH3IxqnA2hlcgl7JkwpnLR9PRN7BtApkdlnkf1iBLhLzYr2VVs7vOFPb30R?=
 =?us-ascii?Q?0o1Ls/4QwZZj6l0Z192C5HQpiD7/Fw5P31qjLLCKh1FGingjrsAFsy1yvijv?=
 =?us-ascii?Q?quVVNqA4SFZ8bkJHmfvSvKfyoXrczfxcxY7MDM76zxmhCKVSnCs0Ng9c/6/I?=
 =?us-ascii?Q?pGYhefzBpV2x+ewxzGA+QIdLEPawoGHPSZg/rF5S5s1Prxg/NoP4RCXqe7G7?=
 =?us-ascii?Q?3dvDR3m0c0+PT0gz5Ei9Q35RPuYr3b6bch4TTsmSJOX1jdlG5ITqmS1F035j?=
 =?us-ascii?Q?RJ2Hok6ZpXL9P+tItHsh//OA+giGvZbPkPBINrZE/mnN9AxP78FlumX07VKc?=
 =?us-ascii?Q?AhnIq7qldXj6gtc14eCZrQY84R1scTTJMIaD27AAl7GD47EzDMbw78cIScpM?=
 =?us-ascii?Q?7pczXvMLxzOl/rkcbS1dpKrAegE3e10FvQH2kG2HBsXLcjMBMkXnqKMGfntv?=
 =?us-ascii?Q?2eXw0m0Rk/uoVKXrGXhpt7uEUl9e38jAnHFtqC91kqnFEFO+IBf2RVit/k2j?=
 =?us-ascii?Q?yVRJnM5UmrMgR4pMEtHbFZdUgfJiFAfvQjDh8JsWCHYDjI+vq6lxgnXt+hSx?=
 =?us-ascii?Q?a3+HXqd+C4b9ia4+fT6G43L46OIubKFnxm3yeoT6ETpJxebDNjFkTuQbP7g/?=
 =?us-ascii?Q?JzKEV+fVEqSqOxeD3Yp3xRt0x6e/uDab+iXilJWfnN70kP3vXer+ylJ8RxOc?=
 =?us-ascii?Q?28Bo4mdE6Nopw+7bxpXN8GWwzIN0rx6uch7A?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:52.5811 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff1e3f08-41e0-4523-9b09-08dd94d74960
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCBE.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB7312
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

Add header containing defines for RMAPI handles used by NVKM, and
use them in place of magic values when calling RM_ALLOC.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../drm/nouveau/nvkm/subdev/gsp/rm/handles.h    | 17 +++++++++++++++++
 .../nouveau/nvkm/subdev/gsp/rm/r535/client.c    |  2 +-
 .../nouveau/nvkm/subdev/gsp/rm/r535/device.c    |  6 +++---
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c  |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c  |  2 +-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c    |  4 ++--
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c   |  2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h |  1 +
 8 files changed, 27 insertions(+), 9 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
new file mode 100644
index 000000000000..50f2f2a86b5a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/handles.h
@@ -0,0 +1,17 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_HANDLES_H__
+#define __NVKM_RM_HANDLES_H__
+
+/* RMAPI handles for various objects allocated from GSP-RM with RM_ALLOC. */
+
+#define NVKM_RM_CLIENT(id)         (0xc1d00000 | (id))
+#define NVKM_RM_DEVICE              0xde1d0000
+#define NVKM_RM_SUBDEVICE           0x5d1d0000
+#define NVKM_RM_DISP                0x00730000
+#define NVKM_RM_VASPACE             0x90f10000
+#define NVKM_RM_CHAN(chid)         (0xf1f00000 | (chid))
+#define NVKM_RM_THREED              0x97000000
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
index c0146c00584d..449338da1795 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/client.c
@@ -53,7 +53,7 @@ r535_gsp_client_ctor(struct nvkm_gsp *gsp, struct nvkm_gsp_client *client)
 	client->object.client = client;
 	INIT_LIST_HEAD(&client->events);
 
-	args = nvkm_gsp_rm_alloc_get(&client->object, 0xc1d00000 | ret, NV01_ROOT, sizeof(*args),
+	args = nvkm_gsp_rm_alloc_get(&client->object, NVKM_RM_CLIENT(ret), NV01_ROOT, sizeof(*args),
 				     &client->object);
 	if (IS_ERR(args)) {
 		r535_gsp_client_dtor(client);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
index 094abf7b5f97..f830e12a8f6e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/device.c
@@ -111,8 +111,8 @@ r535_gsp_subdevice_ctor(struct nvkm_gsp_device *device)
 {
 	NV2080_ALLOC_PARAMETERS *args;
 
-	return nvkm_gsp_rm_alloc(&device->object, 0x5d1d0000, NV20_SUBDEVICE_0, sizeof(*args),
-				 &device->subdevice);
+	return nvkm_gsp_rm_alloc(&device->object, NVKM_RM_SUBDEVICE, NV20_SUBDEVICE_0,
+				 sizeof(*args), &device->subdevice);
 }
 
 static int
@@ -121,7 +121,7 @@ r535_gsp_device_ctor(struct nvkm_gsp_client *client, struct nvkm_gsp_device *dev
 	NV0080_ALLOC_PARAMETERS *args;
 	int ret;
 
-	args = nvkm_gsp_rm_alloc_get(&client->object, 0xde1d0000, NV01_DEVICE_0, sizeof(*args),
+	args = nvkm_gsp_rm_alloc_get(&client->object, NVKM_RM_DEVICE, NV01_DEVICE_0, sizeof(*args),
 				     &device->object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index e65f9074e94f..1ba86e223978 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1468,7 +1468,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, 0x00730000, NV04_DISPLAY_COMMON, 0,
+	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, NVKM_RM_DISP, NV04_DISPLAY_COMMON, 0,
 				&disp->rm.objcom);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 98aa272be642..ad9d93f9820d 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -101,7 +101,7 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	if (!chan->rm.mthdbuf.ptr)
 		return -ENOMEM;
 
-	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, 0xf1f00000 | chan->id,
+	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, NVKM_RM_CHAN(chan->id),
 				     fifo->func->chan.user.oclass, sizeof(*args),
 				     &chan->rm.object);
 	if (WARN_ON(IS_ERR(args)))
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index 3618fa36040c..4c0df52e8683 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -205,7 +205,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	{
 		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
 
-		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, 0xf1f00000,
+		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, NVKM_RM_CHAN(0),
 					     device->fifo->func->chan.user.oclass,
 					     sizeof(*args), &golden.chan);
 		if (IS_ERR(args)) {
@@ -358,7 +358,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 		goto done;
 
 	/* Allocate 3D class on channel to trigger golden context init in RM. */
-	ret = nvkm_gsp_rm_alloc(&golden.chan, 0x97000000, rm->gpu->gr.class.threed, 0, &threed);
+	ret = nvkm_gsp_rm_alloc(&golden.chan, NVKM_RM_THREED, rm->gpu->gr.class.threed, 0, &threed);
 	if (ret)
 		goto done;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index c697885c65d3..99af6c19a9a9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -34,7 +34,7 @@ r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 	if (ret)
 		return ret;
 
-	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, 0x90f10000, FERMI_VASPACE_A,
+	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, NVKM_RM_VASPACE, FERMI_VASPACE_A,
 				     sizeof(*args), &vmm->rm.object);
 	if (IS_ERR(args))
 		return PTR_ERR(args);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index bda22703690a..4d9e5ea3b2fa 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -5,6 +5,7 @@
 #include <subdev/gsp.h>
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
+#include "handles.h"
 
 struct nvkm_rm_impl {
 	const struct nvkm_rm_api *api;
-- 
2.49.0

