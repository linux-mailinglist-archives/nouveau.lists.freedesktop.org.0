Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D34518A78D0
	for <lists+nouveau@lfdr.de>; Wed, 17 Apr 2024 01:41:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7227112F48;
	Tue, 16 Apr 2024 23:41:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="bCDeOgly";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2078.outbound.protection.outlook.com [40.107.243.78])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 13EF9112F46
 for <nouveau@lists.freedesktop.org>; Tue, 16 Apr 2024 23:41:32 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q1WX6z9oQNZxKF+HLeFEJMI06j8KEdkG8HTmZbmb9Np+4A7xQQnPoCjfmsyCepSwtUbiROn+TuHE9AOEAigmIt7W9svjHJ/BUyZ+Wr53JjoU1RXG/1EWmtunOYlTy/7xqoguvU7YAPJeqsxPT//gFCx34DboHp2hL1r6xxcpL3QBrQxzRc9fYR72tmMlRrjyhoXTPxeKtN4hBbfFInipNhUSew2InktjDW/XkneePDNi/0iwPQz8v8F903LOBxWkae8O+0W3kiHCwekTbMXypPy+0e7oZMi8f66351W5WUmTZFTXj/+xQUfWRwkUM5Df+yC5Sr5BJWfC1UndHuXGpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iXkpO8X6/n/Ns4t8Jl8y5Zxmz+u1H0UUkOQRA944ZHE=;
 b=HYPsMqUDqStdim5ft1BExKycAE4MCDv/bxFogb1jArDboy5Q9NduwY4HoZVvZIUwBIY1Aq88pKRPmUNn1BPJLVq5s3HF3NAFyjnAS0EdQhfi0cwnv4vHpV7rsoxZyovojYF+8bC3UtszlV9NnCGvR6CDRKJaJFUNLNcjSeAIXwfP1ttoW1fL4DaYxrk+cg3TRguGMfOlvHA/aQlLdAxHTVAHKPiw2kRx/cVhJfjJu+P+xkCpPytO26MZyqLSLLZ6Mb5ZjgGdHv3Ohalc5JfvoP2hT9Yn/khkeC4/aDwVRDmprunsyMmCTKV0FVeuJInrWiT/nY8/WtFikJweaMHSHA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.160) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iXkpO8X6/n/Ns4t8Jl8y5Zxmz+u1H0UUkOQRA944ZHE=;
 b=bCDeOgly8Z+1OF1FUF9K/ojoO5uBofyB4dF82Ama39q0pc52x2hUMxXoeJrcVd5gFha8fsNXvywG5mINYc715XkuFExQJZfIGTM3JETw65gnC63vzJwL7TgKmOmxTRLb6DsHEbxNOkYiDHmbA09wsvF+j32Kh31K002IPacVEyLct7Z19V8rVd3UgKX6pJrMEyoSi4AD0eIrb3i80Lc09toVgECSNo0mbpGp/9g53dGrtsmeSXRs6cqDyl/OkoRnZXO0TDkvqXWoYfLLPAGeQrxhUPdLYBA0DL2ewF+pZ6rGGRHsZsxhueHmjHZAMO/QBK7+LnHivgdzNgKydKiuyQ==
Received: from BN9PR03CA0683.namprd03.prod.outlook.com (2603:10b6:408:10e::28)
 by BL3PR12MB9050.namprd12.prod.outlook.com (2603:10b6:208:3b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7452.50; Tue, 16 Apr
 2024 23:41:30 +0000
Received: from BN3PEPF0000B077.namprd04.prod.outlook.com
 (2603:10b6:408:10e:cafe::5f) by BN9PR03CA0683.outlook.office365.com
 (2603:10b6:408:10e::28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.34 via Frontend
 Transport; Tue, 16 Apr 2024 23:41:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.160)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.160 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.160; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.160) by
 BN3PEPF0000B077.mail.protection.outlook.com (10.167.243.122) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7452.22 via Frontend Transport; Tue, 16 Apr 2024 23:41:30 +0000
Received: from rnnvmail201.nvidia.com (10.129.68.8) by mail.nvidia.com
 (10.129.200.66) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 16 Apr
 2024 16:41:14 -0700
