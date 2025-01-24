Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C3BFAA1BC15
	for <lists+nouveau@lfdr.de>; Fri, 24 Jan 2025 19:30:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70FCA10EA0A;
	Fri, 24 Jan 2025 18:30:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="qqHSEjNi";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-DM6-obe.outbound.protection.outlook.com
 (mail-dm6nam11on2053.outbound.protection.outlook.com [40.107.223.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FD3610E57E
 for <nouveau@lists.freedesktop.org>; Fri, 24 Jan 2025 18:30:49 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=pBgBRCCdZptkH6axf6y6anOHGk77NpIMS8VlCC+RWRHFwsqpBgY9u8DTviZs32gZHrmKuaURz3agtARjlA1m5oDWa+/4VWA8XSQmCDrXEk/Ap5qAJUNlZLMe5oGorAI5QqswnCd2/GrtpM85N8e9eE1GJFnbsftcLRRCxIcnbhfNOLPshKAqx/+Gbq6Ca4cdc6bPHpBbkKj37LJW9KbYf421cr2CHuHCR804y8v4GK7plKdbbkqWXzWvjYqcGjaQE2NewtQ4yFQ0910ntBCMv8B1qvSeqimesO00S+155Y0q9lH60FVxy0s0BiCn/uMAmrPe4pzflq/nBP4xA0qzNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vmrz7hQfdYoftKMSBLfvwq2T3dNegbOGMC2h0cxB1Og=;
 b=A38RRu43Gr+GVCAoscE8y+tSKeSixiiOENBKiFtlGVve0bJ+X37AZBeErK0ef91ELdVonTGkFUMsjur0RUG5tOfCvhr9jM9DJVJdsszgVGwAV29ZzxUV6bJRbkLf+pBqEyw/6ti0hcV/lEXWF2PqpPkqrYI09qhAyBhBeD1wsxXT1VgfSOlWMPPP2TQmJZn6cHJIdbJJeg7VFHD6gdVOvUPpTzgeWIa0KNn+pLdC8LMDRWO6mOp7xzCl+o/CbNHAG5GedxgJ+/YbRRCAnd+ZXRMzvlD/47mUDHqbrQeGRo5Gxf+ucx+EK22DkJ1eUpcvaxn7mgds4RnQRghIxaWlTA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.117.161) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vmrz7hQfdYoftKMSBLfvwq2T3dNegbOGMC2h0cxB1Og=;
 b=qqHSEjNifyO41Rm1+PbZiQvaZdZ5jvNO6jnZAksbzyf89lEsQPziYkcABPEMxV+6eISkRkF8PhiEAoXVy1IWfXE8EjebvIMs8xCV6cRX6MDqZVdkByG+8MAzRu+1A+mvH0bNBgFBPaVs18XgrXBWNG13VcCU2w12EEPlpI6iiYgFhWCl1jUGGnEs4L9STuN0vI56lVb0D8owL5pHP+NKfzJ29eDXFKhQufA4gZN90frKWuRqv/PKsP8EfnYN2hr2vWf659XsccyrAMOGH1Y/HkwBjM710DB0AfIERcxTvHDLNM3hgECAO2fJHQVLcX6JAcFZoz54q4FEuDbQohPbug==
Received: from CH0PR04CA0073.namprd04.prod.outlook.com (2603:10b6:610:74::18)
 by CYXPR12MB9428.namprd12.prod.outlook.com (2603:10b6:930:d5::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.20; Fri, 24 Jan
 2025 18:30:43 +0000
Received: from DS3PEPF000099D9.namprd04.prod.outlook.com
 (2603:10b6:610:74:cafe::4c) by CH0PR04CA0073.outlook.office365.com
 (2603:10b6:610:74::18) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.8377.19 via Frontend Transport; Fri,
 24 Jan 2025 18:30:42 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.117.161)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.117.161 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.117.161; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.117.161) by
 DS3PEPF000099D9.mail.protection.outlook.com (10.167.17.10) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8377.8 via Frontend Transport; Fri, 24 Jan 2025 18:30:42 +0000
Received: from rnnvmail203.nvidia.com (10.129.68.9) by mail.nvidia.com
 (10.129.200.67) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:27 -0800
Received: from rnnvmail204.nvidia.com (10.129.68.6) by rnnvmail203.nvidia.com
 (10.129.68.9) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Fri, 24 Jan
 2025 10:30:26 -0800
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.129.68.6) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Fri, 24 Jan 2025 10:30:26 -0800
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v4 03/15] drm/nouveau: rename "argv" to what it represents on
 the GSP message send path
