Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B938AA3C8E
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B32B710E584;
	Tue, 29 Apr 2025 23:40:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="gVUduFeO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2055.outbound.protection.outlook.com [40.107.243.55])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56F0410E58D
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:36 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HBSAkMo+VpjK42oHDlgF3Y/YjnmNbE+e+YSISq/iAACetwtsRjtLTcGgGbFbyyfZ3rhQwoHbks18I7r6JmABMOTi0uj27wTe6lGagX8m9eO7ojtVaBUM7LfIsqy1HagZDtj7UOb8OO3iXqe51cDw682rF6ID1fmdg4em8hGqU/+rbWM8nGC2QyzBImzoBcz2Fi3K3gakmpyCn261S/swutX8xNHwl18lBbUUCt6wzsA+Qg6JUE5le99OXXR55RjG1qwmWSZ0+lYW5G8gHFuGXNAWGeH2Y0fGtoeRGK9We9cNmSWt1MNEbVWQQPnFOjFkWUKEGK+i8l8KnCEpwM4a0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3AFAp+2E7+t8/nFiu2dEYjyvntSi5E7rLdvjlROrlUQ=;
 b=lnUdmKp4A5LgLl8Cxt5Zh5Ps0ljBQd3/pY59tAiryLajm7zVHuv1KSvdg9VmW5Pa7Z02gqFcdXEHa5ee65d+Ih0BXt53rpZajbjHNfnm29dWNBGdhsiI70IbFAVjH44QuBGLvRmNmaXmb2Be4LT2d/ivq4lCVJXZbt3GeTXXlJxIWlk4PYWk3iHQxJrW5EHhg+ZHIzeg1N4KRRRmO9ja/DuAO/qLVIVMhtte2ddRIFaw+21vO2VnHvsc+ooLTXTu3NNd/gxHptpxrWk6sU6HDvwUXo+cj9+Kth26JnqsLAi2wESaCPf/H8GQZ0T8twP9q/FCSf8lq5S8XtEJwFH19g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3AFAp+2E7+t8/nFiu2dEYjyvntSi5E7rLdvjlROrlUQ=;
 b=gVUduFeO7Zj2P4Mu6oSjbtfrbFl042xsRYRT/lX4RFrvROWVzVBSlb/Z3dsbEqfAvBwYWuas3B9Am1gI8xixjPiV4OZCaa1iypecZDalx7Ne8VwhP0OulKYymqQnit256jc1Rg8aaOpmoAz8NoQnsDE+ZzoJ8T6EaTT6swBgcdK4xKsynSWZajhrJ1cXKgRd0T2ixhkM+a/J1WM+omRoSHK+MdPfZN5gGQ0bjeF2mtmapAc5oqz8FlA8GfxhkvVfQw9E7PP2WYd4DqgQSHT41evTrh9U2f17eNuVQqbctafbNXwTTqivit/aa+qJ6pGnbJJ635tmmE3PmAI/9xqq5A==
