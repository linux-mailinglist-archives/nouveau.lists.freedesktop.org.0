Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ADDC98A7914
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:42:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203B3112F9E;
	Tue, 16 Apr 2024 23:42:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="W/1MOroO";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-CO1-obe.outbound.protection.outlook.com
 (mail-co1nam11on2058.outbound.protection.outlook.com [40.107.220.58])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B45A112F9F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:42:52 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ap1sCprtvL4/OrsFTOPEKCysXAeg7eka0kp7KKE3Bd6DKPjcGrKUwkIcdiSSDcJANhDDnV92sQGCAlMCBxU5L+KbIB8S1VY6Yr6zptRhIbNw6bXcpKtWb8OpyylkqGwBJILoSJBnxY4sbojWajYb5QiahYvkJxwq4S2n6P7WEPt8ZbUgsTrAAWnycgS1Z8LVJ4vUKLh1xEXpUK6G5C4wYi66DFRu2/jMoCzBk9YcCv7h+Mf+uUlkjWQVkik0oFfd7+ZHkM9KxWi8vQ5BEXbwHsRbltR+6z/WQeBcMGSYEVAFlpGFqYxNS89dxkdpiwh7zEZx2RR/IJsDzPjSHvPqJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MKmp6O4igli3wlDaBYtilANKWC5iWFt21nc4mywClHo=;
 b=Sg3v7VcBGHKu4dukY0vr2oszLOpJteWeWP/dvVvJWCtm/r0A05MDki7JuQKriRAM41R7jX4bWzuQAG1hdf9laVfvvsvF1b8yNB2t9ig1u4AJ4VmMqq4sHfkoBIMm7Sv27c9AS+lN8yod8A+R0Es0EQtFdA36onPGM85DT6ZSeyTD4rdQCY+yg3LPfvKaS8vRTHSupI57wudZlWD97TDQexdQ5zHDCyYs1IDMVHggKUcm2bEWuHCZF2d63AI6Y2qk1tXIp6681+0kKW1GHLLxpUGY3ojfCHfhtuGh1bL5sJVdv/KJN0MADTzsh1cAYcaN2sLqEGJhhZgXCUVQDAI0AA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MKmp6O4igli3wlDaBYtilANKWC5iWFt21nc4mywClHo=;
 b=W/1MOroO+VAoIzJDAyxTlsJcWjvdu/ISLDVrMyU4mIgPuTX1M8L6TWPPTGmaNpNVaobCYaYsPyxlUeW8dlrZOcLu67Rp7Bp+5c1vs7CMxn3Ay99LnOiaHhBhp+PjVV+YcowFl66RQzXdbS8hH92hjl4YK3lU422ZPHoit3czeaIGtR35T2nH6FnOIP0owTXWmK3LoWxC4OwOlk/DP3sNV3hJOZ/Xwfyy+zkDuiyNihW40h/21g0yvO3ku0XuwD342UrR0xRi8UHTsxdcSFSzfL7Cca17wAW1x3XZ71pggoc8pdd5wbl3KIHJv8TN2ECc4Bdq9PwQX5IHXfIeJPHOsw==