Date: Fri, 24 Jan 2025 10:29:46 -0800
Message-ID: <20250124182958.2040494-4-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250124182958.2040494-1-zhiw@nvidia.com>
References: <20250124182958.2040494-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: AnonymousSubmission
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS3PEPF000099D9:EE_|CYXPR12MB9428:EE_
X-MS-Office365-Filtering-Correlation-Id: cccbaa54-2c6f-4df1-af53-08dd3ca535b9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|36860700013|1800799024|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XL+5VGAQ0+iVCZZJWEn8kHVfhfdH4sTezdTU+dYplkV2gdeBA+l20dNss8VJ?=
 =?us-ascii?Q?pur/BkjACFicImonlxXb1VP6E/WbCtNE64WaRiZzDb/2D+tOtU0wABn+btv5?=
 =?us-ascii?Q?b0d21eJeAuZs3ci2t8fs8+btha4lgP7j2Yhs+gd9ft3P8cseREGWHTy3nZ09?=
 =?us-ascii?Q?E57GrECn4LGJQEBjKHXqyQjFovVzjFFianL5Ig6Bt6ZNXUYPzmHl5hrb4imx?=
 =?us-ascii?Q?g4MtpgA/XPexnGR9Ag8GEqFRN5IcwV3VVs24iwHsb2ewkyQT1/gcYJCy9NcR?=
 =?us-ascii?Q?1ZT3s8yAMaZgC/LTTc/oX9jSkoQpqe9h0X01BNc62816kFCPSG0sQP/0/Qgi?=
 =?us-ascii?Q?+snQpmLhM6ECVNAk+pgVrLxDHVj3uLCMAxKMRTaoP4dQLMC3wnuJZ7FWXqwb?=
 =?us-ascii?Q?URTq+OaL+THp5zYpeL5brvyv21je6hdVUGzCGg9CPQ8rep1k/xFj44wRAxsi?=
 =?us-ascii?Q?kHVOwn1ylatI9GX7PBaEYtJaGhHBBnsYFo5fDzx4t2psnP/HDNQKCXot9hq4?=
 =?us-ascii?Q?XLKHjwGObMlAm5jD/WtwmQC5bDM/hkb5s8kdxB/fiMiPuPwPcoFmX0k4hCWA?=
 =?us-ascii?Q?kRRmJ63bfnUHknn3tCFyIzLL6JASxEyY/wpreJR1WPMY6NjBZspBFUc4d6Kg?=
 =?us-ascii?Q?TTAq3SMWHH7nlTxiCCo//B3UbJVAKApDcBzOREHrUzogjCaUlWNJ3k67Pub8?=
 =?us-ascii?Q?6J8UCEUwGSz+IC0oIp+Z7eyj7hW0MS1C5+zD8oh3Ko+Z6c7bUK1uEuk+gBAh?=
 =?us-ascii?Q?ToVJVAQuMfip1E20iNXnChCGz9CMzXrWX9wfzHxWY7TznjPcvfHaKNc4URyP?=
 =?us-ascii?Q?fYtwnMAGPKWBoYbVWDHgKMTeXMhSEiA15QIogsdPVNgUz760GZlXFW52UzHo?=
 =?us-ascii?Q?Z4OZupzXpeweAukGi+nOTXnVxNqbksaxS9ARYaeqSRdvOnyRe8jzoV5l8V1k?=
 =?us-ascii?Q?4IFrkiby0a1/5yJuKBnAKrCfqAhotMwQJOF+6gwrnpOGlcyzv/sv3PZ6SogV?=
 =?us-ascii?Q?jtmJI/Fijn+6cxI0cx9hnc8b1G1UQqsbEgD+ddoKZJEOxk2rZqwTMu48SQtk?=
 =?us-ascii?Q?i6si+ttWgWza7JWW/FBx22Urt6M19/NsKTX5rjw8FGr9Ey4Dg7sWxeViswGP?=
 =?us-ascii?Q?6wY6/nAyk3YLk0hvBuTr1TRNKfOAl/LHAgo5f5qeVfzXPqTkgGSb7MWLdyIp?=
 =?us-ascii?Q?hakkGWyISaT4Dw46oJhAryHLvvaXz6XOQbHgQFmxxDRTCVWTytEUQMrrEWDB?=
 =?us-ascii?Q?Ezgnf903FPZcJNslTVfhEemK0LrmxzZC5hA6erZHJwxW2K1tCcVTueXWFnyt?=
 =?us-ascii?Q?I2MLd/Krs2ZxzYU7PZacKvxfz1ZfKNJVqxIbOEHPl9BoHQ9HtBYQ1NNMleUN?=
 =?us-ascii?Q?iw2eHkVg+WTLtHSTQLsKqjxP6gnY2z7chU4YdXyX7ExxF+E0E/1TkK6T93/q?=
 =?us-ascii?Q?jp+NwVMzqCz9FONoJICEeQ80+vNgwVSRcS15atPaAYUwChSGobtSIs8+GBVK?=
 =?us-ascii?Q?jYZjc4aCmm+mA2M=3D?=
