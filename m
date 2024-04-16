Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 670BA8A78E5
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B5F61112F5A;
	Tue, 16 Apr 2024 23:41:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="XDymc2Wq";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-BN7-obe.outbound.protection.outlook.com
 (mail-bn7nam10on2073.outbound.protection.outlook.com [40.107.92.73])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F02E112F5A
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:57 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MV98SgeuN6h5WbwpoODyEkIMJGZGBT0koIMgeNdbxs2iRh0QreKG/LYg9xuIHk65ZSlo7b35XktB7tNLM0ceBUrlRvs/90iWLzHXyXaAWAxbxpf8tF4s8JTAT07w59OHHZtOLkwDr8W0hjveMbPFU5VOHOW3W5c10O9boyFSQbXQJZ2/nbR5FycIW/V7LP4o12K9y3TvKTKiJyQT6Zhb6wdutA1Nxc4y1eTn/sz9H/LZxxXI+8+2B7TQCAyDLsoIw5MXRPSZK5L75BiN/kg1iz2lCbwURre0slvWjfjR31/obIkWBY9iv/9XGu9oX7UNQeRvnYi7ry8uIBBa6n1HdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GCuV/dJjn0Wtf9Xbn6jyiPhtdBslAVETr/sOP4OL/tE=;
 b=hEdG6xTGAXfJLmKae30m5JvWo0zFttNsULXAqmJFn2uVzMggV6geHjX4Qi1D5wo5qoVPXyOMaLdjtL6MpNJ86OgP7aBtmfLwVhAyusym35npG+9KzoLD+pP6T/1ldlI7E2esXXOHNXwVslXMNlaOyDbYwAoFv7aIAFLGxAd7I+OLFe7wxfyQyvwyB52iPZZpLpR1FPPfzzXNPUhenmrkbLtzXZ3cWtaWb6nLFHuzMrc1pq49Vr8kIxBTNCvUQDWJaD1SUON6/arnJroliE2Fx6g5j68oY3hH70PWJeqdFSldrW4dVSlq/63STjx7oQHKtgq6Z4vKxpDg5lz8IrPeLQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GCuV/dJjn0Wtf9Xbn6jyiPhtdBslAVETr/sOP4OL/tE=;
 b=XDymc2WqayI1efnleh4Vz1CKOJUU5z0dHJl7anRGrcT7k33VO1UHGWlWrjcmNxDW0SEJuoZn4kpiW0fwGijGi6o7IjOJ50EwuA9AJLHGAK2EOhEQ0YnQ+Kha33kl5ZDno/rbAhl/BDlapz7z+pBIsIMlAZdasABX6NhR+vEGTtDj9C28BPiwHVvwnjnHOi4X0iASo4pRyfsMOkn++bZdBKNm6njVOp5g7IugyZ4ZVcX2YGffG6eFIWl01sMx4SbUNxzkWCTftiN15N6thBQrrKReJs90++Wov9PVP9ZVKi9Zi9OFeHVku7yR/x4nRqtagpUa/s4p7sEAMMV+3QIG4w==
