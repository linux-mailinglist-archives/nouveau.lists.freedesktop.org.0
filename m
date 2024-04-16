Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CED258A78D9
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 190B4112F4A;
	Tue, 16 Apr 2024 23:41:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="RnUUSKoA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam12on2051.outbound.protection.outlook.com [40.107.244.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9523112F1F
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:46 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EA7/a7yBioLQort63EhXZBxD02kGj68DzWr+M3NqC4p9gkhYjfcUKgrQ6XKNZSiTQrgmiF5AWzYzR2sAxBJELjgRa7GiKUTRoM0Cfyllt8kEkY8LQKr3g4kOsYQtgyq6qfAv//EchvB+BuJGCGDASoJ9azm8aRdD1fzVZZF9iZulvpkxojZESc71m72azwAp76XanY4GA3N/HDghHFUXahZiHlIW3OcHJb9MrHwyJd+xqvx3wIbCDXVSmSL9UTwFBy3LAKTBH2HbMr02gCS6bjQ/0sYEOEOHfRxZupBebDNNRVlrkDrkGJHr+gS1GXID7L9U3miaYrSL8F4Jrhz9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=j8wIheWTEFVtARteN0jEt63CIqe0zx6H4s2HLqxdUNI=;
 b=jkgdT9dEXjr7jX0ipxXfhAuYXWH6KLYMha57GrZg6+gmOYGTjBrSKvWfEJP2N7T/dsm6DaGPE97cbXy5H/1VJesZilO/YMH6i2Hmv9ux999xMVdJPdzWQdAZa/0A2Sf1MtFibBlT7oyfAkvQ5pvZZ9yhJBr8iK807dCsZBBFuFa9Zw7u9HQnoGMRn6m+BfSj1PYx1aThAw63emcu4jeKV2lZ695I8QecxwYlr/2M8d4RNitB0wHw7gJEc4RPJ3p9YLW505oJTKQOQFfs7oBLCRR4/BikjcPeyVKWxu+a9BXsQX7QllxZyB9/eNoLN/XPvHtipV72OLa9aMJsaIjPAg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=j8wIheWTEFVtARteN0jEt63CIqe0zx6H4s2HLqxdUNI=;
 b=RnUUSKoAdGmirXR0SdUApkRVgPyqCjE5YUNKsQ5cnwQdX7tJI4HQSDZBvuQO5f5omvHP5oQItwvVybyKj+N9QibBKqoTFUqxx1/bGNWs08GCuoSx7WLv1pZKOM4x/JF5to9ftRh6DwlJPHRmp2ILBcZr42FsjCNgkDIZdxykGzsiOgb5a/gAJGNoZwVE9FD2qFCqcSwuPEp0bmr9oX9rUAsBoYfLt2gl2iVX87pW7nktfAKWxodZA80u8DZKQOWfMU3l1ry8o32vFjLL9rI0ZIBGhat/JnDKt5ALkn+IkdFg4toIZfCr6jXmm8lPD+jyFbhL2aiEditd1cobGliMSw==
Received: from CH0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:610:b2::34)
 by SJ1PR12MB6098.namprd12.prod.outlook.com (2603:10b6:a03:45f::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:43 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::29) by CH0PR13CA0059.outlook.office365.com
 (2603:10b6:610:b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS2PEPF00003439.mail.protection.outlook.com (10.167.18.36) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:42 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:27 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:25 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 049/156] drm/nouveau/nvkm: detach user handling from nvkm_outp
