Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6EF438A791B
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB1A0112FAF;
	Tue, 16 Apr 2024 23:43:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="dhdb7JWn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2082.outbound.protection.outlook.com [40.107.93.82])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26C81112F6B
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:01 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=SbNVtVYwRSouoWsvxqjTVJfBhoogAUIuUP1eWfG1d404RJK7V1LXlU8SHKuxIsCnuM3aY9l/8TeIhnYEh33fOX1h1Wra2av1KxND3pS6As6V8kVAa0XZ/1TZYlAR94Tsd+IB8NqGAI0emlbhrbwspj7ON5zIw7k7XbGCXlkuiGPVvEqtXMqSyvUnZuGYMnt7QMa3TtWcov9rwGkgmey9GUK+e8ET7dTK3xgSjb+8s5uIUEazVtw5Z5J/JWcU5O37f9JsxY7e13lGuWJsEl3t0QuE2Iyuab/9TpFJdhb7OdLWMu6ILiTDPMq35btHOuWnzlkODl7vGS4QUqQceKQoYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9mPxEdZ2Uri2otvxarlcjOVw9j4VQ0amF9oRYMJd/uk=;
 b=P4InPsTbYGh66CXaZ3qJBRlWaGOwNsx2ABh+9j4kzI15NwsfmRjEgTg7PDYUeeS3xjZ7JqUbdCButq148qH8IogiNNFFGdl43YQCDaP9UDGARNWw+eqfjohyL+7+YY0qWcYE7en1EBgNUFIlg3JWLIR0FlUDx6+JVTJVGm2kiqfPWKq00bNBVTh0iBHT+LglnZvpaBtfmhUEvb0xv6858F+SvWX1iPlLKDD4BiuSPF3iyd5qLNHvLNf1UF49fSvj3jfalUUGN/FwXbANG4n9U7iRyF2hFA+JfkH7sSnTbNSqiLkouNsLGYWNx/8UMHTHMZMiFhZEnDRiCoYM0GKrmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9mPxEdZ2Uri2otvxarlcjOVw9j4VQ0amF9oRYMJd/uk=;
 b=dhdb7JWnRjkNvrpQOfutGzjSFjozvG2xnPloVOn/j+QtGSBGkNtA+jgLA1evy9pf378YMs8UUvxKa68ECU0QpCCgbUEIQrQ8rN5GdshlvsRGxLqc7WkTYJ8SFSEGyFKhSkRktFSxxZ2NgqokRkm+qoBoJ/6GyllKip0+nhn6cFVMHeErsYVWzkBbEWNV/k1RYr483kin+8JED5NFNchT+u+a8dG1vdoJ0+JOeLw/2nBXnIrqDbafmshsujwTAZm4WkO59El4sT+UyKkdoV9uoi9StgfmONGj28lgvQiqIEPRGFPHDEf8a8Ap7+7OWEtXW6hPP3dyoc31/i6jKILPxw==
Received: from CH0PR13CA0059.namprd13.prod.outlook.com (2603:10b6:610:b2::34)
 by PH0PR12MB7960.namprd12.prod.outlook.com (2603:10b6:510:287::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:42:54 +0000
Received: from CH2PEPF0000013B.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::dd) by CH0PR13CA0059.outlook.office365.com
 (2603:10b6:610:b2::34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.23 via Frontend
 Transport; Tue, 16 Apr 2024 23:42:53 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 CH2PEPF0000013B.mail.protection.outlook.com (10.167.244.68) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:42:53 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:32 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:30 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 106/156] drm/nouveau/nvif: rework outp "detect" api