Received: from DS7PR03CA0094.namprd03.prod.outlook.com (2603:10b6:5:3b7::9) by
 MW4PR12MB6706.namprd12.prod.outlook.com (2603:10b6:303:1e2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:49 +0000
Received: from DS2PEPF00003440.namprd02.prod.outlook.com
 (2603:10b6:5:3b7:cafe::13) by DS7PR03CA0094.outlook.office365.com
 (2603:10b6:5:3b7::9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.33 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:49 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003440.mail.protection.outlook.com (10.167.18.43) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:49 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:27 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:26 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 102/156] drm/nouveau/nvif: rework disp "new conn" api
Date: Wed, 17 Apr 2024 09:39:08 +1000
Message-ID: <20240416234002.19509-103-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003440:EE_|MW4PR12MB6706:EE_
X-MS-Office365-Filtering-Correlation-Id: 066be648-742a-4bd4-ae18-08dc5e6eed20
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0pT4EDw+vzFtnxGtKVEIrI3uTjUjAJ/eOwnwt9sx06kLo6P6+Gr7E1N33P56ezXJfP2u2UV9INyx9MjVAtF2YhmVSXe29yNA4gj0Q376ZSSCsytDYjgRxniGxM3pXiwgDuXpsuw8rh4NC/MpQR3pNd2bK70UHJw9bDjadE6VLwu6v2yifzZMb08IPv3BW8DwjSLlgAG2Y8Dz9OkdMC3Y+30iL8CiKN26IOKVUKEvEJwaYiIS+13c6QMJeEHZQl8gftahHC9kgvBeSFDQAGVkpCMoAy1hYIUYEdBch0KVwcF/TRETBflhCuEJDvLdZfMIMroc2xe9hTM9G3wRhMY2oc3pZuRQ50E0la5HM4D0SI3ti2tMDbXgZQpZL9sKTlC6yCUoAY5u8CeadfzWmmVLpYooXZcc18mzPTA6mGv8nFjcD00rvbRnOzmi7KjSz/Gnk2hmiyN80JDLFHqmyTXpAybuoT2HxKeHEqm5uPAK/eCY5eyauFuw4Rwsqz4nEFgaZwe3XwUOlqVuBCozW4d1OqnZVNS1z5Dx5LxCr6KPMIX5qXeod4k5W05XoF9NzcOglxfunRbdmdr0fo26qpC1iO4UvJzuYpPSSJK3m2Wt0oAR+tnkKl7g3HNG/yvENoDN6mONdiWAneIFbg2P5LOM1NbuihzWrP38jIjmfQ0pyBI3cVpSKsjwH0XxeuZVAZcOyNz8NymeweDFeOPlhb/R/TQ6Q4ZQ1g2VKJCfOlJV+4MG551NS1VgjwP17/NR0nNE
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(1800799015)(376005)(82310400014)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:49.6116 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 066be648-742a-4bd4-ae18-08dc5e6eed20
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003440.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR12MB6706
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

- transition from "ioctl" interface

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvif/conn.h   | 18 ++-----
 .../gpu/drm/nouveau/include/nvif/driverif.h   | 20 +++++++
 drivers/gpu/drm/nouveau/include/nvif/if0011.h | 18 -------
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  2 +-
 drivers/gpu/drm/nouveau/nvif/conn.c           | 32 +++---------
 .../gpu/drm/nouveau/nvkm/engine/disp/priv.h   |  1 -
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.c  | 52 ++++++++++++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/uconn.h  |  3 ++
 .../gpu/drm/nouveau/nvkm/engine/disp/udisp.c  | 24 ++++++---
 9 files changed, 87 insertions(+), 83 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/conn.h b/drivers/gpu/drm/nouveau/include/nvif/conn.h
index 406c12a111f9..0f0ca002fe47 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/conn.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/conn.h
@@ -2,26 +2,16 @@
 #ifndef __NVIF_CONN_H__
 #define __NVIF_CONN_H__
 #include <nvif/object.h>
+#include <nvif/driverif.h>
 #include <nvif/event.h>
 struct nvif_disp;
 
 struct nvif_conn {
+	const struct nvif_conn_impl *impl;
+	struct nvif_conn_priv *priv;
 	struct nvif_object object;
-	u32 id;
 
-	struct {
-		enum {
-			NVIF_CONN_VGA,
-			NVIF_CONN_TV,
-			NVIF_CONN_DVI_I,
-			NVIF_CONN_DVI_D,
-			NVIF_CONN_LVDS,
-			NVIF_CONN_LVDS_SPWG,
-			NVIF_CONN_HDMI,
-			NVIF_CONN_DP,
-			NVIF_CONN_EDP,
-		} type;
-	} info;
+	u32 id;
 };
 
 int nvif_conn_ctor(struct nvif_disp *, const char *name, int id, struct nvif_conn *);
diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 412b2dff3a74..fb741c7293f6 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -12,6 +12,7 @@ struct nvif_vmm_priv;
 struct nvif_faultbuf_priv;
 struct nvif_disp_priv;
 struct nvif_disp_caps_priv;
+struct nvif_conn_priv;
 
 struct nvif_driver {
 	const char *name;
@@ -223,6 +224,22 @@ struct nvif_disp_caps_impl {
 	struct nvif_mapinfo map;
 };
 
+struct nvif_conn_impl {
+	void (*del)(struct nvif_conn_priv *);
+
+	enum nvif_conn_type {
+		NVIF_CONN_VGA,
+		NVIF_CONN_TV,
+		NVIF_CONN_DVI_I,
+		NVIF_CONN_DVI_D,
+		NVIF_CONN_HDMI,
+		NVIF_CONN_LVDS,
+		NVIF_CONN_LVDS_SPWG,
+		NVIF_CONN_DP,
+		NVIF_CONN_EDP,
+	} type;
+};
+
 struct nvif_disp_impl {
 	void (*del)(struct nvif_disp_priv *);
 
@@ -234,6 +251,9 @@ struct nvif_disp_impl {
 
 	struct {
 		u32 mask;
+		int (*new)(struct nvif_disp_priv *, u8 id,
+			   const struct nvif_conn_impl **, struct nvif_conn_priv **,
+			   u64 handle);
 	} conn;
 
 	struct {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0011.h b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
index 3ed0ddd75bd8..6e717445d10a 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0011.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0011.h
@@ -2,24 +2,6 @@
 #ifndef __NVIF_IF0011_H__
 #define __NVIF_IF0011_H__
 
-union nvif_conn_args {
-	struct nvif_conn_v0 {
-		__u8 version;
-		__u8 id;	/* DCB connector table index. */
-		__u8 pad02[6];
-#define NVIF_CONN_V0_VGA       0x00
-#define NVIF_CONN_V0_TV        0x01
-#define NVIF_CONN_V0_DVI_I     0x02
-#define NVIF_CONN_V0_DVI_D     0x03
-#define NVIF_CONN_V0_LVDS      0x04
-#define NVIF_CONN_V0_LVDS_SPWG 0x05
-#define NVIF_CONN_V0_HDMI      0x06
-#define NVIF_CONN_V0_DP        0x07
-#define NVIF_CONN_V0_EDP       0x08
-		__u8 type;
-	} v0;
-};
-
 union nvif_conn_event_args {
 	struct nvif_conn_event_v0 {
 		__u8 version;
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index 856b3ef5edb8..b1bd8264b703 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -1311,7 +1311,7 @@ nouveau_connector_create(struct drm_device *dev, int index)
 			return ERR_PTR(ret);
 		}
 
-		switch (nv_connector->conn.info.type) {
+		switch (nv_connector->conn.impl->type) {
 		case NVIF_CONN_VGA      : type = DCB_CONNECTOR_VGA; break;
 		case NVIF_CONN_DVI_I    : type = DCB_CONNECTOR_DVI_I; break;
 		case NVIF_CONN_DVI_D    : type = DCB_CONNECTOR_DVI_D; break;
diff --git a/drivers/gpu/drm/nouveau/nvif/conn.c b/drivers/gpu/drm/nouveau/nvif/conn.c
index 9ee18cb99264..48927282a7ce 100644
--- a/drivers/gpu/drm/nouveau/nvif/conn.c
+++ b/drivers/gpu/drm/nouveau/nvif/conn.c
@@ -23,7 +23,6 @@
 #include <nvif/disp.h>
 #include <nvif/printf.h>
 
-#include <nvif/class.h>
 #include <nvif/if0011.h>
 
 int
@@ -48,40 +47,25 @@ nvif_conn_event_ctor(struct nvif_conn *conn, const char *name, nvif_event_func f
 void
 nvif_conn_dtor(struct nvif_conn *conn)
 {
-	nvif_object_dtor(&conn->object);
+	if (!conn->impl)
+		return;
+
+	conn->impl->del(conn->priv);
+	conn->impl = NULL;
 }
 
 int
 nvif_conn_ctor(struct nvif_disp *disp, const char *name, int id, struct nvif_conn *conn)
 {
-	struct nvif_conn_v0 args;
 	int ret;
 
-	args.version = 0;
-	args.id = id;
-
-	ret = nvif_object_ctor(&disp->object, name ?: "nvifConn", id, NVIF_CLASS_CONN,
-			       &args, sizeof(args), &conn->object);
+	ret = disp->impl->conn.new(disp->priv, id, &conn->impl, &conn->priv,
+				   nvif_handle(&conn->object));
 	NVIF_ERRON(ret, &disp->object, "[NEW conn id:%d]", id);
 	if (ret)
 		return ret;
 
+	nvif_object_ctor(&disp->object, name ?: "nvifConn", id, 0, &conn->object);
 	conn->id = id;
-
-	switch (args.type) {
-	case NVIF_CONN_V0_VGA      : conn->info.type = NVIF_CONN_VGA; break;
-	case NVIF_CONN_V0_TV       : conn->info.type = NVIF_CONN_TV; break;
-	case NVIF_CONN_V0_DVI_I    : conn->info.type = NVIF_CONN_DVI_I; break;
-	case NVIF_CONN_V0_DVI_D    : conn->info.type = NVIF_CONN_DVI_D; break;
-	case NVIF_CONN_V0_LVDS     : conn->info.type = NVIF_CONN_LVDS; break;
-	case NVIF_CONN_V0_LVDS_SPWG: conn->info.type = NVIF_CONN_LVDS_SPWG; break;
-	case NVIF_CONN_V0_HDMI     : conn->info.type = NVIF_CONN_HDMI; break;
-	case NVIF_CONN_V0_DP       : conn->info.type = NVIF_CONN_DP; break;
-	case NVIF_CONN_V0_EDP      : conn->info.type = NVIF_CONN_EDP; break;
-	default:
-		break;
-	}
-
 	return 0;
-
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
index 822c4ffe5a38..890cfb23da77 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/priv.h
@@ -89,7 +89,6 @@ void nv50_disp_chan_uevent_send(struct nvkm_disp *, int);
 extern const struct nvkm_event_func gf119_disp_chan_uevent;
 extern const struct nvkm_event_func gv100_disp_chan_uevent;
 
-int nvkm_uconn_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 int nvkm_uoutp_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 int nvkm_uhead_new(const struct nvkm_oclass *, void *, u32, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
index 773e49e557f8..5f72db9276b8 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.c
@@ -32,6 +32,8 @@
 struct nvif_conn_priv {
 	struct nvkm_object object;
 	struct nvkm_conn *conn;
+
+	struct nvif_conn_impl impl;
 };
 
 static int
@@ -152,6 +154,19 @@ nvkm_uconn_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 			       nvkm_uconn_uevent_gpio);
 }
 
+static void
+nvkm_uconn_del(struct nvif_conn_priv *uconn)
+{
+	struct nvkm_object *object = &uconn->object;
+
+	nvkm_object_del(&object);
+}
+
+static const struct nvif_conn_impl
+nvkm_uconn_impl = {
+	.del = nvkm_uconn_del,
+};
+
 static void *
 nvkm_uconn_dtor(struct nvkm_object *object)
 {
@@ -170,20 +185,16 @@ nvkm_uconn = {
 	.uevent = nvkm_uconn_uevent,
 };
 
-#include "udisp.h"
 int
-nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nvkm_object **pobject)
+nvkm_uconn_new(struct nvkm_disp *disp, u8 id, const struct nvif_conn_impl **pimpl,
+	       struct nvif_conn_priv **ppriv, struct nvkm_object **pobject)
 {
-	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_conn *cont, *conn = NULL;
-	union nvif_conn_args *args = argv;
 	struct nvif_conn_priv *uconn;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	enum nvif_conn_type type;
 
 	list_for_each_entry(cont, &disp->conns, head) {
-		if (cont->index == args->v0.id) {
+		if (cont->index == id) {
 			conn = cont;
 			break;
 		}
@@ -193,25 +204,25 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 		return -EINVAL;
 
 	switch (conn->info.type) {
-	case DCB_CONNECTOR_VGA      : args->v0.type = NVIF_CONN_V0_VGA; break;
+	case DCB_CONNECTOR_VGA      : type = NVIF_CONN_VGA; break;
 	case DCB_CONNECTOR_TV_0     :
 	case DCB_CONNECTOR_TV_1     :
-	case DCB_CONNECTOR_TV_3     : args->v0.type = NVIF_CONN_V0_TV; break;
+	case DCB_CONNECTOR_TV_3     : type = NVIF_CONN_TV; break;
 	case DCB_CONNECTOR_DMS59_0  :
 	case DCB_CONNECTOR_DMS59_1  :
-	case DCB_CONNECTOR_DVI_I    : args->v0.type = NVIF_CONN_V0_DVI_I; break;
-	case DCB_CONNECTOR_DVI_D    : args->v0.type = NVIF_CONN_V0_DVI_D; break;
-	case DCB_CONNECTOR_LVDS     : args->v0.type = NVIF_CONN_V0_LVDS; break;
-	case DCB_CONNECTOR_LVDS_SPWG: args->v0.type = NVIF_CONN_V0_LVDS_SPWG; break;
+	case DCB_CONNECTOR_DVI_I    : type = NVIF_CONN_DVI_I; break;
+	case DCB_CONNECTOR_DVI_D    : type = NVIF_CONN_DVI_D; break;
+	case DCB_CONNECTOR_LVDS     : type = NVIF_CONN_LVDS; break;
+	case DCB_CONNECTOR_LVDS_SPWG: type = NVIF_CONN_LVDS_SPWG; break;
 	case DCB_CONNECTOR_DMS59_DP0:
 	case DCB_CONNECTOR_DMS59_DP1:
 	case DCB_CONNECTOR_DP       :
 	case DCB_CONNECTOR_mDP      :
-	case DCB_CONNECTOR_USB_C    : args->v0.type = NVIF_CONN_V0_DP; break;
-	case DCB_CONNECTOR_eDP      : args->v0.type = NVIF_CONN_V0_EDP; break;
+	case DCB_CONNECTOR_USB_C    : type = NVIF_CONN_DP; break;
+	case DCB_CONNECTOR_eDP      : type = NVIF_CONN_EDP; break;
 	case DCB_CONNECTOR_HDMI_0   :
 	case DCB_CONNECTOR_HDMI_1   :
-	case DCB_CONNECTOR_HDMI_C   : args->v0.type = NVIF_CONN_V0_HDMI; break;
+	case DCB_CONNECTOR_HDMI_C   : type = NVIF_CONN_HDMI; break;
 	default:
 		WARN_ON(1);
 		return -EINVAL;
@@ -230,8 +241,13 @@ nvkm_uconn_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	conn->user = true;
 	spin_unlock(&disp->user.lock);
 
-	nvkm_object_ctor(&nvkm_uconn, oclass, &uconn->object);
+	nvkm_object_ctor(&nvkm_uconn, &(struct nvkm_oclass) {}, &uconn->object);
+	uconn->impl = nvkm_uconn_impl;
+	uconn->impl.type = type;
 	uconn->conn = conn;
+
+	*pimpl = &uconn->impl;
+	*ppriv = uconn;
 	*pobject = &uconn->object;
 	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
index f53d151e5b09..736d24951b12 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uconn.h
@@ -2,5 +2,8 @@
 #ifndef __NVKM_UCONN_H__
 #define __NVKM_UCONN_H__
 #include "conn.h"
+#include <nvif/driverif.h>
 
+int nvkm_uconn_new(struct nvkm_disp *, u8 id, const struct nvif_conn_impl **,
+		   struct nvif_conn_priv **, struct nvkm_object **);
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
index cef8427cca91..01333ded466b 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/udisp.c
@@ -22,7 +22,7 @@
 #include "udisp.h"
 #include "ucaps.h"
 #include "chan.h"
-#include "conn.h"
+#include "uconn.h"
 #include "head.h"
 #include "outp.h"
 
@@ -33,12 +33,6 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 {
 	struct nvkm_disp *disp = container_of(object, struct nvif_disp_priv, object)->disp;
 
-	if (index-- == 0) {
-		sclass->base = (struct nvkm_sclass) { 0, 0, NVIF_CLASS_CONN };
-		sclass->ctor = nvkm_uconn_new;
-		return 0;
-	}
-
 	if (index-- == 0) {
 		sclass->base = (struct nvkm_sclass) { 0, 0, NVIF_CLASS_OUTP };
 		sclass->ctor = nvkm_uoutp_new;
@@ -96,6 +90,21 @@ nvkm_udisp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *scl
 	return -EINVAL;
 }
 
+static int
+nvkm_udisp_conn_new(struct nvif_disp_priv *udisp, u8 id,
+		    const struct nvif_conn_impl **pimpl, struct nvif_conn_priv **ppriv,
+		    u64 handle)
+{
+	struct nvkm_object *object;
+	int ret;
+
+	ret = nvkm_uconn_new(udisp->disp, id, pimpl, ppriv, &object);
+	if (ret)
+		return ret;
+
+	return nvkm_object_link_rb(udisp->object.client, &udisp->object, handle, object);
+}
+
 static int
 nvkm_udisp_caps_new(struct nvif_disp_priv *udisp,
 		    const struct nvif_disp_caps_impl **pimpl, struct nvif_disp_caps_priv **ppriv)
@@ -123,6 +132,7 @@ nvkm_udisp_del(struct nvif_disp_priv *udisp)
 static const struct nvif_disp_impl
 nvkm_udisp_impl = {
 	.del = nvkm_udisp_del,
+	.conn.new = nvkm_udisp_conn_new,
 };
 
 static void *
-- 
2.41.0

