Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAD0ABA6FD
	for <lists+nouveau@lfdr.de>; Sat, 17 May 2025 02:10:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3250B10E108;
	Sat, 17 May 2025 00:10:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="jj7BR0Qc";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2040.outbound.protection.outlook.com [40.107.244.40])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 842DE10E108
 for <nouveau@lists.freedesktop.org>; Sat, 17 May 2025 00:10:34 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bR7Ii0iy2s23JNSK1DfAB6HKr6xW41QrjpDQ8AcFuolBXjUySLz7Kr+vjtfXAqHF5kbh3oXD+cw9BrrnJw7KDdK+PgpR+Xc8e85uWdQkdnjxRHd5qg4IFHL0ERxdy3UwG3fh6/g/E1UIPBtqPv1K91w/2Uc+LhdwbJ3+aKrqbM2LrQ8NYaKZpzmHbremnw+tOFJEjyXxBdlyPFBh4rdL7/m6QCpYzxLOt29LS2/bb8/roC2WM6vN9fi+ylOHy33sMZjYCesa4eRWT0FoRq7xu+iEqQW7Jsisb2ACORaUrph0eP0xgs98sNiCDzARKdYVrqHA0o+fvh/UA0toXe98Bg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qTXj1LKomUrhMCELOguwLRXdS2XDbIjj4Y+85x4Ouf8=;
 b=FViX/dD2hv59fVI+pocNPfmVxDxV61vZiBJ41i59GEn2ngt9GuguK/EqF2EgxSgRprInq0QYOLifScuJE31Ls4yux98uj1XZTBMd3OACJRUc7oiZG9Z0ZlEaS9wLVaP5xNu1H6KQ/KbIn2YSbQ07TIReKPL0klGmLmO3h7WRQaaTcIMYibQeA/c0/ZlDBkUOijYWLK/cbCDZImnXPxyRafzQp9obpRASIbHNiKlliQ4qFfc5m8iCMaxTud8YReKRTQtzReeQNat43uuxi6KpKCu3dzsOAlttGp6OnSB/KdSbn5FmGjLAKRp0vr5wJzGstwVn6qkAiA5x4SI/+UZ0Iw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qTXj1LKomUrhMCELOguwLRXdS2XDbIjj4Y+85x4Ouf8=;
 b=jj7BR0Qc9EMGyEt0RU4bc0f5C2ePCsoffB+NT/YdflKViPJOOjonkeOFRPMlnRM2POAMQEC6/kkvmyY432N4sAUa5RDEFAotoGS5Rf3AVCJ7bd4RdA2zZg+MG2Sd1lFVjSP7AxldsSdj8gccWU2/TsBCt9b5ForlxL+dyLqvfZlvdzVTsq9syQu3zdzp2bjpeYqJC3fwt5GRfBeGFED9OuB6S0YepkVHFDJa18Kbntnv76eUbeNskXmk2IJB4leAycuwcXK6PnzZG0otWY+xtNsxK278C49Q1wq072CasAEzOjqrCKS3o79lzUx1hbBK17eWM64aXDkF/xnqQoEOCA==
Received: from SJ0PR03CA0151.namprd03.prod.outlook.com (2603:10b6:a03:338::6)
 by SJ0PR12MB7008.namprd12.prod.outlook.com (2603:10b6:a03:486::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8722.33; Sat, 17 May
 2025 00:10:25 +0000
Received: from CY4PEPF0000FCC0.namprd03.prod.outlook.com
 (2603:10b6:a03:338:cafe::12) by SJ0PR03CA0151.outlook.office365.com
 (2603:10b6:a03:338::6) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8699.32 via Frontend Transport; Sat,
 17 May 2025 00:10:25 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 CY4PEPF0000FCC0.mail.protection.outlook.com (10.167.242.102) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8746.27 via Frontend Transport; Sat, 17 May 2025 00:10:24 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 16 May
 2025 17:10:11 -0700
Received: from nv-dev.vdiclient.nvidia.com (10.126.231.35) by
 rnnvmail201.nvidia.com (10.129.68.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.14; Fri, 16 May 2025 17:10:10 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH v3 02/62] drm/nouveau/gsp: remove gsp-specific chid allocation
 path
Date: Sat, 17 May 2025 10:08:54 +1000
Message-ID: <20250517000954.35691-3-bskeggs@nvidia.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250517000954.35691-1-bskeggs@nvidia.com>
References: <20250517000954.35691-1-bskeggs@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.126.231.35]
X-ClientProxiedBy: rnnvmail202.nvidia.com (10.129.68.7) To
 rnnvmail201.nvidia.com (10.129.68.8)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CY4PEPF0000FCC0:EE_|SJ0PR12MB7008:EE_
