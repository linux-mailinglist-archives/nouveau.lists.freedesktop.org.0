Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DA7948A792E
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:43:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5A9EF112F96;
	Tue, 16 Apr 2024 23:43:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sx435UeA";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam10on2051.outbound.protection.outlook.com [40.107.93.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7B5DD112FC4
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:43:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jaoUMNNMv7gxWWqfC6rmJj62IE2u9Jm/bYjqxwqZBIB+KmwXEf/LaDyVm5tiT1xruZ5cYPi5pGs284R4uHilg2/0IBJvnbTrq/Ouv6OSAVg0L8qxrE7GycMnBcwbd5PWZE/TwJEJPkg35EY29lvJ5SJIWNTIAzcIgIPuQqLD2qglH2IfE6pOqgyGTkH7oTdX/k9xy+s522sU/evnhxehH0wYkwucSnlC0QzZ2no/gtoTuA9ppzOYC17e6JtTlyfYxv9qFAXjhTpuToa76c2hLRfeKPZ26U7O9Xyx9xb4YWwx2SE2LGM4vHKbCoYuUyu138lrtTVFLxsq3ygczGyFfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G5+MB5sbp1tsSkJWcwUKsjeYFYAvQ5jrw08JXgb9kiQ=;
 b=GHn1ZBczAkmEfsPhtz2nkWXlWFFMglhYRW7bzDYginzGLB0LRgwORpAG1bOJNt5JbAhiwZveFSPqKL0JB1tPvCbW7G69H0UWNW91cEJTGOzlMjjkRmIYNyjnbhgH2TPAW1jxhR9ynJX6Bw4cGw6W5vJJPn/026Jf+MLy9bG9hnfkzmj3Ejplh8NDPdU9MHD6F2z1WF+WtrF/V8W/xIXTW4j7LWS4yx4fQ2lqcSi+ZRrhribZ/iJxk+FvEByWf8Ypj/iF8OVWwZAQdkiJtn+qEYoZgdqdPc1mW7SfxdQekpRGxlY3jvbjdGLvTbtyebSvEEtX65m6UKlc9MNKFxL4zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G5+MB5sbp1tsSkJWcwUKsjeYFYAvQ5jrw08JXgb9kiQ=;
 b=sx435UeAv7taY6D74t8IC5ny8usivn9ZkpoeZZM37gRcdKjwYYXhSCckCohs08ea+gSvNfjxNzAHEhcYeXySH8i1fYt0yAiXYk6Y+aOfZQV4kr587xhb0ul1XeabK++w0yOPZ68wexncWoMzz7HWwIev/D81X9rOO4lKvFaxd6WNEYkomrM/YM9LxCDU3+GOU9mSLzBbj9ArXlvNxHYrToD9xEWWO6TrRiM6kPAhO0jYxRP6b6h/yzm5FXyggUbB1QFhjqfMHm5teTPlVnK+Fb9vnSflVAuSqD54VXjwcduqjNHjMkZnDZSuAE/npefNlxdXV6XiMRzCJhJ34pkQXw==
Received: from CH0P223CA0010.NAMP223.PROD.OUTLOOK.COM (2603:10b6:610:116::20)
 by PH8PR12MB7376.namprd12.prod.outlook.com (2603:10b6:510:214::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Tue, 16 Apr
 2024 23:43:19 +0000
Received: from CH2PEPF0000013F.namprd02.prod.outlook.com
 (2603:10b6:610:116:cafe::57) by CH0P223CA0010.outlook.office365.com
 (2603:10b6:610:116::20) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.20 via Frontend
 Transport; Tue, 16 Apr 2024 23:43:19 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:43:19 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:42:55 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:42:54 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 127/156] drm/nouveau/nvif: rework head "scanoutpos" api
