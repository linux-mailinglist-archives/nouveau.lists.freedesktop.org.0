Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6458AB2B64
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5212910E1D7;
	Sun, 11 May 2025 21:09:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="FRv8cf2S";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2086.outbound.protection.outlook.com [40.107.101.86])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C73210E1CF
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:07 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JAosXHFK5BzFyRbYUd4yLwX7SQbOo4/Hhw3np1UkpvyQ0HiN+rd9cOX12nayFxkkWSm7MKDG62k1WIj6f33E/zVLO209d++YKY4XOZsKntIb9oCIWvdglZq8oFaCk73rCWgCerqfCxTmPINOnVJzHI3PZJIVXhloU1xjmI4ACfCoqaB6+Dw1LqgrW7pLGxpIGoN4tB6mTU6ZYKF0wI+FcWphKzQrdFTcibF3ZkqX9zdyUG8Y9SDcpUUAq4iAeNwPeU8h8AKou+B/r7Q9J35I+OdP4Q4cHfJDlIegPtmpaoYCQxOTqNJcPHyWuL3/lb2ntZjglEMRiYkR/xfuD0sMOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=p1xf7Ykjlx8MYk7IXynNxuB5ASpLA0gSrbJUAOB06MU=;
 b=lu/NKgA5S6xoo3qWQ2zVyWMDDcobjr0K+Jb4F+jGlPt0+ao5hvCo0zIdyG2KEG0H4brWi+FT6dxIfZPoBGtZgWVvyV5x1yUwLwsANYg6XOSCcfkJy/Pc6CFoh4i7swZWdI+XmD0omcBCvsXUjM+VLsObXOI5s25xw6HMbx/89buX+Xi9OWcZ+X+Fb0Xr63iqDRGt4jFVI8lHtvTITwptiGPjaxeJvImA+9eHVTku0L7o9DLofZiYFdhQ8EzfBlXXlbsLrPX0pYIRH+msRnq2wQ0LixnggaieLxhp6qmvDmzLCc6nS0fPDsci3H8w0cPd6cn6iqsgitX7h1tOQyQgmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=p1xf7Ykjlx8MYk7IXynNxuB5ASpLA0gSrbJUAOB06MU=;
 b=FRv8cf2SCkQql5uzhfNtKqJHwVWS1FBfypnz7RAX6o0OsS+vOpbv+m6gPVTVsj2uY2T+OjZtMuokACzwQN5Mp0utlAobq8WU3X3yikcsCFAEzrBdCLkQZ7kkWTiUY1oIRDfR6wCopbF6XlMMQ2LqIIxd4hEunobcMnQ/MCwoPe5IPjb0fLL39gPHdAOEZ7/H/K5D3+rtb71ouVF8ifSBew7rqGkjtDH3Fo3BORyH0Sq9K9P2m899edddsTGJO/wtkKPz9lmMJ5D4ps9D++onN+Sx0jQtdpjCisQ7Yk2qZ8A/HaxJBHtWnMz9n8RHm7T5ocSeRsg95dS10sij/bUUlg==
Received: from DM5PR07CA0079.namprd07.prod.outlook.com (2603:10b6:4:ad::44) by
 CH3PR12MB9023.namprd12.prod.outlook.com (2603:10b6:610:17b::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Sun, 11 May
 2025 21:09:01 +0000
Received: from DS2PEPF00003442.namprd04.prod.outlook.com
 (2603:10b6:4:ad:cafe::e8) by DM5PR07CA0079.outlook.office365.com
 (2603:10b6:4:ad::44) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:09:01 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003442.mail.protection.outlook.com (10.167.17.69) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:01 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:08:52 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:08:50 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 29/62] drm/nouveau/gsp: add hal for disp.get_static_info()