Date: Wed, 17 Apr 2024 09:38:15 +1000
Message-ID: <20240416234002.19509-50-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|SJ1PR12MB6098:EE_
X-MS-Office365-Filtering-Correlation-Id: af5d5e3a-b901-49d2-22db-08dc5e6ec537
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Llzs5I8N8y91lO8Jfun+xuAjOnwsAFsBa+RDurbvqoaciLeeALmfkJqh+vT2bcik/vs1YyR8Wao7XQcYrtFtRbZI1mekZWwMDLs8Mv3e0Wa7l24GoLT7PJbNoqWqyCQbnnm5TOebj4GZ6yTkuRrPrOlHvbEPMzzUhV7g93ddwhJxclCuL4M6lRQ95cfQoH5h/O50Gz4wOot1MXrL3wDKcMkPr7Ykty2ncEMiGGWJP14pcSi1pWVjfaIZHvqRT9lakZgoc9YowKE9T/WHLsdgRHK/B8ev/CGbvw6QewBvlKzbXmczjIiG6EP4vgFTkqKqOpw/1y5HJ1+N0RnjTmxFqOvi9Rq2Gb6BmXbrTHhfgU/WkYMiIPTgJtscZXJ8BAu2IbLl37TrWzMSRKzqmbdvABZTusyCpCQ7/44roYboWlMyOpFoFqaGMfZm5ozENiUai4lJS/r0otQKJdoFy/4uitAbif1L9h4t7ArOG9qKZiushSWaRMXVtiXZbg+qc46IDJr2w82+IUv9yeBRlE5OfKO7v6EIiYop27m8AEI/QsQXGwpsw4cRQYgVdq8G4RNBXWCIJCYm5oreBXx0gHY+2+1Whi04IzsecGmzKbtGxia4jTt3QBSDZmJwuN+Bcc9GquWBQ8/0+JkXyKQNeKXqTUBf8URFb6YIX6Ffw6Ht0oIQJRknqQ0U6tP9bGNAEDWnWTRfeJmYY/X7D1vW1X6X7oZul2+tf3l4FehBPKw0e9Kt6pRrNeVo6FRqrc9R/pl6
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:42.6500 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: af5d5e3a-b901-49d2-22db-08dc5e6ec537
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ1PR12MB6098
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
- open-code current nvkm_uoutp() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/engine/disp/outp.h   |   3 +-
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 131 ++++++++++--------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.h  |   6 +
 3 files changed, 78 insertions(+), 62 deletions(-)
 create mode 100644 drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
index ebd2f499b4b1..1beba54f80eb 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/outp.h
@@ -63,10 +63,11 @@ struct nvkm_outp {
 		} dp;
 	};
 
-	struct nvkm_object object;
 	struct {
 		struct nvkm_head *head;
 	} asy;