X-Forefront-Antispam-Report: CIP:216.228.117.161; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc6edge2.nvidia.com; CAT:NONE;
 SFS:(13230040)(376014)(36860700013)(1800799024)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jan 2025 18:30:42.3547 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: cccbaa54-2c6f-4df1-af53-08dd3ca535b9
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.117.161];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: DS3PEPF000099D9.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CYXPR12MB9428
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

Rename "repc" to what it represents in the GSP message send path.
Wrap the long container_of() into to_gsp_hdr() to make checkpatch.pl
happy.

No functional change is intended.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 27 ++++++++++---------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index 3189d5c475f7..cf19afd6bf44 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -123,6 +123,9 @@ struct r535_gsp_msg {
 
 #define GSP_MSG_HDR_SIZE offsetof(struct r535_gsp_msg, data)
 
+#define to_gsp_hdr(p, header) \
+	container_of((void *)p, typeof(*header), data)
+
 static int
 r535_rpc_status_to_errno(uint32_t rpc_status)
 {
@@ -205,9 +208,9 @@ r535_gsp_msgq_recv(struct nvkm_gsp *gsp, u32 gsp_rpc_len, int *ptime)
 }
 
 static int
-r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *argv)
+r535_gsp_cmdq_push(struct nvkm_gsp *gsp, void *rpc)
 {
-	struct r535_gsp_msg *cmd = container_of(argv, typeof(*cmd), data);
+	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
 	struct r535_gsp_msg *cqe;
 	u32 argc = cmd->checksum;
 	u64 *ptr = (void *)cmd;
@@ -420,10 +423,10 @@ r535_gsp_rpc_poll(struct nvkm_gsp *gsp, u32 fn)
 }
 
 static void *
-r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *argv, bool wait,
+r535_gsp_rpc_send(struct nvkm_gsp *gsp, void *payload, bool wait,
 		  u32 gsp_rpc_len)
 {
-	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
 	struct nvfw_gsp_rpc *msg;
 	u32 fn = rpc->function;
 	void *repv = NULL;
@@ -777,11 +780,11 @@ r535_gsp_rpc_get(struct nvkm_gsp *gsp, u32 fn, u32 argc)
 }
 
 static void *
-r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
+r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *payload, bool wait,
 		  u32 gsp_rpc_len)
 {
-	struct nvfw_gsp_rpc *rpc = container_of(argv, typeof(*rpc), data);
-	struct r535_gsp_msg *cmd = container_of((void *)rpc, typeof(*cmd), data);
+	struct nvfw_gsp_rpc *rpc = to_gsp_hdr(payload, rpc);
+	struct r535_gsp_msg *cmd = to_gsp_hdr(rpc, cmd);
 	const u32 max_msg_size = (16 * 0x1000) - sizeof(struct r535_gsp_msg);
 	const u32 max_rpc_size = max_msg_size - sizeof(*rpc);
 	u32 rpc_size = rpc->length - sizeof(*rpc);
@@ -795,11 +798,11 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
 		rpc->length = sizeof(*rpc) + max_rpc_size;
 		cmd->checksum = rpc->length;
 
-		repv = r535_gsp_rpc_send(gsp, argv, false, 0);
+		repv = r535_gsp_rpc_send(gsp, payload, false, 0);
 		if (IS_ERR(repv))
 			goto done;
 
-		argv += max_rpc_size;
+		payload += max_rpc_size;
 		rpc_size -= max_rpc_size;
 
 		/* Remaining chunks sent as CONTINUATION_RECORD RPCs. */
@@ -813,13 +816,13 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
 				goto done;
 			}
 
-			memcpy(next, argv, size);
+			memcpy(next, payload, size);
 
 			repv = r535_gsp_rpc_send(gsp, next, false, 0);
 			if (IS_ERR(repv))
 				goto done;
 
-			argv += size;
+			payload += size;
 			rpc_size -= size;
 		}
 
@@ -834,7 +837,7 @@ r535_gsp_rpc_push(struct nvkm_gsp *gsp, void *argv, bool wait,
 			repv = NULL;
 		}
 	} else {
-		repv = r535_gsp_rpc_send(gsp, argv, wait, gsp_rpc_len);
+		repv = r535_gsp_rpc_send(gsp, payload, wait, gsp_rpc_len);
 	}
 
 done:
-- 
2.34.1

