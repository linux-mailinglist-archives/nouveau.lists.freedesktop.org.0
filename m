Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E79DAAA3C82
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83BCD10E57C;
	Tue, 29 Apr 2025 23:40:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gSY1xJV4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2065.outbound.protection.outlook.com [40.107.220.65])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0773B10E56A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:27 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ejg4iIabdkP+ZyVSG8zr9XY/d09UTGc/aJ6UKx/P6FeE1B5NArQUlhVBqJt1hqthLHkFyXo20z7fli3cinaMFPT4Ei9GDfB1C+2l7H7lRnNQNZlaglLkkUL1BSq18WydbiOcwCTqy+kXKfr6nUaxl08tTw/ewnv6BNTf4x6JJmTqBcJsdiGLmm+qU9GaaPWQrQ0cplSVeGv1GPC/acikNIZgGV4U529xbAvvFBbLOitJkuFI/fSvRoDFkWO2tCTnCxhEUvL0N4MaxZAwVTiGRnv0+8hURVNsqIMCnNP0n2nXOkP5II0Jqzx/O0PlTqOqJaCuTascMa2Op1FSD3Pg+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6Lx6UChoDgnjyp64qSQ5fr0jcZNU8jmDilEwWKxhYVY=;
 b=wnw9Qh7kF1dY5R3GIT2ai3ctmse88W3WSGjlwJeGO3Y1KEMvlzOozzYqfPHmxJ70cSUCQz1YXK/qApes3nnRMfdhr4vnP8AFBnvxQ42tpTkMnLHbhKOfTgs0D0Z9BqkHR5Vk5Trqa6/obS915bJMUy7dn/CNqnsxRQNjrtH7qcwCLbVyMFjPnjZymAF30rNUOq+iy0OlvmqSsAxEjzRuq7Z/+XwiJ1rNMqUx80UFvHPs4HvJfNfvBrlYYYyztIX2oNUFr+DTfWqdnijstK9blS8iovE6L7Xh9rwjEMK3rpBPXE11uFgh/qciI1xSzOl/GfctD+OAbqvUwKvUqXajiw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6Lx6UChoDgnjyp64qSQ5fr0jcZNU8jmDilEwWKxhYVY=;
 b=gSY1xJV4KEFqNvU1bKQzfirQbbX186Cv/78qDl/9ehNhkW0+7/jiiWKH0HODRgSQGxuPBWVhHcgp1QT2XxuqdZWhgAvEEnlOBRmMjunbLYu+Ii1zWjjFjJsaJKeqiEtvg29sW7x4djHFU2JHmFOXpurWqqBb5lEiXJtxFJ6aFV8hyU0qAUmXTOdvzohnMblUhLwU3RT3mtfSunhkxcAA0SrGpxiMaSyWoRm+TjrGB4QfzU2I0+kPKPBm805vSVqhPfCo/eGvYHoseHjZX/uwwRArGyN/hZhyvH3zXbA7r2nF80VEPqJOIpd7znxQ7ysFzxTBPA+2cRGNrmBsfbyIKA==
Received: from BY5PR04CA0006.namprd04.prod.outlook.com (2603:10b6:a03:1d0::16)
 by DM6PR12MB4465.namprd12.prod.outlook.com (2603:10b6:5:28f::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8699.19; Tue, 29 Apr
 2025 23:40:19 +0000
Received: from SJ5PEPF000001EB.namprd05.prod.outlook.com
 (2603:10b6:a03:1d0:cafe::69) by BY5PR04CA0006.outlook.office365.com
 (2603:10b6:a03:1d0::16) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.36 via Frontend Transport; Tue,
 29 Apr 2025 23:40:19 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EB.mail.protection.outlook.com (10.167.242.199) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:06 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:05 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 22/60] drm/nouveau/gsp: add hal for gsp.set_system_info()
