Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 12C2BAA3C81
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91FF610E567;
	Tue, 29 Apr 2025 23:40:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="ESLDAc7L";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2077.outbound.protection.outlook.com [40.107.244.77])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 339CD10E56A
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ATS36TgXYsD2wHqCJJcvJj5DHUYKhoLaKObsTyQvsLEJdaqYoWQ0AZBc2otqEpxGdmHbsfmiI4/VZ3glxQAMMfOU0/1zXDHj+y/59CTJnVLH2TKhy7yr/P1p/3rgDJ94/TW1iRpVUBGvSn0505bnL3YLka+CxP6mZMQEsTJyiIk38XL8pcoI3imD5Si3oqjrMgPYhaO1Dsi2FDlEqHbTDJY5pQDQcFyXL5sUnBtIqcClhXn72Vd6GEh7OXEP4ulfz++hcN/KzJU7BrVBF6GTGD8/gVWEzTTx3MEvac5LdnRRxlAaGOQOsd/D2+Zgq/J+/n6ozOCkczHfpdcEP0U96g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HBgz0tKerW47eC6ePmIG31Yd5fMLlVJEH7GZXkvdJGY=;
 b=CsiFfDY66sjEkR0JaP6Iejylvj3wg0eeHS16JiYDsnXVjf5pXPN+p3Leof1S63ZGk4CEJndLXRjTDn97KPUeQ8MyRvwMO2xBSQgQwhwGsDJGFU0AYhUXFYKtl/3vX6g6vU6FzYCJkcINzuDsjwp3N4X6putjvjYMMXTLRFeAjQBWq0cmtBDLJ7xHRh8yBLJG1fXUn240H5F/vb/jda8As7l/Noe/m1SLwSVRH3MYzXtoS+BJfqJNbgHSO+1d7pfR02Jw6hKlZ6MvAaY5trQUEBB+lime9Q3ff2U8fzwegz3IcACTzut8TfQiFsRxZdvNDUVoryPlgUjsEYyflnkzrw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HBgz0tKerW47eC6ePmIG31Yd5fMLlVJEH7GZXkvdJGY=;
 b=ESLDAc7LWmKH6kev6HRVNxTOBG62+EPizaiusST6ouU+XT3sBRMwmWDXoTGPq8BgZqMWD530PTpEkUUOWEvIpVDy7ROuc+oLsWTTPS1lbuuXBGV2cfMpN8U37gZrtLGChRtN9+MD8XCsP9qFYgJr4Alc/D0M7cBQTrEaizu4FJw7YhH1j+Y0gErmBJkCFbxheoquoFqyRz3tI2vZiR6ZRz4lMps7pi+zYBfimQP2FZIbiVoj/sbiXcBz2L6HxsERewWM+YhDox1KqlxsNTwhxvwo3zKTAcnJy5wW6QanIiWCR6/fVpUUZTJ4U9NOqeSKr9QXvJHkca6ByHXMpja4Pw==
Received: from SJ0PR03CA0374.namprd03.prod.outlook.com (2603:10b6:a03:3a1::19)
 by IA0PPF8FC6E1236.namprd12.prod.outlook.com
 (2603:10b6:20f:fc04::bda) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.31; Tue, 29 Apr
 2025 23:40:15 +0000
Received: from SJ5PEPF000001EF.namprd05.prod.outlook.com
 (2603:10b6:a03:3a1:cafe::f) by SJ0PR03CA0374.outlook.office365.com
 (2603:10b6:a03:3a1::19) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8655.35 via Frontend Transport; Tue,
 29 Apr 2025 23:40:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 SJ5PEPF000001EF.mail.protection.outlook.com (10.167.242.203) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:15 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:04 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:03 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 20/60] drm/nouveau/gsp: use internal.{client, device,
 subdevice} where possible
