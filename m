Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01A3A9B76E4
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:55:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A729E10E3FF;
	Thu, 31 Oct 2024 08:55:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="r1F8VLcn";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM12-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam12on2076.outbound.protection.outlook.com [40.107.243.76])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A866010E3FF
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:55:05 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZbXICi24y2wTwSuCyika03M5oMQ1GFt1+SusA536FcKf/2dBJVqW/VLNbhedl54CHXuJl7fM12yu4DbchqiiyFHBHd5EKLsJa73DSv9wR4aSfpcmQD6UkEXycozqmPgEkloUZzlPxswlRnE35d+dVB62bfHteSkHFw01aISgOIrudvNLK2t9c9pP/2nH9s9B09A/1AXWcSID1+A2E5O5wpnYblT5/OkgAPAFR6Mh74kXnmbFxxYgPLG73F9b3ASeDRDB8rWKSqWwKEBbbfaS4lUF8pXq6Xqi6Y2fICrj/1UFIY8ae9EELTl/WcGANEPZenvmWw54fsFpWyrzjChk4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IQRW6TPLIQujrKPbFbrtNVEubEch5WyqIWp7gkKACBA=;
 b=T/K+ypl0S4wZ5SLB5FKFlSdmYpn9WhwUiZGgBB7eMEFy7XXVc/6XhpNTRx2KbBqbdPTQV/YBMbsioArCirJN9GgeWARZwoyNuPNmMOlZRdFIW6NqeXvjUEdGA2MHedE9XgHml8iqwop5ao5w+hASBkeWQlKCydMEGCPL8oHoLEgit8GQE0WwE4AUopP+E9DLaoRrBQuUyIBOSj3JyPwDWX+TPZ+k/dAJzhQU/HKrO+mC6al8D84GkRnjiW2mj6vuL4qbaniPyGjg6A1HU1xNKWuJ44bEuQnjHIo8IzianLvU72odpcEBVZqeb/3/h1UM4dy1lFFdd1zlMVFeQfS/RA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.233) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IQRW6TPLIQujrKPbFbrtNVEubEch5WyqIWp7gkKACBA=;
 b=r1F8VLcnMBPhpBYczON1AtfyzVqA186Q95V6qkdUQMooPFjJnv0KjoxUCxc09N+gL+2saZpKsjUvq+xqkruIGS8YBbL6cjl+H32eXZnjSiaIOYzw+sEJdZZFwCNV1iDWKHDudt38AUVKNckyUwc9Q0psbWMOazt/P4VU81aW7ufrE9ZggBX5c1uyuYpBAo8pLtlNhnkFfA61vPPtZLzaqHgP2E9Xd5oiGGSoC1YU2w/uXIBwA0jfEXAfTuXuBEurNeGVPf84qZBarbTDmhKBYsUctpeddqoc2ANXvS4xPI/zH5sU/FcSsyGlqa7LTWLLMEJ2SiIyl/WvxVDXF2eONQ==
Received: from BY5PR16CA0033.namprd16.prod.outlook.com (2603:10b6:a03:1a0::46)
 by DM4PR12MB7720.namprd12.prod.outlook.com (2603:10b6:8:100::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Thu, 31 Oct
 2024 08:53:41 +0000
Received: from CO1PEPF000075EF.namprd03.prod.outlook.com
 (2603:10b6:a03:1a0:cafe::55) by BY5PR16CA0033.outlook.office365.com
 (2603:10b6:a03:1a0::46) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.26 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:40 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.233)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.233 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.233; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.233) by
 CO1PEPF000075EF.mail.protection.outlook.com (10.167.249.38) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:40 +0000
Received: from drhqmail202.nvidia.com (10.126.190.181) by mail.nvidia.com
 (10.127.129.6) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:15 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail202.nvidia.com (10.126.190.181) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:15 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:14 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 12/15] nvkm: factor out r535_gsp_msgq_peek()