Date: Wed, 30 Apr 2025 09:38:50 +1000
Message-ID: <20250429233929.24363-23-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EB:EE_|DM6PR12MB4465:EE_
X-MS-Office365-Filtering-Correlation-Id: 5f9a0ffe-5e87-4b31-1895-08dd877733c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+Ov3EPLivyT5bK411ZqEBJr/z1A68ENDg0SCHvygEPMKGHkQOxvbqxAvaL1h?=
 =?us-ascii?Q?0Nyn0ivCMHyAqA0kqh8OAcs/VeOtbNELgfBNv2182QXdBCh8DKxiso6ci+di?=
 =?us-ascii?Q?LZcWCV0iHIkEqkU9yh1A1GpMbGghnDVoZFV5JM7H2LNn3jrZ6PqtH9CSlr5s?=
 =?us-ascii?Q?hJdmZFMrE5642rBi+TqUCSLGRUdChRG7YAl+qewwOAygUJBHSvOMyJqqkhXE?=
 =?us-ascii?Q?i4gJUn+IbXdn6va+5bXuxVQboBZg0lfeXZG9r0Bxin39zs+taz+VANtrL56l?=
 =?us-ascii?Q?VQBZbCdLFmwRdd4+iOmpoHz0fHIDEcEhBeDHx4FlJpJWLJFraPIzHElheXmc?=
 =?us-ascii?Q?JLf1NtS8+/KNLsjXV/3WsbIu7XSGnYRfI4WkU3JcQbiBkc+6DYN9q8kA7SEo?=
 =?us-ascii?Q?8L9RZF9h3ChWoEYTsrD2oZdcg64F3cuHbr7YoOV276t+CEGO0LuDrwm+izDK?=
 =?us-ascii?Q?5204J7lBwjhsyS639N/zVX2UAVHwzcwUx/svZV54IDUW/3NSs2R0DT6gBg9/?=
 =?us-ascii?Q?aXaZ8FhP8R/EO5Yb4rDgJpz1mYpL87EsDG6Pxxll4gBpNh41waSCRRpABp+G?=
 =?us-ascii?Q?VyhzIqP2+2dlEVdiwTub5TH/Wqk068TcMk6q6fRVLE8Pc3QPHIJhujJ6GgiA?=
 =?us-ascii?Q?LOm0cJAbdZwjytMv6yWi6J7zXS8BBXAFewygi1xPQ/aisQs4r9W56ZNrOR+x?=
 =?us-ascii?Q?G6kSKS5bJklBxHLfF+5K0Vo+nub+jHe1Ydx/o3tk1HgYGErLOoE+eC0LxSZB?=
 =?us-ascii?Q?cCTzSR+DK3WV919hz0qLaLY1Hvm8vyKlAkkEhY5rW/7ncs+1Q60vL3tM62Lx?=
 =?us-ascii?Q?pFET7q3x1DMe9eQbN2/4ngpfJxoBQ9RCNNtRnJq5Ox2Y3lYc4EUyTjfW6n1J?=
 =?us-ascii?Q?hs+t/5CVuXG0xXcQ1yssxIK0M8skQvAyD4VKDF/2SREk9SX7HkxFbNUxvGml?=
 =?us-ascii?Q?Z7F0xm/zTGLTA/3dLVxn0rVH/dN3qGauvas28Np2sA+JNHWatuOL8bLH/0Jw?=
 =?us-ascii?Q?eUINGmm4gnobTtyIBD/I1dpWhVO94x7AoFxYiZD6MtlgRJYcrjZ6lGZ2M9rv?=
 =?us-ascii?Q?WOmlibaiwPii33mdZ34FAKd3tLop9ee6ybWABFVFQYtWUJnYtqqZJ/i4/jl9?=
 =?us-ascii?Q?gdYv2UILL+qv7pXVf6soewHBG91kU9Xp2f8nEew2rJnSB5yWR7xZ6hFkwHp/?=
 =?us-ascii?Q?iQStwxgXCh4NieDhORRtNhJfSVbh/Jif6dffDr7nvpJLFTE6MLEHxO/p0BZx?=
 =?us-ascii?Q?RFsToci7iMb4ArKW99vaseU7QznIyHjRuwkm27RJk2HlINizllAQhqiPWAHc?=
 =?us-ascii?Q?KQcrShYhYlyROKmsWMPPyNA6QhbInZZZyqYDkPGNPEy6IUe6/EWMLm6nv3P6?=
 =?us-ascii?Q?KPUtyLLFBNsG3gCQoAN/lK9Pa3wNXf6lBYO9RYMCvuX11gsCIv6TD8+KhURU?=
 =?us-ascii?Q?3syCeMc52OnwOxu3riMjfIn2G6ufbF6YhJ/EL9OMvO3piKoScRjUZyuQy4Bb?=
 =?us-ascii?Q?C2uawJwaAEUpxn9wFtvhEh2wXp6LY09PXuH6?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:19.5598 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 5f9a0ffe-5e87-4b31-1895-08dd877733c6
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EB.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR12MB4465
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