Received: from SA1P222CA0037.NAMP222.PROD.OUTLOOK.COM (2603:10b6:806:2d0::18)
 by SJ2PR12MB8738.namprd12.prod.outlook.com (2603:10b6:a03:548::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.27; Tue, 29 Apr
 2025 23:40:31 +0000
Received: from SN1PEPF000252A4.namprd05.prod.outlook.com
 (2603:10b6:806:2d0:cafe::df) by SA1P222CA0037.outlook.office365.com
 (2603:10b6:806:2d0::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.40 via Frontend Transport; Tue,
 29 Apr 2025 23:40:31 +0000
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
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:31 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:17 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 31/60] drm/nouveau/gsp: add hal for fifo.ectx_size()
Date: Wed, 30 Apr 2025 09:38:59 +1000
Message-ID: <20250429233929.24363-32-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SN1PEPF000252A4:EE_|SJ2PR12MB8738:EE_
X-MS-Office365-Filtering-Correlation-Id: fb283b70-dd38-4f69-28fa-08dd87773af4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|36860700013|376014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tlu/xcBuDDrYFDpjJYXPwNrVeLlARfWGhN/3sqx72zxAnJplxPHVLFZYAFW5?=
 =?us-ascii?Q?OSNe7tITrVGkxDl6Y4/dYp9EFv82PyenSa4D20oRdJ9Zth8JiWtDqm+9C4Cy?=
 =?us-ascii?Q?JWtnNMtZKqu7TyMYTIFl+nNpMcW0eoYtcKyJ8VC6K21z7+wJThM1LcO1FsT2?=
 =?us-ascii?Q?cpdKn9t+DXo9Sc7JXkcuTTXsv+zQNNkt/8VSXtvxChEsLlYdm2W2x7jOWtJ1?=
 =?us-ascii?Q?UybAOcrbsrridsSFd1/IEV3so7IJnK2rnQyVzPlYWZhykTWRBkIEmtQqPw/B?=
 =?us-ascii?Q?xzurxYySR1wvccOfEO+C/NuqgO1XyNd1r7HS5s4GV6lkmaauezS1bR5kVie3?=
 =?us-ascii?Q?rH7ZEX+8CP0Ev8LP7HIiAGVc/KFFgJvb8fCEE/1k0QHcUjqfCISVQ6gzO1Hl?=
 =?us-ascii?Q?Xjk9MWRfh4u6yJGDmg1D523VxzmZdnJUTM4CJVp0b5B8ISbuDe1zu3F4op+A?=
 =?us-ascii?Q?QJOqP8hwlcVJHNGAn7jws6mi2BMvGTmZyatYKFxXwrMYkwlQpwHYLYUARqNI?=
 =?us-ascii?Q?EHherkJGyl7lBh+mqri68T4hK+ojKlABJQqoXXO0xtAGuPb7JhR+IUE0wpsO?=
 =?us-ascii?Q?iNlabQZ+HN+XGkZ11Ag1cNge4STPb4EgWtllMTXF1w9fCpcLhZ5W3gC2bUT+?=
 =?us-ascii?Q?aUTZmapC20uip7LEeIKwTZ5uej9qU5qxSvADPNIQ65V/AGWxmAIcz1ilrt3t?=
 =?us-ascii?Q?PHKyn+nLi9DkFIgVDeRr7E5lSfnZv1bjkZbQOrnRE6CmTHlatrdMh8ZUOHlW?=
 =?us-ascii?Q?p+cKVBBof6rK8hpI2cIqk6hbbq1lPLw4TLLtkLOo2Vu35wrrC4gRxvFijIJG?=
 =?us-ascii?Q?7wMkC0woQfsSBXyw0DlvRxSAS1CwrBK8Yj+63Ncr4eNfq80EvNH5g1M7kLQR?=
 =?us-ascii?Q?cz8yAbqDg7/dohF6K/I/vyY5ygPFjV+6f7QB5RfgPiSFVzdnNeHxTbZWSOM2?=
 =?us-ascii?Q?nLpWWLDzi3UhtXGN2w1iOaiOuwZIWzAEFhdB/Z9VWYPux4++m/nJg4ZPify2?=
 =?us-ascii?Q?VZklkaau85p9Qg6GKh4Ish/JBTU2LCIajyaK6gN9Xw7+i1TplqAXFz9wearK?=
 =?us-ascii?Q?MAIkBApEKKpVW0fu5goyO3+Y52e+114DKE8mte5U0FfsbgmYagpMGqOP7Zug?=
 =?us-ascii?Q?3K8KdCBs3WytnkNrkjcNgcsjEM6TWcmY2WhG0xn8WxD5K7NZXlgPKyXVgpwr?=
 =?us-ascii?Q?5N6vmVHMGRsXD3u8BBswOjuClggzx4rKG10sPdHRbNcssWCb7JRh2C+F4ukT?=
 =?us-ascii?Q?UWpsl0i4DZZT1B626CMemVwr72mx2dV2EyahG/rmZILoIbeedShk0KKjWSgm?=
 =?us-ascii?Q?+5ntjYnZhR2NhfqyUSzy53VoSJBpCKitobTUIbyTIwLqcp/eMPhrYMqFFRWd?=
 =?us-ascii?Q?tuOIdxkcvANITwIciGVJQpXYBm3xdtV1GNnMoFVmSuXTic2lxcWQBEcc1v3V?=
 =?us-ascii?Q?RQNa2D0xUXNaXTK7y65hY/vtG23Bi/rRoM0ioRzRXHGmiwz/Np8jK67vXvz/?=
 =?us-ascii?Q?oa4j6/XzZ12u/PHwEAnMnzPmoQiabtzAbB5w?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(36860700013)(376014); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:31.5095 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: fb283b70-dd38-4f69-28fa-08dd87773af4
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SN1PEPF000252A4.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR12MB8738
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

NV2080_CTRL_CMD_INTERNAL_GET_CONSTRUCTED_FALCON_INFO is moved to
NV2080_CTRL_CMD_GPU_GET_CONSTRUCTED_FALCON_INFO in 550.40.07.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 3 ++-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 2 files changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index 21631072926a..b763e6a59349 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -622,7 +622,7 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 		nvkm_gsp_rm_ctrl_done(&gsp->internal.device.subdevice, ctrl);
 	}
 
-	return r535_fifo_ectx_size(fifo);
+	return rm->api->fifo->ectx_size(fifo);
 }
 
 static void
@@ -655,4 +655,5 @@ r535_fifo_new(const struct nvkm_fifo_func *hw, struct nvkm_device *device,
 const struct nvkm_rm_api_fifo
 r535_fifo = {
 	.xlat_rm_engine_type = r535_fifo_xlat_rm_engine_type,
+	.ectx_size = r535_fifo_ectx_size,
 };
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index 929d66f75ab6..f8ae1853f95a 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -88,6 +88,7 @@ struct nvkm_rm_api {
 	const struct nvkm_rm_api_fifo {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
+		int (*ectx_size)(struct nvkm_fifo *);
 	} *fifo;
 
 	const struct nvkm_rm_api_engine {
-- 
2.49.0

