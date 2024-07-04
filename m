Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68DA192AD59
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D98D10E468;
	Tue,  9 Jul 2024 00:55:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="LQsqIuDI";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2060.outbound.protection.outlook.com [40.107.220.60])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B714510E465
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:28 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DqUQvn5KVqVyaGDmlGF1gMJpGBgbobX1Bba31IqFGYToQQEWldXAO69muzoztzcqvZXx5269V1tSSV2YFSz/N7qcfGMKl1rXdTcnNrhqtLa2CLoV+hsoStiR69O+5qzT7ti2FO0CohhFpqYvXp4GZpXk4aaZFkRY6IUDqFn+3lit3vHzIR8oF2v8QkyUanDrDKZBhXh+7Q/FZSmnPiJIRwerliQgI1LJl/JEqYpvAJii6xW/EIfBZmCiPgFqap+VdSoiTQMDcmhw1s+N5B6DQLqjxZhwV7/fzJmEweBqSBgxrA7P7/d0jXX/9CabHPDCDhE5IPRL/Mh/GVmEqhYN9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OLzlkRXaxIkw8wHdnFHRxay3krIWqJ4HOzCVVJ8bmes=;
 b=gnyLB81OWUmZ/RuSQj4zrkCKda3x+i6B1inMKyPUehUro7Zya0ZEtimsrCevdS0uF1LbGEqtCsnAaQLXy/JZdgaGiT8l9+GlbLfJmcFJ0nK4VirQ3z/CkgQCIFGsa4a8FewYgv0RKb12wwfpEex1/iJNEe+GY8odTY0WHGrK+NsywcdJKeTBH4rMHSCjuWGGg1M5M9Xi4d3q0itryshpjuOdC6cTLTYDP2MJ/9LOOJ+cNogp+/4rrnSNgbuggnalGDcY/7Ftjrt0LSkX7Xk37k2Q+J8AkMB5KBMiq2J87MtA7TLSlmrGXgtvQK1Pe3Tjmzwaj3SoD7Wz7qMWNXB0dw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OLzlkRXaxIkw8wHdnFHRxay3krIWqJ4HOzCVVJ8bmes=;
 b=LQsqIuDIXCvEpaAn01dsqCaT4j4LaPhRz7iFNnAVkWMatV246bKS8x5UzLJ2JJqnBl38r4oBUqudJShNpoyRxzOQ5jiDR/Te6nB6KIZhDrctND203Q+fPYpfblalWkGO1k2YWqYQ06LGD1CSvSHnphSHOhF7ByKEtPV5MNUvueGVtMtJiaWfWdlHLoiCH8KpqIRz8TPloPKbvN422mcPEntoaoRNT+Snt2Ptaw1DGhIK5VlFPkJaXhWjOEICiiIy55vIs4EgcuhY8qJOYwxS4ye3Pbjcdwxvg36PIo32sgUAiaTiFe2TvmtckBV7e8VGnA6M5Ay/rs4bRWeIbWSv9A==
Received: from CH2PR10CA0008.namprd10.prod.outlook.com (2603:10b6:610:4c::18)
 by SA1PR12MB6701.namprd12.prod.outlook.com (2603:10b6:806:251::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Tue, 9 Jul
 2024 00:55:25 +0000
Received: from CH1PEPF0000AD80.namprd04.prod.outlook.com
 (2603:10b6:610:4c:cafe::2d) by CH2PR10CA0008.outlook.office365.com
 (2603:10b6:610:4c::18) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CH1PEPF0000AD80.mail.protection.outlook.com (10.167.244.90) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:25 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:16 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:15 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 21/37] drm/nouveau/nvif: remove client devlist
