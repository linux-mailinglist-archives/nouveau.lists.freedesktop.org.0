Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B398A78E3
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 96316112F56;
	Tue, 16 Apr 2024 23:41:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="sNAMPcm4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM10-MW2-obe.outbound.protection.outlook.com
 (mail-mw2nam10on2062.outbound.protection.outlook.com [40.107.94.62])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C2AAA112F57
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:53 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=k0SZ+61wByiwgVwUsJNNMGQZZCJQWz3zNi7OXBBem/DJrbjs/WWfjn2gQl4ahq7lZVkGPaSIc4RI87VwLmgYPfMgE1WFgS6FvrN4ksuVkfG8YdNSFuAQn4yvKXlsqr1gk9ostqMCHtZ110Ha0MiEo4gEDuZ4z2VGnhtmvcCuFBVcQiQtBMW6Ebp99lXYKuNm0iO4VeYDOA1VF0zcPazB7xORrALnzsWjp52rYaPr3xgaORqENL5xBUzVvKpXSfF7j5o9NWJFxxCLtruDiDfkHkj8Y6FUMNK9Eq0WzNZ/ohIUAxoKHriPGjhMrRli4+JPWyxRhejh/0OqggovmDulOQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qHDYdnt+A+5cGic3dZfnIDGe9LTIicJkOZfvYv1+rDI=;
 b=VhTVTq0A4T15exPbWGpXJmer4EDceYf2K5YC+2pk0s9/BAux4lru6lvBhSxJvBFGEfIbd6qDNyR0XgYzrdZtGK0+hJpp3YkZ8L3Qa9FkoVZb8pgG6g1ad4IgYgfeuTLisjA7RgNJA8+mA7TUuI25UJOku6pPW6L3+7A2DkmmMryh+F9rQXA6szimZdVLHRwxPM8CYaZjMNJzqUgv4o5HGRI+wr2KXfKisv14hvfynfTltrsg4QD4qNJt4n1y8MKbVRIsViQ2siO28cl9nZ0KXLJCptJpvdNNTRTy8cXRW64ywaWL8mGGtbTlReeoBSlMFsKcKKINmU9TWb2lAelpgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qHDYdnt+A+5cGic3dZfnIDGe9LTIicJkOZfvYv1+rDI=;
 b=sNAMPcm4beo+j1JM3GT5zvmsBJVcZU0UpKZgGwADihGsZ1l4T10v9oy6i0kL+mxbpp9oGcwoBLte7tdaP6/Xu3bc7TG9WcWD3x0EQBrbi3zWxztk41E8dGQ48tedmQponLIkSNgUrAPmSIZOHmXsm2qMAb+DXsSIKPUqI2zRI3CUPIIBH/8hqDNS3uk9RtR1pr/2CgIA9/F4q0RXDOqXhk6bRvu3X2gN/Hlwo0UmcPui40AmpNPpYTxqF1YCDcaNmgVUF6osv7eqpVx4e9XlkYCth2kdAIjTqYFHcQ9oyCjabhXosPPPrC9dpk/kNbCYgVEDSQmh+EvCIxcz594jDg==