Received: from fedora.mshome.net (10.126.231.35) by rnnvmail201.nvidia.com
 (10.129.68.8) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.12; Tue, 16 Apr
 2024 16:41:13 -0700
From: Ben Skeggs <bskeggs@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: Ben Skeggs <bskeggs@nvidia.com>
Subject: [PATCH 038/156] drm/nouveau/nvkm: rename struct nvkm_uevent
Date: Wed, 17 Apr 2024 09:38:04 +1000
Message-ID: <20240416234002.19509-39-bskeggs@nvidia.com>
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
X-MS-TrafficTypeDiagnostic: BN3PEPF0000B077:EE_|BL3PR12MB9050:EE_
X-MS-Office365-Filtering-Correlation-Id: 86a52001-e817-4351-f109-08dc5e6ebde9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0leTvY0A0ZzI4LPv5AWs+Xev2MJTicuDsiU8evUV09aSVi0xN/WUqV5ZTNDTBHBrC/1GQbgdj+65Ulct8wu7G8G8Ly+dZPUX1b+aZf09MPU7FxgqLeLqIbGU7UtAIBuKBgm6e+d6/sYRj/yjc3+QY/NMCpOJrRJcQRDhrhGk0G9MLYg9V0mE3JtZy6MFIGWu9fEZn69ro2FK5HxWsxurllmESJ0hUydh+Ze4iDSnWeFSxy2Z3Tn5g6m0Mp38ZKODdI/pIDgYUAA1lWuzHNjV3s/qRVEg0VpqmcQ1LSZqHU6rCVo+BTdghJTmirUxX1PpggTrO//nZT6lvOph4L1xeg7qayw8ZUmTxCl3vimE9rFxhnFNNYG3Acgf45sL1xd3rYQ0YaYo/EmpIamr/PbczSRNmwE8QyWrZVhq6GJJ8hXvrHu5anRfHiNQC7XRT6dMBztSNjLXBBGL2gzZl7FSPt+zqhIR7LyAfCX/rnLr5tfzmdNCbc8SGpbsvRe2bc6YS5Itix1u2ywcJBSif4CKDxHadseGn6qK1lacXKY/4hRZxiO0V7J0+wyq2CQyX6Jg+jgdpoLinKlV3h8Ech/t74pipysD+Rvo5DnhzvBwZs+jG/vwsOGfzKwA7z8LiWfFgAyJLzrREfcfdlX23kV21FX7sTKKv2UCf5SUqeo2JF9gvS4sIsITuZqz1QIyYlI/OWuUAeBstai6n+5lR0krU7zUDjh05YXfbl/lSzUiTXiS8NM4bIxPyeCg8ggEfOf1
X-Forefront-Antispam-Report: CIP:216.228.117.160; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge1.nvidia.com; CAT:NONE;
 SFS:(13230031)(82310400014)(36860700004)(1800799015)(376005); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Apr 2024 23:41:30.3375 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 86a52001-e817-4351-f109-08dc5e6ebde9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.160];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN3PEPF0000B077.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BL3PR12MB9050
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
- open-code current nvkm_uevent() macro
- alias remaining use of nvkm_uevent to nvif_event_priv, removed later

Signed-off-by: Ben Skeggs <bskeggs@nvidia.com>
---
 drivers/gpu/drm/nouveau/include/nvkm/core/os.h |  2 ++
 drivers/gpu/drm/nouveau/nvkm/core/uevent.c     | 17 ++++++++---------
 2 files changed, 10 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
index 9b05612e6490..668338d7bda3 100644
--- a/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
+++ b/drivers/gpu/drm/nouveau/include/nvkm/core/os.h
@@ -30,4 +30,6 @@ nvkm_blob_dtor(struct nvkm_blob *blob)
 	(p = container_of((h), typeof(*p), m), nvkm_list_find_next(p, (h), m, (c)))
 #define nvkm_list_foreach(p,h,m,c)                                                           \
 	for (p = nvkm_list_find(p, (h), m, (c)); p; p = nvkm_list_find_next(p, (h), m, (c)))