Date: Fri, 5 Jul 2024 04:37:05 +1000
Message-ID: <20240704183721.25778-22-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20240704183721.25778-1-bskeggs@nvidia.com>
References: <20240704183721.25778-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.230.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH1PEPF0000AD80:EE_|SA1PR12MB6701:EE_
X-MS-Office365-Filtering-Correlation-Id: b87b4243-3ce6-4f3c-255b-08dc9fb1d1ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CckHin8OdLHwbonX4q0Y1q0yH6a7ipa676KUyRDN2z1uL+dE/C/72AgztmDZ?=
 =?us-ascii?Q?QnL1gVGupxgWuR8PUbviryIev1xzZRtioXCsKtNds8F4jta1NtR1CiqSNIXP?=
 =?us-ascii?Q?0MytlucrWS9H+wLLNwAK1ElFuhxzOwXCh+exjL1Mh8etjhpXbeKCeP/bZx1K?=
 =?us-ascii?Q?MA3uD4JkDctY73LniZtTcS7fit3bVXLd9HjcedsFbWfZnUCoWHZbsYxK+Sar?=
 =?us-ascii?Q?lsG5hp4j42x0ZdS5qxqC/0JegLEQ9ztTgpCDRVncAPhWbbZqwLsYg7L94Pg+?=
 =?us-ascii?Q?OPd2g0le9x/qofDZock35PeNjCkAnaW7IZceeaRUvCJaACL6/yZFclRHDj2e?=
 =?us-ascii?Q?DB6npxqqmJzaZu21eY7gz9Vj5eEMXgDsSCAyfgRzmi7VqeyA1J6AQGGB8tJC?=
 =?us-ascii?Q?b0TAZrEuvZsT+s45Jfm3MkumBITopm1cZy6bYPO0LiVmsktgPaKw409xn0Sa?=
 =?us-ascii?Q?zxvMh5rcTcNDQGGvZiQprIN304/M8x15qkrlhwYcWwPJptSBRbk/OJoBhLFM?=
 =?us-ascii?Q?t/cthxcLC9O6PspwdODpm2nOo4ZtoQD8IqDz18HR5hmWUWstejR/6MtX7rLd?=
 =?us-ascii?Q?odv9v9MyGqMR7d9feI+DGp5GOAjeUs56ogZLUiOLnNzoTauDEAJ4dM2DIklD?=
 =?us-ascii?Q?O4Gpk1sYulheeK9TToOnOMmf0zWJ3VIP9IQ6ilHo9YViAMYdJbPjvXr00yqO?=
 =?us-ascii?Q?+BAKoCE4nh8wzRrw/imjhJgwvFyBemkbjRM3/yP/OnVGl/+xfKfsnHPBMCqj?=
 =?us-ascii?Q?8YhmoaOBURFETO1tQwhJNvToO2G++60yJshv8JcEDKm8nbvqWSXS/bVeKWIp?=
 =?us-ascii?Q?pVHSb16uR2box43RoNBasJj/le8OeHJ61TwSkN8FK0LYnKPz8UxFnvetXElb?=
 =?us-ascii?Q?1xqZWgHGVRUPKJKUe3sQCCLMIAX+DR/fO99yxYMdAzoW1LZbfTO+mcikix9J?=
 =?us-ascii?Q?EScauS8TjEdt73SWXPfr+JfEAumv28G11h13nDSZJ9ChIOs+Wx5Q3YqTUMF3?=
 =?us-ascii?Q?SkwGWxZ4YTkW8fPjXup+UyMGDTUTYApJX5vyLeBw0iqPF4TUYykFkU3FwdB3?=
 =?us-ascii?Q?DTCIlmW4fyiAjssTCfRXwj9rUEKJrSY/y1r9iHis3MTp4mkRQdmYl3DvBRRj?=
 =?us-ascii?Q?jYbrie8P9fGPW0luPmjY85OAuyzX5/Uk1LRPHdz40xVuRFKVgAch0WM5sV1Y?=
 =?us-ascii?Q?ixmFsB6F5arvPef2Z2/ckbaJekWZ0OVz0rqBwM+uSwzuDkR/8jwar6aWOseq?=
 =?us-ascii?Q?h98sSGZGZ992L4sYXyfQkehk0dfTjB9+pRXfqXchCH/Z6FGI6N42EdA5FKBX?=
 =?us-ascii?Q?2xmybaxDyNTqBMLBfvvqIchnO+ClxXBUCMAuYVKP2GMJWglooYR8eyePA27O?=
 =?us-ascii?Q?qWfLmYX+JGECOrsxpcR21tP3wTv8JyedZSFgC8XxdRxGM51xQz3k6XcV3tOV?=
 =?us-ascii?Q?sQXXzpSduJgDGS8QJl3pQzHDfqu7kmc5?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:25.3862 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b87b4243-3ce6-4f3c-255b-08dc9fb1d1ad
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH1PEPF0000AD80.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR12MB6701
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