Date: Wed, 17 Apr 2024 09:39:12 +1000
Message-ID: <20240416234002.19509-107-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013B:EE_|PH0PR12MB7960:EE_
X-MS-Office365-Filtering-Correlation-Id: b2ab469e-61fb-4676-9846-08dc5e6eef7c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?BolSAmnnS9H2Eyp8Bqho83K19ux1KWYjl1M6AfCslNJgoihFy2/1eesvcPE4?=
 =?us-ascii?Q?LXUbgp1tvziCQrr9lwV2UPLnYL02ibsb/iVXFZzoJ0WjsVqul1omTDzev07o?=
 =?us-ascii?Q?hJr8fuxX5IQQODv9qiDE4uA4X/uor2Jc/pW7yO5OpV3+lUN1zmFydFfeBqON?=
 =?us-ascii?Q?LCybWGrDeG/nbI7Bgxs7pdp/XXc2X3g/6o77xuttRo8x+P1eB0XcMTxm6zBD?=
 =?us-ascii?Q?pn3ouS1KsZ/cuzGJeaf9ASrFwigOeBqZwyJcnue+tIpGjMLcGOh6boXJiitv?=
 =?us-ascii?Q?pVYGHCggctlvm3lNTuubNI/N5P/7Qe1tjjYW1zvfNHLEyO87/7i17PT2uDx4?=
 =?us-ascii?Q?dWd4U29uM73CdBf4wxqF6XieGrR4a3OdeBl9otNyF9tqRE37qUi4CDn78UHp?=
 =?us-ascii?Q?yhgthDZbnmKIK4kdUuuLKhKbKgDCF8XskHm/wgxN7sgIo4N3JZtGfSZU/PjL?=
 =?us-ascii?Q?VvfZP13+yjgk9uR4zALD9DLFGydE/hrGOnDJHGAQFrKxoUWK9qHEJzeyb2zd?=
 =?us-ascii?Q?7fDcrUYKe1lyWgVASBlBDJHxGvK5CFe0D9mFRhQBqgDefID2plwmxRsdeLR5?=
 =?us-ascii?Q?9RBZCGtv7iNG6KDa+puEBRXnz9eypuCH+Ta6IIq0Kj0+E92VQU6T+BUw10RR?=
 =?us-ascii?Q?qqSSdTSIih9/8RawdWvvzp1k2zr0DyYRUbituzDISkyLxgC22ujtX7xedwCr?=
 =?us-ascii?Q?VOSpxFMUktGBuE8Wepf5Tm2j3KkYJbjX1Eejf0G+oohLS1jfqULZfx0RbzYL?=
 =?us-ascii?Q?uYUyPnIJnoN4Krkv2MJamLRW2JLveGFuVJ2yYUQPh5PTPxM43zSvGntSmmwo?=
 =?us-ascii?Q?W0aOJle9wwKtU1qGptK13vlFXn406vXkx8EnPSE7SRAuecESXDovBhyc2csg?=
 =?us-ascii?Q?veflPwm0KMq1bE3zekBPm/7vXbPjuJzIjjiexvf33a8/iNBWZv/PKTs1jwIl?=
 =?us-ascii?Q?6e6PDvzLGT7qtElbuFL8rtHr1s77d6qgomzD76/ZEusWDxS8CcfbildFOqQv?=
 =?us-ascii?Q?9BPm4gLFn5UYXi4Nqwjl1CxiqKFudNOUZk1MCRaZ/8SYSwmb1VRcrLErnmH2?=
 =?us-ascii?Q?EcbIQVwWHKZqk1vEmegVi4UeUW6yYB03Od2vGqckegoqrvsE5txSKyrVFDgs?=
 =?us-ascii?Q?7V957Qrtj7RNgPn3AdP6ncptCxqUT+0X2huK/36jDc5i3UffTqyOWQbOajIT?=
 =?us-ascii?Q?7AxfgY5+ssj62YQjKKxA4c0Li88fgaDmS4ezi4K2gXT9zDQipimUXQTssIJg?=
 =?us-ascii?Q?I5jiC+sHTZIT+XilGGFBGXFZja/yIpzt4ZxuveIZypnA8f/E6i7OmuUbS1aE?=
 =?us-ascii?Q?6ltF+vlXnHQAyv7pJkWSWIPk0fTKHIZeGTrNCr9hg1o3wPJUKob1l39+uJY6?=
 =?us-ascii?Q?jUHDZ2gT5ZgnRrSQDzwCm81seMVL?=
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:42:53.5538 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: b2ab469e-61fb-4676-9846-08dc5e6eef7c
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013B.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR12MB7960
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  8 ++++
 drivers/gpu/drm/nouveau/include/nvif/if0012.h | 11 -----
 drivers/gpu/drm/nouveau/include/nvif/outp.h   |  6 ---
 drivers/gpu/drm/nouveau/nouveau_connector.c   |  6 +--
 drivers/gpu/drm/nouveau/nouveau_dp.c          |  2 +-
 drivers/gpu/drm/nouveau/nvif/outp.c           | 21 ++-------
 .../gpu/drm/nouveau/nvkm/engine/disp/uoutp.c  | 47 ++++++++++++++-----
 7 files changed, 53 insertions(+), 48 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 8d00ed58323f..fd05065374fe 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -244,6 +244,12 @@ struct nvif_conn_impl {
 		     const struct nvif_event_impl **, struct nvif_event_priv **);
 };
 