Received: from MN2PR19CA0025.namprd19.prod.outlook.com (2603:10b6:208:178::38)
 by SJ0PR12MB6831.namprd12.prod.outlook.com (2603:10b6:a03:47d::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:54 +0000
Received: from BN3PEPF0000B076.namprd04.prod.outlook.com
 (2603:10b6:208:178:cafe::fc) by MN2PR19CA0025.outlook.office365.com
 (2603:10b6:208:178::38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B076.mail.protection.outlook.com (10.167.243.121) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:52 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:31 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 053/156] drm/nouveau/nvkm: rename struct nvkm_uchan
Date: Wed, 17 Apr 2024 09:38:19 +1000
Message-ID: <20240416234002.19509-54-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B076:EE_|SJ0PR12MB6831:EE_
X-MS-Office365-Filtering-Correlation-Id: 275588b2-7975-473c-3520-08dc5e6ecb4d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0pDiMxykTXe8t6qHQcr9WpuA1B2y4lw2/phsPZCYwjkHO/wweS66E5pGGD4J6/jmMP+7tR3vp9bFq0qea/E+wOnF67wzaHHsRRerHL95amBZAImfRZz89nsuBl0aX5Rn3OX7W+Lb+w5IbyTFm+vLu4KSKyv3ru46CXDKUfdQ816V8UXQTjusNKb51gx8uhcTgTZgUaIMrSo1zFVYtQVcFs5NXtVvDA7ErSn7RXLEG5WyAoJhXwNROEUupXQ0Ytr7ZXep//UqpWfFkis4tkSEpg02qFdJF2nbigjC7XrOtkcQfv4sv5UAqmH5NMAIqRmifkanbTg1PSRtgHGg+6OaGV3JgRZFatiNuQ6JsFK6Be975wFLGEO/RoyfP6KUU/fHbdaxA2P2nxMq1QbXPbaCADe7YE8aV6TVlRlUiuFHzDEimQeJ9z9sKN308lW/TOCucTQnjxbNQIDCerQrJgA1NcqeBduGB6YUDJo6JCKR+47gki0iaOOqW5XXTLjzy3aQpD+060JKf3PUozE/J2AXZkUJme2V7FHRE1dl0z3ORvt4sLajajID5uDGIQ7wHH68s7RJIOtDRM8b2iNeLvUCmJxUIqmGJ+sEpHYWRIA0A3JWsi0HUBZg3mq4DTz5WA4NsPa6+jUDtGEmhco44hvwThu8qmi7pgnWu1DSyWlUEsE7T8BgfO+776LLMogFppi22Q3zBTU7vz/CXzWOaROHt4NzA33QkpoRmQU4Qos9xhgZkDKmYFA0LeNytfZ83yq/
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:52.7672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 275588b2-7975-473c-3520-08dc5e6ecb4d
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B076.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR12MB6831
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

- preparation for upcoming patches
- open-code current nvkm_uchan() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/fifo/uchan.c  | 21 +++++++++----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
index 9e56bcc166ed..3dbc424869b3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/uchan.c
@@ -19,7 +19,6 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_uchan(p) container_of((p), struct nvkm_uchan, object)
 #include "priv.h"
 #include "cgrp.h"
 #include "chan.h"
@@ -33,7 +32,7 @@
 
 #include <nvif/if0020.h>
 
-struct nvkm_uchan {
+struct nvif_chan_priv {
 	struct nvkm_object object;
 	struct nvkm_chan *chan;
 };
@@ -41,7 +40,7 @@ struct nvkm_uchan {
 static int
 nvkm_uchan_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
-	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
+	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
 	struct nvkm_runl *runl = chan->cgrp->runl;
 	union nvif_chan_event_args *args = argv;
 
@@ -154,7 +153,7 @@ static int
 nvkm_uchan_object_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		      struct nvkm_object **pobject)
 {
-	struct nvkm_chan *chan = nvkm_uchan(oclass->parent)->chan;
+	struct nvkm_chan *chan = container_of(oclass->parent, struct nvif_chan_priv, object)->chan;
 	struct nvkm_cgrp *cgrp = chan->cgrp;
 	struct nvkm_engn *engn;
 	struct nvkm_uobj *uobj;
@@ -203,7 +202,7 @@ nvkm_uchan_object_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 static int
 nvkm_uchan_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *oclass)
 {
-	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
+	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
 	struct nvkm_engn *engn;
 	int ret, runq = 0;
 
@@ -255,7 +254,7 @@ static int
 nvkm_uchan_map(struct nvkm_object *object, void *argv, u32 argc,
 	       enum nvkm_object_map *type, u64 *addr, u64 *size)
 {
-	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
+	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
 	struct nvkm_device *device = chan->cgrp->runl->fifo->engine.subdev.device;
 
 	if (chan->func->userd->bar < 0)
@@ -271,7 +270,7 @@ nvkm_uchan_map(struct nvkm_object *object, void *argv, u32 argc,
 static int
 nvkm_uchan_fini(struct nvkm_object *object, bool suspend)
 {
-	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
+	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
 
 	nvkm_chan_block(chan);
 	nvkm_chan_remove(chan, true);
@@ -285,7 +284,7 @@ nvkm_uchan_fini(struct nvkm_object *object, bool suspend)
 static int
 nvkm_uchan_init(struct nvkm_object *object)
 {
-	struct nvkm_chan *chan = nvkm_uchan(object)->chan;
+	struct nvkm_chan *chan = container_of(object, struct nvif_chan_priv, object)->chan;
 
 	if (atomic_read(&chan->errored))
 		return 0;
@@ -301,7 +300,7 @@ nvkm_uchan_init(struct nvkm_object *object)
 static void *
 nvkm_uchan_dtor(struct nvkm_object *object)
 {
-	struct nvkm_uchan *uchan = nvkm_uchan(object);
+	struct nvif_chan_priv *uchan = container_of(object, typeof(*uchan), object);
 
 	nvkm_chan_del(&uchan->chan);
 	return uchan;
@@ -323,7 +322,7 @@ nvkm_uchan_chan(struct nvkm_object *object)
 	if (WARN_ON(object->func != &nvkm_uchan))
 		return NULL;
 
-	return nvkm_uchan(object)->chan;
+	return container_of(object, struct nvif_chan_priv, object)->chan;
 }
 
 int
@@ -335,7 +334,7 @@ nvkm_uchan_new(struct nvkm_fifo *fifo, struct nvkm_cgrp *cgrp, const struct nvkm
 	struct nvkm_vmm *vmm = NULL;
 	struct nvkm_dmaobj *ctxdma = NULL;
 	struct nvkm_memory *userd = NULL;
-	struct nvkm_uchan *uchan;
+	struct nvif_chan_priv *uchan;
 	struct nvkm_chan *chan;
 	int ret;
 
-- 
2.41.0