545.23.06 has incompatible changes to GspSystemInfo.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c | 10 ++++++++--
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c  |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h       |  5 +++++
 3 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index bf8fc82b0360..b225dd06d490 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -872,7 +872,7 @@ r535_gsp_acpi_info(struct nvkm_gsp *gsp, ACPI_METHOD_DATA *acpi)
 }
 
 static int
-r535_gsp_rpc_set_system_info(struct nvkm_gsp *gsp)
+r535_gsp_set_system_info(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
 	struct nvkm_device_pci *pdev = container_of(device, typeof(*pdev), device);
@@ -2085,6 +2085,7 @@ int
 r535_gsp_oneinit(struct nvkm_gsp *gsp)
 {
 	struct nvkm_device *device = gsp->subdev.device;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	const u8 *data;
 	u64 size;
 	int ret;
@@ -2139,7 +2140,7 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = r535_gsp_rpc_set_system_info(gsp);
+	ret = rmapi->gsp->set_system_info(gsp);
 	if (WARN_ON(ret))
 		return ret;
 
@@ -2151,3 +2152,8 @@ r535_gsp_oneinit(struct nvkm_gsp *gsp)
 	idr_init(&gsp->client_id.idr);
 	return 0;
 }
+
+const struct nvkm_rm_api_gsp
+r535_gsp = {
+	.set_system_info = r535_gsp_set_system_info,
+};
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
index 3355b8be0ee3..860201d47810 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/rm.c
@@ -39,6 +39,7 @@ r535_wpr_libos3 = {
 
 static const struct nvkm_rm_api
 r535_api = {
+	.gsp = &r535_gsp,
 	.rpc = &r535_rpc,
 	.ctrl = &r535_ctrl,
 	.alloc = &r535_alloc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index e2bfcfc611fc..a0ea5f2f0dd2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -25,6 +25,10 @@ struct nvkm_rm_wpr {
 };
 
 struct nvkm_rm_api {
+	const struct nvkm_rm_api_gsp {
+		int (*set_system_info)(struct nvkm_gsp *);
+	} *gsp;
+
 	const struct nvkm_rm_api_rpc {
 		void *(*get)(struct nvkm_gsp *, u32 fn, u32 argc);
 		void *(*push)(struct nvkm_gsp *gsp, void *argv,
@@ -70,6 +74,7 @@ struct nvkm_rm_api {
 
 extern const struct nvkm_rm_impl r535_rm_tu102;
 extern const struct nvkm_rm_impl r535_rm_ga102;
+extern const struct nvkm_rm_api_gsp r535_gsp;
 extern const struct nvkm_rm_api_rpc r535_rpc;
 extern const struct nvkm_rm_api_ctrl r535_ctrl;
 extern const struct nvkm_rm_api_alloc r535_alloc;
-- 
2.49.0

