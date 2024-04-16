Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C72C8A7947
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEA4D112FF2;
	Tue, 16 Apr 2024 23:43:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="rkBGAJKB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2050.outbound.protection.outlook.com [40.107.92.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A19A112FE9
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ArvB+06TIsdoKhomYYr7/VVpVRl68ZheOD9mtGahdGqaep0Me3BqRYoyVkk+JwOXn7cXkIcIA09LmbLgjX2EQr5FHoAUZimx95r9sZ2vwVYZAZTHzl1xQ5YK8N50AWHWHiBa1XpUUzG6unR5ELUvHnP5vASUrV2E9VcTy/7DFF7A/mUgZhv8nEpFlnPAJW8NEXPa3+o0PZFA+p7jidOrh3YCnT+lM+lOitbOY6ARZzRG/IJKInHVrnoZ3bHk3v+u5yYnF+9zJ+XqunWWxntcsbI6z7fvODhqNeWiwx7JzG7zQzdtrAAGk1kV9FXN67L2K+T6K6vaPOPuuqaRQOESmg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5UxEYU3OqpszSrLuD7Gxe10QIE4hvUKxwyT9RoCxk4=;
 b=Ic9iv6OxmNQKxaqU73aLIM7PgK1HAxKf30Rq9p+CiDcfEKuWZv0zrqU7Sbf5pph3oqIHFGzKJUOnGnte31a8DR/ysbuTL51i811O0RFBKvP/Q8hozwIlrZFQG9+1vwVMVUCf3ZeGL7ulxvgVLQamn3hs8z+yDcECF3RpOOBcdT2ugwjH0amn4eA0XBm1SUTW2wl1iSRUoffybNrNPSvT4paJ7FrtHQjMlKz2D0N2TgqyDCH2TWDhdJU5b1tUCe6ZSwnlIHmvQStywtg9RyZtr6y0AQ/pFwub5C+049O9gE0menLUJJP8lQdVOCVfwjOphNQwDeJpqH2i10suSjCiRA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5UxEYU3OqpszSrLuD7Gxe10QIE4hvUKxwyT9RoCxk4=;
 b=rkBGAJKBt9DALlWjQq88jJbXxrr2+FH76iKg/gs9cZgGvMbSkHiTvOlH49YdvMkcxHVYAeJjuH90inSK2xTxD1uE5fB3sDSMsifEnQJqAwxDylFgLaxBPpHiYSIjh83A9fzeabXfD/5F94ScTRTQhT6xlg1SEvlsnoN+YfeDdxoJRVmg1CkcIwzs/x4hf2aahRDxGirysjgBeUTxN9AxBh0pURP7ZMIMRhxD1oljLzWBtR8GqHxjTwq5bSq9GFUG+Gnh1PtilT8hCUGDZeqY8Ttnp79rnMDEduslDgHR4TrSzW5gbAn3e/y1SlSAMVSA0fhQd6Q0st14RbIaARKCYg==
Received: from CH0P223CA0003.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::15)
 by MN2PR12MB4110.namprd12.prod.outlook.com (2603:10b6:208:1dd::18)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:43:45 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::3c) by CH0P223CA0003.outlook.office365.com
 (2603:10b6:610:116::15) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013F.mail.protection.outlook.com (10.167.244.71) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:43:17 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:43:16 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 146/156] drm/nouveau/nvif: remove chan from object rb