X-MS-Office365-Filtering-Correlation-Id: a3a12cc6-073f-46ed-1028-08dd94d738d7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|376014|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?scFGy4RjBfV3+SRRKui74WqpH55VpESdEYg7jO6bKjT3bvdEONHEPZs1UlU1?=
 =?us-ascii?Q?Xx3/YVoVD8qNsaaLM4ISlmWiVqIvCzA2dLVPgXgt/BRZJddgbBecXJKSlJTj?=
 =?us-ascii?Q?bbFesRgejclHrSUpW5rp2C7C1JkqO9eN8+Ve1LlyG7dFLN9tVGVa2PN+lEjy?=
 =?us-ascii?Q?RjZRvyqDVkmPCOUQfHLNVIhg9RtcdWNss+x2+t+eWx7BJDDerNQc7Pc6c+1w?=
 =?us-ascii?Q?3RKW/hrXnD5HQsFspaAJXd5kcOEUcdhvIr7sWzA9hxkfe2DAzdv1/Eml04ES?=
 =?us-ascii?Q?J7Au20Sa+CyYdEdAq0fvqlrw9MjyFsR3jSBH0wNCw7Cw87Mcd4zOjm+eOTNS?=
 =?us-ascii?Q?llHaqDAymsmeA3eu0LFfJHX59nRbPsLXZjdb4JvJ6kqjTnDPp7Aaq3MOyYQU?=
 =?us-ascii?Q?/RdOd7bubvN1kS7A5R4G0idoF6eNFEaz8qdZTwh/0/CgNsk0lj7dxDWA+tAe?=
 =?us-ascii?Q?KmA/RQZXav9ai1yNbj9wPtgGnvj11sUFxIREfbvqEkXCnffoLrTwvDFaSuM4?=
 =?us-ascii?Q?9DkX8UAiQdH5PHPfBHEJDJ3qI5Yz/T7B4GsrlbfcEmZPGvJ3GILHK6PM3kl6?=
 =?us-ascii?Q?hWNky97yhjK1FVx6sfCzpEerUfzpFJ8KxS69n3hW41AydJ6oh8oMFVaye+Ol?=
 =?us-ascii?Q?PVJxqN1XIwh7B1cQOA8UiJLmTl9lFbPtN9WJuHy8/CcYOkO6hiEhVMIXBbDN?=
 =?us-ascii?Q?IBxfufIO0SUUZOIGEru/wt5qdxDY3e2NG3XPaJGFRzVAIJGuc+cq8HeJKaSE?=
 =?us-ascii?Q?REKB6cirVUwBhGQ7gyIHQGV7p8u8B11El5ddiYPFfoY3GbBgwxA1cvX5UcLt?=
 =?us-ascii?Q?u/OhJpe7xLXC9b0r/zaN2flsJjzhBZFeklC+e4Ni+Oi5MCxwJhGjRUqfKTDH?=
 =?us-ascii?Q?pSYKOuFhtpUftN7vb94SoDKkJswN3sOR61lQumXae6SWr3REpjGKMPuUEYwY?=
 =?us-ascii?Q?n0jmULhA5xB0oyLJyShiU0bUSruwPDTuo1LZ8yhbeVpqIel1/NMiUA+uBE6F?=
 =?us-ascii?Q?/XdhCudYF7zR+OEH60JRtaI/HyWKNkLXpUVLqOa31RwjG0pIA6EPzg/RMUaV?=
 =?us-ascii?Q?Wfmk3uBfEtczZpDSc9jzSPAA2TvK1lk9EQLmOdH80VWCAs0iYLBtSPcNgyNw?=
 =?us-ascii?Q?IqaPqPAssYOot0p0LGP6Po/eigepixfQwxhEM+FI7qvRial3A62+7/KmFJQI?=
 =?us-ascii?Q?3UtENAojza+ktm44gw84+otXqHriIKTlNyLbyGcW8pW6E33ueZwqQwkeqZQp?=
 =?us-ascii?Q?M4uYfKp/rEAYag7YWZiTLYTix4vU/YOr5vyQX0A3U33VkedUN1Vti3ghpylo?=
 =?us-ascii?Q?gZSlQZeq6faBRhs1PIf8JEQWQQ7Bm+76b76iIBpX7UHqy+DDdbIGW+hjZ8ek?=
 =?us-ascii?Q?CcXu6WENN45cCMRYkYTFMplaSE2QOhl8imaucjFCFo/xnfzOr4zSnQCkeZ1i?=
 =?us-ascii?Q?i3YSQEjW+JIwtrbNzeya5HyhLKvhiAoSnrK6DpSqFXaAH4DqvhunX9HAA+7T?=
 =?us-ascii?Q?o+mZsX+1rrhYCjI67laM1CbLe8cxXlgIMFuj?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(376014)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 May 2025 00:10:24.8262 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: a3a12cc6-073f-46ed-1028-08dd94d738d7
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CY4PEPF0000FCC0.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB7008
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

