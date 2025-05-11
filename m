Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B4F61AB2B53
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:08:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 67A1910E167;
	Sun, 11 May 2025 21:08:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="BBxpc23F";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2055.outbound.protection.outlook.com [40.107.92.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BA65A10E17C
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:08:35 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=btN39+r+odLLSEfCNV4MfYrdgSgWP9CETjM/oP672IZ0AMCu+y15zhJdstU+PRQfWCGvMWKWWfst3MYKPjjKSNeDIEMWQFdjjDmrgHFaDQdQnWBtdZKH5GPhMXHbRoiDQVS8vKxfR8hMjiUf2wgSqro1SLlIis0jaYB4Pnk2LXO8ICdQbKCdgsXTAB2z0iZaItg2AeRbkHmjQhEWKZF4xZyperWoG6+Xn4l/OOOMNjuV7gz9kNBmioLpGgPibLCZ1yCnz03Bz0efhw3Y079b0IromBVXIEC10v+OS6ewGKz0FQSopaHg+qLo19o0pLpQm2Ov+Qaul8E0IxPOLh7wNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iKBKLLcuQf7//fVx2ZAGdTZh0aJbymLpR0+TDAW8cVs=;
 b=qpzHX6FqC57ln4pkb0r8c9DEyir9ict14jKtEKQPnghO5iGmdIpjXZ3tMXBn/X2eQWaoca5r6M+0bbxirQa7QaXA0JpEnBVKPsqv2Pt8axx8BsFmSHs3wkhbpoIHHTsXu207W6R9OOilVGzL5H5rkv2MV+AoYiQ1XKlV6KZ26thPUJHt1d6FmJaQO6lTiY9Rfovvd1qduXSV61QiQMyNaOlalIodJBagzg+jg2J7WBfUIMFdpEAUbKqUm/qctwLZTjBjPwrHY4G+Li3EjCLN6csEEkJNZGGRlJdkgNoE5bPH1VHV69hpPENdkIAk6/ALPScq6U4gNazbK3/uO5U7+A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iKBKLLcuQf7//fVx2ZAGdTZh0aJbymLpR0+TDAW8cVs=;
 b=BBxpc23FAr6ZsGJvnfQnBXy/oV4rc/lylCscuwoUZmFRNt5TFEoNZlEnockEYm7DsINdq9Jm+ntw61KwLWhkjIJPhi9cYc3J6URZhjibRjiPdbwzCNN8qACLv+EAG6qmlWMjjYpy3H3Zi4aiAf1ji+xm6RrrK3wR7eD7ffX+52C5DG+ROi/37jWXJ/7PiyugZs1qiAaPdth3+WP3HxgFi2Uu0Wrzdkom+G/SOlUlq2m/sHRwTD+zzh88NjQQ70dWMPjS1Tgpz8ipL2Pqk4XrOtnDdBQmPV6rig8Yc83vB7OhgT0g7hc3IAmXDInJXapkJs85D9d3rjpm0HF96BZ5Fw==
Received: from DS7PR03CA0087.namprd03.prod.outlook.com (2603:10b6:5:3bb::32)
 by PH7PR12MB7307.namprd12.prod.outlook.com (2603:10b6:510:20b::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.29; Sun, 11 May
 2025 21:08:32 +0000
Received: from DS1PEPF0001709B.namprd05.prod.outlook.com
 (2603:10b6:5:3bb:cafe::1a) by DS7PR03CA0087.outlook.office365.com
 (2603:10b6:5:3bb::32) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.30 via Frontend Transport; Sun,
 11 May 2025 21:08:31 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709B.mail.protection.outlook.com (10.167.18.105) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:08:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:26 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 14/62] drm/nouveau/gsp: add gpu hal stubs
Date: Mon, 12 May 2025 07:06:34 +1000
Message-ID: <20250511210722.80350-15-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709B:EE_|PH7PR12MB7307:EE_
X-MS-Office365-Filtering-Correlation-Id: 91c6581f-ea2f-4e04-8ede-08dd90cffba4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?z9P5tk7rn4+/moP8TvcBROVxD2HXoC6FOeMSvL1XZT0YDXhsE7dliIFZ7AQe?=
 =?us-ascii?Q?3aF0dJPG/OdmrCU9Akc6NOZYfnCZsj3GUELVtITP5tulyGTES4DkCSWBQc1H?=
 =?us-ascii?Q?ifJbEbidj26W+UZ16NIBy+NY7UH5ngGNWjOqBzFtNo4X0ieTPoAWrrHi6XcE?=
 =?us-ascii?Q?fc7IGHGf0ypHXvNfk5OVyQZ/iuafNLFHX8HmIS4ROYeZ4kG7zLfMoU1QU0tK?=
 =?us-ascii?Q?uBIVSMZy4pnajwJlL4DmyYZXSc0YNIBM3IRTyJOV3/5cAFyYjnC+xNK7NpfU?=
 =?us-ascii?Q?i8Ae0szlNx5qC7nCEq0qa4dSEknPSCimEJLlIlQns6jE09kZJj48ypPqIu8n?=
 =?us-ascii?Q?hv40+Vhgid/SjUbIsDMQDlcVdhOtHt7h8G1nxpz/Bp6P8Yp/ARhiCoH45gq9?=
 =?us-ascii?Q?XYoPIiAyKamerfFyDz3BYFDcWs8pXadX55y0jPadqZjX4mbddfYPlmKkUSON?=
 =?us-ascii?Q?h/HC31QHP4vp3jpHUVx6VccD97l7Xio52QQjexdWDMulizP38QHuPucdWaor?=
 =?us-ascii?Q?hgKu3Y5y6UOZ2OCmSICmQ4t3iBINtYrBfzseWM8YyNp930axDHYsGHStFSrO?=
 =?us-ascii?Q?yaYdi0TnmCv8zgEPYm5g7WJ06f+vTQgaxKGPpKyvPrbUWExrFHKotr1lsA8L?=
 =?us-ascii?Q?NGB1LkIICZmYPiwWhSLnx+iaUF6lPdBLbgIZGolpcYJ8OmlV7biHpeKuQoju?=
 =?us-ascii?Q?9IVlEgoeONNGKLrcieSWlsDPz9y53adXp3GrwGB+/Vc0oKLi5/coU/Th4Dta?=
 =?us-ascii?Q?ORUfCmaANFGyNuyHM18rZcI+Et+K82yd8mUPPhl6wX7TCrStvgyWLqs5BO8O?=
 =?us-ascii?Q?im2b/qg/QfO6zmIXYEFkJzFILVWsT/nB0OfP5MhvvQkz8GWBj0WyteIwlK0w?=
 =?us-ascii?Q?Quo6Omx3VVC9Jlgc7L4inaFLitcLPWPabmJd+1K8BXe4NGOJ5U/bqEjCS/KX?=
 =?us-ascii?Q?prtBdcVlDSrMXzsyMaxFb514aNdIfIza3LnWG1VPAKc7FCrL9Hh+WDDRkwWA?=
 =?us-ascii?Q?8AJWg4gXr5KUa4K4SEt9tLVzcBUyOkjMGwIuEpgQgQ99NIqIxl2h1cQleWf9?=
 =?us-ascii?Q?G/Fjlw0GJC257dwTfhnCN1TZytjdv6kpYOhYqOL13wnfZG390+JJ83esGkoD?=
 =?us-ascii?Q?kp2eWxXh4azpbwTnOHpfajWvzJ/1Bp4GHCzm4IbG/hYd+kJTo83zhNI2F9U/?=
 =?us-ascii?Q?H/gSibfjeWXbB4i5dDJU7tWAOnFsZepVPngDY4N0Znj3q3qtP+Mad6kF1Dyx?=
 =?us-ascii?Q?+N5cT+PE8Bxh7TyfDKJjqk96hEV7dq5+c8dHn8kyVaVynY28Q+k230US0HhR?=
 =?us-ascii?Q?KV5tFh/4a5c/foJbaVr9pBp455XA194ILo2eCmIsGR8U4Cr4Y/RtkhuVNsQo?=
 =?us-ascii?Q?ouel3MktE9+fVaInLvdxM+wrP6wbfAPgL4YFjb5u1Om4JBkAXkNOfiWcsYVt?=
 =?us-ascii?Q?FFKJ6UaQVmX50Eeuw3T/4iCVFa/UjvnLp7EZhNCwtYvMvmdpJKgKO3fzNH0e?=
 =?us-ascii?Q?qd2XbaJDHJg8jQAsc9oFsaAP+UH7/1exsCY8?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:08:30.9553 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 91c6581f-ea2f-4e04-8ede-08dd90cffba4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709B.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB7307
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

With GSP-RM handling the majority of the HW programming, NVKM's usual
HALs are more elaborate than necessary, resulting in a fair amount of
duplicated boilerplate.

Adds 'nvkm_rm_gpu' which serves to provide GPU-specific constants and
functions in a more streamlined manner.

This is initially used in subsequent commits to store engine class IDs,
and replace the per-engine/engobj boilerplate with common code for all
GSP-RM supported engines - and is further extended when adding GH100,
GB10x and GB20x support.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../gpu/drm/nouveau/include/nvkm/subdev/gsp.h    |  6 ++----
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c   | 12 +++++++++++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h   |  7 +++++--
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild    |  5 +++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c   |  9 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c   |  9 +++++++++
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c   |  9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h | 16 ++++++++++++++++
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c    |  5 -----
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c | 14 ++++++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h  | 13 ++++++++++++-
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c   |  9 +++++++++
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c  |  6 +++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c  |  6 +++---
 17 files changed, 114 insertions(+), 30 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
index 3fd279be8340..eeaf72f6add3 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/gsp.h
@@ -209,9 +209,7 @@ struct nvkm_gsp {
 		u8 tpcs;
 	} gr;
 
-	const struct nvkm_gsp_rm {
-		const struct nvkm_rm_api *api;
-	} *rm;
+	struct nvkm_rm *rm;
 
 	struct {
 		struct mutex mutex;
@@ -467,7 +465,7 @@ static inline int
 nvkm_gsp_device_event_ctor(struct nvkm_gsp_device *device, u32 handle, u32 id,
 			   nvkm_gsp_event_func func, struct nvkm_gsp_event *event)
 {
-	const struct nvkm_gsp_rm *rm = device->object.client->gsp->rm;
+	struct nvkm_rm *rm = device->object.client->gsp->rm;
 
 	return rm->api->device->event.ctor(device, handle, id, func, event);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
index ea2821e7a54e..d7933bfc59fd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ad102.c
@@ -22,7 +22,7 @@
 #include "priv.h"
 
 static const struct nvkm_gsp_func
-ad102_gsp_r535_113_01 = {
+ad102_gsp = {
 	.flcn = &ga102_gsp_flcn,
 	.fwsec = &ga102_gsp_fwsec,
 
@@ -40,12 +40,12 @@ ad102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ad10x_gpu,
 };
 
 static struct nvkm_gsp_fwif
 ad102_gsps[] = {
-	{ 0, tu102_gsp_load, &ad102_gsp_r535_113_01, "535.113.01", true },
+	{ 0, tu102_gsp_load, &ad102_gsp, &r535_rm_ga102, "535.113.01", true },
 	{}
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
index 78f2a15f0d42..0f8526aa969f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/base.c
@@ -102,6 +102,7 @@ nvkm_gsp_dtor(struct nvkm_subdev *subdev)
 		gsp->func->dtor(gsp);
 
 	nvkm_falcon_dtor(&gsp->falcon);
+	kfree(gsp->rm);
 	return gsp;
 }
 
@@ -139,7 +140,16 @@ nvkm_gsp_new_(const struct nvkm_gsp_fwif *fwif, struct nvkm_device *device,
 		return PTR_ERR(fwif);
 
 	gsp->func = fwif->func;
-	gsp->rm = gsp->func->rm;
+
+	if (fwif->rm) {
+		gsp->rm = kzalloc(sizeof(*gsp->rm), GFP_KERNEL);
+		if (!gsp->rm)
+			return -ENOMEM;
+
+		gsp->rm->device = device;
+		gsp->rm->gpu = fwif->func->rm.gpu;
+		gsp->rm->api = fwif->rm->api;
+	}
 
 	return nvkm_falcon_ctor(gsp->func->flcn, &gsp->subdev, gsp->subdev.name, 0x110000,
 				&gsp->falcon);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
index d9cdec4810b4..77e3501296c9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga100.c
@@ -39,7 +39,7 @@ ga100_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-ga100_gsp_r535_113_01 = {
+ga100_gsp = {
 	.flcn = &ga100_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -56,12 +56,12 @@ ga100_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ga100_gpu,
 };
 
 static struct nvkm_gsp_fwif
 ga100_gsps[] = {
-	{  0, tu102_gsp_load, &ga100_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga100_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
index 7b8db70f3cb3..709a046d86bf 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/ga102.c
@@ -150,7 +150,7 @@ ga102_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-ga102_gsp_r535_113_01 = {
+ga102_gsp_r535 = {
 	.flcn = &ga102_gsp_flcn,
 	.fwsec = &ga102_gsp_fwsec,
 
@@ -168,7 +168,7 @@ ga102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = ga102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &ga1xx_gpu,
 };
 
 static const struct nvkm_gsp_func
@@ -178,7 +178,7 @@ ga102_gsp = {
 
 static struct nvkm_gsp_fwif
 ga102_gsps[] = {
-	{  0, tu102_gsp_load, &ga102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &ga102_gsp_r535, &r535_rm_ga102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &ga102_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
index e6f0e865848a..de274f6426c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/priv.h
@@ -2,6 +2,7 @@
 #ifndef __NVKM_GSP_PRIV_H__
 #define __NVKM_GSP_PRIV_H__
 #include <subdev/gsp.h>
+#include <rm/gpu.h>
 enum nvkm_acr_lsf_id;
 
 int nvkm_gsp_fwsec_frts(struct nvkm_gsp *);
@@ -11,6 +12,7 @@ struct nvkm_gsp_fwif {
 	int version;
 	int (*load)(struct nvkm_gsp *, int ver, const struct nvkm_gsp_fwif *);
 	const struct nvkm_gsp_func *func;
+	const struct nvkm_rm_impl *rm;
 	const char *ver;
 	bool enable;
 };
@@ -51,7 +53,9 @@ struct nvkm_gsp_func {
 	int (*fini)(struct nvkm_gsp *, bool suspend);
 	int (*reset)(struct nvkm_gsp *);
 
-	const struct nvkm_gsp_rm *rm;
+	struct {
+		const struct nvkm_rm_gpu *gpu;
+	} rm;
 };
 
 extern const struct nvkm_falcon_func tu102_gsp_flcn;
@@ -73,7 +77,6 @@ void r535_gsp_dtor(struct nvkm_gsp *);
 int r535_gsp_oneinit(struct nvkm_gsp *);
 int r535_gsp_init(struct nvkm_gsp *);
 int r535_gsp_fini(struct nvkm_gsp *, bool suspend);
-extern const struct nvkm_gsp_rm r535_gsp_rm;
 int r535_gsp_rmargs_init(struct nvkm_gsp *gsp, bool resume);
 
 int nvkm_gsp_new_(const struct nvkm_gsp_fwif *, struct nvkm_device *, enum nvkm_subdev_type, int,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
index 1c07740215ec..841b690c0c0a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/Kbuild
@@ -2,4 +2,9 @@
 #
 # Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
 
+nvkm-y += nvkm/subdev/gsp/rm/tu1xx.o
+nvkm-y += nvkm/subdev/gsp/rm/ga100.o
+nvkm-y += nvkm/subdev/gsp/rm/ga1xx.o
+nvkm-y += nvkm/subdev/gsp/rm/ad10x.o
+
 include $(src)/nvkm/subdev/gsp/rm/r535/Kbuild
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
new file mode 100644
index 000000000000..1e519bf166dd
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ad10x.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ad10x_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
new file mode 100644
index 000000000000..b10e6ff9e9b6
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga100.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ga100_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
new file mode 100644
index 000000000000..725ccb2c27dc
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/ga1xx.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+ga1xx_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
new file mode 100644
index 000000000000..32d87ce2b77d
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/gpu.h
@@ -0,0 +1,16 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#ifndef __NVKM_RM_GPU_H__
+#define __NVKM_RM_GPU_H__
+#include "rm.h"
+
+struct nvkm_rm_gpu {
+};
+
+extern const struct nvkm_rm_gpu tu1xx_gpu;
+extern const struct nvkm_rm_gpu ga100_gpu;
+extern const struct nvkm_rm_gpu ga1xx_gpu;
+extern const struct nvkm_rm_gpu ad10x_gpu;
+#endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index d1dfc616c9d1..5e6cf57a6f70 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -44,11 +44,6 @@
 
 extern struct dentry *nouveau_debugfs_root;
 
-const struct nvkm_gsp_rm
-r535_gsp_rm = {
-	.api = &r535_rm,
-};
-
 static void
 r535_gsp_msgq_work(struct work_struct *work)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 39cc3d0c740c..3c17b75b5e37 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -4,11 +4,21 @@
  */
 #include <rm/rm.h>
 
-const struct nvkm_rm_api
-r535_rm = {
+static const struct nvkm_rm_api
+r535_api = {
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
 };
+
+const struct nvkm_rm_impl
+r535_rm_tu102 = {
+	.api = &r535_api,
+};
+
+const struct nvkm_rm_impl
+r535_rm_ga102 = {
+	.api = &r535_api,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 20841305fa55..41d4ed70fc10 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -6,6 +6,16 @@
 #ifndef __NVKM_RM_H__
 #define __NVKM_RM_H__
 
+struct nvkm_rm_impl {
+	const struct nvkm_rm_api *api;
+};
+
+struct nvkm_rm {
+	struct nvkm_device *device;
+	const struct nvkm_rm_gpu *gpu;
+	const struct nvkm_rm_api *api;
+};
+
 struct nvkm_rm_api {
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
@@ -45,7 +55,8 @@ struct nvkm_rm_api {
 	} *device;
 };
 
-extern const struct nvkm_rm_api r535_rm;
+extern const struct nvkm_rm_impl r535_rm_tu102;
+extern const struct nvkm_rm_impl r535_rm_ga102;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
new file mode 100644
index 000000000000..d455a4f19854
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/tu1xx.c
@@ -0,0 +1,9 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include "gpu.h"
+
+const struct nvkm_rm_gpu
+tu1xx_gpu = {
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
index 451d3e588d26..fef9c4444017 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu102.c
@@ -268,7 +268,7 @@ tu102_gsp_flcn = {
 };
 
 static const struct nvkm_gsp_func
-tu102_gsp_r535_113_01 = {
+tu102_gsp = {
 	.flcn = &tu102_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -285,7 +285,7 @@ tu102_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &tu1xx_gpu,
 };
 
 static int
@@ -336,7 +336,7 @@ tu102_gsp_load(struct nvkm_gsp *gsp, int ver, const struct nvkm_gsp_fwif *fwif)
 
 static struct nvkm_gsp_fwif
 tu102_gsps[] = {
-	{  0, tu102_gsp_load, &tu102_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu102_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
index 1bc806a18010..5f279813626f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/tu116.c
@@ -22,7 +22,7 @@
 #include "priv.h"
 
 static const struct nvkm_gsp_func
-tu116_gsp_r535_113_01 = {
+tu116_gsp = {
 	.flcn = &tu102_gsp_flcn,
 	.fwsec = &tu102_gsp_fwsec,
 
@@ -39,12 +39,12 @@ tu116_gsp_r535_113_01 = {
 	.fini = tu102_gsp_fini,
 	.reset = tu102_gsp_reset,
 
-	.rm = &r535_gsp_rm,
+	.rm.gpu = &tu1xx_gpu,
 };
 
 static struct nvkm_gsp_fwif
 tu116_gsps[] = {
-	{  0, tu102_gsp_load, &tu116_gsp_r535_113_01, "535.113.01" },
+	{  0, tu102_gsp_load, &tu116_gsp, &r535_rm_tu102, "535.113.01" },
 	{ -1, gv100_gsp_nofw, &gv100_gsp },
 	{}
 };
-- 
2.49.0

