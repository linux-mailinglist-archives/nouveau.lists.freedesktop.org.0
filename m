Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8F16AA3C92
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A43A10E591;
	Tue, 29 Apr 2025 23:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FPKRttLm";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2055.outbound.protection.outlook.com [40.107.94.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D6CFF10E589
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B0aYs85MLB4VdIQoFkzu6bD7JV1phxaQGivuAdOxAoHezLmJ3KRTi5/KiL8MH1IuY0RXZbdcZFPFMHMT1KR+eBXDHnrxqKosfe4qS6MiZisntXsfXNyBCM7SQ3WhtDlmdNeWbcZipENgmHoUpXX/1PkMjZNoEhzyEo2F9IcvMnaUcyOAuvpVuZAgATWMfhNkCnnzjquwjhTPb9aGs0rFyO5+AeNAw0FHhlsi0Ysi7EQgL69xWnPfXaIo31tbScT0mTfw/r8KzNGosR97tevSD2WtYVTR60lUp1RW7gVqy2ZgMwTaKEJVIf8LEplZ8rEu00MPJlPeXg38Cig8+NtnXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nGF+LL6QYC2v6Mz0NmBU9IfFfWuFJPm34xt6I0IRiW4=;
 b=v3mGaEScaAfxwvv7F8QZv5YHN65t9e/x8V+g201SCcZX/DC4mTwh3ozS1c4PM/G6zZLFI8bxTMVQJjxclBlouzSPIylQO82qjintAQcgfppuezauh1vn+tlCWOXej2+HGCJbZNE/qZEnexqKDzaLGp9NQbhO3YJ0AyyksiE/+jwp2zAF2OZw1AvcDan6Dsyn0Km488QJNEQqnOiEkQ/uNnzceI54fVXkdfwitfri1SqjBrTyy4MESqnduhWbrW+9Nk+UUN4a2hygRJ8TEvGcNftI1Kzk109qN8lRCZq7Awa3or7XcofsAOmRGL1t+CthVYo1gvuygw2B2jk8490/iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nGF+LL6QYC2v6Mz0NmBU9IfFfWuFJPm34xt6I0IRiW4=;
 b=FPKRttLmbahUOs7F6kdLcij1eaH+vpl9UASkxvS3E6v5kMfV5XXVzyOfM6z2DVx7iGiDZVWZzTsRH8i3KK/RRxyEh7e7LZ4jQDQ2BDZasdM3IbgrYQfP9F9SKg4On9gG79XZXULo6Mz+HImJz2I4IihimMx9cmAjKmmsSS7Vy8ICbkhBmPMaAOUQQJszOqcKL3htiTyxeqQs6DtXZrCZhHs9M1B2NzdkVt7Kur2XiUBEGoXNvoNO6cc+AKtWcdTHDVeYEWsrIQbyXdsyljlacOJO9QvAfLPkoXmexDklw+qFWnZe9ZY/O6f6xsTId84BFqeK/cMHCpzpbgXoLLjl1g==
Received: from SA1P222CA0053.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::27)
 by SA5PPFE91247D15.namprd12.prod.outlook.com
 (2603:10b6:80f:fc04::8e8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 23:40:36 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::75) by SA1P222CA0053.outlook.office365.com
 (2603:10b6:806:2d0::27) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.37 via Frontend Transport; Tue,
 29 Apr 2025 23:40:36 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SN1PEPF000252A4.mail.protection.outlook.com (10.167.242.11) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:35 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:21 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:19 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 34/60] drm/nouveau/gsp: add hals for fbsr.suspend/resume()