In order to specify a channel ID to RM during channel allocation, the
channel ID is broken down into a "userd page" index and an index into
that page.

It was assumed that RM would enforce that the same physical block of
memory be used for all CHIDs within a "userd page", and the GSP paths
override NVKM's normal CHID allocation to handle this.

However, none of that turns out to be necessary.

Remove the GSP-specific code and use the regular CHID allocation path.

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../drm/nouveau/include/nvkm/engine/fifo.h    |   3 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/base.c   |   5 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.c   |  46 +++----
 .../gpu/drm/nouveau/nvkm/engine/fifo/chan.h   |   3 -
 .../gpu/drm/nouveau/nvkm/engine/fifo/r535.c   | 115 ------------------
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    |   2 +-
 6 files changed, 20 insertions(+), 154 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
index be508f65b280..96c16cfccf16 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/engine/fifo.h
@@ -78,9 +78,6 @@ struct nvkm_fifo {
 	struct {
 		struct nvkm_memory *mem;
 		struct nvkm_vma *bar1;
-
-		struct mutex mutex;
-		struct list_head list;
 	} userd;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
index 22443fe4a39f..3c2ca711dc5c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/base.c
@@ -349,8 +349,6 @@ nvkm_fifo_dtor(struct nvkm_engine *engine)
 	nvkm_chid_unref(&fifo->cgid);
 	nvkm_chid_unref(&fifo->chid);
 
-	mutex_destroy(&fifo->userd.mutex);
-
 	nvkm_event_fini(&fifo->nonstall.event);
 	mutex_destroy(&fifo->mutex);
 
@@ -391,8 +389,5 @@ nvkm_fifo_new_(const struct nvkm_fifo_func *func, struct nvkm_device *device,
 	spin_lock_init(&fifo->lock);
 	mutex_init(&fifo->mutex);
 
-	INIT_LIST_HEAD(&fifo->userd.list);
-	mutex_init(&fifo->userd.mutex);
-
 	return nvkm_engine_ctor(&nvkm_fifo, device, type, inst, true, &fifo->engine);
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
index 7d4716dcd512..78be7abc90d1 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.c
@@ -275,11 +275,7 @@ nvkm_chan_del(struct nvkm_chan **pchan)
 	nvkm_gpuobj_del(&chan->ramfc);
 
 	if (chan->cgrp) {
-		if (!chan->func->id_put)
-			nvkm_chid_put(chan->cgrp->runl->chid, chan->id, &chan->cgrp->lock);
-		else
-			chan->func->id_put(chan);
-
+		nvkm_chid_put(chan->cgrp->runl->chid, chan->id, &chan->cgrp->lock);
 		nvkm_cgrp_unref(&chan->cgrp);
 	}
 
@@ -441,30 +437,26 @@ nvkm_chan_new_(const struct nvkm_chan_func *func, struct nvkm_runl *runl, int ru
 	}
 
 	/* Allocate channel ID. */
-	if (!chan->func->id_get) {
-		chan->id = nvkm_chid_get(runl->chid, chan);
-		if (chan->id >= 0) {
-			if (func->userd->bar < 0) {
-				if (ouserd + chan->func->userd->size >=
-					nvkm_memory_size(userd)) {
-					RUNL_DEBUG(runl, "ouserd %llx", ouserd);
-					return -EINVAL;
-				}
-
-				ret = nvkm_memory_kmap(userd, &chan->userd.mem);
-				if (ret) {
-					RUNL_DEBUG(runl, "userd %d", ret);
-					return ret;
-				}
-
-				chan->userd.base = ouserd;
-			} else {
-				chan->userd.mem = nvkm_memory_ref(fifo->userd.mem);
-				chan->userd.base = chan->id * chan->func->userd->size;
+	chan->id = nvkm_chid_get(runl->chid, chan);
+	if (chan->id >= 0) {
+		if (func->userd->bar < 0) {
+			if (ouserd + chan->func->userd->size >=
+				nvkm_memory_size(userd)) {
+				RUNL_DEBUG(runl, "ouserd %llx", ouserd);
+				return -EINVAL;
+			}
+
+			ret = nvkm_memory_kmap(userd, &chan->userd.mem);
+			if (ret) {
+				RUNL_DEBUG(runl, "userd %d", ret);
+				return ret;
 			}
+
+			chan->userd.base = ouserd;
+		} else {
+			chan->userd.mem = nvkm_memory_ref(fifo->userd.mem);
+			chan->userd.base = chan->id * chan->func->userd->size;
 		}
-	} else {
-		chan->id = chan->func->id_get(chan, userd, ouserd);
 	}
 
 	if (chan->id < 0) {
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
index 013682a709d5..85b94f699128 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/chan.h
@@ -17,9 +17,6 @@ struct nvkm_cctx {
 };
 
 struct nvkm_chan_func {
-	int (*id_get)(struct nvkm_chan *, struct nvkm_memory *userd, u64 ouserd);
-	void (*id_put)(struct nvkm_chan *);
-
 	const struct nvkm_chan_func_inst {
 		u32 size;
 		bool zero;
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
index 3454c7d29502..129f274c9bfd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/r535.c
@@ -215,123 +215,8 @@ r535_chan_ramfc = {
 	.priv = true,
 };
 
-struct r535_chan_userd {
-	struct nvkm_memory *mem;
-	struct nvkm_memory *map;
-	int chid;
-	u32 used;
-
-	struct list_head head;
-} *userd;
-
-static void
-r535_chan_id_put(struct nvkm_chan *chan)
-{
-	struct nvkm_runl *runl = chan->cgrp->runl;
-	struct nvkm_fifo *fifo = runl->fifo;
-	struct r535_chan_userd *userd;
-
-	mutex_lock(&fifo->userd.mutex);
-	list_for_each_entry(userd, &fifo->userd.list, head) {
-		if (userd->map == chan->userd.mem) {
-			u32 chid = chan->userd.base / chan->func->userd->size;
-
-			userd->used &= ~BIT(chid);
-			if (!userd->used) {
-				nvkm_memory_unref(&userd->map);
-				nvkm_memory_unref(&userd->mem);
-				nvkm_chid_put(runl->chid, userd->chid, &chan->cgrp->lock);
-				list_del(&userd->head);
-				kfree(userd);
-			}
-
-			break;
-		}
-	}
-	mutex_unlock(&fifo->userd.mutex);
-
-}
-
-static int
-r535_chan_id_get_locked(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64 ouserd)
-{
-	const u32 userd_size = CHID_PER_USERD * chan->func->userd->size;
-	struct nvkm_runl *runl = chan->cgrp->runl;
-	struct nvkm_fifo *fifo = runl->fifo;
-	struct r535_chan_userd *userd;
-	u32 chid;
-	int ret;
-
-	if (ouserd + chan->func->userd->size >= userd_size ||
-	    (ouserd & (chan->func->userd->size - 1))) {
-		RUNL_DEBUG(runl, "ouserd %llx", ouserd);
-		return -EINVAL;
-	}
-
-	chid = div_u64(ouserd, chan->func->userd->size);
-
-	list_for_each_entry(userd, &fifo->userd.list, head) {
-		if (userd->mem == muserd) {
-			if (userd->used & BIT(chid))
-				return -EBUSY;
-			break;
-		}
-	}
-
-	if (&userd->head == &fifo->userd.list) {
-		if (nvkm_memory_size(muserd) < userd_size) {
-			RUNL_DEBUG(runl, "userd too small");
-			return -EINVAL;
-		}
-
-		userd = kzalloc(sizeof(*userd), GFP_KERNEL);
-		if (!userd)
-			return -ENOMEM;
-
-		userd->chid = nvkm_chid_get(runl->chid, chan);
-		if (userd->chid < 0) {
-			ret = userd->chid;
-			kfree(userd);
-			return ret;
-		}
-
-		userd->mem = nvkm_memory_ref(muserd);
-
-		ret = nvkm_memory_kmap(userd->mem, &userd->map);
-		if (ret) {
-			nvkm_chid_put(runl->chid, userd->chid, &chan->cgrp->lock);
-			kfree(userd);
-			return ret;
-		}
-
-
-		list_add(&userd->head, &fifo->userd.list);
-	}
-
-	userd->used |= BIT(chid);
-
-	chan->userd.mem = nvkm_memory_ref(userd->map);
-	chan->userd.base = ouserd;
-
-	return (userd->chid * CHID_PER_USERD) + chid;
-}
-
-static int
-r535_chan_id_get(struct nvkm_chan *chan, struct nvkm_memory *muserd, u64 ouserd)
-{
-	struct nvkm_fifo *fifo = chan->cgrp->runl->fifo;
-	int ret;
-
-	mutex_lock(&fifo->userd.mutex);
-	ret = r535_chan_id_get_locked(chan, muserd, ouserd);
-	mutex_unlock(&fifo->userd.mutex);
-	return ret;
-}
-
 static const struct nvkm_chan_func
 r535_chan = {
-	.id_get = r535_chan_id_get,
-	.id_put = r535_chan_id_put,
 	.inst = &gf100_chan_inst,
 	.userd = &gv100_chan_userd,
 	.ramfc = &r535_chan_ramfc,
diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 64b58efd3132..2bb726c0c49f 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -1932,7 +1932,7 @@ r535_gsp_msg_rc_triggered(void *priv, u32 fn, void *repv, u32 repc)
 		   msg->nv2080EngineType, msg->chid, msg->exceptType, msg->scope,
 		   msg->partitionAttributionId);
 
-	chan = nvkm_chan_get_chid(&subdev->device->fifo->engine, msg->chid / 8, &flags);
+	chan = nvkm_chan_get_chid(&subdev->device->fifo->engine, msg->chid, &flags);
 	if (!chan) {
 		nvkm_error(subdev, "rc chid:%d not found!\n", msg->chid);
 		return 0;
-- 
2.49.0

