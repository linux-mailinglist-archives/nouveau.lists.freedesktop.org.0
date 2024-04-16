Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24DEE8A78DF
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 60ABB112F52;
	Tue, 16 Apr 2024 23:41:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="Msb95OQs";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2054.outbound.protection.outlook.com [40.107.223.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 18958112F51
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:51 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VuC1rQ/ykEp4pkgjBL21lQumXyEh4Cc8O57hGGfwIq0JgtJjaZXjBODUj344sDC/dsFcFlVx7+qxORxlSWfkfNT1FFhoXJTWiSEOWFUeWxa7dj3HrTwlh5YHC9RDrLQQKqJbjCVFp1FbazwL/2UV5daDcdAyA4MGH6JCZV5MKIcY7t8KNQP/n9Ov9FoA8dGaZ8M2HArVwsk3gEmms+aul973JG+OisAUpzJnhJTJUBxtUa9fPoQoZfTCbw1L50BBh6r0/+3z/Mj8+cv0BEA6UZukVcDmcedjP6XXZR+JRz7ww3iWCoSnldP0+cv2DfBtXlmin2mbUmp1zbYDLcStPg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vSmizCuAC1H/kasfAUMdGIkwO24282n3BoarN81fLIQ=;
 b=gOKNRp/xkxD930sH2BuflsS8xszw2K534l/p29fyKHGhIFPFLm6CttIY+bPhgDyup+VQIvDHcijsyvEaycXW/2BzwrGVKxIcmpO/ci71Vqj9tg4a2hwr8zn+2d6K3tRgKivUHEKDsAWWvLlzUB4SpLoqAynU/VURwqWSBMDn6FR7hNoBtLJYdto3S46Nf2q371kBEkRDAo3FPfYwGpp1CxRyfC9Va9c6uXpyQ+RyVs9IlQ12I9aJ/EaY5s51rn5f/L4PwRZnqV7Y6k7QpthqEwUJHrtpLpYKVqRj35/py+8iLfSl9pK6GMxSaelNh9t1YhuRz5xpdgR6U8LWfNwG2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vSmizCuAC1H/kasfAUMdGIkwO24282n3BoarN81fLIQ=;
 b=Msb95OQsMzZNGTkzvHFEaAHnCFcJlpkU+JHswNcz1mVNHb9Lg9qDUo2wqcHCHBLyJUKsG5KPadi+x4QDoi6KrDrEyLtSP7/PFswzwIhOLZSqDzZJrVqaYILYg6BItB+/GzKz8MKG7vErhQCUXOMjf1zXKdKtldwaT7nz3JLu/kcZwcS9wZoLEUeAf33hoYwLSKQz7wf6Zuw6/3HLoCC8aRPyuuVd6AdoXvxkiz+RthFnSEd91gHRDQx+iEuEgoF5+y2BFVbcRutX/EWTk+Km+GzOgAxaHFIvfNFFmiVNGav5L60e3WHBH0Fuj74CcjLiR7FjW9cDBDql9GP8f6y2sQ==
Received: from BN9PR03CA0076.namprd03.prod.outlook.com (2603:10b6:408:fc::21)
 by IA1PR12MB6626.namprd12.prod.outlook.com (2603:10b6:208:3a2::20)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:49 +0000
Received: from BN3PEPF0000B078.namprd04.prod.outlook.com
 (2603:10b6:408:fc:cafe::dd) by BN9PR03CA0076.outlook.office365.com
 (2603:10b6:408:fc::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B078.mail.protection.outlook.com (10.167.243.123) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:26 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:24 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 048/156] drm/nouveau/nvkm: detach user handling from nvkm_conn
Date: Wed, 17 Apr 2024 09:38:14 +1000
Message-ID: <20240416234002.19509-49-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B078:EE_|IA1PR12MB6626:EE_
X-MS-Office365-Filtering-Correlation-Id: ff72425b-1899-41d5-1550-08dc5e6ec915
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: pFcrneO0TNSd9IgYSZ2iIREi/RZnOudTgbw2+ckgCJrfkBeL5GBNSwskNmZCZhPXcnV5T2+p2UwWOQd/lJxW99rrp6NnwdGqJbKAPmB92mysUdbp+XfJ67ljLOkzQ2TqxJP3b6r6K6JhVa85gPUzzMtMJUZHQdO76TogJ+wy9uL1suHaedDN8XigUWOcpDTMdqReh9IAxYiRygN98oSEDn3Vqw77XYUJ8IH9HgekE/NAGIyt2GlNpewjx6BryJThe+ozZ3P/WeLznNyUoLQvp4kqGGAzeK7MjxrJhiYzbwhqFCtPJNu3QF9Iv2W5iVd+Cvmmc389I5FWMKV5GFErxkCE7bkgT79oZsA0eu4hU1xdq3JGsxowqBN2SUbnSZQuIF/7fXuiLvKyj/EBCVpjNYHTfEKPeU7s/R+jAQ9MzXG/9taFhswAPH0CwBYGucaDP2QUFHhgGj0bXHN0KJKlf9Q1tFCtABQG3szSMuGlQrhtuIQ4cc5ECwXqOBgQF8ThnI7Cdy88cajeZETtfVrxanZCAhehMS2aVddrTkJUuG1JNJdNQGqA3hxnSni5ZH+s7S7FB1xsQNzfoGiTf+7pLIlFx8S0hfApiwNHst/kzGW0HkqwetJJUE/WfZMTTfJfwhhehhmiDAJA/d3FclKuQiq8ZqpyOXQpB3FHLdPe6dDzTRlKcSIJCrjp6BZ4+p70IHv4E85ONl6weX3cbq+K/PzZYSuzdNU016ZdH33lfXdmGhYQXvALxJnHEaAROtLX
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(376005)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:49.0752 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: ff72425b-1899-41d5-1550-08dc5e6ec915
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B078.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6626
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
- open-code current nvkm_uconn() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/conn.h   |  2 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 91 +++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.h  |  6 ++
 3 files changed, 58 insertions(+), 41 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
index 01c3146c7066..0eb15e28d0c8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/conn.h
@@ -13,7 +13,7 @@ struct nvkm_conn {
 
 	struct list_head head;
 
-	struct nvkm_object object;
+	bool user; /* protected by disp->user.lock */
 };
 
 int nvkm_conn_new(struct nvkm_disp *, int index, struct nvbios_connE *,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 5e44ec977d42..773e49e557f8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -19,8 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_uconn(p) container_of((p), struct nvkm_conn, object)
-#include "conn.h"
+#include "uconn.h"
 #include "outp.h"
 
 #include <core/client.h>
@@ -30,6 +29,11 @@
 
 #include <nvif/if0011.h>
 
+struct nvif_conn_priv {
+	struct nvkm_object object;
+	struct nvkm_conn *conn;
+};
+
 static int
 nvkm_uconn_uevent_gsp(struct nvkm_object *object, u64 token, u32 bits)
 {
@@ -94,7 +98,7 @@ nvkm_connector_is_dp_dms(u8 type)
 static int
 nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_uevent *uevent)
 {
-	struct nvkm_conn *conn = nvkm_uconn(object);
+	struct nvkm_conn *conn = container_of(object, struct nvif_conn_priv, object)->conn;
 	struct nvkm_disp *disp = conn->disp;
 	struct nvkm_device *device = disp->engine.subdev.device;
 	struct nvkm_outp *outp;
@@ -151,13 +155,13 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 static void *
 nvkm_uconn_dtor(struct nvkm_object *object)
 {
-	struct nvkm_conn *conn = nvkm_uconn(object);
-	struct nvkm_disp *disp = conn->disp;
+	struct nvif_conn_priv *uconn = container_of(object, typeof(*uconn), object);
+	struct nvkm_disp *disp = uconn->conn->disp;
 
 	spin_lock(&disp->user.lock);
-	conn->object.func = NULL;
+	uconn->conn->user = false;
 	spin_unlock(&disp->user.lock);
-	return NULL;
+	return uconn;
 }
 
 static const struct nvkm_object_func
@@ -173,7 +177,7 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_conn *cont, *conn = NULL;
 	union nvif_conn_args *args = argv;
-	int ret;
+	struct nvif_conn_priv *uconn;
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
@@ -188,39 +192,46 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	if (!conn)
 		return -EINVAL;
 
-	ret = -EBUSY;
-	spin_lock(&disp->user.lock);
-	if (!conn->object.func) {
-		switch (conn->info.type) {
-		case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
-		case DCB_CONNECTOR_TV_0     :
-		case DCB_CONNECTOR_TV_1     :
-		case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
-		case DCB_CONNECTOR_DMS59_0  :
-		case DCB_CONNECTOR_DMS59_1  :
-		case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
-		case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
-		case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
-		case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
-		case DCB_CONNECTOR_DMS59_DP0:
-		case DCB_CONNECTOR_DMS59_DP1:
-		case DCB_CONNECTOR_DP       :
-		case DCB_CONNECTOR_mDP      :
-		case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
-		case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
-		case DCB_CONNECTOR_HDMI_0   :
-		case DCB_CONNECTOR_HDMI_1   :
-		case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
-		default:
-			WARN_ON(1);
-			ret = -EINVAL;
-			break;
-		}
+	switch (conn->info.type) {
+	case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
+	case DCB_CONNECTOR_TV_0     :
+	case DCB_CONNECTOR_TV_1     :
+	case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
+	case DCB_CONNECTOR_DMS59_0  :
+	case DCB_CONNECTOR_DMS59_1  :
+	case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
+	case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
+	case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
+	case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+	case DCB_CONNECTOR_DMS59_DP0:
+	case DCB_CONNECTOR_DMS59_DP1:
+	case DCB_CONNECTOR_DP       :
+	case DCB_CONNECTOR_mDP      :
+	case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
+	case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
+	case DCB_CONNECTOR_HDMI_0   :
+	case DCB_CONNECTOR_HDMI_1   :
+	case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
 
-		nvkm_object_ctor(&nvkm_uconn, oclass, &conn->object);
-		*pobject = &conn->object;
-		ret = 0;
+	uconn = kzalloc(sizeof(*uconn), GFP_KERNEL);
+	if (!uconn)
+		return -ENOMEM;
+
+	spin_lock(&disp->user.lock);
+	if (conn->user) {
+		spin_unlock(&disp->user.lock);
+		kfree(uconn);
+		return -EBUSY;
 	}
+	conn->user = true;
 	spin_unlock(&disp->user.lock);
-	return ret;
+
+	nvkm_object_ctor(&nvkm_uconn, oclass, &uconn->object);
+	uconn->conn = conn;
+	*pobject = &uconn->object;
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
new file mode 100644
index 000000000000..f53d151e5b09
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UCONN_H__
+#define __NVKM_UCONN_H__
+#include "conn.h"
+
+#endif
-- 
2.41.0