+
+	bool user; /* protected by disp->user.lock */
 };
 
 int nvkm_outp_new_(const struct nvkm_outp_func *, struct nvkm_disp *, int index,
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index 75669d5f8a42..8d39dad73a40 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -19,8 +19,7 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_uoutp(p) container_of((p), struct nvkm_outp, object)
-#include "outp.h"
+#include "uoutp.h"
 #include "dp.h"
 #include "head.h"
 #include "ior.h"
@@ -29,6 +28,11 @@
 
 #include <nvif/if0012.h>
 
+struct nvif_outp_priv {
+	struct nvkm_object object;
+	struct nvkm_outp *outp;
+};
+
 static int
 nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -543,7 +547,7 @@ nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc
 static int
 nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
-	struct nvkm_outp *outp = nvkm_uoutp(object);
+	struct nvkm_outp *outp = container_of(object, struct nvif_outp_priv, object)->outp;
 	struct nvkm_disp *disp = outp->disp;
 	bool invalid = false;
 	int ret;
@@ -567,13 +571,13 @@ nvkm_uoutp_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 static void *
 nvkm_uoutp_dtor(struct nvkm_object *object)
 {
-	struct nvkm_outp *outp = nvkm_uoutp(object);
-	struct nvkm_disp *disp = outp->disp;
+	struct nvif_outp_priv *uoutp = container_of(object, typeof(*uoutp), object);
+	struct nvkm_disp *disp = uoutp->outp->disp;
 
 	spin_lock(&disp->user.lock);
-	outp->object.func = NULL;
+	uoutp->outp->user = false;
 	spin_unlock(&disp->user.lock);
-	return NULL;
+	return uoutp;
 }
 
 static const struct nvkm_object_func
@@ -589,7 +593,7 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	struct nvkm_disp *disp = container_of(oclass->parent, struct nvif_disp_priv, object)->disp;
 	struct nvkm_outp *outt, *outp = NULL;
 	union nvif_outp_args *args = argv;
-	int ret;
+	struct nvif_outp_priv *uoutp;
 
 	if (argc != sizeof(args->v0) || args->v0.version != 0)
 		return -ENOSYS;
@@ -604,63 +608,68 @@ nvkm_uoutp_new(const struct nvkm_oclass *oclass, void *argv, u32 argc, struct nv
 	if (!outp)
 		return -EINVAL;
 
-	ret = -EBUSY;
-	spin_lock(&disp->user.lock);
-	if (!outp->object.func) {
-		switch (outp->info.type) {
-		case DCB_OUTPUT_ANALOG:
-			args->v0.type = NVIF_OUTP_V0_TYPE_DAC;
-			args->v0.proto = NVIF_OUTP_V0_PROTO_RGB_CRT;
-			args->v0.rgb_crt.freq_max = outp->info.crtconf.maxfreq;
-			break;
-		case DCB_OUTPUT_TMDS:
-			if (!outp->info.location) {
-				args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
-				args->v0.tmds.dual = (outp->info.tmdsconf.sor.link == 3);
-			} else {
-				args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
-				args->v0.tmds.dual = 0;
-			}
-			args->v0.proto = NVIF_OUTP_V0_PROTO_TMDS;
-			break;
-		case DCB_OUTPUT_LVDS:
+	switch (outp->info.type) {
+	case DCB_OUTPUT_ANALOG:
+		args->v0.type = NVIF_OUTP_V0_TYPE_DAC;
+		args->v0.proto = NVIF_OUTP_V0_PROTO_RGB_CRT;
+		args->v0.rgb_crt.freq_max = outp->info.crtconf.maxfreq;
+		break;
+	case DCB_OUTPUT_TMDS:
+		if (!outp->info.location) {
 			args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
-			args->v0.proto = NVIF_OUTP_V0_PROTO_LVDS;
-			args->v0.lvds.acpi_edid = outp->info.lvdsconf.use_acpi_for_edid;
-			break;
-		case DCB_OUTPUT_DP:
-			if (!outp->info.location) {
-				args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
-				args->v0.dp.aux = outp->info.i2c_index;
-			} else {
-				args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
-				args->v0.dp.aux = NVKM_I2C_AUX_EXT(outp->info.extdev);
-			}
-			args->v0.proto = NVIF_OUTP_V0_PROTO_DP;
-			args->v0.dp.mst = outp->dp.mst;
-			args->v0.dp.increased_wm = outp->dp.increased_wm;
-			args->v0.dp.link_nr = outp->info.dpconf.link_nr;
-			args->v0.dp.link_bw = outp->info.dpconf.link_bw * 27000;
-			break;
-		default:
-			WARN_ON(1);
-			ret = -EINVAL;
-			goto done;
+			args->v0.tmds.dual = (outp->info.tmdsconf.sor.link == 3);
+		} else {
+			args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
+			args->v0.tmds.dual = 0;
 		}
+		args->v0.proto = NVIF_OUTP_V0_PROTO_TMDS;
+		break;
+	case DCB_OUTPUT_LVDS:
+		args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
+		args->v0.proto = NVIF_OUTP_V0_PROTO_LVDS;
+		args->v0.lvds.acpi_edid = outp->info.lvdsconf.use_acpi_for_edid;
+		break;
+	case DCB_OUTPUT_DP:
+		if (!outp->info.location) {
+			args->v0.type = NVIF_OUTP_V0_TYPE_SOR;
+			args->v0.dp.aux = outp->info.i2c_index;
+		} else {
+			args->v0.type = NVIF_OUTP_V0_TYPE_PIOR;
+			args->v0.dp.aux = NVKM_I2C_AUX_EXT(outp->info.extdev);
+		}
+		args->v0.proto = NVIF_OUTP_V0_PROTO_DP;
+		args->v0.dp.mst = outp->dp.mst;
+		args->v0.dp.increased_wm = outp->dp.increased_wm;
+		args->v0.dp.link_nr = outp->info.dpconf.link_nr;
+		args->v0.dp.link_bw = outp->info.dpconf.link_bw * 27000;
+		break;
+	default:
+		WARN_ON(1);
+		return -EINVAL;
+	}
 
-		if (outp->info.location)
-			args->v0.ddc = NVKM_I2C_BUS_EXT(outp->info.extdev);
-		else
-			args->v0.ddc = outp->info.i2c_index;
-		args->v0.heads = outp->info.heads;
-		args->v0.conn = outp->info.connector;
+	if (outp->info.location)
+		args->v0.ddc = NVKM_I2C_BUS_EXT(outp->info.extdev);
+	else
+		args->v0.ddc = outp->info.i2c_index;
+	args->v0.heads = outp->info.heads;
+	args->v0.conn = outp->info.connector;
 
-		nvkm_object_ctor(&nvkm_uoutp, oclass, &outp->object);
-		*pobject = &outp->object;
-		ret = 0;
-	}
+	uoutp = kzalloc(sizeof(*uoutp), GFP_KERNEL);
+	if (!uoutp)
+		return -ENOMEM;
 
-done:
+	spin_lock(&disp->user.lock);
+	if (outp->user) {
+		spin_unlock(&disp->user.lock);
+		kfree(uoutp);
+		return -EBUSY;
+	}
+	outp->user = true;
 	spin_unlock(&disp->user.lock);
-	return ret;
+
+	nvkm_object_ctor(&nvkm_uoutp, oclass, &uoutp->object);
+	uoutp->outp = outp;
+	*pobject = &uoutp->object;
+	return 0;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
new file mode 100644
index 000000000000..37ecd2891a1a
--- /dev/null
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.h
@@ -0,0 +1,6 @@
+/* SPDX-License-Identifier: MIT */
+#ifndef __NVKM_UOUTP_H__
+#define __NVKM_UOUTP_H__
+#include "outp.h"
+
+#endif
-- 
2.41.0