Date: Wed, 30 Apr 2025 09:38:48 +1000
Message-ID: <20250429233929.24363-21-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: SJ5PEPF000001EF:EE_|IA0PPF8FC6E1236:EE_
X-MS-Office365-Filtering-Correlation-Id: 545de42e-4708-4ce9-c96a-08dd87773119
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|36860700013|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GuMMREqp4j5+RYmYO8+3nHfxHOeX3o1sKn6FaE6B7Fr2VFGGVLMMv7LORA3f?=
 =?us-ascii?Q?K3cWSdR5AiCOLr6X7RtT6SKCG2/kIaikk9RAkInQlIup2jUVxB/+0wo4HxHC?=
 =?us-ascii?Q?kQs9KcA7Ha3j+seR1YQAWqbmd6EORx9dvNDM3GZoIYEf3owr41c8zV2YkDzS?=
 =?us-ascii?Q?rDlrHy+BsXKiw35fWSkDZhPRtkB+RdWluiLnkDiUo2TmbywdO6jbiBqct5IT?=
 =?us-ascii?Q?7vKHSY6u2YIhzAxU7OptxQJDnYtLBn6gH0ZLvv+S0TOQI384Ga5Vw7Fot3kT?=
 =?us-ascii?Q?46EziIW3x9vkPDUDn10HvWwWM7oWEtVsYF6DmET0l8LAR3xERTGFBuEn+1+h?=
 =?us-ascii?Q?j7y/03ixZ1zxZ8Q4Tz56kmUyIZbcGa50jsgTGuXHHWKT+CoJwwG3FYNxNbU8?=
 =?us-ascii?Q?SlO85kE0bsqQlPdsBF5hG/tC6l/NPTAj2pLcRAOnaNjAx6jR4TPxe6QDPfcH?=
 =?us-ascii?Q?5SFIDwVs2q1CNaU0QSh3/cEljAeid/Ex8UauvkSpqttzRUAM8FU9NqRa5je1?=
 =?us-ascii?Q?m2mJAPJGZbWcSKtskGqVXaY+yDZy6664O/rh7hSHnOCev8mbUkO9C5prAwMO?=
 =?us-ascii?Q?QGiXCjw7HHEDKDIfCcvFqHNz12TUEOO137GjDKK51eCyd/8V/Lfl1kG+biwe?=
 =?us-ascii?Q?f5Bv20Fxgf9Zm5W4Cd5vK4kA5qB1VrAvDxnJc28PVDnBGTODZww0wFZC8eBZ?=
 =?us-ascii?Q?h8iEEbnwg0DTtcsgETdx7A6SzJCXlNihDJQHl0M4TTeJeE7GX5HwtJK7BakA?=
 =?us-ascii?Q?n6OdcJ78N3dKOhNBp3ZhjsAGmn67qsfVmnzlA2bh5naTxXrQZKPfuBO/RQrF?=
 =?us-ascii?Q?Lwy962ZBKVfGIxkQ3fzVl3XFkFdWelvCHJZ1KW7fEu76YLash14YBGSwNqEj?=
 =?us-ascii?Q?rmwW3SYP+CwBHqsNBHI7a+6GXfiqUwg3hMA1DucDKgSJm2gsYGh3Y5N65JTo?=
 =?us-ascii?Q?wzsu8lS/SToz5QGNBL1LjP4pJAw2b/9VJzQYt3oKNE344M2Lfnf+95sj1Y9/?=
 =?us-ascii?Q?qHMXAP+R6YHg9OFmb6EfAcuAQPG8kYzin1liUuM2d621dJKuGmr9C6TCc3qo?=
 =?us-ascii?Q?AmdUVizGKckJ7bxuwEaQtabqDPr5q9dhVNauAsMG9W2tT0cZcEyt85p7q5ZP?=
 =?us-ascii?Q?K3MSR0ptf0YLvNr59nwIy5ObCiRoDTvR9v8xmj7wuN085xtbkthjMcN8hTT1?=
 =?us-ascii?Q?xLOjUFU4L3vWOS2+I5I/0d4/biWoO6+rkQ6GG0fFnmoez6mKCF6CNM1LyLyn?=
 =?us-ascii?Q?sGuxic8rIrssnXhIcCxr84Y7MxC4bcGwnBswIBPv5HvtENOk+uSVb7BEinDd?=
 =?us-ascii?Q?XorEKrPyB/Myg+9VSK1UvOcwVUh6xkjkHGMNZI0fwD1dTDS1G5uGRw2P8eio?=
 =?us-ascii?Q?3cgBt76frS9fVVx6xRndrekM64IQpqCIxyUXXhYC7VvWfAwOJWeMHKuiHRtY?=
 =?us-ascii?Q?rmzIl4z0L8/jIs7Es1OIDbOSY4++gMrAyub3iuRiPE1aJtubsZ9PQAnvATBg?=
 =?us-ascii?Q?EaKFndyEwBr0c5cCQ1LDE5MMFXOIztchBHMf?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(36860700013)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:15.0779 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 545de42e-4708-4ce9-c96a-08dd87773119
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: SJ5PEPF000001EF.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PPF8FC6E1236
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

