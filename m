Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C6C2F8D11FE
	for <lists+nouveau@lfdr.de>; Tue, 28 May 2024 04:23:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 07DC610F933;
	Tue, 28 May 2024 02:23:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="QcOOajsy";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2074.outbound.protection.outlook.com [40.107.220.74])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBF8A10F736
 for <nouveau@lists.freedesktop.org>; Tue, 28 May 2024 02:23:41 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dfmjsmBuPWZwftvzfVwKIc5nqEzawrWVVfbqy+A8aHQnnhywx6E0M//942+N/TAqYMAtZiKpPffJPL16TjLznTrjAWPnLDcHa1JlREEt1nlya8sQV+yBjb4atJJf4FfYNw1GSSGr/PPriG1Eu6ciTdwuaKDiT/EpdjrJY53Fd2wLWipJrBCj2Jsk0/2xEN9sE3F7o/9Exf1CJ877wQlpkcqUQU5Okqr7q1lHHCc0sGA6hHbK7WJmCG5PJeBEzM6uWTZhfgnP9nLZDbTg9Y2pBKsN5s7lYthdHpRzyLTbJWLx2xon6nFsBFSdORA+U60ZOqPClM9fE5uwG+YSBxClWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g/XoN1gRzeeNd1v/RGYyffxJffLcY2j2cvjNuE1HvQ4=;
 b=LD2Ossfo+3wFJvhvA2tHbdqW1cvKRS3FkPKRRF3aqFDy/dA9bxwBh/OmgZOkPf2uSn+BwvgywTQo08TYKFbVB3/dmgEhigN6wvWddJSkeL45px+uG96mjjQtXnWzVRb5ws9moYHfsY/urwWsmPsUXpKUkaxHKtY9HQLQ4CgP9eJ+PN18Eq5UVeY/azRjMTKKGdyR2oKeB3q2Csr6YjuNOJYuIkgUNv1vggP6OnvHARNgUiEv5cEhyJ65x1FRI4POb2k1u59+/9Dncw5aAchwEb8rb7xPqvbRNfyl6N8Ht676qNPkWMi1pCQ+B02BkYiSh16MzMdu297Par3Ne79ncQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g/XoN1gRzeeNd1v/RGYyffxJffLcY2j2cvjNuE1HvQ4=;
 b=QcOOajsyMljfeqpQoGjmq6DO/JJJN/pYanPDC37mds53VKFliSZISsK8XehXJe2VhmASqa523EGDlH/2Aa1PSJS0OhfLUPPaBLttZNJeBhK6Q1ODxF2UpCxP+nwq+wQCG1QdYpvsP15SlL1YFE6m/qp05AnZAPJioObZu+kmIh4HnV/9IlN3w0WMWLUytHksIhMnIeQ/gfcbcoPzMLK94JlfVz27ng7AVn93I3JEdhxYx92EcEARP9Kaoz5xxGWLgSKuuYzcPzae1HgnfG58GW7LMJY6wOm4XQ3tGJ7qj0fVdbGXJ6tOflxU3kyknSWunCmlFkXTcP4wKRbmczeP6A==
