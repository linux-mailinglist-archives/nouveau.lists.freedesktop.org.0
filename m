Return-Path: <nouveau-bounces@lists.freedesktop.org>
X-Original-To: lists+nouveau@lfdr.de
Delivered-To: lists+nouveau@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 81E4D9B76CC
	for <lists+nouveau@lfdr.de>; Thu, 31 Oct 2024 09:53:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB5FF10E835;
	Thu, 31 Oct 2024 08:53:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=Nvidia.com header.i=@Nvidia.com header.b="oZFV1oY4";
	dkim-atps=neutral
X-Original-To: nouveau@lists.freedesktop.org
Delivered-To: nouveau@lists.freedesktop.org
Received: from NAM11-BN8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2070.outbound.protection.outlook.com [40.107.236.70])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1344D10E3FE
 for <nouveau@lists.freedesktop.org>; Thu, 31 Oct 2024 08:53:22 +0000 (UTC)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bC2/Pe7OlvbMzAPo/XXdmZKbBpPkUWmJYXYjcsapzt50jOljr5Qn9tqImg+wJBJo+dxrkH610bco0qFgckRG/FusQk9vldDM68n+YF7cgr4NbxZyHQ6AAG8zHyZux9aF2GtcDpFc4qjL6IipnSTLLP4p5pvYk5zaNQPgfE80Opjk6xR3G0Vw6kcMaOmYjLJtX9mjuXi5oNdnr0TYIDN/R0n1hrztLfQuKmLb+MVMukryo3mV81fcKzHWiLunWl0OvxZTbrwz8Qv3rzBKh+6Oeen280uZ5/BWHs5JLDr/LHj4rgdYcuhDymLPP4lUSxDLHp2cTaSzv1e8j9s3IGFXnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=qqu7JF6bZaHRuH959USvbRpjoGlJlqdhBoOtHOzvcG0=;
 b=gXJGWMsKbBzF40l2kKufnMlGTMCwJFb8//3z4apKnF8XiwEzBb67YUVG7BsvyKBr9I+24Dwwv7H5EOwF1Lympb5SVgA4lz6Fb+pY9/vw5nMf8a91DrqRHzFjLBxpcXt2p0t0HKxx9yRi574c34NWYQy7LZ8ql969Qtu69YRRFwwG1DTfMuduXeg3ZnQ6CfNjPhlXDOY9WKJrAOtmgFrxwgMe7iI8XdfQBvTQlScJCWB28yrv2FDMZc+0g5NbVAHEk7Vm2GsBhKYBCJLAYsPsAhWkAsPNfeRDUAXCr/JxHTm9yAKpOTMspA6YB9Y6RxWd9oXJ9y+2Qg9Sf4Zv8lH0LQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 216.228.118.232) smtp.rcpttodomain=lists.freedesktop.org
 smtp.mailfrom=nvidia.com; dmarc=pass (p=reject sp=reject pct=100) action=none
 header.from=nvidia.com; dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qqu7JF6bZaHRuH959USvbRpjoGlJlqdhBoOtHOzvcG0=;
 b=oZFV1oY4CsTgvS+xt/BudVed8xqLqwOa1Hf9HFiW5DHGK2qsN/Suz5TPOh4JG/d24uNw9NW2BWltjky3Las55qcQJYTvZKQ2P9IhdUKGhHi5aaP3F78VQjI6FrnfkRo5aHPyR/Qg0+hFSmriDU4nAYN2eNTsTX8DRMCtEoZzhopMDK1fhMcJAD0LU6l+S39DsKJhA2grTaRhVOLO5nGKRwrgzD5h0Y0O1geIUr7Oo8fsqYbGDAgpgwWF3s4KgWDy4LSVSJhjmyd8S0GhxwSPh/B2LiLQRo1FuQ4JZ/OG8b3CEVIIHZLHo3qVSiuKQ0JaxWjfRO0DYJEol45q64LeJg==
Received: from BN0PR07CA0004.namprd07.prod.outlook.com (2603:10b6:408:141::22)
 by CY5PR12MB6297.namprd12.prod.outlook.com (2603:10b6:930:22::19)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20; Thu, 31 Oct
 2024 08:53:16 +0000
Received: from BN2PEPF00004FBB.namprd04.prod.outlook.com
 (2603:10b6:408:141:cafe::ca) by BN0PR07CA0004.outlook.office365.com
 (2603:10b6:408:141::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8114.20 via Frontend
 Transport; Thu, 31 Oct 2024 08:53:15 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 216.228.118.232)
 smtp.mailfrom=nvidia.com;
 dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=nvidia.com;
Received-SPF: Pass (protection.outlook.com: domain of nvidia.com designates
 216.228.118.232 as permitted sender) receiver=protection.outlook.com;
 client-ip=216.228.118.232; helo=mail.nvidia.com; pr=C