+
+#define nvkm_uevent nvif_event_priv
 #endif
diff --git a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
index cc254c390a57..900814c9a6bd 100644
--- a/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
+++ b/drivers/gpu/drm/nouveau/nvkm/core/uevent.c
@@ -19,13 +19,12 @@
  * ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
  * OTHER DEALINGS IN THE SOFTWARE.
  */
-#define nvkm_uevent(p) container_of((p), struct nvkm_uevent, object)
 #include <core/event.h>
 #include <core/client.h>
 
 #include <nvif/if000e.h>
 
-struct nvkm_uevent {
+struct nvif_event_priv {
 	struct nvkm_object object;
 	struct nvkm_object *parent;
 	nvkm_uevent_func func;
@@ -60,7 +59,7 @@ nvkm_uevent_mthd_allow(struct nvkm_uevent *uevent, union nvif_event_allow_args *
 static int
 nvkm_uevent_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 {
-	struct nvkm_uevent *uevent = nvkm_uevent(object);
+	struct nvif_event_priv *uevent = container_of(object, typeof(*uevent), object);
 
 	switch (mthd) {
 	case NVIF_EVENT_V0_ALLOW: return nvkm_uevent_mthd_allow(uevent, argv, argc);
@@ -75,7 +74,7 @@ nvkm_uevent_mthd(struct nvkm_object *object, u32 mthd, void *argv, u32 argc)
 static int
 nvkm_uevent_fini(struct nvkm_object *object, bool suspend)
 {
-	struct nvkm_uevent *uevent = nvkm_uevent(object);
+	struct nvif_event_priv *uevent = container_of(object, typeof(*uevent), object);
 
 	nvkm_event_ntfy_block(&uevent->ntfy);
 	return 0;
@@ -84,7 +83,7 @@ nvkm_uevent_fini(struct nvkm_object *object, bool suspend)
 static int
 nvkm_uevent_init(struct nvkm_object *object)
 {
-	struct nvkm_uevent *uevent = nvkm_uevent(object);
+	struct nvif_event_priv *uevent = container_of(object, typeof(*uevent), object);
 
 	if (atomic_read(&uevent->allowed))
 		nvkm_event_ntfy_allow(&uevent->ntfy);
@@ -95,7 +94,7 @@ nvkm_uevent_init(struct nvkm_object *object)
 static void *
 nvkm_uevent_dtor(struct nvkm_object *object)
 {
-	struct nvkm_uevent *uevent = nvkm_uevent(object);
+	struct nvif_event_priv *uevent = container_of(object, typeof(*uevent), object);
 
 	nvkm_event_ntfy_del(&uevent->ntfy);
 	return uevent;
@@ -112,7 +111,7 @@ nvkm_uevent = {
 static int
 nvkm_uevent_ntfy(struct nvkm_event_ntfy *ntfy, u32 bits)
 {
-	struct nvkm_uevent *uevent = container_of(ntfy, typeof(*uevent), ntfy);
+	struct nvif_event_priv *uevent = container_of(ntfy, typeof(*uevent), ntfy);
 	struct nvkm_client *client = uevent->object.client;
 
 	if (uevent->func)
@@ -122,7 +121,7 @@ nvkm_uevent_ntfy(struct nvkm_event_ntfy *ntfy, u32 bits)
 }
 
 int
-nvkm_uevent_add(struct nvkm_uevent *uevent, struct nvkm_event *event, int id, u32 bits,
+nvkm_uevent_add(struct nvif_event_priv *uevent, struct nvkm_event *event, int id, u32 bits,
 		nvkm_uevent_func func)
 {
 	if (WARN_ON(uevent->func))
@@ -138,7 +137,7 @@ nvkm_uevent_new(const struct nvkm_oclass *oclass, void *argv, u32 argc,
 		struct nvkm_object **pobject)
 {
 	struct nvkm_object *parent = oclass->parent;
-	struct nvkm_uevent *uevent;
+	struct nvif_event_priv *uevent;
 	union nvif_event_args *args = argv;
 
 	if (argc < sizeof(args->v0) || args->v0.version != 0)
-- 
2.41.0