Date: Mon, 12 May 2025 07:06:49 +1000
Message-ID: <20250511210722.80350-30-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003442:EE_|CH3PR12MB9023:EE_
X-MS-Office365-Filtering-Correlation-Id: f1462d61-5c23-40f6-5863-08dd90d00dc5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uerrvndw0wUGuTNyVg2NGW1zQNgXbiMkMtK5coCN+ZCKLWgfioA1jb1cZQXQ?=
 =?us-ascii?Q?FJgM6rdMuMr4EYxebhCPW6t+C17cU4UIrboFgJyEgH2G3Q3QPokNkogJqEgK?=
 =?us-ascii?Q?nKNKPR7TnbYrAoG+WjPnGNpuge79YpwzWL6WSU8TXPGn6nkU/gdaYNDrWU9h?=
 =?us-ascii?Q?ypDV9tceWOWW685LKk7DqJksdS6uxS5Hiyjr6yZ5/FH61b3QgFJzQMfPqRVd?=
 =?us-ascii?Q?WWSJSTZORagIqNLWEGFxVU/SxKO2Eco+0q49CINtUHhnEBAILtytYjTePiRX?=
 =?us-ascii?Q?uAjWrT+mbeTGG3tD56p+w6aMiQ4Zn8u7QJV7wa0ESP5kfncRbt/23vaQ/8hd?=
 =?us-ascii?Q?Hi6zwykmGlTtHtVB8i4m7SC4fEdsH35dqKmMfKd40tBKAawjeXbodITk+4aM?=
 =?us-ascii?Q?ZTOHcOkFL7+u8F/zvtMxdXNr21Lmm1kCvqpSu1MuYkLWVjVFyXyiRuLd19LI?=
 =?us-ascii?Q?zK3VwGmE1PqOUBnVbc4Pp5v/mW5ncwaLKS3QMx5P3OKMy31/5iCCAGtG18W0?=
 =?us-ascii?Q?cwGK+xZDL1XCV1bIjd5fr3ur3xvwp6DVpWrnzZ0LbU5sf/pgN5zlTEG0Vhs9?=
 =?us-ascii?Q?SsgmcnWtfmHek8XgIZXSzx4ey/lZaQfhiKDyRranSNg+eVBqzj0FDxOuHIli?=
 =?us-ascii?Q?RqBxmV1L1xJXsKs8NJDsNx0w0ymZSriwLP3Sonlt49pILwOPnb6r+nPq8l4Y?=
 =?us-ascii?Q?swzmYd7103Z+lhxNd2rghITXQtw8gmgATtevFwv3r08W1IirtEZwMObv6pET?=
 =?us-ascii?Q?czUfMGGC/EpjGGY4MVDyV7ShaGW/zM5mJeJfElfiyV7y4lMrRPAoj9cUc4em?=
 =?us-ascii?Q?4+jiBAnQW1SmC+y25IFtBMLMCuuyZunfHJrhNAE5Ym/4ePew0ajW/qf4+VJH?=
 =?us-ascii?Q?Hb0KEJO+JXzC/xq6bSEbRZLQ/thMsSmj/K/4eyWIx+eVtebFqjn1pYnvpMOf?=
 =?us-ascii?Q?91fqdEPbQH09uJzSaqq635+SwVFL7qajfwFeDDAMjQWTY1W2lxUDbDgp8hcP?=
 =?us-ascii?Q?0Uf7xxm9qqq2dUgoaHnX7ejHRrOM1Ub3wbhKm/PdODutG970beIkjZsFwgKF?=
 =?us-ascii?Q?UvIv8/J60znHtKz/Hld43r8d7rGhAzqaDFeF0wIimyWS112nWVC/kMC0YdZk?=
 =?us-ascii?Q?NWjy5UIUsvgR+by5I8TRoj+UA/OTJLbxHZI4pmXwqi2Do3E2qbp377whs1cR?=
 =?us-ascii?Q?sHMmLVbihVmG1rULlyGY6W4jNP4LR4mE35xVIUmkIzHOr4Ckt9kGpeY3Y/EO?=
 =?us-ascii?Q?mF1rAS60KodMcdMyWVAUsmEtRklz//YxNqlmr28SzlfHp8L+uE3PdHJfWc6t?=
 =?us-ascii?Q?ky9tzSQW8j60kNZJONTMDkftnaiyrvXoNlH80yLhjd6X1Ce9bSS7ceqGLvvx?=
 =?us-ascii?Q?X/6jwrE8zGiSVhA4kHjx+mtBAo8nuZxv9TUqZyjb5jjfczdB7/ZBUEXNGOZv?=
 =?us-ascii?Q?HESy3jHMZEsfncfbrftJMO8n9Dof658osDjUgcVkbMRqfCVOf1Gvx+OwNqLZ?=
 =?us-ascii?Q?SDRYxonmecTwZxTIOWq4fE615aczjly0U+ju?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:01.3581 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: f1462d61-5c23-40f6-5863-08dd90d00dc5
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003442.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR12MB9023
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

550.40.07 has incompatible changes to
NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 37 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h   |  2 +
 2 files changed, 26 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index aa7df43e8a12..8cc0b6529296 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -1439,11 +1439,31 @@ r535_disp_init(struct nvkm_disp *disp)
 	return 0;
 }
 
+static int
+r535_disp_get_static_info(struct nvkm_disp *disp)
+{
+	NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
+	struct nvkm_gsp *gsp = disp->rm.objcom.client->gsp;
+
+	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
+				   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
+				   sizeof(*ctrl));
+	if (IS_ERR(ctrl))
+		return PTR_ERR(ctrl);
+
+	disp->wndw.mask = ctrl->windowPresentMask;
+	disp->wndw.nr = fls(disp->wndw.mask);
+
+	nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
+	return 0;
+}
+
 static int
 r535_disp_oneinit(struct nvkm_disp *disp)
 {
 	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvkm_gsp *gsp = device->gsp;
+	const struct nvkm_rm_api *rmapi = gsp->rm->api;
 	NV2080_CTRL_INTERNAL_DISPLAY_WRITE_INST_MEM_PARAMS *ctrl;
 	int ret, i;
 
@@ -1476,19 +1496,9 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (ret)
 		return ret;
 
-	{
-		NV2080_CTRL_INTERNAL_DISPLAY_GET_STATIC_INFO_PARAMS *ctrl;
-
-		ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
-					   NV2080_CTRL_CMD_INTERNAL_DISPLAY_GET_STATIC_INFO,
-					   sizeof(*ctrl));
-		if (IS_ERR(ctrl))
-			return PTR_ERR(ctrl);
-
-		disp->wndw.mask = ctrl->windowPresentMask;
-		disp->wndw.nr = fls(disp->wndw.mask);
-		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
-	}
+	ret = rmapi->disp->get_static_info(disp);
+	if (ret)
+		return ret;
 
 	/* */
 	{
@@ -1728,6 +1738,7 @@ r535_disp_new(const struct nvkm_disp_func *hw, struct nvkm_device *device,
 
 const struct nvkm_rm_api_disp
 r535_disp = {
+	.get_static_info = r535_disp_get_static_info,
 	.bl_ctrl = r535_bl_ctrl,
 	.dp = {
 		.set_indexed_link_rates = r535_dp_set_indexed_link_rates,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 9df95c5b9961..b9c775aec58e 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -72,6 +72,8 @@ struct nvkm_rm_api {
 	} *device;
 
 	const struct nvkm_rm_api_disp {
+		int (*get_static_info)(struct nvkm_disp *);
+
 		int (*bl_ctrl)(struct nvkm_disp *, unsigned display_id, bool set, int *val);
 
 		struct {
-- 
2.49.0