Date: Wed, 17 Apr 2024 09:39:52 +1000
Message-ID: <20240416234002.19509-147-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|MN2PR12MB4110:EE_
X-MS-Office365-Filtering-Correlation-Id: 0126b18e-60db-4588-cfb9-08dc5e6f0e87
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Cfbsp/Ggg8tnrxWDWeZBP3Ag1UMJc2q4pacse8yPDyWXCZcdJhSXUDFdHF4wLeSeYuiFVW6AguDGYhNJWKTVf9INbxG/2WiX9Fy2WEEjSPgoNsJD373TUlcF5Z+EaUP9LF7805FpUtxfkv5QswmarjAJs/v9eqDDuHfT7BTovx1F1MRhLYrtlvyb/28/mdv3bvK2os7Fb1QtRQobUNjpDr4QkYaN5alKMa/HeOVzZODZb/29GWgKhfPiGzJdmryBOvz+L+vJEMTE6ZU39P225Q36axNoaaIRCwIfg/5t323pzJ0CRxjltA68wWX5NLLI7P3LwTezx3J7rFK/ohiWtN3T63Xh0r6RJQEIokN4GLakkis+qb63Up5cEEjECA/N7ME94onMXQGkqOiQA3EPVERLDUD30IpPhcH/aatWc5XfXOVuNUzkA6awHv/y7nGRfFOlnUP40vAHVrKz6TKBarb7yK1ybf17lVrPhTnNC25cGNDNxvbZ2vccKP/bgqBzVKj+g6XroFjRzgAcqe5XNWpLGq+8ZJ3t8fsVSCSVHMY/+/MpZ2OwazrkvGyqwgm9oX2PaTZ3551CBI7AIYWxY2gW0mxEWZ9U0ySJmJtUqo8lt97nBbNOX6DaoWDO3SkD5/oYQW2Qhrxv4xaUxfUkSJQHzo/pLhDoLCdzntRP95BTs6HZ7ZL+Vr/dTy7/yXM320T1dpX/Dn9UAIelx6Peid6vBX/QAio7euhds6etz6menf/Hwuyu5n/FYVlAGsYr
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:45.6055 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0126b18e-60db-4588-cfb9-08dc5e6f0e87
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN2PR12MB4110
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

- no more users

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/driverif.h | 3 +--
 drivers/gpu/drm/nouveau/nouveau_chan.c          | 3 +--
 drivers/gpu/drm/nouveau/nvkm/device/user.c      | 5 +++--
 3 files changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 69428a879c37..b25c91542e66 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -618,8 +618,7 @@ struct nvif_device_impl {
 				   struct nvif_vmm_priv *, struct nvif_ctxdma_priv *push,
 				   u64 offset, u64 length, struct nvif_mem_priv *userd,
 				   u16 userd_offset, const char *name,
-				   const struct nvif_chan_impl **, struct nvif_chan_priv **,
-				   u64 handle);
+				   const struct nvif_chan_impl **, struct nvif_chan_priv **);
 		} chan;
 	} fifo;
 };
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index 80099dfcd3d5..54816bcca14c 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -333,8 +333,7 @@ nouveau_channel_ctor(struct nouveau_cli *cli, bool priv, u64 runm,
 	ret = device->impl->fifo.chan.new(device->priv, device->impl->fifo.runl[chan->runlist].id,
 					  0, priv, BIT(0), vmm, ctxdma, offset, length,
 					  userd, userd_offset, chan->name,
-					  &chan->chan.impl, &chan->chan.priv,
-					  nvif_handle(&chan->chan.object));
+					  &chan->chan.impl, &chan->chan.priv);
 	if (ret) {
 		nouveau_channel_del(pchan);
 		return ret;
diff --git a/drivers/gpu/drm/nouveau/nvkm/device/user.c b/drivers/gpu/drm/nouveau/nvkm/device/user.c
index efa675c8098f..d7b41b990d56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/device/user.c
+++ b/drivers/gpu/drm/nouveau/nvkm/device/user.c
@@ -102,7 +102,7 @@ nvkm_udevice_chan_new(struct nvif_device_priv *udev, u8 runl, u8 runq, bool priv
 		      struct nvif_vmm_priv *uvmm, struct nvif_ctxdma_priv *push,
 		      u64 offset, u64 length, struct nvif_mem_priv *userd, u16 userd_offset,
 		      const char *name, const struct nvif_chan_impl **pimpl,
-		      struct nvif_chan_priv **ppriv, u64 handle)
+		      struct nvif_chan_priv **ppriv)
 {
 	struct nvkm_vmm *vmm = nvkm_uvmm_ref(uvmm);
 	struct nvkm_object *object;
@@ -115,7 +115,8 @@ nvkm_udevice_chan_new(struct nvif_device_priv *udev, u8 runl, u8 runq, bool priv
 	if (ret)
 		return ret;
 
-	return nvkm_object_link_rb(udev->object.client, &udev->object, handle, object);
+	nvkm_object_link(&udev->object, object);
+	return 0;
 }
 
 static int
-- 
2.41.0