Received: from SA0PR11CA0028.namprd11.prod.outlook.com (2603:10b6:806:d3::33)
 by SA3PR12MB9130.namprd12.prod.outlook.com (2603:10b6:806:37f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Tue, 28 May
 2024 02:23:38 +0000
Received: from SN1PEPF00036F3F.namprd05.prod.outlook.com
 (2603:10b6:806:d3:cafe::e5) by SA0PR11CA0028.outlook.office365.com
 (2603:10b6:806:d3::33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.29 via Frontend
 Transport; Tue, 28 May 2024 02:23:38 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF00036F3F.mail.protection.outlook.com (10.167.248.23) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7633.15 via Frontend Transport; Tue, 28 May 2024 02:23:38 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:26 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 27 May
 2024 19:23:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 25/34] drm/nouveau: add nvif_mmu to nouveau_drm
Date: Tue, 28 May 2024 00:19:50 +1000
Message-ID: <20240527141959.59193-26-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240527141959.59193-1-bskeggs@nvidia.com>
References: <20240527141959.59193-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail201.nvidia.com (10.129.68.8) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SN1PEPF00036F3F:EE_|SA3PR12MB9130:EE_
X-MS-Office365-Filtering-Correlation-Id: a4d23624-9e98-4cc8-7cdd-08dc7ebd2f21
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|36860700004|1800799015|82310400017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YiSzz+LCxuB2iJWA9YtVbi76lIwxL3IUqhBGJZHYnx+NWFJ/MyUXhpG6kuhj?=
 =?us-ascii?Q?D4tINjdOy2lRxJR073p5/SbjlWI73hbYEuUQtGaZHziIsjasu3r5SivJFtnN?=
 =?us-ascii?Q?PGPEgboD9q6mePbkLU/dHCaqCcLO7pmVJjYiGCqkIg3XeyeHGbSNfsfKYNil?=
 =?us-ascii?Q?DD86cYgPVF1VMlP8Sfz83MXZ7RpLCJwFaZNcaSRW53MvRnpSkcPphk35aR4i?=
 =?us-ascii?Q?ZU+OOvTNOGWdkFCxk6JF45+EB+eln/+jzvOAVuv62mEXruUyIQ4WrJAzThf3?=
 =?us-ascii?Q?iPERv5s36+/leqMCiMGLwlYdfS4okNIyAjfYmspkVt4iL7NkajUoFG3C3xcU?=
 =?us-ascii?Q?WYyFtlkgZ5k1pMtvk9vWWChYIt9H1nDnuLfn02bLdwOtWvM471qEgKKantJx?=
 =?us-ascii?Q?We36fudgC85Su51ouptfHFM5O4Lhq0s4S+NEvALh2Fn3VswnEzc14GiGHtDL?=
 =?us-ascii?Q?sxbCtkEo6ObPMec6kb5I1Vc95I7dllHDqB/RfyXtPb/Iq0qQ7xJm89O+5L5J?=
 =?us-ascii?Q?hwE1y+OU/iae9JlrKqFLdRD5anOhIfcaZuuHlzL1+ZhyA3GvCOGpptPqy/h8?=
 =?us-ascii?Q?AoYmVcPZH3W/qsOkG5QlJk2fjFURntfcjjGac3AbSJGba88gAQ0mnTC9ryoj?=
 =?us-ascii?Q?HBZyAgA70qICmwLdTeo8tLKVMU732Au39uHNy9diCo9ta2hKqyCmnIlPVYer?=
 =?us-ascii?Q?4ExbzEtK/HFrk0yT1acdgZcK88rubH6Y9h9qQsquK09Hjvy325wdKG5GzSFt?=
 =?us-ascii?Q?2V24jUl1MRljqe5EvMF1pGA14Je8ttv53P1TNUn4MRGVG47joDgC9V4MINPA?=
 =?us-ascii?Q?ekG7Ot3MbhFUyrDbiGxLUh/sK95bAkXx6YL+dHcvX7SjtqpTTGjmekoNrKMY?=
 =?us-ascii?Q?Fuf7X4YGSX079LT6q5b24cT0n4qSx6zH5GBcyoNXnqEs4O03wjIKvzJYdBUb?=
 =?us-ascii?Q?4ElZmnnPCO9XqdAfIBvXLGDq/szG2vn3tgxY/0R0Iy32kMOt8iHsDInFwQ8o?=
 =?us-ascii?Q?zxdk7kBXx/GPv8Er6E4Z1PVT2RIQg6bngR/qHilAKu12CE7YTJATQSHUX7d2?=
 =?us-ascii?Q?iRjHt1j/HeslkLNnFUOokbFJU8aAHYeYMzvj12Q1FFeEYbwONA7DmgainMtH?=
 =?us-ascii?Q?6tgKqmuyszdulWBTwdMdrdF7LVBlYoZA795+sxF8VWTzruUZVNNS0TqUBFd8?=
 =?us-ascii?Q?IRt3z3NYMVaSxHBbUnrfK9nZdjTHczbPNSQqvkYrytKBqOvabgQQGg/fjbba?=
 =?us-ascii?Q?IrxysxTctGFdNNLXzPKCKw/Gbaiu3vwnkx6szuvajlsvnY+SExnXBGmyk2Vv?=
 =?us-ascii?Q?LT2GE8VKj/X7jvGzVSrw2puE+C8AG3lQZuQD5oKLIONP1CZNR9ayqmfM7aWr?=
 =?us-ascii?Q?xhMN3ls=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(1800799015)(82310400017); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 May 2024 02:23:38.2847 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a4d23624-9e98-4cc8-7cdd-08dc7ebd2f21
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF00036F3F.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA3PR12MB9130
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

This allocates a new nvif_mmu in nouveau_drm, and uses it for TTM
backend memory allocations instead of nouveau_drm.master.mmu,
which will be removed in a later commit.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nouveau_drm.c | 36 ++++++++++++++++-----------
 drivers/gpu/drm/nouveau/nouveau_drv.h |  1 +
 drivers/gpu/drm/nouveau/nouveau_mem.c | 12 ++++-----
 3 files changed, 29 insertions(+), 20 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nouveau_drm.c b/drivers/gpu/drm/nouveau/nouveau_drm.c
index 704474e16b1d..652d38a71211 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drm.c
+++ b/drivers/gpu/drm/nouveau/nouveau_drm.c
@@ -227,13 +227,6 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 		{}
 	};
 	static const struct nvif_mclass