As nouveau never directly exposes RMAPI to userspace, there's no real
reason why we need to be creating client/device/subdevice objects for
every client.  Instead, use the object handles provided by GSP during
initialisation.

This prevents 4x RPCs to GSP every time the nouveau FD is opened.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/engine/disp.h    |  3 ---
 .../gpu/drm/nouveau/include/nvkm/subdev/mmu.h |  6 ++++--
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.c   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  |  4 ++--
 .../nouveau/nvkm/subdev/gsp/rm/r535/disp.c    | 19 +++++++------------
 .../nouveau/nvkm/subdev/gsp/rm/r535/fifo.c    |  8 ++++----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c  |  8 ++++----
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c |  7 ++++++-
 .../drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c | 17 ++++++++++-------
 .../gpu/drm/nouveau/nvkm/subdev/mmu/base.c    |  1 +
 drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c |  7 ++++---
 11 files changed, 43 insertions(+), 39 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
index 7903d7470d19..48dc7ec42164 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/disp.h
@@ -12,9 +12,6 @@ struct nvkm_disp {
 	struct nvkm_engine engine;
 
 	struct {
-		struct nvkm_gsp_client client;
-		struct nvkm_gsp_device device;
-
 		struct nvkm_gsp_object objcom;
 		struct nvkm_gsp_object object;
 
diff --git a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
index 935b1cacd528..5320e15f4fc8 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/subdev/mmu.h
@@ -68,8 +68,6 @@ struct nvkm_vmm {
 	struct {
 		u64 bar2_pdb;
 
-		struct nvkm_gsp_client client;
-		struct nvkm_gsp_device device;
 		struct nvkm_gsp_object object;
 
 		struct nvkm_vma *rsvd;
@@ -148,6 +146,10 @@ struct nvkm_mmu {
 	struct mutex mutex; /* serialises mmu invalidations */
 
 	struct nvkm_device_oclass user;
+
+	struct {
+		struct ida vmm_ids;
+	} rm;
 };
 
 int nv04_mmu_new(struct nvkm_device *, enum nvkm_subdev_type, int inst, struct nvkm_mmu **);
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
index 28adc5a30f2f..02de74b406a3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.c
@@ -386,7 +386,7 @@ nvkm_outp_new_(const struct nvkm_outp_func *func, struct nvkm_disp *disp,
 	outp->disp = disp;
 	outp->index = index;
 	outp->info = *dcbE;
-	if (!disp->rm.client.gsp)
+	if (!disp->rm.objcom.client)
 		outp->i2c = nvkm_i2c_bus_find(i2c, dcbE->i2c_index);
 
 	OUTP_DBG(outp, "type %02x loc %d or %d link %d con %x "
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 2dab6612c4fc..f9398c5576ff 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -102,7 +102,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	u64 bits = 0;
 
 	if (!uevent) {
-		if (!disp->rm.client.gsp && conn->info.hpd == DCB_GPIO_UNUSED)
+		if (!disp->rm.objcom.client && conn->info.hpd == DCB_GPIO_UNUSED)
 			return -ENOSYS;
 		return 0;
 	}
@@ -118,7 +118,7 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 	if (&outp->head == &conn->disp->outps)
 		return -EINVAL;
 
-	if (disp->rm.client.gsp) {
+	if (disp->rm.objcom.client) {
 		if (args->v0.types & NVIF_CONN_EVENT_V0_PLUG  ) bits |= NVKM_DPYID_PLUG;
 		if (args->v0.types & NVIF_CONN_EVENT_V0_UNPLUG) bits |= NVKM_DPYID_UNPLUG;
 		if (args->v0.types & NVIF_CONN_EVENT_V0_IRQ   ) bits |= NVKM_DPYID_IRQ;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
index e65f9074e94f..03222631d847 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/disp.c
@@ -150,7 +150,7 @@ r535_dmac_bind(struct nvkm_disp_chan *chan, struct nvkm_object *object, u32 hand
 {
 	return nvkm_ramht_insert(chan->disp->ramht, object, chan->chid.user, -9, handle,
 				 chan->chid.user << 25 |
-				 (chan->disp->rm.client.object.handle & 0x3fff));
+				 (chan->rm.object.client->object.handle & 0x3fff));
 }
 
 static void
@@ -1414,17 +1414,16 @@ r535_disp_fini(struct nvkm_disp *disp, bool suspend)
 		nvkm_event_fini(&disp->rm.event);
 
 		nvkm_gsp_rm_free(&disp->rm.objcom);
-		nvkm_gsp_device_dtor(&disp->rm.device);
-		nvkm_gsp_client_dtor(&disp->rm.client);
 	}
 }
 
 static int
 r535_disp_init(struct nvkm_disp *disp)
 {
+	struct nvkm_gsp *gsp = disp->engine.subdev.device->gsp;
 	int ret;
 
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, disp->func->root.oclass << 16,
+	ret = nvkm_gsp_rm_alloc(&gsp->internal.device.object, disp->func->root.oclass << 16,
 				disp->func->root.oclass, 0, &disp->rm.object);
 	if (ret)
 		return ret;
@@ -1464,11 +1463,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 		return ret;
 
 	/* OBJs. */
-	ret = nvkm_gsp_client_device_ctor(gsp, &disp->rm.client, &disp->rm.device);
-	if (ret)
-		return ret;
-
-	ret = nvkm_gsp_rm_alloc(&disp->rm.device.object, 0x00730000, NV04_DISPLAY_COMMON, 0,
+	ret = nvkm_gsp_rm_alloc(&gsp->internal.device.object, 0x00730000, NV04_DISPLAY_COMMON, 0,
 				&disp->rm.objcom);
 	if (ret)
 		return ret;
@@ -1491,7 +1486,7 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	{
 #if defined(CONFIG_ACPI) && defined(CONFIG_X86)
 		NV2080_CTRL_INTERNAL_INIT_BRIGHTC_STATE_LOAD_PARAMS *ctrl;
-		struct nvkm_gsp_object *subdevice = &disp->rm.client.gsp->internal.device.subdevice;
+		struct nvkm_gsp_object *subdevice = &gsp->internal.device.subdevice;
 
 		ctrl = nvkm_gsp_rm_ctrl_get(subdevice,
 					    NV2080_CTRL_CMD_INTERNAL_INIT_BRIGHTC_STATE_LOAD,
@@ -1639,12 +1634,12 @@ r535_disp_oneinit(struct nvkm_disp *disp)
 	if (WARN_ON(ret))
 		return ret;
 
-	ret = nvkm_gsp_device_event_ctor(&disp->rm.device, 0x007e0000, NV2080_NOTIFIERS_HOTPLUG,
+	ret = nvkm_gsp_device_event_ctor(&gsp->internal.device, 0x007e0000, NV2080_NOTIFIERS_HOTPLUG,
 					 r535_disp_hpd, &disp->rm.hpd);
 	if (ret)
 		return ret;
 
-	ret = nvkm_gsp_device_event_ctor(&disp->rm.device, 0x007e0001, NV2080_NOTIFIERS_DP_IRQ,
+	ret = nvkm_gsp_device_event_ctor(&gsp->internal.device, 0x007e0001, NV2080_NOTIFIERS_DP_IRQ,
 					 r535_disp_irq, &disp->rm.irq);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index eb1531c3eabd..b4e5112cbad8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -101,7 +101,7 @@ r535_chan_ramfc_write(struct nvkm_chan *chan, u64 offset, u64 length, u32 devm,
 	if (!chan->rm.mthdbuf.ptr)
 		return -ENOMEM;
 
-	args = nvkm_gsp_rm_alloc_get(&chan->vmm->rm.device.object, 0xf1f00000 | chan->id,
+	args = nvkm_gsp_rm_alloc_get(&device->gsp->internal.device.object, 0xf1f00000 | chan->id,
 				     fifo->func->chan.user.oclass, sizeof(*args),
 				     &chan->rm.object);
 	if (WARN_ON(IS_ERR(args)))
@@ -373,10 +373,10 @@ r535_gr = {
 static int
 r535_flcn_bind(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan *chan)
 {
-	struct nvkm_gsp_client *client = &chan->vmm->rm.client;
+	struct nvkm_gsp_client *client = chan->rm.object.client;
 	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
 
-	ctrl = nvkm_gsp_rm_ctrl_get(&chan->vmm->rm.device.subdevice,
+	ctrl = nvkm_gsp_rm_ctrl_get(&client->gsp->internal.device.subdevice,
 				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
 	if (IS_ERR(ctrl))
 		return PTR_ERR(ctrl);
@@ -389,7 +389,7 @@ r535_flcn_bind(struct nvkm_engn *engn, struct nvkm_vctx *vctx, struct nvkm_chan
 	ctrl->engineType = engn->id;
 	ctrl->ChID = chan->id;
 
-	return nvkm_gsp_rm_ctrl_wr(&chan->vmm->rm.device.subdevice, ctrl);
+	return nvkm_gsp_rm_ctrl_wr(&client->gsp->internal.device.subdevice, ctrl);
 }
 
 static int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index c7d1d6081eae..e9d3082309ce 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -64,13 +64,13 @@ r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
 	struct nvkm_device *device = subdev->device;
 	NV2080_CTRL_GPU_PROMOTE_CTX_PARAMS *ctrl;
 
-	ctrl = nvkm_gsp_rm_ctrl_get(&vmm->rm.device.subdevice,
+	ctrl = nvkm_gsp_rm_ctrl_get(&device->gsp->internal.device.subdevice,
 				    NV2080_CTRL_CMD_GPU_PROMOTE_CTX, sizeof(*ctrl));
 	if (WARN_ON(IS_ERR(ctrl)))
 		return PTR_ERR(ctrl);
 
 	ctrl->engineType = 1;
-	ctrl->hChanClient = vmm->rm.client.object.handle;
+	ctrl->hChanClient = chan->client->object.handle;
 	ctrl->hObject = chan->handle;
 
 	for (int i = 0; i < gr->ctxbuf_nr; i++) {
@@ -135,7 +135,7 @@ r535_gr_promote_ctx(struct r535_gr *gr, bool golden, struct nvkm_vmm *vmm,
 		ctrl->entryCount++;
 	}
 
-	return nvkm_gsp_rm_ctrl_wr(&vmm->rm.device.subdevice, ctrl);
+	return nvkm_gsp_rm_ctrl_wr(&device->gsp->internal.device.subdevice, ctrl);
 }
 
 int
@@ -203,7 +203,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	{
 		NV_CHANNELGPFIFO_ALLOCATION_PARAMETERS *args;
 
-		args = nvkm_gsp_rm_alloc_get(&golden.vmm->rm.device.object, 0xf1f00000,
+		args = nvkm_gsp_rm_alloc_get(&gsp->internal.device.object, 0xf1f00000,
 					     device->fifo->func->chan.user.oclass,
 					     sizeof(*args), &golden.chan);
 		if (IS_ERR(args)) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
index 5e6cf57a6f70..195dd35393d9 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gsp.c
@@ -179,6 +179,7 @@ r535_gsp_rpc_get_gsp_static_info(struct nvkm_gsp *gsp)
 	gsp->internal.client.object.parent = NULL;
 	gsp->internal.client.object.handle = rpc->hInternalClient;
 	gsp->internal.client.gsp = gsp;
+	INIT_LIST_HEAD(&gsp->internal.client.events);
 
 	gsp->internal.device.object.client = &gsp->internal.client;
 	gsp->internal.device.object.parent = &gsp->internal.client.object;
@@ -967,7 +968,11 @@ r535_gsp_msg_post_event(void *priv, u32 fn, void *repv, u32 repc)
 		   msg->status, msg->eventDataSize, msg->bNotifyList);
 
 	mutex_lock(&gsp->client_id.mutex);
-	client = idr_find(&gsp->client_id.idr, msg->hClient & 0xffff);
+	if (msg->hClient == gsp->internal.client.object.handle)
+		client = &gsp->internal.client;
+	else
+		client = idr_find(&gsp->client_id.idr, msg->hClient & 0xffff);
+
 	if (client) {
 		struct nvkm_gsp_event *event;
 		bool handled = false;
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
index c697885c65d3..9c6f6901ec45 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/vmm.c
@@ -27,17 +27,20 @@ static int
 r535_mmu_promote_vmm(struct nvkm_vmm *vmm)
 {
 	NV_VASPACE_ALLOCATION_PARAMETERS *args;
-	int ret;
+	struct nvkm_mmu *mmu = vmm->mmu;
+	struct nvkm_gsp *gsp = mmu->subdev.device->gsp;
+	int id, ret;
 
-	ret = nvkm_gsp_client_device_ctor(vmm->mmu->subdev.device->gsp,
-					  &vmm->rm.client, &vmm->rm.device);
-	if (ret)
-		return ret;
+	id = ida_alloc_range(&mmu->rm.vmm_ids, 0, 0xffff + 1, GFP_KERNEL);
+	if (id < 0)
+		return id;
 
-	args = nvkm_gsp_rm_alloc_get(&vmm->rm.device.object, 0x90f10000, FERMI_VASPACE_A,
+	args = nvkm_gsp_rm_alloc_get(&gsp->internal.device.object, 0x90f10000 | id, FERMI_VASPACE_A,
 				     sizeof(*args), &vmm->rm.object);
-	if (IS_ERR(args))
+	if (IS_ERR(args)) {
+		ida_free(&mmu->rm.vmm_ids, id);
 		return PTR_ERR(args);
+	}
 
 	args->index = NV_VASPACE_ALLOCATION_INDEX_GPU_NEW;
 
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
index b67ace7ae93c..eb31c54b53ad 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/base.c
@@ -428,6 +428,7 @@ nvkm_mmu_ctor(const struct nvkm_mmu_func *func, struct nvkm_device *device,
 	mutex_init(&mmu->mutex);
 	mmu->user.ctor = nvkm_ummu_new;
 	mmu->user.base = func->mmu.user;
+	ida_init(&mmu->rm.vmm_ids);
 }
 
 int
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
index 9c97800fe037..0768e5c1fad4 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/mmu/vmm.c
@@ -1027,13 +1027,14 @@ nvkm_vmm_dump(struct nvkm_vmm *vmm)
 static void
 nvkm_vmm_dtor(struct nvkm_vmm *vmm)
 {
+	struct nvkm_mmu *mmu = vmm->mmu;
 	struct nvkm_vma *vma;
 	struct rb_node *node;
 
-	if (vmm->rm.client.gsp) {
+	if (vmm->rm.object.client) {
+		unsigned int id = vmm->rm.object.handle & 0xffff;
 		nvkm_gsp_rm_free(&vmm->rm.object);
-		nvkm_gsp_device_dtor(&vmm->rm.device);
-		nvkm_gsp_client_dtor(&vmm->rm.client);
+		ida_free(&mmu->rm.vmm_ids, id);
 		nvkm_vmm_put(vmm, &vmm->rm.rsvd);
 	}
 
-- 
2.49.0