Received: from mail.nvidia.com (216.228.118.232) by
 BN2PEPF00004FBB.mail.protection.outlook.com (10.167.243.181) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.8114.16 via Frontend Transport; Thu, 31 Oct 2024 08:53:15 +0000
Received: from drhqmail201.nvidia.com (10.126.190.180) by mail.nvidia.com
 (10.127.129.5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.4; Thu, 31 Oct
 2024 01:53:06 -0700
Received: from drhqmail203.nvidia.com (10.126.190.182) by
 drhqmail201.nvidia.com (10.126.190.180) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.4; Thu, 31 Oct 2024 01:53:05 -0700
Received: from inno-linux.nvidia.com (10.127.8.13) by mail.nvidia.com
 (10.126.190.182) with Microsoft SMTP Server id 15.2.1544.4 via Frontend
 Transport; Thu, 31 Oct 2024 01:53:05 -0700
From: Zhi Wang <zhiw@nvidia.com>
To: <nouveau@lists.freedesktop.org>
CC: <airlied@gmail.com>, <daniel@ffwll.ch>, <dakr@kernel.org>,
 <bskeggs@nvidia.com>, <acurrid@nvidia.com>, <cjia@nvidia.com>,
 <smitra@nvidia.com>, <ankita@nvidia.com>, <aniketa@nvidia.com>,
 <kwankhede@nvidia.com>, <targupta@nvidia.com>, <zhiw@nvidia.com>,
 <zhiwang@kernel.org>
Subject: [PATCH v3 01/15] nvkm: add a kernel doc to introduce the GSP RPC
Date: Thu, 31 Oct 2024 01:52:36 -0700
Message-ID: <20241031085250.2941482-2-zhiw@nvidia.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241031085250.2941482-1-zhiw@nvidia.com>
References: <20241031085250.2941482-1-zhiw@nvidia.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-NV-OnPremToCloud: ExternallySecured
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN2PEPF00004FBB:EE_|CY5PR12MB6297:EE_
X-MS-Office365-Filtering-Correlation-Id: 81db426f-0485-4362-0247-08dcf9897585
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|36860700013|1800799024|376014|82310400026; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?5r2yq0qPqX0w8fcA1Uiq7W/YifhLdCWgnAjWsl8wZNuR/nTcJVrLLTTIMYQu?=
 =?us-ascii?Q?CrOXOTGa2HmMmyebRVNRtGA+5Xui+FoVM9IyTpIVQZirYYmzaidwniU59P8v?=
 =?us-ascii?Q?rYe10zEa+02i4sVp/QKKUf/G4/LPFzp1BvZkHZK421bQKkg0RVY27Tzwb+JW?=
 =?us-ascii?Q?JBnsnEEvynv87pb45iANw9sINxh7kTBSE4hbBQIbrJIkIlWI/LC6dk5YXZ4Y?=
 =?us-ascii?Q?AoarOPTOzzLYH52xIuh/c5c2UzRNz8ruDU280RjQTw0rV+c2AWFjrq6gnCjj?=
 =?us-ascii?Q?rkGk2lcdwUGPcizXEBff50Qk/lV9+lS5w5YGkaNmBUi6avpDg11hmAeMZBhy?=
 =?us-ascii?Q?sePyRYBgrZZ4cremJBr+pljVpy9ECK4uos4shxH1ILP4JuKouLZMAFUBfhTp?=
 =?us-ascii?Q?BlqrzKu644uiqhFm7+8HfGSRVKdMiZBV8oxvGmLLQv0pMFwifrd384gkBfr1?=
 =?us-ascii?Q?9LISNpJnBYQJHrWAXDJKI0cwM0TK5m7wlUPxDEfsmHKbY9nkGBmNbB7sHR83?=
 =?us-ascii?Q?LP22xFzH4KZqGVDUzOPZA5+4ATY0FNFE2Yzi8bxH3lYybYtmFM9caxhX16Ji?=
 =?us-ascii?Q?TxVLxoyyjPhkqa3IThCIK/GUcfM5WJaxkLW7hiXQIaQkLZh65jSFtzTP5jl2?=
 =?us-ascii?Q?WM5d0IpxsptQXpVUNmN2IUuoWdrG31bXxn8EYoFFPcpNBA92yGxneYwsZoRt?=
 =?us-ascii?Q?PhHH3qzWws+/K+1piZkStCJhODegGX5gx3lyz6EEn5C1XzJgVg590iBsjAWR?=
 =?us-ascii?Q?Ze36nC18E+2qs3vfTTrkY6BMdvAWqHEgKboUVjQ6fcOXoSphXy1BWk2zLgGQ?=
 =?us-ascii?Q?XYOYZmMjVzFrUGceUnBUK/tg9UuAEveJgxhf6vy5ItVWusQ5TYbo4jmq8QE6?=
 =?us-ascii?Q?0Ameomyg0mBrkB6jKkkjO4v7YODzMY00Vo2mKWQ+fSYXYFdfUO9OM2EOTRRP?=
 =?us-ascii?Q?cm6wbrvPdD1QXSRqKsRKvtqIm4dIPJ+I9mTTXB9CbmUsjtjXpVZX84V+xPXJ?=
 =?us-ascii?Q?G16xzAjwV99jWT50yg8I9zMVo1mKv4DncemwF47ypDrFlYA51HcmIKUwp4f5?=
 =?us-ascii?Q?rKcg2jD3vBDXi7CQSFZYi+YKMUmA6TA0ydfSukb8BCEC/DxN63661K9USUzY?=
 =?us-ascii?Q?DZEidP0CcJ99tykrE0hH4zoyf7jM2zdCiuxeG1KTkReAk9VXB40ZVCfLNpPD?=
 =?us-ascii?Q?SkvaX8PkfUHfyUqpAX8o/0mXaJhe4vTARTXxMTTHG+tgURwbwFyCT+eEkFqA?=
 =?us-ascii?Q?pysikmOrH0rMuFPTsWbJoGZP70vjZiRGXkVcRHc4XWDul3+QAqRnGRNgWed3?=
 =?us-ascii?Q?QQvcSonE0DqU4bYXOMghBIBgAMu2lgcEQv2Ki2iprOthcZIpewFNwIWIKMEN?=
 =?us-ascii?Q?iMfl0Z/yd7wL3zNfScNa43+wHu816pJV2RLdgiSzEXUKpHJcKw=3D=3D?=
X-Forefront-Antispam-Report: CIP:216.228.118.232; CTRY:US; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.nvidia.com; PTR:dc7edge1.nvidia.com; CAT:NONE;
 SFS:(13230040)(36860700013)(1800799024)(376014)(82310400026); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Oct 2024 08:53:15.5223 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 81db426f-0485-4362-0247-08dcf9897585
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=43083d15-7273-40c1-b7db-39efd9ccc17a; Ip=[216.228.118.232];
 Helo=[mail.nvidia.com]
X-MS-Exchange-CrossTenant-AuthSource: BN2PEPF00004FBB.namprd04.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR12MB6297
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

In order to explain the name clean-ups in GSP RPC routines, a kernel
doc to explain the memory layout and terms is required.

Add a kernel doc to introduce the GSP RPC.

Signed-off-by: Zhi Wang <zhiw@nvidia.com>
---
 .../gpu/drm/nouveau/nvkm/subdev/gsp/r535.c    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)

