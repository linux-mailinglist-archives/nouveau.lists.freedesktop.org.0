Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ACB3892AD5E
	for <lists+nouveau@lfdr.de>; Tue,  9 Jul 2024 02:55:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5BD6410E46A;
	Tue,  9 Jul 2024 00:55:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="PPuOzQy9";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2046.outbound.protection.outlook.com [40.107.220.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E568110E45B
 for <nouveau@lists.freedesktop.org>; Tue,  9 Jul 2024 00:55:37 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d0lg0zrf9iIPiYi9sdfXa3DcoBgre+gTTQRtPupineo3Y0D+EHzlo8L8rslFwpH+IUmHwwzG7FIVLE9WQHg6NAJVbdpmDHfKcDxfeFYUDUdaPIv/riio3r8q7e8U6ZPmcffskF/hTRdNnrrAcho8xF7fuWP6SI4n5byb/GtFJKKJfq7zaQUa5xz4lSWuLCVhaD+YJpZFJIIs70kXIcubyEESbkGm9Z4owyyC3yhls/R+QpnUmCxbwt2Difn3EYvDYXaDHEvO8gso9+xrX8hY2rnphaa981xGGUIlR0yi21z6fFCY/t3cDoWFSiSrD4MdpqGi6ywsWolIFXwufedRxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Jge7AA7CYP2JpFS0j7BHk08YNlX9C1hKzF5Q0IXURwQ=;
 b=ALjMi775CQmX7u3pjN/tg7OBiz0ZLk3BwADi6ZYYL9u623CjvZXomSSNs5McqctknkuVQT4eCoRqVgZ119AARt8iZU6rFIfbWQOjIyAHkTNC+OzbecBaZGLefYcaq01kk8UDR4OjxXEHQcwg0CTvojk+L/i4cQccWhf4Ktlao1yexE/mA9DxFc2RIRiseY1uBQIYKrNf5WTMhr4ichTc5ZbUS/IpyxSBtU0bXbQV9OAJMsGmNES/czPJnGca6XkPYV+XDjwUXfR3rN6JR2pgAzmmhsrcNKFj0ACI9JMAmy7O9sjzEAtoYecWV38YMw/vrEcx79fm4wg4dIkqm9N0IQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Jge7AA7CYP2JpFS0j7BHk08YNlX9C1hKzF5Q0IXURwQ=;
 b=PPuOzQy9MO9tzK+onmuHgrXFYAvbf7ER2WA8881X9O3KkrhnHpBANFcHm81/zA29zRS8+V61IMv0bunNf6nISasC1CK37BI7pTmt6k8LQ4JzyTQB7/SsnXGJ6Ft8rUVrJYiWOYcyV/PvPDL/RkFfbNGLJD65kH/f9wm8xTIsn2oo9Jn19K5XSRhZ4FO2XjQJVLWD9jy4A1Mmnp23Agj+ndW5or9csv2EchCMPlKh83abD6I9B1gEXsRZIbg4TM1rhoQ2C6szX8PAohfeICnZvq62aGWJcQWeyNf/T6W8b5S7Vqytu5j6D8lNWmjT4ZF4wQrIVBSLMIomG0cneWHjqA==
Received: from BN0PR04CA0149.namprd04.prod.outlook.com (2603:10b6:408:ed::34)
 by PH0PR12MB7096.namprd12.prod.outlook.com (2603:10b6:510:21d::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Tue, 9 Jul
 2024 00:55:35 +0000
Received: from BN2PEPF0000449E.namprd02.prod.outlook.com
 (2603:10b6:408:ed:cafe::f9) by BN0PR04CA0149.outlook.office365.com
 (2603:10b6:408:ed::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36 via Frontend
 Transport; Tue, 9 Jul 2024 00:55:35 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN2PEPF0000449E.mail.protection.outlook.com (10.167.243.149) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7762.17 via Frontend Transport; Tue, 9 Jul 2024 00:55:34 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:21 -0700
Received: from fedora.mshome.net (10.126.230.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Mon, 8 Jul 2024
 17:55:20 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v2 25/37] drm/nouveau/nvif: remove device rd/wr
Date: Fri, 5 Jul 2024 04:37:09 +1000
Message-ID: <20240704183721.25778-26-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN2PEPF0000449E:EE_|PH0PR12MB7096:EE_
X-MS-Office365-Filtering-Correlation-Id: 7cfd8d5f-5d08-4bc0-9e26-08dc9fb1d758
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jozpbqaQ5nrIrMU9N73A+DMbpn9r11sGraz7ULDUTMpc0fyqZUEPJ4/6iQQs?=
 =?us-ascii?Q?FZIPv42Y1DXicGSXL7o+eyGmwzN+2MGnYH55KO0KbZGOAlfdF81we5sXstGU?=
 =?us-ascii?Q?FkOJ22sY/dxoALlD2FcLz7FOKpkZ6KKX5+hziLArIhWFlww9rFr3FCZxNffR?=
 =?us-ascii?Q?v/Vx+lxv6l0MOD5/ggwmlIbrUC+joE0wvlvxn/8TrDQR0kUYDDN2RO9uJeAl?=
 =?us-ascii?Q?yZyEQ82FWGfKRXUGOKHRfa7n7D6+h1irSkAmsHLF5cSw2gwQj1jJacV5WfoB?=
 =?us-ascii?Q?fXtdeChil5wlw5wDGNHx+NWkIphvBovt+lyQ840AIUDqS0Tli3Pq/YE7i2OV?=
 =?us-ascii?Q?b2nTyBPp/f7OcyUagwlNMZ0JzOpx7yAipMUphdqUf2bqJudXO11LYcsWxXMb?=
 =?us-ascii?Q?L1y+frsO9DdukSp73ViGJGexYbifoMJEH/Ci3MCqjlM+r5yb3D3Pc9WBET1s?=
 =?us-ascii?Q?HSWvYDGm63pb3gDpE3M11U4+EpfFkho1WHq4JqtjtTIULdTeh/g0jlot09fB?=
 =?us-ascii?Q?joLdUQTLMgWOcTyc4dsBvtuYMl7OHxP3Pl9DJTx0wg4FKCuiB/ydkzEGQaTb?=
 =?us-ascii?Q?9O3ufCHW9MrIAiifxeWe/LnGs3UDUObSLnfNocw1pnnq0Qm9hnoALvHgMmv2?=
 =?us-ascii?Q?sOyNNis7Io0RQo7g71DG/WG/LoOtgRiODwIq1Y3/1TgLBQFmh/3GcnASsTzr?=
 =?us-ascii?Q?UXn97zal9+wdrnkswCcrPmVwZM8PzxnBWnm1RseO+tVGmexULq33PDtA1cjW?=
 =?us-ascii?Q?RH7xLI93yNljbmCXSN6EBE+7T0ndgkbIJli64uaG3LtSA0ov0dUmsfvAMZVL?=
 =?us-ascii?Q?UyXgBjz+6YOEMCkPatWJ6ptXBaycmVsYflbjncz9I7AgDHf3p+9N2OB51jZ8?=
 =?us-ascii?Q?n5XeQ5rpuEAwB20y7+/x0lpWrEMLdXGxjsYNVJxsup95jpIPt1EamM2ERIJM?=
 =?us-ascii?Q?y16l0hvKVDT8CWBeI1+gHNw+t49KpoTPnFwCxm0pbsmDx7xNNgbtXXQ17uWc?=
 =?us-ascii?Q?pD7Rk7Tc2o7HQIQ7gw1UyH9X4quVoKeXsnFniCceF5hiXMV0F5V2Xxroc8jX?=
 =?us-ascii?Q?k3QUhJbkQMubd2P4AOhFsIU8JZ7qos7oozgV92gItPB5Bzdg+qY8Y0hNU3mp?=
 =?us-ascii?Q?UrYFy/FF5hYZ19VTfrAWrOX+YYCvjGmHypfGaajVV3O5h/gi6rilWlrX6/S0?=
 =?us-ascii?Q?paYmNeYhNvzP4Sc8Ga9GjmvTd89oTfba2zvRkIZyDUlsAUU+taKhF4AFJW/E?=
 =?us-ascii?Q?YTCQQ1AXQ/3Lwn39DSeHaomlEQbMocHeUyWNPSthyA2DQzaHWvN2sdWZO0d8?=
 =?us-ascii?Q?iByBhE7yYdO8K5OBc6Dyw7FkDh9BN8YLP8TbKgVzRlwaR2VwhHI4WJiQT3+q?=
 =?us-ascii?Q?Eu7W5uJiREp6EPPLzkqDPJ1FGeErlnuZOq8aAJpgYY+jAlC6Pp+WuP60mJmW?=
 =?us-ascii?Q?TIOmHkWI6N8BnCMVvWp6XxRDmng/9/gk?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Jul 2024 00:55:34.8673 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 7cfd8d5f-5d08-4bc0-9e26-08dc9fb1d758
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF0000449E.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7096
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

The device is always mapped now, so these are unneeded.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/core/object.h    |  8 ---
 drivers/gpu/drm/nouveau/nvkm/core/ioctl.c     | 10 ----
 drivers/gpu/drm/nouveau/nvkm/core/object.c    | 32 -----------
 drivers/gpu/drm/nouveau/nvkm/core/oproxy.c    | 28 ----------
 .../gpu/drm/nouveau/nvkm/engine/device/user.c | 54 -------------------
 5 files changed, 132 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
index d4f1c964ba31..c91abac44bd6 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/object.h
@@ -33,11 +33,7 @@ struct nvkm_object_func {
 	int (*map)(struct nvkm_object *, void *argv, u32 argc,
 		   enum nvkm_object_map *, u64 *addr, u64 *size);
 	int (*unmap)(struct nvkm_object *);
-	int (*rd08)(struct nvkm_object *, u64 addr, u8 *data);
-	int (*rd16)(struct nvkm_object *, u64 addr, u16 *data);
 	int (*rd32)(struct nvkm_object *, u64 addr, u32 *data);
-	int (*wr08)(struct nvkm_object *, u64 addr, u8 data);
-	int (*wr16)(struct nvkm_object *, u64 addr, u16 data);
 	int (*wr32)(struct nvkm_object *, u64 addr, u32 data);
 	int (*bind)(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		    struct nvkm_gpuobj **);
@@ -61,11 +57,7 @@ int nvkm_object_ntfy(struct nvkm_object *, u32 mthd, struct nvkm_event **);
 int nvkm_object_map(struct nvkm_object *, void *argv, u32 argc,
 		    enum nvkm_object_map *, u64 *addr, u64 *size);
 int nvkm_object_unmap(struct nvkm_object *);
-int nvkm_object_rd08(struct nvkm_object *, u64 addr, u8  *data);
-int nvkm_object_rd16(struct nvkm_object *, u64 addr, u16 *data);
 int nvkm_object_rd32(struct nvkm_object *, u64 addr, u32 *data);
-int nvkm_object_wr08(struct nvkm_object *, u64 addr, u8   data);
-int nvkm_object_wr16(struct nvkm_object *, u64 addr, u16  data);
 int nvkm_object_wr32(struct nvkm_object *, u64 addr, u32  data);
 int nvkm_object_bind(struct nvkm_object *, struct nvkm_gpuobj *, int align,
 		     struct nvkm_gpuobj **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
index 584fc43c0d75..95e9537e1d7c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/ioctl.c
@@ -206,14 +206,6 @@ nvkm_ioctl_rd(struct nvkm_client *client,
 		nvif_ioctl(object, "rd vers %d size %d addr %016llx\n",
 			   args->v0.version, args->v0.size, args->v0.addr);
 		switch (args->v0.size) {
-		case 1:
-			ret = nvkm_object_rd08(object, args->v0.addr, &v.b08);
-			args->v0.data = v.b08;
-			break;
-		case 2:
-			ret = nvkm_object_rd16(object, args->v0.addr, &v.b16);
-			args->v0.data = v.b16;
-			break;
 		case 4:
 			ret = nvkm_object_rd32(object, args->v0.addr, &v.b32);
 			args->v0.data = v.b32;
@@ -246,8 +238,6 @@ nvkm_ioctl_wr(struct nvkm_client *client,
 		return ret;
 
 	switch (args->v0.size) {
-	case 1: return nvkm_object_wr08(object, args->v0.addr, args->v0.data);
-	case 2: return nvkm_object_wr16(object, args->v0.addr, args->v0.data);
 	case 4: return nvkm_object_wr32(object, args->v0.addr, args->v0.data);
 	default:
 		break;
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/object.c b/drivers/gpu/drm/nouveau/nvkm/core/object.c
index 580b8c7f25af..913c3bae51f7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/object.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/object.c
@@ -132,22 +132,6 @@ nvkm_object_unmap(struct nvkm_object *object)
 	return -ENODEV;
 }
 
-int
-nvkm_object_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	if (likely(object->func->rd08))
-		return object->func->rd08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	if (likely(object->func->rd16))
-		return object->func->rd16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
@@ -156,22 +140,6 @@ nvkm_object_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 	return -ENODEV;
 }
 
-int
-nvkm_object_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	if (likely(object->func->wr08))
-		return object->func->wr08(object, addr, data);
-	return -ENODEV;
-}
-
-int
-nvkm_object_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	if (likely(object->func->wr16))
-		return object->func->wr16(object, addr, data);
-	return -ENODEV;
-}
-
 int
 nvkm_object_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
index 3385528da650..afc10ec256a7 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/oproxy.c
@@ -55,36 +55,12 @@ nvkm_oproxy_unmap(struct nvkm_object *object)
 	return nvkm_object_unmap(oproxy->object);
 }
 
-static int
-nvkm_oproxy_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	return nvkm_object_rd08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	return nvkm_object_rd16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_rd32(struct nvkm_object *object, u64 addr, u32 *data)
 {
 	return nvkm_object_rd32(nvkm_oproxy(object)->object, addr, data);
 }
 
-static int
-nvkm_oproxy_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	return nvkm_object_wr08(nvkm_oproxy(object)->object, addr, data);
-}
-
-static int
-nvkm_oproxy_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	return nvkm_object_wr16(nvkm_oproxy(object)->object, addr, data);
-}
-
 static int
 nvkm_oproxy_wr32(struct nvkm_object *object, u64 addr, u32 data)
 {
@@ -197,11 +173,7 @@ nvkm_oproxy_func = {
 	.ntfy = nvkm_oproxy_ntfy,
 	.map = nvkm_oproxy_map,
 	.unmap = nvkm_oproxy_unmap,
-	.rd08 = nvkm_oproxy_rd08,
-	.rd16 = nvkm_oproxy_rd16,
 	.rd32 = nvkm_oproxy_rd32,
-	.wr08 = nvkm_oproxy_wr08,
-	.wr16 = nvkm_oproxy_wr16,
 	.wr32 = nvkm_oproxy_wr32,
 	.bind = nvkm_oproxy_bind,
 	.sclass = nvkm_oproxy_sclass,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
index 65bd6712bce2..d7f75b3a43c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/device/user.c
@@ -202,54 +202,6 @@ nvkm_udevice_mthd(struct nvkm_object *object, u32 mthd, void *data, u32 size)
 	return -EINVAL;
 }
 
-static int
-nvkm_udevice_rd08(struct nvkm_object *object, u64 addr, u8 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd08(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd16(struct nvkm_object *object, u64 addr, u16 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd16(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_rd32(struct nvkm_object *object, u64 addr, u32 *data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	*data = nvkm_rd32(udev->device, addr);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr08(struct nvkm_object *object, u64 addr, u8 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr08(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr16(struct nvkm_object *object, u64 addr, u16 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr16(udev->device, addr, data);
-	return 0;
-}
-
-static int
-nvkm_udevice_wr32(struct nvkm_object *object, u64 addr, u32 data)
-{
-	struct nvkm_udevice *udev = nvkm_udevice(object);
-	nvkm_wr32(udev->device, addr, data);
-	return 0;
-}
-
 static int
 nvkm_udevice_map(struct nvkm_object *object, void *argv, u32 argc,
 		 enum nvkm_object_map *type, u64 *addr, u64 *size)
@@ -362,12 +314,6 @@ nvkm_udevice = {
 	.fini = nvkm_udevice_fini,
 	.mthd = nvkm_udevice_mthd,
 	.map = nvkm_udevice_map,
-	.rd08 = nvkm_udevice_rd08,
-	.rd16 = nvkm_udevice_rd16,
-	.rd32 = nvkm_udevice_rd32,
-	.wr08 = nvkm_udevice_wr08,
-	.wr16 = nvkm_udevice_wr16,
-	.wr32 = nvkm_udevice_wr32,
 	.sclass = nvkm_udevice_child_get,
 };
 
-- 
2.45.1