Date: Thu, 31 Oct 2024 01:52:47 -0700
Message-ID: <20241031085250.2941482-13-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CO1PEPF000075EF:EE_|DM4PR12MB7720:EE_
X-MS-Office365-Filtering-Correlation-Id: 0b1a2a47-100c-41f7-9d6f-08dcf9898452
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|82310400026|376014|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?P3oINjnA6I8/s5tBh48LQrdSlx5Ry/TQa/pKVMwOTVb3vrLls10QVtVTBq1k?=
 =?us-ascii?Q?RPFS4F+GEDnzGUOyP74UCvN1sR0qbKlIvOw8sQV7v8pqzrjkK+e21JCG7837?=
 =?us-ascii?Q?3jig14Icaa2QzLxKyAvIqSdctg035LqlfjQ0rueR8IPuaNc6fqy8u01fLygZ?=
 =?us-ascii?Q?j8GanIzR1DV3PUqO2IBAswR3svxCaMhE4Rkq7vyFz2/t9a/9uxQ48vjDK3Yb?=
 =?us-ascii?Q?h+CndK4btK3Arqcb6EjZX/EgTshToUo2XgcCo1zGVmfphOdnrEG73D5elE9X?=
 =?us-ascii?Q?JYXAOFN1S1Id0aesUQUhl2PksSl6T0/CdHVTPsOktl71KVahhTJS5rZv0jFt?=
 =?us-ascii?Q?TNhSoceC8gS2Gg4Tcka69x/6zXN5qa4TT2yyBbFi/bbfscFz+ch4Yn1BjhKY?=
 =?us-ascii?Q?vXZfkZfcFDwHuqjEg1D+ZVt/SU9XJVdyE3PJtB+Nvfvpdn3pcN3lxtFsg0jj?=
 =?us-ascii?Q?cEqngBBgkWNFw/DqWyDRGdAehIOV9vrRsq2xNzYs4amVlPtu1uZ4G6ffS2C1?=
 =?us-ascii?Q?Uc0bizeTHxwEipD+NVTTE9ugK4KFcw3WCwZMqEvDCCMlOiOZ7ZhjgRNSt5gV?=
 =?us-ascii?Q?giYtG727QrxDKrFjhmv4WRSvezPuGf+4Q2d2a4he0xBAtVn9X+qMuBQ6Ts7e?=
 =?us-ascii?Q?CSXy8qK37oFngPB75I1CHad3EsqqneqQFJiWmOJxPTFgjTpLgN4eMh7I/NM4?=
 =?us-ascii?Q?aRlSeIcL35oKLmi6OqYbJHwrefxIXphcutgZDKNQxl8hblgNIBvC58u/L1Tk?=
 =?us-ascii?Q?LJXwEzQOF6+OCrLlRMVKCVGP5+YOQYGlOWz9sVAkUZlsuWKLGoWWF3bzu6Na?=
 =?us-ascii?Q?ZfmruPUEdpzFFWCR3/HHI3xN6dW0xowROCNTbTsNzEPnlNHRUBy4wP02YWC1?=
 =?us-ascii?Q?+2Ss9H3Qch3GmWZb2BDexEmth1P/h40J/WTejN9DrR9nqJEQyiBgMC6WEjjv?=
 =?us-ascii?Q?4JWUJD1lRD+6Y6Jn+aFcEp4yfC7exPLG/CC6wUlouRhgf9ya4LhtVF6ATEfe?=
 =?us-ascii?Q?Ob3e3ez3Bw5iLj0kFPRXC3be/RTk6rPvblvMN5kSjniF0D1MAGJHjTELj5eP?=
 =?us-ascii?Q?lKEjvUCmdo4ploVCwFnrQf0HcahX8GAHldkbIxKqLRmmqkXCo3Ni4hpxIhqA?=
 =?us-ascii?Q?IpjcnSONLJENGFURZW74tPZ6ABGeLnb7Pz0aICzm0vdyAmbbAg3iqFwAVGvd?=
 =?us-ascii?Q?SEwPnTXtjkHYOvyBjalCrfViPOUvklx3YPoGqtqN0il59rssaqTA6sXkNbQ1?=
 =?us-ascii?Q?OYrK8SRX6jFKUj080SWlwqzOAt7l+mcIGmBqvtA47Z4h5C3K+v9b5BQTcrK1?=
 =?us-ascii?Q?RPeGNJQkQKgvlgXYCFmU0D+fwW2fWc+NRUSuT18noUCYP55FATUNbxvecpnF?=
 =?us-ascii?Q?IHT5Au56mLlGQEQ9Qn9bDsRyeSEyMjITizAXspWwGO6vEh4tlg=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.233; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(1800799024)(82310400026)(376014)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:40.4672 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 0b1a2a47-100c-41f7-9d6f-08dcf9898452
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.233];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: CO1PEPF000075EF.namprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB7720
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