diff --git a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
index a4b8381c4e3e..1a07c0191356 100644
--- a/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
+++ b/drivers/gpu/drm/nouveau/nvkm/subdev/gsp/r535.c
@@ -60,6 +60,52 @@
 #define GSP_MSG_MIN_SIZE GSP_PAGE_SIZE
 #define GSP_MSG_MAX_SIZE GSP_PAGE_MIN_SIZE * 16
 
+/**
+ * DOC: GSP message queue element
+ *
+ * https://github.com/NVIDIA/open-gpu-kernel-modules/blob/main/src/nvidia/inc/kernel/gpu/gsp/message_queue_priv.h
+ *
+ * The GSP command queue and status queue are message queues for the
+ * communication between software and GSP. The software submits the GSP
+ * RPC via the GSP command queue, GSP writes the status of the submitted
+ * RPC in the status queue.
+ *
+ * A GSP message queue element consists of three parts:
+ *
+ * - message element header (struct r535_gsp_msg), which mostly maintains
+ * the metadata for queuing the element.
+ *
+ * - RPC message header (struct nvfw_gsp_rpc), which maintains the info
+ * of the RPC. E.g., the RPC function number.
+ *
+ * - The payload, where the RPC message stays. E.g. the params of a
+ * specific RPC function. Some RPC functions also have their headers
+ * in the payload. E.g. rm_alloc, rm_control.
+ *
+ * The memory layout of a GSP message element can be illustrated below:
+ *
+ * +------------------------+
+ * | Message Element Header |
+ * |    (r535_gsp_msg)      |
+ * |                        |
+ * | (r535_gsp_msg.data)    |
+ * |          |             |
+ * |----------V-------------|
+ * |    GSP RPC Header      |
+ * |    (nvfw_gsp_rpc)      |
+ * |                        |
+ * | (nvfw_gsp_rpc.data)    |
+ * |          |             |
+ * |----------V-------------|
+ * |                        |
+ * |       Payload          |
+ * |                        |
+ * |   header(optional)     |
+ * |        params          |
+ * +------------------------+
+ *
+ */
+
 struct r535_gsp_msg {
 	u8 auth_tag_buffer[16];
 	u8 aad_buffer[16];
-- 
2.34.1

