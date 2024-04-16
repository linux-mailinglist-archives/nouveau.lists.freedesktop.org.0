Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C5E7E8A78CD
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F89D112F46;
	Tue, 16 Apr 2024 23:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Ue6cFkia";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2049.outbound.protection.outlook.com [40.107.243.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 01CF5112F44
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:31 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kY0ZzjdE5Kqg8uibruud66R9tCwNH5oEG9mBSr5a3cNhjY6Q/VSxijsM/zLrUAkPppKyjdYXXOKfdV2o9IhCctRjkvXiaDZgfRNuxw5jwFPJZ22O6f1bVsUIsn48qHA/LG3FN25xBaJNOGuVVZ4R0fFZ0yvUKD3I1MMIKyzStEYWvjAc8CdcPFrnQiEFEmyZpmBdFeTPE1vhX5GAXPHatdjbYTXd+zja/Af+4oxucbHTD/JvGvwsBW9xshMC5Ejj8OEensQ2Xrey51RrdlakjN3XPBi8E+mpqaPjsegv8Nu3lr/Cxy55nZonSb3dEAN3v7P063CoocRAen1QnI/ywg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/Zm62cF3nwLfdBUrCRMDOfr9o+665RZK1Q5/0UkEgdQ=;
 b=Jhgw+2g7OXRoZXZUYnIduPiQrmtUcOnyi97DyMo2MUnrRKpA2cG75klBVScaGnEby4Gq5wpr+oO822qLgLagalPUBMP4GuWVdol6FG90SYNvKFAZXk/l7cTvrFbHWmLBXHL8CAEhg92Sl5smSI0hcaF53a0nGMR6+OBgZahUxLwT6qDsUWD+bnJ34tsP+kjQLrKiqXyyxJm3FXw24c+MfQjHplF8RgmTNCSWXe/4F+ul19BqpWZpbzXyXhyDDal43srveiVj3jhtOhC+cNhFPjkSwxyY/lwKjcAC4KL3OTuqSMJ20PCHzX2nQ08Xt5abmfn9ZoEyCcFipLbrBuZuSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/Zm62cF3nwLfdBUrCRMDOfr9o+665RZK1Q5/0UkEgdQ=;
 b=Ue6cFkiah1jtSoT4Lkf0RZQjJ8xBeKIZ/teIXcg2+ffxDppl4qkqdNg7Zmk0F7jtM1unEgtOOE6Qt8lcuckKwOijAoKaEIblLGbIN/cyREUxoEf1hPPbBLQEMHipqAV/DS1MIQyEXPEROw88PoVMiKEbE2QW+YsyjPJdUdT0HxDB5ecnVaebi7U89XHji8AmHLGwisRc0fkjKe339hDA2vejlbzVYeS74Pb+ynOUwg98AgZeuhqsEEMT6EWBTrc+bJuTsk40hDmnx2qMWR3dkNiAHLbyFKthgZfXimvIGXjLKlDKtMjm6gDLtq0dtafm5DR4+1Bd/peQx+4EBsICxw==
Received: from MN2PR16CA0053.namprd16.prod.outlook.com (2603:10b6:208:234::22)
 by DM4PR12MB7503.namprd12.prod.outlook.com (2603:10b6:8:111::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:27 +0000
Received: from BN3PEPF0000B072.namprd04.prod.outlook.com
 (2603:10b6:208:234:cafe::a5) by MN2PR16CA0053.outlook.office365.com
 (2603:10b6:208:234::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:27 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B072.mail.protection.outlook.com (10.167.243.117) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:27 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:09 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:07 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 033/156] drm/nouveau/nvif: remove client devlist
Date: Wed, 17 Apr 2024 09:37:59 +1000
Message-ID: <20240416234002.19509-34-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.44.0
In-Reply-To: <20240416234002.19509-1-bskeggs@nvidia.com>
References: <20240416234002.19509-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail203.nvidia.com (10.129.68.9) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B072:EE_|DM4PR12MB7503:EE_
X-MS-Office365-Filtering-Correlation-Id: 27247f64-92d4-444e-1f21-08dc5e6ebc1d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: u1mUdz1M24OeDoK8pM2iaxENoBpADpOmBfRWAAz/Urtu2NiM2vU0qv7GYPeF1qO1WaYup+FsnxDiN2P+rsT5mdtQwbbWNegvwHlGYqSWbGiMuiGbrUgiAbDoQZoqNMpIN1zgdQAmkE1fv2Ff2V7qxDuerA9HikxeJcYxo46Q/G0S+zmcJDm0axKaicEiwTxS/KV6lMjWOUsBiKFGQ/XBhIaM90skXVH7YqRIoNL6nHS1te/ZY+j0o79Z3gMNq4EHYl3cXvK2U1CpX39Xctr8g9Jkf62T1RMmX945cy0GeryLeqRE0qxlKuKDA8HDRjXpX6wYvwfRrSa7TMV9igq4RzvKnFDOsyc1JjSJUHOLg4Pl6zcd8tT+LF+yLucPo0Qn+qN4r3GLewY0do72V7mnVuv+Bs9gADC4W+SkmHQ1h74gLs38S9GT3akAM21qNNZSHtfvDARNqhakEwX/ipmm44CoJFFltVvSPh8KTR9sFA5t6yOkNLi9auS80fjzVjIX8EsvAHYkKZd7e/5ANSKQk7DWWjjsqAlHwp/vTB9jtZWimYRCitCdOlyICDzefyIbJRtzeHRBWWgPJvSMvoekqDcjss7JgLLnUF9j1aQvDqUq6q+JcogvSwgvmBhoiYMF4ZCX371EjB8MQMtnuAJjZ3fdrftOpYqbl1Q8pxWi472hBOQEA9iOczMPawN5YJvJg7HbH8Wyb8gcIM2nWEQgw8HQ/02rIjxXqajjlAnjs5XivaRy4uvuJRhI1wuxyo3H
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:27.2081 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 27247f64-92d4-444e-1f21-08dc5e6ebc1d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B072.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7503
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

- unused

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/if0000.h |  9 -----
 .../drm/nouveau/include/nvkm/core/device.h    |  1 -
 drivers/gpu/drm/nouveau/nvkm/core/client.c    | 40 -------------------
 drivers/gpu/drm/nouveau/nvkm/device/base.c    | 14 -------
 4 files changed, 64 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0000.h b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
index f7b8f8f48760..4b31496b37e1 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0000.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0000.h
@@ -8,13 +8,4 @@ struct nvif_client_v0 {
 	__u64 device;
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
index 95cbb5b682f2..3e7049427b06 100644
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
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/base.c b/drivers/gpu/drm/nouveau/nvkm/device/base.c
index 3f827adcb19d..3ce42de55aa9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/base.c
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
2.41.0

