Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 472E3AA3C9B
	for <lists+nouveau@lfdr.de>; Wed, 30 Apr 2025 01:40:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D1F3910E59C;
	Tue, 29 Apr 2025 23:40:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="EUHkcu/F";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam04on2042.outbound.protection.outlook.com [40.107.101.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 612B310E5A1
 for <nouveau@lists.freedesktop.org>; Tue, 29 Apr 2025 23:40:48 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=r1vogovvPi/nKMPQGG55NO+tPkL4YXs5M0e5izp9kq2zIb9reB06TmvehxdYlVwlRPDRv9SfBpwEWbxH65CiClWImwbK+tE35LhFGkV1grkU0h8tjvM/zXXv4rnEKaiGo+N6v83hHTQ5Ac5QU8QN8NzPYMfXjKxznne3h+dRbUQRu4OtntdIhNRH3nHqKhu/xy2CxmNheYNHg/BBmoubcRwuK68j+4jwU08VGQsiHjIljiuAeeOtsf5pg0JRWlQPAE+3d8Mq0RFt3TqRZ8j/Dwv29KXNQ5SQhPvKczJhhxPax2dL9hzYfJGCnthtiUnPxRksdM6U6ebzFi5xyg4Vhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=b9YVUMNV9mL+CNQ3ciQ9XjqQFMi+JoEny9GdtLJ9Bm4=;
 b=tP78paBzKTfqpkZs0IOcZAyd8dqwvM1oQGFVhoOV+i6NEMtDUT5xA6aasg8JuC/ZLWZDCDo/NOJe2V07XimWAl6Pe2J0k6KB5lF2hWJP5h2YI6QqbxHUNciHkbpik2ZEb/wjntBYpo0+Bxv5uE5IAOOsb3OXyFfXnrrnQ29ucL/QCTFkMu54CkmUuUv21rtTRe5FGUkLoZ6kjETn0K8tv0hPrOoPuyRbi7hQRny6KS+0ELN+eNXD5J1quVQivYNA/TbR4DVPMAZGsg0RcL75WKAGawWFmKzaJmMJwkgA5T9FqziYB1B0fuRMgnDPt8thsZVrq8DTvfYTykbfJhbBCg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=b9YVUMNV9mL+CNQ3ciQ9XjqQFMi+JoEny9GdtLJ9Bm4=;
 b=EUHkcu/FmKX3sPsFlMhAFFcTN+Cf/mxffoMRyKJGQ2OV4KMGY2SMGrQQZXiXTYdYofxNV95ggAjeLIf+p+enpKjDPKknqwGesmYQttSro/Ub0bSyA+yXWpsQRiLJ99OSjFj0qqZ9qcA5VE5P7qpl0W6vCm7aABcOZD339FTzBt04NRvmtsHkglaNbwaRCSG1GJCNWmAcwpzfSK40qzsHvq0TAdZLzwm9OBZee5aDqWezjYdD/+vpZYZE7GrBrGnguUy91uh0AFnSnBsyKu5shVo2VnI72LdhcMlAka/HVHIT8dxqIGX7eBMkztxcDeadGfm0rP7eIaCVPTRZ8gjlDQ==
Received: from SJ0PR13CA0179.namprd13.prod.outlook.com (2603:10b6:a03:2c7::34)
 by DS0PR12MB7777.namprd12.prod.outlook.com (2603:10b6:8:153::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8678.33; Tue, 29 Apr
 2025 23:40:45 +0000
Received: from MWH0EPF000A6734.namprd04.prod.outlook.com
 (2603:10b6:a03:2c7:cafe::2b) by SJ0PR13CA0179.outlook.office365.com
 (2603:10b6:a03:2c7::34) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8678.23 via Frontend Transport; Tue,
 29 Apr 2025 23:40:45 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 MWH0EPF000A6734.mail.protection.outlook.com (10.167.249.26) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8699.20 via Frontend Transport; Tue, 29 Apr 2025 23:40:45 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Tue, 29 Apr
 2025 16:40:28 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.230.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Tue, 29 Apr 2025 16:40:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 40/60] drm/nouveau/gsp: add hal for fifo.rsvd_chids
Date: Wed, 30 Apr 2025 09:39:08 +1000
Message-ID: <20250429233929.24363-41-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: MWH0EPF000A6734:EE_|DS0PR12MB7777:EE_
X-MS-Office365-Filtering-Correlation-Id: d4e43093-18ef-4663-89f2-08dd87774319
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|36860700013|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+8DMGOBbAjKZz7sEiw+AM8sL9L9hLfr7DzkOx/i89qStM1kp9Ki0EuOreJQM?=
 =?us-ascii?Q?9pA4z3oeXmsSSR3oL/A3L8ZbedAUTjrRMYgwIzLaKCr1MMLRWZ+lk690bcmn?=
 =?us-ascii?Q?/Vazw7NoBu4W8SWkVI8VeKbMC6gY93HorR6PmRhGXAqDLDQZnI3KMSL6i68k?=
 =?us-ascii?Q?RvjjhRQ7xUgQWF9eAcwh0DbUbq9oMWbyDw/VO/JVRzx8zeWuT97iVCPmsmIq?=
 =?us-ascii?Q?+/SVgiCc4wUtFN//Dljn/C7snKigs0xqN7V23QRvkSApXsOHvqvJyAJIVzuV?=
 =?us-ascii?Q?lWoOA3ASKIpIK7TA7zWbTAg0iKWHy7uU/7E7KLCh8P4P3473bE0tTcebbofF?=
 =?us-ascii?Q?ovS4lvTImYV4OBQ6SSzmdMzw809zSedhvUvTFUAk0i3TpUO1RaAHwwavMbGl?=
 =?us-ascii?Q?vQN4fzr9FaKCSMgYHKqys/UDGAc9zPMHu5bi316nOVvWbNfHPDH12nCz15dx?=
 =?us-ascii?Q?xSRVhwglnhu9m9kszwSoVWOgpftT26AZu59cQm9ddrF03cKMpq1UQDgcig1o?=
 =?us-ascii?Q?to+3NBR9xiyX7l6HBLaPQi6dldAZlEEJBcUFJ0y+gWb04HBvv3650j3hVkyO?=
 =?us-ascii?Q?zkeVdY1CWsIS58ng2efM+0jeZ68Ds9KenTgsGNZF4HypWV36HCZwYacR41I3?=
 =?us-ascii?Q?3mns4M3LfjuYwTcujf8mcolTDwg50w2naNSL5eUzUSHpBSm+81+QNj/dwrOn?=
 =?us-ascii?Q?PiGTFVrx1xfVK8EPnxk0AUSO19PNK2KHccPmzc1EkOR+BPKj5qdJr1Yoo4TT?=
 =?us-ascii?Q?uVKpSms7ONzE+rgKtuPGeCHZu6d7HOsGu/QkJAdbmo3OdN5LhYowcqMMFZVA?=
 =?us-ascii?Q?ReLDzIpggh5dsPzbBcltT40kz3rgEH2PoAbctLHzu4hRFj/gxzTfoityrvMW?=
 =?us-ascii?Q?U5P8dRM0FoMDtyNi/f9Zregwo44DmOt2YUFyXn21SE/ipGz8KRDD6D5QXrb4?=
 =?us-ascii?Q?jXJHLb3Mxi5iw1E+RVV8X0NqjTCDCEC4ohhTO+XLIcvl0h1Bq5rjZsmjqlvn?=
 =?us-ascii?Q?HJkFJhy1pny3p73o8zenscnHZ7fBBg2EJ6lSuUxLVjGHO2w788qBGICuI8gi?=
 =?us-ascii?Q?lM/QsMc223worXTDmNpAf2cKC1LhOx2Z80Mljhoscg6U3TVJSVYU0m41CYZV?=
 =?us-ascii?Q?hrnEjvB99DfFQSWla3sEGrkgjO37NZoT7bSk8nMge4cHK6CZWNPSpRLqgQsn?=
 =?us-ascii?Q?+0GqLQJdDP1RU0Brt226NEQrsZHzw/W8smHOw00DQwXL/+h5OYzVLF1buS0T?=
 =?us-ascii?Q?W0OgSfg4SB2aQ+TRflYdPGRIWBqW+2KCt7GaIzAmwtea8pp3U9qps7JQIjOw?=
 =?us-ascii?Q?uIlSTMFqA1wkYRASM9BDzyIalWvS/6nQZrYVQM62jAerG4pP9N9REgYSjt6F?=
 =?us-ascii?Q?azm9OUr5WTwi9HiPdFK9rXpZMR6OnIfZ0QXiN6IyXUwJzWtwu9zTs+56DlvD?=
 =?us-ascii?Q?Qy2IeAdh/sdy7ZC7Sn+Qk8XX+4OC3f6UorboeGxpQlYugqaYG568yPrjlCah?=
 =?us-ascii?Q?+jhPjxUU69kPXgIPt9N5PQ3LEr18BaKMTeBM?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(36860700013)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2025 23:40:45.1735 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: d4e43093-18ef-4663-89f2-08dd87774319
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: MWH0EPF000A6734.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7777
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

555.42.02 reserves some CHIDs for internal use.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c | 7 ++++---
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c   | 2 +-
 drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h        | 1 +
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
index eb54146365bf..d6c3f2d01e56 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/fifo.c
@@ -542,13 +542,14 @@ r535_fifo_runl_ctor(struct nvkm_fifo *fifo)
 	struct nvkm_rm *rm = gsp->rm;
 	struct nvkm_runl *runl;
 	struct nvkm_engn *engn;
-	u32 cgids = 2048;
 	u32 chids = 2048;
+	u32 first = rm->api->fifo->rsvd_chids;
+	u32 count = chids - first;
 	int ret;
 	NV2080_CTRL_FIFO_GET_DEVICE_INFO_TABLE_PARAMS *ctrl;
 
-	if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, cgids, 0, cgids, &fifo->cgid)) ||
-	    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, 0, chids, &fifo->chid)))
+	if ((ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, first, count, &fifo->cgid)) ||
+	    (ret = nvkm_chid_new(&nvkm_chan_event, subdev, chids, first, count, &fifo->chid)))
 		return ret;
 
 	ctrl = nvkm_gsp_rm_ctrl_rd(&gsp->internal.device.subdevice,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
index bafe0af60d9c..c8ea05ea972c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/r535/gr.c
@@ -297,7 +297,7 @@ r535_gr_oneinit(struct nvkm_gr *base)
 	if (ret)
 		goto done;
 
-	ret = rmapi->fifo->chan.alloc(&gsp->internal.device, 1, 0, true, 0,
+	ret = rmapi->fifo->chan.alloc(&gsp->internal.device, 1, 0, true, rmapi->fifo->rsvd_chids,
 				      nvkm_memory_addr(golden.inst),
 				      nvkm_memory_addr(golden.inst) + 0x1000,
 				      nvkm_memory_addr(golden.inst) + 0x2000,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
index c0abbcb2908e..16eb3492f9db 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/rm/rm.h
@@ -100,6 +100,7 @@ struct nvkm_rm_api {
 		int (*xlat_rm_engine_type)(u32 rm_engine_type,
 					   enum nvkm_subdev_type *, int *nv2080_type);
 		int (*ectx_size)(struct nvkm_fifo *);
+		unsigned rsvd_chids;
 		struct {
 			int (*alloc)(struct nvkm_gsp_device *, u32 nv2080_engine_type, u8 runq, bool priv,
 				     int chid, u64 inst_addr, u64 userd_addr, u64 mthdbuf_addr,
-- 
2.49.0