This was once used by userspace tools (with nvkm built as a library),
but is now unused.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0000.h |  9 -----
 .../drm/nouveau/include/nvkm/core/device.h    |  1 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 40 -------------------
 .../gpu/drm/nouveau/nvkm/engine/device/base.c | 14 -------
 4 files changed, 64 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0000.h b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
index a93f91d56a09..c06383835337 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0000.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
@@ -7,13 +7,4 @@ struct nvif_client_v0 {
 	__u8  pad01[7];
 	char  name[32];
 };
-
-#define NVIF_CLIENT_V0_DEVLIST                                             0x00
-
-struct nvif_client_devlist_v0 {
-	__u8  version;
-	__u8  count;
-	__u8  pad02[6];
-	__u64 device[];
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
index f057d348221e..46afb877a296 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/device.h
@@ -109,7 +109,6 @@ struct nvkm_device_chip {
 };
 
 struct nvkm_device *nvkm_device_find(u64 name);
-int nvkm_device_list(u64 *name, int size);
 
 /* privileged register interface accessor macros */
 #define nvkm_rd08(d,a) ioread8((d)->pri + (a))
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/client.c b/drivers/gpu/drm/nouveau/nvkm/core/client.c
index 6baa3a4fa0a4..5c87146b8508 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/client.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/client.c
@@ -65,45 +65,6 @@ nvkm_uclient_sclass = {
 	.ctor = nvkm_uclient_new,
 };
 
-static int
-nvkm_client_mthd_devlist(struct nvkm_client *client, void *data, u32 size)
-{
-	union {
-		struct nvif_client_devlist_v0 v0;
-	} *args = data;
-	int ret = -ENOSYS;
-
-	nvif_ioctl(&client->object, "client devlist size %d\n", size);
-	if (!(ret = nvif_unpack(ret, &data, &size, args->v0, 0, 0, true))) {
-		nvif_ioctl(&client->object, "client devlist vers %d count %d\n",
-			   args->v0.version, args->v0.count);
-		if (size == sizeof(args->v0.device[0]) * args->v0.count) {
-			ret = nvkm_device_list(args->v0.device, args->v0.count);
-			if (ret >= 0) {
-				args->v0.count = ret;
-				ret = 0;
-			}
-		} else {
-			ret = -EINVAL;
-		}
-	}
-
-	return ret;
-}
-
-static int
-nvkm_client_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
-{
-	struct nvkm_client *client = nvkm_client(object);
-	switch (mthd) {
-	case NVIF_CLIENT_V0_DEVLIST:
-		return nvkm_client_mthd_devlist(client, data, size);
-	default:
-		break;
-	}
-	return -EINVAL;
-}
-
 static int
 nvkm_client_child_new(const struct nvkm_oclass *oclass,
 		      void *data, u32 size, struct nvkm_object **pobject)
@@ -145,7 +106,6 @@ static const struct nvkm_object_func
 nvkm_client = {
 	.dtor = nvkm_client_dtor,
 	.fini = nvkm_client_fini,
-	.mthd = nvkm_client_mthd,
 	.sclass = nvkm_client_child_get,
 };
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
index 6ca1a4cb9cee..9093d89b16f3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/base.c
@@ -53,20 +53,6 @@ nvkm_device_find(u64 handle)
 	return device;
 }
 
-int
-nvkm_device_list(u64 *name, int size)
-{
-	struct nvkm_device *device;
-	int nr = 0;
-	mutex_lock(&nv_devices_mutex);
-	list_for_each_entry(device, &nv_devices, head) {
-		if (nr++ < size)
-			name[nr - 1] = device->handle;
-	}
-	mutex_unlock(&nv_devices_mutex);
-	return nr;
-}
-
 static const struct nvkm_device_chip
 nv4_chipset = {
 	.name = "NV04",
-- 
2.45.1