Date: Wed, 17 Apr 2024 09:39:33 +1000
Message-ID: <20240416234002.19509-128-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: CH2PEPF0000013F:EE_|PH8PR12MB7376:EE_
X-MS-Office365-Filtering-Correlation-Id: 40ef6832-6a49-4288-1289-08dc5e6efef3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wImiOtFQ8TgQMUNR2AlYkp5IgNLEqgUriplUx7r4njODVqVQdnQ9Cne7pMcKKAW8lfIaIMZXn0hKoJzbgxXjbSNWGOqoycRqw0KZhfKzovQUf8pOzx5A1o4nAmhowGBSvAUel9zHUHfaN9QI4GBnSdhtj1Zl8B78KiycNjGUHtnL59DTLiefRz1urIsRzmHFJo12J44lse6IyqEkl+n2zC6w1YIDFZlaVPzUzXXThQJb+mvRfL1mPFb32HBRZ6ZkPq3Ohqq7x/7uUgX08JavWg+7M2mb3+TXTl7xq/fxIwYU3T6FN7AGp/pWlWlfcpvmu/nA+PtA0FK3hLwkI2GDYEVde3ixJeZgHvQIYV84wIrjNG21bZNVwY71Lp3YmZdAXnUdD0Fh2kX36dm4DPEgZlcDsSCFDxB/GjUjtUJrR+ijcjZ9f6yYzoh3Bcvbot6sKWDlgGZnOOk4K415EPlPVrmoYTG2lnnqea4G7ybVUNHddHeRUpXNSTBku49KrGhq7WxGJrY4E2LySbvPb4DAOVYVCSXbSNZcOYGrPn7S8jPhhSzp5a274dsAN0N+T4IrozAlK689vkhJmO9ZtQ+0dCtDLpDFW2ucnuOVSgZHDFMbO729GfIBUBNrov86nCEmaNJKVBEm8nYSM/RR/j7rWrXv8mQgxKDZ3BemjuIJMKhU1f6M64LSCKd4iNeEmRj7sMJeCcmZyyf993Wo9BuDAR+VdMlJnNbA3iXuWG3QlEyJwtt3fwGUMX3iCPxEzH6x
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(36860700004)(82310400014)(1800799015); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:43:19.4805 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 40ef6832-6a49-4288-1289-08dc5e6efef3
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CH2PEPF0000013F.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH8PR12MB7376
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
 .../gpu/drm/nouveau/include/nvif/driverif.h   |  4 ++
 drivers/gpu/drm/nouveau/include/nvif/if0013.h | 18 --------
 drivers/gpu/drm/nouveau/nouveau_display.c     | 20 +++++----
 .../gpu/drm/nouveau/nvkm/engine/disp/uhead.c  | 43 +++++++------------
 4 files changed, 30 insertions(+), 55 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvif/driverif.h b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
