Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EAB3AB2B7B
	for <lists+nouveau@lfdr.de>; Sun, 11 May 2025 23:09:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0113810E281;
	Sun, 11 May 2025 21:09:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="G+zCbt7R";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM02-DM3-obe.outbound.protection.outlook.com
 (mail-dm3nam02on2040.outbound.protection.outlook.com [40.107.95.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DCAA110E28B
 for <nouveau@lists.freedesktop.org>; Sun, 11 May 2025 21:09:56 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kOTxP3DmmWD63H53ZAv6Sh5IpgGxMC2r5wlZiKYqfh+VjoIByLOykTr8ibuL9L/wx3x7mWEBzLUZYAmq6kw1XqJqCRmFhZHh3lxwKbKI62Xus7pPeAGnt6zk6gSMEXTMEsa518SlHpPFsX2bYrxUvBuuEER3CqWdpMKz1bwXiMsqX/TfFr93P/f/aHsTBL7X4E6FffzOD7tU5mxpnxueGhIu7S2/VBGUK01KuQqTskoqAh1KDWwyqg4wpM4tBIrv8bJ3wIwKdEkQAqiFsGdb0wzThNtU9+7MkO90BSCoCEaObitW1NXGboOQBxh18URkYcyHon4g0vP94Nickh9DHQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=f402DSo3jdq2GNG5JzgiojB30/VHeqmIcESeCN1ooYY=;
 b=mag/+fNa7GYcJyYoaSdpwyaGvEALarS2EicWonjogx6WVjs9hzmYXrSVVeNusv6vWHv+O+kj8bld3wnkwKOa5dCYiGbDK6z/IuSxXcFETtEovExQ/9bdIKqP+hkLRO2mQEicqUHE0Kb55S+7sPcAMAvG1uoR+pLHMSZ4ICqhEZW3cN1yr7U34aZfaVKTTpkkltX192pBkAmpmsTn0sNbKqc+/gc2ypGaM76rAGJl9Tto8VRq3qOA/zx6ow5OqhQTfZ4VRTb0PWAUWBk4gOi3qcQ9RNOQk4Rdre0+miyPJacC5EHjLBilgxDuLEUQSA2Ti9np6HnIKnRNLY7hLfA6vg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=f402DSo3jdq2GNG5JzgiojB30/VHeqmIcESeCN1ooYY=;
 b=G+zCbt7RO30ToCxsVA+q4X2JgWeMkV7mFKmcaZwYMLse+KgTzIJDHB6IZ0+y/NJ7gNXKB+/SvYIwVaTM/vzswrJgDGT7KzVACvkUJuFQfDbSjzDhjYGpzh279QR0Zjf5ygscQ3ght0cwD3O4fWSmd54O0xRRE+ZrVjscDgC0HJ0bVUMXiCWcXd4+ipOkT5yKehvm8A97dKgnCMdGhWbcsalWOqeLDWMDKT+Wq55VEqMxLA229nzBg8ijQNE1qKxhDmtICVpciUx06ucpXfYkV2A1QXrMch46L8mMQdGtG+yud/ei0mlQ3z0+LN5WvYFLh72kN8ptyIcrrplmKnVgnw==
Received: from DM6PR07CA0048.namprd07.prod.outlook.com (2603:10b6:5:74::25) by
 IA1PR12MB6386.namprd12.prod.outlook.com (2603:10b6:208:38a::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.21; Sun, 11 May
 2025 21:09:49 +0000
Received: from DS1PEPF0001709D.namprd05.prod.outlook.com
 (2603:10b6:5:74:cafe::ec) by DM6PR07CA0048.outlook.office365.com
 (2603:10b6:5:74::25) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.31 via Frontend Transport; Sun,
 11 May 2025 21:09:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 DS1PEPF0001709D.mail.protection.outlook.com (10.167.18.107) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8722.18 via Frontend Transport; Sun, 11 May 2025 21:09:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Sun, 11 May
 2025 14:09:40 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Sun, 11 May 2025 14:09:38 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>, <dakr@kernel.org>
CC: Ben Skeggs <bskeggs@nvidia.com>, Dave Airlie <airlied@redhat.com>, "Timur
 Tabi" <ttabi@nvidia.com>
Subject: [PATCH v2 57/62] drm/nouveau/gf100-: track chan progress with non-WFI
 semaphore release
Date: Mon, 12 May 2025 07:07:17 +1000
Message-ID: <20250511210722.80350-58-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS1PEPF0001709D:EE_|IA1PR12MB6386:EE_
X-MS-Office365-Filtering-Correlation-Id: 4edb2755-0a2b-42e3-e94f-08dd90d02a57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|82310400026|36860700013|1800799024; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tlBs/o/jpnVXXbbgP+rMgfxxMQJrBmd7KZOoWIc98U/yY7xeoMOJpOyjPvVH?=
 =?us-ascii?Q?xqNC358530FomtbREnv3MDrlHzRJJYF+6DBGfynn7isFwkIwvvfR2+y9GKFx?=
 =?us-ascii?Q?gNC/1ZVx+mj+WSQAbNs6PTZgTdqroX1/CydEuWSj6v/Su9F77tP2vC+2rohm?=
 =?us-ascii?Q?nLee5C768hZFtAC8RxUtmnXIQ7MXkhLEJCMPFPau3bpo26RxmFBMaIpFvyPg?=
 =?us-ascii?Q?16olrybirjkGQfz0/RzbdvUgbPc5j56dH2s5UY1Ed1c+avlPARBYhILCHMuB?=
 =?us-ascii?Q?I8GifuK8YUGuuMazY7unT6PrA56OMrq7/XekGGXbJByRfVsq+aYaMXVOOQsf?=
 =?us-ascii?Q?YGRfC5ot1NF2uo4TsBDy14yzPSn+U/QlTuN4pakhFp+1vrKCHt98l9qgdSLZ?=
 =?us-ascii?Q?SPGqBYoqfGnupmfJjWqGR87hDUtAhypbxfAWeKSRj1wKrF6HCn0UwklWSJpw?=
 =?us-ascii?Q?iLmJjQoMPFrqpyZjccnrOyHlpvxE7OHBdjXSKEdRNsrHk/kXuzH7GY+a9cWx?=
 =?us-ascii?Q?PwIb6Q2zWdpmglZwf/R7InVJ2WoNvcq7jmQqJtkHjst5/es6Gc6MqQ1xLfFc?=
 =?us-ascii?Q?a3zVrRls9twN/QIwnMfQd5ojh8bx1rcs6UA8NBK/GXCjhCIzq2pewhhFQPvp?=
 =?us-ascii?Q?BuI0Q/jLH9kSeApearyt8+cGSmmWqwf3yvQMTLR15gN7VOR8cDozYy2DkPoM?=
 =?us-ascii?Q?2Z/CzyCWdeCKMV1cnLjzRikv1K2BJEQEsHBk9fdxToK4JQCHfV24mYbDB6n/?=
 =?us-ascii?Q?hCENDm68dR1niUuh1xJt+LVVP/u1IWxyO2mLkkV9u698zscJZPW6kNxLvRiA?=
 =?us-ascii?Q?wq94ZcZaV0GGLrUz5e23dWv7rxtUDmxMXYqrH2eQxL04tjpD97yNfrS/awQR?=
 =?us-ascii?Q?RA9gY0KtpZ/qbQAHAiBhNsR5i/PRtNfZ4iclIhL+gKu/h4rHysi0HP0ZUvqv?=
 =?us-ascii?Q?RzcFuDL6zmDbRdtHJ/SPd9ZomzxAq+3DtCgs8QDEqHNSgCjKEFdrfKUsOIHF?=
 =?us-ascii?Q?gPz53/Rht/dYDjCnjWLgbPpMkkCdxEWBNn/zOEgEpIfYsNuV8CceJDo0AS5R?=
 =?us-ascii?Q?bO0fRbqPZDzbbrx6wRE3ghsBy0gBxalFPetzk/Nf+CpqEuA5+sv+sWocD2Zf?=
 =?us-ascii?Q?g9ELmsvbsPOajeD++2pJe12LnFlwtitAFNVwe6rd6NGfDNvOgEYN2KNWPDKF?=
 =?us-ascii?Q?HziCKLPe3mmmu5bzuVXr0zj2V+ZWOBf6OGrqKvRXzRGqTRrzhPU3wiJoP7uh?=
 =?us-ascii?Q?sq8qCGHxiFEDq7X2ug3iiSURUFsShVJkFzXg4SoNxv3RC+yyTV7vl7DGA57k?=
 =?us-ascii?Q?PMa7+gUlrQflQDo/3nhNqP9dM9cAuE2UZ5ybARTCqtqChtecYuIR0TJPm9n6?=
 =?us-ascii?Q?4ULiwmsmlFQHat+Wn1YBwTeNDBZmdnWqADj3fT/1Kk+MF/0f+Lcyw4vWO4oc?=
 =?us-ascii?Q?OCQRReHhYHNdUKz/oDCpii+zH7wdEK6ha7koN9aiLowRcbAY37d79l2iJYae?=
 =?us-ascii?Q?5Q8WAttB150kCzaj8Asdy23Rvgoaj3rMVI8o?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(82310400026)(36860700013)(1800799024); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 May 2025 21:09:49.2867 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 4edb2755-0a2b-42e3-e94f-08dd90d02a57
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS1PEPF0001709D.namprd05.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6386
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

From VOLTA_CHANNEL_GPFIFO_A onwards, HW no longer updates the GET/GP_GET
pointers in USERD following channel progress, but instead updates on a
timer for compatibility, and SW is expected to implement its own method
of tracking channel progress (typically via non-WFI semaphore release).

Nouveau has been making use of the compatibility mode up until now,
however, from BLACKWELL_CHANNEL_GPFIFO_A HW no longer supports USERD
writeback at all.

Allocate a per-channel buffer in system memory, and append a non-WFI
semaphore release to the end of each push buffer segment to simulate
the pointers previously read from USERD.

This change is implemented for Fermi (which is the first to support non-
WFI semaphore release) onwards, as readback from system memory is likely
faster than BAR1 reads.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
Reviewed-by: Dave Airlie <airlied@redhat.com>
Reviewed-by: Timur Tabi <ttabi@nvidia.com>
Tested-by: Timur Tabi <ttabi@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/chan.h | 30 +++++--
 drivers/gpu/drm/nouveau/nouveau_bo.c        | 22 +++++
 drivers/gpu/drm/nouveau/nouveau_bo.h        |  2 +
 drivers/gpu/drm/nouveau/nouveau_chan.c      | 19 ++++-
 drivers/gpu/drm/nouveau/nouveau_chan.h      |  5 ++
 drivers/gpu/drm/nouveau/nouveau_exec.c      |  2 +
 drivers/gpu/drm/nouveau/nouveau_gem.c       |  2 +
 drivers/gpu/drm/nouveau/nvif/Kbuild         |  1 +
 drivers/gpu/drm/nouveau/nvif/chan.c         | 33 +++++++-
 drivers/gpu/drm/nouveau/nvif/chan506f.c     |  6 +-
 drivers/gpu/drm/nouveau/nvif/chan906f.c     | 93 +++++++++++++++++++++
 drivers/gpu/drm/nouveau/nvif/chanc36f.c     | 48 +++++++++--
 12 files changed, 245 insertions(+), 18 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvif/chan906f.c

diff --git a/drivers/gpu/drm/nouveau/include/nvif/chan.h b/drivers/gpu/drm/nouveau/include/nvif/chan.h
index c1f7a8fce05b..c329a29068d5 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/chan.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/chan.h
@@ -17,7 +17,13 @@ struct nvif_chan {
 			void (*push)(struct nvif_chan *, bool main, u64 addr, u32 size,
 				     bool no_prefetch);
 			void (*kick)(struct nvif_chan *);
+			int (*post)(struct nvif_chan *, u32 gpptr, u32 pbptr);
+			u32 post_size;
 		} gpfifo;
+
+		struct {
+			int (*release)(struct nvif_chan *, u64 addr, u32 data);
+		} sem;
 	} *func;
 
 	struct {
@@ -31,6 +37,11 @@ struct nvif_chan {
 		int free;
 	} gpfifo;
 
+	struct {
+		struct nvif_map map;
+		u64 addr;
+	} sema;
+
 	struct nvif_push push;
 
 	struct nvif_user *usermode;
@@ -43,14 +54,23 @@ void nvif_chan_gpfifo_ctor(const struct nvif_chan_func *, void *userd, void *gpf
 			   void *push, u64 push_addr, u32 push_size, struct nvif_chan *);
 int nvif_chan_gpfifo_wait(struct nvif_chan *, u32 gpfifo_nr, u32 push_nr);
 void nvif_chan_gpfifo_push(struct nvif_chan *, u64 addr, u32 size, bool no_prefetch);
+int nvif_chan_gpfifo_post(struct nvif_chan *);
 
-int nvif_chan506f_ctor(struct nvif_chan *, void *userd, void *gpfifo, u32 gpfifo_size,
-		       void *push, u64 push_addr, u32 push_size);
-u32 nvif_chan506f_read_get(struct nvif_chan *);
-u32 nvif_chan506f_gpfifo_read_get(struct nvif_chan *);
 void nvif_chan506f_gpfifo_push(struct nvif_chan *, bool main, u64 addr, u32 size, bool no_prefetch);
+void nvif_chan506f_gpfifo_kick(struct nvif_chan *);
+
+int nvif_chan906f_ctor_(const struct nvif_chan_func *, void *userd, void *gpfifo, u32 gpfifo_size,
+			void *push, u64 push_addr, u32 push_size, void *sema, u64 sema_addr,
+			struct nvif_chan *);
+u32 nvif_chan906f_read_get(struct nvif_chan *);
+u32 nvif_chan906f_gpfifo_read_get(struct nvif_chan *);
+int nvif_chan906f_gpfifo_post(struct nvif_chan *, u32 gpptr, u32 pbptr);
 
+int nvif_chan506f_ctor(struct nvif_chan *, void *userd, void *gpfifo, u32 gpfifo_size,
+		       void *push, u64 push_addr, u32 push_size);
+int nvif_chan906f_ctor(struct nvif_chan *, void *userd, void *gpfifo, u32 gpfifo_size,
+		       void *push, u64 push_addr, u32 push_size, void *sema, u64 sema_addr);
 int nvif_chanc36f_ctor(struct nvif_chan *, void *userd, void *gpfifo, u32 gpfifo_size,
-		       void *push, u64 push_addr, u32 push_size,
+		       void *push, u64 push_addr, u32 push_size, void *sema, u64 sema_addr,
 		       struct nvif_user *usermode, u32 doorbell_token);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.c b/drivers/gpu/drm/nouveau/nouveau_bo.c
index 3a5ddf60380e..a32a50f41a43 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.c
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.c
@@ -456,6 +456,28 @@ nouveau_bo_new_map(struct nouveau_cli *cli, u32 domain, u32 size, struct nouveau
 	return 0;
 }
 
+int
+nouveau_bo_new_map_gpu(struct nouveau_cli *cli, u32 domain, u32 size,
+		       struct nouveau_bo **pnvbo, struct nouveau_vma **pvma)
+{
+	struct nouveau_vmm *vmm = nouveau_cli_vmm(cli);
+	struct nouveau_bo *nvbo;
+	int ret;
+
+	ret = nouveau_bo_new_map(cli, domain, size, &nvbo);
+	if (ret)
+		return ret;
+
+	ret = nouveau_vma_new(nvbo, vmm, pvma);
+	if (ret) {
+		nouveau_bo_unpin_del(&nvbo);
+		return ret;
+	}
+
+	*pnvbo = nvbo;
+	return 0;
+}
+
 static void
 set_placement_range(struct nouveau_bo *nvbo, uint32_t domain)
 {
diff --git a/drivers/gpu/drm/nouveau/nouveau_bo.h b/drivers/gpu/drm/nouveau/nouveau_bo.h
index f402f14bebb0..d59fd12268b9 100644
--- a/drivers/gpu/drm/nouveau/nouveau_bo.h
+++ b/drivers/gpu/drm/nouveau/nouveau_bo.h
@@ -92,6 +92,8 @@ void nouveau_bo_del_io_reserve_lru(struct ttm_buffer_object *bo);
 
 int nouveau_bo_new_pin(struct nouveau_cli *, u32 domain, u32 size, struct nouveau_bo **);
 int nouveau_bo_new_map(struct nouveau_cli *, u32 domain, u32 size, struct nouveau_bo **);
+int nouveau_bo_new_map_gpu(struct nouveau_cli *, u32 domain, u32 size,
+			   struct nouveau_bo **, struct nouveau_vma **);
 void nouveau_bo_unpin_del(struct nouveau_bo **);
 
 /* TODO: submit equivalent to TTM generic API upstream? */
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.c b/drivers/gpu/drm/nouveau/nouveau_chan.c
index ad1e99184f7a..2a775d908e24 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.c
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.c
@@ -103,6 +103,8 @@ nouveau_channel_del(struct nouveau_channel **pchan)
 		nvif_event_dtor(&chan->kill);
 		nvif_object_dtor(&chan->user);
 		nvif_mem_dtor(&chan->mem_userd);
+		nouveau_vma_del(&chan->sema.vma);
+		nouveau_bo_unpin_del(&chan->sema.bo);
 		nvif_object_dtor(&chan->push.ctxdma);
 		nouveau_vma_del(&chan->push.vma);
 		nouveau_bo_unpin_del(&chan->push.buffer);
@@ -189,8 +191,10 @@ nouveau_channel_prep(struct nouveau_cli *cli,
 
 		chan->push.addr = chan->push.vma->addr;
 
-		if (device->info.family >= NV_DEVICE_INFO_V0_FERMI)
-			return 0;
+		if (device->info.family >= NV_DEVICE_INFO_V0_FERMI) {
+			return nouveau_bo_new_map_gpu(cli, NOUVEAU_GEM_DOMAIN_GART, PAGE_SIZE,
+						      &chan->sema.bo, &chan->sema.vma);
+		}
 
 		args.target = NV_DMA_V0_TARGET_VM;
 		args.access = NV_DMA_V0_ACCESS_VM;
@@ -429,16 +433,25 @@ nouveau_channel_init(struct nouveau_channel *chan, u32 vram, u32 gart)
 		chan->user_get = 0x44;
 		chan->dma.max = (0x10000 / 4) - 2;
 	} else
-	if (chan->user.oclass < VOLTA_CHANNEL_GPFIFO_A) {
+	if (chan->user.oclass < FERMI_CHANNEL_GPFIFO) {
 		ret = nvif_chan506f_ctor(&chan->chan, chan->userd->map.ptr,
 					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
 					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000);
 		if (ret)
 			return ret;
+	} else
+	if (chan->user.oclass < VOLTA_CHANNEL_GPFIFO_A) {
+		ret = nvif_chan906f_ctor(&chan->chan, chan->userd->map.ptr,
+					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
+					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 chan->sema.bo->kmap.virtual, chan->sema.vma->addr);
+		if (ret)
+			return ret;
 	} else {
 		ret = nvif_chanc36f_ctor(&chan->chan, chan->userd->map.ptr,
 					 (u8*)chan->push.buffer->kmap.virtual + 0x10000, 0x2000,
 					 chan->push.buffer->kmap.virtual, chan->push.addr, 0x10000,
+					 chan->sema.bo->kmap.virtual, chan->sema.vma->addr,
 					 &drm->client.device.user, chan->token);
 		if (ret)
 			return ret;
diff --git a/drivers/gpu/drm/nouveau/nouveau_chan.h b/drivers/gpu/drm/nouveau/nouveau_chan.h
index ea8c3cdab46f..561877725aac 100644
--- a/drivers/gpu/drm/nouveau/nouveau_chan.h
+++ b/drivers/gpu/drm/nouveau/nouveau_chan.h
@@ -43,6 +43,11 @@ struct nouveau_channel {
 	u32 user_get;
 	u32 user_put;
 
+	struct {
+		struct nouveau_bo *bo;
+		struct nouveau_vma *vma;
+	} sema;
+
 	struct nvif_object user;
 	struct nvif_object blit;
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_exec.c b/drivers/gpu/drm/nouveau/nouveau_exec.c
index eac7cf8940a3..41b7c608c905 100644
--- a/drivers/gpu/drm/nouveau/nouveau_exec.c
+++ b/drivers/gpu/drm/nouveau/nouveau_exec.c
@@ -146,6 +146,8 @@ nouveau_exec_job_run(struct nouveau_job *job)
 		nvif_chan_gpfifo_push(&chan->chan, p->va, p->va_len, no_prefetch);
 	}
 
+	nvif_chan_gpfifo_post(&chan->chan);
+
 	ret = nouveau_fence_emit(fence);
 	if (ret) {
 		nouveau_fence_unref(&exec_job->fence);
diff --git a/drivers/gpu/drm/nouveau/nouveau_gem.c b/drivers/gpu/drm/nouveau/nouveau_gem.c
index 5877545c2c50..690e10fbf0bd 100644
--- a/drivers/gpu/drm/nouveau/nouveau_gem.c
+++ b/drivers/gpu/drm/nouveau/nouveau_gem.c
@@ -866,6 +866,8 @@ nouveau_gem_ioctl_pushbuf(struct drm_device *dev, void *data,
 
 			nvif_chan_gpfifo_push(&chan->chan, addr, length, no_prefetch);
 		}
+
+		nvif_chan_gpfifo_post(&chan->chan);
 	} else
 	if (drm->client.device.info.chipset >= 0x25) {
 		ret = PUSH_WAIT(&chan->chan.push, req->nr_push * 2);
diff --git a/drivers/gpu/drm/nouveau/nvif/Kbuild b/drivers/gpu/drm/nouveau/nvif/Kbuild
index 991722951fbb..198889c20ce1 100644
--- a/drivers/gpu/drm/nouveau/nvif/Kbuild
+++ b/drivers/gpu/drm/nouveau/nvif/Kbuild
@@ -17,6 +17,7 @@ nvif-y += nvif/vmm.o
 # Channel classes
 nvif-y += nvif/chan.o
 nvif-y += nvif/chan506f.o
+nvif-y += nvif/chan906f.o
 nvif-y += nvif/chanc36f.o
 
 # Usermode classes
diff --git a/drivers/gpu/drm/nouveau/nvif/chan.c b/drivers/gpu/drm/nouveau/nvif/chan.c
index 7f58a1c17979..baa10227d51a 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan.c
@@ -9,7 +9,16 @@ nvif_chan_gpfifo_push_kick(struct nvif_push *push)
 {
 	struct nvif_chan *chan = container_of(push, typeof(*chan), push);
 	u32 put = push->bgn - (u32 *)chan->push.mem.object.map.ptr;
-	u32 cnt = push->cur - push->bgn;
+	u32 cnt;
+
+	if (chan->func->gpfifo.post) {
+		if (push->end - push->cur < chan->func->gpfifo.post_size)
+			push->end = push->cur + chan->func->gpfifo.post_size;
+
+		WARN_ON(nvif_chan_gpfifo_post(chan));
+	}
+
+	cnt = push->cur - push->bgn;
 
 	chan->func->gpfifo.push(chan, true, chan->push.addr + (put << 2), cnt << 2, false);
 	chan->func->gpfifo.kick(chan);
@@ -23,6 +32,16 @@ nvif_chan_gpfifo_push_wait(struct nvif_push *push, u32 push_nr)
 	return nvif_chan_gpfifo_wait(chan, 1, push_nr);
 }
 
+int
+nvif_chan_gpfifo_post(struct nvif_chan *chan)
+{
+	const u32 *map = chan->push.mem.object.map.ptr;
+	const u32 pbptr = (chan->push.cur - map) + chan->func->gpfifo.post_size;
+	const u32 gpptr = (chan->gpfifo.cur + 1) & chan->gpfifo.max;
+
+	return chan->func->gpfifo.post(chan, gpptr, pbptr);
+}
+
 void
 nvif_chan_gpfifo_push(struct nvif_chan *chan, u64 addr, u32 size, bool no_prefetch)
 {
@@ -35,6 +54,14 @@ nvif_chan_gpfifo_wait(struct nvif_chan *chan, u32 gpfifo_nr, u32 push_nr)
 	struct nvif_push *push = &chan->push;
 	int ret = 0, time = 1000000;
 
+	if (gpfifo_nr) {
+		/* Account for pushbuf space needed by nvif_chan_gpfifo_post(),
+		 * if used after pushing userspace GPFIFO entries.
+		 */
+		if (chan->func->gpfifo.post)
+			push_nr += chan->func->gpfifo.post_size;
+	}
+
 	/* Account for the GPFIFO entry needed to submit pushbuf. */
 	if (push_nr)
 		gpfifo_nr++;
@@ -89,6 +116,8 @@ nvif_chan_dma_wait(struct nvif_chan *chan, u32 nr)
 	u32 cur = push->cur - (u32 *)push->mem.object.map.ptr;
 	u32 free, time = 1000000;
 
+	nr += chan->func->gpfifo.post_size;
+
 	do {
 		u32 get = chan->func->push.read_get(chan);
 
@@ -122,6 +151,6 @@ nvif_chan_dma_wait(struct nvif_chan *chan, u32 nr)
 
 	push->bgn = (u32 *)push->mem.object.map.ptr + cur;
 	push->cur = push->bgn;
-	push->end = push->bgn + free;
+	push->end = push->bgn + free - chan->func->gpfifo.post_size;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvif/chan506f.c b/drivers/gpu/drm/nouveau/nvif/chan506f.c
index 5a5f8ddc058f..d3900887c4a7 100644
--- a/drivers/gpu/drm/nouveau/nvif/chan506f.c
+++ b/drivers/gpu/drm/nouveau/nvif/chan506f.c
@@ -4,7 +4,7 @@
  */
 #include <nvif/chan.h>
 
-static void
+void
 nvif_chan506f_gpfifo_kick(struct nvif_chan *chan)
 {
 	wmb();
@@ -31,13 +31,13 @@ nvif_chan506f_gpfifo_push(struct nvif_chan *chan, bool main, u64 addr, u32 size,
 		chan->push.end = chan->push.cur;
 }
 
-u32
+static u32
 nvif_chan506f_gpfifo_read_get(struct nvif_chan *chan)
 {
 	return nvif_rd32(&chan->userd, 0x88);
 }
 
-u32
+static u32
 nvif_chan506f_read_get(struct nvif_chan *chan)
 {
 	u32 tlgetlo = nvif_rd32(&chan->userd, 0x58);
diff --git a/drivers/gpu/drm/nouveau/nvif/chan906f.c b/drivers/gpu/drm/nouveau/nvif/chan906f.c
new file mode 100644
index 000000000000..c9cfb85179b0
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvif/chan906f.c
@@ -0,0 +1,93 @@
+/* SPDX-License-Identifier: MIT
+ *
+ * Copyright (c) 2025, NVIDIA CORPORATION. All rights reserved.
+ */
+#include <nvif/chan.h>
+#include <nvif/user.h>
+#include <nvif/push906f.h>
+
+#include <nvhw/class/cl906f.h>
+
+/* Limits GPFIFO size to 1MiB, and "main" push buffer size to 64KiB. */
+#define NVIF_CHAN906F_PBPTR_BITS  15
+#define NVIF_CHAN906F_PBPTR_MASK  ((1 << NVIF_CHAN906F_PBPTR_BITS) - 1)
+
+#define NVIF_CHAN906F_GPPTR_SHIFT NVIF_CHAN906F_PBPTR_BITS
+#define NVIF_CHAN906F_GPPTR_BITS  (32 - NVIF_CHAN906F_PBPTR_BITS)
+#define NVIF_CHAN906F_GPPTR_MASK  ((1 << NVIF_CHAN906F_GPPTR_BITS) - 1)
+
+#define NVIF_CHAN906F_SEM_RELEASE_SIZE 5
+
+static int
+nvif_chan906f_sem_release(struct nvif_chan *chan, u64 addr, u32 data)
+{
+	struct nvif_push *push = &chan->push;
+	int ret;
+
+	ret = PUSH_WAIT(push, NVIF_CHAN906F_SEM_RELEASE_SIZE);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NV906F, SEMAPHOREA,
+		  NVVAL(NV906F, SEMAPHOREA, OFFSET_UPPER, upper_32_bits(addr)),
+
+				SEMAPHOREB, lower_32_bits(addr),
+
+				SEMAPHOREC, data,
+
+				SEMAPHORED,
+		  NVDEF(NV906F, SEMAPHORED, OPERATION, RELEASE) |
+		  NVDEF(NV906F, SEMAPHORED, RELEASE_WFI, DIS) |
+		  NVDEF(NV906F, SEMAPHORED, RELEASE_SIZE, 16BYTE));
+
+	return 0;
+}
+
+int
+nvif_chan906f_gpfifo_post(struct nvif_chan *chan, u32 gpptr, u32 pbptr)
+{
+	return chan->func->sem.release(chan, chan->sema.addr,
+				       (gpptr << NVIF_CHAN906F_GPPTR_SHIFT) | pbptr);
+}
+
+u32
+nvif_chan906f_gpfifo_read_get(struct nvif_chan *chan)
+{
+	return nvif_rd32(&chan->sema, 0) >> NVIF_CHAN906F_GPPTR_SHIFT;
+}
+
+u32
+nvif_chan906f_read_get(struct nvif_chan *chan)
+{
+	return nvif_rd32(&chan->sema, 0) & NVIF_CHAN906F_PBPTR_MASK;
+}
+
+static const struct nvif_chan_func
+nvif_chan906f = {
+	.push.read_get = nvif_chan906f_read_get,
+	.gpfifo.read_get = nvif_chan906f_gpfifo_read_get,
+	.gpfifo.push = nvif_chan506f_gpfifo_push,
+	.gpfifo.kick = nvif_chan506f_gpfifo_kick,
+	.gpfifo.post = nvif_chan906f_gpfifo_post,
+	.gpfifo.post_size = NVIF_CHAN906F_SEM_RELEASE_SIZE,
+	.sem.release = nvif_chan906f_sem_release,
+};
+
+int
+nvif_chan906f_ctor_(const struct nvif_chan_func *func, void *userd, void *gpfifo, u32 gpfifo_size,
+		    void *push, u64 push_addr, u32 push_size, void *sema, u64 sema_addr,
+		    struct nvif_chan *chan)
+{
+	nvif_chan_gpfifo_ctor(func, userd, gpfifo, gpfifo_size, push, push_addr, push_size, chan);
+	chan->sema.map.ptr = sema;
+	chan->sema.addr = sema_addr;
+	return 0;
+}
+
+int
+nvif_chan906f_ctor(struct nvif_chan *chan, void *userd, void *gpfifo, u32 gpfifo_size,
+		   void *push, u64 push_addr, u32 push_size, void *sema, u64 sema_addr)
+{
+	return nvif_chan906f_ctor_(&nvif_chan906f, userd, gpfifo, gpfifo_size,
+				   push, push_addr, push_size, sema, sema_addr, chan);
+}
diff --git a/drivers/gpu/drm/nouveau/nvif/chanc36f.c b/drivers/gpu/drm/nouveau/nvif/chanc36f.c
index 28a4207a4390..2f3e500d94c7 100644
--- a/drivers/gpu/drm/nouveau/nvif/chanc36f.c
+++ b/drivers/gpu/drm/nouveau/nvif/chanc36f.c
@@ -5,6 +5,9 @@
 #include <nvif/chan.h>
 #include <nvif/user.h>
 
+#include <nvif/push906f.h>
+#include <nvhw/class/clc36f.h>
+
 static void
 nvif_chanc36f_gpfifo_kick(struct nvif_chan *chan)
 {
@@ -18,21 +21,56 @@ nvif_chanc36f_gpfifo_kick(struct nvif_chan *chan)
 	usermode->func->doorbell(usermode, chan->doorbell_token);
 }
 
+#define NVIF_CHANC36F_SEM_RELEASE_SIZE 6
+
+static int
+nvif_chanc36f_sem_release(struct nvif_chan *chan, u64 addr, u32 data)
+{
+	struct nvif_push *push = &chan->push;
+	int ret;
+
+	ret = PUSH_WAIT(push, NVIF_CHANC36F_SEM_RELEASE_SIZE);
+	if (ret)
+		return ret;
+
+	PUSH_MTHD(push, NVC36F, SEM_ADDR_LO, lower_32_bits(addr),
+
+				SEM_ADDR_HI, upper_32_bits(addr),
+
+				SEM_PAYLOAD_LO, data);
+
+	PUSH_MTHD(push, NVC36F, SEM_EXECUTE,
+		  NVDEF(NVC36F, SEM_EXECUTE, OPERATION, RELEASE) |
+		  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_WFI, EN) |
+		  NVDEF(NVC36F, SEM_EXECUTE, PAYLOAD_SIZE, 32BIT) |
+		  NVDEF(NVC36F, SEM_EXECUTE, RELEASE_TIMESTAMP, DIS));
+
+	return 0;
+}
+
 static const struct nvif_chan_func
 nvif_chanc36f = {
-	.push.read_get = nvif_chan506f_read_get,
-	.gpfifo.read_get = nvif_chan506f_gpfifo_read_get,
+	.push.read_get = nvif_chan906f_read_get,
+	.gpfifo.read_get = nvif_chan906f_gpfifo_read_get,
 	.gpfifo.push = nvif_chan506f_gpfifo_push,
 	.gpfifo.kick = nvif_chanc36f_gpfifo_kick,
+	.gpfifo.post = nvif_chan906f_gpfifo_post,
+	.gpfifo.post_size = NVIF_CHANC36F_SEM_RELEASE_SIZE,
+	.sem.release = nvif_chanc36f_sem_release,
 };
 
 int
 nvif_chanc36f_ctor(struct nvif_chan *chan, void *userd, void *gpfifo, u32 gpfifo_size,
-		   void *push, u64 push_addr, u32 push_size,
+		   void *push, u64 push_addr, u32 push_size, void *sema, u64 sema_addr,
 		   struct nvif_user *usermode, u32 doorbell_token)
 {
-	nvif_chan_gpfifo_ctor(&nvif_chanc36f, userd, gpfifo, gpfifo_size,
-			      push, push_addr, push_size, chan);
+	int ret;
+
+	ret = nvif_chan906f_ctor_(&nvif_chanc36f, userd, gpfifo, gpfifo_size,
+				  push, push_addr, push_size, sema, sema_addr, chan);
+	if (ret)
+		return ret;
+
 	chan->usermode = usermode;
 	chan->doorbell_token = doorbell_token;
 	return 0;
-- 
2.49.0