+enum nvif_outp_detect_status {
+	NVIF_OUTP_DETECT_NOT_PRESENT,
+	NVIF_OUTP_DETECT_PRESENT,
+	NVIF_OUTP_DETECT_UNKNOWN,
+};
+
 struct nvif_outp_impl {
 	void (*del)(struct nvif_outp_priv *);
 
@@ -267,6 +273,8 @@ struct nvif_outp_impl {
 	u8 ddc;
 	u8 conn;
 
+	int (*detect)(struct nvif_outp_priv *, enum nvif_outp_detect_status *);
+
 	struct {
 		u32 freq_max;
 	} rgb_crt;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0012.h b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
index d1e2f0ff8965..c0c13cb64994 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0012.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0012.h
@@ -4,7 +4,6 @@
 
 #include <drm/display/drm_dp.h>
 
-#define NVIF_OUTP_V0_DETECT        0x00
 #define NVIF_OUTP_V0_EDID_GET      0x01
 
 #define NVIF_OUTP_V0_INHERIT       0x10
@@ -33,16 +32,6 @@
 #define NVIF_OUTP_V0_DP_MST_ID_PUT 0x77
 #define NVIF_OUTP_V0_DP_MST_VCPI   0x78
 
-union nvif_outp_detect_args {
-	struct nvif_outp_detect_v0 {
-		__u8 version;
-#define NVIF_OUTP_DETECT_V0_NOT_PRESENT 0x00
-#define NVIF_OUTP_DETECT_V0_PRESENT     0x01
-#define NVIF_OUTP_DETECT_V0_UNKNOWN     0x02
-		__u8 status;
-	} v0;
-};
-
 union nvif_outp_edid_get_args {
 	struct nvif_outp_edid_get_v0 {
 		__u8  version;
diff --git a/drivers/gpu/drm/nouveau/include/nvif/outp.h b/drivers/gpu/drm/nouveau/include/nvif/outp.h
index 56bfbc41a576..7a64a7d2ac97 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/outp.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/outp.h
@@ -21,12 +21,6 @@ struct nvif_outp {
 int nvif_outp_ctor(struct nvif_disp *, const char *name, int id, struct nvif_outp *);
 void nvif_outp_dtor(struct nvif_outp *);
 
-enum nvif_outp_detect_status {
-	NOT_PRESENT,
-	PRESENT,
-	UNKNOWN,
-};
-
 enum nvif_outp_detect_status nvif_outp_detect(struct nvif_outp *);
 int nvif_outp_edid_get(struct nvif_outp *, u8 **pedid);
 
diff --git a/drivers/gpu/drm/nouveau/nouveau_connector.c b/drivers/gpu/drm/nouveau/nouveau_connector.c
index b1bd8264b703..3063ef792023 100644
--- a/drivers/gpu/drm/nouveau/nouveau_connector.c
+++ b/drivers/gpu/drm/nouveau/nouveau_connector.c
@@ -434,11 +434,11 @@ nouveau_connector_ddc_detect(struct drm_connector *connector)
 			} else {
 				status = nvif_outp_detect(&nv_encoder->outp);
 				switch (status) {
-				case PRESENT:
+				case NVIF_OUTP_DETECT_PRESENT:
 					return nv_encoder;
-				case NOT_PRESENT:
+				case NVIF_OUTP_DETECT_NOT_PRESENT:
 					continue;
-				case UNKNOWN:
+				case NVIF_OUTP_DETECT_UNKNOWN:
 					break;
 				default:
 					WARN_ON(1);
diff --git a/drivers/gpu/drm/nouveau/nouveau_dp.c b/drivers/gpu/drm/nouveau/nouveau_dp.c
index a72c45809484..cf196af96609 100644
--- a/drivers/gpu/drm/nouveau/nouveau_dp.c
+++ b/drivers/gpu/drm/nouveau/nouveau_dp.c
@@ -256,7 +256,7 @@ nouveau_dp_detect(struct nouveau_connector *nv_connector,
 	}
 
 	hpd = nvif_outp_detect(&nv_encoder->outp);
-	if (hpd == NOT_PRESENT) {
+	if (hpd == NVIF_OUTP_DETECT_NOT_PRESENT) {
 		nvif_outp_dp_aux_pwr(&nv_encoder->outp, false);
 		goto out;
 	}
diff --git a/drivers/gpu/drm/nouveau/nvif/outp.c b/drivers/gpu/drm/nouveau/nvif/outp.c
index a8012a71a50c..b704886c1bb6 100644
--- a/drivers/gpu/drm/nouveau/nvif/outp.c
+++ b/drivers/gpu/drm/nouveau/nvif/outp.c
@@ -467,26 +467,15 @@ nvif_outp_edid_get(struct nvif_outp *outp, u8 **pedid)
 enum nvif_outp_detect_status
 nvif_outp_detect(struct nvif_outp *outp)
 {
-	struct nvif_outp_detect_v0 args;
+	enum nvif_outp_detect_status status;
 	int ret;
 
-	args.version = 0;
-
-	ret = nvif_mthd(&outp->object, NVIF_OUTP_V0_DETECT, &args, sizeof(args));
-	NVIF_ERRON(ret, &outp->object, "[DETECT] status:%02x", args.status);
+	ret = outp->impl->detect(outp->priv, &status);
+	NVIF_ERRON(ret, &outp->object, "[DETECT] status:%02x", status);
 	if (ret)
-		return UNKNOWN;
-
-	switch (args.status) {
-	case NVIF_OUTP_DETECT_V0_NOT_PRESENT: return NOT_PRESENT;
-	case NVIF_OUTP_DETECT_V0_PRESENT: return PRESENT;
-	case NVIF_OUTP_DETECT_V0_UNKNOWN: return UNKNOWN;
-	default:
-		WARN_ON(1);
-		break;
-	}
+		return NVIF_OUTP_DETECT_UNKNOWN;
 
-	return UNKNOWN;
+	return status;
 }
 
 void
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
index b585b781e928..2324549787b6 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uoutp.c
@@ -35,6 +35,31 @@ struct nvif_outp_priv {
 	struct nvif_outp_impl impl;
 };
 
+static inline void
+nvkm_uoutp_unlock(struct nvif_outp_priv *uoutp)
+{
+	mutex_unlock(&uoutp->outp->disp->super.mutex);
+}
+
+static inline void
+nvkm_uoutp_lock(struct nvif_outp_priv *uoutp)
+{
+	mutex_lock(&uoutp->outp->disp->super.mutex);
+}
+
+static inline int
+nvkm_uoutp_lock_acquired(struct nvif_outp_priv *uoutp)
+{
+	nvkm_uoutp_lock(uoutp);
+
+	if (!uoutp->outp->ior) {
+		nvkm_uoutp_unlock(uoutp);
+		return -EIO;
+	}
+
+	return 0;
+}
+
 static int
 nvkm_uoutp_mthd_dp_mst_vcpi(struct nvkm_outp *outp, void *argv, u32 argc)
 {
@@ -480,22 +505,20 @@ nvkm_uoutp_mthd_edid_get(struct nvkm_outp *outp, void *argv, u32 argc)
 }
 
 static int
-nvkm_uoutp_mthd_detect(struct nvkm_outp *outp, void *argv, u32 argc)
+nvkm_uoutp_detect(struct nvif_outp_priv *uoutp, enum nvif_outp_detect_status *status)
 {
-	union nvif_outp_detect_args *args = argv;
+	struct nvkm_outp *outp = uoutp->outp;
 	int ret;
 
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
-	if (!outp->func->detect)
-		return -EINVAL;
-
+	nvkm_uoutp_lock(uoutp);
 	ret = outp->func->detect(outp);
+	nvkm_uoutp_unlock(uoutp);
+
 	switch (ret) {
-	case 0: args->v0.status = NVIF_OUTP_DETECT_V0_NOT_PRESENT; break;
-	case 1: args->v0.status = NVIF_OUTP_DETECT_V0_PRESENT; break;
+	case 0: *status = NVIF_OUTP_DETECT_NOT_PRESENT; break;
+	case 1: *status = NVIF_OUTP_DETECT_PRESENT; break;
 	default:
-		args->v0.status = NVIF_OUTP_DETECT_V0_UNKNOWN;
+		*status = NVIF_OUTP_DETECT_UNKNOWN;
 		break;
 	}
 
@@ -528,7 +551,6 @@ static int
 nvkm_uoutp_mthd_noacquire(struct nvkm_outp *outp, u32 mthd, void *argv, u32 argc, bool *invalid)
 {
 	switch (mthd) {
-	case NVIF_OUTP_V0_DETECT     : return nvkm_uoutp_mthd_detect     (outp, argv, argc);
 	case NVIF_OUTP_V0_EDID_GET   : return nvkm_uoutp_mthd_edid_get   (outp, argv, argc);
 	case NVIF_OUTP_V0_INHERIT    : return nvkm_uoutp_mthd_inherit    (outp, argv, argc);
 	case NVIF_OUTP_V0_ACQUIRE    : return nvkm_uoutp_mthd_acquire    (outp, argv, argc);
@@ -627,6 +649,9 @@ nvkm_uoutp_new(struct nvkm_disp *disp, u8 id, const struct nvif_outp_impl **pimp
 	uoutp->impl = nvkm_uoutp_impl;
 	uoutp->impl.id = id;
 
+	if (outp->func->detect)
+		uoutp->impl.detect = nvkm_uoutp_detect;
+
 	switch (outp->info.type) {
 	case DCB_OUTPUT_ANALOG:
 		uoutp->impl.type = NVIF_OUTP_DAC;
-- 
2.41.0