index 83acedd108bb..927d0d75dd29 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/driverif.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/driverif.h
@@ -351,6 +351,10 @@ struct nvif_outp_impl {
 
 struct nvif_head_impl {
 	void (*del)(struct nvif_head_priv *);
+
+	int (*scanoutpos)(struct nvif_head_priv *, s64 time[2],
+			  u16 *vblanks, u16 *vblanke, u16 *vtotal, u16 *vline,
+			  u16 *hblanks, u16 *hblanke, u16 *htotal, u16 *hline);
 };
 
 struct nvif_disp_impl {
diff --git a/drivers/gpu/drm/nouveau/include/nvif/if0013.h b/drivers/gpu/drm/nouveau/include/nvif/if0013.h
index 751f75bf7e59..f2b39f86a9cc 100644
--- a/drivers/gpu/drm/nouveau/include/nvif/if0013.h
+++ b/drivers/gpu/drm/nouveau/include/nvif/if0013.h
@@ -6,22 +6,4 @@ union nvif_head_event_args {
 	struct nvif_head_event_vn {
 	} vn;
 };
-
-#define NVIF_HEAD_V0_SCANOUTPOS 0x00
-
-union nvif_head_scanoutpos_args {
-	struct nvif_head_scanoutpos_v0 {
-		__u8  version;
-		__u8  pad01[7];
-		__s64 time[2];
-		__u16 vblanks;
-		__u16 vblanke;
-		__u16 vtotal;
-		__u16 vline;
-		__u16 hblanks;
-		__u16 hblanke;
-		__u16 htotal;
-		__u16 hline;
-	} v0;
-};
 #endif
diff --git a/drivers/gpu/drm/nouveau/nouveau_display.c b/drivers/gpu/drm/nouveau/nouveau_display.c
index 27b69032fd9e..0d2dae7a94d0 100644
--- a/drivers/gpu/drm/nouveau/nouveau_display.c
+++ b/drivers/gpu/drm/nouveau/nouveau_display.c
@@ -85,18 +85,20 @@ nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 {
 	struct drm_vblank_crtc *vblank = &crtc->dev->vblank[drm_crtc_index(crtc)];
 	struct nvif_head *head = &nouveau_crtc(crtc)->head;
-	struct nvif_head_scanoutpos_v0 args;
+	u16 vblanks, vblanke, vtotal, vline;
+	u16 hblanks, hblanke, htotal, hline;
+	s64 time[2];
 	int retry = 20;
 	bool ret = false;
 
-	args.version = 0;
-
 	do {
-		ret = nvif_mthd(&head->object, NVIF_HEAD_V0_SCANOUTPOS, &args, sizeof(args));
+		ret = head->impl->scanoutpos(head->priv, time,
+					     &vblanks, &vblanke, &vtotal, &vline,
+					     &hblanks, &hblanke, &htotal, &hline);
 		if (ret != 0)
 			return false;
 
-		if (args.vline) {
+		if (vline) {
 			ret = true;
 			break;
 		}
@@ -104,10 +106,10 @@ nouveau_display_scanoutpos_head(struct drm_crtc *crtc, int *vpos, int *hpos,
 		if (retry) ndelay(vblank->linedur_ns);
 	} while (retry--);
 
-	*hpos = args.hline;
-	*vpos = calc(args.vblanks, args.vblanke, args.vtotal, args.vline);
-	if (stime) *stime = ns_to_ktime(args.time[0]);
-	if (etime) *etime = ns_to_ktime(args.time[1]);
+	*hpos = hline;
+	*vpos = calc(vblanks, vblanke, vtotal, vline);
+	if (stime) *stime = ns_to_ktime(time[0]);
+	if (etime) *etime = ns_to_ktime(time[1]);
 
 	return ret;
 }
diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
index 3456e988f9b3..ebf72333ae99 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/disp/uhead.c
@@ -47,46 +47,33 @@ nvkm_uhead_uevent(struct nvkm_object *object, void *argv, u32 argc, struct nvkm_
 }
 
 static int
-nvkm_uhead_mthd_scanoutpos(struct nvkm_head *head, void *argv, u32 argc)
+nvkm_uhead_scanoutpos(struct nvif_head_priv *uhead, s64 time[2],
+		      u16 *vblanks, u16 *vblanke, u16 *vtotal, u16 *vline,
+		      u16 *hblanks, u16 *hblanke, u16 *htotal, u16 *hline)
 {
-	union nvif_head_scanoutpos_args *args = argv;
-
-	if (argc != sizeof(args->v0) || args->v0.version != 0)
-		return -ENOSYS;
+	struct nvkm_head *head = uhead->head;
 
 	head->func->state(head, &head->arm);
-	args->v0.vtotal  = head->arm.vtotal;
-	args->v0.vblanks = head->arm.vblanks;
-	args->v0.vblanke = head->arm.vblanke;
-	args->v0.htotal  = head->arm.htotal;
-	args->v0.hblanks = head->arm.hblanks;
-	args->v0.hblanke = head->arm.hblanke;
+	*vtotal  = head->arm.vtotal;
+	*vblanks = head->arm.vblanks;
+	*vblanke = head->arm.vblanke;
+	*htotal  = head->arm.htotal;
+	*hblanks = head->arm.hblanks;
+	*hblanke = head->arm.hblanke;
 
 	/* We don't support reading htotal/vtotal on pre-NV50 VGA,
 	 * so we have to give up and trigger the timestamping
 	 * fallback in the drm core.
 	 */
-	if (!args->v0.vtotal || !args->v0.htotal)
+	if (!*vtotal || !*htotal)
 		return -ENOTSUPP;
 
-	args->v0.time[0] = ktime_to_ns(ktime_get());
-	head->func->rgpos(head, &args->v0.hline, &args->v0.vline);
-	args->v0.time[1] = ktime_to_ns(ktime_get());
+	time[0] = ktime_to_ns(ktime_get());
+	head->func->rgpos(head, hline, vline);
+	time[1] = ktime_to_ns(ktime_get());
 	return 0;
 }
 
-static int
-nvkm_uhead_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
-{
-	struct nvkm_head *head = container_of(object, struct nvif_head_priv, object)->head;
-
-	switch (mthd) {
-	case NVIF_HEAD_V0_SCANOUTPOS: return nvkm_uhead_mthd_scanoutpos(head, argv, argc);
-	default:
-		return -EINVAL;
-	}
-}
-
 static void
 nvkm_uhead_del(struct nvif_head_priv *uhead)
 {
@@ -98,6 +85,7 @@ nvkm_uhead_del(struct nvif_head_priv *uhead)
 static const struct nvif_head_impl
 nvkm_uhead_impl = {
 	.del = nvkm_uhead_del,
+	.scanoutpos = nvkm_uhead_scanoutpos,
 };
 
 static void *
@@ -115,7 +103,6 @@ nvkm_uhead_dtor(struct nvkm_object *object)
 static const struct nvkm_object_func
 nvkm_uhead = {
 	.dtor = nvkm_uhead_dtor,
-	.mthd = nvkm_uhead_mthd,
 	.uevent = nvkm_uhead_uevent,
 };
 
-- 
2.41.0

