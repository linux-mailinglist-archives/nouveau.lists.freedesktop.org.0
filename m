Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F17DDA1BC18
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 651D510EA12;
	Fri, 24 Jan 2025 18:30:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="n545hQAB";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM04-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam04on2076.outbound.protection.outlook.com [40.107.100.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0BC610EA0E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZH3dsI1ZquPCbbn6gNveq5AEYz4MqVwGDxP4YCVMoDpsBcoBB4SdcAMtd5k0Dscu2Ds5+A8UCqmnl2ONzQBryg4bHwquoCvkxfVflNtMBHkK/wIy6Zg9rlXmaN7I5dgVS9/xNUsYb8rFNXCqbZNAGEhySZ+1y9xpuEagL0TLK9i4CYZT1/42cwzag5Anajk6vxZV4jHATfq4Fv6x2/e5j29jYr7+Rt/QwdmAT9mLm1JJLO7xlLKYqUYLv5mYCixT3ltZALA6ElRws5UztjDREDr0GCWJa7IfVT1AaNvQxwYzpSsBbPnaL3dEyMcR8AZtmz8tLCAlmT1/dCnrdaBvJw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UOYXQZHVqHZft6yS9DQaCdKY5rmG2l/c1kah6KmqRvo=;
 b=WRemBwIp/Op2wA6/0+elDWX4l5/t6kSTVjTeQLWE+yb19+QeLwuZYMe/AazJF9eFJWWjNlMBKyEnuZa3JuczhxCy9qKNAmG/e7eQ5qh9JRhz8PiH03Is2fnxzsIu/uwV+3l5F1VZwdzf/rl53Z9St+QUVdVTA/zxPtew9s0J9d/WIJssWf09bX0OA8DsdJhbDJT/HBXOseWrpgY/xxwYHFRu5W4N3E7Hb+r1wGnlgwRxIXF6gmbM+82oDWNjlLyB+LQjyOk6Fr1cmHgKJfbCr8NTGbBbWe4l8Gd8J6KHlHlP/yQtRcrYrHz06xzsysY5QLnKhTQqTcuBS1wASjYXCQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UOYXQZHVqHZft6yS9DQaCdKY5rmG2l/c1kah6KmqRvo=;
 b=n545hQABYjIrhRgb71duWYijvjYyiMvbZh4tHfRWCK8ArSi/ZHvoRwj4DrXXwPpoO8/Ce0XZ0pby6RP7icOPRb3coqtxLiGABuTo3DHzOXF8ToauXVFPrRQRvWUQzHxEu/nuCmtvFFpuW3yD/zlblDXtcIQHuks86kIVtB0XQ3OvoekB+xjFJTsbWrDJEYr2ie4pUyRcIOUjyhSS+Cbhc6hk2vC7dATzHSDLhUyv2MeiwV6nXu/JyWGUa5hgZsSpU7H3RrRxlGpM8cv9IsqCsHz1oJ5PyyndyrmayNCaTLfl+DSm5joE4Yt9k7bkMAtyRwXOs+1x5lDUcGsvSDfOpQ==
Received: from CH2PR12CA0010.namprd12.prod.outlook.com (2603:10b6:610:57::20)
 by DS0PR12MB7704.namprd12.prod.outlook.com (2603:10b6:8:138::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.17; Fri, 24 Jan
 2025 18:30:44 +0000
Received: from DS3PEPF000099D5.namprd04.prod.outlook.com
 (2603:10b6:610:57:cafe::8b) by CH2PR12CA0010.outlook.office365.com
 (2603:10b6:610:57::20) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 18:30:44 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D5.mail.protection.outlook.com (10.167.17.6) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:44 +0000
Received: from rnnvmail205.nvidia.com (10.129.68.10) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:28 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail205.nvidia.com
 (10.129.68.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:27 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:27 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 05/15] drm/nouveau: rename "argv" to what it represents in
 *rm_{alloc, ctrl}_*()
Date: Fri, 24 Jan 2025 10:29:48 -0800
Message-ID: <20250124182958.2040494-6-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D5:EE_|DS0PR12MB7704:EE_
X-MS-Office365-Filtering-Correlation-Id: aacac4b0-e2e0-406f-30d9-08dd3ca536ed
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?a6lwoLG2Is+qIs82e5vWPQT2vVHdWhuE6TON+KPexKRr6wGLA3lEA3o6r30i?=
 =?us-ascii?Q?lUgR4IM1o4Oqe6+72OBGt8Nmhmz/MqjVVeG5H3m4/EIFb8bWSLD5hp5oGseI?=
 =?us-ascii?Q?oIugg0+74UN6WixEK0W0TlPGWmpFJCFb5fZtUpDZ9zwzZqLZRra+KRIC92zQ?=
 =?us-ascii?Q?xUec485E5EKJN/zr7u7jgnQFNp6HszMXwXY/civW7RYHuIYF4FJTAimjJwHf?=
 =?us-ascii?Q?rf8cJMqy6xLzbPsIy3MTFfK9WIgqg7m+7cv1uUDktsLP2/VZBuZpK/+XEHLQ?=
 =?us-ascii?Q?c0HanBdki/0QXFGEJ42/HvsVYvbOb5iR7kT0r2XRjOkai/zvjd2FwFQLd1gk?=
 =?us-ascii?Q?b+UzHiWydCAQPXopjFHucoMAFy3sCMr95r1gQl/yZynqZJyBEYVIxgcysNF2?=
 =?us-ascii?Q?IybiStfXowq7MRmz2Tt7bKCVqurBrdJNM7gpQ0cbMpr1vmxGehEt2B5O78tx?=
 =?us-ascii?Q?wdhBJYodRzkFO/jcJZXRtFkjSsDRWf9jqsaGqx6ETisSmg7L4ZYSGGVbTih6?=
 =?us-ascii?Q?SF4RcoQIYjTIkiuX+pqtbO/ZCCdc+lqn9wCT2eAekZA9MFTU59jWhVNKvSUD?=
 =?us-ascii?Q?e+Gb+gok6AmPEFK5HJFoKdDOfBMf2Bp3XGjM4/UBO7lOecaRIEKcjjNy2O3a?=
 =?us-ascii?Q?66LdZtYxdnA640y+5TiVbHxBm8WjhTI6Ih9+rw6STaMchoHJYjEcwyuiwgB3?=
 =?us-ascii?Q?iYV5MTJrXCxcL1iYCKSYXFWxyKkO9q0iyPgJvk3mvE2Da4+9LN7elU7VPeab?=
 =?us-ascii?Q?wiPjPwzCmbvXJseQyz/oRve1wg1BHoq6IeEqOWtqFO26eo2PZJbndjT15aUB?=
 =?us-ascii?Q?2CZRFvxjYcwEI8C7fssw+CaRe/qlUC6OOPJ0JFKQu/ZU45V8TO0Vd1lkUugD?=
 =?us-ascii?Q?tWymG/QTk52tqyQ8xgg6X9D965JBph8EZKrBESARl9YnnZvK3xojvuTygn1l?=
 =?us-ascii?Q?rrLhoFE3ir3sbn4K43kmdhUPwNTDXrZjyJN3kDboWBDmcT9dUBRNe5aG3gU8?=
 =?us-ascii?Q?sbM+1O2VucEHzQV0DE8DfEdjdZ3fVRjlcCf5W5Vs63XaOQjj6A6uW7Ncxeq3?=
 =?us-ascii?Q?zMr/RXKPHiOMS9ifxCZBEVVFCsEHLxqP7fjki6/JNmeWSehFfmlLS5MxoLqF?=
 =?us-ascii?Q?2qw6Q/cwMoG4nBuIg1yLSp50gR44Vbeuu/hdJKo1YDlnX1k7DJPhN0DBhtSc?=
 =?us-ascii?Q?rBgOH7vRP1rbs0r07P6LXxneynxDRF/kQDv4dDZbpbIWKC3VMQtjMa/jlECb?=
 =?us-ascii?Q?zsdPAw+PdCsJcPmlsBYDZqH5fu3EH7MfrBdE4BbhIL+RO1+PYq9FUFQn39BN?=
 =?us-ascii?Q?LvYFmsAATZvdT4bbGEBpAuOKvYm+qgJRpRJp0VXOPtAxPdglzZD2qxNmfz5N?=
 =?us-ascii?Q?mQ05IGu+eybnV+OnWTRFyllDzueNZjkdlktzzHhkQv9CMzo/WQIQevCm+9MM?=
 =?us-ascii?Q?7BgIdYVzzOPqt8SG4Yyp+XOUsIfgojYgT4MXd+yqEHTPVh0+UNdL6KiN8Hmb?=
 =?us-ascii?Q?2lOj+61nvAGxOrg=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:44.3856 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: aacac4b0-e2e0-406f-30d9-08dd3ca536ed
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D5.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR12MB7704
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

The name "argv" has different meanings in different functions.

To improve the readability, it's better to refine it to a name that
reflects what it represents.

Rename "argv" to what it represents. Wrap the long container_of() into
to_payload_header() to denote a clear meaning and make checkpatch.pl
happy.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 25 +++++++++++--------
 1 file changed, 14 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index eb82e589381a..3bc5f25f1e8c 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -126,6 +126,9 @@ struct r535_gsp_msg {
 #define to_gsp_hdr(p, header) \
 	container_of((void *)p, typeof(*header), data)
 
+#define to_payload_hdr(p, header) \
+	container_of((void *)p, typeof(*header), params)
+
 static int
 r535_rpc_status_to_errno(uint32_t rpc_status)
 {
@@ -639,17 +642,17 @@ r535_gsp_rpc_rm_free(struct nvkm_gsp_object *object)
 }
 
 static void
-r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *repv)
+r535_gsp_rpc_rm_alloc_done(struct nvkm_gsp_object *object, void *params)
 {
-	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(repv, typeof(*rpc), params);
+	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
 
 	nvkm_gsp_rpc_done(object->client->gsp, rpc);
 }
 
 static void *
-r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *argv)
+r535_gsp_rpc_rm_alloc_push(struct nvkm_gsp_object *object, void *params)
 {
-	rpc_gsp_rm_alloc_v03_00 *rpc = container_of(argv, typeof(*rpc), params);
+	rpc_gsp_rm_alloc_v03_00 *rpc = to_payload_hdr(params, rpc);
 	struct nvkm_gsp *gsp = object->client->gsp;
 	void *ret = NULL;
 
@@ -692,25 +695,25 @@ r535_gsp_rpc_rm_alloc_get(struct nvkm_gsp_object *object, u32 oclass, u32 argc)
 }
 
 static void
-r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *repv)
+r535_gsp_rpc_rm_ctrl_done(struct nvkm_gsp_object *object, void *params)
 {
-	rpc_gsp_rm_control_v03_00 *rpc = container_of(repv, typeof(*rpc), params);
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr(params, rpc);
 
-	if (!repv)
+	if (!params)
 		return;
 	nvkm_gsp_rpc_done(object->client->gsp, rpc);
 }
 
 static int
-r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
+r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **params, u32 repc)
 {
-	rpc_gsp_rm_control_v03_00 *rpc = container_of((*argv), typeof(*rpc), params);
+	rpc_gsp_rm_control_v03_00 *rpc = to_payload_hdr((*params), rpc);
 	struct nvkm_gsp *gsp = object->client->gsp;
 	int ret = 0;
 
 	rpc = nvkm_gsp_rpc_push(gsp, rpc, true, repc);
 	if (IS_ERR_OR_NULL(rpc)) {
-		*argv = NULL;
+		*params = NULL;
 		return PTR_ERR(rpc);
 	}
 
@@ -722,7 +725,7 @@ r535_gsp_rpc_rm_ctrl_push(struct nvkm_gsp_object *object, void **argv, u32 repc)
 	}
 
 	if (repc)
-		*argv = rpc->params;
+		*params = rpc->params;
 	else
 		nvkm_gsp_rpc_done(gsp, rpc);
 
-- 
2.34.1