Date: Wed, 30 Apr 2025 09:39:02 +1000
Message-ID: <20250429233929.24363-35-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SA5PPFE91247D15:EE_
X-MS-Office365-Filtering-Correlation-Id: 1afdafc4-5c14-432a-ecdf-08dd87773d95
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vFIIYSuRa975jBeXVeuMtaFCwXTNYKETn4iPVfCQ2hi0gEZ3PrEdPL5EgCgN?=
 =?us-ascii?Q?UAfqbHzjhcFvj9yiteXbk3xj8MRrKWLoDn0wjiFLARW002cSoP5Q8fmtma7E?=
 =?us-ascii?Q?pWmTQ3mPzBqqTLxRaU5k/N2CBvhBOcp+3EPS1ftmA4bvjGnB1Nm+imO6Ppz+?=
 =?us-ascii?Q?eZO/vihunPTS4MnXbRCr0ZRaOouXxDC2Okc0YsBJa19WPxNVYvKS2B3LBQdG?=
 =?us-ascii?Q?ZbaY9khXko7qO48c/eF20XVrRbT6TEGhbfzW2cfjxxpft80iW1dH7351Q1P/?=
 =?us-ascii?Q?v83w5lvcLXz3zuLvLADfFXz3UZx2RJQ5lU+bbSvjRm9a2ZzASxQWbsV7pjZs?=
 =?us-ascii?Q?AMDgewoC1lIlsvSkpb6Va7keeCXtU8+UI+FvAUjiVpPVbLSaONB8C8t/czW0?=
 =?us-ascii?Q?bR+xwxgLPwcEPUMXBN/T3dj6nauDy/0KvP0RrHZu/Sp/lMrEf+zyUjJ0oYXk?=
 =?us-ascii?Q?ZgPD9ONMwWzUVce/nGPDEE9qwdKLl/IrtVA6n98UahFB1njsDuyOdIAGKs4/?=
 =?us-ascii?Q?zKOlHrnC3nmYk2hpujxkV7/U38IxS3awnSog3VmTpoy5fMlUvGbqG5tPfOhV?=
 =?us-ascii?Q?1JbNTmmGc63TYpvnf3Iv4NcqIrVT3QcU22DKWjmMcTIvUyO75lUBwsdwNhKL?=
 =?us-ascii?Q?ieXdr+pjIvzqfVMPGhYLtmcJUY+7Okvir6LQDAPGNBgnWrfjCjYKyQYnhcaJ?=
 =?us-ascii?Q?WGMzjBr8rXX9lYQ41Ta5TxKH0zBS/1nvI9Tq+cqW6usOZV5CCk7rVw5rF9I2?=
 =?us-ascii?Q?IsfSd3scdH4rOYeUbPzDZyr3BNMNHXx82fBkZdOrrYbWASONjmBf1fl232Ny?=
 =?us-ascii?Q?cBjyiTsB7sT4vGWzyuh0LN3fQfrgreCCDQIUaCu4eO8gdKvlddIO4dm2kcDW?=
 =?us-ascii?Q?EFWY9ZfEluEk78bsDwGv8y1zJoPJ2qkze4nA7UwviviNpiI3s2dsFsDctbqX?=
 =?us-ascii?Q?mus3t2v4ppx7ut4xd+QNtb2KgxlMm1TX8tOqxqpvjOfWB5OI8yQ5lgSK1SR0?=
 =?us-ascii?Q?Kmk4QAAtIH42bsnougnm/GA0MnPHVGFDZROl7kFvEIQLoOwViJ8CyT4PV+5X?=
 =?us-ascii?Q?dlRUEEgKAIBOxtJJmddVX3li7KQDbf3p6jNLJXyRsN7ARIkVT08z0zCcDQX4?=
 =?us-ascii?Q?h0PzZGReVJmj+fwY0Ns1CeYZJ3DPCK/pchwVHUZmOAVgsADaK9DWlCo0B9Be?=
 =?us-ascii?Q?4pHSzFSWOpa8SAGpJa1zRyoh2uasCj1zoKLy6Af3OO6zPyeYZnkH2Mv6uaSL?=
 =?us-ascii?Q?a8vROKAnpZe1DrZQdq1Fp5JWYXb+oG+scZWXeyaMPCLD90t6q37n6bFQCBX/?=
 =?us-ascii?Q?hPzzB5GiXTFb905jZ5h/p4VL1+hBgCQs9t6ctrrWszx5HeDINO+rouF6NE+T?=
 =?us-ascii?Q?wDjMHtsKqposneWM/BXnUCuE2VXOeYRR8hmA2uTokPVc7dCpgLaF4EJl8AFn?=
 =?us-ascii?Q?stHUG4gWr6lgAsh2j93YzhVJ6NhDUYACT01zea8sUP29ZSqUMHQV9chjOpNK?=
 =?us-ascii?Q?5LVeYyn9vqRIT5W0Vo+ZvLV11HImyQrBY4Fj?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:35.9092 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 1afdafc4-5c14-432a-ecdf-08dd87773d95
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA5PPFE91247D15
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
index 6a63abd2af79..8f53460444e4 100644
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
index 2df551d61abb..fc1f4219e624 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -1735,6 +1735,7 @@ nvkm_gsp_radix3_sg(struct nvkm_gsp *gsp, struct sg_table *sgt, u64 size,
 int
 r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
 {
+	struct nvkm_rm *rm = gsp->rm;
 	int ret;
 
 	if (suspend) {
@@ -1759,6 +1760,14 @@ r535_gsp_fini(struct nvkm_gsp *gsp, bool suspend)
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
@@ -1792,6 +1801,8 @@ r535_gsp_init(struct nvkm_gsp *gsp)
 
 done:
 	if (gsp->sr.meta.data) {
+		gsp->rm->api->fbsr->resume(gsp);
+
 		nvkm_gsp_mem_dtor(&gsp->sr.meta);
 		nvkm_gsp_radix3_dtor(gsp, &gsp->sr.radix3);
 		nvkm_gsp_sg_free(gsp->subdev.device, &gsp->sr.sgt);
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 2f24e1a62f54..71d71a5470c1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -45,6 +45,7 @@ r535_api = {
 	.alloc = &r535_alloc,
 	.client = &r535_client,
 	.device = &r535_device,
+	.fbsr = &r535_fbsr,
 	.disp = &r535_disp,
 	.fifo = &r535_fifo,
 	.ce = &r535_ce,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 173191bdc503..7a0f5c431f94 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -72,6 +72,11 @@ struct nvkm_rm_api {
 		} event;
 	} *device;
 
+	const struct nvkm_rm_api_fbsr {
+		int (*suspend)(struct nvkm_gsp *);
+		void (*resume)(struct nvkm_gsp *);
+	} *fbsr;
+
 	const struct nvkm_rm_api_disp {
 		int (*get_static_info)(struct nvkm_disp *);
 
@@ -112,6 +117,7 @@ extern const struct nvkm_rm_api_ctrl r535_ctrl;
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