Received: from CH0PR13CA0046.namprd13.prod.outlook.com (2603:10b6:610:b2::21)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:46 +0000
Received: from DS2PEPF00003439.namprd02.prod.outlook.com
 (2603:10b6:610:b2:cafe::72) by CH0PR13CA0046.outlook.office365.com
 (2603:10b6:610:b2::21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7495.16 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:46 +0000
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
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:46 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:30 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:29 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 052/156] drm/nouveau/nvkm: rename struct nvkm_ucgrp
Date: Wed, 17 Apr 2024 09:38:18 +1000
Message-ID: <20240416234002.19509-53-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: DS2PEPF00003439:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: 11689ddb-8666-4f30-093f-08dc5e6ec765
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zppyZzbKRuKP4Y4rgSJlVJPRPTcCLXvH1cSg8HZdcpVoy3yeeizzmQBXLG1v?=
 =?us-ascii?Q?MuTR8z6nIVHAxuML+bbdgSHmXPvlQ5S+Zh6QkLGWVFz7cvm9WxM31iTcKdV6?=
 =?us-ascii?Q?IHaNpzZNUAtYeqcw+ft018WwReIVtlv8Q7y0K2yt18RtMlRw8R1slOBZgs7d?=
 =?us-ascii?Q?pWfYeI/9VhBZxkDg+Hl4NixRiANypNdXFWcMYnGYfgufy/AH29pkkj0+Leah?=
 =?us-ascii?Q?bTK52to8FeomiuISLCl+C9NT5V+BTtC3v8IHD9lfd1lpBautjHJ2O1Za+WON?=
 =?us-ascii?Q?/G37rUIZhV6y5v5Vxbl16NRgeQhe20+jVCDXy8RPNTSUWq58WFtOwJT08WtD?=
 =?us-ascii?Q?kvMCBBkxUPP7D0nXtVPRxgqbuNdkPufMubSf2KzxwgRoSsdj+uaiXuBYpFjQ?=
 =?us-ascii?Q?IgDV6JsTCLzR71mDuYNcMCx9haq/GhfEY0tG0NyY0/PqEtKl/rvMQrxcZ9nU?=
 =?us-ascii?Q?GSP0f2wf7vNPWSH2AVYwBrl5QxmeeefbAyLTnLlPOSrdTZEQ88/XKARLzaLi?=
 =?us-ascii?Q?pjlwCRXyIihSP9qs5se99TuHPf+lmTiJZF8Zg0dLSGotBD3Lv0U+DJEOYbuH?=
 =?us-ascii?Q?0ubFd2Hr3lrW0oO/j3Hkxn0IvngkmvLqoiH5B4H7nTzrq98jfJRMDYNiI8qE?=
 =?us-ascii?Q?ktjnTuCdTN2cTM4kBMD47yHnLb989VH0z1sJmlw/DGlDDm9beKdc2DO7M1Mg?=
 =?us-ascii?Q?vFgbMekiPMIxGBfg75BdR8JFlQZgCpOKq4hSc3onD7XwSd020e+XAiLTdNkQ?=
 =?us-ascii?Q?6tV1qJFCR1mUfbnSxsxyuAw4rMjp3azegwKGcbIRpABKqJ/f7Osav6XYAVxM?=
 =?us-ascii?Q?7eIy00Zm9detznN425xv57uO5DvOCr9SDWV8Sl8U4R3+qzEyyarU5jGOPFDL?=
 =?us-ascii?Q?hX1ceVqsObax5iokk+1kh3z3SH6RlGYTce34wRtWHEXuedkS08BobZXhTP5/?=
 =?us-ascii?Q?puZvg/vyy3+AW97aDCxRfkezMXeQRRdswU9VrjIV3aLQ4/vK/m3H1RmmkjjL?=
 =?us-ascii?Q?U04gpG2yagtmZtVKToPIJN57BKJf7qkmSXm4xigQvMQNHQ7yNfXgLcLT29+c?=
 =?us-ascii?Q?CwkSCac6pVvEJ7h9iZuq35vZDI9uMbcoJV778cyy5402wPhlVhPTeC3MHg3n?=
 =?us-ascii?Q?0F7NKj5woAciiTNDRCteIdGnr13a9kPpOI0rjEl3xawv+V907wREXL346prP?=
 =?us-ascii?Q?JRtjBhgOmNvrCSndvFiSGBvpHB7DRvc35sEY1+VpUyJtJgJ3eaYqB1eRr6Js?=
 =?us-ascii?Q?k+GKfLwckmy16vXIHs8WU/ERm8NM2AhZs6Zhoc0MKobSY56JIsL3TsXjp4TK?=
 =?us-ascii?Q?4h9onem3jNjj3j1onBjZTpnXsVK8R6Lyp51guUdRsX5FPIt8PJVK4aNdTz+x?=
 =?us-ascii?Q?0kKZqJOeNndFeOLQlFt/DPfwLnVE?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230031)(376005)(82310400014)(1800799015)(36860700004); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:46.1812 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 11689ddb-8666-4f30-093f-08dc5e6ec765
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS2PEPF00003439.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
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
- open-code current nvkm_ucgrp() macro

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
index 52c594dfb1b8..7c9a151b03a3 100644
--- a/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
+++ b/drivers/gpu/drm/nouveau/nvkm/engine/fifo/ucgrp.c
@@ -19,7 +19,6 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_ucgrp(p) container_of((p), struct nvkm_ucgrp, object)
 #include "priv.h"
 #include "cgrp.h"
 #include "runl.h"
@@ -28,7 +27,7 @@
 
 #include <nvif/if0021.h>
 
-struct nvkm_ucgrp {
+struct nvif_cgrp_priv {
 	struct nvkm_object object;
 	struct nvkm_cgrp *cgrp;
 };
@@ -37,7 +36,7 @@ static int
 nvkm_ucgrp_chan_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		    struct nvkm_object **pobject)
 {
-	struct nvkm_cgrp *cgrp = nvkm_ucgrp(oclass->parent)->cgrp;
+	struct nvkm_cgrp *cgrp = container_of(oclass->parent, struct nvif_cgrp_priv, object)->cgrp;
 
 	return nvkm_uchan_new(cgrp->runl->fifo, cgrp, oclass, argv, argc, pobject);
 }
@@ -45,7 +44,7 @@ nvkm_ucgrp_chan_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 static int
 nvkm_ucgrp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *oclass)
 {
-	struct nvkm_cgrp *cgrp = nvkm_ucgrp(object)->cgrp;
+	struct nvkm_cgrp *cgrp = container_of(object, struct nvif_cgrp_priv, object)->cgrp;
 	struct nvkm_fifo *fifo = cgrp->runl->fifo;
 	const struct nvkm_fifo_func_chan *chan = &fifo->func->chan;
 	int c = 0;
@@ -65,7 +64,7 @@ nvkm_ucgrp_sclass(struct nvkm_object *object, int index, struct nvkm_oclass *ocl
 static void *
 nvkm_ucgrp_dtor(struct nvkm_object *object)
 {
-	struct nvkm_ucgrp *ucgrp = nvkm_ucgrp(object);
+	struct nvif_cgrp_priv *ucgrp = container_of(object, typeof(*ucgrp), object);
 
 	nvkm_cgrp_unref(&ucgrp->cgrp);
 	return ucgrp;
@@ -84,7 +83,7 @@ nvkm_ucgrp_new(struct nvkm_fifo *fifo, const struct nvkm_oclass *oclass, void *a
 	union nvif_cgrp_args *args = argv;
 	struct nvkm_runl *runl;
 	struct nvkm_vmm *vmm;
-	struct nvkm_ucgrp *ucgrp;
+	struct nvif_cgrp_priv *ucgrp;
 	int ret;
 
 	if (argc < sizeof(args->v0) || args->v0.version != 0)
-- 
2.41.0