To receive a GSP message queue element from the GSP status queue, the
driver needs to make sure there are available elements in the queue.

The previous r535_gsp_msgq_wait() consists of three functions, which is
a little too complicated for a single function:
- wait for an available element.
- peek the message element header in the queue.
- recevice the element from the queue.

Factor out r535_gsp_msgq_peek() and divide the functions in
r535_gsp_msgq_wait() into three functions.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 68 ++++++++++++-------
 1 file changed, 45 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 8b507858a63d..7818c0be41f2 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -146,20 +146,16 @@ r535_rpc_status_to_errno(uint32_t rpc_status)
 	}
 }
 
-static void *
-r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
-		   int *ptime)
+static int
+r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
 {
-	struct r535_gsp_msg *mqe;
 	u32 size, rptr = *gsp->msgq.rptr;
 	int used;
-	u8 *msg;
-	u32 len;
 
 	size = DIV_ROUND_UP(GSP_MSG_HDR_SIZE + gsp_rpc_len,
 			    GSP_PAGE_SIZE);
 	if (WARN_ON(!size || size >= gsp->msgq.cnt))
-		return ERR_PTR(-EINVAL);
+		return -EINVAL;
 
 	do {
 		u32 wptr = *gsp->msgq.wptr;
@@ -174,15 +170,48 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
 	} while (--(*ptime));
 
 	if (WARN_ON(!*ptime))
-		return ERR_PTR(-ETIMEDOUT);
+		return -ETIMEDOUT;
 
-	mqe = (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
+	return used;
+}
 
-	if (prepc) {
-		*prepc = (used * GSP_PAGE_SIZE) - sizeof(*mqe);
-		return mqe->data;
-	}
+static struct r535_gsp_msg *
+r535_gsp_msgq_get_entry(struct nvkm_gsp *gsp)
+{
+	u32 rptr = *gsp->msgq.rptr;
 
+	return (void *)((u8 *)gsp->shm.msgq.ptr + 0x1000 + rptr * 0x1000);
+}
+
+static void *
+r535_gsp_msgq_peek(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	struct r535_gsp_msg *mqe;
+	int ret;
+
+	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
+
+	return mqe->data;
+}
+
+static void *
+r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *retries)
+{
+	u32 rptr = *gsp->msgq.rptr;
+	struct r535_gsp_msg *mqe;
+	u32 size, len;
+	u8 *msg;
+	int ret;
+
+	ret = r535_gsp_msgq_wait(gsp, gsp_rpc_len, retries);
+	if (ret < 0)
+		return ERR_PTR(ret);
+
+	mqe = r535_gsp_msgq_get_entry(gsp);
 	size = ALIGN(gsp_rpc_len + GSP_MSG_HDR_SIZE, GSP_PAGE_SIZE);
 
 	msg = kvmalloc(gsp_rpc_len, GFP_KERNEL);
@@ -207,12 +236,6 @@ r535_gsp_msgq_wait(struct nvkm_gsp *gsp, u32 gsp_rpc_len, u32 *prepc,
 	return msg;
 }
 
-static void *
-r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
-{
-	return r535_gsp_msgq_wait(gsp, gsp_rpc_len, NULL, ptime);
-}
-
 static int
 r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 {
@@ -337,15 +360,14 @@ r535_gsp_msg_recv(struct nvkm_gsp *gsp, int fn, u32 gsp_rpc_len)
 {
 	struct nvkm_subdev *subdev = &gsp->subdev;
 	struct nvfw_gsp_rpc *rpc;
-	int time = 4000000, i;
-	u32 size;
+	int retries = 4000000, i;
 
 retry:
-	rpc = r535_gsp_msgq_wait(gsp, sizeof(*rpc), &size, &time);
+	rpc = r535_gsp_msgq_peek(gsp, sizeof(*rpc), &retries);
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &time);
+	rpc = r535_gsp_msgq_recv(gsp, rpc->length, &retries);
 	if (IS_ERR_OR_NULL(rpc))
 		return rpc;
 
-- 
2.34.1