-	mmus[] = {
-		{ NVIF_CLASS_MMU_GF100, -1 },
-		{ NVIF_CLASS_MMU_NV50 , -1 },
-		{ NVIF_CLASS_MMU_NV04 , -1 },
-		{}
-	};
-	static const struct nvif_mclass
 	vmms[] = {
 		{ NVIF_CLASS_VMM_GP100, -1 },
 		{ NVIF_CLASS_VMM_GM200, -1 },
@@ -270,13 +263,7 @@ nouveau_cli_init(struct nouveau_drm *drm, const char *sname,
 
 	cli->device.object.map.ptr = drm->device.object.map.ptr;
 
-	ret = nvif_mclass(&cli->device.object, mmus);
-	if (ret < 0) {
-		NV_PRINTK(err, cli, "No supported MMU class\n");
-		goto done;
-	}
-
-	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", mmus[ret].oclass,
+	ret = nvif_mmu_ctor(&cli->device.object, "drmMmu", drm->mmu.object.oclass,
 			    &cli->mmu);
 	if (ret) {
 		NV_PRINTK(err, cli, "MMU allocation failed: %d\n", ret);
@@ -572,6 +559,13 @@ nouveau_parent = {
 static int
 nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 {
+	static const struct nvif_mclass
+	mmus[] = {
+		{ NVIF_CLASS_MMU_GF100, -1 },
+		{ NVIF_CLASS_MMU_NV50 , -1 },
+		{ NVIF_CLASS_MMU_NV04 , -1 },
+		{}
+	};
 	struct nouveau_drm *drm;
 	int ret;
 
@@ -601,6 +595,18 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 		goto fail_nvif;
 	}
 
+	ret = nvif_mclass(&drm->device.object, mmus);
+	if (ret < 0) {
+		NV_ERROR(drm, "No supported MMU class\n");
+		goto fail_nvif;
+	}
+
+	ret = nvif_mmu_ctor(&drm->device.object, "drmMmu", mmus[ret].oclass, &drm->mmu);
+	if (ret) {
+		NV_ERROR(drm, "MMU allocation failed: %d\n", ret);
+		goto fail_nvif;
+	}
+
 	drm->sched_wq = alloc_workqueue("nouveau_sched_wq_shared", 0,
 					WQ_MAX_ACTIVE);
 	if (!drm->sched_wq) {
@@ -680,6 +686,7 @@ nouveau_drm_device_init(struct drm_device *dev, struct nvkm_device *nvkm)
 fail_wq:
 	destroy_workqueue(drm->sched_wq);
 fail_nvif:
+	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 fail_alloc:
@@ -736,6 +743,7 @@ nouveau_drm_device_fini(struct drm_device *dev)
 	nouveau_cli_fini(&drm->client);
 	nouveau_cli_fini(&drm->master);
 	destroy_workqueue(drm->sched_wq);
+	nvif_mmu_dtor(&drm->mmu);
 	nvif_device_dtor(&drm->device);
 	nvif_client_dtor(&drm->master.base);
 	nvif_parent_dtor(&drm->parent);
diff --git a/drivers/gpu/drm/nouveau/nouveau_drv.h b/drivers/gpu/drm/nouveau/nouveau_drv.h
index 27a4a365669a..0b1cf2f2f9bc 100644
--- a/drivers/gpu/drm/nouveau/nouveau_drv.h
+++ b/drivers/gpu/drm/nouveau/nouveau_drv.h
@@ -204,6 +204,7 @@ struct nouveau_drm {
 	struct nvkm_device *nvkm;
 	struct nvif_parent parent;
 	struct nvif_device device;
+	struct nvif_mmu mmu;
 
 	struct nouveau_cli master;
 	struct nouveau_cli client;
diff --git a/drivers/gpu/drm/nouveau/nouveau_mem.c b/drivers/gpu/drm/nouveau/nouveau_mem.c
index 25f31d5169e5..67f93cf753ba 100644
--- a/drivers/gpu/drm/nouveau/nouveau_mem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_mem.c
@@ -91,7 +91,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_cli *cli = mem->cli;
 	struct nouveau_drm *drm = cli->drm;
-	struct nvif_mmu *mmu = &cli->mmu;
+	struct nvif_mmu *mmu = &drm->mmu;
 	struct nvif_mem_ram_v0 args = {};
 	u8 type;
 	int ret;
@@ -115,7 +115,7 @@ nouveau_mem_host(struct ttm_resource *reg, struct ttm_tt *tt)
 		args.dma = tt->dma_address;
 
 	mutex_lock(&drm->master.lock);
-	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", cli->mem->oclass, type, PAGE_SHIFT,
+	ret = nvif_mem_ctor_type(mmu, "ttmHostMem", mmu->mem, type, PAGE_SHIFT,
 				 reg->size,
 				 &args, sizeof(args), &mem->mem);
 	mutex_unlock(&drm->master.lock);
@@ -128,14 +128,14 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 	struct nouveau_mem *mem = nouveau_mem(reg);
 	struct nouveau_cli *cli = mem->cli;
 	struct nouveau_drm *drm = cli->drm;
-	struct nvif_mmu *mmu = &cli->mmu;
+	struct nvif_mmu *mmu = &drm->mmu;
 	u64 size = ALIGN(reg->size, 1 << page);
 	int ret;
 
 	mutex_lock(&drm->master.lock);
-	switch (cli->mem->oclass) {
+	switch (mmu->mem) {
 	case NVIF_CLASS_MEM_GF100:
-		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
+		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
 					 drm->ttm.type_vram, page, size,
 					 &(struct gf100_mem_v0) {
 						.contig = contig,
@@ -143,7 +143,7 @@ nouveau_mem_vram(struct ttm_resource *reg, bool contig, u8 page)
 					 &mem->mem);
 		break;
 	case NVIF_CLASS_MEM_NV50:
-		ret = nvif_mem_ctor_type(mmu, "ttmVram", cli->mem->oclass,
+		ret = nvif_mem_ctor_type(mmu, "ttmVram", mmu->mem,
 					 drm->ttm.type_vram, page, size,
 					 &(struct nv50_mem_v0) {
 						.bankswz = mmu->kind[mem->kind] == 2,
-- 
2.44.0

